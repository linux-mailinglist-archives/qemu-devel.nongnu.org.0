Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6442DA49D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:22:55 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koy6s-0001Bp-Qm
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1x-0005Ap-VJ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:17:29 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1q-0003ZX-LW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:17:28 -0500
Received: by mail-lf1-x141.google.com with SMTP id o13so11657914lfr.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XJ84XWVoW6v+LK6IhPNQO85nwKzaizWLjBX9e5TyHIY=;
 b=My6eBcd6uhETRHGGmfF1hNp14ekXwJzcIHq+BlKwOFM4n1g6+A2ycfXX6WjD75IPJM
 lYzuHglunX7C2Cqd+oA3l7KQoH8yvPiUMb7lRBb6+uxILNyKOl8AbJvxAgFTxowoqzpY
 fY/oGtLplXOK6QkIHHqkGf972Y/ez0ntCSfxDbYbaOGAjVRKv4Ht2mNvhFFH3y/LlKH/
 9NafSl52WTOwmLRVYLG1qJmxyNyzhXc4DK8RdewgcyZM/B79STbO5gIx7ZO1EJUF9+AN
 DNXf7721pM3NKpfMu8tDP2ZiUqiOs/7RpZjaxj9mJ/1fjPgI30LL6W1SGzJMptO/NUzE
 at/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XJ84XWVoW6v+LK6IhPNQO85nwKzaizWLjBX9e5TyHIY=;
 b=PuOkQvW6J4+JzTrV/rZFTgA4G1+UbD5lOhl2atNq1JYbgp5loSIkmNA6k46cpJ9OCG
 oPKilHp1In3pU5cPilglIUcl8iVEaXSMl26fh/HQTx5OqhXMBqS/uF0WD0k+LbgVR3wO
 2jDwLi2Mw63d4CQiJ/PzDU1KBE0NAt4JOdhV0gal0+bmNwPNLjvohX5zcy5rXwaUmNN5
 dbW1ckCBQZfEb+1Q0FTLGyhkuNa2ReDmKSn0SBzSPh4hfoFoBywRHAptvvhxk+J2U7bt
 lTyMSyg/WMCdA9H7WPULINBGrKSU5k3fw475YUEJV+wGUZPp/c9y3bSbTZu1oSGtOKUN
 CuLQ==
X-Gm-Message-State: AOAM531Yf/+QPHZ1IGcNh7qIkhGLmyP0AbF84wQOuCdCMDYYjRhTSLt/
 nBnztyXUpGuooR+U0N0zyLw3haoq07mRCsR3PfvWeQ==
X-Google-Smtp-Source: ABdhPJyUoVEgCzvGx10nB1oYF9sj8x3JSO1B9dZUSN4DDHs28ChCEnItHpcy7kGudXkYfOE4faRJ6m8iKjlEJds2WWU=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr6803538ljl.467.1607991440766; 
 Mon, 14 Dec 2020 16:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-5-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-5-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:17:08 -0800
Message-ID: <CAGcCb10-Hr4mKaZViAiBj0kupBsj0gLmnztU_iHEMKgZdTFwPw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/misc: Add a PWM module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a1604e05b675ae49"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Cc: minyard@acm.org, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

--000000000000a1604e05b675ae49
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

