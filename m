Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB7443262
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:09:49 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwM7-0004QV-DX
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhwG2-00050L-Hg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:03:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhwFx-0002ZP-Db
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:03:29 -0400
Received: by mail-ed1-x52d.google.com with SMTP id 5so76588289edw.7
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AF1xF8FqbiqLx4vgqB2UFjS+4kCfCSm9GleuUzOoh3k=;
 b=munGYbhV8WXV+wqz5hsJ/jBmEWram7zDENMiNdvXpMUZEE5wIeN8TNOamKz1FAszr2
 kRPjgCB3B6xgRsK8vALjXTLxgDgJr03UMulbxbYfjuGiFKOkxYcVs1Yt7Q//rpKmSabf
 e+urtrbbXaRAtWVIYjDu+MO2RmTvNLdbYYvXUg3jJxKiiVaE1JNh3u7Om4zkxq7MyooF
 i70qUB8kCwaUT+HuIcYCg6ISscK/TaqjlK4g2VfckPcGsX3apkf20Mq99jlvUcL/RVyP
 mqX4uMoq523Vq9Cy3BdwWAQXkg9HxQhSCUyXIIWYcl1xSjk5gsojAZsbjAfyi3YV6QVY
 cvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AF1xF8FqbiqLx4vgqB2UFjS+4kCfCSm9GleuUzOoh3k=;
 b=070v/qs73beWnoq8imYZvs6VziwGSW9rPe5Gpl6qSmplnnGAqdgEI3m5yIY+idx+QC
 vqGuEYzvQHnTjufXXfP7xy/WTkUN78/N1u18MZ+AwPK3UYIKSdp62aq2rl9CQBSpRb2X
 eLBIjxjxvDO62Hr3X7b+I+S5HPrR+pI31+qk6pujYsiJMaQpWXdkOuWlVWnCneG6xaSD
 fjpeBssM5JvHgJyxspDEqqca8zElWEswi3mP+juxfE0Lp1wDUzpCG5RmX/fGqOs8ZRds
 LTmWT+JNGGI9WN6hZYPjaat8z+QGlYAuHXx8JKBZW9EEG6dUMnspk6yi67OVLuMQuA5+
 P+ZQ==
X-Gm-Message-State: AOAM530vbUAvHv/WWWdyNdJYnn+i9n6o97Pc1mctV7+xPoe2SRCqG8aB
 Np1NG7aQoPymS7MmAYgbbQU27+0ZZIPin8rteec/bw==
X-Google-Smtp-Source: ABdhPJyAqjX0REgv4i+5CRcN/c8qJCstNpMfYiE5moh1FVRXTQ7MgZ7kbkss1bXTMzkvjGsCFmsHy1s4Dmh+cK4NTLM=
X-Received: by 2002:a17:906:5d11:: with SMTP id
 g17mr46671400ejt.175.1635869003382; 
 Tue, 02 Nov 2021 09:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
In-Reply-To: <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Tue, 2 Nov 2021 17:03:12 +0100
Message-ID: <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000d8a59e05cfd06ec7"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d8a59e05cfd06ec7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote:

> Hi Fran=C3=A7ois,
>
> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
>
> wrote:
> >
> > Hi Simon,
> >
> > this seems a great endeavor. I'd like to better understand the scope of
> it.
> >
> > Is it to be used as part of what could become a U-Boot entry ABI scheme=
?
> By that I mean giving some fixed aspects
> > to U-Boot entry while letting boards to have flexibility (say for
> instance that the first 5 architecture ABI
> > parameter registers are reserved for U-Boot), and the Passage is about
> specifying either those reserved registers
> > or one of them?
>
> The goal is to provide a standard entry scheme for all firmware
> binaries. Whether it achieves that (or can with some mods) is up for
> discussion.
>
> If you say
a) define a U-Boot entry ABI and providing a firmware-to-firmware
information passing facility which would be part of all firmware ABIs (as
the projects decide to define their own ABI) it looks good.
but If you say
b) define a standard entry scheme (register map, processor state, MMU
state, SMMU state, GIC state...) that does not look realistic.
I think you mean a) but just want to be sure.

