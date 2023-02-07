Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7568DC7B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPZe-0001nE-7I; Tue, 07 Feb 2023 10:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPZc-0001mC-Au
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:07:56 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPZZ-0007Oj-Ol
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:07:56 -0500
Received: by mail-pf1-x42c.google.com with SMTP id ea13so1683707pfb.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fAltMcuXk5nHD2gmnYFO7HpFbgteV7lw0CrjjJIcs38=;
 b=jgwXULle1QOoPatKUrkd3WNvuUyLNHyCDatn6MCPcm92b3fh1cpLotW1KrKD/Dyf6O
 yh94cShlB4yjuVLcffNQKAjlthS0Mlj3Owc2jBBsQceyWCbsz8nzy22mavnFoIbe3NCb
 Iw1A9EshTcaF21fLeKp9mhVgd2CVAjotkrAZRt6F4GzfWaD/OBQn31ECy0oKookaZ3NR
 n9GWTMZO/qM0ZmIY7ev3YoWi3MF/J7YyR4cXl4zUNlhDzWO5yTBLQSSN0Jt9s2sCJRx9
 VdnktgUMZFXxZ5nP2LoJzys9PChuVlCfrSFYVKfIVyoyA4QXOIcp5SUQ3PkjlalGkWJC
 2MPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fAltMcuXk5nHD2gmnYFO7HpFbgteV7lw0CrjjJIcs38=;
 b=xAku7v26R+tUKBn91ZP1SSWOzjZXbY4l422TYorg+xr5I29cwyyim87y+gqipZSfk4
 1PaUBY+MjTCTG8l5jSCw/AfMU6ijWAcIJu7MjrVK/uBuVCy/CtQEFGWWPyK3s0WzEjp3
 hnRMHTYrQ6Whs9Ga59Xs+351EBwiZ5wPNs/qp7j7m2SfFPPns6D5eBWYnWp5A0fhMAzS
 ET8AFqzHTPxuC9aiiW6JLa0Pyoy2Qw7HkZaTHemA68Qlnly8nwr6OmOGWAstg/ez1PZW
 GdhS15PHHVedXjM6eh6/TPNBf8FKLgrw5X9SEtHa5aMzOFSWf+AMqNmUON2gIzlYhJMv
 tSUg==
X-Gm-Message-State: AO0yUKWnX6mD4b3DMPm8tz9IbwA5nSz811Jv3+2YchV0zSHQXPOm4L0V
 ywmHRgIEHkc0VnVFEfudRB/zG+ZjbhXIDcBx6/o1kw==
X-Google-Smtp-Source: AK7set9RwV95MKsnemD6syHENMxFd3ePEA1HCcxLx4GWpkdGlIQ8TizHV4sFh1ssYL5oJWmVcK6rM2Or5b+9IxuK1nc=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr849940pfb.48.1675782471538; Tue, 07
 Feb 2023 07:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-10-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:07:40 +0000
Message-ID: <CAFEAcA-7Fj5bVn8dTBSR-4jddogWi54MWZJmgXnnycvjnQvZSA@mail.gmail.com>
Subject: Re: [PATCH 09/22] target/arm: Adjust the order of Phys and Stage2
 ARMMMUIdx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It will be helpful to have ARMMMUIdx_Phys_* to be in the same
> relative order as ARMSecuritySpace enumerators. This requires
> the adjustment to the nstable check. While there, check for being
> in secure state rather than rely on clearing the low bit making
> no change to non-secure state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 12 ++++++------
>  target/arm/ptw.c | 10 ++++------
>  2 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cfc62d60b0..0114e1ed87 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3057,18 +3057,18 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
>      ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
>
> -    /* TLBs with 1-1 mapping to the physical address spaces. */
> -    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
> -
>      /*
>       * Used for second stage of an S12 page table walk, or for descriptor
>       * loads during first stage of an S1 page table walk.  Note that both
>       * are in use simultaneously for SecureEL2: the security state for
>       * the S2 ptw is selected by the NS bit from the S1 ptw.
>       */
> -    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
> -    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
> +
> +    /* TLBs with 1-1 mapping to the physical address spaces. */
> +    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
> +    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
>
>      /*
>       * These are not allocated TLBs and are used only for AT system
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 437f6fefa9..59cf64d0a6 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1410,16 +1410,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      descaddr |= (address >> (stride * (4 - level))) & indexmask;
>      descaddr &= ~7ULL;
>      nstable = extract32(tableattrs, 4, 1);
> -    if (nstable) {
> +    if (nstable && ptw->in_secure) {
>          /*
>           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>           * Assert that the non-secure idx are even, and relative order.
>           */

Comment needs updating to match the code change (we're no
longer asserting that the NS indexes are even).

> -        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
> -        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
> -        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
> -        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
> -        ptw->in_ptw_idx &= ~1;
> +        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
> +        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
> +        ptw->in_ptw_idx += 1;
>          ptw->in_secure = false;
>      }
>      if (!S1_ptw_translate(env, ptw, descaddr, fi)) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

