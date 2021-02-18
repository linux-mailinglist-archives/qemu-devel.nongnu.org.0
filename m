Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567E831F1BA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:30:42 +0100 (CET)
Received: from localhost ([::1]:45984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqsj-0004sa-DQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LtsuYAMKCqcKQLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--dje.bounces.google.com>)
 id 1lCqnT-0001f4-Fo
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:25:15 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:47333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LtsuYAMKCqcKQLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--dje.bounces.google.com>)
 id 1lCqnP-0000uw-Bp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:25:15 -0500
Received: by mail-pl1-x649.google.com with SMTP id s5so1883189plg.14
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=H58/1hUHI8lPRM6ROvzi95JYnmk1gck8I5aDFK5cZ18=;
 b=jXjHICOdJjLHiaVl799TY2MwOaLNbjy9EEtdBytRlR92nyrAntjbJBJkZmvlJZ6HvF
 V8G2MtmtxWVB9/WrsG5oRCAcWuS5q3CBV01AXMyxsGcuyEe4dc2xcFOdGir/vozo9q0w
 hD3uCXKd3z3GmFQtXG0snykonkjXaedM/htKJtuYgCsuwhjwB1Aw8FUKFmDR12K/7LTj
 XugA2bGSlau/KDLFRcSVhrPZ34NuKiBVCfvw511DQww9KKnbKQdmSOno5tV4bdgSjSHn
 50FtXvo4yoQDyU+FJiwuUjPbzjM7PV3ZOHnRqsv4xQYUg8tQOloWTb8WZO9jWV9nlEu2
 W3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=H58/1hUHI8lPRM6ROvzi95JYnmk1gck8I5aDFK5cZ18=;
 b=myCGN2qvoZFkQ9lhUmPDM1AEWjEzHZW2zV2AX9viyfYJOXVD7fNLtanyIHirazLWiZ
 l5uv23+LBZkzyrmTYStw2dIFNPMnJoDKpxsiEiQS5jm569MDfi+6jgs5uvRWduKoVm73
 8wJ+IW+W8D1UsNJGc7Yrj1gNzpEv7V5RP7MCntSYiyYxA0jmW7Vr+/WbYMaClENKLNrF
 12uog0UcMj4RLPDl7q7bq9vSKZ01DYqkie399hbSpDjFfgUyLTCALYUkdOP/XoZqbGNP
 WG49c29M0FX+JLusNSRk+w12oNHjSx3VLovpoQnvRS9NuTjaSrv59L3b2Urk+EEN1lec
 fEEg==
X-Gm-Message-State: AOAM5327UWLOrAFzbxosF0kad0Y9Gw0DwzuXIKDnqaa5J2bg3iK2f+g7
 6ISr8h3ZNRPOqz1OZwflGiQWKUp6i2X4jjP7Pq3hYKuWtfZ9Gt2umFwuT/+zEv4qR2qJAFnVgh4
 MU2AY8cR6HaIBk/ruH89wBLoTrQDnIcP9OSBqzpBk8/zdX42rPzcL
X-Google-Smtp-Source: ABdhPJzNO+akajsJPxXY47l6zzu3Qd31btTZJzpTxV9U7wO9ZHnDcdFUrPYTrHnZS+rwtGDMYcwMuUw=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a17:90a:3f8d:: with SMTP id
 m13mr5846098pjc.215.1613683502274; Thu, 18 Feb 2021 13:25:02 -0800 (PST)
Date: Thu, 18 Feb 2021 13:24:52 -0800
In-Reply-To: <20210218212453.831406-1-dje@google.com>
Message-Id: <20210218212453.831406-3-dje@google.com>
Mime-Version: 1.0
References: <20210218212453.831406-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 2/3] hw/arm: Add npcm7xx emc model
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3LtsuYAMKCqcKQLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--dje.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Doug Evans <dje@google.com>
---

Differences from v4:
- no change

Differences from v3:
- no change

Differences from v2:
- none, patch ok as is

 docs/system/arm/nuvoton.rst |  3 ++-
 hw/arm/npcm7xx.c            | 50 +++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 34fc799b2d..f9fb9224da 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -44,6 +44,7 @@ Supported devices
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
  * SMBus controller (SMBF)
+ * Ethernet controller (EMC)
 
 Missing devices
 ---------------
@@ -57,7 +58,7 @@ Missing devices
    * Shared memory (SHM)
    * eSPI slave interface
 
- * Ethernet controllers (GMAC and EMC)
+ * Ethernet controller (GMAC)
  * USB device (USBD)
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index f8950f9470..9bd1e83f02 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -82,6 +82,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_EMC1RX_IRQ          = 15,
+    NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -120,6 +122,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_EMC2RX_IRQ          = 114,
+    NPCM7XX_EMC2TX_IRQ,
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -188,6 +192,12 @@ static const hwaddr npcm7xx_smbus_addr[] = {
     0xf008f000,
 };
 
+/* Register base address for each EMC Module */
+static const hwaddr npcm7xx_emc_addr[] = {
+    0xf0825000,
+    0xf0826000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -406,6 +416,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
+        object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -589,6 +603,40 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
     }
 
+    /*
+     * EMC Modules. Cannot fail.
+     * The mapping of the device to its netdev backend works as follows:
+     * emc[i] = nd_table[i]
+     * This works around the inability to specify the netdev property for the
+     * emc device: it's not pluggable and thus the -device option can't be
+     * used.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_emc_addr) != ARRAY_SIZE(s->emc));
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->emc) != 2);
+    for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
+        s->emc[i].emc_num = i;
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->emc[i]);
+        if (nd_table[i].used) {
+            qemu_check_nic_model(&nd_table[i], TYPE_NPCM7XX_EMC);
+            qdev_set_nic_properties(DEVICE(sbd), &nd_table[i]);
+        }
+        /*
+         * The device exists regardless of whether it's connected to a QEMU
+         * netdev backend. So always instantiate it even if there is no
+         * backend.
+         */
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_emc_addr[i]);
+        int tx_irq = i == 0 ? NPCM7XX_EMC1TX_IRQ : NPCM7XX_EMC2TX_IRQ;
+        int rx_irq = i == 0 ? NPCM7XX_EMC1RX_IRQ : NPCM7XX_EMC2RX_IRQ;
+        /*
+         * N.B. The values for the second argument sysbus_connect_irq are
+         * chosen to match the registration order in npcm7xx_emc_realize.
+         */
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, tx_irq));
+        sysbus_connect_irq(sbd, 1, npcm7xx_irq(s, rx_irq));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -649,8 +697,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.emc1",         0xf0825000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.emc2",         0xf0826000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[0]",      0xf0830000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[1]",      0xf0831000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[2]",      0xf0832000,   4 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index cea1bd1f62..d32849a456 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -26,6 +26,7 @@
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
+#include "hw/net/npcm7xx_emc.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -90,6 +91,7 @@ typedef struct NPCM7xxState {
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
+    NPCM7xxEMCState     emc[2];
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
-- 
2.30.0.617.g56c4b15f3c-goog