> Re the registers, do you think we need 5?
>
> >
> > Thinking entry ABI, here is what I observed on Arm:
> >
> > Linux has two entry ABIs:
> > - plain: x0 =3D dtb;
> >           command line =3D dtb:/chosen/bootargs; initrd =3D
> dtb:/chosen/linux,initrd-*
> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
> >            dtb =3D EFI_UUID config table; initrd =3D efi:<loadfile2(INI=
TRD
> vendor media UUID); command line =3D efi: image_protocol::load_options
> >
> > U-Boot (proper) has plenty of schemes:
> > - dtb is passed as either x0, x1, fixed memory area (Qemu which is bad
> in itself), or other registers
> > - additional information passing: board specific register scheme, SMC
> calls
> > - U-Boot for RPI boards implement a Linux shaped entry ABI to be
> launched by Videocore firmware
> >
> > Based on all the above, I would tend to think that RPI scheme is a good
> idea but also
> > shall not prevent additional schemes for the boards.
>
> I was not actually considering Linux since I believe/assume its entry
> scheme is fixed and not up for discussion.
>
> I also did not think about the EFI case. As I understand it we cannot
> touch it as it is used by UEFI today. Maybe it is even in the
> standard?
>
It is in the spec and we are making it evolve, or its understanding evolve
(jurisprudence) for instance on initrd standard handling.

>
> Really I am hoping we can start afresh...?
>
> >
> > What about a U-Boot Arm entry ABI like:
> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, other
> registers are per platform, SMC calls allowed too
>
> Hmm we don't actually need the dtb as it is available in the bloblist.
>
If you don't have x0=3Ddtb, then you will not be able to use U-Boot on RPI4=
.
Unless you want to redo everything the RPI firmware is doing.

> But I added an offset to it as a convenience.
>
> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when U-Bo=
ot is
> launched as an EFI app)
> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID config=
 table
>
> I don't understand the last line. Where is the passage info /
> bloblist? Do you mean it goes in the HOB list with a UUID? I suppose
> that is the most EFI-compatible way.
>
The Passage config table  could just contain the "head" of the
bloblist/Passage information.

>
> What do you think about the idea of using an offset into the bloblist
> for the dtb?

It is possible but as I said, failing to mimic Linux entry ABI would miss
the opportunity to just boot without changes on RPI4.

> Also, can we make the standard passage ABI a build-time
> option, so it is deterministic?
>
> Looks good. I would look into stating that for SystemReady we would advis=
e
to use that option and make it standard for Trusted Substrate (Linaro
recipes that we upstreaming to make SystemReady compliance easy and
consistent across platforms).

> >
> > We could further leverage Passage to pass Operating Systems parameters
> that could be removed from device tree (migration of /chosen to Passage).
> Memory inventory would still be in DT but allocations for CMA or GPUs wou=
ld
> be in Passage. This idea is to reach a point where  device tree is a
> "pristine" hardware description.
>
> I'm worried about this becoming a substitute for devicetree. Really my
> intent is to provide a way to pass simple info, whereas what you talk
> about there seems like something that should be DT, just that it might
> need suitable bindings.
>
> I see your point and I agree It should not be a substitute.
here is an expanded version of what I had in mind when I wrote those lines.
cma, initrd and other Linux kernel parameters can be conveyed either
through command line or DT.
When using the non UEFI Linux entry ABI, you need to use the DT to pass
those parameters.
When using the UEFI Linux entry ABI, you *can* (not must) use the command
line to pass all information, leaving the DT passed to the OS without any
/chosen.
When introducing Passage, I was wondering if we could pass command line to
Linux and, same as UEFI, leave the DT free from /chosen.
I am not sure it is a good goal though. I may be too pushing for a DT free
from parameters.

> As you know I have more expansive views about what should be in DT.
>
I think both of us are huge supporters of DT format and self describing
capabilities.
I am inclined to put rules into what fits into what lands in the DT that is
passed to the OS.
I am a fan of having DT used more in ad-hoc files.

> >
> > Cheers
> >
> > PS: as Ilias mentions, this patch set contains bug fixes, non
> immediately related additional functions (DM stats). It would be great to
> carve those out to fast path them and keep this one with the very core of
> your idea.
>
> The DM stats is used in 'passage: Report the devicetree source'. I
> know it is sideways but I think it is better to make the output line
> more useful than just reporting the devicetree source.
>
> I believe the DM stats has merits in its own. You could upstream this
independently and then Passage would be yet another "customer" of the
feature.

