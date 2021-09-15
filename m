Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6640CC3F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:02:33 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZEu-0005Ay-Au
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6W-0006Li-Dy
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6U-0006iv-1M
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxr3gZZ7wURu4pguvCBx0LSWFl8P90YLyEzkpe9p68c=;
 b=YB/j1cefu6YjHrDohxs9mPEjKKKKCbIx98c2fsePbbPdKxnVv7Ief2C9/UU0PiJ3oOnAub
 NfmVTj5/BrtCX1oCTybCH99nh82c2E9ntypzIeCsOla/JQgtoiQXeTVFN+LVqNWGAk1En2
 QoxlMyr6ystcXe10wyaZu2NgVDdIYAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-F389TsNhMdWcOa8-dFpCoQ-1; Wed, 15 Sep 2021 13:53:47 -0400
X-MC-Unique: F389TsNhMdWcOa8-dFpCoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60DDD1966320;
 Wed, 15 Sep 2021 17:53:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 087A71972E;
 Wed, 15 Sep 2021 17:53:45 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/32] migrate-bitmaps-test: Fix pylint warnings
Date: Wed, 15 Sep 2021 19:52:58 +0200
Message-Id: <20210915175318.853225-13-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a couple of things pylint takes issue with:
- The "time" import is unused
- The import order (iotests should come last)
- get_bitmap_hash() doesn't use @self and so should be a function
- Semicolons at the end of some lines
- Parentheses after "if"
- Some lines are too long (80 characters instead of 79)
- inject_test_case()'s @name parameter shadows a top-level @name
  variable
- "lambda self: mc(self)" were equivalent to just "mc", but in
  inject_test_case(), it is not equivalent, so add a comment and disable
  the warning locally
- Always put two empty lines after a function
- f'exec: cat > /dev/null' does not need to be an f-string

Fix them.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210902094017.32902-4-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index a5c7bc83e0..dc431c35b3 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -20,11 +20,10 @@
 #
 
 import os
-import iotests
-import time
 import itertools
 import operator
 import re
+import iotests
 from iotests import qemu_img, qemu_img_create, Timeout
 
 
@@ -37,6 +36,12 @@ mig_cmd = 'exec: cat > ' + mig_file
 incoming_cmd = 'exec: cat ' + mig_file
 
 
+def get_bitmap_hash(vm):
+    result = vm.qmp('x-debug-block-dirty-bitmap-sha256',
+                    node='drive0', name='bitmap0')
+    return result['return']['sha256']
+
+
 class TestDirtyBitmapMigration(iotests.QMPTestCase):
     def tearDown(self):
         self.vm_a.shutdown()
@@ -62,21 +67,16 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
             params['persistent'] = True
 
         result = vm.qmp('block-dirty-bitmap-add', **params)
-        self.assert_qmp(result, 'return', {});
-
-    def get_bitmap_hash(self, vm):
-        result = vm.qmp('x-debug-block-dirty-bitmap-sha256',
-                        node='drive0', name='bitmap0')
-        return result['return']['sha256']
+        self.assert_qmp(result, 'return', {})
 
     def check_bitmap(self, vm, sha256):
         result = vm.qmp('x-debug-block-dirty-bitmap-sha256',
                         node='drive0', name='bitmap0')
         if sha256:
-            self.assert_qmp(result, 'return/sha256', sha256);
+            self.assert_qmp(result, 'return/sha256', sha256)
         else:
             self.assert_qmp(result, 'error/desc',
-                            "Dirty bitmap 'bitmap0' not found");
+                            "Dirty bitmap 'bitmap0' not found")
 
     def do_test_migration_resume_source(self, persistent, migrate_bitmaps):
         granularity = 512
@@ -97,7 +97,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.add_bitmap(self.vm_a, granularity, persistent)
         for r in regions:
             self.vm_a.hmp_qemu_io('drive0', 'write %d %d' % r)
-        sha256 = self.get_bitmap_hash(self.vm_a)
+        sha256 = get_bitmap_hash(self.vm_a)
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
         while True:
@@ -106,7 +106,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
                 break
         while True:
             result = self.vm_a.qmp('query-status')
-            if (result['return']['status'] == 'postmigrate'):
+            if result['return']['status'] == 'postmigrate':
                 break
 
         # test that bitmap is still here
@@ -164,7 +164,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.add_bitmap(self.vm_a, granularity, persistent)
         for r in regions:
             self.vm_a.hmp_qemu_io('drive0', 'write %d %d' % r)
-        sha256 = self.get_bitmap_hash(self.vm_a)
+        sha256 = get_bitmap_hash(self.vm_a)
 
         if pre_shutdown:
             self.vm_a.shutdown()
@@ -214,16 +214,22 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
             self.check_bitmap(self.vm_b, sha256 if persistent else False)
 
 
-def inject_test_case(klass, name, method, *args, **kwargs):
+def inject_test_case(klass, suffix, method, *args, **kwargs):
     mc = operator.methodcaller(method, *args, **kwargs)
-    setattr(klass, 'test_' + method + name, lambda self: mc(self))
+    # We want to add a function attribute to `klass`, so that it is
+    # correctly converted to a method on instantiation.  The
+    # methodcaller object `mc` is a callable, not a function, so we
+    # need the lambda to turn it into a function.
+    # pylint: disable=unnecessary-lambda
+    setattr(klass, 'test_' + method + suffix, lambda self: mc(self))
+
 
 for cmb in list(itertools.product((True, False), repeat=5)):
     name = ('_' if cmb[0] else '_not_') + 'persistent_'
     name += ('_' if cmb[1] else '_not_') + 'migbitmap_'
     name += '_online' if cmb[2] else '_offline'
     name += '_shared' if cmb[3] else '_nonshared'
-    if (cmb[4]):
+    if cmb[4]:
         name += '__pre_shutdown'
 
     inject_test_case(TestDirtyBitmapMigration, name, 'do_test_migration',
@@ -270,7 +276,8 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
         # Check that the bitmaps are there
-        for node in self.vm.qmp('query-named-block-nodes', flat=True)['return']:
+        nodes = self.vm.qmp('query-named-block-nodes', flat=True)['return']
+        for node in nodes:
             if 'node0' in node['node-name']:
                 self.assert_qmp(node, 'dirty-bitmaps[0]/name', 'bmap0')
 
@@ -287,7 +294,7 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         """
         Continue the source after migration.
         """
-        result = self.vm.qmp('migrate', uri=f'exec: cat > /dev/null')
+        result = self.vm.qmp('migrate', uri='exec: cat > /dev/null')
         self.assert_qmp(result, 'return', {})
 
         with Timeout(10, 'Migration timeout'):
-- 
2.31.1


