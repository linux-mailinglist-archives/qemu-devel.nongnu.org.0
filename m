Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B982EE80D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:59:25 +0100 (CET)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdJU-000749-KC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxdIh-0006eI-UG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:58:35 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:38237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxdIf-0003f9-2s
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:58:35 -0500
Received: by mail-lf1-x12f.google.com with SMTP id h205so18221713lfd.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37c5XAQSC88OgOjcdUwpTG+36XDyQ4R5H1dW5QhNB48=;
 b=Y0CLpEj9XcoCswJniC5Z4gzd7D+U6y9ujI306XitjYGcE81z62S5BZrgOsKbqC0nyC
 nn/4O+SXrB0eoRzZL0c2h7NOQ0qDg36Sm8Hb0QusS10P0vq4jhaQTyUTrOP7tD9IeyVl
 lTaSUVWpwqXIAm23FHjqq4cryqUUYNHEZPC75AdvTpqEx/qFn1BZpSS/TMKpZZvRJxZ3
 XHJspOsp/S3Ez4lOZOgGakMHY+KH3m482Z2hTCTMaEIjNR75l4xsQmSdA/PIQtPZ+WGP
 2sA/Z2ch2Ys6Y5G1mxR6ssUspo3mQJSnS3MoBll8DhDxArGF5e5JdmkcILiz9rDJ27Ps
 JyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37c5XAQSC88OgOjcdUwpTG+36XDyQ4R5H1dW5QhNB48=;
 b=NZD8gU2waRe619ynwAdoOlIaPMjAW/u4s4PzxP4XpbSnu2aXZwrgPibQsu3y+nYNIP
 G2MOZUHNYVCZMyI20AeS8vMuCsDTaqBpA9pygigZ9pJ3pinHdEnFJ6HTLXPOMYQGfEk+
 etKfGk+BC3kIPzXmHAGYVL9sLvbJKx/Xnp9dxwZS+emNwQ7Ltoe8xi7d8L3mEupzt8pK
 4bGXwql9BE4YRW99IOJFiM9HGBCMMbePSFFmIHRUmyJ46ACtTV2Kbj2gItC4vCINIPPA
 Zy2qIbvoIsnsQChDqJBjn38ztz2Uf6nBWVuKZckCq6sLciYSfgbAo/TafIXXCRjHu+Ba
 jv/Q==
X-Gm-Message-State: AOAM532autmB/3kRdX7d3PpDyD8SPWnP6xo025Q5Gm8U8hRmMRVQ787X
 5ro6uLv4c/BlRpCxEwviaNwi8WqG8gVdyG5zPCmDyw==
X-Google-Smtp-Source: ABdhPJz20toQcKAogiPIB3ml13uzX61prPqfHGrn/ernLj8rgFWI0hybSPASYDdRaZ06w0TaqDfGNiHSfsRq3jcrmIA=
X-Received: by 2002:a19:cbc3:: with SMTP id b186mr305306lfg.554.1610056711035; 
 Thu, 07 Jan 2021 13:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-4-wuhaotsh@google.com>
 <CAFEAcA_RGz3N2RtxiNBwfuM6Xx34DqjkvyB=JncjyfOk_mBzSg@mail.gmail.com>
In-Reply-To: <CAFEAcA_RGz3N2RtxiNBwfuM6Xx34DqjkvyB=JncjyfOk_mBzSg@mail.gmail.com>
Date: Thu, 7 Jan 2021 13:58:18 -0800
Message-ID: <CAGcCb10AdBerAyfVL13zz9L57b-J4nU_6rwWnYj-xc2eJ4JSBQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] hw/adc: Add an ADC module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000054c10005b8568a9c"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--00000000000054c10005b8568a9c
Content-Type: text/plain; charset="UTF-8"

Thanks for your review. We'll apply your suggestions.

