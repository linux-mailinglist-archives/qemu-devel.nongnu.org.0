Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2D5BEEDC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:00:52 +0200 (CEST)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakMN-0006Iu-0B
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafQS-00049y-Kj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:44:44 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafQP-0002UU-4J
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:44:44 -0400
Received: by mail-ej1-x632.google.com with SMTP id l14so7164529eja.7
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=f3OOuq7G2utd6Kl5pM+LB6T0p6nllc8GVPOH6d9hJ4g=;
 b=XVU54dkSSGg9jA7VelaKho3XCL92W6cy3dqdg/cusW2kghxWw28Xe6jJ8Svg0WryqF
 yRDrfEfjooGauvRXTiInPV3fC3SUa4WaDFgOm8+Tfa/xi0fQ/lMsR4C1e7bliFPg/9Ia
 cWXF4g1LQqfWkwg/rcTVsevGL+cPNSiqwWZgFZvPARnQVxdGRYUj+WC966wB73/60nt/
 AmeE77aYFtRjyYYX7wpIN1vMLkioMdlqPBc6bdjHAFCcNipnjYPDN2/lR2lSmuuvqk7c
 p2N4+ChtfEPP7NlrNMHz/od2GXL0Amcpv/yvlw3o7zws1KHoPmIns4gY511HP7CQLqGq
 DxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=f3OOuq7G2utd6Kl5pM+LB6T0p6nllc8GVPOH6d9hJ4g=;
 b=jR0FbNuFCSsuRAMo0vE/zUp/6qxUzDszuB9CqmLVa6Xlce3NUeJb8uBFMOlh8qeU96
 jIY4ZiKNabnPwd4A8U/okaF9B+NdUvi28aulZlTPgS2pDF5zNyR8f+W4CJsmDlNam08T
 keonYqaplDTaQt+DZ4OH8EvA3Dfznxd5atf746Brggaux5hplKrB4i27StOcd9a6yB9j
 j+wilgj1xlIp7MIwWuKvoh6viXxWo1pW7rUmU3MBP7id4rgKaXJW7A1+/g9ZU8X6Zq09
 7Ituj5spxcJMBkTcXIKm6VVYv0/RB84J9O09yYKoLz2NP5vxuPjzDa0i1bnZ/ffa9MgY
 WDpw==
X-Gm-Message-State: ACrzQf0zWJsxjKu1yOlaig/UJFauWXcTP4uNruw4S5TWQ2BFiJ6mIQPl
 /ghGcO85yiv1M/fWIkzk7P7xEYTLUlh2POrqCJS61A==
X-Google-Smtp-Source: AMsMyM4xHP9sbLigV8L/Vsb+/L1Gdx5Nv+8WXuKuAUZFUcPgatpc/5oSoO5l5TKJGlO2As2+nagcujKcOAFw5LflNrA=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr17239012ejc.555.1663688679524; Tue, 20
 Sep 2022 08:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-27-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:44:27 +0100
Message-ID: <CAFEAcA8WfVEfrtk9EweJ=Dk8SwXLkpb-P6x6XYCj2AJtXNpfUg@mail.gmail.com>
Subject: Re: [PATCH v2 26/66] target/arm: Fold secure and non-secure a-profile
 mmu indexes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Mon, 22 Aug 2022 at 18:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For a-profile, which does not bank system registers,

32-bit A-profile has a pile of banked system registers...

