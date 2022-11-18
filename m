Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C992E62FDAE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 20:02:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow6bw-0001Za-8h; Fri, 18 Nov 2022 14:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6bu-0001Z6-5q
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:01:10 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow6bp-0005su-9H
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 14:01:09 -0500
Received: by mail-pg1-x535.google.com with SMTP id n17so5743885pgh.9
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 11:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g/w7Af8YXFedDR9eCd1f6jYgjnmBPzRtexW409YXHzY=;
 b=ZzYAeblX6HUWr0mdXQedGWlTI74+UDqAlnGDCeGFzIAJRassPfc4Pp6Uoj9gwbyrcv
 z3XrcDJILYjcrkNSHqGoWXATU43b6zf2xkDzWSaRd5PsOnZ6GNDVs67nttbTUfnaevDG
 6i/6KmbxZrssKKJu2VfjGX2mkGRmo9mfnLX2AKcV9Qg0qrOJtKBQgANMKqp0w2KjQzGe
 VrxiTIyhJghdf/cS7LcBbgb6/yFOzZ4tuE0QfGUG2BDMM880CdtJoMsIWeIrWPu7JOgm
 wlQzcbFNjHtH+EIjsdEo4qXB8a/qDde+hvlCTZViwwX3jSN6FmZ6jbfopo9gT6EVr83H
 6ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/w7Af8YXFedDR9eCd1f6jYgjnmBPzRtexW409YXHzY=;
 b=3Kzf4j8Zh7Nwqm1/zUzMW0rhiHb/6CrvUn5v2MAztACvIkLrjwypOAZgIgMrJqTUHd
 0N4NosC4MqG31z1WRL3PDxHHh0QCgD3m77Aj/SnHoqYhV/RYF65WGhd2nClFCq07VQBK
 GMoo0l2uZRGTLtWUfGpTqFmDfQMS/oDiNnDHVLg+7Q7SJAE6gGivAymmQKZJwI7yD5nx
 eh8SzloJOFCgR+K7Oqr9ACO4ISzO+7KDiLFC9yHb+ev8rsWxV3/enqgVbGUCIslKdqyq
 y/bre+pm3Xm3nM01mEXb3FJy3ULn/54CTKmVELxj4eQpeN8/JpeC9nifBheinLZaXPew
 cBxA==
X-Gm-Message-State: ANoB5pl6271hp/lrqWxDhHUjcz1IXF5do/OxyLW32R9IkuK/3b28K3eA
 3p2+IXT3MkD5z9ED5zHl1++sWhOfyh9m8Z+kJZL/MA==
X-Google-Smtp-Source: AA0mqf7E8QBJUT+XVk6oLZvNI4C1fOBudt2iv339GBYVNmMRadxbIwMhGm08nDsw2adjKo/W8rZigOkMGrKQ2BePJFE=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr9100382pfq.26.1668798063431; Fri, 18
 Nov 2022 11:01:03 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-9@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-9@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 19:00:51 +0000
Message-ID: <CAFEAcA-hDkGMnz4iO_V1FHHPer7uSMuNyzoaJu8wuoHY8NpCgg@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 9/9] hw/timer/imx_epit: fix compare timer
 handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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
> - fix #1263
> - rework compare time handling
>   - The compare timer has to run even if CR.OCIEN is not set,
>     as SR.OCIF must be updated.
>   - The compare timer fires exactly once when the
>     compare value is less than the current value, but the
>     reload values is less than the compare value.
>   - The compare timer will never fire if the reload value is
>     less than the compare value. Disable it in this case.

If you're correcting behaviour of the timer use here,
you should start by fixing the way the timers are currently
created with PTIMER_POLICY_LEGACY. That setting is basically
"bug-for-bug-compatibility with very old QEMU, for devices
where nobody really knows what the hardware behaviour should
be". Where we do know what the hardware's supposed to do and
we have some way of testing we're not breaking guest code,
the right thing is to set the correct policy flags for
the desired behaviour. These are documented in a comment
near the top of include/hw/ptimer.h.

> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 188 +++++++++++++++++++++++++++++---------------
>  1 file changed, 123 insertions(+), 65 deletions(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 77bd2b0a2b..cb2880cabc 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -6,6 +6,7 @@
>   * Originally written by Hans Jiang
>   * Updated by Peter Chubb
>   * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
> + * Updated by Axel Heider
>   *
>   * This code is licensed under GPL version 2 or later.  See
>   * the COPYING file in the top-level directory.
> @@ -110,33 +111,84 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
>      return reg_value;
>  }
>
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
> +    /* The compare timer only has to run if the timer peripheral is active
> +     * and there is an input clock, Otherwise it can be switched off.
> +     */