> The first patch is indeed unrelated. I will pick it up so we can drop
> it for the next rev.
>
> Regards,
> Simon
>
>
> >
> > On Mon, 1 Nov 2021 at 02:17, Simon Glass <sjg@chromium.org> wrote:
> >>
> >>
> >> This series adds a standard way of passing information between differe=
nt
> >> firmware phases. This already exists in U-Boot at a very basic level, =
in
> >> the form of a bloblist containing an spl_handoff structure, but the
> intent
> >> here is to define something useful across projects.
> >>
> >> The need for this is growing as firmware fragments into multiple
> binaries
> >> each with its own purpose. Without any run-time connection, we must re=
ly
> >> on build-time settings which are brittle and painful to keep in sync.
> >>
> >> This feature is named 'standard passage' since the name is more unique
> >> than many others that could be chosen, it is a passage in the sense th=
at
> >> information is flowing from one place to another and it is standard,
> >> because that is what we want to create.
> >>
> >> The implementation is simply a pointer to a bloblist in a register, wi=
th
> >> an extra register to point to a devicetree, for more complex data, if
> one
> >> is present in the bloblist. This should cover all cases (small memory
> >> footprint as well as complex data flow) and be easy enough to implemen=
t
> on
> >> all architectures.
> >>
> >> The core bloblist code is relicensed to BSD-3-Clause in case it is
> useful
> >> in non-GPL projects but there is no requirement to use the same code.
> >>
> >> This series includes tweaks to the bloblist implementation in U-Boot t=
o
> >> make it more suitable for the task, including:
> >>
> >>    - Allocate tags explicitly in the enum
> >>    - Put the magic number first
> >>    - Define a process for adding tags
> >>
> >> The emphasis is on enabling open communcation between binaries, not
> >> enabling passage of secret, undocumented data, although this is possib=
le
> >> in a private environment.
> >>
> >> This series is built on the OF_BOARD series It is available at
> >> u-boot-dm/pass-working or:
> >>
> >>
> https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c156f222=
c69a98b8ebcaa563d1ff10eb217
> >>
> >>
> >> Simon Glass (31):
> >>   Makefile: Correct TPL rule for OF_REAL
> >>   kconfig: Add support for conditional values
> >>   dm: core: Allow getting some basic stats
> >>   stddef: Avoid warning with clang with offsetof()
> >>   fdt: Drop SPL_BUILD macro
> >>   bloblist: Put the magic number first
> >>   bloblist: Rename the SPL tag
> >>   bloblist: Drop unused tags
> >>   bloblist: Use explicit numbering for the tags
> >>   bloblist: Support allocating the bloblist
> >>   bloblist: Use LOG_CATEGORY to simply logging
> >>   bloblist: Use 'phase' consistently for bloblists
> >>   bloblist: Refactor Kconfig to support alloc or fixed
> >>   arm: qemu: Add an SPL build
> >>   bloblist: Add functions to obtain base address and size
> >>   passage: Support an incoming passage
> >>   passage: Support a control devicetree
> >>   passage: arm: Accept a passage from the previous phase
> >>   passage: spl: Support adding the dtb to the passage bloblist
> >>   passage: spl: Support passing the passage to U-Boot
> >>   passage: Record where the devicetree came from
> >>   passage: Report the devicetree source
> >>   passage: Add a qemu test for ARM
> >>   bloblist: doc: Bring in the API documentation
> >>   bloblist: Relicense to allow BSD-3-Clause
> >>   sandbox: Add a way of checking structs for standard passage
> >>   passage: Add documentation
> >>   passage: Add docs for spl_handoff
> >>   x86: Move Intel GNVS file into the common include directory
> >>   passage: Add checks for pre-existing blobs
> >>   WIP: RFC: Add a gitlab test
> >>
> >>  .gitlab-ci.yml                                |   6 +
> >>  MAINTAINERS                                   |  10 +
> >>  Makefile                                      |   2 +-
> >>  arch/arm/cpu/armv7/start.S                    |   7 +-
> >>  arch/arm/dts/qemu-arm-u-boot.dtsi             |  22 ++
> >>  arch/arm/lib/crt0.S                           |   4 +
> >>  arch/arm/mach-qemu/Kconfig                    |   9 +
> >>  arch/sandbox/cpu/spl.c                        |   2 +-
> >>  arch/x86/cpu/apollolake/acpi.c                |   2 +-
> >>  arch/x86/cpu/broadwell/cpu_from_spl.c         |   4 +-
> >>  arch/x86/cpu/intel_common/acpi.c              |   2 +-
> >>  .../include/asm/arch-apollolake/global_nvs.h  |   2 +-
> >>  arch/x86/lib/spl.c                            |   2 +-
> >>  arch/x86/lib/tpl.c                            |   2 +-
> >>  board/emulation/qemu-arm/Kconfig              |  23 +-
> >>  board/emulation/qemu-arm/MAINTAINERS          |   1 +
> >>  board/emulation/qemu-arm/Makefile             |   1 +
> >>  board/emulation/qemu-arm/spl.c                |  27 ++
> >>  board/google/chromebook_coral/coral.c         |   2 +-
> >>  board/sandbox/Makefile                        |   3 +-
> >>  board/sandbox/stdpass_check.c                 | 107 ++++++
> >>  cmd/bdinfo.c                                  |   2 +
> >>  common/Kconfig                                | 161 ++++++++-
> >>  common/bloblist.c                             | 124 +++++--
> >>  common/board_f.c                              |  48 ++-
> >>  common/board_r.c                              |  18 +
> >>  common/spl/spl.c                              |  74 +++-
> >>  configs/qemu_arm_spl_defconfig                |  78 +++++
> >>  doc/board/emulation/qemu-arm.rst              |  38 +++
> >>  doc/develop/bloblist.rst                      |  28 +-
> >>  doc/develop/index.rst                         |   1 +
> >>  doc/develop/std_passage.rst                   | 319 +++++++++++++++++=
+
> >>  drivers/core/device.c                         |  11 +
> >>  drivers/core/root.c                           |   7 +
> >>  drivers/core/uclass.c                         |  13 +
> >>  drivers/serial/serial-uclass.c                |   3 +-
> >>  dts/Kconfig                                   |  12 +
> >>  include/asm-generic/global_data.h             |  35 ++
> >>  include/bloblist.h                            | 175 +++++++---
> >>  include/dm/device.h                           |  11 +-
> >>  include/dm/root.h                             |   8 +
> >>  include/dm/uclass-internal.h                  |   7 +
> >>  include/fdtdec.h                              |  40 ++-
> >>  include/handoff.h                             |   8 +-
> >>  .../x86/include/asm =3D> include}/intel_gnvs.h  |   0
> >>  include/linux/kconfig.h                       |  18 +
> >>  include/linux/stddef.h                        |   8 +-
> >>  include/spl.h                                 |  15 +
> >>  include/stdpass/README                        |   4 +
> >>  include/stdpass/tpm2_eventlog.h               |  42 +++
> >>  include/stdpass/vboot_ctx.h                   | 267 +++++++++++++++
> >>  lib/asm-offsets.c                             |   5 +
> >>  lib/fdtdec.c                                  |  65 +++-
> >>  scripts/config_whitelist.txt                  |   1 +
> >>  test/bloblist.c                               |  21 +-
> >>  test/dm/core.c                                |  41 +++
> >>  test/py/tests/test_passage.py                 |  11 +
> >>  57 files changed, 1798 insertions(+), 161 deletions(-)
> >>  create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi
> >>  create mode 100644 board/emulation/qemu-arm/spl.c
> >>  create mode 100644 board/sandbox/stdpass_check.c
> >>  create mode 100644 configs/qemu_arm_spl_defconfig
> >>  create mode 100644 doc/develop/std_passage.rst
> >>  rename {arch/x86/include/asm =3D> include}/intel_gnvs.h (100%)
> >>  create mode 100644 include/stdpass/README
> >>  create mode 100644 include/stdpass/tpm2_eventlog.h
> >>  create mode 100644 include/stdpass/vboot_ctx.h
> >>  create mode 100644 test/py/tests/test_passage.py
> >>
> >> --
> >> 2.33.1.1089.g2158813163f-goog
> >>
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

