Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366EB62F8CE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow2u2-0005xW-IR; Fri, 18 Nov 2022 10:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow2tu-0005vz-NT
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:03:32 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow2ts-0008He-HS
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:03:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m14so4760934pji.0
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jc0NrMSGbniZPeogugJp0qYLJfcXljR2HPZ5c+WSoM=;
 b=l1FMqPnD6QDmc4V7/mXPSra9NYHLCFrGgesbbJpU/KcgwEZJlDeBShFIGpNwWkIIDJ
 C/UxCR4UsO9h24tIocjo+QQxJBG4BPDSvDo6HGGgAqyC+n0kyc1x5XqIrqZBcBobgcr4
 HND0B7oskDAHa2/RxV/agmh+vaChUfPW3k0rSeinBi4C3ac8AL8uLQqJC67ltSBiib32
 H/ZL8FsqLD390CXdRTreAKofFI6q0KhhGgThrNjG/jQE74ifaEO3nAVcfNz5YuCkmIYs
 U+s1mCdlvDSvkkGL1uZYNEpTpSwwBugQkb2XXOUR8RYagOaV8LvuEm6OdBrp13Y9JKo6
 0zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jc0NrMSGbniZPeogugJp0qYLJfcXljR2HPZ5c+WSoM=;
 b=norpwXqJzvyk9jlsc9AeEyZ/Okg0IjqZmRLc4phQPZj2zILKKLh/YhFsLa7AvpdoJY
 B3uQxW+Kl7rbh0jZ+z9rGWtVQOLjTbZe9Sgu04a+K6+GgAd/BZDf71PF9ZMI4C7Q97SE
 KtHcSZf764Xwv4D2nSQf/a6O11MPnj4eMGWioa3dDVFb5Lyqh00GHf2+/L7TTp9TMnak
 BIMMK7tFvkR41ZO+vpvVpYCaJGb6qETyOhzQbOpGufnmj0RKyG/xesNgemIw7KNfdiC0
 qE4mbU3lNjb5oIoakX50zsTGSpIAlZH9jVnHaHZZ2FW8NAaHMAv/fj6F8N7BpqmNlA6p
 IWbQ==
X-Gm-Message-State: ANoB5pnCcrfcu60XbS88ESDoKDLgYhFACUNnqoa8otxKma4ec1dGjQMQ
 e6ecUgpi4Kb4ICdsYwkloIsEy5yVI/tdFrevKXHXgw==
X-Google-Smtp-Source: AA0mqf5aIsKC7m7voXB1jkH8II9fjkENtudWCyUI6Szn+Sl3xCgKBh+mjkerGXyk4T3Q9Cv0d8ISvutnCastcCSqszM=
X-Received: by 2002:a17:902:bb8b:b0:185:4ec3:c708 with SMTP id
 m11-20020a170902bb8b00b001854ec3c708mr8038643pls.60.1668783806506; Fri, 18
 Nov 2022 07:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-7-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-7-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:03:13 +0000
Message-ID: <CAFEAcA8PQUPFbKeKn_f_E9U7EvUR2qoABK64h82i--FV5bo90w@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] target/arm: Add PMSAv8r functionality
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Add PMSAv8r translation.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/ptw.c | 130 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 110 insertions(+), 20 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 4bd7389fa9..a5d890c09a 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1503,6 +1503,23 @@ static bool pmsav7_use_background_region(ARMCPU *c=
pu, ARMMMUIdx mmu_idx,
>
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_=
MASK;
> +    } else if (arm_feature(env, ARM_FEATURE_PMSA)) {
> +        if (regime_el(env, mmu_idx) =3D=3D 2) {
> +            if (mmu_idx !=3D ARMMMUIdx_E2) {
> +                return false;
> +            } else if ((mmu_idx =3D=3D ARMMMUIdx_E2)
> +                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
> +                return false;
> +            }
> +        } else {
> +            if (mmu_idx !=3D ARMMMUIdx_Stage1_E1) {
> +                return false;
> +            } else if ((mmu_idx =3D=3D ARMMMUIdx_Stage1_E1)
> +                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
> +                return false;
> +            }
> +        }
> +        return true;
>      } else {
>          return regime_sctlr(env, mmu_idx) & SCTLR_BR;
>      }

