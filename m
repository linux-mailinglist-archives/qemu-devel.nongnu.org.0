Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AD95F6F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 15:05:53 +0200 (CEST)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i03pg-0003Wc-7n
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 09:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i03oh-0002e1-4H
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:04:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i03og-0000Eh-4N
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 09:04:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1i03oZ-0000Bp-UC; Tue, 20 Aug 2019 09:04:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E5C435F17E;
 Tue, 20 Aug 2019 13:04:42 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 604F03DA5;
 Tue, 20 Aug 2019 13:04:42 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20190819185602.4267-1-mreitz@redhat.com>
 <20190819185602.4267-13-mreitz@redhat.com>
 <272cbeba-2053-9aa6-7ceb-e1b3827de540@redhat.com>
 <39066a69-e319-c3ad-7b3b-2983bb248a25@redhat.com>
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
Message-ID: <12094c23-597d-b6fc-a279-5609e29c31a9@redhat.com>
Date: Tue, 20 Aug 2019 08:04:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <39066a69-e319-c3ad-7b3b-2983bb248a25@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lS80dSunIXD6koqyXPwwDeTcVn1eZF9Z3"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 20 Aug 2019 13:04:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 12/16] qcow2: Fix overly long snapshot
 tables
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
--lS80dSunIXD6koqyXPwwDeTcVn1eZF9Z3
Content-Type: multipart/mixed; boundary="3SnIbpC7KmS1mwNRdiiuJQp5TJtvdzwqi";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Message-ID: <12094c23-597d-b6fc-a279-5609e29c31a9@redhat.com>
Subject: Re: [PATCH v2 12/16] qcow2: Fix overly long snapshot tables
References: <20190819185602.4267-1-mreitz@redhat.com>
 <20190819185602.4267-13-mreitz@redhat.com>
 <272cbeba-2053-9aa6-7ceb-e1b3827de540@redhat.com>
 <39066a69-e319-c3ad-7b3b-2983bb248a25@redhat.com>
In-Reply-To: <39066a69-e319-c3ad-7b3b-2983bb248a25@redhat.com>

--3SnIbpC7KmS1mwNRdiiuJQp5TJtvdzwqi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/20/19 7:09 AM, Max Reitz wrote:
> On 19.08.19 21:43, Eric Blake wrote:
>> On 8/19/19 1:55 PM, Max Reitz wrote:
>>> We currently refuse to open qcow2 images with overly long snapshot
>>> tables.  This patch makes qemu-img check -r all drop all offending
>>> entries past what we deem acceptable.
>>>
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>  block/qcow2-snapshot.c | 88 +++++++++++++++++++++++++++++++++++++---=
--
>>>  1 file changed, 78 insertions(+), 10 deletions(-)
>>
>> I know I was reluctant in v1, but you also managed to convince me that=

>> it really takes a LOT of effort to get a table with that many entries.=

>> And a user has to opt-in to 'qemu-img -r' (it may discard a snapshot
>> they value, but that beats not being able to use the image under qemu =
at
>> all, and we don't erase it for plain 'qemu-img check').  So I'm okay
>> with this going in.  Maybe the commit message can state this sort of
>> reasoning.
>=20
> So maybe:
>=20
> The user cannot choose which snapshots are removed.  This is fine
> because we have chosen the maximum snapshot table size to be so large
> (64 MB) that it cannot be reasonably reached.  If the snapshot table
> exceeds this size, the image has probably been corrupted in some way; i=
n
> this case, it is most important to just make the image usable such that=

> the user can copy off at least the active layer.
> (Also note that the snapshots will be removed only with "-r all", so a
> plain "check" or "check -r leaks" will not delete any data.)

I like it.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--3SnIbpC7KmS1mwNRdiiuJQp5TJtvdzwqi--

--lS80dSunIXD6koqyXPwwDeTcVn1eZF9Z3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1b7+kACgkQp6FrSiUn
Q2ppRwf9H6pXDvz0CNBsTmqbR2ok+a7rZS1sbDPkmgyWkPuurMZpt8CE3BXSvYqM
sqf7y+JMqk4KC124hMA60g4U0UmIfT1tfgThZCaRTL9GCku5VD2iWn4Qo6eT9g3h
SlZdkrlXLZMBLGTtc6rGnMKdi9s6m4feKZpaluaZdHqd3+SUQ5+5PjEWP19y8kyL
WFum4nax2fd/5VXr90oLQDDlLGMuy2bLj6W2NzmrLW7E8IJ/3Clmf0yU1fgNxa2N
kYP9JZIgdbI2UdMBdN7UMYYWxjeTCuc8ThxioDa4POMWeS7zmDOofAvUBCDY1mqX
3aTlopBFcNAyfUpjyqgtPIUlvDkSJg==
=JOXz
-----END PGP SIGNATURE-----

--lS80dSunIXD6koqyXPwwDeTcVn1eZF9Z3--

