Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E86318D63
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:29:54 +0100 (CET)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACyf-0006vZ-I0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACw9-0005Gc-EB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lACw2-0003cI-2h
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613053629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5a8SO4z5QCR5zPs+SXEld8SlB6+sW4d79/lzjI58Kxk=;
 b=Cc3sHtXds/Mo0XXIi7sjneOdv0Go85mNVah9BArl1Uni8b9uiXJuZ4xFCgVcYhnu22hSr1
 cGYQ9jGjsHWWG4bDUB7kqmZ0wxKvNZ/FHQigZ9nakWPDSWfsjTijhiv0pJ1/0cyb5rMVSv
 /LqM9fu0RIKSWOyGyEOiYkesJcfnUtg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-Mexk2z_RPPacQfbRbUdUtw-1; Thu, 11 Feb 2021 09:27:07 -0500
X-MC-Unique: Mexk2z_RPPacQfbRbUdUtw-1
Received: by mail-ej1-f70.google.com with SMTP id hx26so4793786ejc.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5a8SO4z5QCR5zPs+SXEld8SlB6+sW4d79/lzjI58Kxk=;
 b=gau+XWUxolQyYXNCaFBVVC4REsSmWKYSKNg8NyfGs5Md+53BVm3PsmiZglEKcwU7wb
 F8PvgL9TvTvFuNwDPeeD5RD5vG43mbKeLISDUqHTaJzbpTgG3UJzmz7Hh7ENgR3GsxOC
 xqwecPSrhLRnlEMFHbs0jBxD48lMvl4AVl8ceIJ9LN4Tw1WNyOfFxg8lRnhZVMjWc0Gl
 HvCCf7Mp9vMKkCbIEnw3NX5C4oE37OA8cSRU80fDbbzEmDSHBq1rJTKu/E27UCuFDSrw
 hkl03hVf8rAzD1+XN4OX9WE002A4U0oGEllAT+biCsnDE4JZmz9mb5r+udOnQWDhiWzf
 7vcw==
X-Gm-Message-State: AOAM531as7lJSLKuOeU0m8Epn6vs5qsfAP35UK5r2jAjmf7ZtA/b5vsm
 2bL+zVHfckG3KKsKYeryE39wYYuU0DqlV+Q+gZWTicDDDKyxyiOX/uoJ0Sijgcg/5M3f61fthov
 sBSlaBrDyHg+3oKzUfqh1z9Qq8UXJ6w75QYVeyrS8E6ZsvfJyVAFj7/PkuND1qPgU
X-Received: by 2002:a17:907:210d:: with SMTP id
 qn13mr8544199ejb.377.1613053625210; 
 Thu, 11 Feb 2021 06:27:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZU2ot3AcD7gHLiwFDkMAf84WtF46QmTQU+bz+iXbQb33ayh32gPqLMFHVE6nCdKCGtQ2HLw==
X-Received: by 2002:a17:907:210d:: with SMTP id
 qn13mr8544165ejb.377.1613053624912; 
 Thu, 11 Feb 2021 06:27:04 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x17sm4076779edd.76.2021.02.11.06.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:27:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] block: Explicit null-co uses 'read-zeroes=false'
Date: Thu, 11 Feb 2021 15:26:55 +0100
Message-Id: <20210211142656.3818078-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211142656.3818078-1-philmd@redhat.com>
References: <20210211142656.3818078-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to switch the 'null-co' default 'read-zeroes' value
from FALSE to TRUE in the next commit. First explicit the FALSE
value when it is not set.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
- Missing: 056 & 155. I couldn't figure out the proper syntax,
  any help welcomed...
- I'm unsure about 162, this doesn't seem to use the null-co
  driver but rather testing global syntax.
