Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18BF591119
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 14:55:44 +0200 (CEST)
Received: from localhost ([::1]:51186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMUCV-0002Er-8x
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 08:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMU93-0006a7-Jy
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 08:52:09 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMU8y-0006Rl-5b
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 08:52:07 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32a17d3bba2so8811927b3.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=9j8Y2hQLN6DUqt6w5q3ISZJIpo9DnK1DVCd3ZtviYHs=;
 b=Ywk0irQw0fLFr6+9txfciL0w5QoHhmlFx7pRJq8Q8ZihBJ6hww5MH5CIc+8eoPoqsS
 UWLzqR1/3tRbfY/M8KSh+UntOjkm8SvycLEIUKkbiFpMmq2cw9QEYwsIEtFliuVuk0ul
 o56jFtx+2lOXUNrz05HpeU7GqGHlrRwnfhv1rUWn50D98/3oJN9DAsDL/yDp4nJEJ+dF
 6PEpmEtsE5YynN17aovj+E8WflYsO3L1xbR4+cDLn1QjzPzegKD0xsXenUjzMFEk4yVO
 MgHn/AdZk/5k1cJIeiNOhg/2i9gRrWONtaDXE+stz4p2Lk+7qjJzN7nVAf/AFbEKhyS9
 YIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=9j8Y2hQLN6DUqt6w5q3ISZJIpo9DnK1DVCd3ZtviYHs=;
 b=NDCxEafKHId87dDRC/1hdmm4KulT1npkC3c+4hiQHk8i6mY4wyco9AJfaMJJRBG4Xt
 Qk9ZZjLbGIBrH3hFOItudTs7HpmjhJPP0J/Zcp9MSI0k0kwcGGYiOza8fhhXrvJFX5Ml
 mSiFS7JYmM2D2cbi2+NN+4xVLbcFOHHEhPy5v1MT68rFLtRhvsIkq8rG86NUsMjBan5x
 mFX+Y7bsqMCw4eFvaBWVp8jNC0f2AWPXNyWAp7wrCEMhcfb4rSnAkC0pJQMqUu0oDpyl
 Ln8mdZtUhFMBcZspFaYz/bJ27OHHA+XkCz8Giz973vqWxPQE4eqrRUIq09WwuGrYbUau
 1J5Q==
X-Gm-Message-State: ACgBeo1lgx1mwlbg3c+TDhZfT42pASCrgfpFcu4lEteKKmwjsN4EBrDI
 5beDJjcKGD5DCmZKsM/k2MKiTSgq2Pg7OEyMLWPDkg==
X-Google-Smtp-Source: AA6agR6N7J+5f9JRdjsmnxwY+g/VdLMbg3CTgm5B7PRSWJrmjyt0IMUL4OKwPClMA/vKJYydvgxVdAlKmQFT3XQdrIY=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr3672085ywc.469.1660308723044; Fri, 12
 Aug 2022 05:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220718115433.802-1-quic_trohmel@quicinc.com>
 <20220718115433.802-3-quic_trohmel@quicinc.com>
In-Reply-To: <20220718115433.802-3-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 13:51:52 +0100
Message-ID: <CAFEAcA_-uX0BqHTm_4NqGGoF_AJ5LZD0Gp_0Pyx4WAZV_BpRLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] target/arm: Don't add all MIDR aliases for Cortex-R
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 18 Jul 2022 at 12:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> Cortex-R52 has the MPUIR register which has the same encoding
> has the MIDR alias with opc2=3D4. So we only add that alias
> when we are not realizing a Cortex-R.
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  target/arm/helper.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6457e6301c..03bdc3d149 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8189,9 +8189,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .fieldoffset =3D offsetof(CPUARMState, cp15.c0_cpuid),
>                .readfn =3D midr_read },
>              /* crn =3D 0 op1 =3D 0 crm =3D 0 op2 =3D 4,7 : AArch32 alias=
es of MIDR */

Moving the op2=3D4 register definition makes this comment out of date,
so you need to update it (ie remove the '4' here, and add a comment
similarly noting what id_v8_midr_alias_cp_reginfo[] is doing).

> -            { .name =3D "MIDR", .type =3D ARM_CP_ALIAS | ARM_CP_CONST,
> -              .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D=
 4,
> -              .access =3D PL1_R, .resetvalue =3D cpu->midr },
>              { .name =3D "MIDR", .type =3D ARM_CP_ALIAS | ARM_CP_CONST,
>                .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D=
 7,
>                .access =3D PL1_R, .resetvalue =3D cpu->midr },
> @@ -8201,6 +8198,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .accessfn =3D access_aa64_tid1,
>                .type =3D ARM_CP_CONST, .resetvalue =3D cpu->revidr },
>          };
> +        ARMCPRegInfo id_v8_midr_alias_cp_reginfo[] =3D {
> +            { .name =3D "MIDR", .type =3D ARM_CP_ALIAS | ARM_CP_CONST,
> +              .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D=
 4,
> +              .access =3D PL1_R, .resetvalue =3D cpu->midr },
> +        };

If there's only one register, you don't need to define a
single-element array, you can use define_one_arm_cp_reg()
and pass it a single ARMCPRegInfo struct.

>          ARMCPRegInfo id_cp_reginfo[] =3D {
>              /* These are common to v8 and pre-v8 */
>              { .name =3D "CTR",
> @@ -8264,8 +8266,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              id_mpuir_reginfo.access =3D PL1_RW;
>              id_tlbtr_reginfo.access =3D PL1_RW;
>          }
> +
>          if (arm_feature(env, ARM_FEATURE_V8)) {
>              define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
> +            if (!arm_feature(env, ARM_FEATURE_V8_R)) {

You can use ARM_FEATURE_PMSA here.

> +                define_arm_cp_regs(cpu, id_v8_midr_alias_cp_reginfo);
> +            }
>          } else {
>              define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
>          }
> --

thanks
-- PMM

