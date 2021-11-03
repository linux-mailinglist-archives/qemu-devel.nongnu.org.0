Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E98443C44
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:47:30 +0100 (CET)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi8BN-0004Sn-4q
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mi89G-0003Be-HV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:45:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mi89C-0000Yn-C9
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:45:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g10so4883921edj.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grZChyIjcvODCDM12NGfd+INrxNHVy7/cMwumq1JtfI=;
 b=ICZVYyEP+fSioPI8yImHApoyrd1pCAbfrsygZLrm5LnnayDsnDPKh/1X2wrKA7cHjX
 MyjKB9NxqK6y9bcql3J9Kr/tTDZtOXaBCuM0qXeI8eLLqblgGHUkxxBqc6JrTM6o16VI
 1eqmRdI0i/O3bwfbKxQ0KBsYVm64bs5ngngGROKQJrqd9zEi5cc52kxzUszykFJ19vUp
 r/TdWwX1eA1N8UpopSZUPDwWelqfCsVOPTyH6Bk1eLRURb/zRFVD5U12gvzby92Dj/Ad
 LRTNf+tTNw+tjxtoBvEVbG4/MAJE15agk/MUzotRYWfS7dd86DmgdQaL62O3xRkULjT+
 F7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grZChyIjcvODCDM12NGfd+INrxNHVy7/cMwumq1JtfI=;
 b=SJscCCYLP6naxHfOs0xW9kIeMV3J9YOAH6Tsszzu36tIesG9fi3VvcxNTC083gIyYa
 A/LdO/jSvzynSspXv4zWob8/CNYuy1mhHPbcCFmyDy6kfGr3jqu58qcISzPO5913f28Q
 VIhpcCo5T+SpGY1AvYvNNRiGyL2GUPd2bvzqW8CUhjQZ3+zR7X3Ge9GCGQXtNOvE2WM9
 a4je2c0ve7aj8dUHFfhniXNDZmMxVZmTHdra452Qg09tIUD1HNfsmQqe/9S4z3rUTU/5
 PPzjmizH1OltxwQLLM5sUOBNPsQ2tlGvk14pFQjUV5ArrQot/8R440y1KiSuKGmYMlh+
 O21w==
X-Gm-Message-State: AOAM5336bp8ZOKWl3VsoHTvXoNYP0wb25fh0AHthV1Ha+oLdIMV2yoI/
 DM4CLZg/M6qnhQMWGEPQgcoacFInq77s4uDlm3eD0w==
X-Google-Smtp-Source: ABdhPJz9oKmxcv52viPm+sl/BjYDHQbhfrHIEtOgBOcf56rP5zkP+DAx9VxXZoF7yM6SLos8g1C3/s81MO7R9rS9rxE=
X-Received: by 2002:a05:6402:84a:: with SMTP id
 b10mr56584702edz.257.1635914711999; 
 Tue, 02 Nov 2021 21:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
 <CAHFG_=Vr6VkJy+d0MaPvVsoXYgvdB5xd2P5FuvF2w63bxSm4cw@mail.gmail.com>
 <CAPnjgZ3Gr+m+sTHDOpW+RFQ6rTtbriY4TpU3bjzqZB79f43Ycw@mail.gmail.com>
 <CAHFG_=XTQd=jYN--+5wnqmAFRHavSbcRdK70zyrxw-dKty8kug@mail.gmail.com>
 <CAPnjgZ0S74v8Sr18gKkfsHAy7EF6rdDe_ASWm8zu=OqKN6N-kQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ0S74v8Sr18gKkfsHAy7EF6rdDe_ASWm8zu=OqKN6N-kQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 3 Nov 2021 05:45:00 +0100
Message-ID: <CAHFG_=UuE=8GW1Wfs2VG19D3Wr1x+iBP9CBHySrKD7iPtdojSA@mail.gmail.com>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000004abf5605cfdb13a1"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Tom Rini <trini@konsulko.com>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004abf5605cfdb13a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le mer. 3 nov. 2021 =C3=A0 02:21, Simon Glass <sjg@chromium.org> a =C3=A9cr=
it :

