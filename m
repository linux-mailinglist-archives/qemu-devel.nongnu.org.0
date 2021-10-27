Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582743D21D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:09:45 +0200 (CEST)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpF1-0003W0-LA
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfpDI-0002pI-KO
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:07:56 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfpDD-0003qN-HQ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:07:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id w12so14994323edd.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/J6u1C/dqx0VP9l/VJH+Aq6oFMpSSOVqVp4Id9ytbU=;
 b=lfDhnS4YvmtFTeXJU6D43W+O88FEif9pMlYYLx8DuKhd0rEG1c3tfAM/PysJXo39Oh
 0akc0uBtEd1uur/8XytqhO2PeIedqZE9cGHRQtBIrM3qQja6lr3ZKVlf/SRnr1gnfOwT
 tNr339SgIXSqz/m3PjgIyZR8KtAlMEOngJniN3cv6Y6QH2R6QAwdzXktKS5wGxWJF6Db
 t9RZ9WdrhJl468wJSt46BaJ67kc0E2XFFeFPBW5v3bdPbElTqe8fLTsQg8Q94oEv46Nq
 +mprXtTulcpMItp6C+TPwYuW7V/qCL0EjKHlk4pcOdRWpyC35BNyUQs1k5/eSb4+phsL
 tUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/J6u1C/dqx0VP9l/VJH+Aq6oFMpSSOVqVp4Id9ytbU=;
 b=yc/b82nfEpKWu3hpg5f6mp/TMJzHuxqZz+qkPatQpZy5rgQR76PDAuLYyFmWHh89rC
 lOWb7Bdjd5gKXFx6gpS5VwXVYL/VRa5DF8skM+ZnowbtrXW/gepkFKAsAwI/YheHJenQ
 B4GHt/1TmIcwjA7yEWwqBGH82nmLcRN10ClkauqfvBikkDIQETId/BCOmKCVPuenxxOn
 M0Kqx/wj5ONIahDvB32EHehX0bOmrptiAGNTL47YDXFd1iPX8SpGVsYEdVlIfK4UCpl6
 T+fwwqet9A6h8Asqrgos5WKu9ZLUNGnL/0aaYxE6I5XtAeG0RebQsfdgwFJ5ac/C0KsP
 YcTA==
X-Gm-Message-State: AOAM533YSSRUeF2aV6xYYAQFio4hKnDG6+XHy4CizfQ7HLARgGxuJaQf
 qchYoQm5jbUgbjp2mhi7O/p8nzkxFI6ExNxgjOzFTQ==
X-Google-Smtp-Source: ABdhPJwsnhJE2eMDoWXAUqgaptnDmiRkyimEB1cgOEmbE7dk+7E/SfzLHSstayVksd1+hiNA2fWxUnyP3n1ZACHTRGE=
X-Received: by 2002:a05:6402:278a:: with SMTP id
 b10mr29956239ede.390.1635365269022; 
 Wed, 27 Oct 2021 13:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 22:07:38 +0200
Message-ID: <CAHFG_=XTQd=jYN--+5wnqmAFRHavSbcRdK70zyrxw-dKty8kug@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000f0469605cf5b25f2"
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

