Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3583370EAA
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:58:07 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHI6-0001b4-Ux
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFD-0008Ft-2Y
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFB-0008Jl-4y
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so466359wmi.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0fq0tgV0XnQZWCzCWhA2xB44pEZvjl2wJSY1xGfPWQ=;
 b=Qp0BnW0RowNqxS0Q0ShXg6PCiAiYIWO6VvTVOYRj8bosKr36BzKjYjYHKlbKYhlra/
 s/8bec9ZSgFintcCn2x8Y+vdob2mUTL23QzRk4dEzcnX1+gsDFRGDMRU1PqmrrFxVrtE
 XwIysfYg8KW+Z5pIgYZgq9rdDhVyTJiz05WSsyINxVi0AZz6/xcnw/06X/fblOyAoUoZ
 P4/YWWpran8CqpDVpCFNSM5lsoFrT6pytbz65sqMGyyBTdy+7KErikOurJW6zsgfj026
 6jhLRrtq1T4HrFSeKO5c+vpLVDyodq4EW+hvUdhVDVVsiYNS9yFGYVrLB/TqXmbJ620A
 uo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J0fq0tgV0XnQZWCzCWhA2xB44pEZvjl2wJSY1xGfPWQ=;
 b=WLxqKEqI5p+hVQmHxfSXJvOtD/zyQyR1Gg0X3duNjqR2hFL2SKwM1ameAUXFDddzCU
 IARNbaZzRqArhxK7PI6rhDESsIp0k35q430meWVjt0HRc5CTle2S1C+Aj7D4613tvSyK
 9UIASI8sy/5aGw7DRdc5ODub67wivO1v/u8bszTuexX/6f9ABt0pwkqQcGcy3PhE7PHV
 NyPXCBnMsrRA1X/efIYRrOHVeZ2qfjiIDGMhPxTHnYjDLUo0QtctsucxxX2k7h9GCW9t
 1Vw4MiwfNFFDLAEv+mCz7d2CxTjussqx0U6Qh2rhI+dqFGPeu6n7CP6AiuwVDlYBcOM/
 LJuA==
X-Gm-Message-State: AOAM53040eatsVJrD+GmATSs8tB5XDCdavMpYtn5pcbarrNEj+qm0dFS
 320nMKPK2MrtvHJIOPEtWVe/gmMRKVWTENLn
X-Google-Smtp-Source: ABdhPJzpg3/VHSPXQFC9S4KxjujWDunLHJSN0eCKd2EOdiX9cGoXwJaS/0cdCryGZDHzNWKQ60a2/Q==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr6006843wmq.107.1619981703665; 
 Sun, 02 May 2021 11:55:03 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id u2sm18903577wmc.22.2021.05.02.11.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:55:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] hw/sparc/sun4m: Register machine types in
 sun4m_machine_types[]
Date: Sun,  2 May 2021 20:54:39 +0200
Message-Id: <20210502185441.599980-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502185441.599980-1-f4bug@amsat.org>
References: <20210502185441.599980-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 100 +++++++++++++++++------------------------------
 1 file changed, 36 insertions(+), 64 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 56f927e66ca..a625c41cd37 100644
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
2.26.3


