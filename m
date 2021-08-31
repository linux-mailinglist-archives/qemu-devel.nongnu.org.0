Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988003FBFBF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 02:24:50 +0200 (CEST)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKra5-0006yf-LV
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 20:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKrXP-0005b2-AZ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 20:22:03 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKrXM-0006dD-SA
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 20:22:03 -0400
Received: by mail-il1-x131.google.com with SMTP id y3so18223507ilm.6
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 17:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OrfC+DpHjxH45XhG15fId8jg6+0jQkUY0FZ9LjbFl1Y=;
 b=p5ES3phlw64T6OkneVubGDSOYubkEUXc7KYeLjr6eY63goIcRQGknvrmvsurMHIfN5
 wKSV7Z/Ogr8s6wgx8Z819VTrUIjXcSfm02325D+tnujwQL9HBYcB2PfIN7vUESWvWLkx
 aJvYbiiSbc+1Ou4UA1TPMJVkDkovX7fNv0a8MqZ6+KD9LSxCHm0DWXiY/8yw45vrUNDh
 lHRaL23h/C0R2J7ziHbB2RWB9CIMIyAPtkfc0e34rjg589SbAKP2BXICf2BBL9x9XdTm
 GOnk7MzCANnBmfrQwaIaStmh16TU9HuJpdRnu9OQ4viXLJ9mxdk5dwKYB0poasrDoCUA
 RD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OrfC+DpHjxH45XhG15fId8jg6+0jQkUY0FZ9LjbFl1Y=;
 b=JAvb619JFuuwrlpsCTmJD5XmOdoHU1+8uUhgEyeIaoZusVD26w+iVsysyNY6pi/Acx
 KQN0NBYtlpichaoSNxWjNwa3cRzZPTRcDdRZHTG46k1gBhi0VdlkWhEhd9WwLZE5LRIY
 z7sK7vFu9zmVvwSijN5fXpnNvnXYhGuRRdoFVCzEqdrc74wSLy9SiStAwcAYOp4WhT64
 1sTBQ36GmYcy7TX5k8FOv6WQUYM/GCg8FMnkJQemaEPZe5QKeId6RJm4Gctrqq+F0l2c
 gu0jLh9HWdWo7N16phnw07w95Wv0ZDlyKgWmQ8+0kI+7IxJkCwE+7XuIfknJolTMK39F
 RuWg==
X-Gm-Message-State: AOAM530XJ8cayhpZk5hmX+iWW7qQzCSKAQC85yEWFdAafPjMFJKqvWN9
 FYN7p3C9Dvy4Q6d1ZxIHobCjY2S4vPzD/SnDzzAOgE+6TCzMMKv/
X-Google-Smtp-Source: ABdhPJzoXnkR+dlt2H3KgkQW5ImedQKLNF4RHYa6V8/HnqmuFMsypjkIXGIYJp0MycAy4A4e9t3xnsHzK244Ucg4JQ8=
X-Received: by 2002:a92:8707:: with SMTP id m7mr18414239ild.177.1630369319042; 
 Mon, 30 Aug 2021 17:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
 <20210830111511.1905048-10-philipp.tomsich@vrull.eu>
In-Reply-To: <20210830111511.1905048-10-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Aug 2021 10:21:32 +1000
Message-ID: <CAKmqyKOJRnLVr3sjYY+Vpzmn164mzQfPUNeOd8q=Z36mV3L5pg@mail.gmail.com>
Subject: Re: [PATCH v7 09/14] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
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

