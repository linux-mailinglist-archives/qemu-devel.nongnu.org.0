Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9A43CE20
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:58:14 +0200 (CEST)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflJc-0006BR-M2
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfkdM-0003hj-8D
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:14:33 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfkdG-0007o0-0P
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:14:31 -0400
Received: by mail-ed1-x536.google.com with SMTP id s1so11968746edd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIugJ2ckXxPZciuRG3RJy7yjXO22V4LFx4lsqJfMe5c=;
 b=gzGA8uL2gQN7l7S2mm5P2CRJokZRYk8t3wkoxbrCD9I9vI5XX8Xf7ZLc+4kLtBJ4Ez
 PEzDjpVoZ+KSMzc6aLvThKroWa8HteEQDdashdPc+qD9sSglUzMX6NjIY/B07at+2hoG
 DjT2/unAVXYZvmMwUpRkQLml2fP7eY+lr9sNuslQuk00QY58WSUeU3kYlQEPniBVN5Cv
 gRH3Qxgffe0KyVb4aeUdE/p2SjeT0kT/luHOGt8vJ1JaXr7BQJQhSPoxZ8Rcr4QGxKsE
 meUt5TX8gd2cr23l2iG1KTVsSYO2GUsxcFpySi3PX7+xhLyhg0w7ztdXVbMq9OvTxPL0
 Y6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIugJ2ckXxPZciuRG3RJy7yjXO22V4LFx4lsqJfMe5c=;
 b=6iLPJRuc+Gkc44Wbe4fHyRDbyxPgdCvuWEUkaHiQovmsfg32n6pa84pU/fYMXzrbmd
 JdJFDAAasWUHa8zHzWDOMxJzFMano/IcN0CX8+Q6+rZk1HOLaBftyF5fwCModX/mZMV6
 2Yah++4NqKPTd7pTAY44o5nWHYTXSLWLynOQUyu6nMv667zd2uWyIHys28O2wicLM9lO
 99NdSVnjp+GbmZKUtAlT2v9nKg8DV4tMKQwRFxFYyFhvLn7piyIbxNR6OcELTXBM5sWB
 SuqZ9YzXttcWpLfQymLOIA2UGMsjCbf7sZtw1IVYwsS0RBsBA/kQ5JQ9Xh6FUhj6hARm
 X+Sw==
X-Gm-Message-State: AOAM532QTRrhknYcDGdG7DTVt0ti6egXms7GtFx1TKxB17FOAS0HmbQx
 w3Ak/QdsQiTIpVlG7rqIOHEX/DNyzjyjfnIxUiP7vg==
X-Google-Smtp-Source: ABdhPJyaxKb1/Un7Phok70W2usGfRwqvFw2EbG3OKDmfRQOZMFhSB2JZs/7gX42/HUdM+8oh7k7LUIfiS+iFaHGB9rA=
X-Received: by 2002:a17:907:7803:: with SMTP id
 la3mr40209401ejc.235.1635347658505; 
 Wed, 27 Oct 2021 08:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
In-Reply-To: <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 17:14:07 +0200
Message-ID: <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000045291005cf570cd3"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tom Rini <trini@konsulko.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045291005cf570cd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:

> Hi Fran=C3=A7ois,
>
> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> > Hi Simon
> >
> > Position unchanged on this series: adding fake dts for boards that
> generate their device tree in the dts directory is not good. If you have
> them in documentation the it is acceptable.
>
> I think we are going to have to disagree on this one. I actually used
> the qemu one in testing/development recently. We have to have a way to
> develop in-tree with U-Boot. It does not impinge on any of your use
> cases, so far as I know.
>
I am not the only one in disagreement... You just saw Alex B=C3=A9n=C3=A9e =
from Qemu
saying the same thing.
I understand the advanced debug/development scenario you mention.
But locating the DT files in the dts directory is mis-leading the
contributors to think that they need to compile the DT for the targeted
platforms.
For your advanced scenario, you can still have the dts in the documentation
area, or whatever directory (except dts). compile it and supply to U-Boot.

