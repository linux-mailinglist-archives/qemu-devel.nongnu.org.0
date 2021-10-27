Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFE43CBE1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:19:45 +0200 (CEST)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjmK-0006RC-D9
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfj0u-000785-0t
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:44 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfj0n-0008V7-0w
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:30:40 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r12so10558535edt.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivv5e8Ct9EGy+47yL5EN3IlgvgOILbFfdQf07TRahE8=;
 b=fy7IYg1j81PymoVT9hiTJVFsu7ET+OP6OhKILcaT+NGiWNc4vgbI6H3ajgX/NCQSDj
 j0cLrtdR1L0kwkrMSbmEoQ71riJyKcGqFmA0v9Rvj9T/Xfcp8AQappktK3QJYp86tYe4
 foRIvahbrTpW1zu9syHZvIPmw0UYnT5Muu6q1W4+BvE9mTDCJJ6fXWUUVHEbRGYAjAnH
 T+WyRXvO+2++YWA1Z+nsPnNCXMW1lt+WHEQNOwc0DBeeumzHP3sfevSwvM2Kkinky4S3
 5Leo4zydDS+kRywaM5dKbwHMAB6L/Muv1uJ/K9dVD2ZKb7FSYhzVRYeIQDBzvn6t3bOl
 wHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivv5e8Ct9EGy+47yL5EN3IlgvgOILbFfdQf07TRahE8=;
 b=ifYVnFuX6zpcxLwnjv+uEoCJEsrNA9IMelLwk8+ZRqGR3z/LwWJOk74Qfc+OkzmX64
 661yN2jF56GsKx01NyVp/+TFLNLNMm05oyIrh6cj581N7GaUi9Ik8zyVxQmD4I2Gt607
 9Y3sMg5U44UFz4zFRX8pYH8hmGvi7tzqOziCE87wll1oJP/gyJqgyK+taKlSIjsR3+E9
 I3epWu7KMna7wLBYPwbGA+74lZpoPp1HiQdUgXfTYoPL+5/WNXUoVmwi8pTvgooe5qF+
 t8lTlX97Phe0qks2iWcpPd3x91HLWdp00mKhOQlOrTiPa0HrPcVV5CsKRpQQvqQtNZIF
 /RBg==
X-Gm-Message-State: AOAM532LAmggjVJUDIpzNOgd09JAFpaGm/hJKrr4wLr5WfeQ+t/wrcz9
 DuhrJ1l8HgusbLnfFBi6HHik8aQPQ9JYG+EdJJDBXA==
X-Google-Smtp-Source: ABdhPJwHaCtHkstiYOgASWlrjAJPd+XhBqDgF9KhYuSNuYcLpBlMMmhlNg2mumbB08mt7EUKriDwNjs+LoNOWii/GLc=
X-Received: by 2002:aa7:dac9:: with SMTP id x9mr41173227eds.180.1635341429806; 
 Wed, 27 Oct 2021 06:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
In-Reply-To: <20211027125916.GS8284@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 15:30:18 +0200
Message-ID: <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000002b16905cf559980"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52e.google.com
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
 Stephen Warren <swarren@nvidia.com>,
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
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
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000002b16905cf559980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:

