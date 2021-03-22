Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79A3437E6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 05:26:22 +0100 (CET)
Received: from localhost ([::1]:41660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOC8z-0002d0-5K
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 00:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBvB-0006WI-V6; Mon, 22 Mar 2021 00:12:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42241 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBv9-0004l5-P8; Mon, 22 Mar 2021 00:12:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz3d71z9sXb; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=hgCrvoiOO4PwbCOlIJdhV7WU80RIE0Sh0/lc4YaksA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FocDcS61R74qspkipR/ftD1i4BFZYAwahUn9GFjgSdVFgoXVtjBoHg8bLSCPF+uud
 F7UJ67T4lHcf3dFWcbTq4wKMVfU10nPq7C+2H6BDDiu+WmsC/EzLu4JP0oqxDiEnyG
 0yewMPn64cNkNVFRXYHwd2BDt0q0hQaoXrdWN094=
Date: Mon, 22 Mar 2021 15:09:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 3/5] hw/pci-host/prep: Remove unuseful memory region
 mapping
Message-ID: <YFgYYHOroOLHBbm7@yekko.fritz.box>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-4-f4bug@amsat.org>
 <20210312203821.GN194839@xz-x1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5PRomczws350pwBI"
Content-Disposition: inline
In-Reply-To: <20210312203821.GN194839@xz-x1>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5PRomczws350pwBI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 03:38:21PM -0500, Peter Xu wrote:
> On Fri, Mar 12, 2021 at 07:28:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
> > The pci_io_non_contiguous region is mapped on top of pci_io
> > with higher priority, but simply dispatch into this region
> > address space. Simplify by directly registering the former
> > region in place, and adapt the address space dispatch offsets.
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> >  hw/pci-host/prep.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> > index 0a9162fba97..00a28c2d18c 100644
> > --- a/hw/pci-host/prep.c
> > +++ b/hw/pci-host/prep.c
> > @@ -159,8 +159,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr =
addr,
> >      uint8_t buf[4];
> > =20
> >      addr =3D raven_io_address(s, addr);
> > -    address_space_read(&s->pci_io_as, addr + 0x80000000,
> > -                       MEMTXATTRS_UNSPECIFIED, buf, size);
> > +    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, bu=
f, size);
> > =20
> >      if (size =3D=3D 1) {
> >          return buf[0];
> > @@ -191,8 +190,7 @@ static void raven_io_write(void *opaque, hwaddr add=
r,
> >          g_assert_not_reached();
> >      }
> > =20
> > -    address_space_write(&s->pci_io_as, addr + 0x80000000,
> > -                        MEMTXATTRS_UNSPECIFIED, buf, size);
> > +    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, b=
uf, size);
>=20
> This changes access to s->pci_io_as, but below didn't change s->pci_io_as
> layout at all (below is about address_space_mem).  Is this intended?
>=20
> >  }
> > =20
> >  static const MemoryRegionOps raven_io_ops =3D {
> > @@ -294,9 +292,8 @@ static void raven_pcihost_initfn(Object *obj)
> >      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
> > =20
> >      /* CPU address space */
> > -    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci=
_io);
> > -    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
> > -                                        &s->pci_io_non_contiguous, 1);
> > +    memory_region_add_subregion(address_space_mem, 0x80000000,
> > +                                &s->pci_io_non_contiguous);
>=20
> I don't know any of this code at all... but it seems the two memory regio=
ns are
> not identical in size:
>=20
>     memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
>     memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, =
s,
>                           "pci-io-non-contiguous", 0x00800000);
>=20
> Then it seems the memory access dispatching to (0x00800000, 0x3f800000) w=
ould
> change too, from s->pci_io to nothing.  Raise this up too since I don't k=
now
> either whether it's intended..

Right, it seems like this removes the mapping of s->pci_io entirely.

>=20
> >      memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci=
_memory);
> >      pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(o=
bj), NULL,
> >                               &s->pci_memory, &s->pci_io, 0, TYPE_PCI_B=
US);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5PRomczws350pwBI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYGGAACgkQbDjKyiDZ
s5LwtA/+PqtXEJnp/uS4dT+1vL0W4zGiza4spBIfipj9AkKKonshV+99xXxnjbNm
UQ6nLNcf8z3go9I53vWiOGGLMzG335KOp3Tp7wXwqJQE6AHj11hq6YudDAQiwnrD
3EJgl0df/3dIyCtzylz8hgUOJb5iq+5ox1T/5hRGg3S6fbczOYrkMYUnPXAYWE0L
e+kF+uzfc/4KTbSh7TjbHn6ZZ+p3CJ1Y4RCJ5XXCnf5Y90GkYezMOUQMjb/I7qqQ
EawMyq6SUDSBIwhH2+WU3DrU7Uww/YOZaw92AB5kjRXsOsaFr1uOYdLIS97frcXS
4s+sa4xcrVx3JWq+8+mjbOq5piwDRK5LkgzT+P/7BcxcefpvHSW6fg+BmzjApD/b
X1iLTbPEkb8KIHD6F27hflPBfrlN9zdsYy1M2TgiivJNre3oCSKnhOeeGi3mKrrv
OUciimpKpMPWVe5oW7td/Damt54V8DELsRLhVPTOLh9xK3Qtsg3GghbUyZfThrLo
dlXZK999nlHw9SuyE6QtxJdQ3nHz44QxzgQ31U4k+9XZhCfQhvdKIuLyAVrGBKX7
T3IcIxAUdkgOEX4WR1OrKoHv/51pY2/1yhTLPm9UnD9/aMYV7X6fdal6txX447PC
1xzzUaahDxzT34UXE+XuJY2kzhkPQ58RJ3EbNsrUPGEUB4mx/wk=
=8Qql
-----END PGP SIGNATURE-----

--5PRomczws350pwBI--

