Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9257558D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 21:00:57 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC452-0003rI-Br
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC3tJ-00063R-KE; Thu, 14 Jul 2022 14:48:49 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:40581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC3tE-0006J5-FW; Thu, 14 Jul 2022 14:48:49 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso3528552fac.7; 
 Thu, 14 Jul 2022 11:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EhdZ5Y1nFDguuYDbAh5wmhdEp7LyuFyJVPCmLSdcrh0=;
 b=bqMuNPS4ATQKlfHo1rVwPDQMrOCZ4ScL+By1rmybuSdXVb2vBR75FWT7PBAbY7UDUa
 avCdq4AXU4SDgq12EmjS65w7uo/UTKtL3/D9hfF2wYWY+zGID5FhL2RGKzKyIWBmI1SK
 yEthrwwxVLqAZxcTxuwfNWjJCeA1z5Gt3mfcOB6hlPCE6QJZEMBkyjnGdTe4Wge9Ipex
 j6SXZxxmH3l/afjIUnGPn9nNW1m3UvavlgUXcTrSkXI+Dh+pUI0+C/PgaIXKwl99+IwC
 gRTcevx0YEryXT/FdzEEk9wkMkiamfq+gGwLsMr2cUlJcP+uPUVE08x1iu3nt+kUflNH
 Ln1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EhdZ5Y1nFDguuYDbAh5wmhdEp7LyuFyJVPCmLSdcrh0=;
 b=mGTMZ695E39UDJg0G0GRXAf7G+swWcX/ubvG6a/k6jlmPkEWrVR6PH5T/JymXBGWqA
 rgyyA5v4R0T58PSk7zAYjazquQ+c1AOUJrMyiDbEDSxg345iK4+LadgjHJOXEIbtymu7
 WNt+cpuj13gy+9Nv+z0RFa9JpmfTFj+J6dMDI77S6jX6UfQPUfYPVLpGEzSNHRCuyQcD
 j5gfXZEjst11qbrV2aTJdAm3FKNXUVYVfxAt5KyUK3Hw9k3Uf+hNqkyTTSux30iOy8Jg
 2NwXD2gH35kWAJX24MJCVt/LKjlYCLp44aJ0cfU9bQ3zHvgv3vzW7TuvHBirpvTFccbn
 XrVg==
X-Gm-Message-State: AJIora9C4ji9J48hu67NZ9i0OCx7oI/XiwR/ry+bkP+IcVx2sJ5fpuhr
 YvaxVyV4X98m1zUskCjajX8=
X-Google-Smtp-Source: AGRyM1sPHM2nZdoMkA2s4MV0qVOPpkCY2yVlNZWpDnVAUBCNJv37Yym1Foz7IOMXPedWoLyRXjdqRQ==
X-Received: by 2002:a05:6870:d0ce:b0:f3:3856:f552 with SMTP id
 k14-20020a056870d0ce00b000f33856f552mr5578124oaa.99.1657824522721; 
 Thu, 14 Jul 2022 11:48:42 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 q204-20020aca43d5000000b003351fa55a58sm924026oia.16.2022.07.14.11.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 11:48:41 -0700 (PDT)
Message-ID: <e23d167e-2a2e-5f85-1042-119c1c12803a@gmail.com>
Date: Thu, 14 Jul 2022 15:48:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/2] target/ppc: Implement ISA 3.00 tlbie[l]
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, richard.henderson@linaro.org
References: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
 <20220712193741.59134-3-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712193741.59134-3-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/12/22 16:37, Leandro Lupori wrote:
> This initial version supports the invalidation of one or all
> TLB entries. Flush by PID/LPID, or based in process/partition
> scope is not supported, because it would make using the
> generic QEMU TLB implementation hard. In these cases, all
> entries are flushed.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   target/ppc/helper.h                          |   2 +
>   target/ppc/mmu-book3s-v3.h                   |  15 ++
>   target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
>   target/ppc/translate/storage-ctrl-impl.c.inc |  17 ++
>   4 files changed, 188 insertions(+)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index d627cfe6ed..90d16f00e7 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -672,6 +672,8 @@ DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
>   DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
>   DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
>   #if defined(TARGET_PPC64)
> +DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
> +        env, tl, tl, i32)
>   DEF_HELPER_FLAGS_3(store_slb, TCG_CALL_NO_RWG, void, env, tl, tl)
>   DEF_HELPER_2(load_slb_esid, tl, env, tl)
>   DEF_HELPER_2(load_slb_vsid, tl, env, tl)
> diff --git a/target/ppc/mmu-book3s-v3.h b/target/ppc/mmu-book3s-v3.h
> index d6d5ed8f8e..674377a19e 100644
> --- a/target/ppc/mmu-book3s-v3.h
> +++ b/target/ppc/mmu-book3s-v3.h
> @@ -50,6 +50,21 @@ struct prtb_entry {
>   
>   #ifdef TARGET_PPC64
>   
> +/*
> + * tlbie[l] helper flags
> + *
> + * RIC, PRS, R and local are passed as flags in the last argument.
> + */
> +#define TLBIE_F_RIC_SHIFT       0
> +#define TLBIE_F_PRS_SHIFT       2
> +#define TLBIE_F_R_SHIFT         3
> +#define TLBIE_F_LOCAL_SHIFT     4
> +
> +#define TLBIE_F_RIC_MASK        (3 << TLBIE_F_RIC_SHIFT)
> +#define TLBIE_F_PRS             (1 << TLBIE_F_PRS_SHIFT)
> +#define TLBIE_F_R               (1 << TLBIE_F_R_SHIFT)
> +#define TLBIE_F_LOCAL           (1 << TLBIE_F_LOCAL_SHIFT)
> +
>   static inline bool ppc64_use_proc_tbl(PowerPCCPU *cpu)
>   {
>       return !!(cpu->env.spr[SPR_LPCR] & LPCR_UPRT);
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 15239dc95b..b881aee23f 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -429,6 +429,160 @@ void helper_tlbie(CPUPPCState *env, target_ulong addr)
>       ppc_tlb_invalidate_one(env, addr);
>   }
>   
> +#if defined(TARGET_PPC64)
> +
> +/* Invalidation Selector */
> +#define TLBIE_IS_VA         0
> +#define TLBIE_IS_PID        1
> +#define TLBIE_IS_LPID       2
> +#define TLBIE_IS_ALL        3
> +
> +/* Radix Invalidation Control */
> +#define TLBIE_RIC_TLB       0
> +#define TLBIE_RIC_PWC       1
> +#define TLBIE_RIC_ALL       2
> +#define TLBIE_RIC_GRP       3
> +
> +/* Radix Actual Page sizes */
> +#define TLBIE_R_AP_4K       0
> +#define TLBIE_R_AP_64K      5
> +#define TLBIE_R_AP_2M       1
> +#define TLBIE_R_AP_1G       2
> +
> +/* RB field masks */
> +#define TLBIE_RB_EPN_MASK   PPC_BITMASK(0, 51)
> +#define TLBIE_RB_IS_MASK    PPC_BITMASK(52, 53)
> +#define TLBIE_RB_AP_MASK    PPC_BITMASK(56, 58)
> +
> +void helper_tlbie_isa300(CPUPPCState *env, target_ulong rb, target_ulong rs,
> +                         uint32_t flags)
> +{
> +    unsigned ric = (flags & TLBIE_F_RIC_MASK) >> TLBIE_F_RIC_SHIFT;
> +    /*
> +     * With the exception of the checks for invalid instruction forms,
> +     * PRS is currently ignored, because we don't know if a given TLB entry
> +     * is process or partition scoped.
> +     */
> +    bool prs = flags & TLBIE_F_PRS;
> +    bool r = flags & TLBIE_F_R;
> +    bool local = flags & TLBIE_F_LOCAL;
> +    bool effR;
> +    unsigned is = extract64(rb, PPC_BIT_NR(53), 2), set;
> +    unsigned ap;        /* actual page size */
> +    target_ulong addr, pgoffs_mask;
> +
> +    qemu_log_mask(CPU_LOG_MMU,
> +        "%s: local=%d addr=" TARGET_FMT_lx " ric=%u prs=%d r=%d is=%u\n",
> +        __func__, local, rb & TARGET_PAGE_MASK, ric, prs, r, is);
> +
> +    effR = FIELD_EX64(env->msr, MSR, HV) ? r : env->spr[SPR_LPCR] & LPCR_HR;
> +
> +    /* Partial TLB invalidation is supported for Radix only for now. */
> +    if (!effR) {
> +        goto inval_all;
> +    }
> +
> +    /* Check for invalid instruction forms (effR=1). */
> +    if (unlikely(ric == TLBIE_RIC_GRP ||
> +                 ((ric == TLBIE_RIC_PWC || ric == TLBIE_RIC_ALL) &&
> +                                           is == TLBIE_IS_VA) ||
> +                 (!prs && is == TLBIE_IS_PID))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: invalid instruction form: ric=%u prs=%d r=%d is=%u\n",
> +            __func__, ric, prs, r, is);
> +        goto invalid;
> +    }
> +
> +    /* We don't cache Page Walks. */
> +    if (ric == TLBIE_RIC_PWC) {
> +        if (local) {
> +            set = extract64(rb, PPC_BIT_NR(51), 12);
> +            if (set != 0) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid set: %d\n",
> +                              __func__, set);
> +                goto invalid;
> +            }
> +        }
> +        return;
> +    }
> +
> +    /*
> +     * Invalidation by LPID or PID is not supported, so fallback
> +     * to full TLB flush in these cases.
> +     */
> +    if (is != TLBIE_IS_VA) {
> +        goto inval_all;
> +    }
> +
> +    /*
> +     * The results of an attempt to invalidate a translation outside of
> +     * quadrant 0 for Radix Tree translation (effR=1, RIC=0, PRS=1, IS=0,
> +     * and EA 0:1 != 0b00) are boundedly undefined.
> +     */
> +    if (unlikely(ric == TLBIE_RIC_TLB && prs && is == TLBIE_IS_VA &&
> +                 (rb & R_EADDR_QUADRANT) != R_EADDR_QUADRANT0)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "%s: attempt to invalidate a translation outside of quadrant 0\n",
> +            __func__);
> +        goto inval_all;
> +    }
> +
> +    assert(is == TLBIE_IS_VA);
> +    assert(ric == TLBIE_RIC_TLB || ric == TLBIE_RIC_ALL);
> +
> +    ap = extract64(rb, PPC_BIT_NR(58), 3);
> +    switch (ap) {
> +    case TLBIE_R_AP_4K:
> +        pgoffs_mask = 0xfffull;
> +        break;
> +
> +    case TLBIE_R_AP_64K:
> +        pgoffs_mask = 0xffffull;
> +        break;
> +
> +    case TLBIE_R_AP_2M:
> +        pgoffs_mask = 0x1fffffull;
> +        break;
> +
> +    case TLBIE_R_AP_1G:
> +        pgoffs_mask = 0x3fffffffull;
> +        break;
> +
> +    default:
> +        /*
> +         * If the value specified in RS 0:31, RS 32:63, RB 54:55, RB 56:58,
> +         * RB 44:51, or RB 56:63, when it is needed to perform the specified
> +         * operation, is not supported by the implementation, the instruction
> +         * is treated as if the instruction form were invalid.
> +         */
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid AP: %d\n", __func__, ap);
> +        goto invalid;
> +    }
> +
> +    addr = rb & TLBIE_RB_EPN_MASK & ~pgoffs_mask;
> +
> +    if (local) {
> +        tlb_flush_page(env_cpu(env), addr);
> +    } else {
> +        tlb_flush_page_all_cpus(env_cpu(env), addr);
> +    }
> +    return;
> +
> +inval_all:
> +    env->tlb_need_flush |= TLB_NEED_LOCAL_FLUSH;
> +    if (!local) {
> +        env->tlb_need_flush |= TLB_NEED_GLOBAL_FLUSH;
> +    }
> +    return;
> +
> +invalid:
> +    raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
> +                           POWERPC_EXCP_INVAL |
> +                           POWERPC_EXCP_INVAL_INVAL, GETPC());
> +}
> +
> +#endif
> +
>   void helper_tlbiva(CPUPPCState *env, target_ulong addr)
>   {
>       /* tlbiva instruction only exists on BookE */
> diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
> index 7793297dd4..467c390888 100644
> --- a/target/ppc/translate/storage-ctrl-impl.c.inc
> +++ b/target/ppc/translate/storage-ctrl-impl.c.inc
> @@ -21,6 +21,8 @@
>    * Store Control Instructions
>    */
>   
> +#include "mmu-book3s-v3.h"
> +
>   static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
>   {
>   #if defined(CONFIG_USER_ONLY)
> @@ -65,6 +67,21 @@ static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
>           tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
>           gen_helper_tlbie(cpu_env, t0);
>           tcg_temp_free(t0);
> +
> +#if defined(TARGET_PPC64)
> +    /*
> +     * ISA 3.1B says that MSR SF must be 1 when this instruction is executed;
> +     * otherwise the results are undefined.
> +     */
> +    } else if (a->r) {
> +        gen_helper_tlbie_isa300(cpu_env, cpu_gpr[rb], cpu_gpr[a->rs],
> +                tcg_constant_i32(a->ric << TLBIE_F_RIC_SHIFT |
> +                                 a->prs << TLBIE_F_PRS_SHIFT |
> +                                 a->r << TLBIE_F_R_SHIFT |
> +                                 local << TLBIE_F_LOCAL_SHIFT));
> +        return true;
> +#endif
> +
>       } else {
>           gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
>       }

