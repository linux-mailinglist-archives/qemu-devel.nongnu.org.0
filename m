Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BF742C114
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:11:56 +0200 (CEST)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mae31-0002EX-3j
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1madxK-00037C-Po
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:04 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1madxH-0003d6-L5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 09:06:02 -0400
Received: by mail-ed1-x533.google.com with SMTP id p13so10224690edw.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fg9YN1hjKENr5ESe51qpIaroWFowdP9uPzMLMJz29Lc=;
 b=lgkmT9JhnDVz8/PlaSNaN0U+Ox3ZTy/xxRTYe9WdthJmisLKmiNqdpi5FxiJOjmwUT
 zIE8xNUFNnaPJgtX6tjnTpYFNbgPNyokKVQnnkpem08myAJZ63YW/XPMhK7PfQR3zDEh
 HzdVvzbWsSKC3Mpq9OkHvrttgUON3g773xyfmLpVEihqFihnBgQG0t3E/CwK9gx3JL1b
 L+SesSomHvF821S4jHse06nf07BRat3GSZe49znhVufK4IolRGbh8ScInQsn3VhhPWqN
 DVzicksQHJaAcIPkqxnrqvDtWUyJCxzOOsawZADjvipLg4mfFzdGbZefwX9Jo5dp30AY
 +3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fg9YN1hjKENr5ESe51qpIaroWFowdP9uPzMLMJz29Lc=;
 b=ByAneQNvPp3XA7FQQ1L0mP1mKaO34+DxlraRXGELckf6vNBdWFhbcO4joLX5JdSteR
 kl5U8qe1mwu0eblelLA5cxsz56n8IphfDIbo5Xnu/RdiUuWjtlVfVYEuWpsXC2nPer5k
 e3oOyyJ8VHC8fo6arfML4wbZPyXsb+/iEl3lRpQg0TxDj8EyPATN3lhgR5E0szw/bSch
 7VfecE6TRJrY0w6u1Foc5ZbxWWGuMHdE3uHSZp7iAf3j1uRpp5yLTRLbPmrVUdDIPTG7
 YoSWWfDxtLzK8+2Ac3ABLNh5h0a1bNX/A8YIfCuipx8eSbXX4y/G/KbXh6e5l4Tk4ciX
 T/vA==
X-Gm-Message-State: AOAM5338aWotDERNfyE7ymSGbMXYqwxqoh2/hDblX67FtLJQ1zvnAviT
 0zXSaC3IrV0baMXC2ah5p3PkPg65X4Sy8Ra/K5sA0w==
X-Google-Smtp-Source: ABdhPJyCdGsJZAqJQKTIioBZANDXyhMeDxY+YaOyVp0YAIjcIhIog8FevpE1T83xQJqA1YqajsNGNTc2jO98FgLRDyQ=
X-Received: by 2002:a05:6402:34f:: with SMTP id
 r15mr8214299edw.111.1634130355513; 
 Wed, 13 Oct 2021 06:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013105005.4cf27c8b@donnerap.cambridge.arm.com>
In-Reply-To: <20211013105005.4cf27c8b@donnerap.cambridge.arm.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 15:05:44 +0200
Message-ID: <CAHFG_=WnxYjZukp1kKooEaeGsAN=YZrs0Z9pwN2DL7TxyBtGcA@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Andre Przywara <andre.przywara@arm.com>
Content-Type: multipart/alternative; boundary="0000000000005b827c05ce3b9f68"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x533.google.com
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
 Rob Herring <robh@kernel.org>, Stephen Warren <swarren@nvidia.com>,
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
 qemu-devel@nongnu.org, Tim Harvey <tharvey@gateworks.com>,
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
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Tom Rini <trini@konsulko.com>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b827c05ce3b9f68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 oct. 2021 =C3=A0 14:41, Andre Przywara <andre.przywara@arm.com> =
a
=C3=A9crit :