> Hi Fran=C3=A7ois,
>
> On Wed, 27 Oct 2021 at 14:07, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> > Hi Simon
> >
> > Le mer. 27 oct. 2021 =C3=A0 20:23, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog <francois.ozog@linaro=
.org>
> wrote:
> >> >
> >> >
> >> >
> >> > On Wed, 27 Oct 2021 at 16:08, Simon Glass <sjg@chromium.org> wrote:
> >> >>
> >> >> Hi Fran=C3=A7ois,
> >> >>
> >> >> On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog <
> francois.ozog@linaro.org> wrote:
> >> >> >
> >> >> > Hi Simon
> >> >> >
> >> >> > Position unchanged on this series: adding fake dts for boards tha=
t
> generate their device tree in the dts directory is not good. If you have
> them in documentation the it is acceptable.
> >> >>
> >> >> I think we are going to have to disagree on this one. I actually us=
ed
> >> >> the qemu one in testing/development recently. We have to have a way
> to
> >> >> develop in-tree with U-Boot. It does not impinge on any of your use
> >> >> cases, so far as I know.
> >> >
> >> > I am not the only one in disagreement... You just saw Alex B=C3=A9n=
=C3=A9e from
> Qemu saying the same thing.
> >> > I understand the advanced debug/development scenario you mention.
> >> > But locating the DT files in the dts directory is mis-leading the
> contributors to think that they need to compile the DT for the targeted
> platforms.
> >> > For your advanced scenario, you can still have the dts in the
> documentation area, or whatever directory (except dts). compile it and
> supply to U-Boot.
> >>
> >> We have this situation with rpi 1, 2 and 3 and I don't believe anyone
> >> has noticed. U-Boot handles the build automatically. If you turn off
> >> OF_BOARD, it will use the U-Boot devicetree always so you know what is
> >> going on.
> >>
> >> We can add a message to U-Boot indicating where the devicetree came
> >> from, perhaps? That might be useful given everything that is going on.
> >>
> >> As in this case, quite often in these discussions I struggle to
> >> understand what is behind the objection. Is it that your customers are
> >> demanding that devicetrees become private, secret data, not included
> >> in open-source projects? Or is it just the strange case of QEMU that
> >> is informing your thinking? I know of at least one project where the
> >> first-stage bootloader produces a devicetree and no one has the source
> >> for it. I believe TF-A was created for licensing reasons...so can you
> >> be a bit clearer about what the problem actually is?
> >
> > there are situations where U-Boot must have a dtb. Then those dTB
> sources are logically found in the dts directory.
> > There are situations where U-Boot should not have a dtb. In that case
> there should be no element in the dts directory. Otherwise it creates
> confusion.
> > Now as you point out, we need =E2=80=9Cplaygrounds=E2=80=9D to deal wit=
h some situation.
> So having examples in an ad-hoc directory, different from dts is fine. I
> proposed documentation but you may find a better place.
> > In other words, dts shall host only dt source when U-Boot cannot do but
> make a dTB for a platform.
> > As you have seen in different mail thread (firmware sustainability and
> OCP checklist) freedom is important to Linaro and there are no hidden
> Trojan horse for licensing.
>
> I don't understand what you are getting at with the Trojan horse.

I was referring to your statement that =E2=80=9CTFA was created for licensi=
ng =E2=80=9C
reasons. That=E2=80=99s not the case. It was created to address fragmentati=
on in
the secure firmware for which there was no open source at all. SPL is
definitely not architected to be the basis of Arm secure firmware {
TFA/BL31 (secure monitor), TFA/BL32 (OP-TEE), TFA/SEL2(Hafnium), TFA/SCMI
server, SCP=E2=80=A6}. That said  SPL and TFA/BL2 have similar roles from a
10,000ft perspective.
I felt your comment was alluding to TFA was created to promote binary
components integration, which is also not the case. Hence my reference to
Trojan Horse.

> But
> you have no objection to requiring boards to supply a DT (whether in
> documentation or arch/arm/dts) to be in U-Boot?

I agree that boards need to properly document their DT. For (a) boards that
have defined their standard boot flow to assume U-Boot will only do fix ups
and overlays, the DT shall be in the U-Boot documentation part (either in
full or pointing to their project documentation), in all other cases (b) it
shall be in dts. Boards in the (a) case (may not be exhaustive): Qemu,
SystemReady, RPI (it actually assumes it boot a Linux kernel but U-Boot
smartly interposes). There may be RISCV boards that comply to EBBR too but
I let Heinrich/Atish comment.

>
>
> >
> >
> >> If a board is
> >> in-tree in U-Boot I would like it to have a devicetree there, at least
> >> until we have a better option. At the very least, it MUST be
> >> discoverable and it must be possible to undertake U-Boot development
> >> easily without a lot of messing around.
> >
> > You can if you keep two dts directories separate:
> > dts for boards for which U-Boot must have one
> > debug-dts for boards for which U-Boot get the DT at runtime but for
> which you want a playground for debug/easier development.
> >>
> >>
> >> >>
> >> >>
> >> >> But trying to do any driver / core work for a board where you don't
> >> >> have the devicetree is currently not possible. The devicetree is a
> >> >> core component and being unable to modify it is simply not practica=
l.
> >> >> We are talking here about an option that can be enabled or disabled=
.
> >> >> In my case I am able to disable it locally and do my development
> work.
> >> >>
> >> >>
> >> >> BTW I've got the bloblist handoff working with a devicetree inside
> it,
> >> >> for qemu_arm. I need to try it on a real board to figure out what t=
he
> >> >> difference is.
> >> >>
> >> > That's great news and much needed for stabilizing the inbound ABI
> from prior loader to U-Boot. Let's create another thread to discuss this
> important topic.
> >> >>
> >>
> >> My scenario is not all that advanced and I am using qemu_arm to test
> >> the bloblist handoff stuff and include it in CI, with a suitable
> >> devicetree and a binman node.
> >>
> >> Regards,
> >> Simon
> >>
> >> >> >
> >> >> > Cheers
> >> >> >
> >> >> > FF
> >> >> >
> >> >> > Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass <sjg@chromium.org>=
 a
