Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A353FB0C0
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:16:17 +0200 (CEST)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZeV-00065z-2m
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZbk-0003rY-U9
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:13:20 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZbg-0006HY-Cl
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:13:20 -0400
Received: by mail-il1-x131.google.com with SMTP id b4so14729255ilr.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iF61IIstO1X88hOSjEZXeaUC8qeFuykG/YqYnZ3rVbU=;
 b=eM/OO+GPhW3PjaszW5+QLDpRBcFLbVNfJBU3VQyu0CZEXcPUJUEWtTda5kT0mASa6s
 jT0FGdhY2IYJ0+aZ+gr+C7s2P3BZX8fD0nvPmLpaEzq/jxW90qd2G/sH7NFtVEis73GW
 FXnl5NvdPwaB10s+rD2csIHxf5fhtGb+5KsZ19rRShQXK0GM0DnMG1SSXdUOOapDUG4x
 Z6qPVxLmqiEr35cy0vObKbE+itzVbNDyW4LpeSLNdjn6zE13DEed1tTxaLqQJogHvOJ0
 V2iXVvqc6aERZaABdItt32SKCoEfUlhiqPTah8JYWFfk8LDrMfPipDeEg/SeFZ8pSVxA
 1lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iF61IIstO1X88hOSjEZXeaUC8qeFuykG/YqYnZ3rVbU=;
 b=sqIGnzY+G/yu/TWZ8sG32aRNmak120n/nFoI/rHn4ec9iKmuVXNHDlF1LHWvsGkyUO
 qtT6ezbsYKnirb1zLUmSgXm/hd97HilMrTMc92OZL26ujei+WXvIOuWuHpz6wWfBiGsz
 hB3j7vR6a2+0Tuu9GxBkWzCD4M0vxcI5zxjICiYNkqwaNZ5HdYnHoUl5HXbCLWhpcn/7
 vz9eWcbHfTlEtfzvZZuKRBv+rA/J2kFefyJEpB0UAs52wg70QwA/etF7l66v28aW0kWo
 U+TT26PrM8gBxetKnv95RLmq2hUcFQ+OV6WHdqBYi4JhZLOEwe69oAFEc+Eqtc6XxxgL
 ah5g==
X-Gm-Message-State: AOAM532rVFjFw0OUHrpa2I1iakhTSPr2nOavmsn3AI8FL5DOcEf/NWn3
 vIDB0qIjqayUG4Z6Di4fBNOFy4l5ZL7uJ/D1mts=
X-Google-Smtp-Source: ABdhPJy44/2xEZXzVGxN+rYmA+hmydMGzuFEmGPdaDQyMPd8jp7fJBL9Zf9hWnBY9o2jrU9U8hq1qFVjKRvYfZLCpLw=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr14740873ilj.227.1630300394910; 
 Sun, 29 Aug 2021 22:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-9-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-9-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:12:47 +1000
Message-ID: <CAKmqyKO3em_sj+FVsNr6jHwYLsZ19LKJAGKKy0nngPywE5CbNA@mail.gmail.com>
Subject: Re: [PATCH v6 08/14] target/riscv: Reassign instructions to the
 Zbb-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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

