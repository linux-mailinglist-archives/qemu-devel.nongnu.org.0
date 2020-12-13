Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76E2D8CFD
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 13:07:54 +0100 (CET)
Received: from localhost ([::1]:51648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koQAL-0001GT-4f
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 07:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQ4T-00072A-05; Sun, 13 Dec 2020 07:01:49 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koQ4P-0006cO-PV; Sun, 13 Dec 2020 07:01:48 -0500
Received: by mail-wr1-x444.google.com with SMTP id d26so387286wrb.12;
 Sun, 13 Dec 2020 04:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WTsxIAG8eX/NKZi+2+fUwCycfOKBsWAlc6gACcKR4PM=;
 b=nxvFUskdi62/5kWMjHYkLoRnye8rW5tNPmMh6nlwyyH9L7nXlIsf5Z7FwSGCFIc8Et
 Vz7Ko7cAjFJybQFBCz4rwlnB0LFmg5bmM8HuwQkCxSkpWOREtKclolvIMvfErqtIIa+K
 aWBLxQh3ENRqJ3mF9gaaofFgBylJu+nmWssv4QfqZniG8viTNY+uFNibaSPF4f3kvoAM
 Ong3FribUDSzhl9sXzXpuVabDQncQUOCLocsuWaQQIC1hJOuTWRWlv+0dL/XPbANyj13
 tz9/kUhailMPDgocx1VblwUTpj6QPAFkPgP23fRtnPFN4dq/wjav9F65BNGRTcJIHIpf
 2Dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTsxIAG8eX/NKZi+2+fUwCycfOKBsWAlc6gACcKR4PM=;
 b=ll9OoyXLfObFXCZZfVN1lj5rqYh70X5IyF2f5OAg4k1AHX0qf+6FiJN18ucpwh5+8l
 +SZOtPjP/r6dFv2swE+ci7eKH3D/4VU/EoPTwQU9kVxJCYN1l1jE5FpZmopYSsmcZ4aM
 SpjTggjwL4a/oIQ9D+uhCe2cz5EVqWD5VrW1i7cbrvDS64ha4TySZiFxtkf87iz+WgP+
 U13i/LqxTkRffx5ddpwCu033IPJc2aYEnfyGPKxOdlKM1lDeJHsVDwc8JvPSG0n19OyF
 HJ/w6dkgFipByFg6763GVO/UclSdw4jUjcMmJ6GnQCxs7lXHITjvIDkxA2Nrse7r2fab
 ti2g==
X-Gm-Message-State: AOAM530P+QSwV4OdGCdsB/1MIRV4Ao/i1H54EEetT0aY5OqrANWuGfsq
 vt+4e250Mr7kY+UCk1Mpovk=
X-Google-Smtp-Source: ABdhPJxEfgbJu6wV71FvSMS/1oT9iRz5LlMNsAgjO3klM1hQrZZPCA+AxFyzXhGmoyeano5PumgXTQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr23381011wre.78.1607860903454; 
 Sun, 13 Dec 2020 04:01:43 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z13sm27885432wmz.3.2020.12.13.04.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 04:01:42 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/misc: Add a PWM module for NPCM7XX
To: Hao Wu <wuhaotsh@google.com>
References: <20201211222223.2252172-1-wuhaotsh@google.com>
 <20201211222223.2252172-5-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9daa820-9fa4-668b-dd7c-db0fa1c5b3cf@amsat.org>
Date: Sun, 13 Dec 2020 13:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201211222223.2252172-5-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, minyard@acm.org, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 11:22 PM, Hao Wu via wrote:
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
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/arm/npcm7xx.c               |  26 +-
>  hw/misc/meson.build            |   1 +
>  hw/misc/npcm7xx_pwm.c          | 535 +++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/misc/npcm7xx_pwm.h  | 106 +++++++
>  tests/qtest/meson.build        |   1 +
>  tests/qtest/npcm7xx_pwm-test.c | 490 ++++++++++++++++++++++++++++++
>  8 files changed, 1160 insertions(+), 3 deletions(-)

As this patch is quite big, maybe add the test after the model?

...
> +++ b/hw/misc/npcm7xx_pwm.c
> @@ -0,0 +1,535 @@
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
> + * This program is distributed in the hope that it will be useful, but WITHOUT
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
> +#define NPCM7XX_PPR(rv, index)      extract32((rv), npcm7xx_ppr_base[index], 8)
> +#define NPCM7XX_CSR(rv, index)      extract32((rv), npcm7xx_csr_base[index], 3)
> +#define NPCM7XX_CH(rv, index)       extract32((rv), npcm7xx_ch_base[index], 4)
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

Can you add a trace event here? Passing the unit as parameter
would allow to display it in the traced event.

Alternatively you can introduce:

...pwm_update_freq(pwm, index)
{
    freq = npcm7xx_pwm_calculate_freq(&s->pwm[i]);
    if (freq != s->pwm[i].freq) {
      trace_..pwm_freq_updated(i, s->pwm[i].freq, freq);
      s->pwm[i].freq = freq;
    }
}

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

Ditto, trace event and pwm_update_duty().

> +    return duty;
> +}
> +
> +static void npcm7xx_pwm_calculate_output(NPCM7xxPWM *p)
> +{
> +    p->freq = npcm7xx_pwm_calculate_freq(p);
> +    p->duty = npcm7xx_pwm_calculate_duty(p);
> +}
...

Rest looks good (not looking at the test yet).

Similar comment than previous ADC patch, at some point I'd like
to introduce a common PWM interface to produce DSP sources.

Regards,

Phil.

