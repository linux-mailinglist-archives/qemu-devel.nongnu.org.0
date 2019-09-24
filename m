Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1DBD137
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 20:09:48 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCpFy-0000Jl-LL
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 14:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCpDl-0007cW-TQ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 14:07:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCpDk-00081V-UU
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 14:07:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36570)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iCpDk-00081N-LD
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 14:07:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC452C057867;
 Tue, 24 Sep 2019 18:07:27 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CFE60A97;
 Tue, 24 Sep 2019 18:07:22 +0000 (UTC)
Subject: Re: [PATCH 19/25] qapi: Improve reporting of invalid flags
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190924132830.15835-1-armbru@redhat.com>
 <20190924132830.15835-20-armbru@redhat.com>
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
Message-ID: <4d3b7c95-87dd-d41f-1ad5-ba917287a432@redhat.com>
Date: Tue, 24 Sep 2019 13:07:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924132830.15835-20-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Db8WC1MCWiZgvKpAigzfOdhVFSH5DhOGe"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 24 Sep 2019 18:07:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
--Db8WC1MCWiZgvKpAigzfOdhVFSH5DhOGe
Content-Type: multipart/mixed; boundary="hD3M0lcJEYZTWDx0uIwuqf7P0sHkfkrPl";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Message-ID: <4d3b7c95-87dd-d41f-1ad5-ba917287a432@redhat.com>
Subject: Re: [PATCH 19/25] qapi: Improve reporting of invalid flags
References: <20190924132830.15835-1-armbru@redhat.com>
 <20190924132830.15835-20-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-20-armbru@redhat.com>

--hD3M0lcJEYZTWDx0uIwuqf7P0sHkfkrPl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/24/19 8:28 AM, Markus Armbruster wrote:
> Split check_flags() off check_keys() and have check_exprs() call it
> later, so its error messages gain an "in definition" line.  Tweak the
> error messages.
>=20
> Checking values in a function named check_keys() is unclean anyway.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/common.py                     | 22 ++++++++++++----------=

>  tests/qapi-schema/allow-preconfig-test.err |  3 ++-
>  tests/qapi-schema/args-bad-boxed.err       |  3 ++-
>  tests/qapi-schema/oob-test.err             |  3 ++-
>  tests/qapi-schema/type-bypass-bad-gen.err  |  3 ++-
>  5 files changed, 20 insertions(+), 14 deletions(-)
>=20

> +
> +def check_flags(expr, info):
> +    for key in ['gen', 'success-response']:
> +        if key in expr and expr[key] is not False:

Is it any more pythonic and/or a micro-optimization to compress this to:

if expr.get(key, False) is not False:

> +            raise QAPISemError(
> +                info, "flag '%s' may only use false value" % key)
> +    for key in ['boxed', 'allow-oob', 'allow-preconfig']:
> +        if key in expr and expr[key] is not True:

and here too.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--hD3M0lcJEYZTWDx0uIwuqf7P0sHkfkrPl--

--Db8WC1MCWiZgvKpAigzfOdhVFSH5DhOGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl2KW1oACgkQp6FrSiUn
Q2qkhggAnC7kdWegKgrFr9COZmg1ZRvYO0gKV14JrSc412O0WYTEimCRCyZzMSah
nCmg+hLwDZH3KwVffMZtYMn42/8hC1wVx83E1O6kZupa5V0WvTON3Izipjp4Z0v2
Zet8MnEd1xBmE0WBvFq3856uLxqM5cedxbSAdLub0+9vdyNfSNRIgkxqEjzkGSBP
AfcAdr2TW8QzpBhn9V2Q3DqszfGmIh+k7Tw/bdVxv495W9nGATb5gzzRiuxkLPp0
vsH4GK7N4ppwVpSU6NRw5lR52goedr+a1uqnxthB/XkMIPN9g/WCsB2OvfBi9GLe
e4BRDTWtBTqGe/Ak4kWNRgNZYvWEsA==
=mH+X
-----END PGP SIGNATURE-----

--Db8WC1MCWiZgvKpAigzfOdhVFSH5DhOGe--

