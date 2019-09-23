Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDECBB490
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:57:15 +0200 (CEST)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCNtx-0000RP-Ot
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCNsj-0008Ln-Iq
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCNsh-0001tM-Ep
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:55:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iCNsh-0001su-6o
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF51E18C4281;
 Mon, 23 Sep 2019 12:55:53 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ECEA608C0;
 Mon, 23 Sep 2019 12:55:50 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 05/19] tests/qapi-schema: Demonstrate
 insufficient 'if' checking
To: Markus Armbruster <armbru@redhat.com>
References: <20190914153506.2151-1-armbru@redhat.com>
 <20190914153506.2151-6-armbru@redhat.com>
 <ca7e3eba-98ba-56cb-574f-d9974f39122b@redhat.com>
 <87r247ns68.fsf@dusky.pond.sub.org>
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
Message-ID: <b1cba22d-0cbb-7658-c5bf-32a48e9601a3@redhat.com>
Date: Mon, 23 Sep 2019 07:55:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87r247ns68.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JRNZzMdCak81U8XOaf9RcnQbD6C50ppbW"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 23 Sep 2019 12:55:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JRNZzMdCak81U8XOaf9RcnQbD6C50ppbW
Content-Type: multipart/mixed; boundary="NjS9aaFMjoLyvs6QcISewKDbXqwh3NBgc";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 mdroth@linux.vnet.ibm.com
Message-ID: <b1cba22d-0cbb-7658-c5bf-32a48e9601a3@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 05/19] tests/qapi-schema: Demonstrate
 insufficient 'if' checking
References: <20190914153506.2151-1-armbru@redhat.com>
 <20190914153506.2151-6-armbru@redhat.com>
 <ca7e3eba-98ba-56cb-574f-d9974f39122b@redhat.com>
 <87r247ns68.fsf@dusky.pond.sub.org>
In-Reply-To: <87r247ns68.fsf@dusky.pond.sub.org>

--NjS9aaFMjoLyvs6QcISewKDbXqwh3NBgc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/23/19 6:55 AM, Markus Armbruster wrote:

>>> +++ b/tests/qapi-schema/union-branch-if-invalid.json
>>> @@ -0,0 +1,7 @@
>>> +# Cover branch with invalid 'if'
>>> +# FIXME not rejected, would generate '#if \n'
>>> +{ 'enum': 'Branches', 'data': ['branch1'] }
>>> +{ 'struct': 'Stru', 'data': { 'member': 'str' } }
>>> +{ 'union': 'Uni',
>>> +  'base': { 'tag': 'Branches' }, 'discriminator': 'tag',
>>> +  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }
>>
>> So you're pointing out a difference between an empty string and a stri=
ng
>> not containing a C macro name (possibly because later patches will giv=
e
>> them different error messages).
>=20
> Not sure I got this comment.

I was comparing:

> +++ b/tests/qapi-schema/union-branch-if-invalid.json
> +  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }

with:

> +++ b/tests/qapi-schema/alternate-branch-if-invalid.json
> +  'data': { 'branch': { 'type': 'int', 'if': ' ' } } }

Both of which produce invalid expansions, but because of the difference
between empty string vs. all-whitespace might be fixed differently in
later patches.  At any rate, nothing to change in those tests.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--NjS9aaFMjoLyvs6QcISewKDbXqwh3NBgc--

--JRNZzMdCak81U8XOaf9RcnQbD6C50ppbW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl2IwNUACgkQp6FrSiUn
Q2pfVQf/eZzYaIedVWjGlrjdlG5r7U4kpVdXRFbrskqr+6mej66iI1j4esNHei0m
bv13/4ivwV6KpKm0AHBx87PBFIzK8grltDKrX37AjCyUEUUAv0kn5EjsH9ZSkE1n
MkNHtqICfX0rjsyb9YOxeOmIu5Yg8E8K269srMwcnlspE4IKHPEbySmIG10vPGv4
0gnzVAQGUqhwVUomQeVAeCEcSeNXZ64XX5E8kfBvN6oMQgAXXmzSjoHdDJXx+7A5
TVQjF4YEMz6xXAqu1h7yZqQ4tO/sOzdzcJgI71Rfh47IxyF+SO5lsI6Fw9q/8ppT
B3Ek/BJU9fJ3ccYgNiOTGjlZZrlaew==
=7V9J
-----END PGP SIGNATURE-----

--JRNZzMdCak81U8XOaf9RcnQbD6C50ppbW--

