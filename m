Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B768CA9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:36:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPB1D-0000g7-SR; Mon, 06 Feb 2023 18:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3kI7hYwgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0e-0000N4-Cl
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:56 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3kI7hYwgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1pPB0W-0006GW-1j
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:34:48 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 jw1-20020a170903278100b00199292fdbe0so751663plb.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0BCzLce21K9mc/aCDcKh55LLs04zCBy5vm60f0Sem2M=;
 b=GsaAIoPaKSyacHvS26ZOoTfoyaNd6Yp0pZCi3w1r2iw9l//90TH4AE9wg9cgvO8Ee2
 DM7U6dhcBFRk/N3j2RS/IzTlum038AngQus70/TkVHr+FwqnUbroWBdMYYTLkYMsqgQB
 1cYyXCTks+d+4PWgWwZE0HaDH2ZZcD55X+fye6CDPfp2jsTazu8gdQznorcLimGdR09Y
 0VkYBt7j7lXuN2vzAN2Ho6sACxa0MnmuwCi3MEN/WLrsfG8w88VcHuYpqksdxHPlfJiN
 71K61gawLpZE5QMSlJ11JxyVEmMjUDoMV8hdKI6XR00VvQwvIFLFZFCsuB4MVy9eL2nm
 Q+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0BCzLce21K9mc/aCDcKh55LLs04zCBy5vm60f0Sem2M=;
 b=NCb+YFJ9cdMJhq/AJCdNiyxxV70RRXVJNRDUc29iMdZ20CO6YTmz8yNB5rK91fXecU
 XRB0nf028FQMsJ5aFV6rkMnEYK/p/RYWZZDNsSFSKPJ240fiByEyjlJ4zUloctJoc5Lx
 0V1f61BbHxFgEBHCm9bRppxIPgyv8BKG5Wy5tvbz64nQVnvCheVSqnf/8xcVyx4Titdu
 ebzw6PMUghl8dUgp6lS5u9vQTXKgj9O7mosP1Grzcld9eUUzk1WUMiJxFohZH+5TeynS
 z6mrnzKYOmAw8syrg+NpSmFwhianWlvWtyRB11s77oZCJJBQl+WiHkMU8/nbppWfxSON
 umxQ==
X-Gm-Message-State: AO0yUKWOtY2hIFy1tcvcC9QuSuT5XvUkiw9bvr6MSvE31FNVK6vHB8LJ
 uNx09Na14kNRyrI6uAl8aL2doUtQ1SuGOg==
X-Google-Smtp-Source: AK7set8UymnC6JWq5b0DlpWdN7K0pZqxgCIJ7TKwSevAHqg8XYrQSnJUzm7fbFtGie88w9StJHMHMm3QHh87nw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:32ce:b0:198:b624:f4c2 with SMTP
 id i14-20020a17090332ce00b00198b624f4c2mr177167plr.6.1675726480884; Mon, 06
 Feb 2023 15:34:40 -0800 (PST)
Date: Mon,  6 Feb 2023 15:34:28 -0800
In-Reply-To: <20230206233428.2772669-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230206233428.2772669-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230206233428.2772669-4-wuhaotsh@google.com>
Subject: [PATCH 3/3] hw/arm: Attach PSPI module to NPCM7XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3kI7hYwgKClkNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 docs/system/arm/nuvoton.rst |  2 +-
 hw/arm/npcm7xx.c            | 25 +++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index c38df32bde..0424cae4b0 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -49,6 +49,7 @@ Supported devices
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
  * Tachometer
+ * Peripheral SPI controller (PSPI)
 
 Missing devices
 ---------------
@@ -64,7 +65,6 @@ Missing devices
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
- * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
  * PCI and PCIe root complex and bridges
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..15ff21d047 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -86,6 +86,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
+    NPCM7XX_PSPI2_IRQ           = 28,
+    NPCM7XX_PSPI1_IRQ           = 31,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -220,6 +222,12 @@ static const hwaddr npcm7xx_emc_addr[] = {
     0xf0826000,
 };
 
+/* Register base address for each PSPI Module */
+static const hwaddr npcm7xx_pspi_addr[] = {
+    0xf0200000,
+    0xf0201000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -444,6 +452,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
+    }
+
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -715,6 +727,17 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
             npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
 
+    /* PSPI */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pspi_addr) != ARRAY_SIZE(s->pspi));
+    for (i = 0; i < ARRAY_SIZE(s->pspi); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pspi[i]);
+        int irq = (i == 0) ? NPCM7XX_PSPI1_IRQ : NPCM7XX_PSPI2_IRQ;
+
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_pspi_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
+    }
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -724,8 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
     create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f1b7e4a48d..72c7722096 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -32,6 +32,7 @@
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
+#include "hw/ssi/npcm_pspi.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
@@ -104,6 +105,7 @@ struct NPCM7xxState {
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
     NPCM7xxSDHCIState   mmc;
+    NPCMPSPIState       pspi[2];
 };
 
 #define TYPE_NPCM7XX    "npcm7xx"
-- 
2.39.1.519.gcb327c4b5f-goog


