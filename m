Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534E5BE781
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:47:55 +0200 (CEST)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadbO-0008Uj-7k
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaayF-0003Aa-GO
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:59:19 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaayD-0001a4-Hs
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:59:19 -0400
Received: by mail-ej1-x62f.google.com with SMTP id 13so5232793ejn.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=QPDBZf0pG/kBpT781+bWXQnCkAArbOj+qVN3kuZn98Y=;
 b=d9ZuzEK/87Fwb4Vn9J/j115bbm3UdPPWYp44GShi8fRyhzTGi39RQ0al9RiSGyyO0N
 ISNfZWG/gcvuuD4T3B99fNAB3XUS6TqB/6VojI4hDhoBoIylwo+pdVc1YPgheKr+A4zc
 YtMGZVEWqkGZh0pBnJvlYvftf3kMdsrsh2BApXPjK3cgWz5HqMmBD5YwWnhj4pJIW4aA
 j2QAbI1BMLq9NJQSu+qRl7aDqlCNooPoldNv30RZCy511xHUOoijVoaWdW+sC+uT3ldn
 u7FpPE37MDt9flqh9ENy+oAiny/83BkC0ytcQAXVUoQe2FYkuVrNHzeG1UlcolPbkFxO
 hVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=QPDBZf0pG/kBpT781+bWXQnCkAArbOj+qVN3kuZn98Y=;
 b=CiyRNRo+j2w9spuQyedl6PKimW8yXbH3pQN1dg77QnTs71V0RGl/1aejXnOlTEv23a
 jLp1tvzUrjPIvtOhiCcz9c2zDMMB3oqAcJ9O3ogY164um0YnmZ/K1QIhcnCuwJw8lTJQ
 NmfvZpijEtjiU/OVqn2AKUimc3azfUGGShOsL3y4NElyszc3r2qs23C9ysorLhPLkXa/
 mzXvDmd7WdRgBYV28lsMEjwqRAmzzNjYjMaEU/amLXpYCVEjE1jIM1hBaJIhlqC+613q
 Z+72UNaN9r9pTQAJs4GKQRu6sOaGYb2XvrplO8+EvcdU7nvmOTaOg7LZlaqBag3raq52
 Vjaw==
X-Gm-Message-State: ACrzQf0wyaKqv+5PpK2J+9aRMKBMsgt7SXwX4kANDG0YCQBua7Zd1Wy3
 6siZdYan2iihxfG4wEhD/1Zj8195CHV+q7uwgfPBCQ==
X-Google-Smtp-Source: AMsMyM5mCzktdKVmaq5sWD5/YJFj29Pw2xuIfVJXAkKvArq5iftUMbot/sMSSGMaLx9XPKz7w5tsvieM7Bq3NuMCNQ4=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr14430333ejc.365.1663671555418; Tue, 20
 Sep 2022 03:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-6-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:59:03 +0100
Message-ID: <CAFEAcA-cRTKR2G+U3y=oh3p5v2kfLeA2CTc4tTza5G7LoMfJng@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] accel/tcg: Introduce tlb_set_page_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 5 Sept 2022 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have collected all of the page data into
> CPUTLBEntryFull, provide an interface to record that
> all in one go, instead of using 4 arguments.  This interface
> allows CPUTLBEntryFull to be extended without having to
> change the number of arguments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-defs.h | 14 ++++++++++
>  include/exec/exec-all.h | 22 +++++++++++++++
>  accel/tcg/cputlb.c      | 62 ++++++++++++++++++++++++++++-------------
>  3 files changed, 78 insertions(+), 20 deletions(-)
>
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index f70f54d850..5e12cc1854 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -148,7 +148,21 @@ typedef struct CPUTLBEntryFull {
>       *     + the offset within the target MemoryRegion (otherwise)
>       */
>      hwaddr xlat_section;
> +
> +    /*
> +     * @phys_addr contains the physical address in the address space
> +     * given by cpu_asidx_from_attrs(cpu, @attrs).
> +     */
> +    hwaddr phys_addr;
> +
> +    /* @attrs contains the memory transaction attributes for the page. */
>      MemTxAttrs attrs;
> +
> +    /* @prot contains the complete protections for the page. */
> +    uint8_t prot;
> +
> +    /* @lg_page_size contains the log2 of the page size. */
> +    uint8_t lg_page_size;
>  } CPUTLBEntryFull;
>
>  /*
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 758cf6bcc7..1a30c857f4 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -257,6 +257,28 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
>                                                 uint16_t idxmap,
>                                                 unsigned bits);
>
> +/**
> + * tlb_set_page_full:
> + * @cpu: CPU context
> + * @mmu_idx: mmu index of the tlb to modify
> + * @vaddr: virtual address of the entry to add
> + * @full: the details of the tlb entry
> + *
> + * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
> + * @full must be filled, except for xlat_section, and constitute
> + * the complete description of the translated page.
> + *
> + * This is generally called by the target tlb_fill function after
> + * having performed a successful page table walk to find the physical
> + * address and attributes for the translation.
> + *
> + * At most one entry for a given virtual address is permitted. Only a
> + * single TARGET_PAGE_SIZE region is mapped; @full->ld_page_size is only

typo: lg_page_size

> + * used by tlb_flush_page.
> + */
> +void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
> +                       CPUTLBEntryFull *full);
> +
>  /**
>   * tlb_set_page_with_attrs:
>   * @cpu: CPU to add this TLB entry for

> @@ -1272,15 +1275,34 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>      qemu_spin_unlock(&tlb->c.lock);
>  }
>
> -/* Add a new TLB entry, but without specifying the memory
> - * transaction attributes to be used.
> - */
> +void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> +                             hwaddr paddr, MemTxAttrs attrs, int prot,
> +                             int mmu_idx, target_ulong size)
> +{
> +    CPUTLBEntryFull full = {
> +        .phys_addr = paddr,
> +        .attrs = attrs,
> +        .prot = prot,
> +        .lg_page_size = ctz64(size)
> +    };
> +
> +    assert(is_power_of_2(size));
> +    tlb_set_page_full(cpu, mmu_idx, vaddr, &full);
> +}
> +
>  void tlb_set_page(CPUState *cpu, target_ulong vaddr,
>                    hwaddr paddr, int prot,
>                    int mmu_idx, target_ulong size)
>  {
> -    tlb_set_page_with_attrs(cpu, vaddr, paddr, MEMTXATTRS_UNSPECIFIED,
> -                            prot, mmu_idx, size);
> +    CPUTLBEntryFull full = {
> +        .phys_addr = paddr,
> +        .attrs = MEMTXATTRS_UNSPECIFIED,
> +        .prot = prot,
> +        .lg_page_size = ctz64(size)
> +    };
> +
> +    assert(is_power_of_2(size));
> +    tlb_set_page_full(cpu, mmu_idx, vaddr, &full);
>  }

Why not just leave tlb_set_page() the way it was? Writing
it out results in this code duplication...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

