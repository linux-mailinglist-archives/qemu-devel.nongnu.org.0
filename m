Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCB43CBE6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:19:47 +0200 (CEST)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjmM-0006UN-Ed
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfjIu-0001rN-Dc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:49:22 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfjIp-0006zx-BS
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:49:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id s1so10875278edd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TNkaOV0DzD5rnDAXa8zTt+CK6eEesLlpf0RiM13toNQ=;
 b=NVhxfuFH4+BcMxtcHkXx0cVpCH4NcWdmkA6viuJnEoowcHqOMFTFvLZqxBIuaAj+mq
 1U19mdUtAmKTh/2OSf5TriEveYfHR0RV7GRjxHyzEv3WwS92raXn+vSmH4DUk3UaMljS
 haA0vp+KY63PEDJX/XjVGdrTZjvRDDFC7lOPRy7wUYZh8CQO26rQ2IbI25sbT7Uk8NNI
 q4YvnWZZZ3ZX74NlWfIZrm6S/E/aHfKeSwa1JB7ZWxqWfzJtQXnxlH2/hFZGTmluuW+5
 ZFYKk0R+7Bq/shEuDzu/NEU7RgOjt2QqUiv+X+pAF2piseQV90g9SZNL+/LPYHLmzq9u
 HQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TNkaOV0DzD5rnDAXa8zTt+CK6eEesLlpf0RiM13toNQ=;
 b=FWt+Xm1JZ14IF4jbMs4MyNLjyl6UD7pszTXl5McboolgQR8CU3kAkTz2YvFVnHE2Lo
 5IKsodoQehLkyeG80tsYykiBaTT3GaS209eF7Nigtvt/B824m5x9UMsO9vVHBVWtCA6q
 WeyBAcHyopln/LR76tInrkXDqvcqM4HdBnP1Q0pJ/QQT24cYg62/iE6IOanxq4BPuI+b
 Eh7KBB+jLN8SjDzCYJKVUdDrrGBVaAuMMhloSJHHkiyABon3f2NOC5OD1a+ld+5swxQN
 da8umpgyXHhRXmz5SC68B+EPft6pAvoeUGzbDVY9Evta2wPQlQLE2hFG6we5iHRZjBxY
 vn1w==
X-Gm-Message-State: AOAM533F7E9mAAzUMBA6Jow0xhrYaiyqJ06iDGJ4515oWoO4q8EKdC43
 q79j+6CiBVv9MANYv4cD2GPA+JKtJCrjn/JJtRG1cQ==
X-Google-Smtp-Source: ABdhPJy3BGVg0eO+23V9zyp//ZBpNWR69jZSZGzohxs7SnGqUw/R42lCY+4SiR0GT9vYHoT83VHz0s9tftsJTrRu2XI=
X-Received: by 2002:a05:6402:4250:: with SMTP id
 g16mr44015965edb.26.1635342540085; 
 Wed, 27 Oct 2021 06:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
 <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
 <20211027133840.GV8284@bill-the-cat>
In-Reply-To: <20211027133840.GV8284@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 27 Oct 2021 15:48:48 +0200
Message-ID: <CAHFG_=Vnpj1T_rqaxnHFTz4H4wiw_ziUJP0VudFS4WBUOb0i6w@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000030364b05cf55dbd5"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x536.google.com
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

--00000000000030364b05cf55dbd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 27 Oct 2021 at 15:38, Tom Rini <trini@konsulko.com> wrote:

