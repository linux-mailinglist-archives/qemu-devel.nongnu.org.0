Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4553D55E1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:51:56 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wL5-0007g6-8P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7wHI-0003Qn-OS
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:48:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33032 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7wHE-0002t4-Ae
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:48:00 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWuCvdv5go_4jAA--.47984S3; 
 Mon, 26 Jul 2021 16:47:45 +0800 (CST)
Subject: Re: [PATCH v2 03/22] target/loongarch: Add core definition
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-4-git-send-email-gaosong@loongson.cn>
 <ea7be587-1bc6-f770-1c9f-4f57e1c3c7eb@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <ce2e4871-bed6-e5a7-b8ec-faf23c836307@loongson.cn>
Date: Mon, 26 Jul 2021 16:47:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ea7be587-1bc6-f770-1c9f-4f57e1c3c7eb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxWuCvdv5go_4jAA--.47984S3
X-Coremail-Antispam: 1UD129KBjvJXoW3uF18CrWkGrW8Gw47Ar1rtFb_yoWkWr1Upr
 18Ar45JryUJrs7Jw1xJw15Jry5Jr18Gw1UCr1IqF4UJr4UJr10gr1jqrn0gF1UXr48Jr1U
 AF1UXr1UZF17JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
 62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6c
 x26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi, Richard.

On 07/23/2021 06:43 AM, Richard Henderson wrote:
> On 7/20/21 11:52 PM, Song Gao wrote:
>> This patch add target state header, target definitions
>> and initialization routines.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   target/loongarch/cpu-param.h |  21 ++++
>>   target/loongarch/cpu-qom.h   |  40 ++++++
>>   target/loongarch/cpu.c       | 293 +++++++++++++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu.h       | 265 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 619 insertions(+)
>>   create mode 100644 target/loongarch/cpu-param.h
>>   create mode 100644 target/loongarch/cpu-qom.h
>>   create mode 100644 target/loongarch/cpu.c
>>   create mode 100644 target/loongarch/cpu.h
>>
>> diff --git a/target/loongarch/cpu-param.h b/target/loongarch/cpu-param.h
>> new file mode 100644
>> index 0000000..582ee29
>> --- /dev/null
>> +++ b/target/loongarch/cpu-param.h
>> @@ -0,0 +1,21 @@
>> +/*
>> + * LoongArch cpu parameters for qemu.
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + *
>> + * SPDX-License-Identifier: LGPL-2.1+
>> + */
>> +
>> +#ifndef LOONGARCH_CPU_PARAM_H
>> +#define LOONGARCH_CPU_PARAM_H 1
>> +
>> +#ifdef TARGET_LOONGARCH64
>> +#define TARGET_LONG_BITS 64
> 
> Why the ifdef for TARGET_LOONGARCH64?
> Nothing will compile without that set.
> 

OK, I'll remove it.

>> +#ifdef CONFIG_TCG
>> +static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
>> +                                              const TranslationBlock *tb)
>> +{
>> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> +    CPULoongArchState *env = &cpu->env;
>> +
>> +    env->active_tc.PC = tb->pc;
>> +    env->hflags &= ~LOONGARCH_HFLAG_BMASK;
>> +    env->hflags |= tb->flags & LOONGARCH_HFLAG_BMASK;
>> +}
> 
> Loongarch has no branch delay slots, so you should not have replicated the mips branch delay slot handling.  There should be no BMASK at all.
>
OK
 
>> +#ifdef CONFIG_TCG
>> +#include "hw/core/tcg-cpu-ops.h"
>> +
>> +static struct TCGCPUOps loongarch_tcg_ops = {
>> +    .initialize = loongarch_tcg_init,
>> +    .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
>> +};
>> +#endif /* CONFIG_TCG */
> 
> May I presume that Loongarch has virtualization hardware, and will eventually support KVM?  If not, there is no need for CONFIG_TCG anywhere.
>
Yes, Loongarch has virtualization hardware,  We plan to support KVM in QEMU in the future.  
 
