Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7BC371E6B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:22:20 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcGx-0001LQ-Ur
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8A-0001jq-3e
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc88-0003uf-CW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso4500605wmo.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/dStvpr9oyPCGk3CDC2TxGy21PRVsiBcyFEDxcgGiM=;
 b=I7sjXKHBoDNd58Rc9pkmfpqIxfjycdFz3g3/Yts6ROS8haeQJOgkWNgSTdywNEtcCq
 yXXfw7qGtEgDf/9pzbOSY57dXIlklgkmpDj0O4cBj8WdnwgUIzpaW+LIBxRSZ5Pk0rlp
 EKANl+/AbocktDlFEPmApckOaWh5OFGbCWTwSj232QToEdhyT60evbGSzI3ALO+JiR+7
 qXMbWHyAJvFU+Eq8kI9KnZMjt683cTAKfXwwhC5kXSBf1uplUBgoiK+nEoDs6ob7iuzA
 PKRxQurOOnzHN3lnKyUSd9iJcoDNrzxaTaffZVP7MxqjTgZYH/jyGqrPUU3elCqiiGLn
 Gwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0/dStvpr9oyPCGk3CDC2TxGy21PRVsiBcyFEDxcgGiM=;
 b=pI06r+ALZzNhqq1gFhsqCt58yBJ4v59pv6TGy8subIYCcNClWd9IoMaDCweGglwZzi
 q3gCEI8Ypz7xOPJNDE+LGBvl+Mf2Q0keEfsCpTn4H7LFqLO/7Y4BityOeRMtEfQeYEsn
 n1aqvMZy8POOcS6VmCU0SjKOmbIo4YeLdtOyHY+fxwRJs1x1EN9SlM2hC4xTAMKUPhHf
 ANoGxGOudqVx84ojmYvmMohEkGZDaU/7vmuAeNI23Esn37mhL9kLex5yBB3yokTLqoif
 8bhzDJktLuBcEBbd1EiBDCQA/cOHcqkCCFC9fmuyW/taoyo6PSzFZGckOdslmOxLdatM
 Vb1w==
X-Gm-Message-State: AOAM531ZRbv3cfskXH/tRltN4AJkYmpZlvCT5TxStenuDiq8F2EhWIvL
 /4gD/PznD3NxjYlo7UOfto1axKH/Rck3Cw==
X-Google-Smtp-Source: ABdhPJwPx5f9PMTB5heVu3KrpzBfxzCEN3DIXjQq3PXTAWtYNNOPYefdQETP8Jr0lFJaiVM/jKig/w==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr32636408wmk.83.1620061990781; 
 Mon, 03 May 2021 10:13:10 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z19sm29920wmf.47.2021.05.03.10.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/sparc/sun4m: Have sun4m machines inherit new
 TYPE_SUN4M_MACHINE
Date: Mon,  3 May 2021 19:12:58 +0200
Message-Id: <20210503171303.822501-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Introduce the TYPE_SUN4M_MACHINE and have all sun4m
machines inherit it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..9d07fa43d6a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,6 +107,8 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+#define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
     static const struct {
@@ -1433,7 +1435,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss5_type = {
     .name = MACHINE_TYPE_NAME("SS-5"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss5_class_init,
 };
 
@@ -1453,7 +1455,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss10_type = {
     .name = MACHINE_TYPE_NAME("SS-10"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss10_class_init,
 };
 
@@ -1473,7 +1475,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss600mp_type = {
     .name = MACHINE_TYPE_NAME("SS-600MP"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss600mp_class_init,
 };
 
@@ -1493,7 +1495,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss20_type = {
     .name = MACHINE_TYPE_NAME("SS-20"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss20_class_init,
 };
 
@@ -1512,7 +1514,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo voyager_type = {
     .name = MACHINE_TYPE_NAME("Voyager"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = voyager_class_init,
 };
 
@@ -1531,7 +1533,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss_lx_type = {
     .name = MACHINE_TYPE_NAME("LX"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss_lx_class_init,
 };
 
@@ -1550,7 +1552,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo ss4_type = {
     .name = MACHINE_TYPE_NAME("SS-4"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = ss4_class_init,
 };
 
@@ -1569,7 +1571,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo scls_type = {
     .name = MACHINE_TYPE_NAME("SPARCClassic"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = scls_class_init,
 };
 
@@ -1588,10 +1590,20 @@ static void sbook_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo sbook_type = {
     .name = MACHINE_TYPE_NAME("SPARCbook"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_SUN4M_MACHINE,
     .class_init = sbook_class_init,
 };
 
+static const TypeInfo sun4m_machine_types[] = {
+    {
+        .name           = TYPE_SUN4M_MACHINE,
+        .parent         = TYPE_MACHINE,
+        .abstract       = true,
+    }
+};
+
+DEFINE_TYPES(sun4m_machine_types)
+
 static void sun4m_register_types(void)
 {
     type_register_static(&idreg_info);
-- 
2.26.3


