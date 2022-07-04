Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722435659B6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:23:59 +0200 (CEST)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Nva-0004lz-GC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NuC-00034P-RF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:22:33 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8NuB-0002Jl-5r
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:22:32 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c8bb90d09so31315077b3.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2lp9Do7C7JGDT0iqwVCG2YrhON3OohTJB+UJsrPGhcc=;
 b=fxtYsGyMiqQpKC369BMsSaspow62s5sKnyFF/z/dUwkffokvh0hiH8oQQvb9mxu3be
 7UavFJLc9Hls+tpL1vZJACGtGYDJsx+TuxMVrO5dZ3zVxMtHDRgYx7Gv0tFdcahHbhrC
 f9c1MMJEFuhvglGsiixChIaefJqpPxQaYslNufNuurk6nqGdUPMlvaACvuthcEyzHZ4a
 nwg7uCZVYcAUJu6iweWU3Tao+I8SdTYjp4ojkGGs35QMJAgw9b1Ox/9hbTMYPDFOFj0q
 3rx9Zg6hFnlJQduCKiNUnDioSrM9p6erK1kaZg5KP2Xed0iJOWPBFnxvq557wqlbaEm8
 aTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2lp9Do7C7JGDT0iqwVCG2YrhON3OohTJB+UJsrPGhcc=;
 b=jbbCzR2IzJZ7v9cLgC0FCSolbP89PvaiPNI72rxSHCTfuONArovtqmarAZWSnKJxta
 K+j7bUnIxf7TByBLSOhkYdI7yUPI2aJLc4pKWES31ON7O1eXLf+ZrvcDc8Zh1PFHiuZD
 MjmLlfhs5M4gj4+Mo/aV3A8MBviMWWmVLBtPdjPUfFS9xTcFObshXV4qrZqkikDtXpAH
 znjg2NxGTWiK4k9E009dqHTCoDw7jETg1Lv6T0uBEL0xS3eKBtRN1ISg4LjJSZbN0xEF
 f+EpERsio/V3RjZ/9wTuksyIgomaHsU/hpT6clbzFOJ09qOgk9TCBKBtdYQ3xmiNsRuy
 71kg==
X-Gm-Message-State: AJIora9BzylcDnFOqeTNzdik6vlSKffATmMMRlz7CVlPIrUsYQCr9LyK
 gpLRyJo87mND4+8FUoFIyJMpOU7m72xFAdD0vQGVUA==
X-Google-Smtp-Source: AGRyM1vVgpNP7paF9MN+3N8qsYRLI4iAr/PPtVhxMEirBm5RZVv9x1vRAJ/MX/lQdkpQt4PJSo1UGbADtPU+7E7ci0o=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr33290479ywb.10.1656948149859; Mon, 04
 Jul 2022 08:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-3-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:22:19 +0100
Message-ID: <CAFEAcA8YowUZqpyC4k=7w_pFSZ5JrnC=cYpj0JUn8U4JaYOGDA@mail.gmail.com>
Subject: Re: [PATCH 02/62] target/arm: Enable PageEntryExtra
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Copy attrs, sharability, and the NS bit into the TLB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h  |  8 ++++++++
>  target/arm/internals.h  |  5 +++++
>  target/arm/tlb_helper.c | 14 ++++++++++++--
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..a14f167d11 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -30,6 +30,14 @@
>   */
>  # define TARGET_PAGE_BITS_VARY
>  # define TARGET_PAGE_BITS_MIN  10
> +/*
> + * Extra information stored in softmmu page tables.
> + */
> +# define TARGET_PAGE_ENTRY_EXTRA
> +struct PageEntryExtra {
> +    /* See PAGEENTRYEXTRA fields in cpu.h */
> +    uint64_t x;
> +};
>  #endif
>
>  #define NB_MMU_MODES 15
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c66f74a0db..2b38a83574 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
>  FIELD(V7M_EXCRET, S, 6, 1)
>  FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
>
> +/* Bit definitions for PageEntryExtra */
> +FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
> +FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
> +FIELD(PAGEENTRYEXTRA, PA, 12, 52)

So why do we want these things in particular? It would be
helpful to describe the intended uses in the commit message
to save the reader having to read the next 60 patches to
find out :-)

Is wanting to cache the physaddr an Arm-specific thing, or is it
something we should consider having in the core softmmu code?

> +
>  /* Minimum value which is a magic number for exception return */
>  #define EXC_RETURN_MIN_MAGIC 0xff000000
>  /* Minimum number which is a magic number for function or exception return
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 7d8a86b3c4..9de3099153 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -226,21 +226,31 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          &phys_addr, &attrs, &prot, &page_size,
>                          &fi, &cacheattrs);
>      if (likely(!ret)) {
> +        PageEntryExtra extra = {};
> +
>          /*
>           * Map a single [sub]page. Regions smaller than our declared
>           * target page size are handled specially, so for those we
> -         * pass in the exact addresses.
> +         * pass in the exact addresses.  This only happens for M-profile,
> +         * which does not use or require PageEntryExtra.
>           */

Do we have to exclude M-profile here because the PageEntryExtra
data is strictly-per-page, or because the way we've formatted
our extra uint64_t requires the physaddr to be page-aligned, or both?

>          if (page_size >= TARGET_PAGE_SIZE) {
>              phys_addr &= TARGET_PAGE_MASK;
>              address &= TARGET_PAGE_MASK;
> +
> +            /* Record some particulars for later lookup. */
> +            extra.x = phys_addr;
> +            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, ATTRS,
> +                                 cacheattrs.attrs);
> +            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
> +                                 cacheattrs.shareability);
>          }
>          /* Notice and record tagged memory. */
>          if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
>              arm_tlb_mte_tagged(&attrs) = true;
>          }
>
> -        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
> +        tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
>                                  prot, mmu_idx, page_size);
>          return true;
>      } else if (probe) {
> --
> 2.34.1

thanks
-- PMM

