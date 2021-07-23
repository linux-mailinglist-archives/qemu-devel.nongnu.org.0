Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB493D314F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 03:31:00 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6k1i-0002xb-Mj
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 21:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6k0R-000250-1j
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:29:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6k0P-0004Dm-2y
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:29:38 -0400
Received: by mail-pj1-x1031.google.com with SMTP id b6so3565pji.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 18:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bGfUNrpUitLI+J3wfh3qNovYOYD2CXfzicPy+0yaiZQ=;
 b=CknuLcR+96/6hhGmmEN3hBMtHgGT/je+km2cY5BNu7ojfixLxiyDot5ru3ymgypyF0
 vhmj2duN96XJSfKZRL6ASRJk+d+WBITwWrUoxUiJpXLy3V5DAIPx4wHU2+7kYqjYuGzX
 X/PF7JXZxfAbLChA6lFFhGqoT4iScBHLqY+E5vPOV2Eqbs69QHuHKbyrxf+6yQL6pg5Q
 SJfXC+VC0xCSbS69sp1pIXvm2jgUoFw+wsB4RiqWsoLaVGD0jKkQm1jUGtEcJDccJD3c
 CWGALokJihT7hRtf1Ui5uroBLpzLZzfyfaemJI++nfVFR3/wowbRBz7sB12Ly29xq4ZQ
 etyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bGfUNrpUitLI+J3wfh3qNovYOYD2CXfzicPy+0yaiZQ=;
 b=O84sQMVMzek7CEJwm5N/VQR1C3IW6Ex7msYXDsVUcHkFeISIiducFIX1T5wFD0bsCs
 uy9L+E7LWq0nt8tT9n0Fysf0PVMhFA0YESLl8U7cKaTg28H2cAhhCuHfpS3m48oiFBUZ
 NeEFve7Pdgr0HbrKEFpooVPPflfZ8TDC7qAFJm9dL9Vt56UoBD4DsHihRm0yKPej2PqC
 yKuL1HplDcM2ySsJe2SQj/WInScRB7Nb3jZJdpouTA0+rq9VITvtjXEDAMFPf7G0vO+e
 0+/4IFo7OjB78hFzqlL2rGHSQTKtuekGikKN0Jp005uCWZIDiwBypAVluz8eIVvtKAsO
 foRg==
X-Gm-Message-State: AOAM532gkgYTPevZQmvGUD9MDfI95xHHnQn1uoVpk0SRRysFPjY5V6oK
 4x2woJWRemnAfXficy9Jg/bIig==
X-Google-Smtp-Source: ABdhPJz8+JAjM6NJdX6UkC+FoaZefiAHWBBvPHQQ8lAOpDC/ug3dU1Z9Q2d66WJGOve5J+4ISbCQ0A==
X-Received: by 2002:aa7:990b:0:b029:327:6b3f:8a1c with SMTP id
 z11-20020aa7990b0000b02903276b3f8a1cmr2209900pff.26.1627003775193; 
 Thu, 22 Jul 2021 18:29:35 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id x10sm32943513pfd.175.2021.07.22.18.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 18:29:34 -0700 (PDT)
Subject: Re: [PATCH v2 09/22] target/loongarch: Add fixed point bit
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41541363-117c-6428-cc46-2660827cb803@linaro.org>
Date: Thu, 22 Jul 2021 15:29:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-10-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> This patch implement fixed point bit instruction translation.
> 
> This includes:
> - EXT.W.{B/H}
> - CL{O/Z}.{W/D}, CT{O/Z}.{W/D}
> - BYTEPICK.{W/D}
> - REVB.{2H/4H/2W/D}
> - REVH.{2W/D}
> - BITREV.{4B/8B}, BITREV.{W/D}
> - BSTRINS.{W/D}, BSTRPICK.{W/D}
> - MASKEQZ, MASKNEZ
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/helper.h     |  10 +
>   target/loongarch/insns.decode |  45 +++
>   target/loongarch/op_helper.c  | 119 ++++++++
>   target/loongarch/trans.inc.c  | 665 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 839 insertions(+)
> 
> diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
> index 6c7e19b..bbbcc26 100644
> --- a/target/loongarch/helper.h
> +++ b/target/loongarch/helper.h
> @@ -8,3 +8,13 @@
>   
>   DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
>   DEF_HELPER_2(raise_exception, noreturn, env, i32)
> +
> +DEF_HELPER_2(cto_w, tl, env, tl)
> +DEF_HELPER_2(ctz_w, tl, env, tl)
> +DEF_HELPER_2(cto_d, tl, env, tl)
> +DEF_HELPER_2(ctz_d, tl, env, tl)

The count leading and trailing zero operations are built into tcg.  Count leading and 
trailing one simply needs a NOT operation to convert it to zero.

> +DEF_HELPER_2(bitrev_w, tl, env, tl)
> +DEF_HELPER_2(bitrev_d, tl, env, tl)

These should use TCG_CALL_NO_RWG_SE.

> +target_ulong helper_bitrev_w(CPULoongArchState *env, target_ulong rj)
> +{
> +    int32_t v = (int32_t)rj;
> +    const int SIZE = 32;
> +    uint8_t bytes[SIZE];
> +
> +    int i;
> +    for (i = 0; i < SIZE; i++) {
> +        bytes[i] = v & 0x1;
> +        v = v >> 1;
> +    }
> +    /* v == 0 */
> +    for (i = 0; i < SIZE; i++) {
> +        v = v | ((uint32_t)bytes[i] << (SIZE - 1 - i));
> +    }
> +
> +    return (target_ulong)(int32_t)v;
> +}

   return (int32_t)revbit32(rj);


