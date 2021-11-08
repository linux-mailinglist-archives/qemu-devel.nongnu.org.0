Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C4449CA2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:47:38 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAcE-0000VC-1L
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:47:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkAaQ-00080L-VN; Mon, 08 Nov 2021 14:45:47 -0500
Received: from [2607:f8b0:4864:20::72d] (port=38601
 helo=mail-qk1-x72d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkAaO-0005Io-Lt; Mon, 08 Nov 2021 14:45:46 -0500
Received: by mail-qk1-x72d.google.com with SMTP id bi29so16613049qkb.5;
 Mon, 08 Nov 2021 11:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ULTQMNzT4pQwHH9Mwzkg5xXYOgBI3V6jBHrMFfF4WkE=;
 b=MsOOFHtg0wrPpdpYw+3uN10keS5v+wou/yppmGQRUg+6evFBx4er2XpbbKIZUzhTxp
 uxu7MuMgP4dL230Cy9/MJDDbpYNWMDPGi4xApcNLgLRHEICdYZslS7Sv0jEegozKz1GS
 PqThe2hYLMEfeuWyhxB2dY8416BOxn4rwggY2+F1sERlYvaAkvLo7kPgkHddDEGFdyzb
 QnHiRFhW5KP06jH5o1YWw3dT7XLtj2Z1STVemIShO2agZEvHQHizrr2RcBW28rsoKYD+
 rRGzWZSf2NHo9hc8MKD9MmgX8Ucgku87fIstVYDkKJnLIXsum8+T352dvQZZZKYUt2Jv
 dEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ULTQMNzT4pQwHH9Mwzkg5xXYOgBI3V6jBHrMFfF4WkE=;
 b=pM1d3577O3An9TVamjn3pGOWaC65PgN2NFG4UbK5n/SiV0wzyNEzSsnkADJSJXgqCQ
 zEx9tGxcdychafuzTEEpMRu+ZNq1uS6b0XvnTdx+hNMP8rTAGliEaDSY+gWflB8Wto1/
 o+l5obO/wFZpM5uJ+i/bv7oZv6CppG4i4Q1rhJX26ZrIVG0FeH9dHWWpwWvKRs4UR8ap
 K/u+NnjWtrnME+IBFtPItRDQGaE3jaV01OaHjmZQ3Hip7n8Sub/6XsbUlL9W8bLw9zcF
 JnEQP+kaWGRamDWEJf6hDLf2whBQMulpR/5s634XMf4s9LFXbGQQSDOgZiI6vIxXCRvu
 Wnjw==
X-Gm-Message-State: AOAM531K8iTzcbesWlmXfEvq/ku1KsilsfJvR1M08979BsFF3iPOWcus
 jqu0Xc68cNynBsB8jxIoFbECqB8OTho=
X-Google-Smtp-Source: ABdhPJxBn3hui1rrAOPb2vBeTbsIUD71JHoMjcaJ1dNgoQPMLgKg4jgfJJgJygBsU7SyBzuWFseWew==
X-Received: by 2002:a05:620a:ccd:: with SMTP id
 b13mr1350023qkj.484.1636400741998; 
 Mon, 08 Nov 2021 11:45:41 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id 1sm11428044qtx.65.2021.11.08.11.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 11:45:41 -0800 (PST)
Message-ID: <46a82f09-0551-16da-0648-375cbcb3ec96@gmail.com>
Date: Mon, 8 Nov 2021 16:45:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 03/10] target/ppc: enable PMU counter overflow with
 cycle events
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-4-danielhb413@gmail.com>
 <a29aa8b5-fb45-5924-5cdc-3b6c0c3f52b0@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a29aa8b5-fb45-5924-5cdc-3b6c0c3f52b0@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: richard.henderson@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/5/21 09:56, Matheus K. Ferst wrote:
