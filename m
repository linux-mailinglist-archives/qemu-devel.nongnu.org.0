Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22A43E447
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:53:03 +0200 (CEST)
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6m6-0002S2-N6
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg6jj-0007dt-Mq
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:50:36 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg6je-00030N-3a
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:50:34 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w15so26027320edc.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aZpG2ZOzVhduLQ/FfQPCtOcCQ2/0KhJRBOn1tdtUC3A=;
 b=Req757fx1+prMIH3gPfKt+IcXpkEghWernAO77uCpbad9eANMeY2QYlS5Ul+0oONvG
 QNube2636EiNdAbOeKTgtYz50MUg7diEI90IrHfgJosQCEER4GK5Ie6sc7bu27wmCu2R
 VHY8vdLlfDGS7WU+ICPjHypMtZpkkd+tcivkV1gjFwNXzZihIyZ9n2bLUodEGN9aefDN
 9OGQXQ7VxLDKae1wvV2qEeu0pdHCA0K8ZSLs5Y75b+Cz4NVgRe1tqV7wn8XHCJqLyM2+
 ULbgrWdqL5Baa5bb4vUh5odvsokm6egTWioLhEdsw3pVbH3iPGFixl7318ktmx0mBizh
 5QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aZpG2ZOzVhduLQ/FfQPCtOcCQ2/0KhJRBOn1tdtUC3A=;
 b=mAWoweqSFG1u/D9YWT5L2cOaCvVnzkUSe70Oyg3VA0y9aEiHdPs5rISm6u/OyIS4Z2
 +1QWm5bEG5fCnUOkH5+Fn8gRCiYb1Xp4nWWK2SGwjdl/b8RQHo8kydemkzxOhZcIVGqf
 KmYlfa49kx9Bw5d/1BoFgBsqJ+UzEYj1WukDg0Kjxlplizut1cAxO3TvTpZto34XCzd2
 mZ5/JYX6ZPz+Z8PkgdGV5sctZUJ2JsFojU1aRrsZTcGMu/LI7JnLSYodyPTdoFH7psht
 pixwR7zjj+BiVhYt4JHX+G9Vdxd8SbpDqgiBmhpzpJfVhYWTwnAeyzJvUwjckG2nspGO
 8uCQ==
X-Gm-Message-State: AOAM531swsylwtZG/ng2S9qIEt4K/LrpqI0IDxzcPMdbSYapWoc+t0+E
 w52+7NhGuRI6whO2M3VGYLq9Ff4CGSG5H1meRDwByA==
X-Google-Smtp-Source: ABdhPJzs6gW6ewaxhrYJ0HypMuVsgA3j+HWXjY0wvmeRV4THkrRIyJ0FR0UNj0RKbxEqX+oXuVeFgM9aBE277LCqZDE=
X-Received: by 2002:a17:907:7803:: with SMTP id
 la3mr6069658ejc.235.1635432624957; 
 Thu, 28 Oct 2021 07:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home>
 <CAPnjgZ3gQJz2YLhGuj-8RBok7ijc9s-vg2Q2ZDyQx71QfpWd5g@mail.gmail.com>
 <CAHFG_=XivFRi-quuMkExT9XOt3EsJ6T9TJ5MiV7cQwCj3OuK7A@mail.gmail.com>
 <CAPnjgZ0jfpFcbC6HNbWhP8kK531ePzBro2Jn8Fi==GgcWAej6Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ0jfpFcbC6HNbWhP8kK531ePzBro2Jn8Fi==GgcWAej6Q@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 28 Oct 2021 16:50:13 +0200
Message-ID: <CAHFG_=XgiqEZch2p+ZdBuGUfW9L6_+06kpakbvKcNsk7Gn6SOw@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000aa498105cf6ad461"
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
Cc: Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
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
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
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

