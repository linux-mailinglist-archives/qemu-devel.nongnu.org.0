Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8F5F6CED
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:28:18 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUfQ-0005mt-KA
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogT56-00051K-Q1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:46:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogT55-00028u-6v
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:46:40 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso2158982pjk.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xplrc+NNw3RJF2krTn+7x1TEWwnzUFNRXxP1cCUE8oI=;
 b=qg/JgLjX84SRqvvPVxUzLgvs5Jqk+xG0HQgmASGBVpJ/XrpidWwJh4LX3lGUG7Wysz
 zShXFh5oTW2TM38oLuUQCzQrtBjpupUORuuEg/8jt4m6LodLc789593Mgb4MRH8ydHv5
 KTLSd/FH/+nQEOn7Eo2mQS9hKOLrj2ahBM/PkdRCHTGMHnlWe6/+CdHdJv0HOd4iJplC
 dyTN5d1W96Nts02ujZw8CppIvuDonoHE3+mGsZMMqmn7Ng7007pUPdu0eJAC65a/2Rvy
 sMXH0H3D+cslacjRFzZjzhKm0lkyfM/SItu5KVtG+BGiPBTXeBaGVI6ZNS6pNxyMKh6d
 30OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xplrc+NNw3RJF2krTn+7x1TEWwnzUFNRXxP1cCUE8oI=;
 b=3q/oeTocHIYdGC5edB7dboandU+p85qp29FoeXrBDf4fvzpldHia6GWUCR7wou22yY
 akhkGGXELaIwiz8Fnd/AQUjetPOwvDoY0a75QVqUw0GC+y1VwMbO3Ht/O1tnvJs7zyHK
 aouktLWkR1BKoA8Eur84HzsW8RnmGu+VVNUzCTLQlJYY+psWpCnrpuaJGRHVb0Grjn1d
 fsQMA9K0iVf68yfiUmVWV1ZDWGdm8liHfVKBzcvPZ5+sMz5Vw6ABsun0ZDKMjLMIMtEC
 RK2hHLKGUlNDklyvPg0jhgCw4ZuDtaG6DW+UnYpqE9Ono7Wq0bEbSNZOWpwzy3Meeez0
 aguw==
X-Gm-Message-State: ACrzQf3S+5lSe+JKGja4Z4JQEh5OeOhc9j/OQCulg/QSKOZxr7R7jU7L
 y88LCV2ZDy1rQcVW7cTz/IWdHoq9hXtPve0Zx4oUuw==
X-Google-Smtp-Source: AMsMyM5v+v1erJkjO0i3NigmwEmLJgRcWKgTlEuM17kTAHuZ7EOlxOWRulHEnRC3H6ul0HGhNHByzMtyxTCSe/rVrXA=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr485431pll.19.1665071197542; Thu, 06 Oct
 2022 08:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-26-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:46:25 +0100
Message-ID: <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
Subject: Re: [PATCH v3 25/42] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
> Flush the tlb when invalidating stage 1+2 translations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -2977,15 +2987,6 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
>      ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
>      ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
> -    /*
> -     * Not allocated a TLB: used only for second stage of an S12 page
> -     * table walk, or for descriptor loads during first stage of an S1
> -     * page table walk. Note that if we ever want to have a TLB for this
> -     * then various TLB flush insns which currently are no-ops or flush
> -     * only stage 1 MMU indexes will need to change to flush stage 2.
> -     */
> -    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
> -    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
>
>      /*
>       * M-profile.
> @@ -3016,6 +3017,8 @@ typedef enum ARMMMUIdxBit {
>      TO_CORE_BIT(E20_2),
>      TO_CORE_BIT(E20_2_PAN),
>      TO_CORE_BIT(E3),
> +    TO_CORE_BIT(Stage2),
> +    TO_CORE_BIT(Stage2_S),
>
>      TO_CORE_BIT(MUser),
>      TO_CORE_BIT(MPriv),
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6fe85c6642..19a03eb200 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4319,7 +4319,9 @@ static int alle1_tlbmask(CPUARMState *env)
>       */
>      return (ARMMMUIdxBit_E10_1 |
>              ARMMMUIdxBit_E10_1_PAN |
> -            ARMMMUIdxBit_E10_0);
> +            ARMMMUIdxBit_E10_0 |
> +            ARMMMUIdxBit_Stage2 |
> +            ARMMMUIdxBit_Stage2_S);
>  }

This isn't sufficient. As the comment notes, you also need to change
all the TLBI ops for S2 invalidates which we currently implement as
ARM_CP_NOP so they now flush the stage 2 TLB. I think that searching
helper.c for 'IPAS2' probably finds you all of them.

alle1_tlbmask() is also only used for the aarch64 TLBI ops -- the
aarch32 ones are tlbiall_nsnh_write() and tlbiall_nsnh_is_write(),
I think, and those also now need to flush stage 2.

VMID writes also now need to flush the stage 2 TLB as well as
the combined s1&2 TLB -- see vttbr_write().

Side note, looks like we didn't update vttbr_write() to know about
the EL2&0 MMU indexes ?

thanks
-- PMM

