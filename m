Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2D142BC72
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:07:30 +0200 (CEST)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabAX-000125-IN
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1maau1-00032L-Oy
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:50:26 -0400
Received: from foss.arm.com ([217.140.110.172]:51958)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>) id 1maatw-00032M-4R
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:50:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8BFC1063;
 Wed, 13 Oct 2021 02:50:15 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71B973F70D;
 Wed, 13 Oct 2021 02:50:09 -0700 (PDT)
Date: Wed, 13 Oct 2021 10:50:05 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211013105005.4cf27c8b@donnerap.cambridge.arm.com>
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
References: <20211013010120.96851-1-sjg@chromium.org>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Rob Herring <robh@kernel.org>,
 Peter Robinson <pbrobinson@gmail.com>, Sinan Akman <sinan@writeme.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Wolfgang Denk <wd@denx.de>,
 Stephen Warren <swarren@wwwdotorg.org>, qemu-devel@nongnu.org,
 Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 19:01:04 -0600
Simon Glass <sjg@chromium.org> wrote:

Hi,

> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> there are only three ways to obtain a devicetree:
> 
>    - OF_SEPARATE - the normal way, where the devicetree is built and
>       appended to U-Boot
>    - OF_EMBED - for development purposes, the devicetree is embedded in
>       the ELF file (also used for EFI)
>    - OF_BOARD - the board figures it out on its own
> 
> The last one is currently set up so that no devicetree is needed at all
> in the U-Boot tree. Most boards do provide one, but some don't. Some
> don't even provide instructions on how to boot on the board.
> 
> The problems with this approach are documented at [1].
> 
> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
> can obtain its devicetree at runtime, even it is has a devicetree built
> in U-Boot. This is because U-Boot may be a second-stage bootloader and its
> caller may have a better idea about the hardware available in the machine.
> This is the case with a few QEMU boards, for example.
> 
> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> option, available with either OF_SEPARATE or OF_EMBED.

So I am possibly fine with that, but:

> This series makes this change, adding various missing devicetree files
> (and placeholders) to make the build work.

If we just need it to make the build work, we not just have pure stub DTs,
as you do for highbank, everywhere?
Adding *some* DT files for those platforms that actually do the right
thing seems like the wrong direction to me.
Providing DTs in the source repositories of the actual consumers is more
of a bad habit that dragged on since Linux started this around 10 years
ago (for practical reasons). For *some* platforms U-Boot is the firmware
component that is in the best situation to provide the DTB (because it's
more than a mere bootloader), but for other it's just not. And this is not
even looking at really dynamic platforms like QEMU, where providing some
kind of fixed DT is just not working.

I don't get the argument that people would need to see the DT in the tree
to develop code. The DT spec and binding documentation (currently living
in the Linux kernel source tree) provide the specification to code
against, and the platform specific selection of drivers in Kconfig and
_defconfig select the drivers for the devices that people are expected to
see. Why does one need actual DT files in the tree?

I totally agree on adding more documentation, possibly *pointing* to example
DTs or giving commands on how to obtain the actual copy (-dumpdtb,
/sys/firmware/devicetree), but don't think that adding some .dts files for
platforms that don't need them is the right way.

Cheers,
Andre.

