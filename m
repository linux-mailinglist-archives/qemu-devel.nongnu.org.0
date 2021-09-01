Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C73FD89E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:22:48 +0200 (CEST)
Received: from localhost ([::1]:36678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOKN-0003ym-Fr
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcf-0007ER-1c
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcc-00064e-0R
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so985521wmn.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pjHIglZVcmFuWS0fXi1aYzb1TFNuneqcQaujO+wsYlY=;
 b=SpH/Q41t9WTOFP4vUmbC8z4EDDMC4sapxNfDmUA/VISG0+Qd9Ycb3Y9+I4QZRsVN+l
 T+XOlo5aHMTcUUrr1ePMg+fBWnuGZN0TqoDrnUxFHi7342i45RQJyNUZRyCSs0GKQpLK
 WJOzuxWK+7vhJKeQAzrWHYjY/wRQGw6ii0DYAIdwBsfVg/zGjVtGgWdlC8cMj5fWiSu6
 XbQ+R7QoZpCDV/DapWTgOSfwtxC/cZLU7UBKC08GhU3arS32fvT9Q7XReBqpDOON4+sI
 xXRqo0h4bohBr4S4K8iC2fT46HZ+xM3nWJ1OmcUz01DHGBgysvZeEQmO3yyHab0vUEkD
 naUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjHIglZVcmFuWS0fXi1aYzb1TFNuneqcQaujO+wsYlY=;
 b=teXChD5kvWrQa8CKummg/8T66R6xCqrghXFnSm/3y7yfCn8rAvPymjvAXY0r8NtVQF
 6wr5moNXKEBa9GqbV6K3dOzFK8FLamUygejRvjtcjNdZ01MMfu3uiFLEk+8HsS2Dx4oZ
 66zk4neKNw6KVYb+EcZRTdMdM2qZHbDPL8EXj2YaiwapZ4JkYFNrvRNfyCJO3zh8M3c5
 yb6uejE1IYIfh7xnXf444XsrGmgH+5CuTFqwOPX0c7XWDpdbE9cowDRPUwvEZH65qxWM
 Ctup7GkpYSBm3JD/TrItwpF2zJ5a/qdKJtmg+3ZrQVJsvly/VjvNrlrzU2O2f93c/jWQ
 gsqg==
X-Gm-Message-State: AOAM531hdl7MXhNFERmk+PqoC6eXCs48Dsju4WaztlAe3lH2j8i0FLhZ
 2N3F8KnMxVw5JqvJVWFkiu0wGgoQTxo/aw==
X-Google-Smtp-Source: ABdhPJxJBKvngXoK5bXsaBgGjEddOKsPBVbfuKYJyzGRnnN9SxpI6/NPjvUeCrqoiabmLXrg/jHvhA==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr8718928wmq.159.1630492650335; 
 Wed, 01 Sep 2021 03:37:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/51] arm: Remove system_clock_scale global
Date: Wed,  1 Sep 2021 11:36:53 +0100
Message-Id: <20210901103653.13435-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All the devices that used to use system_clock_scale have now been
converted to use Clock inputs instead, so the global is no longer
needed; remove it and all the code that sets it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210812093356.1946-26-peter.maydell@linaro.org
---
 include/hw/timer/armv7m_systick.h | 22 ----------------------
 hw/arm/armsse.c                   | 17 +----------------
 hw/arm/mps2.c                     |  2 --
 hw/arm/msf2-soc.c                 |  2 --
 hw/arm/netduino2.c                |  2 --
 hw/arm/netduinoplus2.c            |  2 --
 hw/arm/nrf51_soc.c                |  2 --
 hw/arm/stellaris.c                |  7 ++++---
 hw/arm/stm32vldiscovery.c         |  2 --
 hw/timer/armv7m_systick.c         |  2 --
 10 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 38adf8d274e..ee09b138810 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -47,26 +47,4 @@ struct SysTickState {
     Clock *cpuclk;
 };
 
