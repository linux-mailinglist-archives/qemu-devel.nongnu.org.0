Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC25FFF41
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:44:55 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok30h-0003L5-1W
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2x6-0005tu-UW; Sun, 16 Oct 2022 08:41:13 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2x3-0002Ug-1r; Sun, 16 Oct 2022 08:41:12 -0400
Received: by mail-ej1-x62e.google.com with SMTP id fy4so19464495ejc.5;
 Sun, 16 Oct 2022 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTEMyvN9eWVq+Pb8fslPxbOTaNV6YI7z6zevaFOi/u4=;
 b=DHYi/fpWAUpRtytt7y+JjlmiR2sY0Ik1qupaBgc1lkCJRQLwzUVcHjNDQ0WP9PuKbU
 zX8ilVgEuKoTsin0ykl9NdPb5hSULfkhuMuYL1s5t3sN8B0yIpfeZAQGHpkA/HU1kBAJ
 rjq2rXPXjFYvocSADuYKRiqZPkEEqSAlFpH3BllhjRhVUKeM8po+urOKdLzjNGNQuptL
 I/2++hKaimXsAVMqcXXh7THZYjxMTaVrzjw7DRKyAk3w/fTy3Zs8tG9AZy9BwbTP2iPz
 5rff3pOIfpq+2eZlOOk5RY3tfvnSs0E4cDm2Dyr7u96Kei1mDSS1ksfTrk+SpH/I4TuY
 ARHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTEMyvN9eWVq+Pb8fslPxbOTaNV6YI7z6zevaFOi/u4=;
 b=LTd+6ws6dRh5G3sAj6VBNdVcjhmi+mZe0GNevgzqwECUloUizUhwOWpAevvJN3Ywvj
 jB+PHizCyYkttk9geVcWGkV0hh9QHJz/L0nqx0qw0iEOA7MhPqoZtjbByfndScN6+kfC
 XJ6WbGVjgF2x5NvFnUVFO4+njUoIe48vpD11nqA2Lo17xbEUaOaa+XRxWdwN5EIkat69
 8Naz2wYuz/osmMXg5S+yRwCJQvx0k8s/8KdZ5eHMNmwZXS8E3jdown5ymUxLJ0VkjIh9
 tGgBAIn2ieaDvnF2o8BidwvIODgc5HBhOIDKe4s7tn/WVEnfzAdGTL20QD3cQCv3W3kX
 CwzA==
X-Gm-Message-State: ACrzQf0KnGlYMD7af++erBxt7COTaRMnjoAE5cJKIN1LYvnCLDMb7P3A
 edQvp0r+Bk+YgpHzQSPRwaZ+855jlJ0=
X-Google-Smtp-Source: AMsMyM5laC5gImQ6Ij8Bh+2kzL5ZGSwozXGAdj9L8Apxkew25mIGWw9UwF0MAbKixQ9cUcS1Drdb+Q==
X-Received: by 2002:a17:907:968e:b0:78d:d4c7:b74f with SMTP id
 hd14-20020a170907968e00b0078dd4c7b74fmr5092414ejc.727.1665924066091; 
 Sun, 16 Oct 2022 05:41:06 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-006-139.89.14.pool.telefonica.de.
 [89.14.6.139]) by smtp.gmail.com with ESMTPSA id
 cx25-20020a05640222b900b004482dd03fe8sm5419465edb.91.2022.10.16.05.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 05:41:05 -0700 (PDT)
Date: Sun, 16 Oct 2022 12:41:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/9=5D_ppc/e500=3A_Add_sup?=
 =?US-ASCII?Q?port_for_two_types_of_flash=2C_cleanup?=
In-Reply-To: <20221016122737.93755-1-shentey@gmail.com>
References: <20221016122737.93755-1-shentey@gmail.com>
Message-ID: <51DDCB57-C505-4F7A-98B8-BE9C7492C23B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 16=2E Oktober 2022 12:27:28 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Cover letter:
>
>~~~~~~~~~~~~~
>
>
>
>This series adds support for -pflash and direct SD card access to the
>
>PPC e500 boards=2E The idea is to increase compatibility with "real" firm=
ware
>
>images where only the bare minimum of drivers is compiled in=2E
>
>
>
>The series is structured as follows:
>
>
>
>Patches 1-6 perform some general cleanup which paves the way for the rest=
 of
