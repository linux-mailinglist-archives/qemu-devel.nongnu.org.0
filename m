Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48024B7420
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:38:07 +0100 (CET)
Received: from localhost ([::1]:46820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1mB-0005LF-1m
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nK1iq-0002ud-VP; Tue, 15 Feb 2022 12:34:40 -0500
Received: from [2607:f8b0:4864:20::332] (port=42709
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nK1io-0004Xq-TJ; Tue, 15 Feb 2022 12:34:40 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 p3-20020a0568301d4300b005a7a702f921so14272823oth.9; 
 Tue, 15 Feb 2022 09:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Mibcvj/7SBhX672AJjmb6fv2svhp6nQEuA6LbhlmdUo=;
 b=Ofv1nli1BHPtabxClnz7jcrzRIMFcQSRUX30i5EagPgebAjdJ6y3E2RTWCQtBen/6H
 hv0ahl6WO93sufd7/5xBuV8jLMDgQGOX0dLUMXrOpw15CIUSgCquF8YwcWJWifnn55O9
 jOPpCAKixqNDw6dVUSQRr+dcHW0pgIvkskTsF9aq+BmHPbHiZdlZEKQxiaolzRxiv70/
 sdeETV8GARov4FR0vK4lu5CgQGutaf59YIOZFFnTY9fEtAyE0oG8zCI8+v62qXl8JCyF
 rla01+ia0Lnsgc1sGp+TobcnOkV7H3QI3O2UeaI/Zm3oi3ONKHxrEQoephRzV6Mua5BO
 NPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mibcvj/7SBhX672AJjmb6fv2svhp6nQEuA6LbhlmdUo=;
 b=2RsDdOnZ6vwABP0V4MqdLTHd2EarP1//ICG2Bt47CG8kl4CPfRZvhf26YyaKAM6iHZ
 6aaebtfAWNohJnvYxb+h5D8PD5eJ5vis813OSjJP3QoyI6fIeMtDz6YWR/nwl2e0jtmj
 iOHYCLRuLRGMceLej+OaN/JU+3MNYnOHhORMFlrVL9/NheRH/2B4+Np+xz97gz7pm86k
 L+oIa4UpIh450imm5j5dZpl+8nNm0TaykVOfdsZfww4rJyGBk9dY9GJym6RV/23T73Sh
 p1cVQmwtWA9Q6vZl/sLw2zNtRZd9yOTQZVUZBFRpWVmX1lXFtqTiDfJyzdhszDxygn7T
 gFsQ==
X-Gm-Message-State: AOAM530RrEP7sJGb+ac1/9YFiJrfxuag2v0Dgnv36sr99SO1HzbH/sq5
 8l4sKa1KiYFiy0i8A6gcMehSfKrW4fk=
X-Google-Smtp-Source: ABdhPJwbTHycS8f5S20Oqj0uGLhDvb+vooxvNHl97pcgd6EL/9JWcJBCrzQykr7aWu4CucRRqxoglg==
X-Received: by 2002:a9d:74c5:: with SMTP id a5mr36092otl.146.1644946476636;
 Tue, 15 Feb 2022 09:34:36 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id bp5sm7754484oib.25.2022.02.15.09.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 09:34:36 -0800 (PST)
Message-ID: <15bb032a-4f92-6b2b-997d-d90c86a27599@gmail.com>
Date: Tue, 15 Feb 2022 14:34:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20220211183354.563602-1-danielhb413@gmail.com>
 <20220211183354.563602-5-danielhb413@gmail.com>
 <e2b494ec-59aa-d280-8621-0a1df20052a9@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e2b494ec-59aa-d280-8621-0a1df20052a9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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



On 2/15/22 13:37, Cédric Le Goater wrote:
> On 2/11/22 19:33, Daniel Henrique Barboza wrote:
>> This patch adds the EBB exception support that are triggered by
>> Performance Monitor alerts. This happens when a Performance Monitor
>> alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.
>>
>> fire_PMC_interrupt() will execute a new ebb_perfm_excp() helper that
>> will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits are
>> set, do_ebb() will attempt to trigger a PERFM EBB event.
>>
>> If the EBB facility is enabled in both FSCR and HFSCR we consider that
>> the EBB is valid and set BESCR_PMEO. After that, if we're running in
>> problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
>> queue a PPC_INTERRUPT_EBB.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Looks good. One comment below.
> 
> 
>> ---
>>   target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
>>   target/ppc/helper.h      |  1 +
>>   target/ppc/power8-pmu.c  |  3 +--
>>   3 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index ad40a0f8e6..0c031e67b1 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -1948,6 +1948,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
>>           env->spr[SPR_BESCR] &= ~BESCR_GE;
>>       }
>>   }
>> +
>> +/*
>> + * Triggers or queues an 'ebb_excp' EBB exception. All checks
>> + * but FSCR, HFSCR and msr_pr must be done beforehand.
>> + *
>> + * PowerISA v3.1 isn't clear about whether an EBB should be
>> + * postponed or cancelled if the EBB facility is unavailable.
>> + * Our assumption here is that the EBB is cancelled if both
>> + * FSCR and HFSCR EBB facilities aren't available.
>> + */
>> +static void do_ebb(CPUPPCState *env, int ebb_excp)
>> +{
>> +    PowerPCCPU *cpu = env_archcpu(env);
>> +    CPUState *cs = CPU(cpu);
>> +
>> +    /*
>> +     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
>> +     * HFSCR.
>> +     */
>> +    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
>> +    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
>> +
>> +    if (ebb_excp == POWERPC_EXCP_PERFM_EBB) {
>> +        env->spr[SPR_BESCR] |= BESCR_PMEO;
>> +    } else if (ebb_excp == POWERPC_EXCP_EXTERNAL_EBB) {
>> +        env->spr[SPR_BESCR] |= BESCR_EEO;
>> +    }
>> +
>> +    if (msr_pr == 1) {
>> +        powerpc_excp(cpu, ebb_excp);
>> +    } else {
>> +        env->pending_interrupts |= 1 << PPC_INTERRUPT_EBB;
>> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>> +    }
> 
> Don't you need to lock the iothread ?

I did in the previous version but now, after doing the msr_pr handling like I'm doing
here, handling BQL wasn't necessary. I suppose this change in the logic handled the
race condition in a way that the lock isn't being exercised as before.


Thanks,


Daniel

> 
> Thanks,
> 
> C.
> 
>> +}
>> +
>> +void helper_ebb_perfm_excp(CPUPPCState *env)
>> +{
>> +    bool perfm_ebb_enabled = env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
>> +                             env->spr[SPR_BESCR] & BESCR_PME &&
>> +                             env->spr[SPR_BESCR] & BESCR_GE;
>> +
>> +    if (!perfm_ebb_enabled) {
>> +        return;
>> +    }
>> +
>> +    do_ebb(env, POWERPC_EXCP_PERFM_EBB);
>> +}
>>   #endif
>>   /*****************************************************************************/
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index f2e5060910..adc31235a8 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
>>   DEF_HELPER_1(rfscv, void, env)
>>   DEF_HELPER_1(hrfid, void, env)
>>   DEF_HELPER_2(rfebb, void, env, tl)
>> +DEF_HELPER_1(ebb_perfm_excp, void, env)
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>>   DEF_HELPER_2(store_mmcr0, void, env, tl)
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index d245663158..38e1ecb782 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -307,8 +307,7 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>           env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>>       }
>> -    /* PMC interrupt not implemented yet */
>> -    return;
>> +    helper_ebb_perfm_excp(env);
>>   }
>>   /* This helper assumes that the PMC is running. */
> 

