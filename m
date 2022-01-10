Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA9489EF3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:16:40 +0100 (CET)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6zDj-0007qQ-1J
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QHPcYQcKCq0iRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com>)
 id 1n6z0k-0005IF-Ic
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:03:14 -0500
Received: from [2607:f8b0:4864:20::c49] (port=46769
 helo=mail-oo1-xc49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QHPcYQcKCq0iRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com>)
 id 1n6z0i-0007mB-Vs
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:03:14 -0500
Received: by mail-oo1-xc49.google.com with SMTP id
 g2-20020a4a9242000000b002da7c459222so8957778ooh.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8sehJV55Mhq/TPsYPXorz5tVLGfqSkJ2ByLy2U/Tw1Q=;
 b=SFkw/5Z2vC1ffd1HB4a/RV1FZYWyvmLswDcSOnyeSm+t6SH2cmk0N39Xg8zJnn4r3H
 5cMdNTSqn/4lxatjy2FGyNLxm5DqqRW0/oKJGgtLwaunWv9Ig/LCMZA0XG/tvpWvIwlc
 uLTFRQMrQv7EWpWaJPu3dfbrcD+pVdkdUEljYhDaCwCYyiSRBQQRgUg7bOE2mMerIU1G
 Kjj5a1ELkaH5NuCWka1ANPgkN4fe8CQ8seLiDk0la9rXOetl5MWk9Ovr3lVzAiR5e5UM
 ub0fPjwzOQGHvAhqXiZ6mKyltDYTeBVOHunvIVBubBsqKwTcWVWnt5EP2Su8lFIaht3N
 74BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8sehJV55Mhq/TPsYPXorz5tVLGfqSkJ2ByLy2U/Tw1Q=;
 b=btlkolKl7U23LYnj1YXyfIaAyUalEZuo6GaFVhdOuDz55R9GS+5rxYOAUogcRa1pHO
 wokyoBSHagVzgIplcKY8QI1bAQIxe96BYXHD3YdUzEHWd0MtplOfLJ4RO5uiZmE2hrzK
 LvnWXES7fReJDKaBkai760ixd3Gn04UKWbIe3jhUBeKcS7S0WuJyDpJFUpz0A76NKa7C
 pOwG+C+NYpgG8ui4QVzRUZY1k36Kc1mGMBLs7JOD0UXEUhZYDZyjTuxtvF7LwdCyJaHE
 OyhU3rED0ZjOruM7AeDgu+9AuU9U56hC/iYmPJ+wfnCgy4ntr4nu3AnuE27usolvHESL
 F10w==
X-Gm-Message-State: AOAM5305nOzqFatCrtBlt7pfIxRpDrc9iHELWtUZocLSyclMQlAdBwfv
 jK9IWFuOIYCrfdu3dhzS/TphkVdV3D1w
X-Google-Smtp-Source: ABdhPJzTL5b5BuPoUVGgyyWpPzTNFac2VLY7uxdkm17vbZt6Hgh+kMZryxeTnutKVfMtv7NEM2IhdXtocifX
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:abcf:: with SMTP id
 v73mr927324ybi.459.1641837376196; Mon, 10 Jan 2022 09:56:16 -0800 (PST)
Date: Mon, 10 Jan 2022 09:56:07 -0800
In-Reply-To: <20220110175607.591401-1-venture@google.com>
Message-Id: <20220110175607.591401-3-venture@google.com>
Mime-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 2/2] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c49;
 envelope-from=3QHPcYQcKCq0iRagheRTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--venture.bounces.google.com;
 helo=mail-oo1-xc49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst |  1 +
 hw/arm/npcm7xx.c            | 15 ++++++++++++++-
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index adf497e679..706c6f61c1 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -48,6 +48,7 @@ Supported devices
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
  * Tachometer
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 878c2208e0..ef8c9129ca 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -53,6 +53,9 @@
 /* ADC Module */
 #define NPCM7XX_ADC_BA          (0xf000c000)
 
+/* PCI Mailbox Module */
+#define NPCM7XX_PCI_MBOX_BA     (0xf0848000)
+
 /* Internal AHB SRAM */
 #define NPCM7XX_RAM3_BA         (0xc0008000)
 #define NPCM7XX_RAM3_SZ         (4 * KiB)
@@ -83,6 +86,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_PCI_MBOX_IRQ        = 8,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
@@ -447,6 +451,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
@@ -697,6 +703,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /* PCI Mailbox. Cannot fail */
+    sysbus_realize(SYS_BUS_DEVICE(&s->pci_mbox), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 0, NPCM7XX_PCI_MBOX_BA);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 1,
+        NPCM7XX_PCI_MBOX_BA + NPCM7XX_PCI_MBOX_RAM_SIZE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pci_mbox), 0,
+                       npcm7xx_irq(s, NPCM7XX_PCI_MBOX_IRQ));
+
     /* RAM2 (SRAM) */
     memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
                            NPCM7XX_RAM2_SZ, &error_abort);
@@ -747,7 +761,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sha",          0xf085a000,   4 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index ce593235d9..0bc27a28d6 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -26,6 +26,7 @@
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
+#include "hw/misc/npcm7xx_pci_mbox.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
@@ -104,6 +105,7 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
 } NPCM7xxState;
 
-- 
2.34.1.575.g55b058a8bb-goog


