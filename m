Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D379AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 23:14:00 +0200 (CEST)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsCxz-0004iY-G8
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 17:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56183)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hsCxR-0004C6-E0
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hsCxQ-0001OC-Cq
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 17:13:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42592)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hsCxO-0001Mt-5q; Mon, 29 Jul 2019 17:13:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22D68C04B946;
 Mon, 29 Jul 2019 21:13:21 +0000 (UTC)
Received: from [10.3.116.93] (ovpn-116-93.phx2.redhat.com [10.3.116.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 145525D6A5;
 Mon, 29 Jul 2019 21:13:15 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190725100550.33801-1-vsementsov@virtuozzo.com>
 <20190725100550.33801-2-vsementsov@virtuozzo.com>
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
Message-ID: <7651c617-f53c-c4b4-4d24-e49cfdcf2f3b@redhat.com>
Date: Mon, 29 Jul 2019 16:13:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190725100550.33801-2-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zyh9sXEOMkqXwDZrHo3oIz6vLYd9AzzZ6"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 29 Jul 2019 21:13:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/3] block: implement BDRV_REQ_PREFETCH
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
Cc: kwolf@redhat.com, fam@euphon.net, mreitz@redhat.com, stefanha@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zyh9sXEOMkqXwDZrHo3oIz6vLYd9AzzZ6
Content-Type: multipart/mixed; boundary="YJCPKUxNUmoQN0QPYwr70tJjST60BByF2";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com, fam@euphon.net,
 stefanha@redhat.com, den@openvz.org
Message-ID: <7651c617-f53c-c4b4-4d24-e49cfdcf2f3b@redhat.com>
Subject: Re: [PATCH v3 1/3] block: implement BDRV_REQ_PREFETCH
References: <20190725100550.33801-1-vsementsov@virtuozzo.com>
 <20190725100550.33801-2-vsementsov@virtuozzo.com>
In-Reply-To: <20190725100550.33801-2-vsementsov@virtuozzo.com>

--YJCPKUxNUmoQN0QPYwr70tJjST60BByF2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/25/19 5:05 AM, Vladimir Sementsov-Ogievskiy wrote:
> Do effective copy-on-read request when we don't need data actually. It
> will be used for block-stream and NBD_CMD_CACHE.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block.h |  8 +++++++-
>  block/io.c            | 18 ++++++++++++------
>  2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/include/block/block.h b/include/block/block.h
> index 50a07c1c33..73c3fc4daa 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -88,8 +88,14 @@ typedef enum {
>       * fallback. */
>      BDRV_REQ_NO_FALLBACK        =3D 0x100,
> =20
> +    /*
> +     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_=
ON_READ
> +     * on read request and means that caller don't really need data to=
 be

doesn't

can fix up while staging.


> +++ b/block/io.c
> @@ -1167,7 +1167,8 @@ bdrv_driver_pwritev_compressed(BlockDriverState *=
bs, uint64_t offset,
>  }
> =20
>  static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
> -        int64_t offset, unsigned int bytes, QEMUIOVector *qiov)
> +        int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
> +        int flags)

We're bad about this, but 'int flags' does not play well with the C
language and well-defined behavior when it comes to 1<<31 (bit
operations and unsigned types have guaranteed behavior, bit operations
and negative signed types can cause the compiler to do differently than
you expect).  Not a problem for uses where we don't have 32 flags to OR
together, so I won't change it, so much as point it out for a bigger
task of auditing the entire code base if we are worried.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--YJCPKUxNUmoQN0QPYwr70tJjST60BByF2--

--zyh9sXEOMkqXwDZrHo3oIz6vLYd9AzzZ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0/YWoACgkQp6FrSiUn
Q2qY2gf/RfO4aBLECf8MuZrclsILinAfHkoB6eDl5qsK9FSb608tXnDT/o3IO88k
1nq5fFggxieaU8Ay3AaIGqUxfZ8f5xCowf/5cNCMSiDubC0zWnxDELvKIyzLKXlI
eFPpn0fc9Aq9KWdRf++Uurdb2u7QOIYEB+X/QAxgUQYSNFnv2z6NAFg/3fbQ9e/X
d0VnUBcA3VegDUpATqJNXg0r+af192RfR3v4iKrdYPNbFXnJl2PhSCSa7f4I4N+a
MyjW3+LztRb7ygXoF6WbkfDvjAVKIhfzzNlSwhF+r9uJG5km2rOwOfiU2iP5VyPO
pjSmXhZ63GDZjzAGOTgzvM6arx6Xeg==
=Ff/g
-----END PGP SIGNATURE-----

--zyh9sXEOMkqXwDZrHo3oIz6vLYd9AzzZ6--

