Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6D42B676
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:09:56 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXSc-0005UJ-Qe
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1maVqs-0006tr-I1
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:26:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1maVqq-0000uh-8N
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:26:50 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 229DC3FFF9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634099204;
 bh=75g4J4cm/l1lNVFxM29/e9WtrjMhICVtXiQp2LuhFvo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=FgqxqTm9tiFQ7pYwYPN3DbhMLAD9wINtGEf3L9WYrRVYM9uICBO+lOfkKQxhIiNfJ
 Jyn/DSmZdgbqbMQJb/BetuKtFzadoVGlxWr1tfLnIEHNVoSA1ORibIIEQDyEsfQXmN
 wVCv6rhf9rWh4kSZ9qrFO4SVzmPo9qfb8CMrRyeqdsbgiORl7lcbvhvmXvI2ebCQIs
 BF0bwWuM/8u3t+xcJOadGRkFfyRbzbfV6L1dVNxypJ3L6YhOdwFlZD/mrxQmKgaVMp
 +wPOfwMQLPeB8gkmhHPOnNw2b2a/uMmEk7igF6rjcIQC0CBPNd8CmNB6Ju8BaJouLH
 UH2/LdTB0v90Q==
Received: by mail-lf1-f69.google.com with SMTP id
 br42-20020a056512402a00b003fd94a74905so1033377lfb.7
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 21:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=75g4J4cm/l1lNVFxM29/e9WtrjMhICVtXiQp2LuhFvo=;
 b=zLe6lo2pumMfAvhjrqjT8Xkqzxh/F370cYoMhU0+2E61xqxBwEEVBP4vG8o0bRKu5G
 fn1LduzD1bJhO3JeRWjmSAnlTVFpWMFnAUlAaOi8/TJNa1LV9XhPMV/niZ4nGq/b1QVt
 GinI9m7qkA63HK0Qw+Sw6S3VomacQ6kX6p6MzmrG06VSuYPrZnEhVOoKmR1624hjpwd/
 o9Vq4vVrAVXVKjvNdbmTmUH4hKNwPfTgzx3i6TugvtMOQgIzeVYzH6QnFodo8m5hLZ8A
 ssCkiUiV385ZW3zhWEFj5PA/sea3Oqp5bQPf7iVtQRTwjo97W7DFcLqzKcjfKFJHHod5
 c36Q==
X-Gm-Message-State: AOAM532Tq15XJKfgiy7u2vf0LIT4M6e/h6Pqy0gf8fcGbSQcvkvZRizX
 QzDJ8CJ7KuxzBaBdYwiiH1Jp1WVDuvCACGAPMb8RQmbYvbzvSSnt3y+1J0oz5tocHiJbtQ7dGOc
 8d3LhIIW3+3Djd6iej023eMqxuKL393YL
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr38292547wri.338.1634099192719; 
 Tue, 12 Oct 2021 21:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh/Uew5FeFBD0cxyneJ+cU+ACC/pAb6f61wP8RkRGGQF13fC4mLG4pRPFQMH0Qt5Pluo9F8g==
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr38292469wri.338.1634099192431; 
 Tue, 12 Oct 2021 21:26:32 -0700 (PDT)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id y5sm7145878wrq.85.2021.10.12.21.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 21:26:32 -0700 (PDT)
Message-ID: <f1500552-5c27-d338-6e4c-6460c0ef13af@canonical.com>
Date: Wed, 13 Oct 2021 06:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20211013010120.96851-1-sjg@chromium.org>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 02:07:35 -0400
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
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 qemu-devel@nongnu.org, Andre Przywara <andre.przywara@arm.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/13/21 03:01, Simon Glass wrote:
> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> there are only three ways to obtain a devicetree:
> 
>     - OF_SEPARATE - the normal way, where the devicetree is built and
>        appended to U-Boot
>     - OF_EMBED - for development purposes, the devicetree is embedded in
>        the ELF file (also used for EFI)
>     - OF_BOARD - the board figures it out on its own
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
> 
> This series makes this change, adding various missing devicetree files
> (and placeholders) to make the build work.

Why should we add dummy files with irrelevant content (see patch 06/16) 
to make the build work? Why don't you fix the Makefile instead?

Best regards

Heinrich

