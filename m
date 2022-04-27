Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D740A511433
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:15:43 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdlu-000848-NO
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njder-0001eh-3n
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:08:27 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njdep-0003Ed-HE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:08:24 -0400
Received: by mail-ej1-x631.google.com with SMTP id l7so2124450ejn.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VdwKRo/JcA+tU3Tj/gWI+dGciNa9dJyuTKekxDBrErE=;
 b=BQiZvISRMHCof3HJCOlsTosJ7zB+fyfxECAl0HnFv23hPAdcD4mMQvRBbvhQ/phsY5
 /2xTo8XNJq61yXAHIJKmTLw3qYU1A//yyfaik+NIeIH4zt9iiapvkwTpmCon52mzCCK3
 DFXNEqxk9H7Gk/ca9o34Pw0v9p4UDjJxLs4q7tNLZ6d1rQcgxrUvclmIDfWbYaRwDaJL
 GOIY7Q6D02Bq71vi1SxvpXEW4s+T6iTpLzCdSXO0OzdbT7ziqs9jdp9gcaMMkdayVJ+S
 hEP/gq3/2qiQa/1Zgy4RjpqNz3PJ43pUm3gjMmF9kOuks+bqe6R5ZlqExtiWYjz9tNQc
 X6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VdwKRo/JcA+tU3Tj/gWI+dGciNa9dJyuTKekxDBrErE=;
 b=64cVJrum3oZDLAHEgjLKvYR9f/f+AeOmKpByoRARMQrSMENOMI9304IySfDqB6dwcj
 mDmiLHVX/nghMbpInkBHpRqHomKuxdwANT0+AyOMFbLZr2Huqcj17UO6v6e9DlZcWjHF
 KRNViCiZyQfCNF3omP3Fo3DKa4HSGa8b4km2GAKvOkVkWr5Ee35IgRXDe2RJzoy7oJLG
 d9cSJgwEdyhAew6RgrRMYx1RErM4AIxa7gp4R/FEtOPjqTrIwxAnE/I4AscONdlL5HZc
 mi1xBz8wfBoQL9MVHzaDVQaVyb4aLjB8L30ZXY0zdWl/Brv5lv1A2DKO3kJGL5e1aRt+
 /1zw==
X-Gm-Message-State: AOAM530ENjrwXiJeT0ZrjC7zgkURSMW2KWunXFD8Q79sIjBF5Dyitt5Z
 jXvLDSki+2IsLRajeRuJQJc=
X-Google-Smtp-Source: ABdhPJwL0484jGTnMXfd8jr4oc0Qiy07LJ/1UzmvlnyE4JcmeAsU8WfnY6m8yGQb9Z5TmgZ1L6nBxw==
X-Received: by 2002:a17:907:a412:b0:6f0:1071:25ac with SMTP id
 sg18-20020a170907a41200b006f0107125acmr25511672ejc.261.1651050501169; 
 Wed, 27 Apr 2022 02:08:21 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 i19-20020a1709061cd300b006f38920dbeesm4385545ejh.134.2022.04.27.02.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:08:20 -0700 (PDT)
Message-ID: <3ecf4bfb-1373-90b7-f669-a603c2030c9a@redhat.com>
Date: Wed, 27 Apr 2022 11:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/42] Enforce VEX encoding restrictions
Content-Language: en-US
To: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-8-paul@nowt.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220424220204.2493824-8-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/25/22 00:01, Paul Brook wrote:
> +/* If a VEX prefix is used then it must have V=1111b */
> +#define CHECK_AVX_V0(s) do { \
> +    CHECK_AVX(s); \
> +    if ((s->prefix & PREFIX_VEX) && (s->vex_v != 0)) \
> +        goto illegal_op; \
> +    } while (0)
> +

What do you think about

#define CHECK_AVX(s, flags) \
     do {
         if ((s->prefix & PREFIX_VEX) && !(env->hflags & HF_AVX_EN_MASK)) {
             goto illegal_op;
         }
         if ((flags) & SSE_OPF_AVX2) {
             CHECK_AVX2(s);
         }
         if ((flags) & SSE_OPF_AVX_128) {
             CHECK_AVX_128(s);
         }
         if ((flags) & SSE_OPF_V0) {
             CHECK_V0(s);
         }
     }

