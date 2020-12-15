Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E22DA4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:25:20 +0100 (CET)
Received: from localhost ([::1]:59994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koy9X-0003cN-Ff
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0r-000451-Dd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:22 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy0m-0003RW-Uo
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:21 -0500
Received: by mail-lf1-x144.google.com with SMTP id y19so34786811lfa.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NeSUOERHPPwGMWd1lrYsMYGVT2bhXxeOj9wSc6TEtzE=;
 b=FYY4TU+hoW7iINpb5UmYwpn8PkMBbH5/xlTD5v6EszHaCo1aDZBneMFVWxv83UCOdO
 sb+VgzJG1P/ukc72qazygGKjzfbQgfPmY1ZbTjDbOhdCmsPE4BinCyWIejSGj1w4/fPC
 vlT6E0EbtaPoIVHzT11rsAworwrwjxpxThXM6qt2N9KF7epB3TVOnGBrTnlPWsvS+3bU
 EIJRuOtJ5uwCZKz+/t+HzE1TAEuFkTLaRHcuv22qd+uiDw7+3LnBYbNjA/ipfy37JFTF
 i0Na2zY92o/e4VptgiFEwpFRQguX55md60h5q8uiuUQysRpz6XWxFfUpMqqPD2klt+QU
 VtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NeSUOERHPPwGMWd1lrYsMYGVT2bhXxeOj9wSc6TEtzE=;
 b=YnRh7aa7HjM2aa1cw9KZMN1Oj/KXL9E6l02njIjjviq9OlpTajjWKXNGf9Uf6dSB+E
 iSPSnjHaMmGpn5lI0Xj8uSsSXmMn071E6jjbr8/SrHdzZpkY1DvIw7dqk8D1AwfN/pzw
 jV/lvxyAd+Lp7vbHly0kUwRvkkzt+BnG+5LsiO8I/B2ZuVT2CtoSmHOa3109cFeFps3E
 pfNBBli7/hrLoY1Ok8b0qgxOhuIz8uRRJZ+BwBd1G32lL0R/WrVyv4UKiVm07s7ym4oG
 6lPxX3/wQ6MOQn74S2hwGV09MO7LWbdPb8akiKPn7ngGarLUJZAOM5AyH+/Sojwwr72U
 6n9g==
X-Gm-Message-State: AOAM5310OPI5ssRvrty1tcFU8n436pt7h7t7DAnEUTjVAEV7EXZnOGkd
 V9w7/nYWRIRx+Dc1nj6nnsIYZMr74Oqazml0qm7SBA==
X-Google-Smtp-Source: ABdhPJwG0HuxD0pu/c4aU9r/W/uVxpZgopwCay/+Ia2ps4kmmSvGMfGqKeY5m9P1RNUYEA7XkWgcRTFTLzqJPZYytxQ=
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr10508222lfn.545.1607991375084; 
 Mon, 14 Dec 2020 16:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-6-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-6-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:16:02 -0800
Message-ID: <CAGcCb12B+uqTCj1L4QtOuDwmvyRb6DZbbcWuwvz-9qfBfCN7vA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/misc: Add QTest for NPCM7XX PWM Module
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b73d8605b675aa63"
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000b73d8605b675aa63
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

> We add a qtest for the PWM in the previous patch. It proves it works as
> expected.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/meson.build        |   1 +
>  tests/qtest/npcm7xx_pwm-test.c | 490 +++++++++++++++++++++++++++++++++
>  2 files changed, 491 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 955710d1c5..0b5467f084 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -136,6 +136,7 @@ qtests_sparc64 = \
>  qtests_npcm7xx = \
>    ['npcm7xx_adc-test',
>     'npcm7xx_gpio-test',
> +   'npcm7xx_pwm-test',
>     'npcm7xx_rng-test',
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test']
> diff --git a/tests/qtest/npcm7xx_pwm-test.c
> b/tests/qtest/npcm7xx_pwm-test.c
> new file mode 100644
> index 0000000000..33fbdf5f54
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -0,0 +1,490 @@
> +/*
> + * QTests for Nuvoton NPCM7xx PWM Modules.
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
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qnum.h"
> +
> +#define REF_HZ          25000000
> +
> +/* Register field definitions. */
> +#define CH_EN           BIT(0)
> +#define CH_INV          BIT(2)
> +#define CH_MOD          BIT(3)
> +
> +/* Registers shared between all PWMs in a module */
> +#define PPR             0x00
> +#define CSR             0x04
> +#define PCR             0x08
> +#define PIER            0x3c
> +#define PIIR            0x40
> +
> +/* CLK module related */
> +#define CLK_BA          0xf0801000
> +#define CLKSEL          0x04
> +#define CLKDIV1         0x08
> +#define CLKDIV2         0x2c
> +#define PLLCON0         0x0c
> +#define PLLCON1         0x10
> +#define PLL_INDV(rv)    extract32((rv), 0, 6)
> +#define PLL_FBDV(rv)    extract32((rv), 16, 12)
> +#define PLL_OTDV1(rv)   extract32((rv), 8, 3)
> +#define PLL_OTDV2(rv)   extract32((rv), 13, 3)
> +#define APB3CKDIV(rv)   extract32((rv), 28, 2)
> +#define CLK2CKDIV(rv)   extract32((rv), 0, 1)
> +#define CLK4CKDIV(rv)   extract32((rv), 26, 2)
> +#define CPUCKSEL(rv)    extract32((rv), 0, 2)
> +
> +#define MAX_DUTY        1000000
> +
> +typedef struct PWMModule {
> +    int irq;
> +    uint64_t base_addr;
> +} PWMModule;
> +
> +typedef struct PWM {
> +    uint32_t cnr_offset;
> +    uint32_t cmr_offset;
> +    uint32_t pdr_offset;
> +    uint32_t pwdr_offset;
> +} PWM;
> +
> +typedef struct TestData {
> +    const PWMModule *module;
> +    const PWM *pwm;
> +} TestData;
> +
> +static const PWMModule pwm_module_list[] = {
> +    {
> +        .irq        = 93,
> +        .base_addr  = 0xf0103000
> +    },
> +    {
> +        .irq        = 94,
> +        .base_addr  = 0xf0104000
> +    }
> +};
> +
> +static const PWM pwm_list[] = {
> +    {
> +        .cnr_offset     = 0x0c,
> +        .cmr_offset     = 0x10,
> +        .pdr_offset     = 0x14,
> +        .pwdr_offset    = 0x44,
> +    },
> +    {
> +        .cnr_offset     = 0x18,
> +        .cmr_offset     = 0x1c,
> +        .pdr_offset     = 0x20,
> +        .pwdr_offset    = 0x48,
> +    },
> +    {
> +        .cnr_offset     = 0x24,
> +        .cmr_offset     = 0x28,
> +        .pdr_offset     = 0x2c,
> +        .pwdr_offset    = 0x4c,
> +    },
> +    {
> +        .cnr_offset     = 0x30,
> +        .cmr_offset     = 0x34,
> +        .pdr_offset     = 0x38,
> +        .pwdr_offset    = 0x50,
> +    },
> +};
> +
> +static const int ppr_base[] = { 0, 0, 8, 8 };
> +static const int csr_base[] = { 0, 4, 8, 12 };
> +static const int pcr_base[] = { 0, 8, 12, 16 };
> +
> +static const uint32_t ppr_list[] = {
> +    0,
> +    1,
> +    10,
> +    100,
> +    255, /* Max possible value. */
> +};
> +
> +static const uint32_t csr_list[] = {
> +    0,
> +    1,
> +    2,
> +    3,
> +    4, /* Max possible value. */
> +};
> +
> +static const uint32_t cnr_list[] = {
> +    0,
> +    1,
> +    50,
> +    100,
> +    150,
> +    200,
> +    1000,
> +    10000,
> +    65535, /* Max possible value. */
> +};
> +
> +static const uint32_t cmr_list[] = {
> +    0,
> +    1,
> +    10,
> +    50,
> +    100,
> +    150,
> +    200,
> +    1000,
> +    10000,
> +    65535, /* Max possible value. */
> +};
> +
> +/* Returns the index of the PWM module. */
> +static int pwm_module_index(const PWMModule *module)
> +{
> +    ptrdiff_t diff = module - pwm_module_list;
> +
> +    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
> +
> +    return diff;
> +}
> +
> +/* Returns the index of the PWM entry. */
> +static int pwm_index(const PWM *pwm)
> +{
> +    ptrdiff_t diff = pwm - pwm_list;
> +
> +    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
> +
> +    return diff;
> +}
> +
> +static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char
> *name)
> +{
> +    QDict *response;
> +
> +    g_test_message("Getting properties %s from %s", name, path);
> +    response = qtest_qmp(qts, "{ 'execute': 'qom-get',"
> +            " 'arguments': { 'path': %s, 'property': %s}}",
> +            path, name);
> +    /* The qom set message returns successfully. */
> +    g_assert_true(qdict_haskey(response, "return"));
> +    return qnum_get_uint(qobject_to(QNum, qdict_get(response, "return")));
> +}
> +
> +static uint64_t pwm_get_freq(QTestState *qts, int module_index, int
> pwm_index)
> +{
> +    char path[100];
> +    char name[100];
> +
> +    sprintf(path, "/machine/soc/pwm[%d]", module_index);
> +    sprintf(name, "freq[%d]", pwm_index);
> +
> +    return pwm_qom_get(qts, path, name);
> +}
> +
> +static uint64_t pwm_get_duty(QTestState *qts, int module_index, int
> pwm_index)
> +{
> +    char path[100];
> +    char name[100];
> +
> +    sprintf(path, "/machine/soc/pwm[%d]", module_index);
> +    sprintf(name, "duty[%d]", pwm_index);
> +
> +    return pwm_qom_get(qts, path, name);
> +}
> +
> +static uint32_t get_pll(uint32_t con)
> +{
> +    return REF_HZ * PLL_FBDV(con) / (PLL_INDV(con) * PLL_OTDV1(con)
> +            * PLL_OTDV2(con));
> +}
> +
> +static uint64_t read_pclk(QTestState *qts)
> +{
> +    uint64_t freq = REF_HZ;
> +    uint32_t clksel = qtest_readl(qts, CLK_BA + CLKSEL);
> +    uint32_t pllcon;
> +    uint32_t clkdiv1 = qtest_readl(qts, CLK_BA + CLKDIV1);
> +    uint32_t clkdiv2 = qtest_readl(qts, CLK_BA + CLKDIV2);
> +
> +    switch (CPUCKSEL(clksel)) {
> +    case 0:
> +        pllcon = qtest_readl(qts, CLK_BA + PLLCON0);
> +        freq = get_pll(pllcon);
> +        break;
> +    case 1:
> +        pllcon = qtest_readl(qts, CLK_BA + PLLCON1);
> +        freq = get_pll(pllcon);
> +        break;
> +    case 2:
> +        break;
> +    case 3:
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    freq >>= (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) +
> APB3CKDIV(clkdiv2));
> +
> +    return freq;
> +}
> +
> +static uint32_t pwm_selector(uint32_t csr)
> +{
> +    switch (csr) {
> +    case 0:
> +        return 2;
> +    case 1:
> +        return 4;
> +    case 2:
> +        return 8;
> +    case 3:
> +        return 16;
> +    case 4:
> +        return 1;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t
> csr,
> +        uint32_t cnr)
> +{
> +    return read_pclk(qts) / ((ppr + 1) * pwm_selector(csr) * (cnr + 1));
> +}
> +
> +static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool
> inverted)
> +{
> +    uint64_t duty;
> +
> +    if (cnr == 0) {
> +        /* PWM is stopped. */
> +        duty = 0;
> +    } else if (cmr >= cnr) {
> +        duty = MAX_DUTY;
> +    } else {
> +        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
> +    }
> +
> +    if (inverted) {
> +        duty = MAX_DUTY - duty;
> +    }
> +
> +    return duty;
> +}
> +
> +static uint32_t pwm_read(QTestState *qts, const TestData *td, unsigned
> offset)
> +{
> +    return qtest_readl(qts, td->module->base_addr + offset);
> +}
> +
> +static void pwm_write(QTestState *qts, const TestData *td, unsigned
> offset,
> +        uint32_t value)
> +{
> +    qtest_writel(qts, td->module->base_addr + offset, value);
> +}
> +
> +static uint32_t pwm_read_ppr(QTestState *qts, const TestData *td)
> +{
> +    return extract32(pwm_read(qts, td, PPR),
> ppr_base[pwm_index(td->pwm)], 8);
> +}
> +
> +static void pwm_write_ppr(QTestState *qts, const TestData *td, uint32_t
> value)
> +{
> +    pwm_write(qts, td, PPR, value << ppr_base[pwm_index(td->pwm)]);
> +}
> +
> +static uint32_t pwm_read_csr(QTestState *qts, const TestData *td)
> +{
> +    return extract32(pwm_read(qts, td, CSR),
> csr_base[pwm_index(td->pwm)], 3);
> +}
> +
> +static void pwm_write_csr(QTestState *qts, const TestData *td, uint32_t
> value)
> +{
> +    pwm_write(qts, td, CSR, value << csr_base[pwm_index(td->pwm)]);
> +}
> +
> +static uint32_t pwm_read_pcr(QTestState *qts, const TestData *td)
> +{
> +    return extract32(pwm_read(qts, td, PCR),
> pcr_base[pwm_index(td->pwm)], 4);
> +}
> +
> +static void pwm_write_pcr(QTestState *qts, const TestData *td, uint32_t
> value)
> +{
> +    pwm_write(qts, td, PCR, value << pcr_base[pwm_index(td->pwm)]);
> +}
> +
> +static uint32_t pwm_read_cnr(QTestState *qts, const TestData *td)
> +{
> +    return pwm_read(qts, td, td->pwm->cnr_offset);
> +}
> +
> +static void pwm_write_cnr(QTestState *qts, const TestData *td, uint32_t
> value)
> +{
> +    pwm_write(qts, td, td->pwm->cnr_offset, value);
> +}
> +
> +static uint32_t pwm_read_cmr(QTestState *qts, const TestData *td)
> +{
> +    return pwm_read(qts, td, td->pwm->cmr_offset);
> +}
> +
> +static void pwm_write_cmr(QTestState *qts, const TestData *td, uint32_t
> value)
> +{
> +    pwm_write(qts, td, td->pwm->cmr_offset, value);
> +}
> +
> +/* Check pwm registers can be reset to default value */
> +static void test_init(gconstpointer test_data)
> +{
> +    const TestData *td = test_data;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    int module = pwm_module_index(td->module);
> +    int pwm = pwm_index(td->pwm);
> +
> +    g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
> +    g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +/* One-shot mode should not change frequency and duty cycle. */
> +static void test_oneshot(gconstpointer test_data)
> +{
> +    const TestData *td = test_data;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    int module = pwm_module_index(td->module);
> +    int pwm = pwm_index(td->pwm);
> +    uint32_t ppr, csr, pcr;
> +    int i, j;
> +
> +    pcr = CH_EN;
> +    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
> +        ppr = ppr_list[i];
> +        pwm_write_ppr(qts, td, ppr);
> +
> +        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
> +            csr = csr_list[j];
> +            pwm_write_csr(qts, td, csr);
> +            pwm_write_pcr(qts, td, pcr);
> +
> +            g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
> +            g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
> +            g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
> +            g_assert_cmpuint(pwm_get_freq(qts, module, pwm), ==, 0);
> +            g_assert_cmpuint(pwm_get_duty(qts, module, pwm), ==, 0);
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +/* In toggle mode, the PWM generates correct outputs. */
> +static void test_toggle(gconstpointer test_data)
> +{
> +    const TestData *td = test_data;
> +    QTestState *qts = qtest_init("-machine quanta-gsj");
> +    int module = pwm_module_index(td->module);
> +    int pwm = pwm_index(td->pwm);
> +    uint32_t ppr, csr, pcr, cnr, cmr;
> +    int i, j, k, l;
> +    uint64_t expected_freq, expected_duty;
> +
> +    pcr = CH_EN | CH_MOD;
> +    for (i = 0; i < ARRAY_SIZE(ppr_list); ++i) {
> +        ppr = ppr_list[i];
> +        pwm_write_ppr(qts, td, ppr);
> +
> +        for (j = 0; j < ARRAY_SIZE(csr_list); ++j) {
> +            csr = csr_list[j];
> +            pwm_write_csr(qts, td, csr);
> +
> +            for (k = 0; k < ARRAY_SIZE(cnr_list); ++k) {
> +                cnr = cnr_list[k];
> +                pwm_write_cnr(qts, td, cnr);
> +
> +                for (l = 0; l < ARRAY_SIZE(cmr_list); ++l) {
> +                    cmr = cmr_list[l];
> +                    pwm_write_cmr(qts, td, cmr);
> +                    expected_freq = pwm_compute_freq(qts, ppr, csr, cnr);
> +                    expected_duty = pwm_compute_duty(cnr, cmr, false);
> +
> +                    pwm_write_pcr(qts, td, pcr);
> +                    g_assert_cmpuint(pwm_read_ppr(qts, td), ==, ppr);
> +                    g_assert_cmpuint(pwm_read_csr(qts, td), ==, csr);
> +                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr);
> +                    g_assert_cmpuint(pwm_read_cnr(qts, td), ==, cnr);
> +                    g_assert_cmpuint(pwm_read_cmr(qts, td), ==, cmr);
> +                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
> +                            ==, expected_duty);
> +                    if (expected_duty != 0 && expected_duty != 100) {
> +                        /* Duty cycle with 0 or 100 doesn't need
> frequency. */
> +                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
> +                                ==, expected_freq);
> +                    }
> +
> +                    /* Test inverted mode */
> +                    expected_duty = pwm_compute_duty(cnr, cmr, true);
> +                    pwm_write_pcr(qts, td, pcr | CH_INV);
> +                    g_assert_cmpuint(pwm_read_pcr(qts, td), ==, pcr |
> CH_INV);
> +                    g_assert_cmpuint(pwm_get_duty(qts, module, pwm),
> +                            ==, expected_duty);
> +                    if (expected_duty != 0 && expected_duty != 100) {
> +                        /* Duty cycle with 0 or 100 doesn't need
> frequency. */
> +                        g_assert_cmpuint(pwm_get_freq(qts, module, pwm),
> +                                ==, expected_freq);
> +                    }
> +
> +                }
> +            }
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void pwm_add_test(const char *name, const TestData* td,
> +        GTestDataFunc fn)
> +{
> +    g_autofree char *full_name = g_strdup_printf(
> +            "npcm7xx_pwm/module[%d]/pwm[%d]/%s",
> pwm_module_index(td->module),
> +            pwm_index(td->pwm), name);
> +    qtest_add_data_func(full_name, td, fn);
> +}
> +#define add_test(name, td) pwm_add_test(#name, td, test_##name)
> +
> +int main(int argc, char **argv)
> +{
> +    TestData test_data_list[ARRAY_SIZE(pwm_module_list) *
> ARRAY_SIZE(pwm_list)];
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    for (int i = 0; i < ARRAY_SIZE(pwm_module_list); ++i) {
> +        for (int j = 0; j < ARRAY_SIZE(pwm_list); ++j) {
> +            TestData *td = &test_data_list[i * ARRAY_SIZE(pwm_list) + j];
> +
> +            td->module = &pwm_module_list[i];
> +            td->pwm = &pwm_list[j];
> +
> +            add_test(init, td);
> +            add_test(oneshot, td);
> +            add_test(toggle, td);
> +        }
> +    }
> +
> +    return g_test_run();
> +}
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--000000000000b73d8605b675aa63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:1=
3 PM Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wu=
haotsh@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">We add a qtest for the PWM in the previous patch. It prove=
s it works as<br>
expected.<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<=
br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c | 490 ++++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 491 insertions(+)<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_pwm-test.c<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 955710d1c5..0b5467f084 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -136,6 +136,7 @@ qtests_sparc64 =3D \<br>
=C2=A0qtests_npcm7xx =3D \<br>
=C2=A0 =C2=A0[&#39;npcm7xx_adc-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_gpio-test&#39;,<br>
+=C2=A0 =C2=A0&#39;npcm7xx_pwm-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_rng-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_timer-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_watchdog_timer-test&#39;]<br>
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.=
c<br>
new file mode 100644<br>
index 0000000000..33fbdf5f54<br>
--- /dev/null<br>
+++ b/tests/qtest/npcm7xx_pwm-test.c<br>
@@ -0,0 +1,490 @@<br>
+/*<br>
+ * QTests for Nuvoton NPCM7xx PWM Modules.<br>
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
+#include &quot;libqos/libqtest.h&quot;<br>
+#include &quot;qapi/qmp/qdict.h&quot;<br>
+#include &quot;qapi/qmp/qnum.h&quot;<br>
+<br>
+#define REF_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 25000000<br>
+<br>
+/* Register field definitions. */<br>
+#define CH_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br>
+#define CH_INV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
+#define CH_MOD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(3)<br>
+<br>
+/* Registers shared between all PWMs in a module */<br>
+#define PPR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
+#define CSR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04<br>
+#define PCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
+#define PIER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3c<br>
+#define PIIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x40<br>
+<br>
+/* CLK module related */<br>
+#define CLK_BA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xf0801000<br>
+#define CLKSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
+#define CLKDIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
+#define CLKDIV2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2c<br>
+#define PLLCON0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0c<br>
+#define PLLCON1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10<br>
+#define PLL_INDV(rv)=C2=A0 =C2=A0 extract32((rv), 0, 6)<br>
+#define PLL_FBDV(rv)=C2=A0 =C2=A0 extract32((rv), 16, 12)<br>
+#define PLL_OTDV1(rv)=C2=A0 =C2=A0extract32((rv), 8, 3)<br>
+#define PLL_OTDV2(rv)=C2=A0 =C2=A0extract32((rv), 13, 3)<br>
+#define APB3CKDIV(rv)=C2=A0 =C2=A0extract32((rv), 28, 2)<br>
+#define CLK2CKDIV(rv)=C2=A0 =C2=A0extract32((rv), 0, 1)<br>
+#define CLK4CKDIV(rv)=C2=A0 =C2=A0extract32((rv), 26, 2)<br>
+#define CPUCKSEL(rv)=C2=A0 =C2=A0 extract32((rv), 0, 2)<br>
+<br>
+#define MAX_DUTY=C2=A0 =C2=A0 =C2=A0 =C2=A0 1000000<br>
+<br>
+typedef struct PWMModule {<br>
+=C2=A0 =C2=A0 int irq;<br>
+=C2=A0 =C2=A0 uint64_t base_addr;<br>
+} PWMModule;<br>
+<br>
+typedef struct PWM {<br>
+=C2=A0 =C2=A0 uint32_t cnr_offset;<br>
+=C2=A0 =C2=A0 uint32_t cmr_offset;<br>
+=C2=A0 =C2=A0 uint32_t pdr_offset;<br>
+=C2=A0 =C2=A0 uint32_t pwdr_offset;<br>
+} PWM;<br>
+<br>
+typedef struct TestData {<br>
+=C2=A0 =C2=A0 const PWMModule *module;<br>
+=C2=A0 =C2=A0 const PWM *pwm;<br>
+} TestData;<br>
+<br>
+static const PWMModule pwm_module_list[] =3D {<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 93,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base_addr=C2=A0 =3D 0xf0103000<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .irq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 94,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .base_addr=C2=A0 =3D 0xf0104000<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static const PWM pwm_list[] =3D {<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cnr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x0c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pdr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x14,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pwdr_offset=C2=A0 =C2=A0 =3D 0x44,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cnr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x18,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x1c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pdr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x20,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pwdr_offset=C2=A0 =C2=A0 =3D 0x48,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cnr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x28,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pdr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x2c,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pwdr_offset=C2=A0 =C2=A0 =3D 0x4c,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cnr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x34,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pdr_offset=C2=A0 =C2=A0 =C2=A0=3D 0x38,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pwdr_offset=C2=A0 =C2=A0 =3D 0x50,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const int ppr_base[] =3D { 0, 0, 8, 8 };<br>
+static const int csr_base[] =3D { 0, 4, 8, 12 };<br>
+static const int pcr_base[] =3D { 0, 8, 12, 16 };<br>
+<br>
+static const uint32_t ppr_list[] =3D {<br>
+=C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 10,<br>
+=C2=A0 =C2=A0 100,<br>
+=C2=A0 =C2=A0 255, /* Max possible value. */<br>
+};<br>
+<br>
+static const uint32_t csr_list[] =3D {<br>
+=C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 2,<br>
+=C2=A0 =C2=A0 3,<br>
+=C2=A0 =C2=A0 4, /* Max possible value. */<br>
+};<br>
+<br>
+static const uint32_t cnr_list[] =3D {<br>
+=C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 50,<br>
+=C2=A0 =C2=A0 100,<br>
+=C2=A0 =C2=A0 150,<br>
+=C2=A0 =C2=A0 200,<br>
+=C2=A0 =C2=A0 1000,<br>
+=C2=A0 =C2=A0 10000,<br>
+=C2=A0 =C2=A0 65535, /* Max possible value. */<br>
+};<br>
+<br>
+static const uint32_t cmr_list[] =3D {<br>
+=C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 10,<br>
+=C2=A0 =C2=A0 50,<br>
+=C2=A0 =C2=A0 100,<br>
+=C2=A0 =C2=A0 150,<br>
+=C2=A0 =C2=A0 200,<br>
+=C2=A0 =C2=A0 1000,<br>
+=C2=A0 =C2=A0 10000,<br>
+=C2=A0 =C2=A0 65535, /* Max possible value. */<br>
+};<br>
+<br>
+/* Returns the index of the PWM module. */<br>
+static int pwm_module_index(const PWMModule *module)<br>
+{<br>
+=C2=A0 =C2=A0 ptrdiff_t diff =3D module - pwm_module_list;<br>
+<br>
+=C2=A0 =C2=A0 g_assert_true(diff &gt;=3D 0 &amp;&amp; diff &lt; ARRAY_SIZE=
(pwm_module_list));<br>
+<br>
+=C2=A0 =C2=A0 return diff;<br>
+}<br>
+<br>
+/* Returns the index of the PWM entry. */<br>
+static int pwm_index(const PWM *pwm)<br>
+{<br>
+=C2=A0 =C2=A0 ptrdiff_t diff =3D pwm - pwm_list;<br>
+<br>
+=C2=A0 =C2=A0 g_assert_true(diff &gt;=3D 0 &amp;&amp; diff &lt; ARRAY_SIZE=
(pwm_list));<br>
+<br>
+=C2=A0 =C2=A0 return diff;<br>
+}<br>
+<br>
+static uint64_t pwm_qom_get(QTestState *qts, const char *path, const char =
*name)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *response;<br>
+<br>
+=C2=A0 =C2=A0 g_test_message(&quot;Getting properties %s from %s&quot;, na=
me, path);<br>
+=C2=A0 =C2=A0 response =3D qtest_qmp(qts, &quot;{ &#39;execute&#39;: &#39;=
qom-get&#39;,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; &#39;arguments&#39;: { &#=
39;path&#39;: %s, &#39;property&#39;: %s}}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path, name);<br>
+=C2=A0 =C2=A0 /* The qom set message returns successfully. */<br>
+=C2=A0 =C2=A0 g_assert_true(qdict_haskey(response, &quot;return&quot;));<b=
r>
+=C2=A0 =C2=A0 return qnum_get_uint(qobject_to(QNum, qdict_get(response, &q=
uot;return&quot;)));<br>
+}<br>
+<br>
+static uint64_t pwm_get_freq(QTestState *qts, int module_index, int pwm_in=
dex)<br>
+{<br>
+=C2=A0 =C2=A0 char path[100];<br>
+=C2=A0 =C2=A0 char name[100];<br>
+<br>
+=C2=A0 =C2=A0 sprintf(path, &quot;/machine/soc/pwm[%d]&quot;, module_index=
);<br>
+=C2=A0 =C2=A0 sprintf(name, &quot;freq[%d]&quot;, pwm_index);<br>
+<br>
+=C2=A0 =C2=A0 return pwm_qom_get(qts, path, name);<br>
+}<br>
+<br>
+static uint64_t pwm_get_duty(QTestState *qts, int module_index, int pwm_in=
dex)<br>
+{<br>
+=C2=A0 =C2=A0 char path[100];<br>
+=C2=A0 =C2=A0 char name[100];<br>
+<br>
+=C2=A0 =C2=A0 sprintf(path, &quot;/machine/soc/pwm[%d]&quot;, module_index=
);<br>
+=C2=A0 =C2=A0 sprintf(name, &quot;duty[%d]&quot;, pwm_index);<br>
+<br>
+=C2=A0 =C2=A0 return pwm_qom_get(qts, path, name);<br>
+}<br>
+<br>
+static uint32_t get_pll(uint32_t con)<br>
+{<br>
+=C2=A0 =C2=A0 return REF_HZ * PLL_FBDV(con) / (PLL_INDV(con) * PLL_OTDV1(c=
on)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * PLL_OTDV2(con));<br>
+}<br>
+<br>
+static uint64_t read_pclk(QTestState *qts)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t freq =3D REF_HZ;<br>
+=C2=A0 =C2=A0 uint32_t clksel =3D qtest_readl(qts, CLK_BA + CLKSEL);<br>
+=C2=A0 =C2=A0 uint32_t pllcon;<br>
+=C2=A0 =C2=A0 uint32_t clkdiv1 =3D qtest_readl(qts, CLK_BA + CLKDIV1);<br>
+=C2=A0 =C2=A0 uint32_t clkdiv2 =3D qtest_readl(qts, CLK_BA + CLKDIV2);<br>
+<br>
+=C2=A0 =C2=A0 switch (CPUCKSEL(clksel)) {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pllcon =3D qtest_readl(qts, CLK_BA + PLLCON0);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq =3D get_pll(pllcon);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pllcon =3D qtest_readl(qts, CLK_BA + PLLCON1);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq =3D get_pll(pllcon);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 freq &gt;&gt;=3D (CLK2CKDIV(clkdiv1) + CLK4CKDIV(clkdiv1) + =
APB3CKDIV(clkdiv2));<br>
+<br>
+=C2=A0 =C2=A0 return freq;<br>
+}<br>
+<br>
+static uint32_t pwm_selector(uint32_t csr)<br>
+{<br>
+=C2=A0 =C2=A0 switch (csr) {<br>
+=C2=A0 =C2=A0 case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2;<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 4;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 8;<br>
+=C2=A0 =C2=A0 case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 16;<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t pwm_compute_freq(QTestState *qts, uint32_t ppr, uint32_t c=
sr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t cnr)<br>
+{<br>
+=C2=A0 =C2=A0 return read_pclk(qts) / ((ppr + 1) * pwm_selector(csr) * (cn=
r + 1));<br>
+}<br>
+<br>
+static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted=
)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t duty;<br>
+<br>
+=C2=A0 =C2=A0 if (cnr =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PWM is stopped. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D 0;<br>
+=C2=A0 =C2=A0 } else if (cmr &gt;=3D cnr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D MAX_DUTY;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D MAX_DUTY * (cmr + 1) / (cnr + 1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (inverted) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 duty =3D MAX_DUTY - duty;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return duty;<br>
+}<br>
+<br>
+static uint32_t pwm_read(QTestState *qts, const TestData *td, unsigned off=
set)<br>
+{<br>
+=C2=A0 =C2=A0 return qtest_readl(qts, td-&gt;module-&gt;base_addr + offset=
);<br>
+}<br>
+<br>
+static void pwm_write(QTestState *qts, const TestData *td, unsigned offset=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 qtest_writel(qts, td-&gt;module-&gt;base_addr + offset, valu=
e);<br>
+}<br>
+<br>
+static uint32_t pwm_read_ppr(QTestState *qts, const TestData *td)<br>
+{<br>
+=C2=A0 =C2=A0 return extract32(pwm_read(qts, td, PPR), ppr_base[pwm_index(=
td-&gt;pwm)], 8);<br>
+}<br>
+<br>
+static void pwm_write_ppr(QTestState *qts, const TestData *td, uint32_t va=
lue)<br>
+{<br>
+=C2=A0 =C2=A0 pwm_write(qts, td, PPR, value &lt;&lt; ppr_base[pwm_index(td=
-&gt;pwm)]);<br>
+}<br>
+<br>
+static uint32_t pwm_read_csr(QTestState *qts, const TestData *td)<br>
+{<br>
+=C2=A0 =C2=A0 return extract32(pwm_read(qts, td, CSR), csr_base[pwm_index(=
td-&gt;pwm)], 3);<br>
+}<br>
+<br>
+static void pwm_write_csr(QTestState *qts, const TestData *td, uint32_t va=
lue)<br>
+{<br>
+=C2=A0 =C2=A0 pwm_write(qts, td, CSR, value &lt;&lt; csr_base[pwm_index(td=
-&gt;pwm)]);<br>
+}<br>
+<br>
+static uint32_t pwm_read_pcr(QTestState *qts, const TestData *td)<br>
+{<br>
+=C2=A0 =C2=A0 return extract32(pwm_read(qts, td, PCR), pcr_base[pwm_index(=
td-&gt;pwm)], 4);<br>
+}<br>
+<br>
+static void pwm_write_pcr(QTestState *qts, const TestData *td, uint32_t va=
lue)<br>
+{<br>
+=C2=A0 =C2=A0 pwm_write(qts, td, PCR, value &lt;&lt; pcr_base[pwm_index(td=
-&gt;pwm)]);<br>
+}<br>
+<br>
+static uint32_t pwm_read_cnr(QTestState *qts, const TestData *td)<br>
+{<br>
+=C2=A0 =C2=A0 return pwm_read(qts, td, td-&gt;pwm-&gt;cnr_offset);<br>
+}<br>
+<br>
+static void pwm_write_cnr(QTestState *qts, const TestData *td, uint32_t va=
lue)<br>
+{<br>
+=C2=A0 =C2=A0 pwm_write(qts, td, td-&gt;pwm-&gt;cnr_offset, value);<br>
+}<br>
+<br>
+static uint32_t pwm_read_cmr(QTestState *qts, const TestData *td)<br>
+{<br>
+=C2=A0 =C2=A0 return pwm_read(qts, td, td-&gt;pwm-&gt;cmr_offset);<br>
+}<br>
+<br>
+static void pwm_write_cmr(QTestState *qts, const TestData *td, uint32_t va=
lue)<br>
+{<br>
+=C2=A0 =C2=A0 pwm_write(qts, td, td-&gt;pwm-&gt;cmr_offset, value);<br>
+}<br>
+<br>
+/* Check pwm registers can be reset to default value */<br>
+static void test_init(gconstpointer test_data)<br>
+{<br>
+=C2=A0 =C2=A0 const TestData *td =3D test_data;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 int module =3D pwm_module_index(td-&gt;module);<br>
+=C2=A0 =C2=A0 int pwm =3D pwm_index(td-&gt;pwm);<br>
+<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(pwm_get_freq(qts, module, pwm), =3D=3D, 0);=
<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(pwm_get_duty(qts, module, pwm), =3D=3D, 0);=
<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* One-shot mode should not change frequency and duty cycle. */<br>
+static void test_oneshot(gconstpointer test_data)<br>
+{<br>
+=C2=A0 =C2=A0 const TestData *td =3D test_data;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 int module =3D pwm_module_index(td-&gt;module);<br>
+=C2=A0 =C2=A0 int pwm =3D pwm_index(td-&gt;pwm);<br>
+=C2=A0 =C2=A0 uint32_t ppr, csr, pcr;<br>
+=C2=A0 =C2=A0 int i, j;<br>
+<br>
+=C2=A0 =C2=A0 pcr =3D CH_EN;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(ppr_list); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppr =3D ppr_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_ppr(qts, td, ppr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; ARRAY_SIZE(csr_list); ++j=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csr =3D csr_list[j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_csr(qts, td, csr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_pcr(qts, td, pcr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(pwm_read_ppr(qt=
s, td), =3D=3D, ppr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(pwm_read_csr(qt=
s, td), =3D=3D, csr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(pwm_read_pcr(qt=
s, td), =3D=3D, pcr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(pwm_get_freq(qt=
s, module, pwm), =3D=3D, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(pwm_get_duty(qt=
s, module, pwm), =3D=3D, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* In toggle mode, the PWM generates correct outputs. */<br>
+static void test_toggle(gconstpointer test_data)<br>
+{<br>
+=C2=A0 =C2=A0 const TestData *td =3D test_data;<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine quanta-gsj&quo=
t;);<br>
+=C2=A0 =C2=A0 int module =3D pwm_module_index(td-&gt;module);<br>
+=C2=A0 =C2=A0 int pwm =3D pwm_index(td-&gt;pwm);<br>
+=C2=A0 =C2=A0 uint32_t ppr, csr, pcr, cnr, cmr;<br>
+=C2=A0 =C2=A0 int i, j, k, l;<br>
+=C2=A0 =C2=A0 uint64_t expected_freq, expected_duty;<br>
+<br>
+=C2=A0 =C2=A0 pcr =3D CH_EN | CH_MOD;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(ppr_list); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ppr =3D ppr_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_ppr(qts, td, ppr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; ARRAY_SIZE(csr_list); ++j=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csr =3D csr_list[j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_csr(qts, td, csr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (k =3D 0; k &lt; ARRAY_SIZE(=
cnr_list); ++k) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cnr =3D cnr_list[k=
];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_write_cnr(qts,=
 td, cnr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (l =3D 0; l &l=
t; ARRAY_SIZE(cmr_list); ++l) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmr =
=3D cmr_list[l];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_=
write_cmr(qts, td, cmr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expe=
cted_freq =3D pwm_compute_freq(qts, ppr, csr, cnr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expe=
cted_duty =3D pwm_compute_duty(cnr, cmr, false);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_=
write_pcr(qts, td, pcr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_ppr(qts, td), =3D=3D, ppr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_csr(qts, td), =3D=3D, csr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_pcr(qts, td), =3D=3D, pcr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_cnr(qts, td), =3D=3D, cnr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_cmr(qts, td), =3D=3D, cmr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_get_duty(qts, module, pwm),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D, expected_duty);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
expected_duty !=3D 0 &amp;&amp; expected_duty !=3D 100) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Duty cycle with 0 or 100 doesn&#39;t need frequency. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_assert_cmpuint(pwm_get_freq(qts, module, pwm),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D, expected_freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* T=
est inverted mode */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expe=
cted_duty =3D pwm_compute_duty(cnr, cmr, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_=
write_pcr(qts, td, pcr | CH_INV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_read_pcr(qts, td), =3D=3D, pcr | CH_INV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_as=
sert_cmpuint(pwm_get_duty(qts, module, pwm),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D, expected_duty);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
expected_duty !=3D 0 &amp;&amp; expected_duty !=3D 100) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Duty cycle with 0 or 100 doesn&#39;t need frequency. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 g_assert_cmpuint(pwm_get_freq(qts, module, pwm),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D, expected_freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+static void pwm_add_test(const char *name, const TestData* td,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GTestDataFunc fn)<br>
+{<br>
+=C2=A0 =C2=A0 g_autofree char *full_name =3D g_strdup_printf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;npcm7xx_pwm/module[%d]/pwm=
[%d]/%s&quot;, pwm_module_index(td-&gt;module),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm_index(td-&gt;pwm), name);<br=
>
+=C2=A0 =C2=A0 qtest_add_data_func(full_name, td, fn);<br>
+}<br>
+#define add_test(name, td) pwm_add_test(#name, td, test_##name)<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 TestData test_data_list[ARRAY_SIZE(pwm_module_list) * ARRAY_=
SIZE(pwm_list)];<br>
+<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; ARRAY_SIZE(pwm_module_list); ++i) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int j =3D 0; j &lt; ARRAY_SIZE(pwm_list);=
 ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TestData *td =3D &amp;test_data_=
list[i * ARRAY_SIZE(pwm_list) + j];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 td-&gt;module =3D &amp;pwm_modul=
e_list[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 td-&gt;pwm =3D &amp;pwm_list[j];=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_test(init, td);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_test(oneshot, td);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_test(toggle, td);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return g_test_run();<br>
+}<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--000000000000b73d8605b675aa63--

