Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C442DE9D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:49:08 +0200 (CEST)
Received: from localhost ([::1]:59494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2yg-00035z-6a
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mb2eT-0003Ij-5R
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:28:13 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mb2eO-0000Wr-TQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:28:11 -0400
Received: by mail-qv1-xf36.google.com with SMTP id o13so3945570qvm.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9kIGUVqu1Hiob15xi0Inc1iCTtmVD+LbPUtegBoxv8g=;
 b=W+bheyB/4f2dTCG4o53COE9jI/niibp2XR4Z5DMQC51oVaHA/RKvbdWetch1CzAJeC
 eU5d8q11yQ38mh01dJl/4RX0y2pwQDcih4bkcVJq095Or61H3UERAVSnegXgqvR2LFxI
 oJoJJPHP12/z3thsNvAgM0lKRkapo/G/eAr2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9kIGUVqu1Hiob15xi0Inc1iCTtmVD+LbPUtegBoxv8g=;
 b=fyxFf0OefLE1xEtm3e9jPY+RnGl0rW+IVwkCX2YGFv+8f6sRQKs5dBlLbk/YaI+Hhq
 xtZKkOG2upx08uld0GLx0i2ErxjNqPvFr5+QTyn5SAfOimwwZUiTbANs7/+m5OnRA68T
 sbE758wd/GwhiE5ET4pkj6aBSJ8SnXlSZ+ARdFpL+vM9eqJN4N7khNwMhafu3BgOmCep
 TU6nrLmaOie6kwTWyAcVgNxvHtMmqeT8917tid7DzJkKssYa/6cDI41Bf/dWl0M0GoBA
 s8DYAUL6RdOTNnx8UggQBBJHSr/J+hOSvvpd8XxSnlqRMR1SaYNajIceA6dI5MV2AQ1n
 YldA==
X-Gm-Message-State: AOAM533A5JxskHzVaK9Iht5spJozsHrxn7DmfomOj1LVYsYdkLkBw9oQ
 o6jHLMmJmlAPD6r0TBM76UkNYQ==
X-Google-Smtp-Source: ABdhPJx2a0erP+vgsS4RMaYuMFHzhHtWyLpBznEVC2YIXvH2OhVslEEHdekUmcFoSs1BCFrQI1rIRg==
X-Received: by 2002:a05:6214:194b:: with SMTP id
 q11mr5870512qvk.38.1634225286290; 
 Thu, 14 Oct 2021 08:28:06 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0d65-5385-0e85-d408.res6.spectrum.com.
 [2603:6081:7b01:cbda:d65:5385:e85:d408])
 by smtp.gmail.com with ESMTPSA id f23sm888882qtq.40.2021.10.14.08.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:28:05 -0700 (PDT)
Date: Thu, 14 Oct 2021 11:28:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211014152801.GF7964@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FKwKGrdyenXpCzpq"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf36.google.com
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
 Priyanka Jain <priyanka.jain@nxp.com>,
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


--FKwKGrdyenXpCzpq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > Hi Fran=C3=A7ois,
> > >
> > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linar=
o.org> wrote:
> > > >
> > > > Hi Simon
> > > >
> > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a=
 =C3=A9crit :
> > > >>
> > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > >>
> > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
> > > >> >
> > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > >> > > Hi Simon,
> > > >> > >
> > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org>=
 wrote:
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
> > > >> > > > (and placeholders) to make the build work.
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
> > > >> > > I am not sure I understand the whole point of this.
> > > >> >
> > > >> > I am also confused and do not like the idea of adding device tre=
es for
> > > >> > platforms that are capable of and can / do have a device tree to=
 give us
> > > >> > at run time.
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
> > > >> Linux directly!)
> > > >
> > > > i understand their point of view and agree with it.
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
> > > >> explosion is not needed.
> > > >
> > > > If you mean that when boards are by construction providing a DTB to=
 U-Boot then I agree very much. But I don=E2=80=99t understand how the patc=
