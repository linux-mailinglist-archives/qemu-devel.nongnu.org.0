Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEFF2D8285
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:01:17 +0100 (CET)
Received: from localhost ([::1]:40484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrPY-0007z9-Gf
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VvHTXwgKCo0DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1knqoz-0006Lj-29
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:29 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:49959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VvHTXwgKCo0DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1knqos-0003Kz-61
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:23:28 -0500
Received: by mail-qk1-x749.google.com with SMTP id l7so7636395qkl.16
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=atO/eByn2GHwCNdU/vKptHQ0BjhHEFXcyGIO8itsblY=;
 b=EhzvlVHwpl8GgmjJObWRdyMtxCr8P/Uz7DdIv4FvDRMTxSHGmAJc0tCuTm0Uj0LQOW
 loOsadG9r8NW84PQa65fW90fZv+A8ZI+Nlaa8B0a4zp95D43DZwnDjcvu9ij43yPNXLI
 axGA80GQCl2odPwztgCdFncSNqCpxN8ee1cq5u2BvQhdRk0taZbgzkf0kbnuM2GWcRn3
 GlwRKn1S3vXnFPO2tZyJt7EA27DJylZfPE35jA4wgOp6PTnitSbZZT/28hpkzOyx9Qzk
 +noTb8ghxIWFQ1aN6Q/AJvvpEYxkWuFBtTo3w8ne21slrTQLaKnp2Zq3Z7Kut/KeRubV
 e1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=atO/eByn2GHwCNdU/vKptHQ0BjhHEFXcyGIO8itsblY=;
 b=cz8eEH+bqqj/Ywi/ZXAOrGW5oPHc+H4t7nRjWwGhuGKA9Ikbfxv0VLCf8/1bO6kMCN
 vai2p8fr+zsP5OwutdrNN6S/2d1OCD28VGuzQVAFla8eFdFjcY9GtXYz18eRn34j3wDH
 MbnqkGhx/sJDbq1qONKpU+y6bBqk8NriXF94h265taMXpuFfOwsg3SQ64oLrmsxi/tPn
 kOsiczmdOM9whOuT/9jUz9OkAGycv0CFBZfdGBbWYt+qIloSQ/PBitvDUDVrH4idC6pJ
 zsZuv+XkAeUTsZrAMpTywMyiWWXzmQYtoSg/wbmezwTjXdHRrQw62tzazZWF4QpQt8FD
 XWyQ==
X-Gm-Message-State: AOAM530X5uUQXDPLVezv2Y0bLfpOGFXXIATOhg3shqwzS6Ey7xgtEjJh
 25mhEXflNrptmK6O97014Yf3ybMdhnuKlQ==
X-Google-Smtp-Source: ABdhPJxssu24xigLJ6+NCAk73c8Mnrnp0sJr2RqTrUNhFiwgFus3VLnDo3AFKWvyiNzOkNopPZjKKYy4iLbC2w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:9e5a:: with SMTP id
 z26mr18957132qve.2.1607725398467; Fri, 11 Dec 2020 14:23:18 -0800 (PST)
Date: Fri, 11 Dec 2020 14:22:21 -0800
In-Reply-To: <20201211222223.2252172-1-wuhaotsh@google.com>
Message-Id: <20201211222223.2252172-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201211222223.2252172-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v2 2/4] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3VvHTXwgKCo0DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-qk1-x749.google.com
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

This patch makes NPCM7XX Timer to use a the timer clock generated by the
CLK module instead of the magic nubmer TIMER_REF_HZ.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c                 |  5 +++++
 hw/timer/npcm7xx_timer.c         | 25 +++++++++++++++----------
 include/hw/misc/npcm7xx_clk.h    |  6 ------
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 21 insertions(+), 16 deletions(-)

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
index d24445bd6e..9469c959e2 100644
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
@@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 {
     int64_t ns = count;
 
-    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
+    ns *= NANOSECONDS_PER_SECOND / clock_get_hz(t->ctrl->clock);
     ns *= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return ns;
@@ -141,7 +141,7 @@ static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
     int64_t count;
 
-    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
+    count = ns / (NANOSECONDS_PER_SECOND / clock_get_hz(t->ctrl->clock));
     count /= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return count;
@@ -166,8 +166,10 @@ static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
 static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
         int64_t cycles)
 {
+    g_assert(clock_get_hz(t->ctrl->clock) == 25000000);
     uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
-    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
+    int64_t ns = (NANOSECONDS_PER_SECOND / clock_get_hz(t->ctrl->clock))
+        * cycles;
 
     /*
      * The reset function always clears the current timer. The caller of the
@@ -606,10 +608,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
     qemu_irq_lower(s->watchdog_timer.irq);
 }
 
-static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
+static void npcm7xx_timer_init(Object *obj)
 {
-    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(dev);
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
     SysBusDevice *sbd = &s->parent;
+    DeviceState *dev = DEVICE(obj);
     int i;
     NPCM7xxWatchdogTimer *w;
 
@@ -627,11 +630,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
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
@@ -675,10 +679,11 @@ static const VMStateDescription vmstate_npcm7xx_watchdog_timer = {
 
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
@@ -697,7 +702,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
     QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
 
     dc->desc = "NPCM7xx Timer Controller";
-    dc->realize = npcm7xx_timer_realize;
     dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
     rc->phases.enter = npcm7xx_timer_enter_reset;
     rc->phases.hold = npcm7xx_timer_hold_reset;
@@ -708,6 +712,7 @@ static const TypeInfo npcm7xx_timer_info = {
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
2.29.2.684.gfbc64c5ab5-goog


