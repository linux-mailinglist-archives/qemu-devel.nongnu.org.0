Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A3137F25E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:38:07 +0200 (CEST)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh36t-00084s-0v
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sd-0007Lf-Vn; Thu, 13 May 2021 00:23:24 -0400
Received: from ozlabs.org ([203.11.71.1]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sa-0004fU-Kr; Thu, 13 May 2021 00:23:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdmt0j60z9t5G; Thu, 13 May 2021 14:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879774;
 bh=LsbMzOLiYyGW4mRQTCHfqFakD3FBW1dJKcNCrYE5z38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZjL4d3X+CRYWWuSLamOry/2MX//vvIeWcPWIeepRSLwwfFeS+weZ88YhwdoJMgrc
 CNe0nKHE8yGCwcP92smJWlj1zWLYBtbqrZWquUOrJSnLdSqZ/QCjejgLoaXuZt8kCT
 G/iWt+NabnSWJkvw/FRCCtWr1wqu4jSNH+wBLr9Y=
Date: Thu, 13 May 2021 14:12:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 09/31] target/ppc: Remove unnecessary gen_io_end calls
Message-ID: <YJynEdK2qSkXN5ZS@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-10-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3moc0V4RRSDZr5Ma"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-10-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3moc0V4RRSDZr5Ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:19PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Since ba3e7926691ed33, we switched the implementation of icount
> to always reset can_do_io at the start of the following TB.
> Most of them were removed in 9e9b10c64911, but some were missed.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 88fe24ef95..1c02e21a56 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -568,7 +568,6 @@ static void spr_read_tbl(DisasContext *ctx, int gprn,=
 int sprn)
>      }
>      gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }
> @@ -580,7 +579,6 @@ static void spr_read_tbu(DisasContext *ctx, int gprn,=
 int sprn)
>      }
>      gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }
> @@ -605,7 +603,6 @@ static void spr_write_tbl(DisasContext *ctx, int sprn=
, int gprn)
>      }
>      gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }
> @@ -617,7 +614,6 @@ static void spr_write_tbu(DisasContext *ctx, int sprn=
, int gprn)
>      }
>      gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }
> @@ -666,7 +662,6 @@ static void spr_read_hdecr(DisasContext *ctx, int gpr=
n, int sprn)
>      }
>      gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }
> @@ -678,7 +673,6 @@ static void spr_write_hdecr(DisasContext *ctx, int sp=
rn, int gprn)
>      }
>      gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_end();
>          gen_stop_exception(ctx);
>      }
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3moc0V4RRSDZr5Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpxEACgkQbDjKyiDZ
s5LsMQ/+Kn8sqbCGigQ46wjPA1azO+ac/7PuafLv8crO+t8roobQlqsxr5h7EPme
meJOsuU6YUDELqEJ8z+jTPt8aFWNm4ZUowiRu8eDElro3ZRGl3MeoMyCuEwAyIek
mn2w/JCOB7adpU7XHOsINPL3kFWRUg18xNgu+D5dhPO9CqkTVTg7ZpJIUCf0E9fr
8F7kDM//CoCVJH+HizzhGdgToU2em3hE/3R3kMxChd8SNmrw0X+hm625Amzvjniq
sXlWL822fV/umxbt0D3WDQFuQwtFgtuamd8K+SRb0/pBfDwr3QSGzLJYFkCOSrou
6XqbYXALViHCtLa3h84xrV1lSTZC8Pobz32ma6DxD4SosABbrIFkewxnyMoULHzU
zz4et3Hnbz6V4jhpAMRQS1FFynOWzDovJpGmxA+4wyzXAKNbu3SpKFhozkEky1MC
4WK0b/WzAMZ5ipE5k37zv785WR3RlFpLtuZpgpnWV2ROAk+3Gtx52HL+P+V0wLid
55PvvOn8x0vBhPqQBHhDDTTwNryYyhvkArtZFeJ6bGkkmV0ahXsY4VSM1z4DxNQY
n993bwCYlpjy9HFnAaRTrygay5H+TKWkWCu6Xq3CfUgb/NMhGzo2GnKcHEvWUcfk
Ps6JXjaEaBpEuAoXvZjiY4FCyhFPZR1g2OWUdhSHqOfoSN8qf6g=
=0gqy
-----END PGP SIGNATURE-----

--3moc0V4RRSDZr5Ma--

