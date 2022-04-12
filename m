Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA864FCC4D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 04:22:28 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne6Al-0008Bs-7R
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 22:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne69E-0006iq-3U
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:20:52 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne69B-0003Z9-Vf
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:20:51 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r66so15855749pgr.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 19:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IsKm8Cj8C550pb3mJD/4AhZzzrzQtV7VaLR9mtM6QE4=;
 b=ulI5d8zmyv0amCrMFdNy9Y/bs/7xRqcwDLI6Au/ODnYUAUZKHiZ4oFGa09oLZtSV2J
 qOYJ13E7nmR0Df1WKlaOCMmiESNdVLouF0CVroUnBftkChRDDsoW5DOyS9Z3lJ/bQlVQ
 3rbNOqGjL11urqBEMJxMw7n43gSFCwPfaBpYpdlPTa7eB3Z+5X4/YOeh6wtSMO2QrDYm
 Jo6mHD4BeMNYWgbpqIOll2Y9jZqgwjqvBJzvEc2gKliCFJYcwgW4yXxm9Q7omFd5Mjsv
 7IgmKYIZTROg0BE4u+XhDNZJJqqihXAAyHie9NcJgUgA5BimiMESPSGwfKGljXwP7zvw
 iXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IsKm8Cj8C550pb3mJD/4AhZzzrzQtV7VaLR9mtM6QE4=;
 b=3DjJOgFVQ+AVaZkWvAXRhQZAWs4G2/7pX2gyJz/8QHB+agDxyRgkgmYKwpI3zEu1nj
 o8oWjbu3zPUnkfvBbopcfOSUql/KcqBYvBD0gS1PnDTLnrqzaWglouNfzRkQ6DufkWaF
 GBoISSg09ub9Rq57a7IC0XMi2eihb7rYciKQtvhW/lHJFHr0LZ4nVyzDoI7cAJ2zuI7Z
 ac3l4zgBXu/XsZ2/j6BAzzMvKcKfAQEZPxHe8pabPx/hZnsOcLZDX1dXeHBqyRsNMDGj
 WqCKbva1roEtL37knI4XH9TdxT8JAtFKtIAjc0r12HIZM7sd9ET6O7Eeu/agNNdSNiAq
 XFkw==
X-Gm-Message-State: AOAM533FbBxbiqldtYkyEIL9iaKjRk6USTQPp2PE373ivGiQzATwVO4Z
 lPM8myrBBjpFVq7Xoo7lsG1Gyw==
X-Google-Smtp-Source: ABdhPJxyOOVj7o9IzAsaG2vawGloqKqGKXlSCSlMUiSjtlWlU3dGXHSExbAWJGvz880UwLPXq+trJQ==
X-Received: by 2002:a63:590e:0:b0:39d:1a2b:5907 with SMTP id
 n14-20020a63590e000000b0039d1a2b5907mr12133234pgb.188.1649730048266; 
 Mon, 11 Apr 2022 19:20:48 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a056a000b4300b004faee36ea56sm37275901pfo.155.2022.04.11.19.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 19:20:47 -0700 (PDT)
Message-ID: <20436595-b75a-7cb5-45f6-0d831fb75c34@linaro.org>
Date: Mon, 11 Apr 2022 19:20:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] host-utils: Implemented unsigned 256-by-128
 division
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, danielhb413@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Based on already existing QEMU implementation, created an unsigned 256
> bit by 128 bit division needed to implement the vector divide extended
> unsigned instruction from PowerISA3.1
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   include/qemu/host-utils.h |  15 +++++
>   include/qemu/int128.h     |  20 ++++++
>   util/host-utils.c         | 128 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 163 insertions(+)
> 
> diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
> index ca979dc6cc..6da6a93f69 100644
> --- a/include/qemu/host-utils.h
> +++ b/include/qemu/host-utils.h
> @@ -32,6 +32,7 @@
>   
>   #include "qemu/compiler.h"
>   #include "qemu/bswap.h"
> +#include "qemu/int128.h"
>   
>   #ifdef CONFIG_INT128
>   static inline void mulu64(uint64_t *plow, uint64_t *phigh,
> @@ -153,6 +154,19 @@ static inline int clo64(uint64_t val)
>       return clz64(~val);
>   }
>   
> +/*
> + * clz128 - count leading zeros in a 128-bit value.
> + * @val: The value to search
> + */
> +static inline int clz128(Int128 a)
> +{
> +    if (int128_gethi(a)) {
> +        return clz64(int128_gethi(a));
> +    } else {
> +        return clz64(int128_getlo(a)) + 64;
> +    }
> +}

Should be in int128.h, like bswap128.

