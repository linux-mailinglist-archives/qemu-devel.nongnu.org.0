Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4944AC46C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:54:32 +0100 (CET)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6LX-0004Kr-JH
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:54:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nH6Je-0001tS-KE; Mon, 07 Feb 2022 10:52:34 -0500
Received: from [2a00:1450:4864:20::533] (port=39452
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nH6JX-0004yn-VH; Mon, 07 Feb 2022 10:52:34 -0500
Received: by mail-ed1-x533.google.com with SMTP id u18so30682304edt.6;
 Mon, 07 Feb 2022 07:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=makHVxWA+WEZuLdjkGtWvHqDqAJlzWLQBerIaV+pZWM=;
 b=COW6u9aZQTHYmDdOHIGnz3CZfmrC1hTLFnwSfkTl5xLUl9YTrpDznnttzLIHzF5ASf
 Q2lTuFQxMQhG8ie+9MfzkJFVO/vTF49HXELTq5l1G10szmMjtkAsgjhB1PLJBo21984v
 vRYMuIzugbh6BhJ+58kXKhAsqdwFaSsdNksaqi5/U6/Kp/z02C4grhi3sKXbgtxJsvE2
 pim6xk37+1Ggd2n4L5DLW3PdB7wmlPrWymva6SYekItxxk7Y+tKLvT5GLoyD06RO/fRS
 Eqk0XxpuxdZTg/zp/Nulfu1s0/toGFVAzNDqpyMmuzJEFj2u4KARY+Z4x//M5sEoE3EG
 dpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=makHVxWA+WEZuLdjkGtWvHqDqAJlzWLQBerIaV+pZWM=;
 b=evHEf6bYNzrr2LSzKYVhXqqkNxAJjBJzCLUGPvJhuAgY7yVizeuBMMVQzGCwSUxnVe
 B63opIq87Ljp4jFYWMN2B7gGDTbYeQv0HF9graXKGB/gy7Mh0NRdPIwb2gt+gkSr7vp9
 J6sBlqAaB4XNm5NheCoKfhSlEfuYz6+y10u6Q1E9ZwlDdjpThwollSm46HBjCjFFe1m8
 iRuClTrdNaQCvhbJAufGslRUpFgCRd46w+JooxuqmJjQCqOfzHcTlMtKwJL4SHMqqIY4
 SduvIe1LYcsFYAUTcgOoF9Wewk10rcvh5fUNig240Qj4OkM8EL4qrmufE0rdYpqQFi1y
 6XZw==
X-Gm-Message-State: AOAM5311Pal0znm6OgkN92vU5IbYEiuAFs2xaTpFFjxSaVL+WbMCXgi8
 X+6o8LxxxOaGwVq63j9emcB8L7UzrMeOF5rpCwg=
X-Google-Smtp-Source: ABdhPJyKzFTgowhvEOR3EXBQVOHpt+vSSP5EhZVsno+xJaxhlUUvKDG3X2MB5/q7c25vECI0OPX0q+xN7b4T5bJgi0I=
X-Received: by 2002:aa7:c4ca:: with SMTP id p10mr138473edr.20.1644249141032;
 Mon, 07 Feb 2022 07:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
In-Reply-To: <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 7 Feb 2022 16:52:08 +0100
Message-ID: <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Alexander Graf <agraf@csgraf.de>
Content-Type: multipart/alternative; boundary="000000000000f93ba405d76f9501"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Yanan Wang <wangyanan55@huawei.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Joel Stanley <joel@jms.id.au>,
 Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f93ba405d76f9501
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 7, 2022 at 4:33 PM Alexander Graf <agraf@csgraf.de> wrote:

>
> On 07.02.22 16:22, Peter Maydell wrote:
> > On Mon, 7 Feb 2022 at 14:21, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 27.01.22 16:46, Peter Maydell wrote:
> >>> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
> >>> boot.c functionality to allow us to enable psci-conduit only if
> >>> the guest is being booted in EL1 or EL2, so that if the user runs
> >>> guest EL3 firmware code our PSCI emulation doesn't get in its
> >>> way.
> >>>
> >>> To do this we stop setting the psci-conduit property on the CPU
> >>> objects in the SoC code, and instead set the psci_conduit field in
> >>> the arm_boot_info struct to tell the common boot loader code that
> >>> we'd like PSCI if the guest is starting at an EL that it makes
> >>> sense with.
> >>>
> >>> Note that this means that EL3 guest code will have no way
> >>> to power on secondary cores, because we don't model any
> >>> kind of power controller that does that on this SoC.
> >>>
> >>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >>
> >> It's been a while since I worked with ZynqMP, but typically your ATF in
> >> EL3 will want to talk to a microblaze firmware blob on the PMU.
> >>
> >> I only see a stand alone PMU machine for microblaze and a PMU IRQ
> >> handling I/O block in QEMU, but nothing that would listen to the events.
> >> So I'm fairly sure it will be broken after this patch - and really only
> >> worked by accident before.
> > Edgar submitted a power-control model patchset:
> >
> https://patchew.org/QEMU/20220203140141.310870-1-edgar.iglesias@gmail.com/
>
>
> Ah, nice. Would this also work for Versal?
>
>
> Thanks,
>
> Alex
>

Hi,

Both Versal and ZynqMP require MicroBlaze firmware to run the reference
implementations of Trusted Firmware. We never supported this in upstream
QEMU but we do support it with our fork (by running multiple QEMU instances
co-simulating).

Having said that, we do have tons of EL3 test-cases that we use to validate
QEMU that run with EL3 enabled in upstream.

So there's two user flows:
1. Direct boots using QEMUs builtin PSCI (Most users use this to run Linux,
Xen, U-boot, etc)
2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by
test-code)

