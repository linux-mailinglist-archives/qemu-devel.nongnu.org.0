Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7675456C47
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:24:04 +0100 (CET)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo07n-0005sx-O2
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo01J-00061h-Vh
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo01G-0002hk-2e
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlIlecnzhaAQeRZZJuozVjF80LuOMxu5Kmn9TZdjFTQ=;
 b=L5ov8qBSgdHq90NH75RtF/i5d+Qt5tq8Qqic9RfIKfalcTM/dsVbI6bOKGFWE8N3XxtBfA
 63UmmAwleKeaZi6w2br8b5eCLWRrmIDdretAiemBK1Axh9VtD8La814uoJh1Th89pKs8CG
 N420oc9yH1D5+xY+ewJc00YmkuqIiXA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-egGZLGazNLWzOUkW3_ehnQ-1; Fri, 19 Nov 2021 04:17:14 -0500
X-MC-Unique: egGZLGazNLWzOUkW3_ehnQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 q15-20020adfbb8f000000b00191d3d89d09so1634242wrg.3
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlIlecnzhaAQeRZZJuozVjF80LuOMxu5Kmn9TZdjFTQ=;
 b=XJXisGDPBwFJpWwJsma33UPxiecI9dtTRGVMwc90w/7KRcbwphBj3YZd+pr8+0voIp
 ryDgL+sIUS7p5U+UMwepm/KkP51KWkmvMye/d/WBRwmAwBWl+/TlXVE4p9UO/UciuNxM
 3TJ+FDHeIEskOVes9u7QfC9l7UTQWZZKMDqyU8vp7m+mdCl6J/eNN84H2/LvzItEu4ya
 JQgV3eKDABK2XRaRh0fCq+7EgzA7JcAHn4ebAk1xQ8+iaW3ivThYQBpmsOYgdGtPLQnP
 kRU64tAi6m2UBHnml+rn8mmhAMCu+KZ3A1wNsFKeSjz8+JsnIJ1fksfwYIhjq+JZguPF
 rSWg==
X-Gm-Message-State: AOAM532CScn6iUw8afE+ZpNcRplQ4ojPjllIq/nARHtdbFnr9gxlMqbf
 YUsgvrkAwX/qGJL4K8WeX2Wy3K/oSk4GCOjIKqE0iUEk7jpOA/NcBxCwuhFFFIWRLos5O+Rd3JA
 uyT17I0YeurSRDT0CZYeK4TQMYgg4xqo58GDfLb41+kCdvzILW30REPlzlB90r/l9
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5442751wri.308.1637313432961; 
 Fri, 19 Nov 2021 01:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuuy5ZcKAtX3G+Y6lbyhVFc1uLMOQW6OLp6hdOWYScK9KF7wvUtEbMVxgqY5w7QfaBtY2WAw==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5442683wri.308.1637313432573; 
 Fri, 19 Nov 2021 01:17:12 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 g13sm3206808wrd.57.2021.11.19.01.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 01:17:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 2/3] misc: Spell QEMU all caps
Date: Fri, 19 Nov 2021 10:17:00 +0100
Message-Id: <20211119091701.277973-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119091701.277973-1-philmd@redhat.com>
References: <20211119091701.277973-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU should be written all caps.

Normally checkpatch.pl warns when it is not (see commit
9964d8f9422: "checkpatch: Add QEMU specific rule").

Replace Qemu -> QEMU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/block-core.json                   | 2 +-
 python/qemu/machine/machine.py         | 2 +-
 scripts/checkpatch.pl                  | 2 +-
 scripts/render_block_graph.py          | 2 +-
 scripts/simplebench/bench-backup.py    | 4 ++--
 scripts/simplebench/bench_block_job.py | 2 +-
 target/hexagon/README                  | 2 +-
 tests/guest-debug/run-test.py          | 4 ++--
 tests/qemu-iotests/testenv.py          | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1d3dd9cb48e..1846a91873a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1839,7 +1839,7 @@
 #
 # @id: Block graph node identifier. This @id is generated only for
 #      x-debug-query-block-graph and does not relate to any other identifiers in
