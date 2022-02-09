Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E94AF240
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 14:01:52 +0100 (CET)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmbT-00042g-5g
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 08:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHmGc-00084Q-1h; Wed, 09 Feb 2022 07:40:14 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=34811
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nHmGZ-0006hn-1S; Wed, 09 Feb 2022 07:40:13 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso2261969ooi.1; 
 Wed, 09 Feb 2022 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UrRGR+tCLmzK426zzbw3wCzqyZ9O/3PC87h9k7AKjKw=;
 b=PtvRQYNN1fcPdk8CWnDzHLPrUo6zqkz47Iapzl9oACbPNcobtEFqRf0nWt6mQeZays
 Qo+mgdVIJwuDuwY0ER363TdIOVP8vZRvVx8ZIGcLIAF+L9V7TZUAmfAwK/n2wqhR0Lpm
 D7aNhxjifjdM1iPFaYTR03McdvxJeNll9tLv+mK4/xjMN5w1RAGPa6Dq6LAVsudhtdca
 Oy6z3BJeANJrYqc4lMlZFGL4+2eEozwGECD/38RyjdjR6ViJOzjHDO/wV0s4zKDQRwre
 4+VYLQslLPBwZD0nJMajb1ukOEZCu+doUvTESAT0TpUQOFcXpLO0yEsQXKGaFjMh5o8q
 aFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UrRGR+tCLmzK426zzbw3wCzqyZ9O/3PC87h9k7AKjKw=;
 b=5Vh1MvY4BC48iJLDiXH7TG9qCNIpCsEMP/ArDD5rQE20/7cno0Q305IxPwLYSDMjA9
 gkXv4UPCgNUqst/TY6jy7fNyU58SdpWdEnqnZ4VSG3AbR+LPyF2+fBbVZa1GjqvY78zF
 fcYL9gfZIlL9A94UkZtJu5k376y+EXcDY5MRx/hTpV7pHfWHttg90jCaGwuF9lAW5jjo
 F8+N+Nu4WbDSd7bTaold0iUV/mLlsUj+9udvMd2d6pdnvziz89/pQq0FY+a44+J0XZDZ
 OZUK/t3GS74dHNSIw8Fn3ePsadSLfTpe/wjz0m9jFV0p/yRgNRvv9081IMjNiG5r6qsN
 jkKQ==
X-Gm-Message-State: AOAM531YbeA6y6hwQOHuYifkMHRiRbOKZwxC1oUsN8Pb5MI3hedWjTG+
 1g0yLkVPsyWr9S/HD/nhG6w=
X-Google-Smtp-Source: ABdhPJy3X+lDY1IvB9xO1Rm0JDi7ABzM4DtMobSrSa4xvlMIQkw/RBhCSw6YYWnixvm5yWCjVmMPGw==
X-Received: by 2002:a4a:e0d8:: with SMTP id e24mr787191oot.56.1644410408324;
 Wed, 09 Feb 2022 04:40:08 -0800 (PST)
Received: from [192.168.10.222] ([191.205.140.35])
 by smtp.gmail.com with ESMTPSA id h9sm6612016otk.42.2022.02.09.04.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 04:40:08 -0800 (PST)
Message-ID: <21b255a8-99bd-64dd-bd64-c147754da6fe@gmail.com>
Date: Wed, 9 Feb 2022 09:40:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 3/3] target/ppc: EBB exception implementation
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220208194838.169257-1-danielhb413@gmail.com>
 <20220208194838.169257-4-danielhb413@gmail.com>
 <87zgn1j68h.fsf@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87zgn1j68h.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/8/22 20:20, Fabiano Rosas wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> This patch adds the EBB exception support that are triggered by
