Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC53388A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:28:52 +0100 (CET)
Received: from localhost ([::1]:46740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe6F-0001NF-1a
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKe0V-0000UO-Tq
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKe0S-0004Ft-14
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oWPkGlcxgn2ABjMb8Yd9RlgUvN7E3GYUHaLEIybCGuQ=;
 b=a9kaMC/Co5kgzYeapuc8/ORY0vW54PqqV3JgYdKM+x3hYgftUC5MI8klLoJ7LJXcVO7Kq1
 9Tg5/xf+wIs0IeZek78O/HweikP9gK44ov/2YiEVPC4Z85ILDs1c68ZE4xAZbZ/pfoRMO+
 6PpR3iMQHVc5co4Yww+jpWjHGjI/Yd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-AgAxmkW1N8K2SjTXePLt7Q-1; Fri, 12 Mar 2021 04:22:46 -0500
X-MC-Unique: AgAxmkW1N8K2SjTXePLt7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6596100D68A;
 Fri, 12 Mar 2021 09:22:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA731048100;
 Fri, 12 Mar 2021 09:22:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tests: Move benchmarks into a separate folder
Date: Fri, 12 Mar 2021 10:22:38 +0100
Message-Id: <20210312092238.79509-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Longpeng <longpeng2@huawei.com>, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it clear that these files are related to benchmarks by moving
them into a new folder called "bench".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Based-on: 20210310063314.1049838-1-thuth@redhat.com

 tests/{ => bench}/atomic64-bench.c          |  0
 tests/{ => bench}/atomic_add-bench.c        |  0
 tests/{ => bench}/benchmark-crypto-cipher.c |  0
 tests/{ => bench}/benchmark-crypto-hash.c   |  0
 tests/{ => bench}/benchmark-crypto-hmac.c   |  0
 tests/bench/meson.build                     | 34 +++++++++++++++++++++
 tests/{ => bench}/qht-bench.c               |  0
 tests/meson.build                           | 34 +--------------------
 8 files changed, 35 insertions(+), 33 deletions(-)
 rename tests/{ => bench}/atomic64-bench.c (100%)
 rename tests/{ => bench}/atomic_add-bench.c (100%)
 rename tests/{ => bench}/benchmark-crypto-cipher.c (100%)
 rename tests/{ => bench}/benchmark-crypto-hash.c (100%)
 rename tests/{ => bench}/benchmark-crypto-hmac.c (100%)
 create mode 100644 tests/bench/meson.build
 rename tests/{ => bench}/qht-bench.c (100%)

diff --git a/tests/atomic64-bench.c b/tests/bench/atomic64-bench.c
similarity index 100%
rename from tests/atomic64-bench.c
rename to tests/bench/atomic64-bench.c
diff --git a/tests/atomic_add-bench.c b/tests/bench/atomic_add-bench.c
similarity index 100%
rename from tests/atomic_add-bench.c
rename to tests/bench/atomic_add-bench.c
diff --git a/tests/benchmark-crypto-cipher.c b/tests/bench/benchmark-crypto-cipher.c
similarity index 100%
rename from tests/benchmark-crypto-cipher.c
rename to tests/bench/benchmark-crypto-cipher.c
diff --git a/tests/benchmark-crypto-hash.c b/tests/bench/benchmark-crypto-hash.c
similarity index 100%
rename from tests/benchmark-crypto-hash.c
rename to tests/bench/benchmark-crypto-hash.c
diff --git a/tests/benchmark-crypto-hmac.c b/tests/bench/benchmark-crypto-hmac.c
similarity index 100%
rename from tests/benchmark-crypto-hmac.c
rename to tests/bench/benchmark-crypto-hmac.c
diff --git a/tests/bench/meson.build b/tests/bench/meson.build
new file mode 100644
index 0000000000..00b3c209dc
--- /dev/null
+++ b/tests/bench/meson.build
@@ -0,0 +1,34 @@
+
+qht_bench = executable('qht-bench',
+                       sources: 'qht-bench.c',
+                       dependencies: [qemuutil])
+
+executable('atomic_add-bench',
+           sources: files('atomic_add-bench.c'),
+           dependencies: [qemuutil],
+           build_by_default: false)
+
+executable('atomic64-bench',
+           sources: files('atomic64-bench.c'),
+           dependencies: [qemuutil],
+           build_by_default: false)
+
+benchs = {}
+
+if have_block
+  benchs += {
+     'benchmark-crypto-hash': [crypto],
+     'benchmark-crypto-hmac': [crypto],
+     'benchmark-crypto-cipher': [crypto],
+  }
+endif
+
+foreach bench_name, deps: benchs
+  exe = executable(bench_name, bench_name + '.c',
+                   dependencies: [qemuutil] + deps)
+  benchmark(bench_name, exe,
+            args: ['--tap', '-k'],
+            protocol: 'tap',
+            timeout: 0,
+            suite: ['speed'])
+endforeach
diff --git a/tests/qht-bench.c b/tests/bench/qht-bench.c
similarity index 100%
rename from tests/qht-bench.c
rename to tests/bench/qht-bench.c
diff --git a/tests/meson.build b/tests/meson.build
index af43fd1eaf..55a7b08275 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,18 +1,6 @@
 py3 = import('python').find_installation()
 
-qht_bench = executable('qht-bench',
-                       sources: 'qht-bench.c',
-                       dependencies: [qemuutil])
-
-executable('atomic_add-bench',
-           sources: files('atomic_add-bench.c'),
-           dependencies: [qemuutil],
-           build_by_default: false)
-
-executable('atomic64-bench',
-           sources: files('atomic64-bench.c'),
-           dependencies: [qemuutil],
-           build_by_default: false)
+subdir('bench')
 
 test_qapi_outputs = [
   'qapi-builtin-types.c',
@@ -73,26 +61,6 @@ test_deps = {
   'test-qht-par': qht_bench,
 }
 
-benchs = {}
-
-if have_block
-  benchs += {
-     'benchmark-crypto-hash': [crypto],
-     'benchmark-crypto-hmac': [crypto],
-     'benchmark-crypto-cipher': [crypto],
-  }
-endif
-
-foreach bench_name, deps: benchs
-  exe = executable(bench_name, bench_name + '.c',
-                   dependencies: [qemuutil] + deps)
-  benchmark(bench_name, exe,
-            args: ['--tap', '-k'],
-            protocol: 'tap',
-            timeout: 0,
-            suite: ['speed'])
-endforeach
-
 if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in config_host
   executable('vhost-user-bridge',
              sources: files('vhost-user-bridge.c'),
-- 
2.27.0


