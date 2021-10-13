Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB542C124
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:16:13 +0200 (CEST)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mae7A-000890-6d
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1madxo-0004QJ-Qw
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:32 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1madxm-0006EZ-8B
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:32 -0400
Received: by mail-ed1-x52f.google.com with SMTP id d9so9997857edh.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psHFBc0yXDafP7ONlmw3NesMOTch6FMEDclp4lo7hVA=;
 b=stJdDSm+AYbQSoJkI17tzKsMV8VUa7ugeX9A1d9jZaSqTemQ4PeVPXkzmLVGLf+T6B
 p9isJrqvV/EsFJ8Gb4oxpNWScwhjfH2U84vYfXRniSWZjSVdhY8iigMkASGi0g0mKNtR
 Xf1SVp0Yb9YsVX9maKCdFVNGjPU+Oft6IVJs6JIm9InbyA3h9YSZVjcyDAj4aGT11jq/
 iGu22DgXwAKpuY1pJpNaqFZ9dMVOQwI2tc5/Ah5TxVdpNMUKarw+tf6QPw7BolSZMXwe
 J8tVItzc7FAxEFqJoICSLSEtZruH1H110O4ilAW6ByDKOva0pLcRXXbEQAWH3NuHmkOv
 P2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psHFBc0yXDafP7ONlmw3NesMOTch6FMEDclp4lo7hVA=;
 b=6xx/YXbr/FrUWwEDYoIXK7coOCjtUWyKrGMHPeyZ96CQKYLueX4m7cHcyPOghoNfSk
 9g/fO5/PctI+E+RuPzA3o6lS4RwzuEmc+t1mL8jpkOpyth5jJB2QBgkOMSGP59x2QRKu
 RPuuwDGTGubjpuK8kLvEhbruCZlHpRY80A1NDgYT6ObyFeXke04G0hYZzUiAouoCUzFc
 8gHAPGipUWmsegcUhH8Go+8MQ0YvU9yZdrqHAs4aBBHHeem0n+vCwd81QqqYhW3He7iP
 itBTzlmjeuuSdwS9jOluzq5KgRu0ml8YJiA0kne0uckfmDb9ZVbsQHZfL9tCmVf8IoGE
 ZRGQ==
X-Gm-Message-State: AOAM532KIWDJLqTgnWrLSmIeahCGaeZqnBX0soIKly/8c5LvcyF9N9Z2
 zJ1r9ZbS7urvQPALhBaD/qDpUjifq4N4j4lXUPBubA==
X-Google-Smtp-Source: ABdhPJy8CFUmtZbDJgTSplqRNviUsZZnLCEbI4HFSgAiAWHriAo6oEDMuIDhmNWQDvSnYegPq2za6JKLutjYkCLQczo=
X-Received: by 2002:a50:bf08:: with SMTP id f8mr9243933edk.400.1634130388169; 
 Wed, 13 Oct 2021 06:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <f1500552-5c27-d338-6e4c-6460c0ef13af@canonical.com>
In-Reply-To: <f1500552-5c27-d338-6e4c-6460c0ef13af@canonical.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 15:06:17 +0200
Message-ID: <CAHFG_=Xv9SskJ7gYg8QJeQsujaPPhv_R_=M9UMW=EdBROAFVKg@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Content-Type: multipart/alternative; boundary="0000000000004dd8e605ce3ba1e3"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
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
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004dd8e605ce3ba1e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 oct. 2021 =C3=A0 14:41, Heinrich Schuchardt <
heinrich.schuchardt@canonical.com> a =C3=A9crit :