> =C3=A9crit :
> >> >> >>
> >> >> >> With Ilias' efforts we have dropped OF_PRIOR_STAGE and
> OF_HOSTFILE so
> >> >> >> there are only three ways to obtain a devicetree:
> >> >> >>
> >> >> >>    - OF_SEPARATE - the normal way, where the devicetree is built
> and
> >> >> >>       appended to U-Boot
> >> >> >>    - OF_EMBED - for development purposes, the devicetree is
> embedded in
> >> >> >>       the ELF file (also used for EFI)
> >> >> >>    - OF_BOARD - the board figures it out on its own
> >> >> >>
> >> >> >> The last one is currently set up so that no devicetree is needed
> at all
> >> >> >> in the U-Boot tree. Most boards do provide one, but some don't.
> Some
> >> >> >> don't even provide instructions on how to boot on the board.
> >> >> >>
> >> >> >> The problems with this approach are documented in another patch
> in this
> >> >> >> series: "doc: Add documentation about devicetree usage"
> >> >> >>
> >> >> >> In practice, OF_BOARD is not really distinct from OF_SEPARATE.
> Any board
> >> >> >> can obtain its devicetree at runtime, even it is has a devicetre=
e
> built
> >> >> >> in U-Boot. This is because U-Boot may be a second-stage
> bootloader and its
> >> >> >> caller may have a better idea about the hardware available in th=
e
> machine.
> >> >> >> This is the case with a few QEMU boards, for example.
> >> >> >>
> >> >> >> So it makes no sense to have OF_BOARD as a 'choice'. It should b=
e
> an
> >> >> >> option, available with either OF_SEPARATE or OF_EMBED.
> >> >> >>
> >> >> >> This series makes this change, adding various missing devicetree
> files
> >> >> >> (and placeholders) to make the build work.
> >> >> >>
> >> >> >> Note: If board maintainers are able to add their own patch to ad=
d
> the
> >> >> >> files, some patches in this series can be dropped.
> >> >> >>
> >> >> >> It also provides a few qemu clean-ups discovered along the way.
> >> >> >>
> >> >> >> Note: This breaks the qemu-riscv64_spl test, which still needs
> >> >> >> investigation.
> >> >> >>
> >> >> >> [1]
> https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3=
-sjg@chromium.org/
> >> >> >>
> >> >> >> Changes in v5:
> >> >> >> - Bring into the OF_BOARD series
> >> >> >> - Rebase to master and drop mention of OF_PRIOR_STAGE, since
> removed
> >> >> >> - Refer to the 'control' DTB in the first paragraph
> >> >> >> - Use QEMU instead of qemu
> >> >> >> - Merge RISC-V and ARM patches since they are similar
> >> >> >> - Add new patches to clean up fdtdec_setup() and surrounds
> >> >> >>
> >> >> >> Changes in v3:
> >> >> >> - Clarify the 'bug' refered to at the top
> >> >> >> - Reword 'This means that there' paragraph to explain
> U-Boot-specific things
> >> >> >> - Move to doc/develop/devicetree now that OF_CONTROL is in the
> docs
> >> >> >>
> >> >> >> Changes in v2:
> >> >> >> - Fix typos per Sean (thank you!) and a few others
> >> >> >> - Add a 'Use of U-Boot /config node' section
> >> >> >> - Drop mention of dm-verity since that actually uses the kernel
> cmdline
> >> >> >> - Explain that OF_BOARD will still work after these changes (in
> >> >> >>   'Once this bug is fixed...' paragraph)
> >> >> >> - Expand a bit on the reason why the 'Current situation' is bad
> >> >> >> - Clarify in a second place that Linux and U-Boot use the same
> devicetree
> >> >> >>   in 'To be clear, while U-Boot...'
> >> >> >> - Expand on why we should have rules for other projects in
> >> >> >>   'Devicetree in another project'
> >> >> >> - Add a comment as to why devicetree in U-Boot is not 'bad desig=
n'
> >> >> >> - Reword 'in-tree U-Boot devicetree' to 'devicetree source in
> U-Boot'
> >> >> >> - Rewrite 'Devicetree generated on-the-fly in another project' t=
o
> cover
> >> >> >>   points raised on v1
> >> >> >> - Add 'Why does U-Boot have its nodes and properties?'
> >> >> >> - Add 'Why not have two devicetrees?'
> >> >> >>
> >> >> >> Ilias Apalodimas (1):
> >> >> >>   sandbox: Remove OF_HOSTFILE
> >> >> >>
> >> >> >> Simon Glass (25):
> >> >> >>   doc: Add documentation about devicetree usage
> >> >> >>   arm: qemu: Mention -nographic in the docs
> >> >> >>   arm: riscv: qemu: Explain how to extract the generated dt
> >> >> >>   arm: qemu: Add a devicetree file for qemu_arm
> >> >> >>   arm: qemu: Add a devicetree file for qemu_arm64
> >> >> >>   riscv: qemu: Add devicetree files for qemu_riscv32/64
> >> >> >>   arm: rpi: Add a devicetree file for rpi_4
> >> >> >>   arm: vexpress: Add a devicetree file for juno
> >> >> >>   arm: xenguest_arm64: Add a fake devicetree file
> >> >> >>   arm: octeontx: Add a fake devicetree file
> >> >> >>   arm: xilinx_versal_virt: Add a devicetree file
> >> >> >>   arm: bcm7xxx: Add a devicetree file
> >> >> >>   arm: qemu-ppce500: Add a devicetree file
> >> >> >>   arm: highbank: Add a fake devicetree file
> >> >> >>   fdt: Make OF_BOARD a bool option
> >> >> >>   Drop CONFIG_BINMAN_STANDALONE_FDT
> >> >> >>   doc: Update info on devicetree update
> >> >> >>   fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
> >> >> >>   fdt: Drop #ifdefs with MULTI_DTB_FIT
> >> >> >>   fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
> >> >> >>   fdt: Drop #ifdef around board_fdt_blob_setup()
> >> >> >>   fdt: Use if() for fdtcontroladdr check
> >> >> >>   fdt: Drop OF_CONTROL check in fdtdec_setup()
> >> >> >>   fdt: Drop remaining preprocessor macros in fdtdec_setup()
> >> >> >>   fdt: Don't call board_fdt_blob_setup() without OF_BOARD
> >> >> >>
> >> >> >>  Makefile                                  |    7 +-
> >> >> >>  arch/arm/dts/Makefile                     |   20 +-
> >> >> >>  arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958
> +++++++++++++++++++++
> >> >> >>  arch/arm/dts/bcm7xxx.dts                  |   15 +
> >> >> >>  arch/arm/dts/highbank.dts                 |   14 +
> >> >> >>  arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
> >> >> >>  arch/arm/dts/octeontx.dts                 |   14 +
> >> >> >>  arch/arm/dts/qemu-arm.dts                 |  402 +++++
> >> >> >>  arch/arm/dts/qemu-arm64.dts               |  381 ++++
> >> >> >>  arch/arm/dts/xenguest-arm64.dts           |   15 +
> >> >> >>  arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
> >> >> >>  arch/powerpc/dts/Makefile                 |    1 +
> >> >> >>  arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
> >> >> >>  arch/riscv/dts/Makefile                   |    2 +-
> >> >> >>  arch/riscv/dts/qemu-virt.dts              |    8 -
> >> >> >>  arch/riscv/dts/qemu-virt32.dts            |  217 +++
> >> >> >>  arch/riscv/dts/qemu-virt64.dts            |  217 +++
> >> >> >>  arch/sandbox/cpu/cpu.c                    |   21 +-
> >> >> >>  arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
> >> >> >>  configs/bcm7260_defconfig                 |    1 +
> >> >> >>  configs/bcm7445_defconfig                 |    1 +
> >> >> >>  configs/highbank_defconfig                |    2 +-
> >> >> >>  configs/octeontx2_95xx_defconfig          |    1 +
> >> >> >>  configs/octeontx2_96xx_defconfig          |    1 +
> >> >> >>  configs/octeontx_81xx_defconfig           |    1 +
> >> >> >>  configs/octeontx_83xx_defconfig           |    1 +
> >> >> >>  configs/qemu-ppce500_defconfig            |    2 +
> >> >> >>  configs/qemu-riscv32_defconfig            |    1 +
> >> >> >>  configs/qemu-riscv32_smode_defconfig      |    1 +
> >> >> >>  configs/qemu-riscv32_spl_defconfig        |    4 +-
> >> >> >>  configs/qemu-riscv64_defconfig            |    1 +
> >> >> >>  configs/qemu-riscv64_smode_defconfig      |    1 +
> >> >> >>  configs/qemu-riscv64_spl_defconfig        |    3 +-
> >> >> >>  configs/qemu_arm64_defconfig              |    1 +
> >> >> >>  configs/qemu_arm_defconfig                |    1 +
> >> >> >>  configs/rpi_4_32b_defconfig               |    1 +
> >> >> >>  configs/rpi_4_defconfig                   |    1 +
> >> >> >>  configs/rpi_arm64_defconfig               |    1 +
> >> >> >>  configs/sandbox64_defconfig               |    2 +-
> >> >> >>  configs/sandbox_defconfig                 |    2 +-
> >> >> >>  configs/sandbox_flattree_defconfig        |    2 +-
> >> >> >>  configs/sandbox_noinst_defconfig          |    2 +-
> >> >> >>  configs/sandbox_spl_defconfig             |    2 +-
> >> >> >>  configs/tools-only_defconfig              |    2 +-
> >> >> >>  configs/vexpress_aemv8a_juno_defconfig    |    1 +
> >> >> >>  configs/xenguest_arm64_defconfig          |    1 +
> >> >> >>  configs/xilinx_versal_virt_defconfig      |    1 +
> >> >> >>  doc/board/emulation/qemu-arm.rst          |   10 +-
> >> >> >>  doc/board/emulation/qemu-riscv.rst        |    3 +
> >> >> >>  doc/develop/devicetree/control.rst        |    7 +-
> >> >> >>  doc/develop/devicetree/dt_qemu.rst        |   48 +
> >> >> >>  doc/develop/devicetree/dt_update.rst      |  498 ++++++
> >> >> >>  doc/develop/devicetree/index.rst          |    2 +
> >> >> >>  dts/Kconfig                               |   37 +-
> >> >> >>  include/asm-generic/global_data.h         |    8 +
> >> >> >>  include/fdtdec.h                          |   21 +-
> >> >> >>  lib/fdtdec.c                              |  116 +-
> >> >> >>  scripts/Makefile.spl                      |    4 +-
> >> >> >>  tools/binman/binman.rst                   |   20 -
> >> >> >>  59 files changed, 5560 insertions(+), 164 deletions(-)
> >> >> >>  create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
> >> >> >>  create mode 100644 arch/arm/dts/bcm7xxx.dts
> >> >> >>  create mode 100644 arch/arm/dts/highbank.dts
> >> >> >>  create mode 100644 arch/arm/dts/juno-r2.dts
> >> >> >>  create mode 100644 arch/arm/dts/octeontx.dts
> >> >> >>  create mode 100644 arch/arm/dts/qemu-arm.dts
> >> >> >>  create mode 100644 arch/arm/dts/qemu-arm64.dts
> >> >> >>  create mode 100644 arch/arm/dts/xenguest-arm64.dts
> >> >> >>  create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
> >> >> >>  create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
> >> >> >>  delete mode 100644 arch/riscv/dts/qemu-virt.dts
> >> >> >>  create mode 100644 arch/riscv/dts/qemu-virt32.dts
> >> >> >>  create mode 100644 arch/riscv/dts/qemu-virt64.dts
> >> >> >>  create mode 100644 doc/develop/devicetree/dt_qemu.rst
> >> >> >>  create mode 100644 doc/develop/devicetree/dt_update.rst
> >> >> >>
> >> >> >> --
> >> >> >> 2.33.0.1079.g6e70778dc9-goog
> >> >> >>
> >> >> > --
> >> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Develop=
ment
> >> >> > T: +33.67221.6485
> >> >> > francois.ozog@linaro.org | Skype: ffozog
> >> >> >
> >> >
> >> >
> >> >
> >> > --
> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Developmen=
t
> >> > T: +33.67221.6485
> >> > francois.ozog@linaro.org | Skype: ffozog
> >> >
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

