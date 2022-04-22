Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522AF50B837
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:19:10 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtBl-0001K7-6V
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nht96-0006y0-1D
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:16:24 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nht94-0006Z9-5z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:16:23 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f7b815ac06so8832197b3.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W+OVUPbpFM7UeD/oweIdw4Dmhqf/GuZllXoZUU6GJVs=;
 b=bZkdt/dc3VAiW5oue5KR+eJrUlt07usCnAZSTthNfWFb5balJUbU9B1MEDSE9VbMto
 p90zYFZz+0+Q7muEv5bS06wQTTFP5FbOpTN2/KOTIio0MB9Mco5aXLG8ZCEp8g84G4CZ
 iTexuYC+FmfAMxxcmrM+RobQuR91wHETOGgcppJb/QK50vifw4ClwNVoNWAMv+5biiNA
 OYlwsi17VRx8JflOY7+ZFiExk3sjfs4lJr+3OFBXn/n841ZgzTWPsiBk2cgkIi5k06nl
 9UhqFwzQOrOqifeHnUdo8ADyGK4jH28R7yY2f7SoX5UAbKV/i8wJniqHEad4gWGPLzzG
 fosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+OVUPbpFM7UeD/oweIdw4Dmhqf/GuZllXoZUU6GJVs=;
 b=jIG8at95smCGduh/c/jlVTpzx/UwE6ec1dprWW/v9nrhY/bNXUKBpSU6pGuq994UNe
 VJMgFWXw/LlHcVZkPYnR7p6Lx7Dl5j9HSYgmmAv/zJZBZ+2ajF8cwZIFeOQdnlFy0xVo
 GqmReZzfDLDm0laGol4KC6GTCaNVmabIc4zlerZhyDZCriwLGXGCCu9exB1zgiTwIHkU
 HsWc4S+IIsxjyujWd9MhHSJJG2y/FA4Ufw3f3SuZ4XA5pvnXLdkWIBIA9bq9tDsDwwZo
 7qGC1OzOMdXkMEnyzWoOvZcP4fC9BUUR5OzSOf0OEn3SiF3tCX1CdMDdpltoLHH822DS
 Tv1g==
X-Gm-Message-State: AOAM533vXxqP9p7RCsQouewPEmeofH8cYSB67MmICVSWLbBz5Fwc5vZZ
 hddxnmJG6uVFiLYpty/+MqEGShlPphYjhqD0zb1SLA==
X-Google-Smtp-Source: ABdhPJwDpi1m9+PsYXUxrTcojbJTsiZBuXa1OQcpjehpSKAx55DDCqt1ilVtCh05ljZe9RNEqEQQF/MjjtRoImdHYYs=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr4785235ywt.10.1650633381027; Fri, 22
 Apr 2022 06:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-45-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:16:09 +0100
