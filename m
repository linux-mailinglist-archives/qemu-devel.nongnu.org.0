Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDA2EF7F5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:14:34 +0100 (CET)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxDV-0002gX-JG
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ia74XwgKCmYaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9h-00018h-LI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:38 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:49575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ia74XwgKCmYaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9a-0007KJ-Uh
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:37 -0500
Received: by mail-pl1-x64a.google.com with SMTP id bg11so6908620plb.16
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Fyb4FJea0+LttCueKhL0/bu+E731whPsjDvUt294ZsI=;
 b=XUeJlklbrhpads4eo5ZJOIw0RJpZd2uIRkJfiT1KlT6w4v0CKncgBi6O2/3uuxqARX
 23H1j/O3mNS7aXJZLpvFe2G4MndiZlHrwCwS/k/feytAmLbkrFkU6EjAizvKtNPsHs+4
 /KGlDatcU14ZEyltzyQNmbU6SdPaNgejgl/1P6iFikr7IgsG8WQ2bkSO4SDR6wFxOMBA
 8bO7SCN4SOrU7bl0ds9pcT1+lcOcqt49YyLjYkr1lWUEkBe2uWlkjO15q4mV18dAc6uz
 wMgqf23/H/2I/z6zkbEZv1bXaOoQbNhY1AfnKwLRf1oanG4BCqJ94xcd/de1Nh25NCPx
 6dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Fyb4FJea0+LttCueKhL0/bu+E731whPsjDvUt294ZsI=;
 b=F4zMxghF2s5VyYSlEFlU/yhyHB6yvbd/sLTwPvT982K8jdQe38ILjPjsAY4pc19085
 MYLd/jtT6I+3zL9sc/54e4gMPBh4ruNdQgZ9/YoKibBrhLZTurgIjsUwb80/yuAVVnxp
 GrOOD0+vjw0HFyks0tlfwOIFTqHf3HG7ePFzKko0ICpjuYZShadAyGltEESpn7g/p91B
 zFb8KxxL9RegKVy7um0E/b/cBcFixdPT9ZY/8OUqg27AUOHl4uZlOMvxi4Yje0jKX/80
 JI2GS5FwhXFbc1sFcufQz1wxt6eY8p6D6YGK1ufmsztLoUtZRs4yXWjSLwlS+y2IQu0o
 mszg==
X-Gm-Message-State: AOAM531EFNpynZY3DveRYd5uT4D3qz3TT8DE9MRocD/HW/U70vWptBY8
 /INGma/tXhV6Z0RIUpVL7O5Ki9lWwDGWXw==
X-Google-Smtp-Source: ABdhPJx69PeOr9IWJygMFXWSMmoWh8D5i6HFuP5pyUgkqI3UmKR//25O0nlB8IDZQ2B4zka0D3sdm1Qehe1E0w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1716:0:b029:19d:b78b:ef02 with SMTP
 id 22-20020a6217160000b029019db78bef02mr5030444pfx.11.1610133025893; Fri, 08
 Jan 2021 11:10:25 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:41 -0800
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
Message-Id: <20210108190945.949196-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3Ia74XwgKCmYaYLESXWLKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
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

This patch makes NPCM7XX Timer to use a the timer clock generated by the
CLK module instead of the magic number TIMER_REF_HZ.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c                 |  5 ++++
 hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++-----------------
 include/hw/misc/npcm7xx_clk.h    |  6 -----
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 47e2b6fc40..fabfb1697b 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -22,6 +22,7 @@
 #include "hw/char/serial.h"
 #include "hw/loader.h"
 #include "hw/misc/unimp.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
@@ -420,6 +421,10 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         int first_irq;
         int j;
 
+        /* Connect the timer clock. */
+        qdev_connect_clock_in(DEVICE(&s->tim[i]), "clock", qdev_get_clock_out(
+                    DEVICE(&s->clk), "timer-clock"));
+
         sysbus_realize(sbd, &error_abort);
         sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[i]);
 
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index d24445bd6e..36e2c07db2 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -17,8 +17,8 @@
 #include "qemu/osdep.h"
 
 #include "hw/irq.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
-#include "hw/misc/npcm7xx_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "migration/vmstate.h"
 #include "qemu/bitops.h"