>
> But trying to do any driver / core work for a board where you don't
> have the devicetree is currently not possible. The devicetree is a
> core component and being unable to modify it is simply not practical.
> We are talking here about an option that can be enabled or disabled.
> In my case I am able to disable it locally and do my development work.


> BTW I've got the bloblist handoff working with a devicetree inside it,
> for qemu_arm. I need to try it on a real board to figure out what the
> difference is.
>
> That's great news and much needed for stabilizing the inbound ABI from
prior loader to U-Boot. Let's create another thread to discuss this
important topic.

> Regards,
> Simon
>
>
>
>
>
> >
> >
> > Cheers
> >
> > FF
> >
> > Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> >> there are only three ways to obtain a devicetree:
> >>
> >>    - OF_SEPARATE - the normal way, where the devicetree is built and
> >>       appended to U-Boot
> >>    - OF_EMBED - for development purposes, the devicetree is embedded i=
n
> >>       the ELF file (also used for EFI)
> >>    - OF_BOARD - the board figures it out on its own
> >>
> >> The last one is currently set up so that no devicetree is needed at al=
l
> >> in the U-Boot tree. Most boards do provide one, but some don't. Some
> >> don't even provide instructions on how to boot on the board.
> >>
> >> The problems with this approach are documented in another patch in thi=
s
> >> series: "doc: Add documentation about devicetree usage"
> >>
> >> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any boa=
rd
> >> can obtain its devicetree at runtime, even it is has a devicetree buil=
t
> >> in U-Boot. This is because U-Boot may be a second-stage bootloader and
> its
> >> caller may have a better idea about the hardware available in the
> machine.
> >> This is the case with a few QEMU boards, for example.
> >>
> >> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> >> option, available with either OF_SEPARATE or OF_EMBED.
> >>
> >> This series makes this change, adding various missing devicetree files
> >> (and placeholders) to make the build work.
> >>
> >> Note: If board maintainers are able to add their own patch to add the
> >> files, some patches in this series can be dropped.
> >>
> >> It also provides a few qemu clean-ups discovered along the way.
> >>
> >> Note: This breaks the qemu-riscv64_spl test, which still needs
> >> investigation.
> >>
> >> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >>
> >> Changes in v5:
> >> - Bring into the OF_BOARD series
> >> - Rebase to master and drop mention of OF_PRIOR_STAGE, since removed
> >> - Refer to the 'control' DTB in the first paragraph
> >> - Use QEMU instead of qemu
> >> - Merge RISC-V and ARM patches since they are similar
> >> - Add new patches to clean up fdtdec_setup() and surrounds
> >>
> >> Changes in v3:
> >> - Clarify the 'bug' refered to at the top
> >> - Reword 'This means that there' paragraph to explain U-Boot-specific
> things
> >> - Move to doc/develop/devicetree now that OF_CONTROL is in the docs
> >>
> >> Changes in v2:
> >> - Fix typos per Sean (thank you!) and a few others
> >> - Add a 'Use of U-Boot /config node' section
> >> - Drop mention of dm-verity since that actually uses the kernel cmdlin=
e
> >> - Explain that OF_BOARD will still work after these changes (in
> >>   'Once this bug is fixed...' paragraph)
> >> - Expand a bit on the reason why the 'Current situation' is bad
> >> - Clarify in a second place that Linux and U-Boot use the same
> devicetree
> >>   in 'To be clear, while U-Boot...'
> >> - Expand on why we should have rules for other projects in
> >>   'Devicetree in another project'
> >> - Add a comment as to why devicetree in U-Boot is not 'bad design'
> >> - Reword 'in-tree U-Boot devicetree' to 'devicetree source in U-Boot'
> >> - Rewrite 'Devicetree generated on-the-fly in another project' to cove=
r
> >>   points raised on v1
> >> - Add 'Why does U-Boot have its nodes and properties?'
> >> - Add 'Why not have two devicetrees?'
> >>
> >> Ilias Apalodimas (1):
> >>   sandbox: Remove OF_HOSTFILE
> >>
> >> Simon Glass (25):
> >>   doc: Add documentation about devicetree usage
> >>   arm: qemu: Mention -nographic in the docs
> >>   arm: riscv: qemu: Explain how to extract the generated dt
> >>   arm: qemu: Add a devicetree file for qemu_arm
> >>   arm: qemu: Add a devicetree file for qemu_arm64
> >>   riscv: qemu: Add devicetree files for qemu_riscv32/64
> >>   arm: rpi: Add a devicetree file for rpi_4
> >>   arm: vexpress: Add a devicetree file for juno
> >>   arm: xenguest_arm64: Add a fake devicetree file
> >>   arm: octeontx: Add a fake devicetree file
> >>   arm: xilinx_versal_virt: Add a devicetree file
> >>   arm: bcm7xxx: Add a devicetree file
> >>   arm: qemu-ppce500: Add a devicetree file
> >>   arm: highbank: Add a fake devicetree file
> >>   fdt: Make OF_BOARD a bool option
> >>   Drop CONFIG_BINMAN_STANDALONE_FDT
> >>   doc: Update info on devicetree update
> >>   fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
> >>   fdt: Drop #ifdefs with MULTI_DTB_FIT
> >>   fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
> >>   fdt: Drop #ifdef around board_fdt_blob_setup()
> >>   fdt: Use if() for fdtcontroladdr check
> >>   fdt: Drop OF_CONTROL check in fdtdec_setup()
> >>   fdt: Drop remaining preprocessor macros in fdtdec_setup()
> >>   fdt: Don't call board_fdt_blob_setup() without OF_BOARD
> >>
> >>  Makefile                                  |    7 +-
> >>  arch/arm/dts/Makefile                     |   20 +-
> >>  arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958 ++++++++++++++++++++=
+
> >>  arch/arm/dts/bcm7xxx.dts                  |   15 +
> >>  arch/arm/dts/highbank.dts                 |   14 +
> >>  arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
> >>  arch/arm/dts/octeontx.dts                 |   14 +
> >>  arch/arm/dts/qemu-arm.dts                 |  402 +++++
> >>  arch/arm/dts/qemu-arm64.dts               |  381 ++++
> >>  arch/arm/dts/xenguest-arm64.dts           |   15 +
> >>  arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
> >>  arch/powerpc/dts/Makefile                 |    1 +
> >>  arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
> >>  arch/riscv/dts/Makefile                   |    2 +-
> >>  arch/riscv/dts/qemu-virt.dts              |    8 -
> >>  arch/riscv/dts/qemu-virt32.dts            |  217 +++
> >>  arch/riscv/dts/qemu-virt64.dts            |  217 +++
> >>  arch/sandbox/cpu/cpu.c                    |   21 +-
> >>  arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
> >>  configs/bcm7260_defconfig                 |    1 +
> >>  configs/bcm7445_defconfig                 |    1 +
> >>  configs/highbank_defconfig                |    2 +-
> >>  configs/octeontx2_95xx_defconfig          |    1 +
> >>  configs/octeontx2_96xx_defconfig          |    1 +
> >>  configs/octeontx_81xx_defconfig           |    1 +
> >>  configs/octeontx_83xx_defconfig           |    1 +
> >>  configs/qemu-ppce500_defconfig            |    2 +
> >>  configs/qemu-riscv32_defconfig            |    1 +
> >>  configs/qemu-riscv32_smode_defconfig      |    1 +
> >>  configs/qemu-riscv32_spl_defconfig        |    4 +-
> >>  configs/qemu-riscv64_defconfig            |    1 +
> >>  configs/qemu-riscv64_smode_defconfig      |    1 +
> >>  configs/qemu-riscv64_spl_defconfig        |    3 +-
> >>  configs/qemu_arm64_defconfig              |    1 +
> >>  configs/qemu_arm_defconfig                |    1 +
> >>  configs/rpi_4_32b_defconfig               |    1 +
> >>  configs/rpi_4_defconfig                   |    1 +
> >>  configs/rpi_arm64_defconfig               |    1 +
> >>  configs/sandbox64_defconfig               |    2 +-
> >>  configs/sandbox_defconfig                 |    2 +-
> >>  configs/sandbox_flattree_defconfig        |    2 +-
> >>  configs/sandbox_noinst_defconfig          |    2 +-
> >>  configs/sandbox_spl_defconfig             |    2 +-
> >>  configs/tools-only_defconfig              |    2 +-
> >>  configs/vexpress_aemv8a_juno_defconfig    |    1 +
> >>  configs/xenguest_arm64_defconfig          |    1 +
> >>  configs/xilinx_versal_virt_defconfig      |    1 +
> >>  doc/board/emulation/qemu-arm.rst          |   10 +-
> >>  doc/board/emulation/qemu-riscv.rst        |    3 +
> >>  doc/develop/devicetree/control.rst        |    7 +-
> >>  doc/develop/devicetree/dt_qemu.rst        |   48 +
> >>  doc/develop/devicetree/dt_update.rst      |  498 ++++++
> >>  doc/develop/devicetree/index.rst          |    2 +
> >>  dts/Kconfig                               |   37 +-
> >>  include/asm-generic/global_data.h         |    8 +
> >>  include/fdtdec.h                          |   21 +-
> >>  lib/fdtdec.c                              |  116 +-
> >>  scripts/Makefile.spl                      |    4 +-
> >>  tools/binman/binman.rst                   |   20 -
> >>  59 files changed, 5560 insertions(+), 164 deletions(-)
> >>  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
> >>  create mode 100644 arch/arm/dts/bcm7xxx.dts
> >>  create mode 100644 arch/arm/dts/highbank.dts
> >>  create mode 100644 arch/arm/dts/juno-r2.dts
> >>  create mode 100644 arch/arm/dts/octeontx.dts
> >>  create mode 100644 arch/arm/dts/qemu-arm.dts
> >>  create mode 100644 arch/arm/dts/qemu-arm64.dts
> >>  create mode 100644 arch/arm/dts/xenguest-arm64.dts
> >>  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
> >>  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
> >>  delete mode 100644 arch/riscv/dts/qemu-virt.dts
> >>  create mode 100644 arch/riscv/dts/qemu-virt32.dts
> >>  create mode 100644 arch/riscv/dts/qemu-virt64.dts
> >>  create mode 100644 doc/develop/devicetree/dt_qemu.rst
> >>  create mode 100644 doc/develop/devicetree/dt_update.rst
> >>
> >> --
> >> 2.33.0.1079.g6e70778dc9-goog
> >>
> > --
> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> > T: +33.67221.6485
> > francois.ozog@linaro.org | Skype: ffozog
> >
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000045291005cf570cd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 Oct 2021 at 16:08, Simon G=
lass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Simon<br>
&gt;<br>
&gt; Position unchanged on this series: adding fake dts for boards that gen=
erate their device tree in the dts directory is not good. If you have them =
in documentation the it is acceptable.<br>
<br>
I think we are going to have to disagree on this one. I actually used<br>
the qemu one in testing/development recently. We have to have a way to<br>
develop in-tree with U-Boot. It does not impinge on any of your use<br>
cases, so far as I know.<br></blockquote><div>I am not the only one in disa=
greement... You just saw Alex B=C3=A9n=C3=A9e from Qemu saying the same thi=
ng.</div><div>I understand the advanced debug/development scenario you ment=
ion.</div><div>But locating the DT files in the dts directory is mis-leadin=
g the contributors to think that they need to compile the DT for the target=
ed platforms.</div><div>For your advanced scenario, you can still have the =
dts in the documentation area, or whatever directory (except dts). compile =
it and supply to U-Boot.=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
But trying to do any driver / core work for a board where you don&#39;t<br>
have the devicetree is currently not possible. The devicetree is a<br>
core component and being unable to modify it is simply not practical.<br>
We are talking here about an option that can be enabled or disabled.<br>
In my case I am able to disable it locally and do my development work.=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex">
<br>
BTW I&#39;ve got the bloblist handoff working with a devicetree inside it,<=
br>
for qemu_arm. I need to try it on a real board to figure out what the<br>
difference is.<br>
<br></blockquote><div>That&#39;s great news and much needed for stabilizing=
 the inbound ABI from prior loader to U-Boot. Let&#39;s create another thre=
