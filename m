Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD574E3DE9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:59:04 +0100 (CET)
Received: from localhost ([::1]:35058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdAF-0005bZ-5E
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:59:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8M-0002PZ-T6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8K-0006Pm-Bt
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAUcZpGxn3cALqQpreMOVHf913k5Ksj3zFOJW/B61/g=;
 b=a8g6zWYaBNsyLxxgIzv2Pq3ydrS/G/p7jdQ8NZ/NQbv4mXFRZRHKgIxOFdd0VZI02hdWHv
 skI2c1p5nIscft8rbsx0BzXtksHbeqGXmiFIjgKNxPBzO/qXzTO7JUq6jr0AAqQwJpSEVp
 7QEz9XlpjIvVWis3Mx4RA1G1/wdzqyg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-Vt9TjdlpP4e-GFAQEAHjkg-1; Tue, 22 Mar 2022 07:57:02 -0400
X-MC-Unique: Vt9TjdlpP4e-GFAQEAHjkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FD66185A79C;
 Tue, 22 Mar 2022 11:57:02 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5B32166B46;
 Tue, 22 Mar 2022 11:57:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/25] iotests: Remove explicit checks for qemu_img() == 0
Date: Tue, 22 Mar 2022 12:56:30 +0100
Message-Id: <20220322115647.726044-9-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

qemu_img() returning zero ought to be the rule, not the
exception. Remove all explicit checks against the condition in
preparation for making non-zero returns an Exception.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220321201618.903471-4-jsnow@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/163                              |  9 +++------
 tests/qemu-iotests/216                              |  6 +++---
 tests/qemu-iotests/218                              |  2 +-
 tests/qemu-iotests/224                              | 11 +++++------
 tests/qemu-iotests/228                              | 12 ++++++------
 tests/qemu-iotests/257                              |  3 +--
 tests/qemu-iotests/258                              |  4 ++--
 tests/qemu-iotests/310                              | 13 ++++++-------
 tests/qemu-iotests/tests/block-status-cache         |  3 +--
 tests/qemu-iotests/tests/graph-changes-while-io     |  7 +++----
 tests/qemu-iotests/tests/image-fleecing             | 10 +++++-----
 tests/qemu-iotests/tests/mirror-ready-cancel-error  |  6 ++----
 tests/qemu-iotests/tests/mirror-top-perms           |  3 +--
 tests/qemu-iotests/tests/remove-bitmap-from-backing |  8 ++++----
 tests/qemu-iotests/tests/stream-error-on-reset      |  4 ++--
 15 files changed, 45 insertions(+), 56 deletions(-)

diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index b8bfc95358..e4cd4b230f 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -107,8 +107,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
 
         if iotests.imgfmt == 'raw':
             return
-        self.assertEqual(qemu_img('check', test_img), 0,
-                         "Verifying image corruption")
+        qemu_img('check', test_img)
 
     def test_empty_image(self):
         qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
@@ -130,8 +129,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
         qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
                  self.shrink_size)
 
-        self.assertEqual(qemu_img("compare", test_img, check_img), 0,
-                         "Verifying image content")
+        qemu_img("compare", test_img, check_img)
 
         self.image_verify()
 
@@ -146,8 +144,7 @@ class ShrinkBaseClass(iotests.QMPTestCase):
         qemu_img('resize',  '-f', iotests.imgfmt, '--shrink', test_img,
                  self.shrink_size)
 
-        self.assertEqual(qemu_img("compare", test_img, check_img), 0,
-                         "Verifying image content")
+        qemu_img("compare", test_img, check_img)
 
         self.image_verify()
 
diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
index c02f8d2880..88b385afa3 100755
--- a/tests/qemu-iotests/216
+++ b/tests/qemu-iotests/216
@@ -51,10 +51,10 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up images ---')
     log('')
 
-    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
     assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