---
 docs/devel/testing.rst                     | 14 +++++++-------
 tests/qtest/fuzz/generic_fuzz_configs.h    | 11 ++++++-----
 tests/test-bdrv-drain.c                    | 10 ++++++++--
 tests/acceptance/virtio_check_params.py    |  2 +-
 tests/perf/block/qcow2/convert-blockstatus |  6 +++---
 tests/qemu-iotests/040                     |  2 +-
 tests/qemu-iotests/041                     | 12 ++++++++----
 tests/qemu-iotests/051                     |  2 +-
 tests/qemu-iotests/051.out                 |  2 +-
 tests/qemu-iotests/051.pc.out              |  4 ++--
 tests/qemu-iotests/087                     |  6 ++++--
 tests/qemu-iotests/118                     |  2 +-
 tests/qemu-iotests/133                     |  2 +-
 tests/qemu-iotests/153                     |  8 ++++----
 tests/qemu-iotests/184                     |  2 ++
 tests/qemu-iotests/184.out                 | 10 +++++-----
 tests/qemu-iotests/218                     |  3 +++
 tests/qemu-iotests/224                     |  3 ++-
 tests/qemu-iotests/224.out                 |  8 ++++----
 tests/qemu-iotests/225                     |  2 +-
 tests/qemu-iotests/227                     |  4 ++--
 tests/qemu-iotests/227.out                 |  4 ++--
 tests/qemu-iotests/228                     |  2 +-
 tests/qemu-iotests/235                     |  1 +
 tests/qemu-iotests/245                     |  2 +-
 tests/qemu-iotests/270                     |  2 +-
 tests/qemu-iotests/283                     |  3 ++-
 tests/qemu-iotests/283.out                 |  4 ++--
 tests/qemu-iotests/299                     |  1 +
 tests/qemu-iotests/299.out                 |  2 +-
 tests/qemu-iotests/300                     |  4 ++--
 31 files changed, 81 insertions(+), 59 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 209f9d8172f..45f1a674384 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -216,13 +216,13 @@ code.
 Both Python and Bash frameworks in iotests provide helpers to manage test
 images. They can be used to create and clean up images under the test
 directory. If no I/O or any protocol specific feature is needed, it is often
-more convenient to use the pseudo block driver, ``null-co://``, as the test
-image, which doesn't require image creation or cleaning up. Avoid system-wide
-devices or files whenever possible, such as ``/dev/null`` or ``/dev/zero``.
-Otherwise, image locking implications have to be considered.  For example,
-another application on the host may have locked the file, possibly leading to a
-test failure.  If using such devices are explicitly desired, consider adding
-``locking=off`` option to disable image locking.
+more convenient to use the pseudo block driver, ``null-co://,read-zeroes=off``,
+as the test image, which doesn't require image creation or cleaning up. Avoid
+system-wide devices or files whenever possible, such as ``/dev/null`` or
+``/dev/zero``. Otherwise, image locking implications have to be considered.
+For example, another application on the host may have locked the file, possibly
+leading to a test failure.  If using such devices are explicitly desired,
+consider adding ``locking=off`` option to disable image locking.
 
 Test case groups
 ----------------
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 5d599765c4b..dd5a7aeff0d 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -38,13 +38,13 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "virtio-blk",
         .args = "-machine q35 -device virtio-blk,drive=disk0 "