--000000000000aa498105cf6ad461
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le jeu. 28 oct. 2021 =C3=A0 16:30, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Fran=C3=A7ois,
>
> On Thu, 28 Oct 2021 at 02:21, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> > Hi Simon,
> >
> > Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Ilias,
> >>
> >> On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
> >> <ilias.apalodimas@linaro.org> wrote:
> >> >
> >> > Hi Simon,
> >> >
> >> > A bit late to the party, sorry!
> >>
> >> (Did you remember the beer? I am replying to this but I don't think it
> >> is all that helpful for me to reply to a lot of things on this thread,
> >> since I would not be adding much to my cover letter and patches)
> >>
> >> >
> >> > [...]
> >> >
> >> > > >
> >> > > > I really want to see what the binary case looks like since we
> could then
> >> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
> could
> >> > > > then also do a rpi_arm32_defconfig too.
> >> > > >
> >> > > > I want to see less device trees in U-Boot sources, if they can
> come
> >> > > > functionally correct from the hardware/our caller.
> >> > > >
> >> > > > And I'm not seeing how we make use of "U-Boot /config" if we als=
o
> don't
> >> > > > use the device tree from build time at run time, ignoring the
> device
> >> > > > tree provided to us at run time by the caller.
> >> > >
> >> > > Firstly I should say that I find building firmware very messy and
> >> > > confusing these days. Lots of things to build and it's hard to fin=
d
> >> > > the instructions. It doesn't have to be that way, but if we carry =
on
> >> > > as we are, it will continue to be messy and in five years you will
> >> > > need a Ph.D and a lucky charm to boot on any modern board. My
> >> > > objective here is to simplify things, bringing some consistency to
> the
> >> > > different components. Binman was one effort there. I feel that
> putting
> >> > > at least the U-Boot house in order, in my role as devicetree
> >> > > maintainer (and as author of devicetree support in U-Boot back in
> >> > > 2011), is the next step.
> >> > >
> >> > > If we set things up correctly and agree on the bindings, devicetre=
e
> >> > > can be the unifying configuration mechanism through the whole of
> >> > > firmware (except for very early bits) and into the OS, this will s=
et
> >> > > us up very well to deal with the complexity that is coming.
> >> > >
> >> > > Anyway, here are the mental steps that I've gone through over the
> past
> >> > > two months:
> >> > >
> >> > > Step 1: At present, some people think U-Boot is not even allowed t=
o
> >> > > have its own nodes/properties in the DT. It is an abuse of the
> >> > > devicetree standard, like the /chosen node but with less history. =
We
> >> > > should sacrifice efficiency, expedience and expandability on the
> altar
> >> > > of 'devicetree is a hardware description'. How do we get over that
> >> > > one? Wel, I just think we need to accept that U-Boot uses devicetr=
ee
> >> > > for its own purposes, as well as for booting the OS. I am not sayi=
ng
> >> > > it always has to have those properties, but with existing features
> >> > > like verified boot, SPL as well as complex firmware images where
> >> > > U-Boot needs to be able to find things in the image, it is
> essential.
> >> > > So let's just assume that we need this everywhere, since we
> certainly
> >> > > need it in at least some places.
> >> > >
> >> > > (stop reading here if you disagree, because nothing below will mak=
e
> >> > > any sense...you can still use U-Boot v2011.06 which doesn't have
> >> > > OF_CONTROL :-)
> >> >
> >> > Having U-Boot keep it's *internal* config state in DTs is fine.
> Adding
> >> > that to the DTs that are copied over from linux isn't imho.  There a=
re
> >> > various reasons for that.  First of all syncing device trees is a
> huge pain
> >> > and that's probably one of the main reasons our DTs are out of sync
> for a
> >> > large number of boards.
> >> > The point is this was fine in 2011 were we had SPL only,  but the
> reality
> >> > today is completely different.  There's previous stage boot loaders
> (and
> >> > enough cases were vendors prefer those over SPL).  If that bootloade=
r
> needs
> >> > to use it's own device tree for whatever reason,  imposing
> restrictions on
> >> > it wrt to the device tree it has to include,  and require them to ha=
ve
> >> > knowledge of U-Boot and it's internal config mechanism makes no sens=
e
> not
> >> > to mention it doesn't scale at all.
> >>
> >> I think the solution here may be the binman image packer. It works
> >> from a description of the image (i.e. is data-driver) and can collect
> >> all the pieces together. The U-Boot properties (and the ones required
> >> by TF-A, etc.) can be added at package time.
> >>
> >> If you think about it, it doesn't matter what properties are in the DT
> >> that is put into the firmware image. TF-A, for example, is presumably
> >> reading a devicetree from flash, so what does it care if it has some
> >> U-Boot properties in it?
> >
> >
> > I am going to change my position in all mail threads I participate.
> > I was trying to make patches relevant in the future and conceptually
> clean. That may not be the most effective position: I should just care
> about Linaro and its members being able to implement SystemReady concepts=
.
> >
> >
> > If you mandate U-Boot has nodes in the device tree passed to the OS, we
> can put DT fragment in  the nt_fw_config section of the fip and merge it =
at
> boot time. So there is a solution compatible with SystemReady.
> >
> > If you want to put fake, non future proof, DT sources in the dts for
> platforms that are organized to provide the authoritative DT to U-Boot at
> runtime, that's kind of your choice (hopefully representing the rest of
> U-Boot community). There will be quirk code in U-Boot to redo the
> adaptations on its non authoritative DT that the platform previous stage
> firmware does (already saw one in the past month); as Mark said there wil=
l
> be issues over time; and it will confuse people about the role of the DT.
> But I am fine with it as it does not impair Linaro and its members abilit=
y
> to implement SystemReady way of handling DT.
>
> OK thank you. It doesn't sound like you are very on-board though.
> Also, you mischaracterise my intent with in-tree devicetrees.
>
> I would be happy enough for now if you could accept that U-Boot has
> nodes/properties of its own in the devicetree. It has been a feature
> of U-Boot for 10 years now.

On SystemReady systems the DT passed to U-Boot for the OS will be assembled
from the board DT and a U-Boot fragment/overlay. The board DT is free from
any software/firmware aspects, just contains hardware description. The
U-Boot fragment/overlay can contain any nodes it wants. The location of the
bindings specification is essentially irrelevant: it could be devicetree.or=
g,
U-Boot doc or Linux kernel. Both DTs will be stored in the FIP. OEMs making
their firmware will just put whatever is needed in this =E2=80=9Cdynamic co=
nfig=E2=80=9D
DT. On SystemReady platforms U-Boot will always be given a DT, like on the
RPI4. U-Boot will be able to ignore it obviously. That said, doing so, a
platform may end-up failing compliance tests.
I think we need to document the above in U-Boot and refer to relevant
specifications. I=E2=80=99ll let Ilias propose something.

