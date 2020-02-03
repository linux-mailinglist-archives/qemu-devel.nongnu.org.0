Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ADE150624
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:26:19 +0100 (CET)
Received: from localhost ([::1]:39034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyany-0001mH-AA
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iyanA-0000xL-2x
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:25:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iyan8-0008FQ-PT
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:25:28 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39332)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iyan8-0008BR-Ik
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:25:26 -0500
Received: by mail-wr1-x442.google.com with SMTP id y11so17810803wrt.6
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 04:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=JD1wCwQQ53b8JQmSZgVquo4F+fkKJnJSH6TCD+myXr0=;
 b=qxrGEFkyvpsBXMO+R/SH+rCh2q3TR11nu193Kc1fJ/u+9inmR+6C853Ezrx4RpPyzp
 MmXMgHaJdh2DbOHOsInZVPc0JIva+ez/+7U5deLiGmfDB7mRH+vSbY3pCE+/+xEJJPN7
 UsjMUzbnv9dPxQ1ezlaTIBxe9L8QCfzahBTFxKz/hUGbQddfUkSdRooxZDGbdsH+bXxI
 G1QsaO0cr0rMzK4vJlUMP1cNTreuFehIakEVxHYe7wKdNdBng03tjERopbcv3x6RCI13
 GLMDt6cKJysG86A1z2Uf+eFn0JBd4QT1M3y3pGN/B3Ur/Obu94PG1CG6cHKMQhsik3tg
 ZynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=JD1wCwQQ53b8JQmSZgVquo4F+fkKJnJSH6TCD+myXr0=;
 b=GEhjc4/o2EvWcpPztLov1Xj1JBQx+E14RkLg2b0hqZJH9LHDNHwz/lMzFOX1ZNLc6y
 OukSUGJ8pNStf1MZi0Zh72alkB/VA2IkS3+Y6Jj9x78pLru/X7ixK3e5tWbui9VyZxhB
 dxNC9o6rSRzBjD8SxaDSpU1pKGZaLj48d72kdBMaXM39vmenNXeW2QYlLeYlzpCIyLNk
 5obX7vTMDj59Nca3CTvCDPEO9gdWt8nK//1lv+Y+Ykoo+R7tfbkOYqBoNTVw/QPzHZu2
 F+cEgKkMxzeZQC9FptKxduzQar4WuYmkDDenfPM54x6JWvCVk8zOaVl5Fnr6JCv6Yh7C
 eg+g==
X-Gm-Message-State: APjAAAVcaFDbaCZUAYPAUxVRNbY7B+994iLKmTgMPIUfZl1GaOGOj5KM
 Ngb+vlefOJJrPavTOBQOqK5okA==
X-Google-Smtp-Source: APXvYqx/D4LmtL0EO3ev1ktmdQlYsR/w0y2tpXjhq70w9jwNPuw5VCNocK+MJ6d2xbpOvkfsErU5RQ==
X-Received: by 2002:adf:f109:: with SMTP id r9mr14913221wro.406.1580732725500; 
 Mon, 03 Feb 2020 04:25:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f14sm5868566wrt.7.2020.02.03.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 04:25:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B52291FF87;
 Mon,  3 Feb 2020 12:25:23 +0000 (GMT)
References: <20200202010439.6410-1-richard.henderson@linaro.org>
 <20200202010439.6410-5-richard.henderson@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/14] target/arm: Move LOR regdefs to file scope
In-reply-to: <20200202010439.6410-5-richard.henderson@linaro.org>
Date: Mon, 03 Feb 2020 12:25:23 +0000
Message-ID: <87mu9zamdo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For static const regdefs, file scope is preferred.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 57 +++++++++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 28 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 739d2d4cc5..795ef727d0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6343,6 +6343,35 @@ static CPAccessResult access_lor_other(CPUARMState=
 *env,
>      return access_lor_ns(env);
>  }
>=20=20
> +/*
> + * A trivial implementation of ARMv8.1-LOR leaves all of these
> + * registers fixed at 0, which indicates that there are zero
> + * supported Limited Ordering regions.
> + */
> +static const ARMCPRegInfo lor_reginfo[] =3D {
> +    { .name =3D "LORSA_EL1", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =3D 0,
> +      .access =3D PL1_RW, .accessfn =3D access_lor_other,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "LOREA_EL1", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =3D 1,
> +      .access =3D PL1_RW, .accessfn =3D access_lor_other,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "LORN_EL1", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =3D 2,
> +      .access =3D PL1_RW, .accessfn =3D access_lor_other,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "LORC_EL1", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =3D 3,
> +      .access =3D PL1_RW, .accessfn =3D access_lor_other,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    { .name =3D "LORID_EL1", .state =3D ARM_CP_STATE_AA64,
> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =3D 7,
> +      .access =3D PL1_R, .accessfn =3D access_lorid,
> +      .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> +    REGINFO_SENTINEL
> +};
> +
>  #ifdef TARGET_AARCH64
>  static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo =
*ri,
>                                     bool isread)
> @@ -7577,34 +7606,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      }
>=20=20
>      if (cpu_isar_feature(aa64_lor, cpu)) {
> -        /*
> -         * A trivial implementation of ARMv8.1-LOR leaves all of these
> -         * registers fixed at 0, which indicates that there are zero
> -         * supported Limited Ordering regions.
> -         */
> -        static const ARMCPRegInfo lor_reginfo[] =3D {
> -            { .name =3D "LORSA_EL1", .state =3D ARM_CP_STATE_AA64,
> -              .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =
=3D 0,
> -              .access =3D PL1_RW, .accessfn =3D access_lor_other,
> -              .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> -            { .name =3D "LOREA_EL1", .state =3D ARM_CP_STATE_AA64,
> -              .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =
=3D 1,
> -              .access =3D PL1_RW, .accessfn =3D access_lor_other,
> -              .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> -            { .name =3D "LORN_EL1", .state =3D ARM_CP_STATE_AA64,
> -              .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =
=3D 2,
> -              .access =3D PL1_RW, .accessfn =3D access_lor_other,
> -              .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> -            { .name =3D "LORC_EL1", .state =3D ARM_CP_STATE_AA64,
> -              .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =
=3D 3,
> -              .access =3D PL1_RW, .accessfn =3D access_lor_other,
> -              .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> -            { .name =3D "LORID_EL1", .state =3D ARM_CP_STATE_AA64,
> -              .opc0 =3D 3, .opc1 =3D 0, .crn =3D 10, .crm =3D 4, .opc2 =
=3D 7,
> -              .access =3D PL1_R, .accessfn =3D access_lorid,
> -              .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
> -            REGINFO_SENTINEL
> -        };
>          define_arm_cp_regs(cpu, lor_reginfo);
>      }


--=20
Alex Benn=C3=A9e