-        "-drive file=null-co://,id=disk0,if=none,format=raw",
+        "-drive file=null-co://,file.read-zeroes=off,id=disk0,if=none,format=raw",
         .objects = "virtio*",
     },{
         .name = "virtio-scsi",
         .args = "-machine q35 -device virtio-scsi,num_queues=8 "
         "-device scsi-hd,drive=disk0 "
-        "-drive file=null-co://,id=disk0,if=none,format=raw",
+        "-drive file=null-co://,file.read-zeroes=off,id=disk0,if=none,format=raw",
         .objects = "scsi* virtio*",
     },{
         .name = "virtio-gpu",
@@ -119,7 +119,7 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "ahci-hd",
         .args = "-machine q35 -nodefaults "
-        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-drive file=null-co://,file.read-zeroes=off,if=none,format=raw,id=disk0 "
         "-device ide-hd,drive=disk0",
         .objects = "*ahci*",
     },{
@@ -137,7 +137,7 @@ const generic_fuzz_config predefined_configs[] = {
     },{
         .name = "xhci",
         .args = "-machine q35 -nodefaults "
-        "-drive file=null-co://,if=none,format=raw,id=disk0 "
+        "-drive file=null-co://,file.read-zeroes=off,if=none,format=raw,id=disk0 "
         "-device qemu-xhci,id=xhci -device usb-tablet,bus=xhci.0 "
         "-device usb-bot -device usb-storage,drive=disk0 "
         "-chardev null,id=cd0 -chardev null,id=cd1 "
@@ -182,7 +182,8 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "sdhci-v3",
         .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
         "-device sd-card,drive=mydrive "
-        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
+        "-drive if=sd,index=0,file=null-co://,file.read-zeroes=off,"
+        "format=raw,id=mydrive -nographic",
         .objects = "sd*"
     },{
         .name = "ehci",
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 8a29e33e004..a3e7d872d88 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -27,6 +27,7 @@
 #include "block/blockjob_int.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/main-loop.h"
 #include "iothread.h"
 
@@ -1177,13 +1178,16 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
     BDRVTestTopState *tts;
     TestCoDeleteByDrainData dbdd;
     Coroutine *co;
+    QDict *opt;
 
     bs = bdrv_new_open_driver(&bdrv_test_top_driver, "top", BDRV_O_RDWR,
                               &error_abort);
     bs->total_sectors = 65536 >> BDRV_SECTOR_BITS;
     tts = bs->opaque;
 
-    null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
+    opt = qdict_new();
+    qdict_put_str(opt, "read-zeroes", "off");
+    null_bs = bdrv_open("null-co://", NULL, opt, BDRV_O_RDWR | BDRV_O_PROTOCOL,
                         &error_abort);
     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds,
                       BDRV_CHILD_DATA, &error_abort);
@@ -1201,7 +1205,9 @@ static void do_test_delete_by_drain(bool detach_instead_of_delete,
 
     /* This child is just there to be deleted
      * (for detach_instead_of_delete == true) */
-    null_bs = bdrv_open("null-co://", NULL, NULL, BDRV_O_RDWR | BDRV_O_PROTOCOL,
+    opt = qdict_new();
+    qdict_put_str(opt, "read-zeroes", "off");
+    null_bs = bdrv_open("null-co://", NULL, opt, BDRV_O_RDWR | BDRV_O_PROTOCOL,
                         &error_abort);
     bdrv_attach_child(bs, null_bs, "null-child", &child_of_bds, BDRV_CHILD_DATA,
                       &error_abort);
diff --git a/tests/acceptance/virtio_check_params.py b/tests/acceptance/virtio_check_params.py
index 87e6c839d14..dee386d26f4 100644
--- a/tests/acceptance/virtio_check_params.py
+++ b/tests/acceptance/virtio_check_params.py
@@ -38,7 +38,7 @@
                  'virtio-blk-pci': ['-device',
                                     'virtio-blk-pci,id=scsi0,drive=drive0',
                                     '-drive',
-                                    'driver=null-co,id=drive0,if=none']}
+                                    'driver=null-co,read-zeroes=off,id=drive0,if=none']}
 
 
 class VirtioMaxSegSettingsCheck(Test):
diff --git a/tests/perf/block/qcow2/convert-blockstatus b/tests/perf/block/qcow2/convert-blockstatus
index a1a3c1ef438..c7449eb2c38 100755
--- a/tests/perf/block/qcow2/convert-blockstatus
+++ b/tests/perf/block/qcow2/convert-blockstatus
@@ -46,7 +46,7 @@ done | $QEMU_IO "$src"
 ) > /dev/null
 
 echo -n "plain: "
-/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://
+/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://,read-zeroes=off
 
 # test-case forward
 
@@ -61,11 +61,11 @@ done | $QEMU_IO "$src"
 ) > /dev/null
 
 echo -n "forward: "
-/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://
+/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://,read-zeroes=off
 
 # test-case prealloc
 
 $QEMU_IMG create -f qcow2 -o preallocation=metadata "$src" $size > /dev/null
 
 echo -n "prealloc: "
