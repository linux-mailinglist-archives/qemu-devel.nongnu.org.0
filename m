Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EA3FB0C7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:25:15 +0200 (CEST)
Received: from localhost ([::1]:41924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZnG-0003yK-JW
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZly-0003Ik-6w
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:23:54 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZlu-0006bh-Ry
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:23:53 -0400
Received: by mail-il1-x130.google.com with SMTP id b4so14746517ilr.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FN9rt2Xy8NyQxCXxn6EKALkqpJJArFaEtCHepqQv5LI=;
 b=ZlNqYMyh7koG7MFNbUl8hcEuECKoGpbf3bgvuzRF9bd094PM1IYKKRhXQOBwqqHDE5
 kGgwMIBwQNSHny+u6DrqtYmDekvdKIhJUyn6VkaU3SaRTrj0Xvk18f3rv1Ij4Q495u/7
 S5X0FoOjy49NhgK28rYjlR2NINXfG45uP/WGj2OYn189hApiMiKbV8nbOBz3gCeKpdNa
 BGvZf8Ncjm7CACtxikYC09J4Qz6LSN8s0oHKk/PcrcO4PG5lKJBjWGjZ31P9BxRcK0jK
 bBAfZQuIQKFjL1M95rXRvHWz8T8hR5GU8uITTHtO998wuRX/igyZd3TRlM3Gua09QF+Z
 RXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FN9rt2Xy8NyQxCXxn6EKALkqpJJArFaEtCHepqQv5LI=;
 b=g/jodCvrAnDGnkvLbbO0hVxw3eK7jF6r2hHCmc9RGoZ2oRHnJhcWFrSftkzvGMPs3q
 vz2vWXLV48/nNvPZOy8ZOGyP9Rkp3qNLmYx19juAUe5xl9f99KLYPIPam+GleTxbt4z3
 rZGNVZA3JQhrXDniA0Nq+mvl88ErgdYRY5mOHb8zEkFnOJek/c25ezaPIjOb/fg2h/N1
 yITjP0z7tvlwTZHdJjg8iG9jTDoYi//TYNRbA8zzQY9dWrJ2RBcv2RV2Vk0o3B4Oy6Su
 i+m/wuSUzME/+t9wgCxv/SsyQAK7NPuonHy+MVSJYvYYbopKIhro6t6SSdmjMFwCfaLO
 uRiQ==
X-Gm-Message-State: AOAM5309YVGIGJlANISgvFzWuVb07EtHlD/gbjy2LAOST20mGCD96afI
 Oiof6ZeJfNUKEd5S7EABkUdzy6PinlSP7N8VKHIcT7D2XM105o6U
X-Google-Smtp-Source: ABdhPJx9woxCJqaNBd3Qs/qSrU69GokU3NAcSxXYGWRvysoNiIq8N4h9NIaDeKpJ3snssfOJg+IZpwQsyY0O8yy/KvY=
X-Received: by 2002:a92:d3cf:: with SMTP id c15mr14952952ilh.131.1630301028788; 
 Sun, 29 Aug 2021 22:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-13-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-13-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:23:22 +1000
Message-ID: <CAKmqyKM0P6Eu3vG_hR3K+Vv1jotp5_gv=cNom_npZ+Y7-9rM1w@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] target/riscv: Add zext.h instructions to Zbb,
 removing pack/packu/packh
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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

