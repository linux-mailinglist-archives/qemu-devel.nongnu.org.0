Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E1BB573E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 22:56:58 +0200 (CEST)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAKWv-00085Y-Ox
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 16:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iAKL6-0001CM-8N
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iAKL5-00048g-1R
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:44:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37534)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iAKL4-00048P-Pi
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 16:44:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25C9B5946B;
 Tue, 17 Sep 2019 20:44:42 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B100060A9F;
 Tue, 17 Sep 2019 20:44:39 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190914153506.2151-1-armbru@redhat.com>
 <20190914153506.2151-19-armbru@redhat.com>
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
Message-ID: <a147bf58-46a1-4fff-269f-e36ffeb85029@redhat.com>
Date: Tue, 17 Sep 2019 14:26:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190914153506.2151-19-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="npGiG3SHamhW90RMd74pmQEt3xBklp5T3"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 17 Sep 2019 20:44:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 18/19] qapi: Fix excessive
 QAPISchemaEntity.check() recursion
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--npGiG3SHamhW90RMd74pmQEt3xBklp5T3
Content-Type: multipart/mixed; boundary="ZjwL4lg9oUIZwVQGDSXT98OzKzY3G3fST";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Message-ID: <a147bf58-46a1-4fff-269f-e36ffeb85029@redhat.com>
Subject: Re: [PATCH 18/19] qapi: Fix excessive QAPISchemaEntity.check()
 recursion
References: <20190914153506.2151-1-armbru@redhat.com>
 <20190914153506.2151-19-armbru@redhat.com>
In-Reply-To: <20190914153506.2151-19-armbru@redhat.com>

--ZjwL4lg9oUIZwVQGDSXT98OzKzY3G3fST
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/14/19 10:35 AM, Markus Armbruster wrote:
> Entity checking goes back to commit ac88219a6c "qapi: New QAPISchema
> intermediate representation", v2.5.0.  It's designed to work as
> follows: QAPISchema.check() calls .check() for all the schema's
> entities.  An entity's .check() recurses into another entity's
> .check() only if the C struct generated for the former contains the C
> struct generated for the latter (pointers don't count).  This is used
> to detect "object contains itself".
>=20
> There are two instances of this:
>=20
> * An object's C struct contains its base's C struct
>=20
>   QAPISchemaObjectType.check() calls self.base.check()
>=20
> * An object's C struct contains its variants' C structs
>=20
>   QAPISchemaObjectTypeVariants().check calls v.type.check().  Since
>   commit b807a1e1e3 "qapi: Check for QAPI collisions involving variant
>   members", v2.6.0.
>=20

> Sadly, this design has since eroded:
>=20

> * A QAPISchemaEntity's .module becomes valid at .check().  This is
>   because computing it needs info and schema.fname, and because array
>   types get it from their element type instead.
>=20
>   Make it a property  just like .ifcond.

Extra space.

>=20
> Additionally, have QAPISchemaEntity.check() assert it gets called at
> most once, so the design invariant will stick this time.  Neglecting
> that was entirely my fault.

Lengthy explanation, but it makes sense.

>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/common.py | 74 +++++++++++++++++++++++++++++-------------=

>  1 file changed, 52 insertions(+), 22 deletions(-)
>=20

Took me a bit longer to read this (and refresh myself on what
'@property' actually does in Python, but you're not the first user of it
in qemu), but it matches the commit message.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ZjwL4lg9oUIZwVQGDSXT98OzKzY3G3fST--

--npGiG3SHamhW90RMd74pmQEt3xBklp5T3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl2BM2sACgkQp6FrSiUn
Q2pRnwf9GB0FgEA7JpnnqkglU/gvpM53V++NctEXrY5+7s4JJMnn3+W0Oj/SrgKV
7P3Dc3p+ah3jUeMC/UqxM+jr246DiQAghY8GgO6xu0cTQK7dP98ZGiarUq6WADeH
RVOlK+hWBPqXAQmlQx3aeK2mMmqs6VqrfXqH6rZSLnjIlT2H9LRks9DWt0IENmmU
9d2DbCPL39a3xPaT+nsC8dHI6gzW08JR4Y0dbLe+LXr+bLxGJuo2wPaKlosyxlwV
WEqVC0KCcxIqWlQdk04IHq/ZV5iRMWfuy/cywAKl2FYdqrF0pegU39ZPP+FcYAOl
ytpaT5FDB0i59kGZxrDj6bzz/6++jA==
=1y9B
-----END PGP SIGNATURE-----

--npGiG3SHamhW90RMd74pmQEt3xBklp5T3--