> On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > Hi Simon,
> >
> > A bit late to the party, sorry!
> >
> > [...]
> >
> > > >
> > > > I really want to see what the binary case looks like since we could
> then
> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we coul=
d
> > > > then also do a rpi_arm32_defconfig too.
> > > >
> > > > I want to see less device trees in U-Boot sources, if they can come
> > > > functionally correct from the hardware/our caller.
> > > >
> > > > And I'm not seeing how we make use of "U-Boot /config" if we also
> don't
> > > > use the device tree from build time at run time, ignoring the devic=
e
> > > > tree provided to us at run time by the caller.
> > >
> > > Firstly I should say that I find building firmware very messy and
> > > confusing these days. Lots of things to build and it's hard to find
> > > the instructions. It doesn't have to be that way, but if we carry on
> > > as we are, it will continue to be messy and in five years you will
> > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > objective here is to simplify things, bringing some consistency to th=
e
> > > different components. Binman was one effort there. I feel that puttin=
g
> > > at least the U-Boot house in order, in my role as devicetree
> > > maintainer (and as author of devicetree support in U-Boot back in
> > > 2011), is the next step.
> > >
> > > If we set things up correctly and agree on the bindings, devicetree
> > > can be the unifying configuration mechanism through the whole of
> > > firmware (except for very early bits) and into the OS, this will set
> > > us up very well to deal with the complexity that is coming.
> > >
> > > Anyway, here are the mental steps that I've gone through over the pas=
t
> > > two months:
> > >
> > > Step 1: At present, some people think U-Boot is not even allowed to
> > > have its own nodes/properties in the DT. It is an abuse of the
> > > devicetree standard, like the /chosen node but with less history. We
> > > should sacrifice efficiency, expedience and expandability on the alta=
r
> > > of 'devicetree is a hardware description'. How do we get over that
> > > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > > for its own purposes, as well as for booting the OS. I am not saying
> > > it always has to have those properties, but with existing features
> > > like verified boot, SPL as well as complex firmware images where
> > > U-Boot needs to be able to find things in the image, it is essential.
> > > So let's just assume that we need this everywhere, since we certainly
> > > need it in at least some places.
> > >
> > > (stop reading here if you disagree, because nothing below will make
> > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > OF_CONTROL :-)
> >
> > Having U-Boot keep it's *internal* config state in DTs is fine.  Adding
> > that to the DTs that are copied over from linux isn't imho.  There are
> > various reasons for that.  First of all syncing device trees is a huge
> pain
> > and that's probably one of the main reasons our DTs are out of sync for=
 a
> > large number of boards.
>
> This re-sync is only a pain because:
> 1. Some platforms have been modifying the core dts files LIKE THEY ARE
>    NOT SUPPOSED TO.
> 2. DTS files are getting closer to being the super stable API that has
>    been promised now that there's validation tools.
>
> Some SoCs, like stm32 are doing an amazing job and keeping things in
> sync, every release.  Others like NXP are violating rule #1.

With NXP commitment to SystemReady on some IMX8 boards, I think this is
changing,
at least for the SystemReady boards.

> Still
> others like some TI platforms get bit by #2 (I solved one of these, and
> need to cycle back to the one you and I talked about on IRC a while
> back, I bet it's another node name dash changed to underbar).
>
> > The point is this was fine in 2011 were we had SPL only,  but the reali=
ty
> > today is completely different.  There's previous stage boot loaders (an=
d
> > enough cases were vendors prefer those over SPL).  If that bootloader
> needs
> > to use it's own device tree for whatever reason,  imposing restrictions
> on
> > it wrt to the device tree it has to include,  and require them to have
> > knowledge of U-Boot and it's internal config mechanism makes no sense n=
ot
> > to mention it doesn't scale at all.
>
> If you are passing the full device tree around, a few more
> nodes/properties aren't going to make the situation worse.  If we're
> talking about a 60 kilobyte blob one more kilobyte isn't where we call
> the line, especially since if we wait another 6 months it'll be a 62
> kilobyte file coming in from Linux instead.
>
This is not about size but about firmware supply chain organization.

> > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > > have binman definitions, etc. So we need a way to overlay those thing=
s
> > > into the DT. We already support this for in-tree DTs, so IMO this is
> > > easy. Just require every board to have an in-tree DT. It helps with
> > > discoverability and documentation, anyway. That is this series.
> >
> > Again, the board might decide for it's own reason to provide it's own
> DT.
> > IMHO U-Boot must be able to cope with that and asking DTs to be include=
d
> in
> > U-Boot source is not the right way to do that,  not to mention cases we=
re
> > that's completely unrealistic (e.g QEMU or a board that reads the DTB
> from
> > it's flash).
> >
> > > (I think most of us are at the beginning of step 2, unsure about it
> > > and worried about step 3)
> > >
> > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > > flow only, or boards that sometimes use a flow) which need the DT to
> > > come from a prior stage. How to handle that? IMO that is only going t=
o
> > > grow as every man and his dog get into the write-a-bootloader
> > > business.
> >
> > And that's exactly why we have to come up with something that scales,
> without
> > having to add a bunch of unusable DTs in U-Boot.
>
> Both of these are solved by having our bindings reviewed and upstreamed
> and then what we need included in the authoritative dts files.
>
There shall be authoritative System Device Trees as vendors are working on.
Those System Device Trees cover all aspects of a board, not just the
Cortex-A part that U-Boot cares about.
Out of those system device trees, a tool (lopper) is going to carve out the
"authoritative dts for the cortex-A".
Essentially, that carve out will correspond to what would come out of Linux=
.
This scheme will not be generalized, just adopted by vendors on some
boards.
DT for those board become part of the OS ABI (meaning, the driver
developper is constrained).

