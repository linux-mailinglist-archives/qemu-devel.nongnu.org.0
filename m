Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E56D67CD
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:45:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiqX-0004IW-MJ; Tue, 04 Apr 2023 11:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiqF-0004HT-TP
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:45:04 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiqC-000253-Ca
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:45:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id er13so91425671edb.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uB+NUxhB2f9O1zfRnJO76Hbw627RcL7S8kpnJ5Esk2c=;
 b=VLKPsGbt5OCIQ9qu4KmoelgwWbofEkhiQ0gHYRNTkCy0bPCFDsSQtf9kvftrfiUia/
 208d5XBRPB7cYv6tNDzGmEdtiq0ZiQn35azf4wzlGKX8hFjnaWGWpQLXyIs5O3TRvQlW
 1QnX6hDiWjKoWWE/+Kmh0i3mWJZwJaf4KteF8WC95YefY8fw9+IZ9ye9IZLNpMvaCUud
 YUHJz8C3A1zLT8LI2hO1B4ylJv9zuhevvKthHfKXKS2qPHIjakBEH6mrtT0HjGdKGF/D
 +5dN3UeEN1u/XDcE8Lof6d9svF0WvKFdSSrjsh1d1sjv9ZC5RP+LGQL1SczCYt3Oh5we
 FcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uB+NUxhB2f9O1zfRnJO76Hbw627RcL7S8kpnJ5Esk2c=;
 b=YQXX140dSgRVuHJUrdlxjrdWFdA1TJukcKHvSuNVxmCKtoTIcqNVyg2DL+tcK3k9Lp
 ZEniYHI9+V9ombBAmIaHdNBcXeTISe3GlMo5D2XeBXfgmYn5r27McCItfwviECh68a3u
 qJ+MgsUMgL18TUBt03MaydRrRlrsviAdvI9Gqk9/T+vZBaly9SvIR8KbboeTl+5CUHn3
 d+xGG0ey0UPYoHyRYeF4ao8IZAUiwUnkdAhv3KHqQ7CkbXneRbz35MdQjN+ev20bYIFF
 HRtTQy3nKiBhYf4QKbPpxeg7Z/Pr/9RPn7UTAt/dSp+3taSXshT96D7Nx/Gb/cxViUAf
 8CKQ==
X-Gm-Message-State: AAQBX9cl4ZaKrgTXHAS4Gb0WKf/j6yYurgQ62J9qkntDXHpxC7dTcoeO
 ioSAYWTRXJdqc3bxtJ7/qqx2GpeGzxpJffQvEX242w==
X-Google-Smtp-Source: AKy350acEm2sLBhEuvcF8oDsJmzonfrUXukWsBaNH+y320iQ5V/K5rKyWvwzKJhlw4PK9c2yJHMxlHj8YPgLE56uXfs=
X-Received: by 2002:a50:a457:0:b0:4fb:3549:a708 with SMTP id
 v23-20020a50a457000000b004fb3549a708mr1593195edb.6.1680623096284; Tue, 04 Apr
 2023 08:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 16:44:45 +0100
Message-ID: <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - fix #1263 for CR writes
> - rework compare time handling
>   - The compare timer has to run even if CR.OCIEN is not set,
>     as SR.OCIF must be updated.
>   - The compare timer fires exactly once when the
>     compare value is less than the current value, but the
>     reload values is less than the compare value.
>   - The compare timer will never fire if the reload value is
>     less than the compare value. Disable it in this case.
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Hi; Coverity has just noticed an issue with this patch:


> -/* Must be called from ptimer_transaction_begin/commit block for s->timer_cmp */
> -static void imx_epit_reload_compare_timer(IMXEPITState *s)
> +/*
> + * Must be called from a ptimer_transaction_begin/commit block for
> + * s->timer_cmp, but outside of a transaction block of s->timer_reload,
> + * so the proper counter value is read.
> + */
> +static void imx_epit_update_compare_timer(IMXEPITState *s)
>  {
> -    if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN))  {
> -        /* if the compare feature is on and timers are running */
> -        uint32_t tmp = ptimer_get_count(s->timer_reload);
> -        uint64_t next;
> -        if (tmp > s->cmp) {
> -            /* It'll fire in this round of the timer */
> -            next = tmp - s->cmp;
> -        } else { /* catch it next time around */
> -            next = tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->lr);
> +    uint64_t counter = 0;
> +    bool is_oneshot = false;

Here we declare the is_oneshot variable...

> +    /* The compare timer only has to run if the timer peripheral is active
> +     * and there is an input clock, Otherwise it can be switched off.
> +     */
> +    bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
> +    if (is_active) {
> +        /*
> +         * Calculate next timeout for compare timer. Reading the reload
> +         * counter returns proper results only if pending transactions
> +         * on it are committed here. Otherwise stale values are be read.
> +         */
> +        counter = ptimer_get_count(s->timer_reload);
> +        uint64_t limit = ptimer_get_limit(s->timer_cmp);
> +        /*
> +         * The compare timer is a periodic timer if the limit is at least
> +         * the compare value. Otherwise it may fire at most once in the
> +         * current round.
> +         */
> +        bool is_oneshot = (limit >= s->cmp);

...but here we declare another is_oneshot, which shadows the first
declaration...

> +        if (counter >= s->cmp) {
> +            /* The compare timer fires in the current round. */
> +            counter -= s->cmp;
> +        } else if (!is_oneshot) {
> +            /*
> +             * The compare timer fires after a reload, as it below the
> +             * compare value already in this round. Note that the counter
> +             * value calculated below can be above the 32-bit limit, which
> +             * is legal here because the compare timer is an internal
> +             * helper ptimer only.
> +             */
> +            counter += limit - s->cmp;
> +        } else {
> +            /*
> +             * The compare timer won't fire in this round, and the limit is
> +             * set to a value below the compare value. This practically means
> +             * it will never fire, so it can be switched off.
> +             */
> +            is_active = false;
>          }
> -        ptimer_set_count(s->timer_cmp, next);
>      }
> +
> +    /*
> +     * Set the compare timer and let it run, or stop it. This is agnostic
> +     * of CR.OCIEN bit, as this bit affects interrupt generation only. The
> +     * compare timer needs to run even if no interrupts are to be generated,
> +     * because the SR.OCIF bit must be updated also.
> +     * Note that the timer might already be stopped or be running with
> +     * counter values. However, finding out when an update is needed and
> +     * when not is not trivial. It's much easier applying the setting again,
> +     * as this does not harm either and the overhead is negligible.
> +     */
> +    if (is_active) {
> +        ptimer_set_count(s->timer_cmp, counter);
> +        ptimer_run(s->timer_cmp, is_oneshot ? 1 : 0);

...so here when the inner variable is no longer in scope, the
value of the outer is_oneshot variable must always be 'false',
because there's never any assignment to it.

> +    } else {
> +        ptimer_stop(s->timer_cmp);
> +    }
> +
>  }

What was the intention here? My guess is that there should only
have been one 'is_oneshot', not two.

There's also been this bug report:
https://gitlab.com/qemu-project/qemu/-/issues/1491
which suggests that the condition for setting is_oneshot
should be "(limit <= s->cmp)" rather than ">=".

What do you think ?

thanks
-- PMM

