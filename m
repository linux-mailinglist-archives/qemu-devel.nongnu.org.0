Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44D660EFF
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 06:50:41 +0200 (CEST)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjcem-0002K9-J0
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 00:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58505)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hjcdW-0001nr-Lf
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hjcdU-0008VZ-Ny
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:49:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hjcdS-0008TA-Qy
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:49:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3A5183F3B
 for <qemu-devel@nongnu.org>; Sat,  6 Jul 2019 04:49:17 +0000 (UTC)
Received: from [10.3.116.152] (ovpn-116-152.phx2.redhat.com [10.3.116.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 828E28681E;
 Sat,  6 Jul 2019 04:49:17 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
 <420745c6-4709-d32a-b4f0-f0ffc066bd2b@redhat.com>
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
Message-ID: <36134cb8-44e2-d7d4-bd95-4fae15573e7a@redhat.com>
Date: Fri, 5 Jul 2019 23:49:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <420745c6-4709-d32a-b4f0-f0ffc066bd2b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qI28ZbkFbovnpI8lhzcFjgRBTbuy7J5Eo"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 06 Jul 2019 04:49:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 00/12] Misc bugfixes for QEMU hard freeze
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qI28ZbkFbovnpI8lhzcFjgRBTbuy7J5Eo
Content-Type: multipart/mixed; boundary="4PtxPfduMAoOuBwt5bhodDeTREokPM0uL";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Message-ID: <36134cb8-44e2-d7d4-bd95-4fae15573e7a@redhat.com>
Subject: Re: [Qemu-devel] [PULL 00/12] Misc bugfixes for QEMU hard freeze
References: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
 <420745c6-4709-d32a-b4f0-f0ffc066bd2b@redhat.com>
In-Reply-To: <420745c6-4709-d32a-b4f0-f0ffc066bd2b@redhat.com>

--4PtxPfduMAoOuBwt5bhodDeTREokPM0uL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/19 11:32 PM, Eric Blake wrote:
> On 7/5/19 2:50 PM, Paolo Bonzini wrote:
>> The following changes since commit 68d7ff0cff0c4905802104843cf0100543b=
47314:
>>
>>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' int=
o staging (2019-06-21 13:32:10 +0100)
>>
>> are available in the git repository at:
>>
>>
>>   git://github.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 2994e7e66a8902d0e42c5e528489ca6484c66d2=
d:
>>
>>   ioapic: use irq number instead of vector in ioapic_eoi_broadcast (20=
19-07-05 18:35:43 +0200)
>=20
> Missing v2 in the subject line to distinguish this from the failed v1
> pull request. And per the comments on 11/12, it may need a v3 pull
> request to fix an issue with a missing S-o-b.

Or is this the v1, and the other posting v2?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--4PtxPfduMAoOuBwt5bhodDeTREokPM0uL--

--qI28ZbkFbovnpI8lhzcFjgRBTbuy7J5Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0gKEwACgkQp6FrSiUn
Q2rvUQgAj96gxIl88s/QBLHwwssYLdeUao21whty82qRfU9k1xNtx/t8CkayBbAT
i2UoHrAIN2RbKI5k5QS+g8TCxfJS0BXMt4oFhqG+OETbNv5FGmRCOCRZ3XgbnJ0y
gpivnv4ngBHQ+yiAi/GRTW6W6vW9JtIIoupGUbzmJuE/unqy7aBoVmzwUKdcqoLA
OEXq3T87jyZRef3t7mo9I6RZJND5IDquufNbgkW6RXd8KEeOTPeL3++y+V6tvdh5
A9daiZneBbCIUKqoMBPkDZrCwI/EhI2enD9hFA7UAdgLPZCoP/MVTthDrgNvmo7Z
zgNKDAj7EeEcnGCq0kL3ICw2APSO+g==
=sivA
-----END PGP SIGNATURE-----

--qI28ZbkFbovnpI8lhzcFjgRBTbuy7J5Eo--

