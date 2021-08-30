Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA33FB0C4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:18:00 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZgF-0007ze-5j
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZeh-0006vZ-DD
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:16:23 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZef-0000PN-OK
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:16:23 -0400
Received: by mail-io1-xd31.google.com with SMTP id y18so18356697ioc.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yK8n9K46Rm1/sAzY/39h1y+Gkg/7P9AMUs3EnjBpcYs=;
 b=vF3BiRnUNABddXmtG6xagB0+tarExXCLaqOdiZpiO3hP0InGM9XfFDwTGn/K67X//V
 TXsET2eiidmrLslxRWjbeCVUDMuIcWnj+ZNwYWo3yBsAlsQvTxuW3P1rWR9dcKorgGE2
 aZpyquCfX4WYyNx/NAYekYF3X1LKPyrrDXEeRtrGtJgDol26XYGOb3Q7hacMwmnMfDNJ
 IG/MWFcvrfcDqiTzSvQoMv+fOMd/IcH0ovDRKL4fFPIvRySPNYT1+Pi5ZJDvmmTCpLti
 tTKWsItU2l82jt5ctEPfASwA8UYJPqWQm7x0RWewWd0k6lN4Zfx4R+kWEX6Zx9fIe0KJ
 ZZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yK8n9K46Rm1/sAzY/39h1y+Gkg/7P9AMUs3EnjBpcYs=;
 b=FQSXt0XTGlJyDl1lYT2Z3K2cZB62woe8l1pKpCwoNPHf3v07d3z+G7oU9HOsHgfVx3
 had3khlXUtq5oMU2l+9AAi3NjaTpneOE4Kjmu3nHmB1aAq8ldvdtib2y+m+D4Ns7zIse
 KGxT5X1SYP5HDN3+MoTf9bnucT6DBMW0tQgznyACU2aT8jtmbfrnJ6zBJLIucTBSRPZH
 XFWwJhRfl4TDHsO2k3WhmjK+cViZ69SGqVq/JIlTeVZxWLB0qvYL+3WoyW1GXb9n9wZD
 lknQz5hr6u8drP96dOCIaj3lXqXhVQLWXXXNJV/qfPI/0nIzXl7Jeu44LKa+NtwS8KFw
 JLQg==
X-Gm-Message-State: AOAM532heZA6xCsaDIGf9SWYeCBmYJAyWrRP9YG2iAFuulpWFFHCfVgK
 tzmYiZJiJTkYhMonCyt8YuzZ0b8KIsU53UXHiQHd3fdqb+B7feAM
X-Google-Smtp-Source: ABdhPJyuD3d8jR5CmYrLWZocwueqJv561/ZH/um0Ua+J6NjxZMSn2IlCzw+qOOwkXzQvaZ+t6BBvk12QSMUlTQFd5LE=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr17349954iod.175.1630300580579; 
 Sun, 29 Aug 2021 22:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-10-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-10-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:15:54 +1000
Message-ID: <CAKmqyKMK83SBmtCJuZiPQ9N0F0NzSTHRW3ZR+cQkfA8-DJ61Kw@mail.gmail.com>
Subject: Re: [PATCH v6 09/14] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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

On Thu, Aug 26, 2021 at 3:18 AM Philipp Tomsich
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
> ---
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
>  target/riscv/bitmanip_helper.c          | 26 -----------------
>  target/riscv/helper.h                   |  2 --
>  target/riscv/insn32.decode              |  6 +---
>  target/riscv/insn_trans/trans_rvb.c.inc | 38 ++++++++++++-------------
>  target/riscv/translate.c                |  6 ----
>  5 files changed, 19 insertions(+), 59 deletions(-)
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
> index 03b3724c96..f3b85ca189 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -215,18 +215,30 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
>      return gen_grevi(ctx, a);
>  }
>
> -static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
> +static void gen_orc_b(TCGv ret, TCGv source1)
>  {
> -    REQUIRE_EXT(ctx, RVB);
> -    return gen_shift(ctx, a, gen_helper_gorc);
> +    TCGv  tmp = tcg_temp_new();

Doesn't this need to be freed?

Alistair

