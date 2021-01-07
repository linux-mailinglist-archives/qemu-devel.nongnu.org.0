Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CF2EE76E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 22:08:35 +0100 (CET)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcWI-0005B6-0b
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 16:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcVB-0004Wi-GQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:07:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxcV5-0002bR-MU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 16:07:25 -0500
Received: by mail-ej1-x634.google.com with SMTP id lt17so11698321ejb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nML7IqxwblApEN2NnbFGVwk0803/EiwYLNm+/Bxj8F4=;
 b=JYCRX0i+1V2HMySwUXaOGorxzp6Z76lVMqQSgGzV4Y4eJPG+eFtHRwzM170F4VUp6q
 kaM858ElI1B/vAq5qNxzwhA1lxQykDQr7kotiRFbO4G5MvT0qmgacBXwDl2SG1ykqQur
 2WB1TEWOPhhNquKOJzgb6MR1BnRCO1kkr24vc1Ntesrk32il/V4ktsSsYXa8roiTOksb
 DH3qatHpv5BkQbopOKzWAkLb8TXugFBQevpF2ZyCYDZrMedR1gPzy5WdbRazwSXK3MNM
 ayOZCP0uV3Q3Gh7EmRKh3w1R/HlZvhsIxhqk920hB8I9eCgOFHNtzAYur0T3KVkbKUxz
 yT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nML7IqxwblApEN2NnbFGVwk0803/EiwYLNm+/Bxj8F4=;
 b=qh7DSG4Lx3LJuC3uxyl9E+Bx1a/uMFh1w0Zsr+l0N/d+jkbjE5gx1t8zDNeB/VjYsY
 0cNxin/MyoLhJ1h2bFyO1LWKvBiDddaMG1TSAUN/5WFK1g4eNcW9rBFXo7zr6Low3ZHD
 ChMB6p7RtfbSSPdBHk/axbqzNkcciwlXrpjlKPAzVrr6BoKBZNggaXtJrM2ZsRmdurlb
 jsLP1CTRiothFr3MLKiDMjkZbVagIQ4CyZNTQf1TdGbVXKV2aqQGdMmX2ytBFw5SlmWm
 XdRM1ZyesJaushvqtaKC7vz1G9bAbcT7YyIoAmVt0RAz+cRnt3lUQL/Q9J0LuBQi5c+O
 GKIg==
X-Gm-Message-State: AOAM5307q2I4ShcCgXPBKwY21J2Fd7EFMPv0B+iDdIOYk+lzAuYrpiTl
 6uF5VLjXyhbE5SnZHjujOz9AHVucjPIAxtYgOQvXTw==
X-Google-Smtp-Source: ABdhPJyIj/TeLhEcBuKFC0MNLiZLNmiiJYcKYT9NSa6/bQTIQl72BVwwZDqWUqFTVfV/iio6WDbuTS7k6Iq5kNulnXM=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr527842eja.250.1610053637978; 
 Thu, 07 Jan 2021 13:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-4-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 21:07:06 +0000
