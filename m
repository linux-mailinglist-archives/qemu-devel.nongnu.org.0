Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DB3172F2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:09:48 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xgB-0003fN-Sr
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3eFgkYAgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbj-0000lx-O3
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:11 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:35226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3eFgkYAgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1l9xbG-0000jh-Gy
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:05:08 -0500
Received: by mail-pg1-x54a.google.com with SMTP id y14so2719057pgh.2
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=IIX1CQEMGBgP0/+Qajbx71yEP9nOU3v5Ay1Xf+kYExs=;
 b=XZZV9HKCZ4BaXsMkAHiBsgPy7UG6z/1dv02bIgKc8vcDiHy+h+e9TosNPepy+/fKrW
 kD2jEv5q7eq2IF9YHncNP+dCOtDpy97bHi44qgZ+ZxXKV1ZbNoxPtMnCQ66ME/V/M31W
 X2kVhk+OV8rhr9iVIWq4gJatdIEgKeMvkOopw+I1Re7iHlaJM783v6LzZ6z5scio2JHC
 hJgwwl3AyZjbP7yn0NoiSVgho3qyLmLsWezw0jjDj6NjLLS+8dXbLwUCznUSY6CzjipV
 lkXUSCsNlbQL0kwyHTpwnrGLB7MgfBmyB6Ox33biXoN1Q69F/R6RcHoGSaxFOFg8lr5y
 kBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=IIX1CQEMGBgP0/+Qajbx71yEP9nOU3v5Ay1Xf+kYExs=;
 b=sZZeg5mJ81/iQUZL3swhugP3b+UvBu8jfTQLGAOWoJOCIrdtxJLOCdeNBOGepJBWvP
 U4PRNQyBClFWQnBOvSja+lW746wNPw0aGD/8D6l+yin5tPwCrf/MfmJuxwZMtSdkvqTH
 X6mW1pTslTOhWmd0kADoNVMPPhcJIscDp8xLXX3b9V1Nys4ubMm1P+4hwpcXiXTqc0fA
 rgpj8Cw1PzR1C6UXHbuk8tbQSRiMfSnLRy2dlAaBgEHQKX0MqolpbyFgd9+cuf4MwVqp
 7/EKZ2K7m4ZuqN85/0gZpYPXNMQb3Ep0j4vk9cBbU1FMu0WeXayO1EC4x0DV7gtLA/Vn
 FwDQ==
X-Gm-Message-State: AOAM530NNAfn5uwSGq1k3eMc0Dlv2JZ85O91RCfOaM4A4jhvBNK7Modu
 OxbdyyCPatHT7KFZ/5xLfuJbBrpvhpgZ2g==
X-Google-Smtp-Source: ABdhPJzwvCAF7y8FBMGOMrk1yp4esWE1OOGQ3rpr+U2tmJUrTNFpcaxYsT0NS/V1BzlN70unVD+Y0QHQTVRdIg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:bd4a:b029:e1:1ccd:35b7 with SMTP
 id b10-20020a170902bd4ab02900e11ccd35b7mr5087383plx.30.1612994680653; Wed, 10
 Feb 2021 14:04:40 -0800 (PST)
Date: Wed, 10 Feb 2021 14:04:22 -0800
In-Reply-To: <20210210220426.3577804-1-wuhaotsh@google.com>
Message-Id: <20210210220426.3577804-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210210220426.3577804-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v3 1/5] hw/i2c: Implement NPCM7XX SMBus Module Single Mode
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com, cminyard@mvista.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3eFgkYAgKCsE31ohv0zonvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This commit implements the single-byte mode of the SMBus.

Each Nuvoton SoC has 16 System Management Bus (SMBus). These buses
compliant with SMBus and I2C protocol.

This patch implements the single-byte mode of the SMBus. In this mode,
the user sends or receives a byte each time. The SMBus device transmits
it to the underlying i2c device and sends an interrupt back to the QEMU
guest.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
Ack-by: Corey Minyard <cminyard@mvista.com>

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index a1786342e2..34fc799b2d 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -43,6 +43,7 @@ Supported devices
  * GPIO controller
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
+ * SMBus controller (SMBF)
 
 Missing devices
 ---------------
@@ -58,7 +59,6 @@ Missing devices
 
  * Ethernet controllers (GMAC and EMC)
  * USB device (USBD)
