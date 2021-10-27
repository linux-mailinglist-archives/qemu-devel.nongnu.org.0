Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8669E43CD75
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:26:57 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkpM-00032b-42
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfjxM-0003ef-N5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:31:08 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfjxK-0000mz-6o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:31:08 -0400
Received: by mail-qv1-xf33.google.com with SMTP id c9so1554031qvm.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V6gJCcy5qEaA0owibzVNeojsv/TAtb9XWQoJ8QYvbm0=;
 b=f6F3EZIo14Ws7bxg1Xc/s4qoEHv0VLng9uwlvCdp6FkscXfVIbYG/G3DKsy5WoSDm/
 M3naK9CD6NTep1lwQxm9hOLx0RnIrKu1G2S/5urq9tvLE2raoj4rVhnvP3ZSacY0NWd5
 u4DwBd5RxXmEzzUVYpMRxHbn5i5xiJYj1O56U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V6gJCcy5qEaA0owibzVNeojsv/TAtb9XWQoJ8QYvbm0=;
 b=hAUKtFdFyzWQNUsX7lPGOAFpYBTn7yIrh6kspHpDGi5ngPWrQS/XpFjZHklQEjma6e
 09RVZyiWdgmQNjUsctplMMpz+rbKG89Yong8WD8ERqxHLzSVNVwE07oTJqsv3GVAYZS3
 oC1GOE68ZymZsXVVQ9IkXMf3igk2TMaaEZyGzp6nNeKaegXN9ParqHlC4L5MgpHZ/QL9
 mnqAfLjmiKfYBB6o/x1LErhZ01x7k7y+K5a1H3WrqJaHkYn96vOEMqTtRX6kc9kIvnnq
 FlHF7JdmBJWCab0ZOlG3cmAYORBRjSsjdEijBaT01z1pIFr5jlhDDRu5z+uDFHsJguts
 6Y8Q==
X-Gm-Message-State: AOAM530M6HqvHCOBKqaS5tJHa2h18Q3Z0EWURozOE64t6AyiTVAjM6RW
 bYu4+V3XaIMLFK6L2q27QS9tcA==
X-Google-Smtp-Source: ABdhPJyvIQ0uuTquMx92CXkmwiFEc/40Kkb5UQWEpJh6UEOAassO9H70fQhLUvR1RT1HOaPB+e6mIA==
X-Received: by 2002:ad4:596c:: with SMTP id eq12mr29830903qvb.62.1635345059473; 
 Wed, 27 Oct 2021 07:30:59 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id q6sm28052qtn.65.2021.10.27.07.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:30:58 -0700 (PDT)
Date: Wed, 27 Oct 2021 10:30:54 -0400
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027143054.GY8284@bill-the-cat>
References: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
 <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
 <20211027133840.GV8284@bill-the-cat>
 <CAHFG_=Vnpj1T_rqaxnHFTz4H4wiw_ziUJP0VudFS4WBUOb0i6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6yuPXOSZRpyw7iEV"
Content-Disposition: inline
In-Reply-To: <CAHFG_=Vnpj1T_rqaxnHFTz4H4wiw_ziUJP0VudFS4WBUOb0i6w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf33.google.com
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


--6yuPXOSZRpyw7iEV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 03:48:48PM +0200, Fran=E7ois Ozog wrote:
> On Wed, 27 Oct 2021 at 15:38, Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Wed, Oct 27, 2021 at 03:30:18PM +0200, Fran=E7ois Ozog wrote:
> > > Hi Tom,
> > >
> > > On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > > > > Hi Simon,
> > > > >
> > > > > A bit late to the party, sorry!
> > > > >
> > > > > [...]
> > > > >
> > > > > > >
> > > > > > > I really want to see what the binary case looks like since we
> > could
> > > > then
> > > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
> > could
> > > > > > > then also do a rpi_arm32_defconfig too.
> > > > > > >
> > > > > > > I want to see less device trees in U-Boot sources, if they can
> > come
> > > > > > > functionally correct from the hardware/our caller.
> > > > > > >
> > > > > > > And I'm not seeing how we make use of "U-Boot /config" if we =
also
> > > > don't
> > > > > > > use the device tree from build time at run time, ignoring the
> > device
> > > > > > > tree provided to us at run time by the caller.
> > > > > >
> > > > > > Firstly I should say that I find building firmware very messy a=
nd
> > > > > > confusing these days. Lots of things to build and it's hard to =
find
> > > > > > the instructions. It doesn't have to be that way, but if we car=
ry
> > on
> > > > > > as we are, it will continue to be messy and in five years you w=
ill
> > > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > > objective here is to simplify things, bringing some consistency=
 to
