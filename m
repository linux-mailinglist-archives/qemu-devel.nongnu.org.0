Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD37551B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 19:06:59 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqhCk-0004UE-GC
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 13:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57717)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hqhCV-00045o-Kq
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 13:06:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hqhCU-0001HK-F2
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 13:06:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hqhCN-0001Dl-O1; Thu, 25 Jul 2019 13:06:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7FD130C62A3;
 Thu, 25 Jul 2019 17:06:33 +0000 (UTC)
Received: from [10.3.116.93] (ovpn-116-93.phx2.redhat.com [10.3.116.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E558C620CE;
 Thu, 25 Jul 2019 17:06:29 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20190725162704.12622-1-kwolf@redhat.com>
 <20190725162704.12622-5-kwolf@redhat.com>
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
Message-ID: <dc36c911-377a-924b-c5b7-a11f6022b765@redhat.com>
Date: Thu, 25 Jul 2019 12:06:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190725162704.12622-5-kwolf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aHNY1txYP3ICKVYuR6MnnVlputHCjbPZd"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 25 Jul 2019 17:06:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/4] block-backend: Queue requests while
 drained
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
Cc: dplotnikov@virtuozzo.com, vsementsov@virtuozzo.com, den@virtuozzo.com,
 mreitz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aHNY1txYP3ICKVYuR6MnnVlputHCjbPZd
Content-Type: multipart/mixed; boundary="0dukJQ0Sg8RDpQQ8a9LvE9NNuICnNWOqs";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: vsementsov@virtuozzo.com, den@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, dplotnikov@virtuozzo.com
Message-ID: <dc36c911-377a-924b-c5b7-a11f6022b765@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 4/4] block-backend: Queue requests while
 drained
References: <20190725162704.12622-1-kwolf@redhat.com>
 <20190725162704.12622-5-kwolf@redhat.com>
In-Reply-To: <20190725162704.12622-5-kwolf@redhat.com>

--0dukJQ0Sg8RDpQQ8a9LvE9NNuICnNWOqs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/25/19 11:27 AM, Kevin Wolf wrote:
> This fixes device like IDE that can still start new requests from I/O
> handlers in the CPU thread while the block backend is drained.
>=20
> The basic assumption is that in a drain section, no new requests should=

> be allowed through a BlockBackend (blk_drained_begin/end don't exist,
> we get drain sections only on the node level). However, there are two
> special cases where requests should not be queued:
>=20
> 1. Block jobs: We already make sure that block jobs are paused in a
>    drain section, so they won't start new requests. However, if the
>    drain_begin is called on the job's BlockBackend first, it can happen=

>    that we deadlock because the job stays busy until it reaches a pause=

>    point - which it can't if it's requests aren't processed any more.

its (remember, "it's" is only okay if "it is" works as well)

>=20
>    The proper solution here would be to make all requests through the
>    job's filter node instead of using a BlockBackend. For now, just
>    disabling request queuin on the job BlockBackend is simpler.

queuing

>=20
> 2. In test cases where making requests through bdrv_* would be
>    cumbersome because we'd need a BdrvChild. As we already got the
>    functionality to disable request queuing from 1., use it in tests,
>    too, for convenience.
>=20
--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--0dukJQ0Sg8RDpQQ8a9LvE9NNuICnNWOqs--

--aHNY1txYP3ICKVYuR6MnnVlputHCjbPZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl054ZUACgkQp6FrSiUn
Q2rWqggAqjYtBhIUeprgo/ygGsHE1X+8UETKqAH279EMZzDxrRsllvXNji7kAmJz
J2YcQ6u8PriWinoQBd2URspLq0bpb+943vX4zl0osO/sncWOYWvNS8hEjIKPMcT0
k2EN/oT8rLrJf/oQ/kOeVsdbZAhHrKAUJTWqp2QZyvfpDxHENqfAqgKRffBsj0IK
cJJqu85wRm4dTz2HluSbHUY8GHwXiO2Rk/Ud3B9oNn6Rf+R1E1hpb4+eDlq6etpm
b16OXlDIbaet1Em6WY33DFIFfhjoffNwUQKbXT8frSwthzeq6hnGCs7FfibF9Zmc
VNSq5NY/3PO5qZYo/Xly9TLsLBByYg==
=p16F
-----END PGP SIGNATURE-----

--aHNY1txYP3ICKVYuR6MnnVlputHCjbPZd--

