Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58762FF97D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:33:58 +0100 (CET)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kOj-0006Pk-Bp
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IR0KYAMKCoorxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com>)
 id 1l2kNX-0005hX-Mt
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:32:43 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:36038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IR0KYAMKCoorxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com>)
 id 1l2kNR-0007Nm-K8
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:32:43 -0500
Received: by mail-pg1-x549.google.com with SMTP id 4so2304594pgm.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 16:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=lBKxYfTrDDsjZRcNZnZhrw3yJOfhsKwQ/juufr9ng9w=;
 b=KksaAgBk8q7S47o7C38EPpTArvyuVzc739TVDFshvhh55I0o/N7g0rhh+ngV7SKgaQ
 OO/EnhMICZlYNcG06QqtmxeWEyF0Er5uNS5kIppJj43T9tyV6lJvqqEqr6xDrfIfy3/g
 nxPOEmhXsJ28D95ub6jxplgELVJxxVB1OKO5PlEOGpiqNUANl87pj7kuuFmjAgJkco8W
 8YpOcpK21cz+Kwj/CjP+pbQanyw3oe+l/aQdDhzYn8pS+tcYdxq2aiqnmi3hF2+rGjH6
 csdmEjy7Ba0lEfaPqMUTLVMeKxAuy6lKlp3ykYj750bFBiDvV4EzbCZ/RtnsApa2h6RZ
 rGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=lBKxYfTrDDsjZRcNZnZhrw3yJOfhsKwQ/juufr9ng9w=;
 b=sYjFVs/ZR5s+hxFcN1UJqucTT54tpwwOradsblPcyrl5wCfEfWZiVSDqvgsqWOJ6mS
 gfPNIETdXY0avaW441h7uJXOrSfwuzWu6dqGXaVgTLEFxnhyKohgUh7XTt9A8KDOIs7P
 ikR3jqsU5hXR5u/6je38kLcatyKsT0JIuFRIupifK6WL/A5WAuAuTWEtSZU5+r2sYIVJ
 3qg7Nn9Ee8xBlVrO9Y1xuOt2thKu3HuUV4t2Zx1YJibMXcbgMfki/Upcsh22aHzon3XU
 s/st2Hcxg+fQMkdaml8d77f0FHw2htCHjSBXx4IoNRUN7GVNqyixIBrKddx1gYkptCFQ
 aXEg==
X-Gm-Message-State: AOAM533LrTJidjNCwAnjaYOcG8QDBgACfhlXJENq4a/9auiXxRX95F2q
 j22tpP6qtURaBbCC5d1ew1PLcLRFB5SpIMnYaAvhgF/st0oUWa9Lj8TjF1zWOVxoC8TdSPWf5La
 CEEr8eo9H1FLQBFGwWcLefY/AKGqYTG9BcX0bR0lXtYPlPkLo1QSo
X-Google-Smtp-Source: ABdhPJyZ52D04C3GX2mj2KidVqkn9lmX8b+mJAcYjtEHo+UMRHCbO2tVFf0dRm96UxvAveekQ/Hsrj4=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a17:90a:f2c6:: with SMTP id
 gt6mr2249900pjb.35.1611275553708; Thu, 21 Jan 2021 16:32:33 -0800 (PST)
Date: Thu, 21 Jan 2021 16:32:26 -0800
Message-Id: <20210122003226.824488-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] hw/net: Add npcm7xx emc model
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3IR0KYAMKCoorxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com;
 helo=mail-pg1-x549.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 Avi Fishman <avi.fishman@nuvoton.com>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
Signed-off-by: Doug Evans <dje@google.com>
---
 docs/system/arm/nuvoton.rst    |   3 +-
 hw/arm/npcm7xx.c               |  50 +-
 hw/net/meson.build             |   1 +
 hw/net/npcm7xx_emc.c           | 852 +++++++++++++++++++++++++++++++++
 hw/net/trace-events            |  17 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/net/npcm7xx_emc.h   | 286 +++++++++++
 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_emc-test.c | 793 ++++++++++++++++++++++++++++++
 9 files changed, 2002 insertions(+), 3 deletions(-)
 create mode 100644 hw/net/npcm7xx_emc.c
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 tests/qtest/npcm7xx_emc-test.c

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index a1786342e2..c6e9a4c17e 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -43,6 +43,7 @@ Supported devices
  * GPIO controller
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
+ * Ethernet controller (EMC)
 
 Missing devices
 ---------------
@@ -56,7 +57,7 @@ Missing devices
    * Shared memory (SHM)
    * eSPI slave interface
 