Number #2 is the one affected here and that by accident used to have the
builtin PSCI support enabled but now requires more power control modelling
to keep working.
Unless I'm missing something, the -kernel boots will continue to use the
builtin PSCI implementation.

Cheers,
Edgar

--000000000000f93ba405d76f9501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 7, 2022 at 4:33 PM Alexan=
der Graf &lt;<a href=3D"mailto:agraf@csgraf.de">agraf@csgraf.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 07.02.22 16:22, Peter Maydell wrote:<br>
&gt; On Mon, 7 Feb 2022 at 14:21, Alexander Graf &lt;<a href=3D"mailto:agra=
f@csgraf.de" target=3D"_blank">agraf@csgraf.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 27.01.22 16:46, Peter Maydell wrote:<br>
&gt;&gt;&gt; Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the ne=
w<br>
&gt;&gt;&gt; boot.c functionality to allow us to enable psci-conduit only i=
f<br>
&gt;&gt;&gt; the guest is being booted in EL1 or EL2, so that if the user r=
uns<br>
&gt;&gt;&gt; guest EL3 firmware code our PSCI emulation doesn&#39;t get in =
its<br>
&gt;&gt;&gt; way.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To do this we stop setting the psci-conduit property on the CP=
U<br>
&gt;&gt;&gt; objects in the SoC code, and instead set the psci_conduit fiel=
d in<br>
&gt;&gt;&gt; the arm_boot_info struct to tell the common boot loader code t=
hat<br>
&gt;&gt;&gt; we&#39;d like PSCI if the guest is starting at an EL that it m=
akes<br>
&gt;&gt;&gt; sense with.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Note that this means that EL3 guest code will have no way<br>
&gt;&gt;&gt; to power on secondary cores, because we don&#39;t model any<br=
>
&gt;&gt;&gt; kind of power controller that does that on this SoC.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s been a while since I worked with ZynqMP, but typically yo=
ur ATF in<br>
&gt;&gt; EL3 will want to talk to a microblaze firmware blob on the PMU.<br=
>
&gt;&gt;<br>
&gt;&gt; I only see a stand alone PMU machine for microblaze and a PMU IRQ<=
br>
&gt;&gt; handling I/O block in QEMU, but nothing that would listen to the e=
vents.<br>
&gt;&gt; So I&#39;m fairly sure it will be broken after this patch - and re=
ally only<br>
&gt;&gt; worked by accident before.<br>
&gt; Edgar submitted a power-control model patchset:<br>
&gt; <a href=3D"https://patchew.org/QEMU/20220203140141.310870-1-edgar.igle=
sias@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/Q=
EMU/20220203140141.310870-1-edgar.iglesias@gmail.com/</a><br>
<br>
<br>
Ah, nice. Would this also work for Versal?<br>
<br>
<br>
Thanks,<br>
<br>
Alex<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>Both =
Versal and ZynqMP require MicroBlaze firmware to run the reference implemen=
tations of Trusted Firmware. We never supported this in upstream QEMU but w=
e do support it with our fork (by running multiple QEMU instances co-simula=
ting).</div><div><br></div><div>Having said that, we do have tons of EL3 te=
st-cases that we use to validate QEMU that run with EL3 enabled in upstream=
.</div><div><br></div><div>So there&#39;s two user flows:</div><div>1. Dire=
ct boots using QEMUs builtin PSCI (Most users use this to run Linux, Xen, U=
-boot, etc)</div><div>2. Firmware boot at EL3 without QEMUs builtin PSCI (M=
ostly used by test-code)</div><div><br></div><div>Number #2 is the one affe=
cted here and that by accident used to have the builtin PSCI support enable=
d but now requires more power control modelling to keep working.</div><div>=
Unless I&#39;m missing something, the -kernel boots will continue to use th=
e builtin PSCI implementation.</div><div><br></div><div>Cheers,</div><div>E=
dgar=C2=A0</div><div><br></div><div><br></div><div><br></div><div>=C2=A0</d=
iv></div></div>

--000000000000f93ba405d76f9501--

