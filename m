Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109402DCA34
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 01:55:28 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kphZn-0005iT-5W
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 19:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KKraXwgKCusjhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1kphQS-0006Mm-Ci
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:49 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:35853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KKraXwgKCusjhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1kphQA-0006qB-MZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:47 -0500
Received: by mail-pj1-x1049.google.com with SMTP id q10so1839405pjg.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 16:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=BerKlRaUjvE8GrggZOrBCgmaVCo9sQ4NKu7h8iibDbM=;
 b=QrfJyQz0J5oTkylcjKOn0gdi4OQiYIYJaL/2Kn7W2X6G5y/xrQgM4fByMmIHJvEsuI
 i7s83EkhsJXc/20mq63Bc+G3flAJBF2wKRuc8/yG1Znzfp/XtuBMaxlAywA7EunZ/2be
 /6E1bO9MDFnJtlF5zN8NZdrHGj2uNkvSG8RkXxMMjAihwXLjN9cm5l76AFfa+fFOBoSE
 lThwNNBKg1XqQvIturYHvkm83QxOzxRpszVN2kUxi30BitM/zu2GfjHotZn5vx99Y0wc
 r1qEzPd88pdHdRb8B4BcLFfv2+gnGN2k+aLeRTxohY4GvQelQqQ2PP4+pIr99k8sNVbd
 cynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BerKlRaUjvE8GrggZOrBCgmaVCo9sQ4NKu7h8iibDbM=;
 b=G+Vw9OdmKYQyUzbxANyySARnz4kLLVuyGnpl+p8wZuA+fp3H2HtpjOqBbc4Y1F1Zho
 EV0OaMqhxVlUegdCUQ4fuYIMGTGMmA2tfYHpyeZmlhgMRikgePwM4GxG/hggMI5N/sp9
 3ZXgZXNBkKPBVO9MCrEjzGbVoENf2CXHkDP2KcycNk8F7BqSHHdYDmmyxWi0fdOytejF
 wLEAujSg+Ymk+FLqqtiAv45LPYmXs2fCh9dpbgiwgYtQG9hVPRRteUeMIJtclvQeQzvs
 QUMgusjwSKAHRS1BOJiPuW+VjzXjq9GXKw3JTB7JagIq5gNxHRwNlq3JvjdNJm9bRfg7
 6GIg==
X-Gm-Message-State: AOAM530gZpei90jLBr04V18pCX3HfIG/qZ1+sERU5DyXyLGajcWhIq7C
 lSvqnrgiA0nn740gAYFv6/H3zaVQ5v/tDQ==
X-Google-Smtp-Source: ABdhPJwSEHZRUonIkmakrKWG9x9Wlvr4M6UkLgOqg1eDWBVMeVYuDah6s7P0PyPKHouXrBiOFNRJG414Hjk0ew==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:3ee3:: with SMTP id
 k90mr5295745pjc.164.1608165928021; Wed, 16 Dec 2020 16:45:28 -0800 (PST)
Date: Wed, 16 Dec 2020 16:43:45 -0800
In-Reply-To: <20201217004349.3740927-1-wuhaotsh@google.com>
Message-Id: <20201217004349.3740927-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3KKraXwgKCusjhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 hw/arm/npcm7xx.c                 |  5 +++++
 hw/timer/npcm7xx_timer.c         | 25 ++++++++++++++-----------
 include/hw/misc/npcm7xx_clk.h    |  6 ------
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 20 insertions(+), 17 deletions(-)

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
index d24445bd6e..6e990d611a 100644
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
+    ns *= clock_get_ns(t->ctrl->clock);
     ns *= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return ns;
@@ -141,7 +141,7 @@ static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
     int64_t count;
 
-    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
+    count = ns / clock_get_ns(t->ctrl->clock);
     count /= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return count;
@@ -167,7 +167,7 @@ static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
         int64_t cycles)
 {
     uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
-    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
+    int64_t ns = clock_get_ns(t->ctrl->clock) * cycles;
 
     /*
      * The reset function always clears the current timer. The caller of the
@@ -606,10 +606,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
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
 
@@ -627,11 +628,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
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
@@ -675,10 +677,11 @@ static const VMStateDescription vmstate_npcm7xx_watchdog_timer = {
 
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
@@ -697,7 +700,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
     QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
 
     dc->desc = "NPCM7xx Timer Controller";
-    dc->realize = npcm7xx_timer_realize;
     dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
     rc->phases.enter = npcm7xx_timer_enter_reset;
     rc->phases.hold = npcm7xx_timer_hold_reset;
@@ -708,6 +710,7 @@ static const TypeInfo npcm7xx_timer_info = {
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


