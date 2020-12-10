Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237022D691A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:49:45 +0100 (CET)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSsh-0006Je-JM
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSqy-0005hR-6B
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:47:56 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knSqr-0004Dq-So
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:47:55 -0500
Received: by mail-ej1-x643.google.com with SMTP id jx16so9265678ejb.10
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 12:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yb+WgJK55skGyVhrQ1OKDswnLcuSo6Qdmc2cyDoTqyY=;
 b=qLn6jIWaajW8xZy0p/PcOoIDbYPrNnO61t+oLXyqLmue4IJOnDDALxFhN4eeGZOdaX
 kWWUDZgc5TJhKTqWdIWzj28oisHzKS6g1blcthm920phdDjpXV58zRWWmJhG28Ufsfju
 oQQg3C2qslOZItY660CngpH8bFmi04UzRyeArY9kKHnEt17kp0rCzdavZ1UpK/DXpjeH
 UpmefyTnOuOod3YPHog6x9SwJWUXY/jO+yJXEZ1GEkgzVK5N3rcAlHXpyWUqI/7dLf5L
 CNHfba6/jEZ0BBUXx4Ac45NZCbbBZx1AbDMlZfpzgZDwzHls5mBuxD9BDPbD+WlempAU
 jFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yb+WgJK55skGyVhrQ1OKDswnLcuSo6Qdmc2cyDoTqyY=;
 b=AAaBrs3mSxiG5mOJPz29TlJsZY2rCl7v2/ObX6zOMoEf0R8I2olxG2eR5fc2Psq/h6
 009p7bP/pu14TkUFZ8XLNAiUodqN6SdNIarPDgIXrnoDKsZPWS7wPUuyAu+9b5YMLj0z
 FUAVOwVnNa6xmt78Eus2utyxQybwvb09LW6FuQ9yUTr9mEvJG7qClUbgb+ihsdolwEHJ
 TFaZ5YogxHs4hnbJYSXM2xxrvRbW4VbzqvJJhpZLoFBwIEDQCH4xbWdc04L2CJ7pfEWj
 KzWpqYDpe3OqBg9WNgFgBuPvA4xiZaAM8D8HZwpkt+0q0KxiTXb6wp11K8wfOXQD2NQ2
 2gKg==
X-Gm-Message-State: AOAM53077ArC/db0RJyF7L3hfy22NOE6eV7a1uDKdow091DGt+E8k/Nk
 KLotQ1wnJ2nXwwvGLseA1CZUxoD7LD+yed5+JOyuPQ==
X-Google-Smtp-Source: ABdhPJxFwTkXgd1S3lOMKr3bFH59ONV+Gf+OeYQ5mJLKEYSA0tM/Y/O11kp3rtrT1SeI8O15fw8fOUFsC2k0qZxsgSQ=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr8225187ejb.56.1607633266670; 
 Thu, 10 Dec 2020 12:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
In-Reply-To: <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 20:47:35 +0000
Message-ID: <CAFEAcA_keq-NV+YNwAyVWbkHxGYFR+Ud3hnh5b1KujpQXh68hw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 23:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/8/20 12:15 PM, Peter Maydell wrote:
> > +static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
> > +{
> > +    uint64_t ns_low, ns_high;
> > +
> > +    /*
> > +     * clk->period is the period in units of 2^-32 ns, so
> > +     * (clk->period * ticks) is the required length of time in those
> > +     * units, and we can convert to nanoseconds by multiplying by
> > +     * 2^32, which is the same as shifting the 128-bit multiplication
> > +     * result right by 32.
> > +     */
> > +    mulu64(&ns_low, &ns_high, clk->period, ticks);
> > +    return ns_low >> 32 | ns_high << 32;
>
> With the shift, you're discarding the high 32 bits of the result.  You'll lose
> those same bits if you shift one of the inputs left by 32, and use only the
> high part of the result, e.g.
>
>     mulu(&discard, &ret, clk->period, ticks << 32);
>     return ret;
>
> Which on some hosts, e.g. aarch64, only requires umulh and not two multiply
> instructions.

We can't do this if we want to allow a full 64-bit 'ticks' input, right?

> Either way, I wonder if you want to either use uint32_t ticks, or assert that
> ticks <= UINT32_MAX?  Or if you don't shift ticks, assert that ns_high <=
> UINT32_MAX, so that you don't lose output bits?

So I think my plan for v2 of this series is just to add in the
saturation-to-INT64_MAX logic.

thanks
-- PMM

