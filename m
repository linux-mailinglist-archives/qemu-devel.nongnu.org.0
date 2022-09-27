Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700945ECA7B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:07:43 +0200 (CEST)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odE3a-0002jV-I0
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDNO-0001Mn-9j
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:24:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odDNL-0005u8-Vi
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:24:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lc7so21928440ejb.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=s4TePUbEm5ZJ+hoIVFkJJmEbtatETibpsb0u7wLpQso=;
 b=UjYjeNCYUJvVuL62igJYJ3fCFPT+7kGsOVXRB8wo9RvoiVzyFpY/G/p88J0ejy1k0a
 S+iX0vvVAMTiHWubc7iZBZroZW1dVZ14hjclIxweRjTPQ7J5bdxwqK3FKZFRCk42DERF
 bVLXioy0WtZMLx8uvcJOHZ+xrP5e3kgOLeRHF/h9cqWDktOpXbQYdZ2lKLiVU893DrDB
 B+cNgiS3vAmoecHL3goCpfFK9UiZRd7b0axfezC/RnbHEpVrTyArPtvL6d6gMPK37O2A
 RMQULNujKzNL6m83ECXQ9Qa0MhnpXEcDfIg1xWieuKwWkD54xXRzLIhqK4FO4gCRsLec
 N84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s4TePUbEm5ZJ+hoIVFkJJmEbtatETibpsb0u7wLpQso=;
 b=oCeOebHo1r89F8fT2XQxr3dbhhHb62IOHIBaezYVoloqaREhglFhfblLKyAGhjaoIc
 TgrtGzHR7TVmdJGc8uPelXGFd+p7CatkssHhW+nfdKUvWObgjkVzDaNsu9XGkcCWtFeM
 U79Imw37I5H9Ga9eub6DHrZtzjwjR/ly9glrM4aL+qVzSM1zVTpOj1WQQgYhlv4ANpID
 8g5G/OHc4Np12psYueK2nhyG1PeMBowoMClHdUNySBYnA6JccoTZu8JCg8JeNPp6/DTd
 RNDlilNHALbdz5/68Udv8AurIwPZ9siENUA9iafjMDpxkcX9uDNZV3J+cuNLX0/f9eK3
 ZP6g==
X-Gm-Message-State: ACrzQf3aQtQRnycOUb0XP05D8W1wM/vdgrSB+goSBifNJ33hnwxzwIPh
 OZw8kQ6idruOno0VVJsyfnQi4AtnmqSIZz8MlFwnxw==
X-Google-Smtp-Source: AMsMyM4sb4hBZ2zqKEaGL252FM+mEyOES5CjZEyBr7GA0lr6TfHHQBoK79kAdqZQYvpPvB+06UTzupjWN2HM4o7Xf7o=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr23085364ejc.365.1664295841117; Tue, 27
 Sep 2022 09:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-9-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-9-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 17:23:49 +0100
Message-ID: <CAFEAcA9s+A7T1JkUcxZ2WOddSaf99V_+xMq7WUbj4Mw5rOJTBQ@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] target/arm: Add PMSAv8r functionality
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Add PMSAv8r translation.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/ptw.c | 171 +++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 150 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index c4f5721012..c7e37c66d0 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -140,6 +140,9 @@ static bool regime_translation_disabled(CPUARMState *=
env, ARMMMUIdx mmu_idx)
>               */
>              return true;
>          }
> +    } else if (arm_feature(env, ARM_FEATURE_V8_R)) {

In general I think you can replace all these checks on
ARM_FEATURE_V8_R with suitable other tests. I've suggested
various ones in the code below.

> +        return !(regime_sctlr(env, mmu_idx) & SCTLR_M) ||
> +        (!(regime_el(env, mmu_idx) =3D=3D 2) && arm_hcr_el2_eff(env) & H=
CR_TGE);
>      }

This doesn't look right. What goes wrong if you just use the v8A code?
In particular v8R still needs to consider HCR.TGE and HCR.DC, same
as v8A, as far as I can see.

>      hcr_el2 =3D arm_hcr_el2_eff(env);
> @@ -1504,6 +1507,8 @@ static bool pmsav7_use_background_region(ARMCPU *cp=
u, ARMMMUIdx mmu_idx,
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
>              & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
> +    } else if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        return false;
>      } else {
>          return regime_sctlr(env, mmu_idx) & SCTLR_BR;
>      }

What's going on here? v8R still has SCTLR.BR to enable the background regio=
n.

> @@ -1698,6 +1703,77 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,=
 uint32_t address,
>      return !(*prot & (1 << access_type));
>  }
>
> +static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             uint32_t secure)
> +{
> +    if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        if (regime_el(env, mmu_idx) =3D=3D 2) {
> +            return env->pmsav8.hprbarn;
> +        } else {
> +            return env->pmsav8.prbarn;
> +        }
> +    } else {
> +         return env->pmsav8.rbar[secure];
> +    }

