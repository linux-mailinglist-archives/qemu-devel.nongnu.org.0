Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CF43CD3E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:13:50 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkcf-0000JQ-4w
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfjse-0007dj-V2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:26:16 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfjsc-000081-L3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:26:16 -0400
Received: by mail-qk1-x734.google.com with SMTP id y10so2546923qkp.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oclMzJZuBQlZ0W8fpBnPYToGN8C7l/nPxCoXo+HKfRI=;
 b=rczBDIn5h3K6hxCjiyi/1YP2H1n4u2zmDEvGLivpmcagKuM3gq2TVZBroOVJpLDMLu
 TpkGklCVXloOf3+fCO4J3YZFEtz7vkIMXFCcgAvWIBiXLprFh0YUhnwWMSrfrj88e3Gq
 2pwWVW3CN7dIBUKzgTRiG/ngcXhLNCA9hdzU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oclMzJZuBQlZ0W8fpBnPYToGN8C7l/nPxCoXo+HKfRI=;
 b=k/zb4O9eHNYC+DpKNVPP+wS8tLA8BN5itQVHuUZdlzHAQk2kShou+ViZrInTNq88tI
 3bVG7VVBoTRniLhpNWNahN25Rir2/Cy7j5woTFydFmqBonbkDbdhIIoXs+Ho/Loj7K9n
 NTRwM2fauZ8Hr7MZxUQKjfyyZ35IJMnbBCFJkNWtI/Ssl1dBhAmiwRL/eb8Qsn29VJgB
 8toPB53XlFAaq83Iom5/SjUWtr8xMpiKJ8cJIMcUbiLnTwo3UHqNDKo4kracW6OQDoVp
 cBZOC5D9pV4gG/JR8Na0AGRdwdbvT7E6rbjYcJfMVmaM+LMEJHczMUuBIjQNJXHLN6Cc
 Nmbg==
X-Gm-Message-State: AOAM533hsHPRkTzPRGVkzJ4OpuXjZvHI2NMnyTyo2B9zmmR0u35Ki0Zy
 cPPJj+wKR6k+11eqHWja/ItKJw==
X-Google-Smtp-Source: ABdhPJzfceeU5kk1AXykp7Wz4subrHNDyaTGTTmZahDcWW1R+V6f2pWh6W3jESrNDAYei153AIO45g==
X-Received: by 2002:a05:620a:2942:: with SMTP id
 n2mr4732013qkp.309.1635344773164; 
 Wed, 27 Oct 2021 07:26:13 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id c4sm85520qkf.122.2021.10.27.07.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:26:12 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:26:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027142608.GX8284@bill-the-cat>
References: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
 <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
 <20211027133840.GV8284@bill-the-cat> <YXlYi2KozBjmMb+v@apalos.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f4arffV+Mc+T1KhS"
Content-Disposition: inline
In-Reply-To: <YXlYi2KozBjmMb+v@apalos.home>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x734.google.com
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


--f4arffV+Mc+T1KhS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 04:47:55PM +0300, Ilias Apalodimas wrote:
> Hi trying to reply to all at the same time!
>=20
> On Wed, Oct 27, 2021 at 09:38:40AM -0400, Tom Rini wrote:
> > On Wed, Oct 27, 2021 at 03:30:18PM +0200, Fran=E7ois Ozog wrote:
> > > Hi Tom,
> > >=20
> > > On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:
> > >=20
> > > > On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > > > > Hi Simon,
> > > > >
> > > > > A bit late to the party, sorry!
> > > > >
> > > > > [...]
> > > > >
> > > > > > >
> > > > > > > I really want to see what the binary case looks like since we=
 could
> > > > then
> > > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if w=
e could
> > > > > > > then also do a rpi_arm32_defconfig too.
> > > > > > >
> > > > > > > I want to see less device trees in U-Boot sources, if they ca=
n come
> > > > > > > functionally correct from the hardware/our caller.
> > > > > > >
> > > > > > > And I'm not seeing how we make use of "U-Boot /config" if we =
also
> > > > don't
> > > > > > > use the device tree from build time at run time, ignoring the=
 device
> > > > > > > tree provided to us at run time by the caller.
> > > > > >
> > > > > > Firstly I should say that I find building firmware very messy a=
nd
> > > > > > confusing these days. Lots of things to build and it's hard to =
find
> > > > > > the instructions. It doesn't have to be that way, but if we car=
ry on
> > > > > > as we are, it will continue to be messy and in five years you w=
ill
> > > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > > objective here is to simplify things, bringing some consistency=
 to the
