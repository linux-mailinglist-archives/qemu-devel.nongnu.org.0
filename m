Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAE3FB0C6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:19:59 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZi0-0002Bj-Ro
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZgl-0001Jy-NL
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:18:31 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZgi-00028Z-VJ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:18:31 -0400
Received: by mail-io1-xd2e.google.com with SMTP id y18so18360443ioc.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=15Fx89/JAVYdTTF8iWqooFZDEMwHKCvrgEAzVoFahJ8=;
 b=BoWu+2Ymk1dY6QaDE1RMxwQmvks9YVTSsA6Hf3OLKnmoAKv1U0MO8iAXq1z/KJd5Hp
 U93P+8dat+16+QG1dSGTj568wUikl7hA1bo07WPuB6TEraygyTtY1oLYS7aZaivtI5lo
 W+tlLLCn7V1YkpO693/3lbXzrdZhtzy5UgdBGvjWAiEi2jsCdAkhe5YENi5hHilRKUJM
 kHt6CsgtURwbCTnhErHjEve+c132461oSrPeBDZ5l9mY5kQ3L3bZj2vsiRD42r9IfcXi
 d1yz0zVZkeS+Jtsj158wDdCOSSK28FtmKSryszo/ueiEXQ/JbUrnNN8QwSWIsVkpbjPi
 6o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=15Fx89/JAVYdTTF8iWqooFZDEMwHKCvrgEAzVoFahJ8=;
 b=M/rkDb369CMripjlz+bvHJMtm3YS9r1aP+dcF9Wih2gcpo+cHD0FFP//6aAE3d1lIy
 tQTw+uFDwjfmzH8C0orcem7dTeLubU0yVrI4MIaF9KW497KY1Xv/juH2888y8OOc0FN3
 g7kkun0Q9uy/0XyJZL/ShzkCH4Tb2hfHd55zVhdyj/zhKkXyNkMJ7RT4EguRkUYOyRHI
 l1WOH/kSj8QvRbWTFTN5ZT20qaQs4dXaVwIQdB+jvX6M7Q7HJTi3evSutRhMODkmbWE8
 XZEBl6lDdEFNc3X2h7uLuqGtO7qquWgot3lMvMfXOhKdBEE4xcs/wI+qBGn0HDjU4+7B
 uprA==
X-Gm-Message-State: AOAM533falaivZt4Fo8YXGtBQ6qF5pumthZlt0dLql5DGokXrFJE679t
 gEDoCQUKCuV94z4uyliRs6TUeBzSKYx/n889FZI=
X-Google-Smtp-Source: ABdhPJybMe9pusPn/1i6Z69EskGgx1kyMWx836F8dODX76w/GEWivP1h19zaTZKoT+cn0zXPnkt3ozZCwsLLAuBZJHs=
X-Received: by 2002:a05:6638:2182:: with SMTP id
 s2mr2702724jaj.26.1630300707851; 
 Sun, 29 Aug 2021 22:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-12-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-12-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:18:01 +1000
