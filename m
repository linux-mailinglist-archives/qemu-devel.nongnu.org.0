Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE69AEC19
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 15:49:34 +0200 (CEST)
Received: from localhost ([::1]:39969 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7gWT-0005iy-E8
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i7gSy-0004cE-F8
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i7gSr-0002eg-UC
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:45:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i7gSo-0002dq-Vq
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 09:45:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 306C281F31;
 Tue, 10 Sep 2019 13:45:44 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA1C360BF3;
 Tue, 10 Sep 2019 13:45:40 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-3-armbru@redhat.com>
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
Message-ID: <469c6c96-2c38-f71a-da6f-14b137605009@redhat.com>
Date: Tue, 10 Sep 2019 08:45:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910063724.28470-3-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gQjqCIw1loCuL1TRqB1JQFQ5xxFsxg2pq"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 10 Sep 2019 13:45:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 02/16] qapi: Drop check_type()'s
 redundant parameter @allow_optional
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
--gQjqCIw1loCuL1TRqB1JQFQ5xxFsxg2pq
Content-Type: multipart/mixed; boundary="re0LT6D8SJilhJkOoFSPrKXlNX2TNtqAT";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Message-ID: <469c6c96-2c38-f71a-da6f-14b137605009@redhat.com>
Subject: Re: [PATCH v2 02/16] qapi: Drop check_type()'s redundant parameter
 @allow_optional
References: <20190910063724.28470-1-armbru@redhat.com>
 <20190910063724.28470-3-armbru@redhat.com>
In-Reply-To: <20190910063724.28470-3-armbru@redhat.com>

--re0LT6D8SJilhJkOoFSPrKXlNX2TNtqAT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/10/19 1:37 AM, Markus Armbruster wrote:
> check_type() uses @allow_optional only when @value is a dictionary and
> @allow_dict is True.  All callers that pass allow_dict=3DTrue also pass=

> allow_optional=3DTrue.
>=20
> Therefore, @allow_optional is always True when check_type() uses it.
> Drop the redundant parameter.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/common.py | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--re0LT6D8SJilhJkOoFSPrKXlNX2TNtqAT--

--gQjqCIw1loCuL1TRqB1JQFQ5xxFsxg2pq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl13qQQACgkQp6FrSiUn
Q2opvAgArfVyrH9fmkWCkSy76hY/gv9fXh1sGx3OJGgUiRNT68jcm6Won3ablLjX
25Ax4SIhmWy7Ks+pPAGFfAMbh87NAZQMUtvjOg+IwtEwz81FRDXWkLldR0UW4nIP
QJ0rz238MPYDrw/6uHQLmnmA+lw4qh/oNTse715+z8E4H4sIfY9PTEYQYGloBd/p
hMQWeoqHwgISNqo6DEq+4dA2o8qXLI/fz6VRv8lM/uxTKn3MRXh8NlyNzYeRrjDq
ZIwIgiqzsVp6+s7KEdnvQQ37ZRYkLBCpxSmzfCAbrRORJOBOpKHw0Fzcxrjg9Pup
3Eg0iuUHXNZWA07VWbxb/Uf/x6NThg==
=ubUD
-----END PGP SIGNATURE-----

--gQjqCIw1loCuL1TRqB1JQFQ5xxFsxg2pq--

