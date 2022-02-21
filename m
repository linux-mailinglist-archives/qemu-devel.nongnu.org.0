Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF894BD8F1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:10:41 +0100 (CET)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5eS-0006G0-5m
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:10:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zo-0000Du-Dv
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:43 -0500
Received: from [2a00:1450:4864:20::42a] (port=38508
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013R-7m
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d27so25926427wrb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NofIEc0Y2hiRFl6rcfetddRUollXOWZIliDCYgCWghU=;
 b=TQ5e8hjGjYN+a3CxhQVMevyBZUQ2jJSjexn9ArTPLrFlvMrP7vpow94Ln6AWJnupDZ
 CU4YWi/5fMoFORPL8sSt8sV1t5+aqUBWNFL8vhyv7+S3cYzk+wJGdDHa1abModGhQmvR
 t7y4DbQu4E+1x5x9m8SnawB2takGC8SEEO8eYQ/HxrKiwLj1Pbd5g//am+LCzXK1alyt
 R71n3fknwa0nWdwu3KrkmlceOfBbO0IlMXVFvOyeevTSRAsl3rOJ2nIsmFjullaAD5tp
 1umTr94yG5rHdHsE1qCg3bTmtNXH2rbbk6raBXtw2/VLsnOv/N8dACSfVMrbN+8HKtY6
 8H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NofIEc0Y2hiRFl6rcfetddRUollXOWZIliDCYgCWghU=;
 b=GEkiPBiIdTcxT3L7qSW5LyYv4Lv4qKLEChRl2AumJVZgwuqZDKO4ogJBLc0JdqoX1L
 o5f0eYJtPAzRysiQ04GMcrslTB5SneX4L9dHjzEHtlVKOl+5IqKw0raai6ZRIh6+Wp7z
 ZBlfRD2cL3OVdGe9YZsAysBSfuIB8FIkdjSCEcq2k6qX6dLjAhlnL5UmktTbdMi3+5y6
 bLY/c/91NcIko7zTlZCquI5EAwynCozKgPRxc4rfZDhOIzXh78N8Np0v1pA9R1rUwZSW
 p1GoObZbIv+J3scKxwYg+IkiW6C6h3sLSBMxoUNk6qyVzBuIkGNy8Yb22LKMBhscdMu/
 70xQ==
X-Gm-Message-State: AOAM533V5yf8NeM7+gb0d9kuNdM9qsiKulU2M+2G8JDdIeA6+uW/icaW
 EYlnDupA1YdHghZRwb9s2oZaV7T8JKkmyA==
X-Google-Smtp-Source: ABdhPJwCY8yPU4vv9aplIeuPfTKtNGeXm8QK7kBAXiS4ggd6SZAZ1xfcFSgyBJprTD458H8kGnZZaw==
X-Received: by 2002:a5d:65c4:0:b0:1e3:ed0:a6df with SMTP id
 e4-20020a5d65c4000000b001e30ed0a6dfmr14808103wrw.3.1645435700953; 
 Mon, 21 Feb 2022 01:28:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] hw/arm: add initial mori-bmc board
Date: Mon, 21 Feb 2022 09:27:57 +0000
Message-Id: <20220221092800.404870-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Patrick Venture <venture@google.com>

This is the BMC attached to the OpenBMC Mori board.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Ilkyun Choi <ikchoi@google.com>
Message-id: 20220208233104.284425-1-venture@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx_boards.c     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index adf497e6791..ef2792076aa 100644
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
index d701e5cc55a..0678a56156f 100644
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
2.25.1


