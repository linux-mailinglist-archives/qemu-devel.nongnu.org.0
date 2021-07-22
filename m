Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B23D2FF1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:44:47 +0200 (CEST)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6hQs-0005uu-9H
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hQ1-0005Fn-Dn
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:43:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hPz-0003BW-Hj
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:43:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id a14so1073196plh.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 15:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OhUfoXN1xXMTmeY5DYW1ib+ZwLDJPv84m6t1BQMCWA0=;
 b=WP01Bg5i498Kibapy3W5TjA2QHJ5WvtzYu0MbGC9ycSvLCmQyjJYvXp1CCBjUK9EvO
 eomI8GQSKADJJgHizTaYNTgFk7szrPAQTQm9GdSXiqZXQqdc50meo2yGrAD3vVV+j9Uk
 qYmPEM+6OMerfRzPOqJPgG+d0pRH+bKmb3bkEzTYO3xgg6XOVy7KQldNdKF8OA+0R71j
 ZCll/ppBBMCOJIdt0C3E6jQeDammd91upqf2vlPnZu53QNKD5tBb33nsWMet+SR42WL1
 TEtka5Oe79Gmsav1jaDertmNEVovRU5mlJVVYv+Mc+wYQUeiwZFnsjwsRxEOKv2bPb2N
 fNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OhUfoXN1xXMTmeY5DYW1ib+ZwLDJPv84m6t1BQMCWA0=;
 b=pOG4NuyhTvGeKBaAl3CpHQkjUkk19S0DTdscpNPzU/2SU99KTL6VOPBPYtDoiEKZPA
 3wo2qKXDS4NEKffvJjHThzRfhQ8OQKyEHad2mRoJaro/ShBRjyCLZR9D6hrwxPNkkKV7
 OAN3XzAp1I9iexue5J0PCUbLIcBYg8LdX5bnlCib2Z1Sz7e2NyKl0sOmOIxB9tAujAXH
 8VgUpDZ2WX69A0mGRAlqqBvgxJAkWTv+GQSZE0skaX3TL7j6FWN1DmNmAcnTXtZTVRrS
 ZHOnp0r7HXBlrMnsmsvOB92vM5uahR0zN+OBgwu77Xf0gio3o4kq9nd9Thd7tRzMixuV
 1myg==
X-Gm-Message-State: AOAM533E2KaCF0nKcYKIwnsji3WNfHeAdQ4+7tGySnNVoHZPeXnzl9HN
 xX0rn8vnHizK8BKP7Q3sgIOI/w==
X-Google-Smtp-Source: ABdhPJyLdUWrrEExCd+B3qW2EHfwCwDGOPMqaMga4tPohyGW4HL9ogpEwRVQGDF8ODqCkNxbv4H1Ng==
X-Received: by 2002:a17:90a:c87:: with SMTP id
 v7mr4560365pja.106.1626993829222; 
 Thu, 22 Jul 2021 15:43:49 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id s195sm16093697pgc.44.2021.07.22.15.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 15:43:48 -0700 (PDT)
Subject: Re: [PATCH v2 03/22] target/loongarch: Add core definition
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-4-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea7be587-1bc6-f770-1c9f-4f57e1c3c7eb@linaro.org>
Date: Thu, 22 Jul 2021 12:43:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:52 PM, Song Gao wrote:
> This patch add target state header, target definitions
> and initialization routines.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu-param.h |  21 ++++
>   target/loongarch/cpu-qom.h   |  40 ++++++
>   target/loongarch/cpu.c       | 293 +++++++++++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.h       | 265 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 619 insertions(+)
>   create mode 100644 target/loongarch/cpu-param.h
>   create mode 100644 target/loongarch/cpu-qom.h
>   create mode 100644 target/loongarch/cpu.c
>   create mode 100644 target/loongarch/cpu.h
> 
> diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
> new file mode 100644
> index 0000000..582ee29
> --- /dev/null
> +++ b/target/loongarch/cpu-param.h
> @@ -0,0 +1,21 @@
> +/*
> + * LoongArch cpu parameters for qemu.
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + *
> + * SPDX-License-Identifier: LGPL-2.1+
> + */
> +
> +#ifndef LOONGARCH_CPU_PARAM_H
> +#define LOONGARCH_CPU_PARAM_H 1
> +
> +#ifdef TARGET_LOONGARCH64
> +#define TARGET_LONG_BITS 64

