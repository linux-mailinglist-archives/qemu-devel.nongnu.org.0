Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF337F23B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:32:17 +0200 (CEST)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh31E-0003pM-MK
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sY-0007Hq-Fi; Thu, 13 May 2021 00:23:18 -0400
Received: from ozlabs.org ([203.11.71.1]:40343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sT-0004Z7-0a; Thu, 13 May 2021 00:23:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms57Nmz9t1Q; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=sfb5ytSGsUYyu48iMV7SjuvtjbkxHytCwEcuvVSF91k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMph4qjgInAV1Ffzh56NHzSCIHNwVWclUovobYWVZdN77tLz3GIX/wvBlWOXs0UKP
 deUh48CQFOVKrdpsPQ2xwBIX5LH3vv4vx3iVXTV/z4hhdP+ESbps6yItEHb83LBN8H
 p10OjdbSCKhDl9gFJKBQUTs9D4a3Md6j8fiB1ZvY=
Date: Thu, 13 May 2021 14:03:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 01/31] target/ppc: Add cia field to DisasContext
Message-ID: <YJylBc/vVpfbKEyr@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-2-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hLQQyeJA7wgDnfzT"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-2-matheus.ferst@eldorado.org.br>
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


--hLQQyeJA7wgDnfzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:11PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 98850f0c30..9abe03222d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -154,6 +154,7 @@ void ppc_translate_init(void)
>  /* internal defines */
>  struct DisasContext {
>      DisasContextBase base;
> +    target_ulong cia;  /* current instruction address */
>      uint32_t opcode;
>      uint32_t exception;
>      /* Routine used to access memory */
> @@ -253,7 +254,7 @@ static void gen_exception_err(DisasContext *ctx, uint=
32_t excp, uint32_t error)
>       * faulting instruction
>       */
>      if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->base.pc_next - 4);
> +        gen_update_nip(ctx, ctx->cia);
>      }
>      t0 =3D tcg_const_i32(excp);
>      t1 =3D tcg_const_i32(error);
> @@ -272,7 +273,7 @@ static void gen_exception(DisasContext *ctx, uint32_t=
 excp)
