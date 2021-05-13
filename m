Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A637F245
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:33:39 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh32T-0006xP-KR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2se-0007M0-1c; Thu, 13 May 2021 00:23:24 -0400
Received: from ozlabs.org ([203.11.71.1]:42437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sa-0004fW-Nb; Thu, 13 May 2021 00:23:23 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdmt0HtZz9t5H; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879774;
 bh=1U7xoUHdzGy+cbvD9iClsx+v3QgwyT9CJYhrlIDbTZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMoXmTn4Q7h8COGU61U/WKOnbg9kWmkOw4SOwRbGdF/nMErg2ic1zp2vU9s5sUxfT
 BY3FqypfnU6nTwH4Ey7psby6T8OvH7qGUu0e4iTsCytjl2kQDkJM6JVhpvDOEfwT9U
 IlJJkB9kfDNlqqtSuFXDKPapTp6BhjKY9LBta4BE=
Date: Thu, 13 May 2021 14:10:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 07/31] target/ppc: Introduce
 DISAS_{EXIT,CHAIN}{,_UPDATE}
Message-ID: <YJymtojVE+pnqdT2@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-8-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5DXRt+ltIIkgtn2h"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-8-matheus.ferst@eldorado.org.br>
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


--5DXRt+ltIIkgtn2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:17PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Rewrite ppc_tr_tb_stop to handle these new codes.
>=20
> Convert ctx->exception into these new codes at the end of
> ppc_tr_translate_insn, prior to pushing the change back
> throughout translate.c.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/translate.c | 75 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 65 insertions(+), 10 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 7b23f85c11..4bebb00bb2 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -182,6 +182,11 @@ struct DisasContext {
>      uint64_t insns_flags2;
>  };
> =20
> +#define DISAS_EXIT         DISAS_TARGET_0  /* exit to main loop, pc upda=
ted */
> +#define DISAS_EXIT_UPDATE  DISAS_TARGET_1  /* exit to main loop, pc stal=
e */
> +#define DISAS_CHAIN        DISAS_TARGET_2  /* lookup next tb, pc updated=
 */
> +#define DISAS_CHAIN_UPDATE DISAS_TARGET_3  /* lookup next tb, pc stale */
> +
>  /* Return true iff byteswap is needed in a scalar memop */
>  static inline bool need_byteswap(const DisasContext *ctx)
>  {
> @@ -9417,28 +9422,78 @@ static void ppc_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cs)
>                   opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
>      }
> =20
> -    if (ctx->base.is_jmp =3D=3D DISAS_NEXT
> -        && ctx->exception !=3D POWERPC_EXCP_NONE) {
> -        ctx->base.is_jmp =3D DISAS_TOO_MANY;
> +    if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
> +        switch (ctx->exception) {
> +        case POWERPC_EXCP_NONE:
> +            break;
> +        case POWERPC_EXCP_BRANCH:
> +            ctx->base.is_jmp =3D DISAS_NORETURN;
> +            break;
> +        case POWERPC_EXCP_SYNC:
> +        case POWERPC_EXCP_STOP:
> +            ctx->base.is_jmp =3D DISAS_EXIT;
> +            break;
> +        default:
> +            /* Every other ctx->exception should have set NORETURN. */
> +            g_assert_not_reached();
> +        }
>      }
>  }
> =20
>  static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>  {
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> +    DisasJumpType is_jmp =3D ctx->base.is_jmp;
> +    target_ulong nip =3D ctx->base.pc_next;
> =20
> -    if (ctx->base.is_jmp =3D=3D DISAS_NORETURN) {
> +    if (is_jmp =3D=3D DISAS_NORETURN) {
> +        /* We have already exited the TB. */
>          return;
>      }
> =20
> -    if (ctx->exception =3D=3D POWERPC_EXCP_NONE) {
> -        gen_goto_tb(ctx, 0, ctx->base.pc_next);
> -    } else if (ctx->exception !=3D POWERPC_EXCP_BRANCH) {
> -        if (unlikely(ctx->base.singlestep_enabled)) {
> -            gen_debug_exception(ctx);
> +    /* Honor single stepping. */
> +    if (unlikely(ctx->base.singlestep_enabled)) {
> +        switch (is_jmp) {
> +        case DISAS_TOO_MANY:
> +        case DISAS_EXIT_UPDATE:
> +        case DISAS_CHAIN_UPDATE:
> +            gen_update_nip(ctx, nip);
> +            break;
> +        case DISAS_EXIT:
> +        case DISAS_CHAIN:
> +            break;
> +        default:
> +            g_assert_not_reached();
>          }
> -        /* Generate the return instruction */
> +        gen_debug_exception(ctx);
> +        return;
> +    }
> +
> +    switch (is_jmp) {
> +    case DISAS_TOO_MANY:
> +        if (use_goto_tb(ctx, nip)) {
> +            tcg_gen_goto_tb(0);
> +            gen_update_nip(ctx, nip);
> +            tcg_gen_exit_tb(ctx->base.tb, 0);
> +            break;
> +        }
> +        /* fall through */
> +    case DISAS_CHAIN_UPDATE:
> +        gen_update_nip(ctx, nip);
> +        /* fall through */
> +    case DISAS_CHAIN:
> +        tcg_gen_lookup_and_goto_ptr();
> +        break;
> +
> +    case DISAS_EXIT_UPDATE:
> +        gen_update_nip(ctx, nip);
> +        /* fall through */
> +    case DISAS_EXIT:
>          tcg_gen_exit_tb(NULL, 0);
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
>      }
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5DXRt+ltIIkgtn2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcprYACgkQbDjKyiDZ
s5K77RAA2c3sIDinqmLHDpcBQMmSa9ORpkcEq82Exhgcxt+m8Krn79YMEwNrnrx3
USpJApomuZYgq3ZJ7dPA5pd45BLGpKMtJfpn9+C11XAGwIV+s+FKmZr07mmadl5j
Bx89JvBxhf5DIRsvCIm9gO9yul/jpdi9DKltHS7FV+CqYIUtbCHgTwQQugGLENtV
QGot49ERP9VWPy4VxiSDKn8e7I3+qYoPAq7dG8lV7ak79mRN5Um7ZB/TpzZU6sdP
TzcoZAv0qK2iuk5ap6GdhnU8X6FlFHjJbLDl8FGEfO2oDx9O8ssidi1NnrPsK3/l
wid/trdvYi63e4ihm66Qp/8HVrl8Uo9LasQsWW8L9sA/MXlC8SZg/g/CUb7vYfEA
teBupNqzG/UHxJQqCUu52qO9LvgKFkMNHwjfqD4/Z0n8IC2UyYIMQ6N4Hvjmtzp9
N87QWHpZ4cW99j7vZvihE+XP45eUMM8Sbjq+qX4k8jCcB+KB6XQLwC46zJ9Mwa4f
QKtJvvwDt2rPlJ43b9i8Syu8ZQbAf6bh+tuTvf3LC+I///1GOzBUnl019+xq2pSz
vKtU11o/sMM5MjL1BtvS0Q/MzphF7GgMOBlMI8kfQM8JMV3VIUlmSQwuAafSiJvm
Vfh1MzBpqltPCeT6pjKMpNjZRH+/zboztgAA5LIdfXWV0ErHAog=
=0Heg
-----END PGP SIGNATURE-----

--5DXRt+ltIIkgtn2h--