If you set up the CPU state fields correctly (as noted in the
previous patch) then you shouldn't need to test a feature bit
at all here -- M profile and R profile should be able to share
the same pmsav8.rbar[] array for stage 1, and for M-profile
regime_el() will never be 2 so it won't go into those parts
of the function.

> +}
> +
> +static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             uint32_t secure)
> +{
> +    if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        if (regime_el(env, mmu_idx) =3D=3D 2) {
> +            return env->pmsav8.hprlarn;
> +        } else {
> +            return env->pmsav8.prlarn;
> +        }
> +    } else {
> +        return env->pmsav8.rlar[secure];
> +    }
> +}
> +
> +static inline void get_phys_addr_pmsav8_default(CPUARMState *env,
> +                                                ARMMMUIdx mmu_idx,
> +                                                uint32_t address, int *p=
rot)
> +{
> +    if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        *prot =3D PAGE_READ | PAGE_WRITE;
> +        if (address <=3D 0x7FFFFFFF) {
> +            *prot |=3D PAGE_EXEC;
> +        }
> +        if ((regime_el(env, mmu_idx) =3D=3D 2)
> +            && (regime_sctlr(env, mmu_idx) & SCTLR_WXN)
> +            && (regime_sctlr(env, mmu_idx) & SCTLR_M)) {
> +            *prot &=3D ~PAGE_EXEC;
> +        }

Put the default handling in get_phys_addr_pmsav7_default(), not
as a wrapper function around it. In particular the stage 1
default is the same as the existing R-profile default map,
so you can just use that code. And PMSAv7 will never have
stage 2, so you can add any code to handle stage 2's default
map without conditionalizing it on "is this v8R?".

Trying to handle SCTLR.WXN and SCTLR.M here looks wrong in
two ways:
(1) the default memory maps are not documented as depending on
either of those two bits
(2) those bits don't affect only stage 2.

> +    } else {
> +        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
> +    }
> +}
> +
> +static bool pmsav8_fault(bool hit, CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        if (regime_el(env, mmu_idx) =3D=3D 2) {
> +            if (!hit && (mmu_idx !=3D ARMMMUIdx_E2)) {
> +                return true;
> +            } else if (!hit && (mmu_idx =3D=3D ARMMMUIdx_E2)
> +                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
> +                return true;
> +            }
> +        } else {
> +            if (!hit && (mmu_idx !=3D ARMMMUIdx_Stage1_E1)) {
> +                return true;
> +            } else if (!hit && (mmu_idx =3D=3D ARMMMUIdx_Stage1_E1)
> +                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
> +                return true;
> +            }
> +        }
> +        return false;
> +    } else {
> +        return !hit;
> +    }
> +}
> +
>  bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
>                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                         hwaddr *phys_ptr, MemTxAttrs *txattrs,
> @@ -1730,6 +1806,12 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>          *mregion =3D -1;
>      }
>
> +    if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +        if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> +            fi->stage2 =3D true;
> +        }

No need to guard this with a V8_R check, because there's no other
way you'll get here with a stage 2 mmu index.

