Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98CF380417
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 09:22:41 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhS9g-000386-Bg
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 03:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lhS8F-0002TP-Vo
 for qemu-devel@nongnu.org; Fri, 14 May 2021 03:21:13 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1lhS89-0000O9-NQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 03:21:11 -0400
Received: by mail-qk1-x730.google.com with SMTP id v8so9945218qkv.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 00:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MnkegemQbcE5ZstgmKNwYEWraRxcX7XeCp1Mi1t9tg=;
 b=aFHzaqDN/MwAt1ZK6rJRzCurOaIff4vM/WlXsedtZuKKROihMqqugREr5l/Vi6kr8t
 F9MSk2N6HMHlpXwHvvTxjZQg4hm8pvkcOYzWXwUxwouzK0zEi3XRDz+qwXk4Gt+AUkBq
 NOlKpB4q3S5lq3ds2bjVlZxvmZ25PBCnXlcZOjwZYseoAO0rrOsGMxsKNAhD+Ce7yZA1
 jmHz7+jkoGm3MAtXMvJJIYN8beSV1QloV4wnBFd0e3DcCtOUAvymBvr4lYhN1g/EcfNU
 pctJ4niJOPb5z4otFfRsZTU2N4Su7ubfBgEPbiZ59DUTYi2YWmfIiJO+RPmQx4zBf4GT
 ryAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MnkegemQbcE5ZstgmKNwYEWraRxcX7XeCp1Mi1t9tg=;
 b=oSxK+iY4z+hY3X0RZeplzLaWf3GGDAr3JXdoLZ+2pMlC7yGPhTsnZ2U/1K+SSrlEoG
 GgnO8iP4U7bWzL5ynC+hGsYaYFWkKmz8Kpw0arpiwzvg37QFxGLxZigXpAXk0bixYkAO
 F3xIzgPCzOMxkTPQA6tmn1adktTxyNweSE3ezwlIzVNwaydhFh2QhEY5Q51B/zVWuIOk
 ar9Q59DjBcp/2UtocWRdSQjzFxqEuHR3IHHHZvaaSlofPtxhLmI2hhiYVhhFho8P4qlc
 SzqvBokRPjltyXcHzCQQT59/5MqZnYe005Q1CM9Bmm4jlCQ1LIj8EkdMPtiOxhGSnR0m
 AfSg==
X-Gm-Message-State: AOAM532cYe0hk0t3+65U+CJVRlTsPXcHauWxr8hYiKdRA8CskMXnCeWF
 Ed4UTEVPEVFGUju6GhQMwMyq1fUW6OkRqwMc37w=
X-Google-Smtp-Source: ABdhPJxwrNFXqJ1fVq1+KstZCNXDZfdFdXczF72Cl6zcvdgk0kFW2/SKwAy2NxbbJioaxJiWDe+A2UtYNYqtMzPlSMA=
X-Received: by 2002:a05:620a:1344:: with SMTP id
 c4mr42148255qkl.489.1620976862372; 
 Fri, 14 May 2021 00:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210505211849.101005-1-mrolnik@gmail.com>
 <20210505211849.101005-2-mrolnik@gmail.com>
 <cb5462b5-046c-91e3-5b1f-7c32d2722939@ispras.ru>
In-Reply-To: <cb5462b5-046c-91e3-5b1f-7c32d2722939@ispras.ru>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Fri, 14 May 2021 10:20:48 +0300
Message-ID: <CAK4993j1zozaCaiXzBNt-KQ2sfOR8LkrgKrggCkVd2_hOsix8Q@mail.gmail.com>
Subject: Re: [RFC 1/1] Implement AVR watchdog timer
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: multipart/alternative; boundary="0000000000001226dd05c2451654"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Fred Konrad <konrad@adacore.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001226dd05c2451654
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

Sent from my cell phone, please ignore typos

On Thu, May 13, 2021, 3:27 PM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
wrote:

