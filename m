Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A377B3A0427
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:38:23 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhYM-0001rS-Me
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wca_YAcKCloN6FLMJ68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--venture.bounces.google.com>)
 id 1lqhWg-0007u0-FW
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:40 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:36631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wca_YAcKCloN6FLMJ68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--venture.bounces.google.com>)
 id 1lqhWd-00029u-44
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:38 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 w130-20020a25df880000b02905327e5d7f43so28216085ybg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VNh6+fxTEOy4MLnMIg3ZAjdinohY8fNQ1zbxPjrXhBI=;
 b=j4dGMR30zlL8L96gSSL8qAEe79Yo8Wt/OBeJ9zl59Ik27URrt+sw0J78Hps83PCG/Z
 UtuJ4jgo6wzyokbM2GJ8sLZ+xTkrYuI4il8+kaCSHlksC2uhmZYDKSHgSpzXj9wsUWyR
 xInjFOeoLENIYvfJkxlFuB6ZyY+HwNGuNfQoadMSndoZLzV7WtMR6H0/HXEXSeLKzJKZ
 IRkYssWTgRnYaApC+WffbRizdjyOK9iuJL3qOuT5a4rx1uo6P1+gCktg3c1utAfSyveY
 mTj4yEjtejYgfFnp8RXJ5OR1AvrGKF0YIv0TNZXAjFyM2JoHCT9m3tTJ43p7ejwX6Pcs
 /JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VNh6+fxTEOy4MLnMIg3ZAjdinohY8fNQ1zbxPjrXhBI=;
 b=cPIDZV3/96NsbMp0KBdUcitG6FfRpUvO3MLYTVnACfXfhvK+MEJcMowS62rx86/Rcd
 qPiB2WxxfVIpOePHzNffjuc0RPEp5lU/v6S+cvLIPKK6K4CSyk9rsNK+NsTtBDYWa1Y/
 NgtYdC2t/bzLQKUwXzMwgFFZLVPDmy35cg/JD+0uLqURRyKF5cAiruGXZj6SRw3UDDhq
 iGpU/uIcOnRhuzpujCHsLvzUyuCylyWydfdORQNhfPszeV6W7W6Z3isWSsy9F5p+CV+Y
 i4pSD//j6F5Wctb0kJO5+93/S3oIAIUIggz9lACLWs6jMJ2z1LIeViNwr2Rlfb1vytfk
 Ja9Q==
X-Gm-Message-State: AOAM532yRINuheKWCw+X/G+txt2huKR3NVpDW5C61WeyXa/OqwVfK5Fl
 Xou0Y25d1y+3PZnzBYhfG2R62z6SuDu2
X-Google-Smtp-Source: ABdhPJwjutf/c0gKXBr4Q3aPtUp8vz90F5xBEdmWi8rKjf5/BtCWy1LeczY0TSY2rqf/AATSbiapky6C2YBB
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:bec2:: with SMTP id
 k2mr34522889ybm.234.1623180993566; Tue, 08 Jun 2021 12:36:33 -0700 (PDT)
Date: Tue,  8 Jun 2021 12:36:04 -0700
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
Message-Id: <20210608193605.2611114-2-venture@google.com>
Mime-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 1/2] hw/arm: add quanta-gbs-bmc machine
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3wca_YAcKCloN6FLMJ68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds initial quanta-gbs-bmc machine support.

Tested: Boots to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e3786..34a214fe79 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -29,6 +29,7 @@
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
+#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void quanta_gbs_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
 };
 
+static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Quanta GBS (Cortex-A9)";
+    mc->init = quanta_gbs_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -332,6 +361,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gsj"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gsj_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = gbs_bmc_machine_class_init,
     },
 };
 
-- 
2.31.1.751.gd2f1c929bd-goog