-/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://
+/usr/bin/time -f %e $QEMU_IMG convert -n "$src" null-co://,read-zeroes=off
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 7ebc9ed8257..3abc653e599 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -220,7 +220,7 @@ class TestSingleDrive(ImageCommitTestCase):
     def test_top_node_in_wrong_chain(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('blockdev-add', driver='null-co', node_name='null')
+        result = self.vm.qmp('blockdev-add', driver='null-co', read_zeroes=False, node_name='null')
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('block-commit', device='drive0', top_node='null', base_node='base')
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 5cc02b24fc7..74d2bec02a8 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1159,13 +1159,16 @@ class TestRepairQuorum(iotests.QMPTestCase):
 class TestOrphanedSource(iotests.QMPTestCase):
     def setUp(self):
         blk0 = { 'node-name': 'src',
-                 'driver': 'null-co' }
+                 'driver': 'null-co',
+                 'read-zeroes': 'off' }
 
         blk1 = { 'node-name': 'dest',
-                 'driver': 'null-co' }
+                 'driver': 'null-co',
+                 'read-zeroes': 'off' }
 
         blk2 = { 'node-name': 'dest-ro',
                  'driver': 'null-co',
+                 'read-zeroes': 'off',
                  'read-only': 'on' }
 
         self.vm = iotests.VM()
@@ -1272,14 +1275,15 @@ class TestReplaces(iotests.QMPTestCase):
                                      'driver': 'copy-on-read',
                                      'node-name': 'filter1',
                                      'file': {
-                                         'driver': 'null-co'
+                                         'driver': 'null-co',
+                                         'read-zeroes': False,
                                      }
                                  }
                              })
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('blockdev-add',
-                             node_name='target', driver='null-co')
+                             node_name='target', driver='null-co', read_zeroes=False)
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('blockdev-mirror', job_id='mirror', device='filter0',
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 7cbd1415ce7..42e69054f9f 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -384,7 +384,7 @@ if [ "${VALGRIND_QEMU_VM}" == "y" ]; then
     _casenotrun "Valgrind needs a valid TMPDIR for itself"
 fi
 VALGRIND_QEMU_VM= \
-TMPDIR=/nonexistent run_qemu -drive driver=null-co,snapshot=on
+TMPDIR=/nonexistent run_qemu -drive driver=null-co,read-zeroes=off,snapshot=on
 
 # Using snapshot=on together with read-only=on
 echo "info block" |
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index de4771bcb36..a4bf0cc4401 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -459,7 +459,7 @@ wrote 4096/4096 bytes at offset 0
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Testing: -drive driver=null-co,snapshot=on
-QEMU_PROG: -drive driver=null-co,snapshot=on: Could not get temporary filename: No such file or directory
+QEMU_PROG: -drive driver=null-co,read-zeroes=off,snapshot=on: Could not get temporary filename: No such file or directory
 
 Testing: -drive file=TEST_DIR/t.qcow2,snapshot=on,read-only=on,if=none,id=drive0
 QEMU X.Y.Z monitor - type 'help' for more information
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index f707471fb00..12275015eaf 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -558,8 +558,8 @@ wrote 4096/4096 bytes at offset 0
 
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Testing: -drive driver=null-co,snapshot=on
-QEMU_PROG: -drive driver=null-co,snapshot=on: Could not get temporary filename: No such file or directory
+Testing: -drive driver=null-co,read-zeroes=off,snapshot=on
+QEMU_PROG: -drive driver=null-co,read-zeroes=off,snapshot=on: Could not get temporary filename: No such file or directory
 
 Testing: -drive file=TEST_DIR/t.qcow2,snapshot=on,read-only=on,if=none,id=drive0
 QEMU X.Y.Z monitor - type 'help' for more information
diff --git a/tests/qemu-iotests/087 b/tests/qemu-iotests/087
index edd43f1a281..93549524277 100755
--- a/tests/qemu-iotests/087
+++ b/tests/qemu-iotests/087
@@ -89,7 +89,8 @@ run_qemu -drive driver=$IMGFMT,id=disk,node-name=test-node,file="$TEST_IMG" <<EO
       "driver": "$IMGFMT",
       "node-name": "disk",
       "file": {
-          "driver": "null-co"
+          "driver": "null-co",
+          "read-zeroes": "off"
       }
     }
   }