--000000000000f0469605cf5b25f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le mer. 27 oct. 2021 =C3=A0 20:23, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Fran=C3=A7ois,
>
> On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> >
> >
> > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <francois.ozog@linaro=
.org>
> wrote:
> >> >
> >> > Hi Simon
> >> >
> >> > Position unchanged on this series: adding fake dts for boards that
> generate their device tree in the dts directory is not good. If you have
> them in documentation the it is acceptable.
> >>
> >> I think we are going to have to disagree on this one. I actually used
> >> the qemu one in testing/development recently. We have to have a way to
> >> develop in-tree with U-Boot. It does not impinge on any of your use
> >> cases, so far as I know.
> >
> > I am not the only one in disagreement... You just saw Alex B=C3=A9n=C3=
=A9e from
> Qemu saying the same thing.
> > I understand the advanced debug/development scenario you mention.
> > But locating the DT files in the dts directory is mis-leading the
> contributors to think that they need to compile the DT for the targeted
> platforms.
> > For your advanced scenario, you can still have the dts in the
> documentation area, or whatever directory (except dts). compile it and
> supply to U-Boot.
>
> We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> has noticed. U-Boot handles the build automatically. If you turn off
> OF_BOARD, it will use the U-Boot devicetree always so you know what is
> going on.
>
> We can add a message to U-Boot indicating where the devicetree came
> from, perhaps? That might be useful given everything that is going on.
>
> As in this case, quite often in these discussions I struggle to
> understand what is behind the objection. Is it that your customers are
> demanding that devicetrees become private, secret data, not included
> in open-source projects? Or is it just the strange case of QEMU that
> is informing your thinking? I know of at least one project where the
> first-stage bootloader produces a devicetree and no one has the source
> for it. I believe TF-A was created for licensing reasons...so can you
> be a bit clearer about what the problem actually is?

there are situations where U-Boot must have a dtb. Then those dTB sources
are logically found in the dts directory.
There are situations where U-Boot should not have a dtb. In that case there
should be no element in the dts directory. Otherwise it creates confusion.
Now as you point out, we need =E2=80=9Cplaygrounds=E2=80=9D to deal with so=
me situation. So
having examples in an ad-hoc directory, different from dts is fine. I
proposed documentation but you may find a better place.
In other words, dts shall host only dt source when U-Boot cannot do but
make a dTB for a platform.
As you have seen in different mail thread (firmware sustainability and OCP
checklist) freedom is important to Linaro and there are no hidden Trojan
horse for licensing.


If a board is
> in-tree in U-Boot I would like it to have a devicetree there, at least
> until we have a better option. At the very least, it MUST be
> discoverable and it must be possible to undertake U-Boot development
> easily without a lot of messing around.

You can if you keep two dts directories separate:
dts for boards for which U-Boot must have one
debug-dts for boards for which U-Boot get the DT at runtime but for which
you want a playground for debug/easier development.

