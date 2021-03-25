Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB903486C4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:02:52 +0100 (CET)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFKl-00055p-0c
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIm-0003iO-NH; Wed, 24 Mar 2021 22:00:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFIk-0003CG-MW; Wed, 24 Mar 2021 22:00:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5SxQ1jVmz9sWV; Thu, 25 Mar 2021 13:00:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616637642;
 bh=8cShp0claiw1/0hq+jyBEid2vCfwOTh+uW6LiOXhd54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a85lBk8Zimv6iBYJ+7RvwD8fPygRRd5NH94CINgyowm09rvRx89mcQlhzVHUdoIbw
 DWkGptXn9UO7mH1R7v5jYh9fIX8Gz2jPAS0TN85xuViutYwN+hfI1oP9KRMjUnMM4A
 2pLLYOSd8nzRtMud3ty1uU8dt7OmoETa3nfAZ7W0=
Date: Thu, 25 Mar 2021 13:00:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 7/7] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Message-ID: <YFvuxA56skAikWv4@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
 <YFk8iCC3IhGw1TqL@yekko.fritz.box>
 <e1f21b2-398d-1422-2b49-6f3ebe5a9cef@eik.bme.hu>
 <YFqZt6NaXuOmgBza@yekko.fritz.box>
 <66385c2e-72f5-c993-dc86-6cfaa9c0dffd@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0lpYuRNjf5gE58uu"
Content-Disposition: inline
In-Reply-To: <66385c2e-72f5-c993-dc86-6cfaa9c0dffd@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0lpYuRNjf5gE58uu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 12:21:02PM +0100, BALATON Zoltan wrote:
> On Wed, 24 Mar 2021, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 02:01:27PM +0100, BALATON Zoltan wrote:
> > > On Tue, 23 Mar 2021, David Gibson wrote:
> > > > On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> > > > > Add new machine called pegasos2 emulating the Genesi/bPlan Pegaso=
s II,
> > > > > a PowerPC board based on the Marvell MV64361 system controller an=
d the
> > > > > VIA VT8231 integrated south bridge/superio chips. It can run Linu=
x,
> > > > > AmigaOS and a wide range of MorphOS versions. Currently a firmwar=
e ROM
> > > > > image is needed to boot and only MorphOS has a video driver to pr=
oduce
> > > > > graphics output. Linux could work too but distros that supported =
this
> > > > > machine don't include usual video drivers so those only run with
> > > > > serial console for now.
> > > > >=20
> > > > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > > > ---
> > > > >  MAINTAINERS                             |  10 ++
> > > > >  default-configs/devices/ppc-softmmu.mak |   2 +
> > > > >  hw/ppc/Kconfig                          |   9 ++
> > > > >  hw/ppc/meson.build                      |   2 +
> > > > >  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++=
++++++
> > > > >  5 files changed, 167 insertions(+)
> > > > >  create mode 100644 hw/ppc/pegasos2.c
> > > > >=20
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index b6ab3d25a7..1c3c55ef09 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -1353,6 +1353,16 @@ F: pc-bios/canyonlands.dt[sb]
> > > > >  F: pc-bios/u-boot-sam460ex-20100605.bin
> > > > >  F: roms/u-boot-sam460ex
> > > > >=20
> > > > > +pegasos2
> > > > > +M: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > +R: David Gibson <david@gibson.dropbear.id.au>
> > > > > +L: qemu-ppc@nongnu.org
> > > > > +S: Maintained
> > > > > +F: hw/ppc/pegasos2.c
> > > > > +F: hw/pci-host/mv64361.c
> > > > > +F: hw/pci-host/mv643xx.h
> > > > > +F: include/hw/pci-host/mv64361.h
> > > >=20
> > > > Oh, sorry about the comment in the previous patch.
> > > >=20
> > > > >  RISC-V Machines
> > > > >  ---------------
> > > > >  OpenTitan
> > > > > diff --git a/default-configs/devices/ppc-softmmu.mak b/default-co=
nfigs/devices/ppc-softmmu.mak
> > > > > index 61b78b844d..4535993d8d 100644
> > > > > --- a/default-configs/devices/ppc-softmmu.mak
> > > > > +++ b/default-configs/devices/ppc-softmmu.mak
> > > > > @@ -14,5 +14,7 @@ CONFIG_SAM460EX=3Dy
> > > > >  CONFIG_MAC_OLDWORLD=3Dy
> > > > >  CONFIG_MAC_NEWWORLD=3Dy
> > > > >=20
> > > > > +CONFIG_PEGASOS2=3Dy
> > > >=20
> > > > I don't think we can have this default to enabled while it requires=
 a
