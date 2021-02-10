Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993F7315B67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:39:23 +0100 (CET)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dXO-0002YE-JU
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9dUx-0001Yp-1k; Tue, 09 Feb 2021 19:36:51 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9dUu-00033T-Rk; Tue, 09 Feb 2021 19:36:50 -0500
Received: by mail-ed1-x52e.google.com with SMTP id df22so771124edb.1;
 Tue, 09 Feb 2021 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3vmn19wqWfl11muEm3IHl09DzVR499g0/uaih59mlI=;
 b=DFomUM0blngxXikYDamuUz8bn/BZhPmTdx+m0Kht/LmJwY6ChA5kKJa+DNYCloaA3y
 sGbAQqOwcL/SGMpKlSNASPbU/nnvdIBoxjZb+OZot0o9kr7vpuFrU8dpyykUckkR5XcL
 ktjDxk9q8fMwGgWAUlYK2Poj+6mud/klhPvR2Ju/pdkT6UVmCW7TK9G1zxHk5wOAMNZo
 oE3FLYd3E+HMbbJRBZ4q9VJ8t6Lbq+j7RNU85h9o7DWaZ61HmfeosfTlp4wsx2MmSIHk
 yUg/AwdFY0AGID5h5vsapHSUmBmcK7LNG/d/Sg0lop6qaEFesSkoxggBIfJiPOsxGrQE
 3y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3vmn19wqWfl11muEm3IHl09DzVR499g0/uaih59mlI=;
 b=ugbQCwSTqzgMIuCFegI2uFYH7YuFDa1YMoSqcBkTsxtA+3/jB5bmrj4m8byiX4m4OU
 xixl/dzopSr5JLHLNSXiioLH+b546XpppTeThJj86agHE2yBO3iMh3XyND6lp23SRFvP
 zAnqc1qKw4RfzD0xKs77NgVNIhdPMvpy3D/YrBmiB7vgScEP4Jkd/Pj52CnhDasQaOZL
 PGM3JyajnCale5Gt7eF0JNqMCYrEP0nHSf06tXGMNrQSScebWXKhgn1sQGAqJ98pfGDT
 sY1EoVuNG11rR/wL55ZHJ/iRCBnSNOL0K5Yj7tdgbRSDyefMSJ/mHmOFQrNxSOuMra8W
 npVw==
X-Gm-Message-State: AOAM530Goh2UA0W0W+H/VaynaMweGw7dk6Qv7uUdvmMOPpRCyWFaKcb/
 esGeT8YNS6Ls89rwcii21FN4/rKb3dIYK/fMal0=
X-Google-Smtp-Source: ABdhPJzqcsOFD5qeYxmfbehiFYNtUMwFsANmYa6tU40/qWKwKo3RMFEvP1BV8BojdaPnfY9Hk3Han/d7DlnXBZXeb1w=
X-Received: by 2002:a50:ff0d:: with SMTP id a13mr719693edu.321.1612917405058; 
 Tue, 09 Feb 2021 16:36:45 -0800 (PST)
MIME-Version: 1.0
References: <1612710687-56493-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612710687-56493-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 08:36:33 +0800
Message-ID: <CAEUhbmU7M44s63gRw5dz_gMD2yEmQ+-aykWhfBC0Z6jYMTjR_w@mail.gmail.com>
Subject: Re: [PATCH 00/26] ppc: qemu: Convert qemu-ppce500 to driver model
To: Simon Glass <sjg@chromium.org>, Alexander Graf <agraf@csgraf.de>, 
 Priyanka Jain <priyanka.jain@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Tom Rini <trini@konsulko.com>, Heiko Schocher <hs@denx.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Matthias Brugger <mbrugger@suse.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 7, 2021 at 11:11 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present when building qemu-ppce500 the following warnings are seen:
>
> ===================== WARNING ======================
> This board does not use CONFIG_DM. CONFIG_DM will be
> compulsory starting with the v2020.01 release.
> Failure to update may result in board removal.
>   UPD     include/generated/timestamp_autogenerated.h
> See doc/driver-model/migration.rst for more info.
> ====================================================
> ===================== WARNING ======================
> This board does not use CONFIG_DM_PCI Please update
> the board to use CONFIG_DM_PCI before the v2019.07 release.
> Failure to update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================
> ===================== WARNING ======================
> This board does not use CONFIG_DM_ETH (Driver Model
> for Ethernet drivers). Please update the board to use
> CONFIG_DM_ETH before the v2020.07 release. Failure to
> update by the deadline may result in board removal.
> See doc/driver-model/migration.rst for more info.
> ====================================================
>
> The conversion of qemu-ppce500 board to driver model is long overdue.
>
> When testing the exisitng qemu-ppce500 support, PCI was found broken.
> This is caused by 2 separate issues:
>
> - One issue was caused by U-Boot:
>   Commit e002474158d1 ("pci: pci-uclass: Dynamically allocate the PCI regions")
>   Patch #1 reverts this commit as it broken all boards that have not converted
>   to driver model PCI.
> - One issue was caused by QEMU:
>   commit e6b4e5f4795b ("PPC: e500: Move CCSR and MMIO space to upper end of address space")
>   commit cb3778a0455a ("PPC: e500 pci host: Add support for ATMUs")
>   Patch #3-4 fixed this issue to keep in sync with latest QEMU upstream
>
> Patch #5-8 are minor fixes and clean-ups.
>
> Starting from patch#9, these are driver model conversion patches.
>
> Patch #11-16 are mainly related to CONFIG_ADDR_MAP, a library to support targets
> that have non-identity virtual-physical address mappings. A new command 'addrmap'
> is introduced to aid debugging, and a fix to arch/powerpc/asm/include/io.h is
> made to correct the usage of CONFIG_ADDR_MAP as it can only be used in the post-
> relocation phase. Also the initialization of this library is moved a bit earlier
> in the post-relocation phase otherwise device drivers won't work.
>
> Patch #18-20 are 85xx PCI driver fixes. It adds support to controller register
> physical address beyond 32-bit, as well as support to 64-bit bus and cpu address
> as current upstream QEMU uses 64-bit cpu address.
>
> Patch #23 is minor fix to the 'virtio' command dependency.
>
> Patch #24 enables the VirtIO NET support as by default a VirtIO standard PCI
> networking device is connected as an ethernet interface at PCI address 0.1.0.
>
> Patch #25 moves the qemu-ppce500 boards codes to board/emulation as that is the
> place for other QEMU targets like x86, arm, riscv.
>
> Patch #26 adds a reST document to describe how to build and run U-Boot for the
> QEMU ppce500 machine.
>
> I hope we can make this series to U-Boot v2021.04 release.
>
> This series is available at u-boot-x86/qemu-ppc for testing.
>
> This cover letter is cc'ed to QEMU mailing list for a heads-up.
> A future patch will be sent to QEMU mailing list to bring its in-tree
> U-Boot source codes up-to-date.
>
>
> Bin Meng (26):
>   Revert "pci: pci-uclass: Dynamically allocate the PCI regions"
>   ppc: qemu: Update MAINTAINERS for correct email address
>   common: fdt_support: Support special case of PCI address in
>     fdt_read_prop()
>   ppc: qemu: Support non-identity PCI bus address
>   ppc: qemu: Fix CONFIG_SYS_PCI_MAP_END
>   ppc: mpc85xx: Wrap LAW related codes with CONFIG_FSL_LAW
>   ppc: qemu: Drop init_laws() and print_laws()
>   ppc: qemu: Drop board_early_init_f()
>   ppc: qemu: Enable OF_CONTROL
>   ppc: qemu: Enable driver model
>   include: Remove extern from addr_map.h
>   lib: addr_map: Move address_map[] type to the header file
>   cmd: Add a command to display the address map
>   lib: kconfig: Mention CONFIG_ADDR_MAP limitation in the help
>   ppc: io.h: Use addrmap_ translation APIs only in post-relocation phase
>   common: Move initr_addr_map() to a bit earlier
>   ppc: qemu: Switch over to use DM serial
>   pci: mpc85xx: Wrap LAW programming with CONFIG_FSL_LAW
>   pci: mpc85xx: Support controller register physical address beyond
>     32-bit
>   pci: mpc85xx: Support 64-bit bus and cpu address
>   ppc: qemu: Switch over to use DM ETH and PCI
>   ppc: qemu: Drop CONFIG_OF_BOARD_SETUP
>   cmd: Fix virtio command dependency
>   ppc: qemu: Enable VirtIO NET support
>   ppc: qemu: Move board directory from board/freescale to
>     board/emulation
>   doc: Add a reST document for qemu-ppce500
>
>  arch/powerpc/cpu/mpc85xx/Kconfig                   |   2 +-
>  arch/powerpc/cpu/mpc85xx/cpu.c                     |   2 +
>  arch/powerpc/cpu/mpc85xx/cpu_init_early.c          |   2 +
>  arch/powerpc/include/asm/io.h                      |  15 +-
>  .../{freescale => emulation}/qemu-ppce500/Kconfig  |   2 +-
>  board/emulation/qemu-ppce500/MAINTAINERS           |   7 +
>  .../{freescale => emulation}/qemu-ppce500/Makefile |   0
>  .../qemu-ppce500/qemu-ppce500.c                    | 159 ++++++---------------
>  board/freescale/qemu-ppce500/MAINTAINERS           |   6 -
>  cmd/Kconfig                                        |   8 ++
>  cmd/Makefile                                       |   1 +
>  cmd/addrmap.c                                      |  35 +++++
>  common/board_r.c                                   |   6 +-
>  common/fdt_support.c                               |  15 +-
>  configs/qemu-ppce500_defconfig                     |  14 +-
>  doc/board/emulation/index.rst                      |   1 +
>  doc/board/emulation/qemu-ppce500.rst               |  73 ++++++++++
>  drivers/pci/pci-uclass.c                           |  14 +-
>  drivers/pci/pci_mpc85xx.c                          |  25 ++--
>  include/addr_map.h                                 |  16 ++-
>  include/configs/qemu-ppce500.h                     |  25 +---
>  include/pci.h                                      |   4 +-
>  lib/Kconfig                                        |   2 +
>  lib/addr_map.c                                     |   6 +-
>  24 files changed, 250 insertions(+), 190 deletions(-)
>  rename board/{freescale => emulation}/qemu-ppce500/Kconfig (86%)
>  create mode 100644 board/emulation/qemu-ppce500/MAINTAINERS
>  rename board/{freescale => emulation}/qemu-ppce500/Makefile (100%)
>  rename board/{freescale => emulation}/qemu-ppce500/qemu-ppce500.c (68%)
>  delete mode 100644 board/freescale/qemu-ppce500/MAINTAINERS
>  create mode 100644 cmd/addrmap.c
>  create mode 100644 doc/board/emulation/qemu-ppce500.rst
>

Alex, Priyanka, do you have some time to review this series?

Regards,
Bin