>
>
>
> Regards,
> Simon
>
>
> >
> >>
> >>
> >> As to syncing, we have solved this using u-boot.dtsi files in U-Boot,
> >> so I think this can be dealt with.
> >>
> >> >
> >> > >
> >> > > Step 2: Assume U-Boot has its own nodes/properties. How do they ge=
t
> >> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> >> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), =
we
> >> > > have binman definitions, etc. So we need a way to overlay those
> things
> >> > > into the DT. We already support this for in-tree DTs, so IMO this =
is
> >> > > easy. Just require every board to have an in-tree DT. It helps wit=
h
> >> > > discoverability and documentation, anyway. That is this series.
> >> > >
> >> >
> >> > Again, the board might decide for it's own reason to provide it's ow=
n
> DT.
> >> > IMHO U-Boot must be able to cope with that and asking DTs to be
> included in
> >> > U-Boot source is not the right way to do that,  not to mention cases
> were
> >> > that's completely unrealistic (e.g QEMU or a board that reads the DT=
B
> from
> >> > it's flash).
> >>
> >> I think you are at step 2. See above for my response.
> >>
> >> >
> >> > > (I think most of us are at the beginning of step 2, unsure about i=
t
> >> > > and worried about step 3)
> >> > >
> >> > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> >> > > flow only, or boards that sometimes use a flow) which need the DT =
to
> >> > > come from a prior stage. How to handle that? IMO that is only goin=
g
> to
> >> > > grow as every man and his dog get into the write-a-bootloader
> >> > > business.
> >> >
> >> > And that's exactly why we have to come up with something that
> scales,  without
> >> > having to add a bunch of unusable DTs in U-Boot.
> >>
> >> In what way does this not scale? How are the DTs unusable? If there is
> >> a standard binding, we should be fine.
> >>
> >> >
> >> > > We need a way to provide the U-Boot nodes/properties in a
> >> > > form that the prior stage can consume and integrate with its build
> >> > > system. Is TF-A the only thing being discussed here? If so, let's
> just
> >> > > do it. We have the u-boot.dtsi and we can use binman to put the
> image
> >> > > together, for example. Or we can get clever and create some sort o=
f
> >> > > overlay dtb.
> >> > >
> >> > > Step 3a. But I don't want to do that. a) If U-Boot needs this stuf=
f
> >> > > then it will need to build it in and use two devicetrees, one
> internal
> >> > > and one from the prior stage....well that is not very efficient an=
d
> it
> >> > > is going to be confusing for people to figure out what U-Boot is
> >> > > actually doing. But we actually already do that in a lot of cases
> >> > > where U-Boot passes a DT to the kernel which is different to the o=
ne
> >> > > it uses. So perhaps we have three devicetrees? OMG.
> >> >
> >> > No we don't. That's a moot point. If you separate the DTs U-Boot
> >> > provides the internal one and inherits one 'generic'.  Linux will be
> able to use
> >> > that.  So the only case were you'll need 3 DTs is if the *vendor*
> breaks the
> >> > DT across kernel versions,  In which case there's not much you can d=
o
> to
> >> > begin with and that's already a case we have to deal with.
> >>
> >> Linux actually doesn't care if the U-Boot properties are in the tree,
> >> so long as we have proper bindings. My point here is we only need
> >> either:
> >>
> >> a. one devicetree, shared with Linux and U-Boot (and TF-A?)
> >> b. two devicetrees, one for use in firmware and one for passing to Lin=
ux
> >>
> >> We don't need to separate out the U-Boot properties into a second (or
> >> third) devicetree. There just isn't any point.
> >>
> >> >
> >> > > b) Well then
> >> > > U-Boot can have its own small devicetree with its bits and then
> U-Boot
> >> > > can merge the two when it starts. Again that is not very efficient=
.
> It
> >> > > means that U-Boot cannot be controlled by the prior stage (e.g. to
> get
> >> > > its public key from there or to enable/disable the console), so
> >> > > unified firmware config is not possible. It will get very confusin=
g,
> >> > > particularly for debugging U-Boot. c) Some other scheme to avoid
> >> > > accepting step 3...please stop!
> >> > >
> >> > > Step 4: Yes, but there is QEMU, which makes the devicetree up out =
of
> >> > > whole cloth. What about that? Well, we are just going to have to
> deal
> >> > > with that. We can easily merge in the U-Boot nodes/properties and
> >> > > update the U-Boot CI scripts to do this, as needed, e.g. with
> >> > > qemu-riscv64_spl. It's only one use case, although Xen might do
> >> > > something similar.
> >> > >
> >> > > To my mind, that deals with both the build-time and run-time issue=
s.
> >> > > We have a discoverable DT in U-Boot, which should be considered th=
e
> >> > > source of truth for most boards. We can sync it with Linux
> >> > > automatically with the tooling that I hope Rob Herring will come u=
p
> >> > > with. We can use an empty one where there really is no default,
> >> > > although I'd argue that is making perfect an enemy of the good.
> >> > >
> >> > > Step 5: If we get clever and want to remove them from the U-Boot
> tree
> >> > > and pick them up from somewhere else, we can do that with sufficie=
nt
> >> > > tooling. Perhaps we should set a timeline for that? A year? Two?
> Six?
> >> >
> >> > We can start slowly migrating boards and see how that works out.
> >> > We could either use 2 device trees as you proposed, or have u-boot
> merge
> >> > the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'd
> prefer
> >> > if linux gets handed a clean device tree without the u-boot internal=
s
> in
> >> > it, so I think 2 discrete DTs is cleaner overall.
> >>
> >> I know you would prefer that, but does it really matter in practice?
> >> What is the objection, actually?
> >>
> >> As I mentioned on the call, I think the prior stage should do any
> >> merging or fixing up. Trying to do that sort of thing in 'early' code
> >> in U-Boot (or any other program, including Linux) is such a pain. With
> >> U-Boot, for example, we don't even have any RAM available to do it
> >> with half the time and it would dramatically increase the amount of
> >> memory needed prior to relocation. It just isn't a very good idea to
> >> try to do this in early code. It is also completely unnecessary, once
> >> you get past the philosophical objections.
> >>
> >> If TF-A wants to be in the picture, let it deal with the implications
> >> and responsibility thus incurred. TF-A has no right to tell U-Boot how
> >> to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quarter
> >> of the size of U-Boot. It duplicates loads of things in there. No one
> >> will even *notice* an FDT merge function, which is actually only 70
> >> LOC:
> >>
> >> /**
> >>  * overlay_apply_node - Merges a node into the base device tree
> >>  * @fdt: Base Device Tree blob
> >>  * @target: Node offset in the base device tree to apply the fragment =
to
> >>  * @fdto: Device tree overlay blob
> >>  * @node: Node offset in the overlay holding the changes to merge
> >>  *
> >>  * overlay_apply_node() merges a node into a target base device tree
> >>  * node pointed.
> >>  *
> >>  * This is part of the final step in the device tree overlay
> >>  * application process, when all the phandles have been adjusted and
> >>  * resolved and you just have to merge overlay into the base device
> >>  * tree.
> >>  *
> >>  * returns:
> >>  *      0 on success
> >>  *      Negative error code on failure
> >>  */
> >> static int overlay_apply_node(void *fdt, int target,
> >>                void *fdto, int node)
> >> {
> >>    int property;
> >>    int subnode;
> >>
> >>    fdt_for_each_property_offset(property, fdto, node) {
> >>       const char *name;
> >>       const void *prop;
> >>       int prop_len;
> >>       int ret;
> >>
> >>       prop =3D fdt_getprop_by_offset(fdto, property, &name,
> >>                     &prop_len);
> >>       if (prop_len =3D=3D -FDT_ERR_NOTFOUND)
> >>          return -FDT_ERR_INTERNAL;
> >>       if (prop_len < 0)
> >>          return prop_len;
> >>
> >>       ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
> >>       if (ret)
> >>          return ret;
> >>    }
> >>
> >>    fdt_for_each_subnode(subnode, fdto, node) {
> >>       const char *name =3D fdt_get_name(fdto, subnode, NULL);
> >>       int nnode;
> >>       int ret;
> >>
> >>       nnode =3D fdt_add_subnode(fdt, target, name);
> >>       if (nnode =3D=3D -FDT_ERR_EXISTS) {
> >>          nnode =3D fdt_subnode_offset(fdt, target, name);
> >>          if (nnode =3D=3D -FDT_ERR_NOTFOUND)
> >>             return -FDT_ERR_INTERNAL;
> >>       }
> >>
> >>       if (nnode < 0)
> >>          return nnode;
> >>
> >>       ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);
> >>       if (ret)
> >>          return ret;
> >>    }
> >>
> >>    return 0;
> >>
> >>
> >>
> >> }
> >>
> >>
> >> >
> >> > Regards
> >> > /Ilias
> >> > >
> >> > > To repeat, if we set things up correctly and agree on the bindings=
,
> >> > > devicetree can be the unifying configuration mechanism through the
> >> > > whole of firmware (except for very early bits) and into the OS. I
> feel
> >> > > this will set us up very well to deal with the complexity that is
> >> > > coming.
> >> > >
> >>
> >> Regards,
> >> Simon
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000aa498105cf6ad461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 oct. 2021 =C3=A0 16:30, Simo=
n Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,=
<br>
<br>
On Thu, 28 Oct 2021 at 02:21, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass &lt;<a href=3D"mailto:s=
jg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Ilias,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas<br>
&gt;&gt; &lt;<a href=3D"mailto:ilias.apalodimas@linaro.org" target=3D"_blan=
k">ilias.apalodimas@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; A bit late to the party, sorry!<br>
&gt;&gt;<br>
&gt;&gt; (Did you remember the beer? I am replying to this but I don&#39;t =
think it<br>
&gt;&gt; is all that helpful for me to reply to a lot of things on this thr=
ead,<br>
&gt;&gt; since I would not be adding much to my cover letter and patches)<b=
r>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [...]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; I really want to see what the binary case looks lik=
e since we could then<br>
&gt;&gt; &gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need t=
o see if we could<br>
&gt;&gt; &gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; I want to see less device trees in U-Boot sources, =
if they can come<br>
&gt;&gt; &gt; &gt; &gt; functionally correct from the hardware/our caller.<=
br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; And I&#39;m not seeing how we make use of &quot;U-B=
oot /config&quot; if we also don&#39;t<br>
&gt;&gt; &gt; &gt; &gt; use the device tree from build time at run time, ig=
noring the device<br>
&gt;&gt; &gt; &gt; &gt; tree provided to us at run time by the caller.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Firstly I should say that I find building firmware very =
messy and<br>
&gt;&gt; &gt; &gt; confusing these days. Lots of things to build and it&#39=
;s hard to find<br>
&gt;&gt; &gt; &gt; the instructions. It doesn&#39;t have to be that way, bu=
t if we carry on<br>
&gt;&gt; &gt; &gt; as we are, it will continue to be messy and in five year=
s you will<br>
&gt;&gt; &gt; &gt; need a Ph.D and a lucky charm to boot on any modern boar=
d. My<br>
&gt;&gt; &gt; &gt; objective here is to simplify things, bringing some cons=
istency to the<br>
&gt;&gt; &gt; &gt; different components. Binman was one effort there. I fee=
l that putting<br>
&gt;&gt; &gt; &gt; at least the U-Boot house in order, in my role as device=
tree<br>
&gt;&gt; &gt; &gt; maintainer (and as author of devicetree support in U-Boo=
t back in<br>
&gt;&gt; &gt; &gt; 2011), is the next step.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; If we set things up correctly and agree on the bindings,=
 devicetree<br>
