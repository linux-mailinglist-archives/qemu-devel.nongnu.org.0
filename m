Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24764CC782
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:02:29 +0100 (CET)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsai-0007ZF-Np
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPsXw-0004Rs-Ht
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nPsXt-0003zY-CN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646341172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KUN44YNWOv+A6xjhICD600PRkRBeYDafeban7kXkmM=;
 b=Av1jtjC/tVrHPl/xdQXuCjG1O/6py1L8RJTCvLqADJlOxmqE6Rr8zAtSAJwXB81t5SbPlr
 wZetM4tnAqHoLDDBrrY3BpMTyVd2ovfMvsmnFsVvnEO4NYuhSeK9P15HtC0cb401qK3sz/
 nA1qzPddYgc2ogP91oJgqr12//8m3SE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-1bH5x_2mP8ScTvMS3O7sdw-1; Thu, 03 Mar 2022 15:59:31 -0500
X-MC-Unique: 1bH5x_2mP8ScTvMS3O7sdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 593321091DA0;
 Thu,  3 Mar 2022 20:59:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.18.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F04E012E1E;
 Thu,  3 Mar 2022 20:59:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] iotests: Remove explicit checks for qemu_img() == 0
Date: Thu,  3 Mar 2022 15:59:00 -0500
Message-Id: <20220303205902.4106779-4-jsnow@redhat.com>
In-Reply-To: <20220303205902.4106779-1-jsnow@redhat.com>
References: <20220303205902.4106779-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img() returning zero ought to be the rule, not the
exception. Remove all explicit checks against the condition in
preparation for making non-zero returns an Exception.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/163                             |  9 +++------
 tests/qemu-iotests/216                             |  6 +++---
 tests/qemu-iotests/218                             |  2 +-
 tests/qemu-iotests/224                             | 11 +++++------
 tests/qemu-iotests/228                             | 12 ++++++------
 tests/qemu-iotests/257                             |  3 +--
 tests/qemu-iotests/258                             |  4 ++--
 tests/qemu-iotests/310                             | 14 +++++++-------
 tests/qemu-iotests/tests/block-status-cache        |  3 +--
 tests/qemu-iotests/tests/image-fleecing            |  4 ++--
 tests/qemu-iotests/tests/mirror-ready-cancel-error |  6 ++----
 tests/qemu-iotests/tests/mirror-top-perms          |  3 +--
 .../qemu-iotests/tests/remove-bitmap-from-backing  |  8 ++++----
 tests/qemu-iotests/tests/stream-error-on-reset     |  4 ++--
 14 files changed, 40 insertions(+), 49 deletions(-)

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
index 33c3411869..4e6d70e5ac 100755
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
@@ -105,8 +105,8 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('')
 
     # Detach backing to check that we can read the data from the top level now
-    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
-                    top_img_path) == 0
+    qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
+             top_img_path)
 
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
diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index a58b5a1781..ac8f19e506 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -53,8 +53,8 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
-    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+    qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M')
+    qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M')
 
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
2.34.1


