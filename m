Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F120BD4D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 01:58:46 +0200 (CEST)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joyF3-0004LW-Oq
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 19:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3A4v2XgsKCvAZkcaffWegWfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--hskinnemoen.bounces.google.com>)
 id 1joyCG-0007ig-U7
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:52 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3A4v2XgsKCvAZkcaffWegWfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--hskinnemoen.bounces.google.com>)
 id 1joyCD-00024f-8B
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 19:55:52 -0400
Received: by mail-qk1-x74a.google.com with SMTP id f79so1693122qke.9
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 16:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=40kVkvLH3XxGMWtVTbA17EKX194nsSfObtpFq6PLRds=;
 b=QKuURS6GlW4u8lgEA2rSceGZrDcl99baaP5pLnd6CuN/RLC6R1M+Xz4vGCZHqVKr6I
 g7ThyBNNHwml8qmIVNfWwO54HiBRKL7WU/1jRNy/4h57nriiV3wIeh1O4hn4FeX9r6lE
 Gj4xAhEj88cS2fsqz2knk+nCh/jrHUdv2/MOGxts3n4hCTO5NSbquUBKs+5ij+jDSlml
 d8lWBl1Hhn5ivUk2x3YDDiS7oWW1uw4yEMSBoN7/6MniY46twazJI/LoDO0jVUHd0rov
 Zm2PSDekFiJi6a7y00ozGinFQ+qB5bhsiLo1JY5QW+E05RC2RtOBUzDDipnGd8Ffyn/Q
 50Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=40kVkvLH3XxGMWtVTbA17EKX194nsSfObtpFq6PLRds=;
 b=PmZJoIETyk4/aGG8qq9WqcvW/j082n/bD8sQfTA/m+AsEMuQkmoOjm22sREjcPU4Ej
 HykP19FHDBcQ0iRlfNuYyQvFQm1t/3BOpZho1sVe8tUCqHjinqlKtXZPjKtxkalzKISn
 WUZDjzCa293A0kpHJg2ArPPBSe4eYNHzmxp8mD1QsjidMjoNDyxKLYmCUFMdumAnFdZy
 5p4icTqRpKLtYq4taTRoaHnOWnhD1hBaVrTx2vgby/Nlz/0DX6aIDcqAsjsqx8onyT38
 OVx8L4NGj/rIPznb1h5qOQgo0GPXQRfDUXjQAEAgTVfyefcyXEZ5T0ho453Z5VnhXq4B
 TbFA==
X-Gm-Message-State: AOAM532MmgILZPwJkZOKAolDUk07TKphFrYDk6J05eIeN2zzVJqEYwoK
 Hn5Fzg0f9MlPu4jlrvVQKiSjANXWi+OdIFMdxg==
X-Google-Smtp-Source: ABdhPJywQOmcLPR2V35HQc9O6mRicjoEW01Naj0TbJ59T2vyOCRdS5fYLu8NgI3FGwKf7ZapEb1rgkbhnf9uEyHMIg==
X-Received: by 2002:a05:6214:851:: with SMTP id
 dg17mr5702260qvb.235.1593215747321; 
 Fri, 26 Jun 2020 16:55:47 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:11 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-5-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 04/12] hw/timer: Add NPCM7xx Timer device model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3A4v2XgsKCvAZkcaffWegWfYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--hskinnemoen.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
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

The NPCM730 and NPCM750 SoCs have three timer modules each holding five
timers and some shared registers (e.g. interrupt status).

Each timer runs at 25 MHz divided by a prescaler, and counts down from a
configurable initial value to zero. When zero is reached, the interrupt
flag for the timer is set, and the timer is disabled (one-shot mode) or
reloaded from its initial value (periodic mode).