This logic seems rather confused:

(1) it's not possible to get to this function unless ARM_FEATURE_PMSA,
so the explicit check for that means the final "else" clause is now
unreachable code.

(2) You check for eg "mmu_idx !=3D ARMMMUIdx_E2" and return early,
but that means that in the following
    ((mmu_idx =3D=3D ARMMMUIdx_E2)
                       &&!(regime_sctlr(env, mmu_idx) & SCTLR_BR))
the first clause of the && is always true and is redundant.

(3) the thing we end up actually checking (SCTLR_BR for the
regime SCTLR) is the same now in all three major branches of
this code, so there's a lot of redundancy.

I think what you actually want here is to identify the set
mmu index values (if any!) that we don't want to do the
SCTLR_BR check for. Then return early for those, and have
a single
 return regime_sctlr(env, mmu_idx) & SCTLR_BR;
for all the cases where checking BR is the right thing.

I think it may actually be the case that there is no mmuidx
value where we don't want to do the SCLTR_BR check, in
which case we don't need to change this function at all.

> @@ -1696,6 +1713,26 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,=
 uint32_t address,
>      return !(result->prot & (1 << access_type));
>  }
>
> +static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             uint32_t secure)
> +{
> +    if (regime_el(env, mmu_idx) =3D=3D 2) {
> +        return env->pmsav8.hprbar[secure];
> +    } else {
> +        return env->pmsav8.rbar[secure];
> +    }
> +}
> +
> +static uint32_t *regime_rlar(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             uint32_t secure)
> +{
> +    if (regime_el(env, mmu_idx) =3D=3D 2) {
> +        return env->pmsav8.hprlar[secure];
> +    } else {
> +        return env->pmsav8.rlar[secure];
> +    }
> +}
> +
>  bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
>                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                         bool secure, GetPhysAddrResult *result,
> @@ -1733,6 +1770,10 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>          *mregion =3D -1;
>      }
>
> +    if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> +        fi->stage2 =3D true;
> +    }
> +
>      /*
>       * Unlike the ARM ARM pseudocode, we don't need to check whether thi=
s
>       * was an exception vector read from the vector table (which is alwa=
ys
> @@ -1749,17 +1790,27 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>              hit =3D true;
>          }
>
> +        uint32_t bitmask;
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            bitmask =3D 0x1f;
> +            fi->level =3D 1;
> +        } else {
> +            bitmask =3D 0x3f;
> +            fi->level =3D 0;
> +        }

We could in theory clean this up a bit, because on M-profile the
"FSR" value is not guest-facing; we only use it internally to pass
around some details of the fault cause, so as long as we're consistent
between the code here that sets fi->level and the code in m_helper.c
that looks at the FSC values we can set it to any value that's convenient.
But for this patchset we should definitely leave the existing M-profile
behaviour the way it is. I might come back and tweak the code once
this R-profile series has landed (or I might not think it worth bothering
and leave it indefinitely :-))

> +
>          for (n =3D region_counter - 1; n >=3D 0; n--) {
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
> @@ -1793,7 +1844,6 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t a=
ddress,
>                   * PMSAv7 where highest-numbered-region wins)
>                   */
>                  fi->type =3D ARMFault_Permission;
> -                fi->level =3D 1;
>                  return true;
>              }
>
> @@ -1803,8 +1853,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>      }
>
>      if (!hit) {
> -        /* background fault */
> -        fi->type =3D ARMFault_Background;
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            fi->type =3D ARMFault_Background;
> +        } else {
> +            fi->type =3D ARMFault_Permission;
> +        }
>          return true;
>      }
>
> @@ -1812,12 +1865,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>          /* hit using the background region */
>          get_phys_addr_pmsav7_default(env, mmu_idx, address, &result->pro=
t);
>      } else {
> -        uint32_t ap =3D extract32(env->pmsav8.rbar[secure][matchregion],=
 1, 2);
> -        uint32_t xn =3D extract32(env->pmsav8.rbar[secure][matchregion],=
 0, 1);
> +        uint32_t matched_rbar =3D regime_rbar(env, mmu_idx, secure)[matc=
hregion];
> +        uint32_t matched_rlar =3D regime_rlar(env, mmu_idx, secure)[matc=
hregion];
> +        uint32_t ap =3D extract32(matched_rbar, 1, 2);
> +        uint32_t xn =3D extract32(matched_rbar, 0, 1);
>          bool pxn =3D false;
>
>          if (arm_feature(env, ARM_FEATURE_V8_1M)) {
> -            pxn =3D extract32(env->pmsav8.rlar[secure][matchregion], 4, =
1);
> +            pxn =3D extract32(matched_rlar, 4, 1);
>          }
>
>          if (m_is_system_region(env, address)) {
> @@ -1825,21 +1880,49 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>              xn =3D 1;
>          }
>
> -        result->prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            /*
> +             * We don't need to look the attribute up in the MAIR0/MAIR1
> +             * registers because that only tells us about cacheability.
> +             */
> +            result->prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        } else {
> +            if (regime_el(env, mmu_idx) =3D=3D 2) {
> +                result->prot =3D simple_ap_to_rw_prot_is_user(ap,
> +                                                mmu_idx !=3D ARMMMUIdx_E=
2);
> +            } else {
> +                result->prot =3D simple_ap_to_rw_prot_is_user(ap,
> +                                                mmu_idx !=3D ARMMMUIdx_S=
tage1_E1);

This second one should be fine as just
     result->prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
I think, because this is the EL1 case.

That in turn means you don't need to have the M-profile case separately,
because M-profile will never have the regime EL be 2.

> +            }

> +
> +            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN
> +                && (result->prot & PAGE_WRITE)) {
> +                xn =3D 0x1;
> +            }

