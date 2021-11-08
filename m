Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E926449C9F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:43:39 +0100 (CET)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAYM-00075Y-Cx
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkAVo-0005U1-IN; Mon, 08 Nov 2021 14:41:01 -0500
Received: from [2607:f8b0:4864:20::836] (port=34651
 helo=mail-qt1-x836.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkAVm-0003hb-Hf; Mon, 08 Nov 2021 14:41:00 -0500
Received: by mail-qt1-x836.google.com with SMTP id o17so1837193qtk.1;
 Mon, 08 Nov 2021 11:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iOdbc3YS5O0x8zWHJuL1CJg9z6Iq6VUrE0jfEXfKtjE=;
 b=Jl5CxBwIOwt54F14Gm9F3nvOUtofd5RV7hy7KURsu3bUIhBk4qLxDxxcRWhJ0AaU2x
 ocXdWp5BurFJTvO6s653KiZ+5D/XuntrR82ivaVMR9BBu9mC2PbORHbyrl0t588gPtXn
 qlQne5jCRD7ct5fH6FafDE2rSZVBjSg3xyW6tY+U/+/wu/j2YxXjslU2Di2r3oBqj6Rp
 urkC/XwPpGhmB5f3gBccwvM0wNKgxwrDZUEc5B0tI4ygWNs0UTw2RsHx7IwGfGYOm8YI
 TspxA/6+2Wggfbm9qEZtrkDHDxcqXKxQpW0fX72lq2cRBX+lRyS4IfyhKKBXKX0F8Qqa
 KSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iOdbc3YS5O0x8zWHJuL1CJg9z6Iq6VUrE0jfEXfKtjE=;
 b=SkdwMQ+x2rAoDO4WtsNYdNammQlyFVDXnz6qDjm0jnQrheOgI62JKd2PTOv3I3bQFd
 mDGXDdTqnlJbIakbK5NkEBkItzhC72JxpbkMTGD2S/F/QFQp8SYRqheXgB2DCb7110et
 mPN8PysGr7f4q2ve9UNKbscNTtp16ehcyoICQNofD4DRyefmQadecx8TCXiygHd7dupM
 gpu7P7VTveJJPYOqyqSENhd4juOmTnLmK4e+x3Tqq15mnj928WdMgWI1AB29OYYBHFxT
 /wwEpKU1CRfdn2qC1OtwcIEa27FvzpYj/SyjI0gcIR+M+FBm4YwXB1kjPcsdq/2VjIyT
 d79Q==
X-Gm-Message-State: AOAM533WEMotheWg+s4hR9JVpap6bJGZ2iFK14lP5lVlnEHAv3WyroWn
 /O43H+TvjkmrmLD0hSQz9qAS3Hi2p/E=
X-Google-Smtp-Source: ABdhPJyHYMeOGhTQLCjJWFbKiItxGVTChcuQT9xF9L/o4wsjdD9ULUQ3aajFK+cWwQaEriVEsKlsTQ==
X-Received: by 2002:a05:620a:2587:: with SMTP id
 x7mr1285473qko.181.1636400129519; 
 Mon, 08 Nov 2021 11:35:29 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id 6sm11370537qtz.48.2021.11.08.11.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 11:35:29 -0800 (PST)
Message-ID: <3b3ba45c-4fbd-bae8-870a-2ce4a830fca4@gmail.com>
Date: Mon, 8 Nov 2021 16:35:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 02/10] target/ppc: PMU basic cycle count for pseries TCG
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20211101235642.926773-1-danielhb413@gmail.com>
 <20211101235642.926773-3-danielhb413@gmail.com>
 <8fab8324-d26d-6d6f-4ba8-47616b064873@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <8fab8324-d26d-6d6f-4ba8-47616b064873@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::836
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
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
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index 3c2f73896f..a0a42b666c 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
> 
> <snip>
> 
>> +static bool pmc_is_active(CPUPPCState *env, int sprn)
>> +{
>> +    if (sprn < SPR_POWER_PMC5) {
>> +        return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC14);
>> +    }
>> +
>> +    return !(env->spr[SPR_POWER_MMCR0] & MMCR0_FC56);
>> +}
>> +
>> +static void pmu_update_cycles(CPUPPCState *env)
>> +{
>> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    uint64_t time_delta = now - env->pmu_base_time;
>> +    int sprn;
>> +
>> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
>> +        if (!pmc_is_active(env, sprn) ||
>> +            getPMUEventType(env, sprn) != PMU_EVENT_CYCLES) {
>> +            continue;
>> +        }
>> +
>> +        /*
>> +         * The pseries and powernv clock runs at 1Ghz, meaning
>> +         * that 1 nanosec equals 1 cycle.
>> +         */
>> +        env->spr[sprn] += time_delta;
>> +    }
>> +
>> +    /*
>> +     * Update base_time for future calculations if we updated
>> +     * the PMCs while the PMU was running.
>> +     */
>> +    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_FC)) {
>> +        env->pmu_base_time = now;
>> +    }
>> +}
>> +
>> +/*
>> + * A cycle count session consists of the basic operations we
>> + * need to do to support PM_CYC events: redefine a new base_time
>> + * to be used to calculate PMC values and start overflow timers.
>> + */
>> +static void start_cycle_count_session(CPUPPCState *env)
>> +{
>> +    /* Just define pmu_base_time for now */
>> +    env->pmu_base_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +}
>> +
>> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>> +{
>> +    target_ulong curr_value = env->spr[SPR_POWER_MMCR0];
>> +    bool curr_FC = curr_value & MMCR0_FC;
>> +    bool new_FC = value & MMCR0_FC;
>> +
>> +    env->spr[SPR_POWER_MMCR0] = value;
> 
> I'm not sure if this is the right place to update MMCR0. If we set both FC and FC14 in one write, the code will call pmu_update_cycles, but PMCs 1-4 will not be updated because pmc_is_active will use the new value to check if the PMCs are frozen.


We can't postpone this MMCR0 update because the PMU might trigger
an overflow when updating the counters, and the event branch will
receive an outdated MMCR0 value. hflags will be outdated when the
thread goes out the branch and it will conflict with the current
hflags value (updated with hreg_compute_hflags).

You're right about the problem with handling FC14/FC56 bits in the
same MMCR0 write though. What I ended up doing was to pass the old
MMCR0 value to pmu_update_cycles(). That way we'll avoid the problem
you described above.

I took a step further and also added a similar handling that were
already being done with the overflow bits (patch 7) with the FC
bits as well. This means that we'll be able to freeze/update the
counters individually while the PMU is running.



Thanks,


Daniel

> 
>> +
>> +    /* MMCR0 writes can change HFLAGS_PMCCCLEAR and HFLAGS_MMCR0FC */
>> +    if (((curr_value & MMCR0_PMCC) != (value & MMCR0_PMCC)) ||
>> +        (curr_FC != new_FC)) {
>> +        hreg_compute_hflags(env);
>> +    }
>> +
>> +    /*
>> +     * In an frozen count (FC) bit change:
>> +     *
>> +     * - if PMCs were running (curr_FC = false) and we're freezing
>> +     * them (new_FC = true), save the PMCs values in the registers.
>> +     *
>> +     * - if PMCs were frozen (curr_FC = true) and we're activating
>> +     * them (new_FC = false), set the new base_time for future cycle
>> +     * calculations.
>> +     */
>> +    if (curr_FC != new_FC) {
>> +        if (!curr_FC) { > +            pmu_update_cycles(env);
>> +        } else {
>> +            start_cycle_count_session(env);
>> +        }
>> +    }
>> +}
> 