> On Wed, Oct 27, 2021 at 03:30:18PM +0200, Fran=C3=A7ois Ozog wrote:
> > Hi Tom,
> >
> > On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > > > Hi Simon,
> > > >
> > > > A bit late to the party, sorry!
> > > >
> > > > [...]
> > > >
> > > > > >
> > > > > > I really want to see what the binary case looks like since we
> could
> > > then
> > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
> could
> > > > > > then also do a rpi_arm32_defconfig too.
> > > > > >
> > > > > > I want to see less device trees in U-Boot sources, if they can
> come
> > > > > > functionally correct from the hardware/our caller.
> > > > > >
> > > > > > And I'm not seeing how we make use of "U-Boot /config" if we al=
so
> > > don't
> > > > > > use the device tree from build time at run time, ignoring the
> device
> > > > > > tree provided to us at run time by the caller.
> > > > >
> > > > > Firstly I should say that I find building firmware very messy and
> > > > > confusing these days. Lots of things to build and it's hard to fi=
nd
> > > > > the instructions. It doesn't have to be that way, but if we carry
> on
> > > > > as we are, it will continue to be messy and in five years you wil=
l
> > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > objective here is to simplify things, bringing some consistency t=
o
> the
> > > > > different components. Binman was one effort there. I feel that
> putting
> > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > > 2011), is the next step.
> > > > >
> > > > > If we set things up correctly and agree on the bindings, devicetr=
ee
> > > > > can be the unifying configuration mechanism through the whole of
> > > > > firmware (except for very early bits) and into the OS, this will
> set
> > > > > us up very well to deal with the complexity that is coming.
> > > > >
> > > > > Anyway, here are the mental steps that I've gone through over the
> past
> > > > > two months:
> > > > >
> > > > > Step 1: At present, some people think U-Boot is not even allowed =
to
> > > > > have its own nodes/properties in the DT. It is an abuse of the
> > > > > devicetree standard, like the /chosen node but with less history.
> We
> > > > > should sacrifice efficiency, expedience and expandability on the
> altar
> > > > > of 'devicetree is a hardware description'. How do we get over tha=
t
> > > > > one? Wel, I just think we need to accept that U-Boot uses
> devicetree
> > > > > for its own purposes, as well as for booting the OS. I am not
> saying
> > > > > it always has to have those properties, but with existing feature=
s
> > > > > like verified boot, SPL as well as complex firmware images where
> > > > > U-Boot needs to be able to find things in the image, it is
> essential.
> > > > > So let's just assume that we need this everywhere, since we
> certainly
> > > > > need it in at least some places.
> > > > >
> > > > > (stop reading here if you disagree, because nothing below will ma=
ke
> > > > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > > > OF_CONTROL :-)
> > > >
> > > > Having U-Boot keep it's *internal* config state in DTs is fine.
> Adding
> > > > that to the DTs that are copied over from linux isn't imho.  There
> are
> > > > various reasons for that.  First of all syncing device trees is a
> huge
> > > pain
> > > > and that's probably one of the main reasons our DTs are out of sync
> for a
> > > > large number of boards.
> > >
> > > This re-sync is only a pain because:
> > > 1. Some platforms have been modifying the core dts files LIKE THEY AR=
E
> > >    NOT SUPPOSED TO.
> > > 2. DTS files are getting closer to being the super stable API that ha=
s
> > >    been promised now that there's validation tools.
> > >
> > > Some SoCs, like stm32 are doing an amazing job and keeping things in
> > > sync, every release.  Others like NXP are violating rule #1.
> >
> > With NXP commitment to SystemReady on some IMX8 boards, I think this is
> > changing,
> > at least for the SystemReady boards.
>
> I'd really like to see some progress (as would the other non-NXP folks
> working on NXP SoCs) in that regard.
>
> > > Still
> > > others like some TI platforms get bit by #2 (I solved one of these, a=
nd
> > > need to cycle back to the one you and I talked about on IRC a while
> > > back, I bet it's another node name dash changed to underbar).
> > >
> > > > The point is this was fine in 2011 were we had SPL only,  but the
> reality
> > > > today is completely different.  There's previous stage boot loaders
> (and
> > > > enough cases were vendors prefer those over SPL).  If that bootload=
er
> > > needs
> > > > to use it's own device tree for whatever reason,  imposing
> restrictions
> > > on
> > > > it wrt to the device tree it has to include,  and require them to
> have
> > > > knowledge of U-Boot and it's internal config mechanism makes no
> sense not
> > > > to mention it doesn't scale at all.
> > >
> > > If you are passing the full device tree around, a few more
> > > nodes/properties aren't going to make the situation worse.  If we're
> > > talking about a 60 kilobyte blob one more kilobyte isn't where we cal=
l
> > > the line, especially since if we wait another 6 months it'll be a 62
> > > kilobyte file coming in from Linux instead.
> >
> > This is not about size but about firmware supply chain organization.
>
> That's great since it means we just need the bindings reviewed then
> everyone can pass whatever everyone else needs.
>
> > > > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"),
> we
> > > > > have binman definitions, etc. So we need a way to overlay those
> things
> > > > > into the DT. We already support this for in-tree DTs, so IMO this
> is
> > > > > easy. Just require every board to have an in-tree DT. It helps wi=
th
> > > > > discoverability and documentation, anyway. That is this series.
> > > >
> > > > Again, the board might decide for it's own reason to provide it's o=
wn
> > > DT.
> > > > IMHO U-Boot must be able to cope with that and asking DTs to be
> included
> > > in
> > > > U-Boot source is not the right way to do that,  not to mention case=
s
> were
> > > > that's completely unrealistic (e.g QEMU or a board that reads the D=
TB
> > > from
> > > > it's flash).
> > > >
> > > > > (I think most of us are at the beginning of step 2, unsure about =
it
> > > > > and worried about step 3)
> > > > >
> > > > > Step 3: Ah, but there are flows (i.e. boards that use a particula=
r
> > > > > flow only, or boards that sometimes use a flow) which need the DT
> to
> > > > > come from a prior stage. How to handle that? IMO that is only
> going to
> > > > > grow as every man and his dog get into the write-a-bootloader
> > > > > business.
> > > >
> > > > And that's exactly why we have to come up with something that scale=
s,
> > > without
> > > > having to add a bunch of unusable DTs in U-Boot.
> > >
> > > Both of these are solved by having our bindings reviewed and upstream=
ed
> > > and then what we need included in the authoritative dts files.
> > >
> > There shall be authoritative System Device Trees as vendors are working
> on.
> > Those System Device Trees cover all aspects of a board, not just the
> > Cortex-A part that U-Boot cares about.
> > Out of those system device trees, a tool (lopper) is going to carve out
> the
> > "authoritative dts for the cortex-A".
> > Essentially, that carve out will correspond to what would come out of
> Linux.
>
> s/Linux/software/
>
> > This scheme will not be generalized, just adopted by vendors on some
> > boards.
> > DT for those board become part of the OS ABI (meaning, the driver
> > developper is constrained).
>
> OK?  And is going to pick and choose which valid bindings to implement?
> Or is it going to provide half a node for Linux?  No?  I assume no.  So
> it will also provide whatever bindings we've upstreamed and say need to
> be passed.
>
Until we can agree on a better scheme, Linux will server as the basis for
most of the bindings.
Some projects, like TF-A maintain their own bindings specifications. I
guess U-Boot shall do the same.
The U-Boot DT (for properties or whatever purpose) can be stored in a
various of U-Boot decided ways and as part of the TF-A FIP image in the
ad-hoc section: NT_FW_CONFIG. Passing FIP information to U-Boot to retrieve
the NF_FW_CONFIG should be part of the blob_list discussion that started a
while ago.
For System Device Tree, the bindings and the master repo will be maintained
in devicetree.org (AFAIK).

