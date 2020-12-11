Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2052D8279
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:59:48 +0100 (CET)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrO6-00075E-2H
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WfHTXwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1knqp4-0006SG-Cb
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:34 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WfHTXwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1knqou-0003Mc-In
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:34 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id e68so3058316yba.7
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MsF+FCr9oTX2SC1xIYssCKl/y7N0YEXtQGB/Tub/9Bw=;
 b=fjnnVNwYFq0ld5pVxGvSMrtCPAPPHiyFPDKOYPtK1HyMEdQfqeD6rz+Evx2OXQmBJR
 5WJtlyr73wW7+RXwQZCWTb+WGG5XI80VnYh3qfXn9QVGJNTmR6YdTdEni3pZXjFkFcG0
 oHc29YL0T3s6zqBp++dePdQUDDAqTWa6VN+H10PgNHRNulx1j0+yJBWLtnRPj6znC0aK
 Jo8/ZSanR6JSNQnJbZEakLPYMgNbxRtOiA6lUasc3/mQ8OYH5RUaYUU1vANgbkWldt3G
 3fnH60bM+xKrkBFRwTsMGnD+UnV/U7zF58f8C7+J1/V3xG2vg9UlHAejoBcF/Bn3N1jY
 YyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MsF+FCr9oTX2SC1xIYssCKl/y7N0YEXtQGB/Tub/9Bw=;
 b=Wn5OaXz0SqUeJEVGdzM+qnnOn63CFuinMmy8zyVd0c8/sV9dLpQcVsyAtpn7DO/h+h
 p+KRUy/fGG1ysQHMT7ulmdouwGrBm6en+JtE1nhMVHzDxQu40NJPpa6MURo4KxfRAlTP
 zGnLpU248PGZfrcfAuQkb9QGYVrbkR3182dOZgachGoxZYnuhr0kzlj3+PLjdhs7aXT0
 Gd7MEZLZNnrEsN5APkwAiNWcd4eFEX7oHR8MwKNzu2I7zZMqn0TmphWKMTydU03DA/XD
 MFz4uAMwSe7SjjNOxlaNgMkKMXUPFIx9g8Ahhj35h+Xap/d5ysTjCDzjhRO29uARbDjj
 Mchw==
X-Gm-Message-State: AOAM5338WAf+oHkvPSQs3fkUNzLCJ8cwaL7XNoqwnwYsdHNPI1J6fUzE
 QVJ8kuN3EWXOoaLDGt09TAfdyR/jAmMTRg==
X-Google-Smtp-Source: ABdhPJzqNu0e7xrZW0ZiiR0l3q+5wD8wvk3f2u7NWVwd3GIUbojF3AY+5lRuTtP987BLt2uIXbDqJEvQG5Aj1A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:6003:: with SMTP id
 u3mr20253093ybb.126.1607725401854; Fri, 11 Dec 2020 14:23:21 -0800 (PST)
Date: Fri, 11 Dec 2020 14:22:23 -0800
In-Reply-To: <20201211222223.2252172-1-wuhaotsh@google.com>
Message-Id: <20201211222223.2252172-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201211222223.2252172-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v2 4/4] hw/misc: Add a PWM module for NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3WfHTXwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
identical PWM modules. Each module contains 4 PWM entries. Each PWM has
two outputs: frequency and duty_cycle. Both are computed using inputs
from software side.

This module does not model detail pulse signals since it is expensive.
It also does not model interrupts and watchdogs that are dependant on
the detail models. The interfaces for these are left in the module so
that anyone in need for these functionalities can implement on their
own.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst    |   2 +-
 hw/arm/npcm7xx.c               |  26 +-
 hw/misc/meson.build            |   1 +
 hw/misc/npcm7xx_pwm.c          | 535 +++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/misc/npcm7xx_pwm.h  | 106 +++++++
 tests/qtest/meson.build        |   1 +
 tests/qtest/npcm7xx_pwm-test.c | 490 ++++++++++++++++++++++++++++++
 8 files changed, 1160 insertions(+), 3 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/misc/npcm7xx_pwm.h
 create mode 100644 tests/qtest/npcm7xx_pwm-test.c

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 35829f8d0b..a1786342e2 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -42,6 +42,7 @@ Supported devices
  * USB host (USBH)
  * GPIO controller
  * Analog to Digital Converter (ADC)
+ * Pulse Width Modulation (PWM)
 
 Missing devices
 ---------------
@@ -61,7 +62,6 @@ Missing devices
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
- * Pulse Width Modulation (PWM)
  * Tachometer
  * PCI and PCIe root complex and bridges
  * VDM and MCTP support
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index b22a8c966d..72040d4079 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -102,6 +102,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_WDG2_IRQ,                   /* Timer Module 2 Watchdog */
     NPCM7XX_EHCI_IRQ            = 61,
     NPCM7XX_OHCI_IRQ            = 62,
