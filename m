Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2723B3735B0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:39:51 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC8M-0004Mi-7B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4d-0007ds-G6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57696
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4W-00027U-2h
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:59 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4S-0000OI-MH; Wed, 05 May 2021 08:35:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:32 +0100
Message-Id: <20210505073538.11438-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 04/10] hw/sparc/sun4m: Register machine types in
 sun4m_machine_types[]
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-5-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 100 +++++++++++++++++------------------------------
 1 file changed, 36 insertions(+), 64 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 56f927e66c..a625c41cd3 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1396,12 +1396,6 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[0];
 }
 
-static const TypeInfo ss5_type = {
-    .name = MACHINE_TYPE_NAME("SS-5"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss5_class_init,
-};
-
 static void ss10_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1413,12 +1407,6 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[1];
 }
 
-static const TypeInfo ss10_type = {
-    .name = MACHINE_TYPE_NAME("SS-10"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss10_class_init,
-};
-
 static void ss600mp_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1430,12 +1418,6 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[2];
 }
 
-static const TypeInfo ss600mp_type = {
-    .name = MACHINE_TYPE_NAME("SS-600MP"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss600mp_class_init,
-};
-
 static void ss20_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1447,12 +1429,6 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[3];
 }
 
-static const TypeInfo ss20_type = {
-    .name = MACHINE_TYPE_NAME("SS-20"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss20_class_init,
-};
-
 static void voyager_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1463,12 +1439,6 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[4];
 }
 
-static const TypeInfo voyager_type = {
-    .name = MACHINE_TYPE_NAME("Voyager"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = voyager_class_init,
-};
-
 static void ss_lx_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1479,12 +1449,6 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[5];
 }
 
-static const TypeInfo ss_lx_type = {
-    .name = MACHINE_TYPE_NAME("LX"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss_lx_class_init,
-};
-
 static void ss4_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1495,12 +1459,6 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[6];
 }
 
-static const TypeInfo ss4_type = {
-    .name = MACHINE_TYPE_NAME("SS-4"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = ss4_class_init,
-};
-
 static void scls_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1511,12 +1469,6 @@ static void scls_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[7];
 }
 
-static const TypeInfo scls_type = {
-    .name = MACHINE_TYPE_NAME("SPARCClassic"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = scls_class_init,
-};
-
 static void sbook_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1527,14 +1479,44 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     smc->hwdef = &sun4m_hwdefs[8];
 }
 
-static const TypeInfo sbook_type = {
-    .name = MACHINE_TYPE_NAME("SPARCbook"),
-    .parent = TYPE_SUN4M_MACHINE,
-    .class_init = sbook_class_init,
-};
-
 static const TypeInfo sun4m_machine_types[] = {
     {
+        .name           = MACHINE_TYPE_NAME("SS-5"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss5_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SS-10"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss10_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SS-600MP"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss600mp_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SS-20"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss20_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("Voyager"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = voyager_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("LX"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss_lx_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SS-4"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = ss4_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SPARCClassic"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = scls_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("SPARCbook"),
+        .parent         = TYPE_SUN4M_MACHINE,
+        .class_init     = sbook_class_init,
+    }, {
         .name           = TYPE_SUN4M_MACHINE,
         .parent         = TYPE_MACHINE,
         .class_size     = sizeof(Sun4mMachineClass),
@@ -1551,16 +1533,6 @@ static void sun4m_register_types(void)
     type_register_static(&afx_info);
     type_register_static(&prom_info);
     type_register_static(&ram_info);
-
-    type_register_static(&ss5_type);
-    type_register_static(&ss10_type);
-    type_register_static(&ss600mp_type);
-    type_register_static(&ss20_type);
-    type_register_static(&voyager_type);
-    type_register_static(&ss_lx_type);
-    type_register_static(&ss4_type);
-    type_register_static(&scls_type);
-    type_register_static(&sbook_type);
 }
 
 type_init(sun4m_register_types)
-- 
2.20.1