> > the
> > > > > > different components. Binman was one effort there. I feel that
> > putting
> > > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > > maintainer (and as author of devicetree support in U-Boot back =
in
> > > > > > 2011), is the next step.
> > > > > >
> > > > > > If we set things up correctly and agree on the bindings, device=
tree
> > > > > > can be the unifying configuration mechanism through the whole of
> > > > > > firmware (except for very early bits) and into the OS, this will
> > set
> > > > > > us up very well to deal with the complexity that is coming.
> > > > > >
> > > > > > Anyway, here are the mental steps that I've gone through over t=
he
> > past
> > > > > > two months:
> > > > > >
> > > > > > Step 1: At present, some people think U-Boot is not even allowe=
d to
> > > > > > have its own nodes/properties in the DT. It is an abuse of the
> > > > > > devicetree standard, like the /chosen node but with less histor=
y.
> > We
> > > > > > should sacrifice efficiency, expedience and expandability on the
> > altar
> > > > > > of 'devicetree is a hardware description'. How do we get over t=
hat
> > > > > > one? Wel, I just think we need to accept that U-Boot uses
> > devicetree
> > > > > > for its own purposes, as well as for booting the OS. I am not
> > saying
> > > > > > it always has to have those properties, but with existing featu=
res
> > > > > > like verified boot, SPL as well as complex firmware images where
> > > > > > U-Boot needs to be able to find things in the image, it is
> > essential.
> > > > > > So let's just assume that we need this everywhere, since we
> > certainly
> > > > > > need it in at least some places.
> > > > > >
> > > > > > (stop reading here if you disagree, because nothing below will =
make
> > > > > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > > > > OF_CONTROL :-)
> > > > >
> > > > > Having U-Boot keep it's *internal* config state in DTs is fine.
> > Adding
> > > > > that to the DTs that are copied over from linux isn't imho.  There
> > are
> > > > > various reasons for that.  First of all syncing device trees is a
> > huge
> > > > pain
> > > > > and that's probably one of the main reasons our DTs are out of sy=
nc
> > for a
> > > > > large number of boards.
> > > >
> > > > This re-sync is only a pain because:
> > > > 1. Some platforms have been modifying the core dts files LIKE THEY =
ARE
> > > >    NOT SUPPOSED TO.
> > > > 2. DTS files are getting closer to being the super stable API that =
has
> > > >    been promised now that there's validation tools.
> > > >
> > > > Some SoCs, like stm32 are doing an amazing job and keeping things in
> > > > sync, every release.  Others like NXP are violating rule #1.
> > >
> > > With NXP commitment to SystemReady on some IMX8 boards, I think this =
is
> > > changing,
> > > at least for the SystemReady boards.
> >
> > I'd really like to see some progress (as would the other non-NXP folks
> > working on NXP SoCs) in that regard.
> >
> > > > Still
> > > > others like some TI platforms get bit by #2 (I solved one of these,=
 and
> > > > need to cycle back to the one you and I talked about on IRC a while
> > > > back, I bet it's another node name dash changed to underbar).
> > > >
> > > > > The point is this was fine in 2011 were we had SPL only,  but the
> > reality
> > > > > today is completely different.  There's previous stage boot loade=
rs
> > (and
> > > > > enough cases were vendors prefer those over SPL).  If that bootlo=
ader
> > > > needs
> > > > > to use it's own device tree for whatever reason,  imposing
> > restrictions
> > > > on
> > > > > it wrt to the device tree it has to include,  and require them to
> > have
> > > > > knowledge of U-Boot and it's internal config mechanism makes no
> > sense not
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
> >
> > That's great since it means we just need the bindings reviewed then
> > everyone can pass whatever everyone else needs.
> >
> > > > > Step 2: Assume U-Boot has its own nodes/properties. How do they g=
et
> > > > > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > > > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"=
),
> > we
> > > > > > have binman definitions, etc. So we need a way to overlay those
> > things
> > > > > > into the DT. We already support this for in-tree DTs, so IMO th=
is
> > is
> > > > > > easy. Just require every board to have an in-tree DT. It helps =
with
> > > > > > discoverability and documentation, anyway. That is this series.
> > > > >
> > > > > Again, the board might decide for it's own reason to provide it's=
 own
