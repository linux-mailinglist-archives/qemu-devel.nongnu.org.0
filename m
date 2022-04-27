Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285A510D0B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 02:11:05 +0200 (CEST)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njVGp-0002Gx-VD
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 20:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVFe-0001S9-R0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:09:50 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVFd-0001tR-4m
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 20:09:50 -0400
Received: by mail-pg1-x52f.google.com with SMTP id z21so194010pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UIaasBCI02x7FizrylARQAMWWLY6u0qcd1Tvo3oTc5s=;
 b=yZ76Oqsz0Mfhn7bI80tP+8LvhcPe9XD9NBpWyb4Zfzi8hxv3u3im+GTzONAij9dDOu
 mIbGSU/KIi6J9/lIwSgHtigXH4sBwD9rUw4r5wY3AXv2L44zuLSSHzu3PSWsIRseOoUx
 Vjinpy6oCDL63A+WYaEi7jqkBH8w5ABOi0DTI/oHBohIsTT6jLuIEMSUtMNjW6DAcEwm
 bgzfKFitQiC+GkUvKe2ktA3MIuUcQHQESsG5PaLqpOCe7dPOBOw02poYUXS92dqbMZd+
 HrMr5Q3vb4ZFfaVTlkXYQcNa6plecSEO5MdaEI6gcoUgjRUWNVY9sthlnYiu1CZTd/Os
 qlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UIaasBCI02x7FizrylARQAMWWLY6u0qcd1Tvo3oTc5s=;
 b=XIuoZVTTtPEAMbXD3kf3UCUX0hueOU0Hr3CoRpo7lORyWeiIeUVKcVhgXfCTB+k3GC
 bzpVVrz4WQuRqBY/ZswP218XGPZBGF5nAA0XGLIPPZ2O0z2FsO6MOTmfNKkmR/4VQ62H
 Pr0uQvQVJVdyXf5AOd64M2ukFw7j/BR0T2LQgG9Nm6EZAIo2p5habdq3PTr6XWOIEdyM
 qixS/jVHxjZpn7zNem3UcNpZTwPI9HnkkIf8aEZwfK5lZpHVl939ib5fUSlXoUwEi/Du
 2XYnZhuRmnrOwa+GfjTH9j2iFkgla4ca3Z7C9HFHnMzbAGaqLeeOZ0CKvZJ/CyU2wz/r
 w/zA==
X-Gm-Message-State: AOAM5319ODkACPx1rFYvL6S8pBZeghXsSoAWloCU4d3kl0eDrCAj0TzN
 Oo6mweX1HqSyhZ3NRLeALK+05w==
X-Google-Smtp-Source: ABdhPJycSfgXLT/KqnCNTn68nqvt28qja2xoFpywJ7/iJ3dIvi9mSdUJPe5/yhYR0DnBmKf2Tx7u2Q==
X-Received: by 2002:a05:6a00:1a0e:b0:50c:f9b5:6c74 with SMTP id
 g14-20020a056a001a0e00b0050cf9b56c74mr22545661pfv.69.1651018187384; 
 Tue, 26 Apr 2022 17:09:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a62f90d000000b0050d227e3c80sm12943999pfh.149.2022.04.26.17.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:09:46 -0700 (PDT)
Message-ID: <1570d433-5e96-54e9-b4aa-db39c39b5691@linaro.org>
Date: Tue, 26 Apr 2022 17:09:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 4/7] target/ppc: Implemented xvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426125028.18844-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 05:50, Lucas Mateus Castro(alqotel) wrote:
> +#define VSXGER(NAME, TYPE, EL)                                          \
> +    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,             \
> +              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)     \
> +    {                                                                   \
> +        ppc_vsr_t *a, *b, *at;                                          \
> +        TYPE aux_acc, va, vb;                                           \
> +        int i, j, xmsk_bit, ymsk_bit, op_flags;                         \
> +        uint8_t xmsk = mask & 0x0F;                                     \
> +        uint8_t ymsk = (mask >> 4) & 0x0F;                              \
> +        int ymax = MIN(4, 128 / (sizeof(TYPE) * 8));                    \
> +        b = cpu_vsr_ptr(env, b_r);                                      \
> +        float_status *excp_ptr = &env->fp_status;                       \
> +        bool acc = ger_acc_flag(packed_flags);                          \
> +        bool neg_acc = ger_neg_acc_flag(packed_flags);                  \
> +        bool neg_mul = ger_neg_mul_flag(packed_flags);                  \
> +        helper_reset_fpstatus(env);                                     \
> +        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {    \
> +            a = cpu_vsr_ptr(env, a_r + i / ymax);                       \
> +            at = cpu_vsr_ptr(env, at_r + i);                            \
> +            for (j = 0, ymsk_bit = 1 << (ymax - 1); j < ymax;           \
> +                 j++, ymsk_bit >>= 1) {                                 \
> +                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {           \
> +                    op_flags = (neg_acc ^ neg_mul) ?                    \
> +                                          float_muladd_negate_c : 0;    \
> +                    op_flags |= (neg_mul) ?                             \
> +                                     float_muladd_negate_result : 0;    \

There's no need to compute op_flags in the inner loop.
Indeed, probably better to compute it in translation.

This macro is trickier than the integer to turn into a function, however,

> +                    va = a->Vsr##EL(i % ymax);                          \
> +                    vb = b->Vsr##EL(j);                                 \
> +                    aux_acc = at->Vsr##EL(j);                           \
> +                    if (acc) {                                          \
> +                        at->Vsr##EL(j) = TYPE##_muladd(va, vb, aux_acc, \
> +                                                       op_flags,        \
> +                                                       excp_ptr);       \
> +                    } else {                                            \
> +                        at->Vsr##EL(j) = TYPE##_mul(va, vb, excp_ptr);  \
> +                    }                                                   \
> +                } else {                                                \
> +                    at->Vsr##EL(j) = 0;                                 \
> +                }                                                       \

static void vsxger_zero_f(ppc_vsr_t *a, int j)
{
     a->VsrSF(i) = float32_zero;
}

static uint64_t vsxger_mul_f(ppc_vsr_t *d, ppc_vsr_t *a, ppc_vsr_t *b,
                              int i, int j, int flags, float_status *s)
{
     float32 af = a->VsrSF(i);
     float32 bf = b->VsrSF(j);
     d->VsrSF(j) = float32_mul(af, bf, s);
}

static uint64_t vsxger_mac_f(ppc_vsr_t *d, ppc_vsr_t *a, ppc_vsr_t *b,
                              int i, int j, int flags, float_status *s)
{
     float32 af = a->VsrSF(i);
     float32 bf = b->VsrSF(j);
     float32 cf = d->VsrSF(j);
     d->VsrSF(j) = float32_muladd(af, bf, cf, flags, s);
}

is probably a good place to start for callbacks.


r~

