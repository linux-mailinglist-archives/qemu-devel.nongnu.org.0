Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810823BFF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 17:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSkAW-0006q1-Av
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 11:25:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hSk9O-0006Rp-0b
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:24:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hSk9L-0001AA-Rp
	for qemu-devel@nongnu.org; Mon, 20 May 2019 11:24:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1hSk9J-0000ts-AH; Mon, 20 May 2019 11:24:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AC35C00296E;
	Mon, 20 May 2019 15:23:55 +0000 (UTC)
Received: from [10.3.116.56] (ovpn-116-56.phx2.redhat.com [10.3.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C6F61D0A;
	Mon, 20 May 2019 15:23:49 +0000 (UTC)
To: John Snow <jsnow@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20190517152111.206494-1-vsementsov@virtuozzo.com>
	<20190517152111.206494-2-vsementsov@virtuozzo.com>
	<e9c48cc9-3208-c111-9669-f6098ec746cd@redhat.com>
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
Message-ID: <64336004-7376-d4ec-b918-37d21fc1dfac@redhat.com>
Date: Mon, 20 May 2019 10:23:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e9c48cc9-3208-c111-9669-f6098ec746cd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="F3V17A31H9TfHaBohT5x7Mtn6wSt5TTPN"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 20 May 2019 15:24:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 1/2] qapi: support external bitmaps in
 block-dirty-bitmap-merge
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
Cc: kwolf@redhat.com, fam@euphon.net, den@virtuozzo.com, armbru@redhat.com,
	mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--F3V17A31H9TfHaBohT5x7Mtn6wSt5TTPN
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, fam@euphon.net,
 den@virtuozzo.com
Message-ID: <64336004-7376-d4ec-b918-37d21fc1dfac@redhat.com>
Subject: Re: [PATCH v2 1/2] qapi: support external bitmaps in
 block-dirty-bitmap-merge
References: <20190517152111.206494-1-vsementsov@virtuozzo.com>
 <20190517152111.206494-2-vsementsov@virtuozzo.com>
 <e9c48cc9-3208-c111-9669-f6098ec746cd@redhat.com>
In-Reply-To: <e9c48cc9-3208-c111-9669-f6098ec746cd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/17/19 5:45 PM, John Snow wrote:
>=20
>=20
> On 5/17/19 11:21 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Add new optional parameter making possible to merge bitmaps from
>> different nodes. It is needed to maintain external snapshots during
>> incremental backup chain history.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>=

>> ---

>> +# Since: 4.1
>> +##
>> +{ 'alternate': 'BlockDirtyBitmapMergeSource',
>> +  'data': { 'local': 'str',
>> +            'external': 'BlockDirtyBitmap' } }
>> +
>=20
> We might be able to use something more generic to name this type of
> thing, but I think such changes are wire compatible, so we can rename i=
t
> to be more generic if we decide to use this for something else in the
> future, so this is good.

Correct - type names are not API, so we can rename them later if it
makes sense.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--F3V17A31H9TfHaBohT5x7Mtn6wSt5TTPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzixoQACgkQp6FrSiUn
Q2qsCAf+JRiiE5l5CUSSi+14MZGXEuhYxILr48gwpfPRBjkUEDNKfStG87OXlJ8c
/fig+sHOWRvUOAJIlsIfBGzPwZwRrWqKgRtwVsaRrfM5xmbz2a6DPgzyJlmu27FZ
2yc7L4Yklz2W6T1R43uUXTUWKN1WEleGr5IS1hR6PoBZfNpVI2J1heqEF0/B74kw
EZoOY7SWSmtp+CfPpyxXU32SYFlMLEsovFxhKQ3GRbp1ZYm4idYM8oeAGprF0SAt
YahGPhWwdcEDky6n0fMlZZu1Fp8kYkpkWLJISkA13RnAmHV0NCybIoDU2dzvTJC5
y4+iHYbDftREWcHtHU/Casgz2QoScg==
=YRWn
-----END PGP SIGNATURE-----

--F3V17A31H9TfHaBohT5x7Mtn6wSt5TTPN--