>
> --
> Tom
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000030364b05cf55dbd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 27 Oct 2021 at 15:38, Tom Rin=
i &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">On Wed, Oct 27, 2021 at 03:30:18PM +0200, Fran=
=C3=A7ois Ozog wrote:<br>
&gt; Hi Tom,<br>
&gt; <br>
&gt; On Wed, 27 Oct 2021 at 14:59, Tom Rini &lt;<a href=3D"mailto:trini@kon=
sulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:=
<br>
&gt; &gt; &gt; Hi Simon,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A bit late to the party, sorry!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [...]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I really want to see what the binary case looks li=
ke since we could<br>
&gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need =
to see if we could<br>
&gt; &gt; &gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I want to see less device trees in U-Boot sources,=
 if they can come<br>
&gt; &gt; &gt; &gt; &gt; functionally correct from the hardware/our caller.=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; And I&#39;m not seeing how we make use of &quot;U-=
Boot /config&quot; if we also<br>
&gt; &gt; don&#39;t<br>
&gt; &gt; &gt; &gt; &gt; use the device tree from build time at run time, i=
gnoring the device<br>
&gt; &gt; &gt; &gt; &gt; tree provided to us at run time by the caller.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Firstly I should say that I find building firmware very=
 messy and<br>
&gt; &gt; &gt; &gt; confusing these days. Lots of things to build and it&#3=
9;s hard to find<br>
&gt; &gt; &gt; &gt; the instructions. It doesn&#39;t have to be that way, b=
ut if we carry on<br>
&gt; &gt; &gt; &gt; as we are, it will continue to be messy and in five yea=
rs you will<br>
&gt; &gt; &gt; &gt; need a Ph.D and a lucky charm to boot on any modern boa=
rd. My<br>
&gt; &gt; &gt; &gt; objective here is to simplify things, bringing some con=
sistency to the<br>
&gt; &gt; &gt; &gt; different components. Binman was one effort there. I fe=
el that putting<br>
&gt; &gt; &gt; &gt; at least the U-Boot house in order, in my role as devic=
etree<br>
&gt; &gt; &gt; &gt; maintainer (and as author of devicetree support in U-Bo=
ot back in<br>
&gt; &gt; &gt; &gt; 2011), is the next step.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; If we set things up correctly and agree on the bindings=
, devicetree<br>
&gt; &gt; &gt; &gt; can be the unifying configuration mechanism through the=
 whole of<br>
