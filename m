Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6A52A3CC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:47:18 +0200 (CEST)
Received: from localhost ([::1]:55860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxXh-0003Vz-PP
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1nqxEh-0006kB-LC
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:27:39 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1nqxEf-0004co-CW
 for qemu-devel@nongnu.org; Tue, 17 May 2022 09:27:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65294B81734
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 13:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A97C34113
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652794041;
 bh=bHHGRgs18UbDLuTKrSpun/vaAj/BFlIV3XE+1MfYPY0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y3SIbuBMS1KvF5aiRKdRp5o0yqycoCCcIGXu+oGirYFN0Qhwzc3e6AFL3zdM55vAX
 WjW9xpsdrQMqa7fqGcBledf9Fq5bB3REcmQQYl2tH8uPXqH5xXMyntwpBx1XbUe87c
 Ni9dPiMjG2953qBiRr9N5beQUjKy7EIr3sQBso6PBsHm2nar+3FEQYU6tNXxzCC2Zt
 ZBXxWNtbQahmGAO5M6fEZZTSElxcUzi1ZF/96P9/7mf5l0qE/0tamdbHVVnqzLzf2s
 qsjM0u7S6x7N99/I5E9g4Q2YhUi8+F1cgjGOPWW2eX7gFdCBbcVb+2VK1W0k7lMgyS
 ZHdjJxvmlV3FQ==
Received: by mail-ej1-f43.google.com with SMTP id n10so34721987ejk.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 06:27:21 -0700 (PDT)
X-Gm-Message-State: AOAM5330/1e6OyGflzG33MweCbqbhC8Kim0gaqJoUzed9QnEhNvWxtno
 T60oR0S0bqpRre2Ts0ZEXGD+ROfH05pixgdN9A==
X-Google-Smtp-Source: ABdhPJxdRUAffjl2ThBUlU4Pyj8etu15nIE30FNsyyNDF7+MuRW9SaKC4ZiEJMfiaG878W/LmrkwG+MswVFO0MpOumA=
X-Received: by 2002:a17:906:2294:b0:6f3:bd02:95a3 with SMTP id
 p20-20020a170906229400b006f3bd0295a3mr19295078eja.201.1652794039443; Tue, 17
 May 2022 06:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220505113947.75714-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220505113947.75714-1-quic_llindhol@quicinc.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 May 2022 08:27:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJirHpxC-QXDZUKbJUTgYpac3KyTh7r3v0frWg26F3rzQ@mail.gmail.com>
Message-ID: <CAL_JsqJirHpxC-QXDZUKbJUTgYpac3KyTh7r3v0frWg26F3rzQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: add versioning to sbsa-ref machine DT
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=145.40.68.75; envelope-from=robh@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 5, 2022 at 6:41 AM Leif Lindholm <quic_llindhol@quicinc.com> wr=
ote:
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

Where's the binding documentation for this?

We already have a way to version DTs and that's with compatible. I'm
not completely opposed to a version number though, but I am opposed to
it not being common. We've rejected vendors (QCom in fact) doing their
own thing here.


> This versioning scheme is *neither*:
> - A QEMU versioned machine type; a given version of QEMU will emulate
>   a given version of the platform.
> - A reflection of level of SBSA (now SystemReady SR) support provided.

FYI, it's planned to certify the virt machine for SR-IR which will
include DT schema validation. Undocumented properties are a problem
for that.

> The version will increment on guest-visible functional changes only,
> akin to a revision ID register found on a physical platform.
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
>
> Changes since v1:
> - More detail added to commit message.
> - Verbose comment added adjacent to code additions.
>
>  hw/arm/sbsa-ref.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 2387401963..d0c25ddfcf 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -190,6 +190,20 @@ static void create_fdt(SBSAMachineState *sms)
>      qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
>      qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>
> +    /*
> +     * This versioning scheme is for informing platform fw only. It is n=
either:
> +     * - A QEMU versioned machine type; a given version of QEMU will emu=
late
> +     *   a given version of the platform.
> +     * - A reflection of level of SBSA (now SystemReady SR) support prov=
ided.
> +     *
> +     * machine-version-major: updated when changes breaking fw compatibi=
lity
> +     *                        are introduced.
> +     * machine-version-minor: updated when features are added that don't=
 break
> +     *                        fw compatibility.
> +     */
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
> +    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
> +
>      if (ms->numa_state->have_numa_distance) {
>          int size =3D nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t=
);
>          uint32_t *matrix =3D g_malloc0(size);
> --
> 2.30.2
>
>