On Thu, Jan 7, 2021 at 1:07 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > The ADC is part of NPCM7XX Module. Its behavior is controled by the
> > ADC_CON register. It converts one of the eight analog inputs into a
> > digital input and stores it in the ADC_DATA register when enabled.
> >
> > Users can alter input value by using qom-set QMP command.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  docs/system/arm/nuvoton.rst    |   2 +-
> >  hw/adc/meson.build             |   1 +
> >  hw/adc/npcm7xx_adc.c           | 321 ++++++++++++++++++++++++++
> >  hw/adc/trace-events            |   5 +
> >  hw/arm/npcm7xx.c               |  24 +-
> >  include/hw/adc/npcm7xx_adc.h   |  72 ++++++
> >  include/hw/arm/npcm7xx.h       |   2 +
> >  meson.build                    |   1 +
> >  tests/qtest/meson.build        |   3 +-
> >  tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++++++++
> >  10 files changed, 828 insertions(+), 3 deletions(-)
> >  create mode 100644 hw/adc/npcm7xx_adc.c
> >  create mode 100644 hw/adc/trace-events
> >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> >
> > diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> > index b00d405d52..35829f8d0b 100644
> > --- a/docs/system/arm/nuvoton.rst
> > +++ b/docs/system/arm/nuvoton.rst
> > @@ -41,6 +41,7 @@ Supported devices
> >   * Random Number Generator (RNG)
> >   * USB host (USBH)
> >   * GPIO controller
> > + * Analog to Digital Converter (ADC)
> >
> >  Missing devices
> >  ---------------
> > @@ -58,7 +59,6 @@ Missing devices
> >   * USB device (USBD)
> >   * SMBus controller (SMBF)
> >   * Peripheral SPI controller (PSPI)
> > - * Analog to Digital Converter (ADC)
> >   * SD/MMC host
> >   * PECI interface
> >   * Pulse Width Modulation (PWM)
> > diff --git a/hw/adc/meson.build b/hw/adc/meson.build
> > index 0d62ae96ae..6ddee23813 100644
> > --- a/hw/adc/meson.build
> > +++ b/hw/adc/meson.build
> > @@ -1 +1,2 @@
> >  softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true:
> files('stm32f2xx_adc.c'))
> > +softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
> > diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> > new file mode 100644
> > index 0000000000..f213b6a6df
> > --- /dev/null
> > +++ b/hw/adc/npcm7xx_adc.c
> > @@ -0,0 +1,321 @@
> > +/*
> > + * Nuvoton NPCM7xx ADC Module
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms of the GNU General Public License as published by the
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> > + * for more details.
> > + */
> > +
> > +#include "hw/adc/npcm7xx_adc.h"
>
> First #include in every .c file must always be "qemu/osdep.h"
> (and .h files never include osdep.h).
>
We'll apply this globally in the patchset.

