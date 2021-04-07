Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D1D35725F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:50:06 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBNU-0008Gd-UD
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUBLM-0007KX-Di
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:47:52 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUBLJ-0004MJ-Lz
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:47:52 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z16so6107744pga.1
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hiAeSQxKJY8HQhTWZrIE+gHskcdssDe2E9A14XOqwcU=;
 b=Ilis7qT2IqmQ5+Y0IMDXKPEVrOnFRsBxoQQKnf6oQQ3HYbVrvzvcRixL7zYbmuKw7n
 zNT+Njs/1h92Ij1B8r0kc2YvILXt8uBGpCyQ+Zm/AvjCuwWOA+jBI2CTDaJL640UQLnM
 2TN9zTcmwpKjqI8M7/fziW7n2jdeA0N7ktMCZgOqhpLjA79UPOHnsaFuAi2140BjDkoZ
 v+TSyBxM9gBExP+lOaAFOD5WriC3d5yp97Q9wjDOJzg5kvPQhRfkSx1LSsFTXReSCPHA
 ctentxJ4aG1zewR4PlPnpHkUcDlFa+p9+mWZj0Dkd+18d6BSn8szaApfkSN/n0QbnkYz
 MJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hiAeSQxKJY8HQhTWZrIE+gHskcdssDe2E9A14XOqwcU=;
 b=QKxGQu/8B43cIj7i+RkpvDBRzOAW2DMqgrZfnXrk3fOswGWTHcyYvZspajw6dZ46XY
 yoUa+kpkp41WhjFOuDkEO3dfyRHyGNxena0y/0J7gpB2itfWAUvbwmN53oPFVNDLmu7U
 dRIyYE2keKMaNno9eZjtFoCSbSJuGZS+J+DucBtdiR1hBwiFP+vNQNJeLYDnu0LTGAx/
 sME00+IScl7yZ5D+Wni835zDd8mTgaesEVwKqe/TEWuQj85x9F9RrokCe92/cu/pAmtU
 Bz2gh7b3yhDx0SeKBzRhPHcwQtLDt9BnlCy0ncSS4GNQeFL8xqI2y8XSaSenzRUiQzeW
 UMDw==
X-Gm-Message-State: AOAM530sUVn5yY0M6FfipXa3OaDNN3z/hW6iV96xiLHrGjb7lG/4fKLO
 fHQSs7ivFzuYIjIMhQHyWN2n+g==
X-Google-Smtp-Source: ABdhPJyiYUyR2O8gsDOEfzAuB3H0YQDLcj0W9OXFg8BTQs6YcZByB6FwTKy7W1XM9SNp5to0I3QDkQ==
X-Received: by 2002:a63:3241:: with SMTP id y62mr4017178pgy.127.1617814067931; 
 Wed, 07 Apr 2021 09:47:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s22sm5913271pjs.42.2021.04.07.09.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 09:47:47 -0700 (PDT)
