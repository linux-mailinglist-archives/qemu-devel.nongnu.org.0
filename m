Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD41B056B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 00:13:49 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8As1-0005MY-45
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 18:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i8Ar8-0004cx-O5
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i8Ar7-0006E2-Kg
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:12:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44068)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i8Ar5-0006BS-AR; Wed, 11 Sep 2019 18:12:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92F863082135;
 Wed, 11 Sep 2019 22:12:50 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB4F5C207;
 Wed, 11 Sep 2019 22:12:47 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190911220849.30840-1-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <0cf09644-2da1-adda-3691-74206ab13dfd@redhat.com>
Date: Wed, 11 Sep 2019 17:12:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911220849.30840-1-philmd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WC0hlZKoX72D0pO3FgRuj2ow2GFdWRnz9"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 11 Sep 2019 22:12:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] block/create: Do not abort if a block
 driver is not available
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WC0hlZKoX72D0pO3FgRuj2ow2GFdWRnz9
Content-Type: multipart/mixed; boundary="eUylU63Z5v8s7V61ziRXmntGBWJlgYA6r";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Message-ID: <0cf09644-2da1-adda-3691-74206ab13dfd@redhat.com>
Subject: Re: [PATCH] block/create: Do not abort if a block driver is not
 available
References: <20190911220849.30840-1-philmd@redhat.com>
In-Reply-To: <20190911220849.30840-1-philmd@redhat.com>

--eUylU63Z5v8s7V61ziRXmntGBWJlgYA6r
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/11/19 5:08 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The 'blockdev-create' QMP command was introduced as experimental
> feature in commit b0292b851b8, using the assert() debug call.
> It got promoted to 'stable' command in 3fb588a0f2c, but the
> assert call was not removed.
>=20
> Some block drivers are optional, and bdrv_find_format() might
> return a NULL value, triggering the assertion.
>=20
> Stable code is not expected to abort, so return an error instead.
>=20

>=20
> Reported-by: Xu Tian <xutian@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  block/create.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/block/create.c b/block/create.c
> index 1bd00ed5f8..89812669df 100644
> --- a/block/create.c
> +++ b/block/create.c
> @@ -64,9 +64,13 @@ void qmp_blockdev_create(const char *job_id, Blockde=
vCreateOptions *options,
>      const char *fmt =3D BlockdevDriver_str(options->driver);
>      BlockDriver *drv =3D bdrv_find_format(fmt);
> =20
> +    if (!drv) {
> +        error_setg(errp, "Block driver '%s' not found or not supported=
", fmt);
> +        return;
> +    }
> +
>      /* If the driver is in the schema, we know that it exists. But it =
may not
>       * be whitelisted. */
> -    assert(drv);
>      if (bdrv_uses_whitelist() && !bdrv_is_whitelisted(drv, false)) {
>          error_setg(errp, "Driver is not whitelisted");

Matches that we error for not being on the whitelist.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--eUylU63Z5v8s7V61ziRXmntGBWJlgYA6r--

--WC0hlZKoX72D0pO3FgRuj2ow2GFdWRnz9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl15cV8ACgkQp6FrSiUn
Q2p3swgAg81i0aaZR80ppDkzA7/5lqs1OB8yB5TmDdkxnBV+8imrlnm2CfeINlch
f1U9MolOABqqW9wB8p2orrY+c/zFxR3JB4j5eOflSgLl8ePymPrAR4mXwcjTFqM2
AmmtgMgUDgnv5VnjSvDQxJGE9yn4Fcs3DYRBCuvJZv332WbvenWY4gbMaNpPoCrb
1Ouhfcf0F+ap2y2iRHcfOwBr84kcbkmt3ey5zD6+reYrvaVap8ez3ts0ofqH6ZWL
97FICZpck98pr0Jkx10aMxI2rVu/fvQpLim0sJh+lYFvfJtWCaroJoh8bNrQwiII
iqtrWZ1meUpraQ5/7UwbrcHx5zXEjg==
=Xbic
-----END PGP SIGNATURE-----

--WC0hlZKoX72D0pO3FgRuj2ow2GFdWRnz9--