> > > > > > different components. Binman was one effort there. I feel that =
putting
> > > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > > maintainer (and as author of devicetree support in U-Boot back =
in
> > > > > > 2011), is the next step.
> > > > > >
> > > > > > If we set things up correctly and agree on the bindings, device=
tree
> > > > > > can be the unifying configuration mechanism through the whole of
> > > > > > firmware (except for very early bits) and into the OS, this wil=
l set
> > > > > > us up very well to deal with the complexity that is coming.
> > > > > >
> > > > > > Anyway, here are the mental steps that I've gone through over t=
he past
> > > > > > two months:
> > > > > >
> > > > > > Step 1: At present, some people think U-Boot is not even allowe=
d to
> > > > > > have its own nodes/properties in the DT. It is an abuse of the
> > > > > > devicetree standard, like the /chosen node but with less histor=
y. We
> > > > > > should sacrifice efficiency, expedience and expandability on th=
e altar
> > > > > > of 'devicetree is a hardware description'. How do we get over t=
hat
> > > > > > one? Wel, I just think we need to accept that U-Boot uses devic=
etree
> > > > > > for its own purposes, as well as for booting the OS. I am not s=
aying
> > > > > > it always has to have those properties, but with existing featu=
res
> > > > > > like verified boot, SPL as well as complex firmware images where
> > > > > > U-Boot needs to be able to find things in the image, it is esse=
ntial.
> > > > > > So let's just assume that we need this everywhere, since we cer=
tainly
> > > > > > need it in at least some places.
> > > > > >
> > > > > > (stop reading here if you disagree, because nothing below will =
make
> > > > > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > > > > OF_CONTROL :-)
> > > > >
> > > > > Having U-Boot keep it's *internal* config state in DTs is fine.  =
Adding
> > > > > that to the DTs that are copied over from linux isn't imho.  Ther=
e are
> > > > > various reasons for that.  First of all syncing device trees is a=
 huge
> > > > pain
> > > > > and that's probably one of the main reasons our DTs are out of sy=
nc for a
> > > > > large number of boards.
> > > >
> > > > This re-sync is only a pain because:
> > > > 1. Some platforms have been modifying the core dts files LIKE THEY =
ARE
> > > >    NOT SUPPOSED TO.
> > > > 2. DTS files are getting closer to being the super stable API that =
has
> > > >    been promised now that there's validation tools.
>=20
> Agree on both, but still this is the reality we have to deal with right n=
ow
>=20
> > > >
> > > > Some SoCs, like stm32 are doing an amazing job and keeping things in
> > > > sync, every release.  Others like NXP are violating rule #1.
> > >=20
> > > With NXP commitment to SystemReady on some IMX8 boards, I think this =
is
> > > changing,
> > > at least for the SystemReady boards.
> >=20
> > I'd really like to see some progress (as would the other non-NXP folks
> > working on NXP SoCs) in that regard.
> >=20
> > > > Still
> > > > others like some TI platforms get bit by #2 (I solved one of these,=
 and
> > > > need to cycle back to the one you and I talked about on IRC a while
> > > > back, I bet it's another node name dash changed to underbar).
> > > >
> > > > > The point is this was fine in 2011 were we had SPL only,  but the=
 reality
> > > > > today is completely different.  There's previous stage boot loade=
rs (and
> > > > > enough cases were vendors prefer those over SPL).  If that bootlo=
ader
> > > > needs
> > > > > to use it's own device tree for whatever reason,  imposing restri=
ctions
> > > > on
> > > > > it wrt to the device tree it has to include,  and require them to=
 have
> > > > > knowledge of U-Boot and it's internal config mechanism makes no s=
ense not
> > > > > to mention it doesn't scale at all.
> > > >
> > > > If you are passing the full device tree around, a few more
> > > > nodes/properties aren't going to make the situation worse.  If we're
> > > > talking about a 60 kilobyte blob one more kilobyte isn't where we c=
all
> > > > the line, especially since if we wait another 6 months it'll be a 62
> > > > kilobyte file coming in from Linux instead.
> > >
> > > This is not about size but about firmware supply chain organization.
> >=20
> > That's great since it means we just need the bindings reviewed then
> > everyone can pass whatever everyone else needs.
> >=20
>=20
> Size here is not my concern.  If the bindings u-boot expects gets
> upstreamed I am obviously fine with the previous stage bootloader passing
> them over.  What I strongly disagree,  is *demand* the previous stage boot
> loader have knowledge about them if they are not in upstream.

I also agree that bindings MUST be upstreamed for there to be a
reasonable expectation that any other project (or human creating a dts)
be adding them, either statically or any sort of run-time modification
(think memory information, this gets fixed up at run-time often still).

And it may end up being zero "u-boot,FOO" bindings where this is the
case.  Or it may end up being related to secure / verified boot stuff
only.

--=20
Tom

--f4arffV+Mc+T1KhS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5YX0ACgkQFHw5/5Y0
tyyolAwApp9hGjJ4u4TQAL8GUqvIcKCigcQG85vXHX3eG3JBqiPGSLcaiKGyYSAC
h3P+CZtoubgYx6UlgjBzQgHT/lc1p6s2cnphEpYKDu7wjUugzZhBPc6ICgH9cPhI
cvLVE1cbjD4qMbugyuL39WY6MwjRAYoULhl8KVnvkfbsh3gqV9DsGCag/WMF/uCv
sZENt9KaVkF5UOSHElriPd0f8N4AFTsNhCuhh8RaCp8YFis6liny5MmBo648H1fT
jAL5pm66cSCt810k6YMG5Qlx6nnt1WWHqVn9UGraM505UvH9FL9DoUkjWpDXq5JI
dx4PCyhNpKqKcTVQAkmBhT2WuysZsLb0XLqtglyz4XEMvpMO0ga1FLQQQ6BhQIAN
Fa4Qc5wFIYUDdM2PLPSr9ShpTmVTJQwImXpoj9qYgEKINhokqb19lSbIa0mS7xbZ
59NguV/2FfCWFT5gaxWwtgB+m3Ix0i76raiHkKxj1Rq4cB925GZYxglXaFEnKbZt
OIRBMK1v
=UgF4
-----END PGP SIGNATURE-----

--f4arffV+Mc+T1KhS--