> 
> It also provides a few qemu clean-ups discovered along the way.
> 
> This series is based on Ilias' two series for OF_HOSTFILE and
> OF_PRIOR_STAGE removal.
> 
> It is available at u-boot-dm/ofb-working
> 
> [1] https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
> 
> 
> Simon Glass (16):
>    arm: qemu: Mention -nographic in the docs
>    arm: qemu: Explain how to extract the generate devicetree
>    riscv: qemu: Explain how to extract the generate devicetree
>    arm: qemu: Add a devicetree file for qemu_arm
>    arm: qemu: Add a devicetree file for qemu_arm64
>    riscv: qemu: Add devicetree files for qemu_riscv32/64
>    arm: rpi: Add a devicetree file for rpi_4
>    arm: vexpress: Add a devicetree file for juno
>    arm: xenguest_arm64: Add a fake devicetree file
>    arm: octeontx: Add a fake devicetree file
>    arm: xilinx_versal_virt: Add a devicetree file
>    arm: bcm7xxx: Add a devicetree file
>    arm: qemu-ppce500: Add a devicetree file
>    arm: highbank: Add a fake devicetree file
>    fdt: Make OF_BOARD a bool option
>    Drop CONFIG_BINMAN_STANDALONE_FDT
> 
>   Makefile                               |    3 +-
>   arch/arm/dts/Makefile                  |   20 +-
>   arch/arm/dts/bcm2711-rpi-4-b.dts       | 1958 ++++++++++++++++++++++++
>   arch/arm/dts/bcm7xxx.dts               |   15 +
>   arch/arm/dts/highbank.dts              |   14 +
>   arch/arm/dts/juno-r2.dts               | 1038 +++++++++++++
>   arch/arm/dts/octeontx.dts              |   14 +
>   arch/arm/dts/qemu-arm.dts              |  402 +++++
>   arch/arm/dts/qemu-arm64.dts            |  381 +++++
>   arch/arm/dts/xenguest-arm64.dts        |   15 +
>   arch/arm/dts/xilinx-versal-virt.dts    |  307 ++++
>   arch/powerpc/dts/Makefile              |    1 +
>   arch/powerpc/dts/qemu-ppce500.dts      |  264 ++++
>   arch/riscv/dts/Makefile                |    2 +-
>   arch/riscv/dts/qemu-virt.dts           |    8 -
>   arch/riscv/dts/qemu-virt32.dts         |  217 +++
>   arch/riscv/dts/qemu-virt64.dts         |  217 +++
>   configs/bcm7260_defconfig              |    1 +
>   configs/bcm7445_defconfig              |    1 +
>   configs/highbank_defconfig             |    2 +-
>   configs/octeontx2_95xx_defconfig       |    1 +
>   configs/octeontx2_96xx_defconfig       |    1 +
>   configs/octeontx_81xx_defconfig        |    1 +
>   configs/octeontx_83xx_defconfig        |    1 +
>   configs/qemu-ppce500_defconfig         |    2 +
>   configs/qemu-riscv32_defconfig         |    1 +
>   configs/qemu-riscv32_smode_defconfig   |    1 +
>   configs/qemu-riscv32_spl_defconfig     |    4 +-
>   configs/qemu-riscv64_defconfig         |    1 +
>   configs/qemu-riscv64_smode_defconfig   |    1 +
>   configs/qemu-riscv64_spl_defconfig     |    3 +-
>   configs/qemu_arm64_defconfig           |    1 +
>   configs/qemu_arm_defconfig             |    1 +
>   configs/rpi_4_32b_defconfig            |    1 +
>   configs/rpi_4_defconfig                |    1 +
>   configs/rpi_arm64_defconfig            |    1 +
>   configs/vexpress_aemv8a_juno_defconfig |    1 +
>   configs/xenguest_arm64_defconfig       |    1 +
>   configs/xilinx_versal_virt_defconfig   |    1 +
>   doc/board/emulation/qemu-arm.rst       |   19 +-
>   doc/board/emulation/qemu-riscv.rst     |   12 +
>   dts/Kconfig                            |   27 +-
>   tools/binman/binman.rst                |   20 -
>   43 files changed, 4922 insertions(+), 61 deletions(-)
>   create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
>   create mode 100644 arch/arm/dts/bcm7xxx.dts
>   create mode 100644 arch/arm/dts/highbank.dts
>   create mode 100644 arch/arm/dts/juno-r2.dts
>   create mode 100644 arch/arm/dts/octeontx.dts
>   create mode 100644 arch/arm/dts/qemu-arm.dts
>   create mode 100644 arch/arm/dts/qemu-arm64.dts
>   create mode 100644 arch/arm/dts/xenguest-arm64.dts
>   create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
>   create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
>   delete mode 100644 arch/riscv/dts/qemu-virt.dts
>   create mode 100644 arch/riscv/dts/qemu-virt32.dts
>   create mode 100644 arch/riscv/dts/qemu-virt64.dts
> 