>
> >>
> >>
> >> But trying to do any driver / core work for a board where you don't
> >> have the devicetree is currently not possible. The devicetree is a
> >> core component and being unable to modify it is simply not practical.
> >> We are talking here about an option that can be enabled or disabled.
> >> In my case I am able to disable it locally and do my development work.
> >>
> >>
> >> BTW I've got the bloblist handoff working with a devicetree inside it,
> >> for qemu_arm. I need to try it on a real board to figure out what the
> >> difference is.
> >>
> > That's great news and much needed for stabilizing the inbound ABI from
> prior loader to U-Boot. Let's create another thread to discuss this
> important topic.
> >>
>
> My scenario is not all that advanced and I am using qemu_arm to test
> the bloblist handoff stuff and include it in CI, with a suitable
> devicetree and a binman node.
>
> Regards,
> Simon
>
> >> >
> >> > Cheers
> >> >
> >> > FF
> >> >
> >> > Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass <sjg@chromium.org> a =
=C3=A9crit
> :
> >> >>
> >> >> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE =
so
> >> >> there are only three ways to obtain a devicetree:
> >> >>
> >> >>    - OF_SEPARATE - the normal way, where the devicetree is built an=
d
> >> >>       appended to U-Boot
> >> >>    - OF_EMBED - for development purposes, the devicetree is embedde=
d
> in
> >> >>       the ELF file (also used for EFI)
> >> >>    - OF_BOARD - the board figures it out on its own
> >> >>
> >> >> The last one is currently set up so that no devicetree is needed at
> all
> >> >> in the U-Boot tree. Most boards do provide one, but some don't. Som=
e
> >> >> don't even provide instructions on how to boot on the board.
> >> >>
> >> >> The problems with this approach are documented in another patch in
> this
> >> >> series: "doc: Add documentation about devicetree usage"
> >> >>
> >> >> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any
> board
> >> >> can obtain its devicetree at runtime, even it is has a devicetree
> built
> >> >> in U-Boot. This is because U-Boot may be a second-stage bootloader
> and its
> >> >> caller may have a better idea about the hardware available in the
> machine.
> >> >> This is the case with a few QEMU boards, for example.
> >> >>
> >> >> So it makes no sense to have OF_BOARD as a 'choice'. It should be a=
n
> >> >> option, available with either OF_SEPARATE or OF_EMBED.
> >> >>
> >> >> This series makes this change, adding various missing devicetree
> files
> >> >> (and placeholders) to make the build work.
> >> >>
> >> >> Note: If board maintainers are able to add their own patch to add t=
he
> >> >> files, some patches in this series can be dropped.
> >> >>
> >> >> It also provides a few qemu clean-ups discovered along the way.
> >> >>
> >> >> Note: This breaks the qemu-riscv64_spl test, which still needs
> >> >> investigation.
> >> >>
> >> >> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >> >>
> >> >> Changes in v5:
> >> >> - Bring into the OF_BOARD series
> >> >> - Rebase to master and drop mention of OF_PRIOR_STAGE, since remove=
d
> >> >> - Refer to the 'control' DTB in the first paragraph
> >> >> - Use QEMU instead of qemu
> >> >> - Merge RISC-V and ARM patches since they are similar
> >> >> - Add new patches to clean up fdtdec_setup() and surrounds
> >> >>
> >> >> Changes in v3:
> >> >> - Clarify the 'bug' refered to at the top
> >> >> - Reword 'This means that there' paragraph to explain
> U-Boot-specific things
> >> >> - Move to doc/develop/devicetree now that OF_CONTROL is in the docs
> >> >>
> >> >> Changes in v2:
> >> >> - Fix typos per Sean (thank you!) and a few others
> >> >> - Add a 'Use of U-Boot /config node' section
> >> >> - Drop mention of dm-verity since that actually uses the kernel
> cmdline
> >> >> - Explain that OF_BOARD will still work after these changes (in
> >> >>   'Once this bug is fixed...' paragraph)
> >> >> - Expand a bit on the reason why the 'Current situation' is bad
> >> >> - Clarify in a second place that Linux and U-Boot use the same
> devicetree
> >> >>   in 'To be clear, while U-Boot...'
> >> >> - Expand on why we should have rules for other projects in
> >> >>   'Devicetree in another project'
> >> >> - Add a comment as to why devicetree in U-Boot is not 'bad design'
> >> >> - Reword 'in-tree U-Boot devicetree' to 'devicetree source in U-Boo=
t'
> >> >> - Rewrite 'Devicetree generated on-the-fly in another project' to
> cover
> >> >>   points raised on v1
> >> >> - Add 'Why does U-Boot have its nodes and properties?'
> >> >> - Add 'Why not have two devicetrees?'
> >> >>
> >> >> Ilias Apalodimas (1):
> >> >>   sandbox: Remove OF_HOSTFILE
> >> >>
> >> >> Simon Glass (25):
> >> >>   doc: Add documentation about devicetree usage
> >> >>   arm: qemu: Mention -nographic in the docs
> >> >>   arm: riscv: qemu: Explain how to extract the generated dt
> >> >>   arm: qemu: Add a devicetree file for qemu_arm
> >> >>   arm: qemu: Add a devicetree file for qemu_arm64
> >> >>   riscv: qemu: Add devicetree files for qemu_riscv32/64
> >> >>   arm: rpi: Add a devicetree file for rpi_4
> >> >>   arm: vexpress: Add a devicetree file for juno
> >> >>   arm: xenguest_arm64: Add a fake devicetree file
> >> >>   arm: octeontx: Add a fake devicetree file
> >> >>   arm: xilinx_versal_virt: Add a devicetree file
> >> >>   arm: bcm7xxx: Add a devicetree file
> >> >>   arm: qemu-ppce500: Add a devicetree file
> >> >>   arm: highbank: Add a fake devicetree file
> >> >>   fdt: Make OF_BOARD a bool option
> >> >>   Drop CONFIG_BINMAN_STANDALONE_FDT
> >> >>   doc: Update info on devicetree update
> >> >>   fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
> >> >>   fdt: Drop #ifdefs with MULTI_DTB_FIT
> >> >>   fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
> >> >>   fdt: Drop #ifdef around board_fdt_blob_setup()
> >> >>   fdt: Use if() for fdtcontroladdr check
> >> >>   fdt: Drop OF_CONTROL check in fdtdec_setup()
> >> >>   fdt: Drop remaining preprocessor macros in fdtdec_setup()
> >> >>   fdt: Don't call board_fdt_blob_setup() without OF_BOARD
> >> >>
> >> >>  Makefile                                  |    7 +-
> >> >>  arch/arm/dts/Makefile                     |   20 +-
> >> >>  arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958
> +++++++++++++++++++++
> >> >>  arch/arm/dts/bcm7xxx.dts                  |   15 +
> >> >>  arch/arm/dts/highbank.dts                 |   14 +
> >> >>  arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
> >> >>  arch/arm/dts/octeontx.dts                 |   14 +
> >> >>  arch/arm/dts/qemu-arm.dts                 |  402 +++++
> >> >>  arch/arm/dts/qemu-arm64.dts               |  381 ++++
> >> >>  arch/arm/dts/xenguest-arm64.dts           |   15 +
> >> >>  arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
> >> >>  arch/powerpc/dts/Makefile                 |    1 +
> >> >>  arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
> >> >>  arch/riscv/dts/Makefile                   |    2 +-
> >> >>  arch/riscv/dts/qemu-virt.dts              |    8 -
> >> >>  arch/riscv/dts/qemu-virt32.dts            |  217 +++
> >> >>  arch/riscv/dts/qemu-virt64.dts            |  217 +++
> >> >>  arch/sandbox/cpu/cpu.c                    |   21 +-
> >> >>  arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
> >> >>  configs/bcm7260_defconfig                 |    1 +
> >> >>  configs/bcm7445_defconfig                 |    1 +
> >> >>  configs/highbank_defconfig                |    2 +-
> >> >>  configs/octeontx2_95xx_defconfig          |    1 +
> >> >>  configs/octeontx2_96xx_defconfig          |    1 +
> >> >>  configs/octeontx_81xx_defconfig           |    1 +
> >> >>  configs/octeontx_83xx_defconfig           |    1 +
> >> >>  configs/qemu-ppce500_defconfig            |    2 +
> >> >>  configs/qemu-riscv32_defconfig            |    1 +
> >> >>  configs/qemu-riscv32_smode_defconfig      |    1 +
> >> >>  configs/qemu-riscv32_spl_defconfig        |    4 +-
> >> >>  configs/qemu-riscv64_defconfig            |    1 +
> >> >>  configs/qemu-riscv64_smode_defconfig      |    1 +
> >> >>  configs/qemu-riscv64_spl_defconfig        |    3 +-
> >> >>  configs/qemu_arm64_defconfig              |    1 +
> >> >>  configs/qemu_arm_defconfig                |    1 +
> >> >>  configs/rpi_4_32b_defconfig               |    1 +
> >> >>  configs/rpi_4_defconfig                   |    1 +
> >> >>  configs/rpi_arm64_defconfig               |    1 +
> >> >>  configs/sandbox64_defconfig               |    2 +-
> >> >>  configs/sandbox_defconfig                 |    2 +-
> >> >>  configs/sandbox_flattree_defconfig        |    2 +-
> >> >>  configs/sandbox_noinst_defconfig          |    2 +-
> >> >>  configs/sandbox_spl_defconfig             |    2 +-
> >> >>  configs/tools-only_defconfig              |    2 +-
> >> >>  configs/vexpress_aemv8a_juno_defconfig    |    1 +
> >> >>  configs/xenguest_arm64_defconfig          |    1 +
> >> >>  configs/xilinx_versal_virt_defconfig      |    1 +
> >> >>  doc/board/emulation/qemu-arm.rst          |   10 +-
> >> >>  doc/board/emulation/qemu-riscv.rst        |    3 +
> >> >>  doc/develop/devicetree/control.rst        |    7 +-
> >> >>  doc/develop/devicetree/dt_qemu.rst        |   48 +
> >> >>  doc/develop/devicetree/dt_update.rst      |  498 ++++++
> >> >>  doc/develop/devicetree/index.rst          |    2 +
> >> >>  dts/Kconfig                               |   37 +-
> >> >>  include/asm-generic/global_data.h         |    8 +
> >> >>  include/fdtdec.h                          |   21 +-
> >> >>  lib/fdtdec.c                              |  116 +-
> >> >>  scripts/Makefile.spl                      |    4 +-
> >> >>  tools/binman/binman.rst                   |   20 -
> >> >>  59 files changed, 5560 insertions(+), 164 deletions(-)
> >> >>  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
> >> >>  create mode 100644 arch/arm/dts/bcm7xxx.dts
> >> >>  create mode 100644 arch/arm/dts/highbank.dts
> >> >>  create mode 100644 arch/arm/dts/juno-r2.dts
> >> >>  create mode 100644 arch/arm/dts/octeontx.dts
> >> >>  create mode 100644 arch/arm/dts/qemu-arm.dts
> >> >>  create mode 100644 arch/arm/dts/qemu-arm64.dts
> >> >>  create mode 100644 arch/arm/dts/xenguest-arm64.dts
> >> >>  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
> >> >>  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
> >> >>  delete mode 100644 arch/riscv/dts/qemu-virt.dts
> >> >>  create mode 100644 arch/riscv/dts/qemu-virt32.dts
> >> >>  create mode 100644 arch/riscv/dts/qemu-virt64.dts
> >> >>  create mode 100644 doc/develop/devicetree/dt_qemu.rst
> >> >>  create mode 100644 doc/develop/devicetree/dt_update.rst
> >> >>
> >> >> --
> >> >> 2.33.0.1079.g6e70778dc9-goog
> >> >>
> >> > --
> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Developmen=
t
> >> > T: +33.67221.6485
> >> > francois.ozog@linaro.org | Skype: ffozog
> >> >
> >
> >
> >
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