&gt; &gt; &gt; &gt; firmware (except for very early bits) and into the OS, =
this will set<br>
&gt; &gt; &gt; &gt; us up very well to deal with the complexity that is com=
ing.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Anyway, here are the mental steps that I&#39;ve gone th=
rough over the past<br>
&gt; &gt; &gt; &gt; two months:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Step 1: At present, some people think U-Boot is not eve=
n allowed to<br>
&gt; &gt; &gt; &gt; have its own nodes/properties in the DT. It is an abuse=
 of the<br>
&gt; &gt; &gt; &gt; devicetree standard, like the /chosen node but with les=
s history. We<br>
&gt; &gt; &gt; &gt; should sacrifice efficiency, expedience and expandabili=
ty on the altar<br>
&gt; &gt; &gt; &gt; of &#39;devicetree is a hardware description&#39;. How =
do we get over that<br>
&gt; &gt; &gt; &gt; one? Wel, I just think we need to accept that U-Boot us=
es devicetree<br>
&gt; &gt; &gt; &gt; for its own purposes, as well as for booting the OS. I =
am not saying<br>
&gt; &gt; &gt; &gt; it always has to have those properties, but with existi=
ng features<br>
&gt; &gt; &gt; &gt; like verified boot, SPL as well as complex firmware ima=
ges where<br>
&gt; &gt; &gt; &gt; U-Boot needs to be able to find things in the image, it=
 is essential.<br>