>
>the series=2E
>
>
>
>Patch 7 adds -pflash handling where memory-mapped flash can be added on
>
>user's behalf=2E That is, the flash memory region in the eLBC is only add=
ed if
>
>the -pflash argument is supplied=2E Note that the cfi01 device model beco=
mes
>
>stricter in checking the size of the emulated flash space=2E
>
>
>
>Patches 8 and 9 add a new device model - the Freescale eSDHC - to the e50=
0
>
>boards which was missing so far=2E
>
>
>
>User documentation is also added as the new features become available=2E
=
>
>
>
>Tesing done:
>
>* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>
>"console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive
>
>if=3Dpflash,file=3Drootfs=2Eext2,format=3Draw`
>
>* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append
>
>"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmy=
drive -drive
>
>id=3Dmydrive,if=3Dnone,file=3Drootfs=2Eext2,format=3Draw`
>
>
>
>The load was created using latest Buildroot with `make
>
>qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 =
type=2E
>
>In both cases it was possible to log in and explore the root file system=
=2E
>
>
>
>v3:
>
>~~~
>
>Phil:
>
>- Also add power-of-2 fix to pflash_cfi02
>
>- Resolve cfi01-specific assertion in e500 code
>
>- Resolve unused define in eSDHC device model
>
>- Resolve redundant alignment checks in eSDHC device model
>
>
>
>Bin:
>
>- Add dedicated flash chapter to documentation
>
>
>
>Bernhard:
>
>- Use is_power_of_2() instead of ctpop64() for better readability
>
>- Only instantiate eSDHC device model in ppce500 (not used in MPC8544DS)
=
>
>- Rebase onto gitlab=2Ecom/danielhb/qemu/tree/ppc-next
- Move cfi0x memory region setup into board code to avoid cfi01-specific a=
ssertion there
- While at it, resolve unreachable code related to cfi01 device creation
- Reorder patches such that trivial patches come first

Best regards,
Bernhard

>
>
>
>v2:
>
>~~~
>
>Bin:
>
>- Add source for MPC8544DS platform bus' memory map in commit message=2E
=
>
>- Keep "ESDHC" in comment referring to Linux driver=2E
>
>- Use "qemu-system-ppc{64|32} in documentation=2E
>
>- Use g_autofree in device tree code=2E
>
>- Remove unneeded device tree properties=2E
>
>- Error out if pflash size doesn't fit into eLBC memory window=2E
>
>- Remove unused ESDHC defines=2E
>
>- Define macro ESDHC_WML for register offset with magic constant=2E
>
>- Fix some whitespace issues when adding eSDHC device to e500=2E
>
>
>
>Phil:
>
>- Fix tense in commit message=2E
>
>
>
>Bernhard Beschow (9):
>
>  hw/block/pflash_cfi0{1,2}: Error out if device length isn't a power of
=
>
>    two
>
>  hw/{arm,ppc}: Resolve unreachable code
>
>  hw/block/pflash_cfi01: Attach memory region in boards
>
>  hw/block/pflash_cfi02: Attach memory region in boards
>
>  hw/sd/sdhci-internal: Unexport ESDHC defines
>
>  hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>
>  hw/ppc/e500: Implement pflash handling
>
>  hw/sd/sdhci: Implement Freescale eSDHC device model
>
>  hw/ppc/e500: Add Freescale eSDHC to e500plat
>
>
>
> docs/system/ppc/ppce500=2Erst              |  28 ++++
>
> hw/arm/collie=2Ec                          |  20 ++-
>
> hw/arm/digic_boards=2Ec                    |  16 +-
>
> hw/arm/gumstix=2Ec                         |  24 +--
>
> hw/arm/mainstone=2Ec                       |  15 +-
>
> hw/arm/musicpal=2Ec                        |  15 +-
>
> hw/arm/omap_sx1=2Ec                        |  25 ++--
>
> hw/arm/versatilepb=2Ec                     |  14 +-
>
> hw/arm/xilinx_zynq=2Ec                     |  12 +-
>
> hw/arm/z2=2Ec                              |  12 +-
>
> hw/block/pflash_cfi01=2Ec                  |  12 +-
>
> hw/block/pflash_cfi02=2Ec                  |  14 +-
>
> hw/microblaze/petalogix_ml605_mmu=2Ec      |  16 +-
>
> hw/microblaze/petalogix_s3adsp1800_mmu=2Ec |  10 +-
>
> hw/mips/malta=2Ec                          |   4 +-
>
> hw/ppc/Kconfig                           |   2 +
>
> hw/ppc/e500=2Ec                            |  97 +++++++++++-
>
> hw/ppc/e500=2Eh                            |   1 +
>
> hw/ppc/e500plat=2Ec                        |   1 +
>
> hw/ppc/sam460ex=2Ec                        |  19 ++-
>
> hw/ppc/virtex_ml507=2Ec                    |   5 +-
>
> hw/sd/sdhci-internal=2Eh                   |  20 ---
>
> hw/sd/sdhci=2Ec                            | 183 ++++++++++++++++++++---=

>
> hw/sh4/r2d=2Ec                             |  11 +-
>
> include/hw/block/flash=2Eh                 |   7 +-
>
> include/hw/sd/sdhci=2Eh                    |   3 +
>
> 26 files changed, 433 insertions(+), 153 deletions(-)
>
>
>
>-- >
>2=2E38=2E0
>
>
>


