Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8376449C3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 19:35:19 +0200 (CEST)
Received: from localhost ([::1]:42536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbTd8-0000tF-0g
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 13:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hbS2q-0006rn-DW
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hbS2n-0001xA-Ox
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 11:53:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hbS2c-0001oJ-WB; Thu, 13 Jun 2019 11:53:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4598D3007400;
 Thu, 13 Jun 2019 15:53:29 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A38794128;
 Thu, 13 Jun 2019 15:53:28 +0000 (UTC)
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
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
Message-ID: <b1e59713-c126-8f8f-7adf-aa6f23b86474@redhat.com>
Date: Thu, 13 Jun 2019 10:53:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WPsGXrOkA8tGy8DzDJJuhXurcq0urrn4j"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 13 Jun 2019 15:53:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] testsuite spurious failure due to leftover files
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
--WPsGXrOkA8tGy8DzDJJuhXurcq0urrn4j
Content-Type: multipart/mixed; boundary="QSYNCstZIOIj85pAtPU91WHgZEx9mf73U";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Message-ID: <b1e59713-c126-8f8f-7adf-aa6f23b86474@redhat.com>
Subject: testsuite spurious failure due to leftover files

--QSYNCstZIOIj85pAtPU91WHgZEx9mf73U
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

iotests ./check -qcow2 failed for me today:

191      fail       [10:46:04] [10:46:13]   0s (last: 7s)    output
mismatch (see 191.out.bad)
--- /home/eblake/qemu/tests/qemu-iotests/191.out	2019-05-24
09:27:46.449348997 -0500
+++ /home/eblake/qemu/tests/qemu-iotests/191.out.bad	2019-06-13
10:46:13.906004319 -0500
@@ -8,6 +8,8 @@
 Formatting 'TEST_DIR/t.IMGFMT.ovl2', fmt=3DIMGFMT size=3D67108864
backing_file=3DTEST_DIR/t.IMGFMT.mid
 wrote 65536/65536 bytes at offset 1048576
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+mkfifo: cannot create fifo
'/home/eblake/qemu/tests/qemu-iotests/scratch/qmp-out-17782_0': File exis=
ts
+mkfifo: cannot create fifo
'/home/eblake/qemu/tests/qemu-iotests/scratch/qmp-in-17782_0': File exist=
s
 {
     "return": {
     }

If someone wants a good project to take on - it would be nice to revive
Jeff Cody's initial work on refactoring the iotests to operate with one
directory per test, allowing things to be run in parallel, and allowing
cleanup to be much easier (nuke the temp directories, rather than trying
to track down which test left a possibly-colliding file name behind)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--QSYNCstZIOIj85pAtPU91WHgZEx9mf73U--

--WPsGXrOkA8tGy8DzDJJuhXurcq0urrn4j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0CcXcACgkQp6FrSiUn
Q2rf5gf7B6z2cqQkgRR5d0Fh0aScEn+q2NkS+3jMgMFvhMxbQZU/WSY/cTB5cN1I
swXXTfteiJ3ikHdi8b6zsXCHD2rrAD338+T2qBmsAu269eGRZqdRaR3xlEqTh0Hn
xCvW12E/ngcJrT316fGkdNrOzEEJG/mQJTa5On/72mxDYniWp+lMS+vdRbckmPHn
yuXYW7u1yXt5DgBDIsmet8UmG8trnvggbFjD++fpxELHvai4vcJBKa+NgHel1lR+
SsRQ8EWcck4WCANiQ7zX+Cs4Gp+sDs8tvj8/hB6jKfNfaR3I69wgFzH4enKoLZGj
HvpekAZ8NqS5SpO6pUeA/2CZMjqPiA==
=ZMje
-----END PGP SIGNATURE-----

--WPsGXrOkA8tGy8DzDJJuhXurcq0urrn4j--