> +target_ulong helper_bitrev_d(CPULoongArchState *env, target_ulong rj)
> +{
> +    uint64_t v = rj;
> +    const int SIZE = 64;
> +    uint8_t bytes[SIZE];
> +
> +    int i;
> +    for (i = 0; i < SIZE; i++) {
> +        bytes[i] = v & 0x1;
> +        v = v >> 1;
> +    }
> +    /* v == 0 */
> +    for (i = 0; i < SIZE; i++) {
> +        v = v | ((uint64_t)bytes[i] << (SIZE - 1 - i));
> +    }
> +
> +    return (target_ulong)v;
> +}

   return revbit64(rj);

> +static inline target_ulong bitswap(target_ulong v)
> +{
> +    v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
> +        ((v & (target_ulong)0x5555555555555555ULL) << 1);
> +    v = ((v >> 2) & (target_ulong)0x3333333333333333ULL) |
> +        ((v & (target_ulong)0x3333333333333333ULL) << 2);
> +    v = ((v >> 4) & (target_ulong)0x0F0F0F0F0F0F0F0FULL) |
> +        ((v & (target_ulong)0x0F0F0F0F0F0F0F0FULL) << 4);
> +    return v;
> +}
> +
> +target_ulong helper_loongarch_dbitswap(target_ulong rj)
> +{
> +    return bitswap(rj);
> +}
> +
> +target_ulong helper_loongarch_bitswap(target_ulong rt)
> +{
> +    return (int32_t)bitswap(rt);
> +}

I assume these are fpr the  bitrev.4b and bitrev.8b insns?
It would be better to name them correctly.


> +/* Fixed point bit operation instruction translation */
> +static bool trans_ext_w_h(DisasContext *ctx, arg_ext_w_h *a)
> +{
> +    TCGv t0;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = get_gpr(a->rj);
> +
> +    tcg_gen_ext16s_tl(Rd, t0);

Again, you should have a common routine for handling these unary operations.

> +static bool trans_clo_w(DisasContext *ctx, arg_clo_w *a)
> +{
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    gen_load_gpr(Rd, a->rj);
> +
> +    tcg_gen_not_tl(Rd, Rd);
> +    tcg_gen_ext32u_tl(Rd, Rd);
> +    tcg_gen_clzi_tl(Rd, Rd, TARGET_LONG_BITS);
> +    tcg_gen_subi_tl(Rd, Rd, TARGET_LONG_BITS - 32);

So, you're actually using the tcg builtins here, and the helper you created isn't used.

> +static bool trans_cto_w(DisasContext *ctx, arg_cto_w *a)
> +{
> +    TCGv t0;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rj);
> +
> +    gen_helper_cto_w(Rd, cpu_env, t0);

Here you should have used the tcg builtin.

> +static bool trans_ctz_w(DisasContext *ctx, arg_ctz_w *a)
> +{
> +    TCGv t0;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    gen_load_gpr(t0, a->rj);
> +
> +    gen_helper_ctz_w(Rd, cpu_env, t0);

Likewise.

> +static bool trans_revb_2w(DisasContext *ctx, arg_revb_2w *a)
> +{
> +    TCGv_i64 t0, t1, t2;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +    t2 = get_gpr(a->rj);
> +
> +    gen_load_gpr(t0, a->rd);
> +
> +    tcg_gen_ext32u_i64(t1, t2);
> +    tcg_gen_bswap32_i64(t0, t1);
> +    tcg_gen_shri_i64(t1, t2, 32);
> +    tcg_gen_bswap32_i64(t1, t1);
> +    tcg_gen_concat32_i64(Rd, t0, t1);

tcg_gen_bswap64_i64(Rd, Rj)
tcg_gen_rotri_i64(Rd, Rd, 32);

> +static bool trans_bytepick_d(DisasContext *ctx, arg_bytepick_d *a)
> +{
> +    TCGv t0;
> +    TCGv Rd = cpu_gpr[a->rd];
> +
> +    if (a->rd == 0) {
> +        /* Nop */
> +        return true;
> +    }
> +
> +    t0 = tcg_temp_new();
> +
> +    check_loongarch_64(ctx);
> +    if (a->sa3 == 0 || ((a->sa3) * 8) == 64) {
> +        if (a->sa3 == 0) {
> +            gen_load_gpr(t0, a->rk);
> +        } else {
> +            gen_load_gpr(t0, a->rj);
> +        }
> +            tcg_gen_mov_tl(Rd, t0);
> +    } else {
> +        TCGv t1 = tcg_temp_new();
> +
> +        gen_load_gpr(t0, a->rk);
> +        gen_load_gpr(t1, a->rj);
> +
> +        tcg_gen_shli_tl(t0, t0, ((a->sa3) * 8));
> +        tcg_gen_shri_tl(t1, t1, 64 - ((a->sa3) * 8));
> +        tcg_gen_or_tl(Rd, t1, t0);
> +
> +        tcg_temp_free(t1);
> +    }

tcg_gen_extract2_i64(Rd, Rk, Rj, a->sa3 * 8);


r~

