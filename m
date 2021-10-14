Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE642DF23
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:27:19 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3Ze-0000Uf-9l
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andre.przywara@arm.com>)
 id 1mb3X9-0007Nv-TR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:24:43 -0400
Received: from foss.arm.com ([217.140.110.172]:50268)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andre.przywara@arm.com>) id 1mb3X5-0003lG-Nw
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:24:42 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3109B11D4;
 Thu, 14 Oct 2021 09:24:36 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB9213F66F;
 Thu, 14 Oct 2021 09:24:29 -0700 (PDT)
Date: Thu, 14 Oct 2021 17:24:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211014172427.1f3e67d1@donnerap.cambridge.arm.com>
In-Reply-To: <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=andre.przywara@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stephen Warren <swarren@wwwdotorg.org>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>,
 =?UTF-8?B?RnJhbsOnb2lz?= Ozog <francois.ozog@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
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
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021 09:17:52 -0600
Simon Glass <sjg@chromium.org> wrote:

> Hi Tom,
>=20
> On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote: =20
> > > Hi Fran=C3=A7ois,
> > >
> > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linar=
o.org> wrote: =20
> > > >
> > > > Hi Simon
> > > >
> > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a=
 =C3=A9crit : =20
> > > >>
> > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > >>
> > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:=
 =20
> > > >> >
> > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote: =20
> > > >> > > Hi Simon,
> > > >> > >
> > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org>=
 wrote: =20
> > > >> > > >
> > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HO=
STFILE so
> > > >> > > > there are only three ways to obtain a devicetree:
> > > >> > > >
> > > >> > > >    - OF_SEPARATE - the normal way, where the devicetree is b=
uilt and
> > > >> > > >       appended to U-Boot
> > > >> > > >    - OF_EMBED - for development purposes, the devicetree is =
embedded in
> > > >> > > >       the ELF file (also used for EFI)
> > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > >> > > >
> > > >> > > > The last one is currently set up so that no devicetree is ne=
eded at all
> > > >> > > > in the U-Boot tree. Most boards do provide one, but some don=
't. Some
> > > >> > > > don't even provide instructions on how to boot on the board.
> > > >> > > >
> > > >> > > > The problems with this approach are documented at [1].
> > > >> > > >
> > > >> > > > In practice, OF_BOARD is not really distinct from OF_SEPARAT=
E. Any board
> > > >> > > > can obtain its devicetree at runtime, even it is has a devic=
etree built
> > > >> > > > in U-Boot. This is because U-Boot may be a second-stage boot=
loader and its
> > > >> > > > caller may have a better idea about the hardware available i=
n the machine.
> > > >> > > > This is the case with a few QEMU boards, for example.
> > > >> > > >
> > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It shou=
ld be an
> > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > >> > > >
> > > >> > > > This series makes this change, adding various missing device=
tree files
> > > >> > > > (and placeholders) to make the build work. =20
> > > >> > >
> > > >> > > Adding device trees that are never used sounds like a hack to =
me.
> > > >> > >
> > > >> > > For QEMU, device tree is dynamically generated on the fly base=
d on
> > > >> > > command line parameters, and the device tree you put in this s=
eries
> > > >> > > has various hardcoded <phandle> values which normally do not s=
how up
> > > >> > > in hand-written dts files.
> > > >> > >
> > > >> > > I am not sure I understand the whole point of this. =20
> > > >> >
> > > >> > I am also confused and do not like the idea of adding device tre=
es for
> > > >> > platforms that are capable of and can / do have a device tree to=
 give us
> > > >> > at run time. =20
> > > >>
> > > >> (I'll just reply to this one email, since the same points applies =
to
> > > >> all replies I think)
> > > >>
> > > >> I have been thinking about this and discussing it with people for a
> > > >> few months now. I've been signalling a change like this for over a
> > > >> month now, on U-Boot contributor calls and in discussions with Lin=
aro
> > > >> people. I sent a patch (below) to try to explain things. I hope it=
 is
> > > >> not a surprise!
> > > >>
> > > >> The issue here is that we need a devicetree in-tree in U-Boot, to
> > > >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
> > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
> > > >> Ilias' series and this one we can get ourselves on a stronger foot=
ing.
> > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> > > >> For more context:
> > > >>
> > > >> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.383=
0278-3-sjg@chromium.org/
> > > >>
> > > >> BTW I did suggest to QEMU ARM that they support a way of adding the
> > > >> u-boot.dtsi but there was not much interest there (in fact the
> > > >> maintainer would prefer there was no special support even for boot=
ing
> > > >> Linux directly!) =20
> > > >
> > > > i understand their point of view and agree with it. =20
> > > >>
> > > >> But in any case it doesn't really help U-Boot. I
> > > >> think the path forward might be to run QEMU twice, once to get its
> > > >> generated tree and once to give the 'merged' tree with the U-Boot
> > > >> properties in it, if people want to use U-Boot features.
> > > >>
> > > >> I do strongly believe that OF_BOARD must be a run-time option, not=
 a
> > > >> build-time one. It creates all sorts of problems and obscurity whi=
ch
> > > >> have taken months to unpick. See the above patch for the rationale.
> > > >>
> > > >> To add to that rationale, OF_BOARD needs to be an option available=
 to
