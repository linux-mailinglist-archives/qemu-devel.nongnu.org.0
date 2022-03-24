Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD924E68CA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:38:41 +0100 (CET)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXSM4-00042b-FD
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:38:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEN-0000FL-Io
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSEI-0005kw-OH
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 14:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648146637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97D4Idh/djdPoW1N9ZTKA71f6UmfRm1Hbv4LkFpvs0s=;
 b=VhsJB3AeKtEK/BIeQgde7GiZPJP9GTF/0RPm4Hq8i4oKeGtsXie/aQdUPd4r59zGrn83rX
 ZJl+Jn/ji7R49y6cACfZF/VeDq4oCQEx51XOcBz3mdaIsPqYows6WIRNgvBVjVmoeRCCmC
 LJx1va1iLj3lLbJg9w7TJ0B/H2ubiKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-uXTEZdOkOxmkYbVigiTk6w-1; Thu, 24 Mar 2022 14:30:36 -0400
X-MC-Unique: uXTEZdOkOxmkYbVigiTk6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D98511034085;
 Thu, 24 Mar 2022 18:30:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27CBEC26EA0;
 Thu, 24 Mar 2022 18:30:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/17] iotests/030: fixup
Date: Thu, 24 Mar 2022 14:30:09 -0400
Message-Id: <20220324183018.2476551-9-jsnow@redhat.com>
In-Reply-To: <20220324183018.2476551-1-jsnow@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Merge into prior patch.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/030 | 85 ++++++++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 36 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 567bf1da67..3a2de920a3 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -64,16 +64,18 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_intermediate(self):
         self.assert_no_active_block_jobs()
 
-        self.assertNotEqual(qemu_io('-f', 'raw', '-rU', '-c', 'map', backing_img),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', mid_img),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', 'raw', '-rU', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', mid_img).stdout,
+            'image file map matches backing file before streaming')
 
         result = self.vm.qmp('block-stream', device='mid', job_id='stream-mid')
         self.assert_qmp(result, 'return', {})
@@ -83,9 +85,10 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_pause(self):
         self.assert_no_active_block_jobs()
@@ -113,15 +116,17 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', 'raw', '-c', 'map', backing_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', 'raw', '-c', 'map', backing_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_stream_no_op(self):
         self.assert_no_active_block_jobs()
 
         # The image map is empty before the operation
-        empty_map = qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', test_img)
+        empty_map = qemu_io(
+            '-f', iotests.imgfmt, '-rU', '-c', 'map', test_img).stdout
 
         # This is a no-op: no data should ever be copied from the base image
         result = self.vm.qmp('block-stream', device='drive0', base=mid_img)
@@ -132,8 +137,9 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         empty_map, 'image file map changed after a no-op')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            empty_map, 'image file map changed after a no-op')
 
     def test_stream_partial(self):
         self.assert_no_active_block_jobs()
@@ -146,9 +152,10 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', mid_img).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', test_img).stdout,
+            'image file map does not match backing file after streaming')
 
     def test_device_not_found(self):
         result = self.vm.qmp('block-stream', device='nonexistent')
@@ -236,9 +243,10 @@ class TestParallelOps(iotests.QMPTestCase):
 
         # Check that the maps don't match before the streaming operations
         for i in range(2, self.num_imgs, 2):
-            self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i]),
-                                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i-1]),
-                                'image file map matches backing file before streaming')
+            self.assertNotEqual(
+                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i]).stdout,
+                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i-1]).stdout,
+                'image file map matches backing file before streaming')
 
         # Create all streaming jobs
         pending_jobs = []
@@ -278,9 +286,10 @@ class TestParallelOps(iotests.QMPTestCase):
 
         # Check that all maps match now
         for i in range(2, self.num_imgs, 2):
-            self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i]),
-                             qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i-1]),
-                             'image file map does not match backing file after streaming')
+            self.assertEqual(
+                qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i]).stdout,
+                qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i-1]).stdout,
+                'image file map does not match backing file after streaming')
 
     # Test that it's not possible to perform two block-stream
     # operations if there are nodes involved in both.
@@ -509,9 +518,10 @@ class TestParallelOps(iotests.QMPTestCase):
     def test_stream_base_node_name(self):
         self.assert_no_active_block_jobs()
 
-        self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[4]),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[3]),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[4]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[3]).stdout,
+            'image file map matches backing file before streaming')
 
         # Error: the base node does not exist
         result = self.vm.qmp('block-stream', device='node4', base_node='none', job_id='stream')
@@ -542,9 +552,10 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[4]),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[3]),
-                         'image file map matches backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[4]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[3]).stdout,
+            'image file map matches backing file after streaming')
 
 class TestQuorum(iotests.QMPTestCase):
     num_children = 3
@@ -583,9 +594,10 @@ class TestQuorum(iotests.QMPTestCase):
             os.remove(img)
 
     def test_stream_quorum(self):
-        self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.children[0]),
-                            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.backing[0]),
-                            'image file map matches backing file before streaming')
+        self.assertNotEqual(
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.children[0]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.backing[0]).stdout,
+            'image file map matches backing file before streaming')
 
         self.assert_no_active_block_jobs()
 
@@ -597,9 +609,10 @@ class TestQuorum(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
 
-        self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.children[0]),
-                         qemu_io('-f', iotests.imgfmt, '-c', 'map', self.backing[0]),
-                         'image file map does not match backing file after streaming')
+        self.assertEqual(
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.children[0]).stdout,
+            qemu_io('-f', iotests.imgfmt, '-c', 'map', self.backing[0]).stdout,
+            'image file map does not match backing file after streaming')
 
 class TestSmallerBackingFile(iotests.QMPTestCase):
     backing_len = 1 * 1024 * 1024 # MB
-- 
2.34.1