--000000000000f0469605cf5b25f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 oct. 2021 =C3=A0 20:23, Simo=
n Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,=
<br>
<br>
On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, 27 Oct 2021 at 16:08, Simon Glass &lt;<a href=3D"mailto:sjg@ch=
romium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog &lt;<a href=3D"ma=
ilto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</=
a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Simon<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Position unchanged on this series: adding fake dts for boards=
 that generate their device tree in the dts directory is not good. If you h=
ave them in documentation the it is acceptable.<br>
&gt;&gt;<br>
&gt;&gt; I think we are going to have to disagree on this one. I actually u=
sed<br>
&gt;&gt; the qemu one in testing/development recently. We have to have a wa=
y to<br>
&gt;&gt; develop in-tree with U-Boot. It does not impinge on any of your us=
e<br>
&gt;&gt; cases, so far as I know.<br>
&gt;<br>
&gt; I am not the only one in disagreement... You just saw Alex B=C3=A9n=C3=
=A9e from Qemu saying the same thing.<br>
&gt; I understand the advanced debug/development scenario you mention.<br>
&gt; But locating the DT files in the dts directory is mis-leading the cont=
ributors to think that they need to compile the DT for the targeted platfor=
ms.<br>
&gt; For your advanced scenario, you can still have the dts in the document=
ation area, or whatever directory (except dts). compile it and supply to U-=
Boot.<br>
<br>
We have this situation with rpi 1, 2 and 3 and I don&#39;t believe anyone<b=
r>
has noticed. U-Boot handles the build automatically. If you turn off<br>
OF_BOARD, it will use the U-Boot devicetree always so you know what is<br>
going on.<br>
<br>
We can add a message to U-Boot indicating where the devicetree came<br>
from, perhaps? That might be useful given everything that is going on.<br>
<br>
As in this case, quite often in these discussions I struggle to<br>
understand what is behind the objection. Is it that your customers are<br>
demanding that devicetrees become private, secret data, not included<br>
in open-source projects? Or is it just the strange case of QEMU that<br>
is informing your thinking? I know of at least one project where the<br>
first-stage bootloader produces a devicetree and no one has the source<br>
for it. I believe TF-A was created for licensing reasons...so can you<br>
be a bit clearer about what the problem actually is? </blockquote><div dir=
=3D"auto">there are situations where U-Boot must have a dtb. Then those dTB=
 sources are logically found in the dts directory.</div><div dir=3D"auto">T=
