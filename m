Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B3B7BF5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 16:17:56 +0200 (CEST)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAxFr-0004FF-7S
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iAwx4-0007Dl-6o
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iAwsx-0003PG-Kb
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:54:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iAwsx-0003Ok-By
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 09:54:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A86597BDAE;
 Thu, 19 Sep 2019 13:54:14 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06B7BBA65;
 Thu, 19 Sep 2019 13:54:13 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190913154952.27724-1-peter.maydell@linaro.org>
 <20190913154952.27724-13-peter.maydell@linaro.org>
 <9ede7068-7f92-3e1a-c1f8-c0994eddf671@redhat.com>
 <CAFEAcA8nj27YwR3F0NA8JiV2yqqLcBzZ6T42Ue5FV2cUcmRoaQ@mail.gmail.com>
 <4324a9d9-6070-d014-27c9-77187cea1dfa@redhat.com>
 <CAFEAcA_P8H4=-tnKLrm+YTqH_p7x2oVjHq1Sg03m6ssrWnKsjw@mail.gmail.com>
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
Message-ID: <07b8a4b8-79d2-a2f6-721d-e4a14917c808@redhat.com>
Date: Thu, 19 Sep 2019 08:54:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_P8H4=-tnKLrm+YTqH_p7x2oVjHq1Sg03m6ssrWnKsjw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vGjWQyf8ylyddnEPSgJO2EZC8mVsdyD0H"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 19 Sep 2019 13:54:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 12/12] qemu-ga: Convert invocation
 documentation to rST
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vGjWQyf8ylyddnEPSgJO2EZC8mVsdyD0H
Content-Type: multipart/mixed; boundary="ZC1X6xnYXn2FWOiWZUMH6E1XGMjflVDOa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <07b8a4b8-79d2-a2f6-721d-e4a14917c808@redhat.com>
Subject: Re: [Qemu-devel] [PULL 12/12] qemu-ga: Convert invocation
 documentation to rST
References: <20190913154952.27724-1-peter.maydell@linaro.org>
 <20190913154952.27724-13-peter.maydell@linaro.org>
 <9ede7068-7f92-3e1a-c1f8-c0994eddf671@redhat.com>
 <CAFEAcA8nj27YwR3F0NA8JiV2yqqLcBzZ6T42Ue5FV2cUcmRoaQ@mail.gmail.com>
 <4324a9d9-6070-d014-27c9-77187cea1dfa@redhat.com>
 <CAFEAcA_P8H4=-tnKLrm+YTqH_p7x2oVjHq1Sg03m6ssrWnKsjw@mail.gmail.com>
In-Reply-To: <CAFEAcA_P8H4=-tnKLrm+YTqH_p7x2oVjHq1Sg03m6ssrWnKsjw@mail.gmail.com>

--ZC1X6xnYXn2FWOiWZUMH6E1XGMjflVDOa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/19/19 8:35 AM, Peter Maydell wrote:
> On Thu, 19 Sep 2019 at 14:27, Eric Blake <eblake@redhat.com> wrote:
>>
>> On 9/19/19 7:00 AM, Peter Maydell wrote:
>>
>>>> In an incremental build on Fedora 30, I'm now seeing:
>>>>
>>>>         CHK version_gen.h
>>>>   GEN     docs/interop/qemu-ga.8
>>>> No filename or title
>>>> make: *** [/home/eblake/qemu/rules.mak:394: docs/interop/qemu-ga.8]
>>>> Error 255
>>>>
>>>> and suspect this patch introduced it.  It may be that I just need to=

>>>> nuke intermediate artifacts rather than an actual problem with the
>>>> patch, but I'd welcome help in identifying the problem.
>>>
>>> If you build with V=3D1 what does it say it's doing?
>>
>> make[1]: Leaving directory '/home/eblake/qemu/dtc'
>> perl -Ww -- /home/eblake/qemu/scripts/texi2pod.pl -I docs -I scripts -=
I
>> docs/interop -DVERSION=3D"4.1.50" -DCONFDIR=3D"/usr/local/etc/qemu"
>> scripts/texi2pod.pl docs/interop/qemu-ga.8.pod && pod2man --utf8
>> --section=3D8 --center=3D" " --release=3D" " docs/interop/qemu-ga.8.po=
d >
>> docs/interop/qemu-ga.8
>> No filename or title
>> make: *** [/home/eblake/qemu/rules.mak:394: docs/interop/qemu-ga.8]
>> Error 255
>=20
> Do you have sphinx installed on this machine?

Not yet.

/me goes and installs sphinx-2.2.11-12.fc30.x86_64

Nope, problem is still happening even after rerunning ./configure


> I'm wondering
> if the problem here is that we have disabled the sphinx build
> runes but are then falling back to the "try to make any %.8
> via the TEXI2MAN rule in rules.mak" [*]. On the other hand
> docs/interop/qemu-ga.8 is only put into DOCS if BUILD_DOCS is
> set, which should only happen if sphinx is available.
>=20
> [*] these rules are a bit bogus, because I think they will apply even
> if there's no other rule saying 'foo.8 depends on something.texi',
> and then as you can see in your command line we end up running
> texi2pod with an empty "$<" rather than passing it a texi file.

Okay, that's something to play with.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ZC1X6xnYXn2FWOiWZUMH6E1XGMjflVDOa--

--vGjWQyf8ylyddnEPSgJO2EZC8mVsdyD0H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl2DiIUACgkQp6FrSiUn
Q2o1VAgAlV1Cp9keGdwmjkjJx+WQArzAeza7So9DR4HERboxsYuBRN2Q7uTkosnG
TVeJRhK5Gz/qRXMX0jms9Sm9iXfHhwXuvy43Pv+8apGYbLEfVnaCbwUD2KHUsPnS
/H2X/HUswUGHeo9exhN8HCT9IkJp3Qnv9Qi0HBKfJQ+D+z6N3ATCUeT6Yb7GmsMO
TNDESk5yDCAJPaJbXYi45t0Dzt1D2IEt7JRvuUFfLw9Yxj9hjSXMiX66FwQTlpuL
u9ykh0q8V2A6s7ik5NN3bnQAkIHVsLtkS2jQUa4OB3jDskGu0sqGjVBJyM29XckT
CreTJxRCMIyceGiC7sbEmK7cppJEhA==
=3DO/
-----END PGP SIGNATURE-----

--vGjWQyf8ylyddnEPSgJO2EZC8mVsdyD0H--

