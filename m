Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2039386F9F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:51:19 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liotD-0005iW-1h
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeS-00076u-Qz; Mon, 17 May 2021 21:36:05 -0400
Received: from ozlabs.org ([203.11.71.1]:57103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeQ-0007Fq-UB; Mon, 17 May 2021 21:36:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqj55q3z9t10; Tue, 18 May 2021 11:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301745;
 bh=w+7Ol4v5XRzeZoBJvW3V/aD9j+J2tMyPewgH6+pvCxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O2OrfWiO4+Ruijwmbv4ZqFFbEEYGajAz8mUDrAZitjR2RcaoCKAMICcF6bNMN9Ym1
 e4pj080GMYQtRvbPyxn/cZ30/uVkYakuIWifNMiypiL4LHRRgQcVg/n6lFRFXhT6cE
 xJ4DIMiOQTwajYfzt83bn6uy+KJUIYJ+yYm5fKfc=
Date: Tue, 18 May 2021 10:53:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 22/23] target/ppc: Move addpcis to decodetree
Message-ID: <YKMQFscUBFRJItc2@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-23-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cRjAc5j82rc2qVfa"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-23-matheus.ferst@eldorado.org.br>
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


--cRjAc5j82rc2qVfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:24PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn32.decode                   | 6 ++++++
>  target/ppc/translate.c                     | 9 ---------
>  target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++++
>  3 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 77edf407ab..93e5d44d9e 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -23,6 +23,10 @@
>  %ds_si          2:s14  !function=3Dtimes_4
>  @DS             ...... rt:5 ra:5 .............. ..      &D si=3D%ds_si
> =20
> +&DX             rt d
> +%dx_d           6:s10 16:5 0:1
> +@DX             ...... rt:5  ..... .......... ..... .   &DX d=3D%dx_d
> +
>  &VX             vrt vra vrb
>  @VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
> =20
> @@ -90,6 +94,8 @@ STDUX           011111 ..... ..... ..... 0010110101 -  =
 @X
>  ADDI            001110 ..... ..... ................     @D
>  ADDIS           001111 ..... ..... ................     @D
> =20
> +ADDPCIS         010011 ..... ..... .......... 00010 .   @DX
> +
>  ## Fixed-Point Logical Instructions
> =20
>  CFUGED          011111 ..... ..... ..... 0011011100 -   @X
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index f56ed5866e..aef01af396 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1865,14 +1865,6 @@ static void gen_addic_(DisasContext *ctx)
>      gen_op_addic(ctx, 1);
>  }
> =20
> -/* addpcis */
> -static void gen_addpcis(DisasContext *ctx)
> -{
> -    target_long d =3D DX(ctx->opcode);
> -
> -    tcg_gen_movi_tl(cpu_gpr[rD(ctx->opcode)], ctx->base.pc_next + (d << =
16));
> -}
> -
>  static inline void gen_op_arith_divw(DisasContext *ctx, TCGv ret, TCGv a=
rg1,
>                                       TCGv arg2, int sign, int compute_ov)
>  {
> @@ -7745,7 +7737,6 @@ GEN_HANDLER_E(cmprb, 0x1F, 0x00, 0x06, 0x00400001, =
PPC_NONE, PPC2_ISA300),
>  GEN_HANDLER(isel, 0x1F, 0x0F, 0xFF, 0x00000001, PPC_ISEL),
>  GEN_HANDLER(addic, 0x0C, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
>  GEN_HANDLER2(addic_, "addic.", 0x0D, 0xFF, 0xFF, 0x00000000, PPC_INTEGER=
),
> -GEN_HANDLER_E(addpcis, 0x13, 0x2, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA30=
0),
>  GEN_HANDLER(mulhw, 0x1F, 0x0B, 0x02, 0x00000400, PPC_INTEGER),
>  GEN_HANDLER(mulhwu, 0x1F, 0x0B, 0x00, 0x00000400, PPC_INTEGER),
>  GEN_HANDLER(mullw, 0x1F, 0x0B, 0x07, 0x00000000, PPC_INTEGER),
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 4038143efb..4f257a931c 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -194,6 +194,13 @@ static bool trans_ADDIS(DisasContext *ctx, arg_D *a)
>      return trans_ADDI(ctx, a);
>  }
> =20
> +static bool trans_ADDPCIS(DisasContext *ctx, arg_DX *a)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    tcg_gen_movi_tl(cpu_gpr[a->rt], ctx->base.pc_next + (a->d<<16));
> +    return true;
> +}
> +
>  static bool trans_INVALID(DisasContext *ctx, arg_INVALID *a)
>  {
>      gen_invalid(ctx);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cRjAc5j82rc2qVfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjEBYACgkQbDjKyiDZ
s5IEVxAAveR6kdYavfuK8uGBEx/4Zmpv33yjyVg+U0yRLSMiGcgjvHZhIOcrIfRy
yIRGeu9q5O2hR0tLCscjAqgIeGDvmPRua88R+Jjcz+umAYYZtS0OXR/poN5i1otX
5C16Tmshqr+1DnlqLa+iXLjNrBK19oMOCtjB6lWRcv0KNt42GvH62n4j8+guOyUK
m8keRM3peXFOkm9dSaarPUjsGJHd184DQUv0dbDV26e3lSHEV0tBwqp+LSwXXT9l
vYMxPyj8BPacqXFdPh+cF9NxsJ3lyprrT9rbNpyu4AyPVQKUwhO5qXtwOe+H4QOH
YG3EHWacEGK18RPiEmwLMYG7/bV5RWUG8GVztcLHk5tt8q+3mST1bwtliTEzEeL0
i3naApLv4jvCJv7lBja8li+EYsr0ZcKTVxwd3sLjITeWBR0GOEWMZrfgE0aO76QF
LhMz4WdT3n9dHda51Q3nim9BwcPsGE/SSEOpJaHVrf3xnH+LqrMIQftwjZB5RAav
tSAxVkq+x2siApBmBrwpf22m65aI6AoMj4ebSDhxIsZfT5jo2Mp+fy3L4VPveJbn
h14s1HDuSr91QbuElXrTGYtkiXBNcyj8FDUVyis9SDlV0l7hllEql/nKotxziW0U
/uzZPj+azDDzhFP+sZzMRmgUwPWNAsgH8CuZorEc31X3aYyfuiw=
=G243
-----END PGP SIGNATURE-----

--cRjAc5j82rc2qVfa--

