Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D45F75BD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:09:57 +0200 (CEST)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjMi-00021J-6k
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjF3-0006xl-HM
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:02:08 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjF1-00051b-PU
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:02:01 -0400
Received: by mail-pf1-x436.google.com with SMTP id 67so4337275pfz.12
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qXbBURHkGIrzTawmhhvYXAGr5Yq0Fg78373cxDqTwlo=;
 b=M7GFPVFaLOwIre0fjXEGB8xVJ4+PJ6Ijtthr/dvOfJvK5dUAOAKYsMeMpoLtYxWiP3
 BOhj1QmN2xDx6mfMCFdxAkcGcTXdQNnVJWsfY2R1x4wdONbKcnMgZeicA2RnoGy0Bmyv
 ou3LiNFPqcPAulFDjsnjn83XxLJFyG+2g7YXrY524zfUVkTSvL6rPUI+8JFuTb1zQomg
 Db+e9nCq5orQ20ev5IyKt4azbOEWB6ouRWqnw7KUgCvR5rh6w5bxUGgUA9na1fFR2HAH
 NQOVxrsWS9yuxNJNN59RNnsNAXQrVtXhQmq/uKQ+ZPTzCNkvnAke8DO5U3XvhHwAe03J
 x8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXbBURHkGIrzTawmhhvYXAGr5Yq0Fg78373cxDqTwlo=;
 b=i5a5JQnJiD9ZhygkNYJpVQVAYq4gkH23klKroMSzpsVKBQYmdRQkjrj5O0TSq3ir0t
 Wt85Y6+AVNmla89argqVBA1GaURDUEMMMrH5cfyhQcajIa3rO5Jhue5Oui+2VWNibBpt
 u7w0f5ERwBgmKwEbLoZS5HV/QaIKKDwasTXqD06bhQNc+LkbKuhe0C84pLdxwhaMT5vu
 +Pr64/DCsO09Ldd1NQca49rhuqqGJa6qbCdCTVBru1Ama0G+2sdYIOqVCN3T6qIdJ4wz
 IRv/zQCXqLQlOQyY55zFWXfkg8RRo7G+qUceyCEbVpsQCKjqvqBjgunxa/7bPbs9rr5F
 6y6w==
X-Gm-Message-State: ACrzQf0RW/nWY6ELWFGCpod45xhITCDkNN3GBHacS2Tcb9dzqYGH7ofZ
 Pkf4b8ZIr4fHwSxqxZkT6eddBpUgoMO+nA6eXfJ72A==
X-Google-Smtp-Source: AMsMyM7Vtos7+OLrHHPfzNh62cUx5JiZXuYizNLWdgIi1/M1oOn/PS5Ze4HRL7dMTA1+46Lb253S0cIYEwtO9nuptHY=
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr4200738pfk.51.1665133317741; Fri, 07 Oct
 2022 02:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-28-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:01:45 +0100
Message-ID: <CAFEAcA9Vd6mwMf9-70vo=t_Yec+fPh3kM_jo7wn=oNi1+cvgkQ@mail.gmail.com>
Subject: Re: [PATCH v3 27/42] target/arm: Use softmmu tlbs for page table
 walking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> So far, limit the change to S1_ptw_translate, arm_ldl_ptw, and
> arm_ldq_ptw.  Use probe_access_full to find the host address,
> and if so use a host load.  If the probe fails, we've got our
> fault info already.  On the off chance that page tables are not
> in RAM, continue to use the address_space_ld* functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> -static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
> +static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>  {
>      /*
>       * For an S1 page table walk, the stage 1 attributes are always
> @@ -202,41 +203,72 @@ static bool ptw_attrs_are_device(uint64_t hcr, ARMCacheAttrs cacheattrs)
>       * With HCR_EL2.FWB == 1 this is when descriptor bit [4] is 0, ie
>       * when cacheattrs.attrs bit [2] is 0.
>       */
> -    assert(cacheattrs.is_s2_format);
>      if (hcr & HCR_FWB) {
> -        return (cacheattrs.attrs & 0x4) == 0;
> +        return (attrs & 0x4) == 0;
>      } else {
> -        return (cacheattrs.attrs & 0xc) == 0;
> +        return (attrs & 0xc) == 0;
>      }

The upcoming v8R support has its stage 2 attributes in the MAIR
format, so it might be a little awkward to assume the v8A-stage-2
format here rather than being able to add the "if !is_s2_format"
condition. I guess we'll deal with that when we get to it...

> +        env->tlb_fi = fi;
> +        flags = probe_access_full(env, addr, MMU_DATA_LOAD,
> +                                  arm_to_core_mmu_idx(s2_mmu_idx),
> +                                  true, hphys, &full, 0);
> +        env->tlb_fi = NULL;
> +
> +        if (unlikely(flags & TLB_INVALID_MASK)) {
> +            goto fail;
> +        }
> +        *gphys = full->phys_addr;
> +        pte_attrs = full->pte_attrs;
> +        pte_secure = full->attrs.secure;
> +    }
> +

> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -208,10 +208,21 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> -    ARMMMUFaultInfo fi = {};
>      GetPhysAddrResult res = {};
> +    ARMMMUFaultInfo local_fi, *fi;
>      int ret;
>
> +    /*
> +     * Allow S1_ptw_translate to see any fault generated here.
> +     * Since this may recurse, read and clear.
> +     */
> +    fi = cpu->env.tlb_fi;
> +    if (fi) {
> +        cpu->env.tlb_fi = NULL;
> +    } else {
> +        fi = memset(&local_fi, 0, sizeof(local_fi));
> +    }

This makes two architectures now that want to do "call a probe_access
function, and get information that's known in the architecture-specific
tlb_fill function", and need to do it via this awkward "have tlb_fill
know that it should stash the info away in the CPU state struct somewhere"
trick (the other being s390 tlb_fill_exc/tlb_fill_tec). But I don't
really have a better idea, so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