--0000000000004abf5605cfdb13a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 3 nov. 2021 =C3=A0 02:21, Simon=
 Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,=
<br>
<br>
On Wed, 27 Oct 2021 at 14:07, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Simon<br>
&gt;<br>
&gt; Le mer. 27 oct. 2021 =C3=A0 20:23, Simon Glass &lt;<a href=3D"mailto:s=
jg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 27 Oct 2021 at 09:14, Fran=C3=A7ois Ozog &lt;<a href=3D"ma=
ilto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</=
a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, 27 Oct 2021 at 16:08, Simon Glass &lt;<a href=3D"mail=
to:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, 26 Oct 2021 at 00:07, Fran=C3=A7ois Ozog &lt;<a h=
ref=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@lin=
aro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi Simon<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Position unchanged on this series: adding fake dts f=
or boards that generate their device tree in the dts directory is not good.=
 If you have them in documentation the it is acceptable.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I think we are going to have to disagree on this one. I a=
ctually used<br>
&gt;&gt; &gt;&gt; the qemu one in testing/development recently. We have to =
have a way to<br>
&gt;&gt; &gt;&gt; develop in-tree with U-Boot. It does not impinge on any o=
f your use<br>
&gt;&gt; &gt;&gt; cases, so far as I know.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am not the only one in disagreement... You just saw Alex B=
=C3=A9n=C3=A9e from Qemu saying the same thing.<br>
&gt;&gt; &gt; I understand the advanced debug/development scenario you ment=
ion.<br>
&gt;&gt; &gt; But locating the DT files in the dts directory is mis-leading=
 the contributors to think that they need to compile the DT for the targete=
