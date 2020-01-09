Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545A135175
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 03:33:12 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipNdG-0002t3-To
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 21:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1ipNaJ-0008Rm-QI
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:30:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ipNaD-0000Sy-JG
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 21:30:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33513 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ipNaC-0000Gw-77; Wed, 08 Jan 2020 21:30:01 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47tVSg4wfsz9sRY; Thu,  9 Jan 2020 13:29:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578536995;
 bh=kLoKoYPF03j77nWoj3ePyUk3E/pGbgi42kFIS+n4cvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lz83aYQwiGPY9DejxiFllwMpsUJiaH3HFjFsQRvOBDWcyb4QJT+hlEH26qFoV6qB8
 gyE3yY6S0Khg+iKpicF3jsqAwNUL0YyP8DvELtyz6tMmizkG41/kOWk3bCytdWlUo+
 F2nSd7JY0i4N/8kGn97sd+yMlujqwzTdwYk9UnSo=
Date: Thu, 9 Jan 2020 13:29:39 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 0/2] ppc/pnv: PNOR cleanups
Message-ID: <20200109022939.GK8586@umbus.fritz.box>
References: <20200108090348.21224-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline
In-Reply-To: <20200108090348.21224-1-clg@kaod.org>
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 10:03:46AM +0100, C=E9dric Le Goater wrote:
> Hello,
>=20
> Here are small cleanups of the PnvPNOR model.

Applied to ppc-for-5.0, thanks.

>=20
> Thanks,
>=20
> C.
>=20
> C=E9dric Le Goater (2):
>   ppc/pnv: use QEMU unit definition MiB
>   ppc/pnv: improve error logging when a PNOR update fails
>=20
>  hw/ppc/pnv_pnor.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4WkBEACgkQbDjKyiDZ
s5JQDBAA3/7DplIHpe/Rq8SP4p5k1RRnI74/Mjs4osbxF7dxXAKDEjwYWNg6Bv2B
5OoZjTIuucuO/aBegwCLTr/w7bVvcYo4srtIbUJrqtMUyUwJsQfPWB6fREe9xV6M
pxVsJXhJJEiUxsqjYRjlT8TVHVEKwe7qQq+dRzGvoHo1RUCc8sbJFc/tvf6uPX2i
TgNg16HJUNZbrTZYGgqIDYX4cWT7YUaMKoQG0mqo3TiIdIXdzqExLq0wk7qHC6kf
rkupScjgI/3RBiqcGneaYV4BAF/WvrfTp3lHAOKscGX+82CWASgomCx+GdeJDSp6
f5es3fjzyp982KalYcnMvShcJZDfZq1Zq5CU0Y00zsmc0kXG8IJPzINMchV1RwL2
04SViQw0vAO5cjkblU4iuUxE4Fz0LE/6h6bfNJTpTu9WiVPCAe8CF34kCLQt0zXu
VdCRzcjcTkjg6G7i57bUtW1Ee/BeoGWUcCJiCfSRTy+ro9wOPafV2zx66sUsXd/S
/DuXzMV90QBiNjWQLGRqGYMyJwoP0Tfl0NTT8UrjQjyoSUNNO2pMv82UY8fdKu9K
uOxdmHoUqLaCK5+nZKzcZ9arc6Pv5Qsmwvxm8Lvn/dO5Bnb3cN8zokgvy7180MPe
zvTnDyBbIxnCFa9rgBM8doqeofYIokqs7nC2cuuftgH6hsmbL1A=
=1Wpa
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--

