Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5527A43CAB6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:32:40 +0200 (CEST)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfj2l-0005md-Co
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfiWc-0003ET-7o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:59:26 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfiWY-0000AN-IE
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 08:59:25 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id v2so1644107qve.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 05:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xgv9lATKLhqFVv+ZtV2FH4ZICQ5IMyn30+/Bazm6vGs=;
 b=HxUc95ucBvWr5G6bDFMG/6sM70uESXQN55u9znxseOibCk2NFsFTzi8pjkYWxo8hXs
 WfIC+r8ZHRd1D4oODzH8+1/sBzyLPl63P0Tk7LYLM5Q4wEQ7Ff3o3kt9UYbFx1zOU72i
 2+IXe91eU92OMBF1325fZQAkuYd4kI44l+dYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xgv9lATKLhqFVv+ZtV2FH4ZICQ5IMyn30+/Bazm6vGs=;
 b=FP591zzPX3oFmtd3EUticI59P/6fugYWMgqgLbqgAJxpKEd8IuYnjANw1t9OdqnXRn
 V9jz+PeMpZmcFDErdQhdPS5/Ze7d9PMnS5uVTBywvwpY3/mZgEDTtngf9xoCHC89k2DT
 DSfA11QOQvpl+KkeZaPpeGfDTX+pxxpNvrhG6F+Vi3BUPcW36bboxO1VFmFr62raYCO5
 iWalywe3X+1iVqHaZWPmlJg1ienIz8B4Vo9bNoFI1Yc9pSCbbRL82QjrAYbCG3AAlzua
 RwKUC1zI1Is2Tz7+QjIo3qaYULhVf54J04C0qtO/WiiRBOYqsNW9ASylfv+e+h68q+q7
 sbIg==
X-Gm-Message-State: AOAM533J16tZJ6aY15olkjYds/kQKLZkI1fiGIUAAJcL2B0Ak6cCBqlE
 AaIYmIQCKdEgdvrrxwFf6dg37g==
X-Google-Smtp-Source: ABdhPJy5YAu1Wf4dGhfz39pse0AYgcGZ6fV/zC4qOb667i0veTtcE/iFJlBbAttc2xit4eQkk/EBhA==
X-Received: by 2002:a05:6214:262d:: with SMTP id
 gv13mr19252721qvb.40.1635339561258; 
 Wed, 27 Oct 2021 05:59:21 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id g19sm13210947qtg.78.2021.10.27.05.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 05:59:20 -0700 (PDT)
Date: Wed, 27 Oct 2021 08:59:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027125916.GS8284@bill-the-cat>
References: <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y2MHPAl/EzyWgzIZ"
Content-Disposition: inline
In-Reply-To: <YXekTkeL73NM0UOU@apalos.home>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf2c.google.com
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
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
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


