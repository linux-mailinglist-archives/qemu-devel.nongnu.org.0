Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258A43AC98
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:05:08 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGWA-0005RD-2G
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfFcl-0004QP-Gi
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:07:51 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfFce-0001xF-Rf
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:07:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id j10so9343650eds.12
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXFBcy3bWzo4v9UvwrQSL7zg4p9y4Nd5oFi8yqW7MNI=;
 b=R4yXZa5IdccL9NS/wkq6pLB1Ykm7EZUXwfKdJYKYEsSov5uFUG3BwLdZo1FwyhW0X4
 it7Z8ZA6unWnCAnXm/BaKRPC39w6y/z3jpo0N7HpE9xBSk/Xdqi82AKYn3nKMu36rzT0
 YBj9nx5ywJC+8qlIoOpJxEi6gUk+aBwA7mGsmww+A+vU0rtThn5L+/jBx1OAHTlOPe/W
 utsL5znnPaOKGAuGiCie1Dgl6nlMu2DGaViBbr+kcqFUwFiGgTB8amOc31i08UeETPFu
 zTAnI20PhgZI0geVz5rnV4tnlQfLYahaXqrCb1dqxX7HoRtGLsHuLsdfjSO+MU3+wEgc
 iS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXFBcy3bWzo4v9UvwrQSL7zg4p9y4Nd5oFi8yqW7MNI=;
 b=tsz0GfkVVWYJhIAo68YvFvEvxipSFS5gN8Jkh0a4cO78njzTOM8bl/s0ZYmOfWjvXd
 iGgHukbWobbGDNkyMONywojSiOWtkJCSxHPTU9BgFz80LdZu2LfyUnVlhrKpRjvIyUzB
 uZjsvEmt2CmaWiMM2LJDE6MmLnjaz6kxzRlw3uzqr6B0P6nOWwaN0RHqwXAQrgcfoFis
 8ntai3chUypXMKWvwUbjrAy9UHZAE0Bo4blveUAPzQrV892FEI8mBvTTtomXGMKZ20kT
 p04SXQz3DR8b1p7exPKDxKnq09kM/3C0AMr59TlRAHJJD3Fr9Vr3MqJiEVIhOaNCmolg
 5hcQ==
X-Gm-Message-State: AOAM532yLX9bYMcvzTLVVkFJrhTSdh2O+gG3NmR7I01P2qRqJrmkEjBF
 FsDzdkYo8vDlrG4RIBDCfx3JTOyjBnJK+I9q/9CLVQ==
X-Google-Smtp-Source: ABdhPJyRRQezQOzpBInIzvZPLWO3y9negITlCnUoIO8jqlEOI1hTnEODWzrewNAg55jsAGgSwZLXmft3zhIn/c+LYxM=
X-Received: by 2002:a05:6402:4250:: with SMTP id
 g16mr32188463edb.26.1635228462198; 
 Mon, 25 Oct 2021 23:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
In-Reply-To: <20211026002344.405160-1-sjg@chromium.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 26 Oct 2021 08:07:31 +0200
Message-ID: <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000009dc58905cf3b4bb9"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
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

--0000000000009dc58905cf3b4bb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Position unchanged on this series: adding fake dts for boards that generate
their device tree in the dts directory is not good. If you have them in
documentation the it is acceptable.

Cheers