> On Tue, 12 Oct 2021 19:01:04 -0600
> Simon Glass <sjg@chromium.org> wrote:
>
> Hi,
>
> > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> > there are only three ways to obtain a devicetree:
> >
> >    - OF_SEPARATE - the normal way, where the devicetree is built and
> >       appended to U-Boot
> >    - OF_EMBED - for development purposes, the devicetree is embedded in
> >       the ELF file (also used for EFI)
> >    - OF_BOARD - the board figures it out on its own
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
>
> So I am possibly fine with that, but:
>
> > This series makes this change, adding various missing devicetree files
> > (and placeholders) to make the build work.
>
> If we just need it to make the build work, we not just have pure stub DTs=
,
> as you do for highbank, everywhere?
> Adding *some* DT files for those platforms that actually do the right
> thing seems like the wrong direction to me.
> Providing DTs in the source repositories of the actual consumers is more
> of a bad habit that dragged on since Linux started this around 10 years
> ago (for practical reasons). For *some* platforms U-Boot is the firmware
> component that is in the best situation to provide the DTB (because it's
> more than a mere bootloader), but for other it's just not. And this is no=
t
> even looking at really dynamic platforms like QEMU, where providing some
> kind of fixed DT is just not working.
>
> I don't get the argument that people would need to see the DT in the tree
> to develop code. The DT spec and binding documentation (currently living
> in the Linux kernel source tree) provide the specification to code
> against, and the platform specific selection of drivers in Kconfig and
> _defconfig select the drivers for the devices that people are expected to
> see. Why does one need actual DT files in the tree?
>
> I totally agree on adding more documentation, possibly *pointing* to
> example
> DTs or giving commands on how to obtain the actual copy (-dumpdtb,
> /sys/firmware/devicetree), but don't think that adding some .dts files fo=
r
> platforms that don't need them is the right way.
>
> Cheers,
> Andre.

+1

>
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
> >
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >
> >
> > Simon Glass (16):
> >   arm: qemu: Mention -nographic in the docs
> >   arm: qemu: Explain how to extract the generate devicetree
> >   riscv: qemu: Explain how to extract the generate devicetree
> >   arm: qemu: Add a devicetree file for qemu_arm
> >   arm: qemu: Add a devicetree file for qemu_arm64
> >   riscv: qemu: Add devicetree files for qemu_riscv32/64
> >   arm: rpi: Add a devicetree file for rpi_4
> >   arm: vexpress: Add a devicetree file for juno
> >   arm: xenguest_arm64: Add a fake devicetree file
> >   arm: octeontx: Add a fake devicetree file
> >   arm: xilinx_versal_virt: Add a devicetree file
> >   arm: bcm7xxx: Add a devicetree file
> >   arm: qemu-ppce500: Add a devicetree file
> >   arm: highbank: Add a fake devicetree file
> >   fdt: Make OF_BOARD a bool option
> >   Drop CONFIG_BINMAN_STANDALONE_FDT
> >
> >  Makefile                               |    3 +-
> >  arch/arm/dts/Makefile                  |   20 +-
> >  arch/arm/dts/bcm2711-rpi-4-b.dts       | 1958 ++++++++++++++++++++++++
> >  arch/arm/dts/bcm7xxx.dts               |   15 +
> >  arch/arm/dts/highbank.dts              |   14 +
> >  arch/arm/dts/juno-r2.dts               | 1038 +++++++++++++
> >  arch/arm/dts/octeontx.dts              |   14 +
> >  arch/arm/dts/qemu-arm.dts              |  402 +++++
> >  arch/arm/dts/qemu-arm64.dts            |  381 +++++
> >  arch/arm/dts/xenguest-arm64.dts        |   15 +
> >  arch/arm/dts/xilinx-versal-virt.dts    |  307 ++++
> >  arch/powerpc/dts/Makefile              |    1 +
> >  arch/powerpc/dts/qemu-ppce500.dts      |  264 ++++
> >  arch/riscv/dts/Makefile                |    2 +-
> >  arch/riscv/dts/qemu-virt.dts           |    8 -
> >  arch/riscv/dts/qemu-virt32.dts         |  217 +++
> >  arch/riscv/dts/qemu-virt64.dts         |  217 +++
> >  configs/bcm7260_defconfig              |    1 +
> >  configs/bcm7445_defconfig              |    1 +
> >  configs/highbank_defconfig             |    2 +-
> >  configs/octeontx2_95xx_defconfig       |    1 +
> >  configs/octeontx2_96xx_defconfig       |    1 +
> >  configs/octeontx_81xx_defconfig        |    1 +
> >  configs/octeontx_83xx_defconfig        |    1 +
> >  configs/qemu-ppce500_defconfig         |    2 +
> >  configs/qemu-riscv32_defconfig         |    1 +
> >  configs/qemu-riscv32_smode_defconfig   |    1 +
> >  configs/qemu-riscv32_spl_defconfig     |    4 +-
> >  configs/qemu-riscv64_defconfig         |    1 +
> >  configs/qemu-riscv64_smode_defconfig   |    1 +
> >  configs/qemu-riscv64_spl_defconfig     |    3 +-
> >  configs/qemu_arm64_defconfig           |    1 +
> >  configs/qemu_arm_defconfig             |    1 +
> >  configs/rpi_4_32b_defconfig            |    1 +
> >  configs/rpi_4_defconfig                |    1 +
> >  configs/rpi_arm64_defconfig            |    1 +
> >  configs/vexpress_aemv8a_juno_defconfig |    1 +
> >  configs/xenguest_arm64_defconfig       |    1 +
> >  configs/xilinx_versal_virt_defconfig   |    1 +
> >  doc/board/emulation/qemu-arm.rst       |   19 +-
> >  doc/board/emulation/qemu-riscv.rst     |   12 +
> >  dts/Kconfig                            |   27 +-
> >  tools/binman/binman.rst                |   20 -
> >  43 files changed, 4922 insertions(+), 61 deletions(-)
> >  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
> >  create mode 100644 arch/arm/dts/bcm7xxx.dts
> >  create mode 100644 arch/arm/dts/highbank.dts
> >  create mode 100644 arch/arm/dts/juno-r2.dts
> >  create mode 100644 arch/arm/dts/octeontx.dts
> >  create mode 100644 arch/arm/dts/qemu-arm.dts
> >  create mode 100644 arch/arm/dts/qemu-arm64.dts
> >  create mode 100644 arch/arm/dts/xenguest-arm64.dts
> >  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
> >  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
> >  delete mode 100644 arch/riscv/dts/qemu-virt.dts
> >  create mode 100644 arch/riscv/dts/qemu-virt32.dts
> >  create mode 100644 arch/riscv/dts/qemu-virt64.dts
> >
>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000005b827c05ce3b9f68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 14:41, Andre Przywara &lt;=
<a href=3D"mailto:andre.przywara@arm.com">andre.przywara@arm.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 12 Oct 20=
21 19:01:04 -0600<br>
Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@c=
hromium.org</a>&gt; wrote:<br>
<br>
Hi,<br>
<br>
&gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE=
 so<br>