--000000000000d8a59e05cfd06ec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Simon,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 2 Nov 2021 at 15:59, Sim=
on Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:franc=
ois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; this seems a great endeavor. I&#39;d like to better understand the sco=
pe of it.<br>
&gt;<br>
&gt; Is it to be used as part of what could become a U-Boot entry ABI schem=
e? By that I mean giving some fixed aspects<br>
&gt; to U-Boot entry while letting boards to have flexibility (say for inst=
ance that the first 5 architecture ABI<br>
&gt; parameter registers are reserved for U-Boot), and the Passage is about=
 specifying either those reserved registers<br>
&gt; or one of them?<br>
<br>
The goal is to provide a standard entry scheme for all firmware<br>
binaries. Whether it achieves that (or can with some mods) is up for<br>
discussion.<br>
<br></blockquote><div>If you say</div><div>a) define a U-Boot entry ABI and=
 providing a firmware-to-firmware information passing facility which would =
be part of all firmware ABIs (as the projects decide to define their own AB=
I) it looks good.</div><div>but If you say=C2=A0</div><div>b) define a stan=
dard entry scheme (register map, processor state, MMU state, SMMU state, GI=
C state...) that does not look realistic.=C2=A0</div><div>I think you mean =
a) but just want to be sure.<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex">
Re the registers, do you think we need 5?<br>
<br>
&gt;<br>
&gt; Thinking entry ABI, here is what I observed on Arm:<br>
&gt;<br>
&gt; Linux has two entry ABIs:<br>
&gt; - plain: x0 =3D dtb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command line =3D dtb:/chosen/b=
ootargs; initrd =3D dtb:/chosen/linux,initrd-*<br>
&gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID config table=
; initrd =3D efi:&lt;loadfile2(INITRD vendor media UUID); command line =3D =
efi: image_protocol::load_options<br>
&gt;<br>
&gt; U-Boot (proper) has plenty of schemes:<br>
&gt; - dtb is passed as either x0, x1, fixed memory area (Qemu which is bad=
 in itself), or other registers<br>
