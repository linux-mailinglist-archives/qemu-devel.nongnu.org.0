Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881C575211
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:41:27 +0200 (CEST)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0xx-0001fN-VB
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0s3-0005uj-O3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:35:21 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:42546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0rz-000751-9N
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:35:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id c131so3099788ybf.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LK+VjHNBgywZePrrnkYNPsVIBgFiCvfCzaxqX9pXLeU=;
 b=t15fV5v6OddkXHLjPofzLNyVvxwN5RwDUCvGcmr0DaBtU59u8LYqH7KKisk/1OIQIr
 lhUzdamfOK+iPSubg7KAo5NNdZ3J1sgSE2aqRn6S9JGaUiO07/J5iZNuVoi6S0IeGug2
 1yN7rRcnwwKh+BvCZXgooSmhbXI1cQK60Cw3VkkmuqLB7ZwX944ReOOPR0kqygYk2sXJ
 C6YthYYp2BHuzigWQLiA6FK+UagGl+aVU3WQ34LWaSIs1NTnCdW8X7tTdnO99aNm1nHd
 qEWRw4j1tpHobH2Z4kLTpjXK13kFLH+B3AtqpOJ/+jc7N5w8pF0HLeESvb0ogcO3l+yF
 hdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LK+VjHNBgywZePrrnkYNPsVIBgFiCvfCzaxqX9pXLeU=;
 b=TtOYg5nk3Y1F/03THP+fDEQisC+v3lKvTSgLhCR4fdE+YdaFSmu1uCsm//ohmFw11I
 pj3cntsiS24tkGdzUCKyxMe62OKRA8cOtVLvRGsPKh7VUlziOGFmnkXZLH8nYKF34YDW
 iwnNJsUVhfWGjvxyhRGzmYdHgphs8VpmuMZjCjyFFQTUTxpbhoVB6E+kLwkKNQQm1Obp
 hto8aiK83vY5L+YchLqZZf+vE7bPGyhn8FuEku0hDUeQiUBF3QkZLpEG9+tN99mdpoj3
 hlwZOnIZsgHD0vbaK+eKUcaBmvXsChifTuIBNs2P9UELbo4GlaBcPtd8N2XzvnGwxC22
 7TEg==
X-Gm-Message-State: AJIora989FHHNSDYMyI46f90Pv87FECrM4rGyPvGPofpP1WNHST/wKRF
 NO+rCJeDz7Zog/ClQiZiGEChW+VvUpQO0FwsOxqtuA==
X-Google-Smtp-Source: AGRyM1u+tWnqVmWUEMwb4nL7S5puFTrfVgBGBc07M6jcPOORslbv0X0/IikniH+SnSBPKOE2XKA5pZSX0ui1w6HZJxA=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9785622ybj.479.1657812912097; Thu, 14
 Jul 2022 08:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-8-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-8-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:34:33 +0100
Message-ID: <CAFEAcA9H5tdkkmS3C7Zb9ufQ=6QP_UZkjn-4nM+A3fzF_Yq0pQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] target/arm: Enable TTBCR_EAE for ARM_FEATURE_V8_R
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> Enable TTBCR_EAE during reset since it's always set to 1 for Cortex-R52.
> See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
> AArch32 architecture profile Version:A.c section C1.2.
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  target/arm/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2c26a5387d..121fc2a819 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -261,6 +261,9 @@ static void arm_cpu_reset(DeviceState *dev)
>          if (arm_feature(env, ARM_FEATURE_V8_R)) {
>              env->cp15.rvbar =3D cpu->rvbar_prop;
>              env->regs[15] =3D cpu->rvbar_prop;
> +            env->cp15.tcr_el[0].raw_tcr =3D TTBCR_EAE;
> +            env->cp15.tcr_el[1].raw_tcr =3D TTBCR_EAE;
> +            env->cp15.tcr_el[2].raw_tcr =3D TTBCR_EAE;
>          }
>      }

R-profile doesn't have a TTBCR, so I'm not sure this is the right way
to handle this behaviour requirement... Probably extended_addresses_enabled=
()
and similar places should just return true for v8 PMSA.

-- PMM