> +    }
> +
>      /*
>       * Unlike the ARM ARM pseudocode, we don't need to check whether thi=
s
>       * was an exception vector read from the vector table (which is alwa=
ys
> @@ -1746,17 +1828,26 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>              hit =3D true;
>          }
>
> +        uint32_t bitmask;
> +        if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +            bitmask =3D 0x3f;
> +        } else {
> +            bitmask =3D 0x1f;
> +        }

You can avoid a v8R check here by doing an "is this M profile" feature
test instead.

> +
> +
>          for (n =3D (int)cpu->pmsav7_dregion - 1; n >=3D 0; n--) {
>              /* region search */
>              /*
> -             * Note that the base address is bits [31:5] from the regist=
er
> -             * with bits [4:0] all zeroes, but the limit address is bits
> -             * [31:5] from the register with bits [4:0] all ones.
> +             * Note that the base address is bits [31:x] from the regist=
er
> +             * with bits [x-1:0] all zeroes, but the limit address is bi=
ts
> +             * [31:x] from the register with bits [x:0] all ones. Where =
x is
> +             * 5 for Cortex-M and 6 for Cortex-R
>               */
> -            uint32_t base =3D env->pmsav8.rbar[secure][n] & ~0x1f;
> -            uint32_t limit =3D env->pmsav8.rlar[secure][n] | 0x1f;
> +            uint32_t base =3D regime_rbar(env, mmu_idx, secure)[n] & ~bi=
tmask;
> +            uint32_t limit =3D regime_rlar(env, mmu_idx, secure)[n] | bi=
tmask;
>
> -            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
> +            if (!(regime_rlar(env, mmu_idx, secure)[n] & 0x1)) {
>                  /* Region disabled */
>                  continue;
>              }
> @@ -1799,22 +1890,25 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>          }
>      }
>
> -    if (!hit) {
> -        /* background fault */
> -        fi->type =3D ARMFault_Background;
> +    if (pmsav8_fault(hit, env, mmu_idx)) {
> +        fi->type =3D ARMFault_Permission;
> +        fi->level =3D 0;
>          return true;
>      }

This code change looks like it's going to break the v8M reporting
of background faults.

>
>      if (matchregion =3D=3D -1) {
>          /* hit using the background region */
> -        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
> +        get_phys_addr_pmsav8_default(env, mmu_idx, address, prot);
>      } else {
> -        uint32_t ap =3D extract32(env->pmsav8.rbar[secure][matchregion],=
 1, 2);
> -        uint32_t xn =3D extract32(env->pmsav8.rbar[secure][matchregion],=
 0, 1);
> +        uint32_t ap =3D extract32(regime_rbar(env,
> +                                mmu_idx, secure)[matchregion], 1, 2);
> +        uint32_t xn =3D extract32(regime_rbar(env,
> +                                mmu_idx, secure)[matchregion], 0, 1);
>          bool pxn =3D false;
>
>          if (arm_feature(env, ARM_FEATURE_V8_1M)) {
> -            pxn =3D extract32(env->pmsav8.rlar[secure][matchregion], 4, =
1);
> +            pxn =3D extract32(regime_rlar(env,
> +                            mmu_idx, secure)[matchregion], 4, 1);
>          }
>
>          if (m_is_system_region(env, address)) {
> @@ -1822,14 +1916,42 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>              xn =3D 1;
>          }
>
> -        *prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +            if (regime_el(env, mmu_idx) =3D=3D 2) {
> +                *prot =3D simple_ap_to_rw_prot_is_user(ap,
> +                                                mmu_idx !=3D ARMMMUIdx_E=
2);
> +            } else {
> +                *prot =3D simple_ap_to_rw_prot_is_user(ap,
> +                                                mmu_idx !=3D ARMMMUIdx_S=
tage1_E1);
> +            }
> +
> +            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN
> +                && (*prot & PAGE_WRITE)) {
> +                xn =3D 0x1;
> +            }
> +
> +            if ((regime_el(env, mmu_idx) =3D=3D 1) && regime_sctlr(env, =
mmu_idx)
> +                 & SCTLR_UWXN && (ap =3D=3D 0x1)) {
> +                xn =3D 0x1;
> +            }
> +
> +            uint8_t attrindx =3D extract32(regime_rlar(env,
> +                                         mmu_idx, secure)[matchregion], =
1, 3);
> +            uint64_t mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)]=
;
> +            uint8_t sh =3D extract32(regime_rlar(env,
> +                                   mmu_idx, secure)[matchregion], 3, 2);

The accesses to the rlar/rbar for the matched region have now got cumbersom=
e
enough that we should put them in a local variable at the top of the if().

> +            assert(attrindx <=3D 4);

What is this assert for? The spec says bits [3:1] can take all of the
8 possible values.

> +            cacheattrs->is_s2_format =3D false;
> +            cacheattrs->attrs =3D extract64(mair, attrindx * 8, 8);
> +            cacheattrs->shareability =3D sh;
> +        } else {
> +            *prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        }
> +
>          if (*prot && !xn && !(pxn && !is_user)) {
>              *prot |=3D PAGE_EXEC;
>          }
> -        /*
> -         * We don't need to look the attribute up in the MAIR0/MAIR1
> -         * registers because that only tells us about cacheability.
> -         */

Why drop the comment ? It's still relevant for M profile, so should move
into the M-profile arm of the above check.

> +
>          if (mregion) {
>              *mregion =3D matchregion;
>          }
> @@ -2342,9 +2464,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong =
address,
>              is_el0 =3D mmu_idx =3D=3D ARMMMUIdx_E10_0 || mmu_idx =3D=3D =
ARMMMUIdx_SE10_0;
>
>              /* S1 is done. Now do S2 translation.  */
> -            ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx=
, is_el0,
> -                                     phys_ptr, attrs, &s2_prot,
> -                                     page_size, fi, &cacheattrs2);
> +            if (arm_feature(env, ARM_FEATURE_V8_R)) {

"if PMSA" would be a more obvious check to test here.

> +                ret =3D get_phys_addr_pmsav8(env, ipa, access_type, s2_m=
mu_idx,
> +                                       phys_ptr, attrs, &s2_prot, page_s=
ize,
> +                                       fi, &cacheattrs2);
> +            } else {
> +                ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu=
_idx,
> +                                      is_el0, phys_ptr, attrs, &s2_prot,
> +                                      page_size, fi, &cacheattrs2);
> +            }
> +
>              fi->s2addr =3D ipa;
>              /* Combine the S1 and S2 perms.  */
>              *prot &=3D s2_prot;
> --
> 2.25.1

thanks
-- PMM