@@ -98,7 +99,8 @@ run_qemu -drive driver=$IMGFMT,id=disk,node-name=test-node,file="$TEST_IMG" <<EO
       "driver": "$IMGFMT",
       "node-name": "test-node",
       "file": {
-          "driver": "null-co"
+          "driver": "null-co",
+          "read-zeroes": "off"
       }
     }
   }
diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index cae52ffa5ea..2795d7b9edd 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -629,7 +629,7 @@ class TestBlockJobsAfterCycle(ChangeBaseClass):
         qemu_img('create', '-f', iotests.imgfmt, old_img, '1440K')
 
         self.vm = iotests.VM()
-        self.vm.add_drive_raw("id=drive0,driver=null-co,if=none")
+        self.vm.add_drive_raw("id=drive0,driver=null-co,read-zeroes=off,if=none")
         self.vm.add_device('floppy,drive=drive0,id=%s' % self.device_name)
         self.vm.launch()
 
diff --git a/tests/qemu-iotests/133 b/tests/qemu-iotests/133
index d997db16855..fde80d5ac6c 100755
--- a/tests/qemu-iotests/133
+++ b/tests/qemu-iotests/133
@@ -89,7 +89,7 @@ echo
 # Using the json: pseudo-protocol we can create non-string options
 # (Invoke 'info' just so we get some output afterwards)
 IMGOPTSSYNTAX=false $QEMU_IO -f null-co -c 'reopen' -c 'info' \
-    "json:{'driver': 'null-co', 'size': 65536}"
+    "json:{'driver': 'null-co', 'read-zeroes': false, 'size': 65536}"
 
 echo
 echo "=== Check that mixing -c/-r/-w and their corresponding options is forbidden ==="
diff --git a/tests/qemu-iotests/153 b/tests/qemu-iotests/153
index 607af590918..10299c0ab44 100755
--- a/tests/qemu-iotests/153
+++ b/tests/qemu-iotests/153
@@ -261,17 +261,17 @@ echo "== Detecting -U and force-share conflicts =="
 
 echo
 echo 'No conflict:'
-$QEMU_IMG info -U --image-opts driver=null-co,force-share=on
+$QEMU_IMG info -U --image-opts driver=null-co,read-zeroes=off,force-share=on
 echo
 echo 'Conflict:'
-$QEMU_IMG info -U --image-opts driver=null-co,force-share=off
+$QEMU_IMG info -U --image-opts driver=null-co,read-zeroes=off,force-share=off
 
 echo
 echo 'No conflict:'
-$QEMU_IO -c 'open -r -U -o driver=null-co,force-share=on'
+$QEMU_IO -c 'open -r -U -o driver=null-co,read-zeroes=off,force-share=on'
 echo
 echo 'Conflict:'
-$QEMU_IO -c 'open -r -U -o driver=null-co,force-share=off'
+$QEMU_IO -c 'open -r -U -o driver=null-co,read-zeroes=off,force-share=off'
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/184 b/tests/qemu-iotests/184
index 513d167098e..1a29e2430e2 100755
--- a/tests/qemu-iotests/184
+++ b/tests/qemu-iotests/184
@@ -60,6 +60,7 @@ run_qemu <<EOF
 { "execute": "blockdev-add",
   "arguments": {
     "driver": "null-co",
+    "read-zeroes": false,
     "node-name": "disk0"
   }
 }
@@ -171,6 +172,7 @@ run_qemu <<EOF
 { "execute": "blockdev-add",
   "arguments": {
     "driver": "null-co",
+    "read-zeroes": false,
     "node-name": "disk0"
   }
 }
diff --git a/tests/qemu-iotests/184.out b/tests/qemu-iotests/184.out
index 87c73070e36..ad1762f00f6 100644
--- a/tests/qemu-iotests/184.out
+++ b/tests/qemu-iotests/184.out
@@ -29,12 +29,12 @@ Testing:
             "image": {
                 "backing-image": {
                     "virtual-size": 1073741824,
-                    "filename": "null-co://",
+                    "filename": "json:{\"read-zeroes\": false, \"driver\": \"null-co\"}",
                     "format": "null-co",
                     "actual-size": 0
                 },
                 "virtual-size": 1073741824,
-                "filename": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}",
+                "filename": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"read-zeroes\": false, \"driver\": \"null-co\"}}",
                 "format": "throttle",
                 "actual-size": 0
             },
