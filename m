Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E653F6E35
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:18:59 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkNO-0007YV-SI
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGa-0000cO-5N; Wed, 25 Aug 2021 00:11:56 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGW-0007Bp-DB; Wed, 25 Aug 2021 00:11:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt4GRkz9sXM; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=ZHrtUjbkxI8DlL5vdBdrWQdxh1G5Ue9WnsJtojG2HXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bidFwOHkv5vTJX0DdjPbvtw1ghili5w/mqqCSzAaJObyFwP7mFnKltQ4940dKWKtv
 oy53ds0OUjWwMbEgoVC+y79aR2dIJoVE1TvTktEsYKgfUcuTVwug3psV6gdTbtzkjb
 CPUm1wxjwUFkOnJ3xJ+Z/GJLQOgzMrP+6Srl5pZs=
Date: Wed, 25 Aug 2021 13:02:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH 2/2] target/ppc: fix vextu[bhw][lr]x helpers
Message-ID: <YSWyxBbS8Cr4of7k@yekko>
References: <20210824201105.2303789-1-matheus.ferst@eldorado.org.br>
 <20210824201105.2303789-3-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6NfNZZqzFGCj3Qgt"
Content-Disposition: inline
In-Reply-To: <20210824201105.2303789-3-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6NfNZZqzFGCj3Qgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 05:11:05PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> These helpers shouldn't depend on the host endianness, as they only use
> shifts, &s, and int128_* methods.
>=20
> Fixes: 60caf2216bf0 ("target-ppc: add vextu[bhw][lr]x instructions")
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/int_helper.c | 38 ++++++++++----------------------------
>  1 file changed, 10 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index efa833ef64..c2d3248d1e 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -1492,34 +1492,16 @@ void helper_vlogefp(CPUPPCState *env, ppc_avr_t *=
r, ppc_avr_t *b)
>      }
>  }
> =20
> -#if defined(HOST_WORDS_BIGENDIAN)
> -#define VEXTU_X_DO(name, size, left)                                \
> -    target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
> -    {                                                               \
> -        int index;                                                  \
> -        if (left) {                                                 \
> -            index =3D (a & 0xf) * 8;                                  \
> -        } else {                                                    \
> -            index =3D ((15 - (a & 0xf) + 1) * 8) - size;              \
> -        }                                                           \
> -        return int128_getlo(int128_rshift(b->s128, index)) &        \
> -            MAKE_64BIT_MASK(0, size);                               \
> -    }
> -#else
> -#define VEXTU_X_DO(name, size, left)                                \
> -    target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
> -    {                                                               \
> -        int index;                                                  \
> -        if (left) {                                                 \
> -            index =3D ((15 - (a & 0xf) + 1) * 8) - size;              \
> -        } else {                                                    \
> -            index =3D (a & 0xf) * 8;                                  \
> -        }                                                           \
> -        return int128_getlo(int128_rshift(b->s128, index)) &        \
> -            MAKE_64BIT_MASK(0, size);                               \
> -    }
> -#endif
> -
> +#define VEXTU_X_DO(name, size, left)                            \
> +target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
> +{                                                               \
> +    int index =3D (a & 0xf) * 8;                                  \
> +    if (left) {                                                 \
> +        index =3D 128 - index - size;                             \
> +    }                                                           \
> +    return int128_getlo(int128_rshift(b->s128, index)) &        \
> +        MAKE_64BIT_MASK(0, size);                               \
> +}
>  VEXTU_X_DO(vextublx,  8, 1)
>  VEXTU_X_DO(vextuhlx, 16, 1)
>  VEXTU_X_DO(vextuwlx, 32, 1)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6NfNZZqzFGCj3Qgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElssQACgkQbDjKyiDZ
s5Lq/Q/+P+94vtnrjDQ+HcE/uP0bbRqpO9D+ZNkSuZtJS3hK02nIn9x7gBnb0bAR
mABkYMzxsiYCkrQdYNHcw7L8Qcgbp5v6ovURc4i60veXFCbSrfGnjPSxwZfvFkmH
T+UCKtGZ34os4F5b1S9op7YOiKyw4Qlxq8DI2jXlBbwyDLirkc53C0BHshmtzRyA
mGGf0ut/36kjgese9bpKv8hOgG2xfe5rS5TODVJWJvCXJv6guSBczgjyiIMLI1zW
fnobAnwuhhZoJxwwxQYJ+r7bUcckinnlDzKU3rqtygbNwHiLqRq7NDfFm9cNMGw2
XVzCtExo0nyJQot/gf8XvNJEg42/CZkIEHkI/LiM4FhUyAewtOgKShU/C6ZlNBQA
al6m4RmO2D+G8tbRUUGrSBpT4TzdmXjTuFL1YClWGO86uDC25fl9kIBqajvlCX87
FdGRZD2888rSkMDk2dS85GPRiAMiDGQMkugD5FImJ5szCSuJhz/weolKu6ar7HE2
g6rYCRo861nGTttwUVTJyAPXZ8im/w/X4DDfeiaSBvHxxbZSofKec96F1C0KmMgJ
tvIRLcBNtgLr9vhwDQCCg7FPjEQsu0pixq+6O3UCjbaG32rethlARHsr5PHZFvqT
Ip4UTZ9Z3bt/Hn4YyuUm+hFECOxKDip3AM9S8W+//MclTdmG6gg=
=aVFf
-----END PGP SIGNATURE-----

--6NfNZZqzFGCj3Qgt--