d platforms.<br>
&gt;&gt; &gt; For your advanced scenario, you can still have the dts in the=
 documentation area, or whatever directory (except dts). compile it and sup=
ply to U-Boot.<br>
&gt;&gt;<br>
&gt;&gt; We have this situation with rpi 1, 2 and 3 and I don&#39;t believe=
 anyone<br>
&gt;&gt; has noticed. U-Boot handles the build automatically. If you turn o=
ff<br>
&gt;&gt; OF_BOARD, it will use the U-Boot devicetree always so you know wha=
t is<br>
&gt;&gt; going on.<br>
&gt;&gt;<br>
&gt;&gt; We can add a message to U-Boot indicating where the devicetree cam=
e<br>
&gt;&gt; from, perhaps? That might be useful given everything that is going=
 on.<br>
&gt;&gt;<br>
&gt;&gt; As in this case, quite often in these discussions I struggle to<br=
>
&gt;&gt; understand what is behind the objection. Is it that your customers=
 are<br>
&gt;&gt; demanding that devicetrees become private, secret data, not includ=
ed<br>
&gt;&gt; in open-source projects? Or is it just the strange case of QEMU th=
at<br>
&gt;&gt; is informing your thinking? I know of at least one project where t=
he<br>
&gt;&gt; first-stage bootloader produces a devicetree and no one has the so=
urce<br>
&gt;&gt; for it. I believe TF-A was created for licensing reasons...so can =
you<br>
&gt;&gt; be a bit clearer about what the problem actually is?<br>
&gt;<br>
&gt; there are situations where U-Boot must have a dtb. Then those dTB sour=
ces are logically found in the dts directory.<br>
&gt; There are situations where U-Boot should not have a dtb. In that case =
there should be no element in the dts directory. Otherwise it creates confu=
sion.<br>
&gt; Now as you point out, we need =E2=80=9Cplaygrounds=E2=80=9D to deal wi=
th some situation. So having examples in an ad-hoc directory, different fro=
m dts is fine. I proposed documentation but you may find a better place.<br=
>
&gt; In other words, dts shall host only dt source when U-Boot cannot do bu=
t make a dTB for a platform.<br>
&gt; As you have seen in different mail thread (firmware sustainability and=
 OCP checklist) freedom is important to Linaro and there are no hidden Troj=
