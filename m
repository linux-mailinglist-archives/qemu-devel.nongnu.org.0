Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC86910D3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 16:31:35 +0200 (CEST)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyzjy-0004ek-F2
	for lists+qemu-devel@lfdr.de; Sat, 17 Aug 2019 10:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1hyzis-00049B-3L
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 10:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hyziq-0001HE-Ui
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 10:30:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hyzio-0001FW-5P; Sat, 17 Aug 2019 10:30:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 726617FDFD;
 Sat, 17 Aug 2019 14:30:20 +0000 (UTC)
Received: from [10.3.116.18] (ovpn-116-18.phx2.redhat.com [10.3.116.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A859F18668;
 Sat, 17 Aug 2019 14:30:19 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190815185024.7010-1-eblake@redhat.com>
 <104559cd-a1dc-2b2c-8992-689cbdd0f827@virtuozzo.com>
 <22c4c265-91fc-3639-4a4e-2fffe426ce68@virtuozzo.com>
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
Message-ID: <3f1fa92e-af18-87f8-3149-7c11bd186e64@redhat.com>
Date: Sat, 17 Aug 2019 09:30:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <22c4c265-91fc-3639-4a4e-2fffe426ce68@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NNgoYwPuQ9VugTANpmMEzzprXzHPI07Oe"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 17 Aug 2019 14:30:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] nbd: Advertise multi-conn for shared
 read-only connections
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
Cc: Kevin Wolf <kwolf@redhat.com>, "rjones@redhat.com" <rjones@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NNgoYwPuQ9VugTANpmMEzzprXzHPI07Oe
Content-Type: multipart/mixed; boundary="felVqLD1ZPADnr4SdNVTDwyzbvWyYnFXx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "rjones@redhat.com" <rjones@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Message-ID: <3f1fa92e-af18-87f8-3149-7c11bd186e64@redhat.com>
Subject: Re: [PATCH] nbd: Advertise multi-conn for shared read-only
 connections
References: <20190815185024.7010-1-eblake@redhat.com>
 <104559cd-a1dc-2b2c-8992-689cbdd0f827@virtuozzo.com>
 <22c4c265-91fc-3639-4a4e-2fffe426ce68@virtuozzo.com>
In-Reply-To: <22c4c265-91fc-3639-4a4e-2fffe426ce68@virtuozzo.com>

--felVqLD1ZPADnr4SdNVTDwyzbvWyYnFXx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/16/19 5:47 AM, Vladimir Sementsov-Ogievskiy wrote:

>>> +++ b/blockdev-nbd.c
>>> @@ -189,7 +189,7 @@ void qmp_nbd_server_add(const char *device, bool =
has_name, const char *name,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exp =3D nbd_export_new(bs, 0, len, nam=
e, NULL, bitmap,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 writable ? 0 : NBD_FLAG_READ_ONLY,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 writable ? 0 : NBD_FLAG_READ_ONLY, true,
>>
>> s/true/!writable ?
>=20
> Oh, I see, John already noticed this, it's checked in nbd_export_new an=
yway..

Still, since two reviewers have caught it, I'm fixing it :)


>>> @@ -1486,6 +1486,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs,=
 uint64_t dev_offset,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perm =3D BLK_PERM_CONSISTENT_READ;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((nbdflags & NBD_FLAG_READ_ONLY) =3D=
=3D 0) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perm |=3D BLK_=
PERM_WRITE;
>>> +=C2=A0=C2=A0=C2=A0 } else if (shared) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nbdflags |=3D NBD_FLAG_CA=
N_MULTI_CONN;
>=20
> For me it looks a bit strange: we already have nbdflags parameter for n=
bd_export_new(), why
> to add a separate boolean to pass one of nbdflags flags?

Because I want to get rid of the nbdflags in my next patch.

>=20
> Also, for qemu-nbd, shouldn't we allow -e only together with -r ?

I'm reluctant to; it might break whatever existing user is okay exposing
it (although such users are questionable, so maybe we can argue they
were already broken).  Maybe it's time to start a deprecation cycle?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--felVqLD1ZPADnr4SdNVTDwyzbvWyYnFXx--

--NNgoYwPuQ9VugTANpmMEzzprXzHPI07Oe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1YD3oACgkQp6FrSiUn
Q2qSIQf/RIpeufBcZWgPGBnG0HvAN9+AS/JTSCc1uOGf19PXBzr7Dvka96zZ2IpV
0o9ePK6E4M2cjktCI27BkFO7WM1YZa+R9MKN8lhSha1cU21DC6WZOITqLvvjurBg
LAcI3YYatpOlS7gLD7N9zfpdjQ7lnr+NeLzz6Rzp89+JzXhLDUJm1qCTYZWjLJtO
UyEY/7BGK6zBhhwYTv6wbzHzaZjpaOw9kZfYvnbaANURKTOtcu275Hrn5p8dw0JE
ilzQNQN9Qvuua3VtWa9yK32orfv+dpMtFqZVsLW8TLituZ2RC2SRKegitzDLkw03
GWbm+cvkzHLv9iVd7zCA6lnVA3rhPA==
=5QFb
-----END PGP SIGNATURE-----

--NNgoYwPuQ9VugTANpmMEzzprXzHPI07Oe--

