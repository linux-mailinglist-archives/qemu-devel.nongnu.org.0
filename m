Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC7386F60
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:38:13 +0200 (CEST)
Received: from localhost ([::1]:53792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liogX-0001OM-0W
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeD-0006jY-Lj; Mon, 17 May 2021 21:35:49 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44197 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeB-0006wr-N0; Mon, 17 May 2021 21:35:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqb0nd3z9sW1; Tue, 18 May 2021 11:35:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301739;
 bh=cYPOwajV9YCk1gZ2EThns/WyHGLz+Wxce9VyJjsZCo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dHCBXfDWcdk9kMUzaQvjqGGJA08X5DGlvofdM6/KZX9ogQls5Mn2lBIuMHNQo8EEo
 d1XZfZQuTO69KRshkW4y8wSOiVkfEWPEMTawtjwB5f1oEy2D0URDzcSfFGppgpsoq5
 CKPqi1ieJXbd3IMX9l25eiXCbkTD6YOPEpjtV1Yg=
Date: Tue, 18 May 2021 10:15:24 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 03/23] target/ppc: Replace POWERPC_EXCP_BRANCH with
 DISAS_NORETURN
Message-ID: <YKMHHE2OehwQwwWH@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-4-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g1kzQCBmDaKUdSx7"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-4-matheus.ferst@eldorado.org.br>
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


--g1kzQCBmDaKUdSx7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:05PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> The translation of branch instructions always results in exit from
> the TB. Remove the synthetic "exception" after no more uses.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  linux-user/ppc/cpu_loop.c | 3 ---
>  target/ppc/cpu.h          | 2 --
>  target/ppc/translate.c    | 8 ++------
>  3 files changed, 2 insertions(+), 11 deletions(-)
>=20
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index fe526693d2..fa91ea0eed 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
>              cpu_abort(cs, "Maintenance exception while in user mode. "
>                        "Aborting\n");
>              break;
> -        case POWERPC_EXCP_BRANCH:   /* branch instruction:              =
     */
> -            /* We just stopped because of a branch. Go on */
> -            break;
>          case POWERPC_EXCP_SYSCALL_USER:
>              /* system call in user-mode emulation */
>              /* WARNING:
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 9e38df685d..cab33a3680 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -131,8 +131,6 @@ enum {
>      POWERPC_EXCP_SYSCALL_VECTORED =3D 102, /* scv exception             =
        */
>      /* EOL                                                              =
     */
>      POWERPC_EXCP_NB       =3D 103,
> -    /* QEMU exceptions: used internally during code translation         =
     */
> -    POWERPC_EXCP_BRANCH       =3D 0x201, /* branch instruction          =
       */
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
>  };
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index f57b67be5f..d019454550 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4692,7 +4692,6 @@ static void gen_b(DisasContext *ctx)
>  {
>      target_ulong li, target;
> =20
> -    ctx->exception =3D POWERPC_EXCP_BRANCH;
>      /* sign extend LI */
>      li =3D LI(ctx->opcode);
>      li =3D (li ^ 0x02000000) - 0x02000000;
> @@ -4706,6 +4705,7 @@ static void gen_b(DisasContext *ctx)
>      }
>      gen_update_cfar(ctx, ctx->cia);
>      gen_goto_tb(ctx, 0, target);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  #define BCOND_IM  0
> @@ -4718,7 +4718,6 @@ static void gen_bcond(DisasContext *ctx, int type)
>      uint32_t bo =3D BO(ctx->opcode);
>      TCGLabel *l1;
>      TCGv target;
> -    ctx->exception =3D POWERPC_EXCP_BRANCH;
> =20
>      if (type =3D=3D BCOND_LR || type =3D=3D BCOND_CTR || type =3D=3D BCO=
ND_TAR) {
>          target =3D tcg_temp_local_new();
> @@ -4825,6 +4824,7 @@ static void gen_bcond(DisasContext *ctx, int type)
>          gen_set_label(l1);
>          gen_goto_tb(ctx, 1, ctx->base.pc_next);
>      }
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
>  }
> =20
>  static void gen_bc(DisasContext *ctx)
> @@ -9102,7 +9102,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>      /* Check trace mode exceptions */
>      if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
>                   (ctx->base.pc_next <=3D 0x100 || ctx->base.pc_next > 0x=
F00) &&
> -                 ctx->exception !=3D POWERPC_EXCP_BRANCH &&
>                   ctx->base.is_jmp !=3D DISAS_NORETURN)) {
>          uint32_t excp =3D gen_prep_dbgex(ctx);
>          gen_exception_nip(ctx, excp, ctx->base.pc_next);
> @@ -9118,9 +9117,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>          switch (ctx->exception) {
>          case POWERPC_EXCP_NONE:
>              break;
> -        case POWERPC_EXCP_BRANCH:
> -            ctx->base.is_jmp =3D DISAS_NORETURN;
> -            break;
>          default:
>              /* Every other ctx->exception should have set NORETURN. */
>              g_assert_not_reached();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--g1kzQCBmDaKUdSx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjBxwACgkQbDjKyiDZ
s5KZYxAA2j0wg0hm6O4vdMYjUUe0L7Za3xjxiWgDBTDeOMhGR/HgAq9rgXH6BCPX
1mdesr9iDswlVEj9b8o3j7fLdICXIFHRrpXXrEfGy8KgFZ2hIXEyV0PkeO9OhBJ3
uf0EcSgTWcxJgTKg0nFj95z6FRm4TpzjADJ+luFSUnpIfw5mk2cvmxP2kMM7ZM/C
KU+nHg+SVW1jnixD4+joir7m+1DiTh7Bp8cy39oFBW+2WV1uHxmZhIJSV62pAze0
N+sE1JNVifX2zoOekLGKUt1FIUxarzSn2HDViDQTAjI34/p09kq42L1wSygljtdx
zwN5sY6tbiGDB0srwPUMfto3bSO1E0P9oqNqCceDsVSsKOObGiuWxE3vxHafsQhV
QG2QLVWB6EQyJGWdnQWK3Ehk6E8PTnrC3WFPDGrnyTZo4cIw6UlDJ7lge0NHiN/r
le1L0xvZS9MfF40L2ciCZ10Wh/w5fmOHDR9Rpze1a/BaU6dkCO7NwOL/2brWK7Do
hI7tZB+6312X6Kx2pfYH53wbHh9/QJH137BpI2TLrFWy3XZCrXb0AkOOyr7qtmW2
ZQ8YTAquUFDRWQ4wrIyuBpd2kUQpr7Wp6kASmHBJ7BPS2dyFyY/iSqmc4tDm+os+
kcaVx7yuYwgmn2VoFhRectLApVSJiGMm6SKdSNN4YOWp2w2sWSQ=
=k0Y+
-----END PGP SIGNATURE-----

--g1kzQCBmDaKUdSx7--