I think that this will apply HSCTLR.WXN on the stage 2 check for
EL1/EL0 accesses, which I don't think is correct. In the pseudocode
HSCTLR.WXN is checked only for stage 1 accesses from EL2, not as
part of stage 2 checking (see AArch32.CheckPermission()).

> +
> +            if ((regime_el(env, mmu_idx) =3D=3D 1) && regime_sctlr(env, =
mmu_idx)
> +                 & SCTLR_UWXN && (ap =3D=3D 0x1)) {

Don't break the line like this, it implies that the precedence
of & is less than that of &&, which it isn't.

> +                xn =3D 0x1;

This should be setting pxn =3D 0x1, because SCTLR.UWXN only means
"unprivileged write permission implies EL1 XN", not "implies XN generally".

> +            }
> +
> +            uint8_t attrindx =3D extract32(matched_rlar, 1, 3);
> +            uint64_t mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)]=
;
> +            uint8_t sh =3D extract32(matched_rlar, 3, 2);
> +            result->cacheattrs.is_s2_format =3D false;
> +            result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8=
);
> +            result->cacheattrs.shareability =3D sh;
> +        }
> +
>          if (result->prot && !xn && !(pxn && !is_user)) {
>              result->prot |=3D PAGE_EXEC;
>          }
> -        /*
> -         * We don't need to look the attribute up in the MAIR0/MAIR1
> -         * registers because that only tells us about cacheability.
> -         */
> +
>          if (mregion) {
>              *mregion =3D matchregion;
>          }
>      }
>
>      fi->type =3D ARMFault_Permission;
> -    fi->level =3D 1;
>      return !(result->prot & (1 << access_type));
>  }
>
> @@ -2348,8 +2431,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong =
address,
>              cacheattrs1 =3D result->cacheattrs;
>              memset(result, 0, sizeof(*result));
>
> -            ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx=
,
> -                                     is_el0, result, fi);
> +            /* S1 is done. Now do S2 translation.  */
> +            if (arm_feature(env, ARM_FEATURE_PMSA)) {
> +                ret =3D get_phys_addr_pmsav8(env, ipa, access_type, s2_m=
mu_idx,
> +                                       is_secure, result, fi);
> +            } else {
> +                ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu=
_idx,
> +                                        is_el0, result, fi);
> +            }
> +

This bit of code has unfortunately changed a lot due to a
recent refactoring landing...

>              fi->s2addr =3D ipa;
>
>              /* Combine the S1 and S2 perms.  */
> --
> 2.34.1

thanks
-- PMM

