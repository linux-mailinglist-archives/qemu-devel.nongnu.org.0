Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37345449CDC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 21:05:23 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAtN-0006vp-Rc
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 15:05:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkArW-0005Sc-MX; Mon, 08 Nov 2021 15:03:27 -0500
Received: from [2607:f8b0:4864:20::f29] (port=42769
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkArU-0004HK-K5; Mon, 08 Nov 2021 15:03:26 -0500
Received: by mail-qv1-xf29.google.com with SMTP id b17so12686345qvl.9;
 Mon, 08 Nov 2021 12:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K6ZHennuVnIdgfccoeZOODiHBHnALU1QelnIeqemU94=;
 b=A6Ln5jpSacTc7b69YgcQZz/dUZXlLtLNHGkXHrH+Gi/5oEoVejEYMDbuYLObzOkL99
 TwsTEJk4a0EdRW8b4j4w2GGiB37P3ONyatD76CbUPiZJ5gzayUrl+WHykQPedsfiEzG+
 g4fPf/5gH3aIxE/3jUXTF9BkMc5jms95rcPnu1R6jWvG8BldLxm8qxgct/jtHwxvEk1g
 /OIbI0jhghdE0ub35WLWPXE7YdILEgfUz8amIrflA9GFHJ+s7ckgACT45i20ICgfOrNA
 8kFS64fxNYkVvaC3/TMjuyWAj+C2gV7AZ9GqzUWeshGQvE3gYnOJu2AtVfrsyeVtFjDC
 /pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K6ZHennuVnIdgfccoeZOODiHBHnALU1QelnIeqemU94=;
 b=j+63XI1eQwZ3++TC5SMsn2GC3eTNV/Pn0oF6DE/MVxTGAai6F71u2paeIJD1SMQI89
 6VOYFjONdHJMnQIeTlqmA//VNFrMdbFLYSTarAT1LJMjvusJE2Wtfeub//v9rQ7i6sLT
 MyqnZUCrGkFTR+wWWJa6AhJ1ZehVKZa63douTAfJNlwBuho/DURYplZYnmqa+wFyq4jh
 /PegbBISTVaiUiZsL127LdCUrwpXH8s/ZMmy2gWtXMJbck06XDLyEJ0dNro0gF63ZT8B
 n8bQYJafDyCE1R8P4K9UqKEXDC8mHgJ8Mcv65tubK/5n5iYy6x6KHDk0wTCwTqxZiEpd
 z88w==
X-Gm-Message-State: AOAM532kF74z7LYmRm8Ii3EByOcsyFppZRdLuWKZHQ4xNpfZXg0ve1We
 OA//pinZ7YmPCscP5+z4eNc=
X-Google-Smtp-Source: ABdhPJyBJC+J7AIkgDuojM9xayLZT3Tk3YdezT8I6+EO4ujpvvQtDYW5pX59JurFxxBJjDCTnWbEGg==
X-Received: by 2002:a05:6214:e83:: with SMTP id
 hf3mr1930854qvb.52.1636401798756; 
 Mon, 08 Nov 2021 12:03:18 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id y14sm7975779qta.86.2021.11.08.12.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 12:03:17 -0800 (PST)
Message-ID: <7ff5cb8f-fcfe-23aa-a0a0-fef4779e0f6b@gmail.com>
Date: Mon, 8 Nov 2021 17:03:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/10] target/ppc: PMU Event-Based exception support
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-10-danielhb413@gmail.com>
 <5734c880-562c-7808-1d21-bfb1d1ccfced@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <5734c880-562c-7808-1d21-bfb1d1ccfced@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf29.google.com
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



On 11/8/21 16:48, Matheus K. Ferst wrote:
> On 01/11/2021 20:56, Daniel Henrique Barboza wrote:
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
>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h         |  5 ++++-
>>   target/ppc/excp_helper.c | 28 ++++++++++++++++++++++++++++
>>   target/ppc/power8-pmu.c  | 26 ++++++++++++++++++++++++--
>>   3 files changed, 56 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 8f545ff482..592031ce54 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -129,8 +129,10 @@ enum {
>>       /* ISA 3.00 additions */
>>       POWERPC_EXCP_HVIRT    = 101,
>>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
>> +    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
>> +
>>       /* EOL                                                                   */
>> -    POWERPC_EXCP_NB       = 103,
>> +    POWERPC_EXCP_NB       = 104,
>>       /* QEMU exceptions: special cases we want to stop translation            */
>>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>>   };
>> @@ -2455,6 +2457,7 @@ enum {
>>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
>> +    PPC_INTERRUPT_PMC,            /* Hypervisor virtualization interrupt  */
>>   };
>>
>>   /* Processor Compatibility mask (PCR) */
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 7be334e007..88aa0a84f8 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -797,6 +797,22 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>           cpu_abort(cs, "Non maskable external exception "
>>                     "is not implemented yet !\n");
>>           break;
>> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
>> +        if ((env->spr[SPR_BESCR] & BESCR_GE) &&
>> +            (env->spr[SPR_BESCR] & BESCR_PME)) {
> 
> Do we need to check FSCR[EBB] here?

FSCR[EBB] is being checked in the spr_read_ebb* and spr_write_ebb* callbacks
in translate.c. These are the read/write callbacks of EBB sprs
(register_power8_ebb_sprs() in target/ppc/cpu_init.c).


Thanks,


Daniel


> 
>> +            target_ulong nip;
>> +
>> +            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
>> +            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
>> +            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
>> +            nip = env->spr[SPR_EBBHR];          /* EBB handler */
>> +            powerpc_set_excp_state(cpu, nip, env->msr);
>> +        }
>> +        /*
>> +         * This interrupt is handled by userspace. No need
>> +         * to proceed.
>> +         */
>> +        return;
>>       default:
>>       excp_invalid:
>>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>> @@ -1044,6 +1060,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>               powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>>               return;
>>           }
>> +        /* PMC -> Event-based branch exception */
>> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
>> +            /*
>> +             * Performance Monitor event-based exception can only
>> +             * occur in problem state.
>> +             */
>> +            if (msr_pr == 1) {
>> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
>> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
>> +                return;
>> +            }
>> +        }
>>       }
>>
>>       if (env->resume_as_sreset) {
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index aa10233b29..ca3954ff0e 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -323,8 +323,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>           return;
>>       }
>>
>> -    /* PMC interrupt not implemented yet */
>> -    return;
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
>> +
>> +        /* Changing MMCR0_FC demands a new hflags compute */
>> +        hreg_compute_hflags(env);
>> +
>> +        /*
>> +         * Delete all pending timers if we need to freeze
>> +         * the PMC. We'll restart them when the PMC starts
>> +         * running again.
>> +         */
>> +        pmu_delete_timers(env);
>> +    }
>> +
>> +    pmu_update_cycles(env);
>> +
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
>> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
>> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>> +    }
>> +
>> +    /* Fire the PMC hardware exception */
>> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>>   }
>>
>>   /* This helper assumes that the PMC is running. */
>> -- 
>> 2.31.1
>>
> 
> 