here are situations where U-Boot should not have a dtb. In that case there =
should be no element in the dts directory. Otherwise it creates confusion.<=
/div><div dir=3D"auto">Now as you point out, we need =E2=80=9Cplaygrounds=
=E2=80=9D to deal with some situation. So having examples in an ad-hoc dire=
ctory, different from dts is fine. I proposed documentation but you may fin=
d a better place.</div><div dir=3D"auto">In other words, dts shall host onl=
y dt source when U-Boot cannot do but make a dTB for a platform.=C2=A0</div=
><div dir=3D"auto">As you have seen in different mail thread (firmware sust=
ainability and OCP checklist) freedom is important to Linaro and there are =
no hidden Trojan horse for licensing.=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">I=
f a board is<br>
in-tree in U-Boot I would like it to have a devicetree there, at least<br>
until we have a better option. At the very least, it MUST be<br>
discoverable and it must be possible to undertake U-Boot development<br>
easily without a lot of messing around.</blockquote><div dir=3D"auto">You c=
an if you keep two dts directories separate:</div><div dir=3D"auto">dts for=
 boards for which U-Boot must have one</div><div dir=3D"auto">debug-dts for=
 boards for which U-Boot get the DT at runtime but for which you want a pla=
yground for debug/easier development.</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" d=
ir=3D"auto"></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; But trying to do any driver / core work for a board where you don&=
#39;t<br>
&gt;&gt; have the devicetree is currently not possible. The devicetree is a=
<br>
&gt;&gt; core component and being unable to modify it is simply not practic=
al.<br>
&gt;&gt; We are talking here about an option that can be enabled or disable=
d.<br>
&gt;&gt; In my case I am able to disable it locally and do my development w=
ork.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; BTW I&#39;ve got the bloblist handoff working with a devicetree in=
side it,<br>
&gt;&gt; for qemu_arm. I need to try it on a real board to figure out what =
the<br>
&gt;&gt; difference is.<br>
&gt;&gt;<br>
&gt; That&#39;s great news and much needed for stabilizing the inbound ABI =
from prior loader to U-Boot. Let&#39;s create another thread to discuss thi=
s important topic.<br>
&gt;&gt;<br>
<br>
My scenario is not all that advanced and I am using qemu_arm to test<br>
the bloblist handoff stuff and include it in CI, with a suitable<br>
devicetree and a binman node.<br>
<br>
Regards,<br>
Simon<br>
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; FF<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass &lt;<a href=3D=
"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=
=A9crit :<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE an=
d OF_HOSTFILE so<br>
&gt;&gt; &gt;&gt; there are only three ways to obtain a devicetree:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the de=
vicetree is built and<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the d=
evicetree is embedded in<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI=
)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its=
 own<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The last one is currently set up so that no devicetree is=
 needed at all<br>
