Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8B2E89E6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:41:30 +0100 (CET)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsOZ-00068y-7y
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsMN-0005Ak-Fz
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:39:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:54904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsML-0005Kx-JQ
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:39:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A9DC207A5
 for <qemu-devel@nongnu.org>; Sun,  3 Jan 2021 01:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609637944;
 bh=nNZanTODyHAWwDKIjwnEa7r7ATaNNtSJaDXvDwsu3Ew=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NNDMPpNZ7/1M4pjL79Uz5o2QNdTlGde2M2U/dewu+C04AFI/h891sXbfdUrpolJ+5
 +cyKkZeWtcpRgvxu3f8Pwt865ArN36CukRgsAwUwZnioebjXeZSnRFxSZvzKlcn/lD
 YlZmEbVS3Mucjxhb1A8Z3/9Wbsi9xATw05OdeMJ9HX+gud6zVdH9u6XiKckF3AATkE
 cllzwxfSAd2llEhIbcOLw3T6YrCuVFC1c3UVpuwfWtXSc6oxVE8VOe8sO6Zo1nglgH
 Y2/7eBCn4w5+AJrCleIHfddEo27mT2YZPSONt+OlZ1CNo14KY0C605PbRXg8nB4Mhu
 YqFhvTOecbwhg==
Received: by mail-io1-f43.google.com with SMTP id z5so21831462iob.11
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 17:39:04 -0800 (PST)
X-Gm-Message-State: AOAM5303dR7ynVj1IY5bFkivik1Plaqb4F1TI6hEFBDNKvmb5ODZrgqb
 1Hi8Y3R1pIFIIdaA4K3iJtykCYcPc6Mqs0JKmD0=
X-Google-Smtp-Source: ABdhPJzIS7dTPUGlD3dgE5hHuQMgrVYIsxNS54FrYWdBZdAPQ2QTKnLvNBXKWYDSSD69K+StNqYSoLsEWs4RRCd3yUE=
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr54141250iod.112.1609637943693; 
 Sat, 02 Jan 2021 17:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20201231224911.1467352-1-f4bug@amsat.org>
 <20201231224911.1467352-4-f4bug@amsat.org>
In-Reply-To: <20201231224911.1467352-4-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Jan 2021 09:38:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WmK77DeancYAbrQ4UD5mwQ1CNP+SAiMLh7Hd=fZYG_g@mail.gmail.com>
Message-ID: <CAAhV-H7WmK77DeancYAbrQ4UD5mwQ1CNP+SAiMLh7Hd=fZYG_g@mail.gmail.com>
Subject: Re: [PATCH 03/18] hw/pci-host/bonito: Use PCI_DEVFN() macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Fri, Jan 1, 2021 at 6:49 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Use the PCI_DEVFN() macro to replace the '0x28' magic value,
> this way it is clearer we access PCI function #0 of slot #5.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/bonito.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index efeba29011f..4c903d4f682 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -626,7 +626,7 @@ static void bonito_pcihost_realize(DeviceState *dev, =
Error **errp)
>      phb->bus =3D pci_register_root_bus(dev, "pci",
>                                       pci_bonito_set_irq, pci_bonito_map_=
irq,
>                                       dev, &bs->pci_mem, get_system_io(),
> -                                     0x28, 32, TYPE_PCI_BUS);
> +                                     PCI_DEVFN(5, 0), 32, TYPE_PCI_BUS);
>
>      for (size_t i =3D 0; i < 3; i++) {
>          char *name =3D g_strdup_printf("pci.lomem%zu", i);
> --
> 2.26.2
>

