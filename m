Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9A691FB5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:24:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTNj-0005jw-RQ; Fri, 10 Feb 2023 08:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTNQ-0005cD-DZ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:23:44 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTNN-0004yN-Oa
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:23:44 -0500
Received: by mail-pf1-x429.google.com with SMTP id b1so3460437pft.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676035416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5Uh4LvAjqS1PXos/SFXGgkzGwtB7EbyJ1YBZFCF9Z6s=;
 b=ALF/Nil/zJWzX5XpH1wqvVSMyaafS780lKa8FyrKpybdn1HTTCXgBxnCDaNgzTRsPP
 EfK7VKQRnZaU79SbIDsmbLipzpibelGx9R8zXlytYOthb9No03IO+vzjq/T+9rSsIxlE
 4TG6XtaBAyEbfP3a8g6HeDneeDdHR7f5zHZbmhq3PUlGJunKdKzzsg7Hqc2O7qWw3KTq
 fJXgzGiHNq/x45vBxu9X3ThPaGLzZ6xeHBK2fNrzAY38LMTFMLxqdL0d4vAGqX9yNJAV
 XkYnfdGmLp1qDkTBiXSQafWTdSJtD2YSAEVXolYF3N3q90Wnx39nOUY8izo3gnYyzvRl
 WMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676035416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Uh4LvAjqS1PXos/SFXGgkzGwtB7EbyJ1YBZFCF9Z6s=;
 b=A1x1zExSGjtTeL4d7wyve1kqXgYlvNyicisLomMSMKWDyj2foIGrhnTepudWZ3M8gy
 3bFAoJWvwcHfOaveR5Ol1B+ga/pzdrIxFMfCIlZxuZKDVseZTfuOAiQksIAYLn+/S8Y3
 nKzgIE9bB3+X9+XkfjILp02N5QENAUcERwNcsH3Y5LI5cfgMbcnkkZdPb5rPW32mqM/P
 pgWIEaYE6Ukim/uBp7Zf1jnhr6948NeQPtVGl1E8ZAGX/+9HRSFnuG3szHL+CHe+kUcq
 EoxVAL6TpBWSLLEPkKr0DvxdSyjsJSVNtRe413pxLehUDPZC8ku4+YmgLwTM6mg+GE+3
 nWYg==
X-Gm-Message-State: AO0yUKUIr3wJxBD24O1sZM3G66NpEunw733+/t01MXEZNDaqaF32Rn2l
 ZinYShNPxo0Wee3AfHWwSEL3bXqNyRz4ZG/byD//qw==
X-Google-Smtp-Source: AK7set9XP3fnXatlDx9II5re8FfIwlc8jqlE2yfLJ1vF+b530sPeAqkf/0Nwn9loyTsF+M2icS5ymWzDTPUC+CfjmJM=
X-Received: by 2002:a62:484:0:b0:5a8:447c:b45d with SMTP id
 126-20020a620484000000b005a8447cb45dmr2216098pfe.23.1676035416632; Fri, 10
 Feb 2023 05:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-17-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:23:25 +0000
Message-ID: <CAFEAcA-sUJ54teMSftw6TEN0N73EOKCRETMX2xoxO-PHpNvttg@mail.gmail.com>
Subject: Re: [PATCH 16/22] target/arm: Move s1_is_El0 into S1Translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of passing this to get_phys_addr_lpae, stash it
> in the S1Translate structure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 37f5ff220c..eaa47f6b62 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -22,6 +22,7 @@ typedef struct S1Translate {
>      ARMSecuritySpace in_space;
>      bool in_secure;
>      bool in_debug;
> +    bool in_s1_is_el0;
>      bool out_secure;
>      bool out_rw;
>      bool out_be;
> @@ -33,7 +34,7 @@ typedef struct S1Translate {
>
>  static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>                                 uint64_t address,
> -                               MMUAccessType access_type, bool s1_is_el0,
> +                               MMUAccessType access_type,
>                                 GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>      __attribute__((nonnull));
>
> @@ -1257,17 +1258,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
>   * @ptw: Current and next stage parameters for the walk.
>   * @address: virtual address to get physical address for
>   * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
> - * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
> - *             (so this is a stage 2 page table walk),
> - *             must be true if this is stage 2 of a stage 1+2
> - *             walk for an EL0 access. If @mmu_idx is anything else,
> - *             @s1_is_el0 is ignored.

This was a useful comment on a boolean whose semantics aren't
totally clear just from the variable name; can we keep it ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

