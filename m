Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989F3E5B6B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:25:53 +0200 (CEST)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRlP-00029f-QS
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDRjv-0000g6-6u; Tue, 10 Aug 2021 09:24:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDRjs-0002TM-WC; Tue, 10 Aug 2021 09:24:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so5343008pjl.4; 
 Tue, 10 Aug 2021 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4JtICkFBuKDjrVHZzAnHgxPkllguyEa8jmD4tG/G2mA=;
 b=KavsL4r3Za9QsKkgTddId9LxX7Gc2K46oRLDIDxtcpuK/OvR8PKsJ12Er1QJ35o7l7
 QVLhHA/3d+PKzBjqqOIXUO9xy39LCHfzYPeUsOymd8dZNqq+J4MlvcO8sEZyfb/w7nu4
 gyRnHc4P13EMYAlt6Oiq4R1DMykYs/2tqKLay6JYulLnWTYyx4oejYwhnr9J0Kdx5Bqi
 tBHVCtEQ7TOSpJsD1oJVu/VBqyFhVPSyKNdnDpRFIe6EQCtHFh1tBeHKfurTIVJcG/IL
 CZTnyIip2iOdspzyEItifHPv4OZjsLIy/ZeM4N6bVoJMIgTGhODRpm9CTiMPMVeUgR5U
 I2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4JtICkFBuKDjrVHZzAnHgxPkllguyEa8jmD4tG/G2mA=;
 b=fhp/8eH7m465OoThFJqvqwgb/gxj+Y1e+SdIzYC+sqPi+2X4FpHOhwoj6/9nZm2efv
 5trffZJ3gpgi9XghP6/XgmZQ59Z9+zQ97+XSCsZs8tDcDlhMhn4x1SXoGPy75xOU5QfL
 PUytZ8ncb3rFy0nuq5bjL/QapL+darORMA/35zKD1oDmxZVbS6/Nq35W5oVp7GM8Id+P
 F65tgSnBt7Bb9YBN/5ALmzuAEza9sQ6UkBiG20Cprvj6+xoDsH401jBfHbgEfaN6RRXM
 JVsuzc8vik5qa31xgBoo5iBEChKCTq3z8KBUqWLHJ3Op9v8SU20+P14GvjL9q4FIOu5i
 v1ZQ==
X-Gm-Message-State: AOAM533Vpbz0I4L6qH+ld3nQ6yt5mfFWhBRwyQbQG8FSuLFBbSALnRa2
 wb7tnSaLD/a2FC5fDfOF2C8=
X-Google-Smtp-Source: ABdhPJwmzGBz75uMPKCk/JS6B5uabeQpbGW0QnnMgltOEeqGjrjZZQqr8DKHdUmcBHhQOtc/RX26sg==
X-Received: by 2002:a17:90a:be09:: with SMTP id
 a9mr2226219pjs.85.1628601854055; 
 Tue, 10 Aug 2021 06:24:14 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id q21sm13947895pjg.55.2021.08.10.06.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 06:24:13 -0700 (PDT)
Subject: Re: [PATCH 04/19] target/ppc: PMU Book3s basic insns count for
 pseries TCG
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-5-danielhb413@gmail.com> <YRH05uCNwvjS5Nws@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <90d3365e-00af-ebd6-a003-f2afe240d018@gmail.com>
Date: Tue, 10 Aug 2021 10:24:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH05uCNwvjS5Nws@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 12:39 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:42AM -0300, Daniel Henrique Barboza wrote:
>> The PMCC (PMC Control) bit in the MMCR0 register controls whether the
>> counters PMC5 and PMC6 are being part of the performance monitor
>> facility in a specific time. If PMCC allows it, PMC5 and PMC6 will
>> always be used to measure instructions completed and cycles,
>> respectively.
>>
>> This patch adds the barebones of the Book3s PMU logic by enabling
>> instruction counting, using the icount framework, using the performance
>> monitor counters 5 and 6. The overall logic goes as follows:
>>
>> - a helper is added to control the PMU state on each MMCR0 write. This
>> allows for the PMU to start/stop as quick as possible;
> 
> Um.. why does a helper accomplish that goal?

Every change in the frozen counter bit (MMCR0_FC) will trigger a specific
behavior in the PMU (starting/stopping counters, timers and so on). Doing
all this work in the body of translation.c looked like a tall order. Adding
a helper to handle this logic somewhere else seemed appropriate.

