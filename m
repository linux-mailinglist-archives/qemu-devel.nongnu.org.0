Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32073386FA5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:52:45 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lioua-0001av-8n
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeT-00078E-VA; Mon, 17 May 2021 21:36:05 -0400
Received: from ozlabs.org ([203.11.71.1]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeR-0007Gg-IW; Mon, 17 May 2021 21:36:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqk0sHPz9t14; Tue, 18 May 2021 11:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301746;
 bh=D+TAgbNp+2C/v1ddZZvhbafLX1EOASocsTcr0wXqbLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jDgEUwmdedkBI4GGH4lO3fnsoLiTRU+UMAMsChEEU71swqpWKqu9m1iYimKLVLY5Z
 YnbdUv+gXGjw1ULJM13IEPzbTRsBJINq6dnNfhbAt982v3FRfWBrUDyqqEGSAd6e1l
 oSKbfrOgbbXrGl69ZhGy/YaVmRU3pkR5bL8OJt84=
Date: Tue, 18 May 2021 10:56:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
Message-ID: <YKMQxPTeLbt6dzLx@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rK7S1fxhNNbX4PS/"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
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


--rK7S1fxhNNbX4PS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:25PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn32.decode                   | 14 ++++++
>  target/ppc/translate.c                     | 52 ----------------------
>  target/ppc/translate/fixedpoint-impl.c.inc | 31 +++++++++++++
>  3 files changed, 45 insertions(+), 52 deletions(-)
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 93e5d44d9e..9fd8d6b817 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -20,6 +20,10 @@
>  &D              rt ra si:int64_t
>  @D              ...... rt:5 ra:5 si:s16                 &D
> =20
> +&D_bf           bf l:bool ra imm
> +@D_bfs          ...... bf:3 - l:1 ra:5 imm:s16          &D_bf
> +@D_bfu          ...... bf:3 - l:1 ra:5 imm:16           &D_bf
> +
>  %ds_si          2:s14  !function=3Dtimes_4
>  @DS             ...... rt:5 ra:5 .............. ..      &D si=3D%ds_si
> =20
> @@ -36,6 +40,9 @@
>  &X_bi           rt bi
>  @X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
> =20
> +&X_bfl          bf l:bool ra rb
> +@X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
> +
>  ### Fixed-Point Load Instructions
> =20
>  LBZ             100010 ..... ..... ................     @D
> @@ -89,6 +96,13 @@ STDU            111110 ..... ..... ..............01   =
  @DS
>  STDX            011111 ..... ..... ..... 0010010101 -   @X
>  STDUX           011111 ..... ..... ..... 0010110101 -   @X
> =20
> +### Fixed-Point Compare Instructions
> +
> +CMP             011111 ... - . ..... ..... 0000000000 - @X_bfl
> +CMPL            011111 ... - . ..... ..... 0000100000 - @X_bfl
> +CMPI            001011 ... - . ..... ................   @D_bfs
> +CMPLI           001010 ... - . ..... ................   @D_bfu
> +
>  ### Fixed-Point Arithmetic Instructions
> =20
>  ADDI            001110 ..... ..... ................     @D
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index aef01af396..3fe58d0386 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1575,54 +1575,6 @@ static inline void gen_set_Rc0(DisasContext *ctx, =
TCGv reg)
>      }
>  }
> =20
> -/* cmp */
> -static void gen_cmp(DisasContext *ctx)
> -{
> -    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
> -        gen_op_cmp(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
> -                   1, crfD(ctx->opcode));
> -    } else {
> -        gen_op_cmp32(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
> -                     1, crfD(ctx->opcode));
> -    }
> -}
> -
> -/* cmpi */
> -static void gen_cmpi(DisasContext *ctx)
> -{
> -    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
> -        gen_op_cmpi(cpu_gpr[rA(ctx->opcode)], SIMM(ctx->opcode),
> -                    1, crfD(ctx->opcode));
> -    } else {
> -        gen_op_cmpi32(cpu_gpr[rA(ctx->opcode)], SIMM(ctx->opcode),
> -                      1, crfD(ctx->opcode));
> -    }
> -}
> -
> -/* cmpl */
> -static void gen_cmpl(DisasContext *ctx)
> -{
> -    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
> -        gen_op_cmp(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
> -                   0, crfD(ctx->opcode));
> -    } else {
> -        gen_op_cmp32(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)],
> -                     0, crfD(ctx->opcode));
> -    }
> -}
> -
> -/* cmpli */
> -static void gen_cmpli(DisasContext *ctx)
> -{
> -    if ((ctx->opcode & 0x00200000) && (ctx->insns_flags & PPC_64B)) {
> -        gen_op_cmpi(cpu_gpr[rA(ctx->opcode)], UIMM(ctx->opcode),
> -                    0, crfD(ctx->opcode));
> -    } else {
> -        gen_op_cmpi32(cpu_gpr[rA(ctx->opcode)], UIMM(ctx->opcode),
> -                      0, crfD(ctx->opcode));
> -    }
> -}
> -
>  /* cmprb - range comparison: isupper, isaplha, islower*/
>  static void gen_cmprb(DisasContext *ctx)
>  {
> @@ -7725,10 +7677,6 @@ GEN_HANDLER_E(brw, 0x1F, 0x1B, 0x04, 0x0000F801, P=
PC_NONE, PPC2_ISA310),
>  GEN_HANDLER_E(brh, 0x1F, 0x1B, 0x06, 0x0000F801, PPC_NONE, PPC2_ISA310),
>  #endif
>  GEN_HANDLER(invalid, 0x00, 0x00, 0x00, 0xFFFFFFFF, PPC_NONE),
> -GEN_HANDLER(cmp, 0x1F, 0x00, 0x00, 0x00400000, PPC_INTEGER),
> -GEN_HANDLER(cmpi, 0x0B, 0xFF, 0xFF, 0x00400000, PPC_INTEGER),
> -GEN_HANDLER(cmpl, 0x1F, 0x00, 0x01, 0x00400001, PPC_INTEGER),
> -GEN_HANDLER(cmpli, 0x0A, 0xFF, 0xFF, 0x00400000, PPC_INTEGER),
>  #if defined(TARGET_PPC64)
>  GEN_HANDLER_E(cmpeqb, 0x1F, 0x00, 0x07, 0x00600000, PPC_NONE, PPC2_ISA30=
0),
>  #endif
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index 4f257a931c..49c8993333 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -165,6 +165,37 @@ TRANS64(STDU, do_ldst_D, true, true, MO_Q)
>  TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
>  TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
> =20
> +/*
> + * Fixed-Point Compare Instructions
> + */
> +
> +static bool do_cmp_X(DisasContext *ctx, arg_X_bfl *a, bool s)
> +{
> +    REQUIRE_INSNS_FLAGS(ctx, INTEGER);
> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
> +        gen_op_cmp(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> +    } else {
> +        gen_op_cmp32(cpu_gpr[a->ra], cpu_gpr[a->rb], s, a->bf);
> +    }
> +    return true;
> +}
> +
> +static bool do_cmp_D(DisasContext *ctx, arg_D_bf *a, bool s)
> +{
> +    REQUIRE_INSNS_FLAGS(ctx, INTEGER);
> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
> +        gen_op_cmp(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
> +    } else {
> +        gen_op_cmp32(cpu_gpr[a->ra], tcg_constant_tl(a->imm), s, a->bf);
> +    }
> +    return true;
> +}
> +
> +TRANS(CMP, do_cmp_X, true);
> +TRANS(CMPL, do_cmp_X, false);
> +TRANS(CMPI, do_cmp_D, true);
> +TRANS(CMPLI, do_cmp_D, false);
> +
>  /*
>   * Fixed-Point Arithmetic Instructions
>   */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rK7S1fxhNNbX4PS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjEMQACgkQbDjKyiDZ
s5IX7Q/9HogoVIQJpM32XbA1WftTG1j2ya9U8ZduuqwSc56p9GauiO2Wpm9OTpGY
4zCjjIlwftWakKakilifoxQoJ9+ghW42h89pnsLVcNHe9tMZfbEEjk/FOJfZ+zn9
QYhuJH+1cTu1WH6Fuf8KFES1gIuOJknjYbbqRVbv2M6/7hWxQDdM4od287GCv0CI
49REykHalVjYBvcFm4qVjiCswgWGUv+oBfDRtatmqaSFDBRaFFbZKbgnkhJLRnrN
3/KTcVAdM5aobM8c+iPQY7/AEt/509AQWmM7HWezLK/9g4xvLoUa7yKknYbHJZ6u
n7Kllh3q5jOUp0M91jRt2inaviV8pzU2ZNrDVlDmVrZpT09dvKoryh+fnDAJ+Ugw
lkcEXdXYCvrwd6XEpbtr7HzMVtfzuUAnU4JFRL3qGutVirkLtKhji6hu7vYL6fIw
V/FYwzNBJoAJeDN3JSRPpVmQDgypH/Tsu6QtWpTDVhGH2CSPZ/FZcDjdHr3BdQ0v
xJ7nZk6AO5m6bYTrIbs61fpbgqWa/wcVKprqjISo7hji6lvbPEVbuDqyObhWx3m1
tn9FW8QJw9CCQV/g2+ADzYWcf/t7K0e6asZz8BbF3ctYp4iJRm9JzuolwXGm0At2
4Yt97jzBxguFpZxhkregY+1owL8EwYCb8S5qEOaYZVmH30Xxhvk=
=Ci34
-----END PGP SIGNATURE-----

--rK7S1fxhNNbX4PS/--

