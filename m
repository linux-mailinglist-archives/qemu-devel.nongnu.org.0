Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245E386F7B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:41:21 +0200 (CEST)
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liojY-0007fe-ET
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeF-0006rG-Vc; Mon, 17 May 2021 21:35:52 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54195 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeB-0006wS-N7; Mon, 17 May 2021 21:35:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FkdqZ3n4jz9sW7; Tue, 18 May 2021 11:35:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301738;
 bh=+n4hzaV4pxtz30RWhzjJ/2+nm1LrT5k/7rMfXVqo3Sc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KxLRD/xpU284I842UNniswm7d2wxrsKTCQ4dnMu4vr/vcbNBGpDaKacNI+yrcRdRX
 LzVn1g+K8CxT1fOaI5B9lgWUX2HW+3/AbBfHsFcYGy0F9NhjUvq4vPf+tjfalJkLUM
 aYW5WvhYplSvYZ4QvSvl3pmW7MJ016SoxGbEuJ50=
Date: Tue, 18 May 2021 10:13:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 01/23] target/ppc: Introduce gen_icount_io_start
Message-ID: <YKMGvSajoZtoc1m4@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5rqPYiRT+/5++fSu"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-2-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--5rqPYiRT+/5++fSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:03PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Create a function to handle the details for interacting with icount.
>=20
> Force the exit from the tb via DISAS_TOO_MANY, which allows chaining
> to the next tb, where the code emitted for gen_tb_start() will
> determine if we must exit.  We can thus remove any matching
> conditional call to gen_stop_exception.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 174 +++++++++--------------------------------
>  1 file changed, 39 insertions(+), 135 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d51a1913a7..060ef83bc0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -304,6 +304,20 @@ static void gen_exception_nip(DisasContext *ctx, uin=
t32_t excp,
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
> +static void gen_icount_io_start(DisasContext *ctx)
> +{
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +        /*
> +         * An I/O instruction must be last in the TB.
> +         * Chain to the next TB, and let the code from gen_tb_start
> +         * decide if we need to return to the main loop.
> +         * Doing this first also allows this value to be overridden.
> +         */
> +        ctx->base.is_jmp =3D DISAS_TOO_MANY;
> +    }
> +}
> +
>  /*
>   * Tells the caller what is the appropriate exception to generate and pr=
epares
>   * SPR registers for this exception.
> @@ -540,24 +554,14 @@ void spr_write_ureg(DisasContext *ctx, int sprn, in=
t gprn)
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
>  #endif
> =20
> @@ -565,24 +569,14 @@ void spr_write_decr(DisasContext *ctx, int sprn, in=
t gprn)
>  /* Time base */
>  void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> @@ -598,24 +592,14 @@ void spr_read_atbu(DisasContext *ctx, int gprn, int=
 sprn)
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_atbl(DisasContext *ctx, int sprn, int gprn)
> @@ -631,80 +615,45 @@ void spr_write_atbu(DisasContext *ctx, int sprn, in=
t gprn)
>  #if defined(TARGET_PPC64)
>  void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  /* HDECR */
>  void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  #endif
> @@ -912,71 +861,41 @@ void spr_write_601_ubatl(DisasContext *ctx, int spr=
n, int gprn)
>  #if !defined(CONFIG_USER_ONLY)
>  void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_store_spr(sprn, cpu_gpr[gprn]);
>      gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
>      /* We must stop translation as we may have rebooted */
>      gen_stop_exception(ctx);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
> =20
>  void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
>  {
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_stop_exception(ctx);
> -    }
>  }
>  #endif
> =20
> @@ -2860,18 +2779,13 @@ static void gen_darn(DisasContext *ctx)
>      if (l > 2) {
>          tcg_gen_movi_i64(cpu_gpr[rD(ctx->opcode)], -1);
>      } else {
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_io_start();
> -        }
> +        gen_icount_io_start(ctx);
>          if (l =3D=3D 0) {
>              gen_helper_darn32(cpu_gpr[rD(ctx->opcode)]);
>          } else {
>              /* Return 64-bit random for both CRN and RRN */
>              gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
>          }
> -        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -            gen_stop_exception(ctx);
> -        }
>      }
>  }
>  #endif
> @@ -5013,9 +4927,7 @@ static void gen_rfi(DisasContext *ctx)
>      }
>      /* Restore CPU state */
>      CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfi(cpu_env);
>      ctx->base.is_jmp =3D DISAS_EXIT;
> @@ -5030,9 +4942,7 @@ static void gen_rfid(DisasContext *ctx)
>  #else
>      /* Restore CPU state */
>      CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfid(cpu_env);
>      ctx->base.is_jmp =3D DISAS_EXIT;
> @@ -5047,9 +4957,7 @@ static void gen_rfscv(DisasContext *ctx)
>  #else
>      /* Restore CPU state */
>      CHK_SV;
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfscv(cpu_env);
>      ctx->base.is_jmp =3D DISAS_EXIT;
> @@ -5379,9 +5287,7 @@ static void gen_mtmsrd(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      if (ctx->opcode & 0x00010000) {
>          /* L=3D1 form only updates EE and RI */
>          TCGv t0 =3D tcg_temp_new();
> @@ -5416,9 +5322,7 @@ static void gen_mtmsr(DisasContext *ctx)
>      CHK_SV;
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> -        gen_io_start();
> -    }
> +    gen_icount_io_start(ctx);
>      if (ctx->opcode & 0x00010000) {
>          /* L=3D1 form only updates EE and RI */
>          TCGv t0 =3D tcg_temp_new();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5rqPYiRT+/5++fSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjBr0ACgkQbDjKyiDZ
s5LyiA//VPT98SljjixIxeVeYH4/dLYXs6OLXkEdSy4SYdOdUB56G6QXccu+8hNt
+/F1LtkGfUrGqUqdIipIihlVTz73hmtH2Z90iwr6Udw27j7OTDJdQOdunW4cisGz
jIVOSeyH2TSp2zOOFpsjLYgJ6c78IjbsLFxjogrvacqqHhBu5GNfRUhHqy93u/Ha
hDjp34IzYsLONh5n+oFyxHvxIJxNQpm5P23rcmql68Oi1W/g+4a9sIuGzwkSVNWo
nDIjhGnNJVRzPmX9Etxfoo5v6CgqRHeSgvp7+48S0pAvfcugLvkeXkITEzfghnTY
nwKPuVjTUYLP/6X9pBllPjEIVaX0uiXiH5s8B9Y/6Ts3Wniw8I58fqT0qevk6gsP
Bc4sVYNfKF0uBFiqP2CuTualwYitgUjbzP5Ssb+kJ3IwrTvx/cfndAaEl1KbKO54
sFD9DZ1+BHMUNhq/aK4MbhAy7+nfEIKLmB0QXQkBB7WDkzWTd9uneuXhhdMdFBY3
jP9I7KdmBOwwH8xlWf3QQxuQ8wR+pWRDk/eyfI0lsx2x8WwueqkYROOE6UQRJq7C
BuT4HmSTNLq3FbyEudg0m9w/hipXezfWaPz/UyDRrVPuFTcTUiwdqXFOdq9jAMvJ
IBwLrDs7Q5TxNHWnuMYqZ7LEgg+LINVJtFIJVR27Gg/snOhfEnI=
=e5pO
-----END PGP SIGNATURE-----

--5rqPYiRT+/5++fSu--

