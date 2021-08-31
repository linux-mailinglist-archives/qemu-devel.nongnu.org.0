Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D93FC184
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 05:32:14 +0200 (CEST)
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKuVL-0003hw-Px
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 23:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKuTv-0002kn-2V
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:30:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKuTo-0000Mr-62
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:30:38 -0400
Received: by mail-pl1-x629.google.com with SMTP id j2so9785930pll.1
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ziFqbA+Qa6+PVfQCHUlQ0K56MSyidDl0GEK6sljf82E=;
 b=iFMrgx1+xDQtW9uOOePiM0xdC9byNkiAfq6JWTdbIQ5n+OlQYyezrKpUHWgrUL17U+
 w7ckpDQAnL83L2emQLkwKFFVoVHd8nai4SdL2VRRWuhGE8fqkTTE4lwixnCLx9ecl4SR
 6gmoFdgzkzTwSjl7q7DeLzyADO7odwSizxtajxLGNshWxL7QxeZKrlEl9Rj/arUeH/SD
 xpGxocy4uF2g9/OsgCNpzqd5VW3e36SO0grSzMLKtakuoxla5zPWWbD71r16KaamGSfy
 qbV8ro1Cbm/Me2byDY3DRGboztWAO8uPK410xSOAhMHvyUjLCFc9pqs5d/5PuNVrBwju
 15lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ziFqbA+Qa6+PVfQCHUlQ0K56MSyidDl0GEK6sljf82E=;
 b=Dkycl1DQwA6rNzaFU5wN00btXPOn14Qmp1ZuFiBAPKjXcTOdnk79JrWYHUelERxD2V
 6jGS5mJghPotuO2WHUYb7XzUn09OM+k9b3UQBzuRGOZyzsIfDDygUGIhZpEyjmkEIzli
 P+Kfk29tIOlY6WpwqCtrcP/iQ0Zb5AkzSAX/FRzmXyo32Q6rQ+4fuRYTbj+VnPfy86mJ
 jOybRiOTiR46JL5ADcHsFHGWqmoj4yuMZiZrtzS3K3WraVzSlWKcy0e+8gVg3WqrH/s4
 bjvQ5iXv8EOaMGw7lIvFrK4eRSu8Rw3uvTJ3On0sQIi78S6aGCF6gVlXJw6sKQMteYUs
 cSpg==
X-Gm-Message-State: AOAM532WgovdYQWx+8cMXuhavpmdDV2nVlFJLQ6k83A8M0G8wCamXiDm
 JzI5V/JtQr8U/lN1U2ypf+aYNQ==
X-Google-Smtp-Source: ABdhPJwRh0RkldDaVjnfP5307d41tUiF8lvCuCK0GFaz0EIDzLpv8T01bxw8c7C9fYBcD7FP8Rz0LA==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr2682395pjj.57.1630380630328; 
 Mon, 30 Aug 2021 20:30:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id s5sm18856328pgp.81.2021.08.30.20.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:30:30 -0700 (PDT)
Subject: Re: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d2ec8a3-3dc3-d557-3085-bd503edacc35@linaro.org>
Date: Mon, 30 Aug 2021 20:30:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
> Adding the support for the 128-bit arithmetic and logic instructions.
> Remember that all (i) instructions are now acting on 128-bit registers, that
> a few others are added to cope with values that are held on 64 bits within
> the 128-bit registers, and that the ones that cope with values on 32-bit
> must also be modified for proper sign extension.
> Most algorithms taken from Hackers' delight.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/insn32.decode              |  13 +
>   target/riscv/insn_trans/trans_rvi.c.inc | 955 +++++++++++++++++++++++-
>   target/riscv/translate.c                |  25 +
>   3 files changed, 976 insertions(+), 17 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 225669e277..2fe7e1dd36 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -22,6 +22,7 @@
>   %rs1       15:5
>   %rd        7:5
>   %sh5       20:5
> +%sh6       20:6
>   
>   %sh7    20:7
>   %csr    20:12
> @@ -91,6 +92,9 @@
>   # Formats 64:
>   @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
>   
> +# Formats 128:
> +@sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
> +
>   # *** Privileged Instructions ***
>   ecall       000000000000     00000 000 00000 1110011
>   ebreak      000000000001     00000 000 00000 1110011
> @@ -166,6 +170,15 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>   ldu      ............   ..... 111 ..... 0000011 @i
>   lq       ............   ..... 010 ..... 0001111 @i
>   sq       ............   ..... 100 ..... 0100011 @s
> +addid    ............  .....  000 ..... 1011011 @i
> +sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> +srlid    000000 ......  ..... 101 ..... 1011011 @sh6
> +sraid    010000 ......  ..... 101 ..... 1011011 @sh6
> +addd     0000000 ..... .....  000 ..... 1111011 @r
> +subd     0100000 ..... .....  000 ..... 1111011 @r
> +slld     0000000 ..... .....  001 ..... 1111011 @r
> +srld     0000000 ..... .....  101 ..... 1111011 @r
> +srad     0100000 ..... .....  101 ..... 1111011 @r
>   
>   # *** RV32M Standard Extension ***
>   mul      0000001 .....  ..... 000 ..... 0110011 @r
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 772330a766..0401ba3d69 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -26,14 +26,20 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
>   
>   static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>   {
> -     REQUIRE_64BIT(ctx);
> -     return trans_illegal(ctx, a);
> +    REQUIRE_64_OR_128BIT(ctx);
> +    return trans_illegal(ctx, a);
>   }
>   
>   static bool trans_lui(DisasContext *ctx, arg_lui *a)
>   {
>       if (a->rd != 0) {
>           tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
> +#if defined(TARGET_RISCV128)
> +        if (is_128bit(ctx)) {
> +            tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd],
> +                                 cpu_gpr[a->rd]);
> +        }
> +#endif
>       }
>       return true;
>   }

