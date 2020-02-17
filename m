Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F5160835
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 03:32:55 +0100 (CET)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3WDO-0004te-0a
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 21:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j3WCf-0004Mu-6Q
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 21:32:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j3WCd-00077Y-Lt
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 21:32:08 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:55937)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j3WCb-00071a-QC; Sun, 16 Feb 2020 21:32:07 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48LSg33p8cz9sRJ; Mon, 17 Feb 2020 13:31:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1581906719;
 bh=xZvydSx+8XHLZQ1FuFlYrZWRQmIxVJXuiWzCMKcXEZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZVq0ZtaxXV6J1ItX8xH0XLbJMiJwxSkZEFp4NzSFR5dFaUg70+QpEvSOaBqaKukO
 YKoItGZJ1vn65AWnFEi7ZCkWWXa3y07OnBHu8jYlwvXyd7ekcO+Z07IkzoGEOxyaw/
 JEnOeizxWx27HqMV2uw6GtYAXxhvOX8eGgPaqJWM=
Date: Mon, 17 Feb 2020 13:31:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Message-ID: <20200217023149.GC14136@umbus.fritz.box>
References: <20200217021217.95766-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <20200217021217.95766-1-aik@ozlabs.ru>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 01:12:17PM +1100, Alexey Kardashevskiy wrote:
> The following changes since commit 05943fb4ca41f626078014c0327781815c6584=
c5:
>=20
>   ppc: free 'fdt' after reset the machine (2020-02-17 11:27:23 +1100)
>=20
> are available in the Git repository at:
>=20
>   git@github.com:aik/qemu.git tags/qemu-slof-20200217
>=20
> for you to fetch changes up to ea9a03e5aa023c5391bab5259898475d0298aac2:
>=20
>   pseries: Update SLOF firmware image (2020-02-17 13:08:59 +1100)
>=20
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>       pseries: Update SLOF firmware image
>=20
>  pc-bios/README   |   2 +-
>  pc-bios/slof.bin | Bin 931032 -> 968560 bytes
>  roms/SLOF        |   2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
>=20
> *** Note: this is not for master, this is for pseries

Merged to ppc-for-5.0, thanks.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5J+xIACgkQbDjKyiDZ
s5La2Q/+KsF4THkHEfT1oKslGuZeM7znLHe8ofZDBBW/oTloFk2pcle1QPDzKoQL
ibv5SFg0UuVXpYgwtHTGugs9nCLaMD4Magq7Q3tm+WhQHiYdzBVp9S6759MZmk5J
mg3LjOsxDIxmxB9y7TCDtDIVNJtTVHVE0vFSw0sE+aPaoS54klCoWh278aKI82yh
1i1Bj3udSt2RrLb5zdIiPnz60ZJ048ux3Avli+HAqm5LVhOGtwNqLbMHvjYTNcZ6
xtJHrnoUdmVm3ML3R6+jJ0wq9OkW8F9LXuJNdwA25qmpfGJOvG7OcA69x44AkwZz
R8UgiZybiE6jdNaaEjq8qxawUuBrIhJ3eJMPg6kfo8k41LUdxa6Gs6fa+m9Vdu+s
1+qqRCQnFYJu1PYhkk/6enGqm4YcIuuii3sX8CROTsqZprOmlrHdpK1xpYsQgJCH
6nLra+FGS31k7AXf0mp/ccSgFtKXscgCR9YSt1mi9X26QPZc2lSzHQUD2RS41tQ8
46t4tMRY7fMokpK3cCYsyFLQRCwtzKpD9sdglkkAAy81245TBxsPyAyYcRLupxls
hbF7GbhUxeRMXBSXM1UJHceRWUFltONoAayycnvFFzKvXt+/7G203nblrV25+TzE
8LTMDfK2uOzirBADfCG8zkAcKRVTazFHmym5UjusAQMyE158p5k=
=bW0V
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--