>
> > > We need a way to provide the U-Boot nodes/properties in a
> > > form that the prior stage can consume and integrate with its build
> > > system. Is TF-A the only thing being discussed here? If so, let's jus=
t
> > > do it. We have the u-boot.dtsi and we can use binman to put the image
> > > together, for example. Or we can get clever and create some sort of
> > > overlay dtb.
> > >
> > > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> > > then it will need to build it in and use two devicetrees, one interna=
l
> > > and one from the prior stage....well that is not very efficient and i=
t
> > > is going to be confusing for people to figure out what U-Boot is
> > > actually doing. But we actually already do that in a lot of cases
> > > where U-Boot passes a DT to the kernel which is different to the one
> > > it uses. So perhaps we have three devicetrees? OMG.
> >
> > No we don't. That's a moot point. If you separate the DTs U-Boot
> > provides the internal one and inherits one 'generic'.  Linux will be
> able to use
> > that.  So the only case were you'll need 3 DTs is if the *vendor* break=
s
> the
> > DT across kernel versions,  In which case there's not much you can do t=
o
> > begin with and that's already a case we have to deal with.
> >
> > > b) Well then
> > > U-Boot can have its own small devicetree with its bits and then U-Boo=
t
> > > can merge the two when it starts. Again that is not very efficient. I=
t
> > > means that U-Boot cannot be controlled by the prior stage (e.g. to ge=
t
> > > its public key from there or to enable/disable the console), so
> > > unified firmware config is not possible. It will get very confusing,
> > > particularly for debugging U-Boot. c) Some other scheme to avoid
> > > accepting step 3...please stop!
> > >
> > > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> > > whole cloth. What about that? Well, we are just going to have to deal
> > > with that. We can easily merge in the U-Boot nodes/properties and
> > > update the U-Boot CI scripts to do this, as needed, e.g. with
> > > qemu-riscv64_spl. It's only one use case, although Xen might do
> > > something similar.
> > >
> > > To my mind, that deals with both the build-time and run-time issues.
> > > We have a discoverable DT in U-Boot, which should be considered the
> > > source of truth for most boards. We can sync it with Linux
> > > automatically with the tooling that I hope Rob Herring will come up
> > > with. We can use an empty one where there really is no default,
> > > although I'd argue that is making perfect an enemy of the good.
> > >
> > > Step 5: If we get clever and want to remove them from the U-Boot tree
> > > and pick them up from somewhere else, we can do that with sufficient
> > > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
> >
> > We can start slowly migrating boards and see how that works out.
> > We could either use 2 device trees as you proposed, or have u-boot merg=
e
> > the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'd
> prefer
> > if linux gets handed a clean device tree without the u-boot internals i=
n
> > it, so I think 2 discrete DTs is cleaner overall.
>
> Why does it matter if Linux sees some u-boot, properties?  If some huge
> stink is going to be thrown, we could probably prune them out at run
> time but it's already being passed N disabled nodes, yes?
>
> --
> Tom
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000002b16905cf559980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Tom,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 27 Oct 2021 at 14:59, Tom Rini &lt;<a=
 href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalod=
