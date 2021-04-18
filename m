Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F33363756
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:37:10 +0200 (CEST)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDED-0007PR-6E
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDCf-0006Sr-EY
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:35:34 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDCc-00073M-4V
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:35:33 -0400
Received: by mail-qv1-xf34.google.com with SMTP id i11so10409478qvu.10
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDT9+yv4FglU2QePocWEWUrZOGXdmF4eFntH/fsj6j8=;
 b=nJwb0rWD6VArpwb9+5yZ97jZrtaOoyywVrWAr1g4amlY3hyIw4Asae8906ljRpgOD+
 iUmAJl/zUhiv5eHk2KkTKswwvD0a2a2r9nI4E+SBOeExN/gjhHaQht8Xs7iibec4x1Xk
 FjnmWa5TegnweKBolagVhTjmSrrrW14T+47rNum8idTy7f/d/jqx/c6YjU5GBfnf04Z9
 KVF78RPhnq8or9nvjosZzDk+IA6kEbkeC2oKB4Sfr4h0XNwMdouGFtbBvGMG6PA9XyaP
 CubVfzVdcSRMXY4mVNjIRbf4YG18CGqZmmOMqNhWfq4hzLW1Q3YFMgVK/ruRKIr0GlbL
 qymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDT9+yv4FglU2QePocWEWUrZOGXdmF4eFntH/fsj6j8=;
 b=cYDRXwkF5TS1tILxwmWwE/Fdd2gmxh/jMvDa0hjGoN3UQfdKviEGXWdwVwEWbQ4A2b
 kjzSee7IBbP+6r2QO8HTE6ZYsPWaitT8fZDMpe1qsalsP+qHWxGUIK/urhrZyqJHQMUZ
 dToon/exH269LexUWI0eZO4L/350OMvBH2pCPGzdHJF7T5Z1ffMuIY27xS6GF1lB+FWO
 051GTLwAbX/LqKqnnVz1Z6cXxjszNUF+M7LvwbVY7L3GU7RL/TDbn7NC8nfe8d0nIJe5
 LdzDZmKW0ihr3m5SJzHpBWSo13KL9sS+L5MjEIw544Cb/JbsZ/Ny/pxZ9DQ3894Rqr/6
 /+PQ==
X-Gm-Message-State: AOAM532SFNnuOFuskJ3IzCc8OwvwoYhPCt8jmbG1PG69ZfGP/jYIeMyF
 bYekomUyXt4AW7X+OBiPFtGR9w==
X-Google-Smtp-Source: ABdhPJxcCoUucX397w1vvvGj8XNlrX2+NRyOipTpT9yiVrZ9zpeodS0Coa8BhxuDMKG1q5m1+baXUQ==
X-Received: by 2002:ad4:438e:: with SMTP id s14mr18578862qvr.31.1618774528957; 
 Sun, 18 Apr 2021 12:35:28 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id x7sm2125861qkp.40.2021.04.18.12.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:35:28 -0700 (PDT)
Subject: Re: [PATCH 14/26] target/mips: Move sysemu TCG-specific code to
 tcg/sysemu/ subfolder
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <122fac14-a7cd-87c1-5217-d86d8af49cb2@linaro.org>
Date: Sun, 18 Apr 2021 12:35:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Declare cpu_mips_get_random() and update_pagemask() on local scope,

What is "local scope"?  Anyway, I don't see what this has to do with the rest 
of the code movement.


r~

