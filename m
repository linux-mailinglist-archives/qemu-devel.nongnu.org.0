Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DE94415B0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:55:35 +0100 (CET)
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhT6M-0003Nr-DP
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhT4n-0002hK-Ky
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:53:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mhT4j-0004cD-VR
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:53:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g10so61710948edj.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8GSIB+v+CYPr9iXa3DTI07CrlKMQwvb5bf+KItTJdk=;
 b=SPFtgLyzchjX3jlBpoZCg64DLSXeR59y13ErjEoRnYAZ1RYQm3dXxCWwTRK+hg4V4c
 GZVayChdC/66U00iPIbm4IgoZIR+luLtolR55vz+4JMid4F3DGOl1OvxDTPtIGVCZGG6
 aQD8TrLbc3zL1/dLrV3zp4Kg87vKq6Y7g01hLLpY0YbR0Ui3Jy9CHwxKe1OrzmYjpRUO
 nqz3EVJInMxPStAKzlB6NEBPf5NSEryzwjBQODlmdA3/0dcRmxFbYjznnbB9qIwt4vez
 Qu3UAY8zLhbgt77jXYAAYrxjRXJVWkZyP7H//XRaMN2qaiRiEdroHe6xEDUTk7P8H8VI
 6Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8GSIB+v+CYPr9iXa3DTI07CrlKMQwvb5bf+KItTJdk=;
 b=2cc70TSTwzkV+i3ecObr3n4Yyjx+FAGFtZtefh+SetchGxAclyqnKm12a+Qj9jhhwl
 giiD8Tb8BuSlKqUgKMKGda5k3an0YdQEQqx7+wKJ+uHnJ9NrPPVOXmL/LTrVvtLsV/ON
 4SgAWQtJ1n34pvHQ2vBw5h09r4rPjhd+o155hdVnB/q6lMGl+m9RwEG+bRkp3JwCMQ5x
 sSjH5JQmuELFdXZU0qXBkfUpJ26mAZOg0gHtyKBz+jGNn+RoHK0J9ZYF4OCBq5l3hJ+y
 Z+GqFlLjf3HCqda0HEAkOXHD1+qmqDkhfhzCPk2PLnsBQZFkmtxTTw82yuyCYNNFtFdG
 VKDw==
X-Gm-Message-State: AOAM532J1PQhd92zSXptTCtwmkeditwp4Xpw+qnD4Sre52r7yjeClMmO
 wevpiVbPR+lyccQkK3KxOtf4e+gWSZHNSozKmOWpLw==
X-Google-Smtp-Source: ABdhPJy0HFWXhINvcEYpfCgoAXmKOi8bGhcTpDXivlKVTq5M73kLyM226FNlndsxYtD3VqM2m8OLsu9TDq6yBiU32Iw=
X-Received: by 2002:a50:bf08:: with SMTP id f8mr38078172edk.400.1635756831426; 
 Mon, 01 Nov 2021 01:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
In-Reply-To: <20211101011734.1614781-1-sjg@chromium.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Mon, 1 Nov 2021 09:53:40 +0100
Message-ID: <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000e0618c05cfb650b2"
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
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e0618c05cfb650b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

this seems a great endeavor. I'd like to better understand the scope of it.

Is it to be used as part of what could become a U-Boot entry ABI scheme? By
that I mean giving some fixed aspects
to U-Boot entry while letting boards to have flexibility (say for instance
that the first 5 architecture ABI
parameter registers are reserved for U-Boot), and the Passage is about
specifying either those reserved registers
or one of them?

Thinking entry ABI, here is what I observed on Arm:

Linux has two entry ABIs:
- plain: x0 =3D dtb;
          command line =3D dtb:/chosen/bootargs; initrd =3D
dtb:/chosen/linux,initrd-*
- EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
           dtb =3D EFI_UUID config table; initrd =3D efi:<loadfile2(INITRD
vendor media UUID); command line =3D efi: image_protocol::load_options