imas wrote:<br>
&gt; Hi Simon,<br>
&gt; <br>
&gt; A bit late to the party, sorry!<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I really want to see what the binary case looks like since w=
e could then<br>
&gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need to see if =
we could<br>
&gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I want to see less device trees in U-Boot sources, if they c=
an come<br>
&gt; &gt; &gt; functionally correct from the hardware/our caller.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And I&#39;m not seeing how we make use of &quot;U-Boot /conf=
ig&quot; if we also don&#39;t<br>
&gt; &gt; &gt; use the device tree from build time at run time, ignoring th=
e device<br>
&gt; &gt; &gt; tree provided to us at run time by the caller.<br>
&gt; &gt; <br>
&gt; &gt; Firstly I should say that I find building firmware very messy and=
<br>
&gt; &gt; confusing these days. Lots of things to build and it&#39;s hard t=
o find<br>
&gt; &gt; the instructions. It doesn&#39;t have to be that way, but if we c=
arry on<br>
&gt; &gt; as we are, it will continue to be messy and in five years you wil=
l<br>
&gt; &gt; need a Ph.D and a lucky charm to boot on any modern board. My<br>
&gt; &gt; objective here is to simplify things, bringing some consistency t=
o the<br>
&gt; &gt; different components. Binman was one effort there. I feel that pu=
tting<br>
&gt; &gt; at least the U-Boot house in order, in my role as devicetree<br>
&gt; &gt; maintainer (and as author of devicetree support in U-Boot back in=
<br>
&gt; &gt; 2011), is the next step.<br>
&gt; &gt; <br>
&gt; &gt; If we set things up correctly and agree on the bindings, devicetr=
ee<br>
&gt; &gt; can be the unifying configuration mechanism through the whole of<=
br>
&gt; &gt; firmware (except for very early bits) and into the OS, this will =
set<br>
&gt; &gt; us up very well to deal with the complexity that is coming.<br>
&gt; &gt; <br>
&gt; &gt; Anyway, here are the mental steps that I&#39;ve gone through over=
 the past<br>
&gt; &gt; two months:<br>
&gt; &gt; <br>
&gt; &gt; Step 1: At present, some people think U-Boot is not even allowed =
to<br>
&gt; &gt; have its own nodes/properties in the DT. It is an abuse of the<br=
>
&gt; &gt; devicetree standard, like the /chosen node but with less history.=
 We<br>
&gt; &gt; should sacrifice efficiency, expedience and expandability on the =
altar<br>
&gt; &gt; of &#39;devicetree is a hardware description&#39;. How do we get =
over that<br>
&gt; &gt; one? Wel, I just think we need to accept that U-Boot uses devicet=
ree<br>
&gt; &gt; for its own purposes, as well as for booting the OS. I am not say=
ing<br>
&gt; &gt; it always has to have those properties, but with existing feature=
s<br>
&gt; &gt; like verified boot, SPL as well as complex firmware images where<=
br>
&gt; &gt; U-Boot needs to be able to find things in the image, it is essent=
ial.<br>
&gt; &gt; So let&#39;s just assume that we need this everywhere, since we c=
ertainly<br>
&gt; &gt; need it in at least some places.<br>
&gt; &gt; <br>
&gt; &gt; (stop reading here if you disagree, because nothing below will ma=
ke<br>
&gt; &gt; any sense...you can still use U-Boot v2011.06 which doesn&#39;t h=
ave<br>
&gt; &gt; OF_CONTROL :-)<br>
&gt; <br>
&gt; Having U-Boot keep it&#39;s *internal* config state in DTs is fine.=C2=
=A0 Adding<br>
&gt; that to the DTs that are copied over from linux isn&#39;t imho.=C2=A0 =
There are<br>
&gt; various reasons for that.=C2=A0 First of all syncing device trees is a=
 huge pain<br>
&gt; and that&#39;s probably one of the main reasons our DTs are out of syn=
c for a<br>
&gt; large number of boards.<br>
<br>
This re-sync is only a pain because:<br>
1. Some platforms have been modifying the core dts files LIKE THEY ARE<br>
=C2=A0 =C2=A0NOT SUPPOSED TO.<br>
2. DTS files are getting closer to being the super stable API that has<br>
=C2=A0 =C2=A0been promised now that there&#39;s validation tools.<br>
<br>
Some SoCs, like stm32 are doing an amazing job and keeping things in<br>
sync, every release.=C2=A0 Others like NXP are violating rule #1.=C2=A0</bl=
ockquote><div>With NXP commitment to SystemReady on some IMX8 boards, I thi=
nk this is changing,=C2=A0</div><div>at least for the SystemReady boards.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex"> Still<br>
others like some TI platforms get bit by #2 (I solved one of these, and<br>
need to cycle back to the one you and I talked about on IRC a while<br>
back, I bet it&#39;s another node name dash changed to underbar).<br>
<br>
&gt; The point is this was fine in 2011 were we had SPL only,=C2=A0 but the=
 reality<br>
