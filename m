Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B762F9C3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3ha-0003Ft-P7; Fri, 18 Nov 2022 10:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3hW-0003FM-Iu
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:54:46 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3hU-00032E-Gj
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:54:46 -0500
Received: by mail-pg1-x52d.google.com with SMTP id f9so1134341pgf.7
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E8tgiun25xft8E2wv08jxEZA1rQtHHO+7xdH867jsvA=;
 b=e7Ucw+bmbMA8r1lQHKkmDn1Ycpqcb+7MJEeorYbbSibVNGhGx/JV0GIWisHL7Geqfg
 vtJ9uu4hFJqyibbYUaM0WNmR+MwO1EX5MkVqIjoKmrYsBl1uj3KmO27m8C1Tbs6zD1qq
 qrtsB22WXpwkplNtrNbU3ORZ3reFEfIlDuy08q4StmObFhTG7blV2ANDWzX1FBhxoIAJ
 ZPGk6iA9eYYw2BWOsB6p19xqgQDkfvAcm/N2OBEktYX1VXA9dDzvZvjxjWkwqSJsQm/f
 dV7I6dAnTcSA26nkBlUrzZlO9DcX+AS/OO8kGGKHWQ/FStDdk14InpdqqeDsiwY2eCbZ
 +VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8tgiun25xft8E2wv08jxEZA1rQtHHO+7xdH867jsvA=;
 b=ulHRngYR30/O0ojOYy5j1mp4pChu8g/xcBQCXdAMT9Zep2kM7HE2uIVaYXrTBbEcWS
 Apg5xgqBaoepV/NGdSZjRwbDS5U8tZ4q+mLKkcKr8vrGlFZCEDrK4MuQ8Ae3K4O4SvlO
 GuFoNYDI+lFqQwXff8aZCZMllpObS6mNWsYZ5BL9f0GWmN6y8xPM30TTy/NvPFQDysBb
 +0e3R683+1w66DTrxskgkARTHxiOGa+iH6wxQ0ZBc/lGc3kf3pPxoRwhsYfVPLz4WKtQ
 3RFu/sjHS/QcfNGHyyYqQhlgMdOAJe/yfI6/dOQPcKdX9dI2/vCpNgQYNxrN2IpwYyGJ
 LxuQ==
X-Gm-Message-State: ANoB5pkrHClxUQRaokTsbsf2OxqYFTU7JUvFIPvvC/Jq4D1BFDccr7lr
 OXwIrC3chtAm1J0g6vx07koWXw8KJcVbBDiFW8H7Sg==
X-Google-Smtp-Source: AA0mqf7CNKlWCcXU2oNPB8pAc1BGMPItdwoCwpwCwDVUpqViacaH3Aqyuv0NWgbmCeRIuSkb13AYpjoV+WQ1u3IXjrE=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr8388130pfq.26.1668786879587; Fri, 18
 Nov 2022 07:54:39 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-6@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-6@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:54:28 +0000
Message-ID: <CAFEAcA_=v03uWHTU46myOPZ6eZ0JHKaC68+1SA7Kh6wKAdGOKA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 6/9] hw/timer/imx_epit: remove explicit fields
 cnt and freq
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The CNT register is a read-only register. There is no need to
> store it's value, it can be calculated on demand.
> The calculated frequency is needed temporarily only.

This patch bumps the vmstate version ID for the device, which
is a migration compatibility break. For this device/SoC,
that's fine, but we generally prefer to note the break
explicitly in the commit message (eg see commit 759ae1b47e7
or commit 23f6e3b11be for examples).

> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c         | 76 +++++++++++++++----------------------
>  include/hw/timer/imx_epit.h |  2 -
>  2 files changed, 30 insertions(+), 48 deletions(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 6af460946f..b0ef727efb 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -61,27 +61,16 @@ static const IMXClk imx_epit_clocks[] =  {
>      CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
>  };
>
> -/*
> - * Must be called from within a ptimer_transaction_begin/commit block
> - * for both s->timer_cmp and s->timer_reload.
> - */
> -static void imx_epit_set_freq(IMXEPITState *s)
> +static uint32_t imx_epit_get_freq(IMXEPITState *s)
>  {
> -    uint32_t clksrc;
> -    uint32_t prescaler;
> -
> -    clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
> -    prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
> -
> -    s->freq = imx_ccm_get_clock_frequency(s->ccm,
> -                                imx_epit_clocks[clksrc]) / prescaler;
> -
> -    DPRINTF("Setting ptimer frequency to %u\n", s->freq);
> -
> -    if (s->freq) {
> -        ptimer_set_freq(s->timer_reload, s->freq);
> -        ptimer_set_freq(s->timer_cmp, s->freq);
> -    }
> +    uint32_t clksrc = extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
> +    uint32_t prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT,
> +                                       CR_PRESCALE_BITS);

These lines have been reformatted but that doesn't have anything
to do with the change to switch from s->freq to a local variable.
If you want to make formatting-type changes can you keep those
separate from other patches, please? It makes things a lot easier
to review.

> +    uint32_t f_in = imx_ccm_get_clock_frequency(s->ccm,
> +                                                imx_epit_clocks[clksrc]);
> +    uint32_t freq = f_in / prescaler;
> +    DPRINTF("ptimer frequency is %u\n", freq);
> +    return freq;
>  }
>
>  static void imx_epit_reset(DeviceState *dev)
> @@ -93,36 +82,26 @@ static void imx_epit_reset(DeviceState *dev)
>      s->sr = 0;
>      s->lr = EPIT_TIMER_MAX;
>      s->cmp = 0;
> -    s->cnt = 0;
> -
>      /* clear the interrupt */
>      qemu_irq_lower(s->irq);
>
>      ptimer_transaction_begin(s->timer_cmp);
>      ptimer_transaction_begin(s->timer_reload);
> -    /* stop both timers */
> +
> +    /*
> +     * The reset switches off the input clock, so even if the CR.EN is still
> +     * set, the timers are no longer running.
> +     */
> +    assert(0 == imx_epit_get_freq(s));

Don't use yoda conditionals, please. "imx_epit_get_freq(s) == 0" is the
QEMU standard way to write this.

>      ptimer_stop(s->timer_cmp);
>      ptimer_stop(s->timer_reload);
> -    /* compute new frequency */
> -    imx_epit_set_freq(s);
>      /* init both timers to EPIT_TIMER_MAX */
>      ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
>      ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
> -    if (s->freq && (s->cr & CR_EN)) {
> -        /* if the timer is still enabled, restart it */
> -        ptimer_run(s->timer_reload, 0);
> -    }
>      ptimer_transaction_commit(s->timer_cmp);
>      ptimer_transaction_commit(s->timer_reload);
>  }

Otherwise the patch looks good.

thanks
-- PMM

