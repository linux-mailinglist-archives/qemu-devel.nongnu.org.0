Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9F371614
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:40:10 +0200 (CEST)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYnx-0005oS-P6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldYlP-00039o-Lb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:37:31 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:40718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1ldYlH-0005CW-Ey
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:37:31 -0400
Received: by mail-qk1-x72e.google.com with SMTP id q136so4962263qka.7
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=25E3XEBH3LDSiPVdkzKUpvy/Zua5bAIr/yrhsGV3vcc=;
 b=hrcXLOLZ2J7ykkQcdpnGvcQg1rU6tWkOtatLfR/ylWgYuIN06HKb8rYrHWi/Ys0vXc
 Msl5fqafBSmIXPrfvp36TonSQE+Dg12HY+oCbu8Gv7HmMzvmJvUJugYsabeCYGUyjGeI
 JPpRfVhrBuk+L/0AACrapgO7xFfV773bxDyFMBWs1pzC8GYesvFBlApa8y9vC4Px84UE
 03wEgDHHKuHZFh1Ec0BPSifmWJdkl6AEuft5D6h4Kgg3baYka1NtRlIV0ePS5MvSkc3d
 a9oj/X5GioiF2GYI2oHNBfBo0pORXcd93gxrRBOMty5dddi4DsR4SC0shal5R7RzCgeb
 zRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=25E3XEBH3LDSiPVdkzKUpvy/Zua5bAIr/yrhsGV3vcc=;
 b=lxeps+k/u9OWR4jXCezpRDlavyjxVlVLHtwJzp1BUVzJtET1N4z/1ukuyArigLcBde
 Awzty/Q1/W/AUj2x5ymMd+H4NEbNQ7Ibb8y4Y30EWTZTXSWejFy/c4OEaAcevIvdQk8J
 QM9ZCg/nK5GlOBmzOmDgGWy1fY6sYN/+xF0rcLfcUNIz/u6iVeYUFFfOKKMKhTJgaYBB
 UcyR7rtKSvxM3UPQWczBH8GoEQdgpsf0R6NF3jD5OutTKIZm+kwPhXOcoWcjsxSmq7Bo
 Bd7A9W4aoqZGaiey9ojJo2GX/Kuj4g22G8bHj1F7F/TPts7JFdy29cf/wUfpZKv1nuV1
 HLfg==
X-Gm-Message-State: AOAM531XGEQCkwqhOSFj7/YFncJTFCMLr1kpoZzRWMO7JAL5Bogfw5V9
 CNV3LjgFs0S0JTZ95gKtUdb/Bv921qGkBH5YLkY=
X-Google-Smtp-Source: ABdhPJwYPc6AjCsnafArqmzj8qsADDFBWg1syOmuEF3F0ebxx5IFhafyV8QTx/PUqcBRN/XtKOzUahhSNjmmelSAo7M=
X-Received: by 2002:a37:41c8:: with SMTP id
 o191mr19629259qka.181.1620049041399; 
 Mon, 03 May 2021 06:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210502201040.52296-1-mrolnik@gmail.com>
 <20210502201040.52296-3-mrolnik@gmail.com>
 <f5bcde37-c84b-57ae-613d-a66bed788050@adacore.com>
In-Reply-To: <f5bcde37-c84b-57ae-613d-a66bed788050@adacore.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Mon, 3 May 2021 16:36:45 +0300
Message-ID: <CAK4993jn+t+UMk_yi35KSNXOjaD_pz=TW893AtBag7gzYvJ3YA@mail.gmail.com>
Subject: Re: [RFC 1/1] Implement AVR watchdog timer
To: Fred Konrad <konrad@adacore.com>
Content-Type: multipart/alternative; boundary="000000000000a1a30105c16d0f90"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x72e.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a1a30105c16d0f90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fred.

1. thanks
2. It seems I have forgotten to set those flags.
3. 15ms is easy to test 8s will take 533 times longer, so in my case 3200
instructions which is totally incorrect. I don't understand why as
I program the timer in virtual nanoseconds and not host time.
4. I hope Richard could help with icount.

best regards,
Michael Rolnik

On Mon, May 3, 2021 at 4:15 PM Fred Konrad <konrad@adacore.com> wrote:

