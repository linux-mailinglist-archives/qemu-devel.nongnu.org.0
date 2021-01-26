Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B33040A0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:42:08 +0100 (CET)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PXi-00074m-Ht
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDh-0000Qu-6v
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDZ-0006Ba-QV
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XH6X+6ScV6XrnqxQTSO9Xrcj62FiZ0S41tAeBQhfEM0=;
 b=XrBrerkWyGCfAwNxSPBLkt+KeJ/bJ5OL0CvEpJ5ej8h19AyD+d450nQ8mqDduhKg9fyfuP
 pgmKePt/3YUEnCAW4cDzB4qIXliXeFVwZd/SBLgfQvzij4nzT6Mpf4O67YwdwwuQsuh0sC
 UEoofcR9rmpB121Yyv3QRzCsB/F2d38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-rZ_zl0MaNmG9Tx_JkG8DkQ-1; Tue, 26 Jan 2021 09:21:14 -0500
X-MC-Unique: rZ_zl0MaNmG9Tx_JkG8DkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EDC88015DD;
 Tue, 26 Jan 2021 14:21:13 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD3110023B2;
 Tue, 26 Jan 2021 14:21:12 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/53] iotests/300: Clean up pylint and mypy complaints
Date: Tue, 26 Jan 2021 15:19:47 +0100
Message-Id: <20210126142016.806073-25-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And consequentially drop it from 297's skip list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210118105720.14824-11-mreitz@redhat.com>
---
 tests/qemu-iotests/297 |  2 +-
 tests/qemu-iotests/300 | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 79e63f8625..a37910b42d 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -34,7 +34,7 @@ SKIP_FILES = (
     '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
-    '299', '300', '302', '303', '304', '307',
+    '299', '302', '303', '304', '307',
     'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
 )
 
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 38ef5945b7..43264d883d 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -23,7 +23,11 @@ import os
 import random
 import re
 from typing import Dict, List, Optional, Union
+
 import iotests
+
+# Import qemu after iotests.py has amended sys.path
+# pylint: disable=wrong-import-order
 import qemu
 
 BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
@@ -111,10 +115,14 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         If @msg is None, check that there has not been any error.
         """
         self.vm_b.shutdown()
+
+        log = self.vm_b.get_log()
+        assert log is not None  # Loaded after shutdown
+
         if msg is None:
-            self.assertNotIn('qemu-system-', self.vm_b.get_log())
+            self.assertNotIn('qemu-system-', log)
         else:
-            self.assertIn(msg, self.vm_b.get_log())
+            self.assertIn(msg, log)
 
     @staticmethod
     def mapping(node_name: str, node_alias: str,
@@ -446,9 +454,13 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
 
         # Check for the error in the source's log
         self.vm_a.shutdown()
+
+        log = self.vm_a.get_log()
+        assert log is not None  # Loaded after shutdown
+
         self.assertIn(f"Cannot migrate bitmap '{name}' on node "
                       f"'{self.src_node_name}': Name is longer than 255 bytes",
-                      self.vm_a.get_log())
+                      log)
 
         # Expect abnormal shutdown of the destination VM because of
         # the failed migration
-- 
2.29.2


