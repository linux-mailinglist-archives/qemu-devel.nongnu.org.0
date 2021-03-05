Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9E32F326
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:50:02 +0100 (CET)
Received: from localhost ([::1]:45944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFWT-0003hu-Ff
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EHtCYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1lIFNA-0006od-DC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:24 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:40384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EHtCYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN5-00070h-UQ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:40:24 -0500
Received: by mail-pj1-x1049.google.com with SMTP id j12so2193785pjm.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=JzuL+FT/e8ZT13uwYC+3Br913iPgglpWBDYCOC1jghw=;
 b=MkvBUOF08BnQOOqyMjB0gKvopl+jl4qd2Ro2uaVEWC82bTJ1+baM7XCnsT20kOvuj8
 HK5v7NV47M3FI+y3ygc5PFfbPPR7y9eU8lzzTTrVsPY0qaq5S8FKTAyBKIHY1wWUHQiR
 P2FByllx/bQNMRPe9p7ikdoboSa5RSBtk9gVqlb+LEbQnsSViVQlcrF4LSAY18ljKI48
 5rFMPwiBPMZ9watlJKp1/v5zmY1LB+P/0n2Uj+mYOJ7N+QTeO0swUfpSSCCP7OBSAcV6
 MZgtpxT8bRqkkm+4NgwkucG5/IamJQuaTNJwoIzZGnHr5KhDOB0SBCC60rERZ67UH7fh
 oHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JzuL+FT/e8ZT13uwYC+3Br913iPgglpWBDYCOC1jghw=;
 b=X61VJWle/5WcB07tYMyvKdflYMMtLOZ/UA0te5W3rey3Xku9A6BHifuqocGGjldabV
 kE+QSla0bbKrZm5Tl6dQksi2g3b07qT2jz6viiUIMFFir5n8IU+F1fYpO6szXkjL12bd
 m9XSOlO87VmHpqmk/F2l77MSX6Q8sw10eAO/Xjh4LFUYM3QpHvqVxYqW146TiN4bh9Uu
 uZs6PQspPz37Xue9OA0u19Kn+s9g3f96C7UGIQgVgGBnN84uoC3D89EE3jhbOoNCAJ45
 00ppXRUu0oEEYaZkytmoShHVQWmxgXxv3hevUmJ2wI+S2hpqai3kiq4WYmqpkT/A6mg2
 uN8Q==
X-Gm-Message-State: AOAM530ZtRIlMCwpkknDxhXCGCXf7/VZiTTbgCuAUrq/2uy3ab63tU7v
 60jM7A8FgMOlOQCm6UuxLAdfcWSOrKpOgQ==
X-Google-Smtp-Source: ABdhPJzjA9HnKj1luJuqQF9FxPZbwMyYKwcRF8GpHxDMp6moO7Y0IVDEWdx9dYCVnqHUrp6stsLiG+t9Ue9j7Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:904b:b029:e5:5cc5:877d with SMTP
 id w11-20020a170902904bb02900e55cc5877dmr10052412plz.50.1614969616984; Fri,
 05 Mar 2021 10:40:16 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:55 -0800
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Message-Id: <20210305183857.3120188-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 2/4] hw/misc: Add NPCM7XX MFT Module
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3EHtCYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-devel@nongnu.org>

This patch adds Multi Function Timer (MFT) module for NPCM7XX Soc.
This module is mainly used to configure PWM fans. It has just enough
functionality to make the PWM fan kernel module work.

The module takes two input, the max_rpm of a fan (modifiable via QMP)
and duty cycle (a GPIO from the PWM module.) The actual measured RPM
is equal to max_rpm * duty_cycle / NPCM7XX_PWM_MAX_DUTY. The RPM is
measured as a counter compared to a prescaled input clock. The kernel
driver reads this counter and report to user space.

