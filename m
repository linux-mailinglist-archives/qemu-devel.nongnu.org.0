Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C02CAE90
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:37:32 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDL1-00011l-FK
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkDJ1-0000QG-EB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:35:27 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkDIy-0001GI-VQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:35:27 -0500
Received: by mail-ot1-x332.google.com with SMTP id e105so3152517ote.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FP/ibxdTQVSs37xhT5AXiefpJr30Jb5v6l7QlDzPBhs=;
 b=wJ1JmNIku7JhAXho054OA1mZxC0zYY9MR+fRl5Q9V1m9YwLa7cf5rmqtfmc1LzuhvD
 CKAys2uqnTYmthaV/5W0ly9rpv709ZWQmW4hfzo0SZYUjBO9c5xs0kkZVFzvZ2sKqz+N
 AZFkg01ncpwxNWEC+Oh/l9QzJo0UtEQY7MWZNErR3F7GaC/mjUvousmHshPtamwuSsEr
 89Gzw7GRciv3mUAqOOY2z5EUQ/BV8PsY/pcb6GHvj/ZpTr4bIECnpMl7781pRQeNNrlq
 e9EO2hSRzdEGHe+4uXmWeTDoRzgPF8VK8YrjC79bVVAegWTnm0Fef5zHAxmd+VI0ovY0
 LPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FP/ibxdTQVSs37xhT5AXiefpJr30Jb5v6l7QlDzPBhs=;
 b=E2VgB751pcEtsLEQDRyGJrysXqvYfIhgG3oQnPhw2LwDPIYV78M+ADiwjIttYZDlF1
 6AgEqHg1L/ggQM3iW29NQHAPiFIz2uIl8h0cXi3lRaZq0EbXhlnZv3YZtdHxzNjoUEst
 ZFwtfsf+DWRVWdJL6V+G6mC11vV8wrrAos2RvVmXk9Fk68WFnovjYqVWZuj0hI1by0LU
 8daVs0ACVO3U7jAaGEIB5JclDWtRZ3TTed/w+7zXSL69ewbLiPsTZG45AJWAkqy1lWOW
 ojTmjgjl4iTT1jKHfSJ+mVucvMtjesIvKoqk4Ya2UAXWmnwVag9zFuII3dazlo6LN/7j
 07tA==
X-Gm-Message-State: AOAM533Hch7b/HHCNJYU/XmxoN5xSKuIsioEBH2TXMgZ4zj+xBZYFxF4
 V0pgKa1EfNunBo2nbnzrXqoQBA==
X-Google-Smtp-Source: ABdhPJyPntPECJ7to1Cvz6N7LZwTrzLFCa70XYLEPbVObCzRHuGQvDYc6Uh2gx+SiH3JrIjULgbI7w==
X-Received: by 2002:a9d:39f5:: with SMTP id y108mr3341334otb.63.1606858523607; 
 Tue, 01 Dec 2020 13:35:23 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o63sm242755ooa.10.2020.12.01.13.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 13:35:22 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
Date: Tue, 1 Dec 2020 15:35:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-5-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
>  target/arc/extra_mapping.def   |  40 ++
>  target/arc/helper.c            | 293 +++++++++++++
>  target/arc/helper.h            |  46 ++
>  target/arc/op_helper.c         | 749 +++++++++++++++++++++++++++++++++
>  target/arc/semfunc_mapping.def | 329 +++++++++++++++
>  5 files changed, 1457 insertions(+)
>  create mode 100644 target/arc/extra_mapping.def
>  create mode 100644 target/arc/helper.c
>  create mode 100644 target/arc/helper.h
>  create mode 100644 target/arc/op_helper.c
>  create mode 100644 target/arc/semfunc_mapping.def

Not an ideal patch split, since nothing uses the def files at this point.  But
looking forward to the end product, they seem to be exactly what I was talking
about re string manipulation vs patch 3.

In particular, arc_map_opcode should be done at qemu build/compile time.  And
not for nothing, a linear search through strings during translation is really
beyond the pale.

> +#if defined(CONFIG_USER_ONLY)
> +
> +void arc_cpu_do_interrupt(CPUState *cs)
> +{
> +    ARCCPU *cpu = ARC_CPU(cs);
> +    CPUARCState *env = &cpu->env;
> +
> +    cs->exception_index = -1;
> +    CPU_ILINK(env) = env->pc;
> +}

