Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959C5EC6B6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:43:03 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBnZ-0006Bv-VH
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odADN-0005oT-U5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:01:34 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odADI-0001Ye-Ar
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:01:29 -0400
Received: by mail-ej1-x62e.google.com with SMTP id a26so20560413ejc.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Xio5GT6NVGNglG40om7PUp218KA8MHlZ1aeDFPF9zXE=;
 b=QbIT5Yj+5IgCCzJVgrW1ZRd6s7xizBCgAWHkYJVcK1sh7MfFsTuX1olueAaHk6/OhJ
 ZGwQjfMEVFfXkamNaH+w2DcgvfYtFlWW8V4B42VE9RqQv83k90y5AfOFgoYrclUcOBjP
 43yLIrvm6fRFw3cb9ok6UFVipWpHZEzXOoYgXDJ4WC0KXbKImYIpQFywU782sl/k7q5z
 UwdhM7UKXSfKoTppWjtoTs79xmMvsSw0GgX/p/f3WIS/G0SwUqLrEEbq0vigV/LOIJpx
 9Vq4HpaQbySb6f/ESRPkqcnTOIgEYMdd1d5pJfe1/ttag5AjmThE/i2by+c+29HDiGOo
 1NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Xio5GT6NVGNglG40om7PUp218KA8MHlZ1aeDFPF9zXE=;
 b=jTzl8EWzhpnJj83yUiWl+lOmWZvxCRVrRflMK0IKZGrI+MyC71TwSWWtMrEvY0VrOy
 zgchk9OdFRh0dKgG1m0TAU8ejISXXuI7fY4mElJJaHQ3mgYjvxm+GCp0L3xX8nwn2+if
 hwfWMjJp6pForzhH48NoY3RL/cRwlwvWUPhsM0mxrlE+vk6zJZ5fudBrwwl+D2oyXnt5
 WMpeG4RV+wxVI7NU9tBSh4xf1WVwh6PtkHT3y+F6A6aknLDWDgFG66anbLZE3dsTRV2R
 icELerHmXDuPHDloWZleGlCO9HsqII0rJvZd1fHvZU4kJ15JyZkkoZ92Zwid71Kd1S/B
 i8AQ==
X-Gm-Message-State: ACrzQf10AoQzfBO1SNUXF40DUhE2NYXal64hxBwqCuhvYLqc/V49ep5X
 oJ4Vwg7gjWhsSRCB1HCRzr+t4U0rgrWyZ9LSPHbWBw==
X-Google-Smtp-Source: AMsMyM5C4HqbLpUAeagRZxITlV/wlWocmP+8XVADLhb4eGO8Iu8bM53GW3e61H1B9onlPKSCt/02bN54U7Zvw3thPDI=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr19719638ejc.36.1664283684688; Tue, 27
 Sep 2022 06:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-4-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-4-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 14:01:13 +0100
Message-ID: <CAFEAcA8kw9-2eqNVANxc6h9LisuqKsaNGY6aZEmaLBc_p7Ag_A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] target/arm: Make RVBAR available for all ARMv8 CPUs
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
> RVBAR shadows RVBAR_ELx where x is the highest exception
> level if the highest EL is not EL3. This patch also allows
> ARMv8 CPUs to change the reset address to be changed with
> the rvbar property.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b9547594ae..23461397e0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7954,13 +7954,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          /* RVBAR_EL1 is only implemented if EL1 is the highest EL */
>          if (!arm_feature(env, ARM_FEATURE_EL3) &&
>              !arm_feature(env, ARM_FEATURE_EL2)) {
> -            ARMCPRegInfo rvbar =3D {
> -                .name =3D "RVBAR_EL1", .state =3D ARM_CP_STATE_AA64,
> -                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 12, .crm =3D 0, .opc2=
 =3D 1,
> -                .access =3D PL1_R,
> -                .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +            ARMCPRegInfo rvbar[] =3D {
> +                {
> +                    .name =3D "RVBAR_EL1", .state =3D ARM_CP_STATE_AA64,
> +                    .opc0 =3D 3, .opc1 =3D 0, .crn =3D 12, .crm =3D 0, .=
opc2 =3D 1,
> +                    .access =3D PL1_R,
> +                    .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +                },
> +                {   .name =3D "RVBAR", .type =3D ARM_CP_ALIAS,
> +                    .cp =3D 15, .crn =3D 12, .crm =3D 0, .opc1 =3D 0, .o=
pc2 =3D 1,
> +                    .access =3D PL1_R,
> +                    .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +                },

Because the encodings here match, you don't need a separate
struct for the AArch32 RVBAR -- you can just change
the ARM_CP_STATE_AA64 to ARM_CP_STATE_BOTH.

>              };
> -            define_one_arm_cp_reg(cpu, &rvbar);
> +            define_arm_cp_regs(cpu, rvbar);
>          }
>          define_arm_cp_regs(cpu, v8_idregs);
>          define_arm_cp_regs(cpu, v8_cp_reginfo);
> @@ -8022,13 +8029,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          }
>          /* RVBAR_EL2 is only implemented if EL2 is the highest EL */
>          if (!arm_feature(env, ARM_FEATURE_EL3)) {
> -            ARMCPRegInfo rvbar =3D {
> -                .name =3D "RVBAR_EL2", .state =3D ARM_CP_STATE_AA64,
> -                .opc0 =3D 3, .opc1 =3D 4, .crn =3D 12, .crm =3D 0, .opc2=
 =3D 1,
> -                .access =3D PL2_R,
> -                .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +            ARMCPRegInfo rvbar[] =3D {
> +                {
> +                    .name =3D "RVBAR_EL2", .state =3D ARM_CP_STATE_AA64,
> +                    .opc0 =3D 3, .opc1 =3D 4, .crn =3D 12, .crm =3D 0, .=
opc2 =3D 1,
> +                    .access =3D PL2_R,
> +                    .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +                },
> +                {   .name =3D "RVBAR", .type =3D ARM_CP_ALIAS,
> +                    .cp =3D 15, .crn =3D 12, .crm =3D 0, .opc1 =3D 0, .o=
pc2 =3D 1,
> +                    .access =3D PL2_R,
> +                    .fieldoffset =3D offsetof(CPUARMState, cp15.rvbar),
> +                },

(Here we do need the second struct, beacuse the opc1 fields don't line up.)

Preferred ordering for the encoding fields in a cp struct is
 .cp .opc1 .crn .crm .opc2
(ie in order as used in the asm instruction).

Otherwise this patch looks good.

thanks
-- PMM