an horse for licensing.<br>
<br>
I don&#39;t understand what you are getting at with the Trojan horse. </blo=
ckquote><div dir=3D"auto">I was referring to your statement that =E2=80=9CT=
FA was created for licensing =E2=80=9C reasons. That=E2=80=99s not the case=
. It was created to address fragmentation in the secure firmware for which =
there was no open source at all. SPL is definitely not architected to be th=
e basis of Arm secure firmware { TFA/BL31 (secure monitor), TFA/BL32 (OP-TE=
E), TFA/SEL2(Hafnium), TFA/SCMI server, SCP=E2=80=A6}. That said =C2=A0SPL =
and TFA/BL2 have similar roles from a 10,000ft perspective.</div><div dir=
=3D"auto">I felt your comment was alluding to TFA was created to promote bi=
nary components integration, which is also not the case. Hence my reference=
 to Trojan Horse.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">But<br>
you have no objection to requiring boards to supply a DT (whether in<br>
documentation or arch/arm/dts) to be in U-Boot?</blockquote><div dir=3D"aut=
o">I agree that boards need to properly document their DT. For (a) boards t=
hat have defined their standard boot flow to assume U-Boot will only do fix=
 ups and overlays, the DT shall be in the U-Boot documentation part (either=
 in full or pointing to their project documentation), in all other cases (b=
) it shall be in dts. Boards in the (a) case (may not be exhaustive): Qemu,=
 SystemReady, RPI (it actually assumes it boot a Linux kernel but U-Boot sm=
artly interposes). There may be RISCV boards that comply to EBBR too but I =
let Heinrich/Atish comment.</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; If a board is<br>
&gt;&gt; in-tree in U-Boot I would like it to have a devicetree there, at l=
east<br>
&gt;&gt; until we have a better option. At the very least, it MUST be<br>
&gt;&gt; discoverable and it must be possible to undertake U-Boot developme=
nt<br>
&gt;&gt; easily without a lot of messing around.<br>
&gt;<br>
&gt; You can if you keep two dts directories separate:<br>
&gt; dts for boards for which U-Boot must have one<br>
&gt; debug-dts for boards for which U-Boot get the DT at runtime but for wh=
ich you want a playground for debug/easier development.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But trying to do any driver / core work for a board where=
 you don&#39;t<br>