FF

Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

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
> The problems with this approach are documented in another patch in this
> series: "doc: Add documentation about devicetree usage"
>
> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
> can obtain its devicetree at runtime, even it is has a devicetree built
> in U-Boot. This is because U-Boot may be a second-stage bootloader and it=
s
> caller may have a better idea about the hardware available in the machine=
.
> This is the case with a few QEMU boards, for example.
>
> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> option, available with either OF_SEPARATE or OF_EMBED.
>
> This series makes this change, adding various missing devicetree files
> (and placeholders) to make the build work.
>
> Note: If board maintainers are able to add their own patch to add the
> files, some patches in this series can be dropped.
>
> It also provides a few qemu clean-ups discovered along the way.
>
> Note: This breaks the qemu-riscv64_spl test, which still needs
> investigation.
>
> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
>
> Changes in v5:
> - Bring into the OF_BOARD series
> - Rebase to master and drop mention of OF_PRIOR_STAGE, since removed
> - Refer to the 'control' DTB in the first paragraph
> - Use QEMU instead of qemu
> - Merge RISC-V and ARM patches since they are similar
> - Add new patches to clean up fdtdec_setup() and surrounds
>
> Changes in v3:
> - Clarify the 'bug' refered to at the top
> - Reword 'This means that there' paragraph to explain U-Boot-specific
> things
> - Move to doc/develop/devicetree now that OF_CONTROL is in the docs
>
> Changes in v2:
> - Fix typos per Sean (thank you!) and a few others
> - Add a 'Use of U-Boot /config node' section
> - Drop mention of dm-verity since that actually uses the kernel cmdline
> - Explain that OF_BOARD will still work after these changes (in
>   'Once this bug is fixed...' paragraph)
> - Expand a bit on the reason why the 'Current situation' is bad
> - Clarify in a second place that Linux and U-Boot use the same devicetree
>   in 'To be clear, while U-Boot...'
> - Expand on why we should have rules for other projects in
>   'Devicetree in another project'
> - Add a comment as to why devicetree in U-Boot is not 'bad design'
> - Reword 'in-tree U-Boot devicetree' to 'devicetree source in U-Boot'
> - Rewrite 'Devicetree generated on-the-fly in another project' to cover
>   points raised on v1
> - Add 'Why does U-Boot have its nodes and properties?'
> - Add 'Why not have two devicetrees?'
>
> Ilias Apalodimas (1):
>   sandbox: Remove OF_HOSTFILE
>
> Simon Glass (25):
>   doc: Add documentation about devicetree usage
>   arm: qemu: Mention -nographic in the docs
>   arm: riscv: qemu: Explain how to extract the generated dt
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
>   doc: Update info on devicetree update
>   fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
>   fdt: Drop #ifdefs with MULTI_DTB_FIT
>   fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
>   fdt: Drop #ifdef around board_fdt_blob_setup()
>   fdt: Use if() for fdtcontroladdr check
>   fdt: Drop OF_CONTROL check in fdtdec_setup()
>   fdt: Drop remaining preprocessor macros in fdtdec_setup()
>   fdt: Don't call board_fdt_blob_setup() without OF_BOARD
>
>  Makefile                                  |    7 +-
>  arch/arm/dts/Makefile                     |   20 +-
>  arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958 +++++++++++++++++++++
>  arch/arm/dts/bcm7xxx.dts                  |   15 +
>  arch/arm/dts/highbank.dts                 |   14 +
>  arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
>  arch/arm/dts/octeontx.dts                 |   14 +
>  arch/arm/dts/qemu-arm.dts                 |  402 +++++
>  arch/arm/dts/qemu-arm64.dts               |  381 ++++
>  arch/arm/dts/xenguest-arm64.dts           |   15 +
>  arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
>  arch/powerpc/dts/Makefile                 |    1 +
>  arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
>  arch/riscv/dts/Makefile                   |    2 +-
>  arch/riscv/dts/qemu-virt.dts              |    8 -
>  arch/riscv/dts/qemu-virt32.dts            |  217 +++
>  arch/riscv/dts/qemu-virt64.dts            |  217 +++
>  arch/sandbox/cpu/cpu.c                    |   21 +-
>  arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
>  configs/bcm7260_defconfig                 |    1 +
>  configs/bcm7445_defconfig                 |    1 +
>  configs/highbank_defconfig                |    2 +-
>  configs/octeontx2_95xx_defconfig          |    1 +
>  configs/octeontx2_96xx_defconfig          |    1 +
>  configs/octeontx_81xx_defconfig           |    1 +
>  configs/octeontx_83xx_defconfig           |    1 +
>  configs/qemu-ppce500_defconfig            |    2 +
>  configs/qemu-riscv32_defconfig            |    1 +
>  configs/qemu-riscv32_smode_defconfig      |    1 +
>  configs/qemu-riscv32_spl_defconfig        |    4 +-
>  configs/qemu-riscv64_defconfig            |    1 +
>  configs/qemu-riscv64_smode_defconfig      |    1 +
>  configs/qemu-riscv64_spl_defconfig        |    3 +-
>  configs/qemu_arm64_defconfig              |    1 +
>  configs/qemu_arm_defconfig                |    1 +
>  configs/rpi_4_32b_defconfig               |    1 +
>  configs/rpi_4_defconfig                   |    1 +
>  configs/rpi_arm64_defconfig               |    1 +
>  configs/sandbox64_defconfig               |    2 +-
>  configs/sandbox_defconfig                 |    2 +-
>  configs/sandbox_flattree_defconfig        |    2 +-
>  configs/sandbox_noinst_defconfig          |    2 +-
>  configs/sandbox_spl_defconfig             |    2 +-
>  configs/tools-only_defconfig              |    2 +-
>  configs/vexpress_aemv8a_juno_defconfig    |    1 +
>  configs/xenguest_arm64_defconfig          |    1 +
>  configs/xilinx_versal_virt_defconfig      |    1 +
>  doc/board/emulation/qemu-arm.rst          |   10 +-
>  doc/board/emulation/qemu-riscv.rst        |    3 +
>  doc/develop/devicetree/control.rst        |    7 +-
>  doc/develop/devicetree/dt_qemu.rst        |   48 +
>  doc/develop/devicetree/dt_update.rst      |  498 ++++++
>  doc/develop/devicetree/index.rst          |    2 +
>  dts/Kconfig                               |   37 +-
>  include/asm-generic/global_data.h         |    8 +
>  include/fdtdec.h                          |   21 +-
>  lib/fdtdec.c                              |  116 +-
>  scripts/Makefile.spl                      |    4 +-
>  tools/binman/binman.rst                   |   20 -
>  59 files changed, 5560 insertions(+), 164 deletions(-)
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
>  create mode 100644 doc/develop/devicetree/dt_qemu.rst
>  create mode 100644 doc/develop/devicetree/dt_update.rst
>
> --
> 2.33.0.1079.g6e70778dc9-goog
>
> --
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000009dc58905cf3b4bb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Position unchanged on this series: adding fake dts for boards that gener=
ate their device tree in the dts directory is not good. If you have them in=
 documentation the it is acceptable.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Cheers</div><div dir=3D"auto"><br></div><div dir=3D"auto">FF</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Le=C2=A0mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass &lt;<a href=3D"mailt=