>
>
> On 10/13/21 03:01, Simon Glass wrote:
> > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> > there are only three ways to obtain a devicetree:
> >
> >     - OF_SEPARATE - the normal way, where the devicetree is built and
> >        appended to U-Boot
> >     - OF_EMBED - for development purposes, the devicetree is embedded i=
n
> >        the ELF file (also used for EFI)
> >     - OF_BOARD - the board figures it out on its own
> >
> > The last one is currently set up so that no devicetree is needed at all
> > in the U-Boot tree. Most boards do provide one, but some don't. Some
> > don't even provide instructions on how to boot on the board.
> >
> > The problems with this approach are documented at [1].
> >
> > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any boar=
d
> > can obtain its devicetree at runtime, even it is has a devicetree built
> > in U-Boot. This is because U-Boot may be a second-stage bootloader and
> its
> > caller may have a better idea about the hardware available in the
> machine.
> > This is the case with a few QEMU boards, for example.
> >
> > So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> > option, available with either OF_SEPARATE or OF_EMBED.
> >
> > This series makes this change, adding various missing devicetree files
> > (and placeholders) to make the build work.
>
> Why should we add dummy files with irrelevant content (see patch 06/16)
> to make the build work? Why don't you fix the Makefile instead?
>
+1

>
> Best regards
>
> Heinrich
>
> >
> > It also provides a few qemu clean-ups discovered along the way.
> >
> > This series is based on Ilias' two series for OF_HOSTFILE and
> > OF_PRIOR_STAGE removal.
> >
> > It is available at u-boot-dm/ofb-working
> >
> > [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >
> >
> > Simon Glass (16):
> >    arm: qemu: Mention -nographic in the docs
> >    arm: qemu: Explain how to extract the generate devicetree
> >    riscv: qemu: Explain how to extract the generate devicetree
> >    arm: qemu: Add a devicetree file for qemu_arm
> >    arm: qemu: Add a devicetree file for qemu_arm64
> >    riscv: qemu: Add devicetree files for qemu_riscv32/64
> >    arm: rpi: Add a devicetree file for rpi_4
> >    arm: vexpress: Add a devicetree file for juno
> >    arm: xenguest_arm64: Add a fake devicetree file
> >    arm: octeontx: Add a fake devicetree file
> >    arm: xilinx_versal_virt: Add a devicetree file
> >    arm: bcm7xxx: Add a devicetree file
> >    arm: qemu-ppce500: Add a devicetree file
> >    arm: highbank: Add a fake devicetree file
> >    fdt: Make OF_BOARD a bool option
> >    Drop CONFIG_BINMAN_STANDALONE_FDT
> >
> >   Makefile                               |    3 +-
> >   arch/arm/dts/Makefile                  |   20 +-
> >   arch/arm/dts/bcm2711-rpi-4-b.dts       | 1958 +++++++++++++++++++++++=
+
> >   arch/arm/dts/bcm7xxx.dts               |   15 +
> >   arch/arm/dts/highbank.dts              |   14 +
> >   arch/arm/dts/juno-r2.dts               | 1038 +++++++++++++
> >   arch/arm/dts/octeontx.dts              |   14 +
> >   arch/arm/dts/qemu-arm.dts              |  402 +++++
> >   arch/arm/dts/qemu-arm64.dts            |  381 +++++
> >   arch/arm/dts/xenguest-arm64.dts        |   15 +
> >   arch/arm/dts/xilinx-versal-virt.dts    |  307 ++++
> >   arch/powerpc/dts/Makefile              |    1 +
> >   arch/powerpc/dts/qemu-ppce500.dts      |  264 ++++
> >   arch/riscv/dts/Makefile                |    2 +-
> >   arch/riscv/dts/qemu-virt.dts           |    8 -
> >   arch/riscv/dts/qemu-virt32.dts         |  217 +++
> >   arch/riscv/dts/qemu-virt64.dts         |  217 +++
> >   configs/bcm7260_defconfig              |    1 +
> >   configs/bcm7445_defconfig              |    1 +
> >   configs/highbank_defconfig             |    2 +-
> >   configs/octeontx2_95xx_defconfig       |    1 +
> >   configs/octeontx2_96xx_defconfig       |    1 +
> >   configs/octeontx_81xx_defconfig        |    1 +
> >   configs/octeontx_83xx_defconfig        |    1 +
> >   configs/qemu-ppce500_defconfig         |    2 +
> >   configs/qemu-riscv32_defconfig         |    1 +
> >   configs/qemu-riscv32_smode_defconfig   |    1 +
> >   configs/qemu-riscv32_spl_defconfig     |    4 +-
> >   configs/qemu-riscv64_defconfig         |    1 +
> >   configs/qemu-riscv64_smode_defconfig   |    1 +
> >   configs/qemu-riscv64_spl_defconfig     |    3 +-
> >   configs/qemu_arm64_defconfig           |    1 +
> >   configs/qemu_arm_defconfig             |    1 +
> >   configs/rpi_4_32b_defconfig            |    1 +
> >   configs/rpi_4_defconfig                |    1 +
> >   configs/rpi_arm64_defconfig            |    1 +
> >   configs/vexpress_aemv8a_juno_defconfig |    1 +
> >   configs/xenguest_arm64_defconfig       |    1 +
> >   configs/xilinx_versal_virt_defconfig   |    1 +
> >   doc/board/emulation/qemu-arm.rst       |   19 +-
> >   doc/board/emulation/qemu-riscv.rst     |   12 +
> >   dts/Kconfig                            |   27 +-
> >   tools/binman/binman.rst                |   20 -
> >   43 files changed, 4922 insertions(+), 61 deletions(-)
> >   create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
> >   create mode 100644 arch/arm/dts/bcm7xxx.dts
> >   create mode 100644 arch/arm/dts/highbank.dts
> >   create mode 100644 arch/arm/dts/juno-r2.dts
> >   create mode 100644 arch/arm/dts/octeontx.dts
> >   create mode 100644 arch/arm/dts/qemu-arm.dts
> >   create mode 100644 arch/arm/dts/qemu-arm64.dts
> >   create mode 100644 arch/arm/dts/xenguest-arm64.dts
> >   create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
> >   create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
> >   delete mode 100644 arch/riscv/dts/qemu-virt.dts
> >   create mode 100644 arch/riscv/dts/qemu-virt32.dts
> >   create mode 100644 arch/riscv/dts/qemu-virt64.dts
> >
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000004dd8e605ce3ba1e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 14:41, Heinrich Schuchardt=
 &lt;<a href=3D"mailto:heinrich.schuchardt@canonical.com">heinrich.schuchar=
dt@canonical.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><br>
<br>
On 10/13/21 03:01, Simon Glass wrote:<br>
&gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE=
 so<br>
&gt; there are only three ways to obtain a devicetree:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0- OF_SEPARATE - the normal way, where the devicetre=
e is built and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 appended to U-Boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0- OF_EMBED - for development purposes, the devicetr=
ee is embedded in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the ELF file (also used for EFI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- OF_BOARD - the board figures it out on its own<br=
>
&gt; <br>
&gt; The last one is currently set up so that no devicetree is needed at al=
l<br>
&gt; in the U-Boot tree. Most boards do provide one, but some don&#39;t. So=
me<br>
&gt; don&#39;t even provide instructions on how to boot on the board.<br>
&gt; <br>
&gt; The problems with this approach are documented at [1].<br>
&gt; <br>
&gt; In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any boa=
rd<br>
&gt; can obtain its devicetree at runtime, even it is has a devicetree buil=
t<br>
&gt; in U-Boot. This is because U-Boot may be a second-stage bootloader and=
 its<br>
&gt; caller may have a better idea about the hardware available in the mach=
ine.<br>
&gt; This is the case with a few QEMU boards, for example.<br>
&gt; <br>
&gt; So it makes no sense to have OF_BOARD as a &#39;choice&#39;. It should=
 be an<br>
&gt; option, available with either OF_SEPARATE or OF_EMBED.<br>
&gt; <br>
&gt; This series makes this change, adding various missing devicetree files=
<br>
&gt; (and placeholders) to make the build work.<br>
<br>
Why should we add dummy files with irrelevant content (see patch 06/16) <br=
>
to make the build work? Why don&#39;t you fix the Makefile instead?<br>
</blockquote><div dir=3D"auto">+1</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Best regards<br>
<br>
Heinrich<br>
<br>
&gt; <br>
&gt; It also provides a few qemu clean-ups discovered along the way.<br>
&gt; <br>
&gt; This series is based on Ilias&#39; two series for OF_HOSTFILE and<br>
&gt; OF_PRIOR_STAGE removal.<br>
&gt; <br>
&gt; It is available at u-boot-dm/ofb-working<br>
&gt; <br>
&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/uboot/patch/202109=
19215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">=
https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-s=
jg@chromium.org/</a><br>
&gt; <br>
&gt; <br>
&gt; Simon Glass (16):<br>
&gt;=C2=A0 =C2=A0 arm: qemu: Mention -nographic in the docs<br>
&gt;=C2=A0 =C2=A0 arm: qemu: Explain how to extract the generate devicetree=
<br>
&gt;=C2=A0 =C2=A0 riscv: qemu: Explain how to extract the generate devicetr=
ee<br>
&gt;=C2=A0 =C2=A0 arm: qemu: Add a devicetree file for qemu_arm<br>
&gt;=C2=A0 =C2=A0 arm: qemu: Add a devicetree file for qemu_arm64<br>
&gt;=C2=A0 =C2=A0 riscv: qemu: Add devicetree files for qemu_riscv32/64<br>
&gt;=C2=A0 =C2=A0 arm: rpi: Add a devicetree file for rpi_4<br>
&gt;=C2=A0 =C2=A0 arm: vexpress: Add a devicetree file for juno<br>
&gt;=C2=A0 =C2=A0 arm: xenguest_arm64: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0 arm: octeontx: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0 arm: xilinx_versal_virt: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0 arm: bcm7xxx: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0 arm: qemu-ppce500: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0 arm: highbank: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0 fdt: Make OF_BOARD a bool option<br>
&gt;=C2=A0 =C2=A0 Drop CONFIG_BINMAN_STANDALONE_FDT<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 3 +-<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A020 +-<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 1958 ++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 1038 +++++++++++++<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 402 +++++<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 381 +++++<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A015 +<br>
&gt;=C2=A0 =C2=A0arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =C2=A0 |=C2=A0 3=
07 ++++<br>
&gt;=C2=A0 =C2=A0arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 264 ++++<br>
&gt;=C2=A0 =C2=A0arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 -<br>
&gt;=C2=A0 =C2=A0arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 217 +++<br>
&gt;=C2=A0 =C2=A0arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 217 +++<br>
&gt;=C2=A0 =C2=A0configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/highbank_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0configs/octeontx2_95xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/octeontx2_96xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/octeontx_81xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/octeontx_83xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-ppce500_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv32_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv32_smode_defconfig=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv32_spl_defconfig=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv64_smode_defconfig=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu-riscv64_spl_defconfig=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 3 +-<br>
&gt;=C2=A0 =C2=A0configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/qemu_arm_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/vexpress_aemv8a_juno_defconfig |=C2=A0 =C2=A0 1 +<=
br>
&gt;=C2=A0 =C2=A0configs/xenguest_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0configs/xilinx_versal_virt_defconfig=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A019 +-<br>
&gt;=C2=A0 =C2=A0doc/board/emulation/qemu-riscv.rst=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A012 +<br>
&gt;=C2=A0 =C2=A0dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A027 +-<br=
>
&gt;=C2=A0 =C2=A0tools/binman/binman.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A020 -<br>
&gt;=C2=A0 =C2=A043 files changed, 4922 insertions(+), 61 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/bcm7xxx.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/highbank.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/juno-r2.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/octeontx.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/qemu-arm.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/qemu-arm64.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/xenguest-arm64.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/arm/dts/xilinx-versal-virt.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/powerpc/dts/qemu-ppce500.dts<br>
&gt;=C2=A0 =C2=A0delete mode 100644 arch/riscv/dts/qemu-virt.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/riscv/dts/qemu-virt32.dts<br>
&gt;=C2=A0 =C2=A0create mode 100644 arch/riscv/dts/qemu-virt64.dts<br>
&gt; <br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro=
-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:=
rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7oi=
s-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)=
">|</span>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--0000000000004dd8e605ce3ba1e3--