-    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
-                    '-F', iotests.imgfmt, top_img_path) == 0
+    qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+             '-F', iotests.imgfmt, top_img_path)
     assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
 
     log('Done')
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 4922b4d3b6..853ed52b34 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -145,7 +145,7 @@ log('')
 with iotests.VM() as vm, \
      iotests.FilePath('src.img') as src_img_path:
 
-    assert qemu_img('create', '-f', iotests.imgfmt, src_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, src_img_path, '64M')
     assert qemu_io_silent('-f', iotests.imgfmt, src_img_path,
                           '-c', 'write -P 42 0M 64M') == 0
 
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index 38dd153625..c31c55b49d 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -47,12 +47,11 @@ for filter_node_name in False, True:
          iotests.FilePath('top.img') as top_img_path, \
          iotests.VM() as vm:
 
-        assert qemu_img('create', '-f', iotests.imgfmt,
-                        base_img_path, '64M') == 0
-        assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
-                        '-F', iotests.imgfmt, mid_img_path) == 0
-        assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
-                        '-F', iotests.imgfmt, top_img_path) == 0
+        qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
+        qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+                 '-F', iotests.imgfmt, mid_img_path)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
+                 '-F', iotests.imgfmt, top_img_path)
 
         # Something to commit
         assert qemu_io_silent(mid_img_path, '-c', 'write -P 1 0 1M') == 0
diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
index a5eda2e149..f79bae0267 100755
--- a/tests/qemu-iotests/228
+++ b/tests/qemu-iotests/228
@@ -54,11 +54,11 @@ with iotests.FilePath('base.img') as base_img_path, \
      iotests.FilePath('top.img') as top_img_path, \
      iotests.VM() as vm:
 
-    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
     # Choose a funny way to describe the backing filename
-    assert qemu_img('create', '-f', iotests.imgfmt, '-b',
-                    'file:' + base_img_path, '-F', iotests.imgfmt,
-                    top_img_path) == 0
+    qemu_img('create', '-f', iotests.imgfmt, '-b',
+             'file:' + base_img_path, '-F', iotests.imgfmt,
+             top_img_path)
 
     vm.launch()
 
@@ -172,8 +172,8 @@ with iotests.FilePath('base.img') as base_img_path, \
     # (because qemu cannot "canonicalize"/"resolve" the backing
     # filename unless the backing file is opened implicitly with the
     # overlay)
-    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
-                    '-F', iotests.imgfmt, top_img_path) == 0
+    qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+             '-F', iotests.imgfmt, top_img_path)
 
     # You can only reliably override backing options by using a node
     # reference (or by specifying file.filename, but, well...)
diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index c72c82a171..fb5359c581 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -240,8 +240,7 @@ def compare_images(image, reference, baseimg=None, expected_match=True):
     """
     expected_ret = 0 if expected_match else 1
     if baseimg:
-        assert qemu_img("rebase", "-u", "-b", baseimg, '-F', iotests.imgfmt,
-                        image) == 0
+        qemu_img("rebase", "-u", "-b", baseimg, '-F', iotests.imgfmt, image)
     ret = qemu_img("compare", image, reference)
     log('qemu_img compare "{:s}" "{:s}" ==> {:s}, {:s}'.format(
         image, reference,
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index a6618208a8..7798a04d7d 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -75,13 +75,13 @@ def test_concurrent_finish(write_to_stream_node):
 
         # It is important to use raw for the base layer (so that
         # permissions are just handed through to the protocol layer)
-        assert qemu_img('create', '-f', 'raw', node0_path, '64M') == 0
+        qemu_img('create', '-f', 'raw', node0_path, '64M')
 
         stream_throttle=None
         commit_throttle=None
 
         for path in [node1_path, node2_path, node3_path, node4_path]:
-            assert qemu_img('create', '-f', iotests.imgfmt, path, '64M') == 0
+            qemu_img('create', '-f', iotests.imgfmt, path, '64M')
 
         if write_to_stream_node:
             # This is what (most of the time) makes commit finish
diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
index 33c3411869..e3bfedc7fd 100755
--- a/tests/qemu-iotests/310
+++ b/tests/qemu-iotests/310
@@ -43,15 +43,15 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up images ---')
     log('')
 
-    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
     assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
     assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
-    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
-                    '-F', iotests.imgfmt, mid_img_path) == 0
+    qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+             '-F', iotests.imgfmt, mid_img_path)
     assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 2M 1M') == 0
     assert qemu_io_silent(mid_img_path, '-c', 'write -P 3 4M 1M') == 0
-    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
-                    '-F', iotests.imgfmt, top_img_path) == 0
+    qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
+             '-F', iotests.imgfmt, top_img_path)
     assert qemu_io_silent(top_img_path, '-c', 'write -P 2 1M 1M') == 0
 
 #      0 1 2 3 4
@@ -105,8 +105,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     # Detach backing to check that we can read the data from the top level now
-    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
-                    top_img_path) == 0
+    qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt, top_img_path)
 
     assert qemu_io_silent(top_img_path, '-c', 'read -P 0 0 1M') == 0
     assert qemu_io_silent(top_img_path, '-c', 'read -P 2 1M 1M') == 0
diff --git a/tests/qemu-iotests/tests/block-status-cache b/tests/qemu-iotests/tests/block-status-cache
index 6fa10bb8f8..40e648e251 100755
--- a/tests/qemu-iotests/tests/block-status-cache
+++ b/tests/qemu-iotests/tests/block-status-cache
@@ -35,8 +35,7 @@ nbd_sock = os.path.join(iotests.sock_dir, 'nbd.sock')
 class TestBscWithNbd(iotests.QMPTestCase):
     def setUp(self) -> None:
         """Just create an empty image with a read-only NBD server on it"""
-        assert qemu_img_create('-f', iotests.imgfmt, test_img,
-                               str(image_size)) == 0
+        qemu_img_create('-f', iotests.imgfmt, test_img, str(image_size))
 
         # Pass --allocation-depth to enable the qemu:allocation-depth context,
         # which we are going to query to provoke a block-status inquiry with
diff --git a/tests/qemu-iotests/tests/graph-changes-while-io b/tests/qemu-iotests/tests/graph-changes-while-io
index 567e8cf21e..7664f33689 100755
--- a/tests/qemu-iotests/tests/graph-changes-while-io
+++ b/tests/qemu-iotests/tests/graph-changes-while-io
@@ -34,16 +34,15 @@ def do_qemu_img_bench() -> None:
     """
     Do some I/O requests on `nbd_sock`.
     """
-    assert qemu_img('bench', '-f', 'raw', '-c', '2000000',
-                    f'nbd+unix:///node0?socket={nbd_sock}') == 0
+    qemu_img('bench', '-f', 'raw', '-c', '2000000',
+             f'nbd+unix:///node0?socket={nbd_sock}')
 
 
 class TestGraphChangesWhileIO(QMPTestCase):
     def setUp(self) -> None:
         # Create an overlay that can be added at runtime on top of the
         # null-co block node that will receive I/O
-        assert qemu_img_create('-f', imgfmt, '-F', 'raw', '-b', 'null-co://',
-                               top) == 0
+        qemu_img_create('-f', imgfmt, '-F', 'raw', '-b', 'null-co://', top)
 
         # QSD instance with a null-co block node in an I/O thread,
         # exported over NBD (on `nbd_sock`, export name "node0")
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index c56278639c..b7e5076104 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -63,18 +63,18 @@ def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
     log('--- Setting up images ---')
     log('')
 
-    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
     if bitmap:
-        assert qemu_img('bitmap', '--add', base_img_path, 'bitmap0') == 0
+        qemu_img('bitmap', '--add', base_img_path, 'bitmap0')
 
     if use_snapshot_access_filter:
         assert use_cbw
-        assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
+        qemu_img('create', '-f', 'raw', fleece_img_path, '64M')
     else:
-        assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+        qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M')
 
     if push_backup:
-        assert qemu_img('create', '-f', 'qcow2', target_img_path, '64M') == 0
+        qemu_img('create', '-f', 'qcow2', target_img_path, '64M')
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
diff --git a/tests/qemu-iotests/tests/mirror-ready-cancel-error b/tests/qemu-iotests/tests/mirror-ready-cancel-error
index 770ffca379..1d0e333b5e 100755
--- a/tests/qemu-iotests/tests/mirror-ready-cancel-error
+++ b/tests/qemu-iotests/tests/mirror-ready-cancel-error
@@ -31,10 +31,8 @@ target = os.path.join(iotests.test_dir, 'target.img')
 
 class TestMirrorReadyCancelError(iotests.QMPTestCase):
     def setUp(self) -> None:
-        assert iotests.qemu_img_create('-f', iotests.imgfmt, source,
-                                       str(image_size)) == 0
-        assert iotests.qemu_img_create('-f', iotests.imgfmt, target,
-                                       str(image_size)) == 0
+        iotests.qemu_img_create('-f', iotests.imgfmt, source, str(image_size))
+        iotests.qemu_img_create('-f', iotests.imgfmt, target, str(image_size))
 
         # Ensure that mirror will copy something before READY so the
         # target format layer will forward the pre-READY flush to its
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index b5849978c4..6ac8d5efcc 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -34,8 +34,7 @@ source = os.path.join(iotests.test_dir, 'source.img')
 
 class TestMirrorTopPerms(iotests.QMPTestCase):
     def setUp(self):
-        assert qemu_img('create', '-f', iotests.imgfmt, source,
-                        str(image_size)) == 0
+        qemu_img('create', '-f', iotests.imgfmt, source, str(image_size))
         self.vm = iotests.VM()
         self.vm.add_drive(source)
         self.vm.add_blockdev(f'null-co,node-name=null,size={image_size}')
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 3c397b08ea..fee3141340 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -27,11 +27,11 @@ iotests.script_initialize(supported_fmts=['qcow2'],
 top, base = iotests.file_path('top', 'base')
 size = '1M'
 
-assert qemu_img_create('-f', iotests.imgfmt, base, size) == 0
-assert qemu_img_create('-f', iotests.imgfmt, '-b', base,
-                       '-F', iotests.imgfmt, top, size) == 0
+qemu_img_create('-f', iotests.imgfmt, base, size)
+qemu_img_create('-f', iotests.imgfmt, '-b', base,
+                '-F', iotests.imgfmt, top, size)
 
-assert qemu_img('bitmap', '--add', base, 'bitmap0') == 0
+qemu_img('bitmap', '--add', base, 'bitmap0')
 # Just assert that our method of checking bitmaps in the image works.
 assert 'bitmaps' in qemu_img_pipe('info', base)
 
diff --git a/tests/qemu-iotests/tests/stream-error-on-reset b/tests/qemu-iotests/tests/stream-error-on-reset
index 7eaedb24d7..389ae822b8 100755
--- a/tests/qemu-iotests/tests/stream-error-on-reset
+++ b/tests/qemu-iotests/tests/stream-error-on-reset
@@ -54,9 +54,9 @@ class TestStreamErrorOnReset(QMPTestCase):
           to it will result in an error
         - top image is attached to a virtio-scsi device
         """
-        assert qemu_img_create('-f', imgfmt, base, str(image_size)) == 0
+        qemu_img_create('-f', imgfmt, base, str(image_size))
         assert qemu_io_silent('-c', f'write 0 {data_size}', base) == 0
-        assert qemu_img_create('-f', imgfmt, top, str(image_size)) == 0
+        qemu_img_create('-f', imgfmt, top, str(image_size))
 
         self.vm = iotests.VM()
         self.vm.add_args('-accel', 'tcg') # Make throttling work properly
-- 
2.35.1


