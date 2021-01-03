Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5A52E89E8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:42:19 +0100 (CET)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsPS-0007O2-8l
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsLo-0004is-HB
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:38:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:54820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsLn-0005Am-0R
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:38:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E09D20795
 for <qemu-devel@nongnu.org>; Sun,  3 Jan 2021 01:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609637909;
 bh=/GMl3cCr0dPyiOwVMyGZzet6ftImLvLWlS0Tr22WJr4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N5MFhr9NZHFwNCSXxbih7m73ojNAnU6tkIcmzcPtwB+M2kG2J/tD8uIV31aPdS7f5
 jM9LMubeaH+9eGsK2w/d7Aht55Ktliyq7Uo4SK8PUMj9fcrA6OaZrd2P6MSrupwK0F
 h/QPHDxb0vSDE0goTV3qtSxzW5msZ5BtDOwCr9Ln1P1DHKwhKaQeFaYH5yyXMEQNy8
 WMARvAvAj4gOTfSvS7eptstkZf9CLVCsIzcQYD0k3qv/F8YTXb+sNbcbx8/6d4edd+
 eiWvNaEo0WeZZSSnSt85bC1S39E4VljsF0SRI1Q3aLjJqanyk5gByzzmknATUS3hg4
 RdcEbs7pDr1qA==
Received: by mail-il1-f175.google.com with SMTP id 2so22104924ilg.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 17:38:29 -0800 (PST)
X-Gm-Message-State: AOAM530SvmpQ6Dudhj4F+y25Isj5BQpNgVMva9DmJXcllUD/H0C6NZSC
 1njQW2eQCXm6Vy+eHU/KfQ3qluW9tmLPdnyjTUw=
X-Google-Smtp-Source: ABdhPJxmHw5fyIcsEQvexzHHZgpYxTtW9iWWgrBf/sZW0dXYuq3NMRcDIVm4XXtwJkDMcFjh0rfh4u3ZX10DZGUjDOg=
X-Received: by 2002:a05:6e02:1187:: with SMTP id
 y7mr65452749ili.143.1609637908986; 
 Sat, 02 Jan 2021 17:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20201231224911.1467352-1-f4bug@amsat.org>
 <20201231224911.1467352-3-f4bug@amsat.org>
In-Reply-To: <20201231224911.1467352-3-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Jan 2021 09:38:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4QujJUw6eEmAPC3KCaYfjp+imFEqsGmDd1W7RJ=m9R0g@mail.gmail.com>
Message-ID: <CAAhV-H4QujJUw6eEmAPC3KCaYfjp+imFEqsGmDd1W7RJ=m9R0g@mail.gmail.com>
Subject: Re: [PATCH 02/18] hw/pci-host/bonito: Display hexadecimal value with
 '0x' prefix
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
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/pci-host/bonito.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 0634f3289c4..efeba29011f 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -463,8 +463,8 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, =
hwaddr addr)
>      regno =3D (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_=
OFFSET;
>
>      if (idsel =3D=3D 0) {
> -        error_report("error in bonito pci config address " TARGET_FMT_pl=
x
> -                     ",pcimap_cfg=3D%x", addr, s->regs[BONITO_PCIMAP_CFG=
]);
> +        error_report("error in bonito pci config address 0x" TARGET_FMT_=
plx
> +                     ",pcimap_cfg=3D0x%x", addr, s->regs[BONITO_PCIMAP_C=
FG]);
>          exit(1);
>      }
>      pciaddr =3D PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
> --
> 2.26.2
>