Macros such as CHECK_AVX_V0_128(s) would become CHECK_AVX(s, SSE_OPF_V0 
| SSE_OPF_AVX_128); a bit longer but still bearable.  And here you would 
have:

>           case 0x210: /* movss xmm, ea */
>               if (mod != 3) {
> +                CHECK_AVX_V0_128(s);
>                   gen_lea_modrm(env, s, modrm);
>                   gen_op_ld_v(s, MO_32, s->T0, s->A0);
>                   tcg_gen_st32_tl(s->T0, cpu_env,
> @@ -3379,6 +3432,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>                   tcg_gen_st32_tl(s->T0, cpu_env,
>                                   offsetof(CPUX86State, xmm_regs[reg].ZMM_L(3)));
>               } else {
> +                CHECK_AVX_128(s);

     CHECK_AVX(s, SSE_OPF_AVX_128);
     if (mod != 3) {
         CHECK_V0(s);
         ...
     } else {
         ...
     }

Another possibility is to add SSE_OPF_V0_MEM (i.e. V0 if mod != 3), and use

     CHECK_AVX(s, SSE_OPF_AVX_128 | SSE_OPF_AVX_V0_MEM);


It's okay not to move _all_ flags checks in the macros, but for example 
here:

> +            if (op6.ext_mask == CPUID_EXT_AVX
> +                    && (s->prefix & PREFIX_VEX) == 0) {
> +                goto illegal_op;
> +            }
> +            if (op6.flags & SSE_OPF_AVX2) {
> +                CHECK_AVX2(s);
> +            }
> +
>               if (b1) {
> +                if (op6.flags & SSE_OPF_V0) {
> +                    CHECK_AVX_V0(s);
> +                } else {
> +                    CHECK_AVX(s);
> +                }
>                   op1_offset = offsetof(CPUX86State,xmm_regs[reg]);
> +
> +                if (op6.flags & SSE_OPF_MMX) {
> +                    CHECK_AVX2_256(s);
> +                }

there is a lot of room for using a flags-extended CHECK_AVX macro.


Also, SSE_OPF_V0 seems overloaded, because it means depending on the 
place in the code:

- always 2-operand

- 2-operand except if SCALAR && !CMP

- 2-operand except if SCALAR && !CMP && has REPZ/REPNZ prefixes

It is not clear to me if the former overlaps with the last (i.e. if 
there are any SCALAR && !CMP operations that are always 2-operand). If 
so, please use different constants for all three; if not, please use a 
different constant for the last, e.g. SSE_OPF_V0 and SSE_OPF_VEC_V0, so 
that the difference is visible in the flags-extended CHECK_AVX macro.

Also related to overloading, here and in patch 37 there is code like this:

> +            if (op7.flags & SSE_OPF_BLENDV && !(s->prefix & PREFIX_VEX)) {
> +                /* Only VEX encodings are valid for these blendv opcodes */
> +                goto illegal_op;
> +            }

If this is for all SSE_OPF_BLENDV operations, it can be handled in the 
flags-enabled CHECK_AVX() macro above.  If it is only for some, it 
should be a new flag SSE_OPF_VEX_ONLY.

Finally (replying here just to keep things together), patch 29 has "We 
abuse the SSE_OPF_SCALAR flag to select the memory operand width 
appropriately".  Please don't; use a separate function that takes in "b" 
and returns a bool, with just a switch statement in it.

> +            CHECK_AVX(s);
> +            scalar_op = (s->prefix & PREFIX_VEX)
> +                && (op7.flags & SSE_OPF_SCALAR)
> +                && !(op7.flags & SSE_OPF_CMP);
> +            if (is_xmm && (op7.flags & SSE_OPF_MMX)) {
> +                CHECK_AVX2_256(s);
> +            }

I think the is_xmm check is always true here (inside case 0x03a: case 
0x13a:, i.e. b is inside the 0x10..0x5f range)?

Paolo