U-Boot (proper) has plenty of schemes:
- dtb is passed as either x0, x1, fixed memory area (Qemu which is bad in
itself), or other registers
- additional information passing: board specific register scheme, SMC calls
- U-Boot for RPI boards implement a Linux shaped entry ABI to be launched
by Videocore firmware

Based on all the above, I would tend to think that RPI scheme is a good
idea but also
shall not prevent additional schemes for the boards.

What about a U-Boot Arm entry ABI like:
- plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, other regi=
sters
are per platform, SMC calls allowed too
- EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when U-Boot i=
s
launched as an EFI app)
       dtb =3D EFI_UUID config table, + Passage =3D Passage UUID config tab=
le

We could further leverage Passage to pass Operating Systems parameters that
could be removed from device tree (migration of /chosen to Passage). Memory
inventory would still be in DT but allocations for CMA or GPUs would be in
Passage. This idea is to reach a point where  device tree is a "pristine"
hardware description.

Cheers

PS: as Ilias mentions, this patch set contains bug fixes, non immediately
related additional functions (DM stats). It would be great to carve those
out to fast path them and keep this one with the very core of your idea.

On Mon, 1 Nov 2021 at 02:17, Simon Glass <sjg@chromium.org> wrote:

>
> This series adds a standard way of passing information between different
> firmware phases. This already exists in U-Boot at a very basic level, in
> the form of a bloblist containing an spl_handoff structure, but the inten=
t
> here is to define something useful across projects.
>
> The need for this is growing as firmware fragments into multiple binaries
> each with its own purpose. Without any run-time connection, we must rely
> on build-time settings which are brittle and painful to keep in sync.
>
> This feature is named 'standard passage' since the name is more unique
> than many others that could be chosen, it is a passage in the sense that
> information is flowing from one place to another and it is standard,
> because that is what we want to create.
>
> The implementation is simply a pointer to a bloblist in a register, with
> an extra register to point to a devicetree, for more complex data, if one
> is present in the bloblist. This should cover all cases (small memory
> footprint as well as complex data flow) and be easy enough to implement o=
n
> all architectures.
>
> The core bloblist code is relicensed to BSD-3-Clause in case it is useful
> in non-GPL projects but there is no requirement to use the same code.
>
> This series includes tweaks to the bloblist implementation in U-Boot to
> make it more suitable for the task, including:
>
>    - Allocate tags explicitly in the enum
>    - Put the magic number first
>    - Define a process for adding tags
>
> The emphasis is on enabling open communcation between binaries, not
> enabling passage of secret, undocumented data, although this is possible
> in a private environment.
>
> This series is built on the OF_BOARD series It is available at
> u-boot-dm/pass-working or:
>
>
> https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c156f222=
c69a98b8ebcaa563d1ff10eb217
>
>
> Simon Glass (31):
>   Makefile: Correct TPL rule for OF_REAL
>   kconfig: Add support for conditional values
>   dm: core: Allow getting some basic stats
>   stddef: Avoid warning with clang with offsetof()
>   fdt: Drop SPL_BUILD macro
>   bloblist: Put the magic number first
>   bloblist: Rename the SPL tag
>   bloblist: Drop unused tags
>   bloblist: Use explicit numbering for the tags
>   bloblist: Support allocating the bloblist
>   bloblist: Use LOG_CATEGORY to simply logging
>   bloblist: Use 'phase' consistently for bloblists
>   bloblist: Refactor Kconfig to support alloc or fixed
>   arm: qemu: Add an SPL build
>   bloblist: Add functions to obtain base address and size
>   passage: Support an incoming passage
>   passage: Support a control devicetree
>   passage: arm: Accept a passage from the previous phase
>   passage: spl: Support adding the dtb to the passage bloblist
>   passage: spl: Support passing the passage to U-Boot
>   passage: Record where the devicetree came from
>   passage: Report the devicetree source
>   passage: Add a qemu test for ARM
>   bloblist: doc: Bring in the API documentation
>   bloblist: Relicense to allow BSD-3-Clause
>   sandbox: Add a way of checking structs for standard passage
>   passage: Add documentation
>   passage: Add docs for spl_handoff
>   x86: Move Intel GNVS file into the common include directory
>   passage: Add checks for pre-existing blobs
>   WIP: RFC: Add a gitlab test
>
>  .gitlab-ci.yml                                |   6 +
>  MAINTAINERS                                   |  10 +
>  Makefile                                      |   2 +-
>  arch/arm/cpu/armv7/start.S                    |   7 +-
>  arch/arm/dts/qemu-arm-u-boot.dtsi             |  22 ++
>  arch/arm/lib/crt0.S                           |   4 +
>  arch/arm/mach-qemu/Kconfig                    |   9 +
>  arch/sandbox/cpu/spl.c                        |   2 +-
>  arch/x86/cpu/apollolake/acpi.c                |   2 +-
>  arch/x86/cpu/broadwell/cpu_from_spl.c         |   4 +-
>  arch/x86/cpu/intel_common/acpi.c              |   2 +-
>  .../include/asm/arch-apollolake/global_nvs.h  |   2 +-
>  arch/x86/lib/spl.c                            |   2 +-
>  arch/x86/lib/tpl.c                            |   2 +-
>  board/emulation/qemu-arm/Kconfig              |  23 +-
>  board/emulation/qemu-arm/MAINTAINERS          |   1 +
>  board/emulation/qemu-arm/Makefile             |   1 +
>  board/emulation/qemu-arm/spl.c                |  27 ++
>  board/google/chromebook_coral/coral.c         |   2 +-
>  board/sandbox/Makefile                        |   3 +-
>  board/sandbox/stdpass_check.c                 | 107 ++++++
>  cmd/bdinfo.c                                  |   2 +
>  common/Kconfig                                | 161 ++++++++-
>  common/bloblist.c                             | 124 +++++--
>  common/board_f.c                              |  48 ++-
>  common/board_r.c                              |  18 +
>  common/spl/spl.c                              |  74 +++-
>  configs/qemu_arm_spl_defconfig                |  78 +++++
>  doc/board/emulation/qemu-arm.rst              |  38 +++
>  doc/develop/bloblist.rst                      |  28 +-
>  doc/develop/index.rst                         |   1 +
>  doc/develop/std_passage.rst                   | 319 ++++++++++++++++++
>  drivers/core/device.c                         |  11 +
>  drivers/core/root.c                           |   7 +
>  drivers/core/uclass.c                         |  13 +
>  drivers/serial/serial-uclass.c                |   3 +-
>  dts/Kconfig                                   |  12 +
>  include/asm-generic/global_data.h             |  35 ++
>  include/bloblist.h                            | 175 +++++++---
>  include/dm/device.h                           |  11 +-
>  include/dm/root.h                             |   8 +
>  include/dm/uclass-internal.h                  |   7 +
>  include/fdtdec.h                              |  40 ++-
>  include/handoff.h                             |   8 +-
>  .../x86/include/asm =3D> include}/intel_gnvs.h  |   0
>  include/linux/kconfig.h                       |  18 +
>  include/linux/stddef.h                        |   8 +-
>  include/spl.h                                 |  15 +
>  include/stdpass/README                        |   4 +
>  include/stdpass/tpm2_eventlog.h               |  42 +++
>  include/stdpass/vboot_ctx.h                   | 267 +++++++++++++++
>  lib/asm-offsets.c                             |   5 +
>  lib/fdtdec.c                                  |  65 +++-
>  scripts/config_whitelist.txt                  |   1 +
>  test/bloblist.c                               |  21 +-
>  test/dm/core.c                                |  41 +++
>  test/py/tests/test_passage.py                 |  11 +
>  57 files changed, 1798 insertions(+), 161 deletions(-)
>  create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi
>  create mode 100644 board/emulation/qemu-arm/spl.c
>  create mode 100644 board/sandbox/stdpass_check.c
>  create mode 100644 configs/qemu_arm_spl_defconfig
>  create mode 100644 doc/develop/std_passage.rst
>  rename {arch/x86/include/asm =3D> include}/intel_gnvs.h (100%)
>  create mode 100644 include/stdpass/README
>  create mode 100644 include/stdpass/tpm2_eventlog.h
>  create mode 100644 include/stdpass/vboot_ctx.h
>  create mode 100644 test/py/tests/test_passage.py
>
> --
> 2.33.1.1089.g2158813163f-goog
>
>

