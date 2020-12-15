Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB42DA4B5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:27:37 +0100 (CET)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koyBk-0004uu-5w
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1L-0004Vz-Sr
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:52 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:44960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy13-0003Vr-MO
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:51 -0500
Received: by mail-lf1-x141.google.com with SMTP id m25so34787607lfc.11
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I8RA2w7VK7L3ydGDbBHoQUtul8tVf9B5HC4/pSj5XVI=;
 b=gebmepNIicj288owDh2tWZfnHAZmopeXuPicO6/n0EMmsu6kCQdxXJ8Gq3yVn0nOox
 BT6NEzMrgE6QMP3Sa+HNa8oKE0WROd6FIlQUT/lDrQaX8tny4E+r0RBJOsEHAGUMyfBK
 jzuxxQaqx9MEoUADw4IO/Icyw+aQN/nerTmQge9yQReqkGTGdm+ZJB/kuE6hkfyj4eNZ
 1XwiybiGqvpViWT0LnWcHEP0G2KNhxdiW497OKw1OtwvcEj+NhlGuu1Zx6DHSdU50Ufq
 LSQ6Xt8PUAcFrfZCra74qtGd+TQcOasz2CVCsWH9jIaETax3f2POkw9lJDA7LBtAtmG/
 qXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I8RA2w7VK7L3ydGDbBHoQUtul8tVf9B5HC4/pSj5XVI=;
 b=suihTscAIcu//7/KwRwQVj2HYNqM0Ca5oU7UjoZpjerr5XxUNTbWzYyBd7o0KEkmPg
 H7oFN5tfLauKNi02F/up6/W8pBt95AepyEw8h0GhFA1w7RZ9IOAl4OOVa7tEwSL15eqQ
 c3UgR6mMqnbrzb1aXoTR93k2ui3TZDSW3BtT2RUmWf6G6Stx2KOJzXNks3yyhPAo7N3H
 lzJJz7NEw+AA9MGKp+xL1d2sS40h0No1KDh4TcRDyIwxdBBQvE4XJDIzmWR3dKld3wQZ
 LPipPybZGWkX0fhTMtgO1NoZ49mwVqJSBODN9hctWIdqlTgRvIOVjt2i31htWCdyuu33
 d4Zg==
X-Gm-Message-State: AOAM530Sfp+sFuxG6TP5tPhN+g/tL36DQuX0L0HMEC11I02A6y8iVa5F
 Pn+vBBk7OSWkFCUdHqwbiUvVyAXf2Y8nxwBY8eHkVw==
X-Google-Smtp-Source: ABdhPJwyTXmHblgkFV7hzl8lGekzF+roRGrzXYqZ305xS5XiSlePCaTVLiuz9WYCdhgm6TaTyk8pj+blhPogKtb1sis=
X-Received: by 2002:ac2:5689:: with SMTP id 9mr11095043lfr.175.1607991390936; 
 Mon, 14 Dec 2020 16:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-4-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-4-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:16:18 -0800
