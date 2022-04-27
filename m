Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0733C510D2C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 02:27:26 +0200 (CEST)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njVWe-0005HX-N7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 20:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVVn-0004SC-Ni
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:26:31 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:40955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVVm-0004Bl-3N
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:26:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so3592890pjb.5
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 17:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkYRMgR+N8zrNK4dpg1cqnsrtzlbINuq53ZvSXEXzIA=;
 b=hzQcbmJ/ThDQrt7bgvCnimN+eOgkT6SgROhStmN78Qt8JFMmr7r+LpgLlzpzG7xllW
 aD6ufqeMun7u/04g4XMC7IO8Z5wksD4V6RUqyAcBAGX6JBXsK1hZxhIuPRal5loib3KE
 NFC6kVF85VHNWR055OPGQyR95npvs8Q5G3ibeKLjzjThMMc4WURihwDJC57VPksyTSY3
 evYSrh7ehksotKc+2nl9rtOGubaASkWJ7pRsLs9T4chEl26fAZIwYlCBSWZNhW2COCmc
 JXbbJeaazhLlHHuXk/0rzp2qL4W9cU/PQO0M4w1zOUFzf/fP2myoXcXmPeUlBQ2JJVgP
 YY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkYRMgR+N8zrNK4dpg1cqnsrtzlbINuq53ZvSXEXzIA=;
 b=jgYoE/+4NTr4RsHUp4TYwuPqQDajITtRuwWXD0ETsMyo2ESpXoDZa2+9V9sV4Z1kqE
 dBYEkzs+uGJaYvcXd0Lq0wOHkRn5YrQ1pkMWTD1PDxQTPqLmS/t3qFVDiCO7E8f9ZhbN
 w/zpOzbn+ibGLZfNv32ef7d+cB8uJuaEUblRFZjXYG59voZVTc+j3JQhsWnFShJ2KbOJ
 MmbYcZJgC//25ea3XXLGaSWCzwuGuI6kAqJ1Liqr79b2jSEPHR7ZV4yZb6QF3Qdtb1Nu
 sc0zpOof087KUeLwNOrFLOT0Ytimhu01EXrX3CQOVZtfF3d0ujGy7JHCFbg4VgheZN/Q
 SpoQ==
X-Gm-Message-State: AOAM533YojkCV86eFPFLliBnQz5Riz1Zn7CinfJc7GawlgjglmbQFdS6
 puHfLJCuYpnbRp8u6E+ihObszw==
X-Google-Smtp-Source: ABdhPJwJEDpbdn7IrD2w55gpWABsdjg28l5uAXLPx042aVZcY//y8p52I8qHa3RJiy8PHdS5HcpGYg==
X-Received: by 2002:a17:902:7001:b0:158:43ba:56cc with SMTP id
 y1-20020a170902700100b0015843ba56ccmr25184285plk.135.1651019188283; 
 Tue, 26 Apr 2022 17:26:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a056a001a4a00b004f7c76f29c3sm16933769pfv.24.2022.04.26.17.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:26:27 -0700 (PDT)
Message-ID: <e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org>
Date: Tue, 26 Apr 2022 17:26:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 5/7] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426125028.18844-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
> +#define VSXGER16(NAME, ORIG_T, OR_EL)                                   \
> +    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,             \
> +              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)     \
> +    {                                                                   \
> +        ppc_vsr_t *at;                                                  \
> +        float32 psum, aux_acc, va, vb, vc, vd;                          \
> +        int i, j, xmsk_bit, ymsk_bit;                                   \
> +        uint8_t xmsk = mask & 0x0F;                                     \
> +        uint8_t ymsk = (mask >> 4) & 0x0F;                              \
> +        uint8_t pmsk = (mask >> 8) & 0x3;                               \
> +        ppc_vsr_t *b = cpu_vsr_ptr(env, b_r);                           \
> +        ppc_vsr_t *a = cpu_vsr_ptr(env, a_r);                           \
> +        float_status *excp_ptr = &env->fp_status;                       \
> +        bool acc = ger_acc_flag(packed_flags);                          \
> +        bool neg_acc = ger_neg_acc_flag(packed_flags);                  \
> +        bool neg_mul = ger_neg_mul_flag(packed_flags);                  \
> +        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {    \
> +            at = cpu_vsr_ptr(env, at_r + i);                            \
> +            for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {\
> +                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {           \
> +                    va = !(pmsk & 2) ? float32_zero :                   \
> +                                       GET_VSR(Vsr##OR_EL, a,           \
> +                                               2 * i, ORIG_T, float32); \
> +                    vb = !(pmsk & 2) ? float32_zero :                   \
> +                                       GET_VSR(Vsr##OR_EL, b,           \
> +                                               2 * j, ORIG_T, float32); \
> +                    vc = !(pmsk & 1) ? float32_zero :                   \
> +                                       GET_VSR(Vsr##OR_EL, a,           \
> +                                            2 * i + 1, ORIG_T, float32);\
> +                    vd = !(pmsk & 1) ? float32_zero :                   \
> +                                       GET_VSR(Vsr##OR_EL, b,           \
> +                                            2 * j + 1, ORIG_T, float32);\
> +                    psum = float32_mul(va, vb, excp_ptr);               \
> +                    psum = float32_muladd(vc, vd, psum, 0, excp_ptr);   \

This isn't correct -- the intermediate 'prod' (the first multiply) is not rounded.  I 
think the correct way to implement this (barring new softfloat functions) is to compute 
the intermediate product as float64 with float_round_to_odd, then float64r32_muladd into 
the correct rounding mode to finish.

> +                    if (acc) {                                          \
> +                        if (neg_mul) {                                  \
> +                            psum = float32_neg(psum);                   \
> +                        }                                               \
> +                        if (neg_acc) {                                  \
> +                            aux_acc = float32_neg(at->VsrSF(j));        \
> +                        } else {                                        \
> +                            aux_acc = at->VsrSF(j);                     \
> +                        }                                               \
> +                        at->VsrSF(j) = float32_add(psum, aux_acc,       \
> +                                                   excp_ptr);           \

This one, thankfully, uses the rounded intermediate result 'msum', so is ok.

Please do convert this from a macro.  Given that float16 and bfloat16 are addressed the 
same, I think the only callback you need is the conversion from float16_to_float64.  Drop 
the bf16 accessor to ppc_vsr_t.


r~

