Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246E68DC92
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPb0-0003tC-Fd; Tue, 07 Feb 2023 10:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPay-0003ft-DV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:09:20 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPaw-0007Vh-DP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:09:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 c10-20020a17090a1d0a00b0022e63a94799so18905741pjd.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=96+yIu0p6pMZJUQk+5zM0BIUuqMkXi6UN/db+59JgH0=;
 b=KOfkRedKBV5gLNX5fKGJm7ceegfiKjr6YWuUsB/tB/WdWaWYwbOLi9r//sGosA1op8
 j7LT4oFiYFf0KHZFRyx5XkXzbEZNhnj+NDQzvXF0xkmnuS4fRbV+HWY5gsPMGbgxprS5
 L4MPgoG0yipAPHv+GsSlnBxQYCbcdPCjvAt/u1+2wyNVe+D5dH8U2th+y+elZrRFw2su
 6iGMV9V69ewSbzGPhT0hhyiS9NLdaR7HHUtSmEHUToDsCAD7y2Ah2IaqSwyN6jyiB6Dk
 3WdE6j4QL52ouDSwnt1NOWgs5htpzw1p/PzSZstpKpGTosOcZBO8qcNf1WN9s/RPNqIk
 ER+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=96+yIu0p6pMZJUQk+5zM0BIUuqMkXi6UN/db+59JgH0=;
 b=1d6imtRMJO6r0mXsxnK2msjcOv8eAmGl6p7KIqba2awZa8kgQQpJGCaJR8exg+/glV
 MOGxv5H1t8jHCsZKGgP35nbSKHVT8hWZelsog+WeIkW+j2Df008mn6H44/XprGihgsQO
 tW0R0J3XYdoj0H4KvVCf+dRrn9H8aT12FgU0+CJPn9ATaO+Ho9IjkRkzYcFesXK07506
 gfXSrBMKWhW6UUNlqM0/I0hgPghOtUEeSpF3AgoUX+1PE14p7AHTbec8WqT6gic1hi4w
 S08nUYbzikr96yGz84XBDphcjCtEannLi84uYYy7oymg7M68y0uYRleKbyHelzzlbioq
 7l2g==
X-Gm-Message-State: AO0yUKVwrRiMIeAD+qGo9hiKyZugVtce8j4nOU7Kqi32R2RkNfXmnhu7
 WWRx/1hqgpfBim4fjB6BdZVp60cUUcjuGaetd6zmAw==
X-Google-Smtp-Source: AK7set+HqvseWjsZjWhkdTVbfBjbwijsYHJAlopZ1XJwN3JODhoyA92G491OKy9iOyRxD/5Xa6nEmnPLAx4lvUENDus=
X-Received: by 2002:a17:902:b7c9:b0:196:7127:2240 with SMTP id
 v9-20020a170902b7c900b0019671272240mr836304plz.11.1675782556875; Tue, 07 Feb
 2023 07:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-11-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:09:05 +0000
Message-ID: <CAFEAcA-5AKzoK7f=wzzo_0dB4YoAVuURL3sX+3xDc737xeMNgQ@mail.gmail.com>
Subject: Re: [PATCH 10/22] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
> With FEAT_RME, there are four physical address spaces.
> For now, just define the symbols, and mention them in
> the same spots as the other Phys indexes in ptw.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h |  2 +-
>  target/arm/cpu.h       | 17 +++++++++++++++--
>  target/arm/ptw.c       | 10 ++++++++--
>  3 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 53cac9c89b..8dfd7a0bb6 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -47,6 +47,6 @@
>      bool guarded;
>  #endif
>
> -#define NB_MMU_MODES 12
> +#define NB_MMU_MODES 14
>
>  #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 0114e1ed87..21b9afb773 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3067,8 +3067,10 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
>
>      /* TLBs with 1-1 mapping to the physical address spaces. */
> -    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_S     = 10 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_NS    = 11 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_Root  = 12 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_Realm = 13 | ARM_MMU_IDX_A,
>
>      /*
>       * These are not allocated TLBs and are used only for AT system
> @@ -3132,6 +3134,17 @@ typedef enum ARMASIdx {
>      ARMASIdx_TagS = 3,
>  } ARMASIdx;
>
> +static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
> +{
> +    return ARMMMUIdx_Phys_S + space;

Compile-time asserts that the mmu idxes are in the same
order as the ARMSecuritySpace enum values, since we're
assuming that here?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