>
> > +#include "hw/qdev-clock.h"
> > +#include "hw/qdev-properties.h"
> > +#include "migration/vmstate.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/units.h"
> > +#include "trace.h"
> > +
> > +/* 32-bit register indices. */
> > +enum NPCM7xxADCRegisters {
> > +    NPCM7XX_ADC_CON,
> > +    NPCM7XX_ADC_DATA,
> > +    NPCM7XX_ADC_REGS_END,
> > +};
> > +
> > +/* Register field definitions. */
> > +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
> > +#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
> > +#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
> > +#define NPCM7XX_ADC_CON_INT     BIT(18)
> > +#define NPCM7XX_ADC_CON_EN      BIT(17)
> > +#define NPCM7XX_ADC_CON_RST     BIT(16)
> > +#define NPCM7XX_ADC_CON_CONV    BIT(14)
> > +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
> > +
> > +#define NPCM7XX_ADC_MAX_RESULT      1023
> > +#define NPCM7XX_ADC_DEFAULT_IREF    2000000
> > +#define NPCM7XX_ADC_CONV_CYCLES     20
> > +#define NPCM7XX_ADC_RESET_CYCLES    10
> > +#define NPCM7XX_ADC_R0_INPUT        500000
> > +#define NPCM7XX_ADC_R1_INPUT        1500000
> > +
> > +static void npcm7xx_adc_reset(NPCM7xxADCState *s)
> > +{
> > +    timer_del(&s->conv_timer);
> > +    timer_del(&s->reset_timer);
> > +    s->con = 0x000c0001;
> > +    s->data = 0x00000000;
> > +}
> > +
> > +static uint32_t npcm7xx_adc_convert(uint32_t input, uint32_t ref)
> > +{
> > +    uint32_t result;
> > +
> > +    result = input * (NPCM7XX_ADC_MAX_RESULT + 1) / ref;
> > +    if (result > NPCM7XX_ADC_MAX_RESULT) {
> > +        result = NPCM7XX_ADC_MAX_RESULT;
> > +    }
> > +
> > +    return result;
> > +}
> > +
> > +static uint32_t npcm7xx_adc_prescaler(NPCM7xxADCState *s)
> > +{
> > +    return 2 * (NPCM7XX_ADC_CON_DIV(s->con) + 1);
> > +}
> > +
> > +static void npcm7xx_adc_start_timer(Clock *clk, QEMUTimer *timer,
> > +        uint32_t cycles, uint32_t prescaler)
> > +{
> > +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    int64_t freq = clock_get_hz(clk);
> > +    int64_t ns;
> > +
> > +    ns = (NANOSECONDS_PER_SECOND * cycles * prescaler / freq);
>
> Don't calculate time-in-nanoseconds via clock_get_hz(),
> please. Use (the new) clock_ticks_to_ns().
>
Agree. We'll apply this (in PWM as well.)

>
>
> > +    ns += now;
> > +    timer_mod(timer, ns);
> > +}
> > +
> > +static void npcm7xx_adc_start_reset(NPCM7xxADCState *s)
> > +{
> > +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> > +
> > +    npcm7xx_adc_start_timer(s->clock, &s->reset_timer,
> NPCM7XX_ADC_RESET_CYCLES,
> > +            prescaler);
> > +}
> > +
> > +static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)
> > +{
> > +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> > +
> > +    npcm7xx_adc_start_timer(s->clock, &s->conv_timer,
> NPCM7XX_ADC_CONV_CYCLES,
> > +            prescaler);
> > +}
> > +
> > +static void npcm7xx_adc_reset_done(void *opaque)
> > +{
> > +    NPCM7xxADCState *s = opaque;
> > +
> > +    npcm7xx_adc_reset(s);
> > +}
> > +
> > +static void npcm7xx_adc_convert_done(void *opaque)
> > +{
> > +    NPCM7xxADCState *s = opaque;
> > +    uint32_t input = NPCM7XX_ADC_CON_MUX(s->con);
> > +    uint32_t ref = (s->con & NPCM7XX_ADC_CON_REFSEL)
> > +        ? s->iref : s->vref;
> > +
> > +    g_assert(input < NPCM7XX_ADC_NUM_INPUTS);
>
> It looks to me given that the CON_MUX field is 4 bits and
> NUM_INPUTS is only 8 that the guest can trigger this assert
> if it writes a bogus value to the register. You should do
> something other than asserting in this situation (eg you
> can log a guest error and do nothing, or if you happen to
> know what the h/w does in this case that's the best thing).'
>
The hardware behavior in this case is undefined. We'll log a guest error in
this case.

>
> > +    s->data = npcm7xx_adc_convert(s->adci[input], ref);
> > +    if (s->con & NPCM7XX_ADC_CON_INT_EN) {
> > +        s->con |= NPCM7XX_ADC_CON_INT;
> > +        qemu_irq_raise(s->irq);
> > +    }
> > +    s->con &= ~NPCM7XX_ADC_CON_CONV;
> > +}
> > +
> > +static void npcm7xx_adc_calibrate(NPCM7xxADCState *adc)
> > +{
> > +    adc->calibration_r_values[0] =
> npcm7xx_adc_convert(NPCM7XX_ADC_R0_INPUT,
> > +            adc->iref);
> > +    adc->calibration_r_values[1] =
> npcm7xx_adc_convert(NPCM7XX_ADC_R1_INPUT,
> > +            adc->iref);
> > +}
> > +
> > +static void npcm7xx_adc_write_con(NPCM7xxADCState *s, uint32_t new_con)
> > +{
> > +    uint32_t old_con = s->con;
> > +
> > +    /* Write ADC_INT to 1 to clear it */
> > +    if (new_con & NPCM7XX_ADC_CON_INT) {
> > +        new_con &= ~NPCM7XX_ADC_CON_INT;
> > +    } else if (old_con & NPCM7XX_ADC_CON_INT) {
> > +        new_con |= NPCM7XX_ADC_CON_INT;
> > +    }
> > +
> > +    s->con = new_con;
> > +
> > +    if (s->con & NPCM7XX_ADC_CON_RST) {
> > +        if (!(old_con & NPCM7XX_ADC_CON_RST)) {
> > +            npcm7xx_adc_start_reset(s);
> > +        }
> > +    } else {
> > +        timer_del(&s->reset_timer);
> > +    }
>
> Emulating "this device really takes X length of time to
> complete a guest-requested reset" is usually a higher
> degree of fidelity than we bother to model. I assume
> that some guest software can't cope with the device
> resetting faster than advertised ?
>
Thanks for the suggestion. From the Linux driver it is unlikely to cause
any problem if we reset immediately. So we can remove the reset_timer
feature.

>
> > +    if ((s->con & NPCM7XX_ADC_CON_EN)) {
> > +        if (s->con & NPCM7XX_ADC_CON_CONV) {
> > +            if (!(old_con & NPCM7XX_ADC_CON_CONV)) {
> > +                npcm7xx_adc_start_convert(s);
> > +            }
> > +        } else {
> > +            timer_del(&s->conv_timer);
> > +        }
> > +    }
> > +}
> > +
> > +static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigned
> size)
> > +{
> > +    uint64_t value = 0;
> > +    NPCM7xxADCState *s = opaque;
> > +    hwaddr reg = offset / sizeof(uint32_t);
>
> If you defined your register offsets with the REG32() macro
> in include/hw/registerfields.h then it would define
> A_FOO constants for you which are at the byte offsets of
> the 32-bit registers, and you could avoid converting
> the offset by dividing by 4 here. This isn't an obligatory
> change, but I think it ends up neater code.
>
Thanks. We'll apply.

>
>
>
> > diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
> > new file mode 100644
> > index 0000000000..7f9acbeaa1
> > --- /dev/null
> > +++ b/include/hw/adc/npcm7xx_adc.h
> > @@ -0,0 +1,72 @@
> > +/*
> > + * Nuvoton NPCM7xx ADC Module
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms of the GNU General Public License as published by the
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> > + * for more details.
> > + */
> > +#ifndef NPCM7XX_ADC_H
> > +#define NPCM7XX_ADC_H
> > +
> > +#include "qemu/osdep.h"
>
> .h files never include osdep.h (because the .c files always do).
>
> thanks
> -- PMM
>

--00000000000054c10005b8568a9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for your review. We&#39;ll apply your suggesti=
ons.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Jan 7, 2021 at 1:07 PM Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 17 =
Dec 2020 at 00:45, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The ADC is part of NPCM7XX Module. Its behavior is controled by the<br=
>
&gt; ADC_CON register. It converts one of the eight analog inputs into a<br=
>
&gt; digital input and stores it in the ADC_DATA register when enabled.<br>
&gt;<br>
&gt; Users can alter input value by using qom-set QMP command.<br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
21 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/adc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 24 +-<br>
&gt;=C2=A0 include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0|=C2=A0 72 ++++++<br>
&gt;=C2=A0 include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +-<br>
&gt;=C2=A0 tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 10 files changed, 828 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/adc/npcm7xx_adc.c<br>
&gt;=C2=A0 create mode 100644 hw/adc/trace-events<br>
&gt;=C2=A0 create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
&gt;<br>
&gt; diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst=
<br>
&gt; index b00d405d52..35829f8d0b 100644<br>
&gt; --- a/docs/system/arm/nuvoton.rst<br>
&gt; +++ b/docs/system/arm/nuvoton.rst<br>
&gt; @@ -41,6 +41,7 @@ Supported devices<br>
&gt;=C2=A0 =C2=A0* Random Number Generator (RNG)<br>
&gt;=C2=A0 =C2=A0* USB host (USBH)<br>
&gt;=C2=A0 =C2=A0* GPIO controller<br>
&gt; + * Analog to Digital Converter (ADC)<br>
&gt;<br>
&gt;=C2=A0 Missing devices<br>
&gt;=C2=A0 ---------------<br>
&gt; @@ -58,7 +59,6 @@ Missing devices<br>
&gt;=C2=A0 =C2=A0* USB device (USBD)<br>
&gt;=C2=A0 =C2=A0* SMBus controller (SMBF)<br>
&gt;=C2=A0 =C2=A0* Peripheral SPI controller (PSPI)<br>
&gt; - * Analog to Digital Converter (ADC)<br>
&gt;=C2=A0 =C2=A0* SD/MMC host<br>
&gt;=C2=A0 =C2=A0* PECI interface<br>
&gt;=C2=A0 =C2=A0* Pulse Width Modulation (PWM)<br>
&gt; diff --git a/hw/adc/meson.build b/hw/adc/meson.build<br>
&gt; index 0d62ae96ae..6ddee23813 100644<br>
&gt; --- a/hw/adc/meson.build<br>
&gt; +++ b/hw/adc/meson.build<br>
&gt; @@ -1 +1,2 @@<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_STM32F2XX_ADC&#39;, if_true: fi=
les(&#39;stm32f2xx_adc.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_NPCM7XX&#39;, if_true: files(&#39;np=
cm7xx_adc.c&#39;))<br>
&gt; diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f213b6a6df<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/adc/npcm7xx_adc.c<br>
&gt; @@ -0,0 +1,321 @@<br>
&gt; +/*<br>
&gt; + * Nuvoton NPCM7xx ADC Module<br>
&gt; + *<br>
&gt; + * Copyright 2020 Google LLC<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or<br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t WITHOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se<br>
&gt; + * for more details.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;hw/adc/npcm7xx_adc.h&quot;<br>
<br>
First #include in every .c file must always be &quot;qemu/osdep.h&quot;<br>
(and .h files never include osdep.h).<br></blockquote><div>We&#39;ll apply =
this globally in the patchset.=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; +#include &quot;hw/qdev-clock.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +/* 32-bit register indices. */<br>
&gt; +enum NPCM7xxADCRegisters {<br>
&gt; +=C2=A0 =C2=A0 NPCM7XX_ADC_CON,<br>
&gt; +=C2=A0 =C2=A0 NPCM7XX_ADC_DATA,<br>
&gt; +=C2=A0 =C2=A0 NPCM7XX_ADC_REGS_END,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* Register field definitions. */<br>
&gt; +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)<br>
&gt; +#define NPCM7XX_ADC_CON_INT_EN=C2=A0 BIT(21)<br>
&gt; +#define NPCM7XX_ADC_CON_REFSEL=C2=A0 BIT(19)<br>
&gt; +#define NPCM7XX_ADC_CON_INT=C2=A0 =C2=A0 =C2=A0BIT(18)<br>
&gt; +#define NPCM7XX_ADC_CON_EN=C2=A0 =C2=A0 =C2=A0 BIT(17)<br>
&gt; +#define NPCM7XX_ADC_CON_RST=C2=A0 =C2=A0 =C2=A0BIT(16)<br>
&gt; +#define NPCM7XX_ADC_CON_CONV=C2=A0 =C2=A0 BIT(14)<br>
&gt; +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)<br>
&gt; +<br>
&gt; +#define NPCM7XX_ADC_MAX_RESULT=C2=A0 =C2=A0 =C2=A0 1023<br>
&gt; +#define NPCM7XX_ADC_DEFAULT_IREF=C2=A0 =C2=A0 2000000<br>
&gt; +#define NPCM7XX_ADC_CONV_CYCLES=C2=A0 =C2=A0 =C2=A020<br>
&gt; +#define NPCM7XX_ADC_RESET_CYCLES=C2=A0 =C2=A0 10<br>
&gt; +#define NPCM7XX_ADC_R0_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 500000<br>
&gt; +#define NPCM7XX_ADC_R1_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 1500000<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_reset(NPCM7xxADCState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 timer_del(&amp;s-&gt;conv_timer);<br>
&gt; +=C2=A0 =C2=A0 timer_del(&amp;s-&gt;reset_timer);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;con =3D 0x000c0001;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;data =3D 0x00000000;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t npcm7xx_adc_convert(uint32_t input, uint32_t ref)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t result;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 result =3D input * (NPCM7XX_ADC_MAX_RESULT + 1) / ref;<=
br>
&gt; +=C2=A0 =C2=A0 if (result &gt; NPCM7XX_ADC_MAX_RESULT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D NPCM7XX_ADC_MAX_RESULT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return result;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t npcm7xx_adc_prescaler(NPCM7xxADCState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return 2 * (NPCM7XX_ADC_CON_DIV(s-&gt;con) + 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_start_timer(Clock *clk, QEMUTimer *timer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t cycles, uint32_t prescaler)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
&gt; +=C2=A0 =C2=A0 int64_t freq =3D clock_get_hz(clk);<br>
&gt; +=C2=A0 =C2=A0 int64_t ns;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ns =3D (NANOSECONDS_PER_SECOND * cycles * prescaler / f=
req);<br>
<br>
Don&#39;t calculate time-in-nanoseconds via clock_get_hz(),<br>
please. Use (the new) clock_ticks_to_ns().<br></blockquote><div>Agree. We&#=
39;ll apply this (in PWM as well.)=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 ns +=3D now;<br>
&gt; +=C2=A0 =C2=A0 timer_mod(timer, ns);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_start_reset(NPCM7xxADCState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t prescaler =3D npcm7xx_adc_prescaler(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_adc_start_timer(s-&gt;clock, &amp;s-&gt;reset_t=
imer, NPCM7XX_ADC_RESET_CYCLES,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prescaler);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t prescaler =3D npcm7xx_adc_prescaler(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_adc_start_timer(s-&gt;clock, &amp;s-&gt;conv_ti=
mer, NPCM7XX_ADC_CONV_CYCLES,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prescaler);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_reset_done(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_adc_reset(s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_convert_done(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint32_t input =3D NPCM7XX_ADC_CON_MUX(s-&gt;con);<br>
&gt; +=C2=A0 =C2=A0 uint32_t ref =3D (s-&gt;con &amp; NPCM7XX_ADC_CON_REFSE=
L)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ? s-&gt;iref : s-&gt;vref;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert(input &lt; NPCM7XX_ADC_NUM_INPUTS);<br>
<br>
It looks to me given that the CON_MUX field is 4 bits and<br>
NUM_INPUTS is only 8 that the guest can trigger this assert<br>
if it writes a bogus value to the register. You should do<br>
something other than asserting in this situation (eg you<br>
can log a guest error and do nothing, or if you happen to<br>
know what the h/w does in this case that&#39;s the best thing).&#39;<br></b=
lockquote><div>The hardware behavior in this case is undefined. We&#39;ll l=
og a guest error in this case.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 s-&gt;data =3D npcm7xx_adc_convert(s-&gt;adci[input], r=
ef);<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_INT_EN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;con |=3D NPCM7XX_ADC_CON_INT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 s-&gt;con &amp;=3D ~NPCM7XX_ADC_CON_CONV;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_calibrate(NPCM7xxADCState *adc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 adc-&gt;calibration_r_values[0] =3D npcm7xx_adc_convert=
(NPCM7XX_ADC_R0_INPUT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc-&gt;iref);<br>
&gt; +=C2=A0 =C2=A0 adc-&gt;calibration_r_values[1] =3D npcm7xx_adc_convert=
(NPCM7XX_ADC_R1_INPUT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc-&gt;iref);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void npcm7xx_adc_write_con(NPCM7xxADCState *s, uint32_t new_co=
n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t old_con =3D s-&gt;con;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Write ADC_INT to 1 to clear it */<br>
&gt; +=C2=A0 =C2=A0 if (new_con &amp; NPCM7XX_ADC_CON_INT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_con &amp;=3D ~NPCM7XX_ADC_CON_INT;<br=
>
&gt; +=C2=A0 =C2=A0 } else if (old_con &amp; NPCM7XX_ADC_CON_INT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_con |=3D NPCM7XX_ADC_CON_INT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;con =3D new_con;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_RST) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(old_con &amp; NPCM7XX_ADC_CON_RST))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_start_reset(s);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_del(&amp;s-&gt;reset_timer);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Emulating &quot;this device really takes X length of time to<br>
complete a guest-requested reset&quot; is usually a higher<br>
degree of fidelity than we bother to model. I assume<br>
that some guest software can&#39;t cope with the device<br>
resetting faster than advertised ?<br></blockquote><div>Thanks for the sugg=
estion. From the Linux driver it is unlikely to cause any problem if we res=
et immediately. So we can remove the reset_timer feature.</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 if ((s-&gt;con &amp; NPCM7XX_ADC_CON_EN)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_CONV)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(old_con &amp; NPCM7XX=
_ADC_CON_CONV)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_s=
tart_convert(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_del(&amp;s-&gt;conv_t=
imer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigne=
d size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t value =3D 0;<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 hwaddr reg =3D offset / sizeof(uint32_t);<br>
<br>
If you defined your register offsets with the REG32() macro<br>
in include/hw/registerfields.h then it would define<br>
A_FOO constants for you which are at the byte offsets of<br>
the 32-bit registers, and you could avoid converting<br>
the offset by dividing by 4 here. This isn&#39;t an obligatory<br>
change, but I think it ends up neater code.<br></blockquote><div>Thanks. We=
&#39;ll apply.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
<br>
<br>
&gt; diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc=
.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7f9acbeaa1<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/adc/npcm7xx_adc.h<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +/*<br>
&gt; + * Nuvoton NPCM7xx ADC Module<br>
&gt; + *<br>
&gt; + * Copyright 2020 Google LLC<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or<br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t WITHOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se<br>
&gt; + * for more details.<br>
&gt; + */<br>
&gt; +#ifndef NPCM7XX_ADC_H<br>
&gt; +#define NPCM7XX_ADC_H<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
<br>
.h files never include osdep.h (because the .c files always do).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000054c10005b8568a9c--

