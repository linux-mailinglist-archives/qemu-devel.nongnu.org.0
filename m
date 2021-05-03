Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30913715E6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:24:31 +0200 (CEST)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYYo-0001un-VY
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1ldYQa-0004vz-Q5
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:16:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:55121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1ldYQU-00013k-4X
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:16:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id k128so3299502wmk.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q17j8d71b9fj2wxKr94IZOvhe9xgii8XxAa8Hd7RUq4=;
 b=PxoG3kZuG5NWEhtCTcXlyP2lOc++SmAmbobu21hgy+RwbljqSjTsNfkXJ0lu2UcQ7n
 wE+JkQcZM1Iajd9YcyMDNMR0e+JITzSfZa0VhMHlvGlwCAxYJMpssftv5BB82pHI5HVV
 V94jFxD4qhdDsAhJ4x0p1p+Qm9FmnAe3cX2orP8d2dQmRD5h/xZ2eHXQ2zFIFt3LwoBh
 58wqIFb+/1hzIntwzKB2umJHsI5QBSjBETIcFZw+guhjslK3c0xTAsIYOOPIl7CoQDsg
 dEB78MDtFUTAG0pdx+l7hfLqO8kpQaMQXepVoh2OgKJVhit5mAnU02TPN3/9xVYDjYf8
 5oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q17j8d71b9fj2wxKr94IZOvhe9xgii8XxAa8Hd7RUq4=;
 b=dNjo/jke1oxew68AsjjyAFLqCxS/yVfFspGdiO3yeLAsx/0CCbVU43/uBOEdLV+M9Y
 xDare3K0/ckEXLAoRWT/YBx1/GC7057Ms67ed0oFKpBzpCPjZA9Lj5e2LpKpFG4IE9s+
 7H1I3QPAZBN3akJNZHbV4M2UzHHtpKVbe4akucTgnRCpYTlcmbKbqHY/nEsbaB1XKb+G
 HdoxlYafQ1SgdI/i8Uvwg2J81lUtqoz5C2SnV1hmi4Guhrd9qpac8x9ZPG1HEJbX8aqo
 Sxbi4RQ9wNiItAffJmmBAMuQP1WA7ByrWWG8lUm1YM2iJr3q8g9Cm3S1hxDXLsW6Bqs/
 8QMg==
X-Gm-Message-State: AOAM532pjhDCXlxJd7U39oyaRW8lBFMXSaHhvceGAHtxako7RvBECeQG
 ShROJr4diSd0ZTIAD/2ZxONdUg==
X-Google-Smtp-Source: ABdhPJwjkqHFc4uroSS45LqkEzOE0xYQYfxwrthx5J0KOAdx90j1rqvJkLV2Iy5YUTM+Cpw2ffJQgQ==
X-Received: by 2002:a05:600c:3548:: with SMTP id
 i8mr32537414wmq.110.1620047750030; 
 Mon, 03 May 2021 06:15:50 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id y17sm13872636wrw.90.2021.05.03.06.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 06:15:49 -0700 (PDT)
Subject: Re: [RFC 1/1] Implement AVR watchdog timer
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20210502201040.52296-1-mrolnik@gmail.com>
 <20210502201040.52296-3-mrolnik@gmail.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <f5bcde37-c84b-57ae-613d-a66bed788050@adacore.com>
