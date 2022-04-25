Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443E50E53D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 18:10:39 +0200 (CEST)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj1IM-0001XF-46
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 12:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj1HE-0000oD-Gt
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 12:09:28 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj1HC-0005tu-Oz
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 12:09:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a15so15208898pfv.11
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VqYdOiwpw4Z/sY+fWQI31ij3H58L9z1BoC4UQXKrUH8=;
 b=hZUar3tqyVaR+sEsF1L5ZTAr1r2TGWAevXP0BHbZwQ/o8dt82odiRwrKpe+df5969T
 qejIK8g9l8H3yjyfAz+BWQCNsfxpzIb+us3EKUSAoU2EHmtCZWkFChrRgCwsckZ2QE/l
 0JTnUT6bqFS0rba7otvYg2TNjBI6D2He2kBzzIxzAp5sxq63FZF3Qb8oPO0LWQkhwY5J
 VPO0Z9auoFWi14BlhmJpuC5THD3AZ1L8ebN3Ln/u8TSvCoAXMl6b4Kn94Lp3tDnMsl8i
 fsh9knfibyZI4IQYHxwXlQ2zxhpxrgd8KCnRWYDcXG0FylA3oY33wkTFHxdHFc06KCLZ
 YXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VqYdOiwpw4Z/sY+fWQI31ij3H58L9z1BoC4UQXKrUH8=;
 b=05+6bQweKm8T3hOojAEcAPQstR0Q/1FiCbJu+r/P4y5A0wblYRDblLiCWAoU4VHr4K
 xvIXrsvWtgkLQcDh3uBHqGbf96tRn+cYKGfuyQ7Ule0ZORtxBiF2SlDwgUKFrkeqRiT6
 a02DPdkyfEJjVkOgsK/xJ6pdaO0OtYyC4Tj5UmPXloeRlCS8Xn8jB6HuibVYxW231Gl7
 SCuR99zln5SblRDjtH2hPS2SIHFI1UCbdw0GmAc5v+vpRDA7FH3hsICvpmfLvGN7x0pz
 o4gBImFwB1HIAmQzRsSwH2z89l5F1shZIN+DP8QNspt7GEkxxYJ19quD9jkCrfUWobmX
 KBJw==
X-Gm-Message-State: AOAM533c6zk4UEY61ef2uo3azQZBdHbm0Aa7QIQth3n4EdjZFUAr/f4+
 iW4VFizhcxT6N+sWkGWLz/2b8A==
X-Google-Smtp-Source: ABdhPJx9ngwv0Xfo+QotVyoMSJF4Byv8myigVou02latYlbTDYz+y7pWx0mM46220v9vBMAgiVfGHQ==
X-Received: by 2002:a63:89c7:0:b0:3ab:1f12:f807 with SMTP id
 v190-20020a6389c7000000b003ab1f12f807mr7064602pgd.180.1650902965174; 
 Mon, 25 Apr 2022 09:09:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d3:42c2:3923:dfa6:d849:4ed9?
 ([2607:fb90:27d3:42c2:3923:dfa6:d849:4ed9])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a17090ad24d00b001d97f17f9b5sm3593408pjw.35.2022.04.25.09.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 09:09:24 -0700 (PDT)
Message-ID: <136c28cb-4e6d-47b3-b716-4d8048a30c3d@linaro.org>
Date: Mon, 25 Apr 2022 09:09:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 02/42] i386: DPPS rounding fix
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-3-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-3-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> The DPPS (Dot Product) instruction is defined to first sum pairs of
> intermediate results, then sum those values to get the final result.
> i.e. (A+B)+(C+D)
> 
> We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
> in incorrect rouding.
> 
> For consistency, also remove the redundant (but harmless) add operation
> from DPPD
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>   target/i386/ops_sse.h | 47 +++++++++++++++++++++++--------------------
>   1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 535440f882..a5a48a20f6 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -1934,32 +1934,36 @@ SSE_HELPER_I(helper_pblendw, W, 8, FBLENDP)
>   
>   void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
>   {
> -    float32 iresult = float32_zero;
> +    float32 prod, iresult, iresult2;
>   
> +    /*
> +     * We must evaluate (A+B)+(C+D), not ((A+B)+C)+D
> +     * to correctly round the intermediate results
> +     */
>       if (mask & (1 << 4)) {
> -        iresult = float32_add(iresult,
> -                              float32_mul(d->ZMM_S(0), s->ZMM_S(0),
> -                                          &env->sse_status),
> -                              &env->sse_status);
> +        iresult = float32_mul(d->ZMM_S(0), s->ZMM_S(0), &env->sse_status);
> +    } else {
> +        iresult = float32_zero;
>       }
>       if (mask & (1 << 5)) {
> -        iresult = float32_add(iresult,
> -                              float32_mul(d->ZMM_S(1), s->ZMM_S(1),
> -                                          &env->sse_status),
> -                              &env->sse_status);
> +        prod = float32_mul(d->ZMM_S(1), s->ZMM_S(1), &env->sse_status);
> +    } else {
> +        prod = float32_zero;
>       }
> +    iresult = float32_add(iresult, prod, &env->sse_status);
>       if (mask & (1 << 6)) {
> -        iresult = float32_add(iresult,
> -                              float32_mul(d->ZMM_S(2), s->ZMM_S(2),
> -                                          &env->sse_status),
> -                              &env->sse_status);
> +        iresult2 = float32_mul(d->ZMM_S(2), s->ZMM_S(2), &env->sse_status);
> +    } else {
> +        iresult2 = float32_zero;
>       }
>       if (mask & (1 << 7)) {
> -        iresult = float32_add(iresult,
> -                              float32_mul(d->ZMM_S(3), s->ZMM_S(3),
> -                                          &env->sse_status),
> -                              &env->sse_status);
> +        prod = float32_mul(d->ZMM_S(3), s->ZMM_S(3), &env->sse_status);
> +    } else {
> +        prod = float32_zero;
>       }
> +    iresult2 = float32_add(iresult2, prod, &env->sse_status);
> +    iresult = float32_add(iresult, iresult2, &env->sse_status);
> +
>       d->ZMM_S(0) = (mask & (1 << 0)) ? iresult : float32_zero;
>       d->ZMM_S(1) = (mask & (1 << 1)) ? iresult : float32_zero;
>       d->ZMM_S(2) = (mask & (1 << 2)) ? iresult : float32_zero;

Here I believe you're producing correct results, but reuse of variable names does not aid 
clarity.  Better written with prod[0-3], iresult[0-1], and result.

> @@ -1968,13 +1972,12 @@ void glue(helper_dpps, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
>   
>   void glue(helper_dppd, SUFFIX)(CPUX86State *env, Reg *d, Reg *s, uint32_t mask)
>   {
> -    float64 iresult = float64_zero;
> +    float64 iresult;
>   
>       if (mask & (1 << 4)) {
> -        iresult = float64_add(iresult,
> -                              float64_mul(d->ZMM_D(0), s->ZMM_D(0),
> -                                          &env->sse_status),
> -                              &env->sse_status);
> +        iresult = float64_mul(d->ZMM_D(0), s->ZMM_D(0), &env->sse_status);
> +    } else {
> +        iresult = float64_zero;
>       }
>       if (mask & (1 << 5)) {
>           iresult = float64_add(iresult,

This is incorrect.  By skipping the add if 1<<5 is not set, you can produce an incorrect 
result of -0 from the 1<<4 mul.


r~