> On 06.05.2021 00:18, Michael Rolnik wrote:
> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> > ---
> >   MAINTAINERS                   |   2 +
> >   hw/avr/Kconfig                |   1 +
> >   hw/avr/atmega.c               |  15 +-
> >   hw/avr/atmega.h               |   2 +
> >   hw/watchdog/Kconfig           |   3 +
> >   hw/watchdog/avr_wdt.c         | 274 +++++++++++++++++++++++++++++++++=
+
> >   hw/watchdog/meson.build       |   2 +
> >   hw/watchdog/trace-events      |   5 +
> >   include/hw/watchdog/avr_wdt.h |  47 ++++++
> >   target/avr/cpu.c              |   3 +
> >   target/avr/cpu.h              |   1 +
> >   target/avr/helper.c           |   7 +-
> >   target/avr/translate.c        |  38 ++++-
> >   13 files changed, 391 insertions(+), 9 deletions(-)
> >   create mode 100644 hw/watchdog/avr_wdt.c
> >   create mode 100644 include/hw/watchdog/avr_wdt.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4c05ff8bba..e1fce736d2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1052,6 +1052,8 @@ F: include/hw/timer/avr_timer16.h
> >   F: hw/timer/avr_timer16.c
> >   F: include/hw/misc/avr_power.h
> >   F: hw/misc/avr_power.c
> > +F: include/hw/watchdog/avr_wdt.h
> > +F: hw/watchdog/avr_wdt.c
> >
> >   Arduino
> >   M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> > index d31298c3cc..9939e4902f 100644
> > --- a/hw/avr/Kconfig
> > +++ b/hw/avr/Kconfig
> > @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
> >       select AVR_TIMER16
> >       select AVR_USART
> >       select AVR_POWER
> > +    select AVR_WDT
> >
> >   config ARDUINO
> >       select AVR_ATMEGA_MCU
> > diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> > index 44c6afebbb..31ceb1c21c 100644
> > --- a/hw/avr/atmega.c
> > +++ b/hw/avr/atmega.c
> > @@ -28,6 +28,7 @@ enum AtmegaPeripheral {
> >       GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,
> >       USART0, USART1, USART2, USART3,
> >       TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIMER5,
> > +    WDT,
> >       PERIFMAX
> >   };
> >
> > @@ -75,6 +76,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D =
{
> >       [GPIOD]         =3D {  0x29 },
> >       [GPIOC]         =3D {  0x26 },
> >       [GPIOB]         =3D {  0x23 },
> > +    [WDT]           =3D {  0x60 },
> >   }, dev1280_2560[PERIFMAX] =3D {
> >       [USART3]        =3D { 0x130, POWER1, 2 },
> >       [TIMER5]        =3D { 0x120, POWER1, 5, 0x73, 0x3a, true },
> > @@ -99,6 +101,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D=
 {
> >       [GPIOC]         =3D {  0x26 },
> >       [GPIOB]         =3D {  0x23 },
> >       [GPIOA]         =3D {  0x20 },
> > +    [WDT]           =3D {  0x60 },
> >   };
> >
> >   enum AtmegaIrq {
> > @@ -118,6 +121,7 @@ enum AtmegaIrq {
> >           TIMER4_COMPC_IRQ, TIMER4_OVF_IRQ,
> >       TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_COMPB_IRQ,
> >           TIMER5_COMPC_IRQ, TIMER5_OVF_IRQ,
> > +    WATCHDOG_TIMER_IRQ,
> >       IRQ_COUNT
> >   };
> >
> > @@ -133,6 +137,7 @@ enum AtmegaIrq {
> >   #define TIMER_OVF_IRQ(n)    (n * TIMER_IRQ_COUNT + TIMER0_OVF_IRQ)
> >
> >   static const uint8_t irq168_328[IRQ_COUNT] =3D {
> > +    [WATCHDOG_TIMER_IRQ]    =3D 7,
> >       [TIMER2_COMPA_IRQ]      =3D 8,
> >       [TIMER2_COMPB_IRQ]      =3D 9,
> >       [TIMER2_OVF_IRQ]        =3D 10,
> > @@ -147,6 +152,7 @@ static const uint8_t irq168_328[IRQ_COUNT] =3D {
> >       [USART0_DRE_IRQ]        =3D 20,
> >       [USART0_TXC_IRQ]        =3D 21,
> >   }, irq1280_2560[IRQ_COUNT] =3D {
> > +    [WATCHDOG_TIMER_IRQ]    =3D 13,
> >       [TIMER2_COMPA_IRQ]      =3D 14,
> >       [TIMER2_COMPB_IRQ]      =3D 15,
> >       [TIMER2_OVF_IRQ]        =3D 16,
> > @@ -344,10 +350,17 @@ static void atmega_realize(DeviceState *dev, Erro=
r
> **errp)
> >           g_free(devname);
> >       }
> >
> > +    /* Watchdog Timer */
> > +    object_initialize_child(OBJECT(dev), "wdt", &s->wdt, TYPE_AVR_WDT)=
;
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_abort);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0,
> > +                    OFFSET_DATA + mc->dev[WDT].addr);
> > +    qdev_connect_gpio_out_named(cpudev, "wdr", 0,
> > +                    qdev_get_gpio_in_named(DEVICE(&s->wdt), "wdr", 0))=
;
> > +
> >       create_unimplemented_device("avr-twi",          OFFSET_DATA +
> 0x0b8, 6);
> >       create_unimplemented_device("avr-adc",          OFFSET_DATA +
> 0x078, 8);
> >       create_unimplemented_device("avr-ext-mem-ctrl", OFFSET_DATA +
> 0x074, 2);
> > -    create_unimplemented_device("avr-watchdog",     OFFSET_DATA +
> 0x060, 1);
> >       create_unimplemented_device("avr-spi",          OFFSET_DATA +
> 0x04c, 3);
> >       create_unimplemented_device("avr-eeprom",       OFFSET_DATA +
> 0x03f, 3);
> >   }
> > diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
> > index a99ee15c7e..60bbd44bdd 100644
> > --- a/hw/avr/atmega.h
> > +++ b/hw/avr/atmega.h
> > @@ -13,6 +13,7 @@
> >
> >   #include "hw/char/avr_usart.h"
> >   #include "hw/timer/avr_timer16.h"
> > +#include "hw/watchdog/avr_wdt.h"
> >   #include "hw/misc/avr_power.h"
> >   #include "target/avr/cpu.h"
> >   #include "qom/object.h"
> > @@ -45,6 +46,7 @@ struct AtmegaMcuState {
> >       AVRMaskState pwr[POWER_MAX];
> >       AVRUsartState usart[USART_MAX];
> >       AVRTimer16State timer[TIMER_MAX];
> > +    AVRWatchdogState wdt;
> >       uint64_t xtal_freq_hz;
> >   };
> >
> > diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> > index 66e1d029e3..e0f89d2fe0 100644
> > --- a/hw/watchdog/Kconfig
> > +++ b/hw/watchdog/Kconfig
> > @@ -20,3 +20,6 @@ config WDT_IMX2
> >
> >   config WDT_SBSA
> >       bool
> > +
> > +config AVR_WDT
> > +    bool
> > diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c
> > new file mode 100644
> > index 0000000000..cbd6457c8b
> > --- /dev/null
> > +++ b/hw/watchdog/avr_wdt.c
> > @@ -0,0 +1,274 @@
> > +/*
> > + * AVR watchdog
> > + *
> > + * Copyright (c) 2021 Michael Rolnik
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see
> > + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/log.h"
> > +#include "hw/irq.h"
> > +#include "hw/watchdog/avr_wdt.h"
> > +#include "trace.h"
> > +#include "target/avr/cpu.h"
> > +#include "sysemu/runstate.h"
> > +
> > +/* Field masks */
> > +#define WDTCSR_MASK_WDP0    0x01
> > +#define WDTCSR_MASK_WDP1    0x02
> > +#define WDTCSR_MASK_WDP2    0x04
> > +#define WDTCSR_MASK_WDE     0x08
> > +#define WDTCSR_MASK_WDCE    0x10
> > +#define WDTCSR_MASK_WDP3    0x20
> > +#define WDTCSR_MASK_WDIE    0x40
> > +#define WDTCSR_MASK_WDIF    0x80
> > +
> > +#define WDTCSR_SHFT_WDP0    0x00
> > +#define WDTCSR_SHFT_WDP1    0x01
> > +#define WDTCSR_SHFT_WDP2    0x02
> > +#define WDTCSR_SHFT_WDE     0x03
> > +#define WDTCSR_SHFT_WDCE    0x04
> > +#define WDTCSR_SHFT_WDP3    0x05
> > +#define WDTCSR_SHFT_WDIE    0x06
> > +#define WDTCSR_SHFT_WDIF    0x07
> > +
> > +#define MCUSR_MASK_WDRF     0x04
> > +#define MCUSR_ADDR      (OFFSET_DATA + 0x55)
> > +
> > +/* Helper macros */
> > +#define WDP0(csr)       ((csr & WDTCSR_MASK_WDP0) >> WDTCSR_SHFT_WDP0)
> > +#define WDP1(csr)       ((csr & WDTCSR_MASK_WDP1) >> WDTCSR_SHFT_WDP1)
> > +#define WDP2(csr)       ((csr & WDTCSR_MASK_WDP2) >> WDTCSR_SHFT_WDP2)
> > +#define WDP3(csr)       ((csr & WDTCSR_MASK_WDP3) >> WDTCSR_SHFT_WDP3)
> > +#define WDP(csr)        ((WDP3(csr) << 3) | (WDP2(csr) << 2) | \
> > +                         (WDP1(csr) << 1) | (WDP0(csr) << 0))
> > +#define WDIE(csr)       ((csr & WDTCSR_MASK_WDIE) >> WDTCSR_SHFT_WDIE)
> > +#define WDE(csr)        ((csr & WDTCSR_MASK_WDE) >> WDTCSR_SHFT_WDE)
> > +#define WCE(csr)        ((csr & WDTCSR_MASK_WCE) >> WDTCSR_SHFT_WCE)
> > +
> > +#define DB_PRINT(fmt, args...) /* Nothing */
> > +
> > +#define MS2NS(n)        ((n) * 1000000ull)
>
> I think there is SCALE_MS define for that.
>
> > +
> > +static void set_bits(uint8_t *addr, uint8_t bits)
> > +{
> > +    *addr |=3D bits;
> > +}
> > +
> > +static void rst_bits(uint8_t *addr, uint8_t bits)
> > +{
> > +    *addr &=3D ~bits;
> > +}
> > +
> > +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
> > +{
> > +    uint32_t csr =3D wdt->csr;
> > +    int wdp =3D WDP(csr);
> > +
> > +    if (WDIE(csr) =3D=3D 0 && WDE(csr) =3D=3D 0) {
> > +        /* watchdog is stopped */
> > +        return;
> > +    }
> > +
> > +    timer_mod_ns(wdt->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > +            (MS2NS(15) << wdp));
> > +}
> > +
> > +static void avr_wdt_interrupt(void *opaque)
> > +{
> > +    AVRWatchdogState *wdt =3D opaque;
> > +    int8_t csr =3D wdt->csr;
> > +
> > +    if (WDIE(csr) =3D=3D 1) {
> > +        /* Interrupt Mode */
> > +        set_bits(&wdt->csr, WDTCSR_MASK_WDIF);
> > +        qemu_set_irq(wdt->irq, 1);
> > +        trace_avr_wdt_interrupt();
> > +        rst_bits(&wdt->csr, WDTCSR_MASK_WDIF | WDTCSR_MASK_WDIE);
> > +    }
> > +
> > +    if (WDE(csr) =3D=3D 1) {
> > +        /* System Reset Mode */
> > +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +    }
> > +
> > +    avr_wdt_reset_alarm(wdt);
> > +}
> > +
> > +static void avr_wdt_reset(DeviceState *dev)
> > +{
> > +    AVRWatchdogState *wdt =3D AVR_WDT(dev);
> > +
> > +    wdt->csr =3D 0;
> > +    qemu_set_irq(wdt->irq, 0);
> > +    avr_wdt_reset_alarm(wdt);
> > +}
> > +
> > +static uint64_t avr_wdt_read(void *opaque, hwaddr offset, unsigned siz=
e)
> > +{
> > +    assert(size =3D=3D 1);
> > +    AVRWatchdogState *wdt =3D opaque;
> > +    uint8_t retval =3D wdt->csr;
> > +
> > +    trace_avr_wdt_read(offset, retval);
> > +
> > +    return (uint64_t)retval;
> > +}
> > +
> > +static void avr_wdt_write(void *opaque, hwaddr offset,
> > +                              uint64_t val64, unsigned size)
> > +{
> > +    assert(size =3D=3D 1);
> > +    AVRWatchdogState *wdt =3D opaque;
> > +    uint8_t val =3D (uint8_t)val64;
> > +    uint8_t set1 =3D val; /* bits that should be set to 1 */
> > +    uint8_t set0 =3D ~val;/* bits that should be set to 0 */
> > +    uint8_t mcusr =3D 0;
> > +
> > +    /*
> > +     *  Bit 7 - WDIF: Watchdog Interrupt Flag
> > +     *  This bit is set when a time-out occurs in the Watchdog Timer
> and the
> > +     *  Watchdog Timer is configured for interrupt. WDIF is cleared by
> hardware
> > +     *  when executing the corresponding interrupt handling vector.
> > +     *  Alternatively, WDIF is cleared by writing a logic one to the
> flag.
> > +     *  When the I-bit in SREG and WDIE are set, the Watchdog Time-out
> Interrupt
> > +     *  is executed.
> > +     */
> > +    if (val & WDTCSR_MASK_WDIF) {
> > +        rst_bits(&set1, WDTCSR_MASK_WDIF);  /* don't set 1 */
> > +        set_bits(&set0, WDTCSR_MASK_WDIF);  /* set 0 */
> > +    } else {
> > +        rst_bits(&set1, WDTCSR_MASK_WDIF);  /* don't set 1 */
> > +        rst_bits(&set0, WDTCSR_MASK_WDIF);  /* don't set 0 */
> > +    }
> > +
> > +    /*
> > +     *  Bit 4 - WDCE: Watchdog Change Enable
> > +     *  This bit is used in timed sequences for changing WDE and
> prescaler
> > +     *  bits. To clear the WDE bit, and/or change the prescaler bits,
> > +     *  WDCE must be set.
> > +     *  Once written to one, hardware will clear WDCE after four clock
> cycles.
> > +     */
> > +    if (!(val & WDTCSR_MASK_WDCE)) {
> > +        uint8_t bits =3D WDTCSR_MASK_WDE | WDTCSR_MASK_WDP0 |
> WDTCSR_MASK_WDP1 |
> > +                       WDTCSR_MASK_WDP2 | WDTCSR_MASK_WDP3;
> > +        rst_bits(&set1, bits);
> > +        rst_bits(&set0, bits);
> > +    }
> > +
> > +    /*
> > +     *  Bit 3 - WDE: Watchdog System Reset Enable
> > +     *  WDE is overridden by WDRF in MCUSR. This means that WDE is
> always set
> > +     *  when WDRF is set. To clear WDE, WDRF must be cleared first. Th=
is
> > +     *  feature ensures multiple resets during conditions causing
> failure, and
> > +     *  a safe start-up after the failure.
> > +     */
> > +    cpu_physical_memory_read(MCUSR_ADDR, &mcusr, sizeof(mcusr));
> > +    if (mcusr & MCUSR_MASK_WDRF) {
> > +        set_bits(&set1, WDTCSR_MASK_WDE);
> > +        rst_bits(&set0, WDTCSR_MASK_WDE);
> > +    }
> > +
> > +    /*  update CSR value */
> > +    assert((set0 & set1) =3D=3D 0);
> > +
> > +    val =3D wdt->csr;
> > +    set_bits(&val, set1);
> > +    rst_bits(&val, set0);
> > +    wdt->csr =3D val;
> > +    trace_avr_wdt_write(offset, val);
> > +    avr_wdt_reset_alarm(wdt);
> > +
> > +    /*
> > +     *  Bit 6 - WDIE: Watchdog Interrupt Enable
> > +     *  When this bit is written to one and the I-bit in the Status
> Register is
> > +     *  set, the Watchdog Interrupt is enabled. If WDE is cleared in
> > +     *  combination with this setting, the Watchdog Timer is in
> Interrupt Mode,
> > +     *  and the corresponding interrupt is executed if time-out in the
> Watchdog
> > +     *  Timer occurs.
> > +     *  If WDE is set, the Watchdog Timer is in Interrupt and System
> Reset Mode.
> > +     *  The first time-out in the Watchdog Timer will set WDIF.
> Executing the
> > +     *  corresponding interrupt vector will clear WDIE and WDIF
> automatically by
> > +     *  hardware (the Watchdog goes to System Reset Mode). This is
> useful for
> > +     *  keeping the Watchdog Timer security while using the interrupt.
> To stay
> > +     *  in Interrupt and System Reset Mode, WDIE must be set after eac=
h
> > +     *  interrupt. This should however not be done within the interrup=
t
> service
> > +     *  routine itself, as this might compromise the safety-function o=
f
> the
> > +     *  Watchdog System Reset mode. If the interrupt is not executed
> before the
> > +     *  next time-out, a System Reset will be applied.
> > +     */
> > +    if ((val & WDTCSR_MASK_WDIE) && (wdt->csr & WDTCSR_MASK_WDIF)) {
> > +        avr_wdt_interrupt(opaque);
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps avr_wdt_ops =3D {
> > +    .read =3D avr_wdt_read,
> > +    .write =3D avr_wdt_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +    .impl =3D {.max_access_size =3D 1}
> > +};
> > +
> > +static void avr_wdt_wdr(void *opaque, int irq, int level)
> > +{
> > +    AVRWatchdogState *wdt =3D AVR_WDT(opaque);
> > +
> > +    avr_wdt_reset_alarm(wdt);
> > +}
> > +
> > +static void avr_wdt_init(Object *obj)
> > +{
> > +    AVRWatchdogState *s =3D AVR_WDT(obj);
> > +
> > +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
> > +
> > +    memory_region_init_io(&s->iomem, obj, &avr_wdt_ops,
> > +                          s, "avr-wdt", 0xa);
> > +
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> > +    qdev_init_gpio_in_named(DEVICE(s), avr_wdt_wdr, "wdr", 1);
> > +}
> > +
> > +static void avr_wdt_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AVRWatchdogState *s =3D AVR_WDT(dev);
> > +
> > +    s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, avr_wdt_interrupt, s=
);
> > +}
> > +
> > +static void avr_wdt_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->reset =3D avr_wdt_reset;
> > +    dc->realize =3D avr_wdt_realize;
> > +}
> > +
> > +static const TypeInfo avr_wdt_info =3D {
> > +    .name          =3D TYPE_AVR_WDT,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AVRWatchdogState),
> > +    .instance_init =3D avr_wdt_init,
> > +    .class_init    =3D avr_wdt_class_init,
> > +};
> > +
> > +static void avr_wdt_register_types(void)
> > +{
> > +    type_register_static(&avr_wdt_info);
> > +}
> > +
> > +type_init(avr_wdt_register_types)
> > diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> > index 054c403dea..8db2be8317 100644
> > --- a/hw/watchdog/meson.build
> > +++ b/hw/watchdog/meson.build
> > @@ -6,3 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true:
> files('wdt_diag288.c'))
> >   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
> files('wdt_aspeed.c'))
> >   softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
> >   softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c')=
)
> > +
> > +specific_ss.add(when: 'CONFIG_AVR_WDT', if_true: files('avr_wdt.c'))
> > diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> > index 3124ca1f1b..ac14773179 100644
> > --- a/hw/watchdog/trace-events
> > +++ b/hw/watchdog/trace-events
> > @@ -5,3 +5,8 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data,
> unsigned size) "CMSDK AP
> >   cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned
> size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 "
> size %u"
> >   cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
> >   cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %"
> PRIu32
> > +
> > +# avr_wdt.c
> > +avr_wdt_read(uint8_t addr, uint8_t value) "wdt read addr:%u value:%u"
> > +avr_wdt_write(uint8_t addr, uint8_t value) "wdt write addr:%u value:%u=
"
> > +avr_wdt_interrupt(void) ""
> > diff --git a/include/hw/watchdog/avr_wdt.h
> b/include/hw/watchdog/avr_wdt.h
> > new file mode 100644
> > index 0000000000..8433663013
> > --- /dev/null
> > +++ b/include/hw/watchdog/avr_wdt.h
> > @@ -0,0 +1,47 @@
> > +/*
> > + * AVR watchdog
> > + *
> > + * Copyright (c) 2021 Michael Rolnik
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see
> > + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> > + */
> > +
> > +#ifndef HW_WATCHDOG_AVR_WDT_H
> > +#define HW_WATCHDOG_AVR_WDT_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qemu/timer.h"
> > +#include "hw/hw.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_AVR_WDT "avr-wdt"
> > +OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)
> > +
> > +struct AVRWatchdogState {
> > +    /* <private> */
> > +    SysBusDevice parent_obj;
> > +
> > +    /* <public> */
> > +    MemoryRegion iomem;
> > +    MemoryRegion imsk_iomem;
> > +    MemoryRegion ifr_iomem;
> > +    QEMUTimer *timer;
> > +    qemu_irq irq;
> > +
> > +    /* registers */
> > +    uint8_t csr;
> > +};
> > +
>
> You should add vmstate which includes timer and csr. It will allow
> reverse debugging available with icount enabled.
>
> > +#endif /* HW_WATCHDOG_AVR_WDT_H */
> > diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> > index 0f4596932b..d5eb785833 100644
> > --- a/target/avr/cpu.c
> > +++ b/target/avr/cpu.c
> > @@ -131,6 +131,9 @@ static void avr_cpu_initfn(Object *obj)
> >       /* Set the number of interrupts supported by the CPU. */
> >       qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int,
> >                         sizeof(cpu->env.intsrc) * 8);
> > +
> > +    /* register watchdog timer reset interrupt */
> > +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->wdr, "wdr", 1);
> >   }
> >
> >   static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
> > diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> > index d148e8c75a..f8f5641c8b 100644
> > --- a/target/avr/cpu.h
> > +++ b/target/avr/cpu.h
> > @@ -152,6 +152,7 @@ typedef struct AVRCPU {
> >
> >       CPUNegativeOffsetState neg;
> >       CPUAVRState env;
> > +    qemu_irq wdr; /* reset WDT */
> >   } AVRCPU;
> >
> >   extern const struct VMStateDescription vms_avr_cpu;
> > diff --git a/target/avr/helper.c b/target/avr/helper.c
> > index 35e1019594..dd88057e5f 100644
> > --- a/target/avr/helper.c
> > +++ b/target/avr/helper.c
> > @@ -24,6 +24,7 @@
> >   #include "exec/exec-all.h"
> >   #include "exec/address-spaces.h"
> >   #include "exec/helper-proto.h"
> > +#include "hw/irq.h"
> >
> >   bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> >   {
> > @@ -188,11 +189,9 @@ void helper_break(CPUAVRState *env)
> >
> >   void helper_wdr(CPUAVRState *env)
> >   {
> > -    CPUState *cs =3D env_cpu(env);
> > +    AVRCPU *cpu =3D env_archcpu(env);
> >
> > -    /* WD is not implemented yet, placeholder */
> > -    cs->exception_index =3D EXCP_DEBUG;
> > -    cpu_loop_exit(cs);
> > +    qemu_set_irq(cpu->wdr, 1);
> >   }
> >
> >   /*
> > diff --git a/target/avr/translate.c b/target/avr/translate.c
> > index 850c5941d9..b7b716f4a0 100644
> > --- a/target/avr/translate.c
> > +++ b/target/avr/translate.c
> > @@ -1411,6 +1411,9 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBI=
C
> *a)
> >   {
> >       TCGv temp =3D tcg_const_i32(a->reg);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_inb(temp, cpu_env, temp);
> >       tcg_gen_andi_tl(temp, temp, 1 << a->bit);
> >       ctx->skip_cond =3D TCG_COND_EQ;
>
> Translation should stop at inb-related instructions in icount mode,
> because icount is valid only at the end of the block. Reading it in the
> middle makes execution non-deterministic.
>
> > @@ -1429,6 +1432,9 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBI=
S
> *a)
> >   {
> >       TCGv temp =3D tcg_const_i32(a->reg);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_inb(temp, cpu_env, temp);
> >       tcg_gen_andi_tl(temp, temp, 1 << a->bit);
> >       ctx->skip_cond =3D TCG_COND_NE;
> > @@ -1611,6 +1617,9 @@ static TCGv gen_get_zaddr(void)
> >   static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
> >   {
> >       if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
> > +        if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +            gen_io_start();
> > +        }
> >           gen_helper_fullwr(cpu_env, data, addr);
> >       } else {
> >           tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] =3D
> data */
> > @@ -1620,6 +1629,9 @@ static void gen_data_store(DisasContext *ctx, TCG=
v
> data, TCGv addr)
> >   static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
> >   {
> >       if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
> > +        if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +            gen_io_start();
> > +        }
> >           gen_helper_fullrd(data, cpu_env, addr);
> >       } else {
> >           tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data =3D
> mem[addr] */
> > @@ -2325,6 +2337,9 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a=
)
> >       TCGv Rd =3D cpu_r[a->rd];
> >       TCGv port =3D tcg_const_i32(a->imm);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_inb(Rd, cpu_env, port);
> >
> >       tcg_temp_free_i32(port);
> > @@ -2341,6 +2356,9 @@ static bool trans_OUT(DisasContext *ctx, arg_OUT
> *a)
> >       TCGv Rd =3D cpu_r[a->rd];
> >       TCGv port =3D tcg_const_i32(a->imm);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_outb(cpu_env, port, Rd);
> >
> >       tcg_temp_free_i32(port);
> > @@ -2641,6 +2659,9 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI
> *a)
> >       TCGv data =3D tcg_temp_new_i32();
> >       TCGv port =3D tcg_const_i32(a->reg);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_inb(data, cpu_env, port);
> >       tcg_gen_ori_tl(data, data, 1 << a->bit);
> >       gen_helper_outb(cpu_env, port, data);
> > @@ -2660,6 +2681,9 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI
> *a)
> >       TCGv data =3D tcg_temp_new_i32();
> >       TCGv port =3D tcg_const_i32(a->reg);
> >
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_inb(data, cpu_env, port);
> >       tcg_gen_andi_tl(data, data, ~(1 << a->bit));
> >       gen_helper_outb(cpu_env, port, data);
> > @@ -2830,6 +2854,9 @@ static bool trans_SLEEP(DisasContext *ctx,
> arg_SLEEP *a)
> >    */
> >   static bool trans_WDR(DisasContext *ctx, arg_WDR *a)
> >   {
> > +    if (tb_cflags(ctx->tb) & CF_USE_ICOUNT) {
> > +        gen_io_start();
> > +    }
> >       gen_helper_wdr(cpu_env);
> >
> >       return true;
> > @@ -2919,6 +2946,9 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
> >            * This flag is set by ST/LD instruction we will regenerate i=
t
> ONLY
> >            * with mem/cpu memory access instead of mem access
> >            */
> > +        if (tb_cflags(tb) & CF_USE_ICOUNT) {
> > +            gen_io_start();
> > +        }
> >           max_insns =3D 1;
> >       }
> >       if (ctx.singlestep) {
> > @@ -2955,6 +2985,10 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
> >               goto done_generating;
> >           }
> >
> > +        if (num_insns =3D=3D max_insns && (tb_cflags(tb) & CF_LAST_IO)=
) {
> > +            gen_io_start();
> > +        }
> > +
> >           /* Conditionally skip the next instruction, if indicated.  */
> >           if (ctx.skip_cond !=3D TCG_COND_NEVER) {
> >               skip_label =3D gen_new_label();
> > @@ -2998,10 +3032,6 @@ void gen_intermediate_code(CPUState *cs,
> TranslationBlock *tb, int max_insns)
> >                && (ctx.npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
> >                && !tcg_op_buf_full());
> >
> > -    if (tb->cflags & CF_LAST_IO) {
> > -        gen_io_end();
> > -    }
> > -
> >       bool nonconst_skip =3D canonicalize_skip(&ctx);
> >
> >       switch (ctx.bstate) {
> >
>
>

--0000000000001226dd05c2451654
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks.<br><br><div data-smartmail=3D"gmail_signature=
">Sent from my cell phone, please ignore typos </div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021=
, 3:27 PM Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">=
pavel.dovgalyuk@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On 06.05.2021 00:18, Michael Rolnik wrote:<br>
&gt; Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">mrolnik@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 +-<br>
&gt;=C2=A0 =C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/avr_wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
74 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/watchdog/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +<br>
&gt;=C2=A0 =C2=A0include/hw/watchdog/avr_wdt.h |=C2=A0 47 ++++++<br>
&gt;=C2=A0 =C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0target/avr/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
38 ++++-<br>
&gt;=C2=A0 =C2=A013 files changed, 391 insertions(+), 9 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/watchdog/avr_wdt.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/watchdog/avr_wdt.h<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 4c05ff8bba..e1fce736d2 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -1052,6 +1052,8 @@ F: include/hw/timer/avr_timer16.h<br>
&gt;=C2=A0 =C2=A0F: hw/timer/avr_timer16.c<br>
&gt;=C2=A0 =C2=A0F: include/hw/misc/avr_power.h<br>
&gt;=C2=A0 =C2=A0F: hw/misc/avr_power.c<br>
&gt; +F: include/hw/watchdog/avr_wdt.h<br>
&gt; +F: hw/watchdog/avr_wdt.c<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0Arduino<br>
&gt;=C2=A0 =C2=A0M: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br=
>
&gt; diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig<br>
&gt; index d31298c3cc..9939e4902f 100644<br>
&gt; --- a/hw/avr/Kconfig<br>
&gt; +++ b/hw/avr/Kconfig<br>
&gt; @@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select AVR_TIMER16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select AVR_USART<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select AVR_POWER<br>
&gt; +=C2=A0 =C2=A0 select AVR_WDT<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0config ARDUINO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select AVR_ATMEGA_MCU<br>
&gt; diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c<br>
&gt; index 44c6afebbb..31ceb1c21c 100644<br>
&gt; --- a/hw/avr/atmega.c<br>
&gt; +++ b/hw/avr/atmega.c<br>
&gt; @@ -28,6 +28,7 @@ enum AtmegaPeripheral {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOG, GPIOH, GPIOI, GPIOJ, GPIOK, GPIOL,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0USART0, USART1, USART2, USART3,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER0, TIMER1, TIMER2, TIMER3, TIMER4, TIME=
R5,<br>
&gt; +=C2=A0 =C2=A0 WDT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PERIFMAX<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -75,6 +76,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOD]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x29 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x26 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOB]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x23 },<br>
&gt; +=C2=A0 =C2=A0 [WDT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=
=A0 0x60 },<br>
&gt;=C2=A0 =C2=A0}, dev1280_2560[PERIFMAX] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[USART3]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { 0x=
130, POWER1, 2 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER5]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D { 0x=
120, POWER1, 5, 0x73, 0x3a, true },<br>
&gt; @@ -99,6 +101,7 @@ static const peripheral_cfg dev168_328[PERIFMAX] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOC]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x26 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOB]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x23 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[GPIOA]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 {=C2=A0 0x20 },<br>
&gt; +=C2=A0 =C2=A0 [WDT]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {=C2=
=A0 0x60 },<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0enum AtmegaIrq {<br>
&gt; @@ -118,6 +121,7 @@ enum AtmegaIrq {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER4_COMPC_IRQ, TIMER4_OVF_I=
RQ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER5_CAPT_IRQ, TIMER5_COMPA_IRQ, TIMER5_CO=
MPB_IRQ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMER5_COMPC_IRQ, TIMER5_OVF_I=
RQ,<br>
&gt; +=C2=A0 =C2=A0 WATCHDOG_TIMER_IRQ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0IRQ_COUNT<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -133,6 +137,7 @@ enum AtmegaIrq {<br>
&gt;=C2=A0 =C2=A0#define TIMER_OVF_IRQ(n)=C2=A0 =C2=A0 (n * TIMER_IRQ_COUNT=
 + TIMER0_OVF_IRQ)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const uint8_t irq168_328[IRQ_COUNT] =3D {<br>
&gt; +=C2=A0 =C2=A0 [WATCHDOG_TIMER_IRQ]=C2=A0 =C2=A0 =3D 7,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 8=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 9=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 10,<br>
&gt; @@ -147,6 +152,7 @@ static const uint8_t irq168_328[IRQ_COUNT] =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[USART0_DRE_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 20,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[USART0_TXC_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 21,<br>
&gt;=C2=A0 =C2=A0}, irq1280_2560[IRQ_COUNT] =3D {<br>
&gt; +=C2=A0 =C2=A0 [WATCHDOG_TIMER_IRQ]=C2=A0 =C2=A0 =3D 13,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_COMPA_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 1=
4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_COMPB_IRQ]=C2=A0 =C2=A0 =C2=A0 =3D 1=
5,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[TIMER2_OVF_IRQ]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 16,<br>
&gt; @@ -344,10 +350,17 @@ static void atmega_realize(DeviceState *dev, Err=
or **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(devname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Watchdog Timer */<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(OBJECT(dev), &quot;wdt&quot;, &=
amp;s-&gt;wdt, TYPE_AVR_WDT);<br>
&gt; +=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;wdt), &amp;err=
or_abort);<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;wdt), 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 OFFSET_DATA + mc-&gt;dev[WDT].addr);<br>
&gt; +=C2=A0 =C2=A0 qdev_connect_gpio_out_named(cpudev, &quot;wdr&quot;, 0,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 qdev_get_gpio_in_named(DEVICE(&amp;s-&gt;wdt), &quot;wdr&quot;, 0));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;avr-twi&qu=
ot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x0b8, 6);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;avr-adc&qu=
ot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x078, 8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;avr-ext-me=
m-ctrl&quot;, OFFSET_DATA + 0x074, 2);<br>
&gt; -=C2=A0 =C2=A0 create_unimplemented_device(&quot;avr-watchdog&quot;,=
=C2=A0 =C2=A0 =C2=A0OFFSET_DATA + 0x060, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;avr-spi&qu=
ot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET_DATA + 0x04c, 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;avr-eeprom=
&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0OFFSET_DATA + 0x03f, 3);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h<br>
&gt; index a99ee15c7e..60bbd44bdd 100644<br>
&gt; --- a/hw/avr/atmega.h<br>
&gt; +++ b/hw/avr/atmega.h<br>
&gt; @@ -13,6 +13,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/char/avr_usart.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/timer/avr_timer16.h&quot;<br>
&gt; +#include &quot;hw/watchdog/avr_wdt.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/misc/avr_power.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;target/avr/cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qom/object.h&quot;<br>
&gt; @@ -45,6 +46,7 @@ struct AtmegaMcuState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AVRMaskState pwr[POWER_MAX];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AVRUsartState usart[USART_MAX];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AVRTimer16State timer[TIMER_MAX];<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState wdt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t xtal_freq_hz;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig<br>
&gt; index 66e1d029e3..e0f89d2fe0 100644<br>
&gt; --- a/hw/watchdog/Kconfig<br>
&gt; +++ b/hw/watchdog/Kconfig<br>
&gt; @@ -20,3 +20,6 @@ config WDT_IMX2<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0config WDT_SBSA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt; +<br>
&gt; +config AVR_WDT<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; diff --git a/hw/watchdog/avr_wdt.c b/hw/watchdog/avr_wdt.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cbd6457c8b<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/watchdog/avr_wdt.c<br>
&gt; @@ -0,0 +1,274 @@<br>
&gt; +/*<br>
&gt; + * AVR watchdog<br>
&gt; + *<br>
&gt; + * Copyright (c) 2021 Michael Rolnik<br>
&gt; + *<br>
&gt; + * This library is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU Lesser General Public<br>
&gt; + * License as published by the Free Software Foundation; either<br>
&gt; + * version 2.1 of the License, or (at your option) any later version.=
<br>
&gt; + *<br>
&gt; + * This library is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
 GNU<br>
&gt; + * Lesser General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU Lesser General Public<b=
r>
&gt; + * License along with this library; if not, see<br>
&gt; + * &lt;<a href=3D"http://www.gnu.org/licenses/lgpl-2.1.html" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">http://www.gnu.org/licenses/lgpl-2.=
1.html</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;hw/watchdog/avr_wdt.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +#include &quot;target/avr/cpu.h&quot;<br>
&gt; +#include &quot;sysemu/runstate.h&quot;<br>
&gt; +<br>
&gt; +/* Field masks */<br>
&gt; +#define WDTCSR_MASK_WDP0=C2=A0 =C2=A0 0x01<br>
&gt; +#define WDTCSR_MASK_WDP1=C2=A0 =C2=A0 0x02<br>
&gt; +#define WDTCSR_MASK_WDP2=C2=A0 =C2=A0 0x04<br>
&gt; +#define WDTCSR_MASK_WDE=C2=A0 =C2=A0 =C2=A00x08<br>
&gt; +#define WDTCSR_MASK_WDCE=C2=A0 =C2=A0 0x10<br>
&gt; +#define WDTCSR_MASK_WDP3=C2=A0 =C2=A0 0x20<br>
&gt; +#define WDTCSR_MASK_WDIE=C2=A0 =C2=A0 0x40<br>
&gt; +#define WDTCSR_MASK_WDIF=C2=A0 =C2=A0 0x80<br>
&gt; +<br>
&gt; +#define WDTCSR_SHFT_WDP0=C2=A0 =C2=A0 0x00<br>
&gt; +#define WDTCSR_SHFT_WDP1=C2=A0 =C2=A0 0x01<br>
&gt; +#define WDTCSR_SHFT_WDP2=C2=A0 =C2=A0 0x02<br>
&gt; +#define WDTCSR_SHFT_WDE=C2=A0 =C2=A0 =C2=A00x03<br>
&gt; +#define WDTCSR_SHFT_WDCE=C2=A0 =C2=A0 0x04<br>
&gt; +#define WDTCSR_SHFT_WDP3=C2=A0 =C2=A0 0x05<br>
&gt; +#define WDTCSR_SHFT_WDIE=C2=A0 =C2=A0 0x06<br>
&gt; +#define WDTCSR_SHFT_WDIF=C2=A0 =C2=A0 0x07<br>
&gt; +<br>
&gt; +#define MCUSR_MASK_WDRF=C2=A0 =C2=A0 =C2=A00x04<br>
&gt; +#define MCUSR_ADDR=C2=A0 =C2=A0 =C2=A0 (OFFSET_DATA + 0x55)<br>
&gt; +<br>
&gt; +/* Helper macros */<br>
&gt; +#define WDP0(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0((csr &amp; WDTCSR_MASK_W=
DP0) &gt;&gt; WDTCSR_SHFT_WDP0)<br>
&gt; +#define WDP1(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0((csr &amp; WDTCSR_MASK_W=
DP1) &gt;&gt; WDTCSR_SHFT_WDP1)<br>
&gt; +#define WDP2(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0((csr &amp; WDTCSR_MASK_W=
DP2) &gt;&gt; WDTCSR_SHFT_WDP2)<br>
&gt; +#define WDP3(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0((csr &amp; WDTCSR_MASK_W=
DP3) &gt;&gt; WDTCSR_SHFT_WDP3)<br>
&gt; +#define WDP(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((WDP3(csr) &lt;&lt; 3) |=
 (WDP2(csr) &lt;&lt; 2) | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(WDP1(csr) &lt;&lt; 1) | (WDP0(csr) &lt;&lt; 0))<br>