This implementation is sufficient to boot a Linux kernel configured for
NPCM750. Note that the kernel does not seem to actually turn on the
interrupts.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/timer/Makefile.objs           |   1 +
 hw/timer/npcm7xx_timer.c         | 437 +++++++++++++++++++++++++++++++
 hw/timer/trace-events            |   5 +
 include/hw/timer/npcm7xx_timer.h |  95 +++++++
 4 files changed, 538 insertions(+)
 create mode 100644 hw/timer/npcm7xx_timer.c
 create mode 100644 include/hw/timer/npcm7xx_timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index a39f6ec0c2..84c484dda8 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -14,6 +14,7 @@ common-obj-$(CONFIG_IMX) += imx_epit.o
 common-obj-$(CONFIG_IMX) += imx_gpt.o
 common-obj-$(CONFIG_LM32) += lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
+common-obj-$(CONFIG_NPCM7XX) += npcm7xx_timer.o
 common-obj-$(CONFIG_NRF51_SOC) += nrf51_timer.o
 
 common-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
new file mode 100644
index 0000000000..9aae4b09b9
--- /dev/null
+++ b/hw/timer/npcm7xx_timer.c
@@ -0,0 +1,437 @@
+/*
+ * Nuvoton NPCM7xx Timer Controller
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/irq.h"
+#include "hw/timer/npcm7xx_timer.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+/* Register field definitions. */
+#define NPCM7XX_TCSR_CEN                BIT(30)
+#define NPCM7XX_TCSR_IE                 BIT(29)
+#define NPCM7XX_TCSR_PERIODIC           BIT(27)
+#define NPCM7XX_TCSR_CRST               BIT(26)
+#define NPCM7XX_TCSR_CACT               BIT(25)
+#define NPCM7XX_TCSR_RSVD               0x21ffff00
+#define NPCM7XX_TCSR_PRESCALE_START     0
+#define NPCM7XX_TCSR_PRESCALE_LEN       8
+
+/* The reference clock frequency is always 25 MHz. */
+#define NPCM7XX_TIMER_REF_HZ            (25000000)
+
+/* Return the value by which to divide the reference clock rate. */
+static uint32_t npcm7xx_timer_prescaler(const NPCM7xxTimer *t)
+{
+    return extract32(t->tcsr, NPCM7XX_TCSR_PRESCALE_START,
+                     NPCM7XX_TCSR_PRESCALE_LEN) + 1;
+}
+
+/* Convert a timer cycle count to a time interval in nanoseconds. */
+static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
+{
+    int64_t ns = count;
+
+    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
+    ns *= npcm7xx_timer_prescaler(t);
+
+    return ns;
+}
+
+/* Convert a time interval in nanoseconds to a timer cycle count. */
+static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
+{
+    int64_t count;
+
+    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
+    count /= npcm7xx_timer_prescaler(t);
+
+    return count;
+}
+
+/*
+ * Raise the interrupt line if there's a pending interrupt and interrupts are
+ * enabled for this timer. If not, lower it.
+ */
+static void npcm7xx_timer_check_interrupt(NPCM7xxTimer *t)
+{
+    NPCM7xxTimerCtrlState *tc = t->ctrl;
+    /* Find the array index of this timer. */
+    int index = t - tc->timer;
+
+    g_assert(index >= 0 && index < NPCM7XX_TIMERS_PER_CTRL);
+
+    if ((t->tcsr & NPCM7XX_TCSR_IE) && (tc->tisr & BIT(index))) {
+        qemu_irq_raise(t->irq);
+        trace_npcm7xx_timer_irq(DEVICE(tc)->canonical_path, index, 1);
+    } else {
+        qemu_irq_lower(t->irq);
+        trace_npcm7xx_timer_irq(DEVICE(tc)->canonical_path, index, 0);
+    }
+}
+
+/* Start or resume the timer. */
+static void npcm7xx_timer_start(NPCM7xxTimer *t)
+{
+    int64_t now;
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    t->expires_ns = now + t->remaining_ns;
+    timer_mod(&t->qtimer, t->expires_ns);
+}
+
+/*
+ * Called when the counter reaches zero. Sets the interrupt flag, and either
+ * restarts or disables the timer.
+ */
+static void npcm7xx_timer_reached_zero(NPCM7xxTimer *t)
+{
+    NPCM7xxTimerCtrlState *tc = t->ctrl;
+    int index = t - tc->timer;
+
+    g_assert(index >= 0 && index < NPCM7XX_TIMERS_PER_CTRL);
+
+    tc->tisr |= BIT(index);
+
+    if (t->tcsr & NPCM7XX_TCSR_PERIODIC) {
+        t->remaining_ns = npcm7xx_timer_count_to_ns(t, t->ticr);
+        if (t->tcsr & NPCM7XX_TCSR_CEN) {
+            npcm7xx_timer_start(t);
+        }
+    } else {
+        t->tcsr &= ~(NPCM7XX_TCSR_CEN | NPCM7XX_TCSR_CACT);
+    }
+
+    npcm7xx_timer_check_interrupt(t);
+}
+
+/* Stop counting. Record the time remaining so we can continue later. */
+static void npcm7xx_timer_pause(NPCM7xxTimer *t)
+{
+    int64_t now;
+
+    timer_del(&t->qtimer);
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    t->remaining_ns = t->expires_ns - now;
+    if (t->remaining_ns <= 0) {
+        npcm7xx_timer_reached_zero(t);
+    }
+}
+
+/*
+ * Restart the timer from its initial value. If the timer was enabled and stays
+ * enabled, adjust the QEMU timer according to the new count. If the timer is
+ * transitioning from disabled to enabled, the caller is expected to start the
+ * timer later.
+ */
+static void npcm7xx_timer_restart(NPCM7xxTimer *t, uint32_t old_tcsr)
+{
+    t->remaining_ns = npcm7xx_timer_count_to_ns(t, t->ticr);
+
+    if (old_tcsr & t->tcsr & NPCM7XX_TCSR_CEN) {
+        npcm7xx_timer_start(t);
+    }
+}
+
+/* Register read and write handlers */
+
+static void npcm7xx_timer_write_tcsr(NPCM7xxTimer *t, uint32_t new_tcsr)
+{
+    uint32_t old_tcsr = t->tcsr;
+
+    if (new_tcsr & NPCM7XX_TCSR_RSVD) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: reserved bits in 0x%08x ignored\n",
+                      __func__, new_tcsr);
+        new_tcsr &= ~NPCM7XX_TCSR_RSVD;
+    }
+    if (new_tcsr & NPCM7XX_TCSR_CACT) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read-only bits in 0x%08x ignored\n",
+                      __func__, new_tcsr);
+        new_tcsr &= ~NPCM7XX_TCSR_CACT;
+    }
+
+    t->tcsr = (t->tcsr & NPCM7XX_TCSR_CACT) | new_tcsr;
+
+    if ((old_tcsr ^ new_tcsr) & NPCM7XX_TCSR_IE) {
+        npcm7xx_timer_check_interrupt(t);
+    }
+    if (new_tcsr & NPCM7XX_TCSR_CRST) {
+        npcm7xx_timer_restart(t, old_tcsr);
+        t->tcsr &= ~NPCM7XX_TCSR_CRST;
+    }
+    if ((old_tcsr ^ new_tcsr) & NPCM7XX_TCSR_CEN) {
+        if (new_tcsr & NPCM7XX_TCSR_CEN) {
+            npcm7xx_timer_start(t);
+        } else {
+            npcm7xx_timer_pause(t);
+        }
+    }
+}
+
+static void npcm7xx_timer_write_ticr(NPCM7xxTimer *t, uint32_t new_ticr)
+{
+    t->ticr = new_ticr;
+
+    npcm7xx_timer_restart(t, t->tcsr);
+}
+
+static uint32_t npcm7xx_timer_read_tdr(NPCM7xxTimer *t)
+{
+    if (t->tcsr & NPCM7XX_TCSR_CEN) {
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+        return npcm7xx_timer_ns_to_count(t, t->expires_ns - now);
+    }
+
+    return npcm7xx_timer_ns_to_count(t, t->remaining_ns);
+}
+
+static uint64_t npcm7xx_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxTimerCtrlState *s = opaque;
+    uint64_t value = 0;
+    hwaddr reg;
+
+    reg = offset / sizeof(uint32_t);
+    switch (reg) {
+    case NPCM7XX_TIMER_TCSR0:
+        value = s->timer[0].tcsr;
+        break;
+    case NPCM7XX_TIMER_TCSR1:
+        value = s->timer[1].tcsr;
+        break;
+    case NPCM7XX_TIMER_TCSR2:
+        value = s->timer[2].tcsr;
+        break;
+    case NPCM7XX_TIMER_TCSR3:
+        value = s->timer[3].tcsr;
+        break;
+    case NPCM7XX_TIMER_TCSR4:
+        value = s->timer[4].tcsr;
+        break;
+
+    case NPCM7XX_TIMER_TICR0:
+        value = s->timer[0].ticr;
+        break;
+    case NPCM7XX_TIMER_TICR1:
+        value = s->timer[1].ticr;
+        break;
+    case NPCM7XX_TIMER_TICR2:
+        value = s->timer[2].ticr;
+        break;
+    case NPCM7XX_TIMER_TICR3:
+        value = s->timer[3].ticr;
+        break;
+    case NPCM7XX_TIMER_TICR4:
+        value = s->timer[4].ticr;
+        break;
+
+    case NPCM7XX_TIMER_TDR0:
+        value = npcm7xx_timer_read_tdr(&s->timer[0]);
+        break;
+    case NPCM7XX_TIMER_TDR1:
+        value = npcm7xx_timer_read_tdr(&s->timer[1]);
+        break;
+    case NPCM7XX_TIMER_TDR2:
+        value = npcm7xx_timer_read_tdr(&s->timer[2]);
+        break;
+    case NPCM7XX_TIMER_TDR3:
+        value = npcm7xx_timer_read_tdr(&s->timer[3]);
+        break;
+    case NPCM7XX_TIMER_TDR4:
+        value = npcm7xx_timer_read_tdr(&s->timer[4]);
+        break;
+
+    case NPCM7XX_TIMER_TISR:
+        value = s->tisr;
+        break;
+
+    case NPCM7XX_TIMER_WTCR:
+        value = s->wtcr;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid offset 0x%04x\n",
+                      __func__, (unsigned int)offset);
+        break;
+    }
+
+    trace_npcm7xx_timer_read(DEVICE(s)->canonical_path, offset, value);
+
+    return value;
+}
+
+static void npcm7xx_timer_write(void *opaque, hwaddr offset,
+                                uint64_t v, unsigned size)
+{
+    uint32_t reg = offset / sizeof(uint32_t);
+    NPCM7xxTimerCtrlState *s = opaque;
+    uint32_t value = v;
+
+    trace_npcm7xx_timer_write(DEVICE(s)->canonical_path, offset, value);
+
+    switch (reg) {
+    case NPCM7XX_TIMER_TCSR0:
+        npcm7xx_timer_write_tcsr(&s->timer[0], value);
+        return;
+    case NPCM7XX_TIMER_TCSR1:
+        npcm7xx_timer_write_tcsr(&s->timer[1], value);
+        return;
+    case NPCM7XX_TIMER_TCSR2:
+        npcm7xx_timer_write_tcsr(&s->timer[2], value);
+        return;
+    case NPCM7XX_TIMER_TCSR3:
+        npcm7xx_timer_write_tcsr(&s->timer[3], value);
+        return;
+    case NPCM7XX_TIMER_TCSR4:
+        npcm7xx_timer_write_tcsr(&s->timer[4], value);
+        return;
+
+    case NPCM7XX_TIMER_TICR0:
+        npcm7xx_timer_write_ticr(&s->timer[0], value);
+        return;
+    case NPCM7XX_TIMER_TICR1:
+        npcm7xx_timer_write_ticr(&s->timer[1], value);
+        return;
+    case NPCM7XX_TIMER_TICR2:
+        npcm7xx_timer_write_ticr(&s->timer[2], value);
+        return;
+    case NPCM7XX_TIMER_TICR3:
+        npcm7xx_timer_write_ticr(&s->timer[3], value);
+        return;
+    case NPCM7XX_TIMER_TICR4:
+        npcm7xx_timer_write_ticr(&s->timer[4], value);
+        return;
+
+    case NPCM7XX_TIMER_TDR0:
+    case NPCM7XX_TIMER_TDR1:
+    case NPCM7XX_TIMER_TDR2:
+    case NPCM7XX_TIMER_TDR3:
+    case NPCM7XX_TIMER_TDR4:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: register @ 0x%04x is read-only\n",
+                      __func__, (unsigned int)offset);
+        return;
+
+    case NPCM7XX_TIMER_TISR:
+        s->tisr &= ~value;
+        return;
+
+    case NPCM7XX_TIMER_WTCR:
+        qemu_log_mask(LOG_UNIMP, "%s: WTCR write not implemented: 0x%08x\n",
+                      __func__, value);
+        return;
+    }
+
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid offset 0x%04x\n",
+                  __func__, (unsigned int)offset);
+}
+
+static const struct MemoryRegionOps npcm7xx_timer_ops = {
+    .read       = npcm7xx_timer_read,
+    .write      = npcm7xx_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+/* Called when the QEMU timer expires. */
+static void npcm7xx_timer_expired(void *opaque)
+{
+    NPCM7xxTimer *t = opaque;
+
+    if (t->tcsr & NPCM7XX_TCSR_CEN) {
+        npcm7xx_timer_reached_zero(t);
+    }
+}
+
+static void npcm7xx_timer_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        NPCM7xxTimer *t = &s->timer[i];
+
+        timer_del(&t->qtimer);
+        t->expires_ns = 0;
+        t->remaining_ns = 0;
+        t->tcsr = 0x00000005;
+        t->ticr = 0x00000000;
+    }
+
+    s->tisr = 0x00000000;
+    s->wtcr = 0x00000400;
+}
+
+static void npcm7xx_timer_hold_reset(Object *obj)
+{
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
+    int i;
+
+    for (i = 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        qemu_irq_lower(s->timer[i].irq);
+    }
+}
+
+static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(dev);
+    SysBusDevice *sbd = &s->parent;
+    int i;
+
+    for (i = 0; i < NPCM7XX_TIMERS_PER_CTRL; i++) {
+        NPCM7xxTimer *t = &s->timer[i];
+        t->ctrl = s;
+        timer_init_ns(&t->qtimer, QEMU_CLOCK_VIRTUAL, npcm7xx_timer_expired, t);
+        sysbus_init_irq(sbd, &t->irq);
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_timer_ops, s,
+                          TYPE_NPCM7XX_TIMER, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx Timer Controller";
+    dc->realize = npcm7xx_timer_realize;
+    rc->phases.enter = npcm7xx_timer_enter_reset;
+    rc->phases.hold = npcm7xx_timer_hold_reset;
+}
+
+static const TypeInfo npcm7xx_timer_info = {
+    .name               = TYPE_NPCM7XX_TIMER,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxTimerCtrlState),
+    .class_init         = npcm7xx_timer_class_init,
+};
+
+static void npcm7xx_timer_register_type(void)
+{
+    type_register_static(&npcm7xx_timer_info);
+}
+type_init(npcm7xx_timer_register_type);
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 866c9f546a..e2434ecf3f 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,6 +66,11 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
 