> The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> two outputs: frequency and duty_cycle. Both are computed using inputs
> from software side.
>
> This module does not model detail pulse signals since it is expensive.
> It also does not model interrupts and watchdogs that are dependant on
> the detail models. The interfaces for these are left in the module so
> that anyone in need for these functionalities can implement on their
> own.
>
> The user can read the duty cycle and frequency using qom-get command.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst   |   2 +-
>  hw/arm/npcm7xx.c              |  26 +-
>  hw/misc/meson.build           |   1 +
>  hw/misc/npcm7xx_pwm.c         | 559 ++++++++++++++++++++++++++++++++++
>  hw/misc/trace-events          |   6 +
>  include/hw/arm/npcm7xx.h      |   2 +
>  include/hw/misc/npcm7xx_pwm.h | 106 +++++++
>  7 files changed, 699 insertions(+), 3 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_pwm.c
>  create mode 100644 include/hw/misc/npcm7xx_pwm.h
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 35829f8d0b..a1786342e2 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -42,6 +42,7 @@ Supported devices
>   * USB host (USBH)
>   * GPIO controller
>   * Analog to Digital Converter (ADC)
> + * Pulse Width Modulation (PWM)
>
>  Missing devices
>  ---------------
> @@ -61,7 +62,6 @@ Missing devices
>   * Peripheral SPI controller (PSPI)
>   * SD/MMC host
>   * PECI interface
> - * Pulse Width Modulation (PWM)
>   * Tachometer
>   * PCI and PCIe root complex and bridges
>   * VDM and MCTP support
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index b22a8c966d..72040d4079 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -102,6 +102,8 @@ enum NPCM7xxInterrupt {
>      NPCM7XX_WDG2_IRQ,                   /* Timer Module 2 Watchdog */
>      NPCM7XX_EHCI_IRQ            = 61,
>      NPCM7XX_OHCI_IRQ            = 62,
> +    NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
> +    NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
>      NPCM7XX_GPIO0_IRQ           = 116,
>      NPCM7XX_GPIO1_IRQ,
>      NPCM7XX_GPIO2_IRQ,
> @@ -144,6 +146,12 @@ static const hwaddr npcm7xx_fiu3_flash_addr[] = {
>      0xb8000000, /* CS3 */
>  };
>
> +/* Register base address for each PWM Module */
> +static const hwaddr npcm7xx_pwm_addr[] = {
> +    0xf0103000,
> +    0xf0104000,
> +};
> +
>  static const struct {
>      hwaddr regs_addr;
>      uint32_t unconnected_pins;
> @@ -353,6 +361,10 @@ static void npcm7xx_init(Object *obj)
>          object_initialize_child(obj, npcm7xx_fiu[i].name, &s->fiu[i],
>                                  TYPE_NPCM7XX_FIU);
>      }
> +
> +    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
> +        object_initialize_child(obj, "pwm[*]", &s->pwm[i],
> TYPE_NPCM7XX_PWM);
> +    }
>  }
>
>  static void npcm7xx_realize(DeviceState *dev, Error **errp)
> @@ -513,6 +525,18 @@ static void npcm7xx_realize(DeviceState *dev, Error
> **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci), 0,
>                         npcm7xx_irq(s, NPCM7XX_OHCI_IRQ));
>
> +    /* PWM Modules. Cannot fail. */
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pwm_addr) != ARRAY_SIZE(s->pwm));
> +    for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->pwm[i]);
> +
> +        qdev_connect_clock_in(DEVICE(&s->pwm[i]), "clock",
> qdev_get_clock_out(
> +                    DEVICE(&s->clk), "apb3-clock"));
> +        sysbus_realize(sbd, &error_abort);
> +        sysbus_mmio_map(sbd, 0, npcm7xx_pwm_addr[i]);
> +        sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
> +    }
> +
>      /*
>       * Flash Interface Unit (FIU). Can fail if incorrect number of chip
> selects
>       * specified, but this is a programming error.
> @@ -580,8 +604,6 @@ static void npcm7xx_realize(DeviceState *dev, Error
> **errp)
>      create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 *
> KiB);
> -    create_unimplemented_device("npcm7xx.pwm[0]",       0xf0103000,   4 *
> KiB);
> -    create_unimplemented_device("npcm7xx.pwm[1]",       0xf0104000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 *
> KiB);
>      create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 *
> KiB);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index ce15ffceb9..607cd38a21 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -64,6 +64,7 @@ softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true:
> files('mst_fpga.c'))
>  softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
>    'npcm7xx_clk.c',
>    'npcm7xx_gcr.c',
> +  'npcm7xx_pwm.c',
>    'npcm7xx_rng.c',
>  ))
>  softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
> diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
> new file mode 100644
> index 0000000000..402555538a
> --- /dev/null
> +++ b/hw/misc/npcm7xx_pwm.c
> @@ -0,0 +1,559 @@
> +/*
> + * Nuvoton NPCM7xx PWM Module
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
> +
> +#include "hw/irq.h"
> +#include "hw/qdev-clock.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/npcm7xx_pwm.h"
> +#include "migration/vmstate.h"
> +#include "qemu/bitops.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/units.h"
> +#include "trace.h"
> +
> +/* 32-bit register indices. */
> +enum NPCM7xxPWMRegisters {
> +    NPCM7XX_PWM_PPR,
> +    NPCM7XX_PWM_CSR,
> +    NPCM7XX_PWM_PCR,
> +    NPCM7XX_PWM_CNR0,
> +    NPCM7XX_PWM_CMR0,
> +    NPCM7XX_PWM_PDR0,
> +    NPCM7XX_PWM_CNR1,
> +    NPCM7XX_PWM_CMR1,
> +    NPCM7XX_PWM_PDR1,
> +    NPCM7XX_PWM_CNR2,
> +    NPCM7XX_PWM_CMR2,
> +    NPCM7XX_PWM_PDR2,
> +    NPCM7XX_PWM_CNR3,
> +    NPCM7XX_PWM_CMR3,
> +    NPCM7XX_PWM_PDR3,
> +    NPCM7XX_PWM_PIER,
> +    NPCM7XX_PWM_PIIR,
> +    NPCM7XX_PWM_PWDR0,
> +    NPCM7XX_PWM_PWDR1,
> +    NPCM7XX_PWM_PWDR2,
> +    NPCM7XX_PWM_PWDR3,
> +    NPCM7XX_PWM_REGS_END,
> +};
> +
> +/* Register field definitions. */
> +#define NPCM7XX_PPR(rv, index)      extract32((rv),
> npcm7xx_ppr_base[index], 8)
> +#define NPCM7XX_CSR(rv, index)      extract32((rv),
> npcm7xx_csr_base[index], 3)
> +#define NPCM7XX_CH(rv, index)       extract32((rv),
> npcm7xx_ch_base[index], 4)
> +#define NPCM7XX_CH_EN               BIT(0)
> +#define NPCM7XX_CH_INV              BIT(2)
> +#define NPCM7XX_CH_MOD              BIT(3)
> +
> +/* Offset of each PWM channel's prescaler in the PPR register. */
> +static const int npcm7xx_ppr_base[] = { 0, 0, 8, 8 };
> +/* Offset of each PWM channel's clock selector in the CSR register. */
> +static const int npcm7xx_csr_base[] = { 0, 4, 8, 12 };
> +/* Offset of each PWM channel's control variable in the PCR register. */
> +static const int npcm7xx_ch_base[] = { 0, 8, 12, 16 };
> +
> +static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)
> +{
> +    uint32_t ppr;
> +    uint32_t csr;
> +    uint32_t freq;
> +
> +    if (!p->running) {
> +        return 0;
> +    }
> +
> +    csr = NPCM7XX_CSR(p->module->csr, p->index);
> +    ppr = NPCM7XX_PPR(p->module->ppr, p->index);
> +    freq = clock_get_hz(p->module->clock);
> +    freq /= ppr + 1;
> +    /* csr can only be 0~4 */
> +    if (csr > 4) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid csr value %u\n",
> +                      __func__, csr);
> +        csr = 4;
> +    }
> +    /* freq won't be changed if csr == 4. */
> +    if (csr < 4) {
> +        freq >>= csr + 1;
> +    }
> +
> +    return freq / (p->cnr + 1);
> +}
> +
> +static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
> +{
> +    uint64_t duty;
> +
> +    if (p->running) {
> +        if (p->cnr == 0) {
> +            duty = 0;
> +        } else if (p->cmr >= p->cnr) {
> +            duty = NPCM7XX_PWM_MAX_DUTY;
> +        } else {
> +            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
> +        }
> +    } else {
> +        duty = 0;
> +    }
> +
> +    if (p->inverted) {
> +        duty = NPCM7XX_PWM_MAX_DUTY - duty;
> +    }
> +
> +    return duty;
> +}
> +
> +static void npcm7xx_pwm_update_freq(NPCM7xxPWM *p)
> +{
> +    uint32_t freq = npcm7xx_pwm_calculate_freq(p);
> +
> +    if (freq != p->freq) {
> +        trace_npcm7xx_pwm_update_freq(DEVICE(p->module)->canonical_path,
> +                                      p->index, p->freq, freq);
> +        p->freq = freq;
> +    }
> +}
> +
> +static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)
> +{
> +    uint32_t duty = npcm7xx_pwm_calculate_duty(p);
> +
> +    if (duty != p->duty) {
> +        trace_npcm7xx_pwm_update_duty(DEVICE(p->module)->canonical_path,
> +                                      p->index, p->duty, duty);
> +        p->duty = duty;
> +    }
> +}
> +
> +static void npcm7xx_pwm_update_output(NPCM7xxPWM *p)
> +{
> +    npcm7xx_pwm_update_freq(p);
> +    npcm7xx_pwm_update_duty(p);
> +}
> +
> +static void npcm7xx_pwm_write_ppr(NPCM7xxPWMState *s, uint32_t new_ppr)
> +{
> +    int i;
> +    uint32_t old_ppr = s->ppr;
> +
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ppr_base) !=
> NPCM7XX_PWM_PER_MODULE);
> +    s->ppr = new_ppr;
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
> +        if (NPCM7XX_PPR(old_ppr, i) != NPCM7XX_PPR(new_ppr, i)) {
> +            npcm7xx_pwm_update_freq(&s->pwm[i]);
> +        }
> +    }
> +}
> +
> +static void npcm7xx_pwm_write_csr(NPCM7xxPWMState *s, uint32_t new_csr)
> +{
> +    int i;
> +    uint32_t old_csr = s->csr;
> +
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_csr_base) !=
> NPCM7XX_PWM_PER_MODULE);
> +    s->csr = new_csr;
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
> +        if (NPCM7XX_CSR(old_csr, i) != NPCM7XX_CSR(new_csr, i)) {
> +            npcm7xx_pwm_update_freq(&s->pwm[i]);
> +        }
> +    }
> +}
> +
> +static void npcm7xx_pwm_write_pcr(NPCM7xxPWMState *s, uint32_t new_pcr)
> +{
> +    int i;
> +    bool inverted;
> +    uint32_t pcr;
> +    NPCM7xxPWM *p;
> +
> +    s->pcr = new_pcr;
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ch_base) !=
> NPCM7XX_PWM_PER_MODULE);
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
> +        p = &s->pwm[i];
> +        pcr = NPCM7XX_CH(new_pcr, i);
> +        inverted = pcr & NPCM7XX_CH_INV;
> +
> +        /*
> +         * We only run a PWM channel with toggle mode. Single-shot mode
> does not
> +         * generate frequency and duty-cycle values.
> +         */
> +        if ((pcr & NPCM7XX_CH_EN) && (pcr & NPCM7XX_CH_MOD)) {
> +            if (p->running) {
> +                /* Re-run this PWM channel if inverted changed. */
> +                if (p->inverted ^ inverted) {
> +                    p->inverted = inverted;
> +                    npcm7xx_pwm_update_duty(p);
> +                }
> +            } else {
> +                /* Run this PWM channel. */
> +                p->running = true;
> +                p->inverted = inverted;
> +                npcm7xx_pwm_update_output(p);
> +            }
> +        } else {
> +            /* Clear this PWM channel. */
> +            p->running = false;
> +            p->inverted = inverted;
> +            npcm7xx_pwm_update_output(p);
> +        }
> +    }
> +
> +}
> +
> +static hwaddr npcm7xx_cnr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_PWM_CNR0:
> +        return 0;
> +    case NPCM7XX_PWM_CNR1:
> +        return 1;
> +    case NPCM7XX_PWM_CNR2:
> +        return 2;
> +    case NPCM7XX_PWM_CNR3:
> +        return 3;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static hwaddr npcm7xx_cmr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_PWM_CMR0:
> +        return 0;
> +    case NPCM7XX_PWM_CMR1:
> +        return 1;
> +    case NPCM7XX_PWM_CMR2:
> +        return 2;
> +    case NPCM7XX_PWM_CMR3:
> +        return 3;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static hwaddr npcm7xx_pdr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_PWM_PDR0:
> +        return 0;
> +    case NPCM7XX_PWM_PDR1:
> +        return 1;
> +    case NPCM7XX_PWM_PDR2:
> +        return 2;
> +    case NPCM7XX_PWM_PDR3:
> +        return 3;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static hwaddr npcm7xx_pwdr_index(hwaddr reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_PWM_PWDR0:
> +        return 0;
> +    case NPCM7XX_PWM_PWDR1:
> +        return 1;
> +    case NPCM7XX_PWM_PWDR2:
> +        return 2;
> +    case NPCM7XX_PWM_PWDR3:
> +        return 3;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static uint64_t npcm7xx_pwm_read(void *opaque, hwaddr offset, unsigned
> size)
> +{
> +    NPCM7xxPWMState *s = opaque;
> +    hwaddr reg = offset / sizeof(uint32_t);
> +    uint64_t value = 0;
> +
> +    switch (reg) {
> +    case NPCM7XX_PWM_CNR0:
> +    case NPCM7XX_PWM_CNR1:
> +    case NPCM7XX_PWM_CNR2:
> +    case NPCM7XX_PWM_CNR3:
> +        value = s->pwm[npcm7xx_cnr_index(reg)].cnr;
> +        break;
> +
> +    case NPCM7XX_PWM_CMR0:
> +    case NPCM7XX_PWM_CMR1:
> +    case NPCM7XX_PWM_CMR2:
> +    case NPCM7XX_PWM_CMR3:
> +        value = s->pwm[npcm7xx_cmr_index(reg)].cmr;
> +        break;
> +
> +    case NPCM7XX_PWM_PDR0:
> +    case NPCM7XX_PWM_PDR1:
> +    case NPCM7XX_PWM_PDR2:
> +    case NPCM7XX_PWM_PDR3:
> +        value = s->pwm[npcm7xx_pdr_index(reg)].pdr;
> +        break;
> +
> +    case NPCM7XX_PWM_PWDR0:
> +    case NPCM7XX_PWM_PWDR1:
> +    case NPCM7XX_PWM_PWDR2:
> +    case NPCM7XX_PWM_PWDR3:
> +        value = s->pwm[npcm7xx_pwdr_index(reg)].pwdr;
> +        break;
> +
> +    case NPCM7XX_PWM_PPR:
> +        value = s->ppr;
> +        break;
> +
> +    case NPCM7XX_PWM_CSR:
> +        value = s->csr;
> +        break;
> +
> +    case NPCM7XX_PWM_PCR:
> +        value = s->pcr;
> +        break;
> +
> +    case NPCM7XX_PWM_PIER:
> +        value = s->pier;
> +        break;
> +
> +    case NPCM7XX_PWM_PIIR:
> +        value = s->piir;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +
> +    trace_npcm7xx_pwm_read(DEVICE(s)->canonical_path, offset, value);
> +    return value;
> +}
> +
> +static void npcm7xx_pwm_write(void *opaque, hwaddr offset,
> +                                uint64_t v, unsigned size)
> +{
> +    NPCM7xxPWMState *s = opaque;
> +    NPCM7xxPWM *p;
> +    hwaddr reg = offset / sizeof(uint32_t);
> +    uint32_t value = v;
> +
> +    trace_npcm7xx_pwm_write(DEVICE(s)->canonical_path, offset, value);
> +    switch (reg) {
> +    case NPCM7XX_PWM_CNR0:
> +    case NPCM7XX_PWM_CNR1:
> +    case NPCM7XX_PWM_CNR2:
> +    case NPCM7XX_PWM_CNR3:
> +        p = &s->pwm[npcm7xx_cnr_index(reg)];
> +        p->cnr = value;
> +        npcm7xx_pwm_update_output(p);
> +        break;
> +
> +    case NPCM7XX_PWM_CMR0:
> +    case NPCM7XX_PWM_CMR1:
> +    case NPCM7XX_PWM_CMR2:
> +    case NPCM7XX_PWM_CMR3:
> +        p = &s->pwm[npcm7xx_cmr_index(reg)];
> +        p->cmr = value;
> +        npcm7xx_pwm_update_output(p);
> +        break;
> +
> +    case NPCM7XX_PWM_PDR0:
> +    case NPCM7XX_PWM_PDR1:
> +    case NPCM7XX_PWM_PDR2:
> +    case NPCM7XX_PWM_PDR3:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: register @ 0x%04" HWADDR_PRIx " is
> read-only\n",
> +                      __func__, offset);
> +        break;
> +
> +    case NPCM7XX_PWM_PWDR0:
> +    case NPCM7XX_PWM_PWDR1:
> +    case NPCM7XX_PWM_PWDR2:
> +    case NPCM7XX_PWM_PWDR3:
> +        qemu_log_mask(LOG_UNIMP,
> +                     "%s: register @ 0x%04" HWADDR_PRIx " is not
> implemented\n",
> +                     __func__, offset);
> +        break;
> +
> +    case NPCM7XX_PWM_PPR:
> +        npcm7xx_pwm_write_ppr(s, value);
> +        break;
> +
> +    case NPCM7XX_PWM_CSR:
> +        npcm7xx_pwm_write_csr(s, value);
> +        break;
> +
> +    case NPCM7XX_PWM_PCR:
> +        npcm7xx_pwm_write_pcr(s, value);
> +        break;
> +
> +    case NPCM7XX_PWM_PIER:
> +        qemu_log_mask(LOG_UNIMP,
> +                     "%s: register @ 0x%04" HWADDR_PRIx " is not
> implemented\n",
> +                     __func__, offset);
> +        break;
> +
> +    case NPCM7XX_PWM_PIIR:
> +        qemu_log_mask(LOG_UNIMP,
> +                     "%s: register @ 0x%04" HWADDR_PRIx " is not
> implemented\n",
> +                     __func__, offset);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid offset 0x%04" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +}
> +
> +
> +static const struct MemoryRegionOps npcm7xx_pwm_ops = {
> +    .read       = npcm7xx_pwm_read,
> +    .write      = npcm7xx_pwm_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid      = {
> +        .min_access_size        = 4,
> +        .max_access_size        = 4,
> +        .unaligned              = false,
> +    },
> +};
> +
> +static void npcm7xx_pwm_enter_reset(Object *obj, ResetType type)
> +{
> +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
> +        NPCM7xxPWM *p = &s->pwm[i];
> +
> +        p->cnr = 0x00000000;
> +        p->cmr = 0x00000000;
> +        p->pdr = 0x00000000;
> +        p->pwdr = 0x00000000;
> +    }
> +
> +    s->ppr = 0x00000000;
> +    s->csr = 0x00000000;
> +    s->pcr = 0x00000000;
> +    s->pier = 0x00000000;
> +    s->piir = 0x00000000;
> +}
> +
> +static void npcm7xx_pwm_hold_reset(Object *obj)
> +{
> +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
> +        qemu_irq_lower(s->pwm[i].irq);
> +    }
> +}
> +
> +static void npcm7xx_pwm_init(Object *obj)
> +{
> +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> +    SysBusDevice *sbd = &s->parent;
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; i++) {
> +        NPCM7xxPWM *p = &s->pwm[i];
> +        p->module = s;
> +        p->index = i;
> +        sysbus_init_irq(sbd, &p->irq);
> +    }
> +
> +    memory_region_init_io(&s->iomem, obj, &npcm7xx_pwm_ops, s,
> +                          TYPE_NPCM7XX_PWM, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    s->clock = qdev_init_clock_in(DEVICE(s), "clock", NULL, NULL);
> +
> +    for (i = 0; i < NPCM7XX_PWM_PER_MODULE; ++i) {
> +        object_property_add_uint32_ptr(obj, "freq[*]",
> +                &s->pwm[i].freq, OBJ_PROP_FLAG_READ);
> +        object_property_add_uint32_ptr(obj, "duty[*]",
> +                &s->pwm[i].duty, OBJ_PROP_FLAG_READ);
> +    }
> +}
> +
> +static const VMStateDescription vmstate_npcm7xx_pwm = {
> +    .name = "npcm7xx-pwm",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(running, NPCM7xxPWM),
> +        VMSTATE_BOOL(inverted, NPCM7xxPWM),
> +        VMSTATE_UINT8(index, NPCM7xxPWM),
> +        VMSTATE_UINT32(cnr, NPCM7xxPWM),
> +        VMSTATE_UINT32(cmr, NPCM7xxPWM),
> +        VMSTATE_UINT32(pdr, NPCM7xxPWM),
> +        VMSTATE_UINT32(pwdr, NPCM7xxPWM),
> +        VMSTATE_UINT32(freq, NPCM7xxPWM),
> +        VMSTATE_UINT32(duty, NPCM7xxPWM),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static const VMStateDescription vmstate_npcm7xx_pwm_module = {
> +    .name = "npcm7xx-pwm-module",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(clock, NPCM7xxPWMState),
> +        VMSTATE_STRUCT_ARRAY(pwm, NPCM7xxPWMState,
> +                             NPCM7XX_PWM_PER_MODULE, 0,
> vmstate_npcm7xx_pwm,
> +                             NPCM7xxPWM),
> +        VMSTATE_UINT32(ppr, NPCM7xxPWMState),
> +        VMSTATE_UINT32(csr, NPCM7xxPWMState),
> +        VMSTATE_UINT32(pcr, NPCM7xxPWMState),
> +        VMSTATE_UINT32(pier, NPCM7xxPWMState),
> +        VMSTATE_UINT32(piir, NPCM7xxPWMState),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static void npcm7xx_pwm_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    QEMU_BUILD_BUG_ON(NPCM7XX_PWM_REGS_END > NPCM7XX_PWM_NR_REGS);
> +
> +    dc->desc = "NPCM7xx PWM Controller";
> +    dc->vmsd = &vmstate_npcm7xx_pwm_module;
> +    rc->phases.enter = npcm7xx_pwm_enter_reset;
> +    rc->phases.hold = npcm7xx_pwm_hold_reset;
> +}
> +
> +static const TypeInfo npcm7xx_pwm_info = {
> +    .name               = TYPE_NPCM7XX_PWM,
> +    .parent             = TYPE_SYS_BUS_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxPWMState),
> +    .class_init         = npcm7xx_pwm_class_init,
> +    .instance_init      = npcm7xx_pwm_init,
> +};
> +
> +static void npcm7xx_pwm_register_type(void)
> +{
> +    type_register_static(&npcm7xx_pwm_info);
> +}
> +type_init(npcm7xx_pwm_register_type);
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index b5118acd3f..d626b9d7a7 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -120,6 +120,12 @@ npcm7xx_gcr_write(uint64_t offset, uint32_t value)
> "offset: 0x%04" PRIx64 " valu
>  npcm7xx_rng_read(uint64_t offset, uint64_t value, unsigned size) "offset:
> 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
>  npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size)
> "offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
>
> +# npcm7xx_pwm.c
> +npcm7xx_pwm_read(const char *id, uint64_t offset, uint32_t value) "%s
> offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
> +npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) "%s
> offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
> +npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t
> old_value, uint32_t new_value) "%s pwm[%u] Update Freq: old_freq: %u,
> new_freq: %u"
> +npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t
> old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u,
> new_duty: %u"
> +
>  # stm32f4xx_syscfg.c
>  stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interupt: GPIO:
> %d, Line: %d; Level: %d"
>  stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> index 51e1c7620d..f6227aa8aa 100644
> --- a/include/hw/arm/npcm7xx.h
> +++ b/include/hw/arm/npcm7xx.h
> @@ -23,6 +23,7 @@
>  #include "hw/mem/npcm7xx_mc.h"
>  #include "hw/misc/npcm7xx_clk.h"
>  #include "hw/misc/npcm7xx_gcr.h"
> +#include "hw/misc/npcm7xx_pwm.h"
>  #include "hw/misc/npcm7xx_rng.h"
>  #include "hw/nvram/npcm7xx_otp.h"
>  #include "hw/timer/npcm7xx_timer.h"
> @@ -78,6 +79,7 @@ typedef struct NPCM7xxState {
>      NPCM7xxCLKState     clk;
>      NPCM7xxTimerCtrlState tim[3];
>      NPCM7xxADCState     adc;
> +    NPCM7xxPWMState     pwm[2];
>      NPCM7xxOTPState     key_storage;
>      NPCM7xxOTPState     fuse_array;
>      NPCM7xxMCState      mc;
> diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
> new file mode 100644
> index 0000000000..b83f965f1a
> --- /dev/null
> +++ b/include/hw/misc/npcm7xx_pwm.h
> @@ -0,0 +1,106 @@
> +/*
> + * Nuvoton NPCM7xx PWM Module
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
> +#ifndef NPCM7XX_PWM_H
> +#define NPCM7XX_PWM_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/clock.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +
> +/* Each PWM module holds 4 PWM channels. */
> +#define NPCM7XX_PWM_PER_MODULE 4
> +
> +/*
> + * Number of registers in one pwm module. Don't change this without
> increasing
> + * the version_id in vmstate.
> + */
> +#define NPCM7XX_PWM_NR_REGS (0x54 / sizeof(uint32_t))
> +
> +/*
> + * The maximum duty values. Each duty unit represents
> 1/NPCM7XX_PWM_MAX_DUTY
> + * cycles. For example, if NPCM7XX_PWM_MAX_DUTY=1,000,000 and a PWM has a
> duty
> + * value of 100,000 the duty cycle for that PWM is 10%.
> + */
> +#define NPCM7XX_PWM_MAX_DUTY 1000000
> +
> +typedef struct NPCM7xxPWMState NPCM7xxPWMState;
> +
> +/**
> + * struct NPCM7xxPWM - The state of a single PWM channel.
> + * @module: The PWM module that contains this channel.
> + * @irq: GIC interrupt line to fire on expiration if enabled.
> + * @running: Whether this PWM channel is generating output.
> + * @inverted: Whether this PWM channel is inverted.
> + * @index: The index of this PWM channel.
> + * @cnr: The counter register.
> + * @cmr: The comparator register.
> + * @pdr: The data register.
> + * @pwdr: The watchdog register.
> + * @freq: The frequency of this PWM channel.
> + * @duty: The duty cycle of this PWM channel. One unit represents
> + *   1/NPCM7XX_MAX_DUTY cycles.
> + */
> +typedef struct NPCM7xxPWM {
> +    NPCM7xxPWMState         *module;
> +
> +    qemu_irq                irq;
> +
> +    bool                    running;
> +    bool                    inverted;
> +
> +    uint8_t                 index;
> +    uint32_t                cnr;
> +    uint32_t                cmr;
> +    uint32_t                pdr;
> +    uint32_t                pwdr;
> +
> +    uint32_t                freq;
> +    uint32_t                duty;
> +} NPCM7xxPWM;
> +
> +/**
> + * struct NPCM7xxPWMState - Pulse Width Modulation device state.
> + * @parent: System bus device.
> + * @iomem: Memory region through which registers are accessed.
> + * @clock: The PWM clock.
> + * @pwm: The PWM channels owned by this module.
> + * @ppr: The prescaler register.
> + * @csr: The clock selector register.
> + * @pcr: The control register.
> + * @pier: The interrupt enable register.
> + * @piir: The interrupt indication register.
> + */
> +struct NPCM7xxPWMState {
> +    SysBusDevice parent;
> +
> +    MemoryRegion iomem;
> +
> +    Clock       *clock;
> +    NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];
> +
> +    uint32_t    ppr;
> +    uint32_t    csr;
> +    uint32_t    pcr;
> +    uint32_t    pier;
> +    uint32_t    piir;
> +};
> +
> +#define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
> +#define NPCM7XX_PWM(obj) \
> +    OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)
> +
> +#endif /* NPCM7XX_PWM_H */
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000a1604e05b675ae49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &lt;<a href=3D"=
mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">The PWM module is part of NP=
CM7XX module. Each NPCM7XX module has two<br>
identical PWM modules. Each module contains 4 PWM entries. Each PWM has<br>
two outputs: frequency and duty_cycle. Both are computed using inputs<br>
from software side.<br>
<br>
This module does not model detail pulse signals since it is expensive.<br>
It also does not model interrupts and watchdogs that are dependant on<br>
the detail models. The interfaces for these are left in the module so<br>
that anyone in need for these functionalities can implement on their<br>
own.<br>
<br>
The user can read the duty cycle and frequency using qom-get command.<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0docs/system/arm/nuvoton.rst=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 26 +-<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/misc/npcm7xx_pwm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 559 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
6 +<br>
=C2=A0include/hw/arm/npcm7xx.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/misc/npcm7xx_pwm.h | 106 +++++++<br>
=C2=A07 files changed, 699 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 hw/misc/npcm7xx_pwm.c<br>
=C2=A0create mode 100644 include/hw/misc/npcm7xx_pwm.h<br>
<br>
diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst<br>
index 35829f8d0b..a1786342e2 100644<br>
--- a/docs/system/arm/nuvoton.rst<br>
+++ b/docs/system/arm/nuvoton.rst<br>
@@ -42,6 +42,7 @@ Supported devices<br>
=C2=A0 * USB host (USBH)<br>
=C2=A0 * GPIO controller<br>
=C2=A0 * Analog to Digital Converter (ADC)<br>
+ * Pulse Width Modulation (PWM)<br>
<br>
=C2=A0Missing devices<br>
=C2=A0---------------<br>
@@ -61,7 +62,6 @@ Missing devices<br>
=C2=A0 * Peripheral SPI controller (PSPI)<br>
=C2=A0 * SD/MMC host<br>
=C2=A0 * PECI interface<br>
- * Pulse Width Modulation (PWM)<br>
=C2=A0 * Tachometer<br>
=C2=A0 * PCI and PCIe root complex and bridges<br>
=C2=A0 * VDM and MCTP support<br>
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c<br>
index b22a8c966d..72040d4079 100644<br>
--- a/hw/arm/npcm7xx.c<br>
+++ b/hw/arm/npcm7xx.c<br>
@@ -102,6 +102,8 @@ enum NPCM7xxInterrupt {<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_WDG2_IRQ,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Timer Module 2 Watchdog */<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_EHCI_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 61,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_OHCI_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 62,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM0_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 93,=C2=A0 =C2=A0/* PWM module 0 */<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM1_IRQ,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PWM module 1 */<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_GPIO0_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 116,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_GPIO1_IRQ,<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_GPIO2_IRQ,<br>
@@ -144,6 +146,12 @@ static const hwaddr npcm7xx_fiu3_flash_addr[] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A00xb8000000, /* CS3 */<br>
=C2=A0};<br>
<br>
+/* Register base address for each PWM Module */<br>
+static const hwaddr npcm7xx_pwm_addr[] =3D {<br>
+=C2=A0 =C2=A0 0xf0103000,<br>
+=C2=A0 =C2=A0 0xf0104000,<br>
+};<br>
+<br>
=C2=A0static const struct {<br>
=C2=A0 =C2=A0 =C2=A0hwaddr regs_addr;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t unconnected_pins;<br>
@@ -353,6 +361,10 @@ static void npcm7xx_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, npcm7xx_fiu[=
i].name, &amp;s-&gt;fiu[i],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_FIU);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;pwm); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;pwm[*]&quot=
;, &amp;s-&gt;pwm[i], TYPE_NPCM7XX_PWM);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void npcm7xx_realize(DeviceState *dev, Error **errp)<br>
@@ -513,6 +525,18 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;ohci), 0,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 npcm7xx_irq(s, NPCM7XX_OHCI_IRQ));<br>
<br>
+=C2=A0 =C2=A0 /* PWM Modules. Cannot fail. */<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_pwm_addr) !=3D ARRAY_SI=
ZE(s-&gt;pwm));<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;pwm); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(&amp;s-&g=
t;pwm[i]);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_clock_in(DEVICE(&amp;s-&gt;pwm[i]=
), &quot;clock&quot;, qdev_get_clock_out(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVI=
CE(&amp;s-&gt;clk), &quot;apb3-clock&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_realize(sbd, &amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(sbd, 0, npcm7xx_pwm_addr[i]);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM=
7XX_PWM0_IRQ + i));<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Flash Interface Unit (FIU). Can fail if incorrect nu=
mber of chip selects<br>
=C2=A0 =C2=A0 =C2=A0 * specified, but this is a programming error.<br>
@@ -580,8 +604,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.peci&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xf0100000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.siox[1]&quot;=
,=C2=A0 =C2=A0 =C2=A0 0xf0101000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.siox[2]&quot;=
,=C2=A0 =C2=A0 =C2=A0 0xf0102000,=C2=A0 =C2=A04 * KiB);<br>
-=C2=A0 =C2=A0 create_unimplemented_device(&quot;npcm7xx.pwm[0]&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A00xf0103000,=C2=A0 =C2=A04 * KiB);<br>
-=C2=A0 =C2=A0 create_unimplemented_device(&quot;npcm7xx.pwm[1]&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A00xf0104000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.mft[0]&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00xf0180000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.mft[1]&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00xf0181000,=C2=A0 =C2=A04 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0create_unimplemented_device(&quot;npcm7xx.mft[2]&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00xf0182000,=C2=A0 =C2=A04 * KiB);<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index ce15ffceb9..607cd38a21 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -64,6 +64,7 @@ softmmu_ss.add(when: &#39;CONFIG_MAINSTONE&#39;, if_true:=
 files(&#39;mst_fpga.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_NPCM7XX&#39;, if_true: files(<br>
=C2=A0 =C2=A0&#39;npcm7xx_clk.c&#39;,<br>
=C2=A0 =C2=A0&#39;npcm7xx_gcr.c&#39;,<br>
+=C2=A0 &#39;npcm7xx_pwm.c&#39;,<br>
=C2=A0 =C2=A0&#39;npcm7xx_rng.c&#39;,<br>
=C2=A0))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_OMAP&#39;, if_true: files(<br>
diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c<br>
new file mode 100644<br>
index 0000000000..402555538a<br>
--- /dev/null<br>
+++ b/hw/misc/npcm7xx_pwm.c<br>
@@ -0,0 +1,559 @@<br>
+/*<br>
+ * Nuvoton NPCM7xx PWM Module<br>
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
+<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;hw/misc/npcm7xx_pwm.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;qemu/bitops.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+/* 32-bit register indices. */<br>
+enum NPCM7xxPWMRegisters {<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PPR,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CSR,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PCR,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CNR0,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CMR0,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PDR0,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CNR1,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CMR1,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PDR1,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CNR2,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CMR2,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PDR2,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CNR3,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_CMR3,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PDR3,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PIER,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PIIR,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PWDR0,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PWDR1,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PWDR2,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_PWDR3,<br>
+=C2=A0 =C2=A0 NPCM7XX_PWM_REGS_END,<br>
+};<br>
+<br>
+/* Register field definitions. */<br>
+#define NPCM7XX_PPR(rv, index)=C2=A0 =C2=A0 =C2=A0 extract32((rv), npcm7xx=
_ppr_base[index], 8)<br>
+#define NPCM7XX_CSR(rv, index)=C2=A0 =C2=A0 =C2=A0 extract32((rv), npcm7xx=
_csr_base[index], 3)<br>
+#define NPCM7XX_CH(rv, index)=C2=A0 =C2=A0 =C2=A0 =C2=A0extract32((rv), np=
cm7xx_ch_base[index], 4)<br>
+#define NPCM7XX_CH_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(0)<br>
+#define NPCM7XX_CH_INV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT=
(2)<br>
+#define NPCM7XX_CH_MOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT=
(3)<br>
+<br>
+/* Offset of each PWM channel&#39;s prescaler in the PPR register. */<br>
+static const int npcm7xx_ppr_base[] =3D { 0, 0, 8, 8 };<br>
+/* Offset of each PWM channel&#39;s clock selector in the CSR register. */=
<br>
+static const int npcm7xx_csr_base[] =3D { 0, 4, 8, 12 };<br>
+/* Offset of each PWM channel&#39;s control variable in the PCR register. =
*/<br>
+static const int npcm7xx_ch_base[] =3D { 0, 8, 12, 16 };<br>
+<br>
+static uint32_t npcm7xx_pwm_calculate_freq(NPCM7xxPWM *p)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t ppr;<br>
+=C2=A0 =C2=A0 uint32_t csr;<br>
+=C2=A0 =C2=A0 uint32_t freq;<br>
+<br>
+=C2=A0 =C2=A0 if (!p-&gt;running) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 csr =3D NPCM7XX_CSR(p-&gt;module-&gt;csr, p-&gt;index);<br>
+=C2=A0 =C2=A0 ppr =3D NPCM7XX_PPR(p-&gt;module-&gt;ppr, p-&gt;index);<br>
+=C2=A0 =C2=A0 freq =3D clock_get_hz(p-&gt;module-&gt;clock);<br>
+=C2=A0 =C2=A0 freq /=3D ppr + 1;<br>
+=C2=A0 =C2=A0 /* csr can only be 0~4 */<br>
+=C2=A0 =C2=A0 if (csr &gt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: invalid csr value %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, csr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 csr =3D 4;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /* freq won&#39;t be changed if csr =3D=3D 4. */<br>
+=C2=A0 =C2=A0 if (csr &lt; 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq &gt;&gt;=3D csr + 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return freq / (p-&gt;cnr + 1);<br>
+}<br>
+<br>
+static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t duty;<br>
+<br>
+=C2=A0 =C2=A0 if (p-&gt;running) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p-&gt;cnr =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (p-&gt;cmr &gt;=3D p-&gt;cnr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DUTY;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DUTY * =
(p-&gt;cmr + 1) / (p-&gt;cnr + 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (p-&gt;inverted) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D NPCM7XX_PWM_MAX_DUTY - duty;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return duty;<br>
+}<br>
+<br>
+static void npcm7xx_pwm_update_freq(NPCM7xxPWM *p)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t freq =3D npcm7xx_pwm_calculate_freq(p);<br>
+<br>
+=C2=A0 =C2=A0 if (freq !=3D p-&gt;freq) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_npcm7xx_pwm_update_freq(DEVICE(p-&gt;mod=
ule)-&gt;canonical_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;index, p-=
&gt;freq, freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;freq =3D freq;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_pwm_update_duty(NPCM7xxPWM *p)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t duty =3D npcm7xx_pwm_calculate_duty(p);<br>
+<br>
+=C2=A0 =C2=A0 if (duty !=3D p-&gt;duty) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_npcm7xx_pwm_update_duty(DEVICE(p-&gt;mod=
ule)-&gt;canonical_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;index, p-=
&gt;duty, duty);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;duty =3D duty;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_pwm_update_output(NPCM7xxPWM *p)<br>
+{<br>
+=C2=A0 =C2=A0 npcm7xx_pwm_update_freq(p);<br>
+=C2=A0 =C2=A0 npcm7xx_pwm_update_duty(p);<br>
+}<br>
+<br>
+static void npcm7xx_pwm_write_ppr(NPCM7xxPWMState *s, uint32_t new_ppr)<br=
>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 uint32_t old_ppr =3D s-&gt;ppr;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ppr_base) !=3D NPCM7XX_=
PWM_PER_MODULE);<br>
+=C2=A0 =C2=A0 s-&gt;ppr =3D new_ppr;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (NPCM7XX_PPR(old_ppr, i) !=3D NPCM7XX_PPR(n=
ew_ppr, i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update_freq(&amp;s-&=
gt;pwm[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_pwm_write_csr(NPCM7xxPWMState *s, uint32_t new_csr)<br=
>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 uint32_t old_csr =3D s-&gt;csr;<br>
+<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_csr_base) !=3D NPCM7XX_=
PWM_PER_MODULE);<br>
+=C2=A0 =C2=A0 s-&gt;csr =3D new_csr;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (NPCM7XX_CSR(old_csr, i) !=3D NPCM7XX_CSR(n=
ew_csr, i)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update_freq(&amp;s-&=
gt;pwm[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_pwm_write_pcr(NPCM7xxPWMState *s, uint32_t new_pcr)<br=
>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 bool inverted;<br>
+=C2=A0 =C2=A0 uint32_t pcr;<br>
+=C2=A0 =C2=A0 NPCM7xxPWM *p;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;pcr =3D new_pcr;<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_ch_base) !=3D NPCM7XX_P=
WM_PER_MODULE);<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D &amp;s-&gt;pwm[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pcr =3D NPCM7XX_CH(new_pcr, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 inverted =3D pcr &amp; NPCM7XX_CH_INV;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We only run a PWM channel with toggle =
mode. Single-shot mode does not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* generate frequency and duty-cycle valu=
es.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((pcr &amp; NPCM7XX_CH_EN) &amp;&amp; (pcr =
&amp; NPCM7XX_CH_MOD)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p-&gt;running) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Re-run this PWM=
 channel if inverted changed. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p-&gt;inverted=
 ^ inverted) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&g=
t;inverted =3D inverted;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm=
7xx_pwm_update_duty(p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Run this PWM ch=
annel. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;running =3D =
true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;inverted =3D=
 inverted;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update=
_output(p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear this PWM channel. */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;running =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;inverted =3D inverted;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update_output(p);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+}<br>
+<br>
+static hwaddr npcm7xx_cnr_index(hwaddr reg)<br>
+{<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static hwaddr npcm7xx_cmr_index(hwaddr reg)<br>
+{<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static hwaddr npcm7xx_pdr_index(hwaddr reg)<br>
+{<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static hwaddr npcm7xx_pwdr_index(hwaddr reg)<br>
+{<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 3;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t npcm7xx_pwm_read(void *opaque, hwaddr offset, unsigned siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D opaque;<br>
+=C2=A0 =C2=A0 hwaddr reg =3D offset / sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 uint64_t value =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pwm[npcm7xx_cnr_index(reg)].cn=
r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pwm[npcm7xx_cmr_index(reg)].cm=
r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pwm[npcm7xx_pdr_index(reg)].pd=
r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pwm[npcm7xx_pwdr_index(reg)].p=
wdr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PPR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;ppr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CSR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;csr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PCR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pcr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PIER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;pier;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PIIR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;piir;<br>
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
+=C2=A0 =C2=A0 trace_npcm7xx_pwm_read(DEVICE(s)-&gt;canonical_path, offset,=
 value);<br>
+=C2=A0 =C2=A0 return value;<br>
+}<br>
+<br>
+static void npcm7xx_pwm_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t v, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D opaque;<br>
+=C2=A0 =C2=A0 NPCM7xxPWM *p;<br>
+=C2=A0 =C2=A0 hwaddr reg =3D offset / sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 uint32_t value =3D v;<br>
+<br>
+=C2=A0 =C2=A0 trace_npcm7xx_pwm_write(DEVICE(s)-&gt;canonical_path, offset=
, value);<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CNR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D &amp;s-&gt;pwm[npcm7xx_cnr_index(reg)];<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;cnr =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update_output(p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CMR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D &amp;s-&gt;pwm[npcm7xx_cmr_index(reg)];<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;cmr =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_update_output(p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: register @ 0x%04&quot; HWADDR_PRIx &quot; is read-only\n&quot=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR0:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PWDR3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;%s: register @ 0x%04&quot; HWADDR_PRIx &quot; is not implemented\n=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PPR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_write_ppr(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_CSR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_write_csr(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PCR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_pwm_write_pcr(s, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PIER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;%s: register @ 0x%04&quot; HWADDR_PRIx &quot; is not implemented\n=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_PWM_PIIR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;%s: register @ 0x%04&quot; HWADDR_PRIx &quot; is not implemented\n=
&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__func__, offset);<br>
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
+}<br>
+<br>
+<br>
+static const struct MemoryRegionOps npcm7xx_pwm_ops =3D {<br>
+=C2=A0 =C2=A0 .read=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_pwm_read,<br>
+=C2=A0 =C2=A0 .write=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_pwm_write,<br>
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
+static void npcm7xx_pwm_enter_reset(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D NPCM7XX_PWM(obj);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxPWM *p =3D &amp;s-&gt;pwm[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;cnr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;cmr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;pdr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;pwdr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;ppr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 s-&gt;csr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 s-&gt;pcr =3D 0x00000000;<br>
+=C2=A0 =C2=A0 s-&gt;pier =3D 0x00000000;<br>
+=C2=A0 =C2=A0 s-&gt;piir =3D 0x00000000;<br>
+}<br>
+<br>
+static void npcm7xx_pwm_hold_reset(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D NPCM7XX_PWM(obj);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;pwm[i].irq);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_pwm_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D NPCM7XX_PWM(obj);<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxPWM *p =3D &amp;s-&gt;pwm[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;module =3D s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;index =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;p-&gt;irq);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7xx_pw=
m_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_NPCM7XX_PWM, 4 * KiB);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
+=C2=A0 =C2=A0 s-&gt;clock =3D qdev_init_clock_in(DEVICE(s), &quot;clock&qu=
ot;, NULL, NULL);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PWM_PER_MODULE; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot;freq=
[*]&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;pwm[i].=
freq, OBJ_PROP_FLAG_READ);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_add_uint32_ptr(obj, &quot;duty=
[*]&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;pwm[i].=
duty, OBJ_PROP_FLAG_READ);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_pwm =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-pwm&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_BOOL(running, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_BOOL(inverted, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(index, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(cnr, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(cmr, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(pdr, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(pwdr, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(freq, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(duty, NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_pwm_module =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-pwm-module&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clock, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_STRUCT_ARRAY(pwm, NPCM7xxPWMState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PWM_PER_MODULE, 0, vmstate_npcm7xx_p=
wm,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7xxPWM),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(ppr, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(csr, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(pcr, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(pier, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(piir, NPCM7xxPWMState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void npcm7xx_pwm_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(NPCM7XX_PWM_REGS_END &gt; NPCM7XX_PWM_NR_R=
EGS);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;NPCM7xx PWM Controller&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_pwm_module;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D npcm7xx_pwm_enter_reset;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.hold =3D npcm7xx_pwm_hold_reset;<br>
+}<br>
+<br>
+static const TypeInfo npcm7xx_pwm_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_PWM,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxPWMStat=
e),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_pwm=
_class_init,<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_pwm_init,<br>
+};<br>
+<br>
+static void npcm7xx_pwm_register_type(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;npcm7xx_pwm_info);<br>
+}<br>
+type_init(npcm7xx_pwm_register_type);<br>
diff --git a/hw/misc/trace-events b/hw/misc/trace-events<br>
index b5118acd3f..d626b9d7a7 100644<br>
--- a/hw/misc/trace-events<br>
+++ b/hw/misc/trace-events<br>
@@ -120,6 +120,12 @@ npcm7xx_gcr_write(uint64_t offset, uint32_t value) &qu=
ot;offset: 0x%04&quot; PRIx64 &quot; valu<br>
=C2=A0npcm7xx_rng_read(uint64_t offset, uint64_t value, unsigned size) &quo=
t;offset: 0x%04&quot; PRIx64 &quot; value: 0x%02&quot; PRIx64 &quot; size: =
%u&quot;<br>
=C2=A0npcm7xx_rng_write(uint64_t offset, uint64_t value, unsigned size) &qu=
ot;offset: 0x%04&quot; PRIx64 &quot; value: 0x%02&quot; PRIx64 &quot; size:=
 %u&quot;<br>
<br>
+# npcm7xx_pwm.c<br>
+npcm7xx_pwm_read(const char *id, uint64_t offset, uint32_t value) &quot;%s=
 offset: 0x%04&quot; PRIx64 &quot; value: 0x%08&quot; PRIx32<br>
+npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) &quot;%=
s offset: 0x%04&quot; PRIx64 &quot; value: 0x%08&quot; PRIx32<br>
+npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value,=
 uint32_t new_value) &quot;%s pwm[%u] Update Freq: old_freq: %u, new_freq: =
%u&quot;<br>
+npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value,=
 uint32_t new_value) &quot;%s pwm[%u] Update Duty: old_duty: %u, new_duty: =
%u&quot;<br>
+<br>
=C2=A0# stm32f4xx_syscfg.c<br>
=C2=A0stm32f4xx_syscfg_set_irq(int gpio, int line, int level) &quot;Interup=
t: GPIO: %d, Line: %d; Level: %d&quot;<br>
=C2=A0stm32f4xx_pulse_exti(int irq) &quot;Pulse EXTI: %d&quot;<br>
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h<br>
index 51e1c7620d..f6227aa8aa 100644<br>
--- a/include/hw/arm/npcm7xx.h<br>
+++ b/include/hw/arm/npcm7xx.h<br>
@@ -23,6 +23,7 @@<br>
=C2=A0#include &quot;hw/mem/npcm7xx_mc.h&quot;<br>
=C2=A0#include &quot;hw/misc/npcm7xx_clk.h&quot;<br>
=C2=A0#include &quot;hw/misc/npcm7xx_gcr.h&quot;<br>
+#include &quot;hw/misc/npcm7xx_pwm.h&quot;<br>
=C2=A0#include &quot;hw/misc/npcm7xx_rng.h&quot;<br>
=C2=A0#include &quot;hw/nvram/npcm7xx_otp.h&quot;<br>
=C2=A0#include &quot;hw/timer/npcm7xx_timer.h&quot;<br>
@@ -78,6 +79,7 @@ typedef struct NPCM7xxState {<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxCLKState=C2=A0 =C2=A0 =C2=A0clk;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxTimerCtrlState tim[3];<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxADCState=C2=A0 =C2=A0 =C2=A0adc;<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState=C2=A0 =C2=A0 =C2=A0pwm[2];<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxOTPState=C2=A0 =C2=A0 =C2=A0key_storage;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxOTPState=C2=A0 =C2=A0 =C2=A0fuse_array;<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxMCState=C2=A0 =C2=A0 =C2=A0 mc;<br>
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h<=
br>
new file mode 100644<br>
index 0000000000..b83f965f1a<br>
--- /dev/null<br>
+++ b/include/hw/misc/npcm7xx_pwm.h<br>
@@ -0,0 +1,106 @@<br>
+/*<br>
+ * Nuvoton NPCM7xx PWM Module<br>
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
+#ifndef NPCM7XX_PWM_H<br>
+#define NPCM7XX_PWM_H<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/clock.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+<br>
+/* Each PWM module holds 4 PWM channels. */<br>
+#define NPCM7XX_PWM_PER_MODULE 4<br>
+<br>
+/*<br>
+ * Number of registers in one pwm module. Don&#39;t change this without in=
creasing<br>
+ * the version_id in vmstate.<br>
+ */<br>
+#define NPCM7XX_PWM_NR_REGS (0x54 / sizeof(uint32_t))<br>
+<br>
+/*<br>
+ * The maximum duty values. Each duty unit represents 1/NPCM7XX_PWM_MAX_DU=
TY<br>
+ * cycles. For example, if NPCM7XX_PWM_MAX_DUTY=3D1,000,000 and a PWM has =
a duty<br>
+ * value of 100,000 the duty cycle for that PWM is 10%.<br>
+ */<br>
+#define NPCM7XX_PWM_MAX_DUTY 1000000<br>
+<br>
+typedef struct NPCM7xxPWMState NPCM7xxPWMState;<br>
+<br>
+/**<br>
+ * struct NPCM7xxPWM - The state of a single PWM channel.<br>
+ * @module: The PWM module that contains this channel.<br>
+ * @irq: GIC interrupt line to fire on expiration if enabled.<br>
+ * @running: Whether this PWM channel is generating output.<br>
+ * @inverted: Whether this PWM channel is inverted.<br>
+ * @index: The index of this PWM channel.<br>
+ * @cnr: The counter register.<br>
+ * @cmr: The comparator register.<br>
+ * @pdr: The data register.<br>
+ * @pwdr: The watchdog register.<br>
+ * @freq: The frequency of this PWM channel.<br>
+ * @duty: The duty cycle of this PWM channel. One unit represents<br>
+ *=C2=A0 =C2=A01/NPCM7XX_MAX_DUTY cycles.<br>
+ */<br>
+typedef struct NPCM7xxPWM {<br>
+=C2=A0 =C2=A0 NPCM7xxPWMState=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*module;<br=
>
+<br>
+=C2=A0 =C2=A0 qemu_irq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 irq;<br>
+<br>
+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 running;<br>
+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inverted;<br>
+<br>
+=C2=A0 =C2=A0 uint8_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0index;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cnr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cmr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pdr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pwdr;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 freq;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 duty;<br>
+} NPCM7xxPWM;<br>
+<br>
+/**<br>
+ * struct NPCM7xxPWMState - Pulse Width Modulation device state.<br>
+ * @parent: System bus device.<br>
+ * @iomem: Memory region through which registers are accessed.<br>
+ * @clock: The PWM clock.<br>
+ * @pwm: The PWM channels owned by this module.<br>
+ * @ppr: The prescaler register.<br>
+ * @csr: The clock selector register.<br>
+ * @pcr: The control register.<br>
+ * @pier: The interrupt enable register.<br>
+ * @piir: The interrupt indication register.<br>
+ */<br>
+struct NPCM7xxPWMState {<br>
+=C2=A0 =C2=A0 SysBusDevice parent;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 Clock=C2=A0 =C2=A0 =C2=A0 =C2=A0*clock;<br>
+=C2=A0 =C2=A0 NPCM7xxPWM pwm[NPCM7XX_PWM_PER_MODULE];<br>
+<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 ppr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 csr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 pcr;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 pier;<br>
+=C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 piir;<br>
+};<br>
+<br>
+#define TYPE_NPCM7XX_PWM &quot;npcm7xx-pwm&quot;<br>
+#define NPCM7XX_PWM(obj) \<br>
+=C2=A0 =C2=A0 OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)<br>
+<br>
+#endif /* NPCM7XX_PWM_H */<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--000000000000a1604e05b675ae49--

