Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E305B2F82ED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:50:27 +0100 (CET)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TEw-0001YZ-Sv
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8f-0003q8-4e
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0T8Y-0001Vq-IS
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610732623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IThQqdCdlmQTCCDgQ8h2kSTms7AuPTfHOCwzdRwD2i8=;
 b=I0KKs2IOfoVeNWlRvP2E2uWtPXSdaGfwfL+Iq1xcdNOY1lF5grStY2i2iqH2lG5oaQN00f
 tGd5ijIkSU7w4iFilD01OMzd0gDLHVJtPG1bJ4+T0X/oeIhe+gMU3lptZtbONwiAipq2JX
 iksf2EpqLwtYnsF28mYrmAZmoiZZNf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-7H4soNGhP7q44lJo0PJ08A-1; Fri, 15 Jan 2021 12:43:41 -0500
X-MC-Unique: 7H4soNGhP7q44lJo0PJ08A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3606A107AD25;
 Fri, 15 Jan 2021 17:43:40 +0000 (UTC)
Received: from localhost (ovpn-114-144.ams2.redhat.com [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4EF5F9C5;
 Fri, 15 Jan 2021 17:43:39 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 10/10] iotests/300: Clean up pylint and mypy complaints
Date: Fri, 15 Jan 2021 18:43:15 +0100
Message-Id: <20210115174315.30949-11-mreitz@redhat.com>
In-Reply-To: <20210115174315.30949-1-mreitz@redhat.com>
References: <20210115174315.30949-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

And consequentially drop it from 297's skip list.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/297 |  2 +-
 tests/qemu-iotests/300 | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index d2d9292839..ce7f85cfe0 100755
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