&gt;&gt; &gt; &gt; can be the unifying configuration mechanism through the =
whole of<br>
&gt;&gt; &gt; &gt; firmware (except for very early bits) and into the OS, t=
his will set<br>
&gt;&gt; &gt; &gt; us up very well to deal with the complexity that is comi=
ng.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Anyway, here are the mental steps that I&#39;ve gone thr=
ough over the past<br>
&gt;&gt; &gt; &gt; two months:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 1: At present, some people think U-Boot is not even=
 allowed to<br>
&gt;&gt; &gt; &gt; have its own nodes/properties in the DT. It is an abuse =
of the<br>
&gt;&gt; &gt; &gt; devicetree standard, like the /chosen node but with less=
 history. We<br>
&gt;&gt; &gt; &gt; should sacrifice efficiency, expedience and expandabilit=
y on the altar<br>
&gt;&gt; &gt; &gt; of &#39;devicetree is a hardware description&#39;. How d=
o we get over that<br>
&gt;&gt; &gt; &gt; one? Wel, I just think we need to accept that U-Boot use=
s devicetree<br>
&gt;&gt; &gt; &gt; for its own purposes, as well as for booting the OS. I a=
m not saying<br>
&gt;&gt; &gt; &gt; it always has to have those properties, but with existin=
g features<br>
&gt;&gt; &gt; &gt; like verified boot, SPL as well as complex firmware imag=
es where<br>
&gt;&gt; &gt; &gt; U-Boot needs to be able to find things in the image, it =
is essential.<br>
&gt;&gt; &gt; &gt; So let&#39;s just assume that we need this everywhere, s=
ince we certainly<br>
&gt;&gt; &gt; &gt; need it in at least some places.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; (stop reading here if you disagree, because nothing belo=
w will make<br>
&gt;&gt; &gt; &gt; any sense...you can still use U-Boot v2011.06 which does=
n&#39;t have<br>
&gt;&gt; &gt; &gt; OF_CONTROL :-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Having U-Boot keep it&#39;s *internal* config state in DTs is=
 fine.=C2=A0 Adding<br>
&gt;&gt; &gt; that to the DTs that are copied over from linux isn&#39;t imh=
o.=C2=A0 There are<br>
&gt;&gt; &gt; various reasons for that.=C2=A0 First of all syncing device t=
rees is a huge pain<br>
&gt;&gt; &gt; and that&#39;s probably one of the main reasons our DTs are o=
ut of sync for a<br>
&gt;&gt; &gt; large number of boards.<br>
&gt;&gt; &gt; The point is this was fine in 2011 were we had SPL only,=C2=
=A0 but the reality<br>
&gt;&gt; &gt; today is completely different.=C2=A0 There&#39;s previous sta=
ge boot loaders (and<br>
&gt;&gt; &gt; enough cases were vendors prefer those over SPL).=C2=A0 If th=
at bootloader needs<br>
&gt;&gt; &gt; to use it&#39;s own device tree for whatever reason,=C2=A0 im=
posing restrictions on<br>
&gt;&gt; &gt; it wrt to the device tree it has to include,=C2=A0 and requir=
e them to have<br>
&gt;&gt; &gt; knowledge of U-Boot and it&#39;s internal config mechanism ma=
kes no sense not<br>
&gt;&gt; &gt; to mention it doesn&#39;t scale at all.<br>
&gt;&gt;<br>
&gt;&gt; I think the solution here may be the binman image packer. It works=
<br>
&gt;&gt; from a description of the image (i.e. is data-driver) and can coll=
ect<br>
&gt;&gt; all the pieces together. The U-Boot properties (and the ones requi=
red<br>
&gt;&gt; by TF-A, etc.) can be added at package time.<br>
&gt;&gt;<br>
&gt;&gt; If you think about it, it doesn&#39;t matter what properties are i=
n the DT<br>
&gt;&gt; that is put into the firmware image. TF-A, for example, is presuma=
bly<br>
&gt;&gt; reading a devicetree from flash, so what does it care if it has so=
me<br>
&gt;&gt; U-Boot properties in it?<br>
&gt;<br>
&gt;<br>
&gt; I am going to change my position in all mail threads I participate.<br=
>
&gt; I was trying to make patches relevant in the future and conceptually c=
lean. That may not be the most effective position: I should just care about=
 Linaro and its members being able to implement SystemReady concepts.<br>
&gt;<br>
&gt;<br>
&gt; If you mandate U-Boot has nodes in the device tree passed to the OS, w=
e can put DT fragment in=C2=A0 the nt_fw_config section of the fip and merg=
e it at boot time. So there is a solution compatible with SystemReady.<br>
&gt;<br>
&gt; If you want to put fake, non future proof, DT sources in the dts for p=
latforms that are organized to provide the authoritative DT to U-Boot at ru=
ntime, that&#39;s kind of your choice (hopefully representing the rest of U=
-Boot community). There will be quirk code in U-Boot to redo the adaptation=
s on its non authoritative DT that the platform previous stage firmware doe=
s (already saw one in the past month); as Mark said there will be issues ov=
er time; and it will confuse people about the role of the DT. But I am fine=
 with it as it does not impair Linaro and its members ability to implement =
