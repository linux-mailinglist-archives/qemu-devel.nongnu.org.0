Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA159B4C1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 18:45:17 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Cge-0001Ya-2D
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 12:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i1Ccl-0007SM-5l
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i1Ccj-0004HX-8O
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:41:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i1Ccg-0004EC-GR; Fri, 23 Aug 2019 12:41:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77CA0806CF;
 Fri, 23 Aug 2019 16:41:09 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 325431001B32;
 Fri, 23 Aug 2019 16:41:09 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-6-eblake@redhat.com>
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
Message-ID: <8865962e-ddb9-eb40-715e-3d6756c1af80@redhat.com>
Date: Fri, 23 Aug 2019 11:41:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143726.27062-6-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7iJMX2BBlGzo2Dm6FNxYSaOcYRJv7PIz9"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 23 Aug 2019 16:41:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 5/5] nbd: Tolerate more errors to
 structured reply request
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
Cc: qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7iJMX2BBlGzo2Dm6FNxYSaOcYRJv7PIz9
Content-Type: multipart/mixed; boundary="NcAgE3J4Qy7mGieAWwBCltGixsLwpaEvE";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block <qemu-block@nongnu.org>
Message-ID: <8865962e-ddb9-eb40-715e-3d6756c1af80@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 5/5] nbd: Tolerate more errors to structured
 reply request
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-6-eblake@redhat.com>
In-Reply-To: <20190823143726.27062-6-eblake@redhat.com>

--NcAgE3J4Qy7mGieAWwBCltGixsLwpaEvE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

[dropping non-qemu lists]

On 8/23/19 9:37 AM, Eric Blake wrote:
> A server may have a reason to reject a request for structured replies,
> beyond just not recognizing them as a valid request.  It doesn't hurt
> us to continue talking to such a server; otherwise 'qemu-nbd --list'
> of such a server fails to display all possible details about the
> export.
>=20
> Encountered when temporarily tweaking nbdkit to reply with
> NBD_REP_ERR_POLICY.  Present since structured reply support was first
> added (commit d795299b reused starttls handling, but starttls has to
> reject all errors).
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  nbd/client.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)

Shoot, I included one patch too many. This patch was posted in a
separate thread, where I argued that it is broken and needs a v2:

https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04323.html


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--NcAgE3J4Qy7mGieAWwBCltGixsLwpaEvE--

--7iJMX2BBlGzo2Dm6FNxYSaOcYRJv7PIz9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1gFyQACgkQp6FrSiUn
Q2qhlAf+PNEX6FnkwkTfiTy/cxXhu+51Cg80horJkqx1Lhy7kZqTH8o/jIv+4OxM
/nCxK9hKs4oagfsD3C9PYz/camhchi8tBFbq6Iep+FEsH23//AI3zNOIwrS36u+7
O+c11XJeSlOIRsalJc7uQD1ag5iWryF3QoB4JZb/rM0W+dnsRBrnpEfSESgfbTim
8tWHErlsCeFXz2TgdOMUCk+05Tfg2EiUP0J0/xGFqqC7QqR0+bE1B7WuBPmrkMbV
E8lHbexSqxjY/l7ZHeoVe68Ocwt7FlPegwIQP7nuVxsCrxdWlsymhnSc2rm2hVln
1b71G3d8xUevj88coLbT/u7I3/4SRw==
=SLvq
-----END PGP SIGNATURE-----

--7iJMX2BBlGzo2Dm6FNxYSaOcYRJv7PIz9--