- * SMBus controller (SMBF)
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d1fe9bd1df..f8950f9470 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -102,6 +102,22 @@ enum NPCM7xxInterrupt {
     NPCM7XX_WDG2_IRQ,                   /* Timer Module 2 Watchdog */
     NPCM7XX_EHCI_IRQ            = 61,
     NPCM7XX_OHCI_IRQ            = 62,
+    NPCM7XX_SMBUS0_IRQ          = 64,
+    NPCM7XX_SMBUS1_IRQ,
+    NPCM7XX_SMBUS2_IRQ,
+    NPCM7XX_SMBUS3_IRQ,
+    NPCM7XX_SMBUS4_IRQ,
+    NPCM7XX_SMBUS5_IRQ,
+    NPCM7XX_SMBUS6_IRQ,
+    NPCM7XX_SMBUS7_IRQ,
+    NPCM7XX_SMBUS8_IRQ,
+    NPCM7XX_SMBUS9_IRQ,
+    NPCM7XX_SMBUS10_IRQ,
+    NPCM7XX_SMBUS11_IRQ,
+    NPCM7XX_SMBUS12_IRQ,
+    NPCM7XX_SMBUS13_IRQ,
+    NPCM7XX_SMBUS14_IRQ,
+    NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
     NPCM7XX_GPIO0_IRQ           = 116,
@@ -152,6 +168,26 @@ static const hwaddr npcm7xx_pwm_addr[] = {
     0xf0104000,
 };
 
+/* Direct memory-mapped access to each SMBus Module. */
+static const hwaddr npcm7xx_smbus_addr[] = {
+    0xf0080000,
+    0xf0081000,
+    0xf0082000,
+    0xf0083000,
+    0xf0084000,
+    0xf0085000,
+    0xf0086000,
+    0xf0087000,
+    0xf0088000,
+    0xf0089000,
+    0xf008a000,
+    0xf008b000,
+    0xf008c000,
+    0xf008d000,
+    0xf008e000,
+    0xf008f000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -353,6 +389,11 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "gpio[*]", &s->gpio[i], TYPE_NPCM7XX_GPIO);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
+        object_initialize_child(obj, "smbus[*]", &s->smbus[i],
+                                TYPE_NPCM7XX_SMBUS);
+    }
+
     object_initialize_child(obj, "ehci", &s->ehci, TYPE_NPCM7XX_EHCI);
     object_initialize_child(obj, "ohci", &s->ohci, TYPE_SYSBUS_OHCI);
 
@@ -509,6 +550,17 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            npcm7xx_irq(s, NPCM7XX_GPIO0_IRQ + i));
     }
 
+    /* SMBus modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_smbus_addr) != ARRAY_SIZE(s->smbus));
+    for (i = 0; i < ARRAY_SIZE(s->smbus); i++) {
+        Object *obj = OBJECT(&s->smbus[i]);
+
+        sysbus_realize(SYS_BUS_DEVICE(obj), &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(obj), 0, npcm7xx_smbus_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(obj), 0,
+                           npcm7xx_irq(s, NPCM7XX_SMBUS0_IRQ + i));
+    }
+
     /* USB Host */
     object_property_set_bool(OBJECT(&s->ehci), "companion-enable", true,
                              &error_abort);
@@ -576,22 +628,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[3]",     0xf0083000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[4]",     0xf0084000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[5]",     0xf0085000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[6]",     0xf0086000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[7]",     0xf0087000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[8]",     0xf0088000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[9]",     0xf0089000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[10]",    0xf008a000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[11]",    0xf008b000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[12]",    0xf008c000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[13]",    0xf008d000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[14]",    0xf008e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.smbus[15]",    0xf008f000,   4 * KiB);
     create_unimplemented_device("npcm7xx.espi",         0xf009f000,   4 * KiB);
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index 3a511539ad..cdcd694a7f 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -9,6 +9,7 @@ i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
 i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
+i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
 i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
 i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
