Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97F32F0EA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:14:10 +0100 (CET)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIE1h-0003mc-2X
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkH-0006tZ-1r
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk5-0007CX-3n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VF98KSzLbmqEjHnWVEXHrpPBNZqP8dKQmGu7jqXOY2M=;
 b=FfinuYpN8n54oV/tAOrdlMR9U8I3tv05u5n+xgift8jtRx0yE9tOGj+iCe4yenAm2cXeMD
 YSmnhYwV3puu4XDNr3mXiM303WZWGD4vvvcxaB6QMJx/TwHoa73TzimRytPX2r2eGCunjc
 Jepys13DVY8ZThUUJ6rIzQIWSquUmKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-qVaeBIEmM_qt5ViBwg5HDQ-1; Fri, 05 Mar 2021 11:55:52 -0500
X-MC-Unique: qVaeBIEmM_qt5ViBwg5HDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23C24100A44D;
 Fri,  5 Mar 2021 16:55:14 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 143A960BF3;
 Fri,  5 Mar 2021 16:55:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/31] iotests: Fix up python style in 300
Date: Fri,  5 Mar 2021 17:54:28 +0100
Message-Id: <20210305165454.356840-6-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Break some long lines, and relax our type hints to be more generic to
any JSON, in order to more easily permit the additional JSON depth now
possible in migration parameters.  Detected by iotest 297.

Fixes: ca4bfec41d56
 (qemu-iotests: 300: Add test case for modifying persistence of bitmap)
Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210215220518.1745469-1-eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/300 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 63036f6a6e..adb9276297 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -22,7 +22,7 @@
 import os
 import random
 import re
-from typing import Dict, List, Optional, Union
+from typing import Dict, List, Optional
 
 import iotests
 
@@ -30,7 +30,7 @@ import iotests
 # pylint: disable=wrong-import-order
 import qemu
 
-BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
+BlockBitmapMapping = List[Dict[str, object]]
 
 mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
 
@@ -602,7 +602,8 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
 
 class TestAliasTransformMigration(TestDirtyBitmapMigration):
     """
-    Tests the 'transform' option which modifies bitmap persistence on migration.
+    Tests the 'transform' option which modifies bitmap persistence on
+    migration.
     """
 
     src_node_name = 'node-a'
@@ -674,7 +675,8 @@ class TestAliasTransformMigration(TestDirtyBitmapMigration):
         bitmaps = self.vm_b.query_bitmaps()
 
         for node in bitmaps:
-            bitmaps[node] = sorted(((bmap['name'], bmap['persistent']) for bmap in bitmaps[node]))
+            bitmaps[node] = sorted(((bmap['name'], bmap['persistent'])
+                                    for bmap in bitmaps[node]))
 
         self.assertEqual(bitmaps,
                          {'node-a': [('bmap-a', True), ('bmap-b', False)],
-- 
2.29.2


