Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4287C466
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 16:09:41 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hspIS-0002iD-GQ
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 10:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hspHh-00022Q-Fy
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hspHg-00082V-Hm
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:08:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39469)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hspHg-00081o-9O
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 10:08:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0588F7C83B;
 Wed, 31 Jul 2019 14:08:51 +0000 (UTC)
Received: from [10.3.116.93] (ovpn-116-93.phx2.redhat.com [10.3.116.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AFC75798A;
 Wed, 31 Jul 2019 14:08:49 +0000 (UTC)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190725084341.8287-1-berrange@redhat.com>
 <87a7cui9le.fsf@linaro.org>
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
Message-ID: <196f1373-6105-c3d1-e58c-da83d40c4fc5@redhat.com>
Date: Wed, 31 Jul 2019 09:08:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87a7cui9le.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kIZ8xrJp4N2a2E6EGgkLNlBcg7150iNFs"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 31 Jul 2019 14:08:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/3] require newer glib2 to enable
 autofree'ing of stack variables exiting scope
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kIZ8xrJp4N2a2E6EGgkLNlBcg7150iNFs
Content-Type: multipart/mixed; boundary="BxVbpbtTwOpfsY0VAd4iuglxoDjSqA28M";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Message-ID: <196f1373-6105-c3d1-e58c-da83d40c4fc5@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2 0/3] require newer glib2 to enable
 autofree'ing of stack variables exiting scope
References: <20190725084341.8287-1-berrange@redhat.com>
 <87a7cui9le.fsf@linaro.org>
In-Reply-To: <87a7cui9le.fsf@linaro.org>

--BxVbpbtTwOpfsY0VAd4iuglxoDjSqA28M
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/31/19 9:04 AM, Alex Benn=C3=A9e wrote:
>=20
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
>> Both GCC and CLang support a C extension attribute((cleanup)) which
>> allows you to define a function that is invoked when a stack variable
>> exits scope. This typically used to free the memory allocated to it,
>> though you're not restricted to this. For example it could be used to
>> unlock a mutex.
> <snip>
>>
>>     GOOD:
>>         g_autofree char *wibble =3D g_strdup("wibble")
>> 	...
>> 	return g_steal_pointer(wibble);
>>
>>     g_steal_pointer is an inline function which simply copies
>>     the pointer to a new variable, and sets the original variable
>>     to NULL, thus avoiding cleanup.
>=20
> Surely this is a particular use case where you wouldn't use g_autofree
> to declare the variable as you intending to return it to the outer scop=
e?

Actually, it's still quite useful if you have intermediate returns:

g_autofree char *wibble =3D NULL;
if (something)
  return NULL;
wibble =3D g_strdup("wibble");
if (something_else)
  return NULL;
return g_steal_pointer(wibble);

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--BxVbpbtTwOpfsY0VAd4iuglxoDjSqA28M--

--kIZ8xrJp4N2a2E6EGgkLNlBcg7150iNFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1BoPAACgkQp6FrSiUn
Q2o0cQf+JkL6oATiioR1JqJ1BZjf/B0jfJ2q0jNL1HnqoNPIJD/BdLrNvKD10dw6
ITdIcrwzlozqxNlktSFWwYrow7fdbePLdmLKOdxeDw+X30bebJ7m41Z33IHzFmAk
yqRpXmFnHX3U+U1pR5ZBFqnflSGYmpZo6u2GDf8A1tk3MNMHr77cpKLajDWYE+a/
vVSaIuczU8pM7iejpSMlispjXSxa/Ru+RZXITiqTVdNvmfHZ875+7kr15qIqkb1c
CDQ59GnLotgPocRfSKIcIlxHLDq5xizYsoEWk2ARsTzlY1zxtpKuN1EzwPgJ86Ft
sym5pQr6vosgHq5AsqXPiL1tPdiqiA==
=xwqd
-----END PGP SIGNATURE-----

--kIZ8xrJp4N2a2E6EGgkLNlBcg7150iNFs--