&gt; today is completely different.=C2=A0 There&#39;s previous stage boot l=
oaders (and<br>
&gt; enough cases were vendors prefer those over SPL).=C2=A0 If that bootlo=
ader needs<br>
&gt; to use it&#39;s own device tree for whatever reason,=C2=A0 imposing re=
strictions on<br>
&gt; it wrt to the device tree it has to include,=C2=A0 and require them to=
 have<br>
&gt; knowledge of U-Boot and it&#39;s internal config mechanism makes no se=
nse not<br>
&gt; to mention it doesn&#39;t scale at all.<br>
<br>
If you are passing the full device tree around, a few more<br>
nodes/properties aren&#39;t going to make the situation worse.=C2=A0 If we&=
#39;re<br>
talking about a 60 kilobyte blob one more kilobyte isn&#39;t where we call<=
br>
the line, especially since if we wait another 6 months it&#39;ll be a 62<br=
>
kilobyte file coming in from Linux instead.<br></blockquote><div>This is no=
t about size but about firmware supply chain organization.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">
&gt; &gt; Step 2: Assume U-Boot has its own nodes/properties. How do they g=
et<br>
&gt; &gt; there? Well, we have u-boot.dtsi files for that (the 2016 patch<b=
r>
&gt; &gt; &quot;6d427c6b1fa binman: Automatically include a U-Boot .dtsi fi=
le&quot;), we<br>
&gt; &gt; have binman definitions, etc. So we need a way to overlay those t=
hings<br>
&gt; &gt; into the DT. We already support this for in-tree DTs, so IMO this=
 is<br>
&gt; &gt; easy. Just require every board to have an in-tree DT. It helps wi=
th<br>
&gt; &gt; discoverability and documentation, anyway. That is this series.<b=
r>
&gt; <br>
&gt; Again, the board might decide for it&#39;s own reason to provide it&#3=
9;s own DT. <br>
&gt; IMHO U-Boot must be able to cope with that and asking DTs to be includ=
ed in<br>
&gt; U-Boot source is not the right way to do that,=C2=A0 not to mention ca=
ses were<br>
&gt; that&#39;s completely unrealistic (e.g QEMU or a board that reads the =
DTB from<br>
&gt; it&#39;s flash).<br>
&gt; <br>
&gt; &gt; (I think most of us are at the beginning of step 2, unsure about =
it<br>
&gt; &gt; and worried about step 3)<br>
&gt; &gt; <br>
&gt; &gt; Step 3: Ah, but there are flows (i.e. boards that use a particula=
r<br>
&gt; &gt; flow only, or boards that sometimes use a flow) which need the DT=
 to<br>
&gt; &gt; come from a prior stage. How to handle that? IMO that is only goi=
ng to<br>
&gt; &gt; grow as every man and his dog get into the write-a-bootloader<br>
&gt; &gt; business.<br>
&gt; <br>
&gt; And that&#39;s exactly why we have to come up with something that scal=
es,=C2=A0 without<br>
&gt; having to add a bunch of unusable DTs in U-Boot.<br>
<br>
Both of these are solved by having our bindings reviewed and upstreamed<br>
and then what we need included in the authoritative dts files.<br></blockqu=
ote><div>There shall be authoritative System Device Trees as vendors are wo=
rking on.</div><div>Those System Device Trees cover all aspects of a board,=
 not just the Cortex-A part that U-Boot cares about.</div><div>Out of those=
 system device trees, a tool (lopper) is going to carve out the &quot;autho=
ritative dts for the cortex-A&quot;.</div><div>Essentially, that carve out =
will correspond to what would come out of Linux.</div><div>This scheme will=
 not be generalized, just adopted by vendors on some boards.=C2=A0</div><di=
v>DT for those board become part of the OS ABI (meaning, the driver develop=
per is constrained).</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; We need a way to provide the U-Boot nodes/properties in a<br>
&gt; &gt; form that the prior stage can consume and integrate with its buil=
d<br>
&gt; &gt; system. Is TF-A the only thing being discussed here? If so, let&#=
39;s just<br>
&gt; &gt; do it. We have the u-boot.dtsi and we can use binman to put the i=
mage<br>
&gt; &gt; together, for example. Or we can get clever and create some sort =
of<br>
&gt; &gt; overlay dtb.<br>
&gt; &gt; <br>
&gt; &gt; Step 3a. But I don&#39;t want to do that. a) If U-Boot needs this=
 stuff<br>
