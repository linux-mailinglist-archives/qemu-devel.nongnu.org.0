Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F594F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 22:39:31 +0200 (CEST)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzoR8-00033f-FW
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 16:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1hzoDi-0002XM-K5
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hzoDh-0006hw-Hy
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 16:25:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hzoDf-0006h1-3U; Mon, 19 Aug 2019 16:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5802519AD50D;
 Mon, 19 Aug 2019 20:25:34 +0000 (UTC)
Received: from [10.3.117.3] (ovpn-117-3.phx2.redhat.com [10.3.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C4C1F8;
 Mon, 19 Aug 2019 20:25:33 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20190819185602.4267-1-mreitz@redhat.com>
 <20190819185602.4267-17-mreitz@redhat.com>
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
Message-ID: <ddba06a8-0ecd-639a-bd13-5fd98cde6e43@redhat.com>
Date: Mon, 19 Aug 2019 15:25:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190819185602.4267-17-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M0cYeFfzkUKxnQPlyM8XA3BaL7NyWTUpl"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Mon, 19 Aug 2019 20:25:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 16/16] iotests: Test qcow2's snapshot
 table handling
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M0cYeFfzkUKxnQPlyM8XA3BaL7NyWTUpl
Content-Type: multipart/mixed; boundary="dSYic9x3OVcTFakEICwl7fSKdg2R8RaRa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Message-ID: <ddba06a8-0ecd-639a-bd13-5fd98cde6e43@redhat.com>
Subject: Re: [PATCH v2 16/16] iotests: Test qcow2's snapshot table handling
References: <20190819185602.4267-1-mreitz@redhat.com>
 <20190819185602.4267-17-mreitz@redhat.com>
In-Reply-To: <20190819185602.4267-17-mreitz@redhat.com>

--dSYic9x3OVcTFakEICwl7fSKdg2R8RaRa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/19/19 1:56 PM, Max Reitz wrote:
> Add a test how our qcow2 driver handles extra data in snapshot table
> entries, and how it repairs overly long snapshot tables.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

> +++ b/tests/qemu-iotests/261.out
> @@ -0,0 +1,346 @@
> +QA output created by 261
> +
> +=3D=3D=3D Create v2 template =3D=3D=3D
> +
> +Formatting 'TEST_DIR/t.IMGFMT.v2.orig', fmt=3DIMGFMT size=3D67108864
> +No errors were found on the image.
> +Snapshots in TEST_DIR/t.IMGFMT.v2.orig:
> +  [0]
> +    ID: 1
> +    Name: sn0
> +    Extra data size: 0
> +  [1]
> +    ID: 2
> +    Name: sn1
> +    Extra data size: 42
> +    VM state size: 0
> +    Disk size: 67108864
> +    Unknown extra data: very important data

Hmm - possibly one more patch to write - but when checking snapshots for
accuracy, do we want to insist that the 32-bit truncated VM state size
is either 0 or matches the low 32-bits of the 64-bit VM state size
field?  Any mismatch between those fields (other than the 32-bit field
being left 0 because we knew to use the 64-bit field) might be a hint of
a possible corruption.  But there's no good way to correct it other than
wiping the 32-bit field to 0; and for a v2 image, any change we make to
the 32-bit field might actually make the snapshot unusable for an older
client that doesn't know how to use the 64-bit field.  So maybe we just
overlook that.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--dSYic9x3OVcTFakEICwl7fSKdg2R8RaRa--

--M0cYeFfzkUKxnQPlyM8XA3BaL7NyWTUpl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1bBbgACgkQp6FrSiUn
Q2pVqgf/Yc8gs/ve+nChAeaa/7eiNEBRe0K6TY9bIvconTVghpp5kThPR5uvbAG1
/vAEiJHWnJpx+gbBug1GHs0ojeWGc22rPhCeNSG7JPEprT1B3AB2yiu/Zj3R+zz4
Y8j5JtnG4loYWfFSsZMA9OL+oL+3IBzGhmteQwosIibhsRJjFCXqdIK5LxD8hRqX
NGhqwiPt/TiAvjznk1NeCzk8a+fS0BrCfUF0ivx09r5UnfjU4sZwKr31idI41nRt
3m+WTWKLjRuqgnzKQlf+CY7Lyk57ZQ8aCx0X8os+v/idfPfiNzV7eJFdvPrvd0eA
OQH+T7mSIp455NhWV4Ix+DTOm+uVGQ==
=TNYM
-----END PGP SIGNATURE-----

--M0cYeFfzkUKxnQPlyM8XA3BaL7NyWTUpl--

