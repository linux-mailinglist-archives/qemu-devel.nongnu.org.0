Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB302A861F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 17:44:34 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5XST-0005Rs-K1
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 11:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i5XQb-0004XC-E8
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 11:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i5XQa-0000wq-AT
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 11:42:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35977)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i5XQW-0000tG-C7; Wed, 04 Sep 2019 11:42:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0801E307D868;
 Wed,  4 Sep 2019 15:42:31 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5BB35D9C9;
 Wed,  4 Sep 2019 15:42:29 +0000 (UTC)
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
References: <20190904152915.30755-1-dplotnikov@virtuozzo.com>
 <20190904152915.30755-2-dplotnikov@virtuozzo.com>
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
Message-ID: <fdc02079-9e79-7e23-bf80-b358fb9e6764@redhat.com>
Date: Wed, 4 Sep 2019 10:42:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904152915.30755-2-dplotnikov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e18TxEGla0bKvIh5fSsQcZ5J8wVTTclP3"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 04 Sep 2019 15:42:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 1/3] qcow2: introduce compression type
 feature
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e18TxEGla0bKvIh5fSsQcZ5J8wVTTclP3
Content-Type: multipart/mixed; boundary="cMzMBBmc2n3JwEyKHbkxNGtGheHfP99nW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, den@virtuozzo.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org
Message-ID: <fdc02079-9e79-7e23-bf80-b358fb9e6764@redhat.com>
Subject: Re: [PATCH v5 1/3] qcow2: introduce compression type feature
References: <20190904152915.30755-1-dplotnikov@virtuozzo.com>
 <20190904152915.30755-2-dplotnikov@virtuozzo.com>
In-Reply-To: <20190904152915.30755-2-dplotnikov@virtuozzo.com>

--cMzMBBmc2n3JwEyKHbkxNGtGheHfP99nW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/4/19 10:29 AM, Denis Plotnikov wrote:
> The patch adds some preparation parts for incompatible compression type=

> feature to QCOW2 header that indicates that *all* compressed clusters
> must be (de)compressed using a certain compression type.
>=20
> It is implied that the compression type is set on the image creation an=
d
> can be changed only later by image conversion, thus compression type
> defines the only compression algorithm used for the image.
>=20
> The goal of the feature is to add support of other compression algorith=
ms
> to qcow2. For example, ZSTD which is more effective on compression than=
 ZLIB.
> It works roughly 2x faster than ZLIB providing a comparable compression=
 ratio
> and therefore provides a performance advantage in backup scenarios.
>=20
> The default compression is ZLIB. Images created with ZLIB compression t=
ype
> are backward compatible with older qemu versions.
>=20
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---

> +++ b/docs/interop/qcow2.txt

> @@ -165,6 +170,18 @@ in the description of a field.
>                      Length of the header structure in bytes. For versi=
on 2
>                      images, the length is always assumed to be 72 byte=
s.
> =20
> +        104 - 107:  compression_type
> +                    Defines the compression method used for compressed=
 clusters.
> +                    A single compression type is applied to all compre=
ssed image
> +                    clusters.
> +                    The compression type is set on image creation only=
=2E

This sentence adds nothing for me; you could delete it, and the spec
would still be just as useful (and less questionable about whether I can
'qemu-img amend' an image to use a different compression type in-place
by rewriting all existing compressed clusters).

With or without that sentence,

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--cMzMBBmc2n3JwEyKHbkxNGtGheHfP99nW--

--e18TxEGla0bKvIh5fSsQcZ5J8wVTTclP3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1v22QACgkQp6FrSiUn
Q2qT1Af+NbaYsqsj1QJ0+DkrKZLHnlqP6Hx00qcQZg1SkA+2tEdI+VTAi47Kgo5s
hARR3Ox0QmpjNIekwRmJRxoKTWbNuaLytUoQEMCl1vU9uwEVkHCPPZkMciRQK4RN
/Y8MSrNBiv0JxlZ7lewmF3Fz78fDgjobZOeHYX1ZPBJ1fHMiErnfhNPh2ghFsSEu
0ZcjQf8MhbVa4yAUgpMhCi3Im6HJ683xeIcqMyyzA1GwysClHgerBigOtcqfoIdy
FAmYRv8MVV1x2uxdWphKWZ1TDH27XBispNFpJz70L1/XgekDF7FaWZBY6rYbnZ+e
84017g1P8F6jSjjrOknl4xYWe+bLqA==
=hkak
-----END PGP SIGNATURE-----

--e18TxEGla0bKvIh5fSsQcZ5J8wVTTclP3--

