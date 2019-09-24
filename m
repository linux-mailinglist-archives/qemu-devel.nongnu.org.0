Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC26BD3B9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 22:41:47 +0200 (CEST)
Received: from localhost ([::1]:50902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCrd4-0001lB-0K
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 16:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCraR-00008H-GN
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCraQ-0001lR-Ch
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:39:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43990)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iCraQ-0001kw-4F
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:39:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4B356109EFCA;
 Tue, 24 Sep 2019 20:39:01 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C747C600C8;
 Tue, 24 Sep 2019 20:39:00 +0000 (UTC)
Subject: Re: [PATCH v3 02/25] hw/core/loader-fit: fix freeing errp in
 fit_load_fdt
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-3-vsementsov@virtuozzo.com>
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
Message-ID: <1f007fe0-d6bb-db19-835f-9cb4043f9b66@redhat.com>
Date: Tue, 24 Sep 2019 15:38:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924200902.4703-3-vsementsov@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rrhhb6KTBcI1FSfP37h0Pt3EJfberXc6h"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 24 Sep 2019 20:39:01 +0000 (UTC)
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 Paul Burton <pburton@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rrhhb6KTBcI1FSfP37h0Pt3EJfberXc6h
Content-Type: multipart/mixed; boundary="p9eoBcvJA8k4YUtKC094BbLIXAX4kubt6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Cc: Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>
Message-ID: <1f007fe0-d6bb-db19-835f-9cb4043f9b66@redhat.com>
Subject: Re: [PATCH v3 02/25] hw/core/loader-fit: fix freeing errp in
 fit_load_fdt
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-3-vsementsov@virtuozzo.com>
In-Reply-To: <20190924200902.4703-3-vsementsov@virtuozzo.com>

--p9eoBcvJA8k4YUtKC094BbLIXAX4kubt6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/24/19 3:08 PM, Vladimir Sementsov-Ogievskiy wrote:
> fit_load_fdt forget to zero errp. Fix it.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/core/loader-fit.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
> index 953b16bc82..11e4fad595 100644
> --- a/hw/core/loader-fit.c
> +++ b/hw/core/loader-fit.c
> @@ -201,6 +201,7 @@ static int fit_load_fdt(const struct fit_loader *ld=
r, const void *itb,
>      if (err =3D=3D -ENOENT) {
>          load_addr =3D ROUND_UP(kernel_end, 64 * KiB) + (10 * MiB);
>          error_free(*errp);
> +        *errp =3D NULL;

Actually, let's drop my R-b - I think we have a bigger bug here.  We are
blindly dereferencing *errp even if the caller passed in NULL.  The
correct way to write this function requires either the use of local_err
or the addition of auto-propagation.

(In v2, you still had this bug - your addition of error_free_errp(errp)
would still blindly dereference *errp, unless you tweak the
implementation of error_free_errp to tolerate a NULL pointer input)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--p9eoBcvJA8k4YUtKC094BbLIXAX4kubt6--

--rrhhb6KTBcI1FSfP37h0Pt3EJfberXc6h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl2KfuQACgkQp6FrSiUn
Q2qCVgf/Uw5rv5tj8eJv4vQ8qVhSROK9lMdaM1izIZ1ycRjauGY/1y368ntMRMqZ
YU8r9GNzV/ceLAKMzq91v5gMo+QeFxyjLHMpNFVIKPQp3lrkbr4mQ0co/cQHHFSb
ogm/9IcTL1cN2B+QQlKvzDIoNWdgaAFX+wWrXJNqIYtUwTkevGoFhUuS38t8NSf/
VDdA290ZoBN0YvjgCucALX+vBMrNH+HybBGTxHxSpNlOy3hM0fIT48lqvWj1O2Tt
SzFrzS1Uq6DECnF9YEdHdVddoCH2O6qsfvjl1gSW+8iOjCHK3oSQHjBo8D/5mBFo
cXuB8n7bzFn4SVIVrvNEgs0z9XT1tw==
=mQMh
-----END PGP SIGNATURE-----

--rrhhb6KTBcI1FSfP37h0Pt3EJfberXc6h--

