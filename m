Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD6382BB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 04:33:54 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZ4hU-0007Gb-P3
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 22:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45849)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hZ4et-0006S1-Cb
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 22:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hZ4es-00081p-Dn
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 22:31:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hZ4ef-0007jt-1i; Thu, 06 Jun 2019 22:31:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 560B53082B44;
 Fri,  7 Jun 2019 02:30:45 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E1D80D8A;
 Fri,  7 Jun 2019 02:30:40 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20190606184159.979-1-jsnow@redhat.com>
 <20190606184159.979-6-jsnow@redhat.com>
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
Message-ID: <07a09d35-769e-ff48-2e93-26c05ce5c9da@redhat.com>
Date: Thu, 6 Jun 2019 21:30:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606184159.979-6-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xU4vGjS1KT36Rf0abH2HFD3nmq1Fd5zaP"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 07 Jun 2019 02:30:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 5/5] block/qcow2-bitmap: Count queued
 bitmaps towards directory_size
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xU4vGjS1KT36Rf0abH2HFD3nmq1Fd5zaP
Content-Type: multipart/mixed; boundary="mSi9CieWf9gPSHEcxxBJYtqqAae1bEAuH";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Max Reitz <mreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com
Message-ID: <07a09d35-769e-ff48-2e93-26c05ce5c9da@redhat.com>
Subject: Re: [PATCH 5/5] block/qcow2-bitmap: Count queued bitmaps towards
 directory_size
References: <20190606184159.979-1-jsnow@redhat.com>
 <20190606184159.979-6-jsnow@redhat.com>
In-Reply-To: <20190606184159.979-6-jsnow@redhat.com>

--mSi9CieWf9gPSHEcxxBJYtqqAae1bEAuH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/6/19 1:41 PM, John Snow wrote:
> Similarly to the previous commit, we need to also keep a ledger of the
> additional directory size burden that we've not yet committed so we can=

> reject new additions sooner instead of later.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  block/qcow2.h        |  1 +
>  block/qcow2-bitmap.c | 13 ++++++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/block/qcow2.h b/block/qcow2.h
> index ebf60ac236..5aff97eb9c 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -318,6 +318,7 @@ typedef struct BDRVQcow2State {
> =20
>      uint32_t nb_bitmaps;
>      uint32_t nb_queued_bitmaps;
> +    uint32_t queued_directory_size;
>      uint64_t bitmap_directory_size;

Why can we get away with uint32_t for the queue size, but uint64_t for
the stored size? Something feels fishy.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--mSi9CieWf9gPSHEcxxBJYtqqAae1bEAuH--

--xU4vGjS1KT36Rf0abH2HFD3nmq1Fd5zaP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz5zE8ACgkQp6FrSiUn
Q2o9gwgAhkTfZHj+Y/7FVI7RSuadnFXYXXdrWN8wFAcCdxxiOZ8ZMA5LQCbtnOeO
wrrdVbx6DcNd+lyuZOR1+Sqqkj2naxCIltY+H4UJuBQVj28Ah6/8bd4336TtHxxY
TxVBbKw8cuK2rMBEbDLT+KUZirwDVFdObQZZJ3fx9yfaPLimFKYJCMMtn3XTVy/Q
6JLcyTbWc7W4kRfcF4Avpnq5XB0fcocuEP/w5xGeTrJ4ClgeXbVj0NHi1WHNNbXK
q1ihTP6uWLfFTTKSxjUJZcfU9UmNr+Kjf8cnvCShASeTAMw8vwtvr/ASQDiO1r6y
E1xXJl2RJEYjFJ5vznQmAY9Eq61ZYw==
=B2EY
-----END PGP SIGNATURE-----

--xU4vGjS1KT36Rf0abH2HFD3nmq1Fd5zaP--

