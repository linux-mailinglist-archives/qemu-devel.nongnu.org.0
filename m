Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59147301860
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 21:36:07 +0100 (CET)
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Pde-00006O-9p
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 15:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3Pam-0006Q9-5m; Sat, 23 Jan 2021 15:33:08 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:58778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3Pai-0004M0-NA; Sat, 23 Jan 2021 15:33:07 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id E6E27C602E6;
 Sat, 23 Jan 2021 21:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611433982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o0MhxP2amAO2wmCkP5GQa9QYhvVkmkT5o+o/3r+w3LM=;
 b=RPOCR4ewsFmmlX7ZSZ2btX7iFJbtxAiUA6HBwz8zfHTH1ofOw2QniarLcrJYaBAQylf+tc
 3o5uBkKmz7qtBqUnfx9jFjyG9SeSf/PNiF31dTzh42Kdhg0ziKA/M0iebmeGmbr8DLGCDl
 sRz2rXP+mNQe8VaVkETicJooPO/CBE4wnD7qJI4noEMDc8RjICk1DGOMkfOK6GqI8xHE/w
 JazGcBk825xe5YC05BEaG9Rlqdrp3IsNupProfFoDD0HF/R9lYJweh9vEst0yQj+OP6C/k
 +XCfwo0cP6MYj7npzbfC7uvrIaIJdH2z4LAMl3pA9Gm4YH6KPABmPTCn7CY3Xw==
Date: Sat, 23 Jan 2021 21:33:24 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 24/25] arm: Remove frq properties on CMSDK timer,
 dualtimer, watchdog, ARMSSE
