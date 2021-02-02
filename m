Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169930CFE0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:30:54 +0100 (CET)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l758H-0001Kv-9c
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SuAZYAMKCnkagbdlldib.Zljnbjr-absbiklkdkr.lod@flex--dje.bounces.google.com>)
 id 1l756l-0000UP-09
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:29:19 -0500
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49]:47261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SuAZYAMKCnkagbdlldib.Zljnbjr-absbiklkdkr.lod@flex--dje.bounces.google.com>)
 id 1l756i-0000Ra-N2
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 18:29:18 -0500
Received: by mail-vs1-xe49.google.com with SMTP id n3so3453733vsq.14
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 15:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=evb4FxTYK4Yqcpeiv7aIG2qE4XiM3bjEduVBARI3Zlw=;
 b=wMvFJ9+VciRA+QnMOQgsyZNm1Wl6xMsPm4HtHuH2c6XPsaPD24I8+GhRIUHKzMiZkb
 LBtuowQNBEDzn8EZGnSsTFpl/M98zpDhovCFA8G42wQ6U2l0qIuWmu0cRNzda8KUpUqs
 3MmFeiIH6ILTDPAeVYmkElGznWr5VHibA69gzWUteqOOX3WoKZMFhH6PRfu0vm4ymkNV
 t/uidEps45hqd6uuAbuV2JBJx+9qo8u3zT7ScS43mWohj/6nnWvBtdpqVKp5IhnX7hpt
 nV4gSDlgkCm+Nzt3lS9dQqDQLYZU1GfcAewLnO82MUoWKiln2MwLHgrrM9zxtqIEsnmo
 3bAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=evb4FxTYK4Yqcpeiv7aIG2qE4XiM3bjEduVBARI3Zlw=;
 b=VHe6TXjxIrqC6fknyXKxJXbJgJ3r8FD2yjLN9FuZPTcEIa/bugbkRxtjmd8KNbyfu0
 Rltw4iKyJDVIkuayTb7tusok8lDFgBBxtYNI07YXcflTQHuJ/LnXJfxDXvrTgiTm5mKH
 JJMB1VkHpSADxoOD8ITReP9eDJYnce93mCHqgbo5sN4qwN5w7zjfzNaLhMb4zHYjUgdI
 WDS4Z5wqYCHHNmWe+6DfpLeStfwHWWKNGjmq2fvZRkH1LgnpAweFRemj7Ba07hvavQ+m
 4bJTQG8jTNAaelI9jdRXwzEzflF9XxNS6TZ/Kp7L6aAt8mJeMv4IEwA/d/S9Reu/HroZ
 TIfA==
X-Gm-Message-State: AOAM532QSWlhM3FoRX7sy47+ar1JBHPjC3NatlIrVH41beTO9zrl2hjJ
 bD626EfPgcsOiICB/25DltZpmRNXOzVEDJopiVann6rSUYRouiPxKFnLSRFb3FfbfnHC9cN15Y4
 HRTyGCxm4OGs5pmoakVpZ7YALNoLJO6kyd44iwyLE5xJGG2jW7W5g
X-Google-Smtp-Source: ABdhPJz0F3pnd3RMBTXe4BXCbpkqKZkykE6RVYKZ/aeGvpntmnTfOT4fqwhp1VdOmco0dBU2puzOKas=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:306e:8f0c:3be0:7750])
 (user=dje job=sendgmr) by 2002:a1f:5445:: with SMTP id
 i66mr224364vkb.24.1612308554119; 
 Tue, 02 Feb 2021 15:29:14 -0800 (PST)
Date: Tue,  2 Feb 2021 15:28:37 -0800
In-Reply-To: <20210202232838.1641382-1-dje@google.com>
Message-Id: <20210202232838.1641382-3-dje@google.com>
Mime-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 2/3] hw/arm: Add npcm7xx emc model
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=3SuAZYAMKCnkagbdlldib.Zljnbjr-absbiklkdkr.lod@flex--dje.bounces.google.com;
 helo=mail-vs1-xe49.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Avi Fishman <avi.fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
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
 docs/system/arm/nuvoton.rst |  3 ++-
 hw/arm/npcm7xx.c            | 50 +++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 52 insertions(+), 3 deletions(-)

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
-- 
2.30.0.365.g02bc693789-goog


