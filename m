Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A54A3693
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 15:05:44 +0100 (CET)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEApq-0004Ui-PS
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 09:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEAo7-0003Xx-7Q; Sun, 30 Jan 2022 09:03:55 -0500
Received: from [2a00:1450:4864:20::535] (port=46804
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEAnq-0000Gf-9o; Sun, 30 Jan 2022 09:03:41 -0500
Received: by mail-ed1-x535.google.com with SMTP id m11so21573366edi.13;
 Sun, 30 Jan 2022 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FP1pOCfo+7UEODMFZSShVbzW/rjoGSesCsCSJCEBhUA=;
 b=A1iSgBWFVfGT1OJ8k6iiOkrq2uZcPcDnM4cWZDJ1XA2PNiDtjw+4KNcLL1QmNQF7uR
 5OtF5GgGHYbJs6krPtBzkmN7nZCKFC6hV2/G+tIWnOv/SO3gJXnaAUBvQMGgfzfnSBRT
 nyBiv+BN8sua3Bnm7Fa9PNWaZg5Wrha0YeurJ4VZw4nq/QwlyJdXRKxQt6lZcnHTRl8k
 IE9cuKsKo3Gt11lEFsiJcYOGuYFIUwkkCO8/rP3FI7F9CfsjolP4AtqLHG8OjbA4S8Ye
 7ZFjAm1BtquhKRyIE3WRJtI6fJoDMzCK57ybFekstw3T1Uyy9XtxZHoz+Y6OicJ08JUq
 A43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FP1pOCfo+7UEODMFZSShVbzW/rjoGSesCsCSJCEBhUA=;
 b=im+NgVp7MeGZS1SRXlDae/Ykp9DZAyKj3Y2BECKsl8aEz8HTqE4novfU9Oeu9Fg2UX
 T7xziz/EKqnhMO7CjBtNGNMlkWw6B1J0wCzei3XQwmfRC4YtyqsJKMgTT5QeAYcBmLMm
 JjJHxiPWfmQHad2CCRMz87MQLUTSeRD7XEmGNU2XFFrypQ1RMAYQb0usktAwGcB67jCj
 TC0JNrgsAzsDQkMcv6oH6doKb+2pXVjAIT/Wqch+vCddN1F4eXEUG4x5TkUXXR2+IkHD
 J7jbD9lQHnOVLwPTI4LtfAmVao9JMw6ksEPBGjw6vDdNaIaEeWlJilPgyhlbP/f/lv1T
 kGRA==
X-Gm-Message-State: AOAM531EVlTBpUSkLBD1ihxU0iuZr/mffx5GzEU20jwvJ7Bd5shxHR1D
 Og//rMrrekWAQxQF5hRkSybe4fhUG2WVc9IpMwY=
X-Google-Smtp-Source: ABdhPJzltG0d0kTJJvsId4U3IeNrsFdDDwvqoH8Hjz2MQRdgz5kIVvw6JOlWsNmLEpGp9XVP8ER2U+2pGCILOE263DM=
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr16643406edc.361.1643551416376; 
 Sun, 30 Jan 2022 06:03:36 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 30 Jan 2022 15:03:25 +0100
Message-ID: <CAJy5ezpjxXB4FfH-ecBUH2kCfsOcAMa3MATbnURBJFm25-J3Yw@mail.gmail.com>
Subject: Re: [PATCH 00/16] arm: Fix handling of unrecognized functions in PSCI
 emulation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000057e54505d6cd221d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>,
 Rob Herring <robh@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Andre Przywara <andre.przywara@arm.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057e54505d6cd221d
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 4:46 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> This series fixes our handling of PSCI calls where the function ID is
> not recognized. These are supposed to return an error value, but
> currently we instead emulate the SMC or HVC instruction to trap to the
> guest at EL3 or EL2. Particularly of note for code review:
>  * patches 4-9 include some "is this the right behaviour for
>    this hardware" questions for the maintainers of those boards
>  * patch 15 has a DTB API question, as well as being a change in
>    what we edit in a DTB we are passed by the user
>  * testing of the affected machines would be welcome
>
> We tried to fix that bug in commit 9fcd15b9193e819b, but ran into
> regressions and so reverted it in commit 4825eaae4fdd56fba0f for
> release 7.0.  This series fixes the underlying problems causing the
> regressions and reverts the revert.  It also fixes some other bugs
> that were preventing booting of guests on the midway board and that
> meant that the Linux kernel I tested couldn't bring up the secondary
> CPUs when running with more than one guest CPU.
>
> The regressions happened on boards which enabled PSCI emulation while
> still running guest code at EL3. This used to work (as long as the
> guest code itself wasn't trying to implement PSCI!)  because of the
> fall-through-to-emulate-the-insn behaviour, but once the PSCI
> emulation handles all SMC calls, most EL3 guest code will stop working
> correctly. The solution this patchset adopts is to avoid enabling
> QEMU's PSCI emulation when running guest code at EL3.
>
> The affected boards are:
>  * orangepi-pc, mcimx6ul-evk, mcimx7d-sabre, highbank, midway,
>    xlnx-zcu102 (for any EL3 guest code)
>  * xlnx-versal-virt (only for EL3 code run via -kernel)
>  * virt (only for EL3 code run via -kernel or generic-loader)
> For all these cases we will no longer enable PSCI emulation.
> (This might in theory break guest code that used to work because
> it was relying on running under QEMU and having the PSCI emulation
> despite being at EL3 itself, but hopefully such code is rare.)
>
> In order to only enable PSCI emulation when the guest is running at an
> exception level lower than the level that our PSCI emulation
> "firmware" would be running at, we make the arm_load_kernel() code in
> boot.c responsible for setting the CPU properties psci-conduit and
> start-powered-off. This is because only that code knows what EL it is
> going to start the guest at (which depends on things like whether it
> has decided that the guest is a Linux kernel or not).
>
> The complicated case in all of this is the highbank and midway board
> models, because of all the boards which enable QEMU's PSCI emulation
> only these also use the boot.c secure_board_setup flag to say "run a
> fragment of QEMU-provided boot code in the guest at EL3 to set
> something up before running the guest at EL2 or EL1". That fragment of
> code includes use of the SMC instruction, so when PSCI emulation
> starts making that a NOP rather than a trap-to-guest-EL3 the setup
> code will change behaviour. Fortunately, for this specific board's use
> case the NOP is fine. The purpose of the setup code is to arrange that
> unknown SMCs act as NOPs, because guest code may use a
> highbank/midway-specific SMC ABI to enable the L2x0 cache
> controller. So when the PSCI emulation starts to NOP the unknown SMCs
> the setup code won't actively break, and the guest behaviour will
> still be OK. (See patch 11's commit message for fuller details.)
>
> Patches 1 and 2 make the relevant CPU properties settable after the
> CPU object has been realized. This is necessary because
> arm_load_kernel() runs very late, after the whole machine (including
> the CPU objects) has been fully initialized.  (It was the restriction
> on setting these properties before realize that previously led us to
> set them in the SoC emulation code and thus to do it unconditionally.)
>
> Patch 3 provides the "set up psci conduit" functionality in the boot.c
> code; this is opt-in per board by setting a field in the arm_boot_info
> struct.
>
> Patches 4 to 9 move the individual boards across to using the new
> approach. In each case I had to make a decision about the behaviour of
> secondary CPUs when running guest firmware at EL3 -- should the
> secondaries start off powered-down (waiting for the guest to power
> them up via some kind of emulated power-control device), or powered-up
> (so they all start running the firmware at once)? In a few cases I was
> able to find the answer to this; in the rest I have erred on the side
> of retaining the current "start powered down" behaviour, and added a
> TODO comment to that effect. If you know the actual hardware
> behaviour, let me know.
>

Hi Peter,

For ZynqMP and Versal, they should start up powered-off.



>
> Patch 10 is the revert-the-revert patch.
>
> Patch 11 removes the highbank/midway board use of the secure_board_setup
> functionality; the commit message has the details about why this is safe.
>
> Patches 12 to 14 are more minor cleanups that allow, and follow on from,
> dropping the highbank-specific secondary CPU boot stub code.
>
> Patch 15 is a change that is somewhat unrelated, but is necessary to
> get the highbank board to successfully boot in SMP and to get the
> midway board to start a Linux guest at all.
>
> I have tested this with make check/check-acceptance and also with some
> test images I have locally (including highbank and midway), but I
> don't have test images for most of these boards, and in particular I
> don't really have anything that exercises "run guest EL3 code" for
> most of them. Testing would be welcome.
>

For the Xilinx parts:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

In one of our test-cases I saw an issue where the test-case was relying on
QEMU's PSCI even though we're running EL3 firmware. The test firmware (TBM)
has PSCI support but relies on models that don't yet exist in upstream,
I'll
have to fix that on my side.

Best regards,
Edgar



>
> thanks
> -- PMM
>
> Peter Maydell (16):
>   target/arm: make psci-conduit settable after realize
>   cpu.c: Make start-powered-off settable after realize
>   hw/arm/boot: Support setting psci-conduit based on guest EL
>   hw/arm: imx: Don't enable PSCI conduit when booting guest in EL3
>   hw/arm: allwinner: Don't enable PSCI conduit when booting guest in EL3
>   hw/arm/xlnx-zcu102: Don't enable PSCI conduit when booting guest in
>     EL3
>   hw/arm/versal: Let boot.c handle PSCI enablement
>   hw/arm/virt: Let boot.c handle PSCI enablement
>   hw/arm: highbank: For EL3 guests, don't enable PSCI, start all cores
>   Revert "Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2""
>   hw/arm/highbank: Drop use of secure_board_setup
>   hw/arm/boot: Prevent setting both psci_conduit and secure_board_setup
>   hw/arm/boot: Don't write secondary boot stub if using PSCI
>   hw/arm/highbank: Drop unused secondary boot stub code
>   hw/arm/boot: Drop nb_cpus field from arm_boot_info
>   hw/arm/boot: Drop existing dtb /psci node rather than retaining it
>
>  include/hw/arm/boot.h        |  14 ++++-
>  include/hw/arm/xlnx-versal.h |   1 -
>  cpu.c                        |  22 ++++++-
>  hw/arm/allwinner-h3.c        |   9 ++-
>  hw/arm/aspeed.c              |   1 -
>  hw/arm/boot.c                | 107 +++++++++++++++++++++++++++++------
>  hw/arm/exynos4_boards.c      |   1 -
>  hw/arm/fsl-imx6ul.c          |   2 -
>  hw/arm/fsl-imx7.c            |   8 +--
>  hw/arm/highbank.c            |  72 +----------------------
>  hw/arm/imx25_pdk.c           |   3 +-
>  hw/arm/kzm.c                 |   1 -
>  hw/arm/mcimx6ul-evk.c        |   2 +-
>  hw/arm/mcimx7d-sabre.c       |   2 +-
>  hw/arm/npcm7xx.c             |   3 -
>  hw/arm/orangepi.c            |   5 +-
>  hw/arm/raspi.c               |   1 -
>  hw/arm/realview.c            |   1 -
>  hw/arm/sabrelite.c           |   1 -
>  hw/arm/sbsa-ref.c            |   1 -
>  hw/arm/vexpress.c            |   1 -
>  hw/arm/virt.c                |  13 +----
>  hw/arm/xilinx_zynq.c         |   1 -
>  hw/arm/xlnx-versal-virt.c    |   6 +-
>  hw/arm/xlnx-versal.c         |   5 +-
>  hw/arm/xlnx-zcu102.c         |   1 +
>  hw/arm/xlnx-zynqmp.c         |  13 +++--
>  target/arm/cpu.c             |   6 +-
>  target/arm/psci.c            |  35 ++----------
>  29 files changed, 164 insertions(+), 174 deletions(-)
>
> --
> 2.25.1
>
>

--00000000000057e54505d6cd221d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 4:46 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This series fixes our handling of PSCI calls where the function ID is=
<br>
not recognized. These are supposed to return an error value, but<br>
currently we instead emulate the SMC or HVC instruction to trap to the<br>
guest at EL3 or EL2. Particularly of note for code review:<br>
=C2=A0* patches 4-9 include some &quot;is this the right behaviour for<br>
=C2=A0 =C2=A0this hardware&quot; questions for the maintainers of those boa=
rds<br>
=C2=A0* patch 15 has a DTB API question, as well as being a change in<br>
=C2=A0 =C2=A0what we edit in a DTB we are passed by the user<br>
=C2=A0* testing of the affected machines would be welcome<br>
<br>
We tried to fix that bug in commit 9fcd15b9193e819b, but ran into<br>
regressions and so reverted it in commit 4825eaae4fdd56fba0f for<br>
release 7.0.=C2=A0 This series fixes the underlying problems causing the<br=
>
regressions and reverts the revert.=C2=A0 It also fixes some other bugs<br>
that were preventing booting of guests on the midway board and that<br>
meant that the Linux kernel I tested couldn&#39;t bring up the secondary<br=
>
CPUs when running with more than one guest CPU.<br>
<br>
The regressions happened on boards which enabled PSCI emulation while<br>
still running guest code at EL3. This used to work (as long as the<br>
guest code itself wasn&#39;t trying to implement PSCI!)=C2=A0 because of th=
e<br>
fall-through-to-emulate-the-insn behaviour, but once the PSCI<br>
emulation handles all SMC calls, most EL3 guest code will stop working<br>
correctly. The solution this patchset adopts is to avoid enabling<br>
QEMU&#39;s PSCI emulation when running guest code at EL3.<br>
<br>
The affected boards are:<br>
=C2=A0* orangepi-pc, mcimx6ul-evk, mcimx7d-sabre, highbank, midway,<br>
=C2=A0 =C2=A0xlnx-zcu102 (for any EL3 guest code)<br>
=C2=A0* xlnx-versal-virt (only for EL3 code run via -kernel)<br>
=C2=A0* virt (only for EL3 code run via -kernel or generic-loader)<br>
For all these cases we will no longer enable PSCI emulation.<br>
(This might in theory break guest code that used to work because<br>
it was relying on running under QEMU and having the PSCI emulation<br>
despite being at EL3 itself, but hopefully such code is rare.)<br>
<br>
In order to only enable PSCI emulation when the guest is running at an<br>
exception level lower than the level that our PSCI emulation<br>
&quot;firmware&quot; would be running at, we make the arm_load_kernel() cod=
e in<br>
boot.c responsible for setting the CPU properties psci-conduit and<br>
start-powered-off. This is because only that code knows what EL it is<br>
going to start the guest at (which depends on things like whether it<br>
has decided that the guest is a Linux kernel or not).<br>
<br>
The complicated case in all of this is the highbank and midway board<br>
models, because of all the boards which enable QEMU&#39;s PSCI emulation<br=
>
only these also use the boot.c secure_board_setup flag to say &quot;run a<b=
r>
fragment of QEMU-provided boot code in the guest at EL3 to set<br>
something up before running the guest at EL2 or EL1&quot;. That fragment of=
<br>
code includes use of the SMC instruction, so when PSCI emulation<br>
starts making that a NOP rather than a trap-to-guest-EL3 the setup<br>
code will change behaviour. Fortunately, for this specific board&#39;s use<=
br>
case the NOP is fine. The purpose of the setup code is to arrange that<br>
unknown SMCs act as NOPs, because guest code may use a<br>
highbank/midway-specific SMC ABI to enable the L2x0 cache<br>
controller. So when the PSCI emulation starts to NOP the unknown SMCs<br>
the setup code won&#39;t actively break, and the guest behaviour will<br>
still be OK. (See patch 11&#39;s commit message for fuller details.)<br>
<br>
Patches 1 and 2 make the relevant CPU properties settable after the<br>
CPU object has been realized. This is necessary because<br>
arm_load_kernel() runs very late, after the whole machine (including<br>
the CPU objects) has been fully initialized.=C2=A0 (It was the restriction<=
br>
on setting these properties before realize that previously led us to<br>
set them in the SoC emulation code and thus to do it unconditionally.)<br>
<br>
Patch 3 provides the &quot;set up psci conduit&quot; functionality in the b=
oot.c<br>
code; this is opt-in per board by setting a field in the arm_boot_info<br>
struct.<br>
<br>
Patches 4 to 9 move the individual boards across to using the new<br>
approach. In each case I had to make a decision about the behaviour of<br>
secondary CPUs when running guest firmware at EL3 -- should the<br>
secondaries start off powered-down (waiting for the guest to power<br>
them up via some kind of emulated power-control device), or powered-up<br>
(so they all start running the firmware at once)? In a few cases I was<br>
able to find the answer to this; in the rest I have erred on the side<br>
of retaining the current &quot;start powered down&quot; behaviour, and adde=
d a<br>
TODO comment to that effect. If you know the actual hardware<br>
behaviour, let me know.<br></blockquote><div><br></div><div><div>Hi Peter,<=
/div><div><br></div><div>For ZynqMP and Versal, they should start up powere=
d-off.</div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Patch 10 is the revert-the-revert patch.<br>
<br>
Patch 11 removes the highbank/midway board use of the secure_board_setup<br=
>
functionality; the commit message has the details about why this is safe.<b=
r>
<br>
Patches 12 to 14 are more minor cleanups that allow, and follow on from,<br=
>
dropping the highbank-specific secondary CPU boot stub code.<br>
<br>
Patch 15 is a change that is somewhat unrelated, but is necessary to<br>
get the highbank board to successfully boot in SMP and to get the<br>
midway board to start a Linux guest at all.<br>
<br>
I have tested this with make check/check-acceptance and also with some<br>
test images I have locally (including highbank and midway), but I<br>
don&#39;t have test images for most of these boards, and in particular I<br=
>
don&#39;t really have anything that exercises &quot;run guest EL3 code&quot=
; for<br>
most of them. Testing would be welcome.<br></blockquote><div><br></div><div=
><div class=3D"gmail_quote"><div>For the Xilinx parts:<br></div><div>Review=
ed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.com" t=
arget=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br></div>Tested-by: Edga=
r E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.com" target=3D"_b=
lank">edgar.iglesias@xilinx.com</a>&gt;</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">In one of our test-cases I saw an issue w=
here the test-case was relying on</div><div class=3D"gmail_quote">QEMU&#39;=
s PSCI even though we&#39;re running EL3 firmware. The test firmware (TBM)<=
br></div><div class=3D"gmail_quote">has PSCI support but relies on models t=
hat don&#39;t yet exist in upstream, I&#39;ll <br></div><div class=3D"gmail=
_quote">have to fix that on my side.</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">Best regards,</div><div class=3D"gmail_quote=
">Edgar</div><div class=3D"gmail_quote"><br></div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (16):<br>
=C2=A0 target/arm: make psci-conduit settable after realize<br>
=C2=A0 cpu.c: Make start-powered-off settable after realize<br>
=C2=A0 hw/arm/boot: Support setting psci-conduit based on guest EL<br>
=C2=A0 hw/arm: imx: Don&#39;t enable PSCI conduit when booting guest in EL3=
<br>
=C2=A0 hw/arm: allwinner: Don&#39;t enable PSCI conduit when booting guest =
in EL3<br>
=C2=A0 hw/arm/xlnx-zcu102: Don&#39;t enable PSCI conduit when booting guest=
 in<br>
=C2=A0 =C2=A0 EL3<br>
=C2=A0 hw/arm/versal: Let boot.c handle PSCI enablement<br>
=C2=A0 hw/arm/virt: Let boot.c handle PSCI enablement<br>
=C2=A0 hw/arm: highbank: For EL3 guests, don&#39;t enable PSCI, start all c=
ores<br>
=C2=A0 Revert &quot;Revert &quot;arm: tcg: Adhere to SMCCC 1.3 section 5.2&=
quot;&quot;<br>
=C2=A0 hw/arm/highbank: Drop use of secure_board_setup<br>
=C2=A0 hw/arm/boot: Prevent setting both psci_conduit and secure_board_setu=
p<br>
=C2=A0 hw/arm/boot: Don&#39;t write secondary boot stub if using PSCI<br>
=C2=A0 hw/arm/highbank: Drop unused secondary boot stub code<br>
=C2=A0 hw/arm/boot: Drop nb_cpus field from arm_boot_info<br>
=C2=A0 hw/arm/boot: Drop existing dtb /psci node rather than retaining it<b=
r>
<br>
=C2=A0include/hw/arm/boot.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 ++++-<br>
=C2=A0include/hw/arm/xlnx-versal.h |=C2=A0 =C2=A01 -<br>
=C2=A0cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 ++++++-<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++-<=
br>
=C2=A0hw/arm/aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 -<br>
=C2=A0hw/arm/boot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| 107 +++++++++++++++++++++++++++++------<br>
=C2=A0hw/arm/exynos4_boards.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0hw/arm/fsl-imx6ul.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 -<br>
=C2=A0hw/arm/fsl-imx7.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A08 +--<br>
=C2=A0hw/arm/highbank.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 72=
 +----------------------<br>
=C2=A0hw/arm/imx25_pdk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +-<br>
=C2=A0hw/arm/kzm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0hw/arm/mcimx6ul-evk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<b=
r>
=C2=A0hw/arm/mcimx7d-sabre.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<b=
r>
=C2=A0hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 -<br>
=C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +-<br>
=C2=A0hw/arm/raspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A01 -<br>
=C2=A0hw/arm/realview.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/arm/sabrelite.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/arm/sbsa-ref.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/arm/vexpress.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 -<br>
=C2=A0hw/arm/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 13 +----<br>
=C2=A0hw/arm/xilinx_zynq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 -<br>
=C2=A0hw/arm/xlnx-versal-virt.c=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0hw/arm/xlnx-versal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05=
 +-<br>
=C2=A0hw/arm/xlnx-zcu102.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 +<br>
=C2=A0hw/arm/xlnx-zynqmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +++-=
-<br>
=C2=A0target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A06 +-<br>
=C2=A0target/arm/psci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 35=
 ++----------<br>
=C2=A029 files changed, 164 insertions(+), 174 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000057e54505d6cd221d--