Message-ID: <CAFEAcA84wMQq6Tsk8dSL72fN_Txms0oHQGyXY=xj8_DEmDzS7A@mail.gmail.com>
Subject: Re: [PATCH v7 44/64] target/nios2: Split out helpers for gen_*
 translate macros
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do as little work as possible within the macros.
> Split out helper functions and pass in arguments instead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 215 +++++++++++++++++++++++++--------------
>  1 file changed, 141 insertions(+), 74 deletions(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index a3c63dbbbd..74672101ca 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -71,6 +71,21 @@ typedef struct {
>          .a     = extract32((code), 27, 5), \
>      }
>
> +static target_ulong imm_unsigned(const InstrIType *i)
> +{
> +    return i->imm16.u;
> +}
> +
> +static target_ulong imm_signed(const InstrIType *i)
> +{
> +    return i->imm16.s;
> +}
> +
> +static target_ulong imm_shifted(const InstrIType *i)
> +{
> +    return i->imm16.u << 16;
> +}
> +
>  /* R-Type instruction parsing */
>  typedef struct {
>      uint8_t op;
> @@ -268,40 +283,62 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
>  }
>
>  /* Comparison instructions */
> -#define gen_i_cmpxx(fname, op3)                                              \
> -static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)         \
> -{                                                                            \
> -    I_TYPE(instr, (code));                                                   \
> -    tcg_gen_setcondi_tl(flags, cpu_R[instr.b], cpu_R[instr.a], (op3));       \
> +static void do_i_cmpxx(DisasContext *dc, uint32_t insn, TCGCond cond,
> +                       target_ulong (*imm)(const InstrIType *))

Can we have some typedefs if we're passing function pointers around,
please? I think they're easier to read than having raw
function-pointer type signatures in function prototypes.

> +{
> +    I_TYPE(instr, insn);
> +
> +    if (likely(instr.b != R_ZERO)) {
> +        tcg_gen_setcondi_tl(cond, cpu_R[instr.b],
> +                            load_gpr(dc, instr.a), imm(&instr));
> +    }

The old code didn't do this check against R_ZERO.

>  }

>  /* Math/logic instructions */
> -#define gen_r_math_logic(fname, insn, op3)                                 \
> -static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
> -{                                                                          \
> -    R_TYPE(instr, (code));                                                 \
> -    if (likely(instr.c != R_ZERO)) {                                       \
> -        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), (op3));    \
> -    }                                                                      \
> +static void do_ri_math_logic(DisasContext *dc, uint32_t insn,
> +                             void (*fn)(TCGv, TCGv, int32_t))
> +{
> +    R_TYPE(instr, insn);
> +
> +    if (likely(instr.c != R_ZERO)) {
> +        fn(cpu_R[instr.c], load_gpr(dc, instr.a), instr.imm5);
> +    }
>  }
>
> -gen_r_math_logic(add,  add_tl,   load_gpr(dc, instr.b))
> -gen_r_math_logic(sub,  sub_tl,   load_gpr(dc, instr.b))
> -gen_r_math_logic(mul,  mul_tl,   load_gpr(dc, instr.b))
> +static void do_rr_math_logic(DisasContext *dc, uint32_t insn,
> +                             void (*fn)(TCGv, TCGv, TCGv))
> +{
> +    R_TYPE(instr, insn);
>
> -gen_r_math_logic(and,  and_tl,   load_gpr(dc, instr.b))
> -gen_r_math_logic(or,   or_tl,    load_gpr(dc, instr.b))
> -gen_r_math_logic(xor,  xor_tl,   load_gpr(dc, instr.b))
> -gen_r_math_logic(nor,  nor_tl,   load_gpr(dc, instr.b))
> -
> -gen_r_math_logic(srai, sari_tl,  instr.imm5)
> -gen_r_math_logic(srli, shri_tl,  instr.imm5)
> -gen_r_math_logic(slli, shli_tl,  instr.imm5)
> -gen_r_math_logic(roli, rotli_tl, instr.imm5)
> -
> -#define gen_r_mul(fname, insn)                                         \
> -static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
> -{                                                                      \
> -    R_TYPE(instr, (code));                                             \
> -    if (likely(instr.c != R_ZERO)) {                                   \
> -        TCGv t0 = tcg_temp_new();                                      \
> -        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
> -                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
> -        tcg_temp_free(t0);                                             \
> -    }                                                                  \
> +    if (likely(instr.c != R_ZERO)) {
> +        fn(cpu_R[instr.c], load_gpr(dc, instr.a), load_gpr(dc, instr.b));
> +    }
>  }
>
> -gen_r_mul(mulxss, muls2_tl)
> -gen_r_mul(mulxuu, mulu2_tl)
> -gen_r_mul(mulxsu, mulsu2_tl)
> +#define gen_ri_math_logic(fname, insn)                                      \
> +    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
> +    { do_ri_math_logic(dc, code, tcg_gen_##insn##_tl); }
>
> -#define gen_r_shift_s(fname, insn)                                         \
> -static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
> -{                                                                          \
> -    R_TYPE(instr, (code));                                                 \
> -    if (likely(instr.c != R_ZERO)) {                                       \
> -        TCGv t0 = tcg_temp_new();                                          \
> -        tcg_gen_andi_tl(t0, load_gpr((dc), instr.b), 31);                  \
> -        tcg_gen_##insn(cpu_R[instr.c], load_gpr((dc), instr.a), t0);       \
> -        tcg_temp_free(t0);                                                 \
> -    }                                                                      \
> +#define gen_rr_math_logic(fname, insn)                                      \
> +    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
> +    { do_rr_math_logic(dc, code, tcg_gen_##insn##_tl); }


git diff has made a bit of a pig's ear of this, interleaving the
changes related to math_logic and the ones related to shift and mul.
If you do these changes one insn group at a time rather than
all in one patch I think the resulting diff should be easier to read.

-- PMM

