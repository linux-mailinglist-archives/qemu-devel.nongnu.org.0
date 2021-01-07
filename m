Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE89E2ECAA5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 07:47:54 +0100 (CET)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxP5N-0006AU-Du
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 01:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kxP4L-0005jf-8P
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:46:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:51188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kxP4J-0005kF-CH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:46:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A61622EBF
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610002004;
 bh=x5AuJeqiTL0qx4PK1dl2D7FhhoJm4EXg2UQRMrzIPDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IccwB9hDa9BYGknEmEwIeRQ5+U33AEZVrBQRHdDEoEu7nikfbq2FzhV7AWZXehyW0
 iAzaB1DmyOsksGsv0oZ4XVB/NSHpdU+X4ovV4DzUQDgDjaHBSIPHxtDsuDe94UbyFy
 QrdYpD5w7hjSO636JRL9H0UPZn9C4z3X525d0pO+a51EcJ5LXOSxy9xNkjd73E1EWG
 UbX580wwKHrkBgEo09iS1x+eNWcWd3p9EQi99VcXRPcw2aBTrNUQMT6a76Ex8oA97P
 xtazhjAdR80V6v1TqWkwqwn3yqDy15/XTLeYjLYu0HT+S1iBN3bBT+G7yAYi7kXkVI
 rDikPMG4tGlBw==
Received: by mail-il1-f174.google.com with SMTP id b10so3768488ilr.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 22:46:44 -0800 (PST)
X-Gm-Message-State: AOAM532WFnm7G1sjsSh/92k/9DlTygnEy1DdS8nDEvfJ+woVsgxpo7w6
 HCbF7JfirPyWbxRFkatfTtrhzUqhDwRgdlyefhQ=
X-Google-Smtp-Source: ABdhPJyjMXEoOobxQKNskDH/wlppv6zxekS4HAY1HQHrX7D5Nzr3Irv/Q1d1ufb0+YctjOssoRSvMDo9DFdYj0FlKGY=
X-Received: by 2002:a92:870b:: with SMTP id m11mr7427637ild.134.1610002003722; 
 Wed, 06 Jan 2021 22:46:43 -0800 (PST)
MIME-Version: 1.0
References: <20210106184602.3771551-1-f4bug@amsat.org>
In-Reply-To: <20210106184602.3771551-1-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 7 Jan 2021 14:46:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4WGpZvz1wnCW7PrL74_B=epyxZ-PndirptZinjDoyxUg@mail.gmail.com>
Message-ID: <CAAhV-H4WGpZvz1wnCW7PrL74_B=epyxZ-PndirptZinjDoyxUg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: Remove deprecated 'fulong2e' machine alias
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <huth@tuxfamily.org>, QEMU Developers <qemu-devel@nongnu.org>,
 libvir-list@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Thu, Jan 7, 2021 at 2:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The 'fulong2e' machine alias has been marked as deprecated since
> QEMU v5.1 (commit c3a09ff68dd, the machine is renamed 'fuloong2e').
> Time to remove it now.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst       | 5 -----
>  docs/system/removed-features.rst | 5 +++++
>  hw/mips/fuloong2e.c              | 1 -
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index bacd76d7a58..e20bfcb17a4 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -309,11 +309,6 @@ The 'scsi-disk' device is deprecated. Users should u=
se 'scsi-hd' or
>  System emulator machines
>  ------------------------
>
> -mips ``fulong2e`` machine (since 5.1)
> -'''''''''''''''''''''''''''''''''''''
> -
> -This machine has been renamed ``fuloong2e``.
> -
>  ``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-featu=
res.rst
> index 8b20d78a4d0..430fc33ca18 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -120,6 +120,11 @@ mips ``r4k`` platform (removed in 5.2)
>  This machine type was very old and unmaintained. Users should use the ``=
malta``
>  machine type instead.
>
> +mips ``fulong2e`` machine alias (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +This machine has been renamed ``fuloong2e``.
> +
>  Related binaries
>  ----------------
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 29805242caa..bac2adbd5ae 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -383,7 +383,6 @@ static void mips_fuloong2e_init(MachineState *machine=
)
>  static void mips_fuloong2e_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "Fuloong 2e mini pc";
> -    mc->alias =3D "fulong2e";             /* Incorrect name used up to Q=
EMU 4.2 */
>      mc->init =3D mips_fuloong2e_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-2E");
> --
> 2.26.2
>