Message-ID: <CAGcCb11YAj8iQHRPmAGxwtzXqmhg34vjmfx5-kihEy1mYvQ2Vg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/adc: Add an ADC module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a8fc1a05b675abef"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000a8fc1a05b675abef
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

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
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true:
> files('stm32f2xx_adc.c'))
> +softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
> diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
> new file mode 100644
> index 0000000000..c2c4819d3f
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
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "hw/adc/npcm7xx_adc.h"
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
> +    ns += now;
> +    timer_mod(timer, ns);
> +}
> +
> +static void npcm7xx_adc_start_reset(NPCM7xxADCState *s)
> +{
> +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> +
> +    npcm7xx_adc_start_timer(s->clock, &s->reset_timer,
> NPCM7XX_ADC_RESET_CYCLES,
> +            prescaler);
> +}
> +
> +static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)
> +{
> +    uint32_t prescaler = npcm7xx_adc_prescaler(s);
> +
> +    npcm7xx_adc_start_timer(s->clock, &s->conv_timer,
> NPCM7XX_ADC_CONV_CYCLES,
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
> +    adc->calibration_r_values[0] =
> npcm7xx_adc_convert(NPCM7XX_ADC_R0_INPUT,
> +            adc->iref);
> +    adc->calibration_r_values[1] =
> npcm7xx_adc_convert(NPCM7XX_ADC_R1_INPUT,
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
> +
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
> +static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigned
> size)
> +{
> +    uint64_t value = 0;
> +    NPCM7xxADCState *s = opaque;
> +    hwaddr reg = offset / sizeof(uint32_t);
> +
> +    switch (reg) {
> +    case NPCM7XX_ADC_CON:
> +        value = s->con;
> +        break;
> +
> +    case NPCM7XX_ADC_DATA:
> +        value = s->data;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +    trace_npcm7xx_adc_read(DEVICE(s)->canonical_path, offset, value);
> +    return value;
> +}
> +
> +static void npcm7xx_adc_write(void *opaque, hwaddr offset, uint64_t v,
> +        unsigned size)
> +{
> +    NPCM7xxADCState *s = opaque;
> +    hwaddr reg = offset / sizeof(uint32_t);
> +
> +    trace_npcm7xx_adc_write(DEVICE(s)->canonical_path, offset, v);
> +    switch (reg) {
> +    case NPCM7XX_ADC_CON:
> +        npcm7xx_adc_write_con(s, v);
> +        break;
> +
> +    case NPCM7XX_ADC_DATA:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: register @ 0x%04" HWADDR_PRIx " is
> read-only\n",
> +                      __func__, offset);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +}
> +
> +static const struct MemoryRegionOps npcm7xx_adc_ops = {
> +    .read       = npcm7xx_adc_read,
> +    .write      = npcm7xx_adc_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid      = {
> +        .min_access_size        = 4,
> +        .max_access_size        = 4,
> +        .unaligned              = false,
> +    },
> +};
> +
> +static void npcm7xx_adc_enter_reset(Object *obj, ResetType type)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +
> +    npcm7xx_adc_reset(s);
> +}
> +
> +static void npcm7xx_adc_hold_reset(Object *obj)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +
> +    qemu_irq_lower(s->irq);
> +}
> +
> +static void npcm7xx_adc_init(Object *obj)
> +{
> +    NPCM7xxADCState *s = NPCM7XX_ADC(obj);
> +    SysBusDevice *sbd = &s->parent;
> +    int i;
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    timer_init_ns(&s->conv_timer, QEMU_CLOCK_VIRTUAL,
> +            npcm7xx_adc_convert_done, s);
> +    timer_init_ns(&s->reset_timer, QEMU_CLOCK_VIRTUAL,
> +            npcm7xx_adc_reset_done, s);
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_adc_ops, s,
> +                          TYPE_NPCM7XX_ADC, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +
> +    for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
> +        object_property_add_uint32_ptr(obj, "adci[*]",
> +                &s->adci[i], OBJ_PROP_FLAG_WRITE);
> +    }
> +    object_property_add_uint32_ptr(obj, "vref",
> +            &s->vref, OBJ_PROP_FLAG_WRITE);
> +    npcm7xx_adc_calibrate(s);
> +}
> +
> +static const VMStateDescription vmstate_npcm7xx_adc = {
> +    .name = "npcm7xx-adc",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER(conv_timer, NPCM7xxADCState),
> +        VMSTATE_TIMER(reset_timer, NPCM7xxADCState),
> +        VMSTATE_UINT32(con, NPCM7xxADCState),
> +        VMSTATE_UINT32(data, NPCM7xxADCState),
> +        VMSTATE_CLOCK(clock, NPCM7xxADCState),
> +        VMSTATE_UINT32_ARRAY(adci, NPCM7xxADCState,
> NPCM7XX_ADC_NUM_INPUTS),
> +        VMSTATE_UINT32(vref, NPCM7xxADCState),
> +        VMSTATE_UINT32(iref, NPCM7xxADCState),
> +        VMSTATE_UINT16_ARRAY(calibration_r_values, NPCM7xxADCState,
> +                NPCM7XX_ADC_NUM_CALIB),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static Property npcm7xx_timer_properties[] = {
> +    DEFINE_PROP_UINT32("iref", NPCM7xxADCState, iref,
> NPCM7XX_ADC_DEFAULT_IREF),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void npcm7xx_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx ADC Module";
> +    dc->vmsd = &vmstate_npcm7xx_adc;
> +    rc->phases.enter = npcm7xx_adc_enter_reset;
> +    rc->phases.hold = npcm7xx_adc_hold_reset;
> +
> +    device_class_set_props(dc, npcm7xx_timer_properties);
> +}
> +
> +static const TypeInfo npcm7xx_adc_info = {
> +    .name               = TYPE_NPCM7XX_ADC,
> +    .parent             = TYPE_SYS_BUS_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxADCState),
> +    .class_init         = npcm7xx_adc_class_init,
> +    .instance_init      = npcm7xx_adc_init,
> +};
> +
> +static void npcm7xx_adc_register_types(void)
> +{
> +    type_register_static(&npcm7xx_adc_info);
> +}
> +
> +type_init(npcm7xx_adc_register_types);
> diff --git a/hw/adc/trace-events b/hw/adc/trace-events
> new file mode 100644
> index 0000000000..4c3279ece2
> --- /dev/null
> +++ b/hw/adc/trace-events
> @@ -0,0 +1,5 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# npcm7xx_adc.c
> +npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s
> offset: 0x%04" PRIx64 " value 0x%04" PRIx32
> +npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s
> offset: 0x%04" PRIx64 " value 0x%04" PRIx32
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index fabfb1697b..b22a8c966d 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -51,6 +51,9 @@
>  #define NPCM7XX_EHCI_BA         (0xf0806000)
>  #define NPCM7XX_OHCI_BA         (0xf0807000)
>
> +/* ADC Module */
> +#define NPCM7XX_ADC_BA          (0xf000c000)
> +
>  /* Internal AHB SRAM */
>  #define NPCM7XX_RAM3_BA         (0xc0008000)
>  #define NPCM7XX_RAM3_SZ         (4 * KiB)
> @@ -61,6 +64,7 @@
>  #define NPCM7XX_ROM_BA          (0xffff0000)
>  #define NPCM7XX_ROM_SZ          (64 * KiB)
>
> +
>  /* Clock configuration values to be fixed up when bypassing bootloader */
>
>  /* Run PLL1 at 1600 MHz */
> @@ -73,6 +77,7 @@
>   * interrupts.
>   */
>  enum NPCM7xxInterrupt {
> +    NPCM7XX_ADC_IRQ             = 0,
>      NPCM7XX_UART0_IRQ           = 2,
>      NPCM7XX_UART1_IRQ,
>      NPCM7XX_UART2_IRQ,
> @@ -296,6 +301,14 @@ static void npcm7xx_init_fuses(NPCM7xxState *s)
>                              sizeof(value));
>  }
>
> +static void npcm7xx_write_adc_calibration(NPCM7xxState *s)
> +{
> +    /* Both ADC and the fuse array must have realized. */
> +    QEMU_BUILD_BUG_ON(sizeof(s->adc.calibration_r_values) != 4);
> +    npcm7xx_otp_array_write(&s->fuse_array, s->adc.calibration_r_values,
> +            NPCM7XX_FUSE_ADC_CALIB, sizeof(s->adc.calibration_r_values));
> +}
> +
>  static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)
>  {
>      return qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
> @@ -322,6 +335,7 @@ static void npcm7xx_init(Object *obj)
>                              TYPE_NPCM7XX_FUSE_ARRAY);
>      object_initialize_child(obj, "mc", &s->mc, TYPE_NPCM7XX_MC);
>      object_initialize_child(obj, "rng", &s->rng, TYPE_NPCM7XX_RNG);
> +    object_initialize_child(obj, "adc", &s->adc, TYPE_NPCM7XX_ADC);
>
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
>          object_initialize_child(obj, "tim[*]", &s->tim[i],
> TYPE_NPCM7XX_TIMER);
> @@ -414,6 +428,15 @@ static void npcm7xx_realize(DeviceState *dev, Error
> **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->mc), &error_abort);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
>
> +    /* ADC Modules. Cannot fail. */
> +    qdev_connect_clock_in(DEVICE(&s->adc), "clock", qdev_get_clock_out(
> +                          DEVICE(&s->clk), "adc-clock"));
> +    sysbus_realize(SYS_BUS_DEVICE(&s->adc), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, NPCM7XX_ADC_BA);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
> +            npcm7xx_irq(s, NPCM7XX_ADC_IRQ));
> +    npcm7xx_write_adc_calibration(s);
> +
>      /* Timer Modules (TIM). Cannot fail. */
>      QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
>      for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
> @@ -528,7 +551,6 @@ static void npcm7xx_realize(DeviceState *dev, Error
> **errp)
>      create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 *
> KiB);
>      create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 *
> KiB);
> -    create_unimplemented_device("npcm7xx.adc",          0xf000c000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 *
> KiB);
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
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +#ifndef NPCM7XX_ADC_H
> +#define NPCM7XX_ADC_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/clock.h"
> +#include "hw/irq.h"
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +
> +#define NPCM7XX_ADC_NUM_INPUTS      8
> +/**
> + * This value should not be changed unless write_adc_calibration function
> in
> + * hw/arm/npcm7xx.c is also changed.
> + */
> +#define NPCM7XX_ADC_NUM_CALIB       2
> +
> +/**
> + * struct NPCM7xxADCState - Analog to Digital Converter Module device
> state.
> + * @parent: System bus device.
> + * @iomem: Memory region through which registers are accessed.
> + * @conv_timer: The timer counts down remaining cycles for the conversion.
> + * @reset_timer: The timer counts down remaining cycles for reset.
> + * @irq: GIC interrupt line to fire on expiration (if enabled).
> + * @con: The Control Register.
> + * @data: The Data Buffer.
> + * @clock: The ADC Clock.
> + * @adci: The input voltage in units of uV. 1uv = 1e-6V.
> + * @vref: The external reference voltage.
> + * @iref: The internal reference voltage, initialized at launch time.
> + * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
> + */
> +typedef struct {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +
> +    QEMUTimer    conv_timer;
> +    QEMUTimer    reset_timer;
> +
> +    qemu_irq     irq;
> +    uint32_t     con;
> +    uint32_t     data;
> +    Clock       *clock;
> +
> +    /* Voltages are in unit of uV. 1V = 1000000uV. */
> +    uint32_t     adci[NPCM7XX_ADC_NUM_INPUTS];
> +    uint32_t     vref;
> +    uint32_t     iref;
> +
> +    uint16_t     calibration_r_values[NPCM7XX_ADC_NUM_CALIB];
> +} NPCM7xxADCState;
> +
> +#define TYPE_NPCM7XX_ADC "npcm7xx-adc"
> +#define NPCM7XX_ADC(obj) \
> +    OBJECT_CHECK(NPCM7xxADCState, (obj), TYPE_NPCM7XX_ADC)
> +
> +#endif /* NPCM7XX_ADC_H */
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> index 5469247e38..51e1c7620d 100644
> --- a/include/hw/arm/npcm7xx.h
> +++ b/include/hw/arm/npcm7xx.h
> @@ -17,6 +17,7 @@
>  #define NPCM7XX_H
>
>  #include "hw/boards.h"
> +#include "hw/adc/npcm7xx_adc.h"
>  #include "hw/cpu/a9mpcore.h"
>  #include "hw/gpio/npcm7xx_gpio.h"
>  #include "hw/mem/npcm7xx_mc.h"
> @@ -76,6 +77,7 @@ typedef struct NPCM7xxState {
>      NPCM7xxGCRState     gcr;
>      NPCM7xxCLKState     clk;
>      NPCM7xxTimerCtrlState tim[3];
> +    NPCM7xxADCState     adc;
>      NPCM7xxOTPState     key_storage;
>      NPCM7xxOTPState     fuse_array;
>      NPCM7xxMCState      mc;
> diff --git a/meson.build b/meson.build
> index f344b25955..fb03cdbdcc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1435,6 +1435,7 @@ if have_system
>      'chardev',
>      'hw/9pfs',
>      'hw/acpi',
> +    'hw/adc',
>      'hw/alpha',
>      'hw/arm',
>      'hw/audio',
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 6a67c538be..955710d1c5 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -134,7 +134,8 @@ qtests_sparc64 = \
>    ['prom-env-test', 'boot-serial-test']
>
>  qtests_npcm7xx = \
> -  ['npcm7xx_gpio-test',
> +  ['npcm7xx_adc-test',
> +   'npcm7xx_gpio-test',
>     'npcm7xx_rng-test',
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test']
> diff --git a/tests/qtest/npcm7xx_adc-test.c
> b/tests/qtest/npcm7xx_adc-test.c
> new file mode 100644
> index 0000000000..e63c544e51
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_adc-test.c
> @@ -0,0 +1,400 @@
> +/*
> + * QTests for Nuvoton NPCM7xx ADCModules.
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/timer.h"
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +
> +#define REF_HZ          (25000000)
> +
> +#define CON_OFFSET      0x0
> +#define DATA_OFFSET     0x4
> +
> +#define NUM_INPUTS      8
> +#define DEFAULT_IREF    2000000
> +#define CONV_CYCLES     20
> +#define RESET_CYCLES    10
> +#define R0_INPUT        500000
> +#define R1_INPUT        1500000
> +#define MAX_RESULT      1023
> +
> +#define DEFAULT_CLKDIV  5
> +
> +#define FUSE_ARRAY_BA   0xf018a000
> +#define FCTL_OFFSET     0x14
> +#define FST_OFFSET      0x0
> +#define FADDR_OFFSET    0x4
> +#define FDATA_OFFSET    0x8
> +#define ADC_CALIB_ADDR  24
> +#define FUSE_READ       0x2
> +
> +/* Register field definitions. */
> +#define CON_MUX(rv) ((rv) << 24)
> +#define CON_INT_EN  BIT(21)
> +#define CON_REFSEL  BIT(19)
> +#define CON_INT     BIT(18)
> +#define CON_EN      BIT(17)
> +#define CON_RST     BIT(16)
> +#define CON_CONV    BIT(14)
> +#define CON_DIV(rv) extract32(rv, 1, 8)
> +
> +#define FST_RDST    BIT(1)
> +#define FDATA_MASK  0xff
> +
> +#define MAX_ERROR   10000
> +#define MIN_CALIB_INPUT 100000
> +#define MAX_CALIB_INPUT 1800000
> +
> +static const uint32_t input_list[] = {
> +    100000,
> +    500000,
> +    1000000,
> +    1500000,
> +    1800000,
> +    2000000,
> +};
> +
> +static const uint32_t vref_list[] = {
> +    2000000,
> +    2200000,
> +    2500000,
> +};
> +
> +static const uint32_t iref_list[] = {
> +    1800000,
> +    1900000,
> +    2000000,
> +    2100000,
> +    2200000,
> +};
> +
> +static const uint32_t div_list[] = {0, 1, 3, 7, 15};
> +
> +typedef struct ADC {
> +    int irq;
> +    uint64_t base_addr;
> +} ADC;
> +
> +ADC adc = {
> +    .irq        = 0,
> +    .base_addr  = 0xf000c000
> +};
> +
> +static uint32_t adc_read_con(QTestState *qts, const ADC *adc)
> +{
> +    return qtest_readl(qts, adc->base_addr + CON_OFFSET);
> +}
> +
> +static void adc_write_con(QTestState *qts, const ADC *adc, uint32_t value)
> +{
> +    qtest_writel(qts, adc->base_addr + CON_OFFSET, value);
> +}
> +
> +static uint32_t adc_read_data(QTestState *qts, const ADC *adc)
> +{
> +    return qtest_readl(qts, adc->base_addr + DATA_OFFSET);
> +}
> +
> +static uint32_t adc_calibrate(uint32_t measured, uint32_t *rv)
> +{
> +    return R0_INPUT + (R1_INPUT - R0_INPUT) * (int32_t)(measured - rv[0])
> +        / (int32_t)(rv[1] - rv[0]);
> +}
> +
> +static void adc_qom_set(QTestState *qts, const ADC *adc,
> +        const char *name, uint32_t value)
> +{
> +    QDict *response;
> +    const char *path = "/machine/soc/adc";
> +
> +    g_test_message("Setting properties %s of %s with value %u",
> +            name, path, value);
> +    response = qtest_qmp(qts, "{ 'execute': 'qom-set',"
> +            " 'arguments': { 'path': %s, 'property': %s, 'value': %u}}",
> +            path, name, value);
> +    /* The qom set message returns successfully. */
> +    g_assert_true(qdict_haskey(response, "return"));
> +}
> +
> +static void adc_write_input(QTestState *qts, const ADC *adc,
> +        uint32_t index, uint32_t value)
> +{
> +    char name[100];
> +
> +    sprintf(name, "adci[%u]", index);
> +    adc_qom_set(qts, adc, name, value);
> +}
> +
> +static void adc_write_vref(QTestState *qts, const ADC *adc, uint32_t
> value)
> +{
> +    adc_qom_set(qts, adc, "vref", value);
> +}
> +
> +static uint32_t adc_calculate_output(uint32_t input, uint32_t ref)
> +{
> +    uint32_t output;
> +
> +    g_assert_cmpuint(input, <=, ref);
> +    output = (input * (MAX_RESULT + 1)) / ref;
> +    if (output > MAX_RESULT) {
> +        output = MAX_RESULT;
> +    }
> +
> +    return output;
> +}
> +
> +static uint32_t adc_prescaler(QTestState *qts, const ADC *adc)
> +{
> +    uint32_t div = extract32(adc_read_con(qts, adc), 1, 8);
> +
> +    return 2 * (div + 1);
> +}
> +
> +static int64_t adc_calculate_steps(uint32_t cycles, uint32_t prescale,
> +        uint32_t clkdiv)
> +{
> +    return (NANOSECONDS_PER_SECOND / (REF_HZ >> clkdiv)) * cycles *
> prescale;
> +}
> +
> +static void adc_wait_conv_finished(QTestState *qts, const ADC *adc,
> +        uint32_t clkdiv)
> +{
> +    uint32_t prescaler = adc_prescaler(qts, adc);
> +
> +    /*
> +     * ADC should takes roughly 20 cycles to convert one sample. So we
> assert it
> +     * should take 10~30 cycles here.
> +     */
> +    qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES / 2, prescaler,
> +                clkdiv));
> +    /* ADC is still converting. */
> +    g_assert_true(adc_read_con(qts, adc) & CON_CONV);
> +    qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES, prescaler,
> clkdiv));
> +    /* ADC has finished conversion. */
> +    g_assert_false(adc_read_con(qts, adc) & CON_CONV);
> +}
> +
> +/* Check ADC can be reset to default value. */
> +static void test_init(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    adc_write_con(qts, adc, CON_REFSEL | CON_INT);
> +    g_assert_cmphex(adc_read_con(qts, adc), ==, CON_REFSEL);
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC can convert from an internal reference. */
> +static void test_convert_internal(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +    uint32_t index, input, output, expected_output;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
> +
> +    for (index = 0; index < NUM_INPUTS; ++index) {
> +        for (size_t i = 0; i < ARRAY_SIZE(input_list); ++i) {
> +            input = input_list[i];
> +            expected_output = adc_calculate_output(input, DEFAULT_IREF);
> +
> +            adc_write_input(qts, adc, index, input);
> +            adc_write_con(qts, adc, CON_MUX(index) | CON_REFSEL | CON_INT
> |
> +                    CON_EN | CON_CONV);
> +            adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
> +            g_assert_cmphex(adc_read_con(qts, adc), ==, CON_MUX(index) |
> +                    CON_REFSEL | CON_EN);
> +            g_assert_false(qtest_get_irq(qts, adc->irq));
> +            output = adc_read_data(qts, adc);
> +            g_assert_cmpuint(output, ==, expected_output);
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC can convert from an external reference. */
> +static void test_convert_external(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +    uint32_t index, input, vref, output, expected_output;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
> +
> +    for (index = 0; index < NUM_INPUTS; ++index) {
> +        for (size_t i = 0; i < ARRAY_SIZE(input_list); ++i) {
> +            for (size_t j = 0; j < ARRAY_SIZE(vref_list); ++j) {
> +                input = input_list[i];
> +                vref = vref_list[j];
> +                expected_output = adc_calculate_output(input, vref);
> +
> +                adc_write_input(qts, adc, index, input);
> +                adc_write_vref(qts, adc, vref);
> +                adc_write_con(qts, adc, CON_MUX(index) | CON_INT | CON_EN
> |
> +                        CON_CONV);
> +                adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
> +                g_assert_cmphex(adc_read_con(qts, adc), ==,
> +                        CON_MUX(index) | CON_EN);
> +                g_assert_false(qtest_get_irq(qts, adc->irq));
> +                output = adc_read_data(qts, adc);
> +                g_assert_cmpuint(output, ==, expected_output);
> +            }
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC interrupt files if and only if CON_INT_EN is set. */
> +static void test_interrupt(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +    uint32_t index, input, output, expected_output;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +
> +    index = 1;
> +    input = input_list[1];
> +    expected_output = adc_calculate_output(input, DEFAULT_IREF);
> +
> +    qtest_irq_intercept_in(qts, "/machine/soc/a9mpcore/gic");
> +    adc_write_input(qts, adc, index, input);
> +    g_assert_false(qtest_get_irq(qts, adc->irq));
> +    adc_write_con(qts, adc, CON_MUX(index) | CON_INT_EN | CON_REFSEL |
> CON_INT
> +            | CON_EN | CON_CONV);
> +    adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
> +    g_assert_cmphex(adc_read_con(qts, adc), ==, CON_MUX(index) |
> CON_INT_EN
> +            | CON_REFSEL | CON_INT | CON_EN);
> +    g_assert_true(qtest_get_irq(qts, adc->irq));
> +    output = adc_read_data(qts, adc);
> +    g_assert_cmpuint(output, ==, expected_output);
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC is reset after setting ADC_RST for 10 ADC cycles. */
> +static void test_reset(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(div_list); ++i) {
> +        uint32_t div = div_list[i];
> +
> +        adc_write_con(qts, adc, CON_INT | CON_EN | CON_RST |
> CON_DIV(div));
> +        qtest_clock_step(qts, adc_calculate_steps(RESET_CYCLES,
> +                    adc_prescaler(qts, adc), DEFAULT_CLKDIV) - 1);
> +        g_assert_true(adc_read_con(qts, adc) & CON_EN);
> +        qtest_clock_step(qts, 1);
> +        g_assert_false(adc_read_con(qts, adc) & CON_EN);
> +    }
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC is not reset if we set ADC_RST for <10 ADC cycles. */
> +static void test_premature_reset(gconstpointer adc_p)
> +{
> +    const ADC *adc = adc_p;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(div_list); ++i) {
> +        uint32_t div = div_list[i];
> +
> +        adc_write_con(qts, adc, CON_INT | CON_EN | CON_RST |
> CON_DIV(div));
> +        qtest_clock_step(qts, adc_calculate_steps(RESET_CYCLES,
> +                    adc_prescaler(qts, adc), DEFAULT_CLKDIV) - 1);
> +        g_assert_true(adc_read_con(qts, adc) & CON_EN);
> +        adc_write_con(qts, adc, CON_INT | CON_EN | CON_DIV(div));
> +        qtest_clock_step(qts, 1000);
> +        g_assert_true(adc_read_con(qts, adc) & CON_EN);
> +    }
> +    qtest_quit(qts);
> +}
> +
> +/* Check ADC Calibration works as desired. */
> +static void test_calibrate(gconstpointer adc_p)
> +{
> +    int i, j;
> +    const ADC *adc = adc_p;
> +
> +    for (j = 0; j < ARRAY_SIZE(iref_list); ++j) {
> +        uint32_t iref = iref_list[j];
> +        uint32_t expected_rv[] = {
> +            adc_calculate_output(R0_INPUT, iref),
> +            adc_calculate_output(R1_INPUT, iref),
> +        };
> +        char buf[100];
> +        QTestState *qts;
> +
> +        sprintf(buf, "-machine quanta-gsj -global npcm7xx-adc.iref=%u",
> iref);
> +        qts = qtest_init(buf);
> +
> +        /* Check the converted value is correct using the calibration
> value. */
> +        for (i = 0; i < ARRAY_SIZE(input_list); ++i) {
> +            uint32_t input;
> +            uint32_t output;
> +            uint32_t expected_output;
> +            uint32_t calibrated_voltage;
> +            uint32_t index = 0;
> +
> +            input = input_list[i];
> +            /* Calibration only works for input range 0.1V ~ 1.8V. */
> +            if (input < MIN_CALIB_INPUT || input > MAX_CALIB_INPUT) {
> +                continue;
> +            }
> +            expected_output = adc_calculate_output(input, iref);
> +
> +            adc_write_input(qts, adc, index, input);
> +            adc_write_con(qts, adc, CON_MUX(index) | CON_REFSEL | CON_INT
> |
> +                    CON_EN | CON_CONV);
> +            adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);
> +            g_assert_cmphex(adc_read_con(qts, adc), ==,
> +                    CON_REFSEL | CON_MUX(index) | CON_EN);
> +            output = adc_read_data(qts, adc);
> +            g_assert_cmpuint(output, ==, expected_output);
> +
> +            calibrated_voltage = adc_calibrate(output, expected_rv);
> +            g_assert_cmpuint(calibrated_voltage, >, input - MAX_ERROR);
> +            g_assert_cmpuint(calibrated_voltage, <, input + MAX_ERROR);
> +        }
> +
> +        qtest_quit(qts);
> +    }
> +}
> +
> +static void adc_add_test(const char *name, const ADC* wd,
> +        GTestDataFunc fn)
> +{
> +    g_autofree char *full_name = g_strdup_printf("npcm7xx_adc/%s",  name);
> +    qtest_add_data_func(full_name, wd, fn);
> +}
> +#define add_test(name, td) adc_add_test(#name, td, test_##name)
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +
> +    add_test(init, &adc);
> +    add_test(convert_internal, &adc);
> +    add_test(convert_external, &adc);
> +    add_test(interrupt, &adc);
> +    add_test(reset, &adc);
> +    add_test(premature_reset, &adc);
> +    add_test(calibrate, &adc);
> +
> +    return g_test_run();
> +}
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000a8fc1a05b675abef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &lt;<a href=3D"=
mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">The ADC is part of NPCM7XX M=
odule. Its behavior is controled by the<br>
ADC_CON register. It converts one of the eight analog inputs into a<br>
digital input and stores it in the ADC_DATA register when enabled.<br>
<br>
Users can alter input value by using qom-set QMP command.<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0docs/system/arm/nuvoton.rst=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0hw/adc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/adc/npcm7xx_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 321 ++=
++++++++++++++++++++++++<br>
=C2=A0hw/adc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 24 +-<br>
=C2=A0include/hw/adc/npcm7xx_adc.h=C2=A0 =C2=A0|=C2=A0 72 ++++++<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<=
br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-=
<br>
=C2=A0tests/qtest/npcm7xx_adc-test.c | 400 ++++++++++++++++++++++++++++++++=
+<br>
=C2=A010 files changed, 828 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 hw/adc/npcm7xx_adc.c<br>
=C2=A0create mode 100644 hw/adc/trace-events<br>
=C2=A0create mode 100644 include/hw/adc/npcm7xx_adc.h<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_adc-test.c<br>
<br>
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst<br>
index b00d405d52..35829f8d0b 100644<br>
--- a/docs/system/arm/nuvoton.rst<br>
+++ b/docs/system/arm/nuvoton.rst<br>
@@ -41,6 +41,7 @@ Supported devices<br>
=C2=A0 * Random Number Generator (RNG)<br>
=C2=A0 * USB host (USBH)<br>
=C2=A0 * GPIO controller<br>
+ * Analog to Digital Converter (ADC)<br>
<br>
=C2=A0Missing devices<br>
=C2=A0---------------<br>
@@ -58,7 +59,6 @@ Missing devices<br>
=C2=A0 * USB device (USBD)<br>
=C2=A0 * SMBus controller (SMBF)<br>
=C2=A0 * Peripheral SPI controller (PSPI)<br>
- * Analog to Digital Converter (ADC)<br>
=C2=A0 * SD/MMC host<br>
=C2=A0 * PECI interface<br>
=C2=A0 * Pulse Width Modulation (PWM)<br>
diff --git a/hw/adc/meson.build b/hw/adc/meson.build<br>
index 0d62ae96ae..6ddee23813 100644<br>
--- a/hw/adc/meson.build<br>
+++ b/hw/adc/meson.build<br>
@@ -1 +1,2 @@<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_STM32F2XX_ADC&#39;, if_true: files(&=
#39;stm32f2xx_adc.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_NPCM7XX&#39;, if_true: files(&#39;npcm7xx=
_adc.c&#39;))<br>
diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c<br>
new file mode 100644<br>
index 0000000000..c2c4819d3f<br>
--- /dev/null<br>
+++ b/hw/adc/npcm7xx_adc.c<br>
@@ -0,0 +1,321 @@<br>
+/*<br>
+ * Nuvoton NPCM7xx ADC Module<br>
+ *<br>
+ * Copyright 2020 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;hw/adc/npcm7xx_adc.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+/* 32-bit register indices. */<br>
+enum NPCM7xxADCRegisters {<br>
+=C2=A0 =C2=A0 NPCM7XX_ADC_CON,<br>
+=C2=A0 =C2=A0 NPCM7XX_ADC_DATA,<br>
+=C2=A0 =C2=A0 NPCM7XX_ADC_REGS_END,<br>
+};<br>
+<br>
+/* Register field definitions. */<br>
+#define NPCM7XX_ADC_CON_MUX(rv) extract32(rv, 24, 4)<br>
+#define NPCM7XX_ADC_CON_INT_EN=C2=A0 BIT(21)<br>
+#define NPCM7XX_ADC_CON_REFSEL=C2=A0 BIT(19)<br>
+#define NPCM7XX_ADC_CON_INT=C2=A0 =C2=A0 =C2=A0BIT(18)<br>
+#define NPCM7XX_ADC_CON_EN=C2=A0 =C2=A0 =C2=A0 BIT(17)<br>
+#define NPCM7XX_ADC_CON_RST=C2=A0 =C2=A0 =C2=A0BIT(16)<br>
+#define NPCM7XX_ADC_CON_CONV=C2=A0 =C2=A0 BIT(14)<br>
+#define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)<br>
+<br>
+#define NPCM7XX_ADC_MAX_RESULT=C2=A0 =C2=A0 =C2=A0 1023<br>
+#define NPCM7XX_ADC_DEFAULT_IREF=C2=A0 =C2=A0 2000000<br>
+#define NPCM7XX_ADC_CONV_CYCLES=C2=A0 =C2=A0 =C2=A020<br>
+#define NPCM7XX_ADC_RESET_CYCLES=C2=A0 =C2=A0 10<br>
+#define NPCM7XX_ADC_R0_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 500000<br>
+#define NPCM7XX_ADC_R1_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 1500000<br>
+<br>
+static void npcm7xx_adc_reset(NPCM7xxADCState *s)<br>
+{<br>
+=C2=A0 =C2=A0 timer_del(&amp;s-&gt;conv_timer);<br>
+=C2=A0 =C2=A0 timer_del(&amp;s-&gt;reset_timer);<br>
+=C2=A0 =C2=A0 s-&gt;con =3D 0x000c0001;<br>
+=C2=A0 =C2=A0 s-&gt;data =3D 0x00000000;<br>
+}<br>
+<br>
+static uint32_t npcm7xx_adc_convert(uint32_t input, uint32_t ref)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t result;<br>
+<br>
+=C2=A0 =C2=A0 result =3D input * (NPCM7XX_ADC_MAX_RESULT + 1) / ref;<br>
+=C2=A0 =C2=A0 if (result &gt; NPCM7XX_ADC_MAX_RESULT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D NPCM7XX_ADC_MAX_RESULT;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return result;<br>
+}<br>
+<br>
+static uint32_t npcm7xx_adc_prescaler(NPCM7xxADCState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return 2 * (NPCM7XX_ADC_CON_DIV(s-&gt;con) + 1);<br>
+}<br>
+<br>
+static void npcm7xx_adc_start_timer(Clock *clk, QEMUTimer *timer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t cycles, uint32_t prescaler)<br>
+{<br>
+=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 int64_t freq =3D clock_get_hz(clk);<br>
+=C2=A0 =C2=A0 int64_t ns;<br>
+<br>
+=C2=A0 =C2=A0 ns =3D (NANOSECONDS_PER_SECOND * cycles * prescaler / freq);=
<br>
+=C2=A0 =C2=A0 ns +=3D now;<br>
+=C2=A0 =C2=A0 timer_mod(timer, ns);<br>
+}<br>
+<br>
+static void npcm7xx_adc_start_reset(NPCM7xxADCState *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t prescaler =3D npcm7xx_adc_prescaler(s);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_adc_start_timer(s-&gt;clock, &amp;s-&gt;reset_timer,=
 NPCM7XX_ADC_RESET_CYCLES,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prescaler);<br>
+}<br>
+<br>
+static void npcm7xx_adc_start_convert(NPCM7xxADCState *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t prescaler =3D npcm7xx_adc_prescaler(s);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_adc_start_timer(s-&gt;clock, &amp;s-&gt;conv_timer, =
NPCM7XX_ADC_CONV_CYCLES,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prescaler);<br>
+}<br>
+<br>
+static void npcm7xx_adc_reset_done(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_adc_reset(s);<br>
+}<br>
+<br>
+static void npcm7xx_adc_convert_done(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t input =3D NPCM7XX_ADC_CON_MUX(s-&gt;con);<br>
+=C2=A0 =C2=A0 uint32_t ref =3D (s-&gt;con &amp; NPCM7XX_ADC_CON_REFSEL)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ? s-&gt;iref : s-&gt;vref;<br>
+<br>
+=C2=A0 =C2=A0 g_assert(input &lt; NPCM7XX_ADC_NUM_INPUTS);<br>
+=C2=A0 =C2=A0 s-&gt;data =3D npcm7xx_adc_convert(s-&gt;adci[input], ref);<=
br>
+=C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_INT_EN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;con |=3D NPCM7XX_ADC_CON_INT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;irq);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 s-&gt;con &amp;=3D ~NPCM7XX_ADC_CON_CONV;<br>
+}<br>
+<br>
+static void npcm7xx_adc_calibrate(NPCM7xxADCState *adc)<br>
+{<br>
+=C2=A0 =C2=A0 adc-&gt;calibration_r_values[0] =3D npcm7xx_adc_convert(NPCM=
7XX_ADC_R0_INPUT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc-&gt;iref);<br>
+=C2=A0 =C2=A0 adc-&gt;calibration_r_values[1] =3D npcm7xx_adc_convert(NPCM=
7XX_ADC_R1_INPUT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc-&gt;iref);<br>
+}<br>
+<br>
+static void npcm7xx_adc_write_con(NPCM7xxADCState *s, uint32_t new_con)<br=
>
+{<br>
+=C2=A0 =C2=A0 uint32_t old_con =3D s-&gt;con;<br>
+<br>
+=C2=A0 =C2=A0 /* Write ADC_INT to 1 to clear it */<br>
+=C2=A0 =C2=A0 if (new_con &amp; NPCM7XX_ADC_CON_INT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_con &amp;=3D ~NPCM7XX_ADC_CON_INT;<br>
+=C2=A0 =C2=A0 } else if (old_con &amp; NPCM7XX_ADC_CON_INT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_con |=3D NPCM7XX_ADC_CON_INT;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;con =3D new_con;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_RST) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(old_con &amp; NPCM7XX_ADC_CON_RST)) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_start_reset(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_del(&amp;s-&gt;reset_timer);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((s-&gt;con &amp; NPCM7XX_ADC_CON_EN)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;con &amp; NPCM7XX_ADC_CON_CONV) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(old_con &amp; NPCM7XX_ADC_=
CON_CONV)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_start_=
convert(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_del(&amp;s-&gt;conv_timer)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t npcm7xx_adc_read(void *opaque, hwaddr offset, unsigned siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t value =3D 0;<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr reg =3D offset / sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_ADC_CON:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;con;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_ADC_DATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: invalid offset 0x%04&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_npcm7xx_adc_read(DEVICE(s)-&gt;canonical_path, offset,=
 value);<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static void npcm7xx_adc_write(void *opaque, hwaddr offset, uint64_t v,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr reg =3D offset / sizeof(uint32_t);<br>
+<br>
+=C2=A0 =C2=A0 trace_npcm7xx_adc_write(DEVICE(s)-&gt;canonical_path, offset=
, v);<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_ADC_CON:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_write_con(s, v);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_ADC_DATA:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: register @ 0x%04&quot; HWADDR_PRIx &quot; is read-only\n&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: invalid offset 0x%04&quot; HWADDR_PRIx &quot;\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+}<br>
+<br>
+static const struct MemoryRegionOps npcm7xx_adc_ops =3D {<br>
+=C2=A0 =C2=A0 .read=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_adc_read,<br>
+=C2=A0 =C2=A0 .write=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_adc_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid=C2=A0 =C2=A0 =C2=A0 =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D false,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void npcm7xx_adc_enter_reset(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D NPCM7XX_ADC(obj);<br>
+<br>
+=C2=A0 =C2=A0 npcm7xx_adc_reset(s);<br>
+}<br>
+<br>
+static void npcm7xx_adc_hold_reset(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D NPCM7XX_ADC(obj);<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;irq);<br>
+}<br>
+<br>
+static void npcm7xx_adc_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxADCState *s =3D NPCM7XX_ADC(obj);<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
+<br>
+=C2=A0 =C2=A0 timer_init_ns(&amp;s-&gt;conv_timer, QEMU_CLOCK_VIRTUAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_convert_done, s);<br=
>
+=C2=A0 =C2=A0 timer_init_ns(&amp;s-&gt;reset_timer, QEMU_CLOCK_VIRTUAL,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_adc_reset_done, s);<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7xx_ad=
c_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_NPCM7XX_ADC, 4 * KiB);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_ADC_NUM_INPUTS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot;adci=
[*]&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;adci[i]=
, OBJ_PROP_FLAG_WRITE);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot;vref&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;vref, OBJ_PROP_FLAG_W=
RITE);<br>
+=C2=A0 =C2=A0 npcm7xx_adc_calibrate(s);<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_adc =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-adc&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_TIMER(conv_timer, NPCM7xxADCState),<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_TIMER(reset_timer, NPCM7xxADCState),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(con, NPCM7xxADCState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(data, NPCM7xxADCState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clock, NPCM7xxADCState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(adci, NPCM7xxADCState, NP=
CM7XX_ADC_NUM_INPUTS),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(vref, NPCM7xxADCState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(iref, NPCM7xxADCState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT16_ARRAY(calibration_r_values, NPC=
M7xxADCState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_ADC_NUM_CA=
LIB),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static Property npcm7xx_timer_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;iref&quot;, NPCM7xxADCState, iref, =
NPCM7XX_ADC_DEFAULT_IREF),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void npcm7xx_adc_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;NPCM7xx ADC Module&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_adc;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D npcm7xx_adc_enter_reset;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.hold =3D npcm7xx_adc_hold_reset;<br>
+<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, npcm7xx_timer_properties);<br>
+}<br>
+<br>
+static const TypeInfo npcm7xx_adc_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_ADC,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxADCStat=
e),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_adc=
_class_init,<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_adc_init,<br>
+};<br>
+<br>
+static void npcm7xx_adc_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;npcm7xx_adc_info);<br>
+}<br>
+<br>
+type_init(npcm7xx_adc_register_types);<br>
diff --git a/hw/adc/trace-events b/hw/adc/trace-events<br>
new file mode 100644<br>
index 0000000000..4c3279ece2<br>
--- /dev/null<br>
+++ b/hw/adc/trace-events<br>
@@ -0,0 +1,5 @@<br>
+# See docs/devel/tracing.txt for syntax documentation.<br>
+<br>
+# npcm7xx_adc.c<br>
+npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) &quot; %=
s offset: 0x%04&quot; PRIx64 &quot; value 0x%04&quot; PRIx32<br>
+npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) &quot;%=
s offset: 0x%04&quot; PRIx64 &quot; value 0x%04&quot; PRIx32<br>
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c<br>
index fabfb1697b..b22a8c966d 100644<br>
--- a/hw/arm/npcm7xx.c<br>
+++ b/hw/arm/npcm7xx.c<br>
@@ -51,6 +51,9 @@<br>
=C2=A0#define NPCM7XX_EHCI_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf0806000)=
<br>
=C2=A0#define NPCM7XX_OHCI_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xf0807000)=
<br>
<br>
+/* ADC Module */<br>
+#define NPCM7XX_ADC_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xf000c000)<br>
+<br>
=C2=A0/* Internal AHB SRAM */<br>
=C2=A0#define NPCM7XX_RAM3_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xc0008000)=
<br>
=C2=A0#define NPCM7XX_RAM3_SZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(4 * KiB)<br=
>
@@ -61,6 +64,7 @@<br>
=C2=A0#define NPCM7XX_ROM_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0xffff0000)=
<br>
=C2=A0#define NPCM7XX_ROM_SZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (64 * KiB)<b=
r>
<br>
+<br>
=C2=A0/* Clock configuration values to be fixed up when bypassing bootloade=
r */<br>
<br>
=C2=A0/* Run PLL1 at 1600 MHz */<br>
@@ -73,6 +77,7 @@<br>
=C2=A0 * interrupts.<br>
=C2=A0 */<br>
=C2=A0enum NPCM7xxInterrupt {<br>
+=C2=A0 =C2=A0 NPCM7XX_ADC_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_UART0_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 2,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_UART1_IRQ,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_UART2_IRQ,<br>
@@ -296,6 +301,14 @@ static void npcm7xx_init_fuses(NPCM7xxState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(value));<br>
=C2=A0}<br>
<br>
+static void npcm7xx_write_adc_calibration(NPCM7xxState *s)<br>
+{<br>
+=C2=A0 =C2=A0 /* Both ADC and the fuse array must have realized. */<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(sizeof(s-&gt;adc.calibration_r_values) !=
=3D 4);<br>
+=C2=A0 =C2=A0 npcm7xx_otp_array_write(&amp;s-&gt;fuse_array, s-&gt;adc.cal=
ibration_r_values,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_FUSE_ADC_CALIB, sizeof(s=
-&gt;adc.calibration_r_values));<br>
+}<br>
+<br>
=C2=A0static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return qdev_get_gpio_in(DEVICE(&amp;s-&gt;a9mpcore), n)=
;<br>
@@ -322,6 +335,7 @@ static void npcm7xx_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_FUSE_ARRAY);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;mc&quot;, &amp;s-&gt=
;mc, TYPE_NPCM7XX_MC);<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;rng&quot;, &amp;s-&g=
t;rng, TYPE_NPCM7XX_RNG);<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;adc&quot;, &amp;s-&gt;adc=
, TYPE_NPCM7XX_ADC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;tim); i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;tim[*]=
&quot;, &amp;s-&gt;tim[i], TYPE_NPCM7XX_TIMER);<br>
@@ -414,6 +428,15 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;mc), &amp;erro=
r_abort);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;mc), 0, NPCM7=
XX_MC_BA);<br>
<br>
+=C2=A0 =C2=A0 /* ADC Modules. Cannot fail. */<br>
+=C2=A0 =C2=A0 qdev_connect_clock_in(DEVICE(&amp;s-&gt;adc), &quot;clock&qu=
ot;, qdev_get_clock_out(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DEVICE(&amp;s-&gt;clk), &quot;adc-clock&quot;));<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;adc), &amp;error_ab=
ort);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;adc), 0, NPCM7XX_A=
DC_BA);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;adc), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_irq(s, NPCM7XX_ADC_IRQ))=
;<br>
+=C2=A0 =C2=A0 npcm7xx_write_adc_calibration(s);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Timer Modules (TIM). Cannot fail. */<br>
=C2=A0 =C2=A0 =C2=A0QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) !=3D ARR=
AY_SIZE(s-&gt;tim));<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;tim); i++) {<br>
@@ -528,7 +551,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.vdmx&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xe0800000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.pcierc&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00xe1000000,=C2=A0 64 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.kcs&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf0007000,=C2=A0 =C2=A04 * KiB);<br>
-=C2=A0 =C2=A0 create_unimplemented_device(&quot;npcm7xx.adc&quot;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf000c000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.gfxi&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xf000e000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.gpio[0]&quot;=
,=C2=A0 =C2=A0 =C2=A0 0xf0010000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.gpio[1]&quot;=
,=C2=A0 =C2=A0 =C2=A0 0xf0011000,=C2=A0 =C2=A04 * KiB);<br>
diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h<br=
>
new file mode 100644<br>
index 0000000000..7f9acbeaa1<br>
--- /dev/null<br>
+++ b/include/hw/adc/npcm7xx_adc.h<br>
@@ -0,0 +1,72 @@<br>
+/*<br>
+ * Nuvoton NPCM7xx ADC Module<br>
+ *<br>
+ * Copyright 2020 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+#ifndef NPCM7XX_ADC_H<br>
+#define NPCM7XX_ADC_H<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/clock.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+<br>
+#define NPCM7XX_ADC_NUM_INPUTS=C2=A0 =C2=A0 =C2=A0 8<br>
+/**<br>
+ * This value should not be changed unless write_adc_calibration function =
in<br>
+ * hw/arm/npcm7xx.c is also changed.<br>
+ */<br>
+#define NPCM7XX_ADC_NUM_CALIB=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
+<br>
+/**<br>
+ * struct NPCM7xxADCState - Analog to Digital Converter Module device stat=
e.<br>
+ * @parent: System bus device.<br>
+ * @iomem: Memory region through which registers are accessed.<br>
+ * @conv_timer: The timer counts down remaining cycles for the conversion.=
<br>
+ * @reset_timer: The timer counts down remaining cycles for reset.<br>
+ * @irq: GIC interrupt line to fire on expiration (if enabled).<br>
+ * @con: The Control Register.<br>
+ * @data: The Data Buffer.<br>
+ * @clock: The ADC Clock.<br>
+ * @adci: The input voltage in units of uV. 1uv =3D 1e-6V.<br>
+ * @vref: The external reference voltage.<br>
+ * @iref: The internal reference voltage, initialized at launch time.<br>
+ * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.<br>
+ */<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 SysBusDevice parent;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 QEMUTimer=C2=A0 =C2=A0 conv_timer;<br>
+=C2=A0 =C2=A0 QEMUTimer=C2=A0 =C2=A0 reset_timer;<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq=C2=A0 =C2=A0 =C2=A0irq;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0con;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0data;<br>
+=C2=A0 =C2=A0 Clock=C2=A0 =C2=A0 =C2=A0 =C2=A0*clock;<br>
+<br>
+=C2=A0 =C2=A0 /* Voltages are in unit of uV. 1V =3D 1000000uV. */<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0adci[NPCM7XX_ADC_NUM_INPUTS];<br=
>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0vref;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0iref;<br>
+<br>
+=C2=A0 =C2=A0 uint16_t=C2=A0 =C2=A0 =C2=A0calibration_r_values[NPCM7XX_ADC=
_NUM_CALIB];<br>
+} NPCM7xxADCState;<br>
+<br>
+#define TYPE_NPCM7XX_ADC &quot;npcm7xx-adc&quot;<br>
+#define NPCM7XX_ADC(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(NPCM7xxADCState, (obj), TYPE_NPCM7XX_ADC)<br>
+<br>
+#endif /* NPCM7XX_ADC_H */<br>
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h<br>
index 5469247e38..51e1c7620d 100644<br>
--- a/include/hw/arm/npcm7xx.h<br>
+++ b/include/hw/arm/npcm7xx.h<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#define NPCM7XX_H<br>
<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
+#include &quot;hw/adc/npcm7xx_adc.h&quot;<br>
=C2=A0#include &quot;hw/cpu/a9mpcore.h&quot;<br>
=C2=A0#include &quot;hw/gpio/npcm7xx_gpio.h&quot;<br>
=C2=A0#include &quot;hw/mem/npcm7xx_mc.h&quot;<br>
@@ -76,6 +77,7 @@ typedef struct NPCM7xxState {<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxGCRState=C2=A0 =C2=A0 =C2=A0gcr;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxCLKState=C2=A0 =C2=A0 =C2=A0clk;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxTimerCtrlState tim[3];<br>
+=C2=A0 =C2=A0 NPCM7xxADCState=C2=A0 =C2=A0 =C2=A0adc;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxOTPState=C2=A0 =C2=A0 =C2=A0key_storage;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxOTPState=C2=A0 =C2=A0 =C2=A0fuse_array;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxMCState=C2=A0 =C2=A0 =C2=A0 mc;<br>
diff --git a/meson.build b/meson.build<br>
index f344b25955..fb03cdbdcc 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1435,6 +1435,7 @@ if have_system<br>
=C2=A0 =C2=A0 =C2=A0&#39;chardev&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/9pfs&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/acpi&#39;,<br>
+=C2=A0 =C2=A0 &#39;hw/adc&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/alpha&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/arm&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/audio&#39;,<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 6a67c538be..955710d1c5 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -134,7 +134,8 @@ qtests_sparc64 =3D \<br>
=C2=A0 =C2=A0[&#39;prom-env-test&#39;, &#39;boot-serial-test&#39;]<br>
<br>
=C2=A0qtests_npcm7xx =3D \<br>
-=C2=A0 [&#39;npcm7xx_gpio-test&#39;,<br>
+=C2=A0 [&#39;npcm7xx_adc-test&#39;,<br>
+=C2=A0 =C2=A0&#39;npcm7xx_gpio-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_rng-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_timer-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_watchdog_timer-test&#39;]<br>
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.=
c<br>
new file mode 100644<br>
index 0000000000..e63c544e51<br>
--- /dev/null<br>
+++ b/tests/qtest/npcm7xx_adc-test.c<br>
@@ -0,0 +1,400 @@<br>
+/*<br>
+ * QTests for Nuvoton NPCM7xx ADCModules.<br>
+ *<br>
+ * Copyright 2020 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/bitops.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;libqos/libqtest.h&quot;<br>
+#include &quot;qapi/qmp/qdict.h&quot;<br>
+<br>
+#define REF_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (25000000)<br>
+<br>
+#define CON_OFFSET=C2=A0 =C2=A0 =C2=A0 0x0<br>
+#define DATA_OFFSET=C2=A0 =C2=A0 =C2=A00x4<br>
+<br>
+#define NUM_INPUTS=C2=A0 =C2=A0 =C2=A0 8<br>
+#define DEFAULT_IREF=C2=A0 =C2=A0 2000000<br>
+#define CONV_CYCLES=C2=A0 =C2=A0 =C2=A020<br>
+#define RESET_CYCLES=C2=A0 =C2=A0 10<br>
+#define R0_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 500000<br>
+#define R1_INPUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 1500000<br>
+#define MAX_RESULT=C2=A0 =C2=A0 =C2=A0 1023<br>
+<br>
+#define DEFAULT_CLKDIV=C2=A0 5<br>
+<br>
+#define FUSE_ARRAY_BA=C2=A0 =C2=A00xf018a000<br>
+#define FCTL_OFFSET=C2=A0 =C2=A0 =C2=A00x14<br>
+#define FST_OFFSET=C2=A0 =C2=A0 =C2=A0 0x0<br>
+#define FADDR_OFFSET=C2=A0 =C2=A0 0x4<br>
+#define FDATA_OFFSET=C2=A0 =C2=A0 0x8<br>
+#define ADC_CALIB_ADDR=C2=A0 24<br>
+#define FUSE_READ=C2=A0 =C2=A0 =C2=A0 =C2=A00x2<br>
+<br>
+/* Register field definitions. */<br>
+#define CON_MUX(rv) ((rv) &lt;&lt; 24)<br>
+#define CON_INT_EN=C2=A0 BIT(21)<br>
+#define CON_REFSEL=C2=A0 BIT(19)<br>
+#define CON_INT=C2=A0 =C2=A0 =C2=A0BIT(18)<br>
+#define CON_EN=C2=A0 =C2=A0 =C2=A0 BIT(17)<br>
+#define CON_RST=C2=A0 =C2=A0 =C2=A0BIT(16)<br>
+#define CON_CONV=C2=A0 =C2=A0 BIT(14)<br>
+#define CON_DIV(rv) extract32(rv, 1, 8)<br>
+<br>
+#define FST_RDST=C2=A0 =C2=A0 BIT(1)<br>
+#define FDATA_MASK=C2=A0 0xff<br>
+<br>
+#define MAX_ERROR=C2=A0 =C2=A010000<br>
+#define MIN_CALIB_INPUT 100000<br>
+#define MAX_CALIB_INPUT 1800000<br>
+<br>
+static const uint32_t input_list[] =3D {<br>
+=C2=A0 =C2=A0 100000,<br>
+=C2=A0 =C2=A0 500000,<br>
+=C2=A0 =C2=A0 1000000,<br>
+=C2=A0 =C2=A0 1500000,<br>
+=C2=A0 =C2=A0 1800000,<br>
+=C2=A0 =C2=A0 2000000,<br>
+};<br>
+<br>
+static const uint32_t vref_list[] =3D {<br>
+=C2=A0 =C2=A0 2000000,<br>
+=C2=A0 =C2=A0 2200000,<br>
+=C2=A0 =C2=A0 2500000,<br>
+};<br>
+<br>
+static const uint32_t iref_list[] =3D {<br>
+=C2=A0 =C2=A0 1800000,<br>
+=C2=A0 =C2=A0 1900000,<br>
+=C2=A0 =C2=A0 2000000,<br>
+=C2=A0 =C2=A0 2100000,<br>
+=C2=A0 =C2=A0 2200000,<br>
+};<br>
+<br>
+static const uint32_t div_list[] =3D {0, 1, 3, 7, 15};<br>
+<br>
+typedef struct ADC {<br>
+=C2=A0 =C2=A0 int irq;<br>
+=C2=A0 =C2=A0 uint64_t base_addr;<br>
+} ADC;<br>
+<br>
+ADC adc =3D {<br>
+=C2=A0 =C2=A0 .irq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0,<br>
+=C2=A0 =C2=A0 .base_addr=C2=A0 =3D 0xf000c000<br>
+};<br>
+<br>
+static uint32_t adc_read_con(QTestState *qts, const ADC *adc)<br>
+{<br>
+=C2=A0 =C2=A0 return qtest_readl(qts, adc-&gt;base_addr + CON_OFFSET);<br>
+}<br>
+<br>
+static void adc_write_con(QTestState *qts, const ADC *adc, uint32_t value)=
<br>
+{<br>
+=C2=A0 =C2=A0 qtest_writel(qts, adc-&gt;base_addr + CON_OFFSET, value);<br=
>
+}<br>
+<br>
+static uint32_t adc_read_data(QTestState *qts, const ADC *adc)<br>
+{<br>
+=C2=A0 =C2=A0 return qtest_readl(qts, adc-&gt;base_addr + DATA_OFFSET);<br=
>
+}<br>
+<br>
+static uint32_t adc_calibrate(uint32_t measured, uint32_t *rv)<br>
+{<br>
+=C2=A0 =C2=A0 return R0_INPUT + (R1_INPUT - R0_INPUT) * (int32_t)(measured=
 - rv[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 / (int32_t)(rv[1] - rv[0]);<br>
+}<br>
+<br>
+static void adc_qom_set(QTestState *qts, const ADC *adc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *name, uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *response;<br>
+=C2=A0 =C2=A0 const char *path =3D &quot;/machine/soc/adc&quot;;<br>
+<br>
+=C2=A0 =C2=A0 g_test_message(&quot;Setting properties %s of %s with value =
%u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, path, value);<br>
+=C2=A0 =C2=A0 response =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39;=
qom-set&#39;,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; &#39;arguments&#39;: { &#=
39;path&#39;: %s, &#39;property&#39;: %s, &#39;value&#39;: %u}}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path, name, value);<br>
+=C2=A0 =C2=A0 /* The qom set message returns successfully. */<br>
+=C2=A0 =C2=A0 g_assert_true(qdict_haskey(response, &quot;return&quot;));<b=
r>
+}<br>
+<br>
+static void adc_write_input(QTestState *qts, const ADC *adc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t index, uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 char name[100];<br>
+<br>
+=C2=A0 =C2=A0 sprintf(name, &quot;adci[%u]&quot;, index);<br>
+=C2=A0 =C2=A0 adc_qom_set(qts, adc, name, value);<br>
+}<br>
+<br>
+static void adc_write_vref(QTestState *qts, const ADC *adc, uint32_t value=
)<br>
+{<br>
+=C2=A0 =C2=A0 adc_qom_set(qts, adc, &quot;vref&quot;, value);<br>
+}<br>
+<br>
+static uint32_t adc_calculate_output(uint32_t input, uint32_t ref)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t output;<br>
+<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(input, &lt;=3D, ref);<br>
+=C2=A0 =C2=A0 output =3D (input * (MAX_RESULT + 1)) / ref;<br>
+=C2=A0 =C2=A0 if (output &gt; MAX_RESULT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D MAX_RESULT;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return output;<br>
+}<br>
+<br>
+static uint32_t adc_prescaler(QTestState *qts, const ADC *adc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t div =3D extract32(adc_read_con(qts, adc), 1, 8);<br=
>
+<br>
+=C2=A0 =C2=A0 return 2 * (div + 1);<br>
+}<br>
+<br>
+static int64_t adc_calculate_steps(uint32_t cycles, uint32_t prescale,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t clkdiv)<br>
+{<br>
+=C2=A0 =C2=A0 return (NANOSECONDS_PER_SECOND / (REF_HZ &gt;&gt; clkdiv)) *=
 cycles * prescale;<br>
+}<br>
+<br>
+static void adc_wait_conv_finished(QTestState *qts, const ADC *adc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t clkdiv)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t prescaler =3D adc_prescaler(qts, adc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* ADC should takes roughly 20 cycles to convert one sa=
mple. So we assert it<br>
+=C2=A0 =C2=A0 =C2=A0* should take 10~30 cycles here.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES / 2, p=
rescaler,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkdiv));<br>
+=C2=A0 =C2=A0 /* ADC is still converting. */<br>
+=C2=A0 =C2=A0 g_assert_true(adc_read_con(qts, adc) &amp; CON_CONV);<br>
+=C2=A0 =C2=A0 qtest_clock_step(qts, adc_calculate_steps(CONV_CYCLES, presc=
aler, clkdiv));<br>
+=C2=A0 =C2=A0 /* ADC has finished conversion. */<br>
+=C2=A0 =C2=A0 g_assert_false(adc_read_con(qts, adc) &amp; CON_CONV);<br>
+}<br>
+<br>
+/* Check ADC can be reset to default value. */<br>
+static void test_init(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 adc_write_con(qts, adc, CON_REFSEL | CON_INT);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(adc_read_con(qts, adc), =3D=3D, CON_REFSEL);=
<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC can convert from an internal reference. */<br>
+static void test_convert_internal(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+=C2=A0 =C2=A0 uint32_t index, input, output, expected_output;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 qtest_irq_intercept_in(qts, &quot;/machine/soc/a9mpcore/gic&=
quot;);<br>
+<br>
+=C2=A0 =C2=A0 for (index =3D 0; index &lt; NUM_INPUTS; ++index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; ARRAY_SIZE(input_l=
ist); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input =3D input_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D adc_calculat=
e_output(input, DEFAULT_IREF);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_input(qts, adc, index,=
 input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts, adc, CON_MUX(=
index) | CON_REFSEL | CON_INT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CON_=
EN | CON_CONV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_wait_conv_finished(qts, adc,=
 DEFAULT_CLKDIV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(adc_read_con(qts=
, adc), =3D=3D, CON_MUX(index) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CON_=
REFSEL | CON_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_false(qtest_get_irq(qts=
, adc-&gt;irq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D adc_read_data(qts, ad=
c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(output, =3D=3D,=
 expected_output);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC can convert from an external reference. */<br>
+static void test_convert_external(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+=C2=A0 =C2=A0 uint32_t index, input, vref, output, expected_output;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 qtest_irq_intercept_in(qts, &quot;/machine/soc/a9mpcore/gic&=
quot;);<br>
+<br>
+=C2=A0 =C2=A0 for (index =3D 0; index &lt; NUM_INPUTS; ++index) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; ARRAY_SIZE(input_l=
ist); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (size_t j =3D 0; j &lt; ARRA=
Y_SIZE(vref_list); ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input =3D input_li=
st[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vref =3D vref_list=
[j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =
=3D adc_calculate_output(input, vref);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_input(qt=
s, adc, index, input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_vref(qts=
, adc, vref);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts,=
 adc, CON_MUX(index) | CON_INT | CON_EN |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CON_CONV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_wait_conv_fini=
shed(qts, adc, DEFAULT_CLKDIV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(ad=
c_read_con(qts, adc), =3D=3D,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CON_MUX(index) | CON_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_false(qte=
st_get_irq(qts, adc-&gt;irq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D adc_rea=
d_data(qts, adc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(o=
utput, =3D=3D, expected_output);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC interrupt files if and only if CON_INT_EN is set. */<br>
+static void test_interrupt(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+=C2=A0 =C2=A0 uint32_t index, input, output, expected_output;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+<br>
+=C2=A0 =C2=A0 index =3D 1;<br>
+=C2=A0 =C2=A0 input =3D input_list[1];<br>
+=C2=A0 =C2=A0 expected_output =3D adc_calculate_output(input, DEFAULT_IREF=
);<br>
+<br>
+=C2=A0 =C2=A0 qtest_irq_intercept_in(qts, &quot;/machine/soc/a9mpcore/gic&=
quot;);<br>
+=C2=A0 =C2=A0 adc_write_input(qts, adc, index, input);<br>
+=C2=A0 =C2=A0 g_assert_false(qtest_get_irq(qts, adc-&gt;irq));<br>
+=C2=A0 =C2=A0 adc_write_con(qts, adc, CON_MUX(index) | CON_INT_EN | CON_RE=
FSEL | CON_INT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | CON_EN | CON_CONV);<br>
+=C2=A0 =C2=A0 adc_wait_conv_finished(qts, adc, DEFAULT_CLKDIV);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(adc_read_con(qts, adc), =3D=3D, CON_MUX(inde=
x) | CON_INT_EN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | CON_REFSEL | CON_INT | CON_EN)=
;<br>
+=C2=A0 =C2=A0 g_assert_true(qtest_get_irq(qts, adc-&gt;irq));<br>
+=C2=A0 =C2=A0 output =3D adc_read_data(qts, adc);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(output, =3D=3D, expected_output);<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC is reset after setting ADC_RST for 10 ADC cycles. */<br>
+static void test_reset(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+<br>
+=C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; ARRAY_SIZE(div_list); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t div =3D div_list[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts, adc, CON_INT | CON_EN | CON=
_RST | CON_DIV(div));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, adc_calculate_steps(RESE=
T_CYCLES,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_=
prescaler(qts, adc), DEFAULT_CLKDIV) - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_true(adc_read_con(qts, adc) &amp; CON=
_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_false(adc_read_con(qts, adc) &amp; CO=
N_EN);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC is not reset if we set ADC_RST for &lt;10 ADC cycles. */<br>
+static void test_premature_reset(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+<br>
+=C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; ARRAY_SIZE(div_list); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t div =3D div_list[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts, adc, CON_INT | CON_EN | CON=
_RST | CON_DIV(div));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, adc_calculate_steps(RESE=
T_CYCLES,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_=
prescaler(qts, adc), DEFAULT_CLKDIV) - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_true(adc_read_con(qts, adc) &amp; CON=
_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts, adc, CON_INT | CON_EN | CON=
_DIV(div));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_clock_step(qts, 1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_true(adc_read_con(qts, adc) &amp; CON=
_EN);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check ADC Calibration works as desired. */<br>
+static void test_calibrate(gconstpointer adc_p)<br>
+{<br>
+=C2=A0 =C2=A0 int i, j;<br>
+=C2=A0 =C2=A0 const ADC *adc =3D adc_p;<br>
+<br>
+=C2=A0 =C2=A0 for (j =3D 0; j &lt; ARRAY_SIZE(iref_list); ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t iref =3D iref_list[j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t expected_rv[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_calculate_output(R0_INPUT, i=
ref),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_calculate_output(R1_INPUT, i=
ref),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[100];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTestState *qts;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buf, &quot;-machine quanta-gsj -global=
 npcm7xx-adc.iref=3D%u&quot;, iref);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qts =3D qtest_init(buf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check the converted value is correct using =
the calibration value. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(input_list); +=
+i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t input;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t output;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t expected_output;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t calibrated_voltage;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t index =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input =3D input_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Calibration only works for in=
put range 0.1V ~ 1.8V. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (input &lt; MIN_CALIB_INPUT |=
| input &gt; MAX_CALIB_INPUT) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D adc_calculat=
e_output(input, iref);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_input(qts, adc, index,=
 input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_write_con(qts, adc, CON_MUX(=
index) | CON_REFSEL | CON_INT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CON_=
EN | CON_CONV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adc_wait_conv_finished(qts, adc,=
 DEFAULT_CLKDIV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(adc_read_con(qts=
, adc), =3D=3D,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CON_=
REFSEL | CON_MUX(index) | CON_EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D adc_read_data(qts, ad=
c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(output, =3D=3D,=
 expected_output);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 calibrated_voltage =3D adc_calib=
rate(output, expected_rv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(calibrated_volt=
age, &gt;, input - MAX_ERROR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(calibrated_volt=
age, &lt;, input + MAX_ERROR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_quit(qts);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void adc_add_test(const char *name, const ADC* wd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GTestDataFunc fn)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree char *full_name =3D g_strdup_printf(&quot;npcm7xx=
_adc/%s&quot;,=C2=A0 name);<br>
+=C2=A0 =C2=A0 qtest_add_data_func(full_name, wd, fn);<br>
+}<br>
+#define add_test(name, td) adc_add_test(#name, td, test_##name)<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+<br>
+=C2=A0 =C2=A0 add_test(init, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(convert_internal, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(convert_external, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(interrupt, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(reset, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(premature_reset, &amp;adc);<br>
+=C2=A0 =C2=A0 add_test(calibrate, &amp;adc);<br>
+<br>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--000000000000a8fc1a05b675abef--

