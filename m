Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA913462
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 22:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMei8-0007ID-9n
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 16:23:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hMegF-00064H-8H
	for qemu-devel@nongnu.org; Fri, 03 May 2019 16:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hMegD-00045S-2a
	for qemu-devel@nongnu.org; Fri, 03 May 2019 16:21:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1hMeg9-0003wj-5X; Fri, 03 May 2019 16:21:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EDC730970CF;
	Fri,  3 May 2019 20:21:08 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 190675C69A;
	Fri,  3 May 2019 20:21:07 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <68cc5bbc-ed6f-e001-e376-ccd986683b88@redhat.com>
	<f1dfe2c3-2d61-e477-ac3d-37ad26d9236d@redhat.com>
	<61685a48-b84e-c379-7193-f456e82635ba@redhat.com>
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
Message-ID: <67a38513-89af-7f54-2fc8-05b5777983ca@redhat.com>
Date: Fri, 3 May 2019 15:21:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <61685a48-b84e-c379-7193-f456e82635ba@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="P4XcR4BlkHunkEgwKw1nIrLatmWP6HWMf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 03 May 2019 20:21:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Failing QEMU iotest 175
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nirsof@gmail.com>,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P4XcR4BlkHunkEgwKw1nIrLatmWP6HWMf
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nirsof@gmail.com>
Message-ID: <67a38513-89af-7f54-2fc8-05b5777983ca@redhat.com>
Subject: Re: Failing QEMU iotest 175
References: <68cc5bbc-ed6f-e001-e376-ccd986683b88@redhat.com>
 <f1dfe2c3-2d61-e477-ac3d-37ad26d9236d@redhat.com>
 <61685a48-b84e-c379-7193-f456e82635ba@redhat.com>
In-Reply-To: <61685a48-b84e-c379-7193-f456e82635ba@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/2/19 11:37 PM, Thomas Huth wrote:
> On 02/05/2019 23.56, Eric Blake wrote:
>> On 4/28/19 10:18 AM, Thomas Huth wrote:
>>> QEMU iotest 175 is failing for me when I run it with -raw:
>>>
>>
>>>  =3D=3D creating image with default preallocation =3D=3D
>>>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
>>> -size=3D1048576, blocks=3D0
>>> +size=3D1048576, blocks=3D2
>>
>> What filesystem?
>=20
> ext4
>=20

Hmm, it's passing for me on ext4, but that probably means we have
different configuration parameters. I'm not sure how to easily show what
parameters a particular ext4 partition uses to compare the differences
between your setup and mine (mine is tuned to whatever defaults Fedora's
installer chose on my behalf), so maybe someone else can chime in.

>> It should be fairly obvious that 'stat -c blocks=3D%b' is
>> file-system dependent (some allocate slightly more or less space, base=
d
>> on granularities and on predictions of future use), so we may need to
>> update the test to apply a filter or otherwise allow a bit of fuzz in
>> the answer. But 0/2 is definitely different than...
>>>
>>>  =3D=3D creating image with preallocation off =3D=3D
>>>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576 prealloc=
ation=3Doff
>>> -size=3D1048576, blocks=3D0
>>> +size=3D1048576, blocks=3D2
>>>
>>>  =3D=3D creating image with preallocation full =3D=3D
>>>  Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576 prealloc=
ation=3Dfull
>>> -size=3D1048576, blocks=3D2048
>>> +size=3D1048576, blocks=3D2050
>>
>> 2048/2050, so we DO have some indication of whether the file is sparse=

>> or fully allocated.
>=20
> Maybe we could check that the value after "blocks=3D" is a single digit=
 in
> the first case, and matches "blocks=3D20.." in the second case?

I wonder if 'qemu-img map --output=3Djson $TEST_IMG' might be any more
reliable (at least for ignoring any extra block allocations associated
with the file, if it is some journaling option or xattr or other reason
why your files seem to occupy more disk sectors than just the size of
the file would imply).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--P4XcR4BlkHunkEgwKw1nIrLatmWP6HWMf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzMorIACgkQp6FrSiUn
Q2qKBwgAgbEypAH4HvnQKf3go0sASavZzeaPlq3+val68ZK5/jUKHCMWIvc6E9G6
OoRogzOBfeFfY71eYPbabZ4Mo6p139I6CPbxnpKXOlqU7v0g4FHis3kICEoNcIrB
yWzPNn8i+iamLvnpkkmxMH0pSPIxAQYJTltU7wxRI6/27Is3Y0DUPhEphxu+V3DM
GbIAZFY7N8Gzq8H+MU6iwstt5rwTefxEnnKuiO+dkD7+q5GAMaBbJkWElqz6+iTc
F5ja6Yq2R95g4kwzdV2QpJXJwZir4PkeM9TA9SkwYmruU6epn9sQGrso5MBnwNLf
xBZbUVkFctD+YJdMGz3EiZmBnU76Rw==
=kD93
-----END PGP SIGNATURE-----

--P4XcR4BlkHunkEgwKw1nIrLatmWP6HWMf--