&gt; there are only three ways to obtain a devicetree:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the devicetree is b=
uilt and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the devicetree is =
embedded in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its own<br>
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
<br>
So I am possibly fine with that, but:<br>
<br>
&gt; This series makes this change, adding various missing devicetree files=
<br>
&gt; (and placeholders) to make the build work.<br>
<br>
If we just need it to make the build work, we not just have pure stub DTs,<=
br>
as you do for highbank, everywhere?<br>
Adding *some* DT files for those platforms that actually do the right<br>
thing seems like the wrong direction to me.<br>
Providing DTs in the source repositories of the actual consumers is more<br=
>
of a bad habit that dragged on since Linux started this around 10 years<br>
ago (for practical reasons). For *some* platforms U-Boot is the firmware<br=
>
component that is in the best situation to provide the DTB (because it&#39;=
s<br>
more than a mere bootloader), but for other it&#39;s just not. And this is =
not<br>
even looking at really dynamic platforms like QEMU, where providing some<br=
>
kind of fixed DT is just not working.<br>
<br>
I don&#39;t get the argument that people would need to see the DT in the tr=
ee<br>
to develop code. The DT spec and binding documentation (currently living<br=
>
in the Linux kernel source tree) provide the specification to code<br>
against, and the platform specific selection of drivers in Kconfig and<br>
_defconfig select the drivers for the devices that people are expected to<b=
r>
see. Why does one need actual DT files in the tree?<br>
<br>
I totally agree on adding more documentation, possibly *pointing* to exampl=
e<br>
DTs or giving commands on how to obtain the actual copy (-dumpdtb,<br>
/sys/firmware/devicetree), but don&#39;t think that adding some .dts files =
for<br>
platforms that don&#39;t need them is the right way.<br>
<br>
Cheers,<br>
Andre.</blockquote><div dir=3D"auto">+1</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
&gt; <br>
&gt; It also provides a few qemu clean-ups discovered along the way.<br>
&gt; <br>
&gt; This series is based on Ilias&#39; two series for OF_HOSTFILE and<br>
&gt; OF_PRIOR_STAGE removal.<br>
&gt; <br>
&gt; It is available at u-boot-dm/ofb-working<br>
&gt; <br>
&gt; [1]<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/uboot/patch/2021091921=
5111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">http=
s://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@c=
hromium.org/</a><br>
&gt; <br>
&gt; <br>
&gt; Simon Glass (16):<br>
&gt;=C2=A0 =C2=A0arm: qemu: Mention -nographic in the docs<br>
&gt;=C2=A0 =C2=A0arm: qemu: Explain how to extract the generate devicetree<=
br>
&gt;=C2=A0 =C2=A0riscv: qemu: Explain how to extract the generate devicetre=
e<br>
&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm<br>
&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm64<br>
&gt;=C2=A0 =C2=A0riscv: qemu: Add devicetree files for qemu_riscv32/64<br>
&gt;=C2=A0 =C2=A0arm: rpi: Add a devicetree file for rpi_4<br>
&gt;=C2=A0 =C2=A0arm: vexpress: Add a devicetree file for juno<br>
&gt;=C2=A0 =C2=A0arm: xenguest_arm64: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0arm: octeontx: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0arm: xilinx_versal_virt: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0arm: bcm7xxx: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0arm: qemu-ppce500: Add a devicetree file<br>
&gt;=C2=A0 =C2=A0arm: highbank: Add a fake devicetree file<br>
&gt;=C2=A0 =C2=A0fdt: Make OF_BOARD a bool option<br>
&gt;=C2=A0 =C2=A0Drop CONFIG_BINMAN_STANDALONE_FDT<br>
&gt; <br>
&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +-<=
br>
&gt;=C2=A0 arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A020 +-<br>
&gt;=C2=A0 arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0| 195=
8 ++++++++++++++++++++++++<br>
&gt;=C2=A0 arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt;=C2=A0 arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A014 +<br>
&gt;=C2=A0 arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1038 +++++++++++++<br>
&gt;=C2=A0 arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A014 +<br>
&gt;=C2=A0 arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 402 +++++<br>
&gt;=C2=A0 arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 381 +++++<br>
&gt;=C2=A0 arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A015 +<br>
&gt;=C2=A0 arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =C2=A0 |=C2=A0 307 +++=
+<br>
&gt;=C2=A0 arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =C2=A0 =C2=A0 |=C2=A0 26=
4 ++++<br>
&gt;=C2=A0 arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 8 -<br>
&gt;=C2=A0 arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 217 +++<br>
&gt;=C2=A0 arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 217 +++<br>
&gt;=C2=A0 configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/highbank_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 configs/octeontx2_95xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/octeontx2_96xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/octeontx_81xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/octeontx_83xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/qemu-ppce500_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 configs/qemu-riscv32_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/qemu-riscv32_smode_defconfig=C2=A0 =C2=A0|=C2=A0 =C2=A0 =
1 +<br>
&gt;=C2=A0 configs/qemu-riscv32_spl_defconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 4 +-<br>
&gt;=C2=A0 configs/qemu-riscv64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/qemu-riscv64_smode_defconfig=C2=A0 =C2=A0|=C2=A0 =C2=A0 =
1 +<br>
&gt;=C2=A0 configs/qemu-riscv64_spl_defconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 3 +-<br>
&gt;=C2=A0 configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/qemu_arm_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/vexpress_aemv8a_juno_defconfig |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/xenguest_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 1 +<br>
&gt;=C2=A0 configs/xilinx_versal_virt_defconfig=C2=A0 =C2=A0|=C2=A0 =C2=A0 =
1 +<br>
&gt;=C2=A0 doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A019 +-<br>
&gt;=C2=A0 doc/board/emulation/qemu-riscv.rst=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A012 +<br>
&gt;=C2=A0 dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A027 +-<br>
&gt;=C2=A0 tools/binman/binman.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A020 -<br>
&gt;=C2=A0 43 files changed, 4922 insertions(+), 61 deletions(-)<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm7xxx.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/highbank.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/juno-r2.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/octeontx.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm64.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/xenguest-arm64.dts<br>
&gt;=C2=A0 create mode 100644 arch/arm/dts/xilinx-versal-virt.dts<br>
&gt;=C2=A0 create mode 100644 arch/powerpc/dts/qemu-ppce500.dts<br>
&gt;=C2=A0 delete mode 100644 arch/riscv/dts/qemu-virt.dts<br>
&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt32.dts<br>
&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt64.dts<br>
&gt; <br>
<br>
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

--0000000000005b827c05ce3b9f68--

