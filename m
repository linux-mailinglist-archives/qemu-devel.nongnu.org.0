Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207783FB088
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 06:49:57 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZF6-0007S3-4r
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 00:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZDr-000677-UI
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:48:39 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZDn-0002GI-Py
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 00:48:39 -0400
Received: by mail-io1-xd29.google.com with SMTP id m11so9870895ioo.6
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 21:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91EBsQ+xpqz5PZTt6b4goTLM8SgadvNjzVOmbtnbXQY=;
 b=DszUyUkixD7FgT6yWGcLny629j/ZJxejbP1KQKzUcOhYdEOxPf7moL5wt1j6gAVhE5
 HCvTGQfrVLuyqR04/ohn0eMohqo3t3ppdsOnfm5sZTtTmAqmipgnjfwoRkdgItBogbcG
 JJ6OxINBcSo6kGbMdjCJotmQfyqBBCpovAdkPRfc3/gD9JfNdXQHUUlZOWczH8JB0EoW
 vYyAddNu74yAK9Xuda668RbtUrC66/DsQQ/+hAEDXwJ8YY6b1HKIWCywMzM/HKTm5OVC
 iP8VcUWjsDLQK7riZn0bSV/ZQ31W0RHY/UY95oIrLpHU40OQ5nqEFspLFKUJAXOywQII
 7nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91EBsQ+xpqz5PZTt6b4goTLM8SgadvNjzVOmbtnbXQY=;
 b=szID2BoLKzBF81fYcpl2UO834k2rx3/9x4Z9LJ+89YAEUUyNtZszK523TfLXtHkVHq
 L5Lm3KbhmVEN+DMyp+mRbthqY/K4GMH2JVV6jAZg0L7EyTHK0CD/AQYeq7+sDm3axoJa
 EnhBckvBrSHAVyYVZObI5p5Ko0ofOwKICUOx77TQYG8ZKZ6P9eHvdfRelMnpFF2glfxo
 qR+yAVrrD5oXtYic1thzlwPtGZuS8DkWsluYWhcWr7F576Fm40Sduwr6QUbqzuL32M6h
 n8Y/0EGBRfo3pHWvpE353W3PSs1esyAQ/cENNojrsgtTNRF0ngG7WrPJBmB13NzeNcAQ
 l+2g==
X-Gm-Message-State: AOAM533zdPXS7rbEZzmkMSgRhrVsNsebP7ICxiRF6g7xiYw7XrmpZAMy
 KkJndmFa1FbdoLq53eaZVRnEyucMjtWE1OOpEB4=
X-Google-Smtp-Source: ABdhPJw+5kxvQ3VtsR1FC+Mx/GDKtTOwPqgJzNtWy9Dcz9XpeAplcGMRlH16X2gami4dLvgQMiEUXQRR+9GJp8aZOp8=
X-Received: by 2002:a05:6638:14cf:: with SMTP id
 l15mr5231447jak.8.1630298914531; 
 Sun, 29 Aug 2021 21:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-5-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-5-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 14:48:08 +1000
Message-ID: <CAKmqyKN8_LbwRQztAEva7woPpb=mz0vWVoc8tgVYaJ0-exLxdw@mail.gmail.com>
Subject: Re: [PATCH v6 04/14] target/riscv: Remove the W-form instructions
 from Zbs
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
> Zbs 1.0.0 (just as the 0.93 draft-B before) does no provide for W-form
> instructions for Zbs (single-bit instructions).  Remove them.
>
> Note that these instructions had already been removed for the 0.93
> version of the draft-B extenstion and have not been present in the
> binutils patches circulating in January 2021.
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
> - Remove the W-form instructions from Zbs in a separate commit.
>
>  target/riscv/insn32.decode              |  7 ----
>  target/riscv/insn_trans/trans_rvb.c.inc | 49 -------------------------
>  2 files changed, 56 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 68b163b72d..9abdbcb799 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -716,10 +716,6 @@ cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
>
>  packw      0000100 .......... 100 ..... 0111011 @r
>  packuw     0100100 .......... 100 ..... 0111011 @r
> -bsetw      0010100 .......... 001 ..... 0111011 @r
> -bclrw      0100100 .......... 001 ..... 0111011 @r
> -binvw      0110100 .......... 001 ..... 0111011 @r
> -bextw      0100100 .......... 101 ..... 0111011 @r
>  slow       0010000 .......... 001 ..... 0111011 @r
>  srow       0010000 .......... 101 ..... 0111011 @r
>  rorw       0110000 .......... 101 ..... 0111011 @r
> @@ -727,9 +723,6 @@ rolw       0110000 .......... 001 ..... 0111011 @r
>  grevw      0110100 .......... 101 ..... 0111011 @r
>  gorcw      0010100 .......... 101 ..... 0111011 @r
>
> -bsetiw     0010100 .......... 001 ..... 0011011 @sh5
> -bclriw     0100100 .......... 001 ..... 0011011 @sh5
> -binviw     0110100 .......... 001 ..... 0011011 @sh5
>  sloiw      0010000 .......... 001 ..... 0011011 @sh5
>  sroiw      0010000 .......... 101 ..... 0011011 @sh5
>  roriw      0110000 .......... 101 ..... 0011011 @sh5
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index dcc7b6893d..975492d45c 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -279,55 +279,6 @@ static bool trans_packuw(DisasContext *ctx, arg_packuw *a)
>      return gen_arith(ctx, a, gen_packuw);
>  }
>
> -static bool trans_bsetw(DisasContext *ctx, arg_bsetw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_bset);
> -}
> -
> -static bool trans_bsetiw(DisasContext *ctx, arg_bsetiw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_bset);
> -}
> -
> -static bool trans_bclrw(DisasContext *ctx, arg_bclrw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_bclr);
> -}
> -
> -static bool trans_bclriw(DisasContext *ctx, arg_bclriw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_bclr);
> -}
> -
> -static bool trans_binvw(DisasContext *ctx, arg_binvw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_binv);
> -}
> -
> -static bool trans_binviw(DisasContext *ctx, arg_binviw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftiw(ctx, a, gen_binv);
> -}
> -
> -static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
> -{
> -    REQUIRE_64BIT(ctx);
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shiftw(ctx, a, gen_bext);
> -}
> -
>  static bool trans_slow(DisasContext *ctx, arg_slow *a)
>  {
>      REQUIRE_64BIT(ctx);
> --
> 2.25.1
>
>