Message-ID: <20210123203324.wgzlgcyxclyo6i4i@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-25-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-25-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Now no users are setting the frq properties on the CMSDK timer,
> dualtimer, watchdog or ARMSSE SoC devices, we can remove the
> properties and the struct fields that back them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armsse.h                  | 2 --
>  include/hw/timer/cmsdk-apb-dualtimer.h   | 2 --
>  include/hw/timer/cmsdk-apb-timer.h       | 2 --
>  include/hw/watchdog/cmsdk-apb-watchdog.h | 2 --
>  hw/arm/armsse.c                          | 2 --
>  hw/timer/cmsdk-apb-dualtimer.c           | 6 ------
>  hw/timer/cmsdk-apb-timer.c               | 6 ------
>  hw/watchdog/cmsdk-apb-watchdog.c         | 6 ------
>  8 files changed, 28 deletions(-)
> 
> diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
> index bfa1e79c4fe..676cd4f36b0 100644
> --- a/include/hw/arm/armsse.h
> +++ b/include/hw/arm/armsse.h
> @@ -41,7 +41,6 @@
>   *  + Clock input "S32KCLK": slow 32KHz clock used for a few peripherals
>   *  + QOM property "memory" is a MemoryRegion containing the devices provided
>   *    by the board model.
> - *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
>   *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
>   *    (In hardware, the SSE-200 permits the number of expansion interrupts
>   *    for the two CPUs to be configured separately, but we restrict it to
> @@ -218,7 +217,6 @@ struct ARMSSE {
>      /* Properties */
>      MemoryRegion *board_memory;
>      uint32_t exp_numirq;
> -    uint32_t mainclk_frq;
>      uint32_t sram_addr_width;
>      uint32_t init_svtor;
>      bool cpu_fpu[SSE_MAX_CPUS];
> diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
> index 3adbb01dd34..f3ec86c00b5 100644
> --- a/include/hw/timer/cmsdk-apb-dualtimer.h
> +++ b/include/hw/timer/cmsdk-apb-dualtimer.h
> @@ -16,7 +16,6 @@
>   * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
>   *
>   * QEMU interface:
> - *  + QOM property "pclk-frq": frequency at which the timer is clocked
>   *  + Clock input "TIMCLK": clock (for both timers)
>   *  + sysbus MMIO region 0: the register bank
>   *  + sysbus IRQ 0: combined timer interrupt TIMINTC
> @@ -63,7 +62,6 @@ struct CMSDKAPBDualTimer {
>      /*< public >*/
>      MemoryRegion iomem;
>      qemu_irq timerintc;
> -    uint32_t pclk_frq;
>      Clock *timclk;
>  
>      CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
> diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
> index 54f7ec8c502..c4c7eae8499 100644
> --- a/include/hw/timer/cmsdk-apb-timer.h
> +++ b/include/hw/timer/cmsdk-apb-timer.h
> @@ -23,7 +23,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
>  
>  /*
>   * QEMU interface:
> - *  + QOM property "pclk-frq": frequency at which the timer is clocked
>   *  + Clock input "pclk": clock for the timer
>   *  + sysbus MMIO region 0: the register bank
>   *  + sysbus IRQ 0: timer interrupt TIMERINT
> @@ -35,7 +34,6 @@ struct CMSDKAPBTimer {
>      /*< public >*/
>      MemoryRegion iomem;
>      qemu_irq timerint;
> -    uint32_t pclk_frq;
>      struct ptimer_state *timer;
>      Clock *pclk;
>  
> diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
> index 34069ca6969..c6b3e78731e 100644
> --- a/include/hw/watchdog/cmsdk-apb-watchdog.h
> +++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
> @@ -16,7 +16,6 @@
>   * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
>   *
>   * QEMU interface:
> - *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
>   *  + Clock input "WDOGCLK": clock for the watchdog's timer
>   *  + sysbus MMIO region 0: the register bank
>   *  + sysbus IRQ 0: watchdog interrupt
> @@ -53,7 +52,6 @@ struct CMSDKAPBWatchdog {
>      /*< public >*/
>      MemoryRegion iomem;
>      qemu_irq wdogint;
> -    uint32_t wdogclk_frq;
>      bool is_luminary;
>      struct ptimer_state *timer;
>      Clock *wdogclk;
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 7494afc630e..513caa33a9a 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -48,7 +48,6 @@ static Property iotkit_properties[] = {
>      DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> -    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
>      DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
>      DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
> @@ -60,7 +59,6 @@ static Property armsse_properties[] = {
>      DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
>                       MemoryRegion *),
>      DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
> -    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
>      DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
>      DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
>      DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
> diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> index 828127b366f..ef49f5852d3 100644
> --- a/hw/timer/cmsdk-apb-dualtimer.c
> +++ b/hw/timer/cmsdk-apb-dualtimer.c
> @@ -533,11 +533,6 @@ static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
>      }
>  };
>  
> -static Property cmsdk_apb_dualtimer_properties[] = {
> -    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBDualTimer, pclk_frq, 0),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -545,7 +540,6 @@ static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
>      dc->realize = cmsdk_apb_dualtimer_realize;
>      dc->vmsd = &cmsdk_apb_dualtimer_vmstate;
>      dc->reset = cmsdk_apb_dualtimer_reset;
> -    device_class_set_props(dc, cmsdk_apb_dualtimer_properties);
>  }
>  
>  static const TypeInfo cmsdk_apb_dualtimer_info = {
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index f053146d88f..ee51ce3369c 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -261,11 +261,6 @@ static const VMStateDescription cmsdk_apb_timer_vmstate = {
>      }
>  };
>  
> -static Property cmsdk_apb_timer_properties[] = {
> -    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTimer, pclk_frq, 0),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -273,7 +268,6 @@ static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
>      dc->realize = cmsdk_apb_timer_realize;
>      dc->vmsd = &cmsdk_apb_timer_vmstate;
>      dc->reset = cmsdk_apb_timer_reset;
> -    device_class_set_props(dc, cmsdk_apb_timer_properties);
>  }
>  
>  static const TypeInfo cmsdk_apb_timer_info = {
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index 9cad0c67da4..302f1711738 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -373,11 +373,6 @@ static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
>      }
>  };
>  
> -static Property cmsdk_apb_watchdog_properties[] = {
> -    DEFINE_PROP_UINT32("wdogclk-frq", CMSDKAPBWatchdog, wdogclk_frq, 0),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
>  static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -385,7 +380,6 @@ static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
>      dc->realize = cmsdk_apb_watchdog_realize;
>      dc->vmsd = &cmsdk_apb_watchdog_vmstate;
>      dc->reset = cmsdk_apb_watchdog_reset;
> -    device_class_set_props(dc, cmsdk_apb_watchdog_properties);
>  }
>  
>  static const TypeInfo cmsdk_apb_watchdog_info = {
> -- 
> 2.20.1
> 

-- 

