Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDBC3FE80C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 05:34:02 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLdUH-0001Bi-Ls
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 23:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLa-0001gz-H6; Wed, 01 Sep 2021 23:25:02 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33167 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLdLU-0000Dr-Gh; Wed, 01 Sep 2021 23:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630553072;
 bh=yCcBLCo3cPzYkisouOKOdpAxqaCULdB9ltBgZ5DGNcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAdFe4m0nv+hSWgzP05vfd9eUULtlxzhw03/QNxJ2uRtikiEkZeom0p5pAX7jhn91
 8f4fRaLtq1cHBselnRx0D8QTZir9QWv9je5z5tb1xYvrXPUlDenuvXXDC09dZpLvIF
 LW6gRHw7KxKAvCkM+qOMvIJqq/4v4WPJC+B22kYE=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0R9r3rGkz9t6g; Thu,  2 Sep 2021 13:24:32 +1000 (AEST)
Date: Thu, 2 Sep 2021 13:23:12 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v2 07/19] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
 translate.c
Message-ID: <YTBDoCUao6yaFVgJ@yekko>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-8-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TYEgYR8s09JVZlf1"
Content-Disposition: inline
In-Reply-To: <20210831164007.297781-8-luis.pires@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--TYEgYR8s09JVZlf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 01:39:55PM -0300, Luis Pires wrote:
> From: Bruno Larsen <bruno.larsen@eldorado.org.br>
>=20
> Move REQUIRE_ALTIVEC to translate.c and rename it to REQUIRE_VECTOR.
>=20
> Signed-off-by: Bruno Larsen <bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

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

--TYEgYR8s09JVZlf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEwQ54ACgkQbDjKyiDZ
s5IdWw//Swp0rQLd5oAZ3d+sUYj62B4nJrcYLV/g3pj3XToXDLHgnz4iJ6YIqPL7
nE6Ey9e/1LeTn14SkGCL5vBpvhlQgDRdx1RliMOkp3bdoWKhW4uDJwFbtZiE3V9U
YwJGc0lebplH3D0sCLQn/lUKX7ci5yDuurFUEqniMjJJTIsaharTTuBXo6yV3hxv
dFGonflbA9LSA3Qog1iGf7nTvGdvgaQsB6E+WkvMlSmII4aylwSlXF4akrJdaYiz
4rQmFG50omPXQ9Y5S+zuqqimj3cMMzrigXqebcaBVTpAQ/B5/52KUDTYWVGyuriW
wtA3rCWR3tCOCigvNcNn/USgcStJxTa77g2BdJtot60tHWazJMkg1Hl+NUtEbJyY
1ChGlwncPfKmJFrtSMDWYBCT+QO7EGM197FwmORkONSCeo7UzV+W0yajaUvrOEs7
shAKQMw1pcL8+Nr8PTJZs2zvbevF6soi55YE6tU4mplJszCz5kdkN17soDAOJZkp
6oEzWHW60Q7iW+P29JhWEQKprgrJuEU0BBlggMs2ZYrfc3Hsk9+cU7ikw7Tqhi1V
FaxG1qIO3yR8vEaxENkeMLdPJtMfekuB0q4m4TnhuZE+3kpo77sF0LWTVFZsaCJW
WA+/GXCL1SdlMRAdxYTG5b/Og0JiWNvupzJkGDRr0vPYeK2urVM=
=nUFp
-----END PGP SIGNATURE-----

--TYEgYR8s09JVZlf1--

