Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0B346F1C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:56:30 +0100 (CET)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOsl3-0006zn-Fn
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsdw-00029l-GC; Tue, 23 Mar 2021 21:49:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOsds-0007uA-SW; Tue, 23 Mar 2021 21:49:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4rkN6TNQz9sWf; Wed, 24 Mar 2021 12:49:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616550540;
 bh=9syayiWaMWc0JAdglac/M4YGysUjM/lqiPUPQw7Bx5g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlWZvetkWzKaTZ70M1AgM1OYb6S7npvn4l2pPHg3vZPShDO2TE8+2TyCbLgKFUETH
 x5H0ytYOSXj4os8hhSfejFhSD1XDjpjdtVmfJRcJqDVVc7n5F2TYeIkzxGOMFGRPjK
 vbY3pinW8YiM5uYHkp30mmZ9yRvVuDNTDH/T6zP4=
Date: Wed, 24 Mar 2021 12:45:27 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v10 7/7] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
Message-ID: <YFqZt6NaXuOmgBza@yekko.fritz.box>
References: <cover.1615943871.git.balaton@eik.bme.hu>
 <b1639705f196d229647a8fc36e5d1a92f6c58b76.1615943871.git.balaton@eik.bme.hu>
 <YFk8iCC3IhGw1TqL@yekko.fritz.box>
 <e1f21b2-398d-1422-2b49-6f3ebe5a9cef@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7mHYZ4T1B+s0sga8"
Content-Disposition: inline
In-Reply-To: <e1f21b2-398d-1422-2b49-6f3ebe5a9cef@eik.bme.hu>
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


--7mHYZ4T1B+s0sga8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 02:01:27PM +0100, BALATON Zoltan wrote:
> On Tue, 23 Mar 2021, David Gibson wrote:
> > On Wed, Mar 17, 2021 at 02:17:51AM +0100, BALATON Zoltan wrote:
> > > Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
> > > a PowerPC board based on the Marvell MV64361 system controller and the
> > > VIA VT8231 integrated south bridge/superio chips. It can run Linux,
> > > AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
> > > image is needed to boot and only MorphOS has a video driver to produce
> > > graphics output. Linux could work too but distros that supported this
> > > machine don't include usual video drivers so those only run with
> > > serial console for now.
> > >=20
> > > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > ---
> > >  MAINTAINERS                             |  10 ++
> > >  default-configs/devices/ppc-softmmu.mak |   2 +
> > >  hw/ppc/Kconfig                          |   9 ++
> > >  hw/ppc/meson.build                      |   2 +
> > >  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++=
++
> > >  5 files changed, 167 insertions(+)
> > >  create mode 100644 hw/ppc/pegasos2.c
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b6ab3d25a7..1c3c55ef09 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1353,6 +1353,16 @@ F: pc-bios/canyonlands.dt[sb]
> > >  F: pc-bios/u-boot-sam460ex-20100605.bin
> > >  F: roms/u-boot-sam460ex
> > >=20
> > > +pegasos2
> > > +M: BALATON Zoltan <balaton@eik.bme.hu>
> > > +R: David Gibson <david@gibson.dropbear.id.au>
> > > +L: qemu-ppc@nongnu.org
> > > +S: Maintained
> > > +F: hw/ppc/pegasos2.c
> > > +F: hw/pci-host/mv64361.c
> > > +F: hw/pci-host/mv643xx.h
> > > +F: include/hw/pci-host/mv64361.h
> >=20
> > Oh, sorry about the comment in the previous patch.
> >=20
> > >  RISC-V Machines
> > >  ---------------
> > >  OpenTitan
> > > diff --git a/default-configs/devices/ppc-softmmu.mak b/default-config=
s/devices/ppc-softmmu.mak
> > > index 61b78b844d..4535993d8d 100644
> > > --- a/default-configs/devices/ppc-softmmu.mak
> > > +++ b/default-configs/devices/ppc-softmmu.mak
> > > @@ -14,5 +14,7 @@ CONFIG_SAM460EX=3Dy
> > >  CONFIG_MAC_OLDWORLD=3Dy
> > >  CONFIG_MAC_NEWWORLD=3Dy
> > >=20
> > > +CONFIG_PEGASOS2=3Dy
> >=20
> > I don't think we can have this default to enabled while it requires a
> > non-free ROM to start.
>=20
> Not having it enabled though does not help those who might want to use it=
 as
> they are not people who can compile their own QEMU but rely on binaries so
> adding it without also enabling it is like it wasn't there at all in
> practice.

Not convinced, sorry.  If it's not usable out of the box, having to
build from source is kind of expected.  Or you could convince someone
(or do it yourself) to provide prebuild binaries for this purpose that
have the right things enabled.

> I can attempt to make some guests boot without a ROM but since
> guests expect an OpenFirmware client interface, I'll need something to
> provide that. I'm waiting for VOF to be merged for this.
>=20
> Regards,
> BALATON Zoltan


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7mHYZ4T1B+s0sga8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBambcACgkQbDjKyiDZ
s5LqxA//e5JCD0dixzV8Euhlx7KgmtFRqFS8mwJ8bgNLgzBLPXZ0iI2b5RbwM7Wg
SVrD5D0VMjUQ4ldMnmGlUvUA+Hu6UMjsrank4dA0GBiBao9wCmicRifumZwdeyGg
4xogiBFu/qyEmxmkbA5VjdDZZU+sp5Jefss80bwCpyY6UmHIIqY7p1h/nH8M3PYB
XrKm9svFA/sOLp3b5UOgcC4CaiYB/UzOnD+UgJdi7AT1XKdHD70wKb76O+QfUSUt
n7fd/zVniWk5niVhpTwHy0hgI8WOco2u29puUFYIM3xuMGwGkhm78+2y3rP5VsEE
GiOmGv0jOiAmPzYixkcgWDCzCK6hAwZSQNf9mPy3ykxbUvar7Tlo3zmbAwVXVk8O
lllYvQKah1SvaYiQwL4FcEtOpRjE5bg+HxEs5mAjn4bNs46Hucgl/V+vvM5up1nB
p8N5TAwsNhF+Ky2oYJ6heWGzxcaSxgp28tAvUo6VGSKlbeb12WcUjc5kVFUUgGoK
s0l5IHWQUrKOEuJO3D+OVE0NTNYLkR29SQSfp975ogSksrsii9RDE56MgljklGty
WpRfqZ63I/be05N67n8auy5ye86RjEnrLP92I3qKw9JhZwktG7wsqVBrXWza/N65
T3DZ+1T+DnKGTNIWhA3NzIwWpaTAIkUJRH1ivRCF5yarDmg3Rzk=
=TEwA
-----END PGP SIGNATURE-----

--7mHYZ4T1B+s0sga8--

