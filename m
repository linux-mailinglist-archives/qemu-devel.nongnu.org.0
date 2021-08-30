Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372433FB0BE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:14:12 +0200 (CEST)
Received: from localhost ([::1]:57704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZcP-0003Yu-8I
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZaV-00022L-9z
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:12:03 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZaT-0005IC-9m
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:12:02 -0400
Received: by mail-il1-x136.google.com with SMTP id l10so14730666ilh.8
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5sx0K53tQEy7KiGwyFEX14IRecJJnscicRgU80SkBQ=;
 b=ind3MGgMf7XGPXaYETGkQcoC/oayBXFOu4N2TV20C9NY7al/1SnMmywDsrpFQ9AUeQ
 a1y7/TDujZKfybYAkTu8q6NwmzG44Dvq8IHeAP+uhx2hhkC2yVCvN8ZS37/mG4Huafm8
 YKT36OBdbPAwjeHHodeX/VAqy6ecxL8mS8ynyKhmx9Vsga9kGmErMa43vhoamB5hlzTi
 dA5vZSa7tqK7JjhnxzBDt74pYOTDdQeL2s6e5QktRWjC0U3h4OQQcpvESAH0t3j507JU
 433aktua9AetdnRvPLRAhN/PgoQ0VHqG8+jG/72VVLvgPL0dmm6oxn6Z+4WmHOIfnmw9
 LZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5sx0K53tQEy7KiGwyFEX14IRecJJnscicRgU80SkBQ=;
 b=jsDpPWu8qPqmuE2/SzG5kZAKqNNZDk+B6MWjo6HAaSJrYYhnQVL7Ce4YQjOyvIFPRy
 fgWk6+aVF8PtcaBO3vftcI/As4RQgOn376bvv2MUqPj5JbTr+axZ6CnciNXSxp2rnJkp
 HguL+iHQDLEwLRHMgc/L0vzu2+qM3R+AuAz9e6ptqGd+COj+kmIX4wxAsfEgP3gx88xn
 UW+C7rtQTPfgYg79L8G0dhETVgGABxswjdToUVAOXQsUxT8oZAeFiJvFfDd46V5agaSC
 1YaRwBxtd89y7Ew/e5XDCXX8TJa93nnRpPf01CZwRx8g36itgqLNm+EfilncEwLyJosJ
 RNiA==
X-Gm-Message-State: AOAM532Q/rK9NmS7XXL9jzDDNRmcyQbIxBTdKQMzY+Pqy8/6RvlT4ZQO
 d1YzgREvpuUaf1/wTVl1H6iSRQvuHa1ZucvJ+OI=
X-Google-Smtp-Source: ABdhPJwZQJKsMr8xX8J6SoPsil9qAVKNxmbyMHyuNyR63R8b+9jqvEPdf8U/ijNssEACsQZQDZ4HQGCpvei+eITMvfA=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr15061286ilo.267.1630300319904; 
 Sun, 29 Aug 2021 22:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-8-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-8-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:11:33 +1000
Message-ID: <CAKmqyKOc574KcKMFPko4jE9EL=b1M2xYFZ2AoACYWiB4rHs88Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] target/riscv: Add instructions of the
 Zbc-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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

On Thu, Aug 26, 2021 at 3:08 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The following instructions are part of Zbc:
>  - clmul
>  - clmulh
>  - clmulr
>
> Note that these instructions were already defined in the pre-0.93 and
> the 0.93 draft-B proposals, but had not been omitted in the earlier
> addition of draft-B to QEmu.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v6:
> - Move gen_clmulh to trans_rvb.c.inc, as per Richard H's request.
>
> Changes in v5:
> - Introduce gen_clmulh (as suggested by Richard H) and use to simplify
>   trans_clmulh().
>
> Changes in v3:
> - This adds the Zbc instructions as a spearate commit.
> - Uses a helper for clmul/clmulr instead of inlining the calculation of
>   the result (addressing a comment from Richard Henderson).
>
>  target/riscv/bitmanip_helper.c          | 27 +++++++++++++++++++++
>  target/riscv/helper.h                   |  2 ++
>  target/riscv/insn32.decode              |  5 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 32 ++++++++++++++++++++++++-
>  4 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
> index 5b2f795d03..73be5a81c7 100644
> --- a/target/riscv/bitmanip_helper.c
> +++ b/target/riscv/bitmanip_helper.c
> @@ -3,6 +3,7 @@
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -88,3 +89,29 @@ target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
>  {
>      return do_gorc(rs1, rs2, 32);
>  }
> +
> +target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
> +{
> +    target_ulong result = 0;
> +
> +    for (int i = 0; i < TARGET_LONG_BITS; i++) {
> +        if ((rs2 >> i) & 1) {
> +            result ^= (rs1 << i);
> +        }
> +    }
> +
> +    return result;
> +}
> +
> +target_ulong HELPER(clmulr)(target_ulong rs1, target_ulong rs2)
> +{
> +    target_ulong result = 0;
> +
> +    for (int i = 0; i < TARGET_LONG_BITS; i++) {
> +        if ((rs2 >> i) & 1) {
> +            result ^= (rs1 >> (TARGET_LONG_BITS - i - 1));
> +        }
> +    }
> +
> +    return result;
> +}
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 415e37bc37..c559c860a7 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -63,6 +63,8 @@ DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>  DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
> +DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
>
>  /* Special functions */
>  DEF_HELPER_3(csrrw, tl, env, tl, tl)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 1166e7f648..04711111c8 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -713,6 +713,11 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
>
> +# *** RV32 Zbc Standard Extension ***
> +clmul      0000101 .......... 001 ..... 0110011 @r
> +clmulh     0000101 .......... 011 ..... 0110011 @r
> +clmulr     0000101 .......... 010 ..... 0110011 @r
> +
>  # *** RV32 Zbs Standard Extension ***
>  bclr       0100100 .......... 001 ..... 0110011 @r
>  bclri      01001. ........... 001 ..... 0010011 @sh
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 21d713df27..6a3e0c6a09 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -1,5 +1,5 @@
>  /*
> - * RISC-V translation routines for the RVB draft Zb[as] Standard Extension.
> + * RISC-V translation routines for the Zb[acs] Standard Extension.
>   *
>   * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
>   * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
> @@ -24,6 +24,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_ZBC(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_ZBS(ctx) do {                    \
>      if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
>          return false;                            \
> @@ -357,3 +363,27 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>      tcg_temp_free(source1);
>      return true;
>  }
> +
> +static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_helper_clmul);
> +}
> +
> +static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
> +{
> +     gen_helper_clmulr(dst, src1, src2);
> +     tcg_gen_shri_tl(dst, dst, 1);
> +}
> +
> +static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_clmulh);
> +}
> +
> +static bool trans_clmulr(DisasContext *ctx, arg_clmulh *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +    return gen_arith(ctx, a, gen_helper_clmulr);
> +}
> --
> 2.25.1
>
>