&gt; &gt; then it will need to build it in and use two devicetrees, one int=
ernal<br>
&gt; &gt; and one from the prior stage....well that is not very efficient a=
nd it<br>
&gt; &gt; is going to be confusing for people to figure out what U-Boot is<=
br>
&gt; &gt; actually doing. But we actually already do that in a lot of cases=
<br>
&gt; &gt; where U-Boot passes a DT to the kernel which is different to the =
one<br>
&gt; &gt; it uses. So perhaps we have three devicetrees? OMG. <br>
&gt; <br>
&gt; No we don&#39;t. That&#39;s a moot point. If you separate the DTs U-Bo=
ot<br>
&gt; provides the internal one and inherits one &#39;generic&#39;.=C2=A0 Li=
nux will be able to use<br>
&gt; that.=C2=A0 So the only case were you&#39;ll need 3 DTs is if the *ven=
dor* breaks the<br>
&gt; DT across kernel versions,=C2=A0 In which case there&#39;s not much yo=
u can do to<br>
&gt; begin with and that&#39;s already a case we have to deal with.<br>
&gt; <br>
&gt; &gt; b) Well then<br>
&gt; &gt; U-Boot can have its own small devicetree with its bits and then U=
-Boot<br>
&gt; &gt; can merge the two when it starts. Again that is not very efficien=
t. It<br>
&gt; &gt; means that U-Boot cannot be controlled by the prior stage (e.g. t=
o get<br>
&gt; &gt; its public key from there or to enable/disable the console), so<b=
r>
&gt; &gt; unified firmware config is not possible. It will get very confusi=
ng,<br>
&gt; &gt; particularly for debugging U-Boot. c) Some other scheme to avoid<=
br>
&gt; &gt; accepting step 3...please stop!<br>
&gt; &gt; <br>
&gt; &gt; Step 4: Yes, but there is QEMU, which makes the devicetree up out=
 of<br>
&gt; &gt; whole cloth. What about that? Well, we are just going to have to =
deal<br>
&gt; &gt; with that. We can easily merge in the U-Boot nodes/properties and=
<br>
&gt; &gt; update the U-Boot CI scripts to do this, as needed, e.g. with<br>
&gt; &gt; qemu-riscv64_spl. It&#39;s only one use case, although Xen might =
do<br>
&gt; &gt; something similar.<br>
&gt; &gt; <br>
&gt; &gt; To my mind, that deals with both the build-time and run-time issu=
es.<br>
&gt; &gt; We have a discoverable DT in U-Boot, which should be considered t=
he<br>
&gt; &gt; source of truth for most boards. We can sync it with Linux<br>
&gt; &gt; automatically with the tooling that I hope Rob Herring will come =
up<br>
&gt; &gt; with. We can use an empty one where there really is no default,<b=
r>
&gt; &gt; although I&#39;d argue that is making perfect an enemy of the goo=
d.<br>
&gt; &gt; <br>
&gt; &gt; Step 5: If we get clever and want to remove them from the U-Boot =
tree<br>
&gt; &gt; and pick them up from somewhere else, we can do that with suffici=
ent<br>
&gt; &gt; tooling. Perhaps we should set a timeline for that? A year? Two? =
Six?<br>
&gt; <br>
&gt; We can start slowly migrating boards and see how that works out.<br>
&gt; We could either use 2 device trees as you proposed, or have u-boot mer=
ge<br>
&gt; the &#39;u-boot&#39; DTB and the inherited DTB before DM comes up.=C2=
=A0 OTOH I&#39;d prefer<br>
&gt; if linux gets handed a clean device tree without the u-boot internals =
in<br>
&gt; it, so I think 2 discrete DTs is cleaner overall.<br>
<br>
Why does it matter if Linux sees some u-boot, properties?=C2=A0 If some hug=
e<br>
stink is going to be thrown, we could probably prune them out at run<br>
time but it&#39;s already being passed N disabled nodes, yes?<br>
<br>
-- <br>
Tom<br>
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

--00000000000002b16905cf559980--

