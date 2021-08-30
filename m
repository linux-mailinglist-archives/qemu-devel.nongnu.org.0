Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C43FB091
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:52:31 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZHa-0001eE-Az
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZF0-00083f-0K
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:49:50 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZEy-0003Ig-8d
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:49:49 -0400
Received: by mail-io1-xd32.google.com with SMTP id z1so18235431ioh.7
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OB0Q4RRIehY3jaZQR8DcU3wSZrJHoIpcmbGy/N56Fxk=;
 b=apcxeseBxCCRle/bb27t9bLICpB1mkRH3A4fxFjP+3eEq1gUKkCY7iGTmE3lD6bATm
 w70bAhgs5NNz48R6BkscNRrTDa+YH8iiW5vNXosE0ynbcvpk16UonL9fKkNuVpDFO1g3
 7cMBjyXgsqlKxh/sW+bGCeCH8crXqs3fB1mWGv/+3p9nOW4tOf40Wbh2tzUlSuRnAP8a
 H/w0BrDjUh9brnsMBcbrHetSEVtVMUa74A7eg80Af3sowNhJtGMqt3fVwGwijB6HA3JX
 jZR3Ok5vRVVL+L6eYVOStiUjj0FF/mSRrqnQ+r4lWrLpBQpA3ehCHb52g6SjzxnSn+Lj
 czqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OB0Q4RRIehY3jaZQR8DcU3wSZrJHoIpcmbGy/N56Fxk=;
 b=ApIyAxU8HxxbdNZO1n1Qhq9wvxWhbNf6aRB6/Y1+0jv6r3iaKv5pozFqa2IgDQVr8v
 b8ykgBYSAMAt4ULt/sAOIN8Rf6a/yK4UKLlZXMuFVdmwuBbGWFZFkbnNnezqgnSdG76t
 snuSZeJ6lQNcb38GHXw3ZLJsnk6rLPuLYpfomJ3leR1DRWZi7h5xyjGfJjq5BECC/b/T
 6alT4M3DGwt+ywACm/EGviozF7mPDjwmPEwkWOcpOftazRyRTcYap+mKS5EDx+n7ORZe
 ga/lk01qfVzpwqT/FmpkX+E8NS+Q7USXW9HMP/uT4LPqzenkVKfgCnsVlORGtB0o+mHv
 uM0Q==
X-Gm-Message-State: AOAM532sWNCGdgABdb29q1Xj4XVb1oYO4xtCXzuNJDRCxMVvrFx11iv7
 VZEDvQLWTNL0diowEn3s2ehncr54LOI0Ybdy8/o=
X-Google-Smtp-Source: ABdhPJx9mDpHbyOVMqKwI/FbpSMyeqNIdJjqXUkBIkg0DT90McJ59vEWozQRWgwNPvFu7NupWSPua9wGiLmMFyyQJcQ=
X-Received: by 2002:a6b:5819:: with SMTP id m25mr16708864iob.105.1630298987346; 
 Sun, 29 Aug 2021 21:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-6-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-6-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:49:20 +1000
Message-ID: <CAKmqyKNkqY6WLmdHRLkutyzZcL7sDNMkGqJUNqxOw_hkpB40xg@mail.gmail.com>
Subject: Re: [PATCH v6 05/14] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
> The Zb[abcs] ratification package does not include the proposed
> shift-one instructions. There currently is no clear plan to whether
> these (or variants of them) will be ratified as Zbo (or a different
> extension) or what the timeframe for such a decision could be.
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
> - Remove shift-one instructions in a separate commit.
>
>  target/riscv/insn32.decode              |  8 ----
>  target/riscv/insn_trans/trans_rvb.c.inc | 52 -------------------------
>  target/riscv/translate.c                | 14 -------
>  3 files changed, 74 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 9abdbcb799..7e38477553 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -692,8 +692,6 @@ bset       0010100 .......... 001 ..... 0110011 @r
>  bclr       0100100 .......... 001 ..... 0110011 @r
>  binv       0110100 .......... 001 ..... 0110011 @r
>  bext       0100100 .......... 101 ..... 0110011 @r
> -slo        0010000 .......... 001 ..... 0110011 @r
> -sro        0010000 .......... 101 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
> @@ -703,8 +701,6 @@ bseti      00101. ........... 001 ..... 0010011 @sh
>  bclri      01001. ........... 001 ..... 0010011 @sh
>  binvi      01101. ........... 001 ..... 0010011 @sh
>  bexti      01001. ........... 101 ..... 0010011 @sh
> -sloi       00100. ........... 001 ..... 0010011 @sh
> -sroi       00100. ........... 101 ..... 0010011 @sh
>  rori       01100. ........... 101 ..... 0010011 @sh
>  grevi      01101. ........... 101 ..... 0010011 @sh
>  gorci      00101. ........... 101 ..... 0010011 @sh
> @@ -716,15 +712,11 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
>
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
> -slow       0010000 .......... 001 ..... 0111011 @r
> -srow       0010000 .......... 101 ..... 0111011 @r
>  rorw       0110000 .......... 101 ..... 0111011 @r
>  rolw       0110000 .......... 001 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
>  gorcw      0010100 .......... 101 ..... 0111011 @r
>
> -sloiw      0010000 .......... 001 ..... 0011011 @sh5
> -sroiw      0010000 .......... 101 ..... 0011011 @sh5
>  roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 975492d45c..ac706349f5 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -162,30 +162,6 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>      return gen_shifti(ctx, a, gen_bext);
>  }
>
> -static bool trans_slo(DisasContext *ctx, arg_slo *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, gen_slo);
> -}
> -
> -static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shifti(ctx, a, gen_slo);
> -}
> -
> -static bool trans_sro(DisasContext *ctx, arg_sro *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, gen_sro);
> -}
> -
> -static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
> -{
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shifti(ctx, a, gen_sro);
> -}
> -
>  static bool trans_ror(DisasContext *ctx, arg_ror *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -279,34 +255,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
>      return gen_arith(ctx, a, gen_packuw);
>  }
>
> -static bool trans_slow(DisasContext *ctx, arg_slow *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_slo);
> -}
> -
> -static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_slo);
> -}
> -
> -static bool trans_srow(DisasContext *ctx, arg_srow *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_sro);
> -}
> -
> -static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_sro);
> -}
> -
>  static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
>  {
>      REQUIRE_64BIT(ctx);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6983be5723..fc22ae82d0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -595,20 +595,6 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
>      tcg_gen_andi_tl(ret, ret, 1);
>  }
>
> -static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_not_tl(ret, arg1);
> -    tcg_gen_shl_tl(ret, ret, arg2);
> -    tcg_gen_not_tl(ret, ret);
> -}
> -
> -static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
> -{
> -    tcg_gen_not_tl(ret, arg1);
> -    tcg_gen_shr_tl(ret, ret, arg2);
> -    tcg_gen_not_tl(ret, ret);
> -}
> -
>  static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
>  {
>      TCGv source1 = tcg_temp_new();
> --
> 2.25.1
>
>