>> +#define TCG_GUEST_DEFAULT_MO (0)
>> +#define UNASSIGNED_CPU_ID 0xFFFFFFFF
>> +
>> +typedef union fpr_t fpr_t;
>> +union fpr_t {
>> +    float64  fd;   /* ieee double precision */
>> +    float32  fs[2];/* ieee single precision */
>> +    uint64_t d;    /* binary double fixed-point */
>> +    uint32_t w[2]; /* binary single fixed-point */
>> +};
> 
> For what it's worth, we already have a CPU_DoubleU type that could be used.  But frankly, float64 *is* uint64_t, so there's very little use in putting them together into a union. It would seem that you don't even use fs and w for more than fpu_dump_state, and you're even doing it wrong there.
>
OK， I'll correct it.
 
>> +typedef struct CPULoongArchFPUContext CPULoongArchFPUContext;
>> +struct CPULoongArchFPUContext {
>> +    /* Floating point registers */
>> +    fpr_t fpr[32];
>> +    float_status fp_status;
>> +
>> +    bool cf[8];
>> +    /*
>> +     * fcsr0
>> +     * 31:29 |28:24 |23:21 |20:16 |15:10 |9:8 |7  |6  |5 |4:0
>> +     *        Cause         Flags         RM   DAE TM     Enables
>> +     */
>> +    uint32_t fcsr0;
>> +    uint32_t fcsr0_mask;
>> +    uint32_t vcsr16;
>> +
>> +#define FCSR0_M1    0xdf         /* FCSR1 mask, DAE, TM and Enables */
>> +#define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
>> +#define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
>> +#define FCSR0_RM    8            /* Round Mode bit num on fcsr0 */
>> +#define GET_FP_CAUSE(reg)        (((reg) >> 24) & 0x1f)
>> +#define GET_FP_ENABLE(reg)       (((reg) >>  0) & 0x1f)
>> +#define GET_FP_FLAGS(reg)        (((reg) >> 16) & 0x1f)
>> +#define SET_FP_CAUSE(reg, v)      do { (reg) = ((reg) & ~(0x1f << 24)) | \
>> +                                               ((v & 0x1f) << 24);       \
>> +                                     } while (0)
>> +#define SET_FP_ENABLE(reg, v)     do { (reg) = ((reg) & ~(0x1f <<  0)) | \
>> +                                               ((v & 0x1f) << 0);        \
>> +                                     } while (0)
>> +#define SET_FP_FLAGS(reg, v)      do { (reg) = ((reg) & ~(0x1f << 16)) | \
>> +                                               ((v & 0x1f) << 16);       \
>> +                                     } while (0)
>> +#define UPDATE_FP_FLAGS(reg, v)   do { (reg) |= ((v & 0x1f) << 16); } while (0)
>> +#define FP_INEXACT        1
>> +#define FP_UNDERFLOW      2
>> +#define FP_OVERFLOW       4
>> +#define FP_DIV0           8
>> +#define FP_INVALID        16
>> +};
>> +
>> +#define TARGET_INSN_START_EXTRA_WORDS 2
>> +#define LOONGARCH_FPU_MAX 1
>> +#define N_IRQS      14
>> +
>> +enum loongarch_feature {
>> +    LA_FEATURE_3A5000,
>> +};
>> +
>> +typedef struct TCState TCState;
>> +struct TCState {
>> +    target_ulong gpr[32];
>> +    target_ulong PC;
>> +};
>> +
>> +typedef struct CPULoongArchState CPULoongArchState;
>> +struct CPULoongArchState {
>> +    TCState active_tc;
>> +    CPULoongArchFPUContext active_fpu;
> 
> Please don't replicate the mips foolishness with active_tc and active_fpu.  There is no inactive_fpu with which to contrast this.  Just include these fields directly into the main CPULoongArchState structure.
> 

OK.

>> +
>> +    uint32_t current_tc;
>> +    uint64_t scr[4];
>> +    uint32_t current_fpu;
>> +
>> +    /* LoongArch CSR register */
>> +    CPU_LOONGARCH_CSR
>> +    target_ulong lladdr; /* LL virtual address compared against SC */
>> +    target_ulong llval;
>> +
>> +    CPULoongArchFPUContext fpus[LOONGARCH_FPU_MAX];
> 
> More copying from MIPS?  What is this for?
>
Oh, It semms so. 

> 
>> +
>> +    /* QEMU */
>> +    int error_code;
>> +    uint32_t hflags;    /* CPU State */
>> +#define TLB_NOMATCH   0x1
>> +#define INST_INAVAIL  0x2 /* Invalid instruction word for BadInstr */
>> +    /* TMASK defines different execution modes */
>> +#define LOONGARCH_HFLAG_TMASK  0x1F5807FF
>> +#define LOONGARCH_HFLAG_KU     0x00003 /* kernel/supervisor/user mode mask   */
>> +#define LOONGARCH_HFLAG_UM     0x00003 /* user mode flag                     */
>> +#define LOONGARCH_HFLAG_KM     0x00000 /* kernel mode flag                   */
>> +#define LOONGARCH_HFLAG_64     0x00008 /* 64-bit instructions enabled        */
> 
> Is there a 32-bit mode for LoongArch?  I don't see this big in CRMD.  This big overlaps the "Direct address translation mode enable bit".  Which does sound like it should be present in tb->flags,
>

No.
 
>> +#define LOONGARCH_HFLAG_FPU    0x00020 /* FPU enabled                        */
>> +#define LOONGARCH_HFLAG_F64    0x00040 /* 64-bit FPU enabled                 */
> 
> I don't see that there is a mode-switch for a 32-bit fpu either.
> 
>> +#define LOONGARCH_HFLAG_BMASK  0x3800
>> +#define LOONGARCH_HFLAG_B      0x00800 /* Unconditional branch               */
>> +#define LOONGARCH_HFLAG_BC     0x01000 /* Conditional branch                 */
>> +#define LOONGARCH_HFLAG_BR     0x02000 /* branch to register (can't link TB) */
> 
> None of the BMASK stuff applies to LoongArch.
>> 
>> +#define LOONGARCH_HFLAG_FRE   0x2000000 /* FRE enabled */
>> +#define LOONGARCH_HFLAG_ELPA  0x4000000
>> +    target_ulong btarget;        /* Jump / branch target               */
>> +    target_ulong bcond;          /* Branch condition (if needed)       */
> 
> Nor this.
OK, I'll remove them.

> 
>> +static inline LoongArchCPU *loongarch_env_get_cpu(CPULoongArchState *env)
>> +{
>> +    return container_of(env, LoongArchCPU, env);
>> +}
>> +
>> +#define ENV_GET_CPU(e) CPU(loongarch_env_get_cpu(e))
> 
> You have copied this from a very old version of qemu.  These were replaced by generic functions in include/exec/cpu-all.h.

Right, We copied this from 3.10 version, the version is really old.  

> 
>> +void loongarch_tcg_init(void);
>> +
>> +void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>> +
>> +void QEMU_NORETURN do_raise_exception_err(CPULoongArchState *env,Drop all of the branch delay slot stuff.
Use a common routine and pass in the TCGCond
>> +                                          uint32_t exception,
>> +                                          int error_code,
>> +                                          uintptr_t pc);
>> +
>> +static inline void QEMU_NORETURN do_raise_exception(CPULoongArchState *env,
>> +                                                    uint32_t exception,
>> +                                                    uintptr_t pc)
>> +{
>> +    do_raise_exception_err(env, exception, 0, pc);
>> +}
>> +
>> +static inline void compute_hflags(CPULoongArchState *env)
>> +{
>> +    env->hflags &= ~(LOONGARCH_HFLAG_64 | LOONGARCH_HFLAG_FPU |
>> +                     LOONGARCH_HFLAG_KU | LOONGARCH_HFLAG_ELPA);
>> +
>> +    env->hflags |= (env->CSR_CRMD & CSR_CRMD_PLV);
>> +    env->hflags |= LOONGARCH_HFLAG_64;
>> +
>> +    if (env->CSR_EUEN & CSR_EUEN_FPEN) {
>> +        env->hflags |= LOONGARCH_HFLAG_FPU;
>> +    }
>> +}
>> +
>> +const char *loongarch_exception_name(int32_t exception);
> 
> These should not be declared in cpu.h.
>

Hmm,  but where can we declared in ? such as ARM architecture declared in internals.h, is that OK?


Thanks 
Song Gao


