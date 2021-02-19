Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7831F3A2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 02:32:12 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCueQ-00031p-Lp
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 20:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCubx-0002AN-1s; Thu, 18 Feb 2021 20:29:37 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCubu-00082k-Kb; Thu, 18 Feb 2021 20:29:36 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id u75so4062535ybi.10;
 Thu, 18 Feb 2021 17:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KFXXl2PUoBYeCvLVdr1Xw+9HXx3V7Y6wM3jnVF2r/6g=;
 b=aBKJN9xq+V4jq7pK7uk6jgiXEeMBkl4/IQJrjq088id8m88EkH/bw/5btuBSFcEmCV
 Zb8TMIESI8vFBJ/17PFeVjN2Xikvs07jO9DbhUfsS6B/Lpu7hH2+k8xQE4ItPUgUYvw3
 yeeLyoSVWfPqh7RUMPNsyu/LwIVQi+we4ZkiaRWNm8jYj5iiOYM9AMEew17ek0LVExiK
 fB6s3BnxlJM/r9J/AO0NfIvoRUrWEFAIor8CgdRMv7PlECYDun17XnCwB/LvQKbJT/wL
 /Ed7uxLHweZajvhbPI3/4/fpsbGTpuqE3xJhrdFSLycLBiYoQdy7URAno0FpfHBv61vV
 DvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KFXXl2PUoBYeCvLVdr1Xw+9HXx3V7Y6wM3jnVF2r/6g=;
 b=kQ1Ch74QtDcRywgjaTO83Q+UrdpIlU3wtPeWBAMmp8e7nSto9bLRpU82J01gOHoDFk
 qQo8daheUus+/D87hI5Jl5eREzQ31PoZKoz5hJvT58UoYRT9yWFzUtVN+zc3qLA88T/8
 e/O/gIH0Dto9g3OPzw0BjykZPvJ2pvx7mS2d011TdQLFiEjv4voXAUnSmnwDT1Kqp9yQ
 rD0Cim46lohwumPHsa7S6O3XllRkOmL6XdufxuX1y7wylfZHiJJUJZ7W5nsgOJsdC3fk
 D4HM8tj80VKgOWMAIUkJiieFeW3PdB8+QWmSLK3JHU6VdNDpZXrWubsyFs+nLM7YmqPC
 tsDA==
X-Gm-Message-State: AOAM531/T9GkHg6fp6Cdert2yUCD+T2f9lonIRX6PvjVlwM4+hLZl+4e
 8QzsFPnrvUCQ5BVjCbctlp/RNPZ1BWAUcawOT+U=
X-Google-Smtp-Source: ABdhPJycrvwH7NZc+PMgvoUj58fBX/xhtonbvgIm8sg9qBiZMg+Lvuv7ZYa1LPHI8ACHgfe+cFhXDSv2IiOyo7hyvak=
X-Received: by 2002:a25:d08d:: with SMTP id
 h135mr10641473ybg.122.1613698173238; 
 Thu, 18 Feb 2021 17:29:33 -0800 (PST)
MIME-Version: 1.0
References: <1613663886-83811-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1613663886-83811-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 19 Feb 2021 09:29:22 +0800
Message-ID: <CAEUhbmUWPBWtXaGcyOMfJi4GTAkNJ7uKWeQ24nzNLkhKuwmvHw@mail.gmail.com>
Subject: Re: [PATCH v2 00/38] ppc: qemu: Convert qemu-ppce500 to driver model
 and enable additional driver support
To: Simon Glass <sjg@chromium.org>, Alexander Graf <agraf@csgraf.de>, 
 Priyanka Jain <priyanka.jain@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
Cc: Tom Rini <trini@konsulko.com>, Matthias Brugger <mbrugger@suse.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Heiko Schocher <hs@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 11:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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
>   Patch #1 updated the non-DM fsl_pci_init driver to dynamically allocate the
>   PCI regions, to keep in sync with the pci uclass driver
> - One issue was caused by QEMU:
>   commit e6b4e5f4795b ("PPC: e500: Move CCSR and MMIO space to upper end of address space")
>   commit cb3778a0455a ("PPC: e500 pci host: Add support for ATMUs")
>   Patch #3-4 fixed this issue to keep in sync with latest QEMU upstream
>
> Patch #5-8, #34-36 are minor fixes and clean-ups.
>
> Starting from patch#9, these are driver model conversion patches.
>
> Patch #11-17 are mainly related to CONFIG_ADDR_MAP, a library to support targets
> that have non-identity virtual-physical address mappings. A new command 'addrmap'
> is introduced to aid debugging, and a fix to arch/powerpc/asm/include/io.h is
> made to correct the usage of CONFIG_ADDR_MAP as it can only be used in the post-
> relocation phase. Also the initialization of this library is moved a bit earlier
> in the post-relocation phase otherwise device drivers won't work.
>
> Patch #19-21 are 85xx PCI driver fixes. It adds support to controller register
> physical address beyond 32-bit, as well as support to 64-bit bus and cpu address
> as current upstream QEMU uses 64-bit cpu address.
>
> Starting from patch#24, these are additional driver support patches.
>
> Patch #24, #26 are minor fix to the 'virtio' command and BLK driver dependency.
>
> Patch #25 enables the VirtIO NET support as by default a VirtIO standard PCI
> networking device is connected as an ethernet interface at PCI address 0.1.0.
>
> Patch #27 enables the VirtIO BLK driver support.
>
> Patch #28-30 enables the GPIO support.
>
> Patch #31-32 enables poweroff via GPIO.
>
> Patch #33 enables RTC over the I2C bus.
>
> Patch #37 moves the qemu-ppce500 boards codes to board/emulation as that is the
> place for other QEMU targets like x86, arm, riscv.
>
> Patch #38 adds a reST document to describe how to build and run U-Boot for the
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
> Changes in v2:
> - drop the revert patch of commit e002474158d1
> - new patch: pci: fsl_pci_init: Dynamically allocate the PCI regions
> - add more details in the commit message, and put some comments
>   in the codes to explain why
> - add doc/usage/addrmap.rst
> - new patch: test: cmd: Add a basic test for 'addrmap' command
> - new patch: virtio: Fix VirtIO BLK driver dependency
> - new patch: ppc: qemu: Enable VirtIO BLK support
> - new patch: ppc: mpc85xx: Add 'gpibe' register to 'struct ccsr_gpio'
> - new patch: gpio: mpc8xxx: Support controller register physical address beyond 32-bit
> - new patch: ppc: qemu: Enable GPIO support
> - new patch: dm: sysreset: Add a Kconfig option for the 'reset' command
> - new patch: ppc: qemu: Enable support for power off via GPIO
> - new patch: ppc: qemu: Enable RTC support via I2C
> - new patch: ppc: qemu: Delete the temporary FDT virtual-physical mapping after U-Boot is relocated
> - new patch: ppc: qemu: Drop a custom env variable 'fdt_addr_r'
> - new patch: ppc: qemu: Drop fixed_sdram()
> - add descriptions for VirtIO BLK, RTC and power off
>

Azure results: PASS
https://dev.azure.com/bmeng/GitHub/_build/results?buildId=324&view=results

Regards,
Bin