>
>
> Le 5/2/21 =C3=A0 10:10 PM, Michael Rolnik a =C3=A9crit :
> > Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> > ---
> >   hw/avr/Kconfig                |   1 +
> >   hw/avr/atmega.c               |  15 ++-
> >   hw/avr/atmega.h               |   2 +
> >   hw/watchdog/Kconfig           |   3 +
> >   hw/watchdog/avr_wdt.c         | 190 +++++++++++++++++++++++++++++++++=
+
> >   hw/watchdog/meson.build       |   2 +
> >   hw/watchdog/trace-events      |   5 +
> >   include/hw/watchdog/avr_wdt.h |  47 +++++++++
> >   target/avr/cpu.c              |   3 +
> >   target/avr/cpu.h              |   1 +
> >   target/avr/helper.c           |   7 +-
> >   11 files changed, 271 insertions(+), 5 deletions(-)
> >   create mode 100644 hw/watchdog/avr_wdt.c
> >   create mode 100644 include/hw/watchdog/avr_wdt.h
> >
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
> > index 0000000000..4ce1029a64
> > --- /dev/null
> > +++ b/hw/watchdog/avr_wdt.c
> > @@ -0,0 +1,190 @@
> > +/*
> > + * AVR watchdog
> > + *
> > + * Copyright (c) 2018 Michael Rolnik
>
> 2021?
>
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
> > +
> > +/* Field masks */
> > +#define WDTCSR_MASK_WDP0     0x01
> > +#define WDTCSR_MASK_WDP1     0x02
> > +#define WDTCSR_MASK_WDP2     0x04
> > +#define WDTCSR_MASK_WDE      0x08
> > +#define WDTCSR_MASK_WCE      0x10
> > +#define WDTCSR_MASK_WDP3     0x20
> > +#define WDTCSR_MASK_WDIE     0x40
> > +#define WDTCSR_MASK_WDIF     0x80
> > +
> > +#define WDTCSR_SHFT_WDP0     0x00
> > +#define WDTCSR_SHFT_WDP1     0x01
> > +#define WDTCSR_SHFT_WDP2     0x02
> > +#define WDTCSR_SHFT_WDE      0x03
> > +#define WDTCSR_SHFT_WCE      0x04
> > +#define WDTCSR_SHFT_WDP3     0x05
> > +#define WDTCSR_SHFT_WDIE     0x06
> > +#define WDTCSR_SHFT_WDIF     0x07
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
> > +
> > +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)
> > +{
> > +    uint32_t csr =3D wdt->csr;
> > +    int wdp =3D WDP(csr);
> > +    assert(wdp <=3D 9);
>
> Maybe qemu_log(..) instead and pick a default value?
>
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
> > +    if (WDE(csr) =3D=3D 0 && WDIE(csr) =3D=3D 0) {
> > +        /* Stopped */
> > +
> > +    } else if (WDE(csr) =3D=3D 0 && WDIE(csr) =3D=3D 1) {
> > +        /* Interrupt Mode */
> > +        wdt->csr |=3D WDTCSR_MASK_WDIF;
> > +        qemu_set_irq(wdt->irq, 1);
> > +        trace_avr_wdt_interrupt();
> > +    } else if (WDE(csr) =3D=3D 1 && WDIE(csr) =3D=3D 0) {
> > +        /* System Reset Mode */
>
>         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>
> +/- setting the MCUSR, WDRF flags would be nice.
>
> > +    } else if (WDE(csr) =3D=3D 1 && WDIE(csr) =3D=3D 1) {
> > +        /* Interrupt and System Reset Mode */
> > +        wdt->csr |=3D WDTCSR_MASK_WDIF;
> > +        qemu_set_irq(wdt->irq, 1);
> > +        trace_avr_wdt_interrupt();
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
> > +    uint8_t val8 =3D (uint8_t)val64;
> > +
> > +    trace_avr_wdt_write(offset, val8);
> > +
> > +    wdt->csr =3D val8;
> > +    avr_wdt_reset_alarm(wdt);
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
> > index 0000000000..2679e8f2a6
> > --- /dev/null
> > +++ b/include/hw/watchdog/avr_wdt.h
> > @@ -0,0 +1,47 @@
> > +/*
> > + * AVR 16-bit timer
>
> AVR Watchdog?
>
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
> >
>
> Thanks!
>


--=20
Best Regards,
Michael Rolnik

--000000000000a1a30105c16d0f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Fred.</div><div><br></div><div>1. thanks</div><div=
>2. It seems I have forgotten=C2=A0to set those flags.</div><div>3. 15ms is=
 easy to test 8s will take 533 times longer, so in my case 3200 instruction=
s which is totally incorrect. I don&#39;t understand why as I=C2=A0program =
the timer in virtual nanoseconds and not host time.</div><div>4. I hope Ric=
hard could help with icount.</div><div><br></div><div>best regards,</div><d=
iv>Michael Rolnik</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, May 3, 2021 at 4:15 PM Fred Konrad &lt;<a href=3D"=
mailto:konrad@adacore.com" target=3D"_blank">konrad@adacore.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Le 5/2/21 =C3=A0 10:10 PM, Michael Rolnik a =C3=A9crit=C2=A0:<br>
&gt; Signed-off-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com"=
 target=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/avr/atmega.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 15 ++-<br>
&gt;=C2=A0 =C2=A0hw/avr/atmega.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/avr_wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
90 ++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/watchdog/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/watchdog/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +<br>
&gt;=C2=A0 =C2=A0include/hw/watchdog/avr_wdt.h |=C2=A0 47 +++++++++<br>
&gt;=C2=A0 =C2=A0target/avr/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0target/avr/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A011 files changed, 271 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/watchdog/avr_wdt.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/watchdog/avr_wdt.h<br>
&gt; <br>
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
&gt; index 0000000000..4ce1029a64<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/watchdog/avr_wdt.c<br>
&gt; @@ -0,0 +1,190 @@<br>
&gt; +/*<br>
&gt; + * AVR watchdog<br>
&gt; + *<br>
&gt; + * Copyright (c) 2018 Michael Rolnik<br>
<br>
2021?<br>
<br>
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
oreferrer" target=3D"_blank">http://www.gnu.org/licenses/lgpl-2.1.html</a>&=
gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;hw/watchdog/avr_wdt.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +/* Field masks */<br>
&gt; +#define WDTCSR_MASK_WDP0=C2=A0 =C2=A0 =C2=A00x01<br>
&gt; +#define WDTCSR_MASK_WDP1=C2=A0 =C2=A0 =C2=A00x02<br>
&gt; +#define WDTCSR_MASK_WDP2=C2=A0 =C2=A0 =C2=A00x04<br>
&gt; +#define WDTCSR_MASK_WDE=C2=A0 =C2=A0 =C2=A0 0x08<br>
&gt; +#define WDTCSR_MASK_WCE=C2=A0 =C2=A0 =C2=A0 0x10<br>
&gt; +#define WDTCSR_MASK_WDP3=C2=A0 =C2=A0 =C2=A00x20<br>
&gt; +#define WDTCSR_MASK_WDIE=C2=A0 =C2=A0 =C2=A00x40<br>
&gt; +#define WDTCSR_MASK_WDIF=C2=A0 =C2=A0 =C2=A00x80<br>
&gt; +<br>
&gt; +#define WDTCSR_SHFT_WDP0=C2=A0 =C2=A0 =C2=A00x00<br>
&gt; +#define WDTCSR_SHFT_WDP1=C2=A0 =C2=A0 =C2=A00x01<br>
&gt; +#define WDTCSR_SHFT_WDP2=C2=A0 =C2=A0 =C2=A00x02<br>
&gt; +#define WDTCSR_SHFT_WDE=C2=A0 =C2=A0 =C2=A0 0x03<br>
&gt; +#define WDTCSR_SHFT_WCE=C2=A0 =C2=A0 =C2=A0 0x04<br>
&gt; +#define WDTCSR_SHFT_WDP3=C2=A0 =C2=A0 =C2=A00x05<br>
&gt; +#define WDTCSR_SHFT_WDIE=C2=A0 =C2=A0 =C2=A00x06<br>
&gt; +#define WDTCSR_SHFT_WDIF=C2=A0 =C2=A0 =C2=A00x07<br>
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
&gt; +<br>
&gt; +static void avr_wdt_reset_alarm(AVRWatchdogState *wdt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t csr =3D wdt-&gt;csr;<br>
&gt; +=C2=A0 =C2=A0 int wdp =3D WDP(csr);<br>
&gt; +=C2=A0 =C2=A0 assert(wdp &lt;=3D 9);<br>
<br>
Maybe qemu_log(..) instead and pick a default value?<br>
<br>
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
&gt; +=C2=A0 =C2=A0 if (WDE(csr) =3D=3D 0 &amp;&amp; WDIE(csr) =3D=3D 0) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Stopped */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 } else if (WDE(csr) =3D=3D 0 &amp;&amp; WDIE(csr) =3D=
=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt Mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdt-&gt;csr |=3D WDTCSR_MASK_WDIF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(wdt-&gt;irq, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_avr_wdt_interrupt();<br>
&gt; +=C2=A0 =C2=A0 } else if (WDE(csr) =3D=3D 1 &amp;&amp; WDIE(csr) =3D=
=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* System Reset Mode */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_=
RESET);<br>
<br>
+/- setting the MCUSR, WDRF flags would be nice.<br>
<br>
&gt; +=C2=A0 =C2=A0 } else if (WDE(csr) =3D=3D 1 &amp;&amp; WDIE(csr) =3D=
=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt and System Reset Mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdt-&gt;csr |=3D WDTCSR_MASK_WDIF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(wdt-&gt;irq, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_avr_wdt_interrupt();<br>
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
&gt; +=C2=A0 =C2=A0 uint8_t val8 =3D (uint8_t)val64;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_avr_wdt_write(offset, val8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 wdt-&gt;csr =3D val8;<br>
&gt; +=C2=A0 =C2=A0 avr_wdt_reset_alarm(wdt);<br>
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
&gt; index 0000000000..2679e8f2a6<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/watchdog/avr_wdt.h<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +/*<br>
&gt; + * AVR 16-bit timer<br>
<br>
AVR Watchdog?<br>
<br>
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
oreferrer" target=3D"_blank">http://www.gnu.org/licenses/lgpl-2.1.html</a>&=
gt;<br>
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
&gt; <br>
<br>
Thanks!<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>Best Regards,<br>Michael Rolnik</div></div>

--000000000000a1a30105c16d0f90--

