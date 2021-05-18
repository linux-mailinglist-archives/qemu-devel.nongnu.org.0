Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C082386F61
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:38:14 +0200 (CEST)
Received: from localhost ([::1]:53716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liogX-0001Kz-1Z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeC-0006i2-8U; Mon, 17 May 2021 21:35:48 -0400
Received: from ozlabs.org ([203.11.71.1]:57859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioe9-0006xF-AV; Mon, 17 May 2021 21:35:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqb5LRsz9sX2; Tue, 18 May 2021 11:35:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301739;
 bh=we5aQKCuRyPvWGtaYKVekFMWYY5DZijAF0hETnfTPXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P/7Cx3EOhAlyW6Kh50yqFCFauIlohXPEVm38GoqhlOlf+2Vpn098fKJV5qmvWC86l
 gf75mZpw6wTgEqTvW36AfnQvXkoRfWm1buDcYnrr2CYAr1P++XXkH/qcqlMsiGU6ll
 4xLpM4opUyAQ2afT4rebA49l2Jpu7yT1le5FAhLA=
Date: Tue, 18 May 2021 10:19:07 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 05/23] target/ppc: Move single-step check to
 ppc_tr_tb_stop
Message-ID: <YKMH+8Y0q2bVGo6R@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-6-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RqchYOJ2TvjC43nU"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-6-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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


--RqchYOJ2TvjC43nU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:07PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> When single-stepping, force max_insns to 1 in init_disas
> so that we exit the translation loop immediately.
>=20
> Combine the single-step checks in tb_stop, and give the
> gdb exception priority over the cpu exception, just as
> we already do in gen_lookup_and_goto_ptr.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 80cd11b3f8..05e3c0417a 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -8992,7 +8992,6 @@ static void ppc_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      CPUPPCState *env =3D cs->env_ptr;
>      uint32_t hflags =3D ctx->base.tb->flags;
> -    int bound;
> =20
>      ctx->spr_cb =3D env->spr_cb;
>      ctx->pr =3D (hflags >> HFLAGS_PR) & 1;
> @@ -9032,8 +9031,12 @@ static void ppc_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
>          ctx->singlestep_enabled |=3D GDBSTUB_SINGLE_STEP;
>      }
> =20
> -    bound =3D -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
> -    ctx->base.max_insns =3D MIN(ctx->base.max_insns, bound);
> +    if (ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_STEP=
)) {
> +        ctx->base.max_insns =3D 1;
> +    } else {
> +        int bound =3D -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
> +        ctx->base.max_insns =3D MIN(ctx->base.max_insns, bound);
> +    }
>  }
> =20
>  static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
> @@ -9087,14 +9090,6 @@ static void ppc_tr_translate_insn(DisasContextBase=
 *dcbase, CPUState *cs)
>      handler->count++;
>  #endif
> =20
> -    /* Check trace mode exceptions */
> -    if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
> -                 (ctx->base.pc_next <=3D 0x100 || ctx->base.pc_next > 0x=
F00) &&
> -                 ctx->base.is_jmp !=3D DISAS_NORETURN)) {
> -        uint32_t excp =3D gen_prep_dbgex(ctx);
> -        gen_exception_nip(ctx, excp, ctx->base.pc_next);
> -    }
> -
>      if (tcg_check_temp_count()) {
>          qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
>                   "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
> @@ -9107,6 +9102,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>      DisasJumpType is_jmp =3D ctx->base.is_jmp;
>      target_ulong nip =3D ctx->base.pc_next;
> +    int sse;
> =20
>      if (is_jmp =3D=3D DISAS_NORETURN) {
>          /* We have already exited the TB. */
> @@ -9114,7 +9110,8 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase=
, CPUState *cs)
>      }
> =20
>      /* Honor single stepping. */
> -    if (unlikely(ctx->base.singlestep_enabled)) {
> +    sse =3D ctx->singlestep_enabled & (CPU_SINGLE_STEP | GDBSTUB_SINGLE_=
STEP);
> +    if (unlikely(sse)) {
>          switch (is_jmp) {
>          case DISAS_TOO_MANY:
>          case DISAS_EXIT_UPDATE:
> @@ -9127,8 +9124,16 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbas=
e, CPUState *cs)
>          default:
>              g_assert_not_reached();
>          }
> -        gen_debug_exception(ctx);
> -        return;
> +
> +        if (sse & GDBSTUB_SINGLE_STEP) {
> +            gen_debug_exception(ctx);
> +            return;
> +        }
> +        /* else CPU_SINGLE_STEP... */
> +        if (nip <=3D 0x100 || nip > 0xf00) {
> +            gen_exception(ctx, gen_prep_dbgex(ctx));
> +            return;
> +        }
>      }
> =20
>      switch (is_jmp) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RqchYOJ2TvjC43nU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjB/oACgkQbDjKyiDZ
s5KxNxAAzaxvRuHyIASdWsA8ZvRU+JVX/QIUkITUTMyNVKTIXFFvFdkVtzTr7HrG
6IsfQk8UG/7jk1wls0q6MxCEwJmBze/0PQiYvTD9mTMRtRHmmkzPAQaOkPN1lxq7
YvMdA9Z023jzudeGb1WQxN5n/5VMs3LU6R909pN0Coo2WApthGt7Evcg6OmM64a0
OD1r+RGwe/pY3fbIKAkIz7N/CPNVPmbPwnEUQtMn5fiEzbkUWhIZVEAizg/k3U45
CNTQwMTdQPZmgAi0tL27qvAULrntU8Eg+xp33v6qNQyvbsdeb+1hifa9MkW6ucGb
pcro9nQmEupONbmFcByePFyRBNZVz/czmYgTabqesH4a9uN4W445ijOQdn+KNk7i
Y81uxlsOZ3t1xB2MPtlgpzy8F1Mj27RcghvFBmKr0yVPNvUVtOW4nldsUBCGPK28
SMYflpyAUCBbLoSmTcTozr+VcnnYu7zZMbWjhS/VRz4gGCckS6cJlYqGR9q/xcS/
kd3AedAs+f7FEcdjhnCgfI2Pu8JU23fAOJ4ipZBSqLr7qncB3W9esVNpmYKbzKfJ
zgy9tTbrgWPGNEOVVxqS1Au1CKSY2fP5edN9mmcr8qSJZaUlr1gRgeetd10uPSjm
7Ye8p8D4ziLakdRqq9hcE0kHyVLcjz5n//m6y5pRvB0iGDc7O1w=
=Xz2A
-----END PGP SIGNATURE-----

--RqchYOJ2TvjC43nU--