--y2MHPAl/EzyWgzIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> Hi Simon,
>=20
> A bit late to the party, sorry!
>=20
> [...]
>=20
> > >
> > > I really want to see what the binary case looks like since we could t=
hen
> > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > > then also do a rpi_arm32_defconfig too.
> > >
> > > I want to see less device trees in U-Boot sources, if they can come
> > > functionally correct from the hardware/our caller.
> > >
> > > And I'm not seeing how we make use of "U-Boot /config" if we also don=
't
> > > use the device tree from build time at run time, ignoring the device
> > > tree provided to us at run time by the caller.
> >=20
> > Firstly I should say that I find building firmware very messy and
> > confusing these days. Lots of things to build and it's hard to find
> > the instructions. It doesn't have to be that way, but if we carry on
> > as we are, it will continue to be messy and in five years you will
> > need a Ph.D and a lucky charm to boot on any modern board. My
> > objective here is to simplify things, bringing some consistency to the
> > different components. Binman was one effort there. I feel that putting
> > at least the U-Boot house in order, in my role as devicetree
> > maintainer (and as author of devicetree support in U-Boot back in
> > 2011), is the next step.
> >=20
> > If we set things up correctly and agree on the bindings, devicetree
> > can be the unifying configuration mechanism through the whole of
> > firmware (except for very early bits) and into the OS, this will set
> > us up very well to deal with the complexity that is coming.
> >=20
> > Anyway, here are the mental steps that I've gone through over the past
> > two months:
> >=20
> > Step 1: At present, some people think U-Boot is not even allowed to
> > have its own nodes/properties in the DT. It is an abuse of the
> > devicetree standard, like the /chosen node but with less history. We
> > should sacrifice efficiency, expedience and expandability on the altar
> > of 'devicetree is a hardware description'. How do we get over that
> > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > for its own purposes, as well as for booting the OS. I am not saying
> > it always has to have those properties, but with existing features
> > like verified boot, SPL as well as complex firmware images where
> > U-Boot needs to be able to find things in the image, it is essential.
> > So let's just assume that we need this everywhere, since we certainly
> > need it in at least some places.
> >=20
> > (stop reading here if you disagree, because nothing below will make
> > any sense...you can still use U-Boot v2011.06 which doesn't have
> > OF_CONTROL :-)
>=20
> Having U-Boot keep it's *internal* config state in DTs is fine.  Adding
> that to the DTs that are copied over from linux isn't imho.  There are
> various reasons for that.  First of all syncing device trees is a huge pa=
in
> and that's probably one of the main reasons our DTs are out of sync for a
> large number of boards.

This re-sync is only a pain because:
1. Some platforms have been modifying the core dts files LIKE THEY ARE
   NOT SUPPOSED TO.
2. DTS files are getting closer to being the super stable API that has
   been promised now that there's validation tools.

Some SoCs, like stm32 are doing an amazing job and keeping things in
sync, every release.  Others like NXP are violating rule #1.  Still
others like some TI platforms get bit by #2 (I solved one of these, and
need to cycle back to the one you and I talked about on IRC a while
back, I bet it's another node name dash changed to underbar).

> The point is this was fine in 2011 were we had SPL only,  but the reality
> today is completely different.  There's previous stage boot loaders (and
> enough cases were vendors prefer those over SPL).  If that bootloader nee=
ds
> to use it's own device tree for whatever reason,  imposing restrictions on
> it wrt to the device tree it has to include,  and require them to have
> knowledge of U-Boot and it's internal config mechanism makes no sense not
> to mention it doesn't scale at all.

If you are passing the full device tree around, a few more
nodes/properties aren't going to make the situation worse.  If we're
talking about a 60 kilobyte blob one more kilobyte isn't where we call
the line, especially since if we wait another 6 months it'll be a 62
kilobyte file coming in from Linux instead.

> > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > have binman definitions, etc. So we need a way to overlay those things
> > into the DT. We already support this for in-tree DTs, so IMO this is
> > easy. Just require every board to have an in-tree DT. It helps with
> > discoverability and documentation, anyway. That is this series.
>=20
> Again, the board might decide for it's own reason to provide it's own DT.=
=20
> IMHO U-Boot must be able to cope with that and asking DTs to be included =
in
> U-Boot source is not the right way to do that,  not to mention cases were
> that's completely unrealistic (e.g QEMU or a board that reads the DTB from
> it's flash).
>=20
> > (I think most of us are at the beginning of step 2, unsure about it
> > and worried about step 3)
> >=20
> > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > flow only, or boards that sometimes use a flow) which need the DT to
> > come from a prior stage. How to handle that? IMO that is only going to
> > grow as every man and his dog get into the write-a-bootloader
> > business.
>=20
> And that's exactly why we have to come up with something that scales,  wi=
thout
> having to add a bunch of unusable DTs in U-Boot.

Both of these are solved by having our bindings reviewed and upstreamed
and then what we need included in the authoritative dts files.

