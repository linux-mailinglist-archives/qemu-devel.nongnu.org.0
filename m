Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C02386F99
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 03:49:21 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liorI-0000tG-2M
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 21:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeQ-00074H-Ap; Mon, 17 May 2021 21:36:04 -0400
Received: from ozlabs.org ([203.11.71.1]:48145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lioeM-00078G-B2; Mon, 17 May 2021 21:36:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fkdqf2qKJz9sj5; Tue, 18 May 2021 11:35:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621301742;
 bh=dLOyiNx6CSVxDUjhxefcLwO4xe1fY/XYkc88aIS2+mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f7W0Hy4Li0olvt0MG+ldFrikmjFvTbZlq7Vuftuvcz5aBAaY1BaD53wr5NKTb7idh
 8Zj71AuTkrDSBA+K998F8zh4uOmbceTVqbtXHp5/BxSC7UXa0BcuNqDQ+PAOwcsYWL
 +kLx/v8OLckwMb7NvdGnSnZJGJEGEWVgZ1lx4XP0=
Date: Tue, 18 May 2021 10:44:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v5 15/23] target/ppc: Move D/DS/X-form integer loads to
 decodetree
Message-ID: <YKMN0D2gHljYwZ4V@yekko>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-16-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9nBf97meM9KE35Fs"
Content-Disposition: inline
In-Reply-To: <20210517205025.3777947-16-matheus.ferst@eldorado.org.br>
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


--9nBf97meM9KE35Fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:50:17PM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> These are all connected by macros in the legacy decoding.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>

Applied to ppc-for-6.1, thanks.

> ---
>  target/ppc/insn32.decode                   |  37 ++++++
>  target/ppc/translate.c                     | 147 ++++-----------------
>  target/ppc/translate/fixedpoint-impl.c.inc |  89 +++++++++++++
>  3 files changed, 150 insertions(+), 123 deletions(-)
>=20
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index e7c062d8b4..70f64c235b 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -20,6 +20,43 @@
>  &D              rt ra si:int64_t
>  @D              ...... rt:5 ra:5 si:s16                 &D
> =20
> +%ds_si          2:s14  !function=3Dtimes_4
> +@DS             ...... rt:5 ra:5 .............. ..      &D si=3D%ds_si
> +
> +&X              rt ra rb
> +@X              ...... rt:5 ra:5 rb:5 .......... .      &X
> +
> +### Fixed-Point Load Instructions
> +
> +LBZ             100010 ..... ..... ................     @D
> +LBZU            100011 ..... ..... ................     @D
> +LBZX            011111 ..... ..... ..... 0001010111 -   @X
> +LBZUX           011111 ..... ..... ..... 0001110111 -   @X
> +
> +LHZ             101000 ..... ..... ................     @D
> +LHZU            101001 ..... ..... ................     @D
> +LHZX            011111 ..... ..... ..... 0100010111 -   @X
> +LHZUX           011111 ..... ..... ..... 0100110111 -   @X
> +
> +LHA             101010 ..... ..... ................     @D
> +LHAU            101011 ..... ..... ................     @D
> +LHAX            011111 ..... ..... ..... 0101010111 -   @X
> +LHAXU           011111 ..... ..... ..... 0101110111 -   @X
> +
> +LWZ             100000 ..... ..... ................     @D
> +LWZU            100001 ..... ..... ................     @D
> +LWZX            011111 ..... ..... ..... 0000010111 -   @X
> +LWZUX           011111 ..... ..... ..... 0000110111 -   @X
> +
> +LWA             111010 ..... ..... ..............10     @DS
> +LWAX            011111 ..... ..... ..... 0101010101 -   @X
> +LWAUX           011111 ..... ..... ..... 0101110101 -   @X
> +
> +LD              111010 ..... ..... ..............00     @DS
> +LDU             111010 ..... ..... ..............01     @DS
> +LDX             011111 ..... ..... ..... 0000010101 -   @X
> +LDUX            011111 ..... ..... ..... 0000110101 -   @X
> +
>  ### Fixed-Point Arithmetic Instructions
> =20
>  ADDI            001110 ..... ..... ................     @D
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 5bf9001141..e037efcfe1 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3409,54 +3409,6 @@ GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
>  GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_Q))
>  #endif
> =20
> -#define GEN_LD(name, ldop, opc, type)                                   =
      \
