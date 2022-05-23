Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87100531164
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:47:23 +0200 (CEST)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9L8-0005Zm-CY
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt9Gw-00037S-3P; Mon, 23 May 2022 10:43:02 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt9Gp-0004qX-BA; Mon, 23 May 2022 10:43:01 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5e433d66dso18728147fac.5; 
 Mon, 23 May 2022 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6lpRypvJTu1oSiXPnPOEL3aAZXTfhcaS080zyU8RpGM=;
 b=aZGGaTIsxFm0dgziKiOrGSNWxnFKW+3TyTpviCJgtZ6TVOINhvY2SkHrNh3kNPtU14
 BG1EEsIUyU9NfgPKgLE7BARd5qaL/rGHKzT9XE4KQcLm+wdRhJkqU1vmR+aOKkpE1qV4
 sSLJJrH9jO4fZlhpKKMU2/qKXyjI8KZbiMCMTtnauZlu5Yaifi+mLxvLuRdxiiHOZc1a
 aVjRf7q332C4KNkXWhGLMolW/L4mjKOQHRjr4JjV5eOjggX+WehSZKCOiO+z215arnKg
 ngmsy33oICMZd/xTAS7By9ZBDJWca6drVHdOkjHO1bobAKSUwVGgBG544+8tP7aRHgI/
 tWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6lpRypvJTu1oSiXPnPOEL3aAZXTfhcaS080zyU8RpGM=;
 b=SU8MU29peahijnfAdMfm+q//Z+14atxMCfijql9NjYFqCMYlCIl3IchbA+eNdrDcuB
 Ut+iLYt7c+hxDyKYHs62pM1Mw1Hq/lB/4YA8wLM+l2csN+G/zIUIuMM6lVAx2NxGxMHV
 hJJW84df5wKm9rPghRDzaS8afsktepOiPPe+EpDo85Nyo/KBNToEZj/likWEJVic+fBO
 ISpvNw9Q1Ty2qtCvEJyUF0ZodmHziY19KWuqKnOq1JfkzvDG9lzIFITkpzYYo1JMyCxe
 dWABqK2LEcMCJ1ySBUJMkp8lQ9ALJ99B0AEBQUBXE2efUlGveBfoX55yA1UvNSXOeNaF
 ohzw==
X-Gm-Message-State: AOAM533yfXmfBRRfhvvOju0+qe7A4oAEYXoRpBnhmHzt4+T4pIwTbbj1
 ZMz/lmnx9mmipIeetmCsTd0=
X-Google-Smtp-Source: ABdhPJwAPUkBbwW6zNFFmKmOutjkUbdGUGE7Q/qqTq8y2V9ep4icOrKwllccJlkqxO6dq8zBqkszKQ==
X-Received: by 2002:a05:6871:150:b0:f2:5431:f0da with SMTP id
 z16-20020a056871015000b000f25431f0damr3900109oab.255.1653316973532; 
 Mon, 23 May 2022 07:42:53 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 f4-20020a9d2c04000000b0060a426ee09asm4017026otb.19.2022.05.23.07.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 07:42:53 -0700 (PDT)
Message-ID: <631a9b0d-b3f7-a4f5-8dce-a2233316a523@gmail.com>
Date: Mon, 23 May 2022 11:42:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 4/8] target/ppc: Implemented xvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220520195419.109177-1-lucas.araujo@eldorado.org.br>
 <20220520195419.109177-5-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220520195419.109177-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is failing checkpatch.pl:

$ ../scripts/checkpatch.pl v5-4-8-target-ppc-Implemented-xvf-ger.patch
WARNING: line over 80 characters
#252: FILE: target/ppc/fpu_helper.c:3557:
+                   vsxger_muladd_f mul, vsxger_muladd_f muladd, vsxger_zero zero)

total: 0 errors, 1 warnings, 286 lines checked

v5-4-8-target-ppc-Implemented-xvf-ger.patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

But more important, the patch doesn't apply in ppc-next (gitlab.com/danielhb/qemu/tree/ppc-next)
and patch 01 doesn't apply on current QEMU master. Can you please re-send the whole
series rebased on top of ppc-next?


Thanks,


Daniel
  

