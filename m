Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293C6F8001
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:30:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1purk7-0006An-CF; Fri, 05 May 2023 05:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purk5-00067c-EE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:28:45 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purk3-0007T4-SE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:28:45 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so2647398a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683278920; x=1685870920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/qr0u344BdwIFPa4ftATtrgTevlZCM3vdy0U5ev0PUY=;
 b=vG5AeZXY1t21vSZle0v+DGZBb06m36i1h49nszAnwZxxP38opXAlqFys8xjc7Iy9Ix
 wHDjmr+a15lB2xXJm98Iy9veqsFag2Y04wtHA35SLr0nj42fkaPkGocc+KmG4+TE73a+
 b6buAR+SoOny7ph1wzaa58bQi3Wf8jxhzUDuTOwIyQvjqQgZOsrHHAQWvua/Cv9OBzo3
 T+Wu5izd5i1IvNVmgzMkcL9o7o/rZ/w92IJ14C6SLWyjHoCZPnjXFr0/txj7tpLApiO2
 9Z3fHS0jOEyphrrEoV72N0/1k2/in4BZFGDKrl6wyb8Vv/vnuNlvB+GOVKbz78CFwL97
 xQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683278920; x=1685870920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/qr0u344BdwIFPa4ftATtrgTevlZCM3vdy0U5ev0PUY=;
 b=Fj0YUZUuwApbu/boADy0yoBs87NopHqLj1p1RqvGcXCjEcxoTzNIkVxH5p264w1cic
 DFBlZ/Q7/DSf6qv/kRFwWSXHaHqE96bwkoLTUligWfLZSKeihtivZJrEv04IeTb6sQeg
 WTi9B2uahaXmSyY5kk4jwLUQE2GgEd38jGbLjkkUoK9l9hI+o/gaSi8KcaSoq8oct54p
 WkX9JP6+CAvUiuLh/sE39V1Pvz8ZSE1yanTFdOEQEkXafEoCIX4uAE6MG2aYUIUSRu4Q
 PWCPSAoNOTpFY2zYiWI/piBZj8BVCGjURJo/BTWxFr44gKFEZxJrDtVyOnPtL6mA4yQt
 v/tQ==
X-Gm-Message-State: AC+VfDwo+pbi3memQ/DvtXxFrLT987LP90sctvFc/gCDE2hr6GB8TjZb
 uEROBcLaAFvTo/GDPiTVpxbxTYG5eoqgPW72oIntLw==
X-Google-Smtp-Source: ACHHUZ4IkbtSYifnNmIYBmadgN4zhYZIlz2eqxGF6rA/dmEKoS4smKRoIY1IE+Q8yfsyDnqfkyEbLrHeVXy12vi1jJI=
X-Received: by 2002:a05:6402:1347:b0:509:c669:1e93 with SMTP id
 y7-20020a056402134700b00509c6691e93mr768648edw.23.1683278920472; Fri, 05 May
 2023 02:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-8-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:28:29 +0100
Message-ID: <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
Subject: Re: [PATCH v4 07/57] accel/tcg: Honor atomicity of stores
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c             | 103 +++----
>  accel/tcg/user-exec.c          |  12 +-
>  accel/tcg/ldst_atomicity.c.inc | 491 +++++++++++++++++++++++++++++++++
>  3 files changed, 540 insertions(+), 66 deletions(-)


> +/**
> + * store_atom_insert_al16:
> + * @p: host address
> + * @val: shifted value to store
> + * @msk: mask for value to store
> + *
> + * Atomically store @val to @p masked by @msk.
> + */
> +static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
> +{
> +#if defined(CONFIG_ATOMIC128)
> +    __uint128_t *pu, old, new;
> +
> +    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
> +    pu = __builtin_assume_aligned(ps, 16);
> +    old = *pu;
> +    do {
> +        new = (old & ~msk.u) | val.u;
> +    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
> +                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
> +#elif defined(CONFIG_CMPXCHG128)
> +    __uint128_t *pu, old, new;
> +
> +    /*
> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
> +     * and accept the sequential consistency that comes with it.
> +     */
> +    pu = __builtin_assume_aligned(ps, 16);
> +    do {
> +        old = *pu;
> +        new = (old & ~msk.u) | val.u;
> +    } while (!__sync_bool_compare_and_swap_16(pu, old, new));

Comment says "__sync_val..." but code says "__sync_bool...". Which is right?


> +#else
> +    qemu_build_not_reached();
> +#endif
> +}

-- PMM