&gt; - additional information passing: board specific register scheme, SMC =
calls<br>
&gt; - U-Boot for RPI boards implement a Linux shaped entry ABI to be launc=
hed by Videocore firmware<br>
&gt;<br>
&gt; Based on all the above, I would tend to think that RPI scheme is a goo=
d idea but also<br>
&gt; shall not prevent additional schemes for the boards.<br>
<br>
I was not actually considering Linux since I believe/assume its entry<br>
scheme is fixed and not up for discussion.<br>
<br>
I also did not think about the EFI case. As I understand it we cannot<br>
touch it as it is used by UEFI today. Maybe it is even in the<br>
standard?<br></blockquote><div>It is in the spec and we are making it evolv=
e, or its understanding evolve (jurisprudence) for instance on initrd stand=
ard handling.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">
<br>
Really I am hoping we can start afresh...?<br>
<br>
&gt;<br>
&gt; What about a U-Boot Arm entry ABI like:<br>
&gt; - plain: x0=3Ddtb, x1=3D&lt;Passage defined&gt;, x2-x5 =3D &lt;reserve=
d&gt;, other registers are per platform, SMC calls allowed too<br>
<br>
Hmm we don&#39;t actually need the dtb as it is available in the bloblist.<=
br></blockquote><div>If you don&#39;t have x0=3Ddtb, then you will not be a=
ble to use U-Boot on RPI4.</div><div>Unless you want to redo everything the=
 RPI firmware is doing.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">
But I added an offset to it as a convenience.<br>
<br>
&gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;=C2=A0 (whe=
n U-Boot is launched as an EFI app)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID config table, + Passage =
=3D Passage UUID config table<br>
<br>
I don&#39;t understand the last line. Where is the passage info /<br>
bloblist? Do you mean it goes in the HOB list with a UUID? I suppose<br>
that is the most EFI-compatible way.<br></blockquote><div>The Passage confi=
g table =C2=A0could just contain the &quot;head&quot; of the bloblist/Passa=
ge information.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">
<br>
What do you think about the idea of using an offset into the bloblist<br>
for the dtb? </blockquote><div>It is possible but as I said, failing to mim=
ic Linux entry ABI would miss the opportunity to just boot without changes =
on RPI4. =C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">Also, can we make the standard passag=
e ABI a build-time<br>
option, so it is deterministic?<br>
<br></blockquote><div>Looks good. I would look into stating that for System=
Ready we would advise to use that option and make it standard for Trusted S=
ubstrate (Linaro recipes that we upstreaming to make SystemReady compliance=
 easy and consistent across platforms).=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; We could further leverage Passage to pass Operating Systems parameters=
 that could be removed from device tree (migration of /chosen to Passage). =