> and move cp0_helper.c and mips-semi.c to the new tcg/sysemu/ folder,
> adapting the Meson machinery.
> 
> Move the opcode definitions to tcg/sysemu_helper.h.inc.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/helper.h                      | 166 +--------------------
>   target/mips/internal.h                    |   4 -
>   target/mips/tcg/tcg-internal.h            |   9 ++
>   target/mips/tcg/sysemu_helper.h.inc       | 168 ++++++++++++++++++++++
>   target/mips/{ => tcg/sysemu}/cp0_helper.c |   0
>   target/mips/{ => tcg/sysemu}/mips-semi.c  |   0
>   target/mips/meson.build                   |   5 -
>   target/mips/tcg/meson.build               |   3 +
>   target/mips/tcg/sysemu/meson.build        |   4 +
>   9 files changed, 188 insertions(+), 171 deletions(-)
>   create mode 100644 target/mips/tcg/sysemu_helper.h.inc
>   rename target/mips/{ => tcg/sysemu}/cp0_helper.c (100%)
>   rename target/mips/{ => tcg/sysemu}/mips-semi.c (100%)
>   create mode 100644 target/mips/tcg/sysemu/meson.build
> 
> diff --git a/target/mips/helper.h b/target/mips/helper.h
> index 709494445dd..bc308e5db13 100644
> --- a/target/mips/helper.h
> +++ b/target/mips/helper.h
> @@ -2,10 +2,6 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
>   DEF_HELPER_2(raise_exception, noreturn, env, i32)
>   DEF_HELPER_1(raise_exception_debug, noreturn, env)
>   
> -#ifndef CONFIG_USER_ONLY
> -DEF_HELPER_1(do_semihosting, void, env)
> -#endif
> -
>   #ifdef TARGET_MIPS64
>   DEF_HELPER_4(sdl, void, env, tl, tl, int)
>   DEF_HELPER_4(sdr, void, env, tl, tl, int)
> @@ -42,164 +38,6 @@ DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
>   
>   DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
>   
> -#ifndef CONFIG_USER_ONLY
> -/* CP0 helpers */
> -DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
> -DEF_HELPER_1(mfc0_mvpconf0, tl, env)
> -DEF_HELPER_1(mfc0_mvpconf1, tl, env)
> -DEF_HELPER_1(mftc0_vpecontrol, tl, env)
> -DEF_HELPER_1(mftc0_vpeconf0, tl, env)
> -DEF_HELPER_1(mfc0_random, tl, env)
> -DEF_HELPER_1(mfc0_tcstatus, tl, env)
> -DEF_HELPER_1(mftc0_tcstatus, tl, env)
> -DEF_HELPER_1(mfc0_tcbind, tl, env)
> -DEF_HELPER_1(mftc0_tcbind, tl, env)
> -DEF_HELPER_1(mfc0_tcrestart, tl, env)
> -DEF_HELPER_1(mftc0_tcrestart, tl, env)
> -DEF_HELPER_1(mfc0_tchalt, tl, env)
> -DEF_HELPER_1(mftc0_tchalt, tl, env)
> -DEF_HELPER_1(mfc0_tccontext, tl, env)
> -DEF_HELPER_1(mftc0_tccontext, tl, env)
> -DEF_HELPER_1(mfc0_tcschedule, tl, env)
> -DEF_HELPER_1(mftc0_tcschedule, tl, env)
> -DEF_HELPER_1(mfc0_tcschefback, tl, env)
> -DEF_HELPER_1(mftc0_tcschefback, tl, env)
> -DEF_HELPER_1(mfc0_count, tl, env)
> -DEF_HELPER_1(mfc0_saar, tl, env)
> -DEF_HELPER_1(mfhc0_saar, tl, env)
> -DEF_HELPER_1(mftc0_entryhi, tl, env)
> -DEF_HELPER_1(mftc0_status, tl, env)
> -DEF_HELPER_1(mftc0_cause, tl, env)
> -DEF_HELPER_1(mftc0_epc, tl, env)
> -DEF_HELPER_1(mftc0_ebase, tl, env)
> -DEF_HELPER_2(mftc0_configx, tl, env, tl)
> -DEF_HELPER_1(mfc0_lladdr, tl, env)
> -DEF_HELPER_1(mfc0_maar, tl, env)
> -DEF_HELPER_1(mfhc0_maar, tl, env)
> -DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
> -DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
> -DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
> -DEF_HELPER_1(mfc0_debug, tl, env)
> -DEF_HELPER_1(mftc0_debug, tl, env)
> -#ifdef TARGET_MIPS64
> -DEF_HELPER_1(dmfc0_tcrestart, tl, env)
> -DEF_HELPER_1(dmfc0_tchalt, tl, env)
> -DEF_HELPER_1(dmfc0_tccontext, tl, env)
> -DEF_HELPER_1(dmfc0_tcschedule, tl, env)
> -DEF_HELPER_1(dmfc0_tcschefback, tl, env)
> -DEF_HELPER_1(dmfc0_lladdr, tl, env)
> -DEF_HELPER_1(dmfc0_maar, tl, env)
> -DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
> -DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
> -DEF_HELPER_1(dmfc0_saar, tl, env)
> -#endif /* TARGET_MIPS64 */
> -
> -DEF_HELPER_2(mtc0_index, void, env, tl)
> -DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
> -DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
> -DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
> -DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
> -DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
> -DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
> -DEF_HELPER_2(mtc0_yqmask, void, env, tl)
> -DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
> -DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
> -DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
> -DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
> -DEF_HELPER_2(mtc0_tcbind, void, env, tl)
> -DEF_HELPER_2(mttc0_tcbind, void, env, tl)
> -DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
> -DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
> -DEF_HELPER_2(mtc0_tchalt, void, env, tl)
> -DEF_HELPER_2(mttc0_tchalt, void, env, tl)
> -DEF_HELPER_2(mtc0_tccontext, void, env, tl)
> -DEF_HELPER_2(mttc0_tccontext, void, env, tl)
> -DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
> -DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
> -DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
> -DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
> -DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
> -DEF_HELPER_2(mtc0_context, void, env, tl)
> -DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
> -DEF_HELPER_2(mtc0_pagemask, void, env, tl)
> -DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
> -DEF_HELPER_2(mtc0_segctl0, void, env, tl)
> -DEF_HELPER_2(mtc0_segctl1, void, env, tl)
> -DEF_HELPER_2(mtc0_segctl2, void, env, tl)
> -DEF_HELPER_2(mtc0_pwfield, void, env, tl)
> -DEF_HELPER_2(mtc0_pwsize, void, env, tl)
> -DEF_HELPER_2(mtc0_wired, void, env, tl)
> -DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
> -DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
> -DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
> -DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
> -DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
> -DEF_HELPER_2(mtc0_hwrena, void, env, tl)
> -DEF_HELPER_2(mtc0_pwctl, void, env, tl)
> -DEF_HELPER_2(mtc0_count, void, env, tl)
> -DEF_HELPER_2(mtc0_saari, void, env, tl)
> -DEF_HELPER_2(mtc0_saar, void, env, tl)
> -DEF_HELPER_2(mthc0_saar, void, env, tl)
> -DEF_HELPER_2(mtc0_entryhi, void, env, tl)
> -DEF_HELPER_2(mttc0_entryhi, void, env, tl)
> -DEF_HELPER_2(mtc0_compare, void, env, tl)
> -DEF_HELPER_2(mtc0_status, void, env, tl)
> -DEF_HELPER_2(mttc0_status, void, env, tl)
> -DEF_HELPER_2(mtc0_intctl, void, env, tl)
> -DEF_HELPER_2(mtc0_srsctl, void, env, tl)
> -DEF_HELPER_2(mtc0_cause, void, env, tl)
> -DEF_HELPER_2(mttc0_cause, void, env, tl)
> -DEF_HELPER_2(mtc0_ebase, void, env, tl)
> -DEF_HELPER_2(mttc0_ebase, void, env, tl)
> -DEF_HELPER_2(mtc0_config0, void, env, tl)
> -DEF_HELPER_2(mtc0_config2, void, env, tl)
> -DEF_HELPER_2(mtc0_config3, void, env, tl)
> -DEF_HELPER_2(mtc0_config4, void, env, tl)
> -DEF_HELPER_2(mtc0_config5, void, env, tl)
> -DEF_HELPER_2(mtc0_lladdr, void, env, tl)
> -DEF_HELPER_2(mtc0_maar, void, env, tl)
> -DEF_HELPER_2(mthc0_maar, void, env, tl)
> -DEF_HELPER_2(mtc0_maari, void, env, tl)
> -DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
> -DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
> -DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
> -DEF_HELPER_2(mtc0_xcontext, void, env, tl)
> -DEF_HELPER_2(mtc0_framemask, void, env, tl)
> -DEF_HELPER_2(mtc0_debug, void, env, tl)
> -DEF_HELPER_2(mttc0_debug, void, env, tl)
> -DEF_HELPER_2(mtc0_performance0, void, env, tl)
> -DEF_HELPER_2(mtc0_errctl, void, env, tl)
> -DEF_HELPER_2(mtc0_taglo, void, env, tl)
> -DEF_HELPER_2(mtc0_datalo, void, env, tl)
> -DEF_HELPER_2(mtc0_taghi, void, env, tl)
> -DEF_HELPER_2(mtc0_datahi, void, env, tl)
> -
> -#if defined(TARGET_MIPS64)
> -DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
> -DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
> -#endif
> -
> -/* MIPS MT functions */
> -DEF_HELPER_2(mftgpr, tl, env, i32)
> -DEF_HELPER_2(mftlo, tl, env, i32)
> -DEF_HELPER_2(mfthi, tl, env, i32)
> -DEF_HELPER_2(mftacx, tl, env, i32)
> -DEF_HELPER_1(mftdsp, tl, env)
> -DEF_HELPER_3(mttgpr, void, env, tl, i32)
> -DEF_HELPER_3(mttlo, void, env, tl, i32)
> -DEF_HELPER_3(mtthi, void, env, tl, i32)
> -DEF_HELPER_3(mttacx, void, env, tl, i32)
> -DEF_HELPER_2(mttdsp, void, env, tl)
> -DEF_HELPER_0(dmt, tl)
> -DEF_HELPER_0(emt, tl)
> -DEF_HELPER_1(dvpe, tl, env)
> -DEF_HELPER_1(evpe, tl, env)
> -
> -/* R6 Multi-threading */
> -DEF_HELPER_1(dvp, tl, env)
> -DEF_HELPER_1(evp, tl, env)
> -#endif /* !CONFIG_USER_ONLY */
> -
>   /* microMIPS functions */
>   DEF_HELPER_4(lwm, void, env, tl, tl, i32)
>   DEF_HELPER_4(swm, void, env, tl, tl, i32)
> @@ -783,4 +621,8 @@ DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
>   
>   DEF_HELPER_3(cache, void, env, tl, i32)
>   
> +#ifndef CONFIG_USER_ONLY
> +#include "tcg/sysemu_helper.h.inc"
> +#endif /* !CONFIG_USER_ONLY */
> +
>   #include "msa_helper.h.inc"
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index 51a45bd397a..59c2c22cd0a 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -165,7 +165,6 @@ void r4k_helper_tlbr(CPUMIPSState *env);
>   void r4k_helper_tlbinv(CPUMIPSState *env);
>   void r4k_helper_tlbinvf(CPUMIPSState *env);
>   void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
> -uint32_t cpu_mips_get_random(CPUMIPSState *env);
>   
>   void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       vaddr addr, unsigned size,
> @@ -237,9 +236,6 @@ void cpu_mips_stop_count(CPUMIPSState *env);
>   /* helper.c */
>   void mmu_init(CPUMIPSState *env, const mips_def_t *def);
>   
> -/* op_helper.c */
> -void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
> -
>   static inline void restore_pamask(CPUMIPSState *env)
>   {
>       if (env->hflags & MIPS_HFLAG_ELPA) {
> diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
> index 24438667f47..b65580af211 100644
> --- a/target/mips/tcg/tcg-internal.h
> +++ b/target/mips/tcg/tcg-internal.h
> @@ -11,10 +11,19 @@
>   #define MIPS_TCG_INTERNAL_H
>   
>   #include "hw/core/cpu.h"
> +#include "cpu.h"
>   
>   void mips_cpu_do_interrupt(CPUState *cpu);
>   bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
>   
> +#if !defined(CONFIG_USER_ONLY)
> +
> +void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
> +
> +uint32_t cpu_mips_get_random(CPUMIPSState *env);
> +
> +#endif /* !CONFIG_USER_ONLY */
> +
>   #endif
> diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
> new file mode 100644
> index 00000000000..d136c4160a7
> --- /dev/null
> +++ b/target/mips/tcg/sysemu_helper.h.inc
> @@ -0,0 +1,168 @@
> +/*
> + *  QEMU MIPS sysemu helpers
> + *
> + *  Copyright (c) 2004-2005 Jocelyn Mayer
> + *  Copyright (c) 2006 Marius Groeger (FPU operations)
> + *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
> + *  Copyright (c) 2009 CodeSourcery (MIPS16 and microMIPS support)
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +DEF_HELPER_1(do_semihosting, void, env)
> +
> +/* CP0 helpers */
> +DEF_HELPER_1(mfc0_mvpcontrol, tl, env)
> +DEF_HELPER_1(mfc0_mvpconf0, tl, env)
> +DEF_HELPER_1(mfc0_mvpconf1, tl, env)
> +DEF_HELPER_1(mftc0_vpecontrol, tl, env)
> +DEF_HELPER_1(mftc0_vpeconf0, tl, env)
> +DEF_HELPER_1(mfc0_random, tl, env)
> +DEF_HELPER_1(mfc0_tcstatus, tl, env)
> +DEF_HELPER_1(mftc0_tcstatus, tl, env)
> +DEF_HELPER_1(mfc0_tcbind, tl, env)
> +DEF_HELPER_1(mftc0_tcbind, tl, env)
> +DEF_HELPER_1(mfc0_tcrestart, tl, env)
> +DEF_HELPER_1(mftc0_tcrestart, tl, env)
> +DEF_HELPER_1(mfc0_tchalt, tl, env)
> +DEF_HELPER_1(mftc0_tchalt, tl, env)
> +DEF_HELPER_1(mfc0_tccontext, tl, env)
> +DEF_HELPER_1(mftc0_tccontext, tl, env)
> +DEF_HELPER_1(mfc0_tcschedule, tl, env)
> +DEF_HELPER_1(mftc0_tcschedule, tl, env)
> +DEF_HELPER_1(mfc0_tcschefback, tl, env)
> +DEF_HELPER_1(mftc0_tcschefback, tl, env)
> +DEF_HELPER_1(mfc0_count, tl, env)
> +DEF_HELPER_1(mfc0_saar, tl, env)
> +DEF_HELPER_1(mfhc0_saar, tl, env)
> +DEF_HELPER_1(mftc0_entryhi, tl, env)
> +DEF_HELPER_1(mftc0_status, tl, env)
> +DEF_HELPER_1(mftc0_cause, tl, env)
> +DEF_HELPER_1(mftc0_epc, tl, env)
> +DEF_HELPER_1(mftc0_ebase, tl, env)
> +DEF_HELPER_2(mftc0_configx, tl, env, tl)
> +DEF_HELPER_1(mfc0_lladdr, tl, env)
> +DEF_HELPER_1(mfc0_maar, tl, env)
> +DEF_HELPER_1(mfhc0_maar, tl, env)
> +DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
> +DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
> +DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
> +DEF_HELPER_1(mfc0_debug, tl, env)
> +DEF_HELPER_1(mftc0_debug, tl, env)
> +#ifdef TARGET_MIPS64
> +DEF_HELPER_1(dmfc0_tcrestart, tl, env)
> +DEF_HELPER_1(dmfc0_tchalt, tl, env)
> +DEF_HELPER_1(dmfc0_tccontext, tl, env)
> +DEF_HELPER_1(dmfc0_tcschedule, tl, env)
> +DEF_HELPER_1(dmfc0_tcschefback, tl, env)
> +DEF_HELPER_1(dmfc0_lladdr, tl, env)
> +DEF_HELPER_1(dmfc0_maar, tl, env)
> +DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
> +DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
> +DEF_HELPER_1(dmfc0_saar, tl, env)
> +#endif /* TARGET_MIPS64 */
> +
> +DEF_HELPER_2(mtc0_index, void, env, tl)
> +DEF_HELPER_2(mtc0_mvpcontrol, void, env, tl)
> +DEF_HELPER_2(mtc0_vpecontrol, void, env, tl)
> +DEF_HELPER_2(mttc0_vpecontrol, void, env, tl)
> +DEF_HELPER_2(mtc0_vpeconf0, void, env, tl)
> +DEF_HELPER_2(mttc0_vpeconf0, void, env, tl)
> +DEF_HELPER_2(mtc0_vpeconf1, void, env, tl)
> +DEF_HELPER_2(mtc0_yqmask, void, env, tl)
> +DEF_HELPER_2(mtc0_vpeopt, void, env, tl)
> +DEF_HELPER_2(mtc0_entrylo0, void, env, tl)
> +DEF_HELPER_2(mtc0_tcstatus, void, env, tl)
> +DEF_HELPER_2(mttc0_tcstatus, void, env, tl)
> +DEF_HELPER_2(mtc0_tcbind, void, env, tl)
> +DEF_HELPER_2(mttc0_tcbind, void, env, tl)
> +DEF_HELPER_2(mtc0_tcrestart, void, env, tl)
> +DEF_HELPER_2(mttc0_tcrestart, void, env, tl)
> +DEF_HELPER_2(mtc0_tchalt, void, env, tl)
> +DEF_HELPER_2(mttc0_tchalt, void, env, tl)
> +DEF_HELPER_2(mtc0_tccontext, void, env, tl)
> +DEF_HELPER_2(mttc0_tccontext, void, env, tl)
> +DEF_HELPER_2(mtc0_tcschedule, void, env, tl)
> +DEF_HELPER_2(mttc0_tcschedule, void, env, tl)
> +DEF_HELPER_2(mtc0_tcschefback, void, env, tl)
> +DEF_HELPER_2(mttc0_tcschefback, void, env, tl)
> +DEF_HELPER_2(mtc0_entrylo1, void, env, tl)
> +DEF_HELPER_2(mtc0_context, void, env, tl)
> +DEF_HELPER_2(mtc0_memorymapid, void, env, tl)
> +DEF_HELPER_2(mtc0_pagemask, void, env, tl)
> +DEF_HELPER_2(mtc0_pagegrain, void, env, tl)
> +DEF_HELPER_2(mtc0_segctl0, void, env, tl)
> +DEF_HELPER_2(mtc0_segctl1, void, env, tl)
> +DEF_HELPER_2(mtc0_segctl2, void, env, tl)
> +DEF_HELPER_2(mtc0_pwfield, void, env, tl)
> +DEF_HELPER_2(mtc0_pwsize, void, env, tl)
> +DEF_HELPER_2(mtc0_wired, void, env, tl)
> +DEF_HELPER_2(mtc0_srsconf0, void, env, tl)
> +DEF_HELPER_2(mtc0_srsconf1, void, env, tl)
> +DEF_HELPER_2(mtc0_srsconf2, void, env, tl)
> +DEF_HELPER_2(mtc0_srsconf3, void, env, tl)
> +DEF_HELPER_2(mtc0_srsconf4, void, env, tl)
> +DEF_HELPER_2(mtc0_hwrena, void, env, tl)
> +DEF_HELPER_2(mtc0_pwctl, void, env, tl)
> +DEF_HELPER_2(mtc0_count, void, env, tl)
> +DEF_HELPER_2(mtc0_saari, void, env, tl)
> +DEF_HELPER_2(mtc0_saar, void, env, tl)
> +DEF_HELPER_2(mthc0_saar, void, env, tl)
> +DEF_HELPER_2(mtc0_entryhi, void, env, tl)
> +DEF_HELPER_2(mttc0_entryhi, void, env, tl)
> +DEF_HELPER_2(mtc0_compare, void, env, tl)
> +DEF_HELPER_2(mtc0_status, void, env, tl)
> +DEF_HELPER_2(mttc0_status, void, env, tl)
> +DEF_HELPER_2(mtc0_intctl, void, env, tl)
> +DEF_HELPER_2(mtc0_srsctl, void, env, tl)
> +DEF_HELPER_2(mtc0_cause, void, env, tl)
> +DEF_HELPER_2(mttc0_cause, void, env, tl)
> +DEF_HELPER_2(mtc0_ebase, void, env, tl)
> +DEF_HELPER_2(mttc0_ebase, void, env, tl)
> +DEF_HELPER_2(mtc0_config0, void, env, tl)
> +DEF_HELPER_2(mtc0_config2, void, env, tl)
> +DEF_HELPER_2(mtc0_config3, void, env, tl)
> +DEF_HELPER_2(mtc0_config4, void, env, tl)
> +DEF_HELPER_2(mtc0_config5, void, env, tl)
> +DEF_HELPER_2(mtc0_lladdr, void, env, tl)
> +DEF_HELPER_2(mtc0_maar, void, env, tl)
> +DEF_HELPER_2(mthc0_maar, void, env, tl)
> +DEF_HELPER_2(mtc0_maari, void, env, tl)
> +DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
> +DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
> +DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
> +DEF_HELPER_2(mtc0_xcontext, void, env, tl)
> +DEF_HELPER_2(mtc0_framemask, void, env, tl)
> +DEF_HELPER_2(mtc0_debug, void, env, tl)
> +DEF_HELPER_2(mttc0_debug, void, env, tl)
> +DEF_HELPER_2(mtc0_performance0, void, env, tl)
> +DEF_HELPER_2(mtc0_errctl, void, env, tl)
> +DEF_HELPER_2(mtc0_taglo, void, env, tl)
> +DEF_HELPER_2(mtc0_datalo, void, env, tl)
> +DEF_HELPER_2(mtc0_taghi, void, env, tl)
> +DEF_HELPER_2(mtc0_datahi, void, env, tl)
> +
> +#if defined(TARGET_MIPS64)
> +DEF_HELPER_2(dmtc0_entrylo0, void, env, i64)
> +DEF_HELPER_2(dmtc0_entrylo1, void, env, i64)
> +#endif
> +
> +/* MIPS MT functions */
> +DEF_HELPER_2(mftgpr, tl, env, i32)
> +DEF_HELPER_2(mftlo, tl, env, i32)
> +DEF_HELPER_2(mfthi, tl, env, i32)
> +DEF_HELPER_2(mftacx, tl, env, i32)
> +DEF_HELPER_1(mftdsp, tl, env)
> +DEF_HELPER_3(mttgpr, void, env, tl, i32)
> +DEF_HELPER_3(mttlo, void, env, tl, i32)
> +DEF_HELPER_3(mtthi, void, env, tl, i32)
> +DEF_HELPER_3(mttacx, void, env, tl, i32)
> +DEF_HELPER_2(mttdsp, void, env, tl)
> +DEF_HELPER_0(dmt, tl)
> +DEF_HELPER_0(emt, tl)
> +DEF_HELPER_1(dvpe, tl, env)
> +DEF_HELPER_1(evpe, tl, env)
> +
> +/* R6 Multi-threading */
> +DEF_HELPER_1(dvp, tl, env)
> +DEF_HELPER_1(evp, tl, env)
> diff --git a/target/mips/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
> similarity index 100%
> rename from target/mips/cp0_helper.c
> rename to target/mips/tcg/sysemu/cp0_helper.c
> diff --git a/target/mips/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> similarity index 100%
> rename from target/mips/mips-semi.c
> rename to target/mips/tcg/sysemu/mips-semi.c
> diff --git a/target/mips/meson.build b/target/mips/meson.build
> index 9a507937ece..a55af1cd6cf 100644
> --- a/target/mips/meson.build
> +++ b/target/mips/meson.build
> @@ -47,11 +47,6 @@
>   
>   mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>   
> -mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
> -  'cp0_helper.c',
> -  'mips-semi.c',
> -))
> -
>   mips_ss.add_all(when: 'CONFIG_TCG', if_true: [mips_tcg_ss])
>   
>   target_arch += {'mips': mips_ss}
> diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
> index b74fa04303e..2cffc5a5ac6 100644
> --- a/target/mips/tcg/meson.build
> +++ b/target/mips/tcg/meson.build
> @@ -1,3 +1,6 @@
>   if have_user
>     subdir('user')
>   endif
> +if have_system
> +  subdir('sysemu')
> +endif
> diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
> new file mode 100644
> index 00000000000..5c3024e7760
> --- /dev/null
> +++ b/target/mips/tcg/sysemu/meson.build
> @@ -0,0 +1,4 @@
> +mips_softmmu_ss.add(files(
> +  'cp0_helper.c',
> +  'mips-semi.c',
> +))
> 