Refs:
https://github.com/torvalds/linux/blob/master/drivers/hwmon/npcm750-pwm-fan.c

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst   |   2 +-
 hw/arm/npcm7xx.c              |  45 ++-
 hw/misc/meson.build           |   1 +
 hw/misc/npcm7xx_mft.c         | 541 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   8 +
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/misc/npcm7xx_mft.h |  70 +++++
 7 files changed, 660 insertions(+), 9 deletions(-)
 create mode 100644 hw/misc/npcm7xx_mft.c
 create mode 100644 include/hw/misc/npcm7xx_mft.h

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 34fc799b2d..3fd3e88479 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -44,6 +44,7 @@ Supported devices
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
  * SMBus controller (SMBF)
+ * Tachometer
 
 Missing devices
 ---------------
@@ -62,7 +63,6 @@ Missing devices
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
- * Tachometer
  * PCI and PCIe root complex and bridges
  * VDM and MCTP support
  * Serial I/O expansion
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index f8950f9470..da6f21d3c7 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -120,6 +120,14 @@ enum NPCM7xxInterrupt {
     NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_MFT0_IRQ            = 96,   /* MFT module 0 */
+    NPCM7XX_MFT1_IRQ,                   /* MFT module 1 */
+    NPCM7XX_MFT2_IRQ,                   /* MFT module 2 */
+    NPCM7XX_MFT3_IRQ,                   /* MFT module 3 */
+    NPCM7XX_MFT4_IRQ,                   /* MFT module 4 */
+    NPCM7XX_MFT5_IRQ,                   /* MFT module 5 */
+    NPCM7XX_MFT6_IRQ,                   /* MFT module 6 */
+    NPCM7XX_MFT7_IRQ,                   /* MFT module 7 */
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -168,6 +176,18 @@ static const hwaddr npcm7xx_pwm_addr[] = {
     0xf0104000,
 };
 
+/* Register base address for each MFT Module */
+static const hwaddr npcm7xx_mft_addr[] = {
+    0xf0180000,
+    0xf0181000,
+    0xf0182000,
+    0xf0183000,
+    0xf0184000,
+    0xf0185000,
+    0xf0186000,
+    0xf0187000,
+};
+
 /* Direct memory-mapped access to each SMBus Module. */
 static const hwaddr npcm7xx_smbus_addr[] = {
     0xf0080000,
@@ -406,6 +426,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        object_initialize_child(obj, "mft[*]", &s->mft[i], TYPE_NPCM7XX_MFT);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -589,6 +613,19 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
     }
 
+    /* MFT Modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_mft_addr) != ARRAY_SIZE(s->mft));
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->mft[i]);
+
+        qdev_connect_clock_in(DEVICE(&s->mft[i]), "clock-in",
+                              qdev_get_clock_out(DEVICE(&s->clk),
+                                                 "apb4-clock"));
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_mft_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, NPCM7XX_MFT0_IRQ + i));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -632,14 +669,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[3]",       0xf0183000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[4]",       0xf0184000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[5]",       0xf0185000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[6]",       0xf0186000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[7]",       0xf0187000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957f..b313679d37 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -65,6 +65,7 @@ softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
+  'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
diff --git a/hw/misc/npcm7xx_mft.c b/hw/misc/npcm7xx_mft.c
new file mode 100644
index 0000000000..0d5bfe8efa
--- /dev/null
+++ b/hw/misc/npcm7xx_mft.c
@@ -0,0 +1,541 @@
+/*
+ * Nuvoton NPCM7xx MFT Module
+ *
+ * Copyright 2021 Google LLC
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
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/npcm7xx_mft.h"
+#include "hw/misc/npcm7xx_pwm.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+/*
+ * Some of the registers can only accessed via 16-bit ops and some can only
+ * be accessed via 8-bit ops. However we mark all of them using REG16 to
+ * simplify implementation. npcm7xx_mft_check_mem_op checks the access length
+ * of memory operations.
+ */
+REG16(NPCM7XX_MFT_CNT1, 0x00);
+REG16(NPCM7XX_MFT_CRA, 0x02);
+REG16(NPCM7XX_MFT_CRB, 0x04);
+REG16(NPCM7XX_MFT_CNT2, 0x06);
+REG16(NPCM7XX_MFT_PRSC, 0x08);
+REG16(NPCM7XX_MFT_CKC, 0x0a);
+REG16(NPCM7XX_MFT_MCTRL, 0x0c);
+REG16(NPCM7XX_MFT_ICTRL, 0x0e);
+REG16(NPCM7XX_MFT_ICLR, 0x10);
+REG16(NPCM7XX_MFT_IEN, 0x12);
+REG16(NPCM7XX_MFT_CPA, 0x14);
+REG16(NPCM7XX_MFT_CPB, 0x16);
+REG16(NPCM7XX_MFT_CPCFG, 0x18);
+REG16(NPCM7XX_MFT_INASEL, 0x1a);
+REG16(NPCM7XX_MFT_INBSEL, 0x1c);
+
+/* Register Fields */
+#define NPCM7XX_MFT_CKC_C2CSEL          BIT(3)
+#define NPCM7XX_MFT_CKC_C1CSEL          BIT(0)
+
+#define NPCM7XX_MFT_MCTRL_TBEN          BIT(6)
+#define NPCM7XX_MFT_MCTRL_TAEN          BIT(5)
+#define NPCM7XX_MFT_MCTRL_TBEDG         BIT(4)
+#define NPCM7XX_MFT_MCTRL_TAEDG         BIT(3)
+#define NPCM7XX_MFT_MCTRL_MODE5         BIT(2)
+
+#define NPCM7XX_MFT_ICTRL_TFPND         BIT(5)
+#define NPCM7XX_MFT_ICTRL_TEPND         BIT(4)
+#define NPCM7XX_MFT_ICTRL_TDPND         BIT(3)
+#define NPCM7XX_MFT_ICTRL_TCPND         BIT(2)
+#define NPCM7XX_MFT_ICTRL_TBPND         BIT(1)
+#define NPCM7XX_MFT_ICTRL_TAPND         BIT(0)
+
+#define NPCM7XX_MFT_ICLR_TFCLR          BIT(5)
+#define NPCM7XX_MFT_ICLR_TECLR          BIT(4)
+#define NPCM7XX_MFT_ICLR_TDCLR          BIT(3)
+#define NPCM7XX_MFT_ICLR_TCCLR          BIT(2)
+#define NPCM7XX_MFT_ICLR_TBCLR          BIT(1)
+#define NPCM7XX_MFT_ICLR_TACLR          BIT(0)
+
+#define NPCM7XX_MFT_IEN_TFIEN           BIT(5)
+#define NPCM7XX_MFT_IEN_TEIEN           BIT(4)
+#define NPCM7XX_MFT_IEN_TDIEN           BIT(3)
+#define NPCM7XX_MFT_IEN_TCIEN           BIT(2)
+#define NPCM7XX_MFT_IEN_TBIEN           BIT(1)
+#define NPCM7XX_MFT_IEN_TAIEN           BIT(0)
+
+#define NPCM7XX_MFT_CPCFG_GET_B(rv)     extract8((rv), 4, 4)
+#define NPCM7XX_MFT_CPCFG_GET_A(rv)     extract8((rv), 0, 4)
+#define NPCM7XX_MFT_CPCFG_HIEN          BIT(3)
+#define NPCM7XX_MFT_CPCFG_EQEN          BIT(2)
+#define NPCM7XX_MFT_CPCFG_LOEN          BIT(1)
+#define NPCM7XX_MFT_CPCFG_CPSEL         BIT(0)
+
+#define NPCM7XX_MFT_INASEL_SELA         BIT(0)
+#define NPCM7XX_MFT_INBSEL_SELB         BIT(0)
+
+/* Max CNT values of the module. The CNT value is a countdown from it. */
+#define NPCM7XX_MFT_MAX_CNT             0xFFFF
+
+/* Each fan revolution should generated 2 pulses */
+#define NPCM7XX_MFT_PULSE_PER_REVOLUTION 2
+
+typedef enum NPCM7xxMFTCaptureState {
+    /* capture succeeded with a valid CNT value. */
+    NPCM7XX_CAPTURE_SUCCEED,
+    /* capture stopped prematurely due to reaching CPCFG condition. */
+    NPCM7XX_CAPTURE_COMPARE_HIT,
+    /* capture fails since it reaches underflow condition for CNT. */
+    NPCM7XX_CAPTURE_UNDERFLOW,
+} NPCM7xxMFTCaptureState;
+
+static void npcm7xx_mft_reset(NPCM7xxMFTState *s)
+{
+    int i;
+
+    /* Only registers PRSC ~ INBSEL need to be reset. */
+    for (i = R_NPCM7XX_MFT_PRSC; i <= R_NPCM7XX_MFT_INBSEL; ++i) {
+        s->regs[i] = 0;
+    }
+}
+
+static void npcm7xx_mft_clear_interrupt(NPCM7xxMFTState *s, uint8_t iclr)
+{
+    /*
+     * Clear bits in ICTRL where corresponding bits in iclr is 1.
+     * Both iclr and ictrl are 8-bit regs. (See npcm7xx_mft_check_mem_op)
+     */
+    s->regs[R_NPCM7XX_MFT_ICTRL] &= ~iclr;
+}
+
+/*
+ * If the CPCFG's condition should be triggered during count down from
+ * NPCM7XX_MFT_MAX_CNT to src if compared to tgt, return the count when
+ * the condition is triggered.
+ * Otherwise return -1.
+ * Since tgt is uint16_t it must always <= NPCM7XX_MFT_MAX_CNT.
+ */
+static int npcm7xx_mft_compare(int32_t src, uint16_t tgt, uint8_t cpcfg)
+{
+    if (cpcfg & NPCM7XX_MFT_CPCFG_HIEN) {
+        return NPCM7XX_MFT_MAX_CNT;
+    }
+    if ((cpcfg & NPCM7XX_MFT_CPCFG_EQEN) && (src <= tgt)) {
+        return tgt;
+    }
+    if ((cpcfg & NPCM7XX_MFT_CPCFG_LOEN) && (tgt > 0) && (src < tgt)) {
+        return tgt - 1;
+    }
+
+    return -1;
+}
+
+/* Compute CNT according to corresponding fan's RPM. */
+static NPCM7xxMFTCaptureState npcm7xx_mft_compute_cnt(
+    Clock *clock, uint32_t max_rpm, uint32_t duty, uint16_t tgt,
+    uint8_t cpcfg, uint16_t *cnt)
+{
+    uint32_t rpm = (uint64_t)max_rpm * (uint64_t)duty / NPCM7XX_PWM_MAX_DUTY;
+    int32_t count;
+    int stopped;
+    NPCM7xxMFTCaptureState state;
+
+    if (rpm == 0) {
+        /*
+         * If RPM = 0, capture won't happen. CNT will continue count down.
+         * So it's effective equivalent to have a cnt > NPCM7XX_MFT_MAX_CNT
+         */
+        count = NPCM7XX_MFT_MAX_CNT + 1;
+    } else {
+        /*
+         * RPM = revolution/min. The time for one revlution (in ns) is
+         * MINUTE_TO_NANOSECOND / RPM.
+         * TODO: Use the new clock_ns_to_ticks().
+         */
+        count = (60 * NANOSECONDS_PER_SECOND) / (rpm *
+            NPCM7XX_MFT_PULSE_PER_REVOLUTION * clock_ticks_to_ns(clock, 1));
+    }
+
+    if (count > NPCM7XX_MFT_MAX_CNT) {
+        count = -1;
+    } else {
+        /* The CNT is a countdown value from NPCM7XX_MFT_MAX_CNT. */
+        count = NPCM7XX_MFT_MAX_CNT - count;
+    }
+    stopped = npcm7xx_mft_compare(count, tgt, cpcfg);
+    if (stopped == -1) {
+        if (count == -1) {
+            /* Underflow */
+            state = NPCM7XX_CAPTURE_UNDERFLOW;
+        } else {
+            state = NPCM7XX_CAPTURE_SUCCEED;
+        }
+    } else {
+        count = stopped;
+        state = NPCM7XX_CAPTURE_COMPARE_HIT;
+    }
+
+    if (count != -1) {
+        *cnt = count;
+    }
+    trace_npcm7xx_mft_rpm(clock->canonical_path, clock_get_hz(clock),
+                          state, count, rpm, duty);
+    return state;
+}
+
+/*
+ * Capture Fan RPM and update CNT and CR registers accordingly.
+ * Raise IRQ if certain contidions are met in IEN.
+ */
+static void npcm7xx_mft_capture(NPCM7xxMFTState *s)
+{
+    int irq_level = 0;
+    NPCM7xxMFTCaptureState state;
+    int sel;
+    uint8_t cpcfg;
+
+    /*
+     * If not mode 5, the behavior is undefined. We just do nothing in this
+     * case.
+     */
+    if (!(s->regs[R_NPCM7XX_MFT_MCTRL] & NPCM7XX_MFT_MCTRL_MODE5)) {
+        return;
+    }
+
+    /* Capture input A. */
+    if (s->regs[R_NPCM7XX_MFT_MCTRL] & NPCM7XX_MFT_MCTRL_TAEN &&
+        s->regs[R_NPCM7XX_MFT_CKC] & NPCM7XX_MFT_CKC_C1CSEL) {
+        sel = s->regs[R_NPCM7XX_MFT_INASEL] & NPCM7XX_MFT_INASEL_SELA;
+        cpcfg = NPCM7XX_MFT_CPCFG_GET_A(s->regs[R_NPCM7XX_MFT_CPCFG]);
+        state = npcm7xx_mft_compute_cnt(s->clock_1,
+                                        sel ? s->max_rpm[2] : s->max_rpm[0],
+                                        sel ? s->duty[2] : s->duty[0],
+                                        s->regs[R_NPCM7XX_MFT_CPA],
+                                        cpcfg,
+                                        &s->regs[R_NPCM7XX_MFT_CNT1]);
+        switch (state) {
+        case NPCM7XX_CAPTURE_SUCCEED:
+            /* Interrupt on input capture on TAn transition - TAPND */
+            s->regs[R_NPCM7XX_MFT_CRA] = s->regs[R_NPCM7XX_MFT_CNT1];
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TAPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TAIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        case NPCM7XX_CAPTURE_COMPARE_HIT:
+            /* Compare Hit - TEPND */
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TEPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TEIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        case NPCM7XX_CAPTURE_UNDERFLOW:
+            /* Underflow - TCPND */
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TCPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TCIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    /* Capture input B. */
+    if (s->regs[R_NPCM7XX_MFT_MCTRL] & NPCM7XX_MFT_MCTRL_TBEN &&
+        s->regs[R_NPCM7XX_MFT_CKC] & NPCM7XX_MFT_CKC_C2CSEL) {
+        sel = s->regs[R_NPCM7XX_MFT_INBSEL] & NPCM7XX_MFT_INBSEL_SELB;
+        cpcfg = NPCM7XX_MFT_CPCFG_GET_B(s->regs[R_NPCM7XX_MFT_CPCFG]);
+        state = npcm7xx_mft_compute_cnt(s->clock_2,
+                                        sel ? s->max_rpm[3] : s->max_rpm[1],
+                                        sel ? s->duty[3] : s->duty[1],
+                                        s->regs[R_NPCM7XX_MFT_CPB],
+                                        cpcfg,
+                                        &s->regs[R_NPCM7XX_MFT_CNT2]);
+        switch (state) {
+        case NPCM7XX_CAPTURE_SUCCEED:
+            /* Interrupt on input capture on TBn transition - TBPND */
+            s->regs[R_NPCM7XX_MFT_CRB] = s->regs[R_NPCM7XX_MFT_CNT2];
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TBPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TBIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        case NPCM7XX_CAPTURE_COMPARE_HIT:
+            /* Compare Hit - TFPND */
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TFPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TFIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        case NPCM7XX_CAPTURE_UNDERFLOW:
+            /* Underflow - TDPND */
+            s->regs[R_NPCM7XX_MFT_ICTRL] |= NPCM7XX_MFT_ICTRL_TDPND;
+            if (s->regs[R_NPCM7XX_MFT_IEN] & NPCM7XX_MFT_IEN_TDIEN) {
+                irq_level = 1;
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    trace_npcm7xx_mft_capture(DEVICE(s)->canonical_path, irq_level);
+    qemu_set_irq(s->irq, irq_level);
+}
+
+/* Update clock for counters. */
+static void npcm7xx_mft_update_clock(void *opaque)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(opaque);
+    uint64_t prescaled_clock_period;
+
+    prescaled_clock_period = clock_get(s->clock_in) *
+        (s->regs[R_NPCM7XX_MFT_PRSC] + 1ULL);
+    trace_npcm7xx_mft_update_clock(s->clock_in->canonical_path,
+                                   s->regs[R_NPCM7XX_MFT_CKC],
+                                   clock_get(s->clock_in),
+                                   prescaled_clock_period);
+    /* Update clock 1 */
+    if (s->regs[R_NPCM7XX_MFT_CKC] & NPCM7XX_MFT_CKC_C1CSEL) {
+        /* Clock is prescaled. */
+        clock_update(s->clock_1, prescaled_clock_period);
+    } else {
+        /* Clock stopped. */
+        clock_update(s->clock_1, 0);
+    }
+    /* Update clock 2 */
+    if (s->regs[R_NPCM7XX_MFT_CKC] & NPCM7XX_MFT_CKC_C2CSEL) {
+        /* Clock is prescaled. */
+        clock_update(s->clock_2, prescaled_clock_period);
+    } else {
+        /* Clock stopped. */
+        clock_update(s->clock_2, 0);
+    }
+
+    npcm7xx_mft_capture(s);
+}
+
+static uint64_t npcm7xx_mft_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(opaque);
+    uint16_t value = 0;
+
+    switch (offset) {
+    case A_NPCM7XX_MFT_ICLR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is write-only\n",
+                      __func__, offset);
+        break;
+
+    default:
+        value = s->regs[offset / 2];
+    }
+
+    trace_npcm7xx_mft_read(DEVICE(s)->canonical_path, offset, value);
+    return value;
+}
+
+static void npcm7xx_mft_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(opaque);
+
+    trace_npcm7xx_mft_write(DEVICE(s)->canonical_path, offset, v);
+    switch (offset) {
+    case A_NPCM7XX_MFT_ICLR:
+        npcm7xx_mft_clear_interrupt(s, v);
+        break;
+
+    case A_NPCM7XX_MFT_CKC:
+    case A_NPCM7XX_MFT_PRSC:
+        s->regs[offset / 2] = v;
+        npcm7xx_mft_update_clock(s);
+        break;
+
+    default:
+        s->regs[offset / 2] = v;
+        npcm7xx_mft_capture(s);
+        break;
+    }
+}
+
+static bool npcm7xx_mft_check_mem_op(void *opaque, hwaddr offset,
+                                     unsigned size, bool is_write,
+                                     MemTxAttrs attrs)
+{
+    switch (offset) {
+    /* 16-bit registers. Must be accessed with 16-bit read/write.*/
+    case A_NPCM7XX_MFT_CNT1:
+    case A_NPCM7XX_MFT_CRA:
+    case A_NPCM7XX_MFT_CRB:
+    case A_NPCM7XX_MFT_CNT2:
+    case A_NPCM7XX_MFT_CPA:
+    case A_NPCM7XX_MFT_CPB:
+        return size == 2;
+
+    /* 8-bit registers. Must be accessed with 8-bit read/write.*/
+    case A_NPCM7XX_MFT_PRSC:
+    case A_NPCM7XX_MFT_CKC:
+    case A_NPCM7XX_MFT_MCTRL:
+    case A_NPCM7XX_MFT_ICTRL:
+    case A_NPCM7XX_MFT_ICLR:
+    case A_NPCM7XX_MFT_IEN:
+    case A_NPCM7XX_MFT_CPCFG:
+    case A_NPCM7XX_MFT_INASEL:
+    case A_NPCM7XX_MFT_INBSEL:
+        return size == 1;
+
+    default:
+        /* Invalid registers. */
+        return false;
+    }
+}
+
+static void npcm7xx_mft_get_max_rpm(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
+}
+
+static void npcm7xx_mft_set_max_rpm(Object *obj, Visitor *v, const char *name,
+                                    void *opaque, Error **errp)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
+    uint32_t *max_rpm = opaque;
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    *max_rpm = value;
+    npcm7xx_mft_capture(s);
+}
+
+static void npcm7xx_mft_duty_handler(void *opaque, int n, int value)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(opaque);
+
+    trace_npcm7xx_mft_set_duty(DEVICE(s)->canonical_path, n, value);
+    s->duty[n] = value;
+    npcm7xx_mft_capture(s);
+}
+
+static const struct MemoryRegionOps npcm7xx_mft_ops = {
+    .read       = npcm7xx_mft_read,
+    .write      = npcm7xx_mft_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 1,
+        .max_access_size        = 2,
+        .unaligned              = false,
+        .accepts                = npcm7xx_mft_check_mem_op,
+    },
+};
+
+static void npcm7xx_mft_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
+
+    npcm7xx_mft_reset(s);
+}
+
+static void npcm7xx_mft_hold_reset(Object *obj)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static void npcm7xx_mft_init(Object *obj)
+{
+    NPCM7xxMFTState *s = NPCM7XX_MFT(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_mft_ops, s,
+                          TYPE_NPCM7XX_MFT, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    s->clock_in = qdev_init_clock_in(dev, "clock-in",
+                                     npcm7xx_mft_update_clock, s);
+    s->clock_1 = qdev_init_clock_out(dev, "clock1");
+    s->clock_2 = qdev_init_clock_out(dev, "clock2");
+
+    for (int i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        object_property_add(obj, "max_rpm[*]", "uint32",
+                            npcm7xx_mft_get_max_rpm,
+                            npcm7xx_mft_set_max_rpm,
+                            NULL, &s->max_rpm[i]);
+    }
+    qdev_init_gpio_in_named(dev, npcm7xx_mft_duty_handler, "duty",
+                            NPCM7XX_MFT_FANIN_COUNT);
+}
+
+static const VMStateDescription vmstate_npcm7xx_mft = {
+    .name = "npcm7xx-mft-module",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(clock_in, NPCM7xxMFTState),
+        VMSTATE_CLOCK(clock_1, NPCM7xxMFTState),
+        VMSTATE_CLOCK(clock_2, NPCM7xxMFTState),
+        VMSTATE_UINT16_ARRAY(regs, NPCM7xxMFTState, NPCM7XX_MFT_NR_REGS),
+        VMSTATE_UINT32_ARRAY(max_rpm, NPCM7xxMFTState, NPCM7XX_MFT_FANIN_COUNT),
+        VMSTATE_UINT32_ARRAY(duty, NPCM7xxMFTState, NPCM7XX_MFT_FANIN_COUNT),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_mft_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx MFT Controller";
+    dc->vmsd = &vmstate_npcm7xx_mft;
+    rc->phases.enter = npcm7xx_mft_enter_reset;
+    rc->phases.hold = npcm7xx_mft_hold_reset;
+}
+
+static const TypeInfo npcm7xx_mft_info = {
+    .name               = TYPE_NPCM7XX_MFT,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxMFTState),
+    .class_init         = npcm7xx_mft_class_init,
+    .instance_init      = npcm7xx_mft_init,
+};
+
+static void npcm7xx_mft_register_type(void)
+{
+    type_register_static(&npcm7xx_mft_info);
+}
+type_init(npcm7xx_mft_register_type);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index d626b9d7a7..5388be7548 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -116,6 +116,14 @@ npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " valu
 npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