h set  supports it as it puts dts files for those boards to be built.
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
> > > >> that *some sort* of devicetree is always present.
> > > >
> > > > That seems inconsistent with the OF_BOARD becomes the default.
> > >
> > > I think the key point that will get you closer to where I am on this
> > > issue, is that OF_BOARD needs to be a run-time option. At present it
> > > has build-time effects and this is quite wrong. If you go through all
> > > the material I have written on this I think I have motivated that very
> > > clearly.
> > >
> > > Another big issue is that I believe we need ONE devicetree for U-Boot,
> > > not two that get merged by U-Boot. Again I have gone through that in a
> > > lot of detail.
> >
> > I have a long long reply to your first reply here saved, but, maybe
> > here's the biggest sticking point.  To be clear, you agree that U-Boot
> > needs to support being passed a device tree to use, at run time, yes?
>=20
> Yes. The OF_BOARD feature provides this.
>=20
> >
> > And in that case, would not be using the "fake" tree we built in?
>=20
> Not at runtime.

OK.

> > So is the sticking point here that we really have two classes of
> > devices, one class where we will never ever be given the device tree at
> > run time (think BeagleBone Black) and one where we will always be given
> > one at run time (think Raspberry Pi) ?
>=20
> I'm not sure it will be that black and white. I suspect there will be
> (many) boards which can boot happily with the U-Boot devicetree but
> can also accept one at runtime, if provided. For example, you may want
> to boot with or without TF-A or some other, earlier stage.

I'm not sure I see the value in making this a gray area.  There's very
much a class of "never" boards.  There's also the class of "can" today.
Maybe as part of a developer iterative flow it would be nice to not have
to re-flash the prior stage to change a DT, and just do it in U-Boot
until things are happy, but I'm not sure what the use case is for
overriding the previous stage.

Especially since the pushback on this series I think has all been "why
are we copying in a tree to build with?  We don't want to use it at run
time!".  And then softer push back like "Well, U-Boot says we have to
include the device tree file here, but we won't use it...".

> I believe we have got unstuck because OF_BOARD (perhaps inadvertently)
> provided a way to entirely omit a devicetree from U-Boot, thus making
> things like binman and U-Boot /config impossible, for example. So I
> want to claw that back, so there is always some sort of devicetree in
> U-Boot, as we have for rpi_3, etc.

I really want to see what the binary case looks like since we could then
kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
then also do a rpi_arm32_defconfig too.

I want to see less device trees in U-Boot sources, if they can come
functionally correct from the hardware/our caller.

And I'm not seeing how we make use of "U-Boot /config" if we also don't
use the device tree from build time at run time, ignoring the device
tree provided to us at run time by the caller.

--=20
Tom

--FKwKGrdyenXpCzpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFoTIEACgkQFHw5/5Y0
tyyvXQv+Oj/Hio5H9L7H7Q/DQK5ctVVUFtHR0P49Bc1hmvLXF1xFwAl5p28KrZCy
qeMz+I4GGk4ijY8ixkaS7/yWyfWHmqc5JAwSaCbmWcU6lO1cRj6I+O+BoHpZP0bf
kDplm3e5jQMEwqE2IIhT4knTbW5gQfhyH3/rG8+K1AaZGqmImlEu9eZJHwbzxKG3
yuhZjR4UmXo9cs6D/RRAyrXXz95ki3Q5t2F1DsjgOYLgn6bw/jYMhX+RQ99sENGy
EbhiOTbT4CVz8e34wT2IAhFNvXlil+eN7IXfhjAaOyYXoWuwrXIe0FkrCP12two5
LfXnF39S5vJe/QZ2ptf03O5OsxXjuRCNWCGNT5KN5m2TqydpQK3oyZZHffyUnkdL
WHOEG28gGr792Cd2CPrZkDff2NO5/O/o27SqabIQtqRXtcGEVRTW9L9wUjLaG1E0
n/jp0dZq6NdhiKeiEPdXGHT6lVTpia1poC5LTs9M0d2nLoCzBt3fPh7Q5hq9L80k
+qcBIbkM
=ycdr
-----END PGP SIGNATURE-----

--FKwKGrdyenXpCzpq--

