Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3213FBCC8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 21:11:26 +0200 (CEST)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKmgn-000471-MG
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 15:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKmew-0002QO-Lz; Mon, 30 Aug 2021 15:09:30 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mKmeu-0000mX-HV; Mon, 30 Aug 2021 15:09:30 -0400
Received: by mail-qt1-x831.google.com with SMTP id b4so6883954qtx.0;
 Mon, 30 Aug 2021 12:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NBYtS0YuLywxSJ+zPVnPvJnKBPNiDIXHoWsFTTfD1W4=;
 b=ANrz6QByavs3fWshGJDJ7+zOELx+8s8JLrmAEluYMUH1KsdEXMtxV01h4yMQmJJv4F
 TzaYDeQ3Q5HI3NOyoRgYws168oCxbkDoMOOH5iRW1XAYRQaxP+fAEZ4dxQ80nxVBRWBs
 Tr79kMh9EDAPcwkCP/USKmYz3L3LrO4udYkXtDc/s57V7ZaOoINbx6hYUgPmwr3rQyYH
 iApnxI3K1s3ZOTh1wSpKA4S+Wtu8nTQPJLKsTHktXaX2jJx9IPFh4kg9054quf+qqmL/
 fnzVIbQP3I2KG0KrXhB3Jp9P/9wrGu3fJ8yxZNdT49yqBzc1KRHxSaVYOFAF8Tn+YxQk
 qNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBYtS0YuLywxSJ+zPVnPvJnKBPNiDIXHoWsFTTfD1W4=;
 b=Go8QM6l81S6KBe7pz+0/AwgLfqWTFh7Wzi0AiYh2nV1WGtsu79i4biQW/R/aOZMqQn
 Jh4IYfqCStZc+SnU68Wu59bZOpsNvFrmjtdmdCxs9Lii2NuQze1lUn8Jpl6qkXnXrXHA
 uSmGER/BQPf39miUBb6JNtFIFPt1pZBgP3uamoXmcpsyM3kkEoLz/hJ/+4WjwBJZtkGU
 WobRxI3076+jBZhABYA2D7idFDrk3k5KZfFIkOLp1VmumxJTSihIqQdwH07hB1499e7I
 lGsGo5fi/vEhdH1Aoq/vtnab94TE3LibUZf3gLjAGKfjeNe3hFnTDAr4kWaaJ35JAByW
 EDGw==
X-Gm-Message-State: AOAM5323b0JEGmNpPGNLLzun4hS1MDwTNtMhIiRWtArbEOcfymXY9xJS
 fMm58tLOgOm+3tNNLHvDNgk=
X-Google-Smtp-Source: ABdhPJzI1Lw6FKPErpnlIElT6lvgQnb4FaYNcQzN2T5tSJ2oQjrHXS2pbjsY4bRPQud9sGWpXe+GsA==
X-Received: by 2002:ac8:7154:: with SMTP id h20mr22355443qtp.251.1630350567022; 
 Mon, 30 Aug 2021 12:09:27 -0700 (PDT)
Received: from [192.168.10.222] ([177.197.96.186])
 by smtp.gmail.com with ESMTPSA id y185sm12133056qkb.36.2021.08.30.12.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 12:09:26 -0700 (PDT)
Subject: Re: [PATCH v2 10/16] target/ppc: PMU Event-Based exception support
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210824163032.394099-1-danielhb413@gmail.com>
 <20210824163032.394099-11-danielhb413@gmail.com> <YSXXDoktzkXkd3Vv@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <81920465-74d5-e068-6e47-fb2fe48fdc8b@gmail.com>