+# npcm7xx_mft.c
+npcm7xx_mft_read(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
+npcm7xx_mft_write(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
+npcm7xx_mft_rpm(const char *clock, uint32_t clock_hz, int state, int32_t cnt, uint32_t rpm, uint32_t duty) " fan clk: %s clock_hz: %" PRIu32 ", state: %d, cnt: %" PRIi32 ", rpm: %" PRIu32 ", duty: %" PRIu32
+npcm7xx_mft_capture(const char *name, int irq_level) "%s: level: %d"
+npcm7xx_mft_update_clock(const char *name, uint16_t sel, uint64_t clock_period, uint64_t prescaled_clock_period) "%s: sel: 0x%02" PRIx16 ", period: %" PRIu64 ", prescaled: %" PRIu64
+npcm7xx_mft_set_duty(const char *name, int n, int value) "%s[%d]: %d"
+
 # npcm7xx_rng.c
 npcm7xx_rng_read(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
 npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index cea1bd1f62..42d4c1f717 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -24,6 +24,7 @@
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/nvram/npcm7xx_otp.h"
@@ -81,6 +82,7 @@ typedef struct NPCM7xxState {
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
     NPCM7xxPWMState     pwm[2];
+    NPCM7xxMFTState     mft[8];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
new file mode 100644
index 0000000000..36785e3ba8
--- /dev/null
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -0,0 +1,70 @@
+/*
+ * Nuvoton NPCM7xx MFT Module
+ *
+ * Copyright 2021 Google LLC
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
+#ifndef NPCM7XX_MFT_H
+#define NPCM7XX_MFT_H
+
+#include "exec/memory.h"
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+/* Max Fan input number. */
+#define NPCM7XX_MFT_MAX_FAN_INPUT 19
+
+/*
+ * Number of registers in one MFT module. Don't change this without increasing
+ * the version_id in vmstate.
+ */
+#define NPCM7XX_MFT_NR_REGS (0x20 / sizeof(uint16_t))
+
+/*
+ * The MFT can take up to 4 inputs: A0, B0, A1, B1. It can measure one A and one
+ * B simultaneously. NPCM7XX_MFT_INASEL and NPCM7XX_MFT_INBSEL are used to
+ * select which A or B input are used.
+ */
+#define NPCM7XX_MFT_FANIN_COUNT 4
+
+/**
+ * struct NPCM7xxMFTState - Multi Functional Tachometer device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @clock_in: The input clock for MFT from CLK module.
+ * @clock_{1,2}: The counter clocks for NPCM7XX_MFT_CNT{1,2}
+ * @irq: The IRQ for this MFT state.
+ * @regs: The MMIO registers.
+ * @max_rpm: The maximum rpm for fans. Order: A0, B0, A1, B1.
+ * @duty: The duty cycles for fans, relative to NPCM7XX_PWM_MAX_DUTY.
+ */
+typedef struct NPCM7xxMFTState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    Clock       *clock_in;
+    Clock       *clock_1, *clock_2;
+    qemu_irq    irq;
+    uint16_t    regs[NPCM7XX_MFT_NR_REGS];
+
+    uint32_t    max_rpm[NPCM7XX_MFT_FANIN_COUNT];
+    uint32_t    duty[NPCM7XX_MFT_FANIN_COUNT];
+} NPCM7xxMFTState;
+
+#define TYPE_NPCM7XX_MFT "npcm7xx-mft"
+#define NPCM7XX_MFT(obj) \
+    OBJECT_CHECK(NPCM7xxMFTState, (obj), TYPE_NPCM7XX_MFT)
+
+#endif /* NPCM7XX_MFT_H */
-- 
2.30.1.766.gb4fecdf3b7-goog


