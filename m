Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604702DA49B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:19:22 +0100 (CET)
Received: from localhost ([::1]:47062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koy3k-0006aR-6x
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1L-0004Vx-Rr
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:52 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1koy1E-0003WE-6p
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 19:16:51 -0500
Received: by mail-lf1-x12f.google.com with SMTP id a9so34842294lfh.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 16:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zBXr3/8yAs5hDSc6OAE7yfGBvM5aGuO8/5BaViWbv8=;
 b=PGVk2cQuILPBIhBNC6wyOEynk+PNi+V3S+5hPDcPf6JPuuMq57ewMs5OE3fTWsmg8I
 st6M/PtOMqdTMTheSidFdmCag+MiBbh1bvKxelHmF1vLaDRkd+VFML1YhU4b0av0oBCx
 ZOK6hiYvitR44bks5Qe7AOF1LoJyfpsBNpuzAchrbmENG0eS4Uzw7xuEyjl3wWCNNSf2
 c70eiTU4s65H2gCB6z2BJKvaK/wBlKR9aYotZP8reiVESVjC3AtvxOp9YfQaOhUqhjgY
 VPdgSVwkR7r4zX0cXfIEchBp/wJthLkUjE/qU87j8qXLioK6wQRFMGxEt2VC9xW6CMIm
 r9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zBXr3/8yAs5hDSc6OAE7yfGBvM5aGuO8/5BaViWbv8=;
 b=JIwZlOshZ6Ix8BPZjt1j7bg035aZVyPT/YDj+aFs2NnY2uGMrdATi+NEUe8V302YOZ
 IRma1x8R4DKIPUVCNOgnYaBJwY6sHnad7XW9yRxWOJUNy8mhj4wuWEOhrdudjimYbYJG
 p3Gi4tDlWyMX9vtgMccsqFllo4+kwPubZDxCNAzVfbv/n8jF2LarKbOTqzqrFtUrozp5
 ssXP1g7VmQQorpLjeVFWKNVchvXj8PmjqLLw95ESjAYcZhAg3Q8Lko2Vj6mdy09eMLxy
 fXRcvCHP0jSteNX/el5EICH6ik9cAFWBeLeH02XMg44sCbvZysK7qCMKoR0RFYc4NgtM
 5YEA==
X-Gm-Message-State: AOAM530EdGRltp0ca38U0rg78mQWSP4iX9aZE0ypy/SVytiHTyLJJyC3
 o2Rz1o5d/ZfO3ZS7wBNxSfeBmwOHKE+x1DCnzcmsnQ==
X-Google-Smtp-Source: ABdhPJz+Ay9bijnyUdKPn0YYrDR6EG0e+Krum7KmcAq3MNh6ECWwztpX8OgHiA31GNAxRw0D5/7wtZrNmz0gQg7GzXc=
X-Received: by 2002:ac2:4d14:: with SMTP id r20mr11009468lfi.410.1607991402358; 
 Mon, 14 Dec 2020 16:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-2-wuhaotsh@google.com>
In-Reply-To: <20201215001312.3120777-2-wuhaotsh@google.com>
Date: Mon, 14 Dec 2020 16:16:28 -0800
Message-ID: <CAGcCb122HVkNYyjcWKM3xCY17L_NbHSF8ZM8+=9KkmSp+SxeiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] hw/misc: Add clock converter in NPCM7XX CLK module
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005740c705b675ac42"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12f.google.com
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

--0000000000005740c705b675ac42
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 4:13 PM Hao Wu <wuhaotsh@google.com> wrote:

