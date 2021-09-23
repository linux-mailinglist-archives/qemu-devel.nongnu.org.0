Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2741650E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:14:53 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTFE-0005b0-L7
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8L-0005QB-Kk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8B-0003Y6-19
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632420453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBYlvTHwKhBgcJTPO9PWNR+qRzDAVPvMDvu1u116h0Y=;
 b=OMX7OQNfMWkgMvslfsH21nSLz195LZ8947TvPXMmWzKCXiAW5mxGY5l0bk6gYDvRJA/KEg
 u0MVZAEEsr80MWh2seJ2V85YQJW5IBOuwhFRkr4PoTqH5ey2kILd0B9FSaPlaKvf1weWue
 nHXXXFwpOi/8XWI3ocMhtUk4Bs+tnWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-1fZ683zQMm2ATtx3bI-hFg-1; Thu, 23 Sep 2021 14:07:32 -0400
X-MC-Unique: 1fZ683zQMm2ATtx3bI-hFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694B3BBEE6;
 Thu, 23 Sep 2021 18:07:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C8960BF1;
 Thu, 23 Sep 2021 18:07:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] iotests/migrate-bitmaps-test: delint
Date: Thu, 23 Sep 2021 14:07:14 -0400
Message-Id: <20210923180715.4168522-6-jsnow@redhat.com>
In-Reply-To: <20210923180715.4168522-1-jsnow@redhat.com>
References: <20210923180715.4168522-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly uninteresting stuff. Move the test injections under a function
named main() so that the variables used during that process aren't in
the global scope.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index dc431c35b35..c23df3d75c7 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -19,10 +19,11 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
-import os
 import itertools
 import operator
+import os
 import re
+
 import iotests
 from iotests import qemu_img, qemu_img_create, Timeout
 
@@ -224,25 +225,6 @@ def inject_test_case(klass, suffix, method, *args, **kwargs):
     setattr(klass, 'test_' + method + suffix, lambda self: mc(self))
 
 
-for cmb in list(itertools.product((True, False), repeat=5)):
-    name = ('_' if cmb[0] else '_not_') + 'persistent_'
-    name += ('_' if cmb[1] else '_not_') + 'migbitmap_'
-    name += '_online' if cmb[2] else '_offline'
-    name += '_shared' if cmb[3] else '_nonshared'
-    if cmb[4]:
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
-
-
 class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
     def setUp(self):
         qemu_img_create('-f', iotests.imgfmt, base_a, size)
@@ -304,6 +286,30 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
 
+def main() -> None:
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