> > > >> any board. At some point in the future it may become a common way
> > > >> things are done, e.g. TF-A calling U-Boot and providing a devicetr=
ee
> > > >> to it. It doesn't make any sense to have people decide whether or =
not
> > > >> to set OF_BOARD at build time, thus affecting how the image is put
> > > >> together. We'll end up with different U-Boot build targets like
> > > >> capricorn, capricorn_of_board and the like. It should be obvious w=
here
> > > >> that will lead. Instead, OF_BOARD needs to become a commonly used
> > > >> option, perhaps enabled by most/all boards, so that this sort of b=
uild
> > > >> explosion is not needed. =20
> > > >
> > > > If you mean that when boards are by construction providing a DTB to=
 U-Boot then I agree very much. But I don=E2=80=99t understand how the patc=
h set  supports it as it puts dts files for those boards to be built. =20
> > > >>
> > > >> U-Boot needs to be flexible enough to
> > > >> function correctly in whatever runtime environment in which it fin=
ds
> > > >> itself.
> > > >>
> > > >> Also as binman is pressed into service more and more to build the
> > > >> complex firmware images that are becoming fashionable, it needs a
> > > >> definition (in the devicetree) that describes how to create the im=
age.
> > > >> We can't support that unless we are building a devicetree, nor can=
 the
> > > >> running program access the image layout without that information.
> > > >>
> > > >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> > > >> germane...but of course I am not suggesting doing that, since OF_B=
OARD
> > > >> is, still, enabled. We already use OF_BOARD for various boards that
> > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for examp=
le
> > > >> (as I said in the cover letter "Most boards do provide one, but so=
me
> > > >> don't."). So this series is just completing the picture by enforci=
ng
> > > >> that *some sort* of devicetree is always present. =20
> > > >
> > > > That seems inconsistent with the OF_BOARD becomes the default. =20
> > >
> > > I think the key point that will get you closer to where I am on this
> > > issue, is that OF_BOARD needs to be a run-time option. At present it
> > > has build-time effects and this is quite wrong. If you go through all
> > > the material I have written on this I think I have motivated that very
> > > clearly.
> > >
> > > Another big issue is that I believe we need ONE devicetree for U-Boot,
> > > not two that get merged by U-Boot. Again I have gone through that in a
> > > lot of detail. =20
> >
> > I have a long long reply to your first reply here saved, but, maybe
> > here's the biggest sticking point.  To be clear, you agree that U-Boot
> > needs to support being passed a device tree to use, at run time, yes? =
=20
>=20
> Yes. The OF_BOARD feature provides this.
>=20
> >
> > And in that case, would not be using the "fake" tree we built in? =20
>=20
> Not at runtime.
>=20
> >
> > So is the sticking point here that we really have two classes of
> > devices, one class where we will never ever be given the device tree at
> > run time (think BeagleBone Black) and one where we will always be given
> > one at run time (think Raspberry Pi) ? =20
>=20
> I'm not sure it will be that black and white. I suspect there will be
> (many) boards which can boot happily with the U-Boot devicetree but
> can also accept one at runtime, if provided. For example, you may want
> to boot with or without TF-A or some other, earlier stage.

I don't understand this: as Tom mentioned this is a platform decision:
either it provides a DT somewhere (flash, EEPROM, prior firmware stage),
or it doesn't. Sure, you can always hack your own DT in, somehow, for
development or experimentation purposes, but that is a separate issue.

Most of those platforms actually utilise some dynamic DTs, btw, where
software amends the DT on the fly:
- Highbank has a stub DT in SPI flash, and the management controller
firmware detects the size and some extra DRAM (DIMMs!) parameters at boot
time, and writes the /memory node accordingly.
- RPi3/4 have DT overlay files on the SD card, and depending on what a
user wrote in config.txt, they get applied to the DT (or not).
- Even for the Allwinner H616 we amend the OF_SEPARATE provided DT copy in
DRAM in TF-A, to carve out the DRAM region TF-A occupies.
- QEMU is the obvious example, where the whole machine is highly dynamic,
and there is no such thing as a fixed DT (how many cores?, how much
memory?, how many virtio devices?, flash?, SCSI?)

> I believe we have  got unstuck because OF_BOARD (perhaps inadvertently)
> provided a way to entirely omit a devicetree from U-Boot, thus making
> things like binman and U-Boot /config impossible, for example.

I have the feeling this is because we abuse DT for this. Conceptually the
DT is not a configuration file, but a hardware description. I see that it
is also a nice and flexible, hierarchical key/value storage, for which we
have code in anyway, so it makes hardcoding data in the code easier to avoi=
d.
But as we see now, this has problems as well.

So shall we separate those use cases? And attach just a tree with /binman
and /config (in DTB format), but treat this separately from the hardware
description? (Admittedly I have still to wrap my head around why we need
/binman at U-Boot runtime in the first place.)

Cheers,
Andre

> So I
> want to claw that back, so there is always some sort of devicetree in
> U-Boot, as we have for rpi_3, etc.
>=20
> Regards,
> Simon