>       * faulting instruction
>       */
>      if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->base.pc_next - 4);
> +        gen_update_nip(ctx, ctx->cia);
>      }
>      t0 =3D tcg_const_i32(excp);
>      gen_helper_raise_exception(cpu_env, t0);
> @@ -4140,7 +4141,7 @@ static void gen_eieio(DisasContext *ctx)
>           */
>          if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>              qemu_log_mask(LOG_GUEST_ERROR, "invalid eieio using bit 6 at=
 @"
> -                          TARGET_FMT_lx "\n", ctx->base.pc_next - 4);
> +                          TARGET_FMT_lx "\n", ctx->cia);
>          } else {
>              bar =3D TCG_MO_ST_LD;
>          }
> @@ -4809,14 +4810,14 @@ static void gen_b(DisasContext *ctx)
>      li =3D LI(ctx->opcode);
>      li =3D (li ^ 0x02000000) - 0x02000000;
>      if (likely(AA(ctx->opcode) =3D=3D 0)) {
> -        target =3D ctx->base.pc_next + li - 4;
> +        target =3D ctx->cia + li;
>      } else {
>          target =3D li;
>      }
>      if (LK(ctx->opcode)) {
>          gen_setlr(ctx, ctx->base.pc_next);
>      }
> -    gen_update_cfar(ctx, ctx->base.pc_next - 4);
> +    gen_update_cfar(ctx, ctx->cia);
>      gen_goto_tb(ctx, 0, target);
>  }
> =20
> @@ -4915,11 +4916,11 @@ static void gen_bcond(DisasContext *ctx, int type)
>          }
>          tcg_temp_free_i32(temp);
>      }
> -    gen_update_cfar(ctx, ctx->base.pc_next - 4);
> +    gen_update_cfar(ctx, ctx->cia);
>      if (type =3D=3D BCOND_IM) {
>          target_ulong li =3D (target_long)((int16_t)(BD(ctx->opcode)));
>          if (likely(AA(ctx->opcode) =3D=3D 0)) {
> -            gen_goto_tb(ctx, 0, ctx->base.pc_next + li - 4);
> +            gen_goto_tb(ctx, 0, ctx->cia + li);
>          } else {
>              gen_goto_tb(ctx, 0, li);
>          }
> @@ -5035,7 +5036,7 @@ static void gen_rfi(DisasContext *ctx)
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>          gen_io_start();
>      }
> -    gen_update_cfar(ctx, ctx->base.pc_next - 4);
> +    gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfi(cpu_env);
>      gen_sync_exception(ctx);
>  #endif
> @@ -5052,7 +5053,7 @@ static void gen_rfid(DisasContext *ctx)
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>          gen_io_start();
>      }
> -    gen_update_cfar(ctx, ctx->base.pc_next - 4);
> +    gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfid(cpu_env);
>      gen_sync_exception(ctx);
>  #endif
> @@ -5069,7 +5070,7 @@ static void gen_rfscv(DisasContext *ctx)
>      if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
>          gen_io_start();
>      }
> -    gen_update_cfar(ctx, ctx->base.pc_next - 4);
> +    gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfscv(cpu_env);
>      gen_sync_exception(ctx);
>  #endif
> @@ -5112,7 +5113,7 @@ static void gen_scv(DisasContext *ctx)
> =20
>      /* Set the PC back to the faulting instruction. */
>      if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->base.pc_next - 4);
> +        gen_update_nip(ctx, ctx->cia);
>      }
>      gen_helper_scv(cpu_env, tcg_constant_i32(lev));
> =20
> @@ -5320,7 +5321,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>              if (sprn !=3D SPR_PVR) {
>                  qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privilege=
d spr "
>                                "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn=
, sprn,
> -                              ctx->base.pc_next - 4);
> +                              ctx->cia);
>              }
>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>          }
> @@ -5334,7 +5335,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>          /* Not defined */
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Trying to read invalid spr %d (0x%03x) at "
> -                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next =
- 4);
> +                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
> =20
>          /*
>           * The behaviour depends on MSR:PR and SPR# bit 0x10, it can
> @@ -5498,7 +5499,7 @@ static void gen_mtspr(DisasContext *ctx)
>              /* Privilege exception */
>              qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged s=
pr "
>                            "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sp=
rn,
> -                          ctx->base.pc_next - 4);
> +                          ctx->cia);
>              gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
>          }
>      } else {
> @@ -5512,7 +5513,7 @@ static void gen_mtspr(DisasContext *ctx)
>          /* Not defined */
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Trying to write invalid spr %d (0x%03x) at "
> -                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next =
- 4);
> +                      TARGET_FMT_lx "\n", sprn, sprn, ctx->cia);
> =20
> =20
>          /*
> @@ -9339,6 +9340,7 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>      LOG_DISAS("nip=3D" TARGET_FMT_lx " super=3D%d ir=3D%d\n",
>                ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
> =20
> +    ctx->cia =3D ctx->base.pc_next;
>      ctx->opcode =3D translator_ldl_swap(env, ctx->base.pc_next,
>                                        need_byteswap(ctx));
> =20
> @@ -9368,7 +9370,7 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>                        TARGET_FMT_lx " %d\n",
>                        opc1(ctx->opcode), opc2(ctx->opcode),
>                        opc3(ctx->opcode), opc4(ctx->opcode),
> -                      ctx->opcode, ctx->base.pc_next - 4, (int)msr_ir);
> +                      ctx->opcode, ctx->cia, (int)msr_ir);
>      } else {
>          uint32_t inval;
> =20
> @@ -9385,7 +9387,7 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>                            TARGET_FMT_lx "\n", ctx->opcode & inval,
>                            opc1(ctx->opcode), opc2(ctx->opcode),
>                            opc3(ctx->opcode), opc4(ctx->opcode),
> -                          ctx->opcode, ctx->base.pc_next - 4);
> +                          ctx->opcode, ctx->cia);
>              gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>              ctx->base.is_jmp =3D DISAS_NORETURN;
>              return;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hLQQyeJA7wgDnfzT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpQUACgkQbDjKyiDZ
s5JJ8g//dBZe01ZCrRfJSlNfdGvgVM8zK9/gaAasXbXS/usgs5TUWRZNPEnFcxZR
sFpvnGsERqIoGQVHlu18QMWrUu7Kmll33tnPDQCZakwdJLsFa8X6vNAYaSOyhuCq
K6/sok4Iyq+qPwk3W1LecO2eL/ovdQQuNw2HqKK7pNThds7RTkhc3ZOJeir2EjVR
ZNU6SOJTbdyx33CO932wlJsh1kISprJItQYUb9BUWx/UxtAvrPpqrOevL4NkNE+O
cVXMVFOE2B8VLZeTJSvNpyIqiznqffSKy/AWAqUvGiq3OX8Q4SmHRs+VM27S4Trz
fCxI2dn4aASXI26818JhQZfAZBE9h+LAHHsTSwEpTpMdI8JOsQD8orHqYn2TBrMz
LbA2Ml0mpXkOTIwRjRiBB2iIDNmhVGU4ODT6Dn7Ny/kVVNF6WMOgZM+w33hzAou6
u1t66BfW63C0qqOvuBkdvDeqI7sBLj+zPcms2PYYBisHUHnS5M5DYLMnwMhTuv/S
uSEAGqx26tnA0yECE4/oNWKE06h6TtFrLe1DactYzre++T/Si0ml/dt82zuU9atA
U7aPOOGu1gKiSKxdKulL2ySg1D5wx/ILrY6BcsjTWFDzsPeXeyFlqKq4eFV2b8eW
tJA2AvJ+1o2WGVSaXWYDZS7mXbV1seMP7yWV1C3Ao6XC+B2Kg1M=
=aQSG
-----END PGP SIGNATURE-----

--hLQQyeJA7wgDnfzT--