On 5/20/22 16:54, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xvf32ger:   VSX Vector 32-bit Floating-Point GER (rank-1 update)
> xvf32gernn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
> multiply, Negative accumulate
> xvf32gernp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Negative
> multiply, Positive accumulate
> xvf32gerpn: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
> multiply, Negative accumulate
> xvf32gerpp: VSX Vector 32-bit Floating-Point GER (rank-1 update) Positive
> multiply, Positive accumulate
> xvf64ger:   VSX Vector 64-bit Floating-Point GER (rank-1 update)
> xvf64gernn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
> multiply, Negative accumulate
> xvf64gernp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Negative
> multiply, Positive accumulate
> xvf64gerpn: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
> multiply, Negative accumulate
> xvf64gerpp: VSX Vector 64-bit Floating-Point GER (rank-1 update) Positive
> multiply, Positive accumulate
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/cpu.h                    |   4 +
>   target/ppc/fpu_helper.c             | 193 +++++++++++++++++++++++++++-
>   target/ppc/helper.h                 |  10 ++
>   target/ppc/insn32.decode            |  13 ++
>   target/ppc/translate/vsx-impl.c.inc |  12 ++
>   5 files changed, 230 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index c8a12a3985..bdedf4138e 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2641,6 +2641,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[i]
>   #define VsrD(i) u64[i]
>   #define VsrSD(i) s64[i]
> +#define VsrSF(i) f32[i]
> +#define VsrDF(i) f64[i]
>   #else
>   #define VsrB(i) u8[15 - (i)]
>   #define VsrSB(i) s8[15 - (i)]
> @@ -2650,6 +2652,8 @@ static inline bool lsw_reg_in_range(int start, int nregs, int rx)
>   #define VsrSW(i) s32[3 - (i)]
>   #define VsrD(i) u64[1 - (i)]
>   #define VsrSD(i) s64[1 - (i)]
> +#define VsrSF(i) f32[3 - (i)]
> +#define VsrDF(i) f64[1 - (i)]
>   #endif
>   
>   static inline int vsr64_offset(int i, bool high)
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 8592727792..1766da5bcf 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -414,7 +414,7 @@ void helper_store_fpscr(CPUPPCState *env, uint64_t val, uint32_t nibbles)
>       ppc_store_fpscr(env, val);
>   }
>   
> -void helper_fpscr_check_status(CPUPPCState *env)
> +static void do_fpscr_check_status(CPUPPCState *env, uintptr_t raddr)
>   {
>       CPUState *cs = env_cpu(env);
>       target_ulong fpscr = env->fpscr;
> @@ -455,13 +455,19 @@ void helper_fpscr_check_status(CPUPPCState *env)
>       }
>       cs->exception_index = POWERPC_EXCP_PROGRAM;
>       env->error_code = error | POWERPC_EXCP_FP;
> +    env->fpscr |= error ? FP_FEX : 0;
>       /* Deferred floating-point exception after target FPSCR update */
>       if (fp_exceptions_enabled(env)) {
>           raise_exception_err_ra(env, cs->exception_index,
> -                               env->error_code, GETPC());
> +                               env->error_code, raddr);
>       }
>   }
>   
> +void helper_fpscr_check_status(CPUPPCState *env)
> +{
> +    do_fpscr_check_status(env, GETPC());
> +}
> +
>   static void do_float_check_status(CPUPPCState *env, bool change_fi,
>                                     uintptr_t raddr)
>   {
> @@ -3469,3 +3475,186 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
>       *xt = t;
>       do_float_check_status(env, true, GETPC());
>   }
> +
> +static inline void vsxger_excp(CPUPPCState *env, uintptr_t retaddr)
> +{
> +    /*
> +     * XV*GER instructions execute and set the FPSCR as if exceptions
> +     * are disabled and only at the end throw an exception
> +     */
> +    target_ulong enable;
> +    enable = env->fpscr & (FP_ENABLES | FP_FI | FP_FR);
> +    env->fpscr &= ~(FP_ENABLES | FP_FI | FP_FR);
> +    int status = get_float_exception_flags(&env->fp_status);
> +    if (unlikely(status & float_flag_invalid)) {
> +        if (status & float_flag_invalid_snan) {
> +            float_invalid_op_vxsnan(env, 0);
> +        }
> +        if (status & float_flag_invalid_imz) {
> +            float_invalid_op_vximz(env, false, 0);
> +        }
> +        if (status & float_flag_invalid_isi) {
> +            float_invalid_op_vxisi(env, false, 0);
> +        }
> +    }
> +    do_float_check_status(env, false, retaddr);
> +    env->fpscr |= enable;
> +    do_fpscr_check_status(env, retaddr);
> +}
> +
> +typedef void vsxger_zero(ppc_vsr_t *at, int, int);
> +
> +typedef void vsxger_muladd_f(ppc_vsr_t *, ppc_vsr_t *, ppc_vsr_t *, int, int,
> +                             int flags, float_status *s);
> +
> +static void vsxger_muladd32(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
> +                            int j, int flags, float_status *s)
> +{
> +    at[i].VsrSF(j) = float32_muladd(a->VsrSF(i), b->VsrSF(j),
> +                                    at[i].VsrSF(j), flags, s);
> +}
> +
> +static void vsxger_mul32(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
> +                         int j, int flags, float_status *s)
> +{
> +    at[i].VsrSF(j) = float32_mul(a->VsrSF(i), b->VsrSF(j), s);
> +}
> +
> +static void vsxger_zero32(ppc_vsr_t *at, int i, int j)
> +{
> +    at[i].VsrSF(j) = float32_zero;
> +}
> +
> +static void vsxger_muladd64(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
> +                            int j, int flags, float_status *s)
> +{
> +    if (j >= 2) {
> +        j -= 2;
> +        at[i].VsrDF(j) = float64_muladd(a[i / 2].VsrDF(i % 2), b->VsrDF(j),
> +                                        at[i].VsrDF(j), flags, s);
> +    }
> +}
> +
> +static void vsxger_mul64(ppc_vsr_t *at, ppc_vsr_t *a, ppc_vsr_t *b, int i,
> +                         int j, int flags, float_status *s)
> +{
> +    if (j >= 2) {
> +        j -= 2;
> +        at[i].VsrDF(j) = float64_mul(a[i / 2].VsrDF(i % 2), b->VsrDF(j), s);
> +    }
> +}
> +
> +static void vsxger_zero64(ppc_vsr_t *at, int i, int j)
> +{
> +    if (j >= 2) {
> +        j -= 2;
> +        at[i].VsrDF(j) = float64_zero;
> +    }
> +}
> +
> +static void vsxger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
> +                   uint32_t mask, bool acc, bool neg_mul, bool neg_acc,
> +                   vsxger_muladd_f mul, vsxger_muladd_f muladd, vsxger_zero zero)
> +{
> +    int i, j, xmsk_bit, ymsk_bit, op_flags;
> +    uint8_t xmsk = mask & 0x0F;
> +    uint8_t ymsk = (mask >> 4) & 0x0F;
> +    float_status *excp_ptr = &env->fp_status;
> +    op_flags = (neg_acc ^ neg_mul) ? float_muladd_negate_c : 0;
> +    op_flags |= (neg_mul) ? float_muladd_negate_result : 0;
> +    helper_reset_fpstatus(env);
> +    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
> +        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
> +            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
> +                if (acc) {
> +                    muladd(at, a, b, i, j, op_flags, excp_ptr);
> +                } else {
> +                    mul(at, a, b, i, j, op_flags, excp_ptr);
> +                }
> +            } else {
> +                zero(at, i, j);
> +            }
> +        }
> +    }
> +    vsxger_excp(env, GETPC());
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF32GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                     ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, false, false, false, vsxger_mul32,
> +           vsxger_muladd32, vsxger_zero32);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF32GERPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, false, false, vsxger_mul32,
> +           vsxger_muladd32, vsxger_zero32);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF32GERPN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, false, true, vsxger_mul32,
> +           vsxger_muladd32, vsxger_zero32);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF32GERNP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, true, false, vsxger_mul32,
> +           vsxger_muladd32, vsxger_zero32);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF32GERNN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, true, true, vsxger_mul32,
> +           vsxger_muladd32, vsxger_zero32);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF64GER(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                     ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, false, false, false, vsxger_mul64,
> +           vsxger_muladd64, vsxger_zero64);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF64GERPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, false, false, vsxger_mul64,
> +           vsxger_muladd64, vsxger_zero64);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF64GERPN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, false, true, vsxger_mul64,
> +           vsxger_muladd64, vsxger_zero64);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF64GERNP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, true, false, vsxger_mul64,
> +           vsxger_muladd64, vsxger_zero64);
> +}
> +
> +QEMU_FLATTEN
> +void helper_XVF64GERNN(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
> +                       ppc_acc_t *at, uint32_t mask)
> +{
> +    vsxger(env, a, b, at, mask, true, true, true, vsxger_mul64,
> +           vsxger_muladd64, vsxger_zero64);
> +}
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 29354276f0..054d25f3b0 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -550,6 +550,16 @@ DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, acc, i32)
>   DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF32GER, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF32GERPP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF32GERPN, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF32GERNP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF32GERNN, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF64GER, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF64GERPP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF64GERPN, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF64GERNP, void, env, vsr, vsr, acc, i32)
> +DEF_HELPER_5(XVF64GERNN, void, env, vsr, vsr, acc, i32)
>   
>   DEF_HELPER_2(efscfsi, i32, env, i32)
>   DEF_HELPER_2(efscfui, i32, env, i32)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 899a04bf77..c561a17c7d 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -173,6 +173,7 @@
>   # 32 bit GER instructions have all mask bits considered 1
>   &MMIRR_XX3      xa xb xt pmsk xmsk ymsk
>   %xx_at          23:3
> +%xx_xa_pair     2:1 17:4 !function=times_2
>   @XX3_at         ...... ... .. ..... ..... ........ ...          &MMIRR_XX3 xt=%xx_at xb=%xx_xb \
>                                                                   pmsk=255 xmsk=15 ymsk=15
>   
> @@ -737,3 +738,15 @@ XVI16GER2PP     111011 ... -- ..... ..... 01101011 ..-  @XX3_at xa=%xx_xa
>   XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
>   XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
>   XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
> +
> +XVF32GER        111011 ... -- ..... ..... 00011011 ..-  @XX3_at xa=%xx_xa
> +XVF32GERPP      111011 ... -- ..... ..... 00011010 ..-  @XX3_at xa=%xx_xa
> +XVF32GERPN      111011 ... -- ..... ..... 10011010 ..-  @XX3_at xa=%xx_xa
> +XVF32GERNP      111011 ... -- ..... ..... 01011010 ..-  @XX3_at xa=%xx_xa
> +XVF32GERNN      111011 ... -- ..... ..... 11011010 ..-  @XX3_at xa=%xx_xa
> +
> +XVF64GER        111011 ... -- .... 0 ..... 00111011 ..-  @XX3_at xa=%xx_xa_pair
> +XVF64GERPP      111011 ... -- .... 0 ..... 00111010 ..-  @XX3_at xa=%xx_xa_pair
> +XVF64GERPN      111011 ... -- .... 0 ..... 10111010 ..-  @XX3_at xa=%xx_xa_pair
> +XVF64GERNP      111011 ... -- .... 0 ..... 01111010 ..-  @XX3_at xa=%xx_xa_pair
> +XVF64GERNN      111011 ... -- .... 0 ..... 11111010 ..-  @XX3_at xa=%xx_xa_pair
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index c9ed898bb6..76747956bb 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -2869,6 +2869,18 @@ TRANS64(PMXVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
>   TRANS64(PMXVI16GER2S, do_ger, gen_helper_XVI16GER2S)
>   TRANS64(PMXVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
>   
> +TRANS(XVF32GER, do_ger, gen_helper_XVF32GER)
> +TRANS(XVF32GERPP, do_ger, gen_helper_XVF32GERPP)
> +TRANS(XVF32GERPN, do_ger, gen_helper_XVF32GERPN)
> +TRANS(XVF32GERNP, do_ger, gen_helper_XVF32GERNP)
> +TRANS(XVF32GERNN, do_ger, gen_helper_XVF32GERNN)
> +
> +TRANS(XVF64GER, do_ger, gen_helper_XVF64GER)
> +TRANS(XVF64GERPP, do_ger, gen_helper_XVF64GERPP)
> +TRANS(XVF64GERPN, do_ger, gen_helper_XVF64GERPN)
> +TRANS(XVF64GERNP, do_ger, gen_helper_XVF64GERNP)
> +TRANS(XVF64GERNN, do_ger, gen_helper_XVF64GERNN)
> +
>   #undef GEN_XX2FORM
>   #undef GEN_XX3FORM
>   #undef GEN_XX2IFORM

