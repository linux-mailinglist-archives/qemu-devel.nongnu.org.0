Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981B43CC3E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:28:39 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjuw-0008Lj-9j
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfj8j-0007DG-6O
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:38:50 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfj8g-0001R4-NM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:38:48 -0400
Received: by mail-qt1-x82b.google.com with SMTP id h14so1651026qtb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F/XT/mE+UGGO+bainE1VvaO8d42mf2tVzCzXjh7xvlo=;
 b=rd3v/GbJJYAmFEmqlwz8Fhi8v1JzXMYmAypubVoVKByM8+Hf2dm3c7MLbq25XJ9nM4
 nMSCdQiJpr2HSalvnhBKhrSUEaaAYLE0XdZ6Mp/SBjl5wnNe+cfkETqokptqv9E/eOvo
 GmeQ97aSEbsGph4tDjXa8KcaevSxUUAbe8/S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F/XT/mE+UGGO+bainE1VvaO8d42mf2tVzCzXjh7xvlo=;
 b=Q1teu/UGkKMNKZGqOHXnKMczggIJKy1V1VKHgqwes7jMiAB8a2UKreSjMjbHa8SZGg
 I4s8Xm4ZdtZtsOkdgqtra6qetqg9YN1Gp9E1Klbxi7qjg2qAV1NZytx+eTR7ml0P00SZ
 cLz7J46JCbN2htw+dIDvjP5cSOcu9pT3vffuGquw7rXT4egGEZt509JHXA+JyZwvCR1F
 rODeKCHqYY1jFdxR0mUvF89y8xdpyy6IB4WiS8vuLvG64jzYXK8ESXYHewpBjj3CRz2e
 AIG+/tWfB07qv1+8n2LNHJhXQbp/cAJJomoMR6tSUR3yJ/zh7+QtLYF7lJ4xmFekX9Au
 potA==
X-Gm-Message-State: AOAM532Wh8PctfH3VTCRwkmBGfIPoR0eAg6OstqqavM87W1iYGXJTcWu
 Dvm0xo/a7j4vKCkg9xVEFhstiQ==
X-Google-Smtp-Source: ABdhPJzzOxGRi6mTT1jgXBM/f9EgoRJ0cN8FQ1fPfs2aarUqr1LIs71YgBUjCZ7Ep1ToMVVBx4Q6aQ==
X-Received: by 2002:a05:622a:170f:: with SMTP id
 h15mr32781284qtk.176.1635341925223; 
 Wed, 27 Oct 2021 06:38:45 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id p187sm10330qkd.101.2021.10.27.06.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:38:44 -0700 (PDT)
Date: Wed, 27 Oct 2021 09:38:40 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027133840.GV8284@bill-the-cat>
References: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
 <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i483Pv/KqyjCUwB1"
Content-Disposition: inline
In-Reply-To: <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=trini@konsulko.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--i483Pv/KqyjCUwB1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:30:18PM +0200, Fran=E7ois Ozog wrote:
> Hi Tom,
>=20
> On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > > Hi Simon,
> > >
> > > A bit late to the party, sorry!
> > >
> > > [...]
> > >
> > > > >
> > > > > I really want to see what the binary case looks like since we cou=
ld
> > then
> > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we co=
uld
> > > > > then also do a rpi_arm32_defconfig too.
> > > > >
> > > > > I want to see less device trees in U-Boot sources, if they can co=
me
> > > > > functionally correct from the hardware/our caller.
> > > > >
> > > > > And I'm not seeing how we make use of "U-Boot /config" if we also
> > don't
> > > > > use the device tree from build time at run time, ignoring the dev=
ice
> > > > > tree provided to us at run time by the caller.
> > > >
> > > > Firstly I should say that I find building firmware very messy and
> > > > confusing these days. Lots of things to build and it's hard to find
> > > > the instructions. It doesn't have to be that way, but if we carry on
> > > > as we are, it will continue to be messy and in five years you will
> > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > objective here is to simplify things, bringing some consistency to =
the
> > > > different components. Binman was one effort there. I feel that putt=
ing
> > > > at least the U-Boot house in order, in my role as devicetree
> > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > 2011), is the next step.
> > > >
> > > > If we set things up correctly and agree on the bindings, devicetree
> > > > can be the unifying configuration mechanism through the whole of
> > > > firmware (except for very early bits) and into the OS, this will set
> > > > us up very well to deal with the complexity that is coming.
> > > >
> > > > Anyway, here are the mental steps that I've gone through over the p=
ast
> > > > two months:
> > > >
> > > > Step 1: At present, some people think U-Boot is not even allowed to
> > > > have its own nodes/properties in the DT. It is an abuse of the
> > > > devicetree standard, like the /chosen node but with less history. We
> > > > should sacrifice efficiency, expedience and expandability on the al=
tar
> > > > of 'devicetree is a hardware description'. How do we get over that
> > > > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > > > for its own purposes, as well as for booting the OS. I am not saying
> > > > it always has to have those properties, but with existing features
> > > > like verified boot, SPL as well as complex firmware images where
> > > > U-Boot needs to be able to find things in the image, it is essentia=
l.
> > > > So let's just assume that we need this everywhere, since we certain=
ly
> > > > need it in at least some places.
> > > >
> > > > (stop reading here if you disagree, because nothing below will make
> > > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > > OF_CONTROL :-)
> > >
> > > Having U-Boot keep it's *internal* config state in DTs is fine.  Addi=
ng
> > > that to the DTs that are copied over from linux isn't imho.  There are
> > > various reasons for that.  First of all syncing device trees is a huge
> > pain
> > > and that's probably one of the main reasons our DTs are out of sync f=
or a
> > > large number of boards.
> >
> > This re-sync is only a pain because:
> > 1. Some platforms have been modifying the core dts files LIKE THEY ARE
> >    NOT SUPPOSED TO.
> > 2. DTS files are getting closer to being the super stable API that has
> >    been promised now that there's validation tools.
> >
> > Some SoCs, like stm32 are doing an amazing job and keeping things in
> > sync, every release.  Others like NXP are violating rule #1.
>=20
> With NXP commitment to SystemReady on some IMX8 boards, I think this is
> changing,
> at least for the SystemReady boards.

