Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A432F7B0CB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 19:47:14 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsWDR-0001VZ-So
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 13:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36615)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hsW5q-0002pH-KR
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hsW5p-0001qG-Cp
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:39:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hsW5m-0001nU-8T; Tue, 30 Jul 2019 13:39:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4ADE04E93D;
 Tue, 30 Jul 2019 17:39:16 +0000 (UTC)
Received: from [10.3.116.93] (ovpn-116-93.phx2.redhat.com [10.3.116.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F2A5C1A1;
 Tue, 30 Jul 2019 17:39:15 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20190730172508.19911-1-mreitz@redhat.com>
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
Message-ID: <7768903a-e58e-35d1-5852-ccef0bd511b6@redhat.com>
Date: Tue, 30 Jul 2019 12:39:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190730172508.19911-1-mreitz@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w1yWjvStcaohiRXfeiLdiLgMcKoVyj4Du"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 30 Jul 2019 17:39:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.2 00/13] qcow2: Let check -r all
 repair some snapshot bits
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
--w1yWjvStcaohiRXfeiLdiLgMcKoVyj4Du
Content-Type: multipart/mixed; boundary="Hl90VKQ7ndy9JyTYYDPx3o2uz2chBCvr3";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Message-ID: <7768903a-e58e-35d1-5852-ccef0bd511b6@redhat.com>
Subject: Re: [PATCH for-4.2 00/13] qcow2: Let check -r all repair some
 snapshot bits
References: <20190730172508.19911-1-mreitz@redhat.com>
In-Reply-To: <20190730172508.19911-1-mreitz@redhat.com>

--Hl90VKQ7ndy9JyTYYDPx3o2uz2chBCvr3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/30/19 12:24 PM, Max Reitz wrote:
> Hi,
>=20
> As Eric reports in https://bugzilla.redhat.com/show_bug.cgi?id=3D172734=
7,
> qemu-img amend has a bug when it comes to converting qcow2 v2 images to=

> v3: In v3, every snapshot table entry requires at least 16 bytes of
> extra metadata to be present, which isn=E2=80=99t the case for v2 image=
s.
> Currently, qemu-img amend doesn=E2=80=99t take care of updating the sna=
pshot
> table, so the image is a bit corrupt afterwards (luckily, qemu doesn=E2=
=80=99t
> take notice, though).

And if anyone wants to work on an obvious followup series after this: we
should allow 'qemu-img resize' to work on v3 images with internal
snapshots, while still continuing to forbid it on v2 images (with v2,
ALL internal snapshots are assumed to have the same size as the image
itself, so you can't resize the image without also resizing internal
snapshots, but that doesn't preserve proper guest history; but with v3,
since all internal snapshots have their own proper size recorded,
changing the image size doesn't impact the snapshots).

>=20
> This yields the following patches:
> - Patch 3: Helper patch
> - Patch 4: Helper patch, so we can actually do more than just to bump u=
p
>   the version number when upgrading a qcow2 image from v2 to v3
> - Patch 5: The fix

Quite this history of how the series came to be. Thanks for tackling it!


> Then I got the glorious idea of =E2=80=9CHey, if I want to see how much=
 extra
> data a snapshot table entry has outside of qcow2_read_snapshots(), I
> should add a field that reports that value to QCowSnapshot.  And if I d=
o
> that, I might as well make the qcow2 driver interpret the specification=

> a bit more literally, namely it should ignore all unknown extra data,
> that is (as I interpret it), keep it in memory and write it back when
> updating the snapshot table.=E2=80=9D

Indeed. If the extra data ever becomes essential to correct
interpretation of the image, then we would add an incompatible feature
bit in the qcow2 header (older actors would refuse to open the image
because they don't understand the incompatible feature, newer actors
will know to use the longer extra data as mandatory).  Otherwise, extra
data should be preserved intact insofar as is possible, but can safely
be ignored or truncated by older actors without breaking the proper
image interpretation in the newer actor that wrote that extra data.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--Hl90VKQ7ndy9JyTYYDPx3o2uz2chBCvr3--

--w1yWjvStcaohiRXfeiLdiLgMcKoVyj4Du
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1AgMIACgkQp6FrSiUn
Q2r6Zwf/ZIsAXOaTQ2fy3NwPA1CygQe5pC7q+jjQxpO48OtiCng6dpztjAAo8O/g
KEeRux5bw0GTGtll9kgiNZhgvUQktxozxrZu4pCNMow104JlazM0/yZCqZLTOB3t
0RBxjMKHnTjA9Iqa2TsG6p+NpjDe+1hngE17t33PQgFGqKTiqEC4dQufkNSGxTh+
1ak1AvN0BVS00SPWHc4AIvVy6WCjFymHh8A7b8IQk0uCnK4uT5sYFH/xgZdZgHbU
An8aVcv9nPxyjTYe/QBPej1bXayT8snksQ0bHT6h5xESJKnK9sUUU1QfONSW25kr
D9GzKVU+7Xj/VEgC4T5GSQywsIE5sQ==
=vafn
-----END PGP SIGNATURE-----

--w1yWjvStcaohiRXfeiLdiLgMcKoVyj4Du--