> -static void glue(gen_, name)(DisasContext *ctx)                         =
      \
> -{                                                                       =
      \
> -    TCGv EA;                                                            =
      \
> -    gen_set_access_type(ctx, ACCESS_INT);                               =
      \
> -    EA =3D tcg_temp_new();                                              =
        \
> -    gen_addr_imm_index(ctx, EA, 0);                                     =
      \
> -    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                 =
      \
> -    tcg_temp_free(EA);                                                  =
      \
> -}
> -
> -#define GEN_LDU(name, ldop, opc, type)                                  =
      \
> -static void glue(gen_, name##u)(DisasContext *ctx)                      =
      \
> -{                                                                       =
      \
> -    TCGv EA;                                                            =
      \
> -    if (unlikely(rA(ctx->opcode) =3D=3D 0 ||                            =
          \
> -                 rA(ctx->opcode) =3D=3D rD(ctx->opcode))) {             =
          \
> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);             =
      \
> -        return;                                                         =
      \
> -    }                                                                   =
      \
> -    gen_set_access_type(ctx, ACCESS_INT);                               =
      \
> -    EA =3D tcg_temp_new();                                              =
        \
> -    if (type =3D=3D PPC_64B)                                            =
          \
> -        gen_addr_imm_index(ctx, EA, 0x03);                              =
      \
> -    else                                                                =
      \
> -        gen_addr_imm_index(ctx, EA, 0);                                 =
      \
> -    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                 =
      \
> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                       =
      \
> -    tcg_temp_free(EA);                                                  =
      \
> -}
> -
> -#define GEN_LDUX(name, ldop, opc2, opc3, type)                          =
      \
> -static void glue(gen_, name##ux)(DisasContext *ctx)                     =
      \
> -{                                                                       =
      \
> -    TCGv EA;                                                            =
      \
> -    if (unlikely(rA(ctx->opcode) =3D=3D 0 ||                            =
          \
> -                 rA(ctx->opcode) =3D=3D rD(ctx->opcode))) {             =
          \
> -        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);             =
      \
> -        return;                                                         =
      \
> -    }                                                                   =
      \
> -    gen_set_access_type(ctx, ACCESS_INT);                               =
      \
> -    EA =3D tcg_temp_new();                                              =
        \
> -    gen_addr_reg_index(ctx, EA);                                        =
      \
> -    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                 =
      \
> -    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                       =
      \
> -    tcg_temp_free(EA);                                                  =
      \
> -}
> -
>  #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)             =
      \