@@ -54,7 +54,7 @@ Testing:
                 "direct": false,
                 "writeback": true
             },
-            "file": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}",
+            "file": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"read-zeroes\": false, \"driver\": \"null-co\"}}",
             "encryption_key_missing": false
         },
         {
@@ -62,7 +62,7 @@ Testing:
             "detect_zeroes": "off",
             "image": {
                 "virtual-size": 1073741824,
-                "filename": "null-co://",
+                "filename": "json:{\"read-zeroes\": false, \"driver\": \"null-co\"}",
                 "format": "null-co",
                 "actual-size": 0
             },
@@ -82,7 +82,7 @@ Testing:
                 "direct": false,
                 "writeback": true
             },
-            "file": "null-co://",
+            "file": "json:{\"read-zeroes\": false, \"driver\": \"null-co\"}",
             "encryption_key_missing": false
         }
     ]
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index ae7c4fb187e..23f8dcc7813 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -44,12 +44,14 @@ def start_mirror(vm, speed=None, buf_size=None):
     ret = vm.qmp('blockdev-add',
                      node_name='source',
                      driver='null-co',
+                     read_zeroes=False,
                      size=1048576)
     assert ret['return'] == {}
 
     ret = vm.qmp('blockdev-add',
                      node_name='target',
                      driver='null-co',
+                     read_zeroes=False,
                      size=1048576)
     assert ret['return'] == {}
 
@@ -174,6 +176,7 @@ with iotests.VM() as vm, \
     ret = vm.qmp('blockdev-add',
                  node_name='target',
                  driver='null-co',
+                 read_zeroes=False,
                  size=(64 * 1048576))
     assert ret['return'] == {}
 
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index 38dd1536254..4ff8a8e05e6 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -83,7 +83,8 @@ for filter_node_name in False, True:
                                 'filename': base_img_path
                             },
                             'backing': {
-                                'driver': 'null-co'
+                                'driver': 'null-co',
+                                'read-zeroes': False
                             }
                         }
                     },
diff --git a/tests/qemu-iotests/224.out b/tests/qemu-iotests/224.out
index 23374a1d295..89e972e30ec 100644
--- a/tests/qemu-iotests/224.out
+++ b/tests/qemu-iotests/224.out
@@ -1,18 +1,18 @@
 
 --- filter_node_name: False ---
 
-{"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"driver": "null-co"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-base.img"}, "node-name": "base"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-mid.img"}, "node-name": "mid"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-top.img"}, "node-name": "top"}}
+{"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"driver": "null-co", "read-zeroes": false}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-base.img"}, "node-name": "base"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-mid.img"}, "node-name": "mid"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-top.img"}, "node-name": "top"}}
 {"return": {}}
-{"execute": "block-commit", "arguments": {"base": "json:{\"backing\": {\"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}", "device": "top", "job-id": "commit", "speed": 1, "top": "json:{\"backing\": {\"backing\": {\"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-mid.img\"}}"}}
+{"execute": "block-commit", "arguments": {"base": "json:{\"backing\": {\"read-zeroes\": false, \"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}", "device": "top", "job-id": "commit", "speed": 1, "top": "json:{\"backing\": {\"backing\": {\"read-zeroes\": false, \"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-mid.img\"}}"}}
 {"return": {}}
 {"execute": "job-pause", "arguments": {"id": "commit"}}
 {"return": {}}
 
 --- filter_node_name: True ---
 
-{"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"driver": "null-co"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-base.img"}, "node-name": "base"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-mid.img"}, "node-name": "mid"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-top.img"}, "node-name": "top"}}
+{"execute": "blockdev-add", "arguments": {"backing": {"backing": {"backing": {"driver": "null-co", "read-zeroes": false}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-base.img"}, "node-name": "base"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-mid.img"}, "node-name": "mid"}, "driver": "IMGFMT", "file": {"driver": "file", "filename": "TEST_DIR/PID-top.img"}, "node-name": "top"}}
 {"return": {}}