I think it is a mistake to introduce all of these ifdefs.

If 128-bit is not enabled, then is_128bit should evaluate to false, and all should be 
well.  As for cpu_gprh[], that should be hidden behind some function/macro so that if 
128-bit is not enabled we get qemu_build_not_reached().

Finally, you can compute this immediate value directly.  Don't leave it to the optimizer 
to provide the extension.

>   static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
>   {
>       if (a->rd != 0) {
> +#if defined(TARGET_RISCV128)
> +        if (is_128bit(ctx)) {
> +            /* TODO : when pc is 128 bits, use all its bits */
> +            TCGv pc = tcg_const_tl(ctx->base.pc_next),
> +                 imm = tcg_const_tl(a->imm),
> +                 immh = tcg_const_tl((a->imm & 0x80000)
> +                         ? 0xffffffffffffffff : 0),

No need to test bits here: -(a->imm < 0) will do fine.

> +                 cnst_zero = tcg_const_tl(0);
> +            tcg_gen_add2_tl(cpu_gpr[a->rd], cpu_gprh[a->rd], pc, cnst_zero,
> +                            imm, immh);
> +            tcg_temp_free(pc);
> +            tcg_temp_free(imm);
> +            tcg_temp_free(immh);
> +            tcg_temp_free(cnst_zero);
> +            return true;

tcg_constant_tl, not tcg_const_tl and no tcg_temp_free.

> +    case TCG_COND_LT:
> +    {
> +        TCGv tmp1 = tcg_temp_new(),
> +             tmp2 = tcg_temp_new();
> +
> +        tcg_gen_xor_tl(tmp1, rh, ah);
> +        tcg_gen_xor_tl(tmp2, ah, bh);
> +        tcg_gen_and_tl(tmp1, tmp1, tmp2);
> +        tcg_gen_xor_tl(tmp1, rh, tmp1);
> +        tcg_gen_setcondi_tl(TCG_COND_LT, rl, tmp1, 0); /* Check sign bit */
> +
> +        tcg_temp_free(tmp1);
> +        tcg_temp_free(tmp2);
> +        break;
> +    }

Incorrect, as you're not examining the low parts at all.


> +
> +    case TCG_COND_GE:
> +        /* We invert the result of TCG_COND_LT */
> +        gen_setcond_128(rl, rh, al, ah, bl, bh, TCG_COND_LT);
> +        tcg_gen_setcondi_tl(TCG_COND_EQ, rl, rl, 0);

Inversion of a boolean is better as xor with 1.

> +    case TCG_COND_LTU:
> +    {
> +        TCGv tmp1 = tcg_temp_new(),
> +             tmp2 = tcg_temp_new();
> +
> +        tcg_gen_eqv_tl(tmp1, ah, bh);
> +        tcg_gen_and_tl(tmp1, tmp1, rh);
> +        tcg_gen_not_tl(tmp2, ah);
> +        tcg_gen_and_tl(tmp2, tmp2, bh);
> +        tcg_gen_or_tl(tmp1, tmp1, tmp2);
> +
> +        tcg_gen_setcondi_tl(TCG_COND_LT, rl, tmp1, 0); /* Check sign bit */
> +
> +        tcg_temp_free(tmp1);
> +        tcg_temp_free(tmp2);
> +        break;
> +    }

Again, missing comparison of low parts.

> @@ -93,7 +205,28 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>       gen_get_gpr(source1, a->rs1);
>       gen_get_gpr(source2, a->rs2);
>   
> +#if defined(TARGET_RISCV128)
> +    if (is_128bit(ctx)) {
> +        TCGv source1h, source2h, tmph, tmpl;
> +        source1h = tcg_temp_new();
> +        source2h = tcg_temp_new();
> +        tmph = tcg_temp_new();
> +        tmpl = tcg_temp_new();
> +        gen_get_gprh(source1h, a->rs1);
> +        gen_get_gprh(source2h, a->rs2);
> +
> +        gen_setcond_128(tmpl, tmph, source1, source1h, source2, source2h, cond);
> +        tcg_gen_brcondi_tl(TCG_COND_NE, tmpl, 0, l);
> +        tcg_temp_free(source1h);
> +        tcg_temp_free(source2h);
> +        tcg_temp_free(tmph);
> +        tcg_temp_free(tmpl);

setcond feeding brcond results in too many comparisons, usually.

In this instance it may be just as easy to generate multiple branches, in general.  But 
EQ/NE should not be

	setcond	t1, al, bl, eq
	setcond t2, ah, bh, eq
	and	t3, t1, t1
	brcond	t3, 0, ne

but

	xor	t1, al, bl
	xor	t2, ah, bh
	or	t3, t1, t2
	brcond	t3, 0, eq

>   static bool trans_srli(DisasContext *ctx, arg_srli *a)
>   {
> +#if defined(TARGET_RISCV128)
> +    if (is_128bit(ctx)) {
> +        if (a->shamt >= 128) {
> +            return false;
> +        }
> +
> +        if (a->rd != 0 && a->shamt != 0) {
> +            TCGv rs = tcg_temp_new(),
> +                 rsh = tcg_temp_new(),
> +                 res = tcg_temp_new(),
> +                 resh = tcg_temp_new(),
> +                 tmp = tcg_temp_new();
> +            gen_get_gpr(rs, a->rs1);
> +            gen_get_gprh(rsh, a->rs1);
> +
> +            /*
> +             * Computation of double-length right logical shift,
> +             * adapted for immediates from section 2.17 of Hacker's Delight
> +             */
> +            if (a->shamt >= 64) {
> +                tcg_gen_movi_tl(res, 0);
> +            } else {
> +                tcg_gen_shri_tl(res, rs, a->shamt);
> +            }
> +            if (64 - a->shamt < 0) {
> +                tcg_gen_movi_tl(tmp, 0);
> +            } else {
> +                tcg_gen_shli_tl(tmp, rsh, 64 - a->shamt);
> +            }
> +            tcg_gen_or_tl(res, res, tmp);
> +            if (a->shamt - 64 < 0) {
> +                tcg_gen_movi_tl(tmp, 0);
> +            } else {
> +                tcg_gen_shri_tl(tmp, rsh, a->shamt - 64);
> +            }
> +            tcg_gen_or_tl(res, res, tmp);
> +
> +            if (a->shamt >= 64) {
> +                tcg_gen_movi_tl(resh, 0);
> +            } else {
> +                tcg_gen_shri_tl(resh, rsh, a->shamt);
> +            }

We have tcg_gen_extract2_i64 for the purpose of double-word immediate shifts.  You should 
be doing

     if (shamt >= 64) {
         tcg_gen_shri_tl(resl, srch, shamt - 64);
         tcg_gen_movi_tl(resh, 0);
     } else {
         tcg_gen_extract2_tl(resl, srcl, srch, shamt);
         tcg_gen_shri_tl(resh, srch, shamt);
     }

>   static bool trans_srai(DisasContext *ctx, arg_srai *a)

     if (shamt >= 64) {
         tcg_gen_sari_tl(resl, srch, shamt - 64);
         tcg_gen_sari_tl(resh, srch, 63);
     } else {
         tcg_gen_extract2_tl(resl, srcl, srch, shamt);
         tcg_gen_sari_tl(resh, srch, shamt);
     }

>  static bool trans_slli(DisasContext *ctx, arg_slli *a)

     if (shamt >= 64) {
         tcg_gen_shli_tl(resh, srcl, shamt - 64);
         tcg_gen_movi_tl(resl, 0);
     } else {
         tcg_gen_extract2_tl(resh, srcl, srch, 64 - shamt);
         tcg_gen_shli_tl(resl, srcl, shamt);
     }

C.f. tcg/tcg-op.c, tcg_gen_shifti_i64, which is doing the same thing for i32.

> +#if defined(TARGET_RISCV128)
> +enum M128_DIR { M128_LEFT, M128_RIGHT, M128_RIGHT_ARITH };
> +static void gen_shift_mod128(TCGv ret, TCGv arg1, TCGv arg2, enum M128_DIR dir)
> +{
> +    TCGv tmp1 = tcg_temp_new(),
> +         tmp2 = tcg_temp_new(),
> +         cnst_zero = tcg_const_tl(0),
> +         sgn = tcg_temp_new();
> +
> +    tcg_gen_setcondi_tl(TCG_COND_GE, tmp1, arg2, 64);
> +    tcg_gen_setcondi_tl(TCG_COND_LT, tmp2, arg2, 0);
> +    tcg_gen_or_tl(tmp1, tmp1, tmp2);

What in the world are you doing with signed comparisons?

> +    tcg_gen_andi_tl(tmp2, arg2, 0x3f);

You should have one test with 0x3f and one with 0x40.



r~