Why the ifdef for TARGET_LOONGARCH64?
Nothing will compile without that set.

> +#ifdef CONFIG_TCG
> +static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
> +                                              const TranslationBlock *tb)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +
> +    env->active_tc.PC = tb->pc;
> +    env->hflags &= ~LOONGARCH_HFLAG_BMASK;
> +    env->hflags |= tb->flags & LOONGARCH_HFLAG_BMASK;
> +}

Loongarch has no branch delay slots, so you should not have replicated the mips branch 
delay slot handling.  There should be no BMASK at all.

> +#ifdef CONFIG_TCG
> +#include "hw/core/tcg-cpu-ops.h"
> +
> +static struct TCGCPUOps loongarch_tcg_ops = {
> +    .initialize = loongarch_tcg_init,
> +    .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
> +};
> +#endif /* CONFIG_TCG */

May I presume that Loongarch has virtualization hardware, and will eventually support KVM? 
  If not, there is no need for CONFIG_TCG anywhere.

> +#define TCG_GUEST_DEFAULT_MO (0)
> +#define UNASSIGNED_CPU_ID 0xFFFFFFFF
> +
> +typedef union fpr_t fpr_t;
> +union fpr_t {
> +    float64  fd;   /* ieee double precision */
> +    float32  fs[2];/* ieee single precision */
> +    uint64_t d;    /* binary double fixed-point */
> +    uint32_t w[2]; /* binary single fixed-point */
> +};

For what it's worth, we already have a CPU_DoubleU type that could be used.  But frankly, 
float64 *is* uint64_t, so there's very little use in putting them together into a union. 
It would seem that you don't even use fs and w for more than fpu_dump_state, and you're 
even doing it wrong there.