SystemReady way of handling DT.<br>
<br>
OK thank you. It doesn&#39;t sound like you are very on-board though.<br>
Also, you mischaracterise my intent with in-tree devicetrees.<br>
<br>
I would be happy enough for now if you could accept that U-Boot has<br>
nodes/properties of its own in the devicetree. It has been a feature<br>
of U-Boot for 10 years now.</blockquote><div dir=3D"auto">On SystemReady sy=
stems the DT passed to U-Boot for the OS will be assembled from the board D=
T and a U-Boot fragment/overlay. The board DT is free from any software/fir=
mware aspects, just contains hardware description. The U-Boot fragment/over=
lay can contain any nodes it wants. The location of the bindings specificat=
ion is essentially irrelevant: it could be <a href=3D"http://devicetree.org=
">devicetree.org</a>, U-Boot doc or Linux kernel. Both DTs will be stored i=
n the FIP. OEMs making their firmware will just put whatever is needed in t=
his =E2=80=9Cdynamic config=E2=80=9D DT. On SystemReady platforms U-Boot wi=
ll always be given a DT, like on the RPI4. U-Boot will be able to ignore it=
 obviously. That said, doing so, a platform may end-up failing compliance t=
ests.=C2=A0</div><div dir=3D"auto">I think we need to document the above in=
 U-Boot and refer to relevant specifications. I=E2=80=99ll let Ilias propos=