> > > > DT.
> > > > > IMHO U-Boot must be able to cope with that and asking DTs to be
> > included
> > > > in
> > > > > U-Boot source is not the right way to do that,  not to mention ca=
ses
> > were
> > > > > that's completely unrealistic (e.g QEMU or a board that reads the=
 DTB
> > > > from
> > > > > it's flash).
> > > > >
> > > > > > (I think most of us are at the beginning of step 2, unsure abou=
t it
> > > > > > and worried about step 3)
> > > > > >
> > > > > > Step 3: Ah, but there are flows (i.e. boards that use a particu=
lar
> > > > > > flow only, or boards that sometimes use a flow) which need the =
DT
> > to
> > > > > > come from a prior stage. How to handle that? IMO that is only
> > going to
> > > > > > grow as every man and his dog get into the write-a-bootloader
> > > > > > business.
> > > > >
> > > > > And that's exactly why we have to come up with something that sca=
les,
> > > > without
> > > > > having to add a bunch of unusable DTs in U-Boot.
> > > >
> > > > Both of these are solved by having our bindings reviewed and upstre=
amed
> > > > and then what we need included in the authoritative dts files.
> > > >
> > > There shall be authoritative System Device Trees as vendors are worki=
ng
> > on.
> > > Those System Device Trees cover all aspects of a board, not just the
> > > Cortex-A part that U-Boot cares about.
> > > Out of those system device trees, a tool (lopper) is going to carve o=
ut
> > the
> > > "authoritative dts for the cortex-A".
> > > Essentially, that carve out will correspond to what would come out of
> > Linux.
> >
> > s/Linux/software/
> >
> > > This scheme will not be generalized, just adopted by vendors on some
> > > boards.
> > > DT for those board become part of the OS ABI (meaning, the driver
> > > developper is constrained).
> >
> > OK?  And is going to pick and choose which valid bindings to implement?
> > Or is it going to provide half a node for Linux?  No?  I assume no.  So
> > it will also provide whatever bindings we've upstreamed and say need to
> > be passed.
> >
> Until we can agree on a better scheme, Linux will server as the basis for
> most of the bindings.

Yes, this is the de-facto standard since the beginning.

> Some projects, like TF-A maintain their own bindings specifications. I

And as I keep saying I believe this to be totally wrong.  Unless and
only unless the TF-A bindings are for TF-A only to care about, and then
it's just one-off do what you guys want non-standard stuff.

> guess U-Boot shall do the same.

No, U-Boot is going to upstream the bindings that we want to have be
considered official.

> The U-Boot DT (for properties or whatever purpose) can be stored in a
> various of U-Boot decided ways and as part of the TF-A FIP image in the
> ad-hoc section: NT_FW_CONFIG. Passing FIP information to U-Boot to retrie=
ve
> the NF_FW_CONFIG should be part of the blob_list discussion that started a
> while ago.

Yes, we'll have to see where things progress about what bindings are
needed, and where.

> For System Device Tree, the bindings and the master repo will be maintain=
ed
> in devicetree.org (AFAIK).

Interesting, okay.

--=20
Tom

--6yuPXOSZRpyw7iEV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5Yp4ACgkQFHw5/5Y0
tywjqQwAod6unMRd7pNc5wo4dcljMmOkIasPpSt7M50PbhHFVtdvZYERKxYdlRZQ
TUzn9aDDOf/JsjB/we6mnpnvfBAneWCaZ/I1C8HHLqLpuVVuE0sogAsrsexU2Psw
SojxpwT/XLp0GWCEUm96cW7xcj9ENP0A0utx7uTdYMjATvTOfsixOrNbQF7tTCvy
sCEAs6Vso1lQSZQXsyIEKfi/jJsElYV5vnmDOUqxrq/xuF9sJAmOeTFXL160Mocc
5wUCtv4m1iFkyWwEOKglSWdMa7X8aV1lcwimQQTGFIU7Zw4Kc1Sut2PDdPtohN2A
THoZ9snqpgrOdYXWaZ2to48w6sezyWuqlNJPXeqpCtBYvAPusAhRD4qztjZBAudF
TJgcRc4yBitiZKWf9G/qWIjIRwN0kk5UHT5lZ2G3bQ06GzXpMcV6PaJEqsA/Y0wW
QQZSM6GvCr4u7tAEmEGBrtsiIWBnKT2Ow/k+qTSFRAgNnGD0dHiRL0s9+5NA89V5
8TMKMMOD
=yy95
-----END PGP SIGNATURE-----

--6yuPXOSZRpyw7iEV--

