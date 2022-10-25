Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE960D4AF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 21:31:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onPcU-0007vc-SU; Tue, 25 Oct 2022 15:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPcR-0007dI-9z; Tue, 25 Oct 2022 15:29:47 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onPcM-0003W8-T8; Tue, 25 Oct 2022 15:29:45 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1324e7a1284so16991184fac.10; 
 Tue, 25 Oct 2022 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCo+Waaghd79lX015Ezb05cxjKsd7HnpGH4ig3Mvq8Q=;
 b=Bqe0G17rt7D3q97mjIcbzTDa3fI1RqHRu3ylOabTLFRfd0kECpI/DJYYbKlxDYzVM/
 Ok+e0Hj1DfhX3CzL/iXaiN5DP+GNpbBGDCJs/yBzPTChXMrZmW9WBXLMs7yq+87s8LP4
 M7k269mfaRMtFeax/+f61hZp5EwH1YNPrKSq5QlQrT/w4Wha4jalmX2wzroN4qB+JImz
 dydcy4Zz0urIrV/WwjDi5N31gxezeUqeTtiX5RFFuqX8G24JtmtKdwCBf2x5O/IK8qXz
 EkJS8razA2eYlLEFftyhzD6ysEQg60YM+iAlr1lZ5sAQU/whqupwfYMuGQzaqdznF8FI
 CoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCo+Waaghd79lX015Ezb05cxjKsd7HnpGH4ig3Mvq8Q=;
 b=e6wzXa1jxlsdhb3gyxidonFp99VfKnRqTZcy/SUEKYAqD7cHj+lnu6bAvdn86CKTI2
 Rf1nW298IdNsC3phUMGzH0NVMobmz5b7GCrU5Ary1+DfU0YF1uk4McrkKhcdY0XB3/ck
 9znPmov+vC2RVhBudOLP/MZyfX5ejfEg8JPpAhn1kjVOmntH2BlsaGV20lWcYEnRO6BI
 xBIyVnhkt4k8FuPpbG8nr+JVXLHQIEkYKfXYSSNnJGFcAxn69mzwKyQYK7O+SyHqOFP2
 QIiTc8q9OzWal3pLkweZLqXiWKzGiqcKF2AWIs+/dCPaqQKnYgKOwUdKV9czv0Io9OHq
 AjDw==
X-Gm-Message-State: ACrzQf2csrNMO+v47bA3yUCFUQleL/fhUFbEpx6dij82a0QMGR9FLnCH
 XeWkoCxa2SPgugULoemNeTI=
X-Google-Smtp-Source: AMsMyM6E51QWnN6PB2qfnC8dpm0vOzsQu8mACoKHsAG6v5vJ97PyxhUKktw/Gn+OMJNAbRNXbqczTw==
X-Received: by 2002:a05:6870:d623:b0:13a:f0ad:804a with SMTP id
 a35-20020a056870d62300b0013af0ad804amr18899520oaq.79.1666726177886; 
 Tue, 25 Oct 2022 12:29:37 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 15-20020a9d0b8f000000b00667bb4f4480sm558280oth.10.2022.10.25.12.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 12:29:37 -0700 (PDT)
Message-ID: <67032796-2e9d-5fee-3e5f-0e85e0bb0a21@gmail.com>
Date: Tue, 25 Oct 2022 16:29:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] target/ppc: Increment PMC5 with inline insns
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221021170112.151393-1-leandro.lupori@eldorado.org.br>
 <20221021170112.151393-4-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221021170112.151393-4-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/21/22 14:01, Leandro Lupori wrote:
> Profiling QEMU during Fedora 35 for PPC64 boot revealed that
> 6.39% of total time was being spent in helper_insns_inc(), on a
> POWER9 machine. To avoid calling this helper every time PMCs had
> to be incremented, an inline implementation of PMC5 increment and
> check for overflow was developed. This led to a reduction of
> about 12% in Fedora's boot time.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---

Given that PMC5 is the counter that is most likely to be active, yeah,
isolating the case where PMC5 is incremented standalone makes sense.

