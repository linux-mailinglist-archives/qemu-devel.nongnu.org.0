Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA55188D5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:41:07 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlueA-0004q5-DT
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluZ2-0007j0-2G
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:35:48 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nluZ0-0005Bl-9g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:35:47 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f38so31769614ybi.3
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IGpmnYQlOH/CRB9def+U3MAhMh65fsxdYCFOo6oX80I=;
 b=mt8NxZ39UZloiyGYMZM1bk59AO4iW82JTFgtNYuqW3DpNH8EHn2eZJRtiOTUzEBC44
 5NO1ogE7lSqCYf0/mfXZB5ZkSoZOYLV7OFJmlfHBbgCKXA7vWBoHr0SF4tovUH42doQp
 BwfJYZHhm6Tn6t2CSisM2yNVH93E01RjmXzkRQSX2aSbi3+RobiSEu5xUHyv27z0loTg
 C+p99UOgLmbZXkfszO8a/AaM0OSicu1/StB6ceINx4HkQnxyZ+pKkt4vWB+rDEH45OKH
 9xjysQvD4GYWiTgYizen886b7BQBgT+05BpFaQDo6ioOjx26IvUCgw88WIHTXGfGEOCP
 xAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IGpmnYQlOH/CRB9def+U3MAhMh65fsxdYCFOo6oX80I=;
 b=FRhHyiZUNHPoxOR0NeuL/tHqxWLxAOFIEgAHur9rt/p0TAyfqAjLKLLg8sNxTC85Rt
 pm+GWJWHvjVsyXgWCZvqngp+COzya9bPNo0xd1Iog1uW/Wyfj6w2Ehz7T0UtF8G0Gc1H
 9IaCvBU4pXZpRi1OVRho8aVdq3fT33McNp+nVblChj3WpyE0A7byAZTUapbp88fYm2b9
 WP3f99Yc3AEmoTirlH7xzJBE6SUuXJZk1cnktPPT6GmcLilsX0HESETFgEECUDpDy/v5
 rfPwvV33XKbrrjPasH+x84kFcqTFqX9zMX7STRlbglZcyvY28HDgi0vQZM8kLuDTU3m3
 C7Xg==
X-Gm-Message-State: AOAM533APcK/wll76GDSSu5AYmaM8TpYidOm8O6ZOtKa+C9NMUBVcI98
 sW/4j7TR/ybVnBcKY+CyPqolv2H4CpNFFs+HogQ6Dg==
X-Google-Smtp-Source: ABdhPJwzfRz4l0e45IuK/sjE4xVssUH07ys5ivBjJB41W8yjCBMV5uwKfZ380IV1+TDFpSwIoPA7GRvoYmrQ5GH90ss=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14388144ybq.67.1651592145267; Tue, 03
 May 2022 08:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220427182934.27075-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220427182934.27075-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 16:35:34 +0100
Message-ID: <CAFEAcA9AxyG6_M_-32gNCNNg_Yaiu5JVarTLfpthJL+DdQK7UQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add versioning to sbsa-ref machine DT
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 27 Apr 2022 at 19:29, Leif Lindholm <quic_llindhol@quicinc.com> wro=
te:
>
> The sbsa-ref machine is continuously evolving. Some of the changes we
> want to make in the near future, to align with real components (e.g.
> the GIC-700), will break compatibility for existing firmware.
>
> Introduce two new properties to the DT generated on machine generation:
> - machine-version-major
>   To be incremented when a platform change makes the machine
>   incompatible with existing firmware.
> - machine-version-minor
>   To be incremented when functionality is added to the machine
>   without causing incompatibility with existing firmware.
>   to be reset to 0 when machine-version-major is incremented.
>
> These properties are both introduced with the value 0.
> (Hence, a machine where the DT is lacking these nodes is equivalent
> to version 0.0.)
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Radoslaw Biernacki <rad@semihalf.com>
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/sbsa-ref.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..e05f6056c7 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -190,6 +190,9 @@ static void create_fdt(SBSAMachineState *sms)
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);

Seems reasonable to me, but I think:
 * we should say explicitly that the hardware version defined
by these values has nothing to do with QEMU versioned machine
types (and is more akin to a hardware motherboard revision
A/B/C kind of thing), and maybe that it's not aligned with any
specification version number either?
 * we should perhaps say that on real hardware this information
would be more commonly passed to firmware as part of some
sort of revision ID register, but that for sbsa-ref we put
it in the DTB for convenience since we already use that to
tell firmware a few things about the emulated hardware
 * at least some of this should be in a comment as well as
the commit message, so nobody in future decides this should
be "tidied up" to be a versioned machine type

thanks
-- PMM

