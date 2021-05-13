Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5037F246
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:34:12 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh335-0008OD-KX
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2se-0007Lx-0w; Thu, 13 May 2021 00:23:24 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0004cv-HG; Thu, 13 May 2021 00:23:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms5wWbz9t2G; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=WDExWQ07QIYqQpWpY1PgwcjGFuDzscfZCTvwBlSQDYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRmtQ2b4q/9hFaCIY6cNcQp0NxPotqiG/jd9mthL2CBq7psYWqiM2Rasc6tCoXDB+
 TyXDGYUlz6BRr2OWveNPdTmjEqZq4yBztbmNx4boI1C/phvBm1Br16n41SU0m1FKpj
 e9eQyrDrEjgZngJ//9BU/ar/8Ppc0RPbGfzmCPyE=
Date: Thu, 13 May 2021 14:06:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 03/31] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Message-ID: <YJylv/uVtiZwdfA+@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-4-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KJRiwKN8BQf6UwBI"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-4-matheus.ferst@eldorado.org.br>
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 luis.pires@eldorado.org.br, qemu-ppc@nongnu.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KJRiwKN8BQf6UwBI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:13PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> There are other valid settings for is_jmp besides
> DISAS_NEXT and DISAS_NORETURN, so eliminating that
> dichotomy from ppc_tr_translate_insn is helpful.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 3ad4c7163d..616ffc1508 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -261,7 +261,8 @@ static void gen_exception_err(DisasContext *ctx, uint=
32_t excp, uint32_t error)
>      gen_helper_raise_exception_err(cpu_env, t0, t1);
>      tcg_temp_free_i32(t0);
>      tcg_temp_free_i32(t1);
> -    ctx->exception =3D (excp);
> +    ctx->exception =3D excp;
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  static void gen_exception(DisasContext *ctx, uint32_t excp)
> @@ -278,7 +279,8 @@ static void gen_exception(DisasContext *ctx, uint32_t=
 excp)
>      t0 =3D tcg_const_i32(excp);
>      gen_helper_raise_exception(cpu_env, t0);
>      tcg_temp_free_i32(t0);
> -    ctx->exception =3D (excp);
> +    ctx->exception =3D excp;
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
> @@ -290,7 +292,8 @@ static void gen_exception_nip(DisasContext *ctx, uint=
32_t excp,
>      t0 =3D tcg_const_i32(excp);
>      gen_helper_raise_exception(cpu_env, t0);
>      tcg_temp_free_i32(t0);
> -    ctx->exception =3D (excp);
> +    ctx->exception =3D excp;
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  /*
> @@ -336,6 +339,7 @@ static void gen_debug_exception(DisasContext *ctx)
>      t0 =3D tcg_const_i32(EXCP_DEBUG);
>      gen_helper_raise_exception(cpu_env, t0);
>      tcg_temp_free_i32(t0);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  static inline void gen_inval_exception(DisasContext *ctx, uint32_t error)
> @@ -9374,7 +9378,6 @@ static bool ppc_tr_breakpoint_check(DisasContextBas=
e *dcbase, CPUState *cs,
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> =20
>      gen_debug_exception(ctx);
> -    dcbase->is_jmp =3D DISAS_NORETURN;
>      /*
>       * The address covered by the breakpoint must be included in
>       * [tb->pc, tb->pc + tb->size) in order to for it to be properly
> @@ -9404,18 +9407,19 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
>      ok =3D decode_legacy(cpu, ctx, insn);
>      if (!ok) {
>          gen_invalid(ctx);
> -        ctx->base.is_jmp =3D DISAS_NORETURN;
>      }
> =20
>  #if defined(DO_PPC_STATISTICS)
>      handler->count++;
>  #endif
> +
>      /* Check trace mode exceptions */
>      if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
>                   (ctx->base.pc_next <=3D 0x100 || ctx->base.pc_next > 0x=
F00) &&
>                   ctx->exception !=3D POWERPC_SYSCALL &&
>                   ctx->exception !=3D POWERPC_EXCP_TRAP &&
> -                 ctx->exception !=3D POWERPC_EXCP_BRANCH)) {
> +                 ctx->exception !=3D POWERPC_EXCP_BRANCH &&
> +                 ctx->base.is_jmp !=3D DISAS_NORETURN)) {
>          uint32_t excp =3D gen_prep_dbgex(ctx);
>          gen_exception_nip(ctx, excp, ctx->base.pc_next);
>      }
> @@ -9426,14 +9430,20 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
>                   opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
>      }
> =20
> -    ctx->base.is_jmp =3D ctx->exception =3D=3D POWERPC_EXCP_NONE ?
> -        DISAS_NEXT : DISAS_NORETURN;
> +    if (ctx->base.is_jmp =3D=3D DISAS_NEXT
> +        && ctx->exception !=3D POWERPC_EXCP_NONE) {
> +        ctx->base.is_jmp =3D DISAS_TOO_MANY;
> +    }
>  }
> =20
>  static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> =20
> +    if (ctx->base.is_jmp =3D=3D DISAS_NORETURN) {
> +        return;
> +    }
> +
>      if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
>          gen_goto_tb(ctx, 0, ctx->base.pc_next);
>      } else if (ctx->exception !=3D POWERPC_EXCP_BRANCH) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KJRiwKN8BQf6UwBI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpb8ACgkQbDjKyiDZ
s5JY+g//e2O4U9bmTPJZv2bwyzmpt3PuVpwIcGzXZIY9G0mSX35unABUkHpe5IPY
MtXTztaP/VoZeGiq2ho882Ph01YA+/segC3SsO/oN3xS9+itA36Sg2OsaG/jQ1RQ
FBBBWewy28w3xiwNg4gPqYU5QwBSVOPNoxftQZ8k83fYiFTbObLGmuOmf4gsBwhx
RUitEX7x2zqeJvkVEX+CcgBJtwsdxcYDfR+EfpXu7M6Z/ks4HM7jGR0axWIzwdiq
/HJ78v6C7qfPoprY+wJjq/LPrtD4Z7Yg3pS9R0P+S69UM/QwuAQXvXX9whXQ1YTv
QlKfsV9wd9pt4tRUP5Fvu6zM09c0Pc3Qdz3wcjxRD1ZfnrG2Fa9sM5rOVDrychnC
OXbF+UGXvjvtgJU5apU8Omr/gmIezNBL8IAejLzDzETLPzvKMlJ9nXVK79aA2737
S7e9Vckd3gV7Wy2vKD8nnSbxsGhiSEfxjKutqixgPuPQqAP4mGR4iapxL04r2NIP
7V9toCOQGEOcQesf60EKtUNibjSC9w+ZQ2EYQekeTsTaMeRECXFdgVqpClJGkf8Q
KfIBBoW+8klZ2+GaMPAZQu59yEmI1mVYvkxUU5cvcS0sFa7PNDAg00Fs6T/rwVRe
fn0srYd5u29TtiQZSFrQJtqHVzK3dAoR5nRpd+01QYfQJrVizSw=
=Nlg4
-----END PGP SIGNATURE-----

--KJRiwKN8BQf6UwBI--

