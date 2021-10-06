Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79C423E63
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:06:04 +0200 (CEST)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY6cV-0007Yp-D6
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YT-0004k5-Gw
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mY6YP-000582-76
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633525307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXNEwykMTDGPFt6dadB+Th/PiAnZ7tumi7NUnf5OWFA=;
 b=KKyGQHRt/syhWOSKlNiTOaSp+quolbq+b1wEy6rBX1ZReKAf52F4EfUIyCfe4rFsMOB38T
 v4Eq7+qemjmoQpgmokIrDluiKBpepj5/rSYKZ1SnRkNILutsGG/zLQYehOrotTYFcCN8jP
 F13ccFkf0XDhZ1R+AFbLn6mnaN8NEL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-Kv4WGgAQNoe_84jNlmKbCA-1; Wed, 06 Oct 2021 09:01:46 -0400
X-MC-Unique: Kv4WGgAQNoe_84jNlmKbCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 687B1802C91;
 Wed,  6 Oct 2021 13:01:45 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93B6060C4A;
 Wed,  6 Oct 2021 13:01:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] pylint: fix errors and warnings from qemu-tests test 297
Date: Wed,  6 Oct 2021 09:00:59 -0400
Message-Id: <20211006130100.389521-2-eesposit@redhat.com>
In-Reply-To: <20211006130100.389521-1-eesposit@redhat.com>
References: <20211006130100.389521-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test 297 in qemu-iotests folder currently fails: pylint has
learned new things to check, or we simply missed them.

All fixes in this patch are related to additional spaces used
or wrong indentation.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/129                  |  9 +++++----
 tests/qemu-iotests/310                  | 16 ++++++++--------
 tests/qemu-iotests/check                | 11 ++++++-----
 tests/qemu-iotests/iotests.py           |  7 ++++---
 tests/qemu-iotests/tests/image-fleecing |  4 ++--
 5 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index 5251e2669e..21df239597 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -77,8 +77,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         self.do_test_stop("drive-backup", device="drive0",
                           target=self.target_img, format=iotests.imgfmt,
                           sync="full",
-                          x_perf={ 'max-chunk': 65536,
-                                   'max-workers': 8 })
+                          x_perf={'max-chunk': 65536,
+                                  'max-workers': 8})
 
     def test_block_commit(self):
         # Add overlay above the source node so that we actually use a
@@ -87,13 +87,14 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
                          '1G')
 
-        result = self.vm.qmp('blockdev-add', **{
+        result = self.vm.qmp('blockdev-add',
+                             **{
                                  'node-name': 'overlay',
                                  'driver': iotests.imgfmt,
                                  'file': {
                                      'driver': 'file',
                                      'filename': self.overlay_img
-                                 }
+                                     }
                              })
         self.assert_qmp(result, 'return', {})
 
diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
index 9d9c928c4b..33c3411869 100755
--- a/tests/qemu-iotests/310
+++ b/tests/qemu-iotests/310
@@ -48,11 +48,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
     assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
                     '-F', iotests.imgfmt, mid_img_path) == 0
-    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
-    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
+    assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 2M 1M') == 0
+    assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 4M 1M') == 0
     assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
                     '-F', iotests.imgfmt, top_img_path) == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'write -P 2 1M 1M') == 0
 
 #      0 1 2 3 4
 # top    2
@@ -108,10 +108,10 @@ with iotests.FilePath('base.img') as base_img_path, \
     assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
                     top_img_path) == 0
 
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 0 1M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 2M 1M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 3M 1M') == 0
-    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 4M 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'read -P 0 0 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'read -P 2 1M 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'read -P 3 2M 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'read -P 0 3M 1M') == 0
+    assert qemu_io_silent(top_img_path, '-c', 'read -P 3 4M 1M') == 0
 
     log('Done')
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index da1bfb839e..43a4b694cc 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -37,13 +37,14 @@ def make_argparser() -> argparse.ArgumentParser:
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
     p.add_argument('-p', dest='print', action='store_true',
-                help='redirects qemu\'s stdout and stderr to the test output')
+                   help='redirects qemu\'s stdout and stderr to '
+                        'the test output')
     p.add_argument('-gdb', action='store_true',
-                   help="start gdbserver with $GDB_OPTIONS options \
-                        ('localhost:12345' if $GDB_OPTIONS is empty)")
+                   help="start gdbserver with $GDB_OPTIONS options "
+                        "('localhost:12345' if $GDB_OPTIONS is empty)")
     p.add_argument('-valgrind', action='store_true',
-                    help='use valgrind, sets VALGRIND_QEMU environment '
-                    'variable')
+                   help='use valgrind, sets VALGRIND_QEMU environment '
+                        'variable')
 
     p.add_argument('-misalign', action='store_true',
                    help='misalign memory allocations')
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ce06cf5630..168cc5736a 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -608,7 +608,7 @@ def _post_shutdown(self) -> None:
         super()._post_shutdown()
         if not qemu_valgrind or not self._popen:
             return
-        valgrind_filename =  f"{test_dir}/{self._popen.pid}.valgrind"
+        valgrind_filename = f"{test_dir}/{self._popen.pid}.valgrind"
         if self.exitcode() == 99:
             with open(valgrind_filename, encoding='utf-8') as f:
                 print(f.read())
@@ -1350,8 +1350,9 @@ def write(self, arg=None):
 
 class ReproducibleTestRunner(unittest.TextTestRunner):
     def __init__(self, stream: Optional[TextIO] = None,
-             resultclass: Type[unittest.TestResult] = ReproducibleTestResult,
-             **kwargs: Any) -> None:
+                 resultclass: Type[unittest.TestResult] =
+                 ReproducibleTestResult,
+                 **kwargs: Any) -> None:
         rstream = ReproducibleStreamWrapper(stream or sys.stdout)
         super().__init__(stream=rstream,           # type: ignore
                          descriptions=True,
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index f6318492c6..8c5472f421 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -114,8 +114,8 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
 
     nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
-               {'addr': { 'type': 'unix',
-                          'data': { 'path': nbd_sock_path } } }))
+               {'addr': {'type': 'unix',
+                         'data': {'path': nbd_sock_path}}}))
 
     log(vm.qmp('nbd-server-add', device=tmp_node))
 
-- 
2.27.0


