Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F3625DF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 18:13:16 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkWGR-0002Rw-Ep
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 12:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44245)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hkWEM-0001kA-Du
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hkWEL-0005hV-Ef
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:11:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hkWEL-0005gA-3U
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:11:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 650E683F51
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 16:11:04 +0000 (UTC)
Received: from [10.3.116.78] (ovpn-116-78.phx2.redhat.com [10.3.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE87F608A4;
 Mon,  8 Jul 2019 16:11:02 +0000 (UTC)
To: quintela@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20190708072437.3339-1-marcandre.lureau@redhat.com>
 <20190708072437.3339-4-marcandre.lureau@redhat.com>
 <87r270dikm.fsf@trasno.org>
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
Message-ID: <ffbc4f91-db2c-b2de-3b0b-b68f350527d2@redhat.com>
Date: Mon, 8 Jul 2019 11:11:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87r270dikm.fsf@trasno.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h3UBEjbSlv4tsWyllSmlRNZ9PDjlwuSw0"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 08 Jul 2019 16:11:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] Add dbus-vmstate object
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h3UBEjbSlv4tsWyllSmlRNZ9PDjlwuSw0
Content-Type: multipart/mixed; boundary="Hx4VAMzcbLq8PN1n4VOqw1crn8Ao1eMzh";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: quintela@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ffbc4f91-db2c-b2de-3b0b-b68f350527d2@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/3] Add dbus-vmstate object
References: <20190708072437.3339-1-marcandre.lureau@redhat.com>
 <20190708072437.3339-4-marcandre.lureau@redhat.com>
 <87r270dikm.fsf@trasno.org>
In-Reply-To: <87r270dikm.fsf@trasno.org>

--Hx4VAMzcbLq8PN1n4VOqw1crn8Ao1eMzh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/8/19 3:41 AM, Juan Quintela wrote:
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
>> When instanciated, this object will connect to the given D-Bus
>> bus. During migration, it will take the data from org.qemu.VMState1
>> instances.
>>
>> See documentation for further details.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20

>=20
> Before anything, I have no clue about DBUS and not a lot about glib, so=

> don't expect anything else that questions on that front.
>=20

Ditto from me, but just noticing:

> Several questions:
>=20
>> +#define DBUS_VMSTATE_SIZE_LIMIT (1 << 20) /* 1mb */

Should this include units.h and spell it (1 * MiB)?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--Hx4VAMzcbLq8PN1n4VOqw1crn8Ao1eMzh--

--h3UBEjbSlv4tsWyllSmlRNZ9PDjlwuSw0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0jaxUACgkQp6FrSiUn
Q2poQgf/Sz/E8WsRiVkbWiOkBuGVYB7O31bZ0HWKPAH/BMgcvxAVmHMDuaDVPMsw
mGM8z77//Q8scEuJAV/H+joFRyvEaBj/KfwvEZ4XJYvaiE3MrMjBJ1+DmPS5TCbE
5jTIDZ8vwQCbGOhM8VB+liQ3dBJCky4DOzw0/ZmOV3TQ/tZ4rKcj25wUCIhR6o4o
UVslLtB1+jrif6Hcp8sjGt16aq7vCf1ROc2hoEZMAHs3UjTiIx1Gxz+35mceqdAP
oZKrOrB0A+ud3X8d/EqH9RPZF3JcHCteR28FhAgf+fuszcppYzu5e4V2GJfHXAlD
AloY2NnxxtmHm1w3MZBMKNHQoCnVfA==
=zCTF
-----END PGP SIGNATURE-----

--h3UBEjbSlv4tsWyllSmlRNZ9PDjlwuSw0--