--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000e0618c05cfb650b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Simon,<div><br></div><div>this seems a great endeavor. =
I&#39;d like to better understand the scope of it.</div><div><br></div><div=
>Is it to be used as part of what could become a U-Boot entry ABI scheme? B=
y that I mean giving some fixed aspects</div><div>to U-Boot entry while let=
ting boards to have flexibility (say for instance that the first 5 architec=
ture ABI=C2=A0</div><div>parameter registers are reserved for U-Boot), and =
the Passage is about specifying either those reserved registers</div><div>o=
r one of them?</div><div><br></div><div>Thinking entry ABI, here is what I =
observed on Arm:</div><div><br></div><div>Linux has two entry ABIs:</div><d=
iv>- plain: x0 =3D dtb;=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
command line =3D dtb:/chosen/bootargs; initrd =3D dtb:/chosen/linux,initrd-=
*=C2=A0</div><div>- EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn addres=
s;=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb =3D=C2=A0EF=
I_UUID config table; initrd =3D efi:&lt;loadfile2(INITRD vendor media UUID)=
; command line =3D efi: image_protocol::load_options</div><div><br></div><d=
iv>U-Boot (proper) has plenty of schemes:</div><div>- dtb is passed as eith=
er x0, x1, fixed memory area (Qemu which is bad in itself), or other regist=
ers</div><div>- additional information passing: board specific register sch=
eme, SMC calls</div><div>- U-Boot for RPI boards implement a Linux shaped e=
ntry ABI to be launched by Videocore firmware</div><div><br></div><div>Base=
d on all the above, I would tend to think that RPI scheme is a good idea bu=
t also=C2=A0</div><div>shall not prevent additional schemes for the boards.=
</div><div><br></div><div>What about a U-Boot Arm entry ABI like:</div><div=
>- plain: x0=3Ddtb, x1=3D&lt;Passage defined&gt;, x2-x5 =3D &lt;reserved&gt=
;, other registers are per platform, SMC calls allowed too</div><div>- EFI:=
 x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;=C2=A0<span class=3D"g=
