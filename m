Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5461F2ECAA9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 07:53:37 +0100 (CET)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPAu-0007R9-D8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 01:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1kxP9t-0006vC-RV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:52:33 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:54107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1kxP9r-0008S9-Rf
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:52:33 -0500
Received: by mail-wm1-f43.google.com with SMTP id k10so4242589wmi.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 22:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUMvSbiAdqwmj3082Fkqkqs8Pe1wia3cBHvBsYzTYdA=;
 b=f0CLhMJxigl3NH8rCWsuBnfs+Mi3N8v+INqxaOUsB/IyWi4tNXaO9bULg+9ItZTT5W
 kkQLYxeRuKzl3VdnXytaL4e6dbhgB28efx1ffmk/G5+SNDLUrfBpfm+oZ9k5LtYfpAaO
 SPVzuLDylQtI2Vg+jx7kIh0COk/QEAR3dS0hyqC/q75JVkSosrqPPZAE4Q9vtKZa0ns3
 e3Ca+SiMzaN+/v/qkSv5UPP9iuVyG9/hAPwy09AGqgRenyxsFKFrcvIj6HtrpJi/C5ci
 a8bWqWbH6GwfxJ2Mcs3RQcBGAcg9jL9WiNVQViIH/oos+rS2cGxS7CEeDICx2mjjxDog
 VaQg==
X-Gm-Message-State: AOAM532rllPwZbhVQzmrmfuLoqdUAgspwaR7S/+uUMPkR+ee/q/zpow4
 64kqo5HqnK28/oqjrsvSR4M=
X-Google-Smtp-Source: ABdhPJyodFogsvnADQETy1V+ZZ2rHzkWjACi6Hi5RORtB9P5ApxbYqeLSwt+2vy+DZh+Go80hSTXMw==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr6430416wmk.121.1610002350061; 
 Wed, 06 Jan 2021 22:52:30 -0800 (PST)
Received: from localhost (dynamic-046-114-149-183.46.114.pool.telefonica.de.
 [46.114.149.183])
 by smtp.gmail.com with ESMTPSA id m17sm7235000wrn.0.2021.01.06.22.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 22:52:29 -0800 (PST)
Date: Thu, 7 Jan 2021 07:52:18 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH] docs/system: Remove deprecated 'fulong2e' machine alias
Message-ID: <20210107075218.494e287c@tuxfamily.org>
In-Reply-To: <20210106184602.3771551-1-f4bug@amsat.org>
References: <20210106184602.3771551-1-f4bug@amsat.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.43; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, libvir-list@redhat.com,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Wed,  6 Jan 2021 19:46:02 +0100
schrieb Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>:

> The 'fulong2e' machine alias has been marked as deprecated since
> QEMU v5.1 (commit c3a09ff68dd, the machine is renamed 'fuloong2e').
> Time to remove it now.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst       | 5 -----
>  docs/system/removed-features.rst | 5 +++++
>  hw/mips/fuloong2e.c              | 1 -
>  3 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index bacd76d7a58..e20bfcb17a4 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -309,11 +309,6 @@ The 'scsi-disk' device is deprecated. Users
> should use 'scsi-hd' or System emulator machines
>  ------------------------
> =20
> -mips ``fulong2e`` machine (since 5.1)
> -'''''''''''''''''''''''''''''''''''''
> -
> -This machine has been renamed ``fuloong2e``.
> -
>  ``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> =20
> diff --git a/docs/system/removed-features.rst
> b/docs/system/removed-features.rst index 8b20d78a4d0..430fc33ca18
> 100644 --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -120,6 +120,11 @@ mips ``r4k`` platform (removed in 5.2)
>  This machine type was very old and unmaintained. Users should use
> the ``malta`` machine type instead.
> =20
> +mips ``fulong2e`` machine alias (removed in 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +This machine has been renamed ``fuloong2e``.
> +
>  Related binaries
>  ----------------
> =20
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 29805242caa..bac2adbd5ae 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -383,7 +383,6 @@ static void mips_fuloong2e_init(MachineState
> *machine) static void mips_fuloong2e_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "Fuloong 2e mini pc";
> -    mc->alias =3D "fulong2e";             /* Incorrect name used up to
> QEMU 4.2 */ mc->init =3D mips_fuloong2e_init;
>      mc->block_default_type =3D IF_IDE;
>      mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-2E");

Reviewed-by: Thomas Huth <huth@tuxfamily.org>


