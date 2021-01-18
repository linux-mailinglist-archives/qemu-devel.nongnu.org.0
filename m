Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07C2F9D95
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:09:01 +0100 (CET)
Received: from localhost ([::1]:50394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SP6-0002Mr-MW
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1SEP-00007g-IB
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1SEL-0001Cr-0v
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610967472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k8E5OzmfpPhPTHqY35rlCclfuYnizBJAAP9m3Rw1KMk=;
 b=Arnpd77At4nX0/jSrVQZfrdkglnVUThFOO0hRkridecOvPLLZVHGr/OATOlzS+eDQI+5WC
 u02wedJ781o7fN8vYYIZpUxIQG5FQizSUFFUjcqOMxdCyCv0A7Wr+BPwONE/vNtTifHMVc
 fYpDgspiSfwUnDaQMGlmza+YYdgEBK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-J38Fo12DMvmkTgtI2GVwWg-1; Mon, 18 Jan 2021 05:57:48 -0500
X-MC-Unique: J38Fo12DMvmkTgtI2GVwWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C152180E461;
 Mon, 18 Jan 2021 10:57:47 +0000 (UTC)
Received: from localhost (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0256A19725;
 Mon, 18 Jan 2021 10:57:46 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 10/10] iotests/300: Clean up pylint and mypy complaints
Date: Mon, 18 Jan 2021 11:57:20 +0100
Message-Id: <20210118105720.14824-11-mreitz@redhat.com>
In-Reply-To: <20210118105720.14824-1-mreitz@redhat.com>
References: <20210118105720.14824-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And consequentially drop it from 297's skip list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/qemu-iotests/297 |  2 +-
 tests/qemu-iotests/300 | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 234e1da2fb..eab3d660bb 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -33,7 +33,7 @@ SKIP_FILES = (
     '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
-    '299', '300', '302', '303', '304', '307',
+    '299', '302', '303', '304', '307',
     'nbd-fault-injector.py', 'qcow2.py', 'qcow2_format.py', 'qed.py'
 )
 
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index b864a21d5e..4115f90578 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -22,7 +22,11 @@ import os
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
@@ -110,10 +114,14 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
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
@@ -445,9 +453,13 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
 
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


