Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A975739C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 23:27:46 +0200 (CEST)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgFSD-0003uD-TR
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 17:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hgFPg-00028F-RX
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 17:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hgFPe-00084I-QQ
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 17:25:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hgFPX-0007xf-BR; Wed, 26 Jun 2019 17:25:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 923D1C18B2C1;
 Wed, 26 Jun 2019 21:24:56 +0000 (UTC)
Received: from [10.3.116.44] (ovpn-116-44.phx2.redhat.com [10.3.116.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68A645D9C6;
 Wed, 26 Jun 2019 21:24:53 +0000 (UTC)
To: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190605161804.118956-1-vsementsov@virtuozzo.com>
 <ebef5b9b-d2e9-7097-de61-9213fcb3f4e1@redhat.com>
 <78233f65-9b07-eea7-e7be-a630a6ad62a9@redhat.com>
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
Message-ID: <a6f5e9df-5ba1-6394-c2de-b9a9f23fa784@redhat.com>
Date: Wed, 26 Jun 2019 16:24:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <78233f65-9b07-eea7-e7be-a630a6ad62a9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lGGCpVI49PJyanjw2oynSfnhUpYPw96Oy"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 26 Jun 2019 21:24:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH v2 0/2] nbd: enable keepalive
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
Cc: kwolf@redhat.com, den@openvz.org, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lGGCpVI49PJyanjw2oynSfnhUpYPw96Oy
Content-Type: multipart/mixed; boundary="IoryFajqbBvdJZmF7HnZy6aCvqH013lvz";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com, den@openvz.org
Message-ID: <a6f5e9df-5ba1-6394-c2de-b9a9f23fa784@redhat.com>
Subject: Re: [Qemu-block] [PATCH v2 0/2] nbd: enable keepalive
References: <20190605161804.118956-1-vsementsov@virtuozzo.com>
 <ebef5b9b-d2e9-7097-de61-9213fcb3f4e1@redhat.com>
 <78233f65-9b07-eea7-e7be-a630a6ad62a9@redhat.com>
In-Reply-To: <78233f65-9b07-eea7-e7be-a630a6ad62a9@redhat.com>

--IoryFajqbBvdJZmF7HnZy6aCvqH013lvz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/26/19 4:23 PM, Eric Blake wrote:
> On 6/26/19 4:18 PM, John Snow wrote:
>>
>>
>> On 6/5/19 12:18 PM, Vladimir Sementsov-Ogievskiy wrote:
>>> Hi all!
>>>
>>> Here is a suggestion to enable keepalive option to track server avail=
ablity.
>>> We suggest to enable it by default. If we need, we'll be able to add =
option
>>> to specify timeout by hand later.
>>>
>>> v2: 01 - Fix io channel returned errors to be -1 [Daniel]
>>>     02 - Fix typo in commit message [Eric]
>>>
>>> Vladimir Sementsov-Ogievskiy (2):
>>>   io/channel: add qio_channel_set_keepalive
>>>   nbd-client: enable TCP keepalive
>>>
>>>  include/io/channel.h | 15 +++++++++++++++
>>>  block/nbd-client.c   |  1 +
>>>  io/channel-socket.c  | 20 ++++++++++++++++++++
>>>  io/channel.c         | 14 ++++++++++++++
>>>  4 files changed, 50 insertions(+)
>>>
>>
>> Ping -- I think this was good to go with Dan's ACK, based on the
>> discussion from v1.
>=20
> Actually, I thought that we changed tactics, and that the latest versio=
n is:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg01989.html
>=20
> [PATCH v2] qapi: InitSocketAddress: add keepalive option
>=20
> to make the setting conditional based on blockdev parameters rather tha=
n
> unconditional.

Or even v3, which still had review comments pending:

https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05508.html

[PATCH v3] qapi: Add InetSocketAddress member keep-alive

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--IoryFajqbBvdJZmF7HnZy6aCvqH013lvz--

--lGGCpVI49PJyanjw2oynSfnhUpYPw96Oy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0T4qQACgkQp6FrSiUn
Q2rlxQf/VMd4pVQ4ZtDp49vtJ6acm1CJ5HXTEHxv+3DNvjH8yJ/Qp3cwOQ0fEzUW
klMQve64wMVUw13QE7YGQa31C6hK81D8Bb6qLj5YO13vTuZHVq/UvAl45dBtJvRU
Obbu4ysCcctVfvEoFAoI9P7iXwSI/7PMVl8arQRCq0Y/6bOGvwTFO5jnGl6C/hHR
KzdLhj/ZBAZgrWgCR/e0CWWuJAPYqGAgCSpoLzI3uEx7WehuzuMCW1a8RSuzbsYB
bsMxJKqTAr0+LHz9xs45EpGPSWksWoVFX2c/HwAl1jD9f8Z16kLrSkUYh5A9kqhh
Ndf4Wpx2s7acnr/UP5vkQiWrdrtDZg==
=NmTo
-----END PGP SIGNATURE-----

--lGGCpVI49PJyanjw2oynSfnhUpYPw96Oy--