> > We need a way to provide the U-Boot nodes/properties in a
> > form that the prior stage can consume and integrate with its build
> > system. Is TF-A the only thing being discussed here? If so, let's just
> > do it. We have the u-boot.dtsi and we can use binman to put the image
> > together, for example. Or we can get clever and create some sort of
> > overlay dtb.
> >=20
> > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> > then it will need to build it in and use two devicetrees, one internal
> > and one from the prior stage....well that is not very efficient and it
> > is going to be confusing for people to figure out what U-Boot is
> > actually doing. But we actually already do that in a lot of cases
> > where U-Boot passes a DT to the kernel which is different to the one
> > it uses. So perhaps we have three devicetrees? OMG.=20
>=20
> No we don't. That's a moot point. If you separate the DTs U-Boot
> provides the internal one and inherits one 'generic'.  Linux will be able=
 to use
> that.  So the only case were you'll need 3 DTs is if the *vendor* breaks =
the
> DT across kernel versions,  In which case there's not much you can do to
> begin with and that's already a case we have to deal with.
>=20
> > b) Well then
> > U-Boot can have its own small devicetree with its bits and then U-Boot
> > can merge the two when it starts. Again that is not very efficient. It
> > means that U-Boot cannot be controlled by the prior stage (e.g. to get
> > its public key from there or to enable/disable the console), so
> > unified firmware config is not possible. It will get very confusing,
> > particularly for debugging U-Boot. c) Some other scheme to avoid
> > accepting step 3...please stop!
> >=20
> > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> > whole cloth. What about that? Well, we are just going to have to deal
> > with that. We can easily merge in the U-Boot nodes/properties and
> > update the U-Boot CI scripts to do this, as needed, e.g. with
> > qemu-riscv64_spl. It's only one use case, although Xen might do
> > something similar.
> >=20
> > To my mind, that deals with both the build-time and run-time issues.
> > We have a discoverable DT in U-Boot, which should be considered the
> > source of truth for most boards. We can sync it with Linux
> > automatically with the tooling that I hope Rob Herring will come up
> > with. We can use an empty one where there really is no default,
> > although I'd argue that is making perfect an enemy of the good.
> >=20
> > Step 5: If we get clever and want to remove them from the U-Boot tree
> > and pick them up from somewhere else, we can do that with sufficient
> > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
>=20
> We can start slowly migrating boards and see how that works out.
> We could either use 2 device trees as you proposed, or have u-boot merge
> the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'd pref=
er
> if linux gets handed a clean device tree without the u-boot internals in
> it, so I think 2 discrete DTs is cleaner overall.

Why does it matter if Linux sees some u-boot, properties?  If some huge
stink is going to be thrown, we could probably prune them out at run
time but it's already being passed N disabled nodes, yes?

--=20
Tom

--y2MHPAl/EzyWgzIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5TSAACgkQFHw5/5Y0
tyxqzgv/asGk/QaNm526p77SlOqvMOxmx3WcDcnnHNQoH8QScFWYkjo/2oFLoXBD
QzDFfZXXSLNsOv+VnFeK4dXpkowi4ec5tUpBMSbVyod3ANjA2Tzn7iRKkPuxyNVn
dHq7ih+0Q03J1yiHcA7XXA26UpW7waSI+XKL41gdXzFq5rZzxC6im2OlCFq0SoQ1
3czw3m+hIVUA4r6m6BFzG5DeSC5q2dKrXHBJ2+sF7EQ7fMymOIIXfLxt7rc3+HQ+
U75iLFoMjg4BWmN8+92P1QHzSO8UxcEfKqLHc9bvwSZJMchnbennXsj/97UxJDQV
XTOtlXA+/LZSp8LvsYGRg9ikth8gpa9E8Vza8c5aHK24kAYc+uHVILNeKyZR6cpG
x4tA6Z+FdmgWwxIE0g41gIaBSH3dBR3h5PRDsqLSIvN3RVXFGZkJq16DXJUgNiQ4
NWEkbyun62R6QoHo0yf04d3qJ4dJAibVsFa0wDNz8iNNRpExAoRRUdoW3MY+Iv33
7qU5YPfg
=Gr3S
-----END PGP SIGNATURE-----

--y2MHPAl/EzyWgzIZ--

