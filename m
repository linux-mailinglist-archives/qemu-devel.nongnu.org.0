Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91F2FA60A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:26:42 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XMW-0000ya-MY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XLe-0000MV-4S
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XLb-0007t0-SE
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/h6/sK+7NBVzrl8kG33odiHbt8P2Pe/t/OGYGOP5BfE=;
 b=Zlwdvb2au3H5GqZmDe6AM6+Jn2tThD6c11JkgxZAwr6fLWEj6notjah1UCAFU113iwNUv/
 KmjIAtDu5xYNn0BTZHD9vey5GMgvRCz01tuQHnDJ2J2ZdsH1o75GDgFme4aVtH7vu1Az+M
 aFGM5vief5KiXiXJX7lOO9iROHPcm+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-JTGEoDGxPi-5v9U5lEZ77A-1; Mon, 18 Jan 2021 11:25:39 -0500
X-MC-Unique: JTGEoDGxPi-5v9U5lEZ77A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68C57107ACE4;
 Mon, 18 Jan 2021 16:25:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21BC119C66;
 Mon, 18 Jan 2021 16:25:37 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] arm: rename xlnx-zcu102.canbusN properties
Date: Mon, 18 Jan 2021 11:25:37 -0500
Message-Id: <20210118162537.779542-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The properties to attach a CANBUS object to the xlnx-zcu102 machine have
a period in them.  We want to use periods in properties for compound QAPI types,
and besides the "xlnx-zcu102." prefix is both unnecessary and different
from any other machine property name.  Remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/xlnx-zcu102.c        |  4 ++--
 tests/qtest/xlnx-can-test.c | 30 +++++++++++++++---------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 4ef0c516bf..c9713638c5 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -219,12 +219,12 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
     s->secure = false;
     /* Default to virt (EL2) being disabled */
     s->virt = false;
-    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
+    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
                              (Object **)&s->canbus[0],
                              object_property_allow_set_link,
                              0);
 
-    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
+    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
                              (Object **)&s->canbus[1],
                              object_property_allow_set_link,
                              0);
diff --git a/tests/qtest/xlnx-can-test.c b/tests/qtest/xlnx-can-test.c
index 3d1120005b..54de71a686 100644
--- a/tests/qtest/xlnx-can-test.c
+++ b/tests/qtest/xlnx-can-test.c
@@ -138,9 +138,9 @@ static void test_can_bus(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 and CAN1. */
@@ -175,9 +175,9 @@ static void test_can_loopback(void)
     uint32_t status = 0;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 in loopback mode. */
@@ -223,9 +223,9 @@ static void test_can_filter(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0 and CAN1. */
@@ -271,9 +271,9 @@ static void test_can_sleepmode(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0. */
@@ -317,9 +317,9 @@ static void test_can_snoopmode(void)
     uint8_t can_timestamp = 1;
 
     QTestState *qts = qtest_init("-machine xlnx-zcu102"
-                " -object can-bus,id=canbus0"
-                " -machine xlnx-zcu102.canbus0=canbus0"
-                " -machine xlnx-zcu102.canbus1=canbus0"
+                " -object can-bus,id=canbus"
+                " -machine canbus0=canbus"
+                " -machine canbus1=canbus"
                 );
 
     /* Configure the CAN0. */
-- 
2.26.2


