Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2A371E95
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:28:55 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcNK-0002eS-6e
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8P-00027W-PR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8N-000410-Q3
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso3702934wmj.2
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dWVeeH1/VoY4ITl3jZ5D7j6w2KZsbQ1Q/ra2PImi8Q=;
 b=mVJUizJtvJxJwCH1y4OvYt1wlaNH5KJkY3QW9UWLfnSyrygSg21ZY4u5OkW1yH4eYl
 5X4faN3hIrtkujJeEpDC61n4cfqru9XyTnEpmydMhJhjGOg2ALy2lmyxERDG/eo81XBr
 Nw5t9pUf9jb5wxTKHuIHc6a91tAYOwIYfXCq6LOlFWYz/1WurNkHDNwQBeReoFeEBWVn
 LJXgCGHlH8x0l7jIfe/sMUWkukpEsGVgoEmLJvEKhslMWUaSFCK4Alqd9R9jnYw28OlO
 7yG597dnlBSTqkqVLKxG0FKG3hHl04JEY4uP4rxfLTTiZNMhEK4WkU9g+Tv4WOes/cgs
 z9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0dWVeeH1/VoY4ITl3jZ5D7j6w2KZsbQ1Q/ra2PImi8Q=;
 b=KTEdU6C0VIFrbBRI+6JiseqPsTe6rJorxUkx7qOZgvmiUAqbaHC2gAwH3A/UB9vz5V
 WMoRPn9C0ByaDKnfzE5DS88ZQ56mYrLjqJhq4WfIGUjl44F47uSlKK/dEPR503LkgmQ4
 xmY0Sr4Zmv6+BsGn5s1sitF5NNT+f74Rs6+27CfjJRGnMwlqnUY8mDAtiVMjLSgyMsME
 iXR/lOJvrUeg9OeSMEPe8KBo25lYuCcwpL1qZLdwXZuC27y0Haapx08B7OuIHG8l19Y5
 KMyZXDDhfD7i2I3wHMfzEs3ND4yOVPqKNFXhb3jzl/T1RXdu+tL4R5+ydc05uG/e8sk5
 84TA==
X-Gm-Message-State: AOAM532Y5vgQL67qNDg2eBrFQ+CR9Ou5VLqN/wS8GRafhIDQyjpyuJUW
 kLxfWN62t1QBGzqqsTaE5jxN+GlQdCqpZQ==
X-Google-Smtp-Source: ABdhPJzPAew8Gja8ItJekPs8a+OTN3Vv35a/wStxffrRNVrF7rB8YAjemQppYmxNghy2xHIc6QY1/A==
X-Received: by 2002:a1c:7fcd:: with SMTP id
 a196mr33636567wmd.180.1620062006007; 
 Mon, 03 May 2021 10:13:26 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g19sm146255wme.48.2021.05.03.10.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] hw/sparc/sun4m: Register machine types in
 sun4m_machine_types[]
Date: Mon,  3 May 2021 19:13:01 +0200
Message-Id: <20210503171303.822501-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


