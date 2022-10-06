Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849A5F6A27
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:59:51 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSLm-0002UT-79
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSJU-0007SQ-Uo
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:57:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSJS-0002K6-88
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:57:28 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so905435pjl.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h+tUr/9l1CJj5Pt5bJRVxccYDsGjcFlBvCJJg7EqzJg=;
 b=QcK2fjEp5hrd3mGPXgQ4zwna9hDFWxUXWQ2YFsU9XHCEi/c94gz6VUPfO1tgvNGNGj
 CFCvkdVY4xUxg4/h0gvcR3c9D8sFtrK+6u7VmpkKPvtjOP929/LjSsQAynHVIrc7LD5C
 t3QttCji/dzwa2ztdqBWS7wmOjMXaLh6rjNBDsGx1/fNTo89WKTj8hk1exwgV0jozb1Z
 eFLVGWwdYVNUjQhc9N3uJvkxbI3xqQLVvAFqyBYnH5WX3d49Z/SW3Q17pKJWuc0vRxau
 GUFTuwZNAd++lwD7eebTDN6otf0hkDo91FwpOmyGSi8KF/1fdLpdy+kCwUmGT/VyexCn
 /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h+tUr/9l1CJj5Pt5bJRVxccYDsGjcFlBvCJJg7EqzJg=;
 b=zb4KrzkXoZd0M3eEw6VZDiFxsWTmi2dtw9Yarbm4tXUA83yJ/5BSyPeRW5uYFEHYdE
 jbJQhFLsHr9bWHSd6Yj47SWKQCfI0cts8DcPaIQt5WZMcslPAGY5Y/gf3PH3RxbLDwEZ
 AyO13hKP/MrHr3nKxVKhvkpGxDpA2dvBDdeaso/Sywn1Gzujaj3ZxOnojF4iPQzawePp
 KIPi+hYqybtDWqZEsLHAgbBrF+6kQYrw+tiQ3IWCj4fz2SBuqw8QNOuEA3URYXUGp4Ht
 ysGLlwgu6k5bllqHluFXIkqHQGgEDzGcbsB5JHQf/YHLZSjP1PACUSEzXHC3Ocp83lTt
 DhxQ==
X-Gm-Message-State: ACrzQf0vS+gittwZe1K98FwBotDaWopYELE4l8day31iy0M/gDf6JXex
 kQewh/JfQLacSHxtw2Fwzt/2pMXx3dyqSNcTEWOMJg==
X-Google-Smtp-Source: AMsMyM7PVTZQwYzbe1IoyXblulABNjGYNs+DPfbKhxX2SieBFvxXbBvkJhQIxyuZQtx6Op4u4Jf/BJCro2LGdLBe9Ag=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr5092882plb.60.1665068244700; Thu, 06
 Oct 2022 07:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-24-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:57:13 +0100
Message-ID: <CAFEAcA8L7BBHZ0Gfi7fm4pbZvYBd=Shu9bV6M5rQqcU-EU-p6Q@mail.gmail.com>
Subject: Re: [PATCH v3 23/42] target/arm: Use probe_access_full for BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a field to TARGET_PAGE_ENTRY_EXTRA to hold the guarded bit.
> In is_guarded_page, use probe_access_full instead of just guessing
> that the tlb entry is still present.  Also handles the FIXME about
> executing from device memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h     |  8 ++++----
>  target/arm/cpu.h           | 13 -------------
>  target/arm/internals.h     |  1 +
>  target/arm/ptw.c           |  7 ++++---
>  target/arm/translate-a64.c | 22 ++++++++--------------
>  5 files changed, 17 insertions(+), 34 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 118ca0e5c0..689a9645dc 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -32,12 +32,12 @@
>  # define TARGET_PAGE_BITS_MIN  10
>
>  /*
> - * Cache the attrs and sharability fields from the page table entry.
> + * Cache the attrs, sharability, and gp fields from the page table entry.
>   */
>  # define TARGET_PAGE_ENTRY_EXTRA  \
> -     uint8_t pte_attrs;           \
> -     uint8_t shareability;
> -
> +    uint8_t pte_attrs;            \
> +    uint8_t shareability;         \
> +    bool guarded;

I notice this now brings this very close to just having an ARMCacheAttrs
struct in it (in fact it's going to be one byte bigger than the ARMCachettrs).
But it's probably better to keep them separate since we care a lot more
about keeping the TLB entry small I suppose.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 5b67375f4e..22802d1d2f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14601,22 +14601,16 @@ static bool is_guarded_page(CPUARMState *env, DisasContext *s)
>  #ifdef CONFIG_USER_ONLY
>      return page_get_flags(addr) & PAGE_BTI;
>  #else
> +    CPUTLBEntryFull *full;
> +    void *host;
>      int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
> -    unsigned int index = tlb_index(env, mmu_idx, addr);
> -    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> +    int flags;
>
> -    /*
> -     * We test this immediately after reading an insn, which means
> -     * that any normal page must be in the TLB.  The only exception
> -     * would be for executing from flash or device memory, which
> -     * does not retain the TLB entry.
> -     *
> -     * FIXME: Assume false for those, for now.  We could use
> -     * arm_cpu_get_phys_page_attrs_debug to re-read the page
> -     * table entry even for that case.
> -     */

I think we should keep at least some of this comment: the part
about the reason we can assert that probe_access_full() doesn't
return TLB_INVALID being that we tested immediately after the
insn read is still true, right?

> -    return (tlb_hit(entry->addr_code, addr) &&
> -            arm_tlb_bti_gp(&env_tlb(env)->d[mmu_idx].fulltlb[index].attrs));
> +    flags = probe_access_full(env, addr, MMU_INST_FETCH, mmu_idx,
> +                              false, &host, &full, 0);
> +    assert(!(flags & TLB_INVALID_MASK));
> +
> +    return full->guarded;
>  #endif
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