- * Ethernet controllers (GMAC and EMC)
+ * Ethernet controller (GMAC)
  * USB device (USBD)
  * SMBus controller (SMBF)
  * Peripheral SPI controller (PSPI)
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d4079..94b79ff4c0 100644
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
@@ -104,6 +106,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_OHCI_IRQ            = 62,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_EMC2RX_IRQ          = 114,
+    NPCM7XX_EMC2TX_IRQ,
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -152,6 +156,12 @@ static const hwaddr npcm7xx_pwm_addr[] = {
     0xf0104000,
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
@@ -365,6 +375,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
+        object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -537,6 +551,40 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
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
@@ -621,8 +669,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.emc1",         0xf0825000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.emc2",         0xf0826000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[0]",      0xf0830000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[1]",      0xf0831000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[2]",      0xf0832000,   4 * KiB);
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 4a7051b54a..af0749c42b 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -35,6 +35,7 @@ softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
 softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
 softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
 softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
 softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
new file mode 100644
index 0000000000..d7da1387b3
--- /dev/null
+++ b/hw/net/npcm7xx_emc.c
@@ -0,0 +1,852 @@
+/*
+ * Nuvoton NPCM7xx EMC Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ *
+ * Unsupported/unimplemented features:
+ * - MCMDR.FDUP (full duplex) is ignored, half duplex is not supported
+ * - Only CAM0 is supported, CAM[1-15] are not
+ *   - writes to CAMEN.[1-15] are ignored, these bits always read as zeroes
+ * - MII is not implemented, MIIDA.BUSY and MIID always return zero
+ * - MCMDR.LBK is not implemented
+ * - MCMDR.{OPMOD,ENSQE,AEP,ARP} are not supported
+ * - H/W FIFOs are not supported, MCMDR.FFTCR is ignored
+ * - MGSTA.SQE is not supported
+ * - pause and control frames are not implemented
+ * - MGSTA.CCNT is not supported
+ * - MPCNT, DMARFS are not implemented
+ */
+
+#include "qemu/osdep.h"
+
+/* For crc32 */
+#include <zlib.h>
+
+#include "qemu-common.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/net/npcm7xx_emc.h"
+#include "net/eth.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+#include "sysemu/dma.h"
+#include "trace.h"
+
+#define CRC_LENGTH 4
+
+/*
+ * The maximum size of a (layer 2) ethernet frame as defined by 802.3.
+ * 1518 = 6(dest macaddr) + 6(src macaddr) + 2(proto) + 4(crc) + 1500(payload)
+ * This does not include an additional 4 for the vlan field (802.1q).
+ */
+#define MAX_ETH_FRAME_SIZE 1518
+
+static const char *emc_reg_name(int regno)
+{
+#define REG(name) case REG_ ## name: return #name;
+    switch (regno) {
+    REG(CAMCMR)
+    REG(CAMEN)
+    REG(TXDLSA)
+    REG(RXDLSA)
+    REG(MCMDR)
+    REG(MIID)
+    REG(MIIDA)
+    REG(FFTCR)
+    REG(TSDR)
+    REG(RSDR)
+    REG(DMARFC)
+    REG(MIEN)
+    REG(MISTA)
+    REG(MGSTA)
+    REG(MPCNT)
+    REG(MRPC)
+    REG(MRPCC)
+    REG(MREPC)
+    REG(DMARFS)
+    REG(CTXDSA)
+    REG(CTXBSA)
+    REG(CRXDSA)
+    REG(CRXBSA)
+    case REG_CAMM_BASE + 0: return "CAM0M";
+    case REG_CAML_BASE + 0: return "CAM0L";
+    case REG_CAMM_BASE + 2 ... REG_CAMML_LAST:
+        /* Only CAM0 is supported, fold the others into something simple. */
+        if (regno & 1) {
+            return "CAM<n>L";
+        } else {
+            return "CAM<n>M";
+        }
+    default: return "UNKNOWN";
+    }
+#undef REG
+}
+
+static void emc_reset(NPCM7xxEMCState *emc)
+{
+    trace_npcm7xx_emc_reset(emc->emc_num);
+
+    memset(&emc->regs[0], 0, sizeof(emc->regs));
+
+    /* These regs have non-zero reset values. */
+    emc->regs[REG_TXDLSA] = 0xfffffffc;
+    emc->regs[REG_RXDLSA] = 0xfffffffc;
+    emc->regs[REG_MIIDA] = 0x00900000;
+    emc->regs[REG_FFTCR] = 0x0101;
+    emc->regs[REG_DMARFC] = 0x0800;
+    emc->regs[REG_MPCNT] = 0x7fff;
+
+    emc->tx_active = false;
+    emc->rx_active = false;
+
+    qemu_set_irq(emc->tx_irq, 0);
+    qemu_set_irq(emc->rx_irq, 0);
+}
+
+static void npcm7xx_emc_reset(DeviceState *dev)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+    emc_reset(emc);
+}
+
+static void emc_soft_reset(NPCM7xxEMCState *emc)
+{
+    /*
+     * The docs say at least MCMDR.{LBK,OPMOD} bits are not changed during a
+     * soft reset, but does not go into further detail. For now, KISS.
+     */
+    uint32_t mcmdr = emc->regs[REG_MCMDR];
+    emc_reset(emc);
+    emc->regs[REG_MCMDR] =
+        mcmdr & (REG_MCMDR_LBK | REG_MCMDR_OPMOD);
+}
+
+static void emc_set_link(NetClientState *nc)
+{
+    /* Nothing to do yet. */
+}
+
+/* MISTA.TXINTR is the union of the individual bits with their enables. */
+static void emc_update_mista_txintr(NPCM7xxEMCState *emc)
+{
+    /* Only look at the bits we support. */
+    uint32_t mask = (REG_MISTA_TXBERR |
+                     REG_MISTA_TDU |
+                     REG_MISTA_TXCP);
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & mask) {
+        emc->regs[REG_MISTA] |= REG_MISTA_TXINTR;
+    } else {
+        emc->regs[REG_MISTA] &= ~REG_MISTA_TXINTR;
+    }
+}
+
+/* MISTA.RXINTR is the union of the individual bits with their enables. */
+static void emc_update_mista_rxintr(NPCM7xxEMCState *emc)
+{
+    /* Only look at the bits we support. */
+    uint32_t mask = (REG_MISTA_RXBERR |
+                     REG_MISTA_RDU |
+                     REG_MISTA_RXGD);
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & mask) {
+        emc->regs[REG_MISTA] |= REG_MISTA_RXINTR;
+    } else {
+        emc->regs[REG_MISTA] &= ~REG_MISTA_RXINTR;
+    }
+}
+
+/* N.B. emc_update_mista_txintr must have already been called. */
+static void emc_update_tx_irq(NPCM7xxEMCState *emc)
+{
+    int level = !!(emc->regs[REG_MISTA] &
+                   emc->regs[REG_MIEN] &
+                   REG_MISTA_TXINTR);
+    trace_npcm7xx_emc_update_tx_irq(level);
+    qemu_set_irq(emc->tx_irq, level);
+}
+
+/* N.B. emc_update_mista_rxintr must have already been called. */
+static void emc_update_rx_irq(NPCM7xxEMCState *emc)
+{
+    int level = !!(emc->regs[REG_MISTA] &
+                   emc->regs[REG_MIEN] &
+                   REG_MISTA_RXINTR);
+    trace_npcm7xx_emc_update_rx_irq(level);
+    qemu_set_irq(emc->rx_irq, level);
+}
+
+/* Update IRQ states due to changes in MIEN,MISTA. */
+static void emc_update_irq_from_reg_change(NPCM7xxEMCState *emc)
+{
+    emc_update_mista_txintr(emc);
+    emc_update_tx_irq(emc);
+
+    emc_update_mista_rxintr(emc);
+    emc_update_rx_irq(emc);
+}
+
+static int emc_read_tx_desc(dma_addr_t addr, NPCM7xxEMCTxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->flags = le32_to_cpu(desc->flags);
+    desc->txbsa = le32_to_cpu(desc->txbsa);
+    desc->status_and_length = le32_to_cpu(desc->status_and_length);
+    desc->ntxdsa = le32_to_cpu(desc->ntxdsa);
+    return 0;
+}
+
+static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *desc, dma_addr_t addr)
+{
+    NPCM7xxEMCTxDesc le_desc;
+
+    le_desc.flags = cpu_to_le32(desc->flags);
+    le_desc.txbsa = cpu_to_le32(desc->txbsa);
+    le_desc.status_and_length = cpu_to_le32(desc->status_and_length);
+    le_desc.ntxdsa = cpu_to_le32(desc->ntxdsa);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                         sizeof(le_desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    return 0;
+}
+
+static int emc_read_rx_desc(dma_addr_t addr, NPCM7xxEMCRxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->status_and_length = le32_to_cpu(desc->status_and_length);
+    desc->rxbsa = le32_to_cpu(desc->rxbsa);
+    desc->reserved = le32_to_cpu(desc->reserved);
+    desc->nrxdsa = le32_to_cpu(desc->nrxdsa);
+    return 0;
+}
+
+static int emc_write_rx_desc(const NPCM7xxEMCRxDesc *desc, dma_addr_t addr)
+{
+    NPCM7xxEMCRxDesc le_desc;
+
+    le_desc.status_and_length = cpu_to_le32(desc->status_and_length);
+    le_desc.rxbsa = cpu_to_le32(desc->rxbsa);
+    le_desc.reserved = cpu_to_le32(desc->reserved);
+    le_desc.nrxdsa = cpu_to_le32(desc->nrxdsa);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                         sizeof(le_desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    return 0;
+}
+
+static void emc_set_mista(NPCM7xxEMCState *emc, uint32_t flags)
+{
+    trace_npcm7xx_emc_set_mista(flags);
+    emc->regs[REG_MISTA] |= flags;
+    if (extract32(flags, 16, 16)) {
+        emc_update_mista_txintr(emc);
+    }
+    if (extract32(flags, 0, 16)) {
+        emc_update_mista_rxintr(emc);
+    }
+}
+
+static void emc_halt_tx(NPCM7xxEMCState *emc, uint32_t mista_flag)
+{
+    emc->tx_active = false;
+    emc_set_mista(emc, mista_flag);
+}
+
+static void emc_halt_rx(NPCM7xxEMCState *emc, uint32_t mista_flag)
+{
+    emc->rx_active = false;
+    emc_set_mista(emc, mista_flag);
+}
+
+static void emc_set_next_tx_descriptor(NPCM7xxEMCState *emc,
+                                       const NPCM7xxEMCTxDesc *tx_desc,
+                                       uint32_t desc_addr)
+{
+    /* Update the current descriptor, if only to reset the owner flag. */
+    if (emc_write_tx_desc(tx_desc, desc_addr)) {
+        /*
+         * We just read it so this shouldn't generally happen.
+         * Error already reported.
+         */
+        emc_set_mista(emc, REG_MISTA_TXBERR);
+    }
+    emc->regs[REG_CTXDSA] = TX_DESC_NTXDSA(tx_desc->ntxdsa);
+}
+
+static void emc_set_next_rx_descriptor(NPCM7xxEMCState *emc,
+                                       const NPCM7xxEMCRxDesc *rx_desc,
+                                       uint32_t desc_addr)
+{
+    /* Update the current descriptor, if only to reset the owner flag. */
+    if (emc_write_rx_desc(rx_desc, desc_addr)) {
+        /*
+         * We just read it so this shouldn't generally happen.
+         * Error already reported.
+         */
+        emc_set_mista(emc, REG_MISTA_RXBERR);
+    }
+    emc->regs[REG_CRXDSA] = RX_DESC_NRXDSA(rx_desc->nrxdsa);
+}
+
+static void emc_try_send_next_packet(NPCM7xxEMCState *emc)
+{
+    uint32_t desc_addr = TX_DESC_NTXDSA(emc->regs[REG_CTXDSA]);
+    NPCM7xxEMCTxDesc tx_desc;
+    if (emc_read_tx_desc(desc_addr, &tx_desc)) {
+        /* Error reading descriptor, already reported. */
+        emc_halt_tx(emc, REG_MISTA_TXBERR);
+        emc_update_tx_irq(emc);
+        return;
+    }
+
+    /* Nothing we can do if we don't own the descriptor. */
+    if (!(tx_desc.flags & TX_DESC_FLAG_OWNER_MASK)) {
+        trace_npcm7xx_emc_cpu_owned_desc(desc_addr);
+        emc_halt_tx(emc, REG_MISTA_TDU);
+        emc_update_tx_irq(emc);
+        return;
+     }
+
+    /* Give the descriptor back regardless of what happens. */
+    tx_desc.flags &= ~TX_DESC_FLAG_OWNER_MASK;
+    tx_desc.status_and_length &= 0xffff;
+
+    /* Working buffer for sending out packets. Most packets fit in this. */
+#define TX_BUFFER_SIZE 2048
+    uint8_t tx_send_buffer[TX_BUFFER_SIZE];
+
+    /*
+     * Despite the h/w documentation saying the tx buffer is word aligned,
+     * the linux driver does not word align the buffer. There is value in not
+     * aligning the buffer: See the description of NET_IP_ALIGN in linux
+     * kernel sources.
+     */
+    uint32_t next_buf_addr = tx_desc.txbsa;
+    emc->regs[REG_CTXBSA] = next_buf_addr;
+    uint32_t length = TX_DESC_PKT_LEN(tx_desc.status_and_length);
+    uint8_t *buf = &tx_send_buffer[0];
+    uint8_t *malloced_buf = NULL;
+
+    if (length > sizeof(tx_send_buffer)) {
+        malloced_buf = g_malloc(length);
+        buf = malloced_buf;
+    }
+
+    if (dma_memory_read(&address_space_memory, next_buf_addr, buf, length)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\n",
+                      __func__, next_buf_addr);
+        emc_set_mista(emc, REG_MISTA_TXBERR);
+        g_free(malloced_buf);
+        emc_set_next_tx_descriptor(emc, &tx_desc, desc_addr);
+        emc_update_tx_irq(emc);
+        trace_npcm7xx_emc_tx_done(emc->regs[REG_CTXDSA]);
+        return;
+    }
+
+    if ((tx_desc.flags & TX_DESC_FLAG_PADEN) && (length < MIN_PACKET_LENGTH)) {
+        memset(buf + length, 0, MIN_PACKET_LENGTH - length);
+        length = MIN_PACKET_LENGTH;
+    }
+
+    /* N.B. emc_receive can get called here. */
+    qemu_send_packet(qemu_get_queue(emc->nic), buf, length);
+    trace_npcm7xx_emc_sent_packet(length);
+    g_free(malloced_buf);
+    malloced_buf = buf = NULL;
+
+    tx_desc.status_and_length |= TX_DESC_STATUS_TXCP;
+    if (tx_desc.flags & TX_DESC_FLAG_INTEN) {
+        emc_set_mista(emc, REG_MISTA_TXCP);
+    }
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & REG_MISTA_TXINTR) {
+        tx_desc.status_and_length |= TX_DESC_STATUS_TXINTR;
+    }
+
+    emc_set_next_tx_descriptor(emc, &tx_desc, desc_addr);
+    emc_update_tx_irq(emc);
+    trace_npcm7xx_emc_tx_done(emc->regs[REG_CTXDSA]);
+}
+
+static bool emc_can_receive(NetClientState *nc)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(qemu_get_nic_opaque(nc));
+
+    bool can_receive = emc->rx_active;
+    trace_npcm7xx_emc_can_receive(can_receive);
+    return can_receive;
+}
+
+/* If result is false then *fail_reason contains the reason. */
+static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
+                                size_t len, const char **fail_reason)
+{
+    eth_pkt_types_e pkt_type = get_eth_packet_type(PKT_GET_ETH_HDR(buf));
+
+    switch (pkt_type) {
+    case ETH_PKT_BCAST:
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            return true;
+        } else {
+            *fail_reason = "Broadcast packet disabled";
+            return !!(emc->regs[REG_CAMCMR] & REG_CAMCMR_ABP);
+        }
+    case ETH_PKT_MCAST:
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            return true;
+        } else {
+            *fail_reason = "Multicast packet disabled";
+            return !!(emc->regs[REG_CAMCMR] & REG_CAMCMR_AMP);
+        }
+    case ETH_PKT_UCAST: {
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_AUP) {
+            return true;
+        }
+        bool matches = ((emc->regs[REG_CAMCMR] & REG_CAMCMR_ECMP) &&
+                        /* We only support one CAM register, CAM0. */
+                        (emc->regs[REG_CAMEN] & (1 << 0)) &&
+                        memcmp(buf, emc->conf.macaddr.a, ETH_ALEN) == 0);
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            *fail_reason = "MACADDR matched, comparison complemented";
+            return !matches;
+        } else {
+            *fail_reason = "MACADDR didn't match";
+            return matches;
+        }
+    }
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool emc_receive_filter(NPCM7xxEMCState *emc, const uint8_t *buf,
+                               size_t len)
+{
+    const char *fail_reason = NULL;
+    bool ok = emc_receive_filter1(emc, buf, len, &fail_reason);
+    if (!ok) {
+        trace_npcm7xx_emc_packet_filtered_out(fail_reason);
+    }
+    return ok;
+}
+
+static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(qemu_get_nic_opaque(nc));
+    const uint32_t len = len1;
+
+    trace_npcm7xx_emc_receiving_packet(len);
+
+    if (!emc_can_receive(nc)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unexpected packet\n", __func__);
+        return -1;
+    }
+
+    if (len < ETH_HLEN ||
+        /* Defensive programming: drop unsupportable large packets. */
+        len > 0xffff - CRC_LENGTH) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Dropped frame of %u bytes\n",
+                      __func__, len);
+        return len;
+    }
+
+    /*
+     * DENI is set if EMC received the Length/Type field of the incoming
+     * packet, so it will be set regardless of what happens next.
+     */
+    emc_set_mista(emc, REG_MISTA_DENI);
+
+    if (!emc_receive_filter(emc, buf, len)) {
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /* Huge frames (> DMARFC) are dropped. */
+    size_t max_frame_len = REG_DMARFC_RXMS(emc->regs[REG_DMARFC]);
+    if (len + CRC_LENGTH > max_frame_len) {
+        trace_npcm7xx_emc_packet_dropped(len);
+        emc_set_mista(emc, REG_MISTA_DFOI);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /*
+     * Long Frames (> MAX_ETH_FRAME_SIZE) are also dropped, unless MCMDR.ALP
+     * is set.
+     */
+    bool long_frame = false;
+    if (len + CRC_LENGTH > MAX_ETH_FRAME_SIZE) {
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_ALP) {
+            long_frame = true;
+        } else {
+            trace_npcm7xx_emc_packet_dropped(len);
+            emc_set_mista(emc, REG_MISTA_PTLE);
+            emc_update_rx_irq(emc);
+            return len;
+        }
+    }
+
+    uint32_t desc_addr = RX_DESC_NRXDSA(emc->regs[REG_CRXDSA]);
+    NPCM7xxEMCRxDesc rx_desc;
+    if (emc_read_rx_desc(desc_addr, &rx_desc)) {
+        /* Error reading descriptor, already reported. */
+        emc_halt_rx(emc, REG_MISTA_RXBERR);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /* Nothing we can do if we don't own the descriptor. */
+    if (!(rx_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK)) {
+        trace_npcm7xx_emc_cpu_owned_desc(desc_addr);
+        emc_halt_rx(emc, REG_MISTA_RDU);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    uint32_t crc = 0;
+    uint8_t *crc_ptr = (uint8_t *) &crc;
+    if (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC)) {
+        crc = cpu_to_be32(crc32(~0, buf, len));
+    }
+
+    /* Give the descriptor back regardless of what happens. */
+    rx_desc.status_and_length &= ~RX_DESC_STATUS_OWNER_MASK;
+
+    uint32_t buf_addr = rx_desc.rxbsa;
+    emc->regs[REG_CRXBSA] = buf_addr;
+    if (dma_memory_write(&address_space_memory, buf_addr, buf, len) ||
+        (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC) &&
+         dma_memory_write(&address_space_memory, buf_addr + len, crc_ptr,
+                          4))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bus error writing packet\n",
+                      __func__);
+        emc_set_mista(emc, REG_MISTA_RXBERR);
+        emc_set_next_rx_descriptor(emc, &rx_desc, desc_addr);
+        emc_update_rx_irq(emc);
+        trace_npcm7xx_emc_rx_done(emc->regs[REG_CRXDSA]);
+        return len;
+    }
+
+    trace_npcm7xx_emc_received_packet(len);
+
+    /* Note: We've already verified len+4 <= 0xffff. */
+    rx_desc.status_and_length = len;
+    if (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC)) {
+        rx_desc.status_and_length += 4;
+    }
+    rx_desc.status_and_length |= RX_DESC_STATUS_RXGD;
+    emc_set_mista(emc, REG_MISTA_RXGD);
+
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & REG_MISTA_RXINTR) {
+        rx_desc.status_and_length |= RX_DESC_STATUS_RXINTR;
+    }
+    if (long_frame) {
+        rx_desc.status_and_length |= RX_DESC_STATUS_PTLE;
+    }
+
+    emc_set_next_rx_descriptor(emc, &rx_desc, desc_addr);
+    emc_update_rx_irq(emc);
+    trace_npcm7xx_emc_rx_done(emc->regs[REG_CRXDSA]);
+    return len;
+}
+
+static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
+{
+    if (emc_can_receive(qemu_get_queue(emc->nic))) {
+        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
+    }
+}
+
+static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxEMCState *emc = opaque;
+    uint32_t reg = offset / sizeof(uint32_t);
+
+    if (reg >= NPCM7XX_NUM_EMC_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    uint32_t result;
+
+    switch (reg) {
+    case REG_MIID:
+        /*
+         * We don't implement MII. For determinism, always return zero as
+         * writes record the last value written for debugging purposes.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Read of MIID, returning 0\n", __func__);
+        result = 0;
+        break;
+    case REG_TSDR:
+    case REG_RSDR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only reg, %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        return 0;
+    default:
+        result = emc->regs[reg];
+        break;
+    }
+
+    trace_npcm7xx_emc_reg_read(emc->emc_num, result, emc_reg_name(reg), reg);
+    return result;
+}
+
+static void npcm7xx_emc_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    NPCM7xxEMCState *emc = opaque;
+    uint32_t reg = offset / sizeof(uint32_t);
+    uint32_t value = v;
+
+    g_assert(size == sizeof(uint32_t));
+
+    if (reg >= NPCM7XX_NUM_EMC_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    trace_npcm7xx_emc_reg_write(emc->emc_num, emc_reg_name(reg), reg, value);
+
+    switch (reg) {
+    case REG_CAMCMR:
+        emc->regs[reg] = value;
+        break;
+    case REG_CAMEN:
+        /* Only CAM0 is supported, don't pretend otherwise. */
+        if (value & ~1) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Only CAM0 is supported, cannot enable others"
+                          ": 0x%x\n",
+                          __func__, value);
+        }
+        emc->regs[reg] = value & 1;
+        break;
+    case REG_CAMM_BASE + 0:
+        emc->regs[reg] = value;
+        emc->conf.macaddr.a[0] = value >> 24;
+        emc->conf.macaddr.a[1] = value >> 16;
+        emc->conf.macaddr.a[2] = value >> 8;
+        emc->conf.macaddr.a[3] = value >> 0;
+        break;
+    case REG_CAML_BASE + 0:
+        emc->regs[reg] = value;
+        emc->conf.macaddr.a[4] = value >> 24;
+        emc->conf.macaddr.a[5] = value >> 16;
+        break;
+    case REG_MCMDR: {
+        if (value & REG_MCMDR_SWR) {
+            emc_soft_reset(emc);
+            /* On h/w the reset happens over multiple cycles. For now KISS. */
+            break;
+        }
+        uint32_t prev = emc->regs[reg];
+        emc->regs[reg] = value;
+        /* Update tx state. */
+        if (!(prev & REG_MCMDR_TXON) &&
+            (value & REG_MCMDR_TXON)) {
+            emc->regs[REG_CTXDSA] = emc->regs[REG_TXDLSA];
+            /*
+             * Linux kernel turns TX on with CPU still holding descriptor,
+             * which suggests we should wait for a write to TSDR before trying
+             * to send a packet: so we don't send one here.
+             */
+        } else if ((prev & REG_MCMDR_TXON) &&
+                   !(value & REG_MCMDR_TXON)) {
+            emc->regs[REG_MGSTA] |= REG_MGSTA_TXHA;
+        }
+        if (!(value & REG_MCMDR_TXON)) {
+            emc_halt_tx(emc, 0);
+        }
+        /* Update rx state. */
+        if (!(prev & REG_MCMDR_RXON) &&
+            (value & REG_MCMDR_RXON)) {
+            emc->regs[REG_CRXDSA] = emc->regs[REG_RXDLSA];
+        } else if ((prev & REG_MCMDR_RXON) &&
+                   !(value & REG_MCMDR_RXON)) {
+            emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
+        }
+        if (!(value & REG_MCMDR_RXON)) {
+            emc_halt_rx(emc, 0);
+        }
+        break;
+    }
+    case REG_TXDLSA:
+    case REG_RXDLSA:
+    case REG_DMARFC:
+    case REG_MIID:
+        emc->regs[reg] = value;
+        break;
+    case REG_MIEN:
+        emc->regs[reg] = value;
+        emc_update_irq_from_reg_change(emc);
+        break;
+    case REG_MISTA:
+        /* Clear the bits that have 1 in "value". */
+        emc->regs[reg] &= ~value;
+        emc_update_irq_from_reg_change(emc);
+        break;
+    case REG_MGSTA:
+        /* Clear the bits that have 1 in "value". */
+        emc->regs[reg] &= ~value;
+        break;
+    case REG_TSDR:
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_TXON) {
+            emc->tx_active = true;
+            /* Keep trying to send packets until we run out. */
+            while (emc->tx_active) {
+                emc_try_send_next_packet(emc);
+            }
+        }
+        break;
+    case REG_RSDR:
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
+            emc->rx_active = true;
+            emc_try_receive_next_packet(emc);
+        }
+        break;
+    case REG_MIIDA:
+        emc->regs[reg] = value & ~REG_MIIDA_BUSY;
+        break;
+    case REG_MRPC:
+    case REG_MRPCC:
+    case REG_MREPC:
+    case REG_CTXDSA:
+    case REG_CTXBSA:
+    case REG_CRXDSA:
+    case REG_CRXBSA:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only reg %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Write to unimplemented reg %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        break;
+    }
+}
+
+static const struct MemoryRegionOps npcm7xx_emc_ops = {
+    .read = npcm7xx_emc_read,
+    .write = npcm7xx_emc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void emc_cleanup(NetClientState *nc)
+{
+    /* Nothing to do yet. */
+}
+
+static NetClientInfo net_npcm7xx_emc_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = emc_can_receive,
+    .receive = emc_receive,
+    .cleanup = emc_cleanup,
+    .link_status_changed = emc_set_link,
+};
+
+static void npcm7xx_emc_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(emc);
+
+    memory_region_init_io(&emc->iomem, OBJECT(emc), &npcm7xx_emc_ops, emc,
+                          TYPE_NPCM7XX_EMC, 4 * KiB);
+    sysbus_init_mmio(sbd, &emc->iomem);
+    sysbus_init_irq(sbd, &emc->tx_irq);
+    sysbus_init_irq(sbd, &emc->rx_irq);
+
+    qemu_macaddr_default_if_unset(&emc->conf.macaddr);
+    emc->nic = qemu_new_nic(&net_npcm7xx_emc_info, &emc->conf,
+                            object_get_typename(OBJECT(dev)), dev->id, emc);
+    qemu_format_nic_info_str(qemu_get_queue(emc->nic), emc->conf.macaddr.a);
+}
+
+static void npcm7xx_emc_unrealize(DeviceState *dev)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+
+    qemu_del_nic(emc->nic);
+}
+
+static const VMStateDescription vmstate_npcm7xx_emc = {
+    .name = TYPE_NPCM7XX_EMC,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(emc_num, NPCM7xxEMCState),
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxEMCState, NPCM7XX_NUM_EMC_REGS),
+        VMSTATE_BOOL(tx_active, NPCM7xxEMCState),
+        VMSTATE_BOOL(rx_active, NPCM7xxEMCState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm7xx_emc_properties[] = {
+    DEFINE_NIC_PROPERTIES(NPCM7xxEMCState, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_emc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->desc = "NPCM7xx EMC Controller";
+    dc->realize = npcm7xx_emc_realize;
+    dc->unrealize = npcm7xx_emc_unrealize;
+    dc->reset = npcm7xx_emc_reset;
+    dc->vmsd = &vmstate_npcm7xx_emc;
+    device_class_set_props(dc, npcm7xx_emc_properties);
+}
+
+static const TypeInfo npcm7xx_emc_info = {
+    .name = TYPE_NPCM7XX_EMC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NPCM7xxEMCState),
+    .class_init = npcm7xx_emc_class_init,
+};
+
+static void npcm7xx_emc_register_type(void)
+{
+    type_register_static(&npcm7xx_emc_info);
+}
+
+type_init(npcm7xx_emc_register_type)
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 5db45456d9..baf25ffa7e 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -429,3 +429,20 @@ imx_fec_receive_last(int last) "rx frame flags 0x%04x"
 imx_enet_receive(size_t size) "len %zu"
 imx_enet_receive_len(uint64_t addr, int len) "rx_bd 0x%"PRIx64" length %d"
 imx_enet_receive_last(int last) "rx frame flags 0x%04x"
+
+# npcm7xx_emc.c
+npcm7xx_emc_reset(int emc_num) "Resetting emc%d"
+npcm7xx_emc_update_tx_irq(int level) "Setting tx irq to %d"
+npcm7xx_emc_update_rx_irq(int level) "Setting rx irq to %d"
+npcm7xx_emc_set_mista(uint32_t flags) "ORing 0x%x into MISTA"
+npcm7xx_emc_cpu_owned_desc(uint32_t addr) "Can't process cpu-owned descriptor @0x%x"
+npcm7xx_emc_sent_packet(uint32_t len) "Sent %u byte packet"
+npcm7xx_emc_tx_done(uint32_t ctxdsa) "TX done, CTXDSA=0x%x"
+npcm7xx_emc_can_receive(int can_receive) "Can receive: %d"
+npcm7xx_emc_packet_filtered_out(const char* fail_reason) "Packet filtered out: %s"
+npcm7xx_emc_packet_dropped(uint32_t len) "%u byte packet dropped"
+npcm7xx_emc_receiving_packet(uint32_t len) "Receiving %u byte packet"
+npcm7xx_emc_received_packet(uint32_t len) "Received %u byte packet"
+npcm7xx_emc_rx_done(uint32_t crxdsa) "RX done, CRXDSA=0x%x"
+npcm7xx_emc_reg_read(int emc_num, uint32_t result, const char *name, int regno) "emc%d: 0x%x = reg[%s/%d]"
+npcm7xx_emc_reg_write(int emc_num, const char *name, int regno, uint32_t value) "emc%d: reg[%s/%d] = 0x%x"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f6227aa8aa..3bfc75aafe 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -25,6 +25,7 @@
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
+#include "hw/net/npcm7xx_emc.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -88,6 +89,7 @@ typedef struct NPCM7xxState {
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
+    NPCM7xxEMCState     emc[2];
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
new file mode 100644
index 0000000000..eac7f29816
--- /dev/null
+++ b/include/hw/net/npcm7xx_emc.h
@@ -0,0 +1,286 @@
+/*
+ * Nuvoton NPCM7xx EMC Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef NPCM7XX_EMC_H
+#define NPCM7XX_EMC_H
+
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "net/net.h"
+
+/* 32-bit register indices. */
+enum NPCM7xxPWMRegister {
+    /* Control registers. */
+    REG_CAMCMR,
+    REG_CAMEN,
+
+    /* There are 16 CAMn[ML] registers. */
+    REG_CAMM_BASE,
+    REG_CAML_BASE,
+    REG_CAMML_LAST = 0x21,
+
+    REG_TXDLSA = 0x22,
+    REG_RXDLSA,
+    REG_MCMDR,
+    REG_MIID,
+    REG_MIIDA,
+    REG_FFTCR,
+    REG_TSDR,
+    REG_RSDR,
+    REG_DMARFC,
+    REG_MIEN,
+
+    /* Status registers. */
+    REG_MISTA,
+    REG_MGSTA,
+    REG_MPCNT,
+    REG_MRPC,
+    REG_MRPCC,
+    REG_MREPC,
+    REG_DMARFS,
+    REG_CTXDSA,
+    REG_CTXBSA,
+    REG_CRXDSA,
+    REG_CRXBSA,
+
+    NPCM7XX_NUM_EMC_REGS,
+};
+
+/* REG_CAMCMR fields */
+/* Enable CAM Compare */
+#define REG_CAMCMR_ECMP (1 << 4)
+/* Complement CAM Compare */
+#define REG_CAMCMR_CCAM (1 << 3)
+/* Accept Broadcast Packet */
+#define REG_CAMCMR_ABP (1 << 2)
+/* Accept Multicast Packet */
+#define REG_CAMCMR_AMP (1 << 1)
+/* Accept Unicast Packet */
+#define REG_CAMCMR_AUP (1 << 0)
+
+/* REG_MCMDR fields */
+/* Software Reset */
+#define REG_MCMDR_SWR (1 << 24)
+/* Internal Loopback Select */
+#define REG_MCMDR_LBK (1 << 21)
+/* Operation Mode Select */
+#define REG_MCMDR_OPMOD (1 << 20)
+/* Enable MDC Clock Generation */
+#define REG_MCMDR_ENMDC (1 << 19)
+/* Full-Duplex Mode Select */
+#define REG_MCMDR_FDUP (1 << 18)
+/* Enable SQE Checking */
+#define REG_MCMDR_ENSEQ (1 << 17)
+/* Send PAUSE Frame */
+#define REG_MCMDR_SDPZ (1 << 16)
+/* No Defer */
+#define REG_MCMDR_NDEF (1 << 9)
+/* Frame Transmission On */
+#define REG_MCMDR_TXON (1 << 8)
+/* Strip CRC Checksum */
+#define REG_MCMDR_SPCRC (1 << 5)
+/* Accept CRC Error Packet */
+#define REG_MCMDR_AEP (1 << 4)
+/* Accept Control Packet */
+#define REG_MCMDR_ACP (1 << 3)
+/* Accept Runt Packet */
+#define REG_MCMDR_ARP (1 << 2)
+/* Accept Long Packet */
+#define REG_MCMDR_ALP (1 << 1)
+/* Frame Reception On */
+#define REG_MCMDR_RXON (1 << 0)
+
+/* REG_MIEN fields */
+/* Enable Transmit Descriptor Unavailable Interrupt */
+#define REG_MIEN_ENTDU (1 << 23)
+/* Enable Transmit Completion Interrupt */
+#define REG_MIEN_ENTXCP (1 << 18)
+/* Enable Transmit Interrupt */
+#define REG_MIEN_ENTXINTR (1 << 16)
+/* Enable Receive Descriptor Unavailable Interrupt */
+#define REG_MIEN_ENRDU (1 << 10)
+/* Enable Receive Good Interrupt */
+#define REG_MIEN_ENRXGD (1 << 4)
+/* Enable Receive Interrupt */
+#define REG_MIEN_ENRXINTR (1 << 0)
+
+/* REG_MISTA fields */
+/* TODO: Add error fields and support simulated errors? */
+/* Transmit Bus Error Interrupt */
+#define REG_MISTA_TXBERR (1 << 24)
+/* Transmit Descriptor Unavailable Interrupt */
+#define REG_MISTA_TDU (1 << 23)
+/* Transmit Completion Interrupt */
+#define REG_MISTA_TXCP (1 << 18)
+/* Transmit Interrupt */
+#define REG_MISTA_TXINTR (1 << 16)
+/* Receive Bus Error Interrupt */
+#define REG_MISTA_RXBERR (1 << 11)
+/* Receive Descriptor Unavailable Interrupt */
+#define REG_MISTA_RDU (1 << 10)
+/* DMA Early Notification Interrupt */
+#define REG_MISTA_DENI (1 << 9)
+/* Maximum Frame Length Interrupt */
+#define REG_MISTA_DFOI (1 << 8)
+/* Receive Good Interrupt */
+#define REG_MISTA_RXGD (1 << 4)
+/* Packet Too Long Interrupt */
+#define REG_MISTA_PTLE (1 << 3)
+/* Receive Interrupt */
+#define REG_MISTA_RXINTR (1 << 0)
+
+/* REG_MGSTA fields */
+/* Transmission Halted */
+#define REG_MGSTA_TXHA (1 << 11)
+/* Receive Halted */
+#define REG_MGSTA_RXHA (1 << 11)
+
+/* REG_DMARFC fields */
+/* Maximum Receive Frame Length */
+#define REG_DMARFC_RXMS(word) extract32((word), 0, 16)
+
+/* REG MIIDA fields */
+/* Busy Bit */
+#define REG_MIIDA_BUSY (1 << 17)
+
+/* Transmit and receive descriptors */
+typedef struct NPCM7xxEMCTxDesc NPCM7xxEMCTxDesc;
+typedef struct NPCM7xxEMCRxDesc NPCM7xxEMCRxDesc;
+
+struct NPCM7xxEMCTxDesc {
+    uint32_t flags;
+    uint32_t txbsa;
+    uint32_t status_and_length;
+    uint32_t ntxdsa;
+};
+
+struct NPCM7xxEMCRxDesc {
+    uint32_t status_and_length;
+    uint32_t rxbsa;
+    uint32_t reserved;
+    uint32_t nrxdsa;
+};
+
+/* NPCM7xxEMCTxDesc.flags values */
+/* Owner: 0 = cpu, 1 = emc */
+#define TX_DESC_FLAG_OWNER_MASK (1 << 31)
+/* Transmit interrupt enable */
+#define TX_DESC_FLAG_INTEN (1 << 2)
+/* CRC append */
+#define TX_DESC_FLAG_CRCAPP (1 << 1)
+/* Padding enable */
+#define TX_DESC_FLAG_PADEN (1 << 0)
+
+/* NPCM7xxEMCTxDesc.status_and_length values */
+/* Collision count */
+#define TX_DESC_STATUS_CCNT_SHIFT 28
+#define TX_DESC_STATUS_CCNT_BITSIZE 4
+/* SQE error */
+#define TX_DESC_STATUS_SQE (1 << 26)
+/* Transmission paused */
+#define TX_DESC_STATUS_PAU (1 << 25)
+/* P transmission halted */
+#define TX_DESC_STATUS_TXHA (1 << 24)
+/* Late collision */
+#define TX_DESC_STATUS_LC (1 << 23)
+/* Transmission abort */
+#define TX_DESC_STATUS_TXABT (1 << 22)
+/* No carrier sense */
+#define TX_DESC_STATUS_NCS (1 << 21)
+/* Defer exceed */
+#define TX_DESC_STATUS_EXDEF (1 << 20)
+/* Transmission complete */
+#define TX_DESC_STATUS_TXCP (1 << 19)
+/* Transmission deferred */
+#define TX_DESC_STATUS_DEF (1 << 17)
+/* Transmit interrupt */
+#define TX_DESC_STATUS_TXINTR (1 << 16)
+
+#define TX_DESC_PKT_LEN(word) extract32((word), 0, 16)
+
+/* Transmit buffer start address */
+#define TX_DESC_TXBSA(word) ((uint32_t) (word) & ~3u)
+
+/* Next transmit descriptor start address */
+#define TX_DESC_NTXDSA(word) ((uint32_t) (word) & ~3u)
+
+/* NPCM7xxEMCRxDesc.status_and_length values */
+/* Owner: 0b00 = cpu, 0b01 = undefined, 0b10 = emc, 0b11 = undefined */
+#define RX_DESC_STATUS_OWNER_SHIFT 30
+#define RX_DESC_STATUS_OWNER_BITSIZE 2
+#define RX_DESC_STATUS_OWNER_MASK (3 << RX_DESC_STATUS_OWNER_SHIFT)
+/* Runt packet */
+#define RX_DESC_STATUS_RP (1 << 22)
+/* Alignment error */
+#define RX_DESC_STATUS_ALIE (1 << 21)
+/* Frame reception complete */
+#define RX_DESC_STATUS_RXGD (1 << 20)
+/* Packet too long */
+#define RX_DESC_STATUS_PTLE (1 << 19)
+/* CRC error */
+#define RX_DESC_STATUS_CRCE (1 << 17)
+/* Receive interrupt */
+#define RX_DESC_STATUS_RXINTR (1 << 16)
+
+#define RX_DESC_PKT_LEN(word) extract32((word), 0, 16)
+
+/* Receive buffer start address */
+#define RX_DESC_RXBSA(word) ((uint32_t) (word) & ~3u)
+
+/* Next receive descriptor start address */
+#define RX_DESC_NRXDSA(word) ((uint32_t) (word) & ~3u)
+
+/* Minimum packet length, when TX_DESC_FLAG_PADEN is set. */
+#define MIN_PACKET_LENGTH 64
+
+struct NPCM7xxEMCState {
+    /*< private >*/
+    SysBusDevice parent;
+    /*< public >*/
+
+    MemoryRegion iomem;
+
+    qemu_irq tx_irq;
+    qemu_irq rx_irq;
+
+    NICState *nic;
+    NICConf conf;
+
+    /* 0 or 1, for log messages */
+    uint8_t emc_num;
+
+    uint32_t regs[NPCM7XX_NUM_EMC_REGS];
+
+    /*
+     * tx is active. Set to true by TSDR and then switches off when out of
+     * descriptors. If the TXON bit in REG_MCMDR is off then this is off.
+     */
+    bool tx_active;
+
+    /*
+     * rx is active. Set to true by RSDR and then switches off when out of
+     * descriptors. If the RXON bit in REG_MCMDR is off then this is off.
+     */
+    bool rx_active;
+};
+
+typedef struct NPCM7xxEMCState NPCM7xxEMCState;
+
+#define TYPE_NPCM7XX_EMC "npcm7xx-emc"
+#define NPCM7XX_EMC(obj) \
+    OBJECT_CHECK(NPCM7xxEMCState, (obj), TYPE_NPCM7XX_EMC)
+
+#endif /* NPCM7XX_EMC_H */
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 16d04625b8..e2225247a0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -135,6 +135,7 @@ qtests_sparc64 = \
 
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
+   'npcm7xx_emc-test',
    'npcm7xx_gpio-test',
    'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
new file mode 100644
index 0000000000..66c706454c
--- /dev/null
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -0,0 +1,793 @@
+/*
+ * QTests for Nuvoton NPCM7xx EMC Modules.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "libqos/libqos.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+#include "qemu/bitops.h"
+#include "qemu/iov.h"
+
+/* Name of the emc device. */
+#define TYPE_NPCM7XX_EMC "npcm7xx-emc"
+
+/* Timeout for various operations, in seconds. */
+#define TIMEOUT_SECONDS 10
+
+/* Address in memory of the descriptor. */
+#define DESC_ADDR (1 << 20) /* 1 MiB */
+
+/* Address in memory of the data packet. */
+#define DATA_ADDR (DESC_ADDR + 4096)
+
+#define CRC_LENGTH 4
+
+#define NUM_TX_DESCRIPTORS 3
+#define NUM_RX_DESCRIPTORS 2
+
+/* Size of tx,rx test buffers. */
+#define TX_DATA_LEN 64
+#define RX_DATA_LEN 64
+
+#define TX_STEP_COUNT 10000
+#define RX_STEP_COUNT 10000
+
+/* 32-bit register indices. */
+typedef enum NPCM7xxPWMRegister {
+    /* Control registers. */
+    REG_CAMCMR,
+    REG_CAMEN,
+
+    /* There are 16 CAMn[ML] registers. */
+    REG_CAMM_BASE,
+    REG_CAML_BASE,
+
+    REG_TXDLSA = 0x22,
+    REG_RXDLSA,
+    REG_MCMDR,
+    REG_MIID,
+    REG_MIIDA,
+    REG_FFTCR,
+    REG_TSDR,
+    REG_RSDR,
+    REG_DMARFC,
+    REG_MIEN,
+
+    /* Status registers. */
+    REG_MISTA,
+    REG_MGSTA,
+    REG_MPCNT,
+    REG_MRPC,
+    REG_MRPCC,
+    REG_MREPC,
+    REG_DMARFS,
+    REG_CTXDSA,
+    REG_CTXBSA,
+    REG_CRXDSA,
+    REG_CRXBSA,
+
+    NPCM7XX_NUM_EMC_REGS,
+} NPCM7xxPWMRegister;
+
+enum { NUM_CAMML_REGS = 16 };
+
+/* REG_CAMCMR fields */
+/* Enable CAM Compare */
+#define REG_CAMCMR_ECMP (1 << 4)
+/* Accept Unicast Packet */
+#define REG_CAMCMR_AUP (1 << 0)
+
+/* REG_MCMDR fields */
+/* Software Reset */
+#define REG_MCMDR_SWR (1 << 24)
+/* Frame Transmission On */
+#define REG_MCMDR_TXON (1 << 8)
+/* Accept Long Packet */
+#define REG_MCMDR_ALP (1 << 1)
+/* Frame Reception On */
+#define REG_MCMDR_RXON (1 << 0)
+
+/* REG_MIEN fields */
+/* Enable Transmit Completion Interrupt */
+#define REG_MIEN_ENTXCP (1 << 18)
+/* Enable Transmit Interrupt */
+#define REG_MIEN_ENTXINTR (1 << 16)
+/* Enable Receive Good Interrupt */
+#define REG_MIEN_ENRXGD (1 << 4)
+/* ENable Receive Interrupt */
+#define REG_MIEN_ENRXINTR (1 << 0)
+
+/* REG_MISTA fields */
+/* Transmit Bus Error Interrupt */
+#define REG_MISTA_TXBERR (1 << 24)
+/* Transmit Descriptor Unavailable Interrupt */
+#define REG_MISTA_TDU (1 << 23)
+/* Transmit Completion Interrupt */
+#define REG_MISTA_TXCP (1 << 18)
+/* Transmit Interrupt */
+#define REG_MISTA_TXINTR (1 << 16)
+/* Receive Bus Error Interrupt */
+#define REG_MISTA_RXBERR (1 << 11)
+/* Receive Descriptor Unavailable Interrupt */
+#define REG_MISTA_RDU (1 << 10)
+/* DMA Early Notification Interrupt */
+#define REG_MISTA_DENI (1 << 9)
+/* Maximum Frame Length Interrupt */
+#define REG_MISTA_DFOI (1 << 8)
+/* Receive Good Interrupt */
+#define REG_MISTA_RXGD (1 << 4)
+/* Packet Too Long Interrupt */
+#define REG_MISTA_PTLE (1 << 3)
+/* Receive Interrupt */
+#define REG_MISTA_RXINTR (1 << 0)
+
+typedef struct NPCM7xxEMCTxDesc NPCM7xxEMCTxDesc;
+typedef struct NPCM7xxEMCRxDesc NPCM7xxEMCRxDesc;
+
+struct NPCM7xxEMCTxDesc {
+    uint32_t flags;
+    uint32_t txbsa;
+    uint32_t status_and_length;
+    uint32_t ntxdsa;
+};
+
+struct NPCM7xxEMCRxDesc {
+    uint32_t status_and_length;
+    uint32_t rxbsa;
+    uint32_t reserved;
+    uint32_t nrxdsa;
+};
+
+/* NPCM7xxEMCTxDesc.flags values */
+/* Owner: 0 = cpu, 1 = emc */
+#define TX_DESC_FLAG_OWNER_MASK (1 << 31)
+/* Transmit interrupt enable */
+#define TX_DESC_FLAG_INTEN (1 << 2)
+
+/* NPCM7xxEMCTxDesc.status_and_length values */
+/* Transmission complete */
+#define TX_DESC_STATUS_TXCP (1 << 19)
+/* Transmit interrupt */
+#define TX_DESC_STATUS_TXINTR (1 << 16)
+
+/* NPCM7xxEMCRxDesc.status_and_length values */
+/* Owner: 0b00 = cpu, 0b10 = emc */
+#define RX_DESC_STATUS_OWNER_SHIFT 30
+#define RX_DESC_STATUS_OWNER_MASK 0xc0000000
+/* Frame Reception Complete */
+#define RX_DESC_STATUS_RXGD (1 << 20)
+/* Packet too long */
+#define RX_DESC_STATUS_PTLE (1 << 19)
+/* Receive Interrupt */
+#define RX_DESC_STATUS_RXINTR (1 << 16)
+
+#define RX_DESC_PKT_LEN(word) ((uint32_t) (word) & 0xffff)
+
+typedef struct EMCModule {
+    int rx_irq;
+    int tx_irq;
+    uint64_t base_addr;
+} EMCModule;
+
+typedef struct TestData {
+    const EMCModule *module;
+} TestData;
+
+static const EMCModule emc_module_list[] = {
+    {
+        .rx_irq     = 15,
+        .tx_irq     = 16,
+        .base_addr  = 0xf0825000
+    },
+    {
+        .rx_irq     = 114,
+        .tx_irq     = 115,
+        .base_addr  = 0xf0826000
+    }
+};
+
+/* Returns the index of the EMC module. */
+static int emc_module_index(const EMCModule *mod)
+{
+    ptrdiff_t diff = mod - emc_module_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(emc_module_list));
+
+    return diff;
+}
+
+static void packet_test_clear(void *sockets)
+{
+    int *test_sockets = sockets;
+
+    close(test_sockets[0]);
+    g_free(test_sockets);
+}
+
+static int *packet_test_init(int module_num, GString *cmd_line)
+{
+    int *test_sockets = g_new(int, 2);
+    int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
+    g_assert_cmpint(ret, != , -1);
+
+    /*
+     * KISS and use -nic. We specify two nics (both emc{0,1}) because there's
+     * currently no way to specify only emc1: The driver implicitly relies on
+     * emc[i] == nd_table[i].
+     */
+    if (module_num == 0) {
+        g_string_append_printf(cmd_line,
+                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " "
+                               " -nic user,model=" TYPE_NPCM7XX_EMC " ",
+                               test_sockets[1]);
+    } else {
+        g_string_append_printf(cmd_line,
+                               " -nic user,model=" TYPE_NPCM7XX_EMC " "
+                               " -nic socket,fd=%d,model=" TYPE_NPCM7XX_EMC " ",
+                               test_sockets[1]);
+    }
+
+    g_test_queue_destroy(packet_test_clear, test_sockets);
+    return test_sockets;
+}
+
+static uint32_t emc_read(QTestState *qts, const EMCModule *mod,
+        NPCM7xxPWMRegister regno)
+{
+    return qtest_readl(qts, mod->base_addr + regno * sizeof(uint32_t));
+}
+
+static void emc_write(QTestState *qts, const EMCModule *mod,
+        NPCM7xxPWMRegister regno, uint32_t value)
+{
+    qtest_writel(qts, mod->base_addr + regno * sizeof(uint32_t), value);
+}
+
+/*
+ * Reset the EMC module.
+ * The module must be reset before, e.g., TXDLSA,RXDLSA are changed.
+ */
+static bool emc_soft_reset(QTestState *qts, const EMCModule *mod)
+{
+    uint32_t mcmdr = REG_MCMDR_SWR;
+    emc_write(qts, mod, REG_MCMDR, mcmdr);
+
+    /*
+     * Wait for device to reset as the linux driver does.
+     * During reset the AHB reads 0 for all registers. So first wait for
+     * something that resets to non-zero, and then wait for SWR becoming 0.
+     */
+    guint64 end_time =
+        g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    uint32_t val;
+    do {
+        qtest_clock_step(qts, 100);
+        val = emc_read(qts, mod, REG_FFTCR);
+    } while (val == 0 && g_get_monotonic_time() < end_time);
+    if (val != 0) {
+        do {
+            qtest_clock_step(qts, 100);
+            val = emc_read(qts, mod, REG_MCMDR);
+            if ((val & REG_MCMDR_SWR) == 0) {
+                /*
+                 * N.B. The CAMs have been reset here, so macaddr matching of
+                 * incoming packets will not work.
+                 */
+                return true;
+            }
+        } while (g_get_monotonic_time() < end_time);
+    }
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+/* Check emc registers are reset to default value. */
+static void test_init(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    const EMCModule *mod = td->module;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int i;
+
+#define CHECK_REG(regno, value) \
+  do { \
+    g_assert_cmphex(emc_read(qts, mod, (regno)), ==, (value)); \
+  } while (0)
+
+    CHECK_REG(REG_CAMCMR, 0);
+    CHECK_REG(REG_CAMEN, 0);
+    CHECK_REG(REG_TXDLSA, 0xfffffffc);
+    CHECK_REG(REG_RXDLSA, 0xfffffffc);
+    CHECK_REG(REG_MCMDR, 0);
+    CHECK_REG(REG_MIID, 0);
+    CHECK_REG(REG_MIIDA, 0x00900000);
+    CHECK_REG(REG_FFTCR, 0x0101);
+    CHECK_REG(REG_DMARFC, 0x0800);
+    CHECK_REG(REG_MIEN, 0);
+    CHECK_REG(REG_MISTA, 0);
+    CHECK_REG(REG_MGSTA, 0);
+    CHECK_REG(REG_MPCNT, 0x7fff);
+    CHECK_REG(REG_MRPC, 0);
+    CHECK_REG(REG_MRPCC, 0);
+    CHECK_REG(REG_MREPC, 0);
+    CHECK_REG(REG_DMARFS, 0);
+    CHECK_REG(REG_CTXDSA, 0);
+    CHECK_REG(REG_CTXBSA, 0);
+    CHECK_REG(REG_CRXDSA, 0);
+    CHECK_REG(REG_CRXBSA, 0);
+
+#undef CHECK_REG
+
+    for (i = 0; i < NUM_CAMML_REGS; ++i) {
+        g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
+                         0);
+        g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
+                         0);
+    }
+
+    qtest_quit(qts);
+}
+
+static bool emc_wait_irq(QTestState *qts, const EMCModule *mod, int step,
+                         bool is_tx)
+{
+    guint64 end_time =
+        g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    do {
+        if (qtest_get_irq(qts, is_tx ? mod->tx_irq : mod->rx_irq)) {
+            return true;
+        }
+        qtest_clock_step(qts, step);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+static bool emc_wait_mista(QTestState *qts, const EMCModule *mod, int step,
+                           uint32_t flag)
+{
+    guint64 end_time =
+        g_get_monotonic_time() + TIMEOUT_SECONDS * G_TIME_SPAN_SECOND;
+
+    do {
+        uint32_t mista = emc_read(qts, mod, REG_MISTA);
+        if (mista & flag) {
+            return true;
+        }
+        qtest_clock_step(qts, step);
+    } while (g_get_monotonic_time() < end_time);
+
+    g_message("%s: Timeout expired", __func__);
+    return false;
+}
+
+static bool wait_socket_readable(int fd)
+{
+    fd_set read_fds;
+    struct timeval tv;
+    FD_ZERO(&read_fds);
+    FD_SET(fd, &read_fds);
+    tv.tv_sec = TIMEOUT_SECONDS;
+    tv.tv_usec = 0;
+    int rv = select(fd + 1, &read_fds, NULL, NULL, &tv);
+    if (rv == -1) {
+        perror("select");
+    } else if (rv == 0) {
+        g_message("%s: Timeout expired", __func__);
+    }
+    return rv == 1;
+}
+
+static void init_tx_desc(NPCM7xxEMCTxDesc *desc, size_t count,
+                         uint32_t desc_addr)
+{
+    g_assert(count >= 2);
+    memset(&desc[0], 0, sizeof(*desc) * count);
+    /* Leave the last one alone, owned by the cpu -> stops transmission. */
+    for (size_t i = 0; i < count - 1; ++i) {
+        desc[i].flags =
+            cpu_to_le32(TX_DESC_FLAG_OWNER_MASK | /* owner = 1: emc */
+                        TX_DESC_FLAG_INTEN |
+                        0 | /* crc append = 0 */
+                        0 /* padding enable = 0 */);
+        desc[i].status_and_length =
+            cpu_to_le32(0 | /* collision count = 0 */
+                        0 | /* SQE = 0 */
+                        0 | /* PAU = 0 */
+                        0 | /* TXHA = 0 */
+                        0 | /* LC = 0 */
+                        0 | /* TXABT = 0 */
+                        0 | /* NCS = 0 */
+                        0 | /* EXDEF = 0 */
+                        0 | /* TXCP = 0 */
+                        0 | /* DEF = 0 */
+                        0 | /* TXINTR = 0 */
+                        0 /* length filled in later */);
+        desc[i].ntxdsa = cpu_to_le32(desc_addr + (i + 1) * sizeof(*desc));
+    }
+}
+
+static void enable_tx(QTestState *qts, const EMCModule *mod,
+                      const NPCM7xxEMCTxDesc *desc, size_t count,
+                      uint32_t desc_addr, uint32_t mien_flags)
+{
+    /* Write the descriptors to guest memory. */
+    qtest_memwrite(qts, desc_addr, desc, sizeof(*desc) * count);
+
+    /* Trigger sending the packet. */
+    /* The module must be reset before changing TXDLSA. */
+    g_assert(emc_soft_reset(qts, mod));
+    emc_write(qts, mod, REG_TXDLSA, desc_addr);
+    emc_write(qts, mod, REG_CTXDSA, ~0);
+    emc_write(qts, mod, REG_MIEN, REG_MIEN_ENTXCP | mien_flags);
+    uint32_t mcmdr = emc_read(qts, mod, REG_MCMDR);
+    mcmdr |= REG_MCMDR_TXON;
+    emc_write(qts, mod, REG_MCMDR, mcmdr);
+
+    /* Prod the device to send the packet. */
+    emc_write(qts, mod, REG_TSDR, 1);
+}
+
+static void emc_send_verify1(QTestState *qts, const EMCModule *mod, int fd,
+                             bool with_irq, uint32_t desc_addr,
+                             uint32_t next_desc_addr,
+                             const char *test_data, int test_size)
+{
+    g_assert(wait_socket_readable(fd));
+
+    /* Read the descriptor back. */
+    NPCM7xxEMCTxDesc result_desc;
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.flags & TX_DESC_FLAG_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    uint32_t expected_mask = 0xffff << 16;
+    uint32_t expected_value = TX_DESC_STATUS_TXCP;
+    if (with_irq) {
+        expected_value |= TX_DESC_STATUS_TXINTR;
+    }
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+
+    /* Check data sent to the backend. */
+    uint32_t recv_len = ~0;
+    int ret = qemu_recv(fd, &recv_len, sizeof(recv_len), MSG_DONTWAIT);
+    g_assert_cmpint(ret, == , sizeof(recv_len));
+
+    g_assert(wait_socket_readable(fd));
+    char buffer[TX_DATA_LEN];
+    memset(buffer, 0xff, sizeof(buffer));
+    ret = qemu_recv(fd, buffer, test_size, MSG_DONTWAIT);
+    g_assert_cmpmem(buffer, ret, test_data, test_size);
+}
+
+static void emc_send_verify(QTestState *qts, const EMCModule *mod, int fd,
+                            bool with_irq)
+{
+    NPCM7xxEMCTxDesc desc[NUM_TX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    static const char test1_data[] = "TEST1";
+    static const char test2_data[] = "Testing 1 2 3 ...";
+    uint32_t data1_addr = DATA_ADDR;
+    uint32_t data2_addr = data1_addr + sizeof(test1_data);
+
+    /* Prepare test data buffer. */
+    qtest_memwrite(qts, data1_addr, test1_data, sizeof(test1_data));
+    qtest_memwrite(qts, data2_addr, test2_data, sizeof(test2_data));
+
+    init_tx_desc(&desc[0], NUM_TX_DESCRIPTORS, desc_addr);
+    desc[0].txbsa = cpu_to_le32(data1_addr);
+    desc[0].status_and_length |= sizeof(test1_data);
+    desc[1].txbsa = cpu_to_le32(data2_addr);
+    desc[1].status_and_length |= sizeof(test2_data);
+
+    enable_tx(qts, mod, &desc[0], NUM_TX_DESCRIPTORS, desc_addr,
+              with_irq ? REG_MIEN_ENTXINTR : 0);
+
+    /*
+     * It's problematic to observe the interrupt for each packet.
+     * Instead just wait until all the packets go out.
+     */
+    bool got_tdu = false;
+    while (!got_tdu) {
+        if (with_irq) {
+            g_assert_true(emc_wait_irq(qts, mod, TX_STEP_COUNT,
+                                       /*is_tx=*/true));
+        } else {
+            g_assert_true(emc_wait_mista(qts, mod, TX_STEP_COUNT,
+                                         REG_MISTA_TXINTR));
+        }
+        got_tdu = !!(emc_read(qts, mod, REG_MISTA) & REG_MISTA_TDU);
+        /* If we don't have TDU yet, reset the interrupt. */
+        if (!got_tdu) {
+            emc_write(qts, mod, REG_MISTA,
+                      emc_read(qts, mod, REG_MISTA) & 0xffff0000);
+        }
+    }
+
+    uint32_t end_desc_addr = desc_addr + 2 * sizeof(desc[0]);
+    g_assert_cmphex(emc_read(qts, mod, REG_CTXDSA), ==, end_desc_addr);
+    g_assert_cmphex(emc_read(qts, mod, REG_MISTA), ==,
+                    REG_MISTA_TXCP | REG_MISTA_TXINTR | REG_MISTA_TDU);
+
+    emc_send_verify1(qts, mod, fd, with_irq,
+                     desc_addr, end_desc_addr,
+                     test1_data, sizeof(test1_data));
+    emc_send_verify1(qts, mod, fd, with_irq,
+                     desc_addr + sizeof(desc[0]), end_desc_addr,
+                     test2_data, sizeof(test2_data));
+}
+
+static void init_rx_desc(NPCM7xxEMCRxDesc *desc, size_t count,
+                         uint32_t desc_addr, uint32_t data_addr)
+{
+    g_assert_true(count >= 2);
+    memset(desc, 0, sizeof(*desc) * count);
+    desc[0].rxbsa = cpu_to_le32(data_addr);
+    desc[0].status_and_length =
+        cpu_to_le32(0b10 << RX_DESC_STATUS_OWNER_SHIFT | /* owner = 10: emc */
+                    0 | /* RP = 0 */
+                    0 | /* ALIE = 0 */
+                    0 | /* RXGD = 0 */
+                    0 | /* PTLE = 0 */
+                    0 | /* CRCE = 0 */
+                    0 | /* RXINTR = 0 */
+                    0   /* length (filled in later) */);
+    /* Leave the last one alone, owned by the cpu -> stops transmission. */
+    desc[0].nrxdsa = cpu_to_le32(desc_addr + sizeof(*desc));
+}
+
+static void enable_rx(QTestState *qts, const EMCModule *mod,
+                      const NPCM7xxEMCRxDesc *desc, size_t count,
+                      uint32_t desc_addr, uint32_t mien_flags,
+                      uint32_t mcmdr_flags)
+{
+    /*
+     * Write the descriptor to guest memory.
+     * FWIW, IWBN if the docs said the buffer needs to be at least DMARFC
+     * bytes.
+     */
+    qtest_memwrite(qts, desc_addr, desc, sizeof(*desc) * count);
+
+    /* Trigger receiving the packet. */
+    /* The module must be reset before changing RXDLSA. */
+    g_assert(emc_soft_reset(qts, mod));
+    emc_write(qts, mod, REG_RXDLSA, desc_addr);
+    emc_write(qts, mod, REG_MIEN, REG_MIEN_ENRXGD | mien_flags);
+
+    /*
+     * We don't know what the device's macaddr is, so just accept all
+     * unicast packets (AUP).
+     */
+    emc_write(qts, mod, REG_CAMCMR, REG_CAMCMR_AUP);
+    emc_write(qts, mod, REG_CAMEN, 1 << 0);
+    uint32_t mcmdr = emc_read(qts, mod, REG_MCMDR);
+    mcmdr |= REG_MCMDR_RXON | mcmdr_flags;
+    emc_write(qts, mod, REG_MCMDR, mcmdr);
+
+    /* Prod the device to accept a packet. */
+    emc_write(qts, mod, REG_RSDR, 1);
+}
+
+static void emc_recv_verify(QTestState *qts, const EMCModule *mod, int fd,
+                            bool with_irq)
+{
+    NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    uint32_t data_addr = DATA_ADDR;
+
+    /*
+     * Reset the device BEFORE sending a test packet, otherwise the packet
+     * may get swallowed by an active device of an earlier test.
+     */
+    init_rx_desc(&desc[0], NUM_RX_DESCRIPTORS, desc_addr, data_addr);
+    enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
+              with_irq ? REG_MIEN_ENRXINTR : 0, 0);
+
+    /* Prepare test data buffer. */
+    const char test[RX_DATA_LEN] = "TEST";
+    int len = htonl(sizeof(test));
+    const struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = (char *) test,
+            .iov_len = sizeof(test),
+        },
+    };
+
+    /* Send test packet to device's socket. */
+    int ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test));
+    g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
+
+    /* Wait for RX interrupt. */
+    if (with_irq) {
+        g_assert_true(emc_wait_irq(qts, mod, RX_STEP_COUNT, /*is_tx=*/false));
+    } else {
+        g_assert_true(emc_wait_mista(qts, mod, RX_STEP_COUNT, REG_MISTA_RXGD));
+    }
+
+    g_assert_cmphex(emc_read(qts, mod, REG_CRXDSA), ==,
+                    desc_addr + sizeof(desc[0]));
+
+    uint32_t expected_mask = 0xffff;
+    uint32_t expected_value = (REG_MISTA_DENI |
+                               REG_MISTA_RXGD |
+                               REG_MISTA_RXINTR);
+    g_assert_cmphex((emc_read(qts, mod, REG_MISTA) & expected_mask),
+                    ==, expected_value);
+
+    /* Read the descriptor back. */
+    NPCM7xxEMCRxDesc result_desc;
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    expected_mask = 0xffff << 16;
+    expected_value = RX_DESC_STATUS_RXGD;
+    if (with_irq) {
+        expected_value |= RX_DESC_STATUS_RXINTR;
+    }
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+    g_assert_cmpint(RX_DESC_PKT_LEN(result_desc.status_and_length), ==,
+                    RX_DATA_LEN + CRC_LENGTH);
+
+    char buffer[RX_DATA_LEN];
+    qtest_memread(qts, data_addr, buffer, sizeof(buffer));
+    g_assert_cmpstr(buffer, == , "TEST");
+}
+
+static void emc_test_ptle(QTestState *qts, const EMCModule *mod, int fd)
+{
+    NPCM7xxEMCRxDesc desc[NUM_RX_DESCRIPTORS];
+    uint32_t desc_addr = DESC_ADDR;
+    uint32_t data_addr = DATA_ADDR;
+
+    /*
+     * Reset the device BEFORE sending a test packet, otherwise the packet
+     * may get swallowed by an active device of an earlier test.
+     */
+    init_rx_desc(&desc[0], NUM_RX_DESCRIPTORS, desc_addr, data_addr);
+    enable_rx(qts, mod, &desc[0], NUM_RX_DESCRIPTORS, desc_addr,
+              REG_MIEN_ENRXINTR, REG_MCMDR_ALP);
+
+    /* Prepare test data buffer. */
+#define PTLE_DATA_LEN 1600
+    char test_data[PTLE_DATA_LEN];
+    memset(test_data, 42, sizeof(test_data));
+    int len = htonl(sizeof(test_data));
+    const struct iovec iov[] = {
+        {
+            .iov_base = &len,
+            .iov_len = sizeof(len),
+        },{
+            .iov_base = (char *) test_data,
+            .iov_len = sizeof(test_data),
+        },
+    };
+
+    /* Send test packet to device's socket. */
+    int ret = iov_send(fd, iov, 2, 0, sizeof(len) + sizeof(test_data));
+    g_assert_cmpint(ret, == , sizeof(test_data) + sizeof(len));
+
+    /* Wait for RX interrupt. */
+    g_assert_true(emc_wait_irq(qts, mod, RX_STEP_COUNT, /*is_tx=*/false));
+
+    /* Read the descriptor back. */
+    NPCM7xxEMCRxDesc result_desc;
+    qtest_memread(qts, desc_addr, &result_desc, sizeof(result_desc));
+    /* Descriptor should be owned by cpu now. */
+    g_assert((result_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK) == 0);
+    /* Test the status bits, ignoring the length field. */
+    uint32_t expected_mask = 0xffff << 16;
+    uint32_t expected_value = (RX_DESC_STATUS_RXGD |
+                               RX_DESC_STATUS_PTLE |
+                               RX_DESC_STATUS_RXINTR);
+    g_assert_cmphex((result_desc.status_and_length & expected_mask), ==,
+                    expected_value);
+    g_assert_cmpint(RX_DESC_PKT_LEN(result_desc.status_and_length), ==,
+                    PTLE_DATA_LEN + CRC_LENGTH);
+
+    char buffer[PTLE_DATA_LEN];
+    qtest_memread(qts, data_addr, buffer, sizeof(buffer));
+    g_assert(memcmp(buffer, test_data, PTLE_DATA_LEN) == 0);
+}
+
+static void test_tx(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    GString *cmd_line = g_string_new("-machine quanta-gsj");
+    int *test_sockets = packet_test_init(emc_module_index(td->module),
+                                         cmd_line);
+    QTestState *qts = qtest_init(cmd_line->str);
+
+    /*
+     * TODO: For pedantic correctness test_sockets[0] should be closed after
+     * the fork and before the exec, but that will require some harness
+     * improvements.
+     */
+    close(test_sockets[1]);
+    /* Defensive programming */
+    test_sockets[1] = -1;
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    emc_send_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
+    emc_send_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+
+    qtest_quit(qts);
+}
+
+static void test_rx(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    GString *cmd_line = g_string_new("-machine quanta-gsj");
+    int *test_sockets = packet_test_init(emc_module_index(td->module),
+                                         cmd_line);
+    QTestState *qts = qtest_init(cmd_line->str);
+
+    /*
+     * TODO: For pedantic correctness test_sockets[0] should be closed after
+     * the fork and before the exec, but that will require some harness
+     * improvements.
+     */
+    close(test_sockets[1]);
+    /* Defensive programming */
+    test_sockets[1] = -1;
+
+    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
+
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/false);
+    emc_recv_verify(qts, td->module, test_sockets[0], /*with_irq=*/true);
+    emc_test_ptle(qts, td->module, test_sockets[0]);
+
+    qtest_quit(qts);
+}
+
+static void emc_add_test(const char *name, const TestData* td,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_emc/emc[%d]/%s", emc_module_index(td->module), name);
+    qtest_add_data_func(full_name, td, fn);
+}
+#define add_test(name, td) emc_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    TestData test_data_list[ARRAY_SIZE(emc_module_list)];
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(emc_module_list); ++i) {
+        TestData *td = &test_data_list[i];
+
+        td->module = &emc_module_list[i];
+
+        add_test(init, td);
+        add_test(tx, td);
+        add_test(rx, td);
+    }
+
+    return g_test_run();
+}
-- 
2.30.0.280.ga3ce27912f-goog


