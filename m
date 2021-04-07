Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F79356239
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 05:53:36 +0200 (CEST)
Received: from localhost ([::1]:44906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTzG3-0001UD-8W
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 23:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTzF2-0000l7-EC
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:52:32 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTzF0-0000ut-Gn
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:52:32 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c204so8189409pfc.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KSzUjykhlPdqK8yc/oHkW/atVoEfA4yFdtdXgnna6SE=;
 b=UosME+g5U7CTF4sTyfIVe2b4cenoVG0xILvVwvrcl5wPRSUZdxl9Ps3tVvk6Bgwh/g
 tE2qsYa3kSJoj607bguS1dhQTp7T8Jk6NX/UgJOMf3ijTmJis+jlQQknFLzXIElrZbjL
 /olntt+33osw0LawRRLEuSMwZATVU6Ehnp7YntfX/s56RK/ZdRGwL4Dk6W9WuvwyTzhC
 9w7Kwp+b2hBYyMHuyYW4zSrW9vZtvoZJigkRyRdTYjj1ayeWcNu9DZt0/nEA3hmc1vYZ
 kT7NdfzdVhs/fn0M4iQLe4QMQGNdcFahWpCRw6db60kfBVhioxAMjYh+BwrIKRZRAqUY
 Makg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KSzUjykhlPdqK8yc/oHkW/atVoEfA4yFdtdXgnna6SE=;
 b=XJvLawiTrzeOXGx10AVLGexyOuQmJWpXU4K5aXe/HjjYqRrgqh8P3wJaj5ppTMBaJl
 HG0e3z5suG1XRkDs3R5V8bWsNVhXcUPEWS+uK1YUg8rk82STTwHRfahSfx96Wlvt7I32
 HORIN4Ts4rOBHhNuIRIxPuClDn79MuU2gtS9yxyugkeU2aLe7tAX3bDi3COj6e1n4JJi
 VfwJxtGPFiDjHi2oKdQXrfkPzJSrEbhXkwNgLTwtHA8C+T13QjuaDYvk2o0j+IVvXpQZ
 3AAWeGdDRo1MULVvdNkqmUEGoz7dYqlcuDuD7fKqvZg1dARI5UdSrqWLfz7VNyKFIcpX
 a3WA==
X-Gm-Message-State: AOAM532idoCMl0fiBfkNtzo46Y5GnIbFJcxf7N5ku33dZE28dfpwxZ7X
 aXZENv8uxW4tPSovRzynhyiNYg==
X-Google-Smtp-Source: ABdhPJz8qPpZNv/e8OCGQZ4KFMaPA+EPsntXh2AxHLemJsuOlMI870/gpLX89XZybVk9rZnhPD/THA==
X-Received: by 2002:a63:d54a:: with SMTP id v10mr1344192pgi.83.1617767548912; 
 Tue, 06 Apr 2021 20:52:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 11sm20493296pfn.146.2021.04.06.20.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 20:52:28 -0700 (PDT)
Subject: Re: [PATCH 05/27] arc: TCG instruction generator and hand-definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-6-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fe5b4af-a4b5-354d-9901-67c414c92eef@linaro.org>
Date: Tue, 6 Apr 2021 20:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-6-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> Add the most generic parts of TCG constructions. It contains the
> basic infrastructure for fundamental ARC features, such as
> ZOL (zero overhead loops) and delay-slots.
> Also includes hand crafted TCG for more intricate instructions, such
> as vector instructions.
> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>

Procedure is that you also sign off on the patches you post.

> +#define REG(x)  (cpu_r[x])

Does this really provide any clarity to the code?

> +static inline bool use_goto_tb(const DisasContext *dc, target_ulong dest)

Drop all of the unnecessary inline markers.
The compiler will decide for itself just fine.

> +void gen_goto_tb(const DisasContext *ctx, int n, TCGv dest)
> +{
> +    tcg_gen_mov_tl(cpu_pc, dest);
> +    tcg_gen_andi_tl(cpu_pcl, dest, ~((target_ulong) 3));
> +    if (ctx->base.singlestep_enabled) {
> +        gen_helper_debug(cpu_env);
> +    } else {
> +        tcg_gen_exit_tb(NULL, 0);
> +    }
> +}

This doesn't use goto_tb, so perhaps a better name?

It also doesn't use tcg_gen_lookup_and_goto_ptr(), so it could be improved.

> +static void gen_gotoi_tb(const DisasContext *ctx, int n, target_ulong dest)
> +{
> +    if (use_goto_tb(ctx, dest)) {
> +        tcg_gen_goto_tb(n);
> +        tcg_gen_movi_tl(cpu_pc, dest);
> +        tcg_gen_movi_tl(cpu_pcl, dest & (~((target_ulong) 3)));
> +        tcg_gen_exit_tb(ctx->base.tb, n);
> +    } else {
> +        tcg_gen_movi_tl(cpu_pc, dest);
> +        tcg_gen_movi_tl(cpu_pcl, dest & (~((target_ulong) 3)));
> +        if (ctx->base.singlestep_enabled) {
> +            gen_helper_debug(cpu_env);
> +        }
> +        tcg_gen_exit_tb(NULL, 0);

Forgot the else, as above.  Also not using lookup.

> +    for (i = 0; i < 64; i++) {
> +        char name[16];
> +
> +        sprintf(name, "r[%d]", i);
> +        cpu_r[i] = tcg_global_mem_new(cpu_env,
> +                                      ARC_REG_OFFS(r[i]),
> +                                      strdup(name));

g_strdup_printf, and drop the local variable.

> +}
> +static void arc_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)

Mind the whitespace.

> +{
> +    /* place holder for now */
> +}
> +
> +static void arc_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +
> +    tcg_gen_insn_start(dc->base.pc_next);

Similarly.

> +static int arc_gen_INVALID(const DisasContext *ctx)
> +{
> +    qemu_log_mask(LOG_UNIMP,
> +                  "invalid inst @:%08x\n", ctx->cpc);
> +    return DISAS_NEXT;
> +}

You need to generate an exception here.

> +    buffer[0] = cpu_lduw_code(ctx->env, ctx->cpc);

translator_lduw.

> +    length = arc_insn_length(buffer[0], cpu->family);
> +
> +    switch (length) {
> +    case 2:
> +        /* 16-bit instructions. */
> +        insn = (uint64_t) buffer[0];
> +        break;
> +    case 4:
> +        /* 32-bit instructions. */
> +        buffer[1] = cpu_lduw_code(ctx->env, ctx->cpc + 2);
> +        uint32_t buf = (buffer[0] << 16) | buffer[1];

Why use the array buffer[] and not a couple of scalars?

> +    if (ctx->insn.limm_p) {
> +        ctx->insn.limm = ARRANGE_ENDIAN(true,
> +                                        cpu_ldl_code(ctx->env,

translator_ldl

> +/*
> + * Throw "misaligned" exception if 'addr' is not 32-bit aligned.
> + * This check is done irrelevant of status32.AD bit.
> + */
> +static void check_addr_is_word_aligned(const DisasCtxt *ctx,
> +                                       TCGv addr)
> +{
> +    TCGLabel *l1 = gen_new_label();
> +    TCGv tmp = tcg_temp_local_new();
> +
> +    tcg_gen_andi_tl(tmp, addr, 0x3);
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, tmp, 0, l1);
> +
> +    tcg_gen_mov_tl(cpu_efa, addr);
> +    tcg_gen_movi_tl(cpu_eret, ctx->cpc);
> +    tcg_gen_mov_tl(cpu_erbta, cpu_bta);
> +
> +    TCGv tcg_index = tcg_const_tl(EXCP_MISALIGNED);
> +    TCGv tcg_cause = tcg_const_tl(0x0);
> +    TCGv tcg_param = tcg_const_tl(0x0);
> +
> +    gen_helper_raise_exception(cpu_env, tcg_index, tcg_cause, tcg_param);
> +
> +    gen_set_label(l1);

So.. you shouldn't have to do anything like this.

As far as I can see, there's nothing special about enter/leave.  All memory ops 
are supposed to be aligned (with double-word ops treated as two word ops for 
alignment).

So you should be implementing TCGCPUOps.do_unaligned_access, and set 
TARGET_ALIGNED_ONLY in default-configs/.

Quite large this patch.  I'll get back to it later...


r~