-{"execute": "block-commit", "arguments": {"base": "json:{\"backing\": {\"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}", "device": "top", "filter-node-name": "filter_node", "job-id": "commit", "speed": 1, "top": "json:{\"backing\": {\"backing\": {\"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-mid.img\"}}"}}
+{"execute": "block-commit", "arguments": {"base": "json:{\"backing\": {\"read-zeroes\": false, \"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}", "device": "top", "filter-node-name": "filter_node", "job-id": "commit", "speed": 1, "top": "json:{\"backing\": {\"backing\": {\"read-zeroes\": false, \"driver\": \"null-co\"}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-base.img\"}}, \"driver\": \"IMGFMT\", \"file\": {\"driver\": \"file\", \"filename\": \"TEST_DIR/PID-mid.img\"}}"}}
 {"return": {}}
 {"execute": "job-pause", "arguments": {"id": "commit"}}
 {"return": {}}
diff --git a/tests/qemu-iotests/225 b/tests/qemu-iotests/225
index c0053790db8..f62a1af1ccc 100755
--- a/tests/qemu-iotests/225
+++ b/tests/qemu-iotests/225
@@ -76,7 +76,7 @@ overlay_opts=$(make_opts overlay "$TEST_IMG" backing)
 base_opts=$(make_opts backing "$TEST_IMG.base")
 not_base_opts=$(make_opts backing "$TEST_IMG.not_base")
 
-not_vmdk_opts="{ 'node-name': 'backing', 'driver': 'null-co' }"
+not_vmdk_opts="{ 'node-name': 'backing', 'driver': 'null-co', 'read-zeroes': false }"
 
 echo
 echo '=== Testing fitting VMDK backing image ==='
diff --git a/tests/qemu-iotests/227 b/tests/qemu-iotests/227
index 7e45a47ac61..45955f61855 100755
--- a/tests/qemu-iotests/227
+++ b/tests/qemu-iotests/227
@@ -68,7 +68,7 @@ echo
 echo '=== blockstats with -drive if=none ==='
 echo
 
-run_qemu -drive driver=null-co,if=none <<EOF
+run_qemu -drive driver=null-co,read-zeroes=off,if=none <<EOF
 { "execute": "qmp_capabilities" }
 { "execute": "query-blockstats"}
 { "execute": "quit" }
@@ -78,7 +78,7 @@ echo
 echo '=== blockstats with -blockdev ==='
 echo
 
-run_qemu -blockdev driver=null-co,node-name=null <<EOF
+run_qemu -blockdev driver=null-co,read-zeroes=off,node-name=null <<EOF
 { "execute": "qmp_capabilities" }
 { "execute": "query-blockstats"}
 { "execute": "quit" }
diff --git a/tests/qemu-iotests/227.out b/tests/qemu-iotests/227.out
index 9c09ee3917b..f5283b86ce8 100644
--- a/tests/qemu-iotests/227.out
+++ b/tests/qemu-iotests/227.out
@@ -67,7 +67,7 @@ Testing: -drive driver=null-co,read-zeroes=on,if=virtio
 
 === blockstats with -drive if=none ===
 
-Testing: -drive driver=null-co,if=none
+Testing: -drive driver=null-co,read-zeroes=off,if=none
 {
     QMP_VERSION
 }
@@ -131,7 +131,7 @@ Testing: -drive driver=null-co,if=none
 
 === blockstats with -blockdev ===
 
-Testing: -blockdev driver=null-co,node-name=null
+Testing: -blockdev driver=null-co,read-zeroes=off,node-name=null
 {
     QMP_VERSION
 }
diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
index a5eda2e149b..7188b1b00ca 100755
--- a/tests/qemu-iotests/228
+++ b/tests/qemu-iotests/228
@@ -177,7 +177,7 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     # You can only reliably override backing options by using a node
     # reference (or by specifying file.filename, but, well...)
-    vm.qmp_log('blockdev-add', node_name='null', driver='null-co')
+    vm.qmp_log('blockdev-add', node_name='null', driver='null-co', read_zeroes=False)
 
     vm.qmp_log('blockdev-add',
                node_name='node0',
diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index 20d16dbf38f..6b0b14590b8 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -65,6 +65,7 @@ log(vm.qmp('blockdev-add',
                'throttle-group': 'tg0',
                'file': {
                    'driver': 'null-co',
+                   'read-zeroes': False,
                    'size': size
                 } }))
 
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index cfdeb902be3..f152a7a4e0a 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -602,7 +602,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         ##################
         ###### null ######
         ##################
