Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100A381747
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:48:09 +0200 (CEST)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqu0-0007PO-8i
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqrI-0005Yp-6x
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:45:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqrF-0003Cw-0R
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:45:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s8so1477788wrw.10
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rHulvhVloIbFZHIBfQNLda86sR5+HIKqO6x1md3Detw=;
 b=RHJBoHAXi1zBAQ+lgqwAB9inbI2/sGKyDXKzCekjIJiN97N3mBBwnUt7g+M8FAigDH
 fQJwym3ddUbmGwrEiZ28gc4Zpo/Oi/ru/PIlff6M1pOyxsoUUSkMHSEQLL5YC1OiIM/M
 B0dSoynnvDwfxUdpu0I6YUtLiCze9vdh3neItKIkvQ8XIe5Re04sEUC8QzdjENGjBLRi
 sizcFNkGYa6R7qG1vXSVxMzCUaRbpWKyb1ROeIZBA2aVER3CJcVDeob5hJc/sEdA5Bd2
 eqVtbHu1KhMa9LCGQqZE+3vzDxLrkwtbKobl2vZV3vQwdwP38jKduah1Dp9WRhP8+/LH
 rtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rHulvhVloIbFZHIBfQNLda86sR5+HIKqO6x1md3Detw=;
 b=mrdZPbMBVJd0X+IrBEv6VM+Ddd03y2iwCW13Ox8WG/oiwzqu9K1CFwSZtAIek1cv94
 fdxxiPzKUrz/0ar/kqRdNIjVJolTcIrGM+sV5/2Rky7889Dv2XuizaxkybJsch/7ItYP
 A4++ZTzNacYHgdtqZJj5hnEpxfiqhTC6QFC6XF+0/KYGOH9H2emMwiFXAI0cBJDEE8UN
 PE6Nx3D9lrLaEAHDMp+dDYX0Z1A228CzU07dNAOlABH2Z1rLCE61UKQ5oghbJ9yIpRJz
 rz++68KpSuIYtUtQUX2crk4EbXsw8mKZqUiHfEvEb3/Z5otWiLb+Buv05mQxRbr8UYyF
 gZuQ==
X-Gm-Message-State: AOAM531IfoM0noh1n1pC7ALmG7n31b9w9PsngJ3Mndt/n4KyFenuY35X
 XYZeXu07m2HQxtTQG22uE8Y=
X-Google-Smtp-Source: ABdhPJyREdLAElnqVCieF3hmlBtAcaGeX3LQ3u3DLvc08gb6PiLAZNd610gYMeU8HXlmB5u+c8DNzw==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr61876811wrs.22.1621071915204; 
 Sat, 15 May 2021 02:45:15 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k7sm9392299wro.8.2021.05.15.02.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:45:14 -0700 (PDT)
Subject: Re: [RFC 1/1] Implement AVR watchdog timer
To: Michael Rolnik <mrolnik@gmail.com>, Fred Konrad <konrad@adacore.com>
References: <20210502201040.52296-1-mrolnik@gmail.com>
 <20210502201040.52296-3-mrolnik@gmail.com>
 <f5bcde37-c84b-57ae-613d-a66bed788050@adacore.com>
 <CAK4993jn+t+UMk_yi35KSNXOjaD_pz=TW893AtBag7gzYvJ3YA@mail.gmail.com>
 <CAK4993iyo=FOE0x+tzQNWGexeHTOd+xpQAte+O9phXyMkFHJkQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <de5af4d1-ab78-3f6b-119f-dc3f8000f3c7@amsat.org>
Date: Sat, 15 May 2021 11:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK4993iyo=FOE0x+tzQNWGexeHTOd+xpQAte+O9phXyMkFHJkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Pavel/Alex