Message-ID: <CAFEAcA_RGz3N2RtxiNBwfuM6Xx34DqjkvyB=JncjyfOk_mBzSg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] hw/adc: Add an ADC module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> The ADC is part of NPCM7XX Module. Its behavior is controled by the
> ADC_CON register. It converts one of the eight analog inputs into a
> digital input and stores it in the ADC_DATA register when enabled.
>
> Users can alter input value by using qom-set QMP command.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/adc/meson.build             |   1 +
>  hw/adc/npcm7xx_adc.c           | 321 ++++++++++++++++++++++++++
>  hw/adc/trace-events            |   5 +
>  hw/arm/npcm7xx.c               |  24 +-
>  include/hw/adc/npcm7xx_adc.h   |  72 ++++++
>  include/hw/arm/npcm7xx.h       |   2 +
>  meson.build                    |   1 +
>  tests/qtest/meson.build        |   3 +-
>  tests/qtest/npcm7xx_adc-test.c | 400 +++++++++++++++++++++++++++++++++
>  10 files changed, 828 insertions(+), 3 deletions(-)
>  create mode 100644 hw/adc/npcm7xx_adc.c
>  create mode 100644 hw/adc/trace-events
>  create mode 100644 include/hw/adc/npcm7xx_adc.h
>  create mode 100644 tests/qtest/npcm7xx_adc-test.c
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index b00d405d52..35829f8d0b 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -41,6 +41,7 @@ Supported devices
>   * Random Number Generator (RNG)
>   * USB host (USBH)
>   * GPIO controller
> + * Analog to Digital Converter (ADC)
>
>  Missing devices
>  ---------------
> @@ -58,7 +59,6 @@ Missing devices
>   * USB device (USBD)
>   * SMBus controller (SMBF)
>   * Peripheral SPI controller (PSPI)
> - * Analog to Digital Converter (ADC)
>   * SD/MMC host
>   * PECI interface
>   * Pulse Width Modulation (PWM)
> diff --git a/hw/adc/meson.build b/hw/adc/meson.build
> index 0d62ae96ae..6ddee23813 100644
> --- a/hw/adc/meson.build
> +++ b/hw/adc/meson.build
> @@ -1 +1,2 @@
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
> +softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> new file mode 100644
> index 0000000000..f213b6a6df
> --- /dev/null
> +++ b/hw/adc/npcm7xx_adc.c
> @@ -0,0 +1,321 @@
> +/*
> + * Nuvoton NPCM7xx ADC Module
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "hw/adc/npcm7xx_adc.h"

First #include in every .c file must always be "qemu/osdep.h"
(and .h files never include osdep.h).

> +#include "hw/qdev-clock.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/timer.h"
> +#include "qemu/units.h"
> +#include "trace.h"
> +
> +/* 32-bit register indices. */
> +enum NPCM7xxADCRegisters {
> +    NPCM7XX_ADC_CON,
> +    NPCM7XX_ADC_DATA,
> +    NPCM7XX_ADC_REGS_END,
> +};
> +
> +/* Register field definitions. */
> +#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)
> +#define NPCM7XX_ADC_CON_INT_EN  BIT(21)
> +#define NPCM7XX_ADC_CON_REFSEL  BIT(19)
> +#define NPCM7XX_ADC_CON_INT     BIT(18)
> +#define NPCM7XX_ADC_CON_EN      BIT(17)
> +#define NPCM7XX_ADC_CON_RST     BIT(16)
> +#define NPCM7XX_ADC_CON_CONV    BIT(14)
> +#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
> +
> +#define NPCM7XX_ADC_MAX_RESULT      1023
> +#define NPCM7XX_ADC_DEFAULT_IREF    2000000
> +#define NPCM7XX_ADC_CONV_CYCLES     20
> +#define NPCM7XX_ADC_RESET_CYCLES    10
> +#define NPCM7XX_ADC_R0_INPUT        500000
> +#define NPCM7XX_ADC_R1_INPUT        1500000
> +
> +static void npcm7xx_adc_reset(NPCM7xxADCState *s)
> +{
> +    timer_del(&s->conv_timer);
> +    timer_del(&s->reset_timer);
> +    s->con = 0x000c0001;
> +    s->data = 0x00000000;
> +}
> +
> +static uint32_t npcm7xx_adc_convert(uint32_t input, uint32_t ref)
> +{
> +    uint32_t result;
> +
> +    result = input * (NPCM7XX_ADC_MAX_RESULT + 1) / ref;
> +    if (result > NPCM7XX_ADC_MAX_RESULT) {
> +        result = NPCM7XX_ADC_MAX_RESULT;
> +    }
> +
> +    return result;
> +}
> +
> +static uint32_t npcm7xx_adc_prescaler(NPCM7xxADCState *s)
> +{
> +    return 2 * (NPCM7XX_ADC_CON_DIV(s->con) + 1);
> +}
> +
> +static void npcm7xx_adc_start_timer(Clock *clk, QEMUTimer *timer,
> +        uint32_t cycles, uint32_t prescaler)
> +{
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t freq = clock_get_hz(clk);
> +    int64_t ns;
> +
> +    ns = (NANOSECONDS_PER_SECOND * cycles * prescaler / freq);

Don't calculate time-in-nanoseconds via clock_get_hz(),
please. Use (the new) clock_ticks_to_ns().


> +    ns += now;
> +    timer_mod(timer, ns);
> +}
> +
> +static void npcm7xx_adc_start_reset(NPCM7xxADCState *s)
> +{
> +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> +
> +    npcm7xx_adc_start_timer(s->clock, &s->reset_timer, NPCM7XX_ADC_RESET_CYCLES,
> +            prescaler);
> +}
> +
> +static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)
> +{
> +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> +
> +    npcm7xx_adc_start_timer(s->clock, &s->conv_timer, NPCM7XX_ADC_CONV_CYCLES,
> +            prescaler);
> +}
> +
> +static void npcm7xx_adc_reset_done(void *opaque)
> +{
> +    NPCM7xxADCState *s = opaque;
> +
> +    npcm7xx_adc_reset(s);
> +}
> +
> +static void npcm7xx_adc_convert_done(void *opaque)
> +{
> +    NPCM7xxADCState *s = opaque;
> +    uint32_t input = NPCM7XX_ADC_CON_MUX(s->con);
> +    uint32_t ref = (s->con & NPCM7XX_ADC_CON_REFSEL)
> +        ? s->iref : s->vref;
> +
> +    g_assert(input < NPCM7XX_ADC_NUM_INPUTS);

It looks to me given that the CON_MUX field is 4 bits and
NUM_INPUTS is only 8 that the guest can trigger this assert
if it writes a bogus value to the register. You should do
something other than asserting in this situation (eg you
can log a guest error and do nothing, or if you happen to
know what the h/w does in this case that's the best thing).

> +    s->data = npcm7xx_adc_convert(s->adci[input], ref);
> +    if (s->con & NPCM7XX_ADC_CON_INT_EN) {
> +        s->con |= NPCM7XX_ADC_CON_INT;
> +        qemu_irq_raise(s->irq);
> +    }
> +    s->con &= ~NPCM7XX_ADC_CON_CONV;
> +}
> +
> +static void npcm7xx_adc_calibrate(NPCM7xxADCState *adc)
> +{
> +    adc->calibration_r_values[0] = npcm7xx_adc_convert(NPCM7XX_ADC_R0_INPUT,
> +            adc->iref);
> +    adc->calibration_r_values[1] = npcm7xx_adc_convert(NPCM7XX_ADC_R1_INPUT,
> +            adc->iref);
> +}
> +
> +static void npcm7xx_adc_write_con(NPCM7xxADCState *s, uint32_t new_con)
> +{
> +    uint32_t old_con = s->con;
> +
> +    /* Write ADC_INT to 1 to clear it */
> +    if (new_con & NPCM7XX_ADC_CON_INT) {
> +        new_con &= ~NPCM7XX_ADC_CON_INT;
> +    } else if (old_con & NPCM7XX_ADC_CON_INT) {
> +        new_con |= NPCM7XX_ADC_CON_INT;
> +    }
> +
> +    s->con = new_con;
> +
> +    if (s->con & NPCM7XX_ADC_CON_RST) {
> +        if (!(old_con & NPCM7XX_ADC_CON_RST)) {
> +            npcm7xx_adc_start_reset(s);
> +        }
> +    } else {
> +        timer_del(&s->reset_timer);
> +    }

Emulating "this device really takes X length of time to
complete a guest-requested reset" is usually a higher
degree of fidelity than we bother to model. I assume
that some guest software can't cope with the device
resetting faster than advertised ?

> +    if ((s->con & NPCM7XX_ADC_CON_EN)) {
> +        if (s->con & NPCM7XX_ADC_CON_CONV) {
> +            if (!(old_con & NPCM7XX_ADC_CON_CONV)) {
> +                npcm7xx_adc_start_convert(s);
> +            }
> +        } else {
> +            timer_del(&s->conv_timer);
> +        }
> +    }
> +}
> +
> +static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    uint64_t value = 0;
> +    NPCM7xxADCState *s = opaque;
> +    hwaddr reg = offset / sizeof(uint32_t);

If you defined your register offsets with the REG32() macro
in include/hw/registerfields.h then it would define
A_FOO constants for you which are at the byte offsets of
the 32-bit registers, and you could avoid converting
the offset by dividing by 4 here. This isn't an obligatory
change, but I think it ends up neater code.



> diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
> new file mode 100644
> index 0000000000..7f9acbeaa1
> --- /dev/null
> +++ b/include/hw/adc/npcm7xx_adc.h
> @@ -0,0 +1,72 @@
> +/*
> + * Nuvoton NPCM7xx ADC Module
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#ifndef NPCM7XX_ADC_H
> +#define NPCM7XX_ADC_H
> +
> +#include "qemu/osdep.h"

.h files never include osdep.h (because the .c files always do).

thanks
-- PMM