> On 01/11/2021 20:56, Daniel Henrique Barboza wrote:
>> The PowerISA v3.1 defines that if the proper bits are set (MMCR0_PMC1CE
>> for PMC1 and MMCR0_PMCjCE for the remaining PMCs), counter negative
>> conditions are enabled. This means that if the counter value overflows
>> (i.e. exceeds 0x80000000) a performance monitor alert will occur. This alert
>> can trigger an event-based exception (to be implemented in the next patches)
>> if the MMCR0_EBE bit is set.
>>
>> For now, overflowing the counter when the PMC is counting cycles will
>> just trigger a performance monitor alert. This is done by starting the
>> overflow timer to expire in the moment the overflow would be occuring. The
>> timer will call fire_PMC_interrupt() (via cpu_ppc_pmu_timer_cb) which will
>> trigger the PMU alert and, if the conditions are met, an EBB exception.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h        |  2 +
>>   target/ppc/power8-pmu.c | 86 ++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 86 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 6c4643044b..bf718334a5 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -363,6 +363,8 @@ typedef enum {
>>   #define MMCR0_PMCC   PPC_BITMASK(44, 45) /* PMC Control */
>>   #define MMCR0_FC14   PPC_BIT(58)         /* PMC Freeze Counters 1-4 bit */
>>   #define MMCR0_FC56   PPC_BIT(59)         /* PMC Freeze Counters 5-6 bit */
>> +#define MMCR0_PMC1CE PPC_BIT(48)         /* MMCR0 PMC1 Condition Enabled */
>> +#define MMCR0_PMCjCE PPC_BIT(49)         /* MMCR0 PMCj Condition Enabled */
>>   /* MMCR0 userspace r/w mask */
>>   #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
>>   /* MMCR2 userspace r/w mask */
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index a0a42b666c..fdc94d40b2 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -23,6 +23,8 @@
>>
>>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>>
>> +#define COUNTER_NEGATIVE_VAL 0x80000000
>> +
> 
> Since this value will be compared to some env->spr (that is target_ulong), it's probably a good idea to define it as unsigned. Also, you could prefix the name to indicate that it's PMU related, e.g.:
> 
> #defne PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
> 
>>   /*
>>    * For PMCs 1-4, IBM POWER chips has support for an implementation
>>    * dependent event, 0x1E, that enables cycle counting. The Linux kernel
>> @@ -93,6 +95,15 @@ static bool pmc_is_active(CPUPPCState *env, int sprn)
>>       return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
>>   }
>>
>> +static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
>> +{
>> +    if (sprn == SPR_POWER_PMC1) {
>> +        return env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE;
>> +    }
>> +
>> +    return env->spr[SPR_POWER_MMCR0] & MMCR0_PMCjCE;
>> +}
>> +
>>   static void pmu_update_cycles(CPUPPCState *env)
>>   {
>>       uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> @@ -121,6 +132,63 @@ static void pmu_update_cycles(CPUPPCState *env)
>>       }
>>   }
>>
>> +static void pmu_delete_timers(CPUPPCState *env)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < PMU_TIMERS_NUM; i++) {
>> +        timer_del(env->pmu_cyc_overflow_timers[i]);
>> +    }
>> +}
>> +
>> +/*
>> + * Helper function to retrieve the cycle overflow timer of the
>> + * 'sprn' counter. Given that PMC5 doesn't have a timer, the
>> + * amount of timers is less than the total counters and the PMC6
>> + * timer is the last of the array.
>> + */
>> +static QEMUTimer *get_cyc_overflow_timer(CPUPPCState *env, int sprn)
>> +{
>> +    if (sprn == SPR_POWER_PMC5) {
>> +        return NULL;
>> +    }
>> +
>> +    if (sprn == SPR_POWER_PMC6) {
>> +        return env->pmu_cyc_overflow_timers[PMU_TIMERS_NUM - 1];
>> +    }
>> +
>> +    return env->pmu_cyc_overflow_timers[sprn - SPR_POWER_PMC1];
>> +}
>> +
>> +static void pmu_start_overflow_timers(CPUPPCState *env)
>> +{
>> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    int64_t timeout;
>> +    int sprn;
>> +
>> +    env->pmu_base_time = now;
>> +
>> +    /*
>> +     * Scroll through all PMCs ad start counter overflow timers for
> 
> s/ad/and/
> 
>> +     * PM_CYC events, if needed.
>> +     */
>> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
>> +        if (!pmc_is_active(env, sprn) ||
>> +            !(getPMUEventType(env, sprn) == PMU_EVENT_CYCLES) ||
>> +            !pmc_has_overflow_enabled(env, sprn)) {
>> +            continue;
>> +        }
>> +
>> +        if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
>> +            timeout =  0;
>> +        } else {
>> +            timeout  = COUNTER_NEGATIVE_VAL - env->spr[sprn];
> 
> extra space between timeout and = ...
> 
>> +        }
>> +
>> +        timer_mod(get_cyc_overflow_timer(env, sprn), now + timeout);
> 
> but maybe you can just use timer_mod_anticipate?

timer_mod_anticipate will not make any difference here because, at this
point, we're guaranteed to not have any overflow timer running for the
counter.

pmu_start_overflow_timers() will always be executed after pmu_delete_timers(),
both inside start_cycle_counter_session().


Thanks,


Daniel

> 
>> +    }
>> +}
>> +
>>   /*
>>    * A cycle count session consists of the basic operations we
>>    * need to do to support PM_CYC events: redefine a new base_time
>> @@ -128,8 +196,22 @@ static void pmu_update_cycles(CPUPPCState *env)
>>    */
>>   static void start_cycle_count_session(CPUPPCState *env)
>>   {
>> -    /* Just define pmu_base_time for now */
>> -    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    bool overflow_enabled = env->spr[SPR_POWER_MMCR0] &
>> +                            (MMCR0_PMC1CE | MMCR0_PMCjCE);
>> +
>> +    /*
>> +     * Always delete existing overflow timers when starting a
>> +     * new cycle counting session.
>> +     */
>> +    pmu_delete_timers(env);
>> +
>> +    if (!overflow_enabled) {
>> +        /* Define pmu_base_time and leave */
>> +        env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        return;
>> +    }
>> +
>> +    pmu_start_overflow_timers(env);
>>   }
>>
>>   void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>> -- 
>> 2.31.1
>>

