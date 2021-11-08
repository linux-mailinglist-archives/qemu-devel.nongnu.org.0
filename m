Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC7449D8C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 22:04:55 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkBoz-0003B1-Oh
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 16:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkBo0-0002MT-Nb; Mon, 08 Nov 2021 16:03:52 -0500
Received: from [2607:f8b0:4864:20::22f] (port=41585
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkBny-0007ZD-9e; Mon, 08 Nov 2021 16:03:52 -0500
Received: by mail-oi1-x22f.google.com with SMTP id u74so8591248oie.8;
 Mon, 08 Nov 2021 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nZPzTc6CKGb3FadvSX4V9t8se2ZvJKgrOnlZHXmU9Lw=;
 b=mY2XZEKhwJ//0PVKHareySwuaJx6wHCzJe50J60MTawuuboq2Va7BEDzH1XHUH9KUC
 bRdmvUdwZ3c59VItnOiQo+/d5PSx6WCfFLh86/Zq7TZ/GRH26G5VTvjVyog0KvDgu/07
 T+h9UKVkRv+PpBjkAA5Si5JRULJeMVLTqkAOw8vj7pYmS5L88UvUe1j45qKMw5+N8sHo
 JQkd41FpAZAH/eEr21OUQVWYjcgW+M89RmTFsi93XTpWRteWT8LBltIYIGLnnNubLblI
 DcSCawP6GXClR5VvBusaVZSiMIFgi4p9nQTIvg2IJHd2hSKLtl7plx+G5XHFQXC6YF35
 3Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nZPzTc6CKGb3FadvSX4V9t8se2ZvJKgrOnlZHXmU9Lw=;
 b=N5Fy99yiMRzBNYsuZGDxiWL1FonDy+YIj3Hw9G3xglz2Xo4B/nl3/qQ3TWP3pwDF5P
 NMxck/CBX/PQ8rswFlSyu/JP3fXS58XacKFx7KljJOS1RRBFc37XJ7jNMGySTVW/iWyr
 cQR+74bSEFy3k3/x6Qm99yKhkpjbT1+P4DC7vKkSsyWtaWEjqB+zal6y9KvBE9i+Tiqf
 ZCA2ZzFWmsYOvA3oEekPganAjaY7N7ukdglBe9bxHjtjOy24/JTUjX4E3pfHdIJiL6mg
 XHeGlTt8cWClbQw/WdpdYhqUEJuGEHEXc5nZuEfhf0gu6XvFnhh1PtyRgACi3uTay/n8
 Oe6g==
X-Gm-Message-State: AOAM530XQOsQEQnKFfjBe6CxhdmlDO8je2XMw4xm0EvcbULOzMJrl4nn
 a5Q4r9ArB/Gkb/MP9Nhgmjg=
X-Google-Smtp-Source: ABdhPJwGYlTZGeb53lif9z0ajcDeNago5WgSiqZ3fG+/ltB0spurw4SM8dzuFRmAldrFGmqEwzE3Qw==
X-Received: by 2002:aca:bec1:: with SMTP id o184mr1066973oif.43.1636405428693; 
 Mon, 08 Nov 2021 13:03:48 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id u136sm1648712oie.13.2021.11.08.13.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:03:48 -0800 (PST)
Message-ID: <50853219-ae7d-d48d-4fd9-3bafe27f14e2@gmail.com>
Date: Mon, 8 Nov 2021 18:03:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/10] target/ppc: PMU Event-Based exception support
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-10-danielhb413@gmail.com>
 <5734c880-562c-7808-1d21-bfb1d1ccfced@eldorado.org.br>
 <7ff5cb8f-fcfe-23aa-a0a0-fef4779e0f6b@gmail.com>
 <ee84d577-b51b-2b08-6fea-5e3a67a459c8@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <ee84d577-b51b-2b08-6fea-5e3a67a459c8@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/8/21 17:34, Matheus K. Ferst wrote:
> On 08/11/2021 17:03, Daniel Henrique Barboza wrote:
>> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
>>
>> On 11/8/21 16:48, Matheus K. Ferst wrote:
>>> On 01/11/2021 20:56, Daniel Henrique Barboza wrote:
>>>> From: Gustavo Romero <gromero@linux.ibm.com>
>>>>
>>>> Following up the rfebb implementation, this patch adds the EBB exception
>>>> support that are triggered by Performance Monitor alerts. This exception
>>>> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
>>>> and BESCR_PME are set.
>>>>
>>>> The supported PM alerts will consist of counter negative conditions of
>>>> the PMU counters. This will be achieved by a timer mechanism that will
>>>> predict when a counter becomes negative. The PMU timer callback will set
>>>> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
>>>> exception code will then set the appropriate BESCR bits, set the next
>>>> instruction pointer to the address pointed by the return register
>>>> (SPR_EBBRR), and redirect execution to the handler (pointed by
>>>> SPR_EBBHR).
>>>>
>>>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>>>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   target/ppc/cpu.h         |  5 ++++-
>>>>   target/ppc/excp_helper.c | 28 ++++++++++++++++++++++++++++
>>>>   target/ppc/power8-pmu.c  | 26 ++++++++++++++++++++++++--
>>>>   3 files changed, 56 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>>> index 8f545ff482..592031ce54 100644
>>>> --- a/target/ppc/cpu.h
>>>> +++ b/target/ppc/cpu.h
>>>> @@ -129,8 +129,10 @@ enum {
>>>>       /* ISA 3.00 additions */
>>>>       POWERPC_EXCP_HVIRT    = 101,
>>>>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
>>>> +    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
>>>> +
>>>>       /* EOL                                                                   */
>>>> -    POWERPC_EXCP_NB       = 103,
>>>> +    POWERPC_EXCP_NB       = 104,
>>>>       /* QEMU exceptions: special cases we want to stop translation            */
>>>>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>>>>   };
>>>> @@ -2455,6 +2457,7 @@ enum {
>>>>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>>>>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>>>>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
>>>> +    PPC_INTERRUPT_PMC,            /* Hypervisor virtualization interrupt  */
>>>>   };
>>>>
>>>>   /* Processor Compatibility mask (PCR) */
>>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>>> index 7be334e007..88aa0a84f8 100644
>>>> --- a/target/ppc/excp_helper.c
>>>> +++ b/target/ppc/excp_helper.c
>>>> @@ -797,6 +797,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>>>           cpu_abort(cs, "Non maskable external exception "
>>>>                     "is not implemented yet !\n");
>>>>           break;
>>>> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
>>>> +        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
>>>> +            (env->spr[SPR_BESCR] & BESCR_PME)) {
>>>
>>> Do we need to check FSCR[EBB] here?
>>
>> FSCR[EBB] is being checked in the spr_read_ebb* and spr_write_ebb* callbacks
>> in translate.c. These are the read/write callbacks of EBB sprs
>> (register_power8_ebb_sprs() in target/ppc/cpu_init.c).
>>
> 
> I'm not sure if these checks are enough. Looking at section 4.4 of book III, it seems that we need to check again before delivering the exception. E.g., if the timer expires with MSR[PR]=0 and supervisor code disables the facility before it returns to problem state, we would have a spurious exception.

Hmmm yeah, I guess it's not worth assuming that this bit will be intact.

I'll go with your suggestion and add a check for FSCR[EBB] before firing the
interrupt.


Thanks,

Daniel


> 
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>>> +            target_ulong nip;
>>>> +
>>>> +            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
>>>> +            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
>>>> +            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
>>>> +            nip = env->spr[SPR_EBBHR];          /* EBB handler */
>>>> +            powerpc_set_excp_state(cpu, nip, env->msr);
>>>> +        }
>>>> +        /*
>>>> +         * This interrupt is handled by userspace. No need
>>>> +         * to proceed.
>>>> +         */
>>>> +        return;
>>>>       default:
>>>>       excp_invalid:
>>>>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>>>> @@ -1044,6 +1060,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>>>               powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>>>>               return;
>>>>           }
>>>> +        /* PMC -> Event-based branch exception */
>>>> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
>>>> +            /*
>>>> +             * Performance Monitor event-based exception can only
>>>> +             * occur in problem state.
>>>> +             */
>>>> +            if (msr_pr == 1) {
>>>> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
>>>> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
>>>> +                return;
>>>> +            }
>>>> +        }
>>>>       }
>>>>
>>>>       if (env->resume_as_sreset) {
>>>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>>>> index aa10233b29..ca3954ff0e 100644
>>>> --- a/target/ppc/power8-pmu.c
>>>> +++ b/target/ppc/power8-pmu.c
>>>> @@ -323,8 +323,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>>>           return;
>>>>       }
>>>>
>>>> -    /* PMC interrupt not implemented yet */
>>>> -    return;
>>>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
>>>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
>>>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
>>>> +
>>>> +        /* Changing MMCR0_FC demands a new hflags compute */
>>>> +        hreg_compute_hflags(env);
>>>> +
>>>> +        /*
>>>> +         * Delete all pending timers if we need to freeze
>>>> +         * the PMC. We'll restart them when the PMC starts
>>>> +         * running again.
>>>> +         */
>>>> +        pmu_delete_timers(env);
>>>> +    }
>>>> +
>>>> +    pmu_update_cycles(env);
>>>> +
>>>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
>>>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
>>>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>>>> +    }
>>>> +
>>>> +    /* Fire the PMC hardware exception */
>>>> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>>>>   }
>>>>
>>>>   /* This helper assumes that the PMC is running. */
>>>> -- 
>>>> 2.31.1
>>>>
>>>
>>>
> 
> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

