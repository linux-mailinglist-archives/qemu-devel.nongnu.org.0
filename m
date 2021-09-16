Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4440D241
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:16:20 +0200 (CEST)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQiot-0005mO-Oj
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQij1-0006oS-G4
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQiiy-0000Ta-PF
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631765412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FToxD/qVgRUWi38kDsj7ZMrg72iH2FFhHpz6YePmeqw=;
 b=AmS2gfyRcpFKZq9y93IiUT8rncWVT6Ci4+t47ZNCuJdyR/OgolwVVE93UPKj40S56RLW5V
 SvK1mdQ8TwH/mFRA5VMJKyyOwCXQs0AmlDMaRCQSIeEGRW141tj223i2ddvrSA/LuwMRGh
 IV0G3+/DnVqUJYuiOaQZR/DsIPUq8oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-acDPZEKnNN6boe9mJmwqKQ-1; Thu, 16 Sep 2021 00:10:10 -0400
X-MC-Unique: acDPZEKnNN6boe9mJmwqKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C282801E72;
 Thu, 16 Sep 2021 04:10:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E312619C79;
 Thu, 16 Sep 2021 04:10:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/16] iotests/migrate-bitmaps-test: delint
Date: Thu, 16 Sep 2021 00:09:43 -0400
Message-Id: <20210916040955.628560-5-jsnow@redhat.com>
In-Reply-To: <20210916040955.628560-1-jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly uninteresting stuff. Move the test injections under a function
named main() so that the variables used during that process aren't in
the global scope.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++++--------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index dc431c35b3..c23df3d75c 100755
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


