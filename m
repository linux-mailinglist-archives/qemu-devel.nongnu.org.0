Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049361558F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 15:02:31 +0100 (CET)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j04DG-0002F4-1p
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j04BE-0001Nz-OM
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:00:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j04BC-0004k1-VG
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:00:24 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35427)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j04BC-0004hV-PR
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:00:22 -0500
Received: by mail-ot1-x341.google.com with SMTP id r16so2244678otd.2
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 06:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOH92Xh6evGe12Reh/7RatMlZ0HdkMi+iQTt9pfAA5A=;
 b=VZyvF4YipekGKddQac8HxJes98jaApTKoODtVf9dc1OwQ1fGZu6buvD0vXeaLP8b1e
 G8OWubKObQ/WsdmGCv6P7x7ynfNP9K3wOphZbzxpzJ7sAn9B30x58clMyOB7ZeR37ZbZ
 IY7BUVgCo+qFQx19aYMU3qQyewt4FUlBWAcaQgWuZ0vOV3ZrIWkmae2bMFnPCTyqpfK/
 l7YgdTArLq2NH0IFdCPPlm6sdsY1bMhMALCHZbSGA5FIlEc3ZAcLVPrJ1sf+8Q1jk4/M
 xgcrxwj+U9WyxG3jEQfVnYDsbBJX418ITFO69hOaO8LHZm5x59Vhd80YMTke/eNQyoWD
 qKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOH92Xh6evGe12Reh/7RatMlZ0HdkMi+iQTt9pfAA5A=;
 b=Tgf764jUQsAUIoXOGRyXceUpetkMVYhff3ArMjjBTK7B18NS1Ff7OAwC9oBLjm5Ykp
 9us0VatS1haiVkEE00h/sCCGcUdUVWVB+AgdYfb+ZvDGNsm2RJnqDaJvW7mainfFcGJ1
 oyYxrzkRXPbWg9CWigxWy9tJNb5JWOf5uIyLBFKBik6z3hn+k8NPo9tZEQO2hyCyslj3
 bB3sicl01yRcI6OGWzFvZn0sdpfT0LwI6AbpKsjYDAqqtcylKksRXU3UsNnNh6neAvPe
 IPp696upeleKKFulAPfs58atIhqmySeLdG+M+hoDWtklqoK0mo7eD7h2g/jTBDjPm8SK
 FOkQ==
X-Gm-Message-State: APjAAAVtD4nO6hkoGsldzylZw3Kemsi9xKplmWxbqlEhHfxn1aRUveLL
 HzUl+a0zInM7UAktYYRMdDjfA+x8yprcisbPe0K6jQ==
X-Google-Smtp-Source: APXvYqzYpePwNU9BdH4qeBvWNNoBWOUJ2BlEFUdWI2n1s49CJR92XRzGe/oHdS7jt6U3TN86pHze2UdfbkAivX5v5jA=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2834864otd.91.1581084021641; 
 Fri, 07 Feb 2020 06:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20200206130847.11166-1-richard.henderson@linaro.org>
 <20200206130847.11166-2-richard.henderson@linaro.org>
In-Reply-To: <20200206130847.11166-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 14:00:10 +0000
Message-ID: <CAFEAcA-FSQH2dt-mE_qS+WK4m7V2TBfPMoP_hrLLNwsNqG8jKg@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: Split out aa64_va_parameter_tbi,
 aa64_va_parameter_tbid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Feb 2020 at 13:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For the purpose of rebuild_hflags_a64, we do not need to compute
> all of the va parameters, only tbi.  Moreover, we can compute them
> in a form that is more useful to storing in hflags.
>
> This eliminates the need for aa64_va_parameter_both, so fold that
> in to aa64_va_parameter.  The remaining calls to aa64_va_parameter
> are in get_phys_addr_lpae and in pauth_helper.c.
>
> This reduces the total cpu consumption of aa64_va_parameter in a
> kernel boot plus a kvm guest kernel boot from 3% to 0.5%.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |  3 --
>  target/arm/helper.c    | 68 +++++++++++++++++++++++-------------------
>  2 files changed, 37 insertions(+), 34 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 6d4a942bde..6ac84bbca7 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1042,15 +1042,12 @@ typedef struct ARMVAParameters {
>      unsigned tsz    : 8;
>      unsigned select : 1;
>      bool tbi        : 1;
> -    bool tbid       : 1;
>      bool epd        : 1;
>      bool hpd        : 1;
>      bool using16k   : 1;
>      bool using64k   : 1;
>  } ARMVAParameters;
>
> -ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
> -                                        ARMMMUIdx mmu_idx);
>  ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>                                     ARMMMUIdx mmu_idx, bool data);
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7d15d5c933..d2e9332696 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10067,12 +10067,34 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
>  }
>  #endif /* !CONFIG_USER_ONLY */
>
> -ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
> -                                        ARMMMUIdx mmu_idx)
> +static int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
> +{
> +    if (regime_has_2_ranges(mmu_idx)) {
> +        return extract64(tcr, 37, 2);
> +    } else if (mmu_idx == ARMMMUIdx_Stage2) {
> +        return 0; /* VTCR_EL2 */
> +    } else {
> +        return extract32(tcr, 20, 1);
> +    }

So, this function returns either the two TBI bits, for
the 2-ranges case, or a single TBI bit with bit 1 always
zero, in the 1-range case...

>
> +    /* Present TBI as a composite with TBID.  */
> +    tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
> +    if (!data) {
> +        tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
> +    }
> +    tbi = (tbi >> select) & 1;

...but aa64_va_parameters() always sets
    select = extract64(va, 55, 1);
even for the 1-range case, and then we assume in this bit
of code that we can pull the corresponding bit out of tbi.

Don't we need to either duplicate the bit returned by
aa64_va_parameter_tbi() in the 1-range case, or else
only shift tbi by 'select' in the 2-range case ?

thanks
-- PMM

