Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D767510CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:44:03 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njUqg-0006Lb-3Z
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njUnT-0005Ka-Jy
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:40:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njUnR-0006AY-Rx
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:40:43 -0400
Received: by mail-pl1-x635.google.com with SMTP id d15so174100plh.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5bequ+zHv9mj8wCCi/3IsXtFWVbhJNe5PJEeFYHcEEA=;
 b=M/5h4rgKZ9XVT7ZX2F8VhT5QHlFwq1KtIJAWXL0c3sNmYIdmLw7uklkbIHpmiYAMMF
 5bc1N3oh7PdniiFy+l+1oD4VO5kLULzKEPH90l3jIezjW+xYvdNW2i3zKIX6r9ii+qAs
 jpD4ja/PZ4JB1j8mAWvtqr9rGJel0U8dpS/8X+efDfjILPyPAIBcTq6Y33pUp3MJOTjV
 xpz6BFL7ksufsq8PG7jN2pUAwCnU78KIc6Z06MqYLAXwDrcRlS9uVmo3XErQLP3yw1Of
 bmCK4rngMQXcUf9LcMRRADpje4Wrq6rzB08GFKQFrA/oqGArcc2W7Itl0B9zMtvIEZYH
 r5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5bequ+zHv9mj8wCCi/3IsXtFWVbhJNe5PJEeFYHcEEA=;
 b=oENk/ZmAR0uhZi2Pt/I8o1/rs72j0LovjINldtKUE1d/wx9BQJR97tWxQJSqpkDr26
 bOr1N6Rl1IIx/lkweAuzUIvZChxrRX6NN00S+BXBhWYMjM9tbHzxYja1FYZ1meETp557
 ErsFafhszTqxjOP76z/7jStLopR3nJEVeZoftM+icnoulouyAlulzlFbA+mbDkCkhqUV
 znRIiM3uoNIGvFfKVVwLhk7w3z964+mJxZKU7SPYJK6XS0+nm66ktmr2XftQGOoFW0JT
 1opqWq1dtKVkGbCDTPTttj/pr8n62IyP9BH4wN8tDV7fgN6rPtBZ0Y3Js+omIloZBSEP
 CGHw==
X-Gm-Message-State: AOAM5332SyBzSYYSx4pehb5RvN4/Zqt1Hc9M1lydGxNnwFBFv6DkmhH4
 IaUX0TJOlE1xq63ZeXiejD8Ixg==
X-Google-Smtp-Source: ABdhPJwnqWhpyNy+bHy1KA7VGk/OIJIbXv/ygLFXPx6Ri67QdIlbxPIR2q+KhvjBkWzImRewVu0ZqQ==
X-Received: by 2002:a17:902:b613:b0:156:7d82:c09b with SMTP id
 b19-20020a170902b61300b001567d82c09bmr25645432pls.80.1651016440000; 
 Tue, 26 Apr 2022 16:40:40 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm15623032pfl.164.2022.04.26.16.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 16:40:39 -0700 (PDT)
Message-ID: <7f3f38ab-9a15-3202-5c15-8159e95af6ab@linaro.org>
Date: Tue, 26 Apr 2022 16:40:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426125028.18844-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
> +%xx_at          23:3 !function=times_4
> +@XX3_at         ...... ... .. ..... ..... ........ ...          &XX3 xt=%xx_at xb=%xx_xb

Hmm.  Depends, I suppose on whether you want acc[0-7] or vsr[0-28]

> +/*
> + * Packed VSX Integer GER Flags
> + * 00 - no accumulation no saturation
> + * 01 - accumulate but no saturation
> + * 10 - no accumulation but with saturation
> + * 11 - accumulate with saturation
> + */
> +static inline bool get_sat(uint32_t flags)
> +{
> +    return flags & 0x2;
> +}
> +
> +static inline bool get_acc(uint32_t flags)
> +{
> +    return flags & 0x1;
> +}

Better to have separate helpers for these?  They'd be immediate operands to the function 
replacing XVIGER (see below) and thus optimize well.

> +#define GET_VsrN(a, i) (extract32(a->VsrB((i) / 2), (i) % 2 ? 4 : 0, 4))
> +#define GET_VsrB(a, i) a->VsrB(i)
> +#define GET_VsrH(a, i) a->VsrH(i)
> +
> +#define GET_VsrSN(a, i) (sextract32(a->VsrSB((i) / 2), (i) % 2 ? 4 : 0, 4))
> +#define GET_VsrSB(a, i) a->VsrSB(i)
> +#define GET_VsrSH(a, i) a->VsrSH(i)