> This patch allows NPCM7XX CLK module to compute clocks that are used by
> other NPCM7XX modules.
>
> Add a new struct NPCM7xxClockConverterState which represents a
> single converter.  Each clock converter in CLK module represents one
> converter in NPCM7XX CLK Module(PLL, SEL or Divider). Each converter
> takes one or more input clocks and converts them into one output clock.
> They form a clock hierarchy in the CLK module and are responsible for
> outputing clocks for various other modules in an NPCM7XX SoC.
>
> Each converter has a function pointer called "convert" which represents
> the unique logic for that converter.
>
> The clock contains two initialization information: ConverterInitInfo and
> ConverterConnectionInfo. They represent the vertices and edges in the
> clock diagram respectively.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm7xx_clk.c         | 795 +++++++++++++++++++++++++++++++++-
>  include/hw/misc/npcm7xx_clk.h | 140 +++++-
>  2 files changed, 927 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> index 6732437fe2..48bc9bdda5 100644
> --- a/hw/misc/npcm7xx_clk.c
> +++ b/hw/misc/npcm7xx_clk.c
> @@ -18,6 +18,7 @@
>
>  #include "hw/misc/npcm7xx_clk.h"
>  #include "hw/timer/npcm7xx_timer.h"
> +#include "hw/qdev-clock.h"
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
> @@ -27,9 +28,22 @@
>  #include "trace.h"
>  #include "sysemu/watchdog.h"
>
> +/*
> + * The reference clock hz, and the SECCNT and CNTR25M registers in this
> module,
> + * is always 25 MHz.
> + */
> +#define NPCM7XX_CLOCK_REF_HZ            (25000000)
> +
> +/* Register Field Definitions */
> +#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex A9 Cores */
> +
>  #define PLLCON_LOKI     BIT(31)
>  #define PLLCON_LOKS     BIT(30)
>  #define PLLCON_PWDEN    BIT(12)
> +#define PLLCON_FBDV(con) extract32((con), 16, 12)
> +#define PLLCON_OTDV2(con) extract32((con), 13, 3)
> +#define PLLCON_OTDV1(con) extract32((con), 8, 3)
> +#define PLLCON_INDV(con) extract32((con), 0, 6)
>
>  enum NPCM7xxCLKRegisters {
>      NPCM7XX_CLK_CLKEN1,
> @@ -89,12 +103,609 @@ static const uint32_t
> cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
>      [NPCM7XX_CLK_AHBCKFI]       = 0x000000c8,
>  };
>
> -/* Register Field Definitions */
> -#define NPCM7XX_CLK_WDRCR_CA9C  BIT(0) /* Cortex A9 Cores */
> -
>  /* The number of watchdogs that can trigger a reset. */
>  #define NPCM7XX_NR_WATCHDOGS    (3)
>
> +/* Clock converter functions */
> +
> +#define TYPE_NPCM7XX_CLOCK_PLL "npcm7xx-clock-pll"
> +#define NPCM7XX_CLOCK_PLL(obj) OBJECT_CHECK(NPCM7xxClockPLLState, \
> +        (obj), TYPE_NPCM7XX_CLOCK_PLL)
> +#define TYPE_NPCM7XX_CLOCK_SEL "npcm7xx-clock-sel"
> +#define NPCM7XX_CLOCK_SEL(obj) OBJECT_CHECK(NPCM7xxClockSELState, \
> +        (obj), TYPE_NPCM7XX_CLOCK_SEL)
> +#define TYPE_NPCM7XX_CLOCK_DIVIDER "npcm7xx-clock-divider"
> +#define NPCM7XX_CLOCK_DIVIDER(obj) OBJECT_CHECK(NPCM7xxClockDividerState,
> \
> +        (obj), TYPE_NPCM7XX_CLOCK_DIVIDER)
> +
> +static void npcm7xx_clk_update_pll(void *opaque)
> +{
> +    NPCM7xxClockPLLState *s = opaque;
> +    uint32_t con = s->clk->regs[s->reg];
> +    uint64_t freq;
> +
> +    /* The PLL is grounded if it is not locked yet. */
> +    if (con & PLLCON_LOKI) {
> +        freq = clock_get_hz(s->clock_in);
> +        freq *= PLLCON_FBDV(con);
> +        freq /= PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);
> +    } else {
> +        freq = 0;
> +    }
> +
> +    clock_update_hz(s->clock_out, freq);
> +}
> +
> +static void npcm7xx_clk_update_sel(void *opaque)
> +{
> +    NPCM7xxClockSELState *s = opaque;
> +    uint32_t index = extract32(s->clk->regs[NPCM7XX_CLK_CLKSEL],
> s->offset,
> +            s->len);
> +
> +    if (index >= s->input_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: SEL index: %u out of range\n",
> +                      __func__, index);
> +        index = 0;
> +    }
> +    clock_update_hz(s->clock_out, clock_get_hz(s->clock_in[index]));
> +}
> +
> +static void npcm7xx_clk_update_divider(void *opaque)
> +{
> +    NPCM7xxClockDividerState *s = opaque;
> +    uint32_t freq;
> +
> +    freq = s->divide(s);
> +    clock_update_hz(s->clock_out, freq);
> +}
> +
> +static uint32_t divide_by_constant(NPCM7xxClockDividerState *s)
> +{
> +    return clock_get_hz(s->clock_in) / s->divisor;
> +}
> +
> +static uint32_t divide_by_reg_divisor(NPCM7xxClockDividerState *s)
> +{
> +    return clock_get_hz(s->clock_in) /
> +            (extract32(s->clk->regs[s->reg], s->offset, s->len) + 1);
> +}
> +
> +static uint32_t divide_by_reg_divisor_times_2(NPCM7xxClockDividerState *s)
> +{
> +    return divide_by_reg_divisor(s) / 2;
> +}
> +
> +static uint32_t shift_by_reg_divisor(NPCM7xxClockDividerState *s)
> +{
> +    return clock_get_hz(s->clock_in) >>
> +        extract32(s->clk->regs[s->reg], s->offset, s->len);
> +}
> +
> +static NPCM7xxClockPLL find_pll_by_reg(enum NPCM7xxCLKRegisters reg)
> +{
> +    switch (reg) {
> +    case NPCM7XX_CLK_PLLCON0:
> +        return NPCM7XX_CLOCK_PLL0;
> +    case NPCM7XX_CLK_PLLCON1:
> +        return NPCM7XX_CLOCK_PLL1;
> +    case NPCM7XX_CLK_PLLCON2:
> +        return NPCM7XX_CLOCK_PLL2;
> +    case NPCM7XX_CLK_PLLCONG:
> +        return NPCM7XX_CLOCK_PLLG;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)
> +{
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
> +        npcm7xx_clk_update_pll(&clk->plls[i]);
> +    }
> +}
> +
> +static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)
> +{
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
> +        npcm7xx_clk_update_sel(&clk->sels[i]);
> +    }
> +}
> +
> +static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)
> +{
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
> +        npcm7xx_clk_update_divider(&clk->dividers[i]);
> +    }
> +}
> +
> +static void npcm7xx_clk_update_all_clocks(NPCM7xxCLKState *clk)
> +{
> +    clock_update_hz(clk->clkref, NPCM7XX_CLOCK_REF_HZ);
> +    npcm7xx_clk_update_all_plls(clk);
> +    npcm7xx_clk_update_all_sels(clk);
> +    npcm7xx_clk_update_all_dividers(clk);
> +}
> +
> +/* Types of clock sources. */
> +typedef enum ClockSrcType {
> +    CLKSRC_REF,
> +    CLKSRC_PLL,
> +    CLKSRC_SEL,
> +    CLKSRC_DIV,
> +} ClockSrcType;
> +
> +typedef struct PLLInitInfo {
> +    const char *name;
> +    ClockSrcType src_type;
> +    int src_index;
> +    int reg;
> +    const char *public_name;
> +} PLLInitInfo;
> +
> +typedef struct SELInitInfo {
> +    const char *name;
> +    uint8_t input_size;
> +    ClockSrcType src_type[NPCM7XX_CLK_SEL_MAX_INPUT];
> +    int src_index[NPCM7XX_CLK_SEL_MAX_INPUT];
> +    int offset;
> +    int len;
> +    const char *public_name;
> +} SELInitInfo;
> +
> +typedef struct DividerInitInfo {
> +    const char *name;
> +    ClockSrcType src_type;
> +    int src_index;
> +    uint32_t (*divide)(NPCM7xxClockDividerState *s);
> +    int reg; /* not used when type == CONSTANT */
> +    int offset; /* not used when type == CONSTANT */
> +    int len; /* not used when type == CONSTANT */
> +    int divisor; /* used only when type == CONSTANT */
> +    const char *public_name;
> +} DividerInitInfo;
> +
> +static const PLLInitInfo pll_init_info_list[] = {
> +    [NPCM7XX_CLOCK_PLL0] = {
> +        .name = "pll0",
> +        .src_type = CLKSRC_REF,
> +        .reg = NPCM7XX_CLK_PLLCON0,
> +    },
> +    [NPCM7XX_CLOCK_PLL1] = {
> +        .name = "pll1",
> +        .src_type = CLKSRC_REF,
> +        .reg = NPCM7XX_CLK_PLLCON1,
> +    },
> +    [NPCM7XX_CLOCK_PLL2] = {
> +        .name = "pll2",
> +        .src_type = CLKSRC_REF,
> +        .reg = NPCM7XX_CLK_PLLCON2,
> +    },
> +    [NPCM7XX_CLOCK_PLLG] = {
> +        .name = "pllg",
> +        .src_type = CLKSRC_REF,
> +        .reg = NPCM7XX_CLK_PLLCONG,
> +    },
> +};
> +
> +static const SELInitInfo sel_init_info_list[] = {
> +    [NPCM7XX_CLOCK_PIXCKSEL] = {
> +        .name = "pixcksel",
> +        .input_size = 2,
> +        .src_type = {CLKSRC_PLL, CLKSRC_REF},
> +        .src_index = {NPCM7XX_CLOCK_PLLG, 0},
> +        .offset = 5,
> +        .len = 1,
> +        .public_name = "pixel-clock",
> +    },
> +    [NPCM7XX_CLOCK_MCCKSEL] = {
> +        .name = "mccksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_DIV, CLKSRC_REF, CLKSRC_REF,
> +            /*MCBPCK, shouldn't be used in normal operation*/
> +            CLKSRC_REF},
> +        .src_index = {NPCM7XX_CLOCK_PLL1D2, 0, 0, 0},
> +        .offset = 12,
> +        .len = 2,
> +        .public_name = "mc-phy-clock",
> +    },
> +    [NPCM7XX_CLOCK_CPUCKSEL] = {
> +        .name = "cpucksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF,
> +            /*SYSBPCK, shouldn't be used in normal operation*/
> +            CLKSRC_REF},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0, 0},
> +        .offset = 0,
> +        .len = 2,
> +        .public_name = "system-clock",
> +    },
> +    [NPCM7XX_CLOCK_CLKOUTSEL] = {
> +        .name = "clkoutsel",
> +        .input_size = 5,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF,
> +            CLKSRC_PLL, CLKSRC_DIV},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
> +            NPCM7XX_CLOCK_PLLG, NPCM7XX_CLOCK_PLL2D2},
> +        .offset = 18,
> +        .len = 3,
> +        .public_name = "tock",
> +    },
> +    [NPCM7XX_CLOCK_UARTCKSEL] = {
> +        .name = "uartcksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
> +            NPCM7XX_CLOCK_PLL2D2},
> +        .offset = 8,
> +        .len = 2,
> +    },
> +    [NPCM7XX_CLOCK_TIMCKSEL] = {
> +        .name = "timcksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
> +            NPCM7XX_CLOCK_PLL2D2},
> +        .offset = 14,
> +        .len = 2,
> +    },
> +    [NPCM7XX_CLOCK_SDCKSEL] = {
> +        .name = "sdcksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
> +            NPCM7XX_CLOCK_PLL2D2},
> +        .offset = 6,
> +        .len = 2,
> +    },
> +    [NPCM7XX_CLOCK_GFXMSEL] = {
> +        .name = "gfxmksel",
> +        .input_size = 2,
> +        .src_type = {CLKSRC_REF, CLKSRC_PLL},
> +        .src_index = {0, NPCM7XX_CLOCK_PLL2},
> +        .offset = 21,
> +        .len = 1,
> +    },
> +    [NPCM7XX_CLOCK_SUCKSEL] = {
> +        .name = "sucksel",
> +        .input_size = 4,
> +        .src_type = {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_REF, CLKSRC_DIV},
> +        .src_index = {NPCM7XX_CLOCK_PLL0, NPCM7XX_CLOCK_PLL1D2, 0,
> +            NPCM7XX_CLOCK_PLL2D2},
> +        .offset = 10,
> +        .len = 2,
> +    },
> +};
> +
> +static const DividerInitInfo divider_init_info_list[] = {
> +    [NPCM7XX_CLOCK_PLL1D2] = {
> +        .name = "pll1d2",
> +        .src_type = CLKSRC_PLL,
> +        .src_index = NPCM7XX_CLOCK_PLL1,
> +        .divide = divide_by_constant,
> +        .divisor = 2,
> +    },
> +    [NPCM7XX_CLOCK_PLL2D2] = {
> +        .name = "pll2d2",
> +        .src_type = CLKSRC_PLL,
> +        .src_index = NPCM7XX_CLOCK_PLL2,
> +        .divide = divide_by_constant,
> +        .divisor = 2,
> +    },
> +    [NPCM7XX_CLOCK_MC_DIVIDER] = {
> +        .name = "mc-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_MCCKSEL,
> +        .divide = divide_by_constant,
> +        .divisor = 2,
> +        .public_name = "mc-clock"
> +    },
> +    [NPCM7XX_CLOCK_AXI_DIVIDER] = {
> +        .name = "axi-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_CPUCKSEL,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 0,
> +        .len = 1,
> +        .public_name = "clk2"
> +    },
> +    [NPCM7XX_CLOCK_AHB_DIVIDER] = {
> +        .name = "ahb-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AXI_DIVIDER,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 26,
> +        .len = 2,
> +        .public_name = "clk4"
> +    },
> +    [NPCM7XX_CLOCK_AHB3_DIVIDER] = {
> +        .name = "ahb3-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 6,
> +        .len = 5,
> +        .public_name = "ahb3-spi3-clock"
> +    },
> +    [NPCM7XX_CLOCK_SPI0_DIVIDER] = {
> +        .name = "spi0-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV3,
> +        .offset = 6,
> +        .len = 5,
> +        .public_name = "spi0-clock",
> +    },
> +    [NPCM7XX_CLOCK_SPIX_DIVIDER] = {
> +        .name = "spix-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV3,
> +        .offset = 1,
> +        .len = 5,
> +        .public_name = "spix-clock",
> +    },
> +    [NPCM7XX_CLOCK_APB1_DIVIDER] = {
> +        .name = "apb1-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 24,
> +        .len = 2,
> +        .public_name = "apb1-clock",
> +    },
> +    [NPCM7XX_CLOCK_APB2_DIVIDER] = {
> +        .name = "apb2-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 26,
> +        .len = 2,
> +        .public_name = "apb2-clock",
> +    },
> +    [NPCM7XX_CLOCK_APB3_DIVIDER] = {
> +        .name = "apb3-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 28,
> +        .len = 2,
> +        .public_name = "apb3-clock",
> +    },
> +    [NPCM7XX_CLOCK_APB4_DIVIDER] = {
> +        .name = "apb4-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 30,
> +        .len = 2,
> +        .public_name = "apb4-clock",
> +    },
> +    [NPCM7XX_CLOCK_APB5_DIVIDER] = {
> +        .name = "apb5-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_AHB_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 22,
> +        .len = 2,
> +        .public_name = "apb5-clock",
> +    },
> +    [NPCM7XX_CLOCK_CLKOUT_DIVIDER] = {
> +        .name = "clkout-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_CLKOUTSEL,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 16,
> +        .len = 5,
> +        .public_name = "clkout",
> +    },
> +    [NPCM7XX_CLOCK_UART_DIVIDER] = {
> +        .name = "uart-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_UARTCKSEL,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 16,
> +        .len = 5,
> +        .public_name = "uart-clock",
> +    },
> +    [NPCM7XX_CLOCK_TIMER_DIVIDER] = {
> +        .name = "timer-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_TIMCKSEL,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 21,
> +        .len = 5,
> +        .public_name = "timer-clock",
> +    },
> +    [NPCM7XX_CLOCK_ADC_DIVIDER] = {
> +        .name = "adc-divider",
> +        .src_type = CLKSRC_DIV,
> +        .src_index = NPCM7XX_CLOCK_TIMER_DIVIDER,
> +        .divide = shift_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 28,
> +        .len = 3,
> +        .public_name = "adc-clock",
> +    },
> +    [NPCM7XX_CLOCK_MMC_DIVIDER] = {
> +        .name = "mmc-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_SDCKSEL,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV1,
> +        .offset = 11,
> +        .len = 5,
> +        .public_name = "mmc-clock",
> +    },
> +    [NPCM7XX_CLOCK_SDHC_DIVIDER] = {
> +        .name = "sdhc-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_SDCKSEL,
> +        .divide = divide_by_reg_divisor_times_2,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 0,
> +        .len = 4,
> +        .public_name = "sdhc-clock",
> +    },
> +    [NPCM7XX_CLOCK_GFXM_DIVIDER] = {
> +        .name = "gfxm-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_GFXMSEL,
> +        .divide = divide_by_constant,
> +        .divisor = 3,
> +        .public_name = "gfxm-clock",
> +    },
> +    [NPCM7XX_CLOCK_UTMI_DIVIDER] = {
> +        .name = "utmi-divider",
> +        .src_type = CLKSRC_SEL,
> +        .src_index = NPCM7XX_CLOCK_SUCKSEL,
> +        .divide = divide_by_reg_divisor,
> +        .reg = NPCM7XX_CLK_CLKDIV2,
> +        .offset = 8,
> +        .len = 5,
> +        .public_name = "utmi-clock",
> +    },
> +};
> +
> +static void npcm7xx_clk_pll_init(Object *obj)
> +{
> +    NPCM7xxClockPLLState *pll = NPCM7XX_CLOCK_PLL(obj);
> +
> +    pll->clock_in = qdev_init_clock_in(DEVICE(pll), "clock-in",
> +            npcm7xx_clk_update_pll, pll);
> +    pll->clock_out = qdev_init_clock_out(DEVICE(pll), "clock-out");
> +}
> +
> +static void npcm7xx_clk_sel_init(Object *obj)
> +{
> +    int i;
> +    NPCM7xxClockSELState *sel = NPCM7XX_CLOCK_SEL(obj);
> +
> +    for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
> +        sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
> +                g_strdup_printf("clock-in[%d]", i),
> +                npcm7xx_clk_update_sel, sel);
> +    }
> +    sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
> +}
> +static void npcm7xx_clk_divider_init(Object *obj)
> +{
> +    NPCM7xxClockDividerState *div = NPCM7XX_CLOCK_DIVIDER(obj);
> +
> +    div->clock_in = qdev_init_clock_in(DEVICE(div), "clock-in",
> +            npcm7xx_clk_update_divider, div);
> +    div->clock_out = qdev_init_clock_out(DEVICE(div), "clock-out");
> +}
> +
> +static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,
> +        NPCM7xxCLKState *clk, const PLLInitInfo *init_info)
> +{
> +    pll->name = init_info->name;
> +    pll->clk = clk;
> +    pll->reg = init_info->reg;
> +    if (init_info->public_name != NULL) {
> +        qdev_alias_clock(DEVICE(pll), "clock-out", DEVICE(clk),
> +                init_info->public_name);
> +    }
> +}
> +
> +static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,
> +        NPCM7xxCLKState *clk, const SELInitInfo *init_info)
> +{
> +    int input_size = init_info->input_size;
> +
> +    sel->name = init_info->name;
> +    sel->clk = clk;
> +    sel->input_size = init_info->input_size;
> +    g_assert(input_size <= NPCM7XX_CLK_SEL_MAX_INPUT);
> +    sel->offset = init_info->offset;
> +    sel->len = init_info->len;
> +    if (init_info->public_name != NULL) {
> +        qdev_alias_clock(DEVICE(sel), "clock-out", DEVICE(clk),
> +                init_info->public_name);
> +    }
> +}
> +
> +static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,
> +        NPCM7xxCLKState *clk, const DividerInitInfo *init_info)
> +{
> +    div->name = init_info->name;
> +    div->clk = clk;
> +
> +    div->divide = init_info->divide;
> +    if (div->divide == divide_by_constant) {
> +        div->divisor = init_info->divisor;
> +    } else {
> +        div->reg = init_info->reg;
> +        div->offset = init_info->offset;
> +        div->len = init_info->len;
> +    }
> +    if (init_info->public_name != NULL) {
> +        qdev_alias_clock(DEVICE(div), "clock-out", DEVICE(clk),
> +                init_info->public_name);
> +    }
> +}
> +
> +static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,
> +        int index)
> +{
> +    switch (type) {
> +    case CLKSRC_REF:
> +        return clk->clkref;
> +    case CLKSRC_PLL:
> +        return clk->plls[index].clock_out;
> +    case CLKSRC_SEL:
> +        return clk->sels[index].clock_out;
> +    case CLKSRC_DIV:
> +        return clk->dividers[index].clock_out;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)
> +{
> +    int i, j;
> +    Clock *src;
> +
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
> +        src = npcm7xx_get_clock(clk, pll_init_info_list[i].src_type,
> +                pll_init_info_list[i].src_index);
> +        clock_set_source(clk->plls[i].clock_in, src);
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
> +        for (j = 0; j < sel_init_info_list[i].input_size; ++j) {
> +            src = npcm7xx_get_clock(clk,
> sel_init_info_list[i].src_type[j],
> +                    sel_init_info_list[i].src_index[j]);
> +            clock_set_source(clk->sels[i].clock_in[j], src);
> +        }
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
> +        src = npcm7xx_get_clock(clk, divider_init_info_list[i].src_type,
> +                divider_init_info_list[i].src_index);
> +        clock_set_source(clk->dividers[i].clock_in, src);
> +    }
> +}
> +
>  static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigned
> size)
>  {
>      uint32_t reg = offset / sizeof(uint32_t);
> @@ -129,7 +740,7 @@ static uint64_t npcm7xx_clk_read(void *opaque, hwaddr
> offset, unsigned size)
>           *
>           * The 4 LSBs are always zero: (1e9 / 640) << 4 = 25000000.
>           */
> -        value = (((now_ns - s->ref_ns) / 640) << 4) %
> NPCM7XX_TIMER_REF_HZ;
> +        value = (((now_ns - s->ref_ns) / 640) << 4) %
> NPCM7XX_CLOCK_REF_HZ;
>          break;
>
>      default:
> @@ -183,6 +794,20 @@ static void npcm7xx_clk_write(void *opaque, hwaddr
> offset,
>                  value |= (value & PLLCON_LOKS);
>              }
>          }
> +        /* Only update PLL when it is locked. */
> +        if (value & PLLCON_LOKI) {
> +            npcm7xx_clk_update_pll(&s->plls[find_pll_by_reg(reg)]);
> +        }
> +        break;
> +
> +    case NPCM7XX_CLK_CLKSEL:
> +        npcm7xx_clk_update_all_sels(s);
> +        break;
> +
> +    case NPCM7XX_CLK_CLKDIV1:
> +    case NPCM7XX_CLK_CLKDIV2:
> +    case NPCM7XX_CLK_CLKDIV3:
> +        npcm7xx_clk_update_all_dividers(s);
>          break;
>
>      case NPCM7XX_CLK_CNTR25M:
> @@ -234,6 +859,7 @@ static void npcm7xx_clk_enter_reset(Object *obj,
> ResetType type)
>      case RESET_TYPE_COLD:
>          memcpy(s->regs, cold_reset_values, sizeof(cold_reset_values));
>          s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        npcm7xx_clk_update_all_clocks(s);
>          return;
>      }
>
> @@ -245,6 +871,42 @@ static void npcm7xx_clk_enter_reset(Object *obj,
> ResetType type)
>                    __func__, type);
>  }
>
> +static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)
> +{
> +    int i;
> +
> +    s->clkref = qdev_init_clock_in(DEVICE(s), "clkref", NULL, NULL);
> +
> +    /* First pass: init all converter modules */
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) !=
> NPCM7XX_CLOCK_NR_PLLS);
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(sel_init_info_list) !=
> NPCM7XX_CLOCK_NR_SELS);
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(divider_init_info_list)
> +            != NPCM7XX_CLOCK_NR_DIVIDERS);
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
> +        object_initialize_child(OBJECT(s), pll_init_info_list[i].name,
> +                &s->plls[i], TYPE_NPCM7XX_CLOCK_PLL);
> +        npcm7xx_init_clock_pll(&s->plls[i], s,
> +                &pll_init_info_list[i]);
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
> +        object_initialize_child(OBJECT(s), sel_init_info_list[i].name,
> +                &s->sels[i], TYPE_NPCM7XX_CLOCK_SEL);
> +        npcm7xx_init_clock_sel(&s->sels[i], s,
> +                &sel_init_info_list[i]);
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
> +        object_initialize_child(OBJECT(s), divider_init_info_list[i].name,
> +                &s->dividers[i], TYPE_NPCM7XX_CLOCK_DIVIDER);
> +        npcm7xx_init_clock_divider(&s->dividers[i], s,
> +                &divider_init_info_list[i]);
> +    }
> +
> +    /* Second pass: connect converter modules */
> +    npcm7xx_connect_clocks(s);
> +
> +    clock_update_hz(s->clkref, NPCM7XX_CLOCK_REF_HZ);
> +}
> +
>  static void npcm7xx_clk_init(Object *obj)
>  {
>      NPCM7xxCLKState *s = NPCM7XX_CLK(obj);
> @@ -252,21 +914,114 @@ static void npcm7xx_clk_init(Object *obj)
>      memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
>                            TYPE_NPCM7XX_CLK, 4 * KiB);
>      sysbus_init_mmio(&s->parent, &s->iomem);
> +}
> +
> +static int npcm7xx_clk_post_load(void *opaque, int version_id)
> +{
> +    if (version_id >= 1) {
> +        NPCM7xxCLKState *clk = opaque;
> +
> +        npcm7xx_clk_update_all_clocks(clk);
> +    }
> +
> +    return 0;
> +}
> +
> +static void npcm7xx_clk_realize(DeviceState *dev, Error **errp)
> +{
> +    int i;
> +    NPCM7xxCLKState *s = NPCM7XX_CLK(dev);
> +
>      qdev_init_gpio_in_named(DEVICE(s), npcm7xx_clk_perform_watchdog_reset,
>              NPCM7XX_WATCHDOG_RESET_GPIO_IN, NPCM7XX_NR_WATCHDOGS);
> +    npcm7xx_clk_init_clock_hierarchy(s);
> +
> +    /* Realize child devices */
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_PLLS; ++i) {
> +        if (!qdev_realize(DEVICE(&s->plls[i]), NULL, errp)) {
> +            return;
> +        }
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_SELS; ++i) {
> +        if (!qdev_realize(DEVICE(&s->sels[i]), NULL, errp)) {
> +            return;
> +        }
> +    }
> +    for (i = 0; i < NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {
> +        if (!qdev_realize(DEVICE(&s->dividers[i]), NULL, errp)) {
> +            return;
> +        }
> +    }
>  }
>
> -static const VMStateDescription vmstate_npcm7xx_clk = {
> -    .name = "npcm7xx-clk",
> +static const VMStateDescription vmstate_npcm7xx_clk_pll = {
> +    .name = "npcm7xx-clock-pll",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields =  (VMStateField[]) {
> +        VMSTATE_CLOCK(clock_in, NPCM7xxClockPLLState),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static const VMStateDescription vmstate_npcm7xx_clk_sel = {
> +    .name = "npcm7xx-clock-sel",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields =  (VMStateField[]) {
> +        VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(clock_in, NPCM7xxClockSELState,
> +                NPCM7XX_CLK_SEL_MAX_INPUT, 0, vmstate_clock, Clock),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static const VMStateDescription vmstate_npcm7xx_clk_divider = {
> +    .name = "npcm7xx-clock-divider",
>      .version_id = 0,
>      .minimum_version_id = 0,
> +    .fields =  (VMStateField[]) {
> +        VMSTATE_CLOCK(clock_in, NPCM7xxClockDividerState),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +
> +static const VMStateDescription vmstate_npcm7xx_clk = {
> +    .name = "npcm7xx-clk",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .post_load = npcm7xx_clk_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKState, NPCM7XX_CLK_NR_REGS),
>          VMSTATE_INT64(ref_ns, NPCM7xxCLKState),
> +        VMSTATE_CLOCK(clkref, NPCM7xxCLKState),
>          VMSTATE_END_OF_LIST(),
>      },
>  };
>
> +static void npcm7xx_clk_pll_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx Clock PLL Module";
> +    dc->vmsd = &vmstate_npcm7xx_clk_pll;
> +}
> +
> +static void npcm7xx_clk_sel_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx Clock SEL Module";
> +    dc->vmsd = &vmstate_npcm7xx_clk_sel;
> +}
> +
> +static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "NPCM7xx Clock Divider Module";
> +    dc->vmsd = &vmstate_npcm7xx_clk_divider;
> +}
> +
>  static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
>  {
>      ResettableClass *rc = RESETTABLE_CLASS(klass);
> @@ -276,9 +1031,34 @@ static void npcm7xx_clk_class_init(ObjectClass
> *klass, void *data)
>
>      dc->desc = "NPCM7xx Clock Control Registers";
>      dc->vmsd = &vmstate_npcm7xx_clk;
> +    dc->realize = npcm7xx_clk_realize;
>      rc->phases.enter = npcm7xx_clk_enter_reset;
>  }
>
> +static const TypeInfo npcm7xx_clk_pll_info = {
> +    .name               = TYPE_NPCM7XX_CLOCK_PLL,
> +    .parent             = TYPE_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxClockPLLState),
> +    .instance_init      = npcm7xx_clk_pll_init,
> +    .class_init         = npcm7xx_clk_pll_class_init,
> +};
> +
> +static const TypeInfo npcm7xx_clk_sel_info = {
> +    .name               = TYPE_NPCM7XX_CLOCK_SEL,
> +    .parent             = TYPE_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxClockSELState),
> +    .instance_init      = npcm7xx_clk_sel_init,
> +    .class_init         = npcm7xx_clk_sel_class_init,
> +};
> +
> +static const TypeInfo npcm7xx_clk_divider_info = {
> +    .name               = TYPE_NPCM7XX_CLOCK_DIVIDER,
> +    .parent             = TYPE_DEVICE,
> +    .instance_size      = sizeof(NPCM7xxClockDividerState),
> +    .instance_init      = npcm7xx_clk_divider_init,
> +    .class_init         = npcm7xx_clk_divider_class_init,
> +};
> +
>  static const TypeInfo npcm7xx_clk_info = {
>      .name               = TYPE_NPCM7XX_CLK,
>      .parent             = TYPE_SYS_BUS_DEVICE,
> @@ -289,6 +1069,9 @@ static const TypeInfo npcm7xx_clk_info = {
>
>  static void npcm7xx_clk_register_type(void)
>  {
> +    type_register_static(&npcm7xx_clk_pll_info);
> +    type_register_static(&npcm7xx_clk_sel_info);
> +    type_register_static(&npcm7xx_clk_divider_info);
>      type_register_static(&npcm7xx_clk_info);
>  }
>  type_init(npcm7xx_clk_register_type);
> diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
> index 2338fbbdb5..f641f95f3e 100644
> --- a/include/hw/misc/npcm7xx_clk.h
> +++ b/include/hw/misc/npcm7xx_clk.h
> @@ -17,6 +17,7 @@
>  #define NPCM7XX_CLK_H
>
>  #include "exec/memory.h"
> +#include "hw/clock.h"
>  #include "hw/sysbus.h"
>
>  /*
> @@ -33,16 +34,151 @@
>
>  #define NPCM7XX_WATCHDOG_RESET_GPIO_IN
> "npcm7xx-clk-watchdog-reset-gpio-in"
>
> -typedef struct NPCM7xxCLKState {
> +/* Maximum amount of clock inputs in a SEL module. */
> +#define NPCM7XX_CLK_SEL_MAX_INPUT 5
> +
> +/* PLLs in CLK module. */
> +typedef enum NPCM7xxClockPLL {
> +    NPCM7XX_CLOCK_PLL0,
> +    NPCM7XX_CLOCK_PLL1,
> +    NPCM7XX_CLOCK_PLL2,
> +    NPCM7XX_CLOCK_PLLG,
> +    NPCM7XX_CLOCK_NR_PLLS,
> +} NPCM7xxClockPLL;
> +
> +/* SEL/MUX in CLK module. */
> +typedef enum NPCM7xxClockSEL {
> +    NPCM7XX_CLOCK_PIXCKSEL,
> +    NPCM7XX_CLOCK_MCCKSEL,
> +    NPCM7XX_CLOCK_CPUCKSEL,
> +    NPCM7XX_CLOCK_CLKOUTSEL,
> +    NPCM7XX_CLOCK_UARTCKSEL,
> +    NPCM7XX_CLOCK_TIMCKSEL,
> +    NPCM7XX_CLOCK_SDCKSEL,
> +    NPCM7XX_CLOCK_GFXMSEL,
> +    NPCM7XX_CLOCK_SUCKSEL,
> +    NPCM7XX_CLOCK_NR_SELS,
> +} NPCM7xxClockSEL;
> +
> +/* Dividers in CLK module. */
> +typedef enum NPCM7xxClockDivider {
> +    NPCM7XX_CLOCK_PLL1D2, /* PLL1/2 */
> +    NPCM7XX_CLOCK_PLL2D2, /* PLL2/2 */
> +    NPCM7XX_CLOCK_MC_DIVIDER,
> +    NPCM7XX_CLOCK_AXI_DIVIDER,
> +    NPCM7XX_CLOCK_AHB_DIVIDER,
> +    NPCM7XX_CLOCK_AHB3_DIVIDER,
> +    NPCM7XX_CLOCK_SPI0_DIVIDER,
> +    NPCM7XX_CLOCK_SPIX_DIVIDER,
> +    NPCM7XX_CLOCK_APB1_DIVIDER,
> +    NPCM7XX_CLOCK_APB2_DIVIDER,
> +    NPCM7XX_CLOCK_APB3_DIVIDER,
> +    NPCM7XX_CLOCK_APB4_DIVIDER,
> +    NPCM7XX_CLOCK_APB5_DIVIDER,
> +    NPCM7XX_CLOCK_CLKOUT_DIVIDER,
> +    NPCM7XX_CLOCK_UART_DIVIDER,
> +    NPCM7XX_CLOCK_TIMER_DIVIDER,
> +    NPCM7XX_CLOCK_ADC_DIVIDER,
> +    NPCM7XX_CLOCK_MMC_DIVIDER,
> +    NPCM7XX_CLOCK_SDHC_DIVIDER,
> +    NPCM7XX_CLOCK_GFXM_DIVIDER, /* divide by 3 */
> +    NPCM7XX_CLOCK_UTMI_DIVIDER,
> +    NPCM7XX_CLOCK_NR_DIVIDERS,
> +} NPCM7xxClockConverter;
> +
> +typedef struct NPCM7xxCLKState NPCM7xxCLKState;
> +
> +/**
> + * struct NPCM7xxClockPLLState - A PLL module in CLK module.
> + * @name: The name of the module.
> + * @clk: The CLK module that owns this module.
> + * @clock_in: The input clock of this module.
> + * @clock_out: The output clock of this module.
> + * @reg: The control registers for this PLL module.
> + */
> +typedef struct NPCM7xxClockPLLState {
> +    DeviceState parent;
> +
> +    const char *name;
> +    NPCM7xxCLKState *clk;
> +    Clock *clock_in;
> +    Clock *clock_out;
> +
> +    int reg;
> +} NPCM7xxClockPLLState;
> +
> +/**
> + * struct NPCM7xxClockSELState - A SEL module in CLK module.
> + * @name: The name of the module.
> + * @clk: The CLK module that owns this module.
> + * @input_size: The size of inputs of this module.
> + * @clock_in: The input clocks of this module.
> + * @clock_out: The output clocks of this module.
> + * @offset: The offset of this module in the control register.
> + * @len: The length of this module in the control register.
> + */
> +typedef struct NPCM7xxClockSELState {
> +    DeviceState parent;
> +
> +    const char *name;
> +    NPCM7xxCLKState *clk;
> +    uint8_t input_size;
> +    Clock *clock_in[NPCM7XX_CLK_SEL_MAX_INPUT];
> +    Clock *clock_out;
> +
> +    int offset;
> +    int len;
> +} NPCM7xxClockSELState;
> +
> +/**
> + * struct NPCM7xxClockDividerState - A Divider module in CLK module.
> + * @name: The name of the module.
> + * @clk: The CLK module that owns this module.
> + * @clock_in: The input clock of this module.
> + * @clock_out: The output clock of this module.
> + * @divide: The function the divider uses to divide the input.
> + * @reg: The index of the control register that contains the divisor.
> + * @offset: The offset of the divisor in the control register.
> + * @len: The length of the divisor in the control register.
> + * @divisor: The divisor for a constant divisor
> + */
> +typedef struct NPCM7xxClockDividerState {
> +    DeviceState parent;
> +
> +    const char *name;
> +    NPCM7xxCLKState *clk;
> +    Clock *clock_in;
> +    Clock *clock_out;
> +
> +    uint32_t (*divide)(struct NPCM7xxClockDividerState *s);
> +    union {
> +        struct {
> +            int reg;
> +            int offset;
> +            int len;
> +        };
> +        int divisor;
> +    };
> +} NPCM7xxClockDividerState;
> +
> +struct NPCM7xxCLKState {
>      SysBusDevice parent;
>
>      MemoryRegion iomem;
>
> +    /* Clock converters */
> +    NPCM7xxClockPLLState plls[NPCM7XX_CLOCK_NR_PLLS];
> +    NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];
> +    NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS];
> +
>      uint32_t regs[NPCM7XX_CLK_NR_REGS];
>
>      /* Time reference for SECCNT and CNTR25M, initialized by power on
> reset */
>      int64_t ref_ns;
> -} NPCM7xxCLKState;
> +
> +    /* The incoming reference clock. */
> +    Clock *clkref;
> +};
>
>  #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
>  #define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj),
> TYPE_NPCM7XX_CLK)
> --
> 2.29.2.684.gfbc64c5ab5-goog
>
>

