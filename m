Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304D4B7A6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:26:16 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6H0-0007j3-PT
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60S-0003yO-9z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60Q-0006LO-6z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644962945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QB/R41m9rWfYOznTrg6WjsZYbk+qoYvuvgrlQ7cS7EQ=;
 b=flR3uSQXWxEO0L42ewWdeTXT99LzZJrRhuUHUGwivOZFk3RDhFFWqSnskoLb0IWCqao4Qb
 uoagVE6EAP6vgz4pG5GjvJPN6AavvJTwFXg8hRdv/8HjvijtHs/1tBnZLEQaL6qXCOfR17
 obdGZo5vpDyrXaJVRnmzY/EiRrgwU7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-g90M0e1COfiEP8cTzp5Slg-1; Tue, 15 Feb 2022 17:09:02 -0500
X-MC-Unique: g90M0e1COfiEP8cTzp5Slg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59D892F45;
 Tue, 15 Feb 2022 22:09:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 319941059A77;
 Tue, 15 Feb 2022 22:09:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] iotests: Remove explicit checks for qemu_img() == 0
Date: Tue, 15 Feb 2022 17:08:52 -0500
Message-Id: <20220215220853.4179173-4-jsnow@redhat.com>
In-Reply-To: <20220215220853.4179173-1-jsnow@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_img() returning zero ought to be the rule, not the
exception. Remove all explicit checks against the condition in
preparation for making non-zero returns an Exception.

Signed-off-by: John Snow <jsnow@redhat.com>
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
index b8bfc95358e..e4cd4b230f3 100755
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
index c02f8d2880f..88b385afa30 100755
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
index 4922b4d3b6f..853ed52b349 100755
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
index 38dd1536254..c31c55b49d2 100755
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
index a5eda2e149b..f79bae02677 100755
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
index c72c82a171b..fb5359c581e 100755
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
index a6618208a89..7798a04d7d3 100755
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
index 33c34118694..4e6d70e5ac6 100755
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
index 6fa10bb8f8a..40e648e251a 100755
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
index a58b5a17816..ac8f19e5062 100755
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
index 770ffca3793..1d0e333b5ef 100755
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
index b5849978c41..6ac8d5efccb 100755
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
index 3c397b08ea4..fee31413400 100755
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
index 7eaedb24d7b..389ae822b8b 100755
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