&gt;&gt; &gt;&gt; in the U-Boot tree. Most boards do provide one, but some =
don&#39;t. Some<br>
&gt;&gt; &gt;&gt; don&#39;t even provide instructions on how to boot on the=
 board.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The problems with this approach are documented in another=
 patch in this<br>
&gt;&gt; &gt;&gt; series: &quot;doc: Add documentation about devicetree usa=
ge&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; In practice, OF_BOARD is not really distinct from OF_SEPA=
RATE. Any board<br>
&gt;&gt; &gt;&gt; can obtain its devicetree at runtime, even it is has a de=
vicetree built<br>
&gt;&gt; &gt;&gt; in U-Boot. This is because U-Boot may be a second-stage b=
ootloader and its<br>
&gt;&gt; &gt;&gt; caller may have a better idea about the hardware availabl=
e in the machine.<br>
&gt;&gt; &gt;&gt; This is the case with a few QEMU boards, for example.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; So it makes no sense to have OF_BOARD as a &#39;choice&#3=
9;. It should be an<br>
&gt;&gt; &gt;&gt; option, available with either OF_SEPARATE or OF_EMBED.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This series makes this change, adding various missing dev=
icetree files<br>
&gt;&gt; &gt;&gt; (and placeholders) to make the build work.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Note: If board maintainers are able to add their own patc=
h to add the<br>
&gt;&gt; &gt;&gt; files, some patches in this series can be dropped.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It also provides a few qemu clean-ups discovered along th=
e way.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Note: This breaks the qemu-riscv64_spl test, which still =
needs<br>
&gt;&gt; &gt;&gt; investigation.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/uboot=
/patch/20210919215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.ozlabs.org/project/uboot/patch/2021091921511=
1.3830278-3-sjg@chromium.org/</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Changes in v5:<br>
&gt;&gt; &gt;&gt; - Bring into the OF_BOARD series<br>
&gt;&gt; &gt;&gt; - Rebase to master and drop mention of OF_PRIOR_STAGE, si=
nce removed<br>
&gt;&gt; &gt;&gt; - Refer to the &#39;control&#39; DTB in the first paragra=
ph<br>
&gt;&gt; &gt;&gt; - Use QEMU instead of qemu<br>
&gt;&gt; &gt;&gt; - Merge RISC-V and ARM patches since they are similar<br>
&gt;&gt; &gt;&gt; - Add new patches to clean up fdtdec_setup() and surround=
s<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Changes in v3:<br>
&gt;&gt; &gt;&gt; - Clarify the &#39;bug&#39; refered to at the top<br>
&gt;&gt; &gt;&gt; - Reword &#39;This means that there&#39; paragraph to exp=
lain U-Boot-specific things<br>
&gt;&gt; &gt;&gt; - Move to doc/develop/devicetree now that OF_CONTROL is i=
n the docs<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Changes in v2:<br>
&gt;&gt; &gt;&gt; - Fix typos per Sean (thank you!) and a few others<br>
&gt;&gt; &gt;&gt; - Add a &#39;Use of U-Boot /config node&#39; section<br>
&gt;&gt; &gt;&gt; - Drop mention of dm-verity since that actually uses the =
kernel cmdline<br>
&gt;&gt; &gt;&gt; - Explain that OF_BOARD will still work after these chang=
es (in<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0&#39;Once this bug is fixed...&#39; paragraph=
)<br>
&gt;&gt; &gt;&gt; - Expand a bit on the reason why the &#39;Current situati=
on&#39; is bad<br>
&gt;&gt; &gt;&gt; - Clarify in a second place that Linux and U-Boot use the=
 same devicetree<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0in &#39;To be clear, while U-Boot...&#39;<br>
