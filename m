Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44F3EAE2C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 03:34:51 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEM5y-0004bC-G7
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 21:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM4s-0003VD-6p; Thu, 12 Aug 2021 21:33:42 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mEM4q-0007av-8L; Thu, 12 Aug 2021 21:33:41 -0400
Received: by mail-io1-xd35.google.com with SMTP id i7so11184451iow.1;
 Thu, 12 Aug 2021 18:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhkAE8tkn9MfsnBrHkZsqHMhrScrDNg419NIbhmvMy4=;
 b=pmR6AauPzxFR9xfkslALtJW6PudczxSVucrzexmKlVbnf5Zf5j9R82SJcpkKERr0qa
 /gEPYZchqcu6xR1nS/zcKeUSWEAYlOWglKbT78cLwL5nIWiBddy3sfc/JcIfStIcEAq4
 6tQbQY7V5jbL3Sz1GwrvAqh9ssCmkHmSm1eezLzpXGpEZoKPpib91aLpFmn2tTM3oa2g
 v/2MCJVEavEvvV1OzEdXrdTMCkcWzSuN+MmJnoZpZx4Jw0tgaBHjHiOQsZ6nbs1H/H4S
 2qydeGurltAnz6AoXkca6/m90ZpzVE5Pplao4h7mcFBA01I6WneHwu32wnm7UclyvMnM
 kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhkAE8tkn9MfsnBrHkZsqHMhrScrDNg419NIbhmvMy4=;
 b=oEsfU8U3R2SiYLrNf2Fe2YztiDw0cqLahT3hkjtZqAyr8uu6KMBuUnzq5aujxr4WPg
 HMHC4gcNJZEqg13Be33rUSb+jEkTQHgUISH5qX088j9FzYIVm8Bd5CXKEyLXv0V8meZx
 DglZu90n2uXgJF9J7acGrUAK5gUJ9+A3kkVY6OAw3kgiUpucex4JlUX5dNLLfrifHU4O
 iWuewN55tk3Z+E9ecyQqIGP9e8qoqudv2dmzM1xl0gFZ7opVN7CsOJAV5mvqL6waDhef
 SoPG2rr7ykELnP4KX3QOac4+3fjWh0obVpS/3lKdE6zJKRF12kiS/tmiyPsl7ZmB2GpR
 QuJA==
X-Gm-Message-State: AOAM533XFpL+aec3lNyTbS4KMhi2gGjinjq6qPgD0G3uEdtF5YPbh8S0
 tgZ7M5itkMsGLhSr7QmXeycZCM6wwaNL2aQXEVE=
X-Google-Smtp-Source: ABdhPJxseoSXoKtR4NsI6ZBCKFyMyMXiD0GFXYELIFliIMEH+HHgENtGH5A1079MLyEbTAGlPcPDPR6NA9RfMg6DjBQ=
X-Received: by 2002:a05:6638:240d:: with SMTP id
 z13mr6481097jat.8.1628818418745; 
 Thu, 12 Aug 2021 18:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Aug 2021 11:33:12 +1000
Message-ID: <CAKmqyKPUNY4W1Qz9kia3oMXjRaAc0+ota+2270b=ZPXt2sdr3Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 7:38 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> It is quite common for a clock tree to involve possibly programmable
> clock multipliers or dividers, where the frequency of a clock is for
> instance divided by 8 to produce a slower clock to feed to a
> particular device.
>
> Currently we provide no convenient mechanism for modelling this.  You
> can implement it by having an input Clock and an output Clock, and
> manually setting the period of the output clock in the period-changed
> callback of the input clock, but that's quite clunky.
>
> This patch adds support in the Clock objects themselves for setting a
> multiplier or divider.  The effect of setting this on a clock is that
> when the clock's period is changed, all the children of the clock are
> set to period * multiplier / divider, rather than being set to the
> same period as the parent clock.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
>  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
>  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
>  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
>  4 files changed, 100 insertions(+), 5 deletions(-)
>
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 956bd147ea0..430fbd842e5 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, *Clock 3* and *Clock 4*.
>  It is not possible to disconnect a clock or to change the clock connection
>  after it is connected.
>
> +Clock multiplier and divider settings
> +-------------------------------------
> +
> +By default, when clocks are connected together, the child
> +clocks run with the same period as their source (parent) clock.
> +The Clock API supports a built-in period multiplier/divider
> +mechanism so you can configure a clock to make its children
> +run at a different period from its own. If you call the
> +``clock_set_mul_div()`` function you can specify the clock's
> +multiplier and divider values. The children of that clock
> +will all run with a period of ``parent_period * multiplier / divider``.
> +For instance, if the clock has a frequency of 8MHz and you set its
> +multiplier to 2 and its divider to 3, the child clocks will run
> +at 12MHz.
> +
> +You can change the multiplier and divider of a clock at runtime,
> +so you can use this to model clock controller devices which
> +have guest-programmable frequency multipliers or dividers.
> +
> +Note that ``clock_set_mul_div()`` does not automatically call
> +``clock_propagate()``. If you make a runtime change to the
> +multiplier or divider you must call clock_propagate() yourself.a

