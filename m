Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB623B02D3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 19:41:57 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i86cu-0000Vb-Hs
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 13:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1i86bw-0008VF-8p
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:40:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1i86bv-0002rs-0c
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:40:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44810)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1i86bu-0002qt-P6
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 13:40:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B40B3190C102
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 17:40:53 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EE45D9E2;
 Wed, 11 Sep 2019 17:40:52 +0000 (UTC)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 quintela@redhat.com
References: <20190911164202.31136-1-dgilbert@redhat.com>
 <20190911164202.31136-2-dgilbert@redhat.com>
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
Message-ID: <1a03f787-5cf8-6b8e-7489-3f90c3311032@redhat.com>
Date: Wed, 11 Sep 2019 12:40:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911164202.31136-2-dgilbert@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p71Il7lcb5yFZZddKSgj4mF1gpRtmyIcR"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 11 Sep 2019 17:40:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] rcu: Add automatically released
 rcu_read_lock variant
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
--p71Il7lcb5yFZZddKSgj4mF1gpRtmyIcR
Content-Type: multipart/mixed; boundary="e5sPTJgMgEVwCS1SqBvaHOWCF1uM73jYm";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 quintela@redhat.com
Message-ID: <1a03f787-5cf8-6b8e-7489-3f90c3311032@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] rcu: Add automatically released
 rcu_read_lock variant
References: <20190911164202.31136-1-dgilbert@redhat.com>
 <20190911164202.31136-2-dgilbert@redhat.com>
In-Reply-To: <20190911164202.31136-2-dgilbert@redhat.com>

--e5sPTJgMgEVwCS1SqBvaHOWCF1uM73jYm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/11/19 11:42 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> RCU_READ_LOCK_AUTO takes the rcu_read_lock  and then uses glib's
> g_auto infrastrcture (and thus whatever the compilers hooks are) to
> release it on all exits of the block.
>=20
> Note this macro has a variable declaration in, and hence is not in
> a while loop.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  include/qemu/rcu.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> index 22876d1428..6a25b27d28 100644
> --- a/include/qemu/rcu.h
> +++ b/include/qemu/rcu.h
> @@ -154,6 +154,18 @@ extern void call_rcu1(struct rcu_head *head, RCUCB=
Func *func);
>        }),                                                             =
   \
>        (RCUCBFunc *)g_free);
> =20
> +typedef char rcu_read_auto_t;

Declaring new types ending in _t collides with the namespace reserved by
POSIX.  While I don't think it will bite us, it's still worth
considering if a different name is better.

> +static inline void rcu_read_auto_unlock(rcu_read_auto_t *r)
> +{
> +  rcu_read_unlock();
> +}
> +
> +G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(rcu_read_auto_t, rcu_read_auto_unlock=
)
> +
> +#define RCU_READ_LOCK_AUTO g_auto(rcu_read_auto_t) \
> +    _rcu_read_auto =3D 'x'; \

I'm a bit lost at where _rcu_read_auto is declared.  (I could understand
if an earlier macro had created that typedef via concatenating _ with
rcu_read_auto_t, but making the preprocessor drop _t is not possible. Is
this a typo, and if so, why did the compiler not complain?)

> +    rcu_read_lock();
> +
>  #ifdef __cplusplus
>  }
>  #endif
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--e5sPTJgMgEVwCS1SqBvaHOWCF1uM73jYm--

--p71Il7lcb5yFZZddKSgj4mF1gpRtmyIcR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl15MaMACgkQp6FrSiUn
Q2qvhAf/Ql2ladoOrIk8Oi5qcUes+na3dGmbSPTf6gO2kd9Lbk6up/hj+JP6QUlU
WBW5RHcGFNUQP3pghMvg93U2yS6PZRr5SHvOkqoea7pWU/5SWEFNM579UrI508FW
Gvgca4bSm3ypNF90HcWMR0Ct+B5WaKmiSS1IG2/2ymYN0Afn7svUmKJ7naIVW92c
AgZ+0gc976jZ0cSo3bv+ZMHekamjQrAXnYnUA9CVWzf2pjEI0ELcToWnYtcqRf7J
eNtcqL3m2YFDSFTF1yNa2lHTv6amKLFsmFK0OnLYOuXZmiBEfUSkdOTIIM5FoaPu
slong0hv4yI13puM10pnyVPkinwOsA==
=VHl9
-----END PGP SIGNATURE-----

--p71Il7lcb5yFZZddKSgj4mF1gpRtmyIcR--