&gt;&gt; &gt;&gt; have the devicetree is currently not possible. The device=
tree is a<br>
&gt;&gt; &gt;&gt; core component and being unable to modify it is simply no=
t practical.<br>
&gt;&gt; &gt;&gt; We are talking here about an option that can be enabled o=
r disabled.<br>
&gt;&gt; &gt;&gt; In my case I am able to disable it locally and do my deve=
lopment work.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; BTW I&#39;ve got the bloblist handoff working with a devi=
cetree inside it,<br>
&gt;&gt; &gt;&gt; for qemu_arm. I need to try it on a real board to figure =
out what the<br>
&gt;&gt; &gt;&gt; difference is.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; That&#39;s great news and much needed for stabilizing the inb=
ound ABI from prior loader to U-Boot. Let&#39;s create another thread to di=
scuss this important topic.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; My scenario is not all that advanced and I am using qemu_arm to te=
st<br>
&gt;&gt; the bloblist handoff stuff and include it in CI, with a suitable<b=
r>
&gt;&gt; devicetree and a binman node.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Simon<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; FF<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Le mar. 26 oct. 2021 =C3=A0 02:24, Simon Glass &lt;<=
a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&g=
t; a =C3=A9crit :<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; With Ilias&#39; efforts we have dropped OF_PRIOR=
_STAGE and OF_HOSTFILE so<br>
&gt;&gt; &gt;&gt; &gt;&gt; there are only three ways to obtain a devicetree=
:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, whe=
re the devicetree is built and<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_EMBED - for development purpos=
es, the devicetree is embedded in<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also use=
d for EFI)<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it o=
ut on its own<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The last one is currently set up so that no devi=
cetree is needed at all<br>
&gt;&gt; &gt;&gt; &gt;&gt; in the U-Boot tree. Most boards do provide one, =
but some don&#39;t. Some<br>
&gt;&gt; &gt;&gt; &gt;&gt; don&#39;t even provide instructions on how to bo=
ot on the board.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The problems with this approach are documented i=
n another patch in this<br>
&gt;&gt; &gt;&gt; &gt;&gt; series: &quot;doc: Add documentation about devic=
etree usage&quot;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; In practice, OF_BOARD is not really distinct fro=
m OF_SEPARATE. Any board<br>
&gt;&gt; &gt;&gt; &gt;&gt; can obtain its devicetree at runtime, even it is=
 has a devicetree built<br>
&gt;&gt; &gt;&gt; &gt;&gt; in U-Boot. This is because U-Boot may be a secon=
d-stage bootloader and its<br>
&gt;&gt; &gt;&gt; &gt;&gt; caller may have a better idea about the hardware=
 available in the machine.<br>
&gt;&gt; &gt;&gt; &gt;&gt; This is the case with a few QEMU boards, for exa=
mple.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; So it makes no sense to have OF_BOARD as a &#39;=
choice&#39;. It should be an<br>
&gt;&gt; &gt;&gt; &gt;&gt; option, available with either OF_SEPARATE or OF_=
EMBED.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; This series makes this change, adding various mi=
ssing devicetree files<br>
&gt;&gt; &gt;&gt; &gt;&gt; (and placeholders) to make the build work.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Note: If board maintainers are able to add their=
 own patch to add the<br>
&gt;&gt; &gt;&gt; &gt;&gt; files, some patches in this series can be droppe=
d.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; It also provides a few qemu clean-ups discovered=
 along the way.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Note: This breaks the qemu-riscv64_spl test, whi=
ch still needs<br>
&gt;&gt; &gt;&gt; &gt;&gt; investigation.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; [1] <a href=3D"https://patchwork.ozlabs.org/proj=
ect/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.ozlabs.org/project/uboot/patch/2021=
0919215111.3830278-3-sjg@chromium.org/</a><br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Changes in v5:<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Bring into the OF_BOARD series<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Rebase to master and drop mention of OF_PRIOR_=
STAGE, since removed<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Refer to the &#39;control&#39; DTB in the firs=
t paragraph<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Use QEMU instead of qemu<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Merge RISC-V and ARM patches since they are si=
milar<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Add new patches to clean up fdtdec_setup() and=
 surrounds<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Changes in v3:<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Clarify the &#39;bug&#39; refered to at the to=
p<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Reword &#39;This means that there&#39; paragra=
ph to explain U-Boot-specific things<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Move to doc/develop/devicetree now that OF_CON=
TROL is in the docs<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Changes in v2:<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Fix typos per Sean (thank you!) and a few othe=
rs<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Add a &#39;Use of U-Boot /config node&#39; sec=
tion<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Drop mention of dm-verity since that actually =
uses the kernel cmdline<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Explain that OF_BOARD will still work after th=
ese changes (in<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0&#39;Once this bug is fixed...&#39; =
paragraph)<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Expand a bit on the reason why the &#39;Curren=
t situation&#39; is bad<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Clarify in a second place that Linux and U-Boo=
t use the same devicetree<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0in &#39;To be clear, while U-Boot...=
&#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Expand on why we should have rules for other p=
rojects in<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0&#39;Devicetree in another project&#=
39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Add a comment as to why devicetree in U-Boot i=
s not &#39;bad design&#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Reword &#39;in-tree U-Boot devicetree&#39; to =
&#39;devicetree source in U-Boot&#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Rewrite &#39;Devicetree generated on-the-fly i=
n another project&#39; to cover<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0points raised on v1<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Add &#39;Why does U-Boot have its nodes and pr=
operties?&#39;<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Add &#39;Why not have two devicetrees?&#39;<br=
>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Ilias Apalodimas (1):<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0sandbox: Remove OF_HOSTFILE<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Simon Glass (25):<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0doc: Add documentation about devicet=
ree usage<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Mention -nographic in the=
 docs<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: riscv: qemu: Explain how to ext=