Date: Mon, 30 Aug 2021 16:09:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSXXDoktzkXkd3Vv@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.932,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/25/21 2:37 AM, David Gibson wrote:
> On Tue, Aug 24, 2021 at 01:30:26PM -0300, Daniel Henrique Barboza wrote:
>> From: Gustavo Romero <gromero@linux.ibm.com>
>>
>> Following up the rfebb implementation, this patch adds the EBB exception
>> support that are triggered by Performance Monitor alerts. This exception
>> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
>> and BESCR_PME are set.
>>
>> The supported PM alerts will consist of counter negative conditions of
>> the PMU counters. This will be achieved by a timer mechanism that will
>> predict when a counter becomes negative. The PMU timer callback will set
>> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
>> exception code will then set the appropriate BESCR bits, set the next
>> instruction pointer to the address pointed by the return register
>> (SPR_EBBRR), and redirect execution to the handler (pointed by
>> SPR_EBBHR).
>>
>> This patch sets the basic structure of interrupts and timers. The
>> following patches will add the counter negative logic for the
>> registers.
> 
> A timer makes sense for tripping cycles based EBB events.  But for
> instructions based EBB events, shouldn't you instead have a test in
> the update instructions path which trips the event if you've passed
> the magic number?

IIUC this is done in patch 14.


Thanks,


Daniel