e something.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br></blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Regards,<br>
Simon<br>
<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; As to syncing, we have solved this using u-boot.dtsi files in U-Bo=
ot,<br>
&gt;&gt; so I think this can be dealt with.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 2: Assume U-Boot has its own nodes/properties. How =
do they get<br>
&gt;&gt; &gt; &gt; there? Well, we have u-boot.dtsi files for that (the 201=
6 patch<br>
&gt;&gt; &gt; &gt; &quot;6d427c6b1fa binman: Automatically include a U-Boot=
 .dtsi file&quot;), we<br>
&gt;&gt; &gt; &gt; have binman definitions, etc. So we need a way to overla=
y those things<br>
&gt;&gt; &gt; &gt; into the DT. We already support this for in-tree DTs, so=
 IMO this is<br>
&gt;&gt; &gt; &gt; easy. Just require every board to have an in-tree DT. It=
 helps with<br>
&gt;&gt; &gt; &gt; discoverability and documentation, anyway. That is this =
series.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Again, the board might decide for it&#39;s own reason to prov=
ide it&#39;s own DT.<br>
&gt;&gt; &gt; IMHO U-Boot must be able to cope with that and asking DTs to =
be included in<br>
&gt;&gt; &gt; U-Boot source is not the right way to do that,=C2=A0 not to m=
ention cases were<br>
&gt;&gt; &gt; that&#39;s completely unrealistic (e.g QEMU or a board that r=
eads the DTB from<br>
&gt;&gt; &gt; it&#39;s flash).<br>
&gt;&gt;<br>
&gt;&gt; I think you are at step 2. See above for my response.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; (I think most of us are at the beginning of step 2, unsu=
re about it<br>
&gt;&gt; &gt; &gt; and worried about step 3)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 3: Ah, but there are flows (i.e. boards that use a =
particular<br>
&gt;&gt; &gt; &gt; flow only, or boards that sometimes use a flow) which ne=
ed the DT to<br>
&gt;&gt; &gt; &gt; come from a prior stage. How to handle that? IMO that is=
 only going to<br>
&gt;&gt; &gt; &gt; grow as every man and his dog get into the write-a-bootl=
oader<br>
&gt;&gt; &gt; &gt; business.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And that&#39;s exactly why we have to come up with something =
that scales,=C2=A0 without<br>
&gt;&gt; &gt; having to add a bunch of unusable DTs in U-Boot.<br>
&gt;&gt;<br>
&gt;&gt; In what way does this not scale? How are the DTs unusable? If ther=
e is<br>
&gt;&gt; a standard binding, we should be fine.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; We need a way to provide the U-Boot nodes/properties in =
a<br>
&gt;&gt; &gt; &gt; form that the prior stage can consume and integrate with=
 its build<br>
