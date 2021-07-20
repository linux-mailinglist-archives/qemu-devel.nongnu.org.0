Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF73D0068
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 19:41:53 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5tke-0003Pk-3G
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 13:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tct-0005ag-Oh
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5tcq-0005aR-Be
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 13:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626802427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/hTiJ13ihlaGBQEKy2Oz1UnjdMQKX0pyCmERH5kftQ=;
 b=iYLZgya7auz86Lt95qagyDNTfUtZNZR3k0Y6NUe4gnnFqO66mNy3+86QYiDF6N9h3Ga8zp
 5HIHpi3mh2kSxExkH/sujR/lRfdxFYvjIZ/osNXw0kkWiXJlJZW1SLZOOepJ50vK9InieV
 KWfg5vaX1cn/vAP/QSw0SVoAmD/re3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-gq-i_jekM2SSQvArjpe7SA-1; Tue, 20 Jul 2021 13:33:46 -0400
X-MC-Unique: gq-i_jekM2SSQvArjpe7SA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF8D804146;
 Tue, 20 Jul 2021 17:33:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-193.rdu2.redhat.com [10.10.119.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F0C369A;
 Tue, 20 Jul 2021 17:33:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] iotests/migrate-bitmaps-test: delint
Date: Tue, 20 Jul 2021 13:33:24 -0400
Message-Id: <20210720173336.1876937-6-jsnow@redhat.com>
In-Reply-To: <20210720173336.1876937-1-jsnow@redhat.com>
References: <20210720173336.1876937-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly uninteresting stuff. Move the test injections under a function
named main() so that the variables used during that process aren't in
the global scope.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 70 +++++++++++--------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index a5c7bc83e0e..fd36ee4a245 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -19,12 +19,12 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
-import os
-import iotests
-import time
 import itertools
 import operator
+import os
 import re
+
+import iotests
 from iotests import qemu_img, qemu_img_create, Timeout
 
 
@@ -62,9 +62,10 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
             params['persistent'] = True
 
         result = vm.qmp('block-dirty-bitmap-add', **params)
-        self.assert_qmp(result, 'return', {});
+        self.assert_qmp(result, 'return', {})
 
-    def get_bitmap_hash(self, vm):
+    @classmethod
+    def get_bitmap_hash(cls, vm):
         result = vm.qmp('x-debug-block-dirty-bitmap-sha256',
                         node='drive0', name='bitmap0')
         return result['return']['sha256']
@@ -73,10 +74,10 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
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
@@ -106,7 +107,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
                 break
         while True:
             result = self.vm_a.qmp('query-status')
-            if (result['return']['status'] == 'postmigrate'):
+            if result['return']['status'] == 'postmigrate':
                 break
 
         # test that bitmap is still here
@@ -216,25 +217,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
 
 def inject_test_case(klass, name, method, *args, **kwargs):
     mc = operator.methodcaller(method, *args, **kwargs)
-    setattr(klass, 'test_' + method + name, lambda self: mc(self))
-
-for cmb in list(itertools.product((True, False), repeat=5)):
-    name = ('_' if cmb[0] else '_not_') + 'persistent_'
-    name += ('_' if cmb[1] else '_not_') + 'migbitmap_'
-    name += '_online' if cmb[2] else '_offline'
-    name += '_shared' if cmb[3] else '_nonshared'
-    if (cmb[4]):
-        name += '__pre_shutdown'
-
-    inject_test_case(TestDirtyBitmapMigration, name, 'do_test_migration',
-                     *list(cmb))
-
-for cmb in list(itertools.product((True, False), repeat=2)):
-    name = ('_' if cmb[0] else '_not_') + 'persistent_'
-    name += ('_' if cmb[1] else '_not_') + 'migbitmap'
-
-    inject_test_case(TestDirtyBitmapMigration, name,
-                     'do_test_migration_resume_source', *list(cmb))
+    setattr(klass, 'test_' + method + name, mc)
 
 
 class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
@@ -270,7 +253,8 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
         # Check that the bitmaps are there
-        for node in self.vm.qmp('query-named-block-nodes', flat=True)['return']:
+        nodes = self.vm.qmp('query-named-block-nodes', flat=True)['return']
+        for node in nodes:
             if 'node0' in node['node-name']:
                 self.assert_qmp(node, 'dirty-bitmaps[0]/name', 'bmap0')
 
@@ -287,7 +271,7 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         """
         Continue the source after migration.
         """
-        result = self.vm.qmp('migrate', uri=f'exec: cat > /dev/null')
+        result = self.vm.qmp('migrate', uri='exec: cat > /dev/null')
         self.assert_qmp(result, 'return', {})
 
         with Timeout(10, 'Migration timeout'):
@@ -297,6 +281,30 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
 
+def main():
+    for cmb in list(itertools.product((True, False), repeat=5)):
+        name = ('_' if cmb[0] else '_not_') + 'persistent_'
+        name += ('_' if cmb[1] else '_not_') + 'migbitmap_'
+        name += '_online' if cmb[2] else '_offline'
+        name += '_shared' if cmb[3] else '_nonshared'
+        if cmb[4]:
+            name += '__pre_shutdown'
+
+        inject_test_case(TestDirtyBitmapMigration, name, 'do_test_migration',
+                         *list(cmb))
+
+    for cmb in list(itertools.product((True, False), repeat=2)):
+        name = ('_' if cmb[0] else '_not_') + 'persistent_'
+        name += ('_' if cmb[1] else '_not_') + 'migbitmap'
+
+        inject_test_case(TestDirtyBitmapMigration, name,
+                         'do_test_migration_resume_source', *list(cmb))
+
+    iotests.main(
+        supported_fmts=['qcow2'],
+        supported_protocols=['file']
+    )
+
+
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+    main()
-- 
2.31.1


