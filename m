Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188E5751DB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:34:59 +0200 (CEST)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0rg-0005UE-Oe
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0mZ-0002Cn-LV
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:29:39 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0mY-00061t-4C
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:29:39 -0400
Received: by mail-yb1-xb30.google.com with SMTP id h62so3755216ybb.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GGMIvLiVOczbGSd7fOeONGP1NijeltCC6lPx8i4VGzU=;
 b=QLg5eAmtNudSMAM5q8RgyHAFhPFMciXz3BWKERRuptTabnxyF44n9+SkHbKSiN9vI6
 z4bFJtkiBiAfsj+aA8n8y8oTU75P9R2CddjgoTPkuHmqskr0Xut9uzLeTkHSgQlmj0lW
 gZ7KbgpNjCj38kZjad4gocsY36V0IGeQVPt837w0B9hBvkv3PXQgaXYWzJka6ajunhnD
 8ylDa7CfslX1Kj9qcgbJBXK66HCMs8+YFPVYSn7yTsR6c+XwcT4RCuT8V3JhxZ9gt/ZD
 Sy4vpVjCvHqsvUC7bAuVoG/+PCIMxP8BUz/8WByHu0KFNBDlvaXU7kTW1SRkiRD1PbZ3
 7ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GGMIvLiVOczbGSd7fOeONGP1NijeltCC6lPx8i4VGzU=;
 b=bjxHBXH1n44nqpLlPogdax3bgIujijX2zE1tj83f7TgXAoNp1761/JHenwsgu9irjY
 zs7x9DEAaTbVoxhCV8l0McxyTK6HmDn4tE9WPXubNEzcXaSiUxk4EtxgNKfzc5jvWV/+
 FFNQ6N18/o78sBQ4h4k2PhuLl/r913dX44PyZPBJ75X39USYhW/loImc1V3egCZd2OFp
 d9P/EI+1I3cIVtcWxF0NJ/dtp/Hhnm2D/HSCNGj6h7yMCMAuy3/qPQUjk4LnToVbaUuA
 AG8v0YDIWyCiZgcylgvPrxxFkaivfn/xSOcSpFUitsD4PFuLkuBiIaQQTbxTJWVM2HJB
 OCdg==
X-Gm-Message-State: AJIora/gBe8zUTZdLLg+ofS1plTP6Zv98bm5aFWrG6hfnMbpM9CCODrS
 6GwWwfrTm6JPmW26EC/nHNFVGDwd+1GktuEp0OPE1w==
X-Google-Smtp-Source: AGRyM1sVgfT/ptOpXt1G5Ge6qIEPn0ESbHqHAMHtb6EmfR6sab9M3LvHN+ZdDxbTS07AmjnhVy+228o3f+REiX8IgGs=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr9140107ybm.288.1657812575862; Thu, 14
 Jul 2022 08:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-5-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-5-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:28:57 +0100
Message-ID: <CAFEAcA9wTophc8NwF2v2Ue+qWkwECKmvp2xJ_d1gjpDDjdTUuA@mail.gmail.com>
Subject: Re: [PATCH 04/11] target/arm: Make RVBAR available for non AARCH64
 CPUs
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
> The ARM Cortex-R52 is not AARCH64 but uses RVBAR.
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  target/arm/cpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1b5d535788..2c26a5387d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -258,6 +258,10 @@ static void arm_cpu_reset(DeviceState *dev)
>          env->cp15.cpacr_el1 =3D FIELD_DP64(env->cp15.cpacr_el1,
>                                           CPACR, CP11, 3);
>  #endif
> +        if (arm_feature(env, ARM_FEATURE_V8_R)) {
> +            env->cp15.rvbar =3D cpu->rvbar_prop;
> +            env->regs[15] =3D cpu->rvbar_prop;
> +        }
>      }
>
>  #if defined(CONFIG_USER_ONLY)
> @@ -1273,7 +1277,8 @@ void arm_cpu_post_init(Object *obj)
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_prop=
erty);
>      }
>
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) ||
> +        arm_feature(&cpu->env, ARM_FEATURE_V8_R)) {

Rather than doing this, we should correct the feature bit
being tested -- the RVBAR register itself is present on all
v8 CPUs, so we should correspondingly provide the property on
all v8 CPUs, by checking ARM_FEATURE_V8 (ie the same check we
use for whether to add the RVBAR register definition).

>          object_property_add_uint64_ptr(obj, "rvbar",
>                                         &cpu->rvbar_prop,
>                                         OBJ_PROP_FLAG_READWRITE);
> --

thanks
-- PMM

