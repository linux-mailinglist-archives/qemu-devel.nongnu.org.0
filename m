Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED82E0D9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 17:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW0Le-0004T8-DJ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 11:18:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hW0Jk-0003n9-9P
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hW0Jj-0007EY-CX
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:16:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hW0Jj-0007CX-3O
	for qemu-devel@nongnu.org; Wed, 29 May 2019 11:16:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4D12F9E89
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 15:16:28 +0000 (UTC)
Received: from [10.3.116.169] (ovpn-116-169.phx2.redhat.com [10.3.116.169])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F447600C4;
	Wed, 29 May 2019 15:16:28 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190529150853.9772-1-armbru@redhat.com>
	<20190529150853.9772-3-armbru@redhat.com>
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
Message-ID: <84e2792c-3fd3-3236-dc45-83405abb9a12@redhat.com>
Date: Wed, 29 May 2019 10:16:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529150853.9772-3-armbru@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lqDVwffCIIFOO18Gl6PnxwI7Gw7IDKC2e"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 May 2019 15:16:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 2/3] MAINTAINERS: Improve section headlines
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lqDVwffCIIFOO18Gl6PnxwI7Gw7IDKC2e
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Message-ID: <84e2792c-3fd3-3236-dc45-83405abb9a12@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/3] MAINTAINERS: Improve section headlines
References: <20190529150853.9772-1-armbru@redhat.com>
 <20190529150853.9772-3-armbru@redhat.com>
In-Reply-To: <20190529150853.9772-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/29/19 10:08 AM, Markus Armbruster wrote:
> When scripts/get_maintainer.pl reports something like
>=20
>     John Doe <jdoe@example.org> (maintainer:Overall)
>=20
> the user is left to wonder *which* of our three "Overall" sections
> applies.  We have three, one each under "Guest CPU cores (TCG)",
> "Guest CPU Cores (KVM)", and "Overall usermode emulation".
>=20
> Rename sections under
>=20
> * "Guest CPU cores (TCG)" from "FOO" to "FOO CPU cores (TCG)"
>=20
> * "Guest CPU Cores (KVM)" from "FOO" to "FOO CPU cores (KVM)"
>=20
> * "Guest CPU Cores (Xen)" from "FOO" to "FOO CPU cores (Xen)"
>=20
> * "Architecture support" from "FOO" to "FOO general architecture
>   support"
>=20
> * "Tiny Code Generator (TCG)" from "FOO target" to "FOO TCG target"
>=20
> While there,
>=20

Unintentional truncation? Or leftover thought that should be removed
after you instead split things?

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  MAINTAINERS | 78 ++++++++++++++++++++++++++---------------------------=

>  1 file changed, 39 insertions(+), 39 deletions(-)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--lqDVwffCIIFOO18Gl6PnxwI7Gw7IDKC2e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzuoksACgkQp6FrSiUn
Q2qsPgf+PCmjgRY+6Et1bwffTAuK9XdOP/5U6x6r0QemNOADPITioVkbZw6prMnP
yUwQseBsAvxP7N+tBRRac5awGWr8vhnFALD/Z5NM+kAXDU848Z6i1hon1SPTFKS4
xrBkE9K8Dck3DRQIdE1b77Q1TOoDRqtLIKueQVqvbm2fQ08H9bltRgtcjU/Z8U4X
GVut9XTaeyp2jNmTGuXXL5wik64TsP6t5OpwvMQ6D38POAoYlmsaZy7aLJEHn56i
Od4VI+3zJWvszm/b27M2MUrtN9Ynvc2+j6c9BsgKMNqokxYTY64a4Skm3O9ckkLo
9by9NGvn8AoKz2cF89fXo38kY/f1Og==
=MDII
-----END PGP SIGNATURE-----

--lqDVwffCIIFOO18Gl6PnxwI7Gw7IDKC2e--