--0000000000005740c705b675ac42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Dec 14, 2020 at 4:13 PM Hao Wu &lt;<a href=3D"=
mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">This patch allows NPCM7XX CL=
K module to compute clocks that are used by<br>
other NPCM7XX modules.<br>
<br>
Add a new struct NPCM7xxClockConverterState which represents a<br>
single converter.=C2=A0 Each clock converter in CLK module represents one<b=
r>
converter in NPCM7XX CLK Module(PLL, SEL or Divider). Each converter<br>
takes one or more input clocks and converts them into one output clock.<br>
They form a clock hierarchy in the CLK module and are responsible for<br>
outputing clocks for various other modules in an NPCM7XX SoC.<br>
<br>
Each converter has a function pointer called &quot;convert&quot; which repr=
esents<br>
the unique logic for that converter.<br>
<br>
The clock contains two initialization information: ConverterInitInfo and<br=
>
ConverterConnectionInfo. They represent the vertices and edges in the<br>
clock diagram respectively.<br>
<br>
Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com=
" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=
=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
---<br>
=C2=A0hw/misc/npcm7xx_clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 795 ++++++++=
+++++++++++++++++++++++++-<br>
=C2=A0include/hw/misc/npcm7xx_clk.h | 140 +++++-<br>
=C2=A02 files changed, 927 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c<br>
index 6732437fe2..48bc9bdda5 100644<br>
--- a/hw/misc/npcm7xx_clk.c<br>
+++ b/hw/misc/npcm7xx_clk.c<br>
@@ -18,6 +18,7 @@<br>
<br>
=C2=A0#include &quot;hw/misc/npcm7xx_clk.h&quot;<br>
=C2=A0#include &quot;hw/timer/npcm7xx_timer.h&quot;<br>
+#include &quot;hw/qdev-clock.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
@@ -27,9 +28,22 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;sysemu/watchdog.h&quot;<br>
<br>
+/*<br>
+ * The reference clock hz, and the SECCNT and CNTR25M registers in this mo=
dule,<br>
+ * is always 25 MHz.<br>
+ */<br>
+#define NPCM7XX_CLOCK_REF_HZ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (250=
00000)<br>
+<br>
+/* Register Field Definitions */<br>
+#define NPCM7XX_CLK_WDRCR_CA9C=C2=A0 BIT(0) /* Cortex A9 Cores */<br>
+<br>
=C2=A0#define PLLCON_LOKI=C2=A0 =C2=A0 =C2=A0BIT(31)<br>
=C2=A0#define PLLCON_LOKS=C2=A0 =C2=A0 =C2=A0BIT(30)<br>
=C2=A0#define PLLCON_PWDEN=C2=A0 =C2=A0 BIT(12)<br>
+#define PLLCON_FBDV(con) extract32((con), 16, 12)<br>
+#define PLLCON_OTDV2(con) extract32((con), 13, 3)<br>
+#define PLLCON_OTDV1(con) extract32((con), 8, 3)<br>
+#define PLLCON_INDV(con) extract32((con), 0, 6)<br>
<br>
=C2=A0enum NPCM7xxCLKRegisters {<br>
=C2=A0 =C2=A0 =C2=A0NPCM7XX_CLK_CLKEN1,<br>
@@ -89,12 +103,609 @@ static const uint32_t cold_reset_values[NPCM7XX_CLK_N=
R_REGS] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[NPCM7XX_CLK_AHBCKFI]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0=
00000c8,<br>
=C2=A0};<br>
<br>
-/* Register Field Definitions */<br>
-#define NPCM7XX_CLK_WDRCR_CA9C=C2=A0 BIT(0) /* Cortex A9 Cores */<br>
-<br>
=C2=A0/* The number of watchdogs that can trigger a reset. */<br>
=C2=A0#define NPCM7XX_NR_WATCHDOGS=C2=A0 =C2=A0 (3)<br>
<br>
+/* Clock converter functions */<br>
+<br>
+#define TYPE_NPCM7XX_CLOCK_PLL &quot;npcm7xx-clock-pll&quot;<br>
+#define NPCM7XX_CLOCK_PLL(obj) OBJECT_CHECK(NPCM7xxClockPLLState, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (obj), TYPE_NPCM7XX_CLOCK_PLL)<br>
+#define TYPE_NPCM7XX_CLOCK_SEL &quot;npcm7xx-clock-sel&quot;<br>
+#define NPCM7XX_CLOCK_SEL(obj) OBJECT_CHECK(NPCM7xxClockSELState, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (obj), TYPE_NPCM7XX_CLOCK_SEL)<br>
+#define TYPE_NPCM7XX_CLOCK_DIVIDER &quot;npcm7xx-clock-divider&quot;<br>
+#define NPCM7XX_CLOCK_DIVIDER(obj) OBJECT_CHECK(NPCM7xxClockDividerState, =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (obj), TYPE_NPCM7XX_CLOCK_DIVIDER)<br>
+<br>
+static void npcm7xx_clk_update_pll(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxClockPLLState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t con =3D s-&gt;clk-&gt;regs[s-&gt;reg];<br>
+=C2=A0 =C2=A0 uint64_t freq;<br>
+<br>
+=C2=A0 =C2=A0 /* The PLL is grounded if it is not locked yet. */<br>
+=C2=A0 =C2=A0 if (con &amp; PLLCON_LOKI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq =3D clock_get_hz(s-&gt;clock_in);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq *=3D PLLCON_FBDV(con);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq /=3D PLLCON_INDV(con) * PLLCON_OTDV1(con)=
 * PLLCON_OTDV2(con);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 clock_update_hz(s-&gt;clock_out, freq);<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_sel(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxClockSELState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t index =3D extract32(s-&gt;clk-&gt;regs[NPCM7XX_CLK_=
CLKSEL], s-&gt;offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;len);<br>
+<br>
+=C2=A0 =C2=A0 if (index &gt;=3D s-&gt;input_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;%s: SEL index: %u out of range\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 index =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 clock_update_hz(s-&gt;clock_out, clock_get_hz(s-&gt;clock_in=
[index]));<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_divider(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxClockDividerState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t freq;<br>
+<br>
+=C2=A0 =C2=A0 freq =3D s-&gt;divide(s);<br>
+=C2=A0 =C2=A0 clock_update_hz(s-&gt;clock_out, freq);<br>
+}<br>
+<br>
+static uint32_t divide_by_constant(NPCM7xxClockDividerState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return clock_get_hz(s-&gt;clock_in) / s-&gt;divisor;<br>
+}<br>
+<br>
+static uint32_t divide_by_reg_divisor(NPCM7xxClockDividerState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return clock_get_hz(s-&gt;clock_in) /<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (extract32(s-&gt;clk-&gt;regs[s-=
&gt;reg], s-&gt;offset, s-&gt;len) + 1);<br>
+}<br>
+<br>
+static uint32_t divide_by_reg_divisor_times_2(NPCM7xxClockDividerState *s)=
<br>
+{<br>
+=C2=A0 =C2=A0 return divide_by_reg_divisor(s) / 2;<br>
+}<br>
+<br>
+static uint32_t shift_by_reg_divisor(NPCM7xxClockDividerState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return clock_get_hz(s-&gt;clock_in) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extract32(s-&gt;clk-&gt;regs[s-&gt;reg], s-&gt=
;offset, s-&gt;len);<br>
+}<br>
+<br>
+static NPCM7xxClockPLL find_pll_by_reg(enum NPCM7xxCLKRegisters reg)<br>
+{<br>
+=C2=A0 =C2=A0 switch (reg) {<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_PLLCON0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NPCM7XX_CLOCK_PLL0;<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_PLLCON1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NPCM7XX_CLOCK_PLL1;<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_PLLCON2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NPCM7XX_CLOCK_PLL2;<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_PLLCONG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NPCM7XX_CLOCK_PLLG;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_all_plls(NPCM7xxCLKState *clk)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_PLLS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_pll(&amp;clk-&gt;plls[i]);<=
br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_all_sels(NPCM7xxCLKState *clk)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_SELS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_sel(&amp;clk-&gt;sels[i]);<=
br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_all_dividers(NPCM7xxCLKState *clk)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_divider(&amp;clk-&gt;divide=
rs[i]);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_clk_update_all_clocks(NPCM7xxCLKState *clk)<br>
+{<br>
+=C2=A0 =C2=A0 clock_update_hz(clk-&gt;clkref, NPCM7XX_CLOCK_REF_HZ);<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_all_plls(clk);<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_all_sels(clk);<br>
+=C2=A0 =C2=A0 npcm7xx_clk_update_all_dividers(clk);<br>
+}<br>
+<br>
+/* Types of clock sources. */<br>
+typedef enum ClockSrcType {<br>
+=C2=A0 =C2=A0 CLKSRC_REF,<br>
+=C2=A0 =C2=A0 CLKSRC_PLL,<br>
+=C2=A0 =C2=A0 CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 CLKSRC_DIV,<br>
+} ClockSrcType;<br>
+<br>
+typedef struct PLLInitInfo {<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 ClockSrcType src_type;<br>
+=C2=A0 =C2=A0 int src_index;<br>
+=C2=A0 =C2=A0 int reg;<br>
+=C2=A0 =C2=A0 const char *public_name;<br>
+} PLLInitInfo;<br>
+<br>
+typedef struct SELInitInfo {<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 uint8_t input_size;<br>
+=C2=A0 =C2=A0 ClockSrcType src_type[NPCM7XX_CLK_SEL_MAX_INPUT];<br>
+=C2=A0 =C2=A0 int src_index[NPCM7XX_CLK_SEL_MAX_INPUT];<br>
+=C2=A0 =C2=A0 int offset;<br>
+=C2=A0 =C2=A0 int len;<br>
+=C2=A0 =C2=A0 const char *public_name;<br>
+} SELInitInfo;<br>
+<br>
+typedef struct DividerInitInfo {<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 ClockSrcType src_type;<br>
+=C2=A0 =C2=A0 int src_index;<br>
+=C2=A0 =C2=A0 uint32_t (*divide)(NPCM7xxClockDividerState *s);<br>
+=C2=A0 =C2=A0 int reg; /* not used when type =3D=3D CONSTANT */<br>
+=C2=A0 =C2=A0 int offset; /* not used when type =3D=3D CONSTANT */<br>
+=C2=A0 =C2=A0 int len; /* not used when type =3D=3D CONSTANT */<br>
+=C2=A0 =C2=A0 int divisor; /* used only when type =3D=3D CONSTANT */<br>
+=C2=A0 =C2=A0 const char *public_name;<br>
+} DividerInitInfo;<br>
+<br>
+static const PLLInitInfo pll_init_info_list[] =3D {<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLL0] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_PLLCON0,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLL1] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_PLLCON1,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLL2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_PLLCON2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLLG] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pllg&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_PLLCONG,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const SELInitInfo sel_init_info_list[] =3D {<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PIXCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pixcksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_REF},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLLG, 0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;pixel-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_MCCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;mccksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_DIV, CLKSRC_REF, CLKSRC_=
REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*MCBPCK, shouldn&#39;t be used =
in normal operation*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC_REF},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL1D2, 0, 0, 0}=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 12,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;mc-phy-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_CPUCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;cpucksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*SYSBPCK, shouldn&#39;t be used=
 in normal operation*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC_REF},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0, 0},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;system-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_CLKOUTSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;clkoutsel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLKSRC_PLL, CLKSRC_DIV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLOCK_PLLG, NPCM7XX_CLOC=