+# npcm7xx_timer.c
+npcm7xx_timer_read(const char *id, uint64_t offset, uint64_t value) " %s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
+npcm7xx_timer_write(const char *id, uint64_t offset, uint64_t value) "%s offset: 0x%04" PRIx64 " value 0x%08" PRIx64
+npcm7xx_timer_irq(const char *id, int timer, int state) "%s timer %d state %d"
+
 # nrf51_timer.c
 nrf51_timer_read(uint8_t timer_id, uint64_t addr, uint32_t value, unsigned size) "timer %u read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
 nrf51_timer_write(uint8_t timer_id, uint64_t addr, uint32_t value, unsigned size) "timer %u write addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
new file mode 100644
index 0000000000..d8ed98933d
--- /dev/null
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -0,0 +1,95 @@
+/*
+ * Nuvoton NPCM7xx Timer Controller
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#ifndef NPCM7XX_TIMER_H
+#define NPCM7XX_TIMER_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+#include "qemu/timer.h"
+
+/* Each Timer Module (TIM) instance holds five 25 MHz timers. */
+#define NPCM7XX_TIMERS_PER_CTRL (5)
+
+/**
+ * enum NPCM7xxTimerRegisters - 32-bit register indices.
+ */
+enum NPCM7xxTimerRegisters {
+    NPCM7XX_TIMER_TCSR0,
+    NPCM7XX_TIMER_TCSR1,
+    NPCM7XX_TIMER_TICR0,
+    NPCM7XX_TIMER_TICR1,
+    NPCM7XX_TIMER_TDR0,
+    NPCM7XX_TIMER_TDR1,
+    NPCM7XX_TIMER_TISR,
+    NPCM7XX_TIMER_WTCR,
+    NPCM7XX_TIMER_TCSR2,
+    NPCM7XX_TIMER_TCSR3,
+    NPCM7XX_TIMER_TICR2,
+    NPCM7XX_TIMER_TICR3,
+    NPCM7XX_TIMER_TDR2,
+    NPCM7XX_TIMER_TDR3,
+    NPCM7XX_TIMER_TCSR4         = 0x0040 / sizeof(uint32_t),
+    NPCM7XX_TIMER_TICR4         = 0x0048 / sizeof(uint32_t),
+    NPCM7XX_TIMER_TDR4          = 0x0050 / sizeof(uint32_t),
+    NPCM7XX_TIMER_NR_REGS,
+};
+
+typedef struct NPCM7xxTimerCtrlState NPCM7xxTimerCtrlState;
+
+/**
+ * struct NPCM7xxTimer - Individual timer state.
+ * @irq: GIC interrupt line to fire on expiration (if enabled).
+ * @qtimer: QEMU timer that notifies us on expiration.
+ * @expires_ns: Absolute virtual expiration time.
+ * @remaining_ns: Remaining time until expiration if timer is paused.
+ * @tcsr: The Timer Control and Status Register.
+ * @ticr: The Timer Initial Count Register.
+ */
+typedef struct NPCM7xxTimer {
+    NPCM7xxTimerCtrlState *ctrl;
+
+    qemu_irq    irq;
+    QEMUTimer   qtimer;
+    int64_t     expires_ns;
+    int64_t     remaining_ns;
+
+    uint32_t    tcsr;
+    uint32_t    ticr;
+} NPCM7xxTimer;
+
+/**
+ * struct NPCM7xxTimerCtrlState - Timer Module device state.
+ * @parent: System bus device.
+ * @iomem: Memory region through which registers are accessed.
+ * @tisr: The Timer Interrupt Status Register.
+ * @wtcr: The Watchdog Timer Control Register.
+ * @timer: The five individual timers managed by this module.
+ */
+struct NPCM7xxTimerCtrlState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+
+    uint32_t    tisr;
+    uint32_t    wtcr;
+
+    NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];
+};
+
+#define TYPE_NPCM7XX_TIMER "npcm7xx-timer"
+#define NPCM7XX_TIMER(obj)                                              \
+    OBJECT_CHECK(NPCM7xxTimerCtrlState, (obj), TYPE_NPCM7XX_TIMER)
+
+#endif /* NPCM7XX_TIMER_H */
-- 
2.27.0.212.ge8ba1cc988-goog


