Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4EA8622
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 17:48:05 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5XVt-0006iX-2K
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 11:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i5XTy-0006Bk-58
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 11:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i5XTw-0002gY-Vs
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 11:46:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49530)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i5XTu-0002fg-GB; Wed, 04 Sep 2019 11:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA60F3099F9F;
 Wed,  4 Sep 2019 15:46:01 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1360B194B2;
 Wed,  4 Sep 2019 15:46:01 +0000 (UTC)
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
References: <20190904152915.30755-1-dplotnikov@virtuozzo.com>
 <20190904152915.30755-3-dplotnikov@virtuozzo.com>
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
Message-ID: <181c6937-f0f7-29f4-f763-46cc7ea7defd@redhat.com>
Date: Wed, 4 Sep 2019 10:46:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904152915.30755-3-dplotnikov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bH4HlDIM9Dcx71QEAOTzEaqe4Kc75UizQ"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 04 Sep 2019 15:46:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 2/3] qcow2: rework the cluster
 compression routine
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
--bH4HlDIM9Dcx71QEAOTzEaqe4Kc75UizQ
Content-Type: multipart/mixed; boundary="ViFxEOWiz0mWk2ETBSda3hFewepBRkOeQ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, armbru@redhat.com,
 qemu-devel@nongnu.org
Cc: kwolf@redhat.com, mreitz@redhat.com, den@virtuozzo.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org
Message-ID: <181c6937-f0f7-29f4-f763-46cc7ea7defd@redhat.com>
Subject: Re: [PATCH v5 2/3] qcow2: rework the cluster compression routine
References: <20190904152915.30755-1-dplotnikov@virtuozzo.com>
 <20190904152915.30755-3-dplotnikov@virtuozzo.com>
In-Reply-To: <20190904152915.30755-3-dplotnikov@virtuozzo.com>

--ViFxEOWiz0mWk2ETBSda3hFewepBRkOeQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/4/19 10:29 AM, Denis Plotnikov wrote:
> The patch allow to process image compression type defined
> in the image header and choose an appropriate method for
> image clusters (de)compression.
>=20
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---
>  block/qcow2-threads.c | 77 +++++++++++++++++++++++++++++++++++--------=

>  1 file changed, 63 insertions(+), 14 deletions(-)
>=20
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ViFxEOWiz0mWk2ETBSda3hFewepBRkOeQ--

--bH4HlDIM9Dcx71QEAOTzEaqe4Kc75UizQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1v3DgACgkQp6FrSiUn
Q2osTwgAsFKPKYeXYWGuexJpoj2Wa1zZKstHq1wmQMAQhZOthC2XhxoB59sNUP9z
v/aB00QWWqvlkBs6ffYkkeKf2pbTbTEaX/TCTQ3VGEhEJKXhfbmgwLlXC5y9NHvy
q2YrAy04pwXPrWgKL1L6Vu1euj/6Tq+RVd49mIqXFtTxDt1Z3uQyzPXBXeeCBIrY
LYGCDKiV5jJTBytKx3/4K3Nt0MeZ8iXIc947MbAxhinf1M6S902r6S7VCFBzl3Gr
imdcqvaUGzsVXKwhuW2gogBBHvO2zLu08UN0f6mIZAHB+N9ssWRKAx7ujuWVrsaz
0/LmVoKz2p18/u5RzHmJn5Fwg4EeMA==
=WMUH
-----END PGP SIGNATURE-----

--bH4HlDIM9Dcx71QEAOTzEaqe4Kc75UizQ--