Subject: Re: [PATCH 05/27] arc: TCG instruction generator and hand-definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-6-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <865edf7e-2d01-d272-411f-19e92671aa15@linaro.org>
Date: Wed, 7 Apr 2021 09:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-6-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> +/*
> + * Function to add boiler plate code for conditional execution.
> + * It will add tcg_gen codes only if there is a condition to
> + * be checked (ctx->insn.cc != 0).
> + * Remember to pair it with gen_cc_epilogue(ctx) macro.
> + */
> +static void gen_cc_prologue(DisasCtxt *ctx)
> +{
> +    ctx->tmp_reg = tcg_temp_local_new();
> +    ctx->label = gen_new_label();

There's no point in creating these when insn.cc is false.

> +    if (ctx->insn.cc) {
> +        arc_gen_verifyCCFlag(ctx, ctx->tmp_reg);
> +        tcg_gen_brcondi_tl(TCG_COND_NE, ctx->tmp_reg, 1, ctx->label);

You don't need a local temp for tmp_reg.
You can create and free it here.

> +/*
> + * The finishing counter part of gen_cc_prologue. This is supposed
> + * to be put at the end of the function using it.
> + */
> +static void gen_cc_epilogue(const DisasCtxt *ctx)
> +{
> +    if (ctx->insn.cc) {
> +        gen_set_label(ctx->label);
> +    }
> +    tcg_temp_free(ctx->tmp_reg);
> +}

You do not need to keep it live til here.

> +/*
> + * Populates a 32-bit vector with repeating SHIMM:
> + *   vec32=(0000000000u6,0000000000u6)
> + *   vec32=(sssss12,sssss12)
> + * It's crucial that the s12 part of an encoding is in signed
> + * integer form while passed along in SHIMM, e.g:
> + *   s12 = -125 (0xf803) --> 0xfffff803
> + * Do not forget to free the returned TCGv_i32 when done!
> + */
> +static TCGv_i32 dup_shimm_to_i32(int16_t shimm)
> +{
> +    TCGv_i32 vec32 = tcg_temp_new_i32();
> +    int32_t val = shimm;
> +    val = ((val << 16) & 0xffff0000) | (val & 0xffff);
> +    tcg_gen_movi_i32(vec32, val);
> +    return vec32;
> +}

   return tcg_constant_i32(dup_const(MO_16, shimm));

> 
> +static TCGv_i64 dup_limm_to_i64(int32_t limm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = limm;
> +    val = (val << 32) | (val & 0xffffffff);
> +    tcg_gen_movi_i64(vec64, val);
> +    return vec64;
> +}

   return tcg_constant_i64(dup_const(MO_32, limm));

> +static TCGv_i64 quad_shimm_to_i64(int16_t shimm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = shimm;
> +    val = (val << 48) | ((val << 32) & 0x0000ffff00000000) |
> +          ((val << 16) & 0x00000000ffff0000) | (val & 0xffff);
> +    tcg_gen_movi_i64(vec64, val);
> +    return vec64;
> +}

   return tcg_constant_i64(dup_const(MO_16, shimm));

Note that, tcg_constant_* are hashed and need not be freed (but are silently 
accepted if you do).  However, you cannot assign to them.  If you really 
require a mutable temporary, use tcg_const_*.


> +static void gen_vec_op2h(const DisasCtxt *ctx,
> +                         void (*OP)(TCGv, TCGv, TCGv),
> +                         TCGv_i32 dest,
> +                         TCGv_i32 b32,
> +                         TCGv_i32 c32)
> +{
> +    TCGv_i32 t0, t1;
> +
> +    /* If no real register for result, then this a nop. Bail out! */
> +    if (!(ctx->insn.operands[0].type & ARC_OPERAND_IR)) {
> +        return;
> +    }
> +
> +    t0 = tcg_temp_new();
> +    tcg_gen_mov_i32(t0, b32);
> +    /*
> +     * If the last operand is a u6/s12, say 63, there is no "HI" in it.
> +     * Instead, it must be duplicated to form a pair; e.g.: (63, 63).
> +     */
> +    if (ctx->insn.operands[2].type & ARC_OPERAND_SHIMM) {
> +        t1 = dup_shimm_to_i32(ctx->insn.operands[2].value);
> +    } else {
> +        t1 = tcg_temp_new();
> +        tcg_gen_mov_i32(t1, c32);
> +    }
> +
> +    (*OP)(dest, t0, t1);
> +
> +    tcg_temp_free(t1);
> +    tcg_temp_free(t0);
> +}

Why are you copying b32 to a new temp?  Do you have callbacks that are not 
careful about overlap between dest, t0, t1, and assume that you have 
non-overlapping inputs?

If you don't require uniqueness, and use tcg_constant_* above, then you don't 
need to copy c32 into a new temp either, nor worry about conditionally freeing it.

> +static void gen_add16(TCGv_i32 dest, TCGv_i32 t0, TCGv_i32 t1)
> +{
> +    TCGv_i32 tmp = tcg_temp_new_i32();
> +    tcg_gen_xor_i32(tmp, t0, t1);
> +    tcg_gen_andi_i32(tmp, tmp, 0x8000);
> +    tcg_gen_andi_i32(t0, t0, ~0x8000);
> +    tcg_gen_andi_i32(t1, t1, ~0x8000);
> +    tcg_gen_add_i32(t0, t0, t1);
> +    tcg_gen_xor_i32(dest, t0, tmp);
> +    tcg_temp_free_i32(tmp);
> +}

I guess that answers my question of whether you're relying on new unique temps 
as inputs: yes.

> +static void arc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    bool in_a_delayslot_instruction = false;
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +    CPUARCState *env = cpu->env_ptr;
> +
> +    /* TODO (issue #62): these must be removed */
> +    dc->zero = tcg_const_local_tl(0);
> +    dc->one  = tcg_const_local_tl(1);
> +
> +    if (env->stat.is_delay_slot_instruction == 1) {
> +        in_a_delayslot_instruction = true;
> +    }
> +
> +    dc->cpc = dc->base.pc_next;
> +    decode_opc(env, dc);
> +
> +    dc->base.pc_next = dc->npc;
> +    tcg_gen_movi_tl(cpu_npc, dc->npc);
> +
> +    if (in_a_delayslot_instruction == true) {
> +        dc->base.is_jmp = DISAS_NORETURN;
> +
> +        /* Post execution delayslot logic. */
> +        TCGLabel *DEf_not_set_label1 = gen_new_label();
> +        tcg_gen_brcondi_tl(TCG_COND_NE, cpu_DEf, 1, DEf_not_set_label1);
> +        tcg_gen_movi_tl(cpu_DEf, 0);
> +        gen_goto_tb(dc, 1, cpu_bta);
> +        gen_set_label(DEf_not_set_label1);
> +        env->stat.is_delay_slot_instruction = 0;

You may not examine or modify env directly during translate.
This absolutely will not work.


r~

