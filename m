Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E64411D1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 02:33:26 +0100 (CET)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhMCT-0006hF-8Q
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 21:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM7G-0004Vx-Pa; Sun, 31 Oct 2021 21:28:02 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mhM76-0001kI-Pw; Sun, 31 Oct 2021 21:28:02 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HjFlM6b5cz4xcB; Mon,  1 Nov 2021 12:27:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635730063;
 bh=xPCe83OZyQnbHQuFKt9eBUCPaQ2038kwwIkkySEfht0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7UtRS6pQYeswruGlYaXcyD7uTODIeqYWrxxXCTKMiNIhKFx2R3oWBQTOQ4p+3Fng
 PWrPuYGXQzC0I8CN4mbTPVcHJxNvny+nlJGlkXFL7ThcdkRQ+TpxVeSLtPmiYlIR8E
 Zrkg2TU+zyShPVMD4iRcF3KcOOr8lsgcJE1Aa00o=
Date: Mon, 1 Nov 2021 11:20:47 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v2 11/34] target/ppc: Move vcfuged to vmx-impl.c.inc
Message-ID: <YX8y34EppQ6fSlFs@yekko>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-12-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L5cfUNHwbzgiqQmp"
Content-Disposition: inline
In-Reply-To: <20211029202424.175401-12-matheus.ferst@eldorado.org.br>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, groug@kaod.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L5cfUNHwbzgiqQmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2021 at 05:24:01PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> There's no reason to keep vector-impl.c.inc separate from
> vmx-impl.c.inc. Additionally, let GVec handle the multiple calls to
> helper_cfuged for us.
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

I'm afraid this doesn't apply clean to ppc-for-6.2 any more, though
I'm not sure why.