Memory inventory would still be in DT but allocations for CMA or GPUs would=
 be in Passage. This idea is to reach a point where=C2=A0 device tree is a =
&quot;pristine&quot; hardware description.<br>
<br>
I&#39;m worried about this becoming a substitute for devicetree. Really my<=
br>
intent is to provide a way to pass simple info, whereas what you talk<br>
about there seems like something that should be DT, just that it might<br>
need suitable bindings.<br>
<br></blockquote><div>I see your point and I agree It should not be a subst=
itute.</div><div>here is an expanded version of what I had in mind when I w=
rote those lines.</div><div>cma, initrd and other Linux kernel parameters c=
an be conveyed either through command line or DT.</div><div>When using the =
non UEFI Linux entry ABI, you need to use the DT to pass those parameters.<=
/div><div>When using the UEFI Linux entry ABI, you *can* (not must) use the=
 command line to pass all information, leaving the DT passed to the OS with=
out any /chosen.</div><div>When introducing Passage, I was wondering if we =
could pass command line to Linux and, same as UEFI, leave the DT free from =
/chosen.</div><div>I am not sure it is a good goal though. I may be too pus=
hing for a DT free from parameters.</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex">
As you know I have more expansive views about what should be in DT.=C2=A0<b=
r></blockquote><div>I think both of us are huge supporters of DT format and=
 self describing capabilities.=C2=A0</div><div>I am inclined to put rules i=
nto what fits into what lands in the DT that is passed to the OS.</div><div=
>I am a fan of having DT used more in ad-hoc files.</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Cheers<br>
&gt;<br>
&gt; PS: as Ilias mentions, this patch set contains bug fixes, non immediat=
ely related additional functions (DM stats). It would be great to carve tho=
se out to fast path them and keep this one with the very core of your idea.=
<br>
<br>
The DM stats is used in &#39;passage: Report the devicetree source&#39;. I<=
br>
know it is sideways but I think it is better to make the output line<br>
more useful than just reporting the devicetree source.<br>
<br></blockquote><div>I believe the DM stats has merits in its own. You cou=
ld upstream this independently and then Passage would be yet another &quot;=
customer&quot; of the feature.=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">
The first patch is indeed unrelated. I will pick it up so we can drop<br>
it for the next rev.<br>
<br>
Regards,<br>
Simon<br>
<br>
<br>
&gt;<br>
&gt; On Mon, 1 Nov 2021 at 02:17, Simon Glass &lt;<a href=3D"mailto:sjg@chr=
omium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This series adds a standard way of passing information between dif=
ferent<br>
&gt;&gt; firmware phases. This already exists in U-Boot at a very basic lev=
el, in<br>
&gt;&gt; the form of a bloblist containing an spl_handoff structure, but th=
e intent<br>
&gt;&gt; here is to define something useful across projects.<br>
&gt;&gt;<br>
&gt;&gt; The need for this is growing as firmware fragments into multiple b=
inaries<br>
&gt;&gt; each with its own purpose. Without any run-time connection, we mus=
t rely<br>
&gt;&gt; on build-time settings which are brittle and painful to keep in sy=
nc.<br>
&gt;&gt;<br>
&gt;&gt; This feature is named &#39;standard passage&#39; since the name is=
 more unique<br>
&gt;&gt; than many others that could be chosen, it is a passage in the sens=
e that<br>
&gt;&gt; information is flowing from one place to another and it is standar=
d,<br>
&gt;&gt; because that is what we want to create.<br>
&gt;&gt;<br>
&gt;&gt; The implementation is simply a pointer to a bloblist in a register=
, with<br>
&gt;&gt; an extra register to point to a devicetree, for more complex data,=
 if one<br>
&gt;&gt; is present in the bloblist. This should cover all cases (small mem=
ory<br>
&gt;&gt; footprint as well as complex data flow) and be easy enough to impl=
ement on<br>
&gt;&gt; all architectures.<br>
&gt;&gt;<br>
&gt;&gt; The core bloblist code is relicensed to BSD-3-Clause in case it is=
 useful<br>