There are no user-only interrupts.

> +    /*
> +     * NOTE: Special LP_END exception. Immediatelly return code execution to

Immediately.

> +    /* 15. The PC is set with the appropriate exception vector. */
> +    env->pc = cpu_ldl_code(env, env->intvec + offset);
> +    CPU_PCL(env) = env->pc & 0xfffffffe;

You should be using address_space_ldl, and handling any error.  As it is, if
this load fails you'll get another interrupt, bringing you right back here, etc.

> +DEF_HELPER_1(debug, void, env)
> +DEF_HELPER_2(norm, i32, env, i32)
> +DEF_HELPER_2(normh, i32, env, i32)
> +DEF_HELPER_2(ffs, i32, env, i32)
> +DEF_HELPER_2(fls, i32, env, i32)
> +DEF_HELPER_2(lr, tl, env, i32)
> +DEF_HELPER_3(sr, void, env, i32, i32)
> +DEF_HELPER_2(halt, noreturn, env, i32)
> +DEF_HELPER_1(rtie, void, env)
> +DEF_HELPER_1(flush, void, env)
> +DEF_HELPER_4(raise_exception, noreturn, env, i32, i32, i32)
> +DEF_HELPER_2(zol_verify, void, env, i32)
> +DEF_HELPER_2(fake_exception, void, env, i32)
> +DEF_HELPER_2(set_status32, void, env, i32)
> +DEF_HELPER_1(get_status32, i32, env)
> +DEF_HELPER_3(carry_add_flag, i32, i32, i32, i32)
> +DEF_HELPER_3(overflow_add_flag, i32, i32, i32, i32)
> +DEF_HELPER_3(overflow_sub_flag, i32, i32, i32, i32)
> +
> +DEF_HELPER_2(enter, void, env, i32)
> +DEF_HELPER_2(leave, void, env, i32)
> +
> +DEF_HELPER_3(mpymu, i32, env, i32, i32)
> +DEF_HELPER_3(mpym, i32, env, i32, i32)
> +
> +DEF_HELPER_3(repl_mask, i32, i32, i32, i32)

Use DEF_HELPER_FLAGS_* when possible.

> +target_ulong helper_norm(CPUARCState *env, uint32_t src1)
> +{
> +    int i;
> +    int32_t tmp = (int32_t) src1;
> +    if (tmp == 0 || tmp == -1) {
> +        return 0;
> +    }
> +    for (i = 0; i <= 31; i++) {
> +        if ((tmp >> i) == 0) {
> +            break;
> +        }
> +        if ((tmp >> i) == -1) {
> +            break;
> +        }
> +    }
> +    return i;
> +}

The spec says 0/-1 -> 0x1f, not 0.

That said, this appears to be clrsb32(src1), which could also be expanded
inline with two uses of tcg_gen_clz_i32.

> +target_ulong helper_normh(CPUARCState *env, uint32_t src1)
> +{
> +    int i;
> +    for (i = 0; i <= 15; i++) {
> +        if (src1 >> i == 0) {
> +            break;
> +        }
> +        if (src1 >> i == -1) {
> +            break;
> +        }
> +    }
> +    return i;
> +}

Similarly.


> +
> +target_ulong helper_ffs(CPUARCState *env, uint32_t src)
> +{
> +    int i;
> +    if (src == 0) {
> +        return 31;
> +    }
> +    for (i = 0; i <= 31; i++) {
> +        if (((src >> i) & 1) != 0) {
> +            break;
> +        }
> +    }
> +    return i;
> +}

This should use tcg_gen_ctz_i32.

> +target_ulong helper_fls(CPUARCState *env, uint32_t src)
> +{
> +    int i;
> +    if (src == 0) {
> +        return 0;
> +    }
> +
> +    for (i = 31; i >= 0; i--) {
> +        if (((src >> i) & 1) != 0) {
> +            break;
> +        }
> +    }
> +    return i;
> +}

This should use tcg_gen_clz_i32.

