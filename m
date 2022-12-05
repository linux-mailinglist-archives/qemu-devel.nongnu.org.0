Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D92642E64
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2EwL-0003KO-B1; Mon, 05 Dec 2022 12:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EwJ-0003Ih-K0
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:07:35 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EwH-0003OY-K3
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:07:35 -0500
Received: by mail-pg1-x52a.google.com with SMTP id v3so11034457pgh.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 09:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiFzxvAwAAd8fFHGgCJ8X8GLlgHlzFbJv4dcUK/N/x8=;
 b=Ep06+FzSw+jOY/2FN+Fb2fMDcvqx9Qb6LavgJvsXMqwExi9XLdEtr2Gbtq9WDk5H/e
 IUVsMiXV8aImOw760HSa5XKEO5vx384U8M1rqyC7Ww/PjHGfxgzLJGTODig1/GxL9ki8
 lTUF/Bd4+0HaPX1fZVnpKTbWoiKS42q/zcNPYKxIZOarFxYH+l+c6EauP+51NT3gEiJL
 RoYtLxUmFl2dA70MoJljtz9IfjHxQ41oJw8THwYIkWnCWMK/ic/dsHkqoypgbvudT5OQ
 cZAPyp9ruHzEVpAKUgNLyI+nEeIMubC17nhC4cegy86b8WNaNGfDptMxuQ4lQTbKmqwE
 VgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BiFzxvAwAAd8fFHGgCJ8X8GLlgHlzFbJv4dcUK/N/x8=;
 b=ryGNRwjZKRzIDyf955gZa/Ya/nERixhskXKH/bIZniF3ApSZrxFVesulurJJ5wxQZl
 X7/9OzVodg/wyHOYEEK2CfjXPpBOArGVF70GOp777xqdNb8GSaHjjmoLKCLc3yNlJltv
 W09+98gEf/Gkzv0xVoXYMRA11J0W/IRCfOjLcCpdzW7jw7wHHJtmgcE0Tpk3kEsmyXRP
 i3+0vsYoyA4H8pQV9Q0LnuXg2a5Am/hUw0cl7/16rjWNNiQZ6hfQKLA0zuHj5kcoDYjy
 szWCNxWTAwDezjfpdGs6XTQswahZuMp6i5U5Odjmj25EDhbGE6ILWJZkblY6kc1RACv5
 6+yQ==
X-Gm-Message-State: ANoB5pkawFrD65Ad7VwA8aKfgpCxLxE+JeZXZhY7/ip+Mnh/lJ9dEoxj
 QgxfL65UC9VNzw6ojXIKHnWqu4U07z3888coxeyWxg==
X-Google-Smtp-Source: AA0mqf57DsqLlgFLkGwC6zeouw4b+VXTr+ZRjsHmnOeSsJLJ5kCyriXpeBzbMLwRGJ+0UNkasubP7dBfBAsRk2SHdyk=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr66352750pfb.3.1670260041538; Mon, 05
 Dec 2022 09:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-6-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-6-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 17:07:09 +0000
Message-ID: <CAFEAcA_9LQyHWm1aikywTFoHdpkQCAdJSQ9ZUD-z22ymtsrMRw@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] target/arm: Add PMSAv8r registers
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Only some minor fixes needed in this one.

> ---
>  target/arm/cpu.c     |  24 +++-
>  target/arm/cpu.h     |   6 +
>  target/arm/helper.c  | 299 +++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c |  28 ++++
>  4 files changed, 356 insertions(+), 1 deletion(-)

