Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E96C967
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 08:47:54 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho0Cn-0007QT-JV
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 02:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1ho0CY-0006yk-6m
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1ho0CW-0005zz-TU
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 02:47:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33667)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1ho0CV-0005yi-Rk; Thu, 18 Jul 2019 02:47:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45q4Sh0TLqz9s4Y; Thu, 18 Jul 2019 16:47:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563432452;
 bh=2fP4p9KYjastPEAnUzCbeoSyZsEGKm1XC6fVP4zAnpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dRxc9KmOwWClhgWG//0bw1KoWD6YdeJQRh6cQyENERWwpojLikpLGnddPonpzXq8E
 29gWWxg42opZMMCZ6R0HSf6QMbjVIjbutxb6X1Ig/H3br6VXDP9RHpUWWmmvLfHtlw
 70dIadj/L2m4nsWG+/1/8UmWGb5zddGjCzKukyUk=
Date: Thu, 18 Jul 2019 16:15:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20190718061538.GL8468@umbus.fritz.box>
References: <20190718053236.6721-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vTUhhhdwRI43FzeR"
Content-Disposition: inline
In-Reply-To: <20190718053236.6721-1-joel@jms.id.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH] ppc/pnv: Set default ram size to 2GB
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vTUhhhdwRI43FzeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 03:02:36PM +0930, Joel Stanley wrote:
> This makes the powernv machine easier for end users as the default
> initrd address is now within RAM.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to ppc-for-4.2, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vTUhhhdwRI43FzeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0wDogACgkQbDjKyiDZ
s5J8GQ//blOpcNRXRrQYHdXZXMLOHyFMRJ8ZsHgy5cNV0YVUZjd7qH1xfHW/DiFS
xB9EtYQyfdxOLYEu9slOhNAcRXU2qkSBtPsFiUtMx5HXu8WTnN8Qtwqhu/u0Fzob
Wd4LFR3MAOY2jhfXTLPME4pxXzVJ2kzfzG0tyXgD33g/s0TCprn2eadAuWcS8t8t
vNAynqMk4zBZVVaChFJ4LseJ5FANWDAtgWf7s5jKavVmSXrpYQrf5Q0Hi38bB5r2
5A6mji3lHjhUDUzLt2DGuAk5UttZoB6bhaAkuhA2LzvmZvYA1ieC+akMspKeWYMI
re8rYGzZc/kwmbMCjRm81YQKE+uoXFLF9EzyC9vy+XqCqKI6t6iT02I2oHlKrkiD
SfiKzzglGKJsvRmYyRbWyOUbv7k+XqW5qyB2haEIo8RAYO6S0+3hQNaW0Ivq1wUu
eDdSbwad/oar1bK7e1WrIe+4/YdkJwwZx13gAtqsoxodn/O/ODB4VS1zZy+mANYM
+VnEz4gv2mClWhoFeCnXg3nSsLGhDYjAF4f6VvLHuSIk3k91tOFQFX0xmrpXWJG5
cEJ06eVSPIqnZoM0fzAkzPCOhAfUbqaTX2ceFfYflX/JQuD7c0WToxZI3Mv0YB0Y
zxv9KN33w4HJHNegXd4Q15HKhXN+MbJxmKdV/TgvJPPw4beRf+4=
=EBnF
-----END PGP SIGNATURE-----

--vTUhhhdwRI43FzeR--

