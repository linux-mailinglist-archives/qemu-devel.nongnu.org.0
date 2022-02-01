Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860724A611F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:14:00 +0100 (CET)
Received: from localhost ([::1]:43286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvn5-0006xt-Mc
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSS-0003Cs-Pj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuSI-0004FR-U6
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9dqg045Vw5indBfvLFwqrBwPG/2Oqs7WvibUnHBFMXI=;
 b=J5gvsoZl5k7oz6tpR2gnf+8tYb4ENMVt4Xk8tqwBwv581KS0zR+TMolSczlnyw1YQ1NB6X
 rr4o+4XCWE1D4Z44QquyX5SXAUS/RLP7eAgIGonf+YKM580pOva8pn24vYJt7Up8G/QeEZ
 NDR8/vA5sto4tN0xh0m1f1ykqw/+0F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-SUurSRnwOYSEGv-qUDuamA-1; Tue, 01 Feb 2022 09:43:22 -0500
X-MC-Unique: SUurSRnwOYSEGv-qUDuamA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 654DA1091DBB;
 Tue,  1 Feb 2022 14:43:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FC270D2B;
 Tue,  1 Feb 2022 14:43:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/24] iotests: specify some unsupported_imgopts for python
 iotests
Date: Tue,  1 Feb 2022 15:42:14 +0100
Message-Id: <20220201144233.617021-6-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to support IMGOPTS for python iotests. Still some iotests
will not work with common IMGOPTS used with bash iotests like
specifying refcount_bits and compat qcow2 options. So we
should define corresponding unsupported_imgopts for now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211223160144.1097696-4-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/044                                 | 3 ++-
 tests/qemu-iotests/065                                 | 3 ++-
 tests/qemu-iotests/163                                 | 3 ++-
 tests/qemu-iotests/165                                 | 3 ++-
 tests/qemu-iotests/196                                 | 3 ++-
 tests/qemu-iotests/242                                 | 3 ++-
 tests/qemu-iotests/246                                 | 3 ++-
 tests/qemu-iotests/254                                 | 3 ++-
 tests/qemu-iotests/260                                 | 3 ++-
 tests/qemu-iotests/274                                 | 3 ++-
 tests/qemu-iotests/281                                 | 3 ++-
 tests/qemu-iotests/303                                 | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-test          | 3 ++-
 tests/qemu-iotests/tests/remove-bitmap-from-backing    | 3 ++-
 15 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 64b18eb7c8..d696e6442a 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -117,4 +117,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 3c2ca27627..dc7716275f 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -139,4 +139,5 @@ TestQMP = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index dedce8ef43..b8bfc95358 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -169,4 +169,5 @@ ShrinkBaseClass = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['raw', 'qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index ce499946b8..e3ef28e2ee 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -157,4 +157,5 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 2451515094..76509a5ad1 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -65,4 +65,5 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index a9b27668c2..96a30152b0 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -26,7 +26,8 @@ from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
     file_path, img_info_log, log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_protocols=['file'])
+                          supported_protocols=['file'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 disk = file_path('disk')
 chunk = 256 * 1024
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index 5932a0e8a9..b009a78397 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -23,7 +23,8 @@
 import iotests
 from iotests import log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 size = 64 * 1024 * 1024 * 1024
 gran_small = 32 * 1024
 gran_large = 128 * 1024
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 108bf5f894..7ea098818c 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -22,7 +22,8 @@
 import iotests
 from iotests import qemu_img_create, file_path, log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 
 disk, top = file_path('disk', 'top')
 size = 1024 * 1024
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 2ec64a9b99..c2133f9980 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -23,7 +23,8 @@ import iotests
 from iotests import qemu_img_create, file_path, log, filter_qmp_event
 
 iotests.script_initialize(
-    supported_fmts=['qcow2']
+    supported_fmts=['qcow2'],
+    unsupported_imgopts=['compat']
 )
 
 base, top = file_path('base', 'top')
diff --git a/tests/qemu-iotests/274 b/tests/qemu-iotests/274
index caab008e07..080a90f10f 100755
--- a/tests/qemu-iotests/274
+++ b/tests/qemu-iotests/274
@@ -23,7 +23,8 @@
 import iotests
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_platforms=['linux'])
+                          supported_platforms=['linux'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 size_short = 1 * 1024 * 1024
 size_long = 2 * 1024 * 1024
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 956698083f..318e333939 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -245,4 +245,5 @@ class TestBlockdevBackupAbort(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 425544c064..475cb5428d 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -23,7 +23,8 @@ import iotests
 import subprocess
 from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 disk = file_path('disk')
 chunk = 1024 * 1024
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index 00ebb5c251..fc9c4b4ef4 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -272,4 +272,5 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index c23df3d75c..59f3357580 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -307,7 +307,8 @@ def main() -> None:
 
     iotests.main(
         supported_fmts=['qcow2'],
-        supported_protocols=['file']
+        supported_protocols=['file'],
+        unsupported_imgopts=['compat']
     )
 
 
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 8d48fc0f3c..3c397b08ea 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -21,7 +21,8 @@
 import iotests
 from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 
 top, base = iotests.file_path('top', 'base')
 size = '1M'
-- 
2.34.1