&gt; &gt; &gt; &gt; So let&#39;s just assume that we need this everywhere, =
since we certainly<br>
&gt; &gt; &gt; &gt; need it in at least some places.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; (stop reading here if you disagree, because nothing bel=
ow will make<br>
&gt; &gt; &gt; &gt; any sense...you can still use U-Boot v2011.06 which doe=
sn&#39;t have<br>
&gt; &gt; &gt; &gt; OF_CONTROL :-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Having U-Boot keep it&#39;s *internal* config state in DTs i=
s fine.=C2=A0 Adding<br>
&gt; &gt; &gt; that to the DTs that are copied over from linux isn&#39;t im=
ho.=C2=A0 There are<br>
&gt; &gt; &gt; various reasons for that.=C2=A0 First of all syncing device =
trees is a huge<br>
&gt; &gt; pain<br>
&gt; &gt; &gt; and that&#39;s probably one of the main reasons our DTs are =
out of sync for a<br>
&gt; &gt; &gt; large number of boards.<br>
&gt; &gt;<br>
&gt; &gt; This re-sync is only a pain because:<br>
&gt; &gt; 1. Some platforms have been modifying the core dts files LIKE THE=
Y ARE<br>
&gt; &gt;=C2=A0 =C2=A0 NOT SUPPOSED TO.<br>
&gt; &gt; 2. DTS files are getting closer to being the super stable API tha=
t has<br>
&gt; &gt;=C2=A0 =C2=A0 been promised now that there&#39;s validation tools.=
<br>
&gt; &gt;<br>
&gt; &gt; Some SoCs, like stm32 are doing an amazing job and keeping things=
 in<br>
&gt; &gt; sync, every release.=C2=A0 Others like NXP are violating rule #1.=
<br>
&gt; <br>
&gt; With NXP commitment to SystemReady on some IMX8 boards, I think this i=
s<br>
&gt; changing,<br>
&gt; at least for the SystemReady boards.<br>
<br>
I&#39;d really like to see some progress (as would the other non-NXP folks<=
br>
working on NXP SoCs) in that regard.<br>
<br>
&gt; &gt; Still<br>
&gt; &gt; others like some TI platforms get bit by #2 (I solved one of thes=
e, and<br>
&gt; &gt; need to cycle back to the one you and I talked about on IRC a whi=
le<br>
&gt; &gt; back, I bet it&#39;s another node name dash changed to underbar).=
<br>
&gt; &gt;<br>
&gt; &gt; &gt; The point is this was fine in 2011 were we had SPL only,=C2=
=A0 but the reality<br>
&gt; &gt; &gt; today is completely different.=C2=A0 There&#39;s previous st=
age boot loaders (and<br>
&gt; &gt; &gt; enough cases were vendors prefer those over SPL).=C2=A0 If t=
hat bootloader<br>
&gt; &gt; needs<br>
&gt; &gt; &gt; to use it&#39;s own device tree for whatever reason,=C2=A0 i=
mposing restrictions<br>
&gt; &gt; on<br>
&gt; &gt; &gt; it wrt to the device tree it has to include,=C2=A0 and requi=
re them to have<br>
&gt; &gt; &gt; knowledge of U-Boot and it&#39;s internal config mechanism m=
akes no sense not<br>
&gt; &gt; &gt; to mention it doesn&#39;t scale at all.<br>
&gt; &gt;<br>
&gt; &gt; If you are passing the full device tree around, a few more<br>
&gt; &gt; nodes/properties aren&#39;t going to make the situation worse.=C2=
=A0 If we&#39;re<br>
&gt; &gt; talking about a 60 kilobyte blob one more kilobyte isn&#39;t wher=
e we call<br>
&gt; &gt; the line, especially since if we wait another 6 months it&#39;ll =
be a 62<br>
&gt; &gt; kilobyte file coming in from Linux instead.<br>
&gt;<br>
&gt; This is not about size but about firmware supply chain organization.<b=
r>
<br>
That&#39;s great since it means we just need the bindings reviewed then<br>
everyone can pass whatever everyone else needs.<br>
<br>
&gt; &gt; &gt; Step 2: Assume U-Boot has its own nodes/properties. How do t=
hey get<br>
&gt; &gt; &gt; &gt; there? Well, we have u-boot.dtsi files for that (the 20=
16 patch<br>
&gt; &gt; &gt; &gt; &quot;6d427c6b1fa binman: Automatically include a U-Boo=
t .dtsi file&quot;), we<br>
&gt; &gt; &gt; &gt; have binman definitions, etc. So we need a way to overl=
ay those things<br>
&gt; &gt; &gt; &gt; into the DT. We already support this for in-tree DTs, s=
o IMO this is<br>
&gt; &gt; &gt; &gt; easy. Just require every board to have an in-tree DT. I=
t helps with<br>
&gt; &gt; &gt; &gt; discoverability and documentation, anyway. That is this=
 series.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Again, the board might decide for it&#39;s own reason to pro=