-        opts = {'driver': 'null-co', 'node-name': 'root', 'size': 1024}
+        opts = {'driver': 'null-co,read-zeroes=off', 'node-name': 'root', 'size': 1024}
 
         result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
         self.assert_qmp(result, 'return', {})
diff --git a/tests/qemu-iotests/270 b/tests/qemu-iotests/270
index 74352342db5..4aeb545a900 100755
--- a/tests/qemu-iotests/270
+++ b/tests/qemu-iotests/270
@@ -60,7 +60,7 @@ _make_test_img -o cluster_size=2M,data_file="$TEST_IMG.orig" \
 # "write" 2G of data without using any space.
 # (qemu-img create does not like it, though, because null-co does not
 # support image creation.)
-$QEMU_IMG amend -o data_file="json:{'driver':'null-co',,'size':'4294967296'}" \
+$QEMU_IMG amend -o data_file="json:{'driver':'null-co',,'read-zeroes':false,,'size':'4294967296'}" \
     "$TEST_IMG"
 
 # This gives us a range of:
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 79643e375b7..cd235f9ad5f 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -78,13 +78,14 @@ vm.launch()
 vm.qmp_log('blockdev-add', **{
     'node-name': 'target',
     'driver': 'null-co',
+    'read-zeroes': False,
     'size': size,
 })
 
 vm.qmp_log('blockdev-add', **{
     'node-name': 'source',
     'driver': 'blkdebug',
-    'image': {'node-name': 'base', 'driver': 'null-co', 'size': size}
+    'image': {'node-name': 'base', 'driver': 'null-co', 'read-zeroes': False, 'size': size}
 })
 
 vm.qmp_log('blockdev-add', **{
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index d8cff22cc19..d5f759a4d91 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -1,6 +1,6 @@
-{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "target", "size": 1048576}}
+{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "target", "read-zeroes": false, "size": 1048576}}
 {"return": {}}
-{"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": {"driver": "null-co", "node-name": "base", "size": 1048576}, "node-name": "source"}}
+{"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": {"driver": "null-co", "node-name": "base", "read-zeroes": false, "size": 1048576}, "node-name": "source"}}
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
diff --git a/tests/qemu-iotests/299 b/tests/qemu-iotests/299
index a7122941fd2..6fd8402e8f9 100755
--- a/tests/qemu-iotests/299
+++ b/tests/qemu-iotests/299
@@ -36,6 +36,7 @@ vm.launch()
 vm.qmp_log('blockdev-add', **{
     'node-name': 'disk',
     'driver': 'null-co',
+    'read-zeroes': False,
     'size': 1024 * 1024,
 })
 
diff --git a/tests/qemu-iotests/299.out b/tests/qemu-iotests/299.out
index bba4252923c..a6f2086e0eb 100644
--- a/tests/qemu-iotests/299.out
+++ b/tests/qemu-iotests/299.out
@@ -1,4 +1,4 @@
-{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "disk", "size": 1048576}}
+{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "disk", "read-zeroes": false, "size": 1048576}}
 {"return": {}}
 {"execute": "block-dirty-bitmap-add", "arguments": {"name": "bitmap0", "node": "disk"}}
 {"return": {}}
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 43264d883d7..5464c3a9ff7 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -44,12 +44,12 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
     def setUp(self) -> None:
         self.vm_a = iotests.VM(path_suffix='-a')
         self.vm_a.add_blockdev(f'node-name={self.src_node_name},'
-                               'driver=null-co')
+                               'driver=null-co,read-zeroes=off')
         self.vm_a.launch()
 
         self.vm_b = iotests.VM(path_suffix='-b')
         self.vm_b.add_blockdev(f'node-name={self.dst_node_name},'
-                               'driver=null-co')
+                               'driver=null-co,read-zeroes=off')
         self.vm_b.add_incoming(f'unix:{mig_sock}')
         self.vm_b.launch()
 
-- 
2.26.2