> +typedef struct CPULoongArchFPUContext CPULoongArchFPUContext;
> +struct CPULoongArchFPUContext {
> +    /* Floating point registers */
> +    fpr_t fpr[32];
> +    float_status fp_status;
> +
> +    bool cf[8];
> +    /*
> +     * fcsr0
> +     * 31:29 |28:24 |23:21 |20:16 |15:10 |9:8 |7  |6  |5 |4:0
> +     *        Cause         Flags         RM   DAE TM     Enables
> +     */
> +    uint32_t fcsr0;
> +    uint32_t fcsr0_mask;
> +    uint32_t vcsr16;
> +
> +#define FCSR0_M1    0xdf         /* FCSR1 mask, DAE, TM and Enables */
> +#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
> +#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
> +#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
> +#define GET_FP_CAUSE(reg)        (((reg) >> 24) & 0x1f)
> +#define GET_FP_ENABLE(reg)       (((reg) >>  0) & 0x1f)
> +#define GET_FP_FLAGS(reg)        (((reg) >> 16) & 0x1f)
> +#define SET_FP_CAUSE(reg, v)      do { (reg) = ((reg) & ~(0x1f << 24)) | \
> +                                               ((v & 0x1f) << 24);       \
> +                                     } while (0)
> +#define SET_FP_ENABLE(reg, v)     do { (reg) = ((reg) & ~(0x1f <<  0)) | \
> +                                               ((v & 0x1f) << 0);        \
> +                                     } while (0)
> +#define SET_FP_FLAGS(reg, v)      do { (reg) = ((reg) & ~(0x1f << 16)) | \
> +                                               ((v & 0x1f) << 16);       \
> +                                     } while (0)
> +#define UPDATE_FP_FLAGS(reg, v)   do { (reg) |= ((v & 0x1f) << 16); } while (0)
> +#define FP_INEXACT        1
> +#define FP_UNDERFLOW      2
> +#define FP_OVERFLOW       4
> +#define FP_DIV0           8
> +#define FP_INVALID        16
> +};
> +
> +#define TARGET_INSN_START_EXTRA_WORDS 2
> +#define LOONGARCH_FPU_MAX 1
> +#define N_IRQS      14
> +
> +enum loongarch_feature {
> +    LA_FEATURE_3A5000,
> +};
> +
> +typedef struct TCState TCState;
> +struct TCState {
> +    target_ulong gpr[32];
> +    target_ulong PC;
> +};
> +
> +typedef struct CPULoongArchState CPULoongArchState;
> +struct CPULoongArchState {
> +    TCState active_tc;
> +    CPULoongArchFPUContext active_fpu;

Please don't replicate the mips foolishness with active_tc and active_fpu.  There is no 
inactive_fpu with which to contrast this.  Just include these fields directly into the 
main CPULoongArchState structure.

> +
> +    uint32_t current_tc;
> +    uint64_t scr[4];
> +    uint32_t current_fpu;
> +
> +    /* LoongArch CSR register */
> +    CPU_LOONGARCH_CSR
> +    target_ulong lladdr; /* LL virtual address compared against SC */
> +    target_ulong llval;
> +
> +    CPULoongArchFPUContext fpus[LOONGARCH_FPU_MAX];

More copying from MIPS?  What is this for?


> +
> +    /* QEMU */
> +    int error_code;
> +    uint32_t hflags;    /* CPU State */
> +#define TLB_NOMATCH   0x1
> +#define INST_INAVAIL  0x2 /* Invalid instruction word for BadInstr */
> +    /* TMASK defines different execution modes */
> +#define LOONGARCH_HFLAG_TMASK  0x1F5807FF
> +#define LOONGARCH_HFLAG_KU     0x00003 /* kernel/supervisor/user mode mask   */
> +#define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
> +#define LOONGARCH_HFLAG_KM     0x00000 /* kernel mode flag                   */
> +#define LOONGARCH_HFLAG_64     0x00008 /* 64-bit instructions enabled        */

Is there a 32-bit mode for LoongArch?  I don't see this big in CRMD.  This big overlaps 
the "Direct address translation mode enable bit".  Which does sound like it should be 
present in tb->flags,

> +#define LOONGARCH_HFLAG_FPU    0x00020 /* FPU enabled                        */
> +#define LOONGARCH_HFLAG_F64    0x00040 /* 64-bit FPU enabled                 */

I don't see that there is a mode-switch for a 32-bit fpu either.

> +#define LOONGARCH_HFLAG_BMASK  0x3800
> +#define LOONGARCH_HFLAG_B      0x00800 /* Unconditional branch               */
> +#define LOONGARCH_HFLAG_BC     0x01000 /* Conditional branch                 */
> +#define LOONGARCH_HFLAG_BR     0x02000 /* branch to register (can't link TB) */

None of the BMASK stuff applies to LoongArch.


> +#define LOONGARCH_HFLAG_FRE   0x2000000 /* FRE enabled */
> +#define LOONGARCH_HFLAG_ELPA  0x4000000
> +    target_ulong btarget;        /* Jump / branch target               */
> +    target_ulong bcond;          /* Branch condition (if needed)       */

Nor this.

> +static inline LoongArchCPU *loongarch_env_get_cpu(CPULoongArchState *env)
> +{
> +    return container_of(env, LoongArchCPU, env);
> +}
> +
> +#define ENV_GET_CPU(e) CPU(loongarch_env_get_cpu(e))

You have copied this from a very old version of qemu.  These were replaced by generic 
functions in include/exec/cpu-all.h.

> +void loongarch_tcg_init(void);
> +
> +void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> +
> +void QEMU_NORETURN do_raise_exception_err(CPULoongArchState *env,
> +                                          uint32_t exception,
> +                                          int error_code,
> +                                          uintptr_t pc);
> +
> +static inline void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
> +                                                    uint32_t exception,
> +                                                    uintptr_t pc)
> +{
> +    do_raise_exception_err(env, exception, 0, pc);
> +}
> +
> +static inline void compute_hflags(CPULoongArchState *env)
> +{
> +    env->hflags &= ~(LOONGARCH_HFLAG_64 | LOONGARCH_HFLAG_FPU |
> +                     LOONGARCH_HFLAG_KU | LOONGARCH_HFLAG_ELPA);
> +
> +    env->hflags |= (env->CSR_CRMD & CSR_CRMD_PLV);
> +    env->hflags |= LOONGARCH_HFLAG_64;
> +
> +    if (env->CSR_EUEN & CSR_EUEN_FPEN) {
> +        env->hflags |= LOONGARCH_HFLAG_FPU;
> +    }
> +}
> +
> +const char *loongarch_exception_name(int32_t exception);

These should not be declared in cpu.h.


r~