ad to discuss this important topic.=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
Regards,<br>
Simon<br>
<br>
<br>
<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt; Cheers<br>
&gt;<br>
&gt; FF<br>
&gt;<br>
&gt; Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass &lt;<a href=3D"mailto:s=
jg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<=
br>
&gt;&gt;<br>
&gt;&gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and OF_HOST=
FILE so<br>
&gt;&gt; there are only three ways to obtain a devicetree:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the devicetree =
is built and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the devicetree=
 is embedded in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt;&gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its own<br>
&gt;&gt;<br>
&gt;&gt; The last one is currently set up so that no devicetree is needed a=
t all<br>
&gt;&gt; in the U-Boot tree. Most boards do provide one, but some don&#39;t=
. Some<br>
&gt;&gt; don&#39;t even provide instructions on how to boot on the board.<b=
r>
&gt;&gt;<br>
&gt;&gt; The problems with this approach are documented in another patch in=
 this<br>
&gt;&gt; series: &quot;doc: Add documentation about devicetree usage&quot;<=
br>
&gt;&gt;<br>
&gt;&gt; In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any=
 board<br>
&gt;&gt; can obtain its devicetree at runtime, even it is has a devicetree =
built<br>
&gt;&gt; in U-Boot. This is because U-Boot may be a second-stage bootloader=
 and its<br>