ract the generated dt<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for=
 qemu_arm<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu: Add a devicetree file for=
 qemu_arm64<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0riscv: qemu: Add devicetree files fo=
r qemu_riscv32/64<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: rpi: Add a devicetree file for =
rpi_4<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: vexpress: Add a devicetree file=
 for juno<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: xenguest_arm64: Add a fake devi=
cetree file<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: octeontx: Add a fake devicetree=
 file<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: xilinx_versal_virt: Add a devic=
etree file<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: bcm7xxx: Add a devicetree file<=
br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: qemu-ppce500: Add a devicetree =
file<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0arm: highbank: Add a fake devicetree=
 file<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Make OF_BOARD a bool option<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0Drop CONFIG_BINMAN_STANDALONE_FDT<br=
>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0doc: Update info on devicetree updat=
e<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Move MULTI_DTB_FIT handling out=
 of fdtdec_setup()<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdefs with MULTI_DTB_FIT=
<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop CONFIG_SPL_BUILD check in =
fdtdec_setup()<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop #ifdef around board_fdt_bl=
ob_setup()<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Use if() for fdtcontroladdr che=
ck<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop OF_CONTROL check in fdtdec=
_setup()<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Drop remaining preprocessor mac=
ros in fdtdec_setup()<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0fdt: Don&#39;t call board_fdt_blob_s=
etup() without OF_BOARD<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-<=
br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/bcm2711-rpi-4-b.dts=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 1958 +++++++++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/bcm7xxx.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A015 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/highbank.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/juno-r2.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1038 +++++++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/octeontx.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/qemu-arm.dts=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 402 +++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/qemu-arm64.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 381 ++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/xenguest-arm64.dts=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/arm/dts/xilinx-versal-virt.dts=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 307 ++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/powerpc/dts/Makefile=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/powerpc/dts/qemu-ppce500.dts=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 264 +++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/Makefile=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt.dts=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 -<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt32.dts=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/riscv/dts/qemu-virt64.dts=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 217 +++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/sandbox/cpu/cpu.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 arch/sandbox/include/asm/u-boot-sandbox.h =
|=C2=A0 =C2=A0 8 -<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/bcm7260_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/bcm7445_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/highbank_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/octeontx2_95xx_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/octeontx2_96xx_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/octeontx_81xx_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/octeontx_83xx_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-ppce500_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_smode_defconfig=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv32_spl_defconfig=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_smode_defconfig=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu-riscv64_spl_defconfig=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu_arm64_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/qemu_arm_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/rpi_4_32b_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/rpi_4_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/rpi_arm64_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/sandbox64_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_flattree_defconfig=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_noinst_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/sandbox_spl_defconfig=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/tools-only_defconfig=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/vexpress_aemv8a_juno_defconfig=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/xenguest_arm64_defconfig=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 configs/xilinx_versal_virt_defconfig=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/board/emulation/qemu-arm.rst=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/board/emulation/qemu-riscv.rst=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/control.rst=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/dt_qemu.rst=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A048 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/dt_update.rst=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 498 ++++++<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 doc/develop/devicetree/index.rst=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A037 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 include/asm-generic/global_data.h=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A021 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 116 +-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 scripts/Makefile.spl=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-=
<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 tools/binman/binman.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 -<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 59 files changed, 5560 insertions(+), 164 =
deletions(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm2711-rp=
i-4-b.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/bcm7xxx.dt=
s<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/highbank.d=
ts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/juno-r2.dt=
s<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/octeontx.d=
ts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm.d=
ts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm64=
.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xenguest-a=
rm64.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/xilinx-ver=
sal-virt.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/powerpc/dts/qemu-p=
pce500.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 delete mode 100644 arch/riscv/dts/qemu-vir=
t.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-vir=
t32.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 arch/riscv/dts/qemu-vir=
t64.dts<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/=
dt_qemu.rst<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 create mode 100644 doc/develop/devicetree/=
dt_update.rst<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; 2.33.0.1079.g6e70778dc9-goog<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Bus=
iness Development<br>
&gt;&gt; &gt;&gt; &gt; T: +33.67221.6485<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=
=3D"_blank">francois.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Dev=
elopment<br>
&gt;&gt; &gt; T: +33.67221.6485<br>
&gt;&gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank"=
>francois.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;&gt; &gt;<br>
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

--0000000000004abf5605cfdb13a1--

