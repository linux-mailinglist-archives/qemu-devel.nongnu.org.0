Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C685F6A0B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:52:58 +0200 (CEST)
Received: from localhost ([::1]:49376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSF7-0002BK-92
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogS7G-0005Ji-En
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:44:51 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogS7E-0000B1-Sg
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:44:50 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i3so2225921pfk.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qQQC5C/Fq3WcEaAGlJ7iXt69ARtQYzjczXq/0FOr2sk=;
 b=cK5PzXqzWrzYBLZJdis1y4FwJ0qxXcTMjNS7/F8ey6W353smI6mAqxKBMtgDJrGgtY
 N6UJJDelJrRxz081UlItBoWew0s9oD/AEPdXFuzwcuLX0D99MvjbDMczFv/2lXGwj9sK
 TpMPz8B9+QqH7iamfKvwbCUK0JJnnQZ2v1wQJBphhfcPAptNWztEJMFW5Ykg6wY4UNdW
 Or7Fbiz3c9YaaupjyWovGqCgUHX0Hwwha/SQn/ypsxLl9fkTIfs5cguSNYR2dKWa0WnO
 CgR3PKEQoFoCzI2GLxt0FIlgNZNaazbsASKbOUxgx6uOyHhT3xidi7gMSW8xb99x8u5X
 LpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQQC5C/Fq3WcEaAGlJ7iXt69ARtQYzjczXq/0FOr2sk=;
 b=7Z+bM6X/45ilCopnnSad5buO7h/lC4U1wXJ9EiPi7QasjCoRKmu+JedtiEwR0pIB9L
 CCLboaXMNw/W84Tzy312N3TNQsaJGwkmK5tEfb1M6+KWcSu1EfBjX7YPU+/xM/SOga96
 uV32FI22i5QPp19nS5lysn7Zuwszr0TbRrTnDmoXRQVEUM3q7M4s74/mNg4HytTOg4Wz
 X1hgzzpxTIqFAUYcu05L/KD0CFtBP7vZ8MG8JRNUenFtgU1JT48PiU6n2txdI5oaB+JP
 BH/uDKNBA6yRTpjZGr6rdB4Sw0EDw4a0rwxG8mzggKCF4cYmkqpmOBNL1HaHZp05jqjg
 2Pkg==
X-Gm-Message-State: ACrzQf3QjAYbwVFEHLYQlSgq4DK9kpEsbAql1oxKU3ycJJKmJ/Xn/Qwp
 1LkDpgqOYqEV4AtGVSDZCmhLIbCoJudlNPqo7HndlA==
X-Google-Smtp-Source: AMsMyM584Jy6ZIKZukOnoDCqb3WkCQX/e4V2KdirU86HvgwJXy+9kmx9uSfcOXv2YwddG774lAO+opNkvZzt42TgUb4=
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr153433pfk.51.1665067486875; Thu, 06 Oct
 2022 07:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-22-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:44:34 +0100
Message-ID: <CAFEAcA8M+d1ytbZD6WmLik8RiGjv9=bPA3YOQm7V6XrH2fxmLQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/42] target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Sat, 1 Oct 2022 at 17:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Copy attrs and sharability, into the TLB.  This will eventually

"shareability" is how the Arm ARM spells it.

> be used by S1_ptw_translate to report stage1 translation failures,
> and by do_ats_write to fill in PAR_EL1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h  | 8 ++++++++
>  target/arm/tlb_helper.c | 3 +++
>  2 files changed, 11 insertions(+)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 08681828ac..118ca0e5c0 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -30,6 +30,14 @@
>   */
>  # define TARGET_PAGE_BITS_VARY
>  # define TARGET_PAGE_BITS_MIN  10
> +
> +/*
> + * Cache the attrs and sharability fields from the page table entry.

"shareability".

We should document the format of these fields, similarly to
how the ARMCacheAttrs struct does. In particular, do we guarantee
at the point we fill this in that pte_attrs is in the MAIR_EL1
8-bit format and never the S2 descriptor-bits format?

> + */
> +# define TARGET_PAGE_ENTRY_EXTRA  \
> +     uint8_t pte_attrs;           \
> +     uint8_t shareability;
> +
>  #endif
>
>  #define NB_MMU_MODES 8
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 49601394ec..353edbeb1d 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -236,6 +236,9 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              arm_tlb_mte_tagged(&res.f.attrs) = true;
>          }
>
> +        res.f.pte_attrs = res.cacheattrs.attrs;
> +        res.f.shareability = res.cacheattrs.shareability;
> +
>          tlb_set_page_full(cs, mmu_idx, address, &res.f);
>          return true;
>      } else if (probe) {
> --

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

