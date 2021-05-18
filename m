Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC8386F62
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:38:21 +0200 (CEST)
Received: from localhost ([::1]:54512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liogd-0001rY-Ii
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeE-0006k5-0H; Mon, 17 May 2021 21:35:50 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58123 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeB-0006xE-S1; Mon, 17 May 2021 21:35:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqb4ByDz9sWF; Tue, 18 May 2021 11:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301739;
 bh=FL+uPPKM6GQwa7aiEcOhc7WkI3jtaoWGJpyy5YrrwWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dtgnuB1a0uHpz/vdTb/OXTYX9J1Dha3oSxtQ0gXYI6jNcAt2aaYtoB0PHl8DVaGC5
 EM1hVtcJYllNYltI/eVoDrVC8M6HGSjgJ2+IGF3j1l+8oOjshYu0PRfWwNzTBLjq4p
 0Ai46aI9uYMjBqG78oBoMwlQv/XQVVhuGMWRkIAg=
Date: Tue, 18 May 2021 10:17:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 04/23] target/ppc: Remove DisasContext.exception
Message-ID: <YKMHfmw77uCLIsfT@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-5-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8emNvgerkwepP5D7"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-5-matheus.ferst@eldorado.org.br>
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


--8emNvgerkwepP5D7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:06PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Now that we have removed all of the fake exceptions, and all real
> exceptions exit via DISAS_NORETURN, we can remove this field.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 30 ++++--------------------------
>  1 file changed, 4 insertions(+), 26 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index d019454550..80cd11b3f8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -159,7 +159,6 @@ struct DisasContext {
>      DisasContextBase base;
>      target_ulong cia;  /* current instruction address */
>      uint32_t opcode;
> -    uint32_t exception;
>      /* Routine used to access memory */
>      bool pr, hv, dr, le_mode;
>      bool lazy_tlb_flush;
> @@ -261,15 +260,12 @@ static void gen_exception_err(DisasContext *ctx, ui=
nt32_t excp, uint32_t error)
>       * These are all synchronous exceptions, we set the PC back to the
>       * faulting instruction
>       */
> -    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->cia);
> -    }
> +    gen_update_nip(ctx, ctx->cia);
>      t0 =3D tcg_const_i32(excp);
>      t1 =3D tcg_const_i32(error);
>      gen_helper_raise_exception_err(cpu_env, t0, t1);
>      tcg_temp_free_i32(t0);
>      tcg_temp_free_i32(t1);
> -    ctx->exception =3D excp;
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
> @@ -281,13 +277,10 @@ static void gen_exception(DisasContext *ctx, uint32=
_t excp)
>       * These are all synchronous exceptions, we set the PC back to the
>       * faulting instruction
>       */
> -    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->cia);
> -    }
> +    gen_update_nip(ctx, ctx->cia);
>      t0 =3D tcg_const_i32(excp);
>      gen_helper_raise_exception(cpu_env, t0);
>      tcg_temp_free_i32(t0);
> -    ctx->exception =3D excp;
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
> @@ -300,7 +293,6 @@ static void gen_exception_nip(DisasContext *ctx, uint=
32_t excp,
>      t0 =3D tcg_const_i32(excp);
>      gen_helper_raise_exception(cpu_env, t0);
>      tcg_temp_free_i32(t0);
> -    ctx->exception =3D excp;
>      ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
> @@ -4993,13 +4985,10 @@ static void gen_scv(DisasContext *ctx)
>      uint32_t lev =3D (ctx->opcode >> 5) & 0x7F;
> =20
>      /* Set the PC back to the faulting instruction. */
> -    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->cia);
> -    }
> +    gen_update_nip(ctx, ctx->cia);
>      gen_helper_scv(cpu_env, tcg_constant_i32(lev));
> =20
> -    /* This need not be exact, just not POWERPC_EXCP_NONE */
> -    ctx->exception =3D POWERPC_SYSCALL_VECTORED;
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
>  #endif
>  #endif
> @@ -9005,7 +8994,6 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      uint32_t hflags =3D ctx->base.tb->flags;
>      int bound;
> =20
> -    ctx->exception =3D POWERPC_EXCP_NONE;
>      ctx->spr_cb =3D env->spr_cb;
>      ctx->pr =3D (hflags >> HFLAGS_PR) & 1;
>      ctx->mem_idx =3D (hflags >> HFLAGS_DMMU_IDX) & 7;
> @@ -9112,16 +9100,6 @@ static void ppc_tr_translate_insn(DisasContextBase=
 *dcbase, CPUState *cs)
>                   "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
>                   opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
>      }
> -
> -    if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
> -        switch (ctx->exception) {
> -        case POWERPC_EXCP_NONE:
> -            break;
> -        default:
> -            /* Every other ctx->exception should have set NORETURN. */
> -            g_assert_not_reached();
> -        }
> -    }
>  }
> =20
>  static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8emNvgerkwepP5D7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjB34ACgkQbDjKyiDZ
s5KYdg//Q3onmNyNX/sjGy7/S2CcV75ePF9D+b0bH4dMQlsY1ex8p+ZgH3jYiUWC
5N6y0es7RnX/prmisNHtK0cXkx9O0diqVD2TfmtGivzIQD9iKi+xAPTxmIYU+G3s
FhbnAhqDNv+5X4K1QQjVNSe1cbX7zw2fqkeBgQZnko5iHPcIxCyGq4XkxY2/qjXH
bsjNMZuiXKk3IfjG8FSoZEsgOXKFn5quNYAggzSTrncytiCtuUqksHSPqaeOpEVM
ApktR+uuDkmbrgAHki/VhYUXWCnIKscg1i2CSMwEtcmsU+CRBNBH26GBqIlHJCRu
Uz/JwcPL2iniCGNhvkInYqqeEZBAEuyjkwQOdCihqlYqG4jmk2Ut1ja0owygP7et
QQ8dXY0kWRnUo6LYHWOydGAqt4L0+uNWxzdkqtAi5lL/+b3SU6OA/JVTbWQ+U2AS
JY2hvKNrhTRgci+wRg0OvWGWrrgvRNCEWP0YkXJ9zCAp5tCO7MkeONkxkIuhsSnl
Gaj2TY9N3rbBBrw2BNRbbKOnltVycW3ptnB3qV5AfyQDQumecf/6gpNetiA7CgNE
XZxjWntcY/hpL/HCC4fcyHnHKZ2zmg32NSxe/zhCA4jJqPr/Ff2dxib5SsftAstS
om+3p94wPfEudgOF37tRuK05xJGYuMEab2YF3aYGOH9eKGcxse0=
=BGM7
-----END PGP SIGNATURE-----

--8emNvgerkwepP5D7--

