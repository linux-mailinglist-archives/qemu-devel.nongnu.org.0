Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC06AA58
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 16:11:15 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnOAl-0007qT-1k
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 10:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36715)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hnOAX-0007Qi-Bq
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hnOAV-0003Bl-7p
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 10:11:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58820)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hnOAO-00036c-EL; Tue, 16 Jul 2019 10:10:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E8BFC024AF6;
 Tue, 16 Jul 2019 14:10:51 +0000 (UTC)
Received: from [10.3.116.46] (ovpn-116-46.phx2.redhat.com [10.3.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDD455ED2D;
 Tue, 16 Jul 2019 14:10:50 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
References: <20190712173600.14554-1-mreitz@redhat.com>
 <20190712173600.14554-8-mreitz@redhat.com>
 <5c73228a-a6b2-31fa-a33d-0c65863acce5@redhat.com>
 <734f491b-9393-d380-0425-278901774723@redhat.com>
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
Message-ID: <6773c19f-d639-db08-a1e7-0ef0f2047942@redhat.com>
Date: Tue, 16 Jul 2019 09:10:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <734f491b-9393-d380-0425-278901774723@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0Jxk8DgKlIiMmbYtetcCmyXoTs95B7PWt"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 16 Jul 2019 14:10:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 7/7] iotests: Add test for image creation
 fallback
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
--0Jxk8DgKlIiMmbYtetcCmyXoTs95B7PWt
Content-Type: multipart/mixed; boundary="04o5Yrz6gFoAGzuEuZ4PFVh3WWpaPyM06";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Message-ID: <6773c19f-d639-db08-a1e7-0ef0f2047942@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] iotests: Add test for image creation
 fallback
References: <20190712173600.14554-1-mreitz@redhat.com>
 <20190712173600.14554-8-mreitz@redhat.com>
 <5c73228a-a6b2-31fa-a33d-0c65863acce5@redhat.com>
 <734f491b-9393-d380-0425-278901774723@redhat.com>
In-Reply-To: <734f491b-9393-d380-0425-278901774723@redhat.com>

--04o5Yrz6gFoAGzuEuZ4PFVh3WWpaPyM06
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/15/19 4:48 AM, Max Reitz wrote:

>>> +
>>> +_supported_fmt raw
>>
>> Why is this stating "raw" here...
>>
>>> +_supported_proto nbd
>=20
> Because it=E2=80=99s an NBD test.
>=20
>>> +_supported_os Linux
>>> +
>>> +
>>> +_make_test_img 64M
>=20
> Also, because I don=E2=80=98t want this to create a qcow2 image.  This =
should
> just set up a raw NBD node.
>=20
>>> +echo
>>> +echo '--- Testing creation ---'
>>> +
>>> +$QEMU_IMG create -f qcow2 "$TEST_IMG" 64M | _filter_img_create
>>
>> ... and using qcow2 here instead?
>=20
> Practical answer: Nobody tests qcow2+nbd.  Ever.  Because it is
> generally a stupid combination.  We need it for this test, though,
> because NBD is the simplest way to get a fixed-size block device.

There are definitely some broken things if you try qcow2+nbd. However, I
someday hope to implement a proposed NBD_CMD_RESIZE extension to the
protocol, at which point, it will be a lot easier to run qcow2+nbd
(where qcow2 can then advantage of automatic resizes of the protocol
layer, the same as it does for regular files), so part of that effort
may be figuring out how to make iotests cleanly support qcow2+nbd in
more situations.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--04o5Yrz6gFoAGzuEuZ4PFVh3WWpaPyM06--

--0Jxk8DgKlIiMmbYtetcCmyXoTs95B7PWt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0t2ukACgkQp6FrSiUn
Q2qnsAgAlfdJcsY1HygVV3Eb8QtC4mtAYrscDPlXYi1Z/gwH8TdK25LgvpuuA0UE
K9ftlZ745sCizvmDYJhL1fC7i9KkvLx2p8Z+oz/Hmw6c0lLjS51TW9DvGzAmbk7S
l6eVU1c4PMnwOO+dWmseYfXdsqhGiahl2FCFlE2j77mlSzJubq9ehoUCPsVlYr8M
LmZ7T8+r0bRUFmJrbRf0NzCNEosxIZkuIoog+1tt3kt7qceCqS0koSQwolTAGYCJ
bIZbUtKMEfwF7RcgXmmsiM/pe+hYncAKxkexa4NjEfy4u0KBgTTHu4cPnRyfENEv
kAoI3Nb5ORMxH7lD1oTvfZBH+CUA1A==
=VnN4
-----END PGP SIGNATURE-----

--0Jxk8DgKlIiMmbYtetcCmyXoTs95B7PWt--