mail-Apple-converted-space">=C2=A0</span>(when U-Boot is launched as an EFI=
 app)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0dtb =3D=C2=A0EFI_UUID config tab=
le, + Passage =3D Passage UUID config table=C2=A0</div><div><br></div><div>=
We could further leverage Passage to pass Operating Systems parameters that=
 could be removed from device tree (migration of /chosen to Passage). Memor=
y inventory would still be in DT but allocations for CMA or GPUs would be i=
n Passage. This idea is to reach a point where =C2=A0device tree is a &quot=
;pristine&quot; hardware description.</div><div><br></div><div>Cheers</div>=
<div><br></div><div>PS: as Ilias mentions, this patch set contains bug fixe=
s, non immediately related additional functions (DM stats). It would be gre=
at to carve those out to fast path them and keep this one with the very cor=
e of your idea.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 1 Nov 2021 at 02:17, Simon Glass &lt;<a href=
=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex"><br>
This series adds a standard way of passing information between different<br=
>
firmware phases. This already exists in U-Boot at a very basic level, in<br=
>
the form of a bloblist containing an spl_handoff structure, but the intent<=
br>
here is to define something useful across projects.<br>
<br>
The need for this is growing as firmware fragments into multiple binaries<b=
r>
each with its own purpose. Without any run-time connection, we must rely<br=
>
on build-time settings which are brittle and painful to keep in sync.<br>
<br>
This feature is named &#39;standard passage&#39; since the name is more uni=
que<br>
than many others that could be chosen, it is a passage in the sense that<br=
>
information is flowing from one place to another and it is standard,<br>
because that is what we want to create.<br>
<br>
The implementation is simply a pointer to a bloblist in a register, with<br=
>
an extra register to point to a devicetree, for more complex data, if one<b=
r>
is present in the bloblist. This should cover all cases (small memory<br>
footprint as well as complex data flow) and be easy enough to implement on<=
br>
all architectures.<br>
<br>
The core bloblist code is relicensed to BSD-3-Clause in case it is useful<b=
r>
in non-GPL projects but there is no requirement to use the same code.<br>
<br>
This series includes tweaks to the bloblist implementation in U-Boot to<br>
make it more suitable for the task, including:<br>
<br>
=C2=A0 =C2=A0- Allocate tags explicitly in the enum<br>
=C2=A0 =C2=A0- Put the magic number first<br>
=C2=A0 =C2=A0- Define a process for adding tags<br>
<br>
The emphasis is on enabling open communcation between binaries, not<br>
enabling passage of secret, undocumented data, although this is possible<br=
>
in a private environment.<br>
<br>
This series is built on the OF_BOARD series It is available at<br>
u-boot-dm/pass-working or:<br>
<br>
<a href=3D"https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b=
5c156f222c69a98b8ebcaa563d1ff10eb217" rel=3D"noreferrer" target=3D"_blank">=
https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/073b5c156f222c6=
9a98b8ebcaa563d1ff10eb217</a><br>
<br>
<br>
Simon Glass (31):<br>
=C2=A0 Makefile: Correct TPL rule for OF_REAL<br>
=C2=A0 kconfig: Add support for conditional values<br>
=C2=A0 dm: core: Allow getting some basic stats<br>
=C2=A0 stddef: Avoid warning with clang with offsetof()<br>
=C2=A0 fdt: Drop SPL_BUILD macro<br>
=C2=A0 bloblist: Put the magic number first<br>
=C2=A0 bloblist: Rename the SPL tag<br>
=C2=A0 bloblist: Drop unused tags<br>
=C2=A0 bloblist: Use explicit numbering for the tags<br>
=C2=A0 bloblist: Support allocating the bloblist<br>
=C2=A0 bloblist: Use LOG_CATEGORY to simply logging<br>
=C2=A0 bloblist: Use &#39;phase&#39; consistently for bloblists<br>
=C2=A0 bloblist: Refactor Kconfig to support alloc or fixed<br>
=C2=A0 arm: qemu: Add an SPL build<br>
=C2=A0 bloblist: Add functions to obtain base address and size<br>
=C2=A0 passage: Support an incoming passage<br>
=C2=A0 passage: Support a control devicetree<br>
=C2=A0 passage: arm: Accept a passage from the previous phase<br>
=C2=A0 passage: spl: Support adding the dtb to the passage bloblist<br>
=C2=A0 passage: spl: Support passing the passage to U-Boot<br>
=C2=A0 passage: Record where the devicetree came from<br>
=C2=A0 passage: Report the devicetree source<br>
=C2=A0 passage: Add a qemu test for ARM<br>
=C2=A0 bloblist: doc: Bring in the API documentation<br>
=C2=A0 bloblist: Relicense to allow BSD-3-Clause<br>
=C2=A0 sandbox: Add a way of checking structs for standard passage<br>
=C2=A0 passage: Add documentation<br>
=C2=A0 passage: Add docs for spl_handoff<br>
=C2=A0 x86: Move Intel GNVS file into the common include directory<br>
=C2=A0 passage: Add checks for pre-existing blobs<br>
=C2=A0 WIP: RFC: Add a gitlab test<br>
<br>
=C2=A0.gitlab-ci.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<=
br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 10 +<br>
=C2=A0Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0arch/arm/cpu/armv7/start.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0arch/arm/dts/qemu-arm-u-boot.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 22 ++<br>
=C2=A0arch/arm/lib/crt0.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0arch/arm/mach-qemu/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
=C2=A0arch/sandbox/cpu/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0arch/x86/cpu/apollolake/acpi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0arch/x86/cpu/broadwell/cpu_from_spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0arch/x86/cpu/intel_common/acpi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../include/asm/arch-apollolake/global_nvs.h=C2=A0 |=C2=A0 =C2=A02 +-=
<br>
=C2=A0arch/x86/lib/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0arch/x86/lib/tpl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0board/emulation/qemu-arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 23 +-<br>
=C2=A0board/emulation/qemu-arm/MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0board/emulation/qemu-arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0board/emulation/qemu-arm/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 27 ++<br>
=C2=A0board/google/chromebook_coral/coral.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0board/sandbox/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0board/sandbox/stdpass_check.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 107 ++++++<br>
=C2=A0cmd/bdinfo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0common/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 161 ++++++++-<br=
>
=C2=A0common/bloblist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 124 +++++--<br>
=C2=A0common/board_f.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 48 ++-<br>
=C2=A0common/board_r.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 +<br>
=C2=A0common/spl/spl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 74 +++-<br>
=C2=A0configs/qemu_arm_spl_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 78 +++++<br>
=C2=A0doc/board/emulation/qemu-arm.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 38 +++<br>
=C2=A0doc/develop/bloblist.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 +-<br>
=C2=A0doc/develop/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0doc/develop/std_passage.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 319 ++++++++++++++++++<br>
=C2=A0drivers/core/device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
=C2=A0drivers/core/root.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0drivers/core/uclass.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +<br>
=C2=A0drivers/serial/serial-uclass.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0dts/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 12 +<br>
=C2=A0include/asm-generic/global_data.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 35 ++<br>
=C2=A0include/bloblist.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 175 +++++++---<br>
=C2=A0include/dm/device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A0include/dm/root.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +<br>
=C2=A0include/dm/uclass-internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0include/fdtdec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 ++-<br>
=C2=A0include/handoff.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0.../x86/include/asm =3D&gt; include}/intel_gnvs.h=C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0include/linux/kconfig.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +<br>
=C2=A0include/linux/stddef.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0include/spl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +<=
br>
=C2=A0include/stdpass/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0include/stdpass/tpm2_eventlog.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 42 +++<br>
=C2=A0include/stdpass/vboot_ctx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 267 +++++++++++++++<br>
=C2=A0lib/asm-offsets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0lib/fdtdec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 65 +=
++-<br>
=C2=A0scripts/config_whitelist.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0test/bloblist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +-<br=
>
=C2=A0test/dm/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 41 +++<br>
=C2=A0test/py/tests/test_passage.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br>
=C2=A057 files changed, 1798 insertions(+), 161 deletions(-)<br>
=C2=A0create mode 100644 arch/arm/dts/qemu-arm-u-boot.dtsi<br>
=C2=A0create mode 100644 board/emulation/qemu-arm/spl.c<br>
=C2=A0create mode 100644 board/sandbox/stdpass_check.c<br>
=C2=A0create mode 100644 configs/qemu_arm_spl_defconfig<br>
=C2=A0create mode 100644 doc/develop/std_passage.rst<br>
=C2=A0rename {arch/x86/include/asm =3D&gt; include}/intel_gnvs.h (100%)<br>
=C2=A0create mode 100644 include/stdpass/README<br>
=C2=A0create mode 100644 include/stdpass/tpm2_eventlog.h<br>
=C2=A0create mode 100644 include/stdpass/vboot_ctx.h<br>
=C2=A0create mode 100644 test/py/tests/test_passage.py<br>
<br>
-- <br>
2.33.1.1089.g2158813163f-goog<br>
<br>
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
div></div></div></div></div></div></div></div></div></div></div>

--000000000000e0618c05cfb650b2--

