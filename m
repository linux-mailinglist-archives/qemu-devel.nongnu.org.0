Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A661B2E89E5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 02:39:37 +0100 (CET)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvsMq-00053i-NO
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 20:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsLW-0004bF-4M
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:38:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:54734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1kvsLT-00054F-2Q
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 20:38:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67B1220798
 for <qemu-devel@nongnu.org>; Sun,  3 Jan 2021 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609637887;
 bh=rfRP55XFOxY/x6YDWUj2bA9dBtiFw7yo73yDPGAskkA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CoERfcfb0S5+ehcOwJV2dScP609SjeTcYloyp3SH6F+QVBOKAL3WPAHxLkGnWpkcQ
 /xBI1ZZc6KakvI8OdrDoYLfWF3yWnYwo8Xpm5x+F3IPHtGG7zv8L1GibTtmHg0hM1g
 qq7e7CWGErvYMec/DPkRghsKRCHdjbVT5RZS4AhB+Xf9DNdPXKzpDYvu31MZk2bshT
 tRrmS00FElla7rEGQBHwoUADSp0VWCTPEjl5Q7EuX2d7gPrTxofXj+l8CYecx7YCxf
 tpUUhnpunJ4HHerpS9xc7zuVZtQtYw9HaE89EODTq1z2tzlSMho0VUFJUTuT2fo9Nt
 ToQW0fb74Beiw==
Received: by mail-il1-f174.google.com with SMTP id u12so22098399ilv.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 17:38:07 -0800 (PST)
X-Gm-Message-State: AOAM530ONWfzUFdgvuduIUCow8CutrnVPgMhekPTbi3jEoE/X+6Mnctl
 qhGxgio/AXKmzk/dOEs9nePNZ6Y5ZrF/4vrTM3I=
X-Google-Smtp-Source: ABdhPJz4OuR7B//zUsjwYfw4xwHVzh7mCM91c5q5iVHYTCmKZDdilbRGyJEsh7tnnrBEiDlWdc42pDTmfy3AYp8JfWE=
X-Received: by 2002:a92:c990:: with SMTP id y16mr66044405iln.35.1609637886875; 
 Sat, 02 Jan 2021 17:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20201231224911.1467352-1-f4bug@amsat.org>
 <20201231224911.1467352-2-f4bug@amsat.org>
In-Reply-To: <20201231224911.1467352-2-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 3 Jan 2021 09:37:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5=XG9avVGyE_5bVTuGw_SXJO=yZjcAdnDHP9b_qEsh7A@mail.gmail.com>
Message-ID: <CAAhV-H5=XG9avVGyE_5bVTuGw_SXJO=yZjcAdnDHP9b_qEsh7A@mail.gmail.com>
Subject: Re: [PATCH 01/18] hw/pci-host/bonito: Remove unused definitions
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
>  hw/pci-host/bonito.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index a99eced0657..0634f3289c4 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -189,12 +189,6 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>  #define BONITO_PCICONF_REG_MASK        0xFC
>  #define BONITO_PCICONF_REG_OFFSET      0
>
> -
> -/* idsel BIT =3D pci slot number +12 */
> -#define PCI_SLOT_BASE              12
> -#define PCI_IDSEL_VIA686B_BIT      (17)
> -#define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
> -
>  #define PCI_ADDR(busno , devno , funno , regno)  \
>      ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
>      (((funno) << 8) & 0x700) + (regno))
> --
> 2.26.2
>

