Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2D4B5924
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:54:27 +0100 (CET)
Received: from localhost ([::1]:54516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJfYP-0007hg-SI
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:54:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJfWZ-0006P3-40; Mon, 14 Feb 2022 12:52:32 -0500
Received: from [2607:f8b0:4864:20::336] (port=46786
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nJfWV-0004Ow-UP; Mon, 14 Feb 2022 12:52:30 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso12060267otv.13; 
 Mon, 14 Feb 2022 09:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dOKJdQ2Gzh4kbHpw3jCCwnW25b0QCKFVJ33ao06wrlE=;
 b=EWr47Z0oyR57/Jxmf8EmEkTDAt4MoKwnCjzgxsC7j6ffxKy76woitF1eKg4hZ/XajV
 7sPNIm7LWeoPnEVRQPN+UxTsuPJZWnnm1vHjPS1YInVBlC4LTNLlS+e9TxZuFLYQ8RlX
 GxN+7jGRk4CPPTmZtvTHgh4LA4pM/BC7GF6eYatSj988yeKr8AyRWwRtcFa/2vN0pWda
 lfk8/N34sp0pgNxpjSbiIAFXNTXP58+/OtZAWL+In0IpPcmFvwhGmmwCvnCaRZ7gdXjK
 vh9apbuUgMzTELI0fBa5HNnvsBO9XQAWcrGxw/DFpzw5FySCEqoluY8+dDmG4CyHjYH5
 uP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dOKJdQ2Gzh4kbHpw3jCCwnW25b0QCKFVJ33ao06wrlE=;
 b=qRJr6Kjvhu5hvRhCECAnrK3rQZiTQFgNuBGPNFDUoS12l7W7FFrf3Z2cmoOoGaKrBK
 vwMCMzjQFMRjIgRzxd8DNrqFs2xeynDAyvnlqpZy1PIwQ28W7GGokT7agUo3YmSW9+qo
 WC+F2Dv3B2zeoeWzyZ2kBTRq0E7u8OLFeSzSPSZdoY9oa6nh1Ca7xKf73Pzz54XospeV
 FSo4Z1lCB55xCaem8eU6XcwwjnD3DXnTyrFpHaVIe5zfwMuXIGiKwiwq72DUxjCH2mNf
 LpbOZzLUvQHCRXzjS2yMX7TEAzccdVblOfZ+Jfs24bRJuzLPpc95MyQDwija4h5nhv2e
 Ynfw==
X-Gm-Message-State: AOAM530Vgmg4a0v+ZoqdsR/dzT6DiOdglh6EqBOoVuh3pdDHEh3ZE+Mo
 /eZ5OtAlKMrOsYFZA3c3YtI=
X-Google-Smtp-Source: ABdhPJzRfKaGdfUB53BALJHjzK0R8MaMTVZp1SfHqX7b9lLJOyhVzq+0dIlHmfq8/VQGRveVJkg9Jg==
X-Received: by 2002:a05:6830:2646:: with SMTP id f6mr30122otu.80.1644861140371; 
 Mon, 14 Feb 2022 09:52:20 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id d1sm10934844otk.70.2022.02.14.09.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:52:20 -0800 (PST)
Message-ID: <5ef3cc27-38f0-5a30-5c6b-ce9d61c9f266@gmail.com>
Date: Mon, 14 Feb 2022 14:52:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] target/ppc: add PPC_INTERRUPT_EBB and EBB
 exceptions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220211183354.563602-1-danielhb413@gmail.com>
 <20220211183354.563602-4-danielhb413@gmail.com>
 <d1e2f0c2-ddfa-b0d3-2b45-bcb34687cd73@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d1e2f0c2-ddfa-b0d3-2b45-bcb34687cd73@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 14:34, Cédric Le Goater wrote:
> On 2/11/22 19:33, Daniel Henrique Barboza wrote:
>> PPC_INTERRUPT_EBB is a new interrupt that will be used to deliver EBB
>> exceptions that had to be postponed because the thread wasn't in problem
>> state at the time the event-based branch was supposed to occur.
>>
>> ISA 3.1 also defines two EBB exceptions: Performance Monitor EBB
>> exception and External EBB exception. They are being added as
>> POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB.
>>
>> PPC_INTERRUPT_EBB will check BESCR bits to see the EBB type that
>> occurred and trigger the appropriate exception. Both exceptions are
>> doing the same thing in this first implementation: clear BESCR_GE and
>> enter the branch with env->nip retrieved from SPR_EBBHR.
>>
>> The checks being done by the interrupt code are msr_pr and BESCR_GE
>> states. All other checks (EBB facility check, BESCR_PME bit, specific
>> bits related to the event type) must be done beforehand.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> It looks correct.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Next step is to modify the POWER9 input pins and these routines :
> 
>    xive_tctx_realize()
>    xive_tctx_output()
>    power9_set_irq()
> 
> to add an EBB "wire" between the IC and the CPU.

Got it. I'll see if I can get this EBB lane up from the IC and CPU. Any suggestions how I
should test it?


Thanks,



Daniel




> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   target/ppc/cpu.h         |  5 ++++-
>>   target/ppc/cpu_init.c    |  4 ++++
>>   target/ppc/excp_helper.c | 33 +++++++++++++++++++++++++++++++++
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index dcd83b503c..3962c8f6f4 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -129,8 +129,10 @@ enum {
>>       /* ISA 3.00 additions */
>>       POWERPC_EXCP_HVIRT    = 101,
>>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
>> +    POWERPC_EXCP_PERFM_EBB = 103,    /* Performance Monitor EBB Exception    */
>> +    POWERPC_EXCP_EXTERNAL_EBB = 104, /* External EBB Exception               */
>>       /* EOL                                                                   */
>> -    POWERPC_EXCP_NB       = 103,
>> +    POWERPC_EXCP_NB       = 105,
>>       /* QEMU exceptions: special cases we want to stop translation            */
>>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>>   };
>> @@ -2453,6 +2455,7 @@ enum {
>>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
>> +    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
>>   };
>>   /* Processor Compatibility mask (PCR) */
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index bf60529d37..136d8ca8b5 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -2336,6 +2336,10 @@ static void init_excp_POWER8(CPUPPCState *env)
>>       env->excp_vectors[POWERPC_EXCP_FU]       = 0x00000F60;
>>       env->excp_vectors[POWERPC_EXCP_HV_FU]    = 0x00000F80;
>>       env->excp_vectors[POWERPC_EXCP_SDOOR_HV] = 0x00000E80;
>> +
>> +    /* Userland exceptions without vector value in PowerISA v3.1 */
>> +    env->excp_vectors[POWERPC_EXCP_PERFM_EBB] = 0x0;
>> +    env->excp_vectors[POWERPC_EXCP_EXTERNAL_EBB] = 0x0;
>>   #endif
>>   }
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8a49a4ab90..ad40a0f8e6 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -990,6 +990,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>>           new_msr |= (target_ulong)MSR_HVB;
>>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>>           break;
>> +    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Exception  */
>> +    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception             */
>> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
>> +
>> +        /*
>> +         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
>> +         * stored in the EBB Handler SPR_EBBHR.
>> +         */
>> +        env->spr[SPR_EBBRR] = env->nip;
>> +        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
>> +
>> +        /*
>> +         * This exception is handled in userspace. No need to proceed.
>> +         */
>> +        return;
>>       case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>>       case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
>>       case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
>> @@ -1681,6 +1696,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>>               powerpc_excp(cpu, POWERPC_EXCP_THERM);
>>               return;
>>           }
>> +        /* EBB exception */
>> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
>> +            /*
>> +             * EBB exception must be taken in problem state and
>> +             * with BESCR_GE set.
>> +             */
>> +            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
>> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_EBB);
>> +
>> +                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
>> +                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
>> +                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
>> +                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
>> +                }
>> +
>> +                return;
>> +            }
>> +        }
>>       }
>>       if (env->resume_as_sreset) {
>>
> 

