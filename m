Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AE2DA497
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:18:21 +0100 (CET)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koy2m-0005Do-59
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3p__XXwgKCgw86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1koxy9-0000Yt-Pe
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:13:33 -0500
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3p__XXwgKCgw86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1koxy5-00036w-NE
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:13:33 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id j5so12990405qvu.22
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=mTcs8OEWxSaViuIcL5NViBc2vMl6bv7JTLHRCBz2igg=;
 b=YfEP9Yj6zMyXtN6VVTXmrO9PtWmeyvJOogc0unvSmn2Rlbx6fhaSKp3mMv8EixXYEa
 J5PHXRPIltH2vg0mepJRyJvCDMf9b6EJ9yoRn0MxeTOUXYQ3Et5RNRcW9YwCBhXDXTIh
 aT4RySci3Kor8638PD4vDPJ0nJi+CzIwZE+F1Y6fq5ANxsYAhQ+Z3KMkjHjFb7aiOLuD
 mblIzJbxsZN7+z8/OXYLO87aisAcXyWHsnNADpdsgXnQq6GnUsyvPNg4qERJcOX2KcG4
 c96z90sxvQ3mtsxhql+By/FiWUeizFsh73/H3IMqkiAExVHInRX0rn/u3AnVjfqOaUJQ
 MnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mTcs8OEWxSaViuIcL5NViBc2vMl6bv7JTLHRCBz2igg=;
 b=g2cZWXJFl9TiCze25gxFeobsVjmmn+a8IcAwJuGDu560Yzye378CIDGuJAAmWlPkzt
 9wEAqWZ2q2atoAEIB03fan6oNYiycJbsmHZi10TbSbEc02jRZlCBmBzDn7JeiHkYeOVh
 8nOTxc3etK8O2kfPqr51XSTyPVn3x2+Vy3BSZRWg2AkFj1sKodeKDWiM6u+tmCmP+IvH
 3AIY0QqR4HTHHuoqg4GeeVr/mFm4dR/x8tk8v7gl/gGqqE2wbN9v5T9egytsKnejXc8M
 POShG3U+UlniE55hFDgh6fEHhdIerSBZ3tP9mHUErgML+MvRyYpDaxmPtkLqkwyQrazq
 MXrQ==
X-Gm-Message-State: AOAM530SpjqGnwJhSNFbvQ8Ks9Nu3kVIqhzAkXAjTP+u4qf9pbZQ6JLP
 AD/vFXWXEkAHBAJKWHL3t5z6Njsg+rvaNw==
X-Google-Smtp-Source: ABdhPJxclNaXCs2w8NxKoLVLYunWPXfPKS7bvepBFMg2SgUpzzz2Hw/9seSJbtGU6J1Ii/tQWGyU0rirxY7xpw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:ad4:4f41:: with SMTP id
 eu1mr19379200qvb.1.1607991207663; Mon, 14 Dec 2020 16:13:27 -0800 (PST)
Date: Mon, 14 Dec 2020 16:13:09 -0800
In-Reply-To: <20201215001312.3120777-1-wuhaotsh@google.com>
Message-Id: <20201215001312.3120777-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 2/5] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3p__XXwgKCgw86tm054ts00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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
 f4bug@armsat.org, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
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
 hw/timer/npcm7xx_timer.c         | 23 +++++++++++++----------
 include/hw/misc/npcm7xx_clk.h    |  6 ------
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

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
index d24445bd6e..8147b53000 100644
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
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
     SysBusDevice *sbd = &s->parent;
+    DeviceState *dev = DEVICE(obj);
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