@@ -128,23 +128,18 @@ static uint32_t npcm7xx_tcsr_prescaler(uint32_t tcsr)
 /* Convert a timer cycle count to a time interval in nanoseconds. */
 static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 {
-    int64_t ns = count;
+    int64_t ticks = count;
 
-    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
-    ns *= npcm7xx_tcsr_prescaler(t->tcsr);
+    ticks *= npcm7xx_tcsr_prescaler(t->tcsr);
 
-    return ns;
+    return clock_ticks_to_ns(t->ctrl->clock, ticks);
 }
 
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
-    int64_t count;
-
-    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
-    count /= npcm7xx_tcsr_prescaler(t->tcsr);
-
-    return count;
+    return ns / clock_ticks_to_ns(t->ctrl->clock,
+                                  npcm7xx_tcsr_prescaler(t->tcsr));
 }
 
 static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
@@ -166,8 +161,8 @@ static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
 static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
         int64_t cycles)
 {
-    uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
-    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
+    int64_t ticks = cycles * npcm7xx_watchdog_timer_prescaler(t);
+    int64_t ns = clock_ticks_to_ns(t->ctrl->clock, ticks);
 
     /*
      * The reset function always clears the current timer. The caller of the
@@ -176,7 +171,6 @@ static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
      */
     npcm7xx_timer_clear(&t->base_timer);
 
-    ns *= prescaler;
     t->base_timer.remaining_ns = ns;
 }
 
@@ -606,10 +600,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
     qemu_irq_lower(s->watchdog_timer.irq);
 }
 
-static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
+static void npcm7xx_timer_init(Object *obj)
 {
-    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(dev);
-    SysBusDevice *sbd = &s->parent;
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
     NPCM7xxWatchdogTimer *w;
 
@@ -627,11 +622,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
             npcm7xx_watchdog_timer_expired, w);
     sysbus_init_irq(sbd, &w->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_timer_ops, s,
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_timer_ops, s,
                           TYPE_NPCM7XX_TIMER, 4 * KiB);
     sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_out_named(dev, &w->reset_signal,
             NPCM7XX_WATCHDOG_RESET_GPIO_OUT, 1);
+    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL);
 }
 
 static const VMStateDescription vmstate_npcm7xx_base_timer = {
@@ -675,10 +671,11 @@ static const VMStateDescription vmstate_npcm7xx_watchdog_timer = {
 
 static const VMStateDescription vmstate_npcm7xx_timer_ctrl = {
     .name = "npcm7xx-timer-ctrl",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(tisr, NPCM7xxTimerCtrlState),
+        VMSTATE_CLOCK(clock, NPCM7xxTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timer, NPCM7xxTimerCtrlState,
                              NPCM7XX_TIMERS_PER_CTRL, 0, vmstate_npcm7xx_timer,
                              NPCM7xxTimer),
@@ -697,7 +694,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
     QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
 
     dc->desc = "NPCM7xx Timer Controller";
-    dc->realize = npcm7xx_timer_realize;
     dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
     rc->phases.enter = npcm7xx_timer_enter_reset;
     rc->phases.hold = npcm7xx_timer_hold_reset;
@@ -708,6 +704,7 @@ static const TypeInfo npcm7xx_timer_info = {
     .parent             = TYPE_SYS_BUS_DEVICE,
     .instance_size      = sizeof(NPCM7xxTimerCtrlState),
     .class_init         = npcm7xx_timer_class_init,
+    .instance_init      = npcm7xx_timer_init,
 };
 
 static void npcm7xx_timer_register_type(void)
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index f641f95f3e..d5c8d16ca4 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -20,12 +20,6 @@
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 
-/*
- * The reference clock frequency for the timer modules, and the SECCNT and
- * CNTR25M registers in this module, is always 25 MHz.
- */
-#define NPCM7XX_TIMER_REF_HZ            (25000000)
-
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index 6993fd723a..d45c051b56 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -101,6 +101,7 @@ struct NPCM7xxTimerCtrlState {
 
     uint32_t    tisr;
 
+    Clock       *clock;
     NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];
     NPCM7xxWatchdogTimer watchdog_timer;
 };
-- 
2.29.2.729.g45daf8777d-goog