> diff --git a/util/host-utils.c b/util/host-utils.c
> index bcc772b8ec..c6a01638c7 100644
> --- a/util/host-utils.c
> +++ b/util/host-utils.c
> @@ -266,3 +266,131 @@ void ulshift(uint64_t *plow, uint64_t *phigh, int32_t shift, bool *overflow)
>           *plow = *plow << shift;
>       }
>   }
> +/*

Watch your spacing.

> + * Unsigned 256-by-128 division.
> + * Returns the remainder via r.
> + * Returns lower 128 bit of quotient.
> + * Needs a normalized divisor (most significant bit set to 1).
> + *
> + * Adapted from include/qemu/host-utils.h udiv_qrnnd,
> + * from the GNU Multi Precision Library - longlong.h __udiv_qrnnd
> + * (https://gmplib.org/repo/gmp/file/tip/longlong.h)
> + *
> + * Licensed under the GPLv2/LGPLv3
> + */
> +static Int128 udiv256_qrnnd(Int128 *r, Int128 n1, Int128 n0, Int128 d)
> +{
> +    Int128 d0, d1, q0, q1, r1, r0, m;
> +    uint64_t mp0, mp1;
> +
> +    d0 = int128_make64(int128_getlo(d));
> +    d1 = int128_make64(int128_gethi(d));
> +
> +    r1 = int128_remu(n1, d1);
> +    q1 = int128_divu(n1, d1);
> +    mp0 = int128_getlo(q1);
> +    mp1 = int128_gethi(q1);
> +    mulu128(&mp0, &mp1, int128_getlo(d0));
> +    m = int128_make128(mp0, mp1);
> +    r1 = int128_make128(int128_gethi(n0), int128_getlo(r1));
> +    if (int128_ult(r1, m)) {
> +        q1 = int128_sub(q1, int128_one());
> +        r1 = int128_add(r1, d);
> +        if (int128_uge(r1, d)) {
> +            if (int128_ult(r1, m)) {
> +                q1 = int128_sub(q1, int128_one());
> +                r1 = int128_add(r1, d);
> +            }
> +        }
> +    }
> +    r1 = int128_sub(r1, m);
> +
> +    r0 = int128_remu(r1, d1);
> +    q0 = int128_divu(r1, d1);
> +    mp0 = int128_getlo(q0);
> +    mp1 = int128_gethi(q0);
> +    mulu128(&mp0, &mp1, int128_getlo(d0));
> +    m = int128_make128(mp0, mp1);
> +    r0 = int128_make128(int128_getlo(n0), int128_getlo(r0));
> +    if (int128_ult(r0, m)) {
> +        q0 = int128_sub(q0, int128_one());
> +        r0 = int128_add(r0, d);
> +        if (int128_uge(r0, d)) {
> +            if (int128_ult(r0, m)) {
> +                q0 = int128_sub(q0, int128_one());
> +                r0 = int128_add(r0, d);
> +            }
> +        }
> +    }
> +    r0 = int128_sub(r0, m);
> +
> +    *r = r0;
> +    return int128_or(int128_lshift(q1, 64), q0);
> +}
> +
> +/*
> + * Unsigned 256-by-128 division.
> + * Returns the remainder.
> + * Returns quotient via plow and phigh.
> + * Also returns the remainder via the function return value.
> + */
> +Int128 divu256(Int128 *plow, Int128 *phigh, Int128 divisor)
> +{
> +    Int128 dhi = *phigh;
> +    Int128 dlo = *plow;
> +    Int128 rem, dhighest;
> +    int sh;
> +
> +    if (!int128_nz(divisor) || !int128_nz(dhi)) {
> +        *plow  = int128_divu(dlo, divisor);
> +        *phigh = int128_zero();
> +        return int128_remu(dlo, divisor);
> +    } else {
> +        sh = clz128(divisor);
> +
> +        if (int128_ult(dhi, divisor)) {
> +            if (sh != 0) {
> +                /* normalize the divisor, shifting the dividend accordingly */
> +                divisor = int128_lshift(divisor, sh);
> +                dhi = int128_or(int128_lshift(dhi, sh),
> +                                int128_urshift(dlo, (128 - sh)));
> +                dlo = int128_lshift(dlo, sh);
> +            }
> +
> +            *phigh = int128_zero();
> +            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
> +        } else {
> +            if (sh != 0) {
> +                /* normalize the divisor, shifting the dividend accordingly */
> +                divisor = int128_lshift(divisor, sh);
> +                dhighest = int128_rshift(dhi, (128 - sh));
> +                dhi = int128_or(int128_lshift(dhi, sh),
> +                                int128_urshift(dlo, (128 - sh)));
> +                dlo = int128_lshift(dlo, sh);
> +
> +                *phigh = udiv256_qrnnd(&dhi, dhighest, dhi, divisor);
> +            } else {
> +                /*
> +                 * dhi >= divisor
> +                 * Since the MSB of divisor is set (sh == 0),
> +                 * (dhi - divisor) < divisor
> +                 *
> +                 * Thus, the high part of the quotient is 1, and we can
> +                 * calculate the low part with a single call to udiv_qrnnd
> +                 * after subtracting divisor from dhi
> +                 */
> +                dhi = int128_sub(dhi, divisor);
> +                *phigh = int128_one();
> +            }
> +
> +            *plow = udiv256_qrnnd(&rem, dhi, dlo, divisor);
> +        }
> +
> +        /*
> +         * since the dividend/divisor might have been normalized,
> +         * the remainder might also have to be shifted back
> +         */
> +        rem = int128_urshift(rem, sh);
> +        return rem;
> +    }
> +}

I guess this works.  I'm starting to wonder if we shouldn't use libgmp, instead of rolling 
our own.  In this case, mpn_tdiv_qr.

Anyway, modulo placement of clz128,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