> it takes
> quite a lot of code to switch between security states.  In the
> process, registers such as TCR_EL{1,2} must be swapped, which in
> itself requires the flushing of softmmu tlbs.  Therefore it
> doesn't buy us anything to separate tlbs by security state.
>
> Retain the distinction between Stage2 and Stage2_S.
>
> This will be important as we implement FEAT_RME, and do not
> wish to add a third set of mmu indexes for Realm state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h     |   2 +-
>  target/arm/cpu.h           |  69 +++++++-----------
>  target/arm/internals.h     |  31 +-------
>  target/arm/helper.c        | 144 +++++++++++++------------------------
>  target/arm/ptw.c           |  25 ++-----
>  target/arm/translate-a64.c |   8 ---
>  target/arm/translate.c     |   6 +-
>  7 files changed, 83 insertions(+), 202 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..08681828ac 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -32,6 +32,6 @@
>  # define TARGET_PAGE_BITS_MIN  10
>  #endif
>
> -#define NB_MMU_MODES 15
> +#define NB_MMU_MODES 8
>
>  #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ee94d8e653..cea2121f67 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2873,26 +2873,26 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>   *     table over and over.
>   *  6. we need separate EL1/EL2 mmu_idx for handling the Privileged Access
>   *     Never (PAN) bit within PSTATE.
> + *  7. we fold together the secure and non-secure regimes for A-profile,
> + *     because there are no banked system registers,

ditto

> so the process of
> + *     switching between secure and non-secure is already heavyweight.
>   *
>   * This gives us the following list of cases:
>   *
> - * NS EL0 EL1&0 stage 1+2 (aka NS PL0)
> - * NS EL1 EL1&0 stage 1+2 (aka NS PL1)
> - * NS EL1 EL1&0 stage 1+2 +PAN
> - * NS EL0 EL2&0
> - * NS EL2 EL2&0
> - * NS EL2 EL2&0 +PAN
> - * NS EL2 (aka NS PL2)
> - * S EL0 EL1&0 (aka S PL0)
> - * S EL1 EL1&0 (not used if EL3 is 32 bit)
> - * S EL1 EL1&0 +PAN
> - * S EL3 (aka S PL1)
> + * EL0 EL1&0 stage 1+2 (aka NS PL0)
> + * EL1 EL1&0 stage 1+2 (aka NS PL1)
> + * EL1 EL1&0 stage 1+2 +PAN
> + * EL0 EL2&0
> + * EL2 EL2&0
> + * EL2 EL2&0 +PAN
> + * EL2 (aka NS PL2)
> + * EL3 (aka S PL1)
>   *
>   * for a total of 11 different mmu_idx.

This number needs updating :-)

>   *
>   * R profile CPUs have an MPU, but can use the same set of MMU indexes
> - * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
> - * NS EL2 if we ever model a Cortex-R52).
> + * as A profile. They only need to distinguish EL0 and EL1 (and
> + * EL2 if we ever model a Cortex-R52).
>   *

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 09990ca096..b9f1a3d826 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1671,6 +1671,7 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>      /* Begin with base v8.0 state.  */
>      uint32_t valid_mask = 0x3fff;
>      ARMCPU *cpu = env_archcpu(env);
> +    uint64_t changed;
>
>      /*
>       * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
> @@ -1730,7 +1731,22 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>
>      /* Clear all-context RES0 bits.  */
>      value &= valid_mask;
> -    raw_write(env, ri, value);
> +    changed = env->cp15.scr_el3 ^ value;
> +    env->cp15.scr_el3 = value;
> +
> +    /*
> +     * If SCR_EL3.NS changes, i.e. arm_is_secure_below_el3, then
> +     * we must invalidate all TLBs below EL3.
> +     */
> +    if (changed & SCR_NS) {
> +        tlb_flush_by_mmuidx(env_cpu(env), (ARMMMUIdxBit_E10_0 |
> +                                           ARMMMUIdxBit_E20_0 |
> +                                           ARMMMUIdxBit_E10_1 |
> +                                           ARMMMUIdxBit_E20_2 |
> +                                           ARMMMUIdxBit_E10_1_PAN |
> +                                           ARMMMUIdxBit_E20_2_PAN |
> +                                           ARMMMUIdxBit_E2));

In theory I suppose for a CPU without Secure EL2 support we could avoid
flushing the EL2 TLBs, but it's probably not worth worrying about.

> +    }
>  }

Other than the comment/commit message nits,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

