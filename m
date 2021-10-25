Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BFD438CDA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 02:41:58 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meo3p-0000BA-GC
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 20:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1menvz-00059m-Dg; Sun, 24 Oct 2021 20:33:52 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:41345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1menvw-0008P1-0J; Sun, 24 Oct 2021 20:33:51 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hcwt66CpDz4xbs; Mon, 25 Oct 2021 11:33:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635122014;
 bh=l+YFcf0grl2hZoyv4ArFsAuXmmaKX/57VjdM9N2CjWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GS9mIIB4f4pOEpueaI871d+Tmz0vsjX2My0+phNAtSYnNJX7DS354klMIDmqiSiJc
 ZBGbM7ij0vU4fEEONwgHuyTtSSt4JslVIwkH9/sG28hmdy75AylU/SKYuVCCMBGiCZ
 V0FHP4dgLhYS6C0h9Hf+1ZwI6fCjmKV6oTLfL0ak=
Date: Mon, 25 Oct 2021 11:21:50 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/4] target/ppc: Use tcg_constant_i32() in gen_ld/st()
Message-ID: <YXX4niw/6PUmeZhc@yekko>
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EsX19Jzgmau0eqoy"
Content-Disposition: inline
In-Reply-To: <20211024161619.325903-5-f4bug@amsat.org>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EsX19Jzgmau0eqoy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2021 at 06:16:19PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Avoid using a TCG temporary by moving the MemOp index
> to the constant pool.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 507f6699f47..9a4ae61a39d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3347,15 +3347,14 @@ static void gen_lq(DisasContext *ctx)
> =20
>      if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
>          if (HAVE_ATOMIC128) {
> -            TCGv_i32 oi =3D tcg_temp_new_i32();
> +            TCGv_i32 oi;
>              if (ctx->le_mode) {
> -                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx=
));
> +                oi =3D tcg_constant_i32(make_memop_idx(MO_LEQ, ctx->mem_=
idx));
>                  gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
>              } else {
> -                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx=
));
> +                oi =3D tcg_constant_i32(make_memop_idx(MO_BEQ, ctx->mem_=
idx));
>                  gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
>              }
> -            tcg_temp_free_i32(oi);
>              tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
>          } else {
>              /* Restart with exclusive lock.  */
> @@ -3458,17 +3457,16 @@ static void gen_std(DisasContext *ctx)
> =20
>          if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
>              if (HAVE_ATOMIC128) {
> -                TCGv_i32 oi =3D tcg_temp_new_i32();
> +                TCGv_i32 oi;
>                  if (ctx->le_mode) {
> -                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
> -                                                        ctx->mem_idx));
> +                    oi =3D tcg_constant_i32(make_memop_idx(MO_LE | MO_12=
8,
> +                                                         ctx->mem_idx));
>                      gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
>                  } else {
> -                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
> -                                                        ctx->mem_idx));
> +                    oi =3D tcg_constant_i32(make_memop_idx(MO_BE | MO_12=
8,
> +                                                         ctx->mem_idx));
>                      gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
>                  }
> -                tcg_temp_free_i32(oi);
>              } else {
>                  /* Restart with exclusive lock.  */
>                  gen_helper_exit_atomic(cpu_env);
> @@ -4065,17 +4063,16 @@ static void gen_lqarx(DisasContext *ctx)
> =20
>      if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
>          if (HAVE_ATOMIC128) {
> -            TCGv_i32 oi =3D tcg_temp_new_i32();
> +            TCGv_i32 oi;
>              if (ctx->le_mode) {
> -                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_=
ALIGN,
> -                                                    ctx->mem_idx));
> +                oi =3D tcg_constant_i32(make_memop_idx(MO_LE | MO_128 | =
MO_ALIGN,
> +                                                     ctx->mem_idx));
>                  gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
>              } else {
> -                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_=
ALIGN,
> -                                                    ctx->mem_idx));
> +                oi =3D tcg_constant_i32(make_memop_idx(MO_BE | MO_128 | =
MO_ALIGN,
> +                                                     ctx->mem_idx));
>                  gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
>              }
> -            tcg_temp_free_i32(oi);
>              tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
>          } else {
>              /* Restart with exclusive lock.  */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EsX19Jzgmau0eqoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF1+J0ACgkQbDjKyiDZ
s5LzFxAArWKp0FkgdjBaAxwC+iUcXnUCPYYLhFKeq+xfATIbqN6sXC6svJpLwMBd
755kYBLZYodfBMbBuHohZ2u8p5sMqvsBp83fhHlMthrZQw1DZspyOGdWSwK+vYMU
aqX56MlPcJNAeB/HtoZ9p8TRVASFORlaUZwjjU4yPHcNynqH5A+QPNzilf5L9YhN
olmb/2/FjVPuxI/QGAVnL5hUNvHki6UtbeL9fM0jLPiYt9K2rztVvBO3IfK2Lo1z
pdmM5ST110JNV2YHldHsANjplUl1tVeBzx+JJ5uERvcdiolGCx0yyHC02v4bByAm
91uAFmnQ8WxoFFn8OZ5Aj4rup7Hy2AHSF/6TqvyGNhbSIoQwlqspHC14cG0Tt3fi
YUS653apyRAnpo1hu9YEus0H3wOuom6FoBz8CrbC7Lin/atxrjPn/0xEUbh68+Ud
UG8BwpzDCzPnJhhC10vzk/DsS71l9FoXPCr8vwIvOXhfG1LxaNkRbaUDhdMXpnIi
2/RZjWby6Zp0nJWyU8Ju8WfqPBDanDXwIABhnvvi+acsdYQ4GNXoRq11agMv/wUJ
Nnn5rm5qj+YcIwxTt9XCzUs9Qo545EvPMTOJYWSOyFTju7mT6xCZ18lEQ7RHkVJM
NwA6dYsS49Cgq4tBwiA02ZWDJL4NBUC4u95dVnPiumY4E8sZq8A=
=yBlo
-----END PGP SIGNATURE-----

--EsX19Jzgmau0eqoy--

