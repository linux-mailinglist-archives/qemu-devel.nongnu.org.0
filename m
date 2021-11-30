Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E724464140
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 23:25:25 +0100 (CET)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msBYx-0003pQ-VW
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 17:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msBXp-00039M-Lp; Tue, 30 Nov 2021 17:24:13 -0500
Received: from [2607:f8b0:4864:20::935] (port=40951
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msBXm-0003zw-5n; Tue, 30 Nov 2021 17:24:13 -0500
Received: by mail-ua1-x935.google.com with SMTP id y5so44728553ual.7;
 Tue, 30 Nov 2021 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KM9C1BpOmVX1SUigsnxUxpjYWuavWSJy7t2gRwKHB/w=;
 b=QibQSO8QF+nkC0tY4M1ed0yFGtvaU84MhGK55dzsC3aaCg3I5zXL6jSC8jB7hOzqXk
 HsqXRoRAJM6YeRpisPhPixyq29qMijtG2hauwe+eOamKson9cpKmIXkDbHbQkpgzBNWF
 Ogi5i7ltr5l0vWS6QkzuuCVOwMN0O+7n9tmymempFHUH8KJuqa4nN8PiLPC2n8HLOsvk
 inpWGT/JQ8b2iycBq+GAYZBLgKnqlEjFF6blcXfG9BOSCoSZEB1aAulOzQmSh/ZYjlG3
 99xLhd6jURsAX9HPaaMMBOKxffkp/nfvx645QzBJK5SBxyry0pPPKIK7wgVE0zNG9ny5
 /0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KM9C1BpOmVX1SUigsnxUxpjYWuavWSJy7t2gRwKHB/w=;
 b=SrJy7rYKD3Lo5ZjugD8ysOOEZupog850gfQoRjossv9FN3IlQNsACQPY59mVPh0ieX
 Vdh/H3xNrS48moIRcT9L/7oFrU0b+Vefa6DBM8Mn3IbxYDOQBrtQ4bdr7lY66p6pCbIo
 g+4hAhF/g5Gu6C+RkerKJLxP50UCPiw3B8UA7onn7ljzzQ57t9z+VMfJ5/T6Jf1sdA+X
 NyXuWCYFv8aJEDCZiKYDU2+XAs7mzyt9w71MmXFCfHtIJ/7YFfDnN4bOgEvota2e+b1s
 Hc7vYVo8RglJQYwjtbaCSTFwtcGDDXtUxQkpbeXPoFCw1rm5eyuLMMsw88HnO1PJcNVn
 u6Gg==
X-Gm-Message-State: AOAM531tfZ+wCmPoG++J0KjM0l4IdtDp7hUVRci0lHFcZm09JwKnud7A
 lbmTYCNLayvyxxiZ32c7oTM=
X-Google-Smtp-Source: ABdhPJzxM0pC+hvxr5hVJXrTYO1AjxFePog7RP/AWu8mQx1dCZELNEl4MIHfJRWxUGheF0EIkpxkhA==
X-Received: by 2002:ab0:36d2:: with SMTP id v18mr3776183uau.37.1638311047280; 
 Tue, 30 Nov 2021 14:24:07 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id f132sm10803907vkf.18.2021.11.30.14.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 14:24:07 -0800 (PST)
Message-ID: <6358310d-c6e4-c5fd-c76c-854674ce1d6b@gmail.com>
Date: Tue, 30 Nov 2021 19:24:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 06/10] target/ppc: enable PMU instruction count
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20211125150817.573204-1-danielhb413@gmail.com>
 <20211125150817.573204-7-danielhb413@gmail.com> <YaRYwiSLgVW38EKj@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YaRYwiSLgVW38EKj@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.211,
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/29/21 01:36, David Gibson wrote:
> On Thu, Nov 25, 2021 at 12:08:13PM -0300, Daniel Henrique Barboza wrote:
>> The PMU is already counting cycles by calculating time elapsed in
>> nanoseconds. Counting instructions is a different matter and requires
>> another approach.
>>
>> This patch adds the capability of counting completed instructions
>> (Perf event PM_INST_CMPL) by counting the amount of instructions
>> translated in each translation block right before exiting it.
>>
>> A new pmu_count_insns() helper in translation.c was added to do that.
>> After verifying that the PMU is running (MMCR0_FC bit not set), call
>> helper_insns_inc(). This new helper from power8-pmu.c will add the
>> instructions to the relevant counters. It'll also be responsible for
>> triggering counter negative overflows as it is already being done with
>> cycles.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h                 |  1 +
>>   target/ppc/helper.h              |  1 +
>>   target/ppc/helper_regs.c         |  4 +++
>>   target/ppc/power8-pmu-regs.c.inc |  6 +++++
>>   target/ppc/power8-pmu.c          | 38 ++++++++++++++++++++++++++
>>   target/ppc/translate.c           | 46 ++++++++++++++++++++++++++++++++
>>   6 files changed, 96 insertions(+)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 9b41b022e2..38cd2b5c43 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -656,6 +656,7 @@ enum {
>>       HFLAGS_PR = 14,  /* MSR_PR */
>>       HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
>>       HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
>> +    HFLAGS_MMCR0FC = 17, /* MMCR0 FC bit */
> 
> Now that the event stuff is a bit more refined, you could narrow this
> down to specifically marking if any counters are actively counting
> instructions (not frozen by MMCR0[FC] and not frozen by
> MMCR0[FC14|FC56] *and* have the right event selected).
> 
> Since I suspect the instruction counting instrumentation could be
> quite expensive (helper call on every tb), that might be worthwhile.

That was worthwhile. The performance increase is substantial with this
change, in particular with tests that exercises only cycle events.



> 
>>       HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
>>       HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
>>   
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index 94b4690375..d8a23e054a 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -24,6 +24,7 @@ DEF_HELPER_2(store_mmcr0, void, env, tl)
>>   DEF_HELPER_2(store_mmcr1, void, env, tl)
>>   DEF_HELPER_3(store_pmc, void, env, i32, i64)
>>   DEF_HELPER_2(read_pmc, tl, env, i32)
>> +DEF_HELPER_2(insns_inc, void, env, i32)
>>   #endif
>>   DEF_HELPER_1(check_tlb_flush_local, void, env)
>>   DEF_HELPER_1(check_tlb_flush_global, void, env)
>> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
>> index 99562edd57..875c2fdfc6 100644
>> --- a/target/ppc/helper_regs.c
>> +++ b/target/ppc/helper_regs.c
>> @@ -115,6 +115,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>>       if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
>>           hflags |= 1 << HFLAGS_PMCC1;
>>       }
>> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FC) {
>> +        hflags |= 1 << HFLAGS_MMCR0FC;
>> +    }
>> +
>>   
>>   #ifndef CONFIG_USER_ONLY
>>       if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
>> diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
>> index 25b13ad564..580e4e41b2 100644
>> --- a/target/ppc/power8-pmu-regs.c.inc
>> +++ b/target/ppc/power8-pmu-regs.c.inc
>> @@ -113,6 +113,12 @@ static void write_MMCR0_common(DisasContext *ctx, TCGv val)
>>        */
>>       gen_icount_io_start(ctx);
>>       gen_helper_store_mmcr0(cpu_env, val);
>> +
>> +    /*
>> +     * End the translation block because MMCR0 writes can change
>> +     * ctx->pmu_frozen.
>> +     */
>> +    ctx->base.is_jmp = DISAS_EXIT_UPDATE;
>>   }
>>   
>>   void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
>> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
>> index 01e0b9b8fc..59d0def79d 100644
>> --- a/target/ppc/power8-pmu.c
>> +++ b/target/ppc/power8-pmu.c
>> @@ -112,6 +112,30 @@ static PMUEventType pmc_get_event(CPUPPCState *env, int sprn)
>>       return evt_type;
>>   }
>>   
>> +static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
>> +{
>> +    bool overflow_triggered = false;
>> +    int sprn;
>> +
>> +    /* PMC6 never counts instructions */
>> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC5; sprn++) {
>> +        if (pmc_get_event(env, sprn) != PMU_EVENT_INSTRUCTIONS) {
>> +            continue;
>> +        }
>> +
>> +        env->spr[sprn] += num_insns;
>> +
>> +        if (env->spr[sprn] >= PMC_COUNTER_NEGATIVE_VAL &&
>> +            pmc_has_overflow_enabled(env, sprn)) {
>> +
>> +            overflow_triggered = true;
>> +            env->spr[sprn] = PMC_COUNTER_NEGATIVE_VAL;
> 
> Does the hardware PMU actually guarantee that the event will happen
> exactly on the overflow?  Or could you count a few into the negative
> zone before the event is delivered?

My understand reading the ISA and from testing with the a real PMU is that yes,
it'll guarantee that the overflow will happen when the counter reaches exactly
0x80000000.

> 
>> +        }
>> +    }
>> +
>> +    return overflow_triggered;
>> +}
>> +
>>   static void pmu_update_cycles(CPUPPCState *env)
>>   {
>>       uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> @@ -258,6 +282,20 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>>       return;
>>   }
>>   
>> +/* This helper assumes that the PMC is running. */
>> +void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
>> +{
>> +    bool overflow_triggered;
>> +    PowerPCCPU *cpu;
>> +
>> +    overflow_triggered = pmu_increment_insns(env, num_insns);
>> +
>> +    if (overflow_triggered) {
>> +        cpu = env_archcpu(env);
>> +        fire_PMC_interrupt(cpu);
>> +    }
>> +}
>> +
>>   static void cpu_ppc_pmu_timer_cb(void *opaque)
>>   {
>>       PowerPCCPU *cpu = opaque;
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 9960df6e18..ccc83d0603 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -177,6 +177,7 @@ struct DisasContext {
>>       bool hr;
>>       bool mmcr0_pmcc0;
>>       bool mmcr0_pmcc1;
>> +    bool pmu_frozen;
>>       ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
>>       int singlestep_enabled;
>>       uint32_t flags;
>> @@ -4170,6 +4171,31 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
>>   #endif
>>   }
>>   
>> +#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> 
> Should this actually be !CONFIG_USER_ONLY?  IIUC there are
> circumstances where userspace could access the PMU, including
> instruction counting.

The user mode will not be able to use the PMU properly because the MMCR1
reg, used to define the events to be sampled, isn't writable by userpace
under any circunstance.


Thanks,


Daniel

> 
>> +static void pmu_count_insns(DisasContext *ctx)
>> +{
>> +    /* Do not bother calling the helper if the PMU is frozen */
>> +    if (ctx->pmu_frozen) {
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The PMU insns_inc() helper stops the internal PMU timer if a
>> +     * counter overflows happens. In that case, if the guest is
>> +     * running with icount and we do not handle it beforehand,
>> +     * the helper can trigger a 'bad icount read'.
>> +     */
>> +    gen_icount_io_start(ctx);
>> +
>> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
>> +}
>> +#else
>> +static void pmu_count_insns(DisasContext *ctx)
>> +{
>> +    return;
>> +}
>> +#endif
>> +
>>   static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>>   {
>>       return translator_use_goto_tb(&ctx->base, dest);
>> @@ -4180,6 +4206,14 @@ static void gen_lookup_and_goto_ptr(DisasContext *ctx)
>>       if (unlikely(ctx->singlestep_enabled)) {
>>           gen_debug_exception(ctx);
>>       } else {
>> +        /*
>> +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
>> +         * CF_NO_GOTO_PTR is set. Count insns now.
>> +         */
>> +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
>> +            pmu_count_insns(ctx);
>> +        }
>> +
>>           tcg_gen_lookup_and_goto_ptr();
>>       }
>>   }
>> @@ -4191,6 +4225,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>>           dest = (uint32_t) dest;
>>       }
>>       if (use_goto_tb(ctx, dest)) {
>> +        pmu_count_insns(ctx);
>>           tcg_gen_goto_tb(n);
>>           tcg_gen_movi_tl(cpu_nip, dest & ~3);
>>           tcg_gen_exit_tb(ctx->base.tb, n);
>> @@ -8458,6 +8493,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       ctx->hr = (hflags >> HFLAGS_HR) & 1;
>>       ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
>>       ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
>> +    ctx->pmu_frozen = (hflags >> HFLAGS_MMCR0FC) & 1;
>>   
>>       ctx->singlestep_enabled = 0;
>>       if ((hflags >> HFLAGS_SE) & 1) {
>> @@ -8564,6 +8600,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>>       switch (is_jmp) {
>>       case DISAS_TOO_MANY:
>>           if (use_goto_tb(ctx, nip)) {
>> +            pmu_count_insns(ctx);
>>               tcg_gen_goto_tb(0);
>>               gen_update_nip(ctx, nip);
>>               tcg_gen_exit_tb(ctx->base.tb, 0);
>> @@ -8574,6 +8611,14 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>>           gen_update_nip(ctx, nip);
>>           /* fall through */
>>       case DISAS_CHAIN:
>> +        /*
>> +         * tcg_gen_lookup_and_goto_ptr will exit the TB if
>> +         * CF_NO_GOTO_PTR is set. Count insns now.
>> +         */
>> +        if (ctx->base.tb->flags & CF_NO_GOTO_PTR) {
>> +            pmu_count_insns(ctx);
>> +        }
>> +
>>           tcg_gen_lookup_and_goto_ptr();
>>           break;
>>   
>> @@ -8581,6 +8626,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>>           gen_update_nip(ctx, nip);
>>           /* fall through */
>>       case DISAS_EXIT:
>> +        pmu_count_insns(ctx);
>>           tcg_gen_exit_tb(NULL, 0);
>>           break;
>>   
> 