-#      Qemu.
+#      QEMU.
 #
 # @type: Type of graph node. Can be one of block-backend, block-job or
 #        block-driver-state.
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a487c397459..627c9013946 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -122,7 +122,7 @@ def __init__(self,
         @param console_log: (optional) path to console log file
         @param log_dir: where to create and keep log files
         @param qmp_timer: (optional) default QMP socket timeout
-        @note: Qemu process is not started until launch() is used.
+        @note: QEMU process is not started until launch() is used.
         '''
         # pylint: disable=too-many-arguments
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e0..aedf9beaed0 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2910,7 +2910,7 @@ sub process {
 			ERROR("use QEMU instead of Qemu or QEmu\n" . $herecurr);
 		}
 
-# Qemu error function tests
+# QEMU error function tests
 
 	# Find newlines in error messages
 	my $qemu_error_funcs = qr{error_setg|
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index da6acf050d1..3147b0b843b 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -1,6 +1,6 @@
 #!/usr/bin/env python3
 #
-# Render Qemu Block Graph
+# Render QEMU Block Graph
 #
 # Copyright (c) 2018 Virtuozzo International GmbH. All rights reserved.
 #
diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index 5a0675c593c..ad37af3e719 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -183,7 +183,7 @@ def __call__(self, parser, namespace, values, option_string=None):
     mirror               use mirror job instead of backup''',
                                 formatter_class=argparse.RawTextHelpFormatter)
     p.add_argument('--env', nargs='+', help='''\
-Qemu binaries with labels and options, see below
+QEMU binaries with labels and options, see below
 "ENV format" section''',
                    action=ExtendAction)
     p.add_argument('--dir', nargs='+', help='''\
@@ -209,7 +209,7 @@ def __call__(self, parser, namespace, values, option_string=None):
     p.add_argument('--target-cache', help='''\
 Setup cache for target nodes. Options:
    direct: default, use O_DIRECT and aio=native
-   cached: use system cache (Qemu default) and aio=threads (Qemu default)
+   cached: use system cache (QEMU default) and aio=threads (QEMU default)
    both: generate two test cases for each src:dst pair''',
                    default='direct', choices=('direct', 'cached', 'both'))
 
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index a403c35b08f..ecbcd535bcb 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -36,7 +36,7 @@ def bench_block_job(cmd, cmd_args, qemu_args):
 
     cmd       -- qmp command to run block-job (like blockdev-backup)
     cmd_args  -- dict of qmp command arguments
-    qemu_args -- list of Qemu command line arguments, including path to Qemu
+    qemu_args -- list of QEMU command line arguments, including path to QEMU
                  binary
 
     Returns {'seconds': int} on success and {'error': str} on failure, dict may
diff --git a/target/hexagon/README b/target/hexagon/README
index 372e24747c9..b02dbbd1701 100644
--- a/target/hexagon/README
+++ b/target/hexagon/README
@@ -48,7 +48,7 @@ header files in <BUILD_DIR>/target/hexagon
         gen_tcg_func_table.py           -> tcg_func_table_generated.c.inc
         gen_helper_funcs.py             -> helper_funcs_generated.c.inc
 
-Qemu helper functions have 3 parts
+QEMU helper functions have 3 parts
     DEF_HELPER declaration indicates the signature of the helper
     gen_helper_<NAME> will generate a TCG call to the helper function
     The helper implementation
diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 2e58795a100..268a230ecc3 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -21,9 +21,9 @@
 
 def get_args():
     parser = argparse.ArgumentParser(description="A gdbstub test runner")
-    parser.add_argument("--qemu", help="Qemu binary for test",
+    parser.add_argument("--qemu", help="QEMU binary for test",
                         required=True)
-    parser.add_argument("--qargs", help="Qemu arguments for test")
+    parser.add_argument("--qargs", help="QEMU arguments for test")
     parser.add_argument("--binary", help="Binary to debug",
                         required=True)
     parser.add_argument("--test", help="GDB test script",
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index c33454fa685..b563b6d5e6d 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -157,7 +157,7 @@ def root(*names: str) -> str:
                 progs = sorted(glob.iglob(pattern))
                 self.qemu_prog = next(p for p in progs if isxfile(p))
             except StopIteration:
-                sys.exit("Not found any Qemu executable binary by pattern "
+                sys.exit("Not found any QEMU executable binary by pattern "
                          f"'{pattern}'")
 
         self.qemu_img_prog = os.getenv('QEMU_IMG_PROG', root('qemu-img'))
-- 
2.31.1


