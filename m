Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD645EC727
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:03:16 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odC77-0004jv-4k
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAWB-0005BU-Mf
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:21:00 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odAW8-0005Oh-T0
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:20:58 -0400
Received: by mail-ed1-x532.google.com with SMTP id y8so13166734edc.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=DLGWnTVTFvxUfemaN9J52EFGjl49/8KYzb2zJJQVPC0=;
 b=UHqZNL53KczBTgCti13zB/iv4+PT3XvgFSMuhM7vgrvKjELNpWmT3dtfnKiF2REVk0
 4YeOCgc1aifu+2X7ufjExoErAjUnv20PbC1/f1R83hDLPUonwSOkOtH84uLHUd5+FChF
 QZjgZ8cfYVDVD3cZb/0Mkv6KLOtnZDFHmcOLMLp7dO2BKrJTOnhtA5kXwvxeFClnd7Xl
 /fl618OCZcdCb2v0hvzz7SOcui5Zafnkk14RQnHyP3Dc4dG+8YsrOmV1iZYuY6bdUrl4
 ipi1vuNHsDuPhfRbaf8EF9GMNS1FnMOc9XwZmJXHUFvsk0gPsMa5wBkbSlcDAqJTjg3c
 rd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DLGWnTVTFvxUfemaN9J52EFGjl49/8KYzb2zJJQVPC0=;
 b=AfkGeBX2T626l/b3XPQadq4VLpBGPnxBn+jeTB26m7pApZLQMES9lTjehRnRzDoiLG
 QCCqlKNSF6l8+khQa1tnCW/hi3nU0WtTtEbGyaseVh0QogF8bdIDZmHcB2X2kETyG18F
 TI2hmv+gvvtDUUl2UaK/NVp8/BClIgksXXtmgh2kj2SKtrJ/INg5jvumrq7ZcxmBQHPw
 3DzKFDYmCNiNG8fst89AAUn24Q3og9yABrQXkU9S0xF0KUBA9B7zuccLNEDKhz0OMDpn
 LKrwfzUWpPIF/1LG/TZa9sSLbU2QLuOLSI6QxQsfVY24LL8/wstKKHzYx3qZYEYwpfHk
 lR3g==
X-Gm-Message-State: ACrzQf0ayhfq2c2fJurctznJFER60TwINDtx/89xq/M0z2OX+yM6ojht
 ObzjL0oROSj8NcIlLr+MoxOUmCdvoLfw10JgNGwddA==
X-Google-Smtp-Source: AMsMyM65gW+CQFzu9XOKmUdZcyMjcShFPoKM5cGcLpndd/V+LfQpPuf1PiSH3BbSTXM+1Te2d01NJvfs17IauhN7zwU=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr27837452ede.375.1664284853607; Tue, 27
 Sep 2022 06:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-7-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-7-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 14:20:42 +0100
Message-ID: <CAFEAcA9B32y-7-wmPr9LT34gqrZRfK0ygZ_iuy0LDa4VmrEgnw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
> ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
> tough they don't have the TTBCR register.
> See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
> AArch32 architecture profile Version:A.c section C1.2.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/debug_helper.c | 3 ++-
>  target/arm/internals.h    | 3 ++-
>  target/arm/tlb_helper.c   | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index b18a6bd3a2..44b1e32974 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -434,7 +434,8 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *=
env)
>          using_lpae =3D true;
>      } else {
>          if (arm_feature(env, ARM_FEATURE_LPAE) &&
> -            (env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)) {
> +            ((env->cp15.tcr_el[target_el].raw_tcr & TTBCR_EAE)
> +            || arm_feature(env, ARM_FEATURE_V8_R))) {
>              using_lpae =3D true;
>          }
>      }
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index b03049d920..e2a2b03d41 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -254,7 +254,8 @@ static inline bool extended_addresses_enabled(CPUARMS=
tate *env)
>  {
>      TCR *tcr =3D &env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
>      return arm_el_is_aa64(env, 1) ||
> -           (arm_feature(env, ARM_FEATURE_LPAE) && (tcr->raw_tcr & TTBCR_=
EAE));
> +           (arm_feature(env, ARM_FEATURE_LPAE) && ((tcr->raw_tcr & TTBCR=
_EAE)
> +           || arm_feature(env, ARM_FEATURE_V8_R)));
>  }
>
>  /* Update a QEMU watchpoint based on the information the guest has set i=
n the
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 7d8a86b3c4..891326edb8 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -20,7 +20,8 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUI=
dx mmu_idx)
>          return true;
>      }
>      if (arm_feature(env, ARM_FEATURE_LPAE)
> -        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
> +        && ((regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)
> +        || arm_feature(env, ARM_FEATURE_V8_R))) {
>          return true;
>      }
>      return false;

In all of these I think you've put the "is this v8R?" condition
in a weird place in the existing conditional structure. v8R
always uses the extended-address format, so we should have
the test at the same kind of level we have the "is this AArch64?"
test, not buried inside the "if LPAE" test.

Also, you can write the check
  (arm_feature(env, ARM_FEATURE_V8) && arm_feature(ARM_FEATURE_PMSA))
-- I still don't think there is any need for a separate V8_R
feature bit.

thanks
-- PMM