I got this idea reading how gen_mtmsrd() uses gen_helper_store_msr() to both
update MSR and take other actions depending on the bits being set/cleared.

> 
>>
>> - only PMC5 and PMC6 are being set. PMC6 (cycles) is default to 4*insns
>> (for cycles per instruction) for now;
> 
> What's the justification for that value?  With a superscalar core, I'd
> expect average (median) cycles per instruction to be < 1 a lot of the
> time.  Mean cycles per instruction could be higher since certain
> instructions could take a lot.

Just a placeholder. I can fold the cycles calculation from patch 08 into
this patch to avoid it.

> 
>> - the intended usage is to freeze the counters by setting MMCR0_FC, do
>> any additional setting via MMCR1 (not implemented yet) and setting
>> initial counter values,  and enable the PMU by zeroing MMCR0_FC. Software
>> must freeze counters to read the results - on the fly reading of the PMCs
>> will return the starting value of each one.
> 
> Is that the way hardware behaves?  Or is it just a limitation of this
> software implementation?  Either is fine, we should just be clear on
> what it is.

I probably should've asked the kernel perf folks about it, but I didn't.

The hardware doesn't seem to have these restrictions. I'll reword this a bit
to make it clearer that this is an implementation restriction.

> 
>>
>> Since there will be more PMU exclusive code to be added next, let's also
>> put the PMU logic in its own helper to keep all in the same place. The
>> code is also repetitive and not really extensible to add more PMCs, but
>> we'll handle this in the next patches.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h               |  4 ++
>>   target/ppc/cpu_init.c          |  4 +-
>>   target/ppc/helper.h            |  1 +
>>   target/ppc/meson.build         |  1 +
>>   target/ppc/pmu_book3s_helper.c | 78 ++++++++++++++++++++++++++++++++++
>>   target/ppc/translate.c         | 14 ++++--
>>   6 files changed, 97 insertions(+), 5 deletions(-)
>>   create mode 100644 target/ppc/pmu_book3s_helper.c
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 4d96015f81..229abfe7ee 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -1175,6 +1175,10 @@ struct CPUPPCState {
>>       uint32_t tm_vscr;
>>       uint64_t tm_dscr;
>>       uint64_t tm_tar;
>> +
>> +    /* PMU registers icount state */
>> +    uint64_t pmc5_base_icount;
>> +    uint64_t pmc6_base_icount;
>>   };
>>   
>>   #define SET_FIT_PERIOD(a_, b_, c_, d_)          \
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 71062809c8..fce89ee994 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6822,7 +6822,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
>>       spr_register_kvm(env, SPR_POWER_MMCR0, "MMCR0",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>>                        &spr_read_pmu_generic, &spr_write_pmu_generic,
>> -                     KVM_REG_PPC_MMCR0, 0x00000000);
>> +                     KVM_REG_PPC_MMCR0, 0x80000000);
>>       spr_register_kvm(env, SPR_POWER_MMCR1, "MMCR1",
>>                        SPR_NOACCESS, SPR_NOACCESS,
>>                        &spr_read_pmu_generic, &spr_write_pmu_generic,
>> @@ -6870,7 +6870,7 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
>>       spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
>>                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>>                    &spr_read_ureg, &spr_write_ureg,
>> -                 0x00000000);
>> +                 0x80000000);
>>       spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
>>                    &spr_read_pmu_ureg, &spr_write_pmu_ureg,
>>                    &spr_read_ureg, &spr_write_ureg,
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 4076aa281e..5122632784 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -20,6 +20,7 @@ DEF_HELPER_1(rfscv, void, env)
>>   DEF_HELPER_1(hrfid, void, env)
>>   DEF_HELPER_2(store_lpcr, void, env, tl)
>>   DEF_HELPER_2(store_pcr, void, env, tl)
>> +DEF_HELPER_2(store_mmcr0, void, env, tl)
>>   #endif
>>   DEF_HELPER_1(check_tlb_flush_local, void, env)
>>   DEF_HELPER_1(check_tlb_flush_global, void, env)
>> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
>> index b85f295703..bf252ca3ac 100644
>> --- a/target/ppc/meson.build
>> +++ b/target/ppc/meson.build
>> @@ -14,6 +14,7 @@ ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
>>     'int_helper.c',
>>     'mem_helper.c',
>>     'misc_helper.c',
>> +  'pmu_book3s_helper.c',
>>     'timebase_helper.c',
>>     'translate.c',
>>   ))
>> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
>> new file mode 100644
>> index 0000000000..fe16fcfce0
>> --- /dev/null
>> +++ b/target/ppc/pmu_book3s_helper.c
> 
> I'd prefer to call this just book3s_pmu.c.  Or better yet
> "powerX_pmu.c", where X is the specific PMU model you're implementing
> since IIRC the particulars of the PMU vary quite a lot from POWER7
> through to POWER10.
> 
>> @@ -0,0 +1,78 @@
>> +/*
>> + * PowerPC Book3s PMU emulation helpers for QEMU TCG
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
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>> +#include "qemu/error-report.h"
>> +#include "qemu/main-loop.h"
>> +
>> +static uint64_t get_insns(void)
>> +{
>> +    return (uint64_t)icount_get_raw();
>> +}
>> +
>> +static uint64_t get_cycles(uint64_t insns)
>> +{
>> +    /* Placeholder value */
>> +    return insns * 4;
>> +}
>> +
>> +/* PMC5 always count instructions */
>> +static void freeze_PMC5_value(CPUPPCState *env)
>> +{
>> +    uint64_t insns = get_insns() - env->pmc5_base_icount;
>> +
>> +    env->spr[SPR_POWER_PMC5] += insns;
>> +    env->pmc5_base_icount += insns;
>> +}
>> +
>> +/* PMC6 always count cycles */
>> +static void freeze_PMC6_value(CPUPPCState *env)
>> +{
>> +    uint64_t insns = get_insns() - env->pmc6_base_icount;
>> +
>> +    env->spr[SPR_POWER_PMC6] += get_cycles(insns);
>> +    env->pmc6_base_icount += insns;
>> +}
>> +
>> +void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
>> +{
>> +    bool curr_FC = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
>> +    bool new_FC = value & MMCR0_FC;
>> +
>> +    /*
>> +     * In an frozen count (FC) bit change:
>> +     *
>> +     * - if PMCs were running (curr_FC = false) and we're freezing
>> +     * them (new_FC = true), save the PMCs values in the registers.
>> +     *
>> +     * - if PMCs were frozen (curr_FC = true) and we're activating
>> +     * them (new_FC = false), calculate the current icount for each
>> +     * register to allow for subsequent reads to calculate the insns
>> +     * passed.
>> +     */
>> +    if (curr_FC != new_FC) {
>> +        if (!curr_FC) {
>> +            freeze_PMC5_value(env);
>> +            freeze_PMC6_value(env);
>> +        } else {
>> +            uint64_t curr_icount = get_insns();
>> +
>> +            env->pmc5_base_icount = curr_icount;
>> +            env->pmc6_base_icount = curr_icount;
>> +        }
>> +    }
>> +
>> +    env->spr[SPR_POWER_MMCR0] = value;
>> +}
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 29b0a340a9..62356cfadf 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -409,8 +409,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
>>   
>>   void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
>>   {
>> -    /* For now it's just a call to spr_write_generic() */
>> -    spr_write_generic(ctx, sprn, gprn);
>> +    switch (sprn) {
>> +    case SPR_POWER_MMCR0:
>> +        gen_icount_io_start(ctx);
>> +        gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
>> +        break;
>> +    default:
>> +        spr_write_generic(ctx, sprn, gprn);
>> +    }
>>   }
>>   
>>   #if !defined(CONFIG_USER_ONLY)
>> @@ -592,6 +598,8 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
>>           t0 = tcg_temp_new();
>>           t1 = tcg_temp_new();
>>   
>> +        gen_icount_io_start(ctx);
>> +
>>           /*
>>            * Filter out all bits but FC, PMAO, and PMAE, according
>>            * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
>> @@ -603,7 +611,7 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
>>           tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
>>           /* Keep all other bits intact */
>>           tcg_gen_or_tl(t1, t1, t0);
>> -        gen_store_spr(effective_sprn, t1);
>> +        gen_helper_store_mmcr0(cpu_env, t1);
>>   
>>           tcg_temp_free(t0);
>>           tcg_temp_free(t1);
> 