Message-ID: <CAKmqyKMumShAou47P465eOA0PkbrDT7CjFpOB_+5EsRMUhqJgg@mail.gmail.com>
Subject: Re: [PATCH v6 11/14] target/riscv: Add rev8 instruction,
 removing grev/grevi
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 3:13 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The 1.0.0 version of Zbb does not contain grev/grevi.  Instead, a
> rev8 instruction (equivalent to the rev8 pseudo-instruction built on
> grevi from pre-0.93 draft-B) is available.
>
> This commit adds the new rev8 instruction and removes grev/grevi.
>
> Note that there is no W-form of this instruction (both a
> sign-extending and zero-extending 32-bit version can easily be
> synthesized by following rev8 with either a srai or srli instruction
> on RV64) and that the opcode encodings for rev8 in RV32 and RV64 are
> different.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v4)
>
> Changes in v4:
> - reorder trans_rev8* functions to be sequential
> - rename rev8 to rev8_32 in decoder
>
> Changes in v3:
> - rev8-addition & grevi*-removal moved to a separate commit
>
>  target/riscv/bitmanip_helper.c          | 40 -------------------------
>  target/riscv/helper.h                   |  2 --
>  target/riscv/insn32.decode              | 12 ++++----
>  target/riscv/insn_trans/trans_rvb.c.inc | 34 ++++++---------------
>  target/riscv/translate.c                | 28 -----------------
>  5 files changed, 16 insertions(+), 100 deletions(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index bb48388fcd..f1b5e5549f 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -24,46 +24,6 @@
>  #include "exec/helper-proto.h"
>  #include "tcg/tcg.h"
>
> -static const uint64_t adjacent_masks[] = {
> -    dup_const(MO_8, 0x55),
> -    dup_const(MO_8, 0x33),
> -    dup_const(MO_8, 0x0f),
> -    dup_const(MO_16, 0xff),
> -    dup_const(MO_32, 0xffff),
> -    UINT32_MAX
> -};
> -
> -static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
> -{
> -    return ((x & mask) << shift) | ((x & ~mask) >> shift);
> -}
> -
> -static target_ulong do_grev(target_ulong rs1,
> -                            target_ulong rs2,
> -                            int bits)
> -{
> -    target_ulong x = rs1;
> -    int i, shift;
> -
> -    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
> -        if (rs2 & shift) {
> -            x = do_swap(x, adjacent_masks[i], shift);
> -        }
> -    }
> -
> -    return x;
> -}
> -
> -target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_grev(rs1, rs2, TARGET_LONG_BITS);
> -}
> -
> -target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_grev(rs1, rs2, 32);
> -}
> -
>  target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
>  {
>      target_ulong result = 0;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 80561e8866..ae2e94542c 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -59,8 +59,6 @@ DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>
>  /* Bitmanip */
> -DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 8bcb602455..017eb50a49 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -682,6 +682,9 @@ min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
>  orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>  orn        0100000 .......... 110 ..... 0110011 @r
> +# The encoding for rev8 differs between RV32 and RV64.
> +# rev8_32 denotes the RV32 variant.
> +rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
>  rol        0110000 .......... 001 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
>  rori       01100 ............ 101 ..... 0010011 @sh
> @@ -693,6 +696,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
>  ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
>  cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> +# The encoding for rev8 differs between RV32 and RV64.
> +# When executing on RV64, the encoding used in RV32 is an illegal
> +# instruction, so we use different handler functions to differentiate.
> +rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
>  rolw       0110000 .......... 001 ..... 0111011 @r
>  roriw      0110000 .......... 101 ..... 0011011 @sh5
>  rorw       0110000 .......... 101 ..... 0111011 @r
> @@ -701,15 +708,10 @@ rorw       0110000 .......... 101 ..... 0111011 @r
>  pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
> -grev       0110100 .......... 101 ..... 0110011 @r
> -grevi      01101. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
> -grevw      0110100 .......... 101 ..... 0111011 @r
> -
> -greviw     0110100 .......... 101 ..... 0011011 @sh5
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index f3b85ca189..b283c1dccf 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -198,23 +198,21 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
>      return gen_shift(ctx, a, tcg_gen_rotl_tl);
>  }
>
> -static bool trans_grev(DisasContext *ctx, arg_grev *a)
> +static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, gen_helper_grev);
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
>  }
>
> -static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
> +static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
> -    return gen_grevi(ctx, a);
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
>  }
>
> +
>  static void gen_orc_b(TCGv ret, TCGv source1)
>  {
>      TCGv  tmp = tcg_temp_new();
> @@ -306,20 +304,6 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>      return gen_shiftw(ctx, a, gen_rolw);
>  }
>
> -static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_grevw);
> -}
> -
> -static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_grevw);
> -}
> -
>  #define GEN_TRANS_SHADD_UW(SHAMT)                             \
>  static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
>                                      arg_sh##SHAMT##add_uw *a) \
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index aabdd44663..f16ac8bb1a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -601,28 +601,6 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
>      tcg_gen_andi_tl(ret, ret, 1);
>  }
>
> -static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
> -{
> -    TCGv source1 = tcg_temp_new();
> -    TCGv source2;
> -
> -    gen_get_gpr(source1, a->rs1);
> -
> -    if (a->shamt == (TARGET_LONG_BITS - 8)) {
> -        /* rev8, byte swaps */
> -        tcg_gen_bswap_tl(source1, source1);
> -    } else {
> -        source2 = tcg_temp_new();
> -        tcg_gen_movi_tl(source2, a->shamt);
> -        gen_helper_grev(source1, source1, source2);
> -        tcg_temp_free(source2);
> -    }
> -
> -    gen_set_gpr(a->rd, source1);
> -    tcg_temp_free(source1);
> -    return true;
> -}
> -
>  #define GEN_SHADD(SHAMT)                                       \
>  static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
>  {                                                              \
> @@ -710,12 +688,6 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
>      tcg_temp_free_i32(t2);
>  }
>
> -static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    gen_helper_grev(ret, arg1, arg2);
> -}
> -
>  #define GEN_SHADD_UW(SHAMT)                                       \
>  static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
>  {                                                                 \
> --
> 2.25.1
>
>

