Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D870B3145EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 02:58:37 +0100 (CET)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9IIW-0001BU-UI
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 20:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pushYAMKCg0qwrt11tyr.p1z3rz7-qr8ry010t07.14t@flex--dje.bounces.google.com>)
 id 1l9IFu-0007GJ-01
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:54 -0500
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49]:43988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pushYAMKCg0qwrt11tyr.p1z3rz7-qr8ry010t07.14t@flex--dje.bounces.google.com>)
 id 1l9IFr-0006Y8-Le
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 20:55:53 -0500
Received: by mail-vk1-xa49.google.com with SMTP id d68so3820358vkg.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 17:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xx52fuubD03/PUi+QfwvrtZ3S5ST3zusPVlS3R6JDi0=;
 b=lIP3T6BHZ4iQGmqvo3sgzIFBxbnvYCEpyDitlOtcYEhGuEPSnSjGa+d7zr1ebZ0U0d
 lGqJgbaV1y+yfnI7BGrW1FReeAKXXy3OukUl8BFZwe8g1BBRIZwpfOXs/E2zDEcf4XfN
 51mG9J0hQfcn06fJ/kmCuT2/BmaQoUBX/rWM7bp83FYIAV+3PuTEkMw59jTVKYPnEj+B
 eNKUNzT4LPqjxXmFY8MghIr17KFfK1qM6jcO4fpdrXv70e4xF7ohpBB22VHwNSx68J0J
 l7CN9EsKYatTUSCsnhLnU0agFItcTUC0YiwnSCdpEgkDALIPix5WAkAcTWWHVrd/q0fF
 eMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xx52fuubD03/PUi+QfwvrtZ3S5ST3zusPVlS3R6JDi0=;
 b=pJNOHCgjo89VYji/Ci76zo9WXg9jbfgfjKIZeJIxS6qiCHXw5k47Q0I43NBP1KvxPW
 x8QkkMOBsYvZmyxGhnwdrcfbJHA5n/QoJDo0jRe78XFtpxa1l02ta+JjTqg8z+v55BvW
 csqDbCuUjg92+A/GwM0sCQWIzcFughUHF89PS/U7CMzu6t/2oXi39qZAp8tgnTaUU9Qh
 yb0ZObtXnQuxNEQ/BZQh5RELkMVDpUvYsqbSNUjUBiL/gzjX+GiyerpwWaadIAaR2PVH
 qqybf7jxObbMnt25/augiwy+r5Qt/lc8c4G6cWYkSBYXNTCEzNfUvHra5StGrC8NsQBi
 9s8A==
X-Gm-Message-State: AOAM530WUiYtdiF1g4No2sMJhDyZRDZbR9aRWOdhahfht4ie9mpJmZo8
 tDRhMxD7PLYLlJZ6XZo0SAaOaXdFgON4+dooId+5j5FHM0N/CX4gI7ZG7s6SOb4yp5IJxvXAaYD
 cTIUf5wy9e5emvaYGDNCiNygarJqUR+0wLykZHAvDHuj8sgHIFNnN
X-Google-Smtp-Source: ABdhPJxsxUyxCM3FzdON+ZVQjCa9nQkLAFX7REfhqVhgOGcPf2ZW3hn6wA0soMwiFOPCO1fNNy5RIzA=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:e459:49a8:64d6:2427])
 (user=dje job=sendgmr) by 2002:a05:6122:1206:: with SMTP id
 v6mr12346654vkc.21.1612835750346; Mon, 08 Feb 2021 17:55:50 -0800 (PST)
Date: Mon,  8 Feb 2021 17:55:40 -0800
In-Reply-To: <20210209015541.778833-1-dje@google.com>
Message-Id: <20210209015541.778833-3-dje@google.com>
Mime-Version: 1.0
References: <20210209015541.778833-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 2/3] hw/arm: Add npcm7xx emc model
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hao Wu <wuhaotsh@google.com>, Avi Fishman <avi.fishman@nuvoton.com>, 
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=3pushYAMKCg0qwrt11tyr.p1z3rz7-qr8ry010t07.14t@flex--dje.bounces.google.com;
 helo=mail-vk1-xa49.google.com
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

Differences from v2:
- none, patch ok as is

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
2.30.0.478.g8a0d178c01-goog