QEMU coding style wants the "/*" on a line of its own in multiline comments.

> +    bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
> +    if (is_active)
> +    {

Brace goes on same line as "if".

> +        /*
> +         * Calculate next timeout for compare timer. Reading the reload
> +         * counter returns proper results only if pending transactions
> +         * on it are committed here. Otherwise stale values are be read.
> +         */
> +        counter = ptimer_get_count(s->timer_reload);
> +        uint64_t limit = ptimer_get_limit(s->timer_cmp);
> +        /* The compare timer is a periodic timer if the limit is at least
> +         * the compare value. Otherwise it may fire at most once in the
> +         * current round.
> +         */
> +        bool is_oneshot = (limit >= s->cmp);
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
> +             * The compare timer wont fire in this round, and the limit is

"won't"

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
> +     * of CR.OCIEN bit, as this only matters for interrupt generation. The
> +     * compare timer needs to run in any case, as the SR.OCIF bit must be
> +     * updated even if no interrupt in generated.

"is generated"

> +     * Note that the timer might already be stopped or be running with
> +     * counter values. However, finding out when an update is needed and
> +     * when not is not trivial. It's much easier applying the setting again,
> +     * as this does not harm either and the overhead is negligible.
> +     */

It is modestly harmful because the sequence
   counter = ptimer_get_count(s->timer_reload);
   ...
   ptimer_set_count(s->timer_cmp, counter);

will cause the counter to lose or gain time. This happens because when
you call "get" the ptimer code will look at the current exact
time in nanoseconds and tell you the counter value at that point.
That is probably somewhere in the middle of a timer-clock period
(which runs at whatever frequency you tell the ptimer to use):
for argument's sake, suppose the timer-clock counts every 1000ns.
Suppose at the point of the 'get' the next tick will be in 300ns time.
When you do a "set" that is assumed to be the result of a guest
register write of some kind, and will effectively start a new
timer-clock period. This means the next tick will not be for
a full 1000ns, and we just lost 300ns (or gained 700ns perhaps).

So it's better to avoid this kind of "get-and-then-set" code.

> +    if (is_active) {
> +        ptimer_set_count(s->timer_cmp, counter);
> +        ptimer_run(s->timer_cmp, is_oneshot ? 1 : 0);
> +    } else {
> +        ptimer_stop(s->timer_cmp);
> +    }
> +
>  }

> @@ -274,16 +326,22 @@ static void imx_epit_cmp(void *opaque)
>  {
>      IMXEPITState *s = IMX_EPIT(opaque);
>
> -    /* Set the interrupt status flag to signaled. */
> -    DPRINTF("sr was %d\n", s->sr);
> -    s->sr = 1;
> +    if (s->cr & CR_EN) {
> +        /* Set the interrupt status flag to signaled. */
> +        DPRINTF("sr was %d\n", s->sr);
> +        s->sr = 1;
>
> -    /*
> -     * An actual interrupt is generated only if the peripheral is enabled
> -     * and the interrupt generation is enabled.
> -     */
> -    if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN)) {
> -        qemu_irq_raise(s->irq);
> +        /* If CR,OCIEN is set, an actual interrupt is generated */
> +        if (s->cr & CR_OCIEN) {
> +            qemu_irq_raise(s->irq);
> +        }
> +    } else {
> +        /*
> +         * The cmp ptimer is not supposed to be running when the
> +         * peripheral is not enabled. Ignore this. However, it's
> +         * worth investigating why this happened.
> +         */
> +        DPRINTF("compare trigger when timer not enabled\n");

Is this a "can't happen, it would be a bug in this code"? If so,
use assert(). If it's a "guest code can program the timer in
silly ways" situation then either do what the hardware does
or (if it's not clear what that is) do something plausible.
You can use qemu_log_mask(LOG_GUEST_ERROR, ...) to log things
which are "guest has done something silly" if you like.

More generally, please don't introduce new uses of the DPRINTF
macro. For cases which are "this can be useful to the user to
log for debugging either the driver or their guest code" we
have a trace-events facility, where you put a line into
hw/timer/trace-events that specifies the prototype and format
string for the trace event, and then call a corresponding
trace_whatever() function in the code. Some of the other timer
devices do this, if you want to look at how it works.
Older device models like this one still use debug-print macros,
but they're not good practice in new code.

thanks
-- PMM

