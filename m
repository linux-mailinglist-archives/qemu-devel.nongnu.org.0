Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47133403120
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:35:55 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjh4-00079t-C5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ieg3YQYKCkoo3m6q3s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--crauer.bounces.google.com>)
 id 1mNje2-0005iX-Pn
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 18:32:47 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:55127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ieg3YQYKCkoo3m6q3s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--crauer.bounces.google.com>)
 id 1mNjdz-0001KH-MS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 18:32:46 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 y134-20020a25dc8c000000b0059f0301df0fso2888ybe.21
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=iF/zN+LW9GzOJqwhesSX2lWyW3wIuY03WUhR9KJ6MW8=;
 b=sUdepdKih35Gui9BJJL+syGuEWolJg6JxNd3lR/uBCEU+Wmgb9kd72LlOOnaCwwtIp
 kDLtzBbr50fqQ5XBDKard/RZgvjzCgMsqIPAPx+LOLtp3hawA+qx/nMfCItRDIniUJT1
 XUoHS1t3JiKaR8LZBWpjZ/EXgTBff6BUr5VNUYE1TBB8oz3nLkDe81czap1IhYQKu7Tm
 YHQdTq11gqnGbEMFbI1sueLrXUzQyck/PmD/zDJ1BS2VYRnnd3MBH/qTuEn+ABfuX0me
 b9igrJ+J6ejXrHvObWSpm63q1yIQ6JxSoY6vR5495oscM+oXiOP3w9S1drst/utz5pZV
 PW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=iF/zN+LW9GzOJqwhesSX2lWyW3wIuY03WUhR9KJ6MW8=;
 b=lHdVdm4C2gvoooeqXJ6PK/tpQIUIHUjDjM1DTA23Mr1+30q9mGUe8+FNwxWwML3+AO
 OWqquFt5ToPG2KFbQkGJAMq3UcYiGiIt/suNe/fB4gm8Y6nBNADrHjkj15eY/dfhZ9HW
 4dEH3NSKQgOTMa1bQL9TH/c/dDLDSukEcukPZ3RuRl0SABre3GkRqYAkPFxrozupeUD/
 C0Kl23FvRQDj2mbYpI5epqwjp7q7w2+ceYoT9pbL5q3IVMZkhSWN6DWnQY5bRP3bMObM
 Z9v9Ib4XajjGbWGwxy3vbGNrja9s3KfsHJ5pD3W/ZiZRaFmJF8W/Q0S+qOLV3uWvbyg4
 8GNA==
X-Gm-Message-State: AOAM532RgPq8TfLVSt8OUQ2+ODPS8Bmus8RTFHP+6/bmY1CXZ36MnWV+
 XNDUZBrpBfpCLKSadDqVuauw3luSLNc=
X-Google-Smtp-Source: ABdhPJxRm7XHVx1P3cyQ7bCkpFC0DKcovpU2t57fuHwq4H8UmJ0y/9Pv8DlX0xMfvOpXVjAQWWIjc5eSwb8=
X-Received: from corumba.svl.corp.google.com
 ([2620:15c:2a3:200:fc2b:9e42:37f:dcc3])
 (user=crauer job=sendgmr) by 2002:a05:6902:154e:: with SMTP id
 r14mr893755ybu.308.1631053961809; Tue, 07 Sep 2021 15:32:41 -0700 (PDT)
Date: Tue,  7 Sep 2021 15:32:34 -0700
Message-Id: <20210907223234.1165705-1-crauer@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v2] hw/arm: Add support for kudo-bmc board.
From: Chris Rauer <crauer@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ieg3YQYKCkoo3m6q3s00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--crauer.bounces.google.com;
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

kudo-bmc is a board supported by OpenBMC.
https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo

Since v1:
- hyphenated Cortex-A9

Tested: Booted kudo firmware.
Signed-off-by: Chris Rauer <crauer@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 69f57c2886..adf497e679 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -20,6 +20,7 @@ Hyperscale applications. The following machines are based on this chip :
 
 - ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
+- ``kudo-bmc``          Fii USA Kudo server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index e5a3243995..a656169f61 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -31,6 +31,7 @@
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
+#define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -357,6 +358,23 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void kudo_bmc_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, KUDO_BMC_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -417,6 +435,18 @@ static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
 }
 
+static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Kudo BMC (Cortex-A9)";
+    mc->init = kudo_bmc_init;
+    mc->default_ram_size = 1 * GiB;
+};
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -437,6 +467,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gbs_bmc_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("kudo-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = kudo_bmc_machine_class_init,
     },
 };
 
-- 
2.33.0.153.gba50c8fa24-goog