Still, 12% performance gain is not too shaby. Not too shaby at all.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   target/ppc/helper.h     |  1 +
>   target/ppc/power8-pmu.c | 74 +++++++++++++++++++++--------------------
>   target/ppc/power8-pmu.h |  3 ++
>   target/ppc/translate.c  | 28 ++++++++++++++--
>   4 files changed, 67 insertions(+), 39 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 57eee07256..f8cd00c976 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -29,6 +29,7 @@ DEF_HELPER_2(store_mmcr1, void, env, tl)
>   DEF_HELPER_3(store_pmc, void, env, i32, i64)
>   DEF_HELPER_2(read_pmc, tl, env, i32)
>   DEF_HELPER_2(insns_inc, void, env, i32)
> +DEF_HELPER_1(handle_pmc5_overflow, void, env)
>   #endif
>   DEF_HELPER_1(check_tlb_flush_local, void, env)
>   DEF_HELPER_1(check_tlb_flush_global, void, env)
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index beeab5c494..1381072b9e 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -22,8 +22,6 @@
>   
>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>   
> -#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
> -
>   static bool pmc_has_overflow_enabled(CPUPPCState *env, int sprn)
>   {
>       if (sprn == SPR_POWER_PMC1) {
> @@ -88,49 +86,47 @@ static bool pmu_increment_insns(CPUPPCState *env, uint32_t num_insns)
>       bool overflow_triggered = false;
>       target_ulong tmp;
>   
> -    if (unlikely(ins_cnt & 0x1e)) {
> -        if (ins_cnt & (1 << 1)) {
> -            tmp = env->spr[SPR_POWER_PMC1];
> -            tmp += num_insns;
> -            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
> -                tmp = PMC_COUNTER_NEGATIVE_VAL;
> -                overflow_triggered = true;
> -            }
> -            env->spr[SPR_POWER_PMC1] = tmp;
> +    if (ins_cnt & (1 << 1)) {
> +        tmp = env->spr[SPR_POWER_PMC1];
> +        tmp += num_insns;
> +        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMC1CE)) {
> +            tmp = PMC_COUNTER_NEGATIVE_VAL;
> +            overflow_triggered = true;
>           }
> +        env->spr[SPR_POWER_PMC1] = tmp;
> +    }
>   
> -        if (ins_cnt & (1 << 2)) {
> -            tmp = env->spr[SPR_POWER_PMC2];
> -            tmp += num_insns;
> -            if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
> -                tmp = PMC_COUNTER_NEGATIVE_VAL;
> -                overflow_triggered = true;
> -            }
> -            env->spr[SPR_POWER_PMC2] = tmp;
> +    if (ins_cnt & (1 << 2)) {
> +        tmp = env->spr[SPR_POWER_PMC2];
> +        tmp += num_insns;
> +        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
> +            tmp = PMC_COUNTER_NEGATIVE_VAL;
> +            overflow_triggered = true;
> +        }
> +        env->spr[SPR_POWER_PMC2] = tmp;
> +    }
> +
> +    if (ins_cnt & (1 << 3)) {
> +        tmp = env->spr[SPR_POWER_PMC3];
> +        tmp += num_insns;
> +        if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
> +            tmp = PMC_COUNTER_NEGATIVE_VAL;
> +            overflow_triggered = true;
>           }
> +        env->spr[SPR_POWER_PMC3] = tmp;
> +    }
>   
> -        if (ins_cnt & (1 << 3)) {
> -            tmp = env->spr[SPR_POWER_PMC3];
> +    if (ins_cnt & (1 << 4)) {
> +        target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
> +        int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
> +        if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
> +            tmp = env->spr[SPR_POWER_PMC4];
>               tmp += num_insns;
>               if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
>                   tmp = PMC_COUNTER_NEGATIVE_VAL;
>                   overflow_triggered = true;
>               }
> -            env->spr[SPR_POWER_PMC3] = tmp;
> -        }
> -
> -        if (ins_cnt & (1 << 4)) {
> -            target_ulong mmcr1 = env->spr[SPR_POWER_MMCR1];
> -            int sel = extract64(mmcr1, MMCR1_PMC4EVT_EXTR, MMCR1_EVT_SIZE);
> -            if (sel == 0x02 || (env->spr[SPR_CTRL] & CTRL_RUN)) {
> -                tmp = env->spr[SPR_POWER_PMC4];
> -                tmp += num_insns;
> -                if (tmp >= PMC_COUNTER_NEGATIVE_VAL && (mmcr0 & MMCR0_PMCjCE)) {
> -                    tmp = PMC_COUNTER_NEGATIVE_VAL;
> -                    overflow_triggered = true;
> -                }
> -                env->spr[SPR_POWER_PMC4] = tmp;
> -            }
> +            env->spr[SPR_POWER_PMC4] = tmp;
>           }
>       }
>   
> @@ -310,6 +306,12 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>       raise_ebb_perfm_exception(env);
>   }
>   
> +void helper_handle_pmc5_overflow(CPUPPCState *env)
> +{
> +    env->spr[SPR_POWER_PMC5] = PMC_COUNTER_NEGATIVE_VAL;
> +    fire_PMC_interrupt(env_archcpu(env));
> +}
> +
>   /* This helper assumes that the PMC is running. */
>   void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
>   {
> diff --git a/target/ppc/power8-pmu.h b/target/ppc/power8-pmu.h
> index 9692dd765e..c0093e2219 100644
> --- a/target/ppc/power8-pmu.h
> +++ b/target/ppc/power8-pmu.h
> @@ -14,6 +14,9 @@
>   #define POWER8_PMU_H
>   
>   #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +
> +#define PMC_COUNTER_NEGATIVE_VAL 0x80000000UL
> +
>   void cpu_ppc_pmu_init(CPUPPCState *env);
>   void pmu_update_summaries(CPUPPCState *env);
>   #else
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 8fda2cf836..5c74684eee 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -36,6 +36,7 @@
>   #include "exec/log.h"
>   #include "qemu/atomic128.h"
>   #include "spr_common.h"
> +#include "power8-pmu.h"
>   
>   #include "qemu/qemu-print.h"
>   #include "qapi/error.h"
> @@ -4263,6 +4264,9 @@ static void pmu_count_insns(DisasContext *ctx)
>       }
>   
>    #if !defined(CONFIG_USER_ONLY)
> +    TCGLabel *l;
> +    TCGv t0;
> +
>       /*
>        * The PMU insns_inc() helper stops the internal PMU timer if a
>        * counter overflows happens. In that case, if the guest is
> @@ -4271,8 +4275,26 @@ static void pmu_count_insns(DisasContext *ctx)
>        */
>       gen_icount_io_start(ctx);
>   
> -    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> -#else
> +    /* Avoid helper calls when only PMC5-6 are enabled. */
> +    if (!ctx->pmc_other) {
> +        l = gen_new_label();
> +        t0 = tcg_temp_new();
> +
> +        gen_load_spr(t0, SPR_POWER_PMC5);
> +        tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
> +        gen_store_spr(SPR_POWER_PMC5, t0);
> +        /* Check for overflow, if it's enabled */
> +        if (ctx->mmcr0_pmcjce) {
> +            tcg_gen_brcondi_tl(TCG_COND_LT, t0, PMC_COUNTER_NEGATIVE_VAL, l);
> +            gen_helper_handle_pmc5_overflow(cpu_env);
> +        }
> +
> +        gen_set_label(l);
> +        tcg_temp_free(t0);
> +    } else {
> +        gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> +    }
> +  #else
>       /*
>        * User mode can read (but not write) PMC5 and start/stop
>        * the PMU via MMCR0_FC. In this case just increment
> @@ -4285,7 +4307,7 @@ static void pmu_count_insns(DisasContext *ctx)
>       gen_store_spr(SPR_POWER_PMC5, t0);
>   
>       tcg_temp_free(t0);
> -#endif /* #if !defined(CONFIG_USER_ONLY) */
> +  #endif /* #if !defined(CONFIG_USER_ONLY) */
>   }
>   #else
>   static void pmu_count_insns(DisasContext *ctx)