> 
>>
>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_cpu_core.c  |  6 ++++++
>>   target/ppc/cpu.h         | 12 +++++++++++-
>>   target/ppc/excp_helper.c | 28 +++++++++++++++++++++++++++
>>   target/ppc/power8_pmu.c  | 41 ++++++++++++++++++++++++++++++++++++++++
>>   target/ppc/power8_pmu.h  | 25 ++++++++++++++++++++++++
>>   5 files changed, 111 insertions(+), 1 deletion(-)
>>   create mode 100644 target/ppc/power8_pmu.h
>>
>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>> index 4f316a6f9d..c7a342c4aa 100644
>> --- a/hw/ppc/spapr_cpu_core.c
>> +++ b/hw/ppc/spapr_cpu_core.c
>> @@ -20,6 +20,7 @@
>>   #include "target/ppc/kvm_ppc.h"
>>   #include "hw/ppc/ppc.h"
>>   #include "target/ppc/mmu-hash64.h"
>> +#include "target/ppc/power8_pmu.h"
>>   #include "sysemu/numa.h"
>>   #include "sysemu/reset.h"
>>   #include "sysemu/hw_accel.h"
>> @@ -266,6 +267,11 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>           return false;
>>       }
>>   
>> +    /* Init PMU interrupt timer (TCG only) */
>> +    if (!kvm_enabled()) {
>> +        cpu_ppc_pmu_timer_init(env);
>> +    }
>> +
>>       if (!sc->pre_3_0_migration) {
>>           vmstate_register(NULL, cs->cpu_index, &vmstate_spapr_cpu_state,
>>                            cpu->machine_data);
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 9d5eb9ead4..535754ddff 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -129,8 +129,9 @@ enum {
>>       /* ISA 3.00 additions */
>>       POWERPC_EXCP_HVIRT    = 101,
>>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
>> +    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
>>       /* EOL                                                                   */
>> -    POWERPC_EXCP_NB       = 103,
>> +    POWERPC_EXCP_NB       = 104,
>>       /* QEMU exceptions: special cases we want to stop translation            */
>>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>>   };
>> @@ -1047,6 +1048,8 @@ struct ppc_radix_page_info {
>>   #define PPC_CPU_OPCODES_LEN          0x40
>>   #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
>>   
>> +#define PMU_TIMERS_LEN 5
>> +
>>   struct CPUPPCState {
>>       /* Most commonly used resources during translated code execution first */
>>       target_ulong gpr[32];  /* general purpose registers */
>> @@ -1208,6 +1211,12 @@ struct CPUPPCState {
>>        * running cycles.
>>        */
>>       uint64_t pmu_base_time;
>> +
>> +    /*
>> +     * Timers used to fire performance monitor alerts and
>> +     * interrupts. All PMCs but PMC5 has a timer.
>> +     */
>> +    QEMUTimer *pmu_intr_timers[PMU_TIMERS_LEN];
>>   };
>>   
>>   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
>> @@ -2424,6 +2433,7 @@ enum {
>>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
>> +    PPC_INTERRUPT_PMC,            /* Performance Monitor Counter interrupt */
>>   };
>>   
>>   /* Processor Compatibility mask (PCR) */
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 058b063d8a..e97898c5f4 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -821,6 +821,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>           cpu_abort(cs, "Non maskable external exception "
>>                     "is not implemented yet !\n");
>>           break;
>> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
>> +        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
>> +            (env->spr[SPR_BESCR] & BESCR_PME)) {
>> +            target_ulong nip;
>> +
>> +            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
>> +            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
>> +            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
>> +            nip = env->spr[SPR_EBBHR];          /* EBB handler */
>> +            powerpc_set_excp_state(cpu, nip, env->msr);
>> +        }
>> +        /*
>> +         * This interrupt is handled by userspace. No need
>> +         * to proceed.
>> +         */
>> +        return;
>>       default:
>>       excp_invalid:
>>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>> @@ -1068,6 +1084,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>               powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>>               return;
>>           }
>> +        /* PMC -> Event-based branch exception */
>> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
>> +            /*
>> +             * Performance Monitor event-based exception can only
>> +             * occur in problem state.
>> +             */
>> +            if (msr_pr == 1) {
>> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
>> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
>> +                return;
>> +            }
>> +        }
>>       }
>>   
>>       if (env->resume_as_sreset) {
>> diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
>> index 4545fe7810..a57b602125 100644
>> --- a/target/ppc/power8_pmu.c
>> +++ b/target/ppc/power8_pmu.c
>> @@ -12,12 +12,14 @@
>>   
>>   #include "qemu/osdep.h"
>>   
>> +#include "power8_pmu.h"
>>   #include "cpu.h"
>>   #include "helper_regs.h"
>>   #include "exec/exec-all.h"
>>   #include "exec/helper-proto.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/main-loop.h"
>> +#include "hw/ppc/ppc.h"
>>   
>>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>>   
>> @@ -114,6 +116,45 @@ static void update_cycles_PMCs(CPUPPCState *env)
>>       }
>>   }
>>   
>> +static void cpu_ppc_pmu_timer_cb(void *opaque)
>> +{
>> +    PowerPCCPU *cpu = opaque;
>> +    CPUPPCState *env = &cpu->env;
>> +    uint64_t mmcr0;
>> +
>> +    mmcr0 = env->spr[SPR_POWER_MMCR0];
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_EBE) {
>> +        /* freeeze counters if needed */
>> +        if (mmcr0 & MMCR0_FCECE) {
>> +            mmcr0 &= ~MMCR0_FCECE;
>> +            mmcr0 |= MMCR0_FC;
>> +        }
>> +
>> +        /* Clear PMAE and set PMAO */
>> +        if (mmcr0 & MMCR0_PMAE) {
>> +            mmcr0 &= ~MMCR0_PMAE;
>> +            mmcr0 |= MMCR0_PMAO;
>> +        }
>> +        env->spr[SPR_POWER_MMCR0] = mmcr0;
>> +
>> +        /* Fire the PMC hardware exception */
>> +        ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>> +    }
>> +}
>> +
>> +void cpu_ppc_pmu_timer_init(CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    QEMUTimer *timer;
>> +    int i;
>> +
>> +    for (i = 0; i < PMU_TIMERS_LEN; i++) {
>> +        timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_pmu_timer_cb,
>> +                             cpu);
>> +        env->pmu_intr_timers[i] = timer;
>> +    }
>> +}
>> +
>>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>>   {
>>       target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
>> diff --git a/target/ppc/power8_pmu.h b/target/ppc/power8_pmu.h
>> new file mode 100644
>> index 0000000000..34a9d0e8a2
>> --- /dev/null
>> +++ b/target/ppc/power8_pmu.h
>> @@ -0,0 +1,25 @@
>> +/*
>> + * PMU emulation helpers for TCG IBM POWER chips
>> + *
>> + *  Copyright IBM Corp. 2021
>> + *
>> + * Authors:
>> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef PMU_BOOK3S_HELPER
>> +#define PMU_BOOK3S_HELPER
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/main-loop.h"
>> +
>> +void cpu_ppc_pmu_timer_init(CPUPPCState *env);
>> +
>> +#endif
> 