These can be made into functions of the form

     typedef int32_t xviger_extract(ppc_vsr_t *a, int i);


> +#define XVIGER(NAME, RANK, EL)                                                 \
> +    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,                    \
> +              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)            \
> +    {                                                                          \
> +        ppc_vsr_t *a = cpu_vsr_ptr(env, a_r), *b = cpu_vsr_ptr(env, b_r), *at; \
> +        bool sat = get_sat(packed_flags), acc = get_acc(packed_flags);         \
> +        uint8_t pmsk = ger_get_pmsk(mask), xmsk = ger_get_xmsk(mask),          \
> +                ymsk = ger_get_ymsk(mask);                                     \
> +        uint8_t pmsk_bit, xmsk_bit, ymsk_bit;                                  \
> +        int64_t psum;                                                          \
> +        int32_t va, vb;                                                        \
> +        int i, j, k;                                                           \
> +        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {           \
> +            at = cpu_vsr_ptr(env, at_r + i);                                   \
> +            for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {       \
> +                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {                  \
> +                    psum = 0;                                                  \
> +                    for (k = 0, pmsk_bit = 1 << (RANK - 1); k < RANK;          \
> +                         k++, pmsk_bit >>= 1) {                                \
> +                        if (pmsk_bit & pmsk) {                                 \
> +                            va = (int32_t)GET_VsrS##EL(a, RANK * i + k);       \
> +                            vb = (int32_t) ((RANK == 4) ?                      \
> +                                                GET_Vsr##EL(b, RANK * j + k) : \
> +                                                GET_VsrS##EL(b, RANK * j + k));\
> +                            psum += va * vb;                                   \
> +                        }                                                      \
> +                    }                                                          \
> +                    if (acc) {                                                 \
> +                        psum += at->VsrSW(j);                                  \
> +                    }                                                          \
> +                    if (sat && psum > INT32_MAX) {                             \
> +                        set_vscr_sat(env);                                     \
> +                        at->VsrSW(j) = INT32_MAX;                              \
> +                    } else if (sat && psum < INT32_MIN) {                      \
> +                        set_vscr_sat(env);                                     \
> +                        at->VsrSW(j) = INT32_MIN;                              \
> +                    } else {                                                   \
> +                        at->VsrSW(j) = (int32_t) psum;                         \
> +                    }                                                          \
> +                } else {                                                       \
> +                    at->VsrSW(j) = 0;                                          \
> +                }                                                              \
> +            }                                                                  \
> +        }                                                                      \
> +    }

... which means that this monster can be a function instead of a non-debuggable macro.

> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 8094e0b033..a994d98238 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -291,4 +291,32 @@ G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                               uintptr_t retaddr);
>   #endif
>   
> +/*
> + * Auxiliary functions to pack/unpack masks for GER instructions.
> + *
> + * Packed format:
> + *  Bits 0-3: xmsk
> + *  Bits 4-7: ymsk
> + *  Bits 8-15: pmsk
> + */
> +static inline uint8_t ger_get_xmsk(uint32_t packed_masks)
> +{
> +    return packed_masks & 0xF;
> +}
> +
> +static inline uint8_t ger_get_ymsk(uint32_t packed_masks)
> +{
> +    return (packed_masks >> 4) & 0xF;
> +}
> +
> +static inline uint8_t ger_get_pmsk(uint32_t packed_masks)
> +{
> +    return (packed_masks >> 8) & 0xFF;
> +}
> +
> +static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
> +{
> +    return (pmsk & 0xFF) << 8 | (ymsk & 0xF) << 4 | (xmsk & 0xF);
> +}

Use hw/registerfields.h.  C.f. PREDDESC in target/arm/internals.h.

> +static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op,
> +                             void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
> +                                            TCGv_i32, TCGv_i32, TCGv_i32))
> +{
> +    uint32_t mask;
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VSX(ctx);
> +    if (unlikely((a->xa / 4 == a->xt / 4) || (a->xb / 4 == a->xt / 4))) {
> +        gen_invalid(ctx);
> +        return true;
> +    }
> +
> +    mask = 0xFFFFFFFF;
> +    helper(cpu_env, tcg_constant_i32(a->xa), tcg_constant_i32(a->xb),
> +           tcg_constant_i32(a->xt), tcg_constant_i32(mask),
> +           tcg_constant_i32(op));
> +    return true;
> +}

Why are you passing register numbers instead of pointers, like everywhere else?


r~