>> Performance Monitor alerts. This happens when a Performance Monitor
>> alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.
>>
>> A 'ebb_excp_enabled' helper is called at the end of fire_PMC_interrupt()
>> to fire the EBB exception, checking for FSCR and HFSCR support
>> beforehand.
>>
>> In ppc_hw_interrupt() the generated EBB exception will be taken only if
>> running in problem state and with BESCR_GE set. The check for BESCR_GE
>> bit in this step is needed to avoid race conditions where we take an
>> EBB, while the previous EBB is still inflight (BESCR_GE cleared), and
>> SPR_EBBHR is not set yet. In this case we'll branch to env->nip = 0 and the
>> guest will crash. The Linux kernel selftest 'lost_exception_test' is an
>> example where this racing will occur.
>>
>> The code in powerpc_excp_books() is the default EBB handling described
>> in the PowerISA v3.1: clear BESCR_GE, set BESCR_PMEO, save env->nip in
>> SPR_EBBRR and redirect the execution to the address pointed by
>> SPR_EBBHR. The already implemented 'rbebb' instruction is then able to
>> return from the EBB by retrieving the NIP in SPR_EBBRR.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Now that BookS code is separate from the other CPUs, let me leave this
> here:
> 
> Why do we have "interrupts" before "exceptions"? As in ppc_hw_interrupt
>   calling powerpc_excp.
> 
> If anyone has a consistent mental model on how this that they could
> share I'd appreciate it.
> 
> Now onto the patch:
>> ---
>>   target/ppc/excp_helper.c | 51 +++++++++++++++++++++++++++++++++++++---
>>   target/ppc/helper.h      |  1 +
>>   target/ppc/power8-pmu.c  | 12 ++++++++--
>>   3 files changed, 59 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8a49a4ab90..2a95cec39e 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -19,6 +19,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/main-loop.h"
>>   #include "cpu.h"
>> +#include "hw/ppc/ppc.h"
>>   #include "exec/exec-all.h"
>>   #include "internal.h"
>>   #include "helper_regs.h"
>> @@ -990,8 +991,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>>           new_msr |= (target_ulong)MSR_HVB;
>>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>>           break;
>> -    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>>       case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
> 
> We would need some way to tell apart EBB from other Performance Monitor
> interrupts here. Unless you want to leave that to the next person that
> looks at Performance Monitor interrupts.

I don't mind doing that, but bear in mind that EBB isn't an official interrupt/exception
vector in the ISA.

> 
>> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
>> +        env->spr[SPR_BESCR] |= BESCR_PMEO;
>> +
>> +        /*
>> +         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
>> +         * stored in the EBB Handler SPR_EBBHR.
>> +         */
>> +        env->spr[SPR_EBBRR] = env->nip;
>> +        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
>> +
>> +        /*
>> +         * This exception is handled in userspace. No need to proceed.
>> +         */
>> +        return;
>> +    case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>>       case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
>>       case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
>>       case POWERPC_EXCP_SDOOR:     /* Doorbell interrupt                       */
>> @@ -1671,8 +1686,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>               return;
>>           }
>>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
>> -            env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
>> -            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
>> +            /*
>> +             * PERFM EBB must be taken in problem state and
>> +             * with BESCR_GE set.
>> +             */
>> +            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
>> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
>> +                powerpc_excp(cpu, POWERPC_EXCP_PERFM);
>> +            }
> 
> This is masking other Performance Interrupts (for all CPUs). Can we move
> these checks into the helper?

Probably. I'll try it out.


Daniel

> 
>>               return;
>>           }
>>           /* Thermal interrupt */
>> @@ -1915,6 +1936,30 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
>>           env->spr[SPR_BESCR] &= ~BESCR_GE;
>>       }
>>   }
>> +
>> +void helper_ebb_perfm_int(CPUPPCState *env)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +
>> +    /*
>> +     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
>> +     * HFSCR.
>> +     */
>> +    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
>> +    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
>> +
>> +    /*
>> +     * Setting "env->pending_interrupts |= 1 << PPC_INTERRUPT_PERFM"
>> +     * instead of calling "ppc_set_irq()"" works in most cases, but under
>> +     * certain race conditions (e.g. lost_exception_test EBB kernel
>> +     * selftest) this hits an assert when dealing with the BQL:
>> +     *
>> +     * tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked())
>> +     *
>> +     * We ended up using ppc_set_irq() because it handles the BQL.
>> +     */
>> +    ppc_set_irq(cpu, PPC_INTERRUPT_PERFM, 1);
>> +}
>>   #endif
>>   
>>   /*****************************************************************************/
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index f2e5060910..bb26da6176 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
>>   DEF_HELPER_1(rfscv, void, env)
>>   DEF_HELPER_1(hrfid, void, env)
>>   DEF_HELPER_2(rfebb, void, env, tl)
>> +DEF_HELPER_1(ebb_perfm_int, void, env)
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>>   DEF_HELPER_2(store_mmcr0, void, env, tl)
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index d245663158..41409e609f 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -281,6 +281,13 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>>       pmc_update_overflow_timer(env, sprn);
>>   }
>>   
>> +static bool ebb_excp_enabled(CPUPPCState *env)
>> +{
>> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
>> +           env->spr[SPR_BESCR] & BESCR_PME &&
>> +           env->spr[SPR_BESCR] & BESCR_GE;
>> +}
>> +
>>   static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>   {
>>       CPUPPCState *env = &cpu->env;
>> @@ -307,8 +314,9 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>           env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>>       }
>>   
>> -    /* PMC interrupt not implemented yet */
>> -    return;
>> +    if (ebb_excp_enabled(env)) {
>> +        helper_ebb_perfm_int(env);
>> +    }
>>   }
>>   
>>   /* This helper assumes that the PMC is running. */