new file mode 100644
index 0000000000..a465740623
--- /dev/null
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -0,0 +1,783 @@
+/*
+ * Nuvoton NPCM7xx SMBus Module.
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
+
+#include "hw/i2c/npcm7xx_smbus.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/guest-random.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+enum NPCM7xxSMBusCommonRegister {
+    NPCM7XX_SMB_SDA     = 0x0,
+    NPCM7XX_SMB_ST      = 0x2,
+    NPCM7XX_SMB_CST     = 0x4,
+    NPCM7XX_SMB_CTL1    = 0x6,
+    NPCM7XX_SMB_ADDR1   = 0x8,
+    NPCM7XX_SMB_CTL2    = 0xa,
+    NPCM7XX_SMB_ADDR2   = 0xc,
+    NPCM7XX_SMB_CTL3    = 0xe,
+    NPCM7XX_SMB_CST2    = 0x18,
+    NPCM7XX_SMB_CST3    = 0x19,
+    NPCM7XX_SMB_VER     = 0x1f,
+};
+
+enum NPCM7xxSMBusBank0Register {
+    NPCM7XX_SMB_ADDR3   = 0x10,
+    NPCM7XX_SMB_ADDR7   = 0x11,
+    NPCM7XX_SMB_ADDR4   = 0x12,
+    NPCM7XX_SMB_ADDR8   = 0x13,
+    NPCM7XX_SMB_ADDR5   = 0x14,
+    NPCM7XX_SMB_ADDR9   = 0x15,
+    NPCM7XX_SMB_ADDR6   = 0x16,
+    NPCM7XX_SMB_ADDR10  = 0x17,
+    NPCM7XX_SMB_CTL4    = 0x1a,
+    NPCM7XX_SMB_CTL5    = 0x1b,
+    NPCM7XX_SMB_SCLLT   = 0x1c,
+    NPCM7XX_SMB_FIF_CTL = 0x1d,
+    NPCM7XX_SMB_SCLHT   = 0x1e,
+};
+
+enum NPCM7xxSMBusBank1Register {
+    NPCM7XX_SMB_FIF_CTS  = 0x10,
+    NPCM7XX_SMB_FAIR_PER = 0x11,
+    NPCM7XX_SMB_TXF_CTL  = 0x12,
+    NPCM7XX_SMB_T_OUT    = 0x14,
+    NPCM7XX_SMB_TXF_STS  = 0x1a,
+    NPCM7XX_SMB_RXF_STS  = 0x1c,
+    NPCM7XX_SMB_RXF_CTL  = 0x1e,
+};
+
+/* ST fields */
+#define NPCM7XX_SMBST_STP           BIT(7)
+#define NPCM7XX_SMBST_SDAST         BIT(6)
+#define NPCM7XX_SMBST_BER           BIT(5)
+#define NPCM7XX_SMBST_NEGACK        BIT(4)
+#define NPCM7XX_SMBST_STASTR        BIT(3)
+#define NPCM7XX_SMBST_NMATCH        BIT(2)
+#define NPCM7XX_SMBST_MODE          BIT(1)
+#define NPCM7XX_SMBST_XMIT          BIT(0)
+
+/* CST fields */
+#define NPCM7XX_SMBCST_ARPMATCH        BIT(7)
+#define NPCM7XX_SMBCST_MATCHAF         BIT(6)
+#define NPCM7XX_SMBCST_TGSCL           BIT(5)
+#define NPCM7XX_SMBCST_TSDA            BIT(4)
+#define NPCM7XX_SMBCST_GCMATCH         BIT(3)
+#define NPCM7XX_SMBCST_MATCH           BIT(2)
+#define NPCM7XX_SMBCST_BB              BIT(1)
+#define NPCM7XX_SMBCST_BUSY            BIT(0)
+
+/* CST2 fields */
+#define NPCM7XX_SMBCST2_INTSTS         BIT(7)
+#define NPCM7XX_SMBCST2_MATCH7F        BIT(6)
+#define NPCM7XX_SMBCST2_MATCH6F        BIT(5)
+#define NPCM7XX_SMBCST2_MATCH5F        BIT(4)
+#define NPCM7XX_SMBCST2_MATCH4F        BIT(3)
+#define NPCM7XX_SMBCST2_MATCH3F        BIT(2)
+#define NPCM7XX_SMBCST2_MATCH2F        BIT(1)
+#define NPCM7XX_SMBCST2_MATCH1F        BIT(0)
+
+/* CST3 fields */
+#define NPCM7XX_SMBCST3_EO_BUSY        BIT(7)
+#define NPCM7XX_SMBCST3_MATCH10F       BIT(2)
+#define NPCM7XX_SMBCST3_MATCH9F        BIT(1)
+#define NPCM7XX_SMBCST3_MATCH8F        BIT(0)
+
+/* CTL1 fields */
+#define NPCM7XX_SMBCTL1_STASTRE     BIT(7)
+#define NPCM7XX_SMBCTL1_NMINTE      BIT(6)
+#define NPCM7XX_SMBCTL1_GCMEN       BIT(5)
+#define NPCM7XX_SMBCTL1_ACK         BIT(4)
+#define NPCM7XX_SMBCTL1_EOBINTE     BIT(3)
+#define NPCM7XX_SMBCTL1_INTEN       BIT(2)
+#define NPCM7XX_SMBCTL1_STOP        BIT(1)
+#define NPCM7XX_SMBCTL1_START       BIT(0)
+
+/* CTL2 fields */
+#define NPCM7XX_SMBCTL2_SCLFRQ(rv)  extract8((rv), 1, 6)
+#define NPCM7XX_SMBCTL2_ENABLE      BIT(0)
+
+/* CTL3 fields */
+#define NPCM7XX_SMBCTL3_SCL_LVL     BIT(7)
+#define NPCM7XX_SMBCTL3_SDA_LVL     BIT(6)
+#define NPCM7XX_SMBCTL3_BNK_SEL     BIT(5)
+#define NPCM7XX_SMBCTL3_400K_MODE   BIT(4)
+#define NPCM7XX_SMBCTL3_IDL_START   BIT(3)
+#define NPCM7XX_SMBCTL3_ARPMEN      BIT(2)
+#define NPCM7XX_SMBCTL3_SCLFRQ(rv)  extract8((rv), 0, 2)
+
+/* ADDR fields */
+#define NPCM7XX_ADDR_EN             BIT(7)
+#define NPCM7XX_ADDR_A(rv)          extract8((rv), 0, 6)
+
+#define KEEP_OLD_BIT(o, n, b)       (((n) & (~(b))) | ((o) & (b)))
+#define WRITE_ONE_CLEAR(o, n, b)    ((n) & (b) ? (o) & (~(b)) : (o))
+
+#define NPCM7XX_SMBUS_ENABLED(s)    ((s)->ctl2 & NPCM7XX_SMBCTL2_ENABLE)
+
+/* VERSION fields values, read-only. */
+#define NPCM7XX_SMBUS_VERSION_NUMBER 1
+#define NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED 0
+
+/* Reset values */
+#define NPCM7XX_SMB_ST_INIT_VAL     0x00
+#define NPCM7XX_SMB_CST_INIT_VAL    0x10
+#define NPCM7XX_SMB_CST2_INIT_VAL   0x00
+#define NPCM7XX_SMB_CST3_INIT_VAL   0x00
+#define NPCM7XX_SMB_CTL1_INIT_VAL   0x00
+#define NPCM7XX_SMB_CTL2_INIT_VAL   0x00
+#define NPCM7XX_SMB_CTL3_INIT_VAL   0xc0
+#define NPCM7XX_SMB_CTL4_INIT_VAL   0x07
+#define NPCM7XX_SMB_CTL5_INIT_VAL   0x00
+#define NPCM7XX_SMB_ADDR_INIT_VAL   0x00
+#define NPCM7XX_SMB_SCLLT_INIT_VAL  0x00
+#define NPCM7XX_SMB_SCLHT_INIT_VAL  0x00
+
+static uint8_t npcm7xx_smbus_get_version(void)
+{
+    return NPCM7XX_SMBUS_VERSION_FIFO_SUPPORTED << 7 |
+           NPCM7XX_SMBUS_VERSION_NUMBER;
+}
+
+static void npcm7xx_smbus_update_irq(NPCM7xxSMBusState *s)
+{
+    int level;
+
+    if (s->ctl1 & NPCM7XX_SMBCTL1_INTEN) {
+        level = !!((s->ctl1 & NPCM7XX_SMBCTL1_NMINTE &&
+                    s->st & NPCM7XX_SMBST_NMATCH) ||
+                   (s->st & NPCM7XX_SMBST_BER) ||
+                   (s->st & NPCM7XX_SMBST_NEGACK) ||
+                   (s->st & NPCM7XX_SMBST_SDAST) ||
+                   (s->ctl1 & NPCM7XX_SMBCTL1_STASTRE &&
+                    s->st & NPCM7XX_SMBST_SDAST) ||
+                   (s->ctl1 & NPCM7XX_SMBCTL1_EOBINTE &&
+                    s->cst3 & NPCM7XX_SMBCST3_EO_BUSY));
+
+        if (level) {
+            s->cst2 |= NPCM7XX_SMBCST2_INTSTS;
+        } else {
+            s->cst2 &= ~NPCM7XX_SMBCST2_INTSTS;
+        }
+        qemu_set_irq(s->irq, level);
+    }
+}
+
+static void npcm7xx_smbus_nack(NPCM7xxSMBusState *s)
+{
+    s->st &= ~NPCM7XX_SMBST_SDAST;
+    s->st |= NPCM7XX_SMBST_NEGACK;
+    s->status = NPCM7XX_SMBUS_STATUS_NEGACK;
+}
+
+static void npcm7xx_smbus_send_byte(NPCM7xxSMBusState *s, uint8_t value)
+{
+    int rv = i2c_send(s->bus, value);
+
+    if (rv) {
+        npcm7xx_smbus_nack(s);
+    } else {
+        s->st |= NPCM7XX_SMBST_SDAST;
+    }
+    trace_npcm7xx_smbus_send_byte((DEVICE(s)->canonical_path), value, !rv);
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
+{
+    s->sda = i2c_recv(s->bus);
+    s->st |= NPCM7XX_SMBST_SDAST;
+    if (s->st & NPCM7XX_SMBCTL1_ACK) {
+        trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
+        i2c_nack(s->bus);
+        s->st &= NPCM7XX_SMBCTL1_ACK;
+    }
+    trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_start(NPCM7xxSMBusState *s)
+{
+    /*
+     * We can start the bus if one of these is true:
+     * 1. The bus is idle (so we can request it)
+     * 2. We are the occupier (it's a repeated start condition.)
+     */
+    int available = !i2c_bus_busy(s->bus) ||
+                    s->status != NPCM7XX_SMBUS_STATUS_IDLE;
+
+    if (available) {
+        s->st |= NPCM7XX_SMBST_MODE | NPCM7XX_SMBST_XMIT | NPCM7XX_SMBST_SDAST;
+        s->cst |= NPCM7XX_SMBCST_BUSY;
+    } else {
+        s->st &= ~NPCM7XX_SMBST_MODE;
+        s->cst &= ~NPCM7XX_SMBCST_BUSY;
+        s->st |= NPCM7XX_SMBST_BER;
+    }
+
+    trace_npcm7xx_smbus_start(DEVICE(s)->canonical_path, available);
+    s->cst |= NPCM7XX_SMBCST_BB;
+    s->status = NPCM7XX_SMBUS_STATUS_IDLE;
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_send_address(NPCM7xxSMBusState *s, uint8_t value)
+{
+    int recv;
+    int rv;
+
+    recv = value & BIT(0);
+    rv = i2c_start_transfer(s->bus, value >> 1, recv);
+    trace_npcm7xx_smbus_send_address(DEVICE(s)->canonical_path,
+                                     value >> 1, recv, !rv);
+    if (rv) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: requesting i2c bus for 0x%02x failed: %d\n",
+                      DEVICE(s)->canonical_path, value, rv);
+        /* Failed to start transfer. NACK to reject.*/
+        if (recv) {
+            s->st &= ~NPCM7XX_SMBST_XMIT;
+        } else {
+            s->st |= NPCM7XX_SMBST_XMIT;
+        }
+        npcm7xx_smbus_nack(s);
+        npcm7xx_smbus_update_irq(s);
+        return;
+    }
+
+    s->st &= ~NPCM7XX_SMBST_NEGACK;
+    if (recv) {
+        s->status = NPCM7XX_SMBUS_STATUS_RECEIVING;
+        s->st &= ~NPCM7XX_SMBST_XMIT;
+    } else {
+        s->status = NPCM7XX_SMBUS_STATUS_SENDING;
+        s->st |= NPCM7XX_SMBST_XMIT;
+    }
+
+    if (s->ctl1 & NPCM7XX_SMBCTL1_STASTRE) {
+        s->st |= NPCM7XX_SMBST_STASTR;
+        if (!recv) {
+            s->st |= NPCM7XX_SMBST_SDAST;
+        }
+    } else if (recv) {
+        npcm7xx_smbus_recv_byte(s);
+    }
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_execute_stop(NPCM7xxSMBusState *s)
+{
+    i2c_end_transfer(s->bus);
+    s->st = 0;
+    s->cst = 0;
+    s->status = NPCM7XX_SMBUS_STATUS_IDLE;
+    s->cst3 |= NPCM7XX_SMBCST3_EO_BUSY;
+    trace_npcm7xx_smbus_stop(DEVICE(s)->canonical_path);
+    npcm7xx_smbus_update_irq(s);
+}
+
+
+static void npcm7xx_smbus_stop(NPCM7xxSMBusState *s)
+{
+    if (s->st & NPCM7XX_SMBST_MODE) {
+        switch (s->status) {
+        case NPCM7XX_SMBUS_STATUS_RECEIVING:
+        case NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE:
+            s->status = NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE;
+            break;
+
+        case NPCM7XX_SMBUS_STATUS_NEGACK:
+            s->status = NPCM7XX_SMBUS_STATUS_STOPPING_NEGACK;
+            break;
+
+        default:
+            npcm7xx_smbus_execute_stop(s);
+            break;
+        }
+    }
+}
+
+static uint8_t npcm7xx_smbus_read_sda(NPCM7xxSMBusState *s)
+{
+    uint8_t value = s->sda;
+
+    switch (s->status) {
+    case NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE:
+        npcm7xx_smbus_execute_stop(s);
+        break;
+
+    case NPCM7XX_SMBUS_STATUS_RECEIVING:
+        npcm7xx_smbus_recv_byte(s);
+        break;
+
+    default:
+        /* Do nothing */
+        break;
+    }
+
+    return value;
+}
+
+static void npcm7xx_smbus_write_sda(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->sda = value;
+    if (s->st & NPCM7XX_SMBST_MODE) {
+        switch (s->status) {
+        case NPCM7XX_SMBUS_STATUS_IDLE:
+            npcm7xx_smbus_send_address(s, value);
+            break;
+        case NPCM7XX_SMBUS_STATUS_SENDING:
+            npcm7xx_smbus_send_byte(s, value);
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: write to SDA in invalid status %d: %u\n",
+                          DEVICE(s)->canonical_path, s->status, value);
+            break;
+        }
+    }
+}
+
+static void npcm7xx_smbus_write_st(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->st = WRITE_ONE_CLEAR(s->st, value, NPCM7XX_SMBST_STP);
+    s->st = WRITE_ONE_CLEAR(s->st, value, NPCM7XX_SMBST_BER);
+    s->st = WRITE_ONE_CLEAR(s->st, value, NPCM7XX_SMBST_STASTR);
+    s->st = WRITE_ONE_CLEAR(s->st, value, NPCM7XX_SMBST_NMATCH);
+
+    if (value & NPCM7XX_SMBST_NEGACK) {
+        s->st &= ~NPCM7XX_SMBST_NEGACK;
+        if (s->status == NPCM7XX_SMBUS_STATUS_STOPPING_NEGACK) {
+            npcm7xx_smbus_execute_stop(s);
+        }
+    }
+
+    if (value & NPCM7XX_SMBST_STASTR &&
+            s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
+        npcm7xx_smbus_recv_byte(s);
+    }
+
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_write_cst(NPCM7xxSMBusState *s, uint8_t value)
+{
+    uint8_t new_value = s->cst;
+
+    s->cst = WRITE_ONE_CLEAR(new_value, value, NPCM7XX_SMBCST_BB);
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_write_cst3(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->cst3 = WRITE_ONE_CLEAR(s->cst3, value, NPCM7XX_SMBCST3_EO_BUSY);
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_write_ctl1(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->ctl1 = KEEP_OLD_BIT(s->ctl1, value,
+            NPCM7XX_SMBCTL1_START | NPCM7XX_SMBCTL1_STOP | NPCM7XX_SMBCTL1_ACK);
+
+    if (value & NPCM7XX_SMBCTL1_START) {
+        npcm7xx_smbus_start(s);
+    }
+
+    if (value & NPCM7XX_SMBCTL1_STOP) {
+        npcm7xx_smbus_stop(s);
+    }
+
+    npcm7xx_smbus_update_irq(s);
+}
+
+static void npcm7xx_smbus_write_ctl2(NPCM7xxSMBusState *s, uint8_t value)
+{
+    s->ctl2 = value;
+
+    if (!NPCM7XX_SMBUS_ENABLED(s)) {
+        /* Disable this SMBus module. */
+        s->ctl1 = 0;
+        s->st = 0;
+        s->cst3 = s->cst3 & (~NPCM7XX_SMBCST3_EO_BUSY);
+        s->cst = 0;
+    }
+}
+
+static void npcm7xx_smbus_write_ctl3(NPCM7xxSMBusState *s, uint8_t value)
+{
+    uint8_t old_ctl3 = s->ctl3;
+
+    /* Write to SDA and SCL bits are ignored. */
+    s->ctl3 =  KEEP_OLD_BIT(old_ctl3, value,
+                            NPCM7XX_SMBCTL3_SCL_LVL | NPCM7XX_SMBCTL3_SDA_LVL);
+}
+
+static uint64_t npcm7xx_smbus_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxSMBusState *s = opaque;
+    uint64_t value = 0;
+    uint8_t bank = s->ctl3 & NPCM7XX_SMBCTL3_BNK_SEL;
+
+    /* The order of the registers are their order in memory. */
+    switch (offset) {
+    case NPCM7XX_SMB_SDA:
+        value = npcm7xx_smbus_read_sda(s);
+        break;
+
+    case NPCM7XX_SMB_ST:
+        value = s->st;
+        break;
+
+    case NPCM7XX_SMB_CST:
+        value = s->cst;
+        break;
+
+    case NPCM7XX_SMB_CTL1:
+        value = s->ctl1;
+        break;
+
+    case NPCM7XX_SMB_ADDR1:
+        value = s->addr[0];
+        break;
+
+    case NPCM7XX_SMB_CTL2:
+        value = s->ctl2;
+        break;
+
+    case NPCM7XX_SMB_ADDR2:
+        value = s->addr[1];
+        break;
+
+    case NPCM7XX_SMB_CTL3:
+        value = s->ctl3;
+        break;
+
+    case NPCM7XX_SMB_CST2:
+        value = s->cst2;
+        break;
+
+    case NPCM7XX_SMB_CST3:
+        value = s->cst3;
+        break;
+
+    case NPCM7XX_SMB_VER:
+        value = npcm7xx_smbus_get_version();
+        break;
+
+    /* This register is either invalid or banked at this point. */
+    default:
+        if (bank) {
+            /* Bank 1 */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: read from invalid offset 0x%" HWADDR_PRIx "\n",
+                    DEVICE(s)->canonical_path, offset);
+        } else {
+            /* Bank 0 */
+            switch (offset) {
+            case NPCM7XX_SMB_ADDR3:
+                value = s->addr[2];
+                break;
+
+            case NPCM7XX_SMB_ADDR7:
+                value = s->addr[6];
+                break;
+
+            case NPCM7XX_SMB_ADDR4:
+                value = s->addr[3];
+                break;
+
+            case NPCM7XX_SMB_ADDR8:
+                value = s->addr[7];
+                break;
+
+            case NPCM7XX_SMB_ADDR5:
+                value = s->addr[4];
+                break;
+
+            case NPCM7XX_SMB_ADDR9:
+                value = s->addr[8];
+                break;
+
+            case NPCM7XX_SMB_ADDR6:
+                value = s->addr[5];
+                break;
+
+            case NPCM7XX_SMB_ADDR10:
+                value = s->addr[9];
+                break;
+
+            case NPCM7XX_SMB_CTL4:
+                value = s->ctl4;
+                break;
+
+            case NPCM7XX_SMB_CTL5:
+                value = s->ctl5;
+                break;
+
+            case NPCM7XX_SMB_SCLLT:
+                value = s->scllt;
+                break;
+
+            case NPCM7XX_SMB_SCLHT:
+                value = s->sclht;
+                break;
+
+            default:
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: read from invalid offset 0x%" HWADDR_PRIx "\n",
+                        DEVICE(s)->canonical_path, offset);
+                break;
+            }
+        }
+        break;
+    }
+
+    trace_npcm7xx_smbus_read(DEVICE(s)->canonical_path, offset, value, size);
+
+    return value;
+}
+
+static void npcm7xx_smbus_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size)
+{
+    NPCM7xxSMBusState *s = opaque;
+    uint8_t bank = s->ctl3 & NPCM7XX_SMBCTL3_BNK_SEL;
+
+    trace_npcm7xx_smbus_write(DEVICE(s)->canonical_path, offset, value, size);
+
+    /* The order of the registers are their order in memory. */
+    switch (offset) {
+    case NPCM7XX_SMB_SDA:
+        npcm7xx_smbus_write_sda(s, value);
+        break;
+
+    case NPCM7XX_SMB_ST:
+        npcm7xx_smbus_write_st(s, value);
+        break;
+
+    case NPCM7XX_SMB_CST:
+        npcm7xx_smbus_write_cst(s, value);
+        break;
+
+    case NPCM7XX_SMB_CTL1:
+        npcm7xx_smbus_write_ctl1(s, value);
+        break;
+
+    case NPCM7XX_SMB_ADDR1:
+        s->addr[0] = value;
+        break;
+
+    case NPCM7XX_SMB_CTL2:
+        npcm7xx_smbus_write_ctl2(s, value);
+        break;
+
+    case NPCM7XX_SMB_ADDR2:
+        s->addr[1] = value;
+        break;
+
+    case NPCM7XX_SMB_CTL3:
+        npcm7xx_smbus_write_ctl3(s, value);
+        break;
+
+    case NPCM7XX_SMB_CST2:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: write to read-only reg: offset 0x%" HWADDR_PRIx "\n",
+                DEVICE(s)->canonical_path, offset);
+        break;
+
+    case NPCM7XX_SMB_CST3:
+        npcm7xx_smbus_write_cst3(s, value);
+        break;
+
+    case NPCM7XX_SMB_VER:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "%s: write to read-only reg: offset 0x%" HWADDR_PRIx "\n",
+                DEVICE(s)->canonical_path, offset);
+        break;
+
+    /* This register is either invalid or banked at this point. */
+    default:
+        if (bank) {
+            /* Bank 1 */
+            qemu_log_mask(LOG_GUEST_ERROR,
+                    "%s: write to invalid offset 0x%" HWADDR_PRIx "\n",
+                    DEVICE(s)->canonical_path, offset);
+        } else {
+            /* Bank 0 */
+            switch (offset) {
+            case NPCM7XX_SMB_ADDR3:
+                s->addr[2] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR7:
+                s->addr[6] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR4:
+                s->addr[3] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR8:
+                s->addr[7] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR5:
+                s->addr[4] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR9:
+                s->addr[8] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR6:
+                s->addr[5] = value;
+                break;
+
+            case NPCM7XX_SMB_ADDR10:
+                s->addr[9] = value;
+                break;
+
+            case NPCM7XX_SMB_CTL4:
+                s->ctl4 = value;
+                break;
+
+            case NPCM7XX_SMB_CTL5:
+                s->ctl5 = value;
+                break;
+
+            case NPCM7XX_SMB_SCLLT:
+                s->scllt = value;
+                break;
+
+            case NPCM7XX_SMB_SCLHT:
+                s->sclht = value;
+                break;
+
+            default:
+                qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: write to invalid offset 0x%" HWADDR_PRIx "\n",
+                        DEVICE(s)->canonical_path, offset);
+                break;
+            }
+        }
+        break;
+    }
+}
+
+static const MemoryRegionOps npcm7xx_smbus_ops = {
+    .read = npcm7xx_smbus_read,
+    .write = npcm7xx_smbus_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+        .unaligned = false,
+    },
+};
+
+static void npcm7xx_smbus_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxSMBusState *s = NPCM7XX_SMBUS(obj);
+
+    s->st = NPCM7XX_SMB_ST_INIT_VAL;
+    s->cst = NPCM7XX_SMB_CST_INIT_VAL;
+    s->cst2 = NPCM7XX_SMB_CST2_INIT_VAL;
+    s->cst3 = NPCM7XX_SMB_CST3_INIT_VAL;
+    s->ctl1 = NPCM7XX_SMB_CTL1_INIT_VAL;
+    s->ctl2 = NPCM7XX_SMB_CTL2_INIT_VAL;
+    s->ctl3 = NPCM7XX_SMB_CTL3_INIT_VAL;
+    s->ctl4 = NPCM7XX_SMB_CTL4_INIT_VAL;
+    s->ctl5 = NPCM7XX_SMB_CTL5_INIT_VAL;
+
+    for (int i = 0; i < NPCM7XX_SMBUS_NR_ADDRS; ++i) {
+        s->addr[i] = NPCM7XX_SMB_ADDR_INIT_VAL;
+    }
+    s->scllt = NPCM7XX_SMB_SCLLT_INIT_VAL;
+    s->sclht = NPCM7XX_SMB_SCLHT_INIT_VAL;
+
+    s->status = NPCM7XX_SMBUS_STATUS_IDLE;
+}
+
+static void npcm7xx_smbus_hold_reset(Object *obj)
+{
+    NPCM7xxSMBusState *s = NPCM7XX_SMBUS(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static void npcm7xx_smbus_init(Object *obj)
+{
+    NPCM7xxSMBusState *s = NPCM7XX_SMBUS(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    sysbus_init_irq(sbd, &s->irq);
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_smbus_ops, s,
+                          "regs", 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    s->bus = i2c_init_bus(DEVICE(s), "i2c-bus");
+    s->status = NPCM7XX_SMBUS_STATUS_IDLE;
+}
+
+static const VMStateDescription vmstate_npcm7xx_smbus = {
+    .name = "npcm7xx-smbus",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(sda, NPCM7xxSMBusState),
+        VMSTATE_UINT8(st, NPCM7xxSMBusState),
+        VMSTATE_UINT8(cst, NPCM7xxSMBusState),
+        VMSTATE_UINT8(cst2, NPCM7xxSMBusState),
+        VMSTATE_UINT8(cst3, NPCM7xxSMBusState),
+        VMSTATE_UINT8(ctl1, NPCM7xxSMBusState),
+        VMSTATE_UINT8(ctl2, NPCM7xxSMBusState),
+        VMSTATE_UINT8(ctl3, NPCM7xxSMBusState),
+        VMSTATE_UINT8(ctl4, NPCM7xxSMBusState),
+        VMSTATE_UINT8(ctl5, NPCM7xxSMBusState),
+        VMSTATE_UINT8_ARRAY(addr, NPCM7xxSMBusState, NPCM7XX_SMBUS_NR_ADDRS),
+        VMSTATE_UINT8(scllt, NPCM7xxSMBusState),
+        VMSTATE_UINT8(sclht, NPCM7xxSMBusState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_smbus_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx System Management Bus";
+    dc->vmsd = &vmstate_npcm7xx_smbus;
+    rc->phases.enter = npcm7xx_smbus_enter_reset;
+    rc->phases.hold = npcm7xx_smbus_hold_reset;
+}
+
+static const TypeInfo npcm7xx_smbus_types[] = {
+    {
+        .name = TYPE_NPCM7XX_SMBUS,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(NPCM7xxSMBusState),
+        .class_init = npcm7xx_smbus_class_init,
+        .instance_init = npcm7xx_smbus_init,
+    },
+};
+DEFINE_TYPES(npcm7xx_smbus_types);
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 08db8fa689..c3bb70ad04 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -14,3 +14,14 @@ aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t val
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
 aspeed_i2c_bus_recv(const char *mode, int i, int count, uint8_t byte) "%s recv %d/%d 0x%02x"
+
+# npcm7xx_smbus.c
+
+npcm7xx_smbus_read(const char *id, uint64_t offset, uint64_t value, unsigned size) "%s offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
+npcm7xx_smbus_write(const char *id, uint64_t offset, uint64_t value, unsigned size) "%s offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
+npcm7xx_smbus_start(const char *id, int success) "%s starting, success: %d"
+npcm7xx_smbus_send_address(const char *id, uint8_t addr, int recv, int success) "%s sending address: 0x%02x, recv: %d, success: %d"
+npcm7xx_smbus_send_byte(const char *id, uint8_t value, int success) "%s send byte: 0x%02x, success: %d"
+npcm7xx_smbus_recv_byte(const char *id, uint8_t value) "%s recv byte: 0x%02x"
+npcm7xx_smbus_stop(const char *id) "%s stopping"
+npcm7xx_smbus_nack(const char *id) "%s nacking"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index f6227aa8aa..cea1bd1f62 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -20,6 +20,7 @@
 #include "hw/adc/npcm7xx_adc.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
+#include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
@@ -85,6 +86,7 @@ typedef struct NPCM7xxState {
     NPCM7xxMCState      mc;
     NPCM7xxRNGState     rng;
     NPCM7xxGPIOState    gpio[8];
+    NPCM7xxSMBusState   smbus[16];
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
new file mode 100644
index 0000000000..b9761a6993
--- /dev/null
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -0,0 +1,88 @@
+/*
+ * Nuvoton NPCM7xx SMBus Module.
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
+#ifndef NPCM7XX_SMBUS_H
+#define NPCM7XX_SMBUS_H
+
+#include "exec/memory.h"
+#include "hw/i2c/i2c.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+/*
+ * Number of addresses this module contains. Do not change this without
+ * incrementing the version_id in the vmstate.
+ */
+#define NPCM7XX_SMBUS_NR_ADDRS 10
+
+typedef enum NPCM7xxSMBusStatus {
+    NPCM7XX_SMBUS_STATUS_IDLE,
+    NPCM7XX_SMBUS_STATUS_SENDING,
+    NPCM7XX_SMBUS_STATUS_RECEIVING,
+    NPCM7XX_SMBUS_STATUS_NEGACK,
+    NPCM7XX_SMBUS_STATUS_STOPPING_LAST_RECEIVE,
+    NPCM7XX_SMBUS_STATUS_STOPPING_NEGACK,
+} NPCM7xxSMBusStatus;
+
+/*
+ * struct NPCM7xxSMBusState - System Management Bus device state.
+ * @bus: The underlying I2C Bus.
+ * @irq: GIC interrupt line to fire on events (if enabled).
+ * @sda: The serial data register.
+ * @st: The status register.
+ * @cst: The control status register.
+ * @cst2: The control status register 2.
+ * @cst3: The control status register 3.
+ * @ctl1: The control register 1.
+ * @ctl2: The control register 2.
+ * @ctl3: The control register 3.
+ * @ctl4: The control register 4.
+ * @ctl5: The control register 5.
+ * @addr: The SMBus module's own addresses on the I2C bus.
+ * @scllt: The SCL low time register.
+ * @sclht: The SCL high time register.
+ * @status: The current status of the SMBus.
+ */
+typedef struct NPCM7xxSMBusState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    I2CBus      *bus;
+    qemu_irq     irq;
+
+    uint8_t      sda;
+    uint8_t      st;
+    uint8_t      cst;
+    uint8_t      cst2;
+    uint8_t      cst3;
+    uint8_t      ctl1;
+    uint8_t      ctl2;
+    uint8_t      ctl3;
+    uint8_t      ctl4;
+    uint8_t      ctl5;
+    uint8_t      addr[NPCM7XX_SMBUS_NR_ADDRS];
+
+    uint8_t      scllt;
+    uint8_t      sclht;
+
+    NPCM7xxSMBusStatus status;
+} NPCM7xxSMBusState;
+
+#define TYPE_NPCM7XX_SMBUS "npcm7xx-smbus"
+#define NPCM7XX_SMBUS(obj) OBJECT_CHECK(NPCM7xxSMBusState, (obj), \
+                                        TYPE_NPCM7XX_SMBUS)
+
+#endif /* NPCM7XX_SMBUS_H */
-- 
2.30.0.478.g8a0d178c01-goog


