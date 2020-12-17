Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D72DCA24
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 01:49:36 +0100 (CET)
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kphU7-0008Rx-3W
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 19:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3K6raXwgKCu4mkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1kphQL-0006DZ-TA
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:41 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3K6raXwgKCu4mkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1kphQG-0006qb-3b
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:41 -0500
Received: by mail-pg1-x54a.google.com with SMTP id 139so15242490pgd.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 16:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=wu2+ndbZl28lfVSCpacwHmt8L62MwOG64hMcc27VTVw=;
 b=BEaIiNkCMRtEltW0MsFnTNvfo/LU68QVdKaQaGG16mlalLGJhivvzRIzQmNF8U6f8J
 R7s8pTSy/9OOvYCK0eegBuvbqlrdNs+zXJXR/zesGJQa+dQMAaEPe8sRbtmrtRN+N88l
 v/olUGTzbNVDvcOwdCjNa1VgoVxlL5/OzVcJzdgUECRSL6UM1QLSGHMFOqu13U2yIglc
 wwxIwPcLgw/HgknU6CFYHdgfphN8wIkFdJNU0T40y9dA5YBdn/pb10gU95Ybv3jYV1rr
 2HrUAPU9jxQkTzV7jB1QQ286pTPqmCW7iuLLqSg0RKzaQgHZnMnr4YDoF3OWpZLpTiGg
 Ouyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wu2+ndbZl28lfVSCpacwHmt8L62MwOG64hMcc27VTVw=;
 b=d6OfnbS0nqHpSUtUZff3SFDih5nIbx4XVFYVxJ6UaPq2MobNwfP92HqovYFETPjpCL
 JQo3iA9m/lcZzwjLzfSGf9D+Gq8tGM/egvtzG1cWoYA25lD13zi0oibxFE3XV2GmXJgR
 hiRNAi4dGTQ7mcJeZEUuGeUFbryMLRTmBcjr9R1autw+s1UBzkfrn19rYepr4ndiB8c4
 /6IZ5b1JZkizMtz755kBv6dg0b8TPkt8CsT3t22U66GJoxi1wJ7KU6eAzPJrvfMeEjro
 m13/eC0b0Rtru+U0cbqeSiEZrpiyvucbUB2aODNkQyDc0Y6jjozv4/1Z0iJaYyQSZiQk
 skIQ==
X-Gm-Message-State: AOAM532ueYVhYxREqogVoYWPwrr0GxJirgdhbKKtm3MeX1Xp/a1VxecX
 ZXUTDrwdomiPozO+zxnYChq3ZO7jnoCQEQ==
X-Google-Smtp-Source: ABdhPJx2cuF2xRDw78/4PRkYbgYn2xRRsws/fjPNedXVMH9tgcPo6CVK5yj4PMuuDBVRB2WaNqkI0ICnsP0UtA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:9a49:b029:da:b3b0:94a1 with SMTP
 id x9-20020a1709029a49b02900dab3b094a1mr3742220plv.11.1608165931415; Wed, 16
 Dec 2020 16:45:31 -0800 (PST)
Date: Wed, 16 Dec 2020 16:43:47 -0800
In-Reply-To: <20201217004349.3740927-1-wuhaotsh@google.com>
Message-Id: <20201217004349.3740927-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4 4/6] hw/misc: Add a PWM module for NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3K6raXwgKCu4mkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
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

The user can read the duty cycle and frequency using qom-get command.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst   |   2 +-
 hw/arm/npcm7xx.c              |  26 +-
 hw/misc/meson.build           |   1 +
 hw/misc/npcm7xx_pwm.c         | 559 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   6 +
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/misc/npcm7xx_pwm.h | 106 +++++++
 7 files changed, 699 insertions(+), 3 deletions(-)
 create mode 100644 hw/misc/npcm7xx_pwm.c
 create mode 100644 include/hw/misc/npcm7xx_pwm.h

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
index 0000000000..36f2cca934
--- /dev/null
+++ b/hw/misc/npcm7xx_pwm.c
@@ -0,0 +1,559 @@
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
+static void npcm7xx_pwm_update_freq(NPCM7xxPWM *p)
+{
+    uint32_t freq = npcm7xx_pwm_calculate_freq(p);
+
+    if (freq != p->freq) {
+        trace_npcm7xx_pwm_update_freq(DEVICE(p->module)->canonical_path,
+                                      p->index, p->freq, freq);
+        p->freq = freq;
+    }
+}
+
+static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
+{
+    uint32_t duty = npcm7xx_pwm_calculate_duty(p);
+
+    if (duty != p->duty) {
+        trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
+                                      p->index, p->duty, duty);
+        p->duty = duty;
+    }
+}
+
+static void npcm7xx_pwm_update_output(NPCM7xxPWM *p)
+{
+    npcm7xx_pwm_update_freq(p);
+    npcm7xx_pwm_update_duty(p);
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
+            npcm7xx_pwm_update_freq(&s->pwm[i]);
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
+            npcm7xx_pwm_update_freq(&s->pwm[i]);
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
+                    npcm7xx_pwm_update_duty(p);
+                }
+            } else {
+                /* Run this PWM channel. */
+                p->running = true;
+                p->inverted = inverted;
+                npcm7xx_pwm_update_output(p);
+            }
+        } else {
+            /* Clear this PWM channel. */
+            p->running = false;
+            p->inverted = inverted;
+            npcm7xx_pwm_update_output(p);
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
+    trace_npcm7xx_pwm_read(DEVICE(s)->canonical_path, offset, value);
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
+    trace_npcm7xx_pwm_write(DEVICE(s)->canonical_path, offset, value);
+    switch (reg) {
+    case NPCM7XX_PWM_CNR0:
+    case NPCM7XX_PWM_CNR1:
+    case NPCM7XX_PWM_CNR2:
+    case NPCM7XX_PWM_CNR3:
+        p = &s->pwm[npcm7xx_cnr_index(reg)];
+        p->cnr = value;
+        npcm7xx_pwm_update_output(p);
+        break;
+
+    case NPCM7XX_PWM_CMR0:
+    case NPCM7XX_PWM_CMR1:
+    case NPCM7XX_PWM_CMR2:
+    case NPCM7XX_PWM_CMR3:
+        p = &s->pwm[npcm7xx_cmr_index(reg)];
+        p->cmr = value;
+        npcm7xx_pwm_update_output(p);
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
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
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
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b5118acd3f..d626b9d7a7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -120,6 +120,12 @@ npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " valu
 npcm7xx_rng_read(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
 npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size) "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
 
+# npcm7xx_pwm.c
+npcm7xx_pwm_read(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Freq: old_freq: %u, new_freq: %u"
+npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u, new_duty: %u"
+
 # stm32f4xx_syscfg.c
 stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO: %d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
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
-- 
2.29.2.684.gfbc64c5ab5-goog