On Thu, Aug 26, 2021 at 3:11 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> This reassigns the instructions that are part of Zbb into it, with the
> notable exceptions of the instructions (rev8, zext.w and orc.b) that
> changed due to gorci, grevi and pack not being part of Zb[abcs].
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
>   are now in a separate commit.
>
>  target/riscv/insn32.decode              | 40 ++++++++++----------
>  target/riscv/insn_trans/trans_rvb.c.inc | 50 ++++++++++++++-----------
>  2 files changed, 49 insertions(+), 41 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 04711111c8..faa56836d8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -671,45 +671,47 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
>  sh3add_uw  0010000 .......... 110 ..... 0111011 @r
>  slli_uw    00001 ............ 001 ..... 0011011 @sh
>
> -# *** RV32B Standard Extension ***
> +# *** RV32 Zbb Standard Extension ***
> +andn       0100000 .......... 111 ..... 0110011 @r
>  clz        011000 000000 ..... 001 ..... 0010011 @r2
> -ctz        011000 000001 ..... 001 ..... 0010011 @r2
>  cpop       011000 000010 ..... 001 ..... 0010011 @r2
> +ctz        011000 000001 ..... 001 ..... 0010011 @r2
> +max        0000101 .......... 110 ..... 0110011 @r
> +maxu       0000101 .......... 111 ..... 0110011 @r
> +min        0000101 .......... 100 ..... 0110011 @r
> +minu       0000101 .......... 101 ..... 0110011 @r
> +orn        0100000 .......... 110 ..... 0110011 @r
> +rol        0110000 .......... 001 ..... 0110011 @r
> +ror        0110000 .......... 101 ..... 0110011 @r
> +rori       01100 ............ 101 ..... 0010011 @sh
>  sext_b     011000 000100 ..... 001 ..... 0010011 @r2
>  sext_h     011000 000101 ..... 001 ..... 0010011 @r2
> -
> -andn       0100000 .......... 111 ..... 0110011 @r
> -orn        0100000 .......... 110 ..... 0110011 @r
>  xnor       0100000 .......... 100 ..... 0110011 @r
> +
> +# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
> +clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> +ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> +cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> +rolw       0110000 .......... 001 ..... 0111011 @r
> +roriw      0110000 .......... 101 ..... 0011011 @sh5
> +rorw       0110000 .......... 101 ..... 0111011 @r
> +
> +# *** RV32B Standard Extension ***
>  pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
> -min        0000101 .......... 100 ..... 0110011 @r
> -minu       0000101 .......... 101 ..... 0110011 @r
> -max        0000101 .......... 110 ..... 0110011 @r
> -maxu       0000101 .......... 111 ..... 0110011 @r
> -ror        0110000 .......... 101 ..... 0110011 @r
> -rol        0110000 .......... 001 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
>  gorc       0010100 .......... 101 ..... 0110011 @r
>
> -rori       01100. ........... 101 ..... 0010011 @sh
>  grevi      01101. ........... 101 ..... 0010011 @sh
>  gorci      00101. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
> -clzw       0110000 00000 ..... 001 ..... 0011011 @r2
> -ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
> -cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
> -
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
> -rorw       0110000 .......... 101 ..... 0111011 @r
> -rolw       0110000 .......... 001 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
>  gorcw      0010100 .......... 101 ..... 0111011 @r
>
> -roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 6a3e0c6a09..03b3724c96 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the Zb[acs] Standard Extension.
> + * RISC-V translation routines for the Zb[abcs] Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> @@ -24,6 +24,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBB(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_ZBC(ctx) do {                    \
>      if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
>          return false;                            \
> @@ -38,37 +44,37 @@
>
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, gen_clz);
>  }
>
>  static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, gen_ctz);
>  }
>
>  static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, tcg_gen_ctpop_tl);
>  }
>
>  static bool trans_andn(DisasContext *ctx, arg_andn *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_andc_tl);
>  }
>
>  static bool trans_orn(DisasContext *ctx, arg_orn *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_orc_tl);
>  }
>
>  static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_eqv_tl);
>  }
>
> @@ -92,37 +98,37 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
>
>  static bool trans_min(DisasContext *ctx, arg_min *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_smin_tl);
>  }
>
>  static bool trans_max(DisasContext *ctx, arg_max *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_smax_tl);
>  }
>
>  static bool trans_minu(DisasContext *ctx, arg_minu *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_umin_tl);
>  }
>
>  static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_arith(ctx, a, tcg_gen_umax_tl);
>  }
>
>  static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, tcg_gen_ext8s_tl);
>  }
>
>  static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, tcg_gen_ext16s_tl);
>  }
>
> @@ -176,19 +182,19 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>
>  static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shift(ctx, a, tcg_gen_rotr_tl);
>  }
>
>  static bool trans_rori(DisasContext *ctx, arg_rori *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shifti(ctx, a, tcg_gen_rotr_tl);
>  }
>
>  static bool trans_rol(DisasContext *ctx, arg_rol *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shift(ctx, a, tcg_gen_rotl_tl);
>  }
>
> @@ -235,21 +241,21 @@ GEN_TRANS_SHADD(3)
>  static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, gen_clzw);
>  }
>
>  static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, gen_ctzw);
>  }
>
>  static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_unary(ctx, a, gen_cpopw);
>  }
>
> @@ -270,21 +276,21 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shiftw(ctx, a, gen_rorw);
>  }
>
>  static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shiftiw(ctx, a, gen_rorw);
>  }
>
>  static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
>  {
>      REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBB(ctx);
>      return gen_shiftw(ctx, a, gen_rolw);
>  }
>
> --
> 2.25.1
>
>