K_PLL2D2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 18,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;tock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_UARTCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;uartcksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF, CLKSRC_DIV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2D2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_TIMCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;timcksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF, CLKSRC_DIV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2D2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 14,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_SDCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;sdcksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF, CLKSRC_DIV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2D2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_GFXMSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;gfxmksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_REF, CLKSRC_PLL},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {0, NPCM7XX_CLOCK_PLL2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 21,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 1,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_SUCKSEL] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;sucksel&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .input_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D {CLKSRC_PLL, CLKSRC_DIV, CLKSRC_=
REF, CLKSRC_DIV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D {NPCM7XX_CLOCK_PLL0, NPCM7XX_CL=
OCK_PLL1D2, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2D2},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const DividerInitInfo divider_init_info_list[] =3D {<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLL1D2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll1d2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_PLL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_PLL1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_constant,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divisor =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_PLL2D2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;pll2d2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_PLL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_PLL2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_constant,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divisor =3D 2,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_MC_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;mc-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_MCCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_constant,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divisor =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;mc-clock&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_AXI_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;axi-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_CPUCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;clk2&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_AHB_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;ahb-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AXI_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 26,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;clk4&quot;<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_AHB3_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;ahb3-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;ahb3-spi3-clock&quot;<b=
r>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_SPI0_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;spi0-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 6,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;spi0-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_SPIX_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;spix-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;spix-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_APB1_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;apb1-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 24,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;apb1-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_APB2_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;apb2-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 26,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;apb2-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_APB3_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;apb3-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 28,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;apb3-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_APB4_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;apb4-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 30,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;apb4-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_APB5_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;apb5-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 22,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;apb5-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_CLKOUT_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;clkout-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_CLKOUTSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 16,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;clkout&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_UART_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;uart-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_UARTCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 16,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;uart-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_TIMER_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;timer-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_TIMCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 21,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;timer-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_ADC_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;adc-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_TIMER_DIVIDER,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D shift_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 28,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;adc-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_MMC_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;mmc-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_SDCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 11,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;mmc-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_SDHC_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;sdhc-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_SDCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor_times_2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;sdhc-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_GFXM_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;gfxm-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_GFXMSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_constant,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divisor =3D 3,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;gfxm-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 [NPCM7XX_CLOCK_UTMI_DIVIDER] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;utmi-divider&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_type =3D CLKSRC_SEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .src_index =3D NPCM7XX_CLOCK_SUCKSEL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .divide =3D divide_by_reg_divisor,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg =3D NPCM7XX_CLK_CLKDIV2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D 8,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .len =3D 5,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .public_name =3D &quot;utmi-clock&quot;,<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void npcm7xx_clk_pll_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxClockPLLState *pll =3D NPCM7XX_CLOCK_PLL(obj);<br>
+<br>
+=C2=A0 =C2=A0 pll-&gt;clock_in =3D qdev_init_clock_in(DEVICE(pll), &quot;c=
lock-in&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_pll, pll);<br=
>
+=C2=A0 =C2=A0 pll-&gt;clock_out =3D qdev_init_clock_out(DEVICE(pll), &quot=
;clock-out&quot;);<br>
+}<br>
+<br>
+static void npcm7xx_clk_sel_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 NPCM7xxClockSELState *sel =3D NPCM7XX_CLOCK_SEL(obj);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sel-&gt;clock_in[i] =3D qdev_init_clock_in(DEV=
ICE(sel),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_strdup_printf(&q=
uot;clock-in[%d]&quot;, i),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update=
_sel, sel);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 sel-&gt;clock_out =3D qdev_init_clock_out(DEVICE(sel), &quot=
;clock-out&quot;);<br>
+}<br>
+static void npcm7xx_clk_divider_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 NPCM7xxClockDividerState *div =3D NPCM7XX_CLOCK_DIVIDER(obj)=
;<br>
+<br>
+=C2=A0 =C2=A0 div-&gt;clock_in =3D qdev_init_clock_in(DEVICE(div), &quot;c=
lock-in&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_divider, div)=
;<br>
+=C2=A0 =C2=A0 div-&gt;clock_out =3D qdev_init_clock_out(DEVICE(div), &quot=
;clock-out&quot;);<br>
+}<br>
+<br>
+static void npcm7xx_init_clock_pll(NPCM7xxClockPLLState *pll,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxCLKState *clk, const PLLInitInfo *init_=
info)<br>
+{<br>
+=C2=A0 =C2=A0 pll-&gt;name =3D init_info-&gt;name;<br>
+=C2=A0 =C2=A0 pll-&gt;clk =3D clk;<br>
+=C2=A0 =C2=A0 pll-&gt;reg =3D init_info-&gt;reg;<br>
+=C2=A0 =C2=A0 if (init_info-&gt;public_name !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_alias_clock(DEVICE(pll), &quot;clock-out&=
quot;, DEVICE(clk),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init_info-&gt;publ=
ic_name);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_init_clock_sel(NPCM7xxClockSELState *sel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxCLKState *clk, const SELInitInfo *init_=
info)<br>
+{<br>
+=C2=A0 =C2=A0 int input_size =3D init_info-&gt;input_size;<br>
+<br>
+=C2=A0 =C2=A0 sel-&gt;name =3D init_info-&gt;name;<br>
+=C2=A0 =C2=A0 sel-&gt;clk =3D clk;<br>
+=C2=A0 =C2=A0 sel-&gt;input_size =3D init_info-&gt;input_size;<br>
+=C2=A0 =C2=A0 g_assert(input_size &lt;=3D NPCM7XX_CLK_SEL_MAX_INPUT);<br>
+=C2=A0 =C2=A0 sel-&gt;offset =3D init_info-&gt;offset;<br>
+=C2=A0 =C2=A0 sel-&gt;len =3D init_info-&gt;len;<br>
+=C2=A0 =C2=A0 if (init_info-&gt;public_name !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_alias_clock(DEVICE(sel), &quot;clock-out&=
quot;, DEVICE(clk),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init_info-&gt;publ=
ic_name);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_init_clock_divider(NPCM7xxClockDividerState *div,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxCLKState *clk, const DividerInitInfo *i=
nit_info)<br>
+{<br>
+=C2=A0 =C2=A0 div-&gt;name =3D init_info-&gt;name;<br>
+=C2=A0 =C2=A0 div-&gt;clk =3D clk;<br>
+<br>
+=C2=A0 =C2=A0 div-&gt;divide =3D init_info-&gt;divide;<br>
+=C2=A0 =C2=A0 if (div-&gt;divide =3D=3D divide_by_constant) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 div-&gt;divisor =3D init_info-&gt;divisor;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 div-&gt;reg =3D init_info-&gt;reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 div-&gt;offset =3D init_info-&gt;offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 div-&gt;len =3D init_info-&gt;len;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (init_info-&gt;public_name !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_alias_clock(DEVICE(div), &quot;clock-out&=
quot;, DEVICE(clk),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init_info-&gt;publ=
ic_name);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static Clock *npcm7xx_get_clock(NPCM7xxCLKState *clk, ClockSrcType type,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int index)<br>
+{<br>
+=C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 case CLKSRC_REF:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk-&gt;clkref;<br>
+=C2=A0 =C2=A0 case CLKSRC_PLL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk-&gt;plls[index].clock_out;<br>
+=C2=A0 =C2=A0 case CLKSRC_SEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk-&gt;sels[index].clock_out;<br>
+=C2=A0 =C2=A0 case CLKSRC_DIV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk-&gt;dividers[index].clock_out;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void npcm7xx_connect_clocks(NPCM7xxCLKState *clk)<br>
+{<br>
+=C2=A0 =C2=A0 int i, j;<br>
+=C2=A0 =C2=A0 Clock *src;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_PLLS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D npcm7xx_get_clock(clk, pll_init_info_l=
ist[i].src_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pll_init_info_list=
[i].src_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_set_source(clk-&gt;plls[i].clock_in, src=
);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_SELS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; sel_init_info_list[i].inp=
ut_size; ++j) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D npcm7xx_get_clock(clk, s=
el_init_info_list[i].src_type[j],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel_=
init_info_list[i].src_index[j]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_set_source(clk-&gt;sels[i]=
.clock_in[j], src);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D npcm7xx_get_clock(clk, divider_init_in=
fo_list[i].src_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divider_init_info_=
list[i].src_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clock_set_source(clk-&gt;dividers[i].clock_in,=
 src);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static uint64_t npcm7xx_clk_read(void *opaque, hwaddr offset, unsigne=
d size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t reg =3D offset / sizeof(uint32_t);<br>
@@ -129,7 +740,7 @@ static uint64_t npcm7xx_clk_read(void *opaque, hwaddr o=
ffset, unsigned size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The 4 LSBs are always zero: (1e9 / 640=
) &lt;&lt; 4 =3D 25000000.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (((now_ns - s-&gt;ref_ns) / 640) &lt=
;&lt; 4) % NPCM7XX_TIMER_REF_HZ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (((now_ns - s-&gt;ref_ns) / 640) &lt=
;&lt; 4) % NPCM7XX_CLOCK_REF_HZ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
@@ -183,6 +794,20 @@ static void npcm7xx_clk_write(void *opaque, hwaddr off=
set,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value |=3D (v=
alue &amp; PLLCON_LOKS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only update PLL when it is locked. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; PLLCON_LOKI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_pll(&amp;s-&g=
t;plls[find_pll_by_reg(reg)]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_CLKSEL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_all_sels(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_CLKDIV1:<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_CLKDIV2:<br>
+=C2=A0 =C2=A0 case NPCM7XX_CLK_CLKDIV3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_all_dividers(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case NPCM7XX_CLK_CNTR25M:<br>
@@ -234,6 +859,7 @@ static void npcm7xx_clk_enter_reset(Object *obj, ResetT=
ype type)<br>
=C2=A0 =C2=A0 =C2=A0case RESET_TYPE_COLD:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(s-&gt;regs, cold_reset_values, siz=
eof(cold_reset_values));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ref_ns =3D qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_all_clocks(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -245,6 +871,42 @@ static void npcm7xx_clk_enter_reset(Object *obj, Reset=
Type type)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func=
__, type);<br>
=C2=A0}<br>
<br>
+static void npcm7xx_clk_init_clock_hierarchy(NPCM7xxCLKState *s)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;clkref =3D qdev_init_clock_in(DEVICE(s), &quot;clkref&=
quot;, NULL, NULL);<br>
+<br>
+=C2=A0 =C2=A0 /* First pass: init all converter modules */<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(pll_init_info_list) !=3D NPCM7X=
X_CLOCK_NR_PLLS);<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(sel_init_info_list) !=3D NPCM7X=
X_CLOCK_NR_SELS);<br>
+=C2=A0 =C2=A0 QEMU_BUILD_BUG_ON(ARRAY_SIZE(divider_init_info_list)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D NPCM7XX_CLOCK_NR_DIVIDERS);=
<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_PLLS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(OBJECT(s), pll_init_in=
fo_list[i].name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;plls[i]=
, TYPE_NPCM7XX_CLOCK_PLL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_init_clock_pll(&amp;s-&gt;plls[i], s,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pll_init_info=
_list[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_SELS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(OBJECT(s), sel_init_in=
fo_list[i].name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;sels[i]=
, TYPE_NPCM7XX_CLOCK_SEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_init_clock_sel(&amp;s-&gt;sels[i], s,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sel_init_info=
_list[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(OBJECT(s), divider_ini=
t_info_list[i].name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;divider=
s[i], TYPE_NPCM7XX_CLOCK_DIVIDER);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_init_clock_divider(&amp;s-&gt;dividers=
[i], s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;divider_init_=
info_list[i]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Second pass: connect converter modules */<br>
+=C2=A0 =C2=A0 npcm7xx_connect_clocks(s);<br>
+<br>
+=C2=A0 =C2=A0 clock_update_hz(s-&gt;clkref, NPCM7XX_CLOCK_REF_HZ);<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_clk_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NPCM7xxCLKState *s =3D NPCM7XX_CLK(obj);<br>
@@ -252,21 +914,114 @@ static void npcm7xx_clk_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;npcm7=
xx_clk_ops, s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_NPCM7XX_CLK, 4 * KiB);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(&amp;s-&gt;parent, &amp;s-&gt;iomem);<=
br>
+}<br>
+<br>
+static int npcm7xx_clk_post_load(void *opaque, int version_id)<br>
+{<br>
+=C2=A0 =C2=A0 if (version_id &gt;=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7xxCLKState *clk =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_clk_update_all_clocks(clk);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void npcm7xx_clk_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 NPCM7xxCLKState *s =3D NPCM7XX_CLK(dev);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_in_named(DEVICE(s), npcm7xx_clk_perform_=
watchdog_reset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_WATCHDOG_RESET_GPIO=
_IN, NPCM7XX_NR_WATCHDOGS);<br>
+=C2=A0 =C2=A0 npcm7xx_clk_init_clock_hierarchy(s);<br>
+<br>
+=C2=A0 =C2=A0 /* Realize child devices */<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_PLLS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;plls[i]), =
NULL, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_SELS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;sels[i]), =
NULL, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_CLOCK_NR_DIVIDERS; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;dividers[i=
]), NULL, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
-static const VMStateDescription vmstate_npcm7xx_clk =3D {<br>
-=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-clk&quot;,<br>
+static const VMStateDescription vmstate_npcm7xx_clk_pll =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-clock-pll&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D=C2=A0 (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clock_in, NPCM7xxClockPLLState),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_clk_sel =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-clock-sel&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D=C2=A0 (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(clock_in, N=
PCM7xxClockSELState,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_CLK_SEL_MA=
X_INPUT, 0, vmstate_clock, Clock),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_clk_divider =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-clock-divider&quot;,<br>
=C2=A0 =C2=A0 =C2=A0.version_id =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0.minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .fields =3D=C2=A0 (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clock_in, NPCM7xxClockDividerSta=
te),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static const VMStateDescription vmstate_npcm7xx_clk =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;npcm7xx-clk&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .post_load =3D npcm7xx_clk_post_load,<br>
=C2=A0 =C2=A0 =C2=A0.fields =3D (VMStateField[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT32_ARRAY(regs, NPCM7xxCLKStat=
e, NPCM7XX_CLK_NR_REGS),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_INT64(ref_ns, NPCM7xxCLKState),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_CLOCK(clkref, NPCM7xxCLKState),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST(),<br>
=C2=A0 =C2=A0 =C2=A0},<br>
=C2=A0};<br>
<br>
+static void npcm7xx_clk_pll_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;NPCM7xx Clock PLL Module&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_clk_pll;<br>
+}<br>
+<br>
+static void npcm7xx_clk_sel_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;NPCM7xx Clock SEL Module&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_clk_sel;<br>
+}<br>
+<br>
+static void npcm7xx_clk_divider_class_init(ObjectClass *klass, void *data)=
<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;NPCM7xx Clock Divider Module&quot;;<br=
>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_clk_divider;<br>
+}<br>
+<br>
=C2=A0static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
@@ -276,9 +1031,34 @@ static void npcm7xx_clk_class_init(ObjectClass *klass=
, void *data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;desc =3D &quot;NPCM7xx Clock Control Registers&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd =3D &amp;vmstate_npcm7xx_clk;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D npcm7xx_clk_realize;<br>
=C2=A0 =C2=A0 =C2=A0rc-&gt;phases.enter =3D npcm7xx_clk_enter_reset;<br>
=C2=A0}<br>
<br>
+static const TypeInfo npcm7xx_clk_pll_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_CLOCK_PLL,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxClockPL=
LState),<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_clk_pll_init,=
<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_clk=
_pll_class_init,<br>
+};<br>
+<br>
+static const TypeInfo npcm7xx_clk_sel_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_CLOCK_SEL,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxClockSE=
LState),<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_clk_sel_init,=
<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_clk=
_sel_class_init,<br>
+};<br>
+<br>
+static const TypeInfo npcm7xx_clk_divider_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_NPCM7XX_CLOCK_DIVIDER,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D T=
YPE_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =C2=A0 =C2=A0 =3D sizeof(NPCM7xxClockDi=
viderState),<br>
+=C2=A0 =C2=A0 .instance_init=C2=A0 =C2=A0 =C2=A0 =3D npcm7xx_clk_divider_i=
nit,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm7xx_clk=
_divider_class_init,<br>
+};<br>
+<br>
=C2=A0static const TypeInfo npcm7xx_clk_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D TYPE_NPCM7XX_CLK,<br>
=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D TYPE_SYS_BUS_DEVICE,<br>
@@ -289,6 +1069,9 @@ static const TypeInfo npcm7xx_clk_info =3D {<br>
<br>
=C2=A0static void npcm7xx_clk_register_type(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;npcm7xx_clk_pll_info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;npcm7xx_clk_sel_info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;npcm7xx_clk_divider_info);<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;npcm7xx_clk_info);<br>
=C2=A0}<br>
=C2=A0type_init(npcm7xx_clk_register_type);<br>
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h<=
br>
index 2338fbbdb5..f641f95f3e 100644<br>
--- a/include/hw/misc/npcm7xx_clk.h<br>
+++ b/include/hw/misc/npcm7xx_clk.h<br>
@@ -17,6 +17,7 @@<br>
=C2=A0#define NPCM7XX_CLK_H<br>
<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
+#include &quot;hw/clock.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
<br>
=C2=A0/*<br>
@@ -33,16 +34,151 @@<br>
<br>
=C2=A0#define NPCM7XX_WATCHDOG_RESET_GPIO_IN &quot;npcm7xx-clk-watchdog-res=
et-gpio-in&quot;<br>
<br>
-typedef struct NPCM7xxCLKState {<br>
+/* Maximum amount of clock inputs in a SEL module. */<br>
+#define NPCM7XX_CLK_SEL_MAX_INPUT 5<br>
+<br>
+/* PLLs in CLK module. */<br>
+typedef enum NPCM7xxClockPLL {<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL0,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL1,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLLG,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_NR_PLLS,<br>
+} NPCM7xxClockPLL;<br>
+<br>
+/* SEL/MUX in CLK module. */<br>
+typedef enum NPCM7xxClockSEL {<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PIXCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_MCCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_CPUCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_CLKOUTSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_UARTCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_TIMCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_SDCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_GFXMSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_SUCKSEL,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_NR_SELS,<br>
+} NPCM7xxClockSEL;<br>
+<br>
+/* Dividers in CLK module. */<br>
+typedef enum NPCM7xxClockDivider {<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL1D2, /* PLL1/2 */<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_PLL2D2, /* PLL2/2 */<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_MC_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_AXI_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_AHB_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_AHB3_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_SPI0_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_SPIX_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_APB1_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_APB2_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_APB3_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_APB4_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_APB5_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_CLKOUT_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_UART_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_TIMER_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_ADC_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_MMC_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_SDHC_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_GFXM_DIVIDER, /* divide by 3 */<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_UTMI_DIVIDER,<br>
+=C2=A0 =C2=A0 NPCM7XX_CLOCK_NR_DIVIDERS,<br>
+} NPCM7xxClockConverter;<br>
+<br>
+typedef struct NPCM7xxCLKState NPCM7xxCLKState;<br>
+<br>
+/**<br>
+ * struct NPCM7xxClockPLLState - A PLL module in CLK module.<br>
+ * @name: The name of the module.<br>
+ * @clk: The CLK module that owns this module.<br>
+ * @clock_in: The input clock of this module.<br>
+ * @clock_out: The output clock of this module.<br>
+ * @reg: The control registers for this PLL module.<br>
+ */<br>
+typedef struct NPCM7xxClockPLLState {<br>
+=C2=A0 =C2=A0 DeviceState parent;<br>
+<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 NPCM7xxCLKState *clk;<br>
+=C2=A0 =C2=A0 Clock *clock_in;<br>
+=C2=A0 =C2=A0 Clock *clock_out;<br>
+<br>
+=C2=A0 =C2=A0 int reg;<br>
+} NPCM7xxClockPLLState;<br>
+<br>
+/**<br>
+ * struct NPCM7xxClockSELState - A SEL module in CLK module.<br>
+ * @name: The name of the module.<br>
+ * @clk: The CLK module that owns this module.<br>
+ * @input_size: The size of inputs of this module.<br>
+ * @clock_in: The input clocks of this module.<br>
+ * @clock_out: The output clocks of this module.<br>
+ * @offset: The offset of this module in the control register.<br>
+ * @len: The length of this module in the control register.<br>
+ */<br>
+typedef struct NPCM7xxClockSELState {<br>
+=C2=A0 =C2=A0 DeviceState parent;<br>
+<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 NPCM7xxCLKState *clk;<br>
+=C2=A0 =C2=A0 uint8_t input_size;<br>
+=C2=A0 =C2=A0 Clock *clock_in[NPCM7XX_CLK_SEL_MAX_INPUT];<br>
+=C2=A0 =C2=A0 Clock *clock_out;<br>
+<br>
+=C2=A0 =C2=A0 int offset;<br>
+=C2=A0 =C2=A0 int len;<br>
+} NPCM7xxClockSELState;<br>
+<br>
+/**<br>
+ * struct NPCM7xxClockDividerState - A Divider module in CLK module.<br>
+ * @name: The name of the module.<br>
+ * @clk: The CLK module that owns this module.<br>
+ * @clock_in: The input clock of this module.<br>
+ * @clock_out: The output clock of this module.<br>
+ * @divide: The function the divider uses to divide the input.<br>
+ * @reg: The index of the control register that contains the divisor.<br>
+ * @offset: The offset of the divisor in the control register.<br>
+ * @len: The length of the divisor in the control register.<br>
+ * @divisor: The divisor for a constant divisor<br>
+ */<br>
+typedef struct NPCM7xxClockDividerState {<br>
+=C2=A0 =C2=A0 DeviceState parent;<br>
+<br>
+=C2=A0 =C2=A0 const char *name;<br>
+=C2=A0 =C2=A0 NPCM7xxCLKState *clk;<br>
+=C2=A0 =C2=A0 Clock *clock_in;<br>
+=C2=A0 =C2=A0 Clock *clock_out;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t (*divide)(struct NPCM7xxClockDividerState *s);<br>
+=C2=A0 =C2=A0 union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int divisor;<br>
+=C2=A0 =C2=A0 };<br>
+} NPCM7xxClockDividerState;<br>
+<br>
+struct NPCM7xxCLKState {<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice parent;<br>
<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion iomem;<br>
<br>
+=C2=A0 =C2=A0 /* Clock converters */<br>
+=C2=A0 =C2=A0 NPCM7xxClockPLLState plls[NPCM7XX_CLOCK_NR_PLLS];<br>
+=C2=A0 =C2=A0 NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];<br>
+=C2=A0 =C2=A0 NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS]=
;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0uint32_t regs[NPCM7XX_CLK_NR_REGS];<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Time reference for SECCNT and CNTR25M, initialized b=
y power on reset */<br>
=C2=A0 =C2=A0 =C2=A0int64_t ref_ns;<br>
-} NPCM7xxCLKState;<br>
+<br>
+=C2=A0 =C2=A0 /* The incoming reference clock. */<br>
+=C2=A0 =C2=A0 Clock *clkref;<br>
+};<br>
<br>
=C2=A0#define TYPE_NPCM7XX_CLK &quot;npcm7xx-clk&quot;<br>
=C2=A0#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NP=
CM7XX_CLK)<br>
-- <br>
2.29.2.684.gfbc64c5ab5-goog<br>
<br>
</blockquote></div>

--0000000000005740c705b675ac42--

