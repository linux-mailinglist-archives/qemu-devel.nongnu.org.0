Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E84337F25A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 06:36:28 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh35H-00055R-Jq
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 00:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sf-0007O4-V2; Thu, 13 May 2021 00:23:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lh2sc-0004fb-96; Thu, 13 May 2021 00:23:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fgdms6zCJz9t2g; Thu, 13 May 2021 14:22:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620879773;
 bh=AwBzzYGrvnpGTSWSS3MnqEog5rXa68AMRbz+ulQRFlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUE9hgqJWSnQEYHG1l2hcT3ucRfKnCX/0qK+cEvrNrIba+D2FbWybWznDlUDPkwpa
 EshQ071Z16vTCxCfuMhT5aHm5jAo98k2FYW5Vt5EZmpmp1kvubTipQ15MFBcBI5ErJ
 XgYjuxFBucMSREk4cBkW7wDKuXOEfdIoly1apLjw=
Date: Thu, 13 May 2021 14:11:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v4 08/31] target/ppc: Replace POWERPC_EXCP_SYNC with
 DISAS_EXIT
Message-ID: <YJym5zdD6xC6bxdb@yekko>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-9-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6VO/VasY2Ntiv71G"
Content-Disposition: inline
In-Reply-To: <20210512185441.3619828-9-matheus.ferst@eldorado.org.br>
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


--6VO/VasY2Ntiv71G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 03:54:18PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Remove the synthetic "exception" after no more uses.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/cpu.h       |  1 -
>  target/ppc/translate.c | 27 +++++++++------------------
>  2 files changed, 9 insertions(+), 19 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 98fcf1c4d6..503de6db85 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -135,7 +135,6 @@ enum {
>      POWERPC_EXCP_STOP         =3D 0x200, /* stop translation            =
       */
>      POWERPC_EXCP_BRANCH       =3D 0x201, /* branch instruction          =
       */
>      /* QEMU exceptions: special cases we want to stop translation       =
     */
> -    POWERPC_EXCP_SYNC         =3D 0x202, /* context synchronizing instru=
ction  */
>      POWERPC_EXCP_SYSCALL_USER =3D 0x203, /* System call in user mode onl=
y      */
>  };
> =20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 4bebb00bb2..88fe24ef95 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -359,14 +359,6 @@ static inline void gen_stop_exception(DisasContext *=
ctx)
>      ctx->exception =3D POWERPC_EXCP_STOP;
>  }
> =20
> -#ifndef CONFIG_USER_ONLY
> -/* No need to update nip here, as execution flow will change */
> -static inline void gen_sync_exception(DisasContext *ctx)
> -{
> -    ctx->exception =3D POWERPC_EXCP_SYNC;
> -}
> -#endif
> -
>  /***********************************************************************=
******/
>  /* SPR READ/WRITE CALLBACKS */
> =20
> @@ -5035,7 +5027,7 @@ static void gen_rfi(DisasContext *ctx)
>      }
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfi(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif
>  }
> =20
> @@ -5052,7 +5044,7 @@ static void gen_rfid(DisasContext *ctx)
>      }
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfid(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif
>  }
> =20
> @@ -5069,7 +5061,7 @@ static void gen_rfscv(DisasContext *ctx)
>      }
>      gen_update_cfar(ctx, ctx->cia);
>      gen_helper_rfscv(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif
>  }
>  #endif
> @@ -5082,7 +5074,7 @@ static void gen_hrfid(DisasContext *ctx)
>      /* Restore CPU state */
>      CHK_HV;
>      gen_helper_hrfid(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif
>  }
>  #endif
> @@ -6923,7 +6915,7 @@ static void gen_rfsvc(DisasContext *ctx)
>      CHK_SV;
> =20
>      gen_helper_rfsvc(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -7303,7 +7295,7 @@ static void gen_rfci_40x(DisasContext *ctx)
>      CHK_SV;
>      /* Restore CPU state */
>      gen_helper_40x_rfci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -7315,7 +7307,7 @@ static void gen_rfci(DisasContext *ctx)
>      CHK_SV;
>      /* Restore CPU state */
>      gen_helper_rfci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -7330,7 +7322,7 @@ static void gen_rfdi(DisasContext *ctx)
>      CHK_SV;
>      /* Restore CPU state */
>      gen_helper_rfdi(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -7343,7 +7335,7 @@ static void gen_rfmci(DisasContext *ctx)
>      CHK_SV;
>      /* Restore CPU state */
>      gen_helper_rfmci(cpu_env);
> -    gen_sync_exception(ctx);
> +    ctx->base.is_jmp =3D DISAS_EXIT;
>  #endif /* defined(CONFIG_USER_ONLY) */
>  }
> =20
> @@ -9429,7 +9421,6 @@ static void ppc_tr_translate_insn(DisasContextBase =
*dcbase, CPUState *cs)
>          case POWERPC_EXCP_BRANCH:
>              ctx->base.is_jmp =3D DISAS_NORETURN;
>              break;
> -        case POWERPC_EXCP_SYNC:
>          case POWERPC_EXCP_STOP:
>              ctx->base.is_jmp =3D DISAS_EXIT;
>              break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6VO/VasY2Ntiv71G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCcpucACgkQbDjKyiDZ
s5Lddw//aezgik1la7Fy9W0Q9t8hLYNaHEtf/mAGxTNZopZrCw+ysHSniTa7MUom
MfvDvZFaSWYFBKMAlOnW6hEikvroq9nf6jLVL03nPjjvGazkdi3lx20BR9R5T0qZ
XnxpDh8PSzIaBDjUbY8sG6T8ZaIl381pNEGNV2LMNr6u01CTy32p9AwMKM6t+q0C
FDJAdBmU5b7VloBNVmfNDpj2zYJBays3P4KfIatZc8F3B/b/BVftDxNtxyc+1AQO
QpPdVUxB6HOvuo9Y0DEIXHsWcyrK961fEt9dxYXaYHNiB9d4srW81hwmPpnbA+kJ
yymIJ4dV2eKoLXVjEWxQ1btO/y2lgEEVAK+TQmv1CoeshZaEDNl3Qz37FQaAcKjf
qdHbAPo1ETRZ/MZzZDVi1UpPsGQCT7/kfFa95FKuczWFQxKlYTUlQSMPlwsRdonP
YxLJfJuRdMEAaOU8jNslqAbMShfcCfn8OA85130h6Jmz9bsw/CAvQGURfFKf4hLz
Oc+LDPktktG10n9OKpwPCLQxOBnEONlNEhQy81U61zVeKrklpqMPoDBwkPGUJ7CZ
zLWByVOGeJqUi4l9Vx9AAf8SDRRY+ftREnPnKoUAZMASFTbr7PgPBp1zLaRYbsaw
kXijOn0+3k534z4BzGsUCfCB4njh/TI8mlzZycqQ/7YAjcWc+S4=
=eR0o
-----END PGP SIGNATURE-----

--6VO/VasY2Ntiv71G--

