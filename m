Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2AAEE49
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 17:14:46 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7hqv-0003sD-Vp
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 11:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i7hp5-0002zE-0I
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:12:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i7hp3-0004bO-Tz
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:12:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48214)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i7hp3-0004ac-Lk
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 11:12:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5E411108;
 Tue, 10 Sep 2019 15:12:48 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCFE7194B2;
 Tue, 10 Sep 2019 15:12:43 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-6-armbru@redhat.com>
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
Message-ID: <16792fc8-b513-e934-7ca6-41a5cc10aac0@redhat.com>
Date: Tue, 10 Sep 2019 10:12:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910063724.28470-6-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Sv0KKxejvCo5hixLmC8PTxi0tFjROmkfB"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 10 Sep 2019 15:12:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 05/16] tests/qapi-schema: Demonstrate
 bad reporting of funny characters
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
--Sv0KKxejvCo5hixLmC8PTxi0tFjROmkfB
Content-Type: multipart/mixed; boundary="zIV2NwHws6D0dawA6TtZHfjDns7PtyWxS";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Message-ID: <16792fc8-b513-e934-7ca6-41a5cc10aac0@redhat.com>
Subject: Re: [PATCH v2 05/16] tests/qapi-schema: Demonstrate bad reporting of
 funny characters
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-6-armbru@redhat.com>
In-Reply-To: <20190910063724.28470-6-armbru@redhat.com>

--zIV2NwHws6D0dawA6TtZHfjDns7PtyWxS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/10/19 1:37 AM, Markus Armbruster wrote:
> Invalid name 'not\\possible' is reported as 'not\possible'.  Control
> characters (quoted or not) are even more confusing.  Mark FIXME.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qapi-schema/enum-bad-name.err  | 2 +-
>  tests/qapi-schema/enum-bad-name.json | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/qapi-schema/enum-bad-name.err b/tests/qapi-schema/en=
um-bad-name.err
> index 9c3c1002b7..26a09f84ad 100644
> --- a/tests/qapi-schema/enum-bad-name.err
> +++ b/tests/qapi-schema/enum-bad-name.err
> @@ -1 +1 @@
> -tests/qapi-schema/enum-bad-name.json:2: Member of enum 'MyEnum' uses i=
nvalid name 'not^possible'
> +tests/qapi-schema/enum-bad-name.json:3: Member of enum 'MyEnum' uses i=
nvalid name 'not\possible'
> diff --git a/tests/qapi-schema/enum-bad-name.json b/tests/qapi-schema/e=
num-bad-name.json
> index 8506562b31..b233fdc825 100644
> --- a/tests/qapi-schema/enum-bad-name.json
> +++ b/tests/qapi-schema/enum-bad-name.json
> @@ -1,2 +1,3 @@
>  # we ensure all enum names can map to C
> -{ 'enum': 'MyEnum', 'data': [ 'not^possible' ] }
> +# FIXME reports 'not\posible' instead of 'not\\possible'

s/posible/possible/

(Is it bad when you have a typo in demonstrating that the code has a typo=
?)

With that fixed,

Reviewed-by: Eric Blake <eblake@redhat.com>

> +{ 'enum': 'MyEnum', 'data': [ 'not\\possible' ] }
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--zIV2NwHws6D0dawA6TtZHfjDns7PtyWxS--

--Sv0KKxejvCo5hixLmC8PTxi0tFjROmkfB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl13vWoACgkQp6FrSiUn
Q2rR+ggAhCQFJ9pQ0qq/czzBIQ504ZAt4BP4sO1NYFrM4YpjcTM51XDdLAB6l4vg
T0qHt8euO+jteQ5qqMHklQts92qatBuqabfQEvr2k+F5FkhGg0eBISVSzdU9u2nZ
sa1AGK5BwU5buqshkJwUFFp3ZDT3owAO980dwibeBKcgB8IhicYN1r6MvxMZFA8S
6X2N9WAT4mGMpeEnPYVoGp/4UJcvsjMzBeWJ5Z7gyGlSWdF0EnLZZ0LZYYjioUH1
byaQ/5bOu+8dPfxOW+ybgLTy642uxWe1oKME19RMf9Et4TPVQXVG/HuuEWWGoQxI
o/EsB+ImLHcvSPlk7uhsue/2uZd3gw==
=1cv5
-----END PGP SIGNATURE-----

--Sv0KKxejvCo5hixLmC8PTxi0tFjROmkfB--

