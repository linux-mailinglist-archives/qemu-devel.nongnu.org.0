Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB24423B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 18:21:24 +0200 (CEST)
Received: from localhost ([::1]:41360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbSTb-0001tj-9Z
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hbR6k-0000hT-S7
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hbR6i-0008IY-Vf
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:53:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hbR6b-00089m-P6; Thu, 13 Jun 2019 10:53:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9215F10F6F;
 Thu, 13 Jun 2019 14:53:32 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D7C19700;
 Thu, 13 Jun 2019 14:53:31 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190611102720.86114-1-vsementsov@virtuozzo.com>
 <20190611102720.86114-3-vsementsov@virtuozzo.com>
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
Message-ID: <fad48964-b642-41a9-90e9-f26cdc8b34f2@redhat.com>
Date: Thu, 13 Jun 2019 09:53:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611102720.86114-3-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pdrej0aWDSqshSW6579m1SrnR0y77ZdQp"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 13 Jun 2019 14:53:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] block/nbd: merge nbd-client.* to nbd.c
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pdrej0aWDSqshSW6579m1SrnR0y77ZdQp
Content-Type: multipart/mixed; boundary="NtdmmNlbJD3d4mdyzEAB5O29aPKPh3OfY";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: mreitz@redhat.com, kwolf@redhat.com
Message-ID: <fad48964-b642-41a9-90e9-f26cdc8b34f2@redhat.com>
Subject: Re: [PATCH 2/3] block/nbd: merge nbd-client.* to nbd.c
References: <20190611102720.86114-1-vsementsov@virtuozzo.com>
 <20190611102720.86114-3-vsementsov@virtuozzo.com>
In-Reply-To: <20190611102720.86114-3-vsementsov@virtuozzo.com>

--NtdmmNlbJD3d4mdyzEAB5O29aPKPh3OfY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/11/19 5:27 AM, Vladimir Sementsov-Ogievskiy wrote:
> No reason of keeping driver handlers realization in separate of driver
> structure. We can get rid of extra header file.
>=20
> While being here, fix comments style, restore forgotten comments for
> NBD_FOREACH_REPLY_CHUNK and nbd_reply_chunk_iter_receive, remove extra
> includes.

It's a little bit harder to review for accuracy when the patch does
cleanups at the same time; but this shows that the patch is fairly
simple to understand:

$ diff -u <(git log -p -1 | sed -n 's/^-//p') <(git log -p -1 | sed -n
's/^\+//p')

the most confusing parts were that HANDLE_TO_INDEX/INDEX_TO_HANDLE moved
differently from nbd_get_client_session(), and
nbd_client_{attach,detach}_aio_conext moved to a different relative
position.  Perhaps the patch could have been split to make the code
motion even easier to follow, but it's not worth respinning now.

>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd-client.h  |   63 ---
>  block/nbd-client.c  | 1226 -----------------------------------------
>  block/nbd.c         | 1285 +++++++++++++++++++++++++++++++++++++++++--=

>  block/Makefile.objs |    2 +-
>  block/trace-events  |    2 +-
>  5 files changed, 1255 insertions(+), 1323 deletions(-)
>  delete mode 100644 block/nbd-client.h
>  delete mode 100644 block/nbd-client.c

Reviewed-by: Eric Blake <eblake@redhat.com>

This will tend to cause merge conflicts to anything else touching either
file, so I plan to send a pull request soon.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--NtdmmNlbJD3d4mdyzEAB5O29aPKPh3OfY--

--pdrej0aWDSqshSW6579m1SrnR0y77ZdQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0CY2oACgkQp6FrSiUn
Q2rFgggAqMUGfKO2XA2HxeC5Pzdal+bDhUWnyngz3D14ipr4ZSHeeUgxWgm2yuAx
qNxsOFulnxzurA/jEhp2i/12dlmBswSy4Jg/crwRmhzJt+zPeO4WOWJHw11oZvfz
FkC1+qqGeT6MmzGbMg9ydy9N9AxqLRAC2DeE0+RxWjWI/Z5P8qh5vhLX0V22koYU
5tF2tMepjoLUiVRXvZeXfeCuVzu0RoBZbAt4xMo/3Lq/taYCAtdw6kKXwAqUlvzk
BBuf/Qi2PqTooUoNuo9nBE2LWGzSjrUjD8VQkZ4FbHaIthHcq4pV0H1ZKfJmFwPT
2k+UovkkWAMfz14Meoyojue0/gS8lQ==
=kJiZ
-----END PGP SIGNATURE-----

--pdrej0aWDSqshSW6579m1SrnR0y77ZdQp--

