Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC13F6E38
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:19:35 +0200 (CEST)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkNt-000056-8b
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGd-0000g2-N6; Wed, 25 Aug 2021 00:11:59 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mIkGb-0007Tf-RE; Wed, 25 Aug 2021 00:11:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvXbt5yYkz9t0p; Wed, 25 Aug 2021 14:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629864698;
 bh=JE0uX1EDQX1P3yzlc0oseUqciSF6Qo1yhsnnVnwRkPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hJ4ZzBPfGq38kV4uPDlOjybZ3KN7wH3Da9fKxvSwHteU3P9NrllpcFay0aJjQmGKR
 s89/QGgRKp+lDc6O2U4GIYD9/972fLWcUYRr4vwcJzwGqVyyp5NZjDE9gZuBnElVU/
 JTF2VFpbNbJkxhRu9RCHSn0RpN2/vDTfjZLIPUmg=
Date: Wed, 25 Aug 2021 13:46:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH 07/19] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
 translate.c
Message-ID: <YSW8/mKnr4hQzO/f@yekko>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-8-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UzuOLugOzmFZMqvo"
Content-Disposition: inline
In-Reply-To: <20210824142730.102421-8-luis.pires@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, groug@kaod.org,
 Fernando Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UzuOLugOzmFZMqvo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 11:27:18AM -0300, Luis Pires wrote:
> From: Bruno Larsen <bruno.larsen@eldorado.org.br>
>=20
> Move REQUIRE_ALTIVEC to translate.c and rename it to REQUIRE_VECTOR.
>=20
> Signed-off-by: Bruno Larsen <bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>


Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate.c                 |  8 ++++++++
>  target/ppc/translate/vector-impl.c.inc | 10 +---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 171b216e17..4749ecdaa9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7453,6 +7453,14 @@ static int times_4(DisasContext *ctx, int x)
>  # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
>  #endif
> =20
> +#define REQUIRE_VECTOR(CTX)                             \
> +    do {                                                \
> +        if (unlikely(!(CTX)->altivec_enabled)) {        \
> +            gen_exception((CTX), POWERPC_EXCP_VPU);     \
> +            return true;                                \
> +        }                                               \
> +    } while (0)
> +
>  /*
>   * Helpers for implementing sets of trans_* functions.
>   * Defer the implementation of NAME to FUNC, with optional extra argumen=
ts.
> diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translat=
e/vector-impl.c.inc
> index 117ce9b137..197e903337 100644
> --- a/target/ppc/translate/vector-impl.c.inc
> +++ b/target/ppc/translate/vector-impl.c.inc
> @@ -17,20 +17,12 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> =20
> -#define REQUIRE_ALTIVEC(CTX) \
> -    do {                                                \
> -        if (unlikely(!(CTX)->altivec_enabled)) {        \
> -            gen_exception((CTX), POWERPC_EXCP_VPU);     \
> -            return true;                                \
> -        }                                               \
> -    } while (0)
> -
>  static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
>  {
>      TCGv_i64 tgt, src, mask;
> =20
>      REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> -    REQUIRE_ALTIVEC(ctx);
> +    REQUIRE_VECTOR(ctx);
> =20
>      tgt =3D tcg_temp_new_i64();
>      src =3D tcg_temp_new_i64();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UzuOLugOzmFZMqvo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmElvP0ACgkQbDjKyiDZ
s5KtNg/7BdvA9TZZfFra4UNd92neBbeO4AtyrQdvmP8lTjpFfuwxQWLGthPjBk4X
+MnYv/MHFLFc0xC8+Df1WrJKE++wCBGBJqAGFsDekT1W00yuqfwNvDy7XC5A1W+R
JXAEHSP8S1TtqPrTX3ydQgvIr6Nvp7mJLsWQXZJOVVrVTs5JSIE9K2wOFNhjVDyh
35CA6kpyjzGqEb8ywcZ3LOrlQ5UGreW0U7Hl0ftRwF/dLlMxqccBhP8iFfAm2cMv
XOog4+IBkZwNBQ6an4+kI86fbzlf+OfAhn+aPsaymmWjv4nEnyjXB7AbynJjMHXK
IEtQOX0WkEwYQQ3I2sBxwCCE119BZwMorGBJdChpMjrCiL4fXq6F+lmIwHBwVuHB
JtakJ0EXkkxh9dhI0POz1Hz8QtwC/vJ+lhG4BpgOvYM5QzDKVy5rUM7LCT1MlzG4
GJNWIr3qlQ/hut9QxkIa9OiQoWljF/l07UB1YJKjH7Tef4IYswEQ9zlg1ilYbpIT
tueyo5ztuLlpXcF9wGwMEK1ctdTuWsWTaoJwFyS4miiGjOk6fsIUwal2xOD2gmMx
dzEzc/NWVapTpXw4uSKidQAzns/COg7lX9uhiir67Yw8U+QIZy0LG6C5tu0bhwsF
8ELegGNNePmMotdGk5OFcxxDXkWnK/zsRyxIVkfnf/f2QBXq8IM=
=+b2x
-----END PGP SIGNATURE-----

--UzuOLugOzmFZMqvo--

