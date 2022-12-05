Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B33642DFD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 17:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Eik-00028Y-Sj; Mon, 05 Dec 2022 11:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Eie-00028L-0S
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:53:28 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Eic-0000jS-3i
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 11:53:27 -0500
Received: by mail-pj1-x1036.google.com with SMTP id q15so10755139pja.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 08:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c3nhnS0uOfxB5Sl+YA+hc5QY0nqSrnGy+LXSk7P0RfA=;
 b=vWyKbuCYWo/UKJE015xdKqTPIXrcYQCqBaxXRSufMTg/Ob7TwBClntHKnwrzskpjzE
 d4+2PrLtgIvoQxXvC1cpkIePjLD9Bm0m73UCY+zho4rRwBTOm3x1tm83QnJoDGuTfOyk
 8e8UHYnv4i97c1BAWy3BqEbow+g69KjKY2Ahba/7vrwGs+Xcl5VS6cW3DQ2VeTmoOFIu
 CjyLS0Dhb1zEHRC8rjGbodPRdtpTs1vqsglUE6w43RmsATCTuStEFTufktQp9iQDLvnV
 S5Eu+VDW9asAznBjGwKOm/WU53cP4PjFJV3sQQrOZQv7YaXGeUgSvHUzUm4q1PqBfTh1
 XHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3nhnS0uOfxB5Sl+YA+hc5QY0nqSrnGy+LXSk7P0RfA=;
 b=BbuF4bgL/fjrhiiG0TYwgWhNH3D+XU94YOzV6lka2cymb3tH+8Il2yqmuuG7cXNV05
 5KNwohAerhPrAPcZRjKHSvV8XVweg050T9PSndJoBItvBlH47rBVIo7gUd7tQaX0Q3HA
 x2joPL9kdu2GfaZqWMw1H/QpY1R0aqDsbmcrf67sBAmAy6FNXZaa9a/+wBfnwK0O2LCA
 Z0Qvc94SJOm++/QKjuIDQUxBU6ps+6ac+GKwBR5GCvWCumwN0CTOoX81krWToNsKVp7e
 sepsd8kRp3Gq5V0ZbFskm/hNLTV0of4oeAoCXZM2rCScdXjQoyxk9WMZCs57k6lpMBn9
 ze7w==
X-Gm-Message-State: ANoB5pn/lBHf1GcrwK9n++3vco7PHkda0Zmpwc5XlFqIscxAC6nFDmVc
 mlQImDl5pG7n9FeokrfQ6m5aIeUQLlzBu/MJHW6ih0USkN9nZw==
X-Google-Smtp-Source: AA0mqf45URxa/QAVsMeTB3s6GjiwXYINb1vjQugn/j4RelTPrMmif9klet1cRht/q02Y/JIJcrfbgeKn2P/rKsL58sU=
X-Received: by 2002:a17:90a:ac0b:b0:219:9874:c7d3 with SMTP id
 o11-20020a17090aac0b00b002199874c7d3mr15082465pjq.221.1670259204545; Mon, 05
 Dec 2022 08:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-7-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-7-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 16:53:13 +0000
Message-ID: <CAFEAcA-terJNAg4owNJQKBGR=Vojz=uy1iQ9z5jWN7rjnew1ZA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] target/arm: Add PMSAv8r functionality
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> Add PMSAv8r translation.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/ptw.c | 127 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 105 insertions(+), 22 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 7d19829702..0514a83c1b 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1758,9 +1758,14 @@ static bool pmsav7_use_background_region(ARMCPU *c=
pu, ARMMMUIdx mmu_idx,
>
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_=
MASK;
> -    } else {
> -        return regime_sctlr(env, mmu_idx) & SCTLR_BR;
>      }
> +
> +    if (arm_feature(env, ARM_FEATURE_V8) &&
> +        ((mmu_idx =3D=3D ARMMMUIdx_Stage2) || (mmu_idx =3D=3D ARMMMUIdx_=
Stage1_E0))) {
> +        return false;
> +    }

You don't need to check mmu_idx =3D=3D ARMMMUIdx_Stage1_E0 here,
because we've already returned false if is_user earlier.
You don't need to check for ARM_FEATURE_V8, because we won't
ever get here with ARMMMUIdx_Stage2 unless we have v8. So
this simplifies to

if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
    return false;
}

> +
> +    return regime_sctlr(env, mmu_idx) & SCTLR_BR;
>  }

> @@ -2074,21 +2126,46 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t=
 address,
>              xn =3D 1;
>          }
>
> -        result->f.prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        if (regime_el(env, mmu_idx) =3D=3D 2) {
> +            result->f.prot =3D simple_ap_to_rw_prot_is_user(ap,
> +                                            mmu_idx !=3D ARMMMUIdx_E2);
> +        } else {
> +            result->f.prot =3D simple_ap_to_rw_prot(env, mmu_idx, ap);
> +        }
> +
> +        if (!arm_feature(env, ARM_FEATURE_M)) {
> +
> +            if (regime_sctlr(env, mmu_idx) & SCTLR_WXN &&
> +                result->f.prot & PAGE_WRITE && mmu_idx !=3D ARMMMUIdx_St=
age2) {
> +                xn =3D 0x1;
> +            }
> +
> +            if ((regime_el(env, mmu_idx) =3D=3D 1) &&
> +                regime_sctlr(env, mmu_idx) & SCTLR_UWXN && ap =3D=3D 0x1=
) {
> +                pxn =3D 0x1;
> +            }
> +
> +            uint8_t attrindx =3D extract32(matched_rlar, 1, 3);
> +            uint64_t mair =3D env->cp15.mair_el[regime_el(env, mmu_idx)]=
;
> +            uint8_t sh =3D extract32(matched_rlar, 3, 2);

Don't declare variables in the middle of a code block, please.

> +            result->cacheattrs.is_s2_format =3D false;
> +            result->cacheattrs.attrs =3D extract64(mair, attrindx * 8, 8=
);
> +            result->cacheattrs.shareability =3D sh;
> +        }
> +
>          if (result->f.prot && !xn && !(pxn && !is_user)) {
>              result->f.prot |=3D PAGE_EXEC;
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
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        fi->level =3D 1;
> +    }
>      return !(result->f.prot & (1 << access_type));
>  }
>
> @@ -2649,7 +2726,13 @@ static bool get_phys_addr_twostage(CPUARMState *en=
v, S1Translate *ptw,
>      cacheattrs1 =3D result->cacheattrs;
>      memset(result, 0, sizeof(*result));
>
> -    ret =3D get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, resul=
t, fi);
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> +        ret =3D get_phys_addr_pmsav8(env, ipa, access_type,
> +                                   ptw->in_mmu_idx, is_secure, result, f=
i);
> +    } else {
> +        ret =3D get_phys_addr_lpae(env, ptw, ipa, access_type,
> +                                 is_el0, result, fi);
> +    }
>      fi->s2addr =3D ipa;
>
>      /* Combine the S1 and S2 perms.  */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

