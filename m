Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04713FF3BB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 21:02:50 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLrz7-0002o9-JB
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 15:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LhUxYQYKCi0LaJdNaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--crauer.bounces.google.com>)
 id 1mLrH9-0003o2-Cj
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 14:17:23 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:48720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LhUxYQYKCi0LaJdNaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--crauer.bounces.google.com>)
 id 1mLrH7-0006oc-L5
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 14:17:23 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 131-20020a251489000000b0059bdeb10a84so3589577ybu.15
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=IifeVj0x5s3FD5lYsHnRcERM60TJI4LyuUoaF7MmBt8=;
 b=cPFuQpQYC529a0tZBaKy2lFQwUk9WXQ/2/GJaQt7JLEDw0a8xMCOXlEpjC/dmXEbIW
 HIRKDNeaNPVEGpkW50LaJxxCF1Sg4mpFL7dg3u8x+j1nN6/9scWyYm/yGEzNdOHbiVRB
 59ERNg0zHJ31bUMzEJ8JoIoRewHkQ2zefnAVpGf6t2WV6Psjj9L9rx7jBGIQz+dZjEnm
 bIED244bLXFSqDzfHbmNVEW0r+CLYvVSDKkez/OfDaBBwrZA1vsBE9wt0zxBbNYcBlAJ
 +R5VuyOuaDJVQmpjYghVOJ6cwjn8XkRSnqt7Bs5Y9q6WFcASQASbZnd9PjgQJBCX34pZ
 9KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=IifeVj0x5s3FD5lYsHnRcERM60TJI4LyuUoaF7MmBt8=;
 b=Nf6wpefvx8/SNrSj0BsyRTulsWdKyRLr2g4yznE942p9zj04p/eIm8c5deve8KNMX6
 FPbqjRNa5n3tDJEVAq4J3hdI76QN4DBSKvle2+HH9ppWc+paxAur1lQGrw34xYjyPFuo
 Kt4/FsTF7mbPVHFX645XG4/KBXYB2GiyrHzV9jFC9QL3SL5bWb+jHw7nSfgWAHLtdSQr
 zlatSWnJfgCzzo+jLvXxozQEzzkosd+u4eJpwpzpDUwqjidMkuy9ZxPbpEeZMzpsg4gD
 2KgtXY77NPQXdhDED14qaFbbc+N6CyA1QLRZVndFV/2KwhlVsZNNwXlutcMUYpoqhP18
 5ayg==
X-Gm-Message-State: AOAM532gkxLriUTQjyz9wSuTNxdN38IhDBUdnYuGn6PxDQI6DndnXXMT
 EI0lT+TmiGhu9kuRziE3crLAZHKXML8=
X-Google-Smtp-Source: ABdhPJxY3ggxamkATlGanAKpijTkRLrOamH9XX2R6qf358PlGhZHjiQIs7Yzx4e4sobamSIs2WUAEXTViTQ=
X-Received: from corumba.svl.corp.google.com
 ([2620:15c:2a3:200:b6aa:448:925a:1d1a])
 (user=crauer job=sendgmr) by 2002:a25:af87:: with SMTP id
 g7mr6209593ybh.256.1630606638735; 
 Thu, 02 Sep 2021 11:17:18 -0700 (PDT)
Date: Thu,  2 Sep 2021 11:16:42 -0700
Message-Id: <20210902181642.315792-1-crauer@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH] hw/arm: Add support for kudo-bmc board.
From: Chris Rauer <crauer@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, hskinnemoen@google.com, 
 kfting@nuvoton.com, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3LhUxYQYKCi0LaJdNaPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--crauer.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 14:59:56 -0400
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
index e5a3243995..c80f442adb 100644
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
+    mc->desc = "Kudo BMC (Cortex A9)";
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