vide it&#39;s own<br>
&gt; &gt; DT.<br>
&gt; &gt; &gt; IMHO U-Boot must be able to cope with that and asking DTs to=
 be included<br>
&gt; &gt; in<br>
&gt; &gt; &gt; U-Boot source is not the right way to do that,=C2=A0 not to =
mention cases were<br>
&gt; &gt; &gt; that&#39;s completely unrealistic (e.g QEMU or a board that =
reads the DTB<br>
&gt; &gt; from<br>
&gt; &gt; &gt; it&#39;s flash).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; (I think most of us are at the beginning of step 2, uns=
ure about it<br>
&gt; &gt; &gt; &gt; and worried about step 3)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Step 3: Ah, but there are flows (i.e. boards that use a=
 particular<br>
&gt; &gt; &gt; &gt; flow only, or boards that sometimes use a flow) which n=
eed the DT to<br>
&gt; &gt; &gt; &gt; come from a prior stage. How to handle that? IMO that i=
s only going to<br>
&gt; &gt; &gt; &gt; grow as every man and his dog get into the write-a-boot=
loader<br>
&gt; &gt; &gt; &gt; business.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And that&#39;s exactly why we have to come up with something=
 that scales,<br>
&gt; &gt; without<br>
&gt; &gt; &gt; having to add a bunch of unusable DTs in U-Boot.<br>
&gt; &gt;<br>
&gt; &gt; Both of these are solved by having our bindings reviewed and upst=
reamed<br>
&gt; &gt; and then what we need included in the authoritative dts files.<br=
>
&gt; &gt;<br>
&gt; There shall be authoritative System Device Trees as vendors are workin=
g on.<br>
&gt; Those System Device Trees cover all aspects of a board, not just the<b=
r>
&gt; Cortex-A part that U-Boot cares about.<br>
&gt; Out of those system device trees, a tool (lopper) is going to carve ou=
t the<br>
&gt; &quot;authoritative dts for the cortex-A&quot;.<br>
&gt; Essentially, that carve out will correspond to what would come out of =
Linux.<br>
<br>
s/Linux/software/<br>
<br>
&gt; This scheme will not be generalized, just adopted by vendors on some<b=
r>
&gt; boards.<br>
&gt; DT for those board become part of the OS ABI (meaning, the driver<br>
&gt; developper is constrained).<br>
<br>
OK?=C2=A0 And is going to pick and choose which valid bindings to implement=
?<br>
Or is it going to provide half a node for Linux?=C2=A0 No?=C2=A0 I assume n=
o.=C2=A0 So<br>
it will also provide whatever bindings we&#39;ve upstreamed and say need to=
<br>
be passed.<br></blockquote><div>Until we can agree on a better scheme, Linu=
x will server as the basis for most of the bindings.</div><div>Some project=
s, like TF-A maintain their own bindings specifications. I guess U-Boot sha=
ll do the same.</div><div>The U-Boot DT (for properties or whatever purpose=
) can be stored in a various of U-Boot decided ways and as part of the TF-A=
 FIP image in the ad-hoc section: NT_FW_CONFIG. Passing FIP information to =
U-Boot to retrieve the NF_FW_CONFIG should be part of the blob_list discuss=
ion that started a while ago.</div><div>For System Device Tree, the binding=
s and the master repo will be maintained in <a href=3D"http://devicetree.or=
g">devicetree.org</a> (AFAIK).</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">
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

--00000000000030364b05cf55dbd5--

