Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1B1698A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 19:46:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO4Al-0003f1-5S
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 13:46:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO49X-0003E4-IT
	for qemu-devel@nongnu.org; Tue, 07 May 2019 13:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO49V-0008Rw-AI
	for qemu-devel@nongnu.org; Tue, 07 May 2019 13:45:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hO49P-0008MY-NJ
	for qemu-devel@nongnu.org; Tue, 07 May 2019 13:45:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE21D30842A0;
	Tue,  7 May 2019 17:45:08 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99AD62E038;
	Tue,  7 May 2019 17:45:03 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Ernest Esene <eroken1@gmail.com>
References: <20190504181119.GA3317@erokenlabserver>
	<87ftpqb25m.fsf@dusky.pond.sub.org>
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
Message-ID: <85baf98a-0309-8168-a0f7-6d7e9d4e447b@redhat.com>
Date: Tue, 7 May 2019 12:45:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87ftpqb25m.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VaG9fhRWZRvQR2rmYy3yAhlQelL2TbVki"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 07 May 2019 17:45:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2] chardev/char-i2c: Implement Linux I2C
 character device
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VaG9fhRWZRvQR2rmYy3yAhlQelL2TbVki
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Ernest Esene <eroken1@gmail.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <85baf98a-0309-8168-a0f7-6d7e9d4e447b@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] chardev/char-i2c: Implement Linux I2C
 character device
References: <20190504181119.GA3317@erokenlabserver>
 <87ftpqb25m.fsf@dusky.pond.sub.org>
In-Reply-To: <87ftpqb25m.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 5/7/19 12:33 PM, Markus Armbruster wrote:

>> +static int i2c_ioctl(Chardev *chr, int cmd, void *arg)
>> +{
>> +    FDChardev *fd_chr =3D FD_CHARDEV(chr);
>> +    QIOChannelFile *floc =3D QIO_CHANNEL_FILE(fd_chr->ioc_in);
>> +    int fd =3D floc->fd;
>> +    int addr;
>> +
>> +    switch (cmd) {
>> +    case CHR_IOCTL_I2C_SET_ADDR:
>> +        addr =3D (int) (long) arg;
>=20
> Would (int)arg make the compiler unhappy?

If you're trying to pass an integer through void*, it's probably best to
write:

addr =3D (intptr_t) arg;

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--VaG9fhRWZRvQR2rmYy3yAhlQelL2TbVki
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzRxB4ACgkQp6FrSiUn
Q2oeGwf+KDnZI0flzk+dWVIAKine77s2L41F5jsPEig+f4HssGvmQ3kyT/TgahOn
nk/HzfCCvbImtrxfRMY670dqLIlWVb2lfuh2VWhLPBgXtZq7Uju2NWE9TfdG5gYk
NIDSI3WYUNbR0NOCSuQmSXMd4xUcQFmvn8iNCorubKWzWtjEkjAYMks416G2AAWq
9sxwvqNhMereREeJPrtaXLwykCOk1MKRq9V/gzkibz/ggf5c+ats7fb6uWGZlAle
tEQsxppNm3CzGwmkgHH04fAYk/DPHUsgmbd3y4peMMbJwXicDL5gqWWTWRqigVkq
ZkxXqKx5s2klFuXrdwIH9AGfH8keqQ==
=EPH+
-----END PGP SIGNATURE-----

--VaG9fhRWZRvQR2rmYy3yAhlQelL2TbVki--