> ---
> v2:
> - vecop_list removed
> ---
>  target/ppc/helper.h                        |  2 +-
>  target/ppc/int_helper.c                    |  2 +-
>  target/ppc/translate.c                     |  1 -
>  target/ppc/translate/fixedpoint-impl.c.inc |  2 +-
>  target/ppc/translate/vector-impl.c.inc     | 48 ----------------------
>  target/ppc/translate/vmx-impl.c.inc        | 16 ++++++++
>  6 files changed, 19 insertions(+), 52 deletions(-)
>  delete mode 100644 target/ppc/translate/vector-impl.c.inc
>=20
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 72e66c5fe8..401575b935 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -46,7 +46,7 @@ DEF_HELPER_4(divwe, tl, env, tl, tl, i32)
>  DEF_HELPER_FLAGS_1(popcntb, TCG_CALL_NO_RWG_SE, tl, tl)
>  DEF_HELPER_FLAGS_2(cmpb, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_3(sraw, tl, env, tl, tl)
> -DEF_HELPER_FLAGS_2(cfuged, TCG_CALL_NO_RWG_SE, i64, i64, i64)
> +DEF_HELPER_FLAGS_2(CFUGED, TCG_CALL_NO_RWG_SE, i64, i64, i64)
>  #if defined(TARGET_PPC64)
>  DEF_HELPER_FLAGS_2(PDEPD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
>  DEF_HELPER_FLAGS_2(PEXTD, TCG_CALL_NO_RWG_SE, i64, i64, i64)
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 913d76be6e..f03c864e48 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -324,7 +324,7 @@ target_ulong helper_popcntb(target_ulong val)
>  }
>  #endif
> =20
> -uint64_t helper_cfuged(uint64_t src, uint64_t mask)
> +uint64_t helper_CFUGED(uint64_t src, uint64_t mask)
>  {
>      /*
>       * Instead of processing the mask bit-by-bit from the most significa=
nt to
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 659859ff5f..fc9d35a7a8 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7407,7 +7407,6 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D =
*d, arg_PLS_D *a)
>  #include "translate/vmx-impl.c.inc"
> =20
>  #include "translate/vsx-impl.c.inc"
> -#include "translate/vector-impl.c.inc"
> =20
>  #include "translate/dfp-impl.c.inc"
> =20
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 220b099fcd..fa519c2d3e 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -407,7 +407,7 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
>      REQUIRE_64BIT(ctx);
>      REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>  #if defined(TARGET_PPC64)
> -    gen_helper_cfuged(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
> +    gen_helper_CFUGED(cpu_gpr[a->ra], cpu_gpr[a->rt], cpu_gpr[a->rb]);
>  #else
>      qemu_build_not_reached();
>  #endif
> diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translat=
e/vector-impl.c.inc
> deleted file mode 100644
> index 197e903337..0000000000
> --- a/target/ppc/translate/vector-impl.c.inc
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -/*
> - * Power ISA decode for Vector Facility instructions
> - *
> - * Copyright (c) 2021 Instituto de Pesquisas Eldorado (eldorado.org.br)
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> - */
> -
> -static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
> -{
> -    TCGv_i64 tgt, src, mask;
> -
> -    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> -    REQUIRE_VECTOR(ctx);
> -
> -    tgt =3D tcg_temp_new_i64();
> -    src =3D tcg_temp_new_i64();
> -    mask =3D tcg_temp_new_i64();
> -
> -    /* centrifuge lower double word */
> -    get_cpu_vsrl(src, a->vra + 32);
> -    get_cpu_vsrl(mask, a->vrb + 32);
> -    gen_helper_cfuged(tgt, src, mask);
> -    set_cpu_vsrl(a->vrt + 32, tgt);
> -
> -    /* centrifuge higher double word */
> -    get_cpu_vsrh(src, a->vra + 32);
> -    get_cpu_vsrh(mask, a->vrb + 32);
> -    gen_helper_cfuged(tgt, src, mask);
> -    set_cpu_vsrh(a->vrt + 32, tgt);
> -
> -    tcg_temp_free_i64(tgt);
> -    tcg_temp_free_i64(src);
> -    tcg_temp_free_i64(mask);
> -
> -    return true;
> -}
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/v=
mx-impl.c.inc
> index 92b9527aff..e36c66589c 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1559,6 +1559,22 @@ GEN_VXFORM3(vpermxor, 22, 0xFF)
>  GEN_VXFORM_DUAL(vsldoi, PPC_ALTIVEC, PPC_NONE,
>                  vpermxor, PPC_NONE, PPC2_ALTIVEC_207)
> =20
> +static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
> +{
> +    static const GVecGen3 g =3D {
> +        .fni8 =3D gen_helper_CFUGED,
> +        .vece =3D MO_64,
> +    };
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
> +                   avr_full_offset(a->vrb), 16, 16, &g);
> +
> +    return true;
> +}
> +
>  #undef GEN_VR_LDX
>  #undef GEN_VR_STX
>  #undef GEN_VR_LVE

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--L5cfUNHwbzgiqQmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF/Mt8ACgkQbDjKyiDZ
s5JdtA//RUIQYg/aQrJkQI2qe9YxPJZZcndguqsreGRN3rluh0RrSVgnwOBEUz0S
I/VQbnlz0VgMT87J+7bcCFL2RHNddvoHQmzX40TjEfeNuKEfSsClE8EGwGr9lcjP
PgvuZxHNHv52FnwPiG9wStljs5pf1GnGhB0FbB+3L8yOA1DPZH4xQi55kfJyKP6j
AyX6d/auoT1A7+uD+ewzlZBSLLj6qYn3jH6DnRG4mwmcvvzE9UZKEnLCZQpfRsg6
6P1f61cqBOVYBTYCSJ1+Iki3aZ+edk/ZnRvyFvK1xrpHEAf/VH/xDaaXqyu5BtS1
2oSZmet/uX8pFcd8hoo7538MrpB0YkREt8R9L2ML2IxlUTRaZcoNyVGsODHlqsct
MHIdCEdLcAd2+guuT4A/U7F6UMqT0kbB4fZC7JI5SxGINeYHwpSESXSTLFTEduAh
4HsuKNF+/p04ElXNSFkiTBczL/moPDVOo2VwEMMkRs19Hvk5NbQIVraHwVKDY0UR
M5a6CDfpL/zhpZIO4WK8327dHK88K1E0jqDzjMZCbm5GwEqF61f5UZy91BlSYREt
in7GEZHeol41dgv8Lep7SB6I1iJIUOa9ApPARejT0fiK7bHKmMSpgfOXN942kDnu
qpgQzrFEltZCn11EZJVt690newe0cEt9VWJ9rkwtnWNYwlEtpB4=
=KaSi
-----END PGP SIGNATURE-----

--L5cfUNHwbzgiqQmp--