> @@ -2001,8 +2009,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>       */
>      if (!cpu->has_mpu) {
>          cpu->pmsav7_dregion =3D 0;
> +        cpu->pmsav8r_hdregion =3D 0;
>      }
> -    if (cpu->pmsav7_dregion =3D=3D 0) {
> +    if ((cpu->pmsav7_dregion =3D=3D 0) && (cpu->pmsav8r_hdregion =3D=3D =
0)) {
>          cpu->has_mpu =3D false;
>      }

This leaves the door open for a CPU with 0 dregions but some hdregions.
That I think doesn't make sense, so we should just disallow it.
We can do that by combining these two if()s into one:

      if (!cpu->has_mpu || cpu->pmsav7_dregion =3D=3D 0) {
          cpu->has_mpu =3D false;
          cpu->pmsav7_dregion =3D 0;
          cpu->pmsav8r_hdregion =3D 0;
      }

> @@ -2030,6 +2039,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>                  env->pmsav7.dracr =3D g_new0(uint32_t, nr);
>              }
>          }
> +
> +        if (cpu->pmsav8r_hdregion > 0xFF) {

Lowercase for hex digits, please (matches the check on pmsav7_dregion).

> +            error_setg(errp, "PMSAv8 MPU EL2 #regions invalid %" PRIu32,
> +                              cpu->pmsav8r_hdregion);
> +            return;
> +        }
> +
> +        if (cpu->pmsav8r_hdregion) {
> +            env->pmsav8.hprbar =3D g_new0(uint32_t,
> +                                        cpu->pmsav8r_hdregion);
> +            env->pmsav8.hprlar =3D g_new0(uint32_t,
> +                                        cpu->pmsav8r_hdregion);
> +        }
>      }
>
>      if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {



> +static const ARMCPRegInfo pmsav8r_cp_reginfo[] =3D {
> +    { .name =3D "PRBAR",
> +      .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D 0,
> +      .access =3D PL1_RW, .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +      .accessfn =3D access_tvm_trvm,
> +      .readfn =3D prbar_read, .writefn =3D prbar_write },
> +    { .name =3D "PRLAR",
> +      .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 3, .opc2 =3D 1,
> +      .access =3D PL1_RW, .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +      .accessfn =3D access_tvm_trvm,
> +      .readfn =3D prlar_read, .writefn =3D prlar_write },
> +    { .name =3D "PRSELR", .resetvalue =3D 0,
> +      .cp =3D 15, .opc1 =3D 0, .crn =3D 6, .crm =3D 2, .opc2 =3D 1,
> +      .access =3D PL1_RW, .accessfn =3D access_tvm_trvm,
> +      .writefn =3D prselr_write,
> +      .fieldoffset =3D offsetof(CPUARMState, pmsav7.rnr[M_REG_NS]) },
> +    { .name =3D "HPRBAR", .resetvalue =3D 0,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D 0,
> +      .access =3D PL2_RW, .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +      .readfn =3D hprbar_read, .writefn =3D hprbar_write },
> +    { .name =3D "HPRLAR",
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 3, .opc2 =3D 1,
> +      .access =3D PL2_RW, .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +      .readfn =3D hprlar_read, .writefn =3D hprlar_write },

These 4 registers should be just ARM_CP_NO_RAW, not
ARM_CP_ALIAS | ARM_CP_NO_RAW.

> +    { .name =3D "HPRSELR", .resetvalue =3D 0,
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 2, .opc2 =3D 1,
> +      .access =3D PL2_RW,
> +      .writefn =3D hprselr_write,
> +      .fieldoffset =3D offsetof(CPUARMState, pmsav8.hprselr) },
> +    { .name =3D "HPRENR",
> +      .cp =3D 15, .opc1 =3D 4, .crn =3D 6, .crm =3D 1, .opc2 =3D 1,
> +      .access =3D PL2_RW, .type =3D ARM_CP_ALIAS,
> +      .readfn =3D hprenr_read, .writefn =3D hprenr_write },
> +};
> +
>  static const ARMCPRegInfo pmsav7_cp_reginfo[] =3D {
>      /* Reset for all these registers is handled in arm_cpu_reset(),
>       * because the PMSAv7 is also used by M-profile CPUs, which do
> @@ -8166,6 +8382,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .access =3D PL1_R, .type =3D ARM_CP_CONST,
>                .resetvalue =3D cpu->pmsav7_dregion << 8
>          };
> +        /* HMPUIR is specific to PMSA V8 */
> +        ARMCPRegInfo id_hmpuir_reginfo =3D {
> +            .name =3D "HMPUIR",
> +            .cp =3D 15, .opc1 =3D 4, .crn =3D 0, .crm =3D 0, .opc2 =3D 4=
,
> +            .access =3D PL2_R, .type =3D ARM_CP_CONST,
> +            .resetvalue =3D cpu->pmsav8r_hdregion
> +        };
>          static const ARMCPRegInfo crn0_wi_reginfo =3D {
>              .name =3D "CRN0_WI", .cp =3D 15, .crn =3D 0, .crm =3D CP_ANY=
,
>              .opc1 =3D CP_ANY, .opc2 =3D CP_ANY, .access =3D PL1_W,
> @@ -8208,6 +8431,71 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, id_cp_reginfo);
>          if (!arm_feature(env, ARM_FEATURE_PMSA)) {
>              define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
> +        } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
> +                   arm_feature(env, ARM_FEATURE_V8)) {
> +            uint32_t i =3D 0;
> +            g_autofree char *tmp_string_pr;
> +            g_autofree char *tmp_string_hpr;
> +
> +            define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
> +            define_one_arm_cp_reg(cpu, &id_hmpuir_reginfo);
> +            define_arm_cp_regs(cpu, pmsav8r_cp_reginfo);
> +
> +            /* Register alias is only valid for first 32 indexes */
> +            for (i =3D 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
> +                uint8_t crm =3D 0b1000 | extract32(i, 1, 3);
> +                uint8_t opc1 =3D extract32(i, 4, 1);
> +                uint8_t opc2 =3D extract32(i, 0, 1) << 2;
> +
> +                tmp_string_pr =3D g_strdup_printf("PRBAR%u", i);
> +                ARMCPRegInfo tmp_prbarn_reginfo =3D {
> +                    .name =3D tmp_string_pr, .type =3D ARM_CP_ALIAS | AR=
M_CP_NO_RAW,

All these registers hould be just ARM_CP_NO_RAW, not
ARM_CP_ALIAS | ARM_CP_NO_RAW.

> +                    .cp =3D 15, .opc1 =3D opc1, .crn =3D 6, .crm =3D crm=
, .opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);

This is still leaking the name strings. If you don't want to
use g_autofree then you must free the strings yourself.

> +
> +                opc2 =3D extract32(i, 0, 1) << 2 | 0x1;
> +                tmp_string_pr =3D g_strdup_printf("PRLAR%u", i);
> +                ARMCPRegInfo tmp_prlarn_reginfo =3D {
> +                    .name =3D tmp_string_pr, .type =3D ARM_CP_ALIAS | AR=
M_CP_NO_RAW,
> +                    .cp =3D 15, .opc1 =3D opc1, .crn =3D 6, .crm =3D crm=
, .opc2 =3D opc2,
> +                    .access =3D PL1_RW, .resetvalue =3D 0,
> +                    .accessfn =3D access_tvm_trvm,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
> +            }
> +
> +            /* Register alias is only valid for first 32 indexes */
> +            for (i =3D 0; i < MIN(cpu->pmsav8r_hdregion, 32); ++i) {
> +                uint8_t crm =3D 0b1000 | extract32(i, 1, 3);
> +                uint8_t opc1 =3D 0b100 | extract32(i, 4, 1);
> +                uint8_t opc2 =3D extract32(i, 0, 1) << 2;
> +
> +                tmp_string_hpr =3D g_strdup_printf("HPRBAR%u", i);
> +                ARMCPRegInfo tmp_hprbarn_reginfo =3D {
> +                    .name =3D tmp_string_hpr,
> +                    .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +                    .cp =3D 15, .opc1 =3D opc1, .crn =3D 6, .crm =3D crm=
, .opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprbarn_reginfo);
> +
> +                opc2 =3D extract32(i, 0, 1) << 2 | 0x1;
> +                tmp_string_hpr =3D g_strdup_printf("HPRLAR%u", i);
> +                ARMCPRegInfo tmp_hprlarn_reginfo =3D {
> +                    .name =3D tmp_string_hpr,
> +                    .type =3D ARM_CP_ALIAS | ARM_CP_NO_RAW,
> +                    .cp =3D 15, .opc1 =3D opc1, .crn =3D 6, .crm =3D crm=
, .opc2 =3D opc2,
> +                    .access =3D PL2_RW, .resetvalue =3D 0,
> +                    .writefn =3D pmsav8r_regn_write, .readfn =3D pmsav8r=
_regn_read
> +                };
> +                define_one_arm_cp_reg(cpu, &tmp_hprlarn_reginfo);
> +            }
>          } else if (arm_feature(env, ARM_FEATURE_V7)) {
>              define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
>          }

thanks
-- PMM