> +
> +static void report_aux_reg_error(uint32_t aux)
> +{
> +    if (((aux >= ARC_BCR1_START) && (aux <= ARC_BCR1_END)) ||
> +        ((aux >= ARC_BCR2_START) && (aux <= ARC_BCR2_END))) {
> +        qemu_log_mask(LOG_UNIMP, "Undefined BCR 0x%03x\n", aux);
> +    }
> +
> +    error_report("Undefined AUX register 0x%03x, aborting", aux);
> +    exit(EXIT_FAILURE);
> +}

Do not exit on failure, or error_report for that matter -- raise an exception.
 Or...

> +void helper_sr(CPUARCState *env, uint32_t val, uint32_t aux)
> +{
> +    struct arc_aux_reg_detail *aux_reg_detail =
> +        arc_aux_reg_struct_for_address(aux, ARC_OPCODE_ARCv2HS);
> +
> +    if (aux_reg_detail == NULL) {
> +        report_aux_reg_error(aux);
> +    }

... on the off-chance the above is a qemu bug and shouldn't happen, just
g_assert(aux_reg_detail != NULL).

> +static target_ulong get_identity(CPUARCState *env)
> +{
> +    target_ulong chipid = 0xffff, arcnum = 0, arcver, res;
> +
> +    switch (env->family) {
> +    case ARC_OPCODE_ARC700:
> +        arcver = 0x34;
> +        break;
> +
> +    case ARC_OPCODE_ARCv2EM:
> +        arcver = 0x44;
> +        break;
> +
> +    case ARC_OPCODE_ARCv2HS:
> +        arcver = 0x54;
> +        break;
> +
> +    default:
> +        arcver = 0;
> +
> +    }
> +
> +    /* TODO: in SMP, arcnum depends on the cpu instance. */
> +    res = ((chipid & 0xFFFF) << 16) | ((arcnum & 0xFF) << 8) | (arcver & 0xFF);
> +    return res;
> +}

Perhaps this should just be a constant on ArcCPU?

> +target_ulong helper_lr(CPUARCState *env, uint32_t aux)
> +{
> +    target_ulong result = 0;
> +
> +    struct arc_aux_reg_detail *aux_reg_detail =
> +        arc_aux_reg_struct_for_address(aux, ARC_OPCODE_ARCv2HS);
> +
> +    if (aux_reg_detail == NULL) {
> +        report_aux_reg_error(aux);
> +    }

Similar commentary for helper_sr.

> +void QEMU_NORETURN helper_halt(CPUARCState *env, uint32_t npc)
> +{
> +    CPUState *cs = env_cpu(env);
> +    if (env->stat.Uf) {
> +        cs->exception_index = EXCP_PRIVILEGEV;
> +        env->causecode = 0;
> +        env->param = 0;
> +         /* Restore PC such that we point at the faulty instruction.  */
> +        env->eret = env->pc;

Any reason not to handle Uf at translate time?  Or at least create a single
helper function for that here.  But it seems like translate will have to do a
lot of priv checking anyway and will already have that handy.

> +void helper_flush(CPUARCState *env)
> +{
> +    tb_flush((CPUState *)env_archcpu(env));
> +}

env_cpu(env), no cast required.

> +void QEMU_NORETURN helper_raise_exception(CPUARCState *env,
> +                                          uint32_t index,
> +                                          uint32_t causecode,
> +                                          uint32_t param)
> +{
> +    CPUState *cs = env_cpu(env);
> +    /* Cannot restore state here. */
> +    /* cpu_restore_state(cs, GETPC(), true); */

Not a very good comment, because you *could* restore state here, but some user
of the function wants to record different state.

Alternately, the function is being used incorrectly, e.g.

> +void helper_zol_verify(CPUARCState *env, uint32_t npc)
> +{
> +    if (npc == env->lpe) {
> +        if (env->r[60] > 1) {
> +            env->r[60] -= 1;
> +            helper_raise_exception(env, (uint32_t) EXCP_LPEND_REACHED, 0,
> +                                   env->lps);

... here, which would have needed to pass in GETPC from here, and not use the
value from the inner call.

In general, you really shouldn't make calls from one helper_* to another,
because that way lies confusion.

The comment should be cleaned up to indicate the actual constraints.

> +uint32_t helper_carry_add_flag(uint32_t dest, uint32_t b, uint32_t c)
> +{
> +    uint32_t t1, t2, t3;
> +
> +    t1 = b & c;
> +    t2 = b & (~dest);
> +    t3 = c & (~dest);
> +    t1 = t1 | t2 | t3;
> +    return (t1 >> 31) & 1;
> +}
> +
> +uint32_t helper_overflow_add_flag(uint32_t dest, uint32_t b, uint32_t c)
> +{
> +    dest >>= 31;
> +    b >>= 31;
> +    c >>= 31;
> +    if ((dest == 0 && b == 1 && c == 1)
> +        || (dest == 1 && b == 0 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +uint32_t helper_overflow_sub_flag(uint32_t dest, uint32_t b, uint32_t c)
> +{
> +    dest >>= 31;
> +    b >>= 31;
> +    c >>= 31;
> +    if ((dest == 1 && b == 0 && c == 1)
> +        || (dest == 0 && b == 1 && c == 0)) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}

There's nothing in here that can't be done with tcg_gen_add2_i32 and
tcg_gen_sub2_i32.

> +uint32_t helper_repl_mask(uint32_t dest, uint32_t src, uint32_t mask)
> +{
> +    uint32_t ret = dest & (~mask);
> +    ret |= (src & mask);
> +
> +    return ret;
> +}

    tcg_gen_and_i32(tmp, src, mask);
    tcg_gen_andc_i32(dest, dest, mask);
    tcg_gen_or_i32(dest, dest, tmp);

> +uint32_t helper_mpymu(CPUARCState *env, uint32_t b, uint32_t c)
> +{
> +    uint64_t _b = (uint64_t) b;
> +    uint64_t _c = (uint64_t) c;
> +
> +    return (uint32_t) ((_b * _c) >> 32);
> +}

tcg_gen_mulu2_i32(tmp, dest, b, c);

> +uint32_t helper_mpym(CPUARCState *env, uint32_t b, uint32_t c)
> +{
> +    int64_t _b = (int64_t) ((int32_t) b);
> +    int64_t _c = (int64_t) ((int32_t) c);
> +
> +    /*
> +     * fprintf(stderr, "B = 0x%llx, C = 0x%llx, result = 0x%llx\n",
> +     *         _b, _c, _b * _c);
> +     */
> +    return (_b * _c) >> 32;

tcg_gen_muls2_i32(tmp, dest, b, c);

> +void helper_enter(CPUARCState *env, uint32_t u6)
> +{
> +    /* nothing to do? then bye-bye! */
> +    if (!u6) {
> +        return;
> +    }
> +
> +    uint8_t regs       = u6 & 0x0f; /* u[3:0] determines registers to save */
> +    bool    save_fp    = u6 & 0x10; /* u[4] indicates if fp must be saved  */
> +    bool    save_blink = u6 & 0x20; /* u[5] indicates saving of blink      */
> +    uint8_t stack_size = 4 * (regs + save_fp + save_blink);
> +
> +    /* number of regs to be saved must be sane */
> +    check_enter_leave_nr_regs(env, regs, GETPC());

Both of these checks could be translate time.

> +    /* this cannot be executed in a delay/execution slot */
> +    check_delay_or_execution_slot(env, GETPC());

As could this.

> +    /* stack must be a multiple of 4 (32 bit aligned) */
> +    check_addr_is_word_aligned(env, CPU_SP(env) - stack_size, GETPC());
> +
> +    uint32_t tmp_sp = CPU_SP(env);
> +
> +    if (save_fp) {
> +        tmp_sp -= 4;
> +        cpu_stl_data(env, tmp_sp, CPU_FP(env));
> +    }

And what if these stores raise an exception?  I doubt you're going to get an
exception at the correct pc.

> +void helper_leave(CPUARCState *env, uint32_t u7)

Similarly.  I think that both of these could be implemented entirely in
translate, which is what

> +    bool restore_fp    = u7 & 0x10; /* u[4] indicates if fp must be saved  */
> +    bool restore_blink = u7 & 0x20; /* u[5] indicates saving of blink      */
> +    bool jump_to_blink = u7 & 0x40; /* u[6] should we jump to blink?       */

these bits strongly imply.


r~