&gt;&gt; &gt;&gt; - Expand on why we should have rules for other projects i=
n<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0&#39;Devicetree in another project&#39;<br>
&gt;&gt; &gt;&gt; - Add a comment as to why devicetree in U-Boot is not &#3=
9;bad design&#39;<br>
&gt;&gt; &gt;&gt; - Reword &#39;in-tree U-Boot devicetree&#39; to &#39;devi=
cetree source in U-Boot&#39;<br>
&gt;&gt; &gt;&gt; - Rewrite &#39;Devicetree generated on-the-fly in another=
 project&#39; to cover<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0points raised on v1<br>
&gt;&gt; &gt;&gt; - Add &#39;Why does U-Boot have its nodes and properties?=
&#39;<br>
&gt;&gt; &gt;&gt; - Add &#39;Why not have two devicetrees?&#39;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Ilias Apalodimas (1):<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0sandbox: Remove OF_HOSTFILE<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Simon Glass (25):<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0doc: Add documentation about devicetree usage=
<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Mention -nographic in the docs<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: riscv: qemu: Explain how to extract the =
generated dt<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm=
<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for qemu_arm=
64<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0riscv: qemu: Add devicetree files for qemu_ri=
scv32/64<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: rpi: Add a devicetree file for rpi_4<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: vexpress: Add a devicetree file for juno=
<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: xenguest_arm64: Add a fake devicetree fi=
le<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: octeontx: Add a fake devicetree file<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: xilinx_versal_virt: Add a devicetree fil=
e<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: bcm7xxx: Add a devicetree file<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu-ppce500: Add a devicetree file<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: highbank: Add a fake devicetree file<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Make OF_BOARD a bool option<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0Drop CONFIG_BINMAN_STANDALONE_FDT<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0doc: Update info on devicetree update<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Move MULTI_DTB_FIT handling out of fdtde=
c_setup()<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdefs with MULTI_DTB_FIT<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop CONFIG_SPL_BUILD check in fdtdec_se=
tup()<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdef around board_fdt_blob_setup(=
)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Use if() for fdtcontroladdr check<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop OF_CONTROL check in fdtdec_setup()<=
br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop remaining preprocessor macros in fd=
tdec_setup()<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Don&#39;t call board_fdt_blob_setup() wi=
thout OF_BOARD<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1958 +++++++++++++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1038 +++++++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 402 +++++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 381 ++++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 307 ++++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 264 +++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 -<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/sandbox/cpu/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 arch/sandbox/include/asm/u-boot-sandbox.h |=C2=A0 =
=C2=A0 8 -<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/highbank_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/octeontx2_95xx_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/octeontx2_96xx_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/octeontx_81xx_defconfig=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/octeontx_83xx_defconfig=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-ppce500_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_smode_defconfig=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_spl_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_smode_defconfig=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_spl_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/qemu_arm_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/sandbox64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_flattree_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_noinst_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/tools-only_defconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/vexpress_aemv8a_juno_defconfig=C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/xenguest_arm64_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 configs/xilinx_versal_virt_defconfig=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/board/emulation/qemu-riscv.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/control.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/dt_qemu.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A048 +<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/dt_update.rst=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 498 ++++++<br>
&gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/index.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt; &gt;&gt;=C2=A0 dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A037 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 include/asm-generic/global_data.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
&gt;&gt; &gt;&gt;=C2=A0 include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-=
<br>
&gt;&gt; &gt;&gt;=C2=A0 lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
116 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 scripts/Makefile.spl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;&gt; &gt;&gt;=C2=A0 tools/binman/binman.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 -<br>
&gt;&gt; &gt;&gt;=C2=A0 59 files changed, 5560 insertions(+), 164 deletions=
(-)<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts=
<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm7xxx.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/highbank.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/juno-r2.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/octeontx.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm64.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xenguest-arm64.dts<=
br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xilinx-versal-virt.=
dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/powerpc/dts/qemu-ppce500.dt=
s<br>
&gt;&gt; &gt;&gt;=C2=A0 delete mode 100644 arch/riscv/dts/qemu-virt.dts<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt32.dts<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-virt64.dts<b=
r>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/dt_qemu.r=
st<br>
&gt;&gt; &gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/dt_update=
.rst<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.33.0.1079.g6e70778dc9-goog<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Dev=
elopment<br>
&gt;&gt; &gt; T: +33.67221.6485<br>
&gt;&gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank"=
>francois.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development<=
br>
&gt; T: +33.67221.6485<br>
&gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois=
.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;<br>
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

--000000000000f0469605cf5b25f2--

