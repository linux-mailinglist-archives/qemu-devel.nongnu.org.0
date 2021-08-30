Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BBA3FB093
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:53:29 +0200 (CEST)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZIW-0003LP-74
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZGA-0001Kg-4y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:51:02 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZG8-0004L5-Ao
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:51:01 -0400
Received: by mail-io1-xd30.google.com with SMTP id f6so18350580iox.0
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k+eDF0SCC0zvmbAamZWPVIy97x5Pmyda0AMykK7Jc3o=;
 b=EneoKUYEAS5WJFniLoPz+qY3qmi1GBBmJnW9bSQRqdI3MXR8ktW+q2ptrSeJNKru0N
 r+ix/cUDV2z0oIa5vSP+f51Z8Tb2SU5jBDEoxp2JoySVWa5rBpFLed53xl7xZH9ywusm
 Ldeq/uRQlU0jCeTsTFPIr0i6FoENcuFzScUMVUVnKt3vUt4sXvJJJbBNJhTDWV38K2lG
 uQYNmcunUzbumwxoeQ2Go9zRzn8kqk6u0Ln1vBHESepEbcY+/UIK473DG85nFahbVvKR
 Ih5dmwm1VDlAXjiKLFOCT6lsq6yX71shDtQ5zuNckWdNsltEpSRNslr8kUAfyJf847m4
 hapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k+eDF0SCC0zvmbAamZWPVIy97x5Pmyda0AMykK7Jc3o=;
 b=NXZ1+cy7QQEr8yVQcRJ6DBCWHSlq9p2hLikAVtC/CNif4XxOKLX+bmK9oqF6swdtPy
 YzUESuxQw2KrPmYplvV3iAJimSzyH8+gb7qzQuWGESU+juaAAhfVs/Q62Ecvvvpr0jir
 9DgURqU5Y94SdMlAkLNkrq3jDOLb8jfaMIHQr4F+pu1HPt3B4XOp45u4OMl+4AoYRcz8
 bSap48mLOHCvXhXhCdqmU5V1duixXPe9t/7VO6mUtBPka+0R4DwQk/DsJcWeO79lSjDM
 5QGR60m7FxDvBAGVSYwnmWFxUlWQcbsG/8V+pEpZJbd4TztOF01ItQ2Qx+i0qESqfbdI
 anwA==
X-Gm-Message-State: AOAM532Mfohn3BAecnv3/gH8YAtVI5EaMGOiKrs9Sv+CH2DeVvqs+VuQ
 RC0DCc2UyN9zcJUpiUrpN5BF9yF89x73SU2NOrQ=
X-Google-Smtp-Source: ABdhPJw/oldce1ED7frLophedNaxIiwVaKR3V9uLgWIAvw7+aeztWNvcpjhBsXkN4iP9cDyQLkICUkc8/Kj5zCH6BNA=
X-Received: by 2002:a5d:850f:: with SMTP id q15mr17026949ion.118.1630299059199; 
 Sun, 29 Aug 2021 21:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-7-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-7-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:50:32 +1000
Message-ID: <CAKmqyKNx-y=QE_3HZTErmy5BH37Goph+19ORbEy4YWUW7W6qVA@mail.gmail.com>
Subject: Re: [PATCH v6 06/14] target/riscv: Reassign instructions to the
 Zbs-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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

On Thu, Aug 26, 2021 at 3:05 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The following instructions are part of Zbs:
>  - b{set,clr,ext,inv}
>  - b{set,clr,ext,inv}i
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
> - The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
>   its use for qualifying the Zba instructions) are moved into a
>   separate commit.
>
>  target/riscv/insn32.decode              | 17 +++++++++--------
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++---------
>  2 files changed, 24 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 7e38477553..1166e7f648 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -688,19 +688,11 @@ min        0000101 .......... 100 ..... 0110011 @r
>  minu       0000101 .......... 101 ..... 0110011 @r
>  max        0000101 .......... 110 ..... 0110011 @r
>  maxu       0000101 .......... 111 ..... 0110011 @r
> -bset       0010100 .......... 001 ..... 0110011 @r
> -bclr       0100100 .......... 001 ..... 0110011 @r
> -binv       0110100 .......... 001 ..... 0110011 @r
> -bext       0100100 .......... 101 ..... 0110011 @r
>  ror        0110000 .......... 101 ..... 0110011 @r
>  rol        0110000 .......... 001 ..... 0110011 @r
>  grev       0110100 .......... 101 ..... 0110011 @r
>  gorc       0010100 .......... 101 ..... 0110011 @r
>
> -bseti      00101. ........... 001 ..... 0010011 @sh
> -bclri      01001. ........... 001 ..... 0010011 @sh
> -binvi      01101. ........... 001 ..... 0010011 @sh
> -bexti      01001. ........... 101 ..... 0010011 @sh
>  rori       01100. ........... 101 ..... 0010011 @sh
>  grevi      01101. ........... 101 ..... 0010011 @sh
>  gorci      00101. ........... 101 ..... 0010011 @sh
> @@ -721,3 +713,12 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
> +# *** RV32 Zbs Standard Extension ***
> +bclr       0100100 .......... 001 ..... 0110011 @r
> +bclri      01001. ........... 001 ..... 0010011 @sh
> +bext       0100100 .......... 101 ..... 0110011 @r
> +bexti      01001. ........... 101 ..... 0010011 @sh
> +binv       0110100 .......... 001 ..... 0110011 @r
> +binvi      01101. ........... 001 ..... 0010011 @sh
> +bset       0010100 .......... 001 ..... 0110011 @r
> +bseti      00101. ........... 001 ..... 0010011 @sh
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index ac706349f5..21d713df27 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the RVB draft and Zba Standard Extension.
> + * RISC-V translation routines for the RVB draft Zb[as] Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> @@ -24,6 +24,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBS(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  static bool trans_clz(DisasContext *ctx, arg_clz *a)
>  {
>      REQUIRE_EXT(ctx, RVB);
> @@ -116,49 +122,49 @@ static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
>
>  static bool trans_bset(DisasContext *ctx, arg_bset *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shift(ctx, a, gen_bset);
>  }
>
>  static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shifti(ctx, a, gen_bset);
>  }
>
>  static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shift(ctx, a, gen_bclr);
>  }
>
>  static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shifti(ctx, a, gen_bclr);
>  }
>
>  static bool trans_binv(DisasContext *ctx, arg_binv *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shift(ctx, a, gen_binv);
>  }
>
>  static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shifti(ctx, a, gen_binv);
>  }
>
>  static bool trans_bext(DisasContext *ctx, arg_bext *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shift(ctx, a, gen_bext);
>  }
>
>  static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> +    REQUIRE_ZBS(ctx);
>      return gen_shifti(ctx, a, gen_bext);
>  }
>
> --
> 2.25.1
>
>