I'd really like to see some progress (as would the other non-NXP folks
working on NXP SoCs) in that regard.

> > Still
> > others like some TI platforms get bit by #2 (I solved one of these, and
> > need to cycle back to the one you and I talked about on IRC a while
> > back, I bet it's another node name dash changed to underbar).
> >
> > > The point is this was fine in 2011 were we had SPL only,  but the rea=
lity
> > > today is completely different.  There's previous stage boot loaders (=
and
> > > enough cases were vendors prefer those over SPL).  If that bootloader
> > needs
> > > to use it's own device tree for whatever reason,  imposing restrictio=
ns
> > on
> > > it wrt to the device tree it has to include,  and require them to have
> > > knowledge of U-Boot and it's internal config mechanism makes no sense=
 not
> > > to mention it doesn't scale at all.
> >
> > If you are passing the full device tree around, a few more
> > nodes/properties aren't going to make the situation worse.  If we're
> > talking about a 60 kilobyte blob one more kilobyte isn't where we call
> > the line, especially since if we wait another 6 months it'll be a 62
> > kilobyte file coming in from Linux instead.
>
> This is not about size but about firmware supply chain organization.

That's great since it means we just need the bindings reviewed then
everyone can pass whatever everyone else needs.

> > > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > > > have binman definitions, etc. So we need a way to overlay those thi=
ngs
> > > > into the DT. We already support this for in-tree DTs, so IMO this is
> > > > easy. Just require every board to have an in-tree DT. It helps with
> > > > discoverability and documentation, anyway. That is this series.
> > >
> > > Again, the board might decide for it's own reason to provide it's own
> > DT.
> > > IMHO U-Boot must be able to cope with that and asking DTs to be inclu=
ded
> > in
> > > U-Boot source is not the right way to do that,  not to mention cases =
were
> > > that's completely unrealistic (e.g QEMU or a board that reads the DTB
> > from
> > > it's flash).
> > >
> > > > (I think most of us are at the beginning of step 2, unsure about it
> > > > and worried about step 3)
> > > >
> > > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > > > flow only, or boards that sometimes use a flow) which need the DT to
> > > > come from a prior stage. How to handle that? IMO that is only going=
 to
> > > > grow as every man and his dog get into the write-a-bootloader
> > > > business.
> > >
> > > And that's exactly why we have to come up with something that scales,
> > without
> > > having to add a bunch of unusable DTs in U-Boot.
> >
> > Both of these are solved by having our bindings reviewed and upstreamed
> > and then what we need included in the authoritative dts files.
> >
> There shall be authoritative System Device Trees as vendors are working o=
n.
> Those System Device Trees cover all aspects of a board, not just the
> Cortex-A part that U-Boot cares about.
> Out of those system device trees, a tool (lopper) is going to carve out t=
he
> "authoritative dts for the cortex-A".
> Essentially, that carve out will correspond to what would come out of Lin=
ux.

s/Linux/software/

> This scheme will not be generalized, just adopted by vendors on some
> boards.
> DT for those board become part of the OS ABI (meaning, the driver
> developper is constrained).

OK?  And is going to pick and choose which valid bindings to implement?
Or is it going to provide half a node for Linux?  No?  I assume no.  So
it will also provide whatever bindings we've upstreamed and say need to
be passed.

--=20
Tom

--i483Pv/KqyjCUwB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5VlYACgkQFHw5/5Y0
tywt6gv/TcBx+wy+zrNzoSBh5899Kx4An0vBu6EPwCnYfeuMX/ILBZiAph3N4ioo
ynJz43ou5ARiHA1FMnw3FhzTIastmjeWanfzL7ec6F0Q1gQF7sAgI6hGFn0HRjDE
ZHitjAVG68ArpxdOJgtNB6zW0xfRtk5+szO0vaZRK35V8824j5rGyAmJYYn5MY4g
POe1iXy0qUuYELyTOx0eOhIW2fYcMpn1uHJSfz96Ux1lPqVODAhn0D70eQnn5Ky5
urhv8txikvevYvFqhQb2FYAVzHH0NibegY8v74iKFwNmRH4iRQWqiqQ0xDEQuIGs
XsHZYR39mHpIbc+8b/fHLrNx0HVP452OR/+Pm/1nYHZPgsdX+/A20jsc/5KmCMg/
TbYpPCLGhy4Lg1XfXvQ8amNNNbOqEoeDKlVzbfgSEzmAv47ZbgwNmwAPAZOOj3bd
buqDlNp+fu6cVrRNa3zeLmurYaSkDtxyzKOPzrNbILUEnb8eSjcUNu0OrSDgNO1y
3ooPt/8d
=2NQX
-----END PGP SIGNATURE-----

--i483Pv/KqyjCUwB1--