-/*
- * Multiplication factor to convert from system clock ticks to qemu timer
- * ticks. This should be set (by board code, usually) to a value
- * equal to NANOSECONDS_PER_SECOND / frq, where frq is the clock frequency
- * in Hz of the CPU.
- *
- * This value is used by the systick device when it is running in
- * its "use the CPU clock" mode (ie when SYST_CSR.CLKSOURCE == 1) to
- * set how fast the timer should tick.
- *
- * TODO: we should refactor this so that rather than using a global
- * we use a device property or something similar. This is complicated
- * because (a) the property would need to be plumbed through from the
- * board code down through various layers to the systick device
- * and (b) the property needs to be modifiable after realize, because
- * the stellaris board uses this to implement the behaviour where the
- * guest can reprogram the PLL registers to downclock the CPU, and the
- * systick device needs to react accordingly. Possibly this should
- * be deferred until we have a good API for modelling clock trees.
- */
-extern int system_clock_scale;
-
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 70b52c3d4b9..aecdeb9815a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -689,17 +689,6 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
-static void armsse_mainclk_update(void *opaque, ClockEvent event)
-{
-    ARMSSE *s = ARM_SSE(opaque);
-
-    /*
-     * Set system_clock_scale from our Clock input; this is what
-     * controls the tick rate of the CPU SysTick timer.
-     */
-    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
-}
-
 static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARM_SSE(obj);
@@ -711,8 +700,7 @@ static void armsse_init(Object *obj)
     assert(info->sram_banks <= MAX_SRAM_BANKS);
     assert(info->num_cpus <= SSE_MAX_CPUS);
 
-    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
-                                    armsse_mainclk_update, s, ClockUpdate);
+    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL, 0);
     s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL, 0);
 
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
@@ -1654,9 +1642,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * devices in the ARMSSE.
      */
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
-
-    /* Set initial system_clock_scale from MAINCLK */
-    armsse_mainclk_update(s, ClockUpdate);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 3671f49ad7b..4634aa1a1ca 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -439,8 +439,6 @@ static void mps2_common_init(MachineState *machine)
                  qdev_get_gpio_in(armv7m,
                                   mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
                        0x400000);
 }
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index dbc6d936a76..b5fe9f364d5 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -144,8 +144,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
-    system_clock_scale = clock_ticks_to_ns(s->m3clk, 1);
-
     for (i = 0; i < MSF2_NUM_UARTS; i++) {
         if (serial_hd(i)) {
             serial_mm_init(get_system_memory(), uart_addr[i], 2,
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index b5c0ba23ee5..3365da11bf7 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -39,8 +39,6 @@ static void netduino2_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index a5a8999cc8c..76cea8e4891 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -39,8 +39,6 @@ static void netduinoplus2_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index e3e849a32b1..34da0d62f00 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -84,8 +84,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
      * will always provide one).
      */
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
-
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu), errp)) {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 3e7d1dabad1..78827ace6b8 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -263,17 +263,18 @@ static bool ssys_use_rcc2(ssys_state *s)
  */
 static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
 {
+    int period_ns;
     /*
      * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
      * clock is 200MHz, which is a period of 5 ns. Dividing the clock
      * frequency by X is the same as multiplying the period by X.
      */
     if (ssys_use_rcc2(s)) {
-        system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
+        period_ns = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
     } else {
-        system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
+        period_ns = 5 * (((s->rcc >> 23) & 0xf) + 1);
     }
-    clock_set_ns(s->sysclk, system_clock_scale);
+    clock_set_ns(s->sysclk, period_ns);
     if (propagate_clock) {
         clock_propagate(s->sysclk);
     }
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 9b79004703b..04036da3ee0 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -42,8 +42,6 @@ static void stm32vldiscovery_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 21f6d0fd24f..3bd951dd044 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -30,8 +30,6 @@
 #define SYSCALIB_SKEW (1U << 30)
 #define SYSCALIB_TENMS ((1U << 24) - 1)
 
-int system_clock_scale;
-
 static void systick_set_period_from_clock(SysTickState *s)
 {
     /*
-- 
2.20.1


