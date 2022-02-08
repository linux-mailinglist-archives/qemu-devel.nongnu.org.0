Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2014AE58D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:42:20 +0100 (CET)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHa7m-0003Pq-NX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nHa3a-0001f6-0d
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:37:58 -0500
Received: from [2607:f8b0:4864:20::949] (port=51182
 helo=mail-ua1-x949.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com>)
 id 1nHa3X-00086e-RI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:37:57 -0500
Received: by mail-ua1-x949.google.com with SMTP id
 z38-20020ab04929000000b0030ef21ee1eeso322090uac.17
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rK/X0bkQ4s37Ql0JYzqatnON1TQgvTtbmnB4wZFOFxU=;
 b=Zv/6xB4F4yX075B1Kcmj8dj0JPG1WGiYb/s7O1CU0Tk3QovhsdEXI5sIw+5gplClx0
 8745uWkQ8RqdMxBJjz2uma9h3bh/iHwLBA4qJZkbeNmNKHiAWTgFN0RPTGHrz9hpYGy5
 pVdr61ToZbPLH6mhuC7rP81fHvhOlltcrO6h3q2lz9athtu+X7igPoYzhD/ZvYrBYFky
 r9NI0tK8h/X7Kp1ZyEW9sOKDE4gWdcUsUKRm4oLXb78O7bfwNxfd4xcauIGs696ngQAZ
 o3w/ozuoVaawQjoJIxJXcHqfQdk9A6f8412M5OcZqHm25PxoZJdAshNAok7a6Im+tosc
 DglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rK/X0bkQ4s37Ql0JYzqatnON1TQgvTtbmnB4wZFOFxU=;
 b=bZ2wv6c+PjmMXMB8qfBYXkhXm9/N6kjnk+qG0h7vtc4ojJbYjo03By7LW4Xqw8b9LW
 shRBo4QBX8yBywQdOc9kxuBpZBHU95SqlfOJOTEk7+O6FZx3kb3QeohfLDCQI5JGrvGm
 6eKSGQwAwYabKJ77mJNTSOS3GfI6MXQCEDoBH/IljJjt+GogLKPaoEYSW4x1PKq2CKxj
 KoSJJQIpTY6CQY0+aPVbCznLEaiywa6ggKU2t5jIQ7AHxkQ+KFkN2dFH6Lg0YdC621/v
 VVMPvSEWlrFxNEI4jvyv9o29syK+dTGf8+N7QqJQOzolFsHg9woWkOmxTejs8I3Ad/rT
 0T5g==
X-Gm-Message-State: AOAM533geVz15RIBzwbWaJBbHIjHRmCIwefuGgwJS+URTrsa9uhhcJ8I
 k4g3Jkjo2hDoYRjboPHtuAClYZWBceES
X-Google-Smtp-Source: ABdhPJzScRm6xrecI0v6hpk4R6HJxdpCyHRARXm0nIkX3RPGqwxalQrHnmVoYNzxS2rkbGibfynAkin7N6Qo
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:d062:ceeb:6333:edcf])
 (user=venture job=sendgmr) by 2002:a5b:84a:: with SMTP id
 v10mr7315301ybq.718.1644363068894; 
 Tue, 08 Feb 2022 15:31:08 -0800 (PST)
Date: Tue,  8 Feb 2022 15:31:04 -0800
Message-Id: <20220208233104.284425-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] hw/arm: add initial mori-bmc board
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Chris Rauer <crauer@google.com>,
 Ilkyun Choi <ikchoi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::949
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3PP0CYgcKClkM5EKLI57FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--venture.bounces.google.com;
 helo=mail-ua1-x949.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This is the BMC attached to the OpenBMC Mori board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Ilkyun Choi <ikchoi@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index adf497e679..ef2792076a 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -21,6 +21,7 @@ Hyperscale applications. The following machines are based on this chip :
 - ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
 - ``kudo-bmc``          Fii USA Kudo server BMC
+- ``mori-bmc``          Fii USA Mori server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d701e5cc55..0678a56156 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -34,6 +34,7 @@
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
 #define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff
 #define KUDO_BMC_POWER_ON_STRAPS 0x00001fff
+#define MORI_BMC_POWER_ON_STRAPS 0x00001fff
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -429,6 +430,21 @@ static void kudo_bmc_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void mori_bmc_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, MORI_BMC_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+    npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 3, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -501,6 +517,18 @@ static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
 };
 
+static void mori_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Mori BMC (Cortex-A9)";
+    mc->init = mori_bmc_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -525,6 +553,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("kudo-bmc"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = kudo_bmc_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("mori-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = mori_bmc_machine_class_init,
     },
 };
 
-- 
2.35.0.263.gb82422642f-goog