Date: Mon, 3 May 2021 15:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210502201040.52296-3-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: me@xcancerberox.com.ar, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 5/2/21 à 10:10 PM, Michael Rolnik a écrit :
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> ---
>   hw/avr/Kconfig                |   1 +
>   hw/avr/atmega.c               |  15 ++-
>   hw/avr/atmega.h               |   2 +
>   hw/watchdog/Kconfig           |   3 +
>   hw/watchdog/avr_wdt.c         | 190 ++++++++++++++++++++++++++++++++++
>   hw/watchdog/meson.build       |   2 +
>   hw/watchdog/trace-events      |   5 +
>   include/hw/watchdog/avr_wdt.h |  47 +++++++++
>   target/avr/cpu.c              |   3 +
>   target/avr/cpu.h              |   1 +
>   target/avr/helper.c           |   7 +-
>   11 files changed, 271 insertions(+), 5 deletions(-)
>   create mode 100644 hw/watchdog/avr_wdt.c
>   create mode 100644 include/hw/watchdog/avr_wdt.h
> 
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index d31298c3cc..9939e4902f 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
>       select AVR_TIMER16
>       select AVR_USART
>       select AVR_POWER
> +    select AVR_WDT
>   
>   config ARDUINO
>       select AVR_ATMEGA_MCU
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb..31ceb1c21c 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -28,6 +28,7 @@ enum AtmegaPeripheral {
>       GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
>       USART0, USART1, USART2, USART3,
>       TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
> +    WDT,
>       PERIFMAX
>   };
>   
> @@ -75,6 +76,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] = {
>       [GPIOD]         = {  0x29 },
>       [GPIOC]         = {  0x26 },
>       [GPIOB]         = {  0x23 },
> +    [WDT]           = {  0x60 },
>   }, dev1280_2560[PERIFMAX] = {
>       [USART3]        = { 0x130, POWER1, 2 },
>       [TIMER5]        = { 0x120, POWER1, 5, 0x73, 0x3a, true },
> @@ -99,6 +101,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] = {
>       [GPIOC]         = {  0x26 },
>       [GPIOB]         = {  0x23 },
>       [GPIOA]         = {  0x20 },
> +    [WDT]           = {  0x60 },
>   };
>   
>   enum AtmegaIrq {
> @@ -118,6 +121,7 @@ enum AtmegaIrq {
>           TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
>       TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
>           TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
> +    WATCHDOG_TIMER_IRQ,
>       IRQ_COUNT
>   };
>   
> @@ -133,6 +137,7 @@ enum AtmegaIrq {
>   #define TIMER_OVF_IRQ(n)    (n * TIMER_IRQ_COUNT + TIMER0_OVF_IRQ)
>   
>   static const uint8_t irq168_328[IRQ_COUNT] = {
> +    [WATCHDOG_TIMER_IRQ]    = 7,
>       [TIMER2_COMPA_IRQ]      = 8,
>       [TIMER2_COMPB_IRQ]      = 9,
>       [TIMER2_OVF_IRQ]        = 10,
> @@ -147,6 +152,7 @@ static const uint8_t irq168_328[IRQ_COUNT] = {
>       [USART0_DRE_IRQ]        = 20,
>       [USART0_TXC_IRQ]        = 21,
>   }, irq1280_2560[IRQ_COUNT] = {
> +    [WATCHDOG_TIMER_IRQ]    = 13,
>       [TIMER2_COMPA_IRQ]      = 14,
>       [TIMER2_COMPB_IRQ]      = 15,
>       [TIMER2_OVF_IRQ]        = 16,
> @@ -344,10 +350,17 @@ static void atmega_realize(DeviceState *dev, Error **errp)
>           g_free(devname);
>       }
>   
> +    /* Watchdog Timer */
> +    object_initialize_child(OBJECT(dev), "wdt", &s->wdt, TYPE_AVR_WDT);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,
> +                    OFFSET_DATA + mc->dev[WDT].addr);
> +    qdev_connect_gpio_out_named(cpudev, "wdr", 0,
> +                    qdev_get_gpio_in_named(DEVICE(&s->wdt), "wdr", 0));
> +
>       create_unimplemented_device("avr-twi",          OFFSET_DATA + 0x0b8, 6);
>       create_unimplemented_device("avr-adc",          OFFSET_DATA + 0x078, 8);
>       create_unimplemented_device("avr-ext-mem-ctrl", OFFSET_DATA + 0x074, 2);
> -    create_unimplemented_device("avr-watchdog",     OFFSET_DATA + 0x060, 1);
>       create_unimplemented_device("avr-spi",          OFFSET_DATA + 0x04c, 3);
>       create_unimplemented_device("avr-eeprom",       OFFSET_DATA + 0x03f, 3);
>   }
> diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> index a99ee15c7e..60bbd44bdd 100644
> --- a/hw/avr/atmega.h
> +++ b/hw/avr/atmega.h
> @@ -13,6 +13,7 @@
>   
>   #include "hw/char/avr_usart.h"
>   #include "hw/timer/avr_timer16.h"
> +#include "hw/watchdog/avr_wdt.h"
>   #include "hw/misc/avr_power.h"
>   #include "target/avr/cpu.h"
>   #include "qom/object.h"
> @@ -45,6 +46,7 @@ struct AtmegaMcuState {
>       AVRMaskState pwr[POWER_MAX];
>       AVRUsartState usart[USART_MAX];
>       AVRTimer16State timer[TIMER_MAX];
> +    AVRWatchdogState wdt;
>       uint64_t xtal_freq_hz;
>   };
>   
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 66e1d029e3..e0f89d2fe0 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -20,3 +20,6 @@ config WDT_IMX2
>   
>   config WDT_SBSA
>       bool
> +
> +config AVR_WDT
> +    bool
> diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c
> new file mode 100644
> index 0000000000..4ce1029a64
> --- /dev/null
> +++ b/hw/watchdog/avr_wdt.c
> @@ -0,0 +1,190 @@
> +/*
> + * AVR watchdog
> + *
> + * Copyright (c) 2018 Michael Rolnik

2021?

> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/watchdog/avr_wdt.h"
> +#include "trace.h"
> +
> +/* Field masks */
> +#define WDTCSR_MASK_WDP0     0x01
> +#define WDTCSR_MASK_WDP1     0x02
> +#define WDTCSR_MASK_WDP2     0x04
> +#define WDTCSR_MASK_WDE      0x08
> +#define WDTCSR_MASK_WCE      0x10
> +#define WDTCSR_MASK_WDP3     0x20
> +#define WDTCSR_MASK_WDIE     0x40
> +#define WDTCSR_MASK_WDIF     0x80
> +
> +#define WDTCSR_SHFT_WDP0     0x00
> +#define WDTCSR_SHFT_WDP1     0x01
> +#define WDTCSR_SHFT_WDP2     0x02
> +#define WDTCSR_SHFT_WDE      0x03
> +#define WDTCSR_SHFT_WCE      0x04
> +#define WDTCSR_SHFT_WDP3     0x05
> +#define WDTCSR_SHFT_WDIE     0x06
> +#define WDTCSR_SHFT_WDIF     0x07
> +
> +/* Helper macros */
> +#define WDP0(csr)       ((csr & WDTCSR_MASK_WDP0) >> WDTCSR_SHFT_WDP0)
> +#define WDP1(csr)       ((csr & WDTCSR_MASK_WDP1) >> WDTCSR_SHFT_WDP1)
> +#define WDP2(csr)       ((csr & WDTCSR_MASK_WDP2) >> WDTCSR_SHFT_WDP2)
> +#define WDP3(csr)       ((csr & WDTCSR_MASK_WDP3) >> WDTCSR_SHFT_WDP3)
> +#define WDP(csr)        ((WDP3(csr) << 3) | (WDP2(csr) << 2) | \
> +                         (WDP1(csr) << 1) | (WDP0(csr) << 0))
> +#define WDIE(csr)       ((csr & WDTCSR_MASK_WDIE) >> WDTCSR_SHFT_WDIE)
> +#define WDE(csr)        ((csr & WDTCSR_MASK_WDE) >> WDTCSR_SHFT_WDE)
> +#define WCE(csr)        ((csr & WDTCSR_MASK_WCE) >> WDTCSR_SHFT_WCE)
> +
> +#define DB_PRINT(fmt, args...) /* Nothing */
> +
> +#define MS2NS(n)        ((n) * 1000000ull)
> +
> +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
> +{
> +    uint32_t csr = wdt->csr;
> +    int wdp = WDP(csr);
> +    assert(wdp <= 9);

Maybe qemu_log(..) instead and pick a default value?

> +
> +    if (WDIE(csr) == 0 && WDE(csr) == 0) {
> +        /* watchdog is stopped */
> +        return;
> +    }
> +
> +    timer_mod_ns(wdt->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            (MS2NS(15) << wdp));
> +}
> +
> +static void avr_wdt_interrupt(void *opaque)
> +{
> +    AVRWatchdogState *wdt = opaque;
> +    int8_t csr = wdt->csr;
> +
> +    if (WDE(csr) == 0 && WDIE(csr) == 0) {
> +        /* Stopped */
> +
> +    } else if (WDE(csr) == 0 && WDIE(csr) == 1) {
> +        /* Interrupt Mode */
> +        wdt->csr |= WDTCSR_MASK_WDIF;
> +        qemu_set_irq(wdt->irq, 1);
> +        trace_avr_wdt_interrupt();
> +    } else if (WDE(csr) == 1 && WDIE(csr) == 0) {
> +        /* System Reset Mode */

        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);

+/- setting the MCUSR, WDRF flags would be nice.

> +    } else if (WDE(csr) == 1 && WDIE(csr) == 1) {
> +        /* Interrupt and System Reset Mode */
> +        wdt->csr |= WDTCSR_MASK_WDIF;
> +        qemu_set_irq(wdt->irq, 1);
> +        trace_avr_wdt_interrupt();
> +    }
> +
> +    avr_wdt_reset_alarm(wdt);
> +}
> +
> +static void avr_wdt_reset(DeviceState *dev)
> +{
> +    AVRWatchdogState *wdt = AVR_WDT(dev);
> +
> +    wdt->csr = 0;
> +    qemu_set_irq(wdt->irq, 0);
> +    avr_wdt_reset_alarm(wdt);
> +}
> +
> +static uint64_t avr_wdt_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    assert(size == 1);
> +    AVRWatchdogState *wdt = opaque;
> +    uint8_t retval = wdt->csr;
> +
> +    trace_avr_wdt_read(offset, retval);
> +
> +    return (uint64_t)retval;
> +}
> +
> +static void avr_wdt_write(void *opaque, hwaddr offset,
> +                              uint64_t val64, unsigned size)
> +{
> +    assert(size == 1);
> +    AVRWatchdogState *wdt = opaque;
> +    uint8_t val8 = (uint8_t)val64;
> +
> +    trace_avr_wdt_write(offset, val8);
> +
> +    wdt->csr = val8;
> +    avr_wdt_reset_alarm(wdt);
> +}
> +
> +static const MemoryRegionOps avr_wdt_ops = {
> +    .read = avr_wdt_read,
> +    .write = avr_wdt_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {.max_access_size = 1}
> +};
> +
> +static void avr_wdt_wdr(void *opaque, int irq, int level)
> +{
> +    AVRWatchdogState *wdt = AVR_WDT(opaque);
> +
> +    avr_wdt_reset_alarm(wdt);
> +}
> +
> +static void avr_wdt_init(Object *obj)
> +{
> +    AVRWatchdogState *s = AVR_WDT(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> +
> +    memory_region_init_io(&s->iomem, obj, &avr_wdt_ops,
> +                          s, "avr-wdt", 0xa);
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +    qdev_init_gpio_in_named(DEVICE(s), avr_wdt_wdr, "wdr", 1);
> +}
> +
> +static void avr_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    AVRWatchdogState *s = AVR_WDT(dev);
> +
> +    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, avr_wdt_interrupt, s);
> +}
> +
> +static void avr_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = avr_wdt_reset;
> +    dc->realize = avr_wdt_realize;
> +}
> +
> +static const TypeInfo avr_wdt_info = {
> +    .name          = TYPE_AVR_WDT,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AVRWatchdogState),
> +    .instance_init = avr_wdt_init,
> +    .class_init    = avr_wdt_class_init,
> +};
> +
> +static void avr_wdt_register_types(void)
> +{
> +    type_register_static(&avr_wdt_info);
> +}
> +
> +type_init(avr_wdt_register_types)
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 054c403dea..8db2be8317 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -6,3 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
>   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
>   softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
>   softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
> +
> +specific_ss.add(when: 'CONFIG_AVR_WDT', if_true: files('avr_wdt.c'))
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index 3124ca1f1b..ac14773179 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -5,3 +5,8 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK AP
>   cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>   cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
>   cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
> +
> +# avr_wdt.c
> +avr_wdt_read(uint8_t addr, uint8_t value) "wdt read addr:%u value:%u"
> +avr_wdt_write(uint8_t addr, uint8_t value) "wdt write addr:%u value:%u"
> +avr_wdt_interrupt(void) ""
> diff --git a/include/hw/watchdog/avr_wdt.h b/include/hw/watchdog/avr_wdt.h
> new file mode 100644
> index 0000000000..2679e8f2a6
> --- /dev/null
> +++ b/include/hw/watchdog/avr_wdt.h
> @@ -0,0 +1,47 @@
> +/*
> + * AVR 16-bit timer

AVR Watchdog?

> + *
> + * Copyright (c) 2021 Michael Rolnik
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
> +#ifndef HW_WATCHDOG_AVR_WDT_H
> +#define HW_WATCHDOG_AVR_WDT_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "hw/hw.h"
> +#include "qom/object.h"
> +
> +#define TYPE_AVR_WDT "avr-wdt"
> +OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)
> +
> +struct AVRWatchdogState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion iomem;
> +    MemoryRegion imsk_iomem;
> +    MemoryRegion ifr_iomem;
> +    QEMUTimer *timer;
> +    qemu_irq irq;
> +
> +    /* registers */
> +    uint8_t csr;
> +};
> +
> +#endif /* HW_WATCHDOG_AVR_WDT_H */
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 0f4596932b..d5eb785833 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -131,6 +131,9 @@ static void avr_cpu_initfn(Object *obj)
>       /* Set the number of interrupts supported by the CPU. */
>       qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int,
>                         sizeof(cpu->env.intsrc) * 8);
> +
> +    /* register watchdog timer reset interrupt */
> +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->wdr, "wdr", 1);
>   }
>   
>   static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index d148e8c75a..f8f5641c8b 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -152,6 +152,7 @@ typedef struct AVRCPU {
>   
>       CPUNegativeOffsetState neg;
>       CPUAVRState env;
> +    qemu_irq wdr; /* reset WDT */
>   } AVRCPU;
>   
>   extern const struct VMStateDescription vms_avr_cpu;
> diff --git a/target/avr/helper.c b/target/avr/helper.c
> index 35e1019594..dd88057e5f 100644
> --- a/target/avr/helper.c
> +++ b/target/avr/helper.c
> @@ -24,6 +24,7 @@
>   #include "exec/exec-all.h"
>   #include "exec/address-spaces.h"
>   #include "exec/helper-proto.h"
> +#include "hw/irq.h"
>   
>   bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>   {
> @@ -188,11 +189,9 @@ void helper_break(CPUAVRState *env)
>   
>   void helper_wdr(CPUAVRState *env)
>   {
> -    CPUState *cs = env_cpu(env);
> +    AVRCPU *cpu = env_archcpu(env);
>   
> -    /* WD is not implemented yet, placeholder */
> -    cs->exception_index = EXCP_DEBUG;
> -    cpu_loop_exit(cs);
> +    qemu_set_irq(cpu->wdr, 1);
>   }
>   
>   /*
> 

Thanks!

