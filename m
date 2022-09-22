Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7DD5E67DF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:59:20 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obObf-0000A4-EC
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obOBC-0005mW-G5
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:31:58 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obOBA-0008AK-Co
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:31:58 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z13so14075541edb.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sUmR2FQ0TnpmIXEitpS0EgueoVe7AtMwEfhlg0XBP6o=;
 b=d0u6W/m/hrlMGvxKey14YaGPRAz20R9eq5GSpI0COvyrM69NwgynT/QKXL8vXAw66f
 5PHMvLx1rU3MFGVZE9n6JlSfta61Fp4p9AULNgI00VWQ7o/uCYsOPS5rFmG5KGDEYkwL
 518tW6PYU/YpWO+5N/tsArfV+vzpWay8IdFxRsxisJfVc9BfzhOdCTZVp2ZMrc4/JypY
 RHR0nArQisrqUPN5CCTAvaBCZsbZ50g/jPoixbFUHm34d4e7HbJKSNnpb+rwxXygAF4j
 XoC7vvNaqxqoYiSZCPM/claVXzT4GrRCX5+UMYvbsatiYh0XxsV35MOKsPEYs77A2k3m
 pdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sUmR2FQ0TnpmIXEitpS0EgueoVe7AtMwEfhlg0XBP6o=;
 b=GQAYiLaywfWiq50f1s30oira7TMy6jLvsPH9xmePM7GFdMeSDWI0oV9mD8IgrOXvpE
 DhU/43/5g+kTj/6kCXCMAgKLhU+V54j4oUjyuIrNrNqGokIg7/0CaJXtofwMfsW0lXCO
 t3vXtw1E2hwcyIhZea0t/inGxQ/DLxfgBdO8xhO1zq/9KBiH5gw/3GU/TC5SZDXZGJQZ
 mAz0rZD9tDWoxZ0PrQbQ3+xKIC/Ff6ZyGd+aBggcc6dclckCxFQJsin7r9pPvhe5yDon
 ZtgKdOSLj7z1/sZxX0R1NLIV+6nhEbjnTZpuRbuU+iVp8UxUwBkYYSrTZDs1pID38uNu
 iIKw==
X-Gm-Message-State: ACrzQf0zRoDvciFNA9kGuo+1V94wTEyyUh5y1L5tBiL9PDFYdl1m5Sjb
 KIyWw9nDzuK1P9SAEFkb9X3kXT/Ragf+eNM1oxgt2Q==
X-Google-Smtp-Source: AMsMyM7Pt5YoWW6xedkRvLNbNfnawjuev+iSlCkhk8FCetZbDPHoXmoLucZDBuXUmd7YVJJ3J99pihxA2w6utfoxGRg=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr3963940ede.375.1663860713060; Thu, 22
 Sep 2022 08:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220914115217.117532-1-richard.henderson@linaro.org>
 <20220914115217.117532-3-richard.henderson@linaro.org>
In-Reply-To: <20220914115217.117532-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 16:31:41 +0100
Message-ID: <CAFEAcA-_v4bY5fdXsK6EHncxVrznrrS_-VgqD_fOR4ScrvidvA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Do alignment check when translation disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Wed, 14 Sept 2022 at 13:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If translation is disabled, the default memory type is Device,
> which requires alignment checking.  Document, but defer, the
> more general case of per-page alignment checking.
>
> Reported-by: Idan Horowitz <idan.horowitz@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1204
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a..79609443aa 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10713,6 +10713,39 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
>      return arm_mmu_idx_el(env, arm_current_el(env));
>  }
>
> +/*
> + * Return true if memory alignment should be enforced.
> + */
> +static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
> +{
> +    /* Check the alignment enable bit. */
> +    if (sctlr & SCTLR_A) {
> +        return true;
> +    }
> +
> +    /*
> +     * If translation is disabled, then the default memory type
> +     * may be Device(-nGnRnE) instead of Normal, which requires that

"may be" ?

> +     * alignment be enforced.
> +     *
> +     * TODO: The more general case is translation enabled, with a per-page
> +     * check of the memory type as assigned via MAIR_ELx and the PTE.
> +     * We could arrange for a bit in MemTxAttrs to enforce alignment
> +     * via forced use of the softmmu slow path.  Given that such pages
> +     * are intended for MMIO, where the slow path is required anyhow,
> +     * this should not result in extra overhead.
> +     */
> +    if (sctlr & SCTLR_M) {
> +        /* Translation enabled: memory type in PTE via MAIR_ELx. */
> +        return false;
> +    }
> +    if (el < 2 && (arm_hcr_el2_eff(env) & (HCR_DC | HCR_VM))) {
> +        /* Stage 2 translation enabled: memory type in PTE. */
> +        return false;
> +    }
> +    return true;

The SCTLR_EL1 docs say that if HCR_EL2.{DC,TGE} != {0,0} then we need to
treat SCTLR_EL1.M as if it is 0. DC is covered above, but do we need/want
to do anything special for TGE ? Maybe we just never get into this case
because TGE means regime_sctlr() is never SCTLR_EL1 ? I forget how it
works...

We also need to not do this for anything with ARM_FEATURE_PMSA :
with PMSA, if the MPU is disabled because SCTLR.M is 0 then the
default memory type depends on the address (it's defined by the
"default memory map", DDI0406C.d table B5-1) and isn't always Device.

We should also mention in the comment why we're doing this particular
special case even though we don't care to do full alignment checking
for Device memory accesses: because initial MMU-off code is a common
use-case where the guest will be working with RAM that's set up as
Device memory, and it's nice to be able to detect misaligned-access
bugs in it.

> +}
> +
>  static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
>                                             ARMMMUIdx mmu_idx,
>                                             CPUARMTBFlags flags)
> @@ -10777,8 +10810,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>  {
>      CPUARMTBFlags flags = {};
>      int el = arm_current_el(env);
> +    uint64_t sctlr = arm_sctlr(env, el);
>
> -    if (arm_sctlr(env, el) & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
>
> @@ -10871,7 +10905,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>
>      sctlr = regime_sctlr(env, stage1);
>
> -    if (sctlr & SCTLR_A) {
> +    if (aprofile_require_alignment(env, el, sctlr)) {
>          DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
>      }
>
> --
> 2.34.1

thanks
-- PMM