&gt;&gt; in non-GPL projects but there is no requirement to use the same co=
de.<br>
&gt;&gt;<br>
&gt;&gt; This series includes tweaks to the bloblist implementation in U-Bo=
ot to<br>
&gt;&gt; make it more suitable for the task, including:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 - Allocate tags explicitly in the enum<br>
&gt;&gt;=C2=A0 =C2=A0 - Put the magic number first<br>
&gt;&gt;=C2=A0 =C2=A0 - Define a process for adding tags<br>
&gt;&gt;<br>
&gt;&gt; The emphasis is on enabling open communcation between binaries, no=
t<br>
&gt;&gt; enabling passage of secret, undocumented data, although this is po=
ssible<br>
&gt;&gt; in a private environment.<br>
&gt;&gt;<br>
&gt;&gt; This series is built on the OF_BOARD series It is available at<br>
&gt;&gt; u-boot-dm/pass-working or:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://source.denx.de/u-boot/custodians/u-boot-dm/-/co=
mmit/073b5c156f222c69a98b8ebcaa563d1ff10eb217" rel=3D"noreferrer" target=3D=
"_blank">https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c=
156f222c69a98b8ebcaa563d1ff10eb217</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Simon Glass (31):<br>
&gt;&gt;=C2=A0 =C2=A0Makefile: Correct TPL rule for OF_REAL<br>
&gt;&gt;=C2=A0 =C2=A0kconfig: Add support for conditional values<br>
&gt;&gt;=C2=A0 =C2=A0dm: core: Allow getting some basic stats<br>
&gt;&gt;=C2=A0 =C2=A0stddef: Avoid warning with clang with offsetof()<br>
&gt;&gt;=C2=A0 =C2=A0fdt: Drop SPL_BUILD macro<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Put the magic number first<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Rename the SPL tag<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Drop unused tags<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Use explicit numbering for the tags<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Support allocating the bloblist<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Use LOG_CATEGORY to simply logging<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Use &#39;phase&#39; consistently for bloblis=
ts<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Refactor Kconfig to support alloc or fixed<b=
r>
&gt;&gt;=C2=A0 =C2=A0arm: qemu: Add an SPL build<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Add functions to obtain base address and siz=
e<br>
&gt;&gt;=C2=A0 =C2=A0passage: Support an incoming passage<br>
&gt;&gt;=C2=A0 =C2=A0passage: Support a control devicetree<br>
&gt;&gt;=C2=A0 =C2=A0passage: arm: Accept a passage from the previous phase=
<br>
&gt;&gt;=C2=A0 =C2=A0passage: spl: Support adding the dtb to the passage bl=
oblist<br>
&gt;&gt;=C2=A0 =C2=A0passage: spl: Support passing the passage to U-Boot<br=
>
&gt;&gt;=C2=A0 =C2=A0passage: Record where the devicetree came from<br>
&gt;&gt;=C2=A0 =C2=A0passage: Report the devicetree source<br>
&gt;&gt;=C2=A0 =C2=A0passage: Add a qemu test for ARM<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: doc: Bring in the API documentation<br>
&gt;&gt;=C2=A0 =C2=A0bloblist: Relicense to allow BSD-3-Clause<br>
&gt;&gt;=C2=A0 =C2=A0sandbox: Add a way of checking structs for standard pa=
ssage<br>
&gt;&gt;=C2=A0 =C2=A0passage: Add documentation<br>
&gt;&gt;=C2=A0 =C2=A0passage: Add docs for spl_handoff<br>
&gt;&gt;=C2=A0 =C2=A0x86: Move Intel GNVS file into the common include dire=
ctory<br>
&gt;&gt;=C2=A0 =C2=A0passage: Add checks for pre-existing blobs<br>
&gt;&gt;=C2=A0 =C2=A0WIP: RFC: Add a gitlab test<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 .gitlab-ci.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A06 +<br>
&gt;&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +<br>
&gt;&gt;=C2=A0 Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 arch/arm/cpu/armv7/start.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt;&gt;=C2=A0 arch/arm/dts/qemu-arm-u-boot.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 ++<br>
&gt;&gt;=C2=A0 arch/arm/lib/crt0.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<b=
r>
&gt;&gt;=C2=A0 arch/arm/mach-qemu/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;&gt;=C2=A0 arch/sandbox/cpu/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 arch/x86/cpu/apollolake/acpi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 arch/x86/cpu/broadwell/cpu_from_spl.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;&gt;=C2=A0 arch/x86/cpu/intel_common/acpi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 .../include/asm/arch-apollolake/global_nvs.h=C2=A0 |=C2=A0 =
=C2=A02 +-<br>
&gt;&gt;=C2=A0 arch/x86/lib/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<=
br>
&gt;&gt;=C2=A0 arch/x86/lib/tpl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<=
br>
&gt;&gt;=C2=A0 board/emulation/qemu-arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 23 +-<br>
&gt;&gt;=C2=A0 board/emulation/qemu-arm/MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 board/emulation/qemu-arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 board/emulation/qemu-arm/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 ++<br>
&gt;&gt;=C2=A0 board/google/chromebook_coral/coral.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 board/sandbox/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 board/sandbox/stdpass_check.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 107 ++++++<br>
&gt;&gt;=C2=A0 cmd/bdinfo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +<br>
&gt;&gt;=C2=A0 common/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 161 ++=
++++++-<br>
&gt;&gt;=C2=A0 common/bloblist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 124 +++++--=
<br>
&gt;&gt;=C2=A0 common/board_f.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 48 +=
+-<br>
&gt;&gt;=C2=A0 common/board_r.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +=
<br>
&gt;&gt;=C2=A0 common/spl/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74 +=
++-<br>
&gt;&gt;=C2=A0 configs/qemu_arm_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++++<br>
&gt;&gt;=C2=A0 doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 +++<br>
&gt;&gt;=C2=A0 doc/develop/bloblist.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +-<br>
&gt;&gt;=C2=A0 doc/develop/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 doc/develop/std_passage.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 319 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 drivers/core/device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
&gt;&gt;=C2=A0 drivers/core/root.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<b=
r>
&gt;&gt;=C2=A0 drivers/core/uclass.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +<br>
&gt;&gt;=C2=A0 drivers/serial/serial-uclass.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +<br>
&gt;&gt;=C2=A0 include/asm-generic/global_data.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
&gt;&gt;=C2=A0 include/bloblist.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 175 +++++++---<br=
>
&gt;&gt;=C2=A0 include/dm/device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;&gt;=C2=A0 include/dm/root.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +<br>
&gt;&gt;=C2=A0 include/dm/uclass-internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;&gt;=C2=A0 include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 +=
+-<br>
&gt;&gt;=C2=A0 include/handoff.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +-<br>
&gt;&gt;=C2=A0 .../x86/include/asm =3D&gt; include}/intel_gnvs.h=C2=A0 |=C2=
=A0 =C2=A00<br>
&gt;&gt;=C2=A0 include/linux/kconfig.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +<br>
&gt;&gt;=C2=A0 include/linux/stddef.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;&gt;=C2=A0 include/spl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 15 +<br>
&gt;&gt;=C2=A0 include/stdpass/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;&gt;=C2=A0 include/stdpass/tpm2_eventlog.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 42 +++<br>
&gt;&gt;=C2=A0 include/stdpass/vboot_ctx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 267 +++++++++++++++<br>
&gt;&gt;=C2=A0 lib/asm-offsets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A05 +<br>
&gt;&gt;=C2=A0 lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 65 +++-<br>
&gt;&gt;=C2=A0 scripts/config_whitelist.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 test/bloblist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2=
1 +-<br>
&gt;&gt;=C2=A0 test/dm/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
41 +++<br>
&gt;&gt;=C2=A0 test/py/tests/test_passage.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
&gt;&gt;=C2=A0 57 files changed, 1798 insertions(+), 161 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi<br>
&gt;&gt;=C2=A0 create mode 100644 board/emulation/qemu-arm/spl.c<br>
&gt;&gt;=C2=A0 create mode 100644 board/sandbox/stdpass_check.c<br>
&gt;&gt;=C2=A0 create mode 100644 configs/qemu_arm_spl_defconfig<br>
&gt;&gt;=C2=A0 create mode 100644 doc/develop/std_passage.rst<br>
&gt;&gt;=C2=A0 rename {arch/x86/include/asm =3D&gt; include}/intel_gnvs.h (=
100%)<br>
&gt;&gt;=C2=A0 create mode 100644 include/stdpass/README<br>
&gt;&gt;=C2=A0 create mode 100644 include/stdpass/tpm2_eventlog.h<br>
&gt;&gt;=C2=A0 create mode 100644 include/stdpass/vboot_ctx.h<br>
&gt;&gt;=C2=A0 create mode 100644 test/py/tests/test_passage.py<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.33.1.1089.g2158813163f-goog<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
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

--000000000000d8a59e05cfd06ec7--