On 5/3/21 10:08 PM, Michael Rolnik wrote:
> Hi all,
> 
> I was about to make icount work. but, there is something I still don't
> understand. I have this code 
> 
> timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, avr_wdt_interrupt, s);
> 
> and then
> 
> void avr_wdt_interrupt(/* some arguments */) {
> #define MS2NS(n)        ((n) * 1000000ull)
>     timer_mod_ns(timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + MS2NS(15));
> }
> 
> when running with --icount shift=0, *avr_wdt_interrupt* is called about
> every 1K instructions, however it should have been called 15M
> instructions as shift=0 makes every instruction to be executed in 1
> virtual ns.
> 
> What am I doing wrong?
> 
> Thank you,
> Michael Rolnik
> 
> 
> On Mon, May 3, 2021 at 4:36 PM Michael Rolnik <mrolnik@gmail.com
> <mailto:mrolnik@gmail.com>> wrote:
> 
>     Hi Fred.
> 
>     1. thanks
>     2. It seems I have forgotten to set those flags.
>     3. 15ms is easy to test 8s will take 533 times longer, so in my case
>     3200 instructions which is totally incorrect. I don't understand why
>     as I program the timer in virtual nanoseconds and not host time.
>     4. I hope Richard could help with icount.
> 
>     best regards,
>     Michael Rolnik
> 
>     On Mon, May 3, 2021 at 4:15 PM Fred Konrad <konrad@adacore.com
>     <mailto:konrad@adacore.com>> wrote:
> 
> 
> 
>         Le 5/2/21 à 10:10 PM, Michael Rolnik a écrit :
>         > Signed-off-by: Michael Rolnik <mrolnik@gmail.com
>         <mailto:mrolnik@gmail.com>>
>         > ---
>         >   hw/avr/Kconfig                |   1 +
>         >   hw/avr/atmega.c               |  15 ++-
>         >   hw/avr/atmega.h               |   2 +
>         >   hw/watchdog/Kconfig           |   3 +
>         >   hw/watchdog/avr_wdt.c         | 190
>         ++++++++++++++++++++++++++++++++++
>         >   hw/watchdog/meson.build       |   2 +
>         >   hw/watchdog/trace-events      |   5 +
>         >   include/hw/watchdog/avr_wdt.h |  47 +++++++++
>         >   target/avr/cpu.c              |   3 +
>         >   target/avr/cpu.h              |   1 +
>         >   target/avr/helper.c           |   7 +-
>         >   11 files changed, 271 insertions(+), 5 deletions(-)
>         >   create mode 100644 hw/watchdog/avr_wdt.c
>         >   create mode 100644 include/hw/watchdog/avr_wdt.h
>         >
>         > diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
>         > index d31298c3cc..9939e4902f 100644
>         > --- a/hw/avr/Kconfig
>         > +++ b/hw/avr/Kconfig
>         > @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
>         >       select AVR_TIMER16
>         >       select AVR_USART
>         >       select AVR_POWER
>         > +    select AVR_WDT
>         >   
>         >   config ARDUINO
>         >       select AVR_ATMEGA_MCU
>         > diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
>         > index 44c6afebbb..31ceb1c21c 100644
>         > --- a/hw/avr/atmega.c
>         > +++ b/hw/avr/atmega.c
>         > @@ -28,6 +28,7 @@ enum AtmegaPeripheral {
>         >       GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
>         >       USART0, USART1, USART2, USART3,
>         >       TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
>         > +    WDT,
>         >       PERIFMAX
>         >   };
>         >   
>         > @@ -75,6 +76,7 @@ static const peripheral_cfg
>         dev168_328[PERIFMAX] = {
>         >       [GPIOD]         = {  0x29 },
>         >       [GPIOC]         = {  0x26 },
>         >       [GPIOB]         = {  0x23 },
>         > +    [WDT]           = {  0x60 },
>         >   }, dev1280_2560[PERIFMAX] = {
>         >       [USART3]        = { 0x130, POWER1, 2 },
>         >       [TIMER5]        = { 0x120, POWER1, 5, 0x73, 0x3a, true },
>         > @@ -99,6 +101,7 @@ static const peripheral_cfg
>         dev168_328[PERIFMAX] = {
>         >       [GPIOC]         = {  0x26 },
>         >       [GPIOB]         = {  0x23 },
>         >       [GPIOA]         = {  0x20 },
>         > +    [WDT]           = {  0x60 },
>         >   };
>         >   
>         >   enum AtmegaIrq {
>         > @@ -118,6 +121,7 @@ enum AtmegaIrq {
>         >           TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
>         >       TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
>         >           TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
>         > +    WATCHDOG_TIMER_IRQ,
>         >       IRQ_COUNT
>         >   };
>         >   
>         > @@ -133,6 +137,7 @@ enum AtmegaIrq {
>         >   #define TIMER_OVF_IRQ(n)    (n * TIMER_IRQ_COUNT +
>         TIMER0_OVF_IRQ)
>         >   
>         >   static const uint8_t irq168_328[IRQ_COUNT] = {
>         > +    [WATCHDOG_TIMER_IRQ]    = 7,
>         >       [TIMER2_COMPA_IRQ]      = 8,
>         >       [TIMER2_COMPB_IRQ]      = 9,
>         >       [TIMER2_OVF_IRQ]        = 10,
>         > @@ -147,6 +152,7 @@ static const uint8_t irq168_328[IRQ_COUNT] = {
>         >       [USART0_DRE_IRQ]        = 20,
>         >       [USART0_TXC_IRQ]        = 21,
>         >   }, irq1280_2560[IRQ_COUNT] = {
>         > +    [WATCHDOG_TIMER_IRQ]    = 13,
>         >       [TIMER2_COMPA_IRQ]      = 14,
>         >       [TIMER2_COMPB_IRQ]      = 15,
>         >       [TIMER2_OVF_IRQ]        = 16,
>         > @@ -344,10 +350,17 @@ static void atmega_realize(DeviceState
>         *dev, Error **errp)
>         >           g_free(devname);
>         >       }
>         >   
>         > +    /* Watchdog Timer */
>         > +    object_initialize_child(OBJECT(dev), "wdt", &s->wdt,
>         TYPE_AVR_WDT);
>         > +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_abort);
>         > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,
>         > +                    OFFSET_DATA + mc->dev[WDT].addr);
>         > +    qdev_connect_gpio_out_named(cpudev, "wdr", 0,
>         > +                    qdev_get_gpio_in_named(DEVICE(&s->wdt),
>         "wdr", 0));
>         > +
>         >       create_unimplemented_device("avr-twi",         
>         OFFSET_DATA + 0x0b8, 6);
>         >       create_unimplemented_device("avr-adc",         
>         OFFSET_DATA + 0x078, 8);
>         >       create_unimplemented_device("avr-ext-mem-ctrl",
>         OFFSET_DATA + 0x074, 2);
>         > -    create_unimplemented_device("avr-watchdog",   
>          OFFSET_DATA + 0x060, 1);
>         >       create_unimplemented_device("avr-spi",         
>         OFFSET_DATA + 0x04c, 3);
>         >       create_unimplemented_device("avr-eeprom",     
>          OFFSET_DATA + 0x03f, 3);
>         >   }
>         > diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
>         > index a99ee15c7e..60bbd44bdd 100644
>         > --- a/hw/avr/atmega.h
>         > +++ b/hw/avr/atmega.h
>         > @@ -13,6 +13,7 @@
>         >   
>         >   #include "hw/char/avr_usart.h"
>         >   #include "hw/timer/avr_timer16.h"
>         > +#include "hw/watchdog/avr_wdt.h"
>         >   #include "hw/misc/avr_power.h"
>         >   #include "target/avr/cpu.h"
>         >   #include "qom/object.h"
>         > @@ -45,6 +46,7 @@ struct AtmegaMcuState {
>         >       AVRMaskState pwr[POWER_MAX];
>         >       AVRUsartState usart[USART_MAX];
>         >       AVRTimer16State timer[TIMER_MAX];
>         > +    AVRWatchdogState wdt;
>         >       uint64_t xtal_freq_hz;
>         >   };
>         >   
>         > diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
>         > index 66e1d029e3..e0f89d2fe0 100644
>         > --- a/hw/watchdog/Kconfig
>         > +++ b/hw/watchdog/Kconfig
>         > @@ -20,3 +20,6 @@ config WDT_IMX2
>         >   
>         >   config WDT_SBSA
>         >       bool
>         > +
>         > +config AVR_WDT
>         > +    bool
>         > diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c
>         > new file mode 100644
>         > index 0000000000..4ce1029a64
>         > --- /dev/null
>         > +++ b/hw/watchdog/avr_wdt.c
>         > @@ -0,0 +1,190 @@
>         > +/*
>         > + * AVR watchdog
>         > + *
>         > + * Copyright (c) 2018 Michael Rolnik
> 
>         2021?
> 
>         > + *
>         > + * This library is free software; you can redistribute it and/or
>         > + * modify it under the terms of the GNU Lesser General Public
>         > + * License as published by the Free Software Foundation; either
>         > + * version 2.1 of the License, or (at your option) any later
>         version.
>         > + *
>         > + * This library is distributed in the hope that it will be
>         useful,
>         > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>         > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>         the GNU
>         > + * Lesser General Public License for more details.
>         > + *
>         > + * You should have received a copy of the GNU Lesser General
>         Public
>         > + * License along with this library; if not, see
>         > + * <http://www.gnu.org/licenses/lgpl-2.1.html
>         <http://www.gnu.org/licenses/lgpl-2.1.html>>
>         > + */
>         > +
>         > +#include "qemu/osdep.h"
>         > +#include "qapi/error.h"
>         > +#include "qemu/log.h"
>         > +#include "hw/irq.h"
>         > +#include "hw/watchdog/avr_wdt.h"
>         > +#include "trace.h"
>         > +
>         > +/* Field masks */
>         > +#define WDTCSR_MASK_WDP0     0x01
>         > +#define WDTCSR_MASK_WDP1     0x02
>         > +#define WDTCSR_MASK_WDP2     0x04
>         > +#define WDTCSR_MASK_WDE      0x08
>         > +#define WDTCSR_MASK_WCE      0x10
>         > +#define WDTCSR_MASK_WDP3     0x20
>         > +#define WDTCSR_MASK_WDIE     0x40
>         > +#define WDTCSR_MASK_WDIF     0x80
>         > +
>         > +#define WDTCSR_SHFT_WDP0     0x00
>         > +#define WDTCSR_SHFT_WDP1     0x01
>         > +#define WDTCSR_SHFT_WDP2     0x02
>         > +#define WDTCSR_SHFT_WDE      0x03
>         > +#define WDTCSR_SHFT_WCE      0x04
>         > +#define WDTCSR_SHFT_WDP3     0x05
>         > +#define WDTCSR_SHFT_WDIE     0x06
>         > +#define WDTCSR_SHFT_WDIF     0x07
>         > +
>         > +/* Helper macros */
>         > +#define WDP0(csr)       ((csr & WDTCSR_MASK_WDP0) >>
>         WDTCSR_SHFT_WDP0)
>         > +#define WDP1(csr)       ((csr & WDTCSR_MASK_WDP1) >>
>         WDTCSR_SHFT_WDP1)
>         > +#define WDP2(csr)       ((csr & WDTCSR_MASK_WDP2) >>
>         WDTCSR_SHFT_WDP2)
>         > +#define WDP3(csr)       ((csr & WDTCSR_MASK_WDP3) >>
>         WDTCSR_SHFT_WDP3)
>         > +#define WDP(csr)        ((WDP3(csr) << 3) | (WDP2(csr) << 2) | \
>         > +                         (WDP1(csr) << 1) | (WDP0(csr) << 0))
>         > +#define WDIE(csr)       ((csr & WDTCSR_MASK_WDIE) >>
>         WDTCSR_SHFT_WDIE)
>         > +#define WDE(csr)        ((csr & WDTCSR_MASK_WDE) >>
>         WDTCSR_SHFT_WDE)
>         > +#define WCE(csr)        ((csr & WDTCSR_MASK_WCE) >>
>         WDTCSR_SHFT_WCE)
>         > +
>         > +#define DB_PRINT(fmt, args...) /* Nothing */
>         > +
>         > +#define MS2NS(n)        ((n) * 1000000ull)
>         > +
>         > +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
>         > +{
>         > +    uint32_t csr = wdt->csr;
>         > +    int wdp = WDP(csr);
>         > +    assert(wdp <= 9);
> 
>         Maybe qemu_log(..) instead and pick a default value?
> 
>         > +
>         > +    if (WDIE(csr) == 0 && WDE(csr) == 0) {
>         > +        /* watchdog is stopped */
>         > +        return;
>         > +    }
>         > +
>         > +    timer_mod_ns(wdt->timer,
>         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>         > +            (MS2NS(15) << wdp));
>         > +}
>         > +
>         > +static void avr_wdt_interrupt(void *opaque)
>         > +{
>         > +    AVRWatchdogState *wdt = opaque;
>         > +    int8_t csr = wdt->csr;
>         > +
>         > +    if (WDE(csr) == 0 && WDIE(csr) == 0) {
>         > +        /* Stopped */
>         > +
>         > +    } else if (WDE(csr) == 0 && WDIE(csr) == 1) {
>         > +        /* Interrupt Mode */
>         > +        wdt->csr |= WDTCSR_MASK_WDIF;
>         > +        qemu_set_irq(wdt->irq, 1);
>         > +        trace_avr_wdt_interrupt();
>         > +    } else if (WDE(csr) == 1 && WDIE(csr) == 0) {
>         > +        /* System Reset Mode */
> 
>                 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> 
>         +/- setting the MCUSR, WDRF flags would be nice.
> 
>         > +    } else if (WDE(csr) == 1 && WDIE(csr) == 1) {
>         > +        /* Interrupt and System Reset Mode */
>         > +        wdt->csr |= WDTCSR_MASK_WDIF;
>         > +        qemu_set_irq(wdt->irq, 1);
>         > +        trace_avr_wdt_interrupt();
>         > +    }
>         > +
>         > +    avr_wdt_reset_alarm(wdt);
>         > +}
>         > +
>         > +static void avr_wdt_reset(DeviceState *dev)
>         > +{
>         > +    AVRWatchdogState *wdt = AVR_WDT(dev);
>         > +
>         > +    wdt->csr = 0;
>         > +    qemu_set_irq(wdt->irq, 0);
>         > +    avr_wdt_reset_alarm(wdt);
>         > +}
>         > +
>         > +static uint64_t avr_wdt_read(void *opaque, hwaddr offset,
>         unsigned size)
>         > +{
>         > +    assert(size == 1);
>         > +    AVRWatchdogState *wdt = opaque;
>         > +    uint8_t retval = wdt->csr;
>         > +
>         > +    trace_avr_wdt_read(offset, retval);
>         > +
>         > +    return (uint64_t)retval;
>         > +}
>         > +
>         > +static void avr_wdt_write(void *opaque, hwaddr offset,
>         > +                              uint64_t val64, unsigned size)
>         > +{
>         > +    assert(size == 1);
>         > +    AVRWatchdogState *wdt = opaque;
>         > +    uint8_t val8 = (uint8_t)val64;
>         > +
>         > +    trace_avr_wdt_write(offset, val8);
>         > +
>         > +    wdt->csr = val8;
>         > +    avr_wdt_reset_alarm(wdt);
>         > +}
>         > +
>         > +static const MemoryRegionOps avr_wdt_ops = {
>         > +    .read = avr_wdt_read,
>         > +    .write = avr_wdt_write,
>         > +    .endianness = DEVICE_NATIVE_ENDIAN,
>         > +    .impl = {.max_access_size = 1}
>         > +};
>         > +
>         > +static void avr_wdt_wdr(void *opaque, int irq, int level)
>         > +{
>         > +    AVRWatchdogState *wdt = AVR_WDT(opaque);
>         > +
>         > +    avr_wdt_reset_alarm(wdt);
>         > +}
>         > +
>         > +static void avr_wdt_init(Object *obj)
>         > +{
>         > +    AVRWatchdogState *s = AVR_WDT(obj);
>         > +
>         > +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>         > +
>         > +    memory_region_init_io(&s->iomem, obj, &avr_wdt_ops,
>         > +                          s, "avr-wdt", 0xa);
>         > +
>         > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>         > +    qdev_init_gpio_in_named(DEVICE(s), avr_wdt_wdr, "wdr", 1);
>         > +}
>         > +
>         > +static void avr_wdt_realize(DeviceState *dev, Error **errp)
>         > +{
>         > +    AVRWatchdogState *s = AVR_WDT(dev);
>         > +
>         > +    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>         avr_wdt_interrupt, s);
>         > +}
>         > +
>         > +static void avr_wdt_class_init(ObjectClass *klass, void *data)
>         > +{
>         > +    DeviceClass *dc = DEVICE_CLASS(klass);
>         > +
>         > +    dc->reset = avr_wdt_reset;
>         > +    dc->realize = avr_wdt_realize;
>         > +}
>         > +
>         > +static const TypeInfo avr_wdt_info = {
>         > +    .name          = TYPE_AVR_WDT,
>         > +    .parent        = TYPE_SYS_BUS_DEVICE,
>         > +    .instance_size = sizeof(AVRWatchdogState),
>         > +    .instance_init = avr_wdt_init,
>         > +    .class_init    = avr_wdt_class_init,
>         > +};
>         > +
>         > +static void avr_wdt_register_types(void)
>         > +{
>         > +    type_register_static(&avr_wdt_info);
>         > +}
>         > +
>         > +type_init(avr_wdt_register_types)
>         > diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
>         > index 054c403dea..8db2be8317 100644
>         > --- a/hw/watchdog/meson.build
>         > +++ b/hw/watchdog/meson.build
>         > @@ -6,3 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288',
>         if_true: files('wdt_diag288.c'))
>         >   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
>         files('wdt_aspeed.c'))
>         >   softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true:
>         files('wdt_imx2.c'))
>         >   softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true:
>         files('sbsa_gwdt.c'))
>         > +
>         > +specific_ss.add(when: 'CONFIG_AVR_WDT', if_true:
>         files('avr_wdt.c'))
>         > diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
>         > index 3124ca1f1b..ac14773179 100644
>         > --- a/hw/watchdog/trace-events
>         > +++ b/hw/watchdog/trace-events
>         > @@ -5,3 +5,8 @@ cmsdk_apb_watchdog_read(uint64_t offset,
>         uint64_t data, unsigned size) "CMSDK AP
>         >   cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data,
>         unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 "
>         data 0x%" PRIx64 " size %u"
>         >   cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
>         >   cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog:
>         lock %" PRIu32
>         > +
>         > +# avr_wdt.c
>         > +avr_wdt_read(uint8_t addr, uint8_t value) "wdt read addr:%u
>         value:%u"
>         > +avr_wdt_write(uint8_t addr, uint8_t value) "wdt write addr:%u
>         value:%u"
>         > +avr_wdt_interrupt(void) ""
>         > diff --git a/include/hw/watchdog/avr_wdt.h
>         b/include/hw/watchdog/avr_wdt.h
>         > new file mode 100644
>         > index 0000000000..2679e8f2a6
>         > --- /dev/null
>         > +++ b/include/hw/watchdog/avr_wdt.h
>         > @@ -0,0 +1,47 @@
>         > +/*
>         > + * AVR 16-bit timer
> 
>         AVR Watchdog?
> 
>         > + *
>         > + * Copyright (c) 2021 Michael Rolnik
>         > + *
>         > + * This library is free software; you can redistribute it and/or
>         > + * modify it under the terms of the GNU Lesser General Public
>         > + * License as published by the Free Software Foundation; either
>         > + * version 2.1 of the License, or (at your option) any later
>         version.
>         > + *
>         > + * This library is distributed in the hope that it will be
>         useful,
>         > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>         > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>         the GNU
>         > + * Lesser General Public License for more details.
>         > + *
>         > + * You should have received a copy of the GNU Lesser General
>         Public
>         > + * License along with this library; if not, see
>         > + * <http://www.gnu.org/licenses/lgpl-2.1.html
>         <http://www.gnu.org/licenses/lgpl-2.1.html>>
>         > + */
>         > +
>         > +#ifndef HW_WATCHDOG_AVR_WDT_H
>         > +#define HW_WATCHDOG_AVR_WDT_H
>         > +
>         > +#include "hw/sysbus.h"
>         > +#include "qemu/timer.h"
>         > +#include "hw/hw.h"
>         > +#include "qom/object.h"
>         > +
>         > +#define TYPE_AVR_WDT "avr-wdt"
>         > +OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)
>         > +
>         > +struct AVRWatchdogState {
>         > +    /* <private> */
>         > +    SysBusDevice parent_obj;
>         > +
>         > +    /* <public> */
>         > +    MemoryRegion iomem;
>         > +    MemoryRegion imsk_iomem;
>         > +    MemoryRegion ifr_iomem;
>         > +    QEMUTimer *timer;
>         > +    qemu_irq irq;
>         > +
>         > +    /* registers */
>         > +    uint8_t csr;
>         > +};
>         > +
>         > +#endif /* HW_WATCHDOG_AVR_WDT_H */
>         > diff --git a/target/avr/cpu.c b/target/avr/cpu.c
>         > index 0f4596932b..d5eb785833 100644
>         > --- a/target/avr/cpu.c
>         > +++ b/target/avr/cpu.c
>         > @@ -131,6 +131,9 @@ static void avr_cpu_initfn(Object *obj)
>         >       /* Set the number of interrupts supported by the CPU. */
>         >       qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int,
>         >                         sizeof(cpu->env.intsrc) * 8);
>         > +
>         > +    /* register watchdog timer reset interrupt */
>         > +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->wdr, "wdr", 1);
>         >   }
>         >   
>         >   static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
>         > diff --git a/target/avr/cpu.h b/target/avr/cpu.h
>         > index d148e8c75a..f8f5641c8b 100644
>         > --- a/target/avr/cpu.h
>         > +++ b/target/avr/cpu.h
>         > @@ -152,6 +152,7 @@ typedef struct AVRCPU {
>         >   
>         >       CPUNegativeOffsetState neg;
>         >       CPUAVRState env;
>         > +    qemu_irq wdr; /* reset WDT */
>         >   } AVRCPU;
>         >   
>         >   extern const struct VMStateDescription vms_avr_cpu;
>         > diff --git a/target/avr/helper.c b/target/avr/helper.c
>         > index 35e1019594..dd88057e5f 100644
>         > --- a/target/avr/helper.c
>         > +++ b/target/avr/helper.c
>         > @@ -24,6 +24,7 @@
>         >   #include "exec/exec-all.h"
>         >   #include "exec/address-spaces.h"
>         >   #include "exec/helper-proto.h"
>         > +#include "hw/irq.h"
>         >   
>         >   bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>         >   {
>         > @@ -188,11 +189,9 @@ void helper_break(CPUAVRState *env)
>         >   
>         >   void helper_wdr(CPUAVRState *env)
>         >   {
>         > -    CPUState *cs = env_cpu(env);
>         > +    AVRCPU *cpu = env_archcpu(env);
>         >   
>         > -    /* WD is not implemented yet, placeholder */
>         > -    cs->exception_index = EXCP_DEBUG;
>         > -    cpu_loop_exit(cs);
>         > +    qemu_set_irq(cpu->wdr, 1);
>         >   }
>         >   
>         >   /*
>         >
> 
>         Thanks!
> 
> 
> 
>     -- 
>     Best Regards,
>     Michael Rolnik
> 
> 
> 
> -- 
> Best Regards,
> Michael Rolnik

