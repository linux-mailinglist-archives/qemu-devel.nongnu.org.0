Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981E6920AA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:18:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUEG-0003fj-GI; Fri, 10 Feb 2023 09:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUEE-0003av-8U
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:18:18 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUEC-0006mt-Cs
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:18:17 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso8718952pju.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qMHoy+w6xtzknnqout1UYWDXl0kMszxmrVrYwvWekyc=;
 b=nVeo06o4lXAWE8yxCY+O8Bw0EjMXfdkTzCkjkmKsxfA3A3P58fzeCug3xoqdoBXBVN
 6G5xEQuXB/+Aq4lJzor97apRpUmKry8ieG+TY1LSBa892eVob4T+6LQsAe5NQ6UlRlp1
 hJ/wnlrP9L5PLnrOArliIgc/sPmsJF+TyWvJJYoYRCaiTM+xmhK5nP/6EN5nTTAh7omr
 VbkvZPIlS7JaWgJVn3SHci5AYa2KfUJSE1hO8Wg6Fo0JvrWiijyrhJHTCJJAQEw6B8du
 6US7F9P2zOmYd9roKd9gRJus9j71k0scSU3pfFmEUx/0IMLEPwHC54KLSpKNJi6rBRKL
 WOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qMHoy+w6xtzknnqout1UYWDXl0kMszxmrVrYwvWekyc=;
 b=M+zdrXGTpmSVHvWM87wME2Kv1E8eq+5p0/G+PYStzzLm86+FoGC0alu4WPvuIra/wh
 egMTWkc+3F1OhylC7nV9i7cQJVhJGcFCAWVbt3IMzc16dB6XE3BoznsC0QGNBBEJZuKU
 OGPuHmt5vqJ2JxiOKuD9z/VGys0hK3S/3vjyBjWCqvIIVlHD970SYYn69+y8Vqi1KRlW
 WD3MgC8GqV5E1iC+wLbOVNRjbYVB9XebLzjW3EiZ4LtderM1kBBmStqi2rWVqmfOwzCw
 4BlranxG4U5ReGhJCnZC6MutJoFYhegQYdD6GPCTMwrvySTlPqSUCWOwBkCFkAHC7Sd0
 eiBw==
X-Gm-Message-State: AO0yUKWKoV3XHvHweC99S+1/BHC8cmB8y4J7Wvl/q7HP8tuzAqtmW2uO
 KaBb4nbDGGEWJjln0hEuU7iQyCGsNBWiRw2doo2PFQ==
X-Google-Smtp-Source: AK7set+I1LMDy6vddGEhlWPp3NHHPBSZ2/5pre2FMDSbbeClPKHFYWoZvQOx2txKTRDEnjiDHBPQHpVglXpVig1t5tM=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1632785pjn.89.1676038694823; Fri, 10 Feb
 2023 06:18:14 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-21-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:18:03 +0000
Message-ID: <CAFEAcA-e5pPzRQebLXHwmDg+CAKiQTbyBgXB-Rnqk+VA4+H0jw@mail.gmail.com>
Subject: Re: [PATCH 20/22] target/arm: Implement the granule protection check
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place the check at the end of get_phys_addr_with_struct,
> so that we check all physical results.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 253 +++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 234 insertions(+), 19 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3205339957..8249d93326 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -32,11 +32,18 @@ typedef struct S1Translate {
>      void *out_host;
>  } S1Translate;
>
> -static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> -                                      target_ulong address,
> -                                      MMUAccessType access_type,
> -                                      GetPhysAddrResult *result,
> -                                      ARMMMUFaultInfo *fi)
> +static bool get_phys_addr_inner(CPUARMState *env, S1Translate *ptw,
> +                                target_ulong address,
> +                                MMUAccessType access_type,
> +                                GetPhysAddrResult *result,
> +                                ARMMMUFaultInfo *fi)
> +    __attribute__((nonnull));
> +
> +static bool get_phys_addr_outer(CPUARMState *env, S1Translate *ptw,
> +                                target_ulong address,
> +                                MMUAccessType access_type,
> +                                GetPhysAddrResult *result,
> +                                ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));

I find these function names confusing, and the spec doesn't seem
to use the inner/outer terminology. Maybe there are clearer names?
Failing that, we should have a comment explaining the difference.

>  /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
> @@ -193,6 +200,197 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
>      return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
>  }
>
> +static bool granule_protection_check(CPUARMState *env, uint64_t paddress,
> +                                     ARMSecuritySpace pspace,
> +                                     ARMMMUFaultInfo *fi)
> +{
> +    MemTxAttrs attrs = {
> +        .secure = true,
> +        .space = ARMSS_Root,
> +    };
> +    ARMCPU *cpu = env_archcpu(env);
> +    uint64_t gpccr = env->cp15.gpccr_el3;
> +    unsigned pps, pgs, l0gptsz, level = 0;
> +    uint64_t tableaddr, pps_mask, align, entry, index;
> +    AddressSpace *as;
> +    MemTxResult result;
> +    int gpi;
> +
> +    if (!FIELD_EX64(gpccr, GPCCR, GPC)) {
> +        return true;
> +    }
> +
> +    /*
> +     * GPC Priority 1 (R_GMGRR):
> +     * R_JWCSM: If the configuration of GPCCR_EL3 is invalid,
> +     * the access fails as GPT walk fault at level 0.
> +     */
> +
> +    /*
> +     * Configuration of PPS to a value exceeding the implemented
> +     * physical address size is invalid.
> +     */
> +    pps = FIELD_EX64(gpccr, GPCCR, PPS);
> +    if (pps > FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE)) {
> +        goto fault_walk;
> +    }
> +    pps = pamax_map[pps];
> +    pps_mask = MAKE_64BIT_MASK(0, pps);
> +
> +    switch (FIELD_EX64(gpccr, GPCCR, SH)) {
> +    case 0b10: /* outer sharable */
> +        break;
> +    case 0b00: /* non-sharable */
> +    case 0b11: /* inner sharable */
> +        /* Inner and Outer non-cacheable requires Outer sharable. */

"Shareable" with an 'e' in all these comments.

> +        if (FIELD_EX64(gpccr, GPCCR, ORGN) == 0 &&
> +            FIELD_EX64(gpccr, GPCCR, IRGN) == 0) {
> +            goto fault_walk;
> +        }
> +        break;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