+    NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
+    NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -144,6 +146,12 @@ static const hwaddr npcm7xx_fiu3_flash_addr[] = {
     0xb8000000, /* CS3 */
 };
 
+/* Register base address for each PWM Module */
+static const hwaddr npcm7xx_pwm_addr[] = {
+    0xf0103000,
+    0xf0104000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -353,6 +361,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, npcm7xx_fiu[i].name, &s->fiu[i],
                                 TYPE_NPCM7XX_FIU);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
+        object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -513,6 +525,18 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci), 0,
                        npcm7xx_irq(s, NPCM7XX_OHCI_IRQ));
 
+    /* PWM Modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pwm_addr) != ARRAY_SIZE(s->pwm));
+    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pwm[i]);
+
+        qdev_connect_clock_in(DEVICE(&s->pwm[i]), "clock", qdev_get_clock_out(
+                    DEVICE(&s->clk), "apb3-clock"));
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_pwm_addr[i]);
+        sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -580,8 +604,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pwm[0]",       0xf0103000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.pwm[1]",       0xf0104000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 * KiB);
     create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 * KiB);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ce15ffceb9..607cd38a21 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -64,6 +64,7 @@ softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
+  'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
new file mode 100644
index 0000000000..c1753b2e3d
--- /dev/null
+++ b/hw/misc/npcm7xx_pwm.c
@@ -0,0 +1,535 @@
+/*
+ * Nuvoton NPCM7xx PWM Module
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
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/npcm7xx_pwm.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+/* 32-bit register indices. */
+enum NPCM7xxPWMRegisters {
+    NPCM7XX_PWM_PPR,
+    NPCM7XX_PWM_CSR,
+    NPCM7XX_PWM_PCR,
+    NPCM7XX_PWM_CNR0,
+    NPCM7XX_PWM_CMR0,
+    NPCM7XX_PWM_PDR0,
+    NPCM7XX_PWM_CNR1,
+    NPCM7XX_PWM_CMR1,
+    NPCM7XX_PWM_PDR1,
+    NPCM7XX_PWM_CNR2,
+    NPCM7XX_PWM_CMR2,
+    NPCM7XX_PWM_PDR2,
+    NPCM7XX_PWM_CNR3,
+    NPCM7XX_PWM_CMR3,
+    NPCM7XX_PWM_PDR3,
+    NPCM7XX_PWM_PIER,
+    NPCM7XX_PWM_PIIR,
+    NPCM7XX_PWM_PWDR0,
+    NPCM7XX_PWM_PWDR1,
+    NPCM7XX_PWM_PWDR2,
+    NPCM7XX_PWM_PWDR3,
+    NPCM7XX_PWM_REGS_END,
+};
+
+/* Register field definitions. */
+#define NPCM7XX_PPR(rv, index)      extract32((rv), npcm7xx_ppr_base[index], 8)
+#define NPCM7XX_CSR(rv, index)      extract32((rv), npcm7xx_csr_base[index], 3)
+#define NPCM7XX_CH(rv, index)       extract32((rv), npcm7xx_ch_base[index], 4)
+#define NPCM7XX_CH_EN               BIT(0)
+#define NPCM7XX_CH_INV              BIT(2)
+#define NPCM7XX_CH_MOD              BIT(3)
+
+/* Offset of each PWM channel's prescaler in the PPR register. */
+static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
+/* Offset of each PWM channel's clock selector in the CSR register. */
+static const int npcm7xx_csr_base[] = { 0, 4, 8, 12 };
+/* Offset of each PWM channel's control variable in the PCR register. */
+static const int npcm7xx_ch_base[] = { 0, 8, 12, 16 };
+
+static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
+{
+    uint32_t ppr;
+    uint32_t csr;
+    uint32_t freq;
+
+    if (!p->running) {
+        return 0;
+    }
+
+    csr = NPCM7XX_CSR(p->module->csr, p->index);
+    ppr = NPCM7XX_PPR(p->module->ppr, p->index);
+    freq = clock_get_hz(p->module->clock);
+    freq /= ppr + 1;
+    /* csr can only be 0~4 */
+    if (csr > 4) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid csr value %u\n",
+                      __func__, csr);
+        csr = 4;
+    }
+    /* freq won't be changed if csr == 4. */
+    if (csr < 4) {
+        freq >>= csr + 1;
+    }
+
+    return freq / (p->cnr + 1);
+}
+
+static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
+{
+    uint64_t duty;
+
+    if (p->running) {
+        if (p->cnr == 0) {
+            duty = 0;
+        } else if (p->cmr >= p->cnr) {
+            duty = NPCM7XX_PWM_MAX_DUTY;
+        } else {
+            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
+        }
+    } else {
+        duty = 0;
+    }
+
+    if (p->inverted) {
+        duty = NPCM7XX_PWM_MAX_DUTY - duty;
+    }
+
+    return duty;
+}
+
+static void npcm7xx_pwm_calculate_output(NPCM7xxPWM *p)
+{
+    p->freq = npcm7xx_pwm_calculate_freq(p);
+    p->duty = npcm7xx_pwm_calculate_duty(p);
+}
+
+static void npcm7xx_pwm_write_ppr(NPCM7xxPWMState *s, uint32_t new_ppr)
+{
+    int i;
+    uint32_t old_ppr = s->ppr;
+
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ppr_base) != NPCM7XX_PWM_PER_MODULE);
+    s->ppr = new_ppr;
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        if (NPCM7XX_PPR(old_ppr, i) != NPCM7XX_PPR(new_ppr, i)) {
+            s->pwm[i].freq = npcm7xx_pwm_calculate_freq(&s->pwm[i]);
+        }
+    }
+}
+
+static void npcm7xx_pwm_write_csr(NPCM7xxPWMState *s, uint32_t new_csr)
+{
+    int i;
+    uint32_t old_csr = s->csr;
+
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_csr_base) != NPCM7XX_PWM_PER_MODULE);
+    s->csr = new_csr;
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        if (NPCM7XX_CSR(old_csr, i) != NPCM7XX_CSR(new_csr, i)) {
+            s->pwm[i].freq = npcm7xx_pwm_calculate_freq(&s->pwm[i]);
+        }
+    }
+}
+
+static void npcm7xx_pwm_write_pcr(NPCM7xxPWMState *s, uint32_t new_pcr)
+{
+    int i;
+    bool inverted;
+    uint32_t pcr;
+    NPCM7xxPWM *p;
+
+    s->pcr = new_pcr;
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ch_base) != NPCM7XX_PWM_PER_MODULE);
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        p = &s->pwm[i];
+        pcr = NPCM7XX_CH(new_pcr, i);
+        inverted = pcr & NPCM7XX_CH_INV;
+
+        /*
+         * We only run a PWM channel with toggle mode. Single-shot mode does not
+         * generate frequency and duty-cycle values.
+         */
+        if ((pcr & NPCM7XX_CH_EN) && (pcr & NPCM7XX_CH_MOD)) {
+            if (p->running) {
+                /* Re-run this PWM channel if inverted changed. */
+                if (p->inverted ^ inverted) {
+                    p->inverted = inverted;
+                    p->duty = npcm7xx_pwm_calculate_duty(p);
+                }
+            } else {
+                /* Run this PWM channel. */
+                p->running = true;
+                p->inverted = inverted;
+                npcm7xx_pwm_calculate_output(p);
+            }
+        } else {
+            /* Clear this PWM channel. */
+            p->running = false;
+            p->inverted = inverted;
+            npcm7xx_pwm_calculate_output(p);
+        }
+    }
+
+}
+
+static hwaddr npcm7xx_cnr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_PWM_CNR0:
+        return 0;
+    case NPCM7XX_PWM_CNR1:
+        return 1;
+    case NPCM7XX_PWM_CNR2:
+        return 2;
+    case NPCM7XX_PWM_CNR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_cmr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_PWM_CMR0:
+        return 0;
+    case NPCM7XX_PWM_CMR1:
+        return 1;
+    case NPCM7XX_PWM_CMR2:
+        return 2;
+    case NPCM7XX_PWM_CMR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_pdr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_PWM_PDR0:
+        return 0;
+    case NPCM7XX_PWM_PDR1:
+        return 1;
+    case NPCM7XX_PWM_PDR2:
+        return 2;
+    case NPCM7XX_PWM_PDR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static hwaddr npcm7xx_pwdr_index(hwaddr reg)
+{
+    switch (reg) {
+    case NPCM7XX_PWM_PWDR0:
+        return 0;
+    case NPCM7XX_PWM_PWDR1:
+        return 1;
+    case NPCM7XX_PWM_PWDR2:
+        return 2;
+    case NPCM7XX_PWM_PWDR3:
+        return 3;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t npcm7xx_pwm_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxPWMState *s = opaque;
+    hwaddr reg = offset / sizeof(uint32_t);
+    uint64_t value = 0;
+
+    switch (reg) {
+    case NPCM7XX_PWM_CNR0:
+    case NPCM7XX_PWM_CNR1:
+    case NPCM7XX_PWM_CNR2:
+    case NPCM7XX_PWM_CNR3:
+        value = s->pwm[npcm7xx_cnr_index(reg)].cnr;
+        break;
+
+    case NPCM7XX_PWM_CMR0:
+    case NPCM7XX_PWM_CMR1:
+    case NPCM7XX_PWM_CMR2:
+    case NPCM7XX_PWM_CMR3:
+        value = s->pwm[npcm7xx_cmr_index(reg)].cmr;
+        break;
+
+    case NPCM7XX_PWM_PDR0:
+    case NPCM7XX_PWM_PDR1:
+    case NPCM7XX_PWM_PDR2:
+    case NPCM7XX_PWM_PDR3:
+        value = s->pwm[npcm7xx_pdr_index(reg)].pdr;
+        break;
+
+    case NPCM7XX_PWM_PWDR0:
+    case NPCM7XX_PWM_PWDR1:
+    case NPCM7XX_PWM_PWDR2:
+    case NPCM7XX_PWM_PWDR3:
+        value = s->pwm[npcm7xx_pwdr_index(reg)].pwdr;
+        break;
+
+    case NPCM7XX_PWM_PPR:
+        value = s->ppr;
+        break;
+
+    case NPCM7XX_PWM_CSR:
+        value = s->csr;
+        break;
+
+    case NPCM7XX_PWM_PCR:
+        value = s->pcr;
+        break;
+
+    case NPCM7XX_PWM_PIER:
+        value = s->pier;
+        break;
+
+    case NPCM7XX_PWM_PIIR:
+        value = s->piir;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return value;
+}
+
+static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
+                                uint64_t v, unsigned size)
+{
+    NPCM7xxPWMState *s = opaque;
+    NPCM7xxPWM *p;
+    hwaddr reg = offset / sizeof(uint32_t);
+    uint32_t value = v;
+
+    switch (reg) {
+    case NPCM7XX_PWM_CNR0:
+    case NPCM7XX_PWM_CNR1:
+    case NPCM7XX_PWM_CNR2:
+    case NPCM7XX_PWM_CNR3:
+        p = &s->pwm[npcm7xx_cnr_index(reg)];
+        p->cnr = value;
+        npcm7xx_pwm_calculate_output(p);
+        break;
+
+    case NPCM7XX_PWM_CMR0:
+    case NPCM7XX_PWM_CMR1:
+    case NPCM7XX_PWM_CMR2:
+    case NPCM7XX_PWM_CMR3:
+        p = &s->pwm[npcm7xx_cmr_index(reg)];
+        p->cmr = value;
+        npcm7xx_pwm_calculate_output(p);
+        break;
+
+    case NPCM7XX_PWM_PDR0:
+    case NPCM7XX_PWM_PDR1:
+    case NPCM7XX_PWM_PDR2:
+    case NPCM7XX_PWM_PDR3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                      __func__, offset);
+        break;
+
+    case NPCM7XX_PWM_PWDR0:
+    case NPCM7XX_PWM_PWDR1:
+    case NPCM7XX_PWM_PWDR2:
+    case NPCM7XX_PWM_PWDR3:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    case NPCM7XX_PWM_PPR:
+        npcm7xx_pwm_write_ppr(s, value);
+        break;
+
+    case NPCM7XX_PWM_CSR:
+        npcm7xx_pwm_write_csr(s, value);
+        break;
+
+    case NPCM7XX_PWM_PCR:
+        npcm7xx_pwm_write_pcr(s, value);
+        break;
+
+    case NPCM7XX_PWM_PIER:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    case NPCM7XX_PWM_PIIR:
+        qemu_log_mask(LOG_UNIMP,
+                     "%s: register @ 0x%04" HWADDR_PRIx " is not implemented\n",
+                     __func__, offset);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+
+static const struct MemoryRegionOps npcm7xx_pwm_ops = {
+    .read       = npcm7xx_pwm_read,
+    .write      = npcm7xx_pwm_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+static void npcm7xx_pwm_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        NPCM7xxPWM *p = &s->pwm[i];
+
+        p->cnr = 0x00000000;
+        p->cmr = 0x00000000;
+        p->pdr = 0x00000000;
+        p->pwdr = 0x00000000;
+    }
+
+    s->ppr = 0x00000000;
+    s->csr = 0x00000000;
+    s->pcr = 0x00000000;
+    s->pier = 0x00000000;
+    s->piir = 0x00000000;
+}
+
+static void npcm7xx_pwm_hold_reset(Object *obj)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        qemu_irq_lower(s->pwm[i].irq);
+    }
+}
+
+static void npcm7xx_pwm_init(Object *obj)
+{
+    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
+    SysBusDevice *sbd = &s->parent;
+    int i;
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
+        NPCM7xxPWM *p = &s->pwm[i];
+        p->module = s;
+        p->index = i;
+        sysbus_init_irq(sbd, &p->irq);
+    }
+
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_pwm_ops, s,
+                          TYPE_NPCM7XX_PWM, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
+
+    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
+        object_property_add_uint32_ptr(obj, "freq[*]",
+                &s->pwm[i].freq, OBJ_PROP_FLAG_READ);
+        object_property_add_uint32_ptr(obj, "duty[*]",
+                &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
+    }
+}
+
+static const VMStateDescription vmstate_npcm7xx_pwm = {
+    .name = "npcm7xx-pwm",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(running, NPCM7xxPWM),
+        VMSTATE_BOOL(inverted, NPCM7xxPWM),
+        VMSTATE_UINT8(index, NPCM7xxPWM),
+        VMSTATE_UINT32(cnr, NPCM7xxPWM),
+        VMSTATE_UINT32(cmr, NPCM7xxPWM),
+        VMSTATE_UINT32(pdr, NPCM7xxPWM),
+        VMSTATE_UINT32(pwdr, NPCM7xxPWM),
+        VMSTATE_UINT32(freq, NPCM7xxPWM),
+        VMSTATE_UINT32(duty, NPCM7xxPWM),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static const VMStateDescription vmstate_npcm7xx_pwm_module = {
+    .name = "npcm7xx-pwm-module",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(clock, NPCM7xxPWMState),
+        VMSTATE_STRUCT_ARRAY(pwm, NPCM7xxPWMState,
+                             NPCM7XX_PWM_PER_MODULE, 0, vmstate_npcm7xx_pwm,
+                             NPCM7xxPWM),
+        VMSTATE_UINT32(ppr, NPCM7xxPWMState),
+        VMSTATE_UINT32(csr, NPCM7xxPWMState),
+        VMSTATE_UINT32(pcr, NPCM7xxPWMState),
+        VMSTATE_UINT32(pier, NPCM7xxPWMState),
+        VMSTATE_UINT32(piir, NPCM7xxPWMState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_pwm_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_PWM_REGS_END > NPCM7XX_PWM_NR_REGS);
+
+    dc->desc = "NPCM7xx PWM Controller";
+    dc->vmsd = &vmstate_npcm7xx_pwm_module;
+    rc->phases.enter = npcm7xx_pwm_enter_reset;
+    rc->phases.hold = npcm7xx_pwm_hold_reset;
+}
+
+static const TypeInfo npcm7xx_pwm_info = {
+    .name               = TYPE_NPCM7XX_PWM,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxPWMState),
+    .class_init         = npcm7xx_pwm_class_init,
+    .instance_init      = npcm7xx_pwm_init,
+};
+
+static void npcm7xx_pwm_register_type(void)
+{
+    type_register_static(&npcm7xx_pwm_info);
+}
+type_init(npcm7xx_pwm_register_type);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 51e1c7620d..f6227aa8aa 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -23,6 +23,7 @@
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
@@ -78,6 +79,7 @@ typedef struct NPCM7xxState {
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
+    NPCM7xxPWMState     pwm[2];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
new file mode 100644
index 0000000000..b83f965f1a
--- /dev/null
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -0,0 +1,106 @@
+/*
+ * Nuvoton NPCM7xx PWM Module
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
+#ifndef NPCM7XX_PWM_H
+#define NPCM7XX_PWM_H
+
+#include "qemu/osdep.h"
+#include "hw/clock.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+/* Each PWM module holds 4 PWM channels. */
+#define NPCM7XX_PWM_PER_MODULE 4
+
+/*
+ * Number of registers in one pwm module. Don't change this without increasing
+ * the version_id in vmstate.
+ */
+#define NPCM7XX_PWM_NR_REGS (0x54 / sizeof(uint32_t))
+
+/*
+ * The maximum duty values. Each duty unit represents 1/NPCM7XX_PWM_MAX_DUTY
+ * cycles. For example, if NPCM7XX_PWM_MAX_DUTY=1,000,000 and a PWM has a duty
+ * value of 100,000 the duty cycle for that PWM is 10%.
+ */
+#define NPCM7XX_PWM_MAX_DUTY 1000000
+
+typedef struct NPCM7xxPWMState NPCM7xxPWMState;
+
+/**
+ * struct NPCM7xxPWM - The state of a single PWM channel.
+ * @module: The PWM module that contains this channel.
+ * @irq: GIC interrupt line to fire on expiration if enabled.
+ * @running: Whether this PWM channel is generating output.
+ * @inverted: Whether this PWM channel is inverted.
+ * @index: The index of this PWM channel.
+ * @cnr: The counter register.
+ * @cmr: The comparator register.
+ * @pdr: The data register.
+ * @pwdr: The watchdog register.
+ * @freq: The frequency of this PWM channel.
+ * @duty: The duty cycle of this PWM channel. One unit represents
+ *   1/NPCM7XX_MAX_DUTY cycles.
+ */
+typedef struct NPCM7xxPWM {
+    NPCM7xxPWMState         *module;
+
+    qemu_irq                irq;
+
+    bool                    running;
+    bool                    inverted;
+
+    uint8_t                 index;
+    uint32_t                cnr;
+    uint32_t                cmr;
+    uint32_t                pdr;
+    uint32_t                pwdr;
+
+    uint32_t                freq;
+    uint32_t                duty;
+} NPCM7xxPWM;
+
+/**
+ * struct NPCM7xxPWMState - Pulse Width Modulation device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @clock: The PWM clock.
+ * @pwm: The PWM channels owned by this module.
+ * @ppr: The prescaler register.
+ * @csr: The clock selector register.
+ * @pcr: The control register.
+ * @pier: The interrupt enable register.
+ * @piir: The interrupt indication register.
+ */
+struct NPCM7xxPWMState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    Clock       *clock;
+    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
+
+    uint32_t    ppr;
+    uint32_t    csr;
+    uint32_t    pcr;
+    uint32_t    pier;
+    uint32_t    piir;
+};
+
+#define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
+#define NPCM7XX_PWM(obj) \
+    OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)
+
+#endif /* NPCM7XX_PWM_H */
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 955710d1c5..0b5467f084 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -136,6 +136,7 @@ qtests_sparc64 = \
 qtests_npcm7xx = \
   ['npcm7xx_adc-test',
    'npcm7xx_gpio-test',
+   'npcm7xx_pwm-test',
    'npcm7xx_rng-test',
    'npcm7xx_timer-test',
    'npcm7xx_watchdog_timer-test']
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
new file mode 100644
index 0000000000..33fbdf5f54
--- /dev/null
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -0,0 +1,490 @@
+/*
+ * QTests for Nuvoton NPCM7xx PWM Modules.
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
+#include "qemu/bitops.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qnum.h"
+
+#define REF_HZ          25000000
+
+/* Register field definitions. */
+#define CH_EN           BIT(0)
+#define CH_INV          BIT(2)
+#define CH_MOD          BIT(3)
+
+/* Registers shared between all PWMs in a module */
+#define PPR             0x00
+#define CSR             0x04
+#define PCR             0x08
+#define PIER            0x3c
+#define PIIR            0x40
+
+/* CLK module related */
+#define CLK_BA          0xf0801000
+#define CLKSEL          0x04
+#define CLKDIV1         0x08
+#define CLKDIV2         0x2c
+#define PLLCON0         0x0c
+#define PLLCON1         0x10
+#define PLL_INDV(rv)    extract32((rv), 0, 6)
+#define PLL_FBDV(rv)    extract32((rv), 16, 12)
+#define PLL_OTDV1(rv)   extract32((rv), 8, 3)
+#define PLL_OTDV2(rv)   extract32((rv), 13, 3)
+#define APB3CKDIV(rv)   extract32((rv), 28, 2)
+#define CLK2CKDIV(rv)   extract32((rv), 0, 1)
+#define CLK4CKDIV(rv)   extract32((rv), 26, 2)
+#define CPUCKSEL(rv)    extract32((rv), 0, 2)
+
+#define MAX_DUTY        1000000
+
+typedef struct PWMModule {
+    int irq;
+    uint64_t base_addr;
+} PWMModule;
+
+typedef struct PWM {
+    uint32_t cnr_offset;
+    uint32_t cmr_offset;
+    uint32_t pdr_offset;
+    uint32_t pwdr_offset;
+} PWM;
+
+typedef struct TestData {
+    const PWMModule *module;
+    const PWM *pwm;
+} TestData;
+
+static const PWMModule pwm_module_list[] = {
+    {
+        .irq        = 93,
+        .base_addr  = 0xf0103000
+    },
+    {
+        .irq        = 94,
+        .base_addr  = 0xf0104000
+    }
+};
+
+static const PWM pwm_list[] = {
+    {
+        .cnr_offset     = 0x0c,
+        .cmr_offset     = 0x10,
+        .pdr_offset     = 0x14,
+        .pwdr_offset    = 0x44,
+    },
+    {
+        .cnr_offset     = 0x18,
+        .cmr_offset     = 0x1c,
+        .pdr_offset     = 0x20,
+        .pwdr_offset    = 0x48,
+    },
+    {
+        .cnr_offset     = 0x24,
+        .cmr_offset     = 0x28,
+        .pdr_offset     = 0x2c,
+        .pwdr_offset    = 0x4c,
+    },
+    {
+        .cnr_offset     = 0x30,
+        .cmr_offset     = 0x34,
+        .pdr_offset     = 0x38,
+        .pwdr_offset    = 0x50,
+    },
+};
+
+static const int ppr_base[] = { 0, 0, 8, 8 };
+static const int csr_base[] = { 0, 4, 8, 12 };
+static const int pcr_base[] = { 0, 8, 12, 16 };
+
+static const uint32_t ppr_list[] = {
+    0,
+    1,
+    10,
+    100,
+    255, /* Max possible value. */
+};
+
+static const uint32_t csr_list[] = {
+    0,
+    1,
+    2,
+    3,
+    4, /* Max possible value. */
+};
+
+static const uint32_t cnr_list[] = {
+    0,
+    1,
+    50,
+    100,
+    150,
+    200,
+    1000,
+    10000,
+    65535, /* Max possible value. */
+};
+
+static const uint32_t cmr_list[] = {
+    0,
+    1,
+    10,
+    50,
+    100,
+    150,
+    200,
+    1000,
+    10000,
+    65535, /* Max possible value. */
+};
+
+/* Returns the index of the PWM module. */
+static int pwm_module_index(const PWMModule *module)
+{
+    ptrdiff_t diff = module - pwm_module_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
+
+    return diff;
+}
+
+/* Returns the index of the PWM entry. */
+static int pwm_index(const PWM *pwm)
+{
+    ptrdiff_t diff = pwm - pwm_list;
+
+    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
+
+    return diff;
+}
+
+static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char *name)
+{
+    QDict *response;
+
+    g_test_message("Getting properties %s from %s", name, path);
+    response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
+            " 'arguments': { 'path': %s, 'property': %s}}",
+            path, name);
+    /* The qom set message returns successfully. */
+    g_assert_true(qdict_haskey(response, "return"));
+    return qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
+}
+
+static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_index)
+{
+    char path[100];
+    char name[100];
+
+    sprintf(path, "/machine/soc/pwm[%d]", module_index);
+    sprintf(name, "freq[%d]", pwm_index);
+
+    return pwm_qom_get(qts, path, name);
+}
+
+static uint64_t pwm_get_duty(QTestState *qts, int module_index, int pwm_index)
+{
+    char path[100];
+    char name[100];
+
+    sprintf(path, "/machine/soc/pwm[%d]", module_index);
+    sprintf(name, "duty[%d]", pwm_index);
+
+    return pwm_qom_get(qts, path, name);
+}
+
+static uint32_t get_pll(uint32_t con)
+{
+    return REF_HZ * PLL_FBDV(con) / (PLL_INDV(con) * PLL_OTDV1(con)
+            * PLL_OTDV2(con));
+}
+
+static uint64_t read_pclk(QTestState *qts)
+{
+    uint64_t freq = REF_HZ;
+    uint32_t clksel = qtest_readl(qts, CLK_BA + CLKSEL);
+    uint32_t pllcon;
+    uint32_t clkdiv1 = qtest_readl(qts, CLK_BA + CLKDIV1);
+    uint32_t clkdiv2 = qtest_readl(qts, CLK_BA + CLKDIV2);
+
+    switch (CPUCKSEL(clksel)) {
+    case 0:
+        pllcon = qtest_readl(qts, CLK_BA + PLLCON0);
+        freq = get_pll(pllcon);
+        break;
+    case 1:
+        pllcon = qtest_readl(qts, CLK_BA + PLLCON1);
+        freq = get_pll(pllcon);
+        break;
+    case 2:
+        break;
+    case 3:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    freq >>= (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) + APB3CKDIV(clkdiv2));
+
+    return freq;
+}
+
+static uint32_t pwm_selector(uint32_t csr)
+{
+    switch (csr) {
+    case 0:
+        return 2;
+    case 1:
+        return 4;
+    case 2:
+        return 8;
+    case 3:
+        return 16;
+    case 4:
+        return 1;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t csr,
+        uint32_t cnr)
+{
+    return read_pclk(qts) / ((ppr + 1) * pwm_selector(csr) * (cnr + 1));
+}
+
+static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
+{
+    uint64_t duty;
+
+    if (cnr == 0) {
+        /* PWM is stopped. */
+        duty = 0;
+    } else if (cmr >= cnr) {
+        duty = MAX_DUTY;
+    } else {
+        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
+    }
+
+    if (inverted) {
+        duty = MAX_DUTY - duty;
+    }
+
+    return duty;
+}
+
+static uint32_t pwm_read(QTestState *qts, const TestData *td, unsigned offset)
+{
+    return qtest_readl(qts, td->module->base_addr + offset);
+}
+
+static void pwm_write(QTestState *qts, const TestData *td, unsigned offset,
+        uint32_t value)
+{
+    qtest_writel(qts, td->module->base_addr + offset, value);
+}
+
+static uint32_t pwm_read_ppr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, PPR), ppr_base[pwm_index(td->pwm)], 8);
+}
+
+static void pwm_write_ppr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, PPR, value << ppr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_csr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, CSR), csr_base[pwm_index(td->pwm)], 3);
+}
+
+static void pwm_write_csr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, CSR, value << csr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_pcr(QTestState *qts, const TestData *td)
+{
+    return extract32(pwm_read(qts, td, PCR), pcr_base[pwm_index(td->pwm)], 4);
+}
+
+static void pwm_write_pcr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, PCR, value << pcr_base[pwm_index(td->pwm)]);
+}
+
+static uint32_t pwm_read_cnr(QTestState *qts, const TestData *td)
+{
+    return pwm_read(qts, td, td->pwm->cnr_offset);
+}
+
+static void pwm_write_cnr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, td->pwm->cnr_offset, value);
+}
+
+static uint32_t pwm_read_cmr(QTestState *qts, const TestData *td)
+{
+    return pwm_read(qts, td, td->pwm->cmr_offset);
+}
+
+static void pwm_write_cmr(QTestState *qts, const TestData *td, uint32_t value)
+{
+    pwm_write(qts, td, td->pwm->cmr_offset, value);
+}
+
+/* Check pwm registers can be reset to default value */
+static void test_init(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+
+    g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
+    g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
+
+    qtest_quit(qts);
+}
+
+/* One-shot mode should not change frequency and duty cycle. */
+static void test_oneshot(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+    uint32_t ppr, csr, pcr;
+    int i, j;
+
+    pcr = CH_EN;
+    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
+        ppr = ppr_list[i];
+        pwm_write_ppr(qts, td, ppr);
+
+        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
+            csr = csr_list[j];
+            pwm_write_csr(qts, td, csr);
+            pwm_write_pcr(qts, td, pcr);
+
+            g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
+            g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
+            g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
+            g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
+            g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+/* In toggle mode, the PWM generates correct outputs. */
+static void test_toggle(gconstpointer test_data)
+{
+    const TestData *td = test_data;
+    QTestState *qts = qtest_init("-machine quanta-gsj");
+    int module = pwm_module_index(td->module);
+    int pwm = pwm_index(td->pwm);
+    uint32_t ppr, csr, pcr, cnr, cmr;
+    int i, j, k, l;
+    uint64_t expected_freq, expected_duty;
+
+    pcr = CH_EN | CH_MOD;
+    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
+        ppr = ppr_list[i];
+        pwm_write_ppr(qts, td, ppr);
+
+        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
+            csr = csr_list[j];
+            pwm_write_csr(qts, td, csr);
+
+            for (k = 0; k < ARRAY_SIZE(cnr_list); ++k) {
+                cnr = cnr_list[k];
+                pwm_write_cnr(qts, td, cnr);
+
+                for (l = 0; l < ARRAY_SIZE(cmr_list); ++l) {
+                    cmr = cmr_list[l];
+                    pwm_write_cmr(qts, td, cmr);
+                    expected_freq = pwm_compute_freq(qts, ppr, csr, cnr);
+                    expected_duty = pwm_compute_duty(cnr, cmr, false);
+
+                    pwm_write_pcr(qts, td, pcr);
+                    g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
+                    g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
+                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
+                    g_assert_cmpuint(pwm_read_cnr(qts, td), ==, cnr);
+                    g_assert_cmpuint(pwm_read_cmr(qts, td), ==, cmr);
+                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
+                            ==, expected_duty);
+                    if (expected_duty != 0 && expected_duty != 100) {
+                        /* Duty cycle with 0 or 100 doesn't need frequency. */
+                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
+                                ==, expected_freq);
+                    }
+
+                    /* Test inverted mode */
+                    expected_duty = pwm_compute_duty(cnr, cmr, true);
+                    pwm_write_pcr(qts, td, pcr | CH_INV);
+                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr | CH_INV);
+                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
+                            ==, expected_duty);
+                    if (expected_duty != 0 && expected_duty != 100) {
+                        /* Duty cycle with 0 or 100 doesn't need frequency. */
+                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
+                                ==, expected_freq);
+                    }
+
+                }
+            }
+        }
+    }
+
+    qtest_quit(qts);
+}
+
+static void pwm_add_test(const char *name, const TestData* td,
+        GTestDataFunc fn)
+{
+    g_autofree char *full_name = g_strdup_printf(
+            "npcm7xx_pwm/module[%d]/pwm[%d]/%s", pwm_module_index(td->module),
+            pwm_index(td->pwm), name);
+    qtest_add_data_func(full_name, td, fn);
+}
+#define add_test(name, td) pwm_add_test(#name, td, test_##name)
+
+int main(int argc, char **argv)
+{
+    TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_SIZE(pwm_list)];
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
+        for (int j = 0; j < ARRAY_SIZE(pwm_list); ++j) {
+            TestData *td = &test_data_list[i * ARRAY_SIZE(pwm_list) + j];
+
+            td->module = &pwm_module_list[i];
+            td->pwm = &pwm_list[j];
+
+            add_test(init, td);
+            add_test(oneshot, td);
+            add_test(toggle, td);
+        }
+    }
+
+    return g_test_run();
+}
-- 
2.29.2.684.gfbc64c5ab5-goog


