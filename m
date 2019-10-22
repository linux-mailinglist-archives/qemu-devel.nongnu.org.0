Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD82DFECB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:57:46 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMp33-0003sQ-6f
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iMp1K-0002Bu-9h
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iMp1I-0005Zr-93
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:55:58 -0400
Received: from ozlabs.org ([203.11.71.1]:43201)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iMp1E-0005Vw-Ib; Tue, 22 Oct 2019 03:55:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46y5R84lHlz9sPh; Tue, 22 Oct 2019 18:55:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1571730948;
 bh=vAp2gikRTBrPeicF8J5RuD9SmmwGPyNfU4muzDVBqP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckXaX6AhN8gaFyNwkueeUkmVFSDPkKZ5ZLVOLOB4Rf7SibzCavEAoAmONQBeQUF6/
 Rq8yWOx6zN8ync8nodzRITi1PlX94dv76gm5ea2to+5KEAqHIiQqNcCksxph5uq3O4
 j4LbAYjnU2a+oEDWYZzWe5RWn/4yDNOO+2Jv2j+M=
Date: Tue, 22 Oct 2019 18:41:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [GIT PULL for qemu-pseries] pseries: Update SLOF firmware image
Message-ID: <20191022074115.GJ6439@umbus.fritz.box>
References: <20191022040945.35730-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z8yxTSU1mh2gsre7"
Content-Disposition: inline
In-Reply-To: <20191022040945.35730-1-aik@ozlabs.ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Z8yxTSU1mh2gsre7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 03:09:45PM +1100, Alexey Kardashevskiy wrote:
> The following changes since commit 7cff77c24d8f5e558cef3538a44044d66aa225=
a5:
>=20
>   spapr: Move SpaprIrq::nr_xirqs to SpaprMachineClass (2019-10-16 12:01:4=
1 +1100)
>=20
> are available in the Git repository at:
>=20
>   git@github.com:aik/qemu.git tags/qemu-slof-20191022
>=20
> for you to fetch changes up to 8e59d05f71ae783e12a8eb7eb582e0a86ba3d6dc:
>=20
>   pseries: Update SLOF firmware image (2019-10-22 15:05:36 +1100)

Applied to ppc-for-4.2, thanks.

>=20
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>       pseries: Update SLOF firmware image
>=20
>  pc-bios/README   |   2 +-
>  pc-bios/slof.bin | Bin 930640 -> 928552 bytes
>  roms/SLOF        |   2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
>=20
> *** Note: this is not for master, this is for pseries
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Z8yxTSU1mh2gsre7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2uspkACgkQbDjKyiDZ
s5IZ7A/9F72VCqamzQUP+p8QQcLGqMCtv0QOYnqu33S/3UyASAuDgaAFD03S6qx1
Y9BcbVSXFobN9lDU7sKtrZlVNlMehmdcoedMCmMW02Oz4deZzzcVrxSOg4Lkhaq0
K/IPzhrxKPKl+TcwKAhiQ0ohn08B9TvF3IwO0gvZXhDRclvXtRLRdQVdg5RbP6gi
aeUiulT7j40IUkmBKys+bjD259ptqdgW8hGtg1RKZkBOxJNNj6gOnTXPdo8sZ0uV
9ReMgqNqjCEgPK+PrFvEZSGR2wZajf2rl8flqRR+2jZoEyKfOo+J0B9zrWV8y8GP
MQLXDUM3HhAxq7h+OTcOrr5782q//8UjyvGDgW2Eck7eRac0PY+sn4W+8KuRPwTn
0vuxQ47ATzHocRpYUcbNGj6Rcr7wv4Od5BhSkXXx5z57D1J/TvAeq8UBNJcc+u/4
pSxt1eAzCOXSo2A4Jq12rcYOVn8teHvOtImlEASXXszPE9xWsXhSUtZqvMxmVVJ8
/L38anPmAnEQrxQkDtrCTHtJpF/qBk0/Tq2G9z2nov6VsFu+J3qpX9jN63DLl/50
akywRcTlizaIVHch9hKyiAyx5Zgk+J1uQ3UAKf8y00RDbmKB5Vgcf3LGos3erS6x
dBX7ZH3TnPiKUegJVRQl9xGzLtYt57Nn+vMD6j1wcQwP9qVFKmQ=
=i66+
-----END PGP SIGNATURE-----

--Z8yxTSU1mh2gsre7--