> > > > non-free ROM to start.
> > >=20
> > > Not having it enabled though does not help those who might want to us=
e it as
> > > they are not people who can compile their own QEMU but rely on binari=
es so
> > > adding it without also enabling it is like it wasn't there at all in
> > > practice.
> >=20
> > Not convinced, sorry.  If it's not usable out of the box, having to
> > build from source is kind of expected.  Or you could convince someone
>=20
> I accept your point however there's a difference of only needing a ROM im=
age
> to be able to use it from your distro's binary and having to rebuild it f=
rom
> source. So to me needing a ROM does not make it expected having to rebuild
> it. Needing to configure it some way would make that expected.

Well, you could always lobby the distro to include it.  Honestly I
think the distros would probably choose not to include something for
such a niche case, even if it was enabled by default upstream.   At
least.. if they were paying attention, which they're likely not.  But
sneaking something in via a side route is not something I'm going to
encourage.

> > (or do it yourself) to provide prebuild binaries for this purpose that
> > have the right things enabled.
>=20
> There are people who provide binaries with patches for such purposes but
> that limits the availability of it compared to having it in all distro
> binaries without further effort. As I said I also plan to solve this
> eventually but I'd probably need VOF for that. Will that be merged at las=
t?

I hope so, yes.  I've finally had some time to review recent rounds.
It'll be 6.1 material as well, obviously.  Note that there are some
issues you'll have to sort out to use this for Pegasos which doesn't
have an actual hypervisor mode.

> Other alternatives would be modifying SLOF, OpenBIOS or OpenFirmware or
> rewrite SmartFirmware to free it from its non-distributable parts but I
> think VOF would be a simpler way also avoiding adding another full OF
> implementation to QEMU that already has more than there should be.
>=20
> Regards,
> BALATON Zoltan
>=20
> > > I can attempt to make some guests boot without a ROM but since
> > > guests expect an OpenFirmware client interface, I'll need something to
> > > provide that. I'm waiting for VOF to be merged for this.
> > >=20
> > > Regards,
> > > BALATON Zoltan
> >=20
> >=20
> >=20


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0lpYuRNjf5gE58uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb7sQACgkQbDjKyiDZ
s5JN5RAAnBjLNOjqn3UFXm75JqbdixdN9YzDJ6maOzncYkhXqMDcvEd6mLxTfkqX
YOCBT/Zk+6luVNjyBbqjPK+U2yX2ilUAoI3ZFscLsbieKafvO1T8+tQdWTWXfG6w
8DqJTuD7he+y9QZv/a56nenQMRvu0GEjgP98DlWXI8JYUbfazyIll/00ix7EbcC7
MtHkoNzC6R37KGLGrJ0V9JzJS7t3jPcyWLv/JUhkdvqvc2b3zxk+xcpeixl6W5aM
FwXjd4FWCpa4HXyh/HHMw6FRcu4XvDTi8yBVqWaDwoYj+JP73bQC03y5NOGVW4FF
AuXpNY5l/51ritlwVesuSgC7JOLPCOgN+iQVBST33DjgsTQ0opeVu5ddaHEFWn5t
vmgcEJBtpdU91H45DRIe0ctk8nAk0GzjGkSWzX1SK++O9S8j4RQMG9GZi7EjHVYi
p8FIUUFc9aua4luojf/CZs10zS4D4/nR0vF6pnwHL/uCteh7/nSKJww/loPSDv7I
rm6Kmaa6U/svDe9mDmuHhy0nGzMXjCmF4gkVuxcNnSSudlOW6tkezYicm5xvTL+1
MdfCgyplU9yF1tdQw0YMNfI7ebi6FgZozIpWMaHUs/t6PeKXHyVBX/ZoxWilS2XL
8piCLCu5yWYSz2g4e+KXDh8lmiPfvEHyNDG0J3XLIHFV/3tgCuM=
=kSvK
-----END PGP SIGNATURE-----

--0lpYuRNjf5gE58uu--