&gt;&gt; caller may have a better idea about the hardware available in the =
machine.<br>
&gt;&gt; This is the case with a few QEMU boards, for example.<br>
&gt;&gt;<br>
&gt;&gt; So it makes no sense to have OF_BOARD as a &#39;choice&#39;. It sh=
ould be an<br>
&gt;&gt; option, available with either OF_SEPARATE or OF_EMBED.<br>
&gt;&gt;<br>
&gt;&gt; This series makes this change, adding various missing devicetree f=
iles<br>
&gt;&gt; (and placeholders) to make the build work.<br>
&gt;&gt;<br>
&gt;&gt; Note: If board maintainers are able to add their own patch to add =
the<br>
&gt;&gt; files, some patches in this series can be dropped.<br>
&gt;&gt;<br>
&gt;&gt; It also provides a few qemu clean-ups discovered along the way.<br=
>
&gt;&gt;<br>
&gt;&gt; Note: This breaks the qemu-riscv64_spl test, which still needs<br>
&gt;&gt; investigation.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/uboot/patch/20=
210919215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278=
-3-sjg@chromium.org/</a><br>
&gt;&gt;<br>
&gt;&gt; Changes in v5:<br>
&gt;&gt; - Bring into the OF_BOARD series<br>
&gt;&gt; - Rebase to master and drop mention of OF_PRIOR_STAGE, since remov=
ed<br>
&gt;&gt; - Refer to the &#39;control&#39; DTB in the first paragraph<br>
&gt;&gt; - Use QEMU instead of qemu<br>
&gt;&gt; - Merge RISC-V and ARM patches since they are similar<br>
&gt;&gt; - Add new patches to clean up fdtdec_setup() and surrounds<br>
&gt;&gt;<br>
&gt;&gt; Changes in v3:<br>
&gt;&gt; - Clarify the &#39;bug&#39; refered to at the top<br>
&gt;&gt; - Reword &#39;This means that there&#39; paragraph to explain U-Bo=
ot-specific things<br>
&gt;&gt; - Move to doc/develop/devicetree now that OF_CONTROL is in the doc=
s<br>
&gt;&gt;<br>
&gt;&gt; Changes in v2:<br>
&gt;&gt; - Fix typos per Sean (thank you!) and a few others<br>
&gt;&gt; - Add a &#39;Use of U-Boot /config node&#39; section<br>
&gt;&gt; - Drop mention of dm-verity since that actually uses the kernel cm=
dline<br>
&gt;&gt; - Explain that OF_BOARD will still work after these changes (in<br=
>
&gt;&gt;=C2=A0 =C2=A0&#39;Once this bug is fixed...&#39; paragraph)<br>
&gt;&gt; - Expand a bit on the reason why the &#39;Current situation&#39; i=
s bad<br>
&gt;&gt; - Clarify in a second place that Linux and U-Boot use the same dev=
icetree<br>
&gt;&gt;=C2=A0 =C2=A0in &#39;To be clear, while U-Boot...&#39;<br>
&gt;&gt; - Expand on why we should have rules for other projects in<br>
&gt;&gt;=C2=A0 =C2=A0&#39;Devicetree in another project&#39;<br>
&gt;&gt; - Add a comment as to why devicetree in U-Boot is not &#39;bad des=
ign&#39;<br>
&gt;&gt; - Reword &#39;in-tree U-Boot devicetree&#39; to &#39;devicetree so=
urce in U-Boot&#39;<br>
&gt;&gt; - Rewrite &#39;Devicetree generated on-the-fly in another project&=
#39; to cover<br>
&gt;&gt;=C2=A0 =C2=A0points raised on v1<br>
&gt;&gt; - Add &#39;Why does U-Boot have its nodes and properties?&#39;<br>
&gt;&gt; - Add &#39;Why not have two devicetrees?&#39;<br>
&gt;&gt;<br>
&gt;&gt; Ilias Apalodimas (1):<br>
&gt;&gt;=C2=A0 =C2=A0sandbox: Remove OF_HOSTFILE<br>
&gt;&gt;<br>
&gt;&gt; Simon Glass (25):<br>
&gt;&gt;=C2=A0 =C2=A0doc: Add documentation about devicetree usage<br>
&gt;&gt;=C2=A0 =C2=A0arm: qemu: Mention -nographic in the docs<br>
&gt;&gt;=C2=A0 =C2=A0arm: riscv: qemu: Explain how to extract the generated=
 dt<br>
&gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm<br>
&gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm64<br>
&gt;&gt;=C2=A0 =C2=A0riscv: qemu: Add devicetree files for qemu_riscv32/64<=
br>
&gt;&gt;=C2=A0 =C2=A0arm: rpi: Add a devicetree file for rpi_4<br>
&gt;&gt;=C2=A0 =C2=A0arm: vexpress: Add a devicetree file for juno<br>
&gt;&gt;=C2=A0 =C2=A0arm: xenguest_arm64: Add a fake devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0arm: octeontx: Add a fake devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0arm: xilinx_versal_virt: Add a devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0arm: bcm7xxx: Add a devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0arm: qemu-ppce500: Add a devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0arm: highbank: Add a fake devicetree file<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Make OF_BOARD a bool option<br>
&gt;&gt;=C2=A0 =C2=A0Drop CONFIG_BINMAN_STANDALONE_FDT<br>
&gt;&gt;=C2=A0 =C2=A0doc: Update info on devicetree update<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()=
<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdefs with MULTI_DTB_FIT<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdef around board_fdt_blob_setup()<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Use if() for fdtcontroladdr check<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop OF_CONTROL check in fdtdec_setup()<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop remaining preprocessor macros in fdtdec_setu=
p()<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Don&#39;t call board_fdt_blob_setup() without OF_=
BOARD<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 7 +-<br>
&gt;&gt;=C2=A0 arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-<br>
&gt;&gt;=C2=A0 arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1958 +++++++++++++++++++++<br>
&gt;&gt;=C2=A0 arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
&gt;&gt;=C2=A0 arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt;=C2=A0 arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1038 +++++++++++<br>
&gt;&gt;=C2=A0 arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt;=C2=A0 arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 402 +++++<br>
&gt;&gt;=C2=A0 arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 381 ++++<br>
&gt;&gt;=C2=A0 arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt;&gt;=C2=A0 arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 307 ++++<br>
&gt;&gt;=C2=A0 arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 264 +++<br>
&gt;&gt;=C2=A0 arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 -<br>
&gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt;=C2=A0 arch/sandbox/cpu/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
&gt;&gt;=C2=A0 arch/sandbox/include/asm/u-boot-sandbox.h |=C2=A0 =C2=A0 8 -=
<br>
&gt;&gt;=C2=A0 configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/highbank_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/octeontx2_95xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/octeontx2_96xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/octeontx_81xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/octeontx_83xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu-ppce500_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt;=C2=A0 configs/qemu-riscv32_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu-riscv32_smode_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu-riscv32_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;&gt;=C2=A0 configs/qemu-riscv64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu-riscv64_smode_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu-riscv64_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 3 +-<br>
&gt;&gt;=C2=A0 configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/qemu_arm_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/sandbox64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/sandbox_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/sandbox_flattree_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/sandbox_noinst_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/sandbox_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/tools-only_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 configs/vexpress_aemv8a_juno_defconfig=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/xenguest_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 configs/xilinx_versal_virt_defconfig=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
&gt;&gt;=C2=A0 doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A010 +-<br>
&gt;&gt;=C2=A0 doc/board/emulation/qemu-riscv.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;&gt;=C2=A0 doc/develop/devicetree/control.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;&gt;=C2=A0 doc/develop/devicetree/dt_qemu.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A048 +<br>
&gt;&gt;=C2=A0 doc/develop/devicetree/dt_update.rst=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 498 ++++++<br>
&gt;&gt;=C2=A0 doc/develop/devicetree/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt;=C2=A0 dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A037 +-<br>
&gt;&gt;=C2=A0 include/asm-generic/global_data.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 8 +<br>
&gt;&gt;=C2=A0 include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
&gt;&gt;=C2=A0 lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 116 +-<br>
&gt;&gt;=C2=A0 scripts/Makefile.spl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;&gt;=C2=A0 tools/binman/binman.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 -<br>
&gt;&gt;=C2=A0 59 files changed, 5560 insertions(+), 164 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm7xxx.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/highbank.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/juno-r2.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/octeontx.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm64.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xenguest-arm64.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xilinx-versal-virt.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/powerpc/dts/qemu-ppce500.dts<br>
&gt;&gt;=C2=A0 delete mode 100644 arch/riscv/dts/qemu-virt.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt32.dts<br>
&gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt64.dts<br>
&gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/dt_qemu.rst<br>
&gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/dt_update.rst<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.33.0.1079.g6e70778dc9-goog<br>
&gt;&gt;<br>
&gt; --<br>
&gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development<=
br>
&gt; T: +33.67221.6485<br>
&gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois=
.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro-logo-we=
b.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans =
Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,8=
7,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=
=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</sp=
an>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=3D"fon=
t-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-siz=
e:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=
=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><br><a =
href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87);text-=
decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0<span =
style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr>=
</tbody></table></td></tr></tbody></table></div></div></div></div></div><di=
v><div><br style=3D"font-size:small"></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--00000000000045291005cf570cd3--