On Mon, Aug 30, 2021 at 9:19 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> gorci from pre-0.93 draft-B) is available, mainly targeting
> string-processing workloads.
>
> This commit adds the new orc.b instruction and removed gorc/gorci.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v7:
> - Free TCG temporary in gen_orc_b().
>
> Changes in v6:
> - Fixed orc.b (now passes SPEC w/ optimized string functions) by
>   adding the missing final negation.
>
> Changes in v4:
> - Change orc.b to implementation suggested by Richard Henderson
>
> Changes in v3:
> - Moved orc.b and gorc/gorci changes into separate commit.
> - Using the simpler orc.b implementation suggested by Richard Henderson
>
>  target/riscv/bitmanip_helper.c          | 26 ----------------
>  target/riscv/helper.h                   |  2 --
>  target/riscv/insn32.decode              |  6 +---
>  target/riscv/insn_trans/trans_rvb.c.inc | 40 ++++++++++++-------------
>  target/riscv/translate.c                |  6 ----
>  5 files changed, 21 insertions(+), 59 deletions(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index 73be5a81c7..bb48388fcd 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
>      return do_grev(rs1, rs2, 32);
>  }
>
> -static target_ulong do_gorc(target_ulong rs1,
> -                            target_ulong rs2,
> -                            int bits)
> -{
> -    target_ulong x = rs1;
> -    int i, shift;
> -
> -    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
> -        if (rs2 & shift) {
> -            x |= do_swap(x, adjacent_masks[i], shift);
> -        }
> -    }
> -
> -    return x;
> -}
> -
> -target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
> -}
> -
> -target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
> -{
> -    return do_gorc(rs1, rs2, 32);
> -}
> -
>  target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
>  {
>      target_ulong result = 0;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c559c860a7..80561e8866 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
>  /* Bitmanip */
>  DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> -DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index faa56836d8..8bcb602455 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -680,6 +680,7 @@ max        0000101 .......... 110 ..... 0110011 @r
>  maxu       0000101 .......... 111 ..... 0110011 @r
>  min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
> +orc_b      001010 000111 ..... 101 ..... 0010011 @r2
>  orn        0100000 .......... 110 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
> @@ -701,19 +702,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
>  packu      0100100 .......... 100 ..... 0110011 @r
>  packh      0000100 .......... 111 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
> -gorc       0010100 .......... 101 ..... 0110011 @r
> -
>  grevi      01101. ........... 101 ..... 0010011 @sh
> -gorci      00101. ........... 101 ..... 0010011 @sh
>
>  # *** RV64B Standard Extension (in addition to RV32B) ***
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
> -gorcw      0010100 .......... 101 ..... 0111011 @r
>
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
> -gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 03b3724c96..cb4aa168fb 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -215,18 +215,32 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
>      return gen_grevi(ctx, a);
>  }
>
> -static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
> +static void gen_orc_b(TCGv ret, TCGv source1)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, gen_helper_gorc);
> +    TCGv  tmp = tcg_temp_new();
> +
> +    /* Set msb in each byte if the byte was zero. */
> +    tcg_gen_subi_tl(tmp, source1, dup_const(MO_8, 0x01));
> +    tcg_gen_andc_tl(tmp, tmp, source1);
> +    tcg_gen_andi_tl(tmp, tmp, dup_const(MO_8, 0x80));
> +
> +    /* Replicate the msb of each byte across the byte. */
> +    tcg_gen_shri_tl(tmp, tmp, 7);
> +    tcg_gen_muli_tl(tmp, tmp, 0xff);
> +
> +    /* Negate */
> +    tcg_gen_not_tl(ret, tmp);
> +
> +    tcg_temp_free(tmp);
>  }
>
> -static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
> +static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shifti(ctx, a, gen_helper_gorc);
> +    REQUIRE_ZBB(ctx);
> +    return gen_unary(ctx, a, &gen_orc_b);
>  }
>
> +
>  #define GEN_TRANS_SHADD(SHAMT)                                             \
>  static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
>  {                                                                          \
> @@ -308,20 +322,6 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
>      return gen_shiftiw(ctx, a, gen_grevw);
>  }
>
> -static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_gorcw);
> -}
> -
> -static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_gorcw);
> -}
> -
>  #define GEN_TRANS_SHADD_UW(SHAMT)                             \
>  static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
>                                      arg_sh##SHAMT##add_uw *a) \
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fc22ae82d0..5c099ff007 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -710,12 +710,6 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
>      gen_helper_grev(ret, arg1, arg2);
>  }
>
> -static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    gen_helper_gorcw(ret, arg1, arg2);
> -}
> -
>  #define GEN_SHADD_UW(SHAMT)                                       \
>  static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
>  {                                                                 \
> --
> 2.25.1
>
>