o:sjg@chromium.org">sjg@chromium.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">With Ilias&#39; efforts we have dropped OF_PR=
IOR_STAGE and OF_HOSTFILE so<br>
there are only three ways to obtain a devicetree:<br>
<br>
=C2=A0 =C2=A0- OF_SEPARATE - the normal way, where the devicetree is built =
and<br>
=C2=A0 =C2=A0 =C2=A0 appended to U-Boot<br>
=C2=A0 =C2=A0- OF_EMBED - for development purposes, the devicetree is embed=
ded in<br>
=C2=A0 =C2=A0 =C2=A0 the ELF file (also used for EFI)<br>
=C2=A0 =C2=A0- OF_BOARD - the board figures it out on its own<br>
<br>
The last one is currently set up so that no devicetree is needed at all<br>
in the U-Boot tree. Most boards do provide one, but some don&#39;t. Some<br=
>
don&#39;t even provide instructions on how to boot on the board.<br>
<br>
The problems with this approach are documented in another patch in this<br>
series: &quot;doc: Add documentation about devicetree usage&quot;<br>
<br>
In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board<br=
>
can obtain its devicetree at runtime, even it is has a devicetree built<br>
in U-Boot. This is because U-Boot may be a second-stage bootloader and its<=
br>
caller may have a better idea about the hardware available in the machine.<=
br>
This is the case with a few QEMU boards, for example.<br>
<br>
So it makes no sense to have OF_BOARD as a &#39;choice&#39;. It should be a=
n<br>
option, available with either OF_SEPARATE or OF_EMBED.<br>
<br>
This series makes this change, adding various missing devicetree files<br>
(and placeholders) to make the build work.<br>
<br>
Note: If board maintainers are able to add their own patch to add the<br>
files, some patches in this series can be dropped.<br>
<br>
It also provides a few qemu clean-ups discovered along the way.<br>
<br>
Note: This breaks the qemu-riscv64_spl test, which still needs<br>
investigation.<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/uboot/patch/20210919215=
111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">https=
://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@ch=
romium.org/</a><br>
<br>
Changes in v5:<br>
- Bring into the OF_BOARD series<br>
- Rebase to master and drop mention of OF_PRIOR_STAGE, since removed<br>
- Refer to the &#39;control&#39; DTB in the first paragraph<br>
- Use QEMU instead of qemu<br>
- Merge RISC-V and ARM patches since they are similar<br>
- Add new patches to clean up fdtdec_setup() and surrounds<br>
<br>
Changes in v3:<br>
- Clarify the &#39;bug&#39; refered to at the top<br>
- Reword &#39;This means that there&#39; paragraph to explain U-Boot-specif=
ic things<br>
- Move to doc/develop/devicetree now that OF_CONTROL is in the docs<br>
<br>
Changes in v2:<br>
- Fix typos per Sean (thank you!) and a few others<br>
- Add a &#39;Use of U-Boot /config node&#39; section<br>
- Drop mention of dm-verity since that actually uses the kernel cmdline<br>
- Explain that OF_BOARD will still work after these changes (in<br>
=C2=A0 &#39;Once this bug is fixed...&#39; paragraph)<br>
- Expand a bit on the reason why the &#39;Current situation&#39; is bad<br>
- Clarify in a second place that Linux and U-Boot use the same devicetree<b=
r>
=C2=A0 in &#39;To be clear, while U-Boot...&#39;<br>
- Expand on why we should have rules for other projects in<br>
=C2=A0 &#39;Devicetree in another project&#39;<br>
- Add a comment as to why devicetree in U-Boot is not &#39;bad design&#39;<=
br>
- Reword &#39;in-tree U-Boot devicetree&#39; to &#39;devicetree source in U=
-Boot&#39;<br>
- Rewrite &#39;Devicetree generated on-the-fly in another project&#39; to c=
over<br>
=C2=A0 points raised on v1<br>
- Add &#39;Why does U-Boot have its nodes and properties?&#39;<br>
- Add &#39;Why not have two devicetrees?&#39;<br>
<br>
Ilias Apalodimas (1):<br>
=C2=A0 sandbox: Remove OF_HOSTFILE<br>
<br>
Simon Glass (25):<br>
=C2=A0 doc: Add documentation about devicetree usage<br>
=C2=A0 arm: qemu: Mention -nographic in the docs<br>
=C2=A0 arm: riscv: qemu: Explain how to extract the generated dt<br>
=C2=A0 arm: qemu: Add a devicetree file for qemu_arm<br>
=C2=A0 arm: qemu: Add a devicetree file for qemu_arm64<br>
=C2=A0 riscv: qemu: Add devicetree files for qemu_riscv32/64<br>
=C2=A0 arm: rpi: Add a devicetree file for rpi_4<br>
=C2=A0 arm: vexpress: Add a devicetree file for juno<br>
=C2=A0 arm: xenguest_arm64: Add a fake devicetree file<br>
=C2=A0 arm: octeontx: Add a fake devicetree file<br>
=C2=A0 arm: xilinx_versal_virt: Add a devicetree file<br>
=C2=A0 arm: bcm7xxx: Add a devicetree file<br>
=C2=A0 arm: qemu-ppce500: Add a devicetree file<br>
=C2=A0 arm: highbank: Add a fake devicetree file<br>
=C2=A0 fdt: Make OF_BOARD a bool option<br>
=C2=A0 Drop CONFIG_BINMAN_STANDALONE_FDT<br>
=C2=A0 doc: Update info on devicetree update<br>
=C2=A0 fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()<br>
=C2=A0 fdt: Drop #ifdefs with MULTI_DTB_FIT<br>
=C2=A0 fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()<br>
=C2=A0 fdt: Drop #ifdef around board_fdt_blob_setup()<br>
=C2=A0 fdt: Use if() for fdtcontroladdr check<br>
=C2=A0 fdt: Drop OF_CONTROL check in fdtdec_setup()<br>
=C2=A0 fdt: Drop remaining preprocessor macros in fdtdec_setup()<br>
=C2=A0 fdt: Don&#39;t call board_fdt_blob_setup() without OF_BOARD<br>
<br>
=C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
7 +-<br>
=C2=A0arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-<br>
=C2=A0arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
1958 +++++++++++++++++++++<br>
=C2=A0arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
=C2=A0arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
=C2=A0arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1038 +++++++++++<br>
=C2=A0arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
=C2=A0arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 402 +++++<br>
=C2=A0arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 381 ++++<br>
=C2=A0arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A015 +<br>
=C2=A0arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 307 ++++<br>
=C2=A0arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 264 +++<br>
=C2=A0arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 8 -<br>
=C2=A0arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 217 +++<br>
=C2=A0arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 217 +++<br>
=C2=A0arch/sandbox/cpu/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
=C2=A0arch/sandbox/include/asm/u-boot-sandbox.h |=C2=A0 =C2=A0 8 -<br>
=C2=A0configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/highbank_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/octeontx2_95xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/octeontx2_96xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/octeontx_81xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/octeontx_83xx_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/qemu-ppce500_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0configs/qemu-riscv32_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/qemu-riscv32_smode_defconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0configs/qemu-riscv32_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 4 +-<br>
=C2=A0configs/qemu-riscv64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/qemu-riscv64_smode_defconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0configs/qemu-riscv64_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 3 +-<br>
=C2=A0configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/qemu_arm_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/sandbox64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/sandbox_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/sandbox_flattree_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 2 +-<br>
=C2=A0configs/sandbox_noinst_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/sandbox_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/tools-only_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0configs/vexpress_aemv8a_juno_defconfig=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 =
+<br>
=C2=A0configs/xenguest_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
=C2=A0configs/xilinx_versal_virt_defconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A010 +-<br>
=C2=A0doc/board/emulation/qemu-riscv.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 3 +<br>
=C2=A0doc/develop/devicetree/control.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 7 +-<br>
=C2=A0doc/develop/devicetree/dt_qemu.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A048 +<br>
=C2=A0doc/develop/devicetree/dt_update.rst=C2=A0 =C2=A0 =C2=A0 |=C2=A0 498 =
++++++<br>
=C2=A0doc/develop/devicetree/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +<br>
=C2=A0dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A037 +-<=
br>
=C2=A0include/asm-generic/global_data.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 8 +<br>
=C2=A0include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
=C2=A0lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 116 +-<br>
=C2=A0scripts/Makefile.spl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
=C2=A0tools/binman/binman.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 -<br>
=C2=A059 files changed, 5560 insertions(+), 164 deletions(-)<br>
=C2=A0create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts<br>
=C2=A0create mode 100644 arch/arm/dts/bcm7xxx.dts<br>
=C2=A0create mode 100644 arch/arm/dts/highbank.dts<br>
=C2=A0create mode 100644 arch/arm/dts/juno-r2.dts<br>
=C2=A0create mode 100644 arch/arm/dts/octeontx.dts<br>
=C2=A0create mode 100644 arch/arm/dts/qemu-arm.dts<br>
=C2=A0create mode 100644 arch/arm/dts/qemu-arm64.dts<br>
=C2=A0create mode 100644 arch/arm/dts/xenguest-arm64.dts<br>
=C2=A0create mode 100644 arch/arm/dts/xilinx-versal-virt.dts<br>
=C2=A0create mode 100644 arch/powerpc/dts/qemu-ppce500.dts<br>
=C2=A0delete mode 100644 arch/riscv/dts/qemu-virt.dts<br>
=C2=A0create mode 100644 arch/riscv/dts/qemu-virt32.dts<br>
=C2=A0create mode 100644 arch/riscv/dts/qemu-virt64.dts<br>
=C2=A0create mode 100644 doc/develop/devicetree/dt_qemu.rst<br>
=C2=A0create mode 100644 doc/develop/devicetree/dt_update.rst<br>
<br>
-- <br>
2.33.0.1079.g6e70778dc9-goog<br>
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

--0000000000009dc58905cf3b4bb9--

