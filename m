Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63073584DF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 16:50:49 +0200 (CEST)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgVjc-0004XI-0s
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 10:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hgViN-0003qq-NG
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 10:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hgViM-0005bY-J9
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 10:49:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hgViJ-0005Xe-T8; Thu, 27 Jun 2019 10:49:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD9A7308792C;
 Thu, 27 Jun 2019 14:49:16 +0000 (UTC)
Received: from [10.3.116.142] (ovpn-116-142.phx2.redhat.com [10.3.116.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B13B5D9E2;
 Thu, 27 Jun 2019 14:49:14 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20190626024942.29758-1-eblake@redhat.com>
 <20190626082251.GA29008@redhat.com>
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
Message-ID: <a3418db6-4bb4-029e-8a5d-d9e6b1185f22@redhat.com>
Date: Thu, 27 Jun 2019 09:49:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626082251.GA29008@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="81nyKszan7JznHVnDF0oukyREiD8CX17T"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 27 Jun 2019 14:49:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qemu-nbd: Permit TLS with Unix sockets
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
Cc: qemu-devel@nongnu.org,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--81nyKszan7JznHVnDF0oukyREiD8CX17T
Content-Type: multipart/mixed; boundary="2lt1Gz2OEMriVusTW0rAwfBqJrtegOaZj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, rjones@redhat.com,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Message-ID: <a3418db6-4bb4-029e-8a5d-d9e6b1185f22@redhat.com>
Subject: Re: [PATCH] qemu-nbd: Permit TLS with Unix sockets
References: <20190626024942.29758-1-eblake@redhat.com>
 <20190626082251.GA29008@redhat.com>
In-Reply-To: <20190626082251.GA29008@redhat.com>

--2lt1Gz2OEMriVusTW0rAwfBqJrtegOaZj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/26/19 3:22 AM, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Jun 25, 2019 at 09:49:42PM -0500, Eric Blake wrote:
>> Although you generally won't use encryption with a Unix socket (after
>> all, everything is local, so why waste the CPU power), there are
>> situations in testsuites where Unix sockets are much nicer than TCP
>> sockets.  Since nbdkit allows encryption over both types of sockets,
>> it makes sense for qemu-nbd to do likewise.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  qemu-nbd.c | 4 ----
>>  1 file changed, 4 deletions(-)
>=20
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
>=20
> Do you need something on the client side too ?

The proposal that Rich is working on for standardized NBD URIs [1] says
that we need a patch to support nbds://host/export and
nbds+unix://export?socket=3D/path as ways to request an encrypted client
connection with default encryption parameters. For anything more
complex, we have to use --imageopts and request an encrypted connection
by parts - but the QAPI schema already permits us to pass in an
'tls-creds' parameter for both TCP and Unix sockets, so no, I don't
think we need any client side changes at this point.

I do, however, plan to test that 'qemu-nbd --list -k socket --tls...'
works (I think it does, and it can be used even without this patch
against nbdkit as server...), prior to taking this patch through my NBD
tree.

[1] https://lists.debian.org/nbd/2019/06/msg00011.html

>=20
>=20
> Regards,
> Daniel
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--2lt1Gz2OEMriVusTW0rAwfBqJrtegOaZj--

--81nyKszan7JznHVnDF0oukyREiD8CX17T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0U12oACgkQp6FrSiUn
Q2oZYwf9FJ6+kzLkI5892MoelngDpnLj2YvH0LGx0ZaW9lvXuTXqJ0KIZvOY3pSw
3KDsUEH0HqQwiemTVNzxlR+e+QQ2YT5g6ica6yoMkqQXSDRlntdVpxUhkgC9f3b1
6JLZ4F7CHG0Ej6cPqs4OCLmWFUhAPEnAe1NWIYypxifWW30DGBY4RSZYR/sua+HN
HLwAUCgDfHUXpXMurQ7rkvltJA93AnP1L5QIZM8graNThXnjvUX6jcCiZ+b4O2tY
iuAGnYo2gajrgU3EqeeM8fD83/FQIRCYx9yypgZcXDcMCo4sJyN5T3JhByntOjO/
/Gf5YcshyJWwDzxWqb8dZzItREzWQQ==
=n5Lm
-----END PGP SIGNATURE-----

--81nyKszan7JznHVnDF0oukyREiD8CX17T--

