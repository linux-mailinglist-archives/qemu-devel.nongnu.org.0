Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379288A02B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 15:56:01 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxAno-00083l-DH
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 09:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmJ-0006MN-IY
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmI-0008Q7-Dd
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:54:27 -0400
Received: from ozlabs.org ([203.11.71.1]:59551)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmH-0008N5-5Z; Mon, 12 Aug 2019 09:54:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466clc71hNz9sN6; Mon, 12 Aug 2019 23:54:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618060;
 bh=pu/J2jW5GwT4LudRWrfBUop3dQdp+HqCl+PQgRZ8k2w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWg8+FfvZ2gDHF52pyrA5EyYaFR7xUnbn9Cc4BpCEHiRxJQNVH0jWGYzi2ZOMceCz
 o4x7EVCUGK6bLIe+exgDU5a2gPnosP39igMjUcStrJjke8Hku/tvzVNqqPs2u7lKtT
 TVsBFq84AlTPNKatVQ7mw9R6tiUZWr3xTaOwgDf0=
Date: Mon, 12 Aug 2019 20:08:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190812100849.GF3947@umbus.fritz.box>
References: <20190719024555.18845-1-aik@ozlabs.ru>
 <ae3e5bd1-c7dd-d893-5c0e-803f4e4f2325@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <ae3e5bd1-c7dd-d893-5c0e-803f4e4f2325@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [GIT PULL for qemu-pseries REPOST]
 pseries: Update SLOF firmware image
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 02:14:39PM +0530, Aravinda Prasad wrote:
> Alexey/David,
>=20
> With the SLOF changes, QEMU cannot resize the RTAS blob. Resizing is
> required for FWNMI support which extends the RTAS blob to include an
> error log upon a machine check.
>=20
> The check to valid RTAS buffer fails in the guest because the rtas-size
> updated in QEMU is not reflecting in the guest.
>=20
> Any workaround for this?

Well, we should still be able to do it, it just means fwnmi would need
a SLOF change.  It's an inconvenience, but not really a big deal.

> The following FWNMI work which is under review modifies the rtas-size to
> accommodate the error log:
> https://lists.nongnu.org/archive/html/qemu-ppc/2019-06/msg00142.html
>=20
>=20
> Regards,
> Aravinda
>=20
> On Friday 19 July 2019 08:15 AM, Alexey Kardashevskiy wrote:
> > I messed up with my local git so reposting.
> >=20
> > The following changes since commit 216965b20b04fbf74e0ce3a3175a9171dba2=
10de:
> >=20
> >   ppc/pnv: update skiboot to v6.4 (2019-07-18 16:49:57 +1000)
> >=20
> > are available in the Git repository at:
> >=20
> >   git@github.com:aik/qemu.git tags/qemu-slof-20190719
> >=20
> > for you to fetch changes up to 300118db53cc454b049d64418c7b2588165a1c35:
> >=20
> >   pseries: Update SLOF firmware image (2019-07-19 12:43:27 +1000)
> >=20
> > ----------------------------------------------------------------
> > Alexey Kardashevskiy (1):
> >       pseries: Update SLOF firmware image
> >=20
> >  pc-bios/README   |   2 +-
> >  pc-bios/slof.bin | Bin 926432 -> 926784 bytes
> >  roms/SLOF        |   2 +-
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> >=20
> > *** Note: this is not for master, this is for pseries
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1ROrEACgkQbDjKyiDZ
s5Ipjw//ZgbyJ0Q4+je5W30Slnf2Nh6/pyQiwYYHV+v/+abANGHm14XYaeac3XE2
/y8O03klVB6D4XMwmGVXe86cU+A0l4aaLS7/604NHThLvyWL7ROUmNBZL623UH13
95O25qu+4F16hWlIh45lDskmzjGd/3RjIqFdM/dqodu/eXnWh5W6gcf3N9XWuNUF
8UOpWMwjPaHbhgyT05cd5zNETnERFLebeiPrzGj0LRHCkV70gTqcxHpHK7afE/i0
sG0Mlt9Vj0bN2JzymK11O2W6uTGrEM30KzrvTevvVAvnmYaWUweSFUMM536A27Zt
UExagN73oxwMEzlctFQldwKHHCaYr1dCxYpQBVj+YTE7k3Kh/nUNQzVHK5/ZQaFO
FPClaDXiJRFCK3wxZwkbBAGnQseFybKTNS9xyoI/dIaUvj21rKmkE0xkevSNbGM7
qavPcRkqkKEj6LH7oCOUxAVi0a1tiL8+V1yu+z/BPsPkn9/Uve7y3xsV2e9ifwB+
CVxroABzun85++wSxttpq3erUQJmp03Uuz6hGw9cIuZYCwf8483Daelz7HumpfQS
pwBUpXivoJA3N37JMGbN67BAjWSpxA4YO/9Uci3mi7Sf+J9nK7QfpIiO9+q+fIcN
kGudAM+VVfflEbXoc3VvH0xgqeLQ280xCg2hPLm3MlUx6mR7DC8=
=gWMl
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--