&gt; +#define WDIE(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0((csr &amp; WDTCSR_MASK_W=
DIE) &gt;&gt; WDTCSR_SHFT_WDIE)<br>
&gt; +#define WDE(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((csr &amp; WDTCSR_MASK_W=
DE) &gt;&gt; WDTCSR_SHFT_WDE)<br>
&gt; +#define WCE(csr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((csr &amp; WDTCSR_MASK_W=
CE) &gt;&gt; WDTCSR_SHFT_WCE)<br>
&gt; +<br>
&gt; +#define DB_PRINT(fmt, args...) /* Nothing */<br>
&gt; +<br>
&gt; +#define MS2NS(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((n) * 1000000ull)<br>
<br>
I think there is SCALE_MS define for that.<br>
<br>
&gt; +<br>
&gt; +static void set_bits(uint8_t *addr, uint8_t bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *addr |=3D bits;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void rst_bits(uint8_t *addr, uint8_t bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 *addr &amp;=3D ~bits;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t csr =3D wdt-&gt;csr;<br>
&gt; +=C2=A0 =C2=A0 int wdp =3D WDP(csr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (WDIE(csr) =3D=3D 0 &amp;&amp; WDE(csr) =3D=3D 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* watchdog is stopped */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 timer_mod_ns(wdt-&gt;timer, qemu_clock_get_ns(QEMU_CLOC=
K_VIRTUAL) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (MS2NS(15) &lt;&lt; wdp));<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_interrupt(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *wdt =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 int8_t csr =3D wdt-&gt;csr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (WDIE(csr) =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt Mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bits(&amp;wdt-&gt;csr, WDTCSR_MASK_WD=
IF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(wdt-&gt;irq, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_avr_wdt_interrupt();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;wdt-&gt;csr, WDTCSR_MASK_WD=
IF | WDTCSR_MASK_WDIE);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (WDE(csr) =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* System Reset Mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_=
GUEST_RESET);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avr_wdt_reset_alarm(wdt);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *wdt =3D AVR_WDT(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 wdt-&gt;csr =3D 0;<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(wdt-&gt;irq, 0);<br>
&gt; +=C2=A0 =C2=A0 avr_wdt_reset_alarm(wdt);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t avr_wdt_read(void *opaque, hwaddr offset, unsigned si=
ze)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *wdt =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint8_t retval =3D wdt-&gt;csr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_avr_wdt_read(offset, retval);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return (uint64_t)retval;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_write(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 assert(size =3D=3D 1);<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *wdt =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint8_t val =3D (uint8_t)val64;<br>
&gt; +=C2=A0 =C2=A0 uint8_t set1 =3D val; /* bits that should be set to 1 *=
/<br>
&gt; +=C2=A0 =C2=A0 uint8_t set0 =3D ~val;/* bits that should be set to 0 *=
/<br>
&gt; +=C2=A0 =C2=A0 uint8_t mcusr =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Bit 7 - WDIF: Watchdog Interrupt Flag<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 This bit is set when a time-out occurs in=
 the Watchdog Timer and the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Watchdog Timer is configured for interrup=
t. WDIF is cleared by hardware<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 when executing the corresponding interrup=
t handling vector.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Alternatively, WDIF is cleared by writing=
 a logic one to the flag.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 When the I-bit in SREG and WDIE are set, =
the Watchdog Time-out Interrupt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 is executed.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (val &amp; WDTCSR_MASK_WDIF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set1, WDTCSR_MASK_WDIF);=C2=
=A0 /* don&#39;t set 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bits(&amp;set0, WDTCSR_MASK_WDIF);=C2=
=A0 /* set 0 */<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set1, WDTCSR_MASK_WDIF);=C2=
=A0 /* don&#39;t set 1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set0, WDTCSR_MASK_WDIF);=C2=
=A0 /* don&#39;t set 0 */<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Bit 4 - WDCE: Watchdog Change Enable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 This bit is used in timed sequences for c=
hanging WDE and prescaler<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 bits. To clear the WDE bit, and/or change=
 the prescaler bits,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 WDCE must be set.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Once written to one, hardware will clear =
WDCE after four clock cycles.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!(val &amp; WDTCSR_MASK_WDCE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t bits =3D WDTCSR_MASK_WDE | WDTCSR=
_MASK_WDP0 | WDTCSR_MASK_WDP1 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0WDTCSR_MASK_WDP2 | WDTCSR_MASK_WDP3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set1, bits);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set0, bits);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Bit 3 - WDE: Watchdog System Reset Enable=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 WDE is overridden by WDRF in MCUSR. This =
means that WDE is always set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 when WDRF is set. To clear WDE, WDRF must=
 be cleared first. This<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 feature ensures multiple resets during co=
nditions causing failure, and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 a safe start-up after the failure.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 cpu_physical_memory_read(MCUSR_ADDR, &amp;mcusr, sizeof=
(mcusr));<br>
&gt; +=C2=A0 =C2=A0 if (mcusr &amp; MCUSR_MASK_WDRF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bits(&amp;set1, WDTCSR_MASK_WDE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rst_bits(&amp;set0, WDTCSR_MASK_WDE);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*=C2=A0 update CSR value */<br>
&gt; +=C2=A0 =C2=A0 assert((set0 &amp; set1) =3D=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 val =3D wdt-&gt;csr;<br>
&gt; +=C2=A0 =C2=A0 set_bits(&amp;val, set1);<br>
&gt; +=C2=A0 =C2=A0 rst_bits(&amp;val, set0);<br>
&gt; +=C2=A0 =C2=A0 wdt-&gt;csr =3D val;<br>
&gt; +=C2=A0 =C2=A0 trace_avr_wdt_write(offset, val);<br>
&gt; +=C2=A0 =C2=A0 avr_wdt_reset_alarm(wdt);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Bit 6 - WDIE: Watchdog Interrupt Enable<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 When this bit is written to one and the I=
-bit in the Status Register is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 set, the Watchdog Interrupt is enabled. I=
f WDE is cleared in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 combination with this setting, the Watchd=
og Timer is in Interrupt Mode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 and the corresponding interrupt is execut=
ed if time-out in the Watchdog<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Timer occurs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 If WDE is set, the Watchdog Timer is in I=
nterrupt and System Reset Mode.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 The first time-out in the Watchdog Timer =
will set WDIF. Executing the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 corresponding interrupt vector will clear=
 WDIE and WDIF automatically by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 hardware (the Watchdog goes to System Res=
et Mode). This is useful for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 keeping the Watchdog Timer security while=
 using the interrupt. To stay<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 in Interrupt and System Reset Mode, WDIE =
must be set after each<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 interrupt. This should however not be don=
e within the interrupt service<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 routine itself, as this might compromise =
the safety-function of the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 Watchdog System Reset mode. If the interr=
upt is not executed before the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*=C2=A0 next time-out, a System Reset will be app=
lied.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((val &amp; WDTCSR_MASK_WDIE) &amp;&amp; (wdt-&gt;cs=
r &amp; WDTCSR_MASK_WDIF)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 avr_wdt_interrupt(opaque);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps avr_wdt_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D avr_wdt_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D avr_wdt_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .impl =3D {.max_access_size =3D 1}<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void avr_wdt_wdr(void *opaque, int irq, int level)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *wdt =3D AVR_WDT(opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 avr_wdt_reset_alarm(wdt);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *s =3D AVR_WDT(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_DEVICE(obj), &amp;s-&gt;irq);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;avr_w=
dt_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 s, &quot;avr-wdt&quot;, 0xa);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;iomem)=
;<br>
&gt; +=C2=A0 =C2=A0 qdev_init_gpio_in_named(DEVICE(s), avr_wdt_wdr, &quot;w=
dr&quot;, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AVRWatchdogState *s =3D AVR_WDT(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, avr_wd=
t_interrupt, s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void avr_wdt_class_init(ObjectClass *klass, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;reset =3D avr_wdt_reset;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D avr_wdt_realize;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo avr_wdt_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AVR_WD=
T,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(AVRWatchdogState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D avr_wdt_init,<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D avr_wdt_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void avr_wdt_register_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;avr_wdt_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(avr_wdt_register_types)<br>
&gt; diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build<br>
&gt; index 054c403dea..8db2be8317 100644<br>
&gt; --- a/hw/watchdog/meson.build<br>
&gt; +++ b/hw/watchdog/meson.build<br>
&gt; @@ -6,3 +6,5 @@ softmmu_ss.add(when: &#39;CONFIG_WDT_DIAG288&#39;, if_=
true: files(&#39;wdt_diag288.c&#39;))<br>
&gt;=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true:=
 files(&#39;wdt_aspeed.c&#39;))<br>
&gt;=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_WDT_IMX2&#39;, if_true: f=
iles(&#39;wdt_imx2.c&#39;))<br>
&gt;=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_WDT_SBSA&#39;, if_true: f=
iles(&#39;sbsa_gwdt.c&#39;))<br>
&gt; +<br>
&gt; +specific_ss.add(when: &#39;CONFIG_AVR_WDT&#39;, if_true: files(&#39;a=
vr_wdt.c&#39;))<br>
&gt; diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events<br>
&gt; index 3124ca1f1b..ac14773179 100644<br>
&gt; --- a/hw/watchdog/trace-events<br>
&gt; +++ b/hw/watchdog/trace-events<br>
&gt; @@ -5,3 +5,8 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data=
, unsigned size) &quot;CMSDK AP<br>
&gt;=C2=A0 =C2=A0cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, u=
nsigned size) &quot;CMSDK APB watchdog write: offset 0x%&quot; PRIx64 &quot=
; data 0x%&quot; PRIx64 &quot; size %u&quot;<br>
&gt;=C2=A0 =C2=A0cmsdk_apb_watchdog_reset(void) &quot;CMSDK APB watchdog: r=
eset&quot;<br>
&gt;=C2=A0 =C2=A0cmsdk_apb_watchdog_lock(uint32_t lock) &quot;CMSDK APB wat=
chdog: lock %&quot; PRIu32<br>
&gt; +<br>
&gt; +# avr_wdt.c<br>
&gt; +avr_wdt_read(uint8_t addr, uint8_t value) &quot;wdt read addr:%u valu=
e:%u&quot;<br>
&gt; +avr_wdt_write(uint8_t addr, uint8_t value) &quot;wdt write addr:%u va=
lue:%u&quot;<br>
&gt; +avr_wdt_interrupt(void) &quot;&quot;<br>
&gt; diff --git a/include/hw/watchdog/avr_wdt.h b/include/hw/watchdog/avr_w=
dt.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8433663013<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/watchdog/avr_wdt.h<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +/*<br>
&gt; + * AVR watchdog<br>
&gt; + *<br>
&gt; + * Copyright (c) 2021 Michael Rolnik<br>
&gt; + *<br>
&gt; + * This library is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU Lesser General Public<br>
&gt; + * License as published by the Free Software Foundation; either<br>
&gt; + * version 2.1 of the License, or (at your option) any later version.=
<br>
&gt; + *<br>
&gt; + * This library is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
 GNU<br>
&gt; + * Lesser General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU Lesser General Public<b=
r>
&gt; + * License along with this library; if not, see<br>
&gt; + * &lt;<a href=3D"http://www.gnu.org/licenses/lgpl-2.1.html" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">http://www.gnu.org/licenses/lgpl-2.=
1.html</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_WATCHDOG_AVR_WDT_H<br>
&gt; +#define HW_WATCHDOG_AVR_WDT_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;hw/hw.h&quot;<br>
&gt; +#include &quot;qom/object.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_AVR_WDT &quot;avr-wdt&quot;<br>
&gt; +OBJECT_DECLARE_SIMPLE_TYPE(AVRWatchdogState, AVR_WDT)<br>
&gt; +<br>
&gt; +struct AVRWatchdogState {<br>
&gt; +=C2=A0 =C2=A0 /* &lt;private&gt; */<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* &lt;public&gt; */<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion iomem;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion imsk_iomem;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion ifr_iomem;<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *timer;<br>
&gt; +=C2=A0 =C2=A0 qemu_irq irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* registers */<br>
&gt; +=C2=A0 =C2=A0 uint8_t csr;<br>
&gt; +};<br>
&gt; +<br>
<br>
You should add vmstate which includes timer and csr. It will allow <br>
reverse debugging available with icount enabled.<br>
<br>
&gt; +#endif /* HW_WATCHDOG_AVR_WDT_H */<br>
&gt; diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
&gt; index 0f4596932b..d5eb785833 100644<br>
&gt; --- a/target/avr/cpu.c<br>
&gt; +++ b/target/avr/cpu.c<br>
&gt; @@ -131,6 +131,9 @@ static void avr_cpu_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the number of interrupts supported by=
 the CPU. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_i=
nt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sizeof(cpu-&gt;env.intsrc) * 8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* register watchdog timer reset interrupt */<br>
&gt; +=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(cpu), &amp;cpu-&gt;wdr,=
 &quot;wdr&quot;, 1);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static ObjectClass *avr_cpu_class_by_name(const char *cpu_=
model)<br>
&gt; diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
&gt; index d148e8c75a..f8f5641c8b 100644<br>
&gt; --- a/target/avr/cpu.h<br>
&gt; +++ b/target/avr/cpu.h<br>
&gt; @@ -152,6 +152,7 @@ typedef struct AVRCPU {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUNegativeOffsetState neg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUAVRState env;<br>
&gt; +=C2=A0 =C2=A0 qemu_irq wdr; /* reset WDT */<br>
&gt;=C2=A0 =C2=A0} AVRCPU;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0extern const struct VMStateDescription vms_avr_cpu;<br>
&gt; diff --git a/target/avr/helper.c b/target/avr/helper.c<br>
&gt; index 35e1019594..dd88057e5f 100644<br>
&gt; --- a/target/avr/helper.c<br>
&gt; +++ b/target/avr/helper.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/address-spaces.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/helper-proto.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_re=
quest)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -188,11 +189,9 @@ void helper_break(CPUAVRState *env)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void helper_wdr(CPUAVRState *env)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; +=C2=A0 =C2=A0 AVRCPU *cpu =3D env_archcpu(env);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /* WD is not implemented yet, placeholder */<br>
&gt; -=C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_DEBUG;<br>
&gt; -=C2=A0 =C2=A0 cpu_loop_exit(cs);<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(cpu-&gt;wdr, 1);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/*<br>
&gt; diff --git a/target/avr/translate.c b/target/avr/translate.c<br>
&gt; index 850c5941d9..b7b716f4a0 100644<br>
&gt; --- a/target/avr/translate.c<br>
&gt; +++ b/target/avr/translate.c<br>
&gt; @@ -1411,6 +1411,9 @@ static bool trans_SBIC(DisasContext *ctx, arg_SB=
IC *a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv temp =3D tcg_const_i32(a-&gt;reg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_inb(temp, cpu_env, temp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(temp, temp, 1 &lt;&lt; a-&gt=
;bit);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;skip_cond =3D TCG_COND_EQ;<br>
<br>
Translation should stop at inb-related instructions in icount mode, <br>
because icount is valid only at the end of the block. Reading it in the <br=
>
middle makes execution non-deterministic.<br>
<br>
&gt; @@ -1429,6 +1432,9 @@ static bool trans_SBIS(DisasContext *ctx, arg_SB=
IS *a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv temp =3D tcg_const_i32(a-&gt;reg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_inb(temp, cpu_env, temp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(temp, temp, 1 &lt;&lt; a-&gt=
;bit);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;skip_cond =3D TCG_COND_NE;<br>
&gt; @@ -1611,6 +1617,9 @@ static TCGv gen_get_zaddr(void)<br>
&gt;=C2=A0 =C2=A0static void gen_data_store(DisasContext *ctx, TCGv data, T=
CGv addr)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;tb-&gt;flags &amp; TB_FLAGS_FULL=
_ACCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_IC=
OUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_fullwr(cpu_env, dat=
a, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_st8(data, addr, M=
MU_DATA_IDX); /* mem[addr] =3D data */<br>
&gt; @@ -1620,6 +1629,9 @@ static void gen_data_store(DisasContext *ctx, TC=
Gv data, TCGv addr)<br>
&gt;=C2=A0 =C2=A0static void gen_data_load(DisasContext *ctx, TCGv data, TC=
Gv addr)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;tb-&gt;flags &amp; TB_FLAGS_FULL=
_ACCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_IC=
OUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_fullrd(data, cpu_en=
v, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_ld8u(data, addr, =
MMU_DATA_IDX); /* data =3D mem[addr] */<br>
&gt; @@ -2325,6 +2337,9 @@ static bool trans_IN(DisasContext *ctx, arg_IN *=
a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv Rd =3D cpu_r[a-&gt;rd];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv port =3D tcg_const_i32(a-&gt;imm);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_inb(Rd, cpu_env, port);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free_i32(port);<br>
&gt; @@ -2341,6 +2356,9 @@ static bool trans_OUT(DisasContext *ctx, arg_OUT=
 *a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv Rd =3D cpu_r[a-&gt;rd];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv port =3D tcg_const_i32(a-&gt;imm);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_outb(cpu_env, port, Rd);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free_i32(port);<br>
&gt; @@ -2641,6 +2659,9 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI=
 *a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv data =3D tcg_temp_new_i32();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv port =3D tcg_const_i32(a-&gt;reg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_inb(data, cpu_env, port);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_ori_tl(data, data, 1 &lt;&lt; a-&gt;=
bit);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_outb(cpu_env, port, data);<br>
&gt; @@ -2660,6 +2681,9 @@ static bool trans_CBI(DisasContext *ctx, arg_CBI=
 *a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv data =3D tcg_temp_new_i32();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0TCGv port =3D tcg_const_i32(a-&gt;reg);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_inb(data, cpu_env, port);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_andi_tl(data, data, ~(1 &lt;&lt; a-&=
gt;bit));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_outb(cpu_env, port, data);<br>
&gt; @@ -2830,6 +2854,9 @@ static bool trans_SLEEP(DisasContext *ctx, arg_S=
LEEP *a)<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0static bool trans_WDR(DisasContext *ctx, arg_WDR *a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 if (tb_cflags(ctx-&gt;tb) &amp; CF_USE_ICOUNT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gen_helper_wdr(cpu_env);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; @@ -2919,6 +2946,9 @@ void gen_intermediate_code(CPUState *cs, Transla=
tionBlock *tb, int max_insns)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * This flag is set by ST/LD i=
nstruction we will regenerate it ONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * with mem/cpu memory access =
instead of mem access<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tb_cflags(tb) &amp; CF_USE_ICOUNT) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_insns =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx.singlestep) {<br>
&gt; @@ -2955,6 +2985,10 @@ void gen_intermediate_code(CPUState *cs, Transl=
ationBlock *tb, int max_insns)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done_genera=
ting;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num_insns =3D=3D max_insns &amp;&amp;=
 (tb_cflags(tb) &amp; CF_LAST_IO)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_start();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Conditionally skip the next=
 instruction, if indicated.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx.skip_cond !=3D TCG_CON=
D_NEVER) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip_label =3D g=
en_new_label();<br>
&gt; @@ -2998,10 +3032,6 @@ void gen_intermediate_code(CPUState *cs, Transl=
ationBlock *tb, int max_insns)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (ctx=
.npc - pc_start) * 2 &lt; TARGET_PAGE_SIZE - 4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; !tcg=
_op_buf_full());<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (tb-&gt;cflags &amp; CF_LAST_IO) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_io_end();<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool nonconst_skip =3D canonicalize_skip(&am=
p;ctx);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (ctx.bstate) {<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001226dd05c2451654--