> 
> It also provides a few qemu clean-ups discovered along the way.
> 
> This series is based on Ilias' two series for OF_HOSTFILE and
> OF_PRIOR_STAGE removal.
> 
> It is available at u-boot-dm/ofb-working
> 
> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
> 
> 
> Simon Glass (16):
>   arm: qemu: Mention -nographic in the docs
>   arm: qemu: Explain how to extract the generate devicetree
>   riscv: qemu: Explain how to extract the generate devicetree
>   arm: qemu: Add a devicetree file for qemu_arm
>   arm: qemu: Add a devicetree file for qemu_arm64
>   riscv: qemu: Add devicetree files for qemu_riscv32/64
>   arm: rpi: Add a devicetree file for rpi_4
>   arm: vexpress: Add a devicetree file for juno
>   arm: xenguest_arm64: Add a fake devicetree file
>   arm: octeontx: Add a fake devicetree file
>   arm: xilinx_versal_virt: Add a devicetree file
>   arm: bcm7xxx: Add a devicetree file
>   arm: qemu-ppce500: Add a devicetree file
>   arm: highbank: Add a fake devicetree file
>   fdt: Make OF_BOARD a bool option
>   Drop CONFIG_BINMAN_STANDALONE_FDT
> 
>  Makefile                               |    3 +-
>  arch/arm/dts/Makefile                  |   20 +-
>  arch/arm/dts/bcm2711-rpi-4-b.dts       | 1958 ++++++++++++++++++++++++
>  arch/arm/dts/bcm7xxx.dts               |   15 +
>  arch/arm/dts/highbank.dts              |   14 +
>  arch/arm/dts/juno-r2.dts               | 1038 +++++++++++++
>  arch/arm/dts/octeontx.dts              |   14 +
>  arch/arm/dts/qemu-arm.dts              |  402 +++++
>  arch/arm/dts/qemu-arm64.dts            |  381 +++++
>  arch/arm/dts/xenguest-arm64.dts        |   15 +
>  arch/arm/dts/xilinx-versal-virt.dts    |  307 ++++
>  arch/powerpc/dts/Makefile              |    1 +
>  arch/powerpc/dts/qemu-ppce500.dts      |  264 ++++
>  arch/riscv/dts/Makefile                |    2 +-
>  arch/riscv/dts/qemu-virt.dts           |    8 -
>  arch/riscv/dts/qemu-virt32.dts         |  217 +++
>  arch/riscv/dts/qemu-virt64.dts         |  217 +++
>  configs/bcm7260_defconfig              |    1 +
>  configs/bcm7445_defconfig              |    1 +
>  configs/highbank_defconfig             |    2 +-
>  configs/octeontx2_95xx_defconfig       |    1 +
>  configs/octeontx2_96xx_defconfig       |    1 +
>  configs/octeontx_81xx_defconfig        |    1 +
>  configs/octeontx_83xx_defconfig        |    1 +
>  configs/qemu-ppce500_defconfig         |    2 +
>  configs/qemu-riscv32_defconfig         |    1 +
>  configs/qemu-riscv32_smode_defconfig   |    1 +
>  configs/qemu-riscv32_spl_defconfig     |    4 +-
>  configs/qemu-riscv64_defconfig         |    1 +
>  configs/qemu-riscv64_smode_defconfig   |    1 +
>  configs/qemu-riscv64_spl_defconfig     |    3 +-
>  configs/qemu_arm64_defconfig           |    1 +
>  configs/qemu_arm_defconfig             |    1 +
>  configs/rpi_4_32b_defconfig            |    1 +
>  configs/rpi_4_defconfig                |    1 +
>  configs/rpi_arm64_defconfig            |    1 +
>  configs/vexpress_aemv8a_juno_defconfig |    1 +
>  configs/xenguest_arm64_defconfig       |    1 +
>  configs/xilinx_versal_virt_defconfig   |    1 +
>  doc/board/emulation/qemu-arm.rst       |   19 +-
>  doc/board/emulation/qemu-riscv.rst     |   12 +
>  dts/Kconfig                            |   27 +-
>  tools/binman/binman.rst                |   20 -
>  43 files changed, 4922 insertions(+), 61 deletions(-)
>  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
>  create mode 100644 arch/arm/dts/bcm7xxx.dts
>  create mode 100644 arch/arm/dts/highbank.dts
>  create mode 100644 arch/arm/dts/juno-r2.dts
>  create mode 100644 arch/arm/dts/octeontx.dts
>  create mode 100644 arch/arm/dts/qemu-arm.dts
>  create mode 100644 arch/arm/dts/qemu-arm64.dts
>  create mode 100644 arch/arm/dts/xenguest-arm64.dts
>  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
>  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
>  delete mode 100644 arch/riscv/dts/qemu-virt.dts
>  create mode 100644 arch/riscv/dts/qemu-virt32.dts
>  create mode 100644 arch/riscv/dts/qemu-virt64.dts
> 