You have an extra `a` here after the full stop.

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
>  Unconnected input clocks
>  ------------------------
>
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index a7187eab95e..11f67fb9701 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -81,6 +81,10 @@ struct Clock {
>      void *callback_opaque;
>      unsigned int callback_events;
>
> +    /* Ratio of the parent clock to run the child clocks at */
> +    uint32_t multiplier;
> +    uint32_t divider;
> +
>      /* Clocks are organized in a clock tree */
>      Clock *source;
>      QLIST_HEAD(, Clock) children;
> @@ -350,4 +354,29 @@ static inline bool clock_is_enabled(const Clock *clk)
>   */
>  char *clock_display_freq(Clock *clk);
>
> +/**
> + * clock_set_mul_div: set multiplier/divider for child clocks
> + * @clk: clock
> + * @multiplier: multiplier value
> + * @divider: divider value
> + *
> + * By default, a Clock's children will all run with the same period
> + * as their parent. This function allows you to adjust the multiplier
> + * and divider used to derive the child clock frequency.
> + * For example, setting a multiplier of 2 and a divider of 3
> + * will run child clocks with a period 2/3 of the parent clock,
> + * so if the parent clock is an 8MHz clock the children will
> + * be 12MHz.
> + *
> + * Setting the multiplier to 0 will stop the child clocks.
> + * Setting the divider to 0 is a programming error (diagnosed with
> + * an assertion failure).
> + * Setting a multiplier value that results in the child period
> + * overflowing is not diagnosed.
> + *
> + * Note that this function does not call clock_propagate(); the
> + * caller should do that if necessary.
> + */
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
> +
>  #endif /* QEMU_HW_CLOCK_H */
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 260b13fc2c8..07bb45d7ed4 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -14,6 +14,24 @@
>  #include "migration/vmstate.h"
>  #include "hw/clock.h"
>
> +static bool muldiv_needed(void *opaque)
> +{
> +    Clock *clk = opaque;
> +
> +    return clk->multiplier != 1 || clk->divider != 1;
> +}
> +
> +const VMStateDescription vmstate_muldiv = {
> +    .name = "clock/muldiv",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = muldiv_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(multiplier, Clock),
> +        VMSTATE_UINT32(divider, Clock),
> +    },
> +};
> +
>  const VMStateDescription vmstate_clock = {
>      .name = "clock",
>      .version_id = 0,
> @@ -21,5 +39,9 @@ const VMStateDescription vmstate_clock = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(period, Clock),
>          VMSTATE_END_OF_LIST()
> -    }
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_muldiv,
> +        NULL
> +    },
>  };
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index fc5a99683f8..c371b9e977a 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -64,6 +64,15 @@ bool clock_set(Clock *clk, uint64_t period)
>      return true;
>  }
>
> +static uint64_t clock_get_child_period(Clock *clk)
> +{
> +    /*
> +     * Return the period to be used for child clocks, which is the parent
> +     * clock period adjusted for for multiplier and divider effects.
> +     */
> +    return muldiv64(clk->period, clk->multiplier, clk->divider);
> +}
> +
>  static void clock_call_callback(Clock *clk, ClockEvent event)
>  {
>      /*
> @@ -78,15 +87,16 @@ static void clock_call_callback(Clock *clk, ClockEvent event)
>  static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  {
>      Clock *child;
> +    uint64_t child_period = clock_get_child_period(clk);
>
>      QLIST_FOREACH(child, &clk->children, sibling) {
> -        if (child->period != clk->period) {
> +        if (child->period != child_period) {
>              if (call_callbacks) {
>                  clock_call_callback(child, ClockPreUpdate);
>              }
> -            child->period = clk->period;
> +            child->period = child_period;
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
> -                               CLOCK_PERIOD_TO_HZ(clk->period),
> +                               CLOCK_PERIOD_TO_HZ(child->period),
>                                 call_callbacks);
>              if (call_callbacks) {
>                  clock_call_callback(child, ClockUpdate);
> @@ -110,7 +120,7 @@ void clock_set_source(Clock *clk, Clock *src)
>
>      trace_clock_set_source(CLOCK_PATH(clk), CLOCK_PATH(src));
>
> -    clk->period = src->period;
> +    clk->period = clock_get_child_period(src);
>      QLIST_INSERT_HEAD(&src->children, clk, sibling);
>      clk->source = src;
>      clock_propagate_period(clk, false);
> @@ -133,10 +143,21 @@ char *clock_display_freq(Clock *clk)
>      return freq_to_str(clock_get_hz(clk));
>  }
>
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +{
> +    assert(divider != 0);
> +
> +    clk->multiplier = multiplier;
> +    clk->divider = divider;
> +}
> +
>  static void clock_initfn(Object *obj)
>  {
>      Clock *clk = CLOCK(obj);
>
> +    clk->multiplier = 1;
> +    clk->divider = 1;
> +
>      QLIST_INIT(&clk->children);
>  }
>
> --
> 2.20.1
>
>