>  static void glue(gen_, name##x)(DisasContext *ctx)                      =
      \
>  {                                                                       =
      \
> @@ -3475,21 +3427,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)=
                            \
>  #define GEN_LDX_HVRM(name, ldop, opc2, opc3, type)                      =
      \
>      GEN_LDX_E(name, ldop, opc2, opc3, type, PPC_NONE, CHK_HVRM)
> =20
> -#define GEN_LDS(name, ldop, op, type)                                   =
      \
> -GEN_LD(name, ldop, op | 0x20, type);                                    =
      \
> -GEN_LDU(name, ldop, op | 0x21, type);                                   =
      \
> -GEN_LDUX(name, ldop, 0x17, op | 0x01, type);                            =
      \
> -GEN_LDX(name, ldop, 0x17, op | 0x00, type)
> -
> -/* lbz lbzu lbzux lbzx */
> -GEN_LDS(lbz, ld8u, 0x02, PPC_INTEGER);
> -/* lha lhau lhaux lhax */
> -GEN_LDS(lha, ld16s, 0x0A, PPC_INTEGER);
> -/* lhz lhzu lhzux lhzx */
> -GEN_LDS(lhz, ld16u, 0x08, PPC_INTEGER);
> -/* lwz lwzu lwzux lwzx */
> -GEN_LDS(lwz, ld32u, 0x00, PPC_INTEGER);
> -
>  #define GEN_LDEPX(name, ldop, opc2, opc3)                               =
      \
>  static void glue(gen_, name##epx)(DisasContext *ctx)                    =
      \
>  {                                                                       =
      \
> @@ -3510,47 +3447,12 @@ GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
>  #endif
> =20
>  #if defined(TARGET_PPC64)
> -/* lwaux */
> -GEN_LDUX(lwa, ld32s, 0x15, 0x0B, PPC_64B);
> -/* lwax */
> -GEN_LDX(lwa, ld32s, 0x15, 0x0A, PPC_64B);
> -/* ldux */
> -GEN_LDUX(ld, ld64_i64, 0x15, 0x01, PPC_64B);
> -/* ldx */
> -GEN_LDX(ld, ld64_i64, 0x15, 0x00, PPC_64B);
> -
>  /* CI load/store variants */
>  GEN_LDX_HVRM(ldcix, ld64_i64, 0x15, 0x1b, PPC_CILDST)
>  GEN_LDX_HVRM(lwzcix, ld32u, 0x15, 0x15, PPC_CILDST)
>  GEN_LDX_HVRM(lhzcix, ld16u, 0x15, 0x19, PPC_CILDST)
>  GEN_LDX_HVRM(lbzcix, ld8u, 0x15, 0x1a, PPC_CILDST)
> =20
> -static void gen_ld(DisasContext *ctx)
> -{
> -    TCGv EA;
> -    if (Rc(ctx->opcode)) {
> -        if (unlikely(rA(ctx->opcode) =3D=3D 0 ||
> -                     rA(ctx->opcode) =3D=3D rD(ctx->opcode))) {
> -            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
> -            return;
> -        }
> -    }
> -    gen_set_access_type(ctx, ACCESS_INT);
> -    EA =3D tcg_temp_new();
> -    gen_addr_imm_index(ctx, EA, 0x03);
> -    if (ctx->opcode & 0x02) {
> -        /* lwa (lwau is undefined) */
> -        gen_qemu_ld32s(ctx, cpu_gpr[rD(ctx->opcode)], EA);
> -    } else {
> -        /* ld - ldu */
> -        gen_qemu_ld64_i64(ctx, cpu_gpr[rD(ctx->opcode)], EA);
> -    }
> -    if (Rc(ctx->opcode)) {
> -        tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);
> -    }
> -    tcg_temp_free(EA);
> -}
> -
>  /* lq */
>  static void gen_lq(DisasContext *ctx)
>  {
> @@ -7723,6 +7625,14 @@ static inline void set_avr64(int regno, TCGv_i64 s=
rc, bool high)
>      tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
>  }
> =20
> +/*
> + * Helpers for decodetree used by !function for decoding arguments.
> + */
> +static int times_4(DisasContext *ctx, int x)
> +{
> +    return x * 4;
> +}
> +
>  /*
>   * Helpers for trans_* functions to check for specific insns flags.
>   * Use token pasting to ensure that we use the proper flag with the
> @@ -7749,6 +7659,21 @@ static inline void set_avr64(int regno, TCGv_i64 s=
rc, bool high)
>  # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
>  #endif
> =20
> +/*
> + * Helpers for implementing sets of trans_* functions.
> + * Defer the implementation of NAME to FUNC, with optional extra argumen=
ts.
> + */
> +#define TRANS(NAME, FUNC, ...) \
> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
> +    { return FUNC(ctx, a, __VA_ARGS__); }
> +
> +#define TRANS64(NAME, FUNC, ...) \
> +    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
> +    { REQUIRE_64BIT(ctx); return FUNC(ctx, a, __VA_ARGS__); }
> +
> +/* TODO: More TRANS* helpers for extra insn_flags checks. */
> +
> +
>  #include "decode-insn32.c.inc"
>  #include "decode-insn64.c.inc"
>  #include "translate/fixedpoint-impl.c.inc"
> @@ -7933,7 +7858,6 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0=
x1B, 0x00000000,
>                 PPC_NONE, PPC2_ISA300),
>  #endif
>  #if defined(TARGET_PPC64)
> -GEN_HANDLER(ld, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_64B),
>  GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
>  GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
>  #endif
> @@ -8299,34 +8223,11 @@ GEN_PPC64_R2(rldcr, 0x1E, 0x09),
>  GEN_PPC64_R4(rldimi, 0x1E, 0x06),
>  #endif
> =20
> -#undef GEN_LD
> -#undef GEN_LDU
> -#undef GEN_LDUX
>  #undef GEN_LDX_E
> -#undef GEN_LDS
> -#define GEN_LD(name, ldop, opc, type)                                   =
      \
> -GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
> -#define GEN_LDU(name, ldop, opc, type)                                  =
      \
> -GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
> -#define GEN_LDUX(name, ldop, opc2, opc3, type)                          =
      \
> -GEN_HANDLER(name##ux, 0x1F, opc2, opc3, 0x00000001, type),
>  #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)             =
      \
>  GEN_HANDLER_E(name##x, 0x1F, opc2, opc3, 0x00000001, type, type2),
> -#define GEN_LDS(name, ldop, op, type)                                   =
      \
> -GEN_LD(name, ldop, op | 0x20, type)                                     =
      \
> -GEN_LDU(name, ldop, op | 0x21, type)                                    =
      \
> -GEN_LDUX(name, ldop, 0x17, op | 0x01, type)                             =
      \
> -GEN_LDX(name, ldop, 0x17, op | 0x00, type)
> -
> -GEN_LDS(lbz, ld8u, 0x02, PPC_INTEGER)
> -GEN_LDS(lha, ld16s, 0x0A, PPC_INTEGER)
> -GEN_LDS(lhz, ld16u, 0x08, PPC_INTEGER)
> -GEN_LDS(lwz, ld32u, 0x00, PPC_INTEGER)
> +
>  #if defined(TARGET_PPC64)
> -GEN_LDUX(lwa, ld32s, 0x15, 0x0B, PPC_64B)
> -GEN_LDX(lwa, ld32s, 0x15, 0x0A, PPC_64B)
> -GEN_LDUX(ld, ld64_i64, 0x15, 0x01, PPC_64B)
> -GEN_LDX(ld, ld64_i64, 0x15, 0x00, PPC_64B)
>  GEN_LDX_E(ldbr, ld64ur_i64, 0x14, 0x10, PPC_NONE, PPC2_DBRX, CHK_NONE)
> =20
>  /* HV/P7 and later only */
> diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/tran=
slate/fixedpoint-impl.c.inc
> index ce034a14a7..6140dd41ca 100644
> --- a/target/ppc/translate/fixedpoint-impl.c.inc
> +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> @@ -36,6 +36,95 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d,=
 arg_PLS_D *a)
>      return true;
>  }
> =20
> +/*
> + * Fixed-Point Load/Store Instructions
> + */
> +
> +static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool =
update,
> +                    bool store, MemOp mop)
> +{
> +    TCGv ea;
> +
> +    if (update && (ra =3D=3D 0 || (!store && ra =3D=3D rt))) {
> +        gen_invalid(ctx);
> +        return true;
> +    }
> +    gen_set_access_type(ctx, ACCESS_INT);
> +
> +    ea =3D tcg_temp_new();
> +    if (ra) {
> +        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
> +    } else {
> +        tcg_gen_mov_tl(ea, displ);
> +    }
> +    if (NARROW_MODE(ctx)) {
> +        tcg_gen_ext32u_tl(ea, ea);
> +    }
> +    mop ^=3D ctx->default_tcg_memop_mask;
> +    if (store) {
> +        tcg_gen_qemu_st_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
> +    } else {
> +        tcg_gen_qemu_ld_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
> +    }
> +    if (update) {
> +        tcg_gen_mov_tl(cpu_gpr[ra], ea);
> +    }
> +    tcg_temp_free(ea);
> +
> +    return true;
> +}
> +
> +static bool do_ldst_D(DisasContext *ctx, arg_D *a, bool update, bool sto=
re,
> +                      MemOp mop)
> +{
> +    return do_ldst(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, st=
ore, mop);
> +}
> +
> +static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
> +                      bool store, MemOp mop)
> +{
> +    return do_ldst(ctx, a->rt, a->ra, cpu_gpr[a->rb], update, store, mop=
);
> +}
> +
> +/* Load Byte and Zero */
> +TRANS(LBZ, do_ldst_D, false, false, MO_UB)
> +TRANS(LBZX, do_ldst_X, false, false, MO_UB)
> +TRANS(LBZU, do_ldst_D, true, false, MO_UB)
> +TRANS(LBZUX, do_ldst_X, true, false, MO_UB)
> +
> +/* Load Halfword and Zero */
> +TRANS(LHZ, do_ldst_D, false, false, MO_UW)
> +TRANS(LHZX, do_ldst_X, false, false, MO_UW)
> +TRANS(LHZU, do_ldst_D, true, false, MO_UW)
> +TRANS(LHZUX, do_ldst_X, true, false, MO_UW)
> +
> +/* Load Halfword Algebraic */
> +TRANS(LHA, do_ldst_D, false, false, MO_SW)
> +TRANS(LHAX, do_ldst_X, false, false, MO_SW)
> +TRANS(LHAU, do_ldst_D, true, false, MO_SW)
> +TRANS(LHAXU, do_ldst_X, true, false, MO_SW)
> +
> +/* Load Word and Zero */
> +TRANS(LWZ, do_ldst_D, false, false, MO_UL)
> +TRANS(LWZX, do_ldst_X, false, false, MO_UL)
> +TRANS(LWZU, do_ldst_D, true, false, MO_UL)
> +TRANS(LWZUX, do_ldst_X, true, false, MO_UL)
> +
> +/* Load Word Algebraic */
> +TRANS64(LWA, do_ldst_D, false, false, MO_SL)
> +TRANS64(LWAX, do_ldst_X, false, false, MO_SL)
> +TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
> +
> +/* Load Doubleword */
> +TRANS64(LD, do_ldst_D, false, false, MO_Q)
> +TRANS64(LDX, do_ldst_X, false, false, MO_Q)
> +TRANS64(LDU, do_ldst_D, true, false, MO_Q)
> +TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
> +
> +/*
> + * Fixed-Point Arithmetic Instructions
> + */
> +
>  static bool trans_ADDI(DisasContext *ctx, arg_D *a)
>  {
>      if (a->ra) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9nBf97meM9KE35Fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCjDdAACgkQbDjKyiDZ
s5JAgRAAiAPp2qY6PbOgXcfzBSA1zSd3QO4x+5/d5flaAdsvow65laEIsC5Kd2FY
mdD6Zdz20us7gfI6eiT8wTvJAnk9EJaasMNvVhtw5gMWnSTTVnwA/nvHnq7u+MX8
/MmHZd6o/5bCbB02VFORVTUAB4qd9R5ixMBValFCS6tb7DQXmJPKmAykR6uqPZZy
kVA4cZ0Hi5zl5qkBisS3YdhhrxDhDwa8qdgZSy4dtGlzC9+nzUXr2ey/kVPaTj0Y
egIvSkDXGKXcH96UckVkuHVmQA8ME94hhFYSYh/7gHW8vZjjjlOfJD9QhzTYNPei
IX8VyU6Ve5f09gy4p0gxsjBpfYtlRYuoFjT8o3LfG1JpMV5u4YGKYvTYgpPqofKo
KJ/t/uPAMVYpWho/LIZSNqO0uuzePX0/6WyMckE+CRcpXtyNmXLt/YEVJtjzUaC8
LrN413A/v67fwZUbFKiwfA6DKjVr0s2xobWd5Pw88wN9QilwZ+upCIoe5INdC7EB
rMt5q8+3H4mH9DgdETYHhnbFae22ZEtyNL6DZECPUbge4I+JJA0WT996G0zttQz3
Jku5ioEs0yXDXiwkbSZZVgkF1Nl0bYviRdOmTiSjApl55jHVrRRUWskVQiAIfLS/
Dt0T1DwnLAk/jlMTRcLST7bLUNxpivdCXC4e16jKZf94LHFdqWc=
=uoa5
-----END PGP SIGNATURE-----

--9nBf97meM9KE35Fs--

