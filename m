Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D625F14C48C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 03:14:06 +0100 (CET)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwcrl-0007Oe-EZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 21:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iwcqu-0006Si-5f
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 21:13:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iwcqs-0001VN-Bb
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 21:13:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:57323)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iwcqr-0001UO-Is; Tue, 28 Jan 2020 21:13:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 486n7x6T9Xz9sNF; Wed, 29 Jan 2020 13:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1580263981;
 bh=R4N9GXZEBf3haYG1LxyC5OVnr+vzfKSrG58Gk4iPkvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pkdinFM1eZY9RLdOP4AU/ZXmMi5vGDYcPGPQ28Tl291TCvQq87kzyF0R3P9TTJQV6
 H3J41m94mVUtwJPOLqCSdYvmBtikA5xDn+Ik2M0BydnGsR8XJLLFoQDbSFlGqiWqaK
 UEzS4n5ZELCOE8AOicJfPQJTRkHt+PC8GkppQxCo=
Date: Wed, 29 Jan 2020 13:04:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/3] ppc/pnv: Add a "hostboot" mode
Message-ID: <20200129020450.GU42099@umbus.fritz.box>
References: <20200127144154.10170-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J9YdZykiGPT3Jhx7"
Content-Disposition: inline
In-Reply-To: <20200127144154.10170-1-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J9YdZykiGPT3Jhx7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 03:41:51PM +0100, C=E9dric Le Goater wrote:
> Hello,
>=20
> The QEMU PowerNV machine was first designed to start with a skiboot
> firmware at 0x0, which then loads a kernel and ramfs acting as a boot
> loader. Support of the POWER processor improving in QEMU, it has been
> possible to support other firmwares.
>=20
> These changes add support for firmwares mapped at a different address
> than 0x0. First two patches are fixes/cleanups and the last one adds a
> "hb-mode" option to the machine for this purpose. It needs some
> discussion to see how we want to activate this new mode.

Applied to ppc-for-5.0, thanks.

>=20
> Thanks,
>=20
> C.
>=20
> C=E9dric Le Goater (3):
>   ppc/pnv: Add support for HRMOR on Radix host
>   ppc/pnv: remove useless "core-pir" property alias.
>   ppc/pnv: Add support for "hostboot" mode
>=20
>  include/hw/ppc/pnv.h      |  2 ++
>  include/hw/ppc/pnv_core.h |  1 +
>  hw/ppc/pnv.c              | 28 +++++++++++++++++++++++++++-
>  hw/ppc/pnv_core.c         | 31 ++++++++++++++++---------------
>  hw/ppc/pnv_lpc.c          |  5 ++++-
>  target/ppc/mmu-radix64.c  |  6 ++++++
>  6 files changed, 56 insertions(+), 17 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--J9YdZykiGPT3Jhx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4w6EAACgkQbDjKyiDZ
s5I6LA/6Az0k1+X3JEYzVXEl5YFcB48bjcHnrwDIW74RWrwEpc66euSlpqe2j3uX
+WxJuj4S+Zb/uGilm8aXAe5kw4pfbykEEHNEgHjcx7VZ0V+yGTiXTp7BewtaOBKV
YY6Nj8C+7D8bnKB7bNHdK/VXds9cm5n8XCQdU5nXJUyHbS+ynu23AOuL3v8bACSW
O2m09+Rh3pJWvZpMx/7DAmwP4eDGPC++yzXGsB6t5NO42Eqlbu8NeedeCoYvFkE/
1pDJFoo5r/vGEceeVjWdvd/73PWfPusMbI2dJ2d/StIUbPrJDRB+XgWDHkLGF2+p
wlhH0zECgZIV9ma2Znwwz4DRiN0xxaO8uFx0laNEhwjxw9hvX0SxR9bonuOqDctX
QMtgldCcGkc7RYMHygjHB46oXX9Lz43WTAaFz2BYXIgrCXukLmceETMeYZoqz+6e
4cfTvN2ynn5aDPqH/qdkKad3HfZEbpTRNgJGvpbSKZ3XAcvd2iF6PF/hJiy7JHH6
qYGsPZIbCOKoG3C3gh2e483BK8DfxRaXFyCBgQ7TYUSsRx563fWBBxBIk12m9+fd
VBvahYF0lZVEIarXQnwrtcG1Fk4yFuMmAKKWcHs7pvHGxBqg1FuoZbVHgbv4dQP8
RzkpNx50+cBSJwpvOee+RBdBoK0xslLWo9TYMX61TWK6kcaQ+po=
=24JK
-----END PGP SIGNATURE-----

--J9YdZykiGPT3Jhx7--

