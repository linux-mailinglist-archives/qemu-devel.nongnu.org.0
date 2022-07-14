Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6605751DC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:35:04 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0rn-0005gM-Qp
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0hU-0005Mw-BZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:24:24 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0hS-0003EC-8u
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:24:24 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c8bb90d09so20504957b3.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0EEr00/Vf6WNd7bXO8E8et7k3KKpFNmGfxTBGqjNr2U=;
 b=WDlH85LRutWDvOU9QN3MO3NmoFZgB6TA9D+DEduNsZG4c6z5Mkv/OCSe6EP3DD80LL
 /H9AIvHqd/kTIeeqv/+8Fj6cn4L4jTO+PyZM3ktQOYmMuztPldykDxMkAC9MXdlIWhHm
 1I04U9wwp88RBlc8pv0o/eNjEhwFbSECU5uxM/7ysJt9CVoing4+8+fBrgr3RhzN9lCm
 NtP/+QawBzVHyG+8qA9fOYj0cmoxP8ErvR3m9DlOPWHFNguFVITiLcd9cijNHUd6QIKS
 ZN/JG6xSNOpNEXxTKpScIN+IQ/B7qpiVkdz/6fZcPVzmdCCM12y1AX4BPZEwMJzgUk7Z
 nmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0EEr00/Vf6WNd7bXO8E8et7k3KKpFNmGfxTBGqjNr2U=;
 b=i/X5L7bHB7tDwSpsXtw5yGk5TLhpOzjWRCUnM/JOeAuVIPah+LqvFN27k71cjkjl49
 P0ykVHzE42ModK+nKHV3RpQWKOCQaptX3RX9EnksN74uyaYneN33WNv5IsamvrLY9m0D
 Z9JBPwZUKu9Oa99xNzcNGWGXKB3hMxS2g+lccU2pnCeKQ0WALhCbpoKkAy2Id44pDH5+
 1I+xJhNgviZWu6lj+L+uJo9ukZJZWHNxgXPS4tbWzonCaMC2hrcg7od9zKHUgUDVRMib
 ImFsISjyxe3zK63ymy4K7apeTouaNKQwoWXlu2tfOuS5hIErGUFN4fO1YeroRhGftpQZ
 HslA==
X-Gm-Message-State: AJIora9a2+Psj77w/DJFEZchIoOMOipijzYKWYitdRdjrZCgr5o8XCrn
 7fNmQc67JwQG/rWOtMiAb8QA8XSFT4cvB6iRJFXG/A==
X-Google-Smtp-Source: AGRyM1suo8DufBUR/g8RZbvgBdq3eX5ithp6dQjQyLYZFA6TUH8bnDXmhg4I6X3qqIywqjigX62uxz67dm80+sV75SA=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr10517787ywc.64.1657812260122; Thu, 14
 Jul 2022 08:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-3-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-3-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:23:41 +0100
Message-ID: <CAFEAcA9hNxziSf0qMuHZNQ_CT4b3bkhr3FBohE6s74h3E9Sdmg@mail.gmail.com>
Subject: Re: [PATCH 02/11] target/arm: Add ARM Cortex-R52 cpu
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
> All constants are taken from the ARM Cortex-R52 Processor TRM Revision: r=
1p3

This should be the last patch in the patchset, so that we only
add the new CPU when all the code changes necessary to make it work
are present.

> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  target/arm/cpu_tcg.c | 54 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index b751a19c8a..49fb03c09a 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -843,6 +843,59 @@ static void cortex_r5_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>  }
>
> +static const ARMCPRegInfo cortexr52_cp_reginfo[] =3D {
> +    /* Dummy the TCM region regs for the moment */
> +    { .name =3D "ATCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1,=
 .opc2 =3D 0,
> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
> +    { .name =3D "BTCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1,=
 .opc2 =3D 1,
> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
> +    { .name =3D "DCACHE_INVAL", .cp =3D 15, .opc1 =3D 0, .crn =3D 15, .c=
rm =3D 5,
> +      .opc2 =3D 0, .access =3D PL1_W, .type =3D ARM_CP_NOP },
> +};

This is just a copy of the Cortex-R5 impdef register set.
The R52 doesn't have the DCACHE_INVAL. Although it does have
registers in the ATCM and BTCM encodings, it also has a
third CTCM, because it has three TCM regions.

You should implement the IMPDEF registers that the CPU
actually has, assuming that guest software cares about them.

> +static void cortex_r52_initfn(Object *obj)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(obj);
> +
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_R);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_PMSA);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    cpu->midr =3D 0x411fd133; /* r1p3 */
> +    cpu->revidr =3D 0x00000000;
> +    cpu->reset_fpsid =3D 0x41034023;
> +    cpu->isar.mvfr0 =3D 0x10110222;
> +    cpu->isar.mvfr1 =3D 0x12111111;
> +    cpu->isar.mvfr2 =3D 0x00000043;
> +    cpu->ctr =3D 0x8144c004;
> +    cpu->reset_sctlr =3D 0x30c50838;
> +    cpu->isar.id_pfr0 =3D 0x00000131;
> +    cpu->isar.id_pfr1 =3D 0x10111001;
> +    cpu->isar.id_dfr0 =3D 0x03010006;
> +    cpu->id_afr0 =3D 0x00000000;
> +    cpu->isar.id_mmfr0 =3D 0x00211040;
> +    cpu->isar.id_mmfr1 =3D 0x40000000;
> +    cpu->isar.id_mmfr2 =3D 0x01200000;
> +    cpu->isar.id_mmfr3 =3D 0xf0102211;
> +    cpu->isar.id_mmfr4 =3D 0x00000010;
> +    cpu->isar.id_isar0 =3D 0x02101110;
> +    cpu->isar.id_isar1 =3D 0x13112111;
> +    cpu->isar.id_isar2 =3D 0x21232142;
> +    cpu->isar.id_isar3 =3D 0x01112131;
> +    cpu->isar.id_isar4 =3D 0x00010142;
> +    cpu->isar.id_isar5 =3D 0x00010001;
> +    cpu->isar.dbgdidr =3D 0x77168000;
> +    cpu->clidr =3D (1 << 27) | (1 << 24) | 0x3;
> +    cpu->ccsidr[0] =3D 0x700fe01a; /* 32KB L1 dcache */
> +    cpu->ccsidr[1] =3D 0x201fe00a; /* 32KB L1 icache */
> +
> +    cpu->pmsav7_dregion =3D 16;
> +
> +    define_arm_cp_regs(cpu, cortexr52_cp_reginfo);
> +}
> +
>  static void cortex_r5f_initfn(Object *obj)
>  {
>      ARMCPU *cpu =3D ARM_CPU(obj);
> @@ -1148,6 +1201,7 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>      { .name =3D "cortex-m55",  .initfn =3D cortex_m55_initfn,
>                               .class_init =3D arm_v7m_class_init },
>      { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
> +    { .name =3D "cortex-r52",   .initfn =3D cortex_r52_initfn },
>      { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },

List it below cortex-r5f, so that the two different flavours of R5
stay together.

>      { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
>      { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
> --
> 2.25.1
>

thanks
-- PMM

