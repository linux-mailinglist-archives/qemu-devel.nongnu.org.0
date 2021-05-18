Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B6386F5F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:38:11 +0200 (CEST)
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liogU-0001JK-Bq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeC-0006hs-4z; Mon, 17 May 2021 21:35:48 -0400
Received: from ozlabs.org ([203.11.71.1]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioe9-0006wv-F0; Mon, 17 May 2021 21:35:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqb2yCqz9sWX; Tue, 18 May 2021 11:35:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301739;
 bh=gTIgF0BXPkbTvoISXaDrCxpuhRooOHoVQ4lxg2Dos68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijOulkRMtKE5XzuXDruAimDvF9lUoGbRvHo1R+GO2a5sZ5497WOD9hWAMwWLXCqPN
 IQxHVY/Gl1mw31sZub9AkeztLPcEj0mg0S1HDbuNIP8Q4pE0AzUY6QfZbz2rorC3OL
 CftHPWIpqSrqEpAmkK3AUOK0edtPRTnnXr2SIVp0=
Date: Tue, 18 May 2021 10:14:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 02/23] target/ppc: Replace POWERPC_EXCP_STOP with
 DISAS_EXIT_UPDATE
Message-ID: <YKMG8hpwPw+MYaaj@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-3-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BzOz3wUD9PXVkQXr"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-3-matheus.ferst@eldorado.org.br>
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


--BzOz3wUD9PXVkQXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:04PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Remove the synthetic "exception" after no more uses.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  linux-user/ppc/cpu_loop.c |  3 ---
>  target/ppc/cpu.h          |  1 -
>  target/ppc/translate.c    | 24 +++++++-----------------
>  3 files changed, 7 insertions(+), 21 deletions(-)
>=20
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 4a0f6c8dc2..fe526693d2 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -423,9 +423,6 @@ void cpu_loop(CPUPPCState *env)
>              cpu_abort(cs, "Maintenance exception while in user mode. "
>                        "Aborting\n");
>              break;
> -        case POWERPC_EXCP_STOP:     /* stop translation                 =
     */
> -            /* We did invalidate the instruction cache. Go on */
> -            break;
>          case POWERPC_EXCP_BRANCH:   /* branch instruction:              =
     */
>              /* We just stopped because of a branch. Go on */
>              break;
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 99ee1e09b2..9e38df685d 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -132,7 +132,6 @@ enum {
>      /* EOL                                                              =
     */
>      POWERPC_EXCP_NB       =3D 103,
>      /* QEMU exceptions: used internally during code translation         =
     */
> -    POWERPC_EXCP_STOP         =3D 0x200, /* stop translation            =
       */
>      POWERPC_EXCP_BRANCH       =3D 0x201, /* branch instruction          =
       */
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 060ef83bc0..f57b67be5f 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -369,13 +369,6 @@ static inline void gen_hvpriv_exception(DisasContext=
 *ctx, uint32_t error)
>      gen_exception_err(ctx, POWERPC_EXCP_HV_EMU, POWERPC_EXCP_PRIV | erro=
r);
>  }
> =20
> -/* Stop translation */
> -static inline void gen_stop_exception(DisasContext *ctx)
> -{
> -    gen_update_nip(ctx, ctx->base.pc_next);
> -    ctx->exception =3D POWERPC_EXCP_STOP;
> -}
> -
>  /***********************************************************************=
******/
>  /* SPR READ/WRITE CALLBACKS */
> =20
> @@ -829,7 +822,7 @@ void spr_write_hid0_601(DisasContext *ctx, int sprn, =
int gprn)
>  {
>      gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
>      /* Must stop the translation as endianness may have changed */
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  }
>  #endif
> =20
> @@ -877,7 +870,7 @@ void spr_write_40x_dbcr0(DisasContext *ctx, int sprn,=
 int gprn)
>      gen_store_spr(sprn, cpu_gpr[gprn]);
>      gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
>      /* We must stop translation as we may have rebooted */
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  }
> =20
>  void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
> @@ -4080,7 +4073,7 @@ static void gen_isync(DisasContext *ctx)
>          gen_check_tlb_flush(ctx, false);
>      }
>      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  }
> =20
>  #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))
> @@ -5312,7 +5305,7 @@ static void gen_mtmsrd(DisasContext *ctx)
>          gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
>      }
>      /* Must stop the translation as machine state (may have) changed */
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  #endif /* !defined(CONFIG_USER_ONLY) */
>  }
>  #endif /* defined(TARGET_PPC64) */
> @@ -5355,7 +5348,7 @@ static void gen_mtmsr(DisasContext *ctx)
>          tcg_temp_free(msr);
>      }
>      /* Must stop the translation as machine state (may have) changed */
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  #endif
>  }
> =20
> @@ -7492,7 +7485,7 @@ static void gen_wrtee(DisasContext *ctx)
>       * Stop translation to have a chance to raise an exception if we
>       * just set msr_ee to 1
>       */
> -    gen_stop_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -7506,7 +7499,7 @@ static void gen_wrteei(DisasContext *ctx)
>      if (ctx->opcode & 0x00008000) {
>          tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
>          /* Stop translation to have a chance to raise an exception */
> -        gen_stop_exception(ctx);
> +        ctx->base.is_jmp =3D DISAS_EXIT_UPDATE;
>      } else {
>          tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
>      }
> @@ -9128,9 +9121,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>          case POWERPC_EXCP_BRANCH:
>              ctx->base.is_jmp =3D DISAS_NORETURN;
>              break;
> -        case POWERPC_EXCP_STOP:
> -            ctx->base.is_jmp =3D DISAS_EXIT;
> -            break;
>          default:
>              /* Every other ctx->exception should have set NORETURN. */
>              g_assert_not_reached();

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BzOz3wUD9PXVkQXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjBvIACgkQbDjKyiDZ
s5IBRw//XnrcMjvNt9GpXqnbRWDNnH2wqTE0nqhhhTOjUjYpl1cmGBpi8Xn4K9Qo
nAVRhonEa0Hz0wIPUXmxh0qG8LL++q+howmP6NCa1bz3/V61BmszObxn7kOunqMu
P7Ai3RORddcL/NRVwr1DZF2TQI0xYLNlDs08qiFeHBWJVW6v7V9vmdZc44mSSBON
0FtH8vflcendCTpZMYg3LvNzJXrBE3lLz55HC2xkjB2Jwb9gWqSLcuJkATO/2P7K
nADrY0894HWtUXsNhLPrhp3iaNxCs7g/oUkyrkoa9clakNDBvNCwkZeqLEWIc1h5
LFFRy/ppnWPVLl+4x6e3BNXZqTmueqsws0+kS3W35P328W8xVjsjmHqd7XBkSSzE
IjOZ59vSK2C6W1TYmXBh0ECZXjjoKQMZorr2j9lB+JZ0LrhEN3N0Sjjc/RD0JHH8
26+NKKR+xPZlvhXyaZLTmnOQXmNePDdU7vUMBX8wD39h008A8IvMA6ld0e+LdqIi
gfprU+lcmlCjlqnf6II5Ly7cM/oDUlnJKdayf4BSADu+6i1Rpq07b3h7Oeem7OEO
S78UBlBLbn3AN+QKJzAX0MXNlTpRJft8irz+LiULPjoEQQrzhFl8X36cyGkztZ3T
B1wrUh4RmUrwyGULylviTBvm3RMFxmCzS+ZBI/o67fGD+qHFyn4=
=82Wm
-----END PGP SIGNATURE-----

--BzOz3wUD9PXVkQXr--