&gt;&gt; &gt; &gt; system. Is TF-A the only thing being discussed here? If =
so, let&#39;s just<br>
&gt;&gt; &gt; &gt; do it. We have the u-boot.dtsi and we can use binman to =
put the image<br>
&gt;&gt; &gt; &gt; together, for example. Or we can get clever and create s=
ome sort of<br>
&gt;&gt; &gt; &gt; overlay dtb.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 3a. But I don&#39;t want to do that. a) If U-Boot n=
eeds this stuff<br>
&gt;&gt; &gt; &gt; then it will need to build it in and use two devicetrees=
, one internal<br>
&gt;&gt; &gt; &gt; and one from the prior stage....well that is not very ef=
ficient and it<br>
&gt;&gt; &gt; &gt; is going to be confusing for people to figure out what U=
-Boot is<br>
&gt;&gt; &gt; &gt; actually doing. But we actually already do that in a lot=
 of cases<br>
&gt;&gt; &gt; &gt; where U-Boot passes a DT to the kernel which is differen=
t to the one<br>
&gt;&gt; &gt; &gt; it uses. So perhaps we have three devicetrees? OMG.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; No we don&#39;t. That&#39;s a moot point. If you separate the=
 DTs U-Boot<br>
&gt;&gt; &gt; provides the internal one and inherits one &#39;generic&#39;.=
=C2=A0 Linux will be able to use<br>
&gt;&gt; &gt; that.=C2=A0 So the only case were you&#39;ll need 3 DTs is if=
 the *vendor* breaks the<br>
&gt;&gt; &gt; DT across kernel versions,=C2=A0 In which case there&#39;s no=
t much you can do to<br>
&gt;&gt; &gt; begin with and that&#39;s already a case we have to deal with=
.<br>
&gt;&gt;<br>
&gt;&gt; Linux actually doesn&#39;t care if the U-Boot properties are in th=
e tree,<br>
&gt;&gt; so long as we have proper bindings. My point here is we only need<=
br>
&gt;&gt; either:<br>
&gt;&gt;<br>
&gt;&gt; a. one devicetree, shared with Linux and U-Boot (and TF-A?)<br>
&gt;&gt; b. two devicetrees, one for use in firmware and one for passing to=
 Linux<br>
&gt;&gt;<br>
&gt;&gt; We don&#39;t need to separate out the U-Boot properties into a sec=
ond (or<br>
&gt;&gt; third) devicetree. There just isn&#39;t any point.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; b) Well then<br>
&gt;&gt; &gt; &gt; U-Boot can have its own small devicetree with its bits a=
nd then U-Boot<br>
&gt;&gt; &gt; &gt; can merge the two when it starts. Again that is not very=
 efficient. It<br>
&gt;&gt; &gt; &gt; means that U-Boot cannot be controlled by the prior stag=
e (e.g. to get<br>
&gt;&gt; &gt; &gt; its public key from there or to enable/disable the conso=
le), so<br>
&gt;&gt; &gt; &gt; unified firmware config is not possible. It will get ver=
y confusing,<br>
&gt;&gt; &gt; &gt; particularly for debugging U-Boot. c) Some other scheme =
to avoid<br>
&gt;&gt; &gt; &gt; accepting step 3...please stop!<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 4: Yes, but there is QEMU, which makes the devicetr=
ee up out of<br>
&gt;&gt; &gt; &gt; whole cloth. What about that? Well, we are just going to=
 have to deal<br>
&gt;&gt; &gt; &gt; with that. We can easily merge in the U-Boot nodes/prope=
rties and<br>
&gt;&gt; &gt; &gt; update the U-Boot CI scripts to do this, as needed, e.g.=
 with<br>