On Thu, Aug 26, 2021 at 3:14 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The 1.0.0 version of Zbb does not contain pack/packu/packh. However, a
> zext.h instruction is provided (built on pack/packh from pre-0.93
> draft-B) is available.
>
> This commit adds zext.h and removes the pack* instructions.
>
> Note that the encodings for zext.h are different between RV32 and
> RV64, which is handled through REQUIRE_32BIT.
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
> - Renamed RV32 variant to zext_h_32.
> - Reordered trans_zext_h_{32,64} to be next to each other.
>
> Changes in v3:
> - Moved zext.h-addition & pack*-removal to a separate commit.
>
>  target/riscv/insn32.decode              | 12 ++++---
>  target/riscv/insn_trans/trans_rvb.c.inc | 46 ++++++++-----------------
>  target/riscv/translate.c                | 40 ---------------------
>  3 files changed, 21 insertions(+), 77 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 017eb50a49..abf794095a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -691,6 +691,9 @@ rori       01100 ............ 101 ..... 0010011 @sh
>  sext_b     011000 000100 ..... 001 ..... 0010011 @r2
>  sext_h     011000 000101 ..... 001 ..... 0010011 @r2
>  xnor       0100000 .......... 100 ..... 0110011 @r
> +# The encoding for zext.h differs between RV32 and RV64.
> +# zext_h_32 denotes the RV32 variant.
> +zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
>
>  # *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
>  clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> @@ -703,15 +706,14 @@ rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
>  rolw       0110000 .......... 001 ..... 0111011 @r
>  roriw      0110000 .......... 101 ..... 0011011 @sh5
>  rorw       0110000 .......... 101 ..... 0111011 @r
> +# The encoding for zext.h differs between RV32 and RV64.
> +# When executing on RV64, the encoding used in RV32 is an illegal
> +# instruction, so we use different handler functions to differentiate.
> +zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
>
>  # *** RV32B Standard Extension ***
> -pack       0000100 .......... 100 ..... 0110011 @r
> -packu      0100100 .......... 100 ..... 0110011 @r
> -packh      0000100 .......... 111 ..... 0110011 @r
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
> -packw      0000100 .......... 100 ..... 0111011 @r
> -packuw     0100100 .......... 100 ..... 0111011 @r
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index b283c1dccf..4949fb6fdb 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -78,24 +78,6 @@ static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
>      return gen_arith(ctx, a, tcg_gen_eqv_tl);
>  }
>
> -static bool trans_pack(DisasContext *ctx, arg_pack *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_arith(ctx, a, gen_pack);
> -}
> -
> -static bool trans_packu(DisasContext *ctx, arg_packu *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_arith(ctx, a, gen_packu);
> -}
> -
> -static bool trans_packh(DisasContext *ctx, arg_packh *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_arith(ctx, a, gen_packh);
> -}
> -
>  static bool trans_min(DisasContext *ctx, arg_min *a)
>  {
>      REQUIRE_ZBB(ctx);
> @@ -236,6 +218,20 @@ static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
>      return gen_unary(ctx, a, &gen_orc_b);
>  }
>
> +static bool trans_zext_h_32(DisasContext *ctx, arg_zext_h_32 *a)
> +{
> +    REQUIRE_32BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
> +}
> +
> +static bool trans_zext_h_64(DisasContext *ctx, arg_zext_h_64 *a)
> +{
> +    REQUIRE_64BIT(ctx);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &tcg_gen_ext16u_tl);
> +}
> +
>
>  #define GEN_TRANS_SHADD(SHAMT)                                             \
>  static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
> @@ -269,20 +265,6 @@ static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>      return gen_unary(ctx, a, gen_cpopw);
>  }
>
> -static bool trans_packw(DisasContext *ctx, arg_packw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_arith(ctx, a, gen_packw);
> -}
> -
> -static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_arith(ctx, a, gen_packuw);
> -}
> -
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f16ac8bb1a..639f34b8f6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -536,29 +536,6 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
>      return true;
>  }
>
> -static void gen_pack(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_deposit_tl(ret, arg1, arg2,
> -                       TARGET_LONG_BITS / 2,
> -                       TARGET_LONG_BITS / 2);
> -}
> -
> -static void gen_packu(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_shri_tl(t, arg1, TARGET_LONG_BITS / 2);
> -    tcg_gen_deposit_tl(ret, arg2, t, 0, TARGET_LONG_BITS / 2);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_packh(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_ext8u_tl(t, arg2);
> -    tcg_gen_deposit_tl(ret, arg1, t, 8, TARGET_LONG_BITS - 8);
> -    tcg_temp_free(t);
> -}
> -
>  static void gen_sbop_mask(TCGv ret, TCGv shamt)
>  {
>      tcg_gen_movi_tl(ret, 1);
> @@ -635,23 +612,6 @@ static void gen_cpopw(TCGv ret, TCGv arg1)
>      tcg_gen_ctpop_tl(ret, arg1);
>  }
>
> -static void gen_packw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_ext16s_tl(t, arg2);
> -    tcg_gen_deposit_tl(ret, arg1, t, 16, 48);
> -    tcg_temp_free(t);
> -}
> -
> -static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    TCGv t = tcg_temp_new();
> -    tcg_gen_shri_tl(t, arg1, 16);
> -    tcg_gen_deposit_tl(ret, arg2, t, 0, 16);
> -    tcg_gen_ext32s_tl(ret, ret);
> -    tcg_temp_free(t);
> -}
> -
>  static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
>  {
>      TCGv_i32 t1 = tcg_temp_new_i32();
> --
> 2.25.1
>
>