&gt;&gt; &gt; &gt; qemu-riscv64_spl. It&#39;s only one use case, although X=
en might do<br>
&gt;&gt; &gt; &gt; something similar.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; To my mind, that deals with both the build-time and run-=
time issues.<br>
&gt;&gt; &gt; &gt; We have a discoverable DT in U-Boot, which should be con=
sidered the<br>
&gt;&gt; &gt; &gt; source of truth for most boards. We can sync it with Lin=
ux<br>
&gt;&gt; &gt; &gt; automatically with the tooling that I hope Rob Herring w=
ill come up<br>
&gt;&gt; &gt; &gt; with. We can use an empty one where there really is no d=
efault,<br>
&gt;&gt; &gt; &gt; although I&#39;d argue that is making perfect an enemy o=
f the good.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Step 5: If we get clever and want to remove them from th=
e U-Boot tree<br>
&gt;&gt; &gt; &gt; and pick them up from somewhere else, we can do that wit=
h sufficient<br>
&gt;&gt; &gt; &gt; tooling. Perhaps we should set a timeline for that? A ye=
ar? Two? Six?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We can start slowly migrating boards and see how that works o=
ut.<br>
&gt;&gt; &gt; We could either use 2 device trees as you proposed, or have u=
-boot merge<br>
&gt;&gt; &gt; the &#39;u-boot&#39; DTB and the inherited DTB before DM come=
s up.=C2=A0 OTOH I&#39;d prefer<br>
&gt;&gt; &gt; if linux gets handed a clean device tree without the u-boot i=
nternals in<br>
&gt;&gt; &gt; it, so I think 2 discrete DTs is cleaner overall.<br>
&gt;&gt;<br>
&gt;&gt; I know you would prefer that, but does it really matter in practic=
e?<br>
&gt;&gt; What is the objection, actually?<br>
&gt;&gt;<br>
&gt;&gt; As I mentioned on the call, I think the prior stage should do any<=
br>
&gt;&gt; merging or fixing up. Trying to do that sort of thing in &#39;earl=
y&#39; code<br>
&gt;&gt; in U-Boot (or any other program, including Linux) is such a pain. =
With<br>
&gt;&gt; U-Boot, for example, we don&#39;t even have any RAM available to d=
o it<br>
&gt;&gt; with half the time and it would dramatically increase the amount o=
f<br>
&gt;&gt; memory needed prior to relocation. It just isn&#39;t a very good i=
dea to<br>
&gt;&gt; try to do this in early code. It is also completely unnecessary, o=
nce<br>
&gt;&gt; you get past the philosophical objections.<br>
&gt;&gt;<br>
&gt;&gt; If TF-A wants to be in the picture, let it deal with the implicati=
ons<br>
&gt;&gt; and responsibility thus incurred. TF-A has no right to tell U-Boot=
 how<br>
&gt;&gt; to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quart=
er<br>
&gt;&gt; of the size of U-Boot. It duplicates loads of things in there. No =
one<br>
&gt;&gt; will even *notice* an FDT merge function, which is actually only 7=
0<br>
&gt;&gt; LOC:<br>
&gt;&gt;<br>
&gt;&gt; /**<br>
&gt;&gt;=C2=A0 * overlay_apply_node - Merges a node into the base device tr=
ee<br>
&gt;&gt;=C2=A0 * @fdt: Base Device Tree blob<br>
&gt;&gt;=C2=A0 * @target: Node offset in the base device tree to apply the =
fragment to<br>
&gt;&gt;=C2=A0 * @fdto: Device tree overlay blob<br>
&gt;&gt;=C2=A0 * @node: Node offset in the overlay holding the changes to m=
erge<br>
&gt;&gt;=C2=A0 *<br>
&gt;&gt;=C2=A0 * overlay_apply_node() merges a node into a target base devi=
ce tree<br>
&gt;&gt;=C2=A0 * node pointed.<br>
&gt;&gt;=C2=A0 *<br>
&gt;&gt;=C2=A0 * This is part of the final step in the device tree overlay<=
br>
&gt;&gt;=C2=A0 * application process, when all the phandles have been adjus=
ted and<br>
&gt;&gt;=C2=A0 * resolved and you just have to merge overlay into the base =
device<br>
&gt;&gt;=C2=A0 * tree.<br>
&gt;&gt;=C2=A0 *<br>
&gt;&gt;=C2=A0 * returns:<br>
&gt;&gt;=C2=A0 *=C2=A0 =C2=A0 =C2=A0 0 on success<br>
&gt;&gt;=C2=A0 *=C2=A0 =C2=A0 =C2=A0 Negative error code on failure<br>
&gt;&gt;=C2=A0 */<br>
&gt;&gt; static int overlay_apply_node(void *fdt, int target,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *fdto,=
 int node)<br>
&gt;&gt; {<br>
&gt;&gt;=C2=A0 =C2=A0 int property;<br>
&gt;&gt;=C2=A0 =C2=A0 int subnode;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 fdt_for_each_property_offset(property, fdto, node) {<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const void *prop;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int prop_len;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D fdt_getprop_by_offset(fdto, pro=
perty, &amp;name,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;prop_len);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop_len =3D=3D -FDT_ERR_NOTFOUND)<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -FDT_ERR_INTERNAL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop_len &lt; 0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return prop_len;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fdt_setprop(fdt, target, name, p=
rop, prop_len);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 fdt_for_each_subnode(subnode, fdto, node) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name =3D fdt_get_name(fdto, =
subnode, NULL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int nnode;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nnode =3D fdt_add_subnode(fdt, target, n=
ame);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nnode =3D=3D -FDT_ERR_EXISTS) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nnode =3D fdt_subnode_offset(fdt=
, target, name);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nnode =3D=3D -FDT_ERR_NOTFOU=
ND)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -FDT_ERR_INT=
ERNAL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nnode &lt; 0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nnode;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D overlay_apply_node(fdt, nnode, f=
dto, subnode);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 return 0;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Regards<br>
&gt;&gt; &gt; /Ilias<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; To repeat, if we set things up correctly and agree on th=
e bindings,<br>
&gt;&gt; &gt; &gt; devicetree can be the unifying configuration mechanism t=
hrough the<br>
&gt;&gt; &gt; &gt; whole of firmware (except for very early bits) and into =
the OS. I feel<br>
&gt;&gt; &gt; &gt; this will set us up very well to deal with the complexit=
y that is<br>
&gt;&gt; &gt; &gt; coming.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Simon<br>
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

--000000000000aa498105cf6ad461--

