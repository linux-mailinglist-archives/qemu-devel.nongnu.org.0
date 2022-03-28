Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538CE4E9F15
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:39:02 +0200 (CEST)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYuGb-0007Ok-0f
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:39:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYuC5-00069y-7Y
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:34:21 -0400
Received: from [2607:f8b0:4864:20::c2e] (port=35772
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYuC3-00056A-D4
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:34:20 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so2717468ooj.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zt8C/Bewx77oC2cce1Hg68ux9B6m34bDTmZ6+Moiges=;
 b=gYJiyaSFVzFNUSGqHRUpLl5MrYQoPI7Jmk8w9yVu7siwPiYOueDavbLZK6l5Gi757i
 gha6+xuBPOg1B8HmY0WH9+uBQlMiUFsEg/uGhwr0Itfwn6yRK4PmPaTcFR/yTuzMO2LS
 4TPBH3SJu0nimQdaTrH6X3RKkxIoukFmg1JUACa6AQexIenLcQz/ALW3G2cGYO2Cf/r2
 qvP76WhRYbGisttysmZUsMqIQGq09KeI+0ZUImRm9VsiRhfEJQgu/OeaceTtDb5/Zttj
 4ZpgPXWyy1x9Y2l03jFlkO2iLSbpD+LdKRTN2irn0uoVOD6J3SX9/ZROmnlM9nDSsBIT
 VDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zt8C/Bewx77oC2cce1Hg68ux9B6m34bDTmZ6+Moiges=;
 b=DFCZmAsm3Rc25A9+txmgg3YnRZcqW4I2Lak5jhYjM82pRg61QePNht14Ea1JXvrdf5
 Vd59GdHQJJsVmsJKX2J51+7Gw+QSc56jhwmfE5c89zr3ZtqDWMWIad1BGHpaIFhZAjuE
 Ev9VnhJA+BavxcXPa0nq5OgKUYB0jSRdRIa//6JJTMtrYQ/8lTUL86sTJmlqgiGhcsQF
 L+jarc756ct1cHb5tOnParGWyEikz+UK675xJsGGBDSzZBA8gl7l/ykFQv+v4B7vgRZa
 PwFxvMnXVWhjm61pGEx0ifUUn6vbuW1C3RVpvZikUTlLXnS/30hQ5O4+f4hpDNU2nwBG
 Q4Tg==
X-Gm-Message-State: AOAM531AnJyf27d9n9eKevX2KiqvaCatuFP5Dh6MXTPjDNR1hsaQ5wsZ
 zZ8m/KHGzebrqOpHCcly6DexWZ67qLrKBAMv7PI=
X-Google-Smtp-Source: ABdhPJx+PpDa1eHMcr7CXws7GV/s2TWPU6KOJPT5S6xj/IGI/cmPkxJj+rNabwCIZAjUnINR9pVgdw==
X-Received: by 2002:a4a:9704:0:b0:324:cac4:cbcc with SMTP id
 u4-20020a4a9704000000b00324cac4cbccmr7087820ooi.65.1648492456444; 
 Mon, 28 Mar 2022 11:34:16 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 eq37-20020a056870a92500b000c6699dad62sm7623732oab.41.2022.03.28.11.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 11:34:15 -0700 (PDT)
Message-ID: <aa21e33f-6729-d148-96e6-1f0617ddbc39@linaro.org>
Date: Mon, 28 Mar 2022 12:34:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 07/29] target/loongarch: Add LoongArch CSR
 instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-8-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-8-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +#define CSR_OFF(X)  \
> +           [LOONGARCH_CSR_##X] = offsetof(CPULoongArchState, CSR_##X)
> +#define CSR_OFF_ARRAY(X, N)  \
> +           [LOONGARCH_CSR_##X(N)] = offsetof(CPULoongArchState, CSR_##X[N])
> +
> +static const int csr_offsets[] = {

You cannot put a variable data definition into a header file like this.
It has put this data structure into every object file.

This belongs in csr_helper.c, probably.

You should add

   [LOONGARCH_CSR_CPUID] = offsetof(CPUState, cpu_index) - offsetof(ArchCPU, env),

rather than special-casing this in helper_csr_rdq.

> +static inline int cpu_csr_offset(unsigned csr_num)
> +{
> +    if (csr_num < ARRAY_SIZE(csr_offsets)) {
> +        return csr_offsets[csr_num];
> +    }
> +    return 0;
> +}

This does not need to be inline, and could easily live in csr_helper.c.

> +target_ulong helper_csr_rdq(CPULoongArchState *env, uint64_t csr)
> +{
> +    LoongArchCPU *cpu;
> +    int64_t v;
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_PGD:
> +        if (env->CSR_TLBRERA & 0x1) {
> +            v = env->CSR_TLBRBADV;
> +        } else {
> +            v = env->CSR_BADV;
> +        }
> +
> +        if ((v >> 63) & 0x1) {
> +            v = env->CSR_PGDH;
> +        } else {
> +            v = env->CSR_PGDL;
> +        }
> +        break;
> +    case LOONGARCH_CSR_CPUID:
> +        v = (env_cpu(env))->cpu_index;
> +        break;
> +    case LOONGARCH_CSR_TVAL:
> +        cpu = LOONGARCH_CPU(env_cpu(env));
> +        v = cpu_loongarch_get_constant_timer_ticks(cpu);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return v;
> +}

You should have seen a compiler warning for 'v' uninitialized here, via the default path.

The default path should not be reachable, because of code in trans_csrrd, and so could be 
written as g_assert_not_reachable().  However, I strongly suggest you split this function 
so that you do not need a switch here at all.  With CPUID now handled via cpu_csr_offset, 
there are only two helpers needed.

> +target_ulong helper_csr_wrq(CPULoongArchState *env, target_ulong val,
> +                            uint64_t csr)
> +{
> +    LoongArchCPU *cpu;
> +    int64_t old_v = -1;
> +
> +    switch (csr) {
> +    case LOONGARCH_CSR_ESTAT:
> +        /* Only IS[1:0] can be write */

"can be written", and then again below.

> +        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, IS, val & 0x3);
> +        break;
> +    case LOONGARCH_CSR_ASID:
> +        old_v = env->CSR_ASID;
> +        /* Only ASID filed of CSR_ASID can be write. */
> +        env->CSR_ASID = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID,
> +                                   val & R_CSR_ASID_ASID_MASK);
> +        if (old_v != val) {
> +            tlb_flush(env_cpu(env));
> +        }
> +        break;
> +    case LOONGARCH_CSR_TCFG:
> +        cpu = LOONGARCH_CPU(env_cpu(env));
> +        old_v = env->CSR_TCFG;
> +        cpu_loongarch_store_constant_timer_config(cpu, val);
> +        break;
> +    case LOONGARCH_CSR_TICLR:
> +        old_v = 0;
> +        env->CSR_ESTAT &= ~(1 << IRQ_TIMER);
> +        cpu_reset_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);

Surely the TIMER irq is not the only interrupt.
The placement of the reset looks incorrect.

And again, I suggest that you *not* use a switch, but use separate helper functions.

> +target_ulong helper_csr_xchgq(CPULoongArchState *env, target_ulong new_val,
> +                              target_ulong mask, uint64_t csr_num)
> +{
> +    unsigned csr_offset = cpu_csr_offset(csr_num);
> +    if (csr_offset == 0) {
> +        /* Undefined CSR: read as 0, writes are ignored. */
> +        return 0;
> +    }
> +
> +    uint64_t *csr = (void *)env + csr_offset;
> +    uint64_t old_val = *csr;
> +
> +    new_val = (new_val & mask) | (old_val & ~mask);
> +
> +    if (csr_num == LOONGARCH_CSR_TCFG) {
> +        LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
> +        cpu_loongarch_store_constant_timer_config(cpu, new_val);
> +    } else {
> +        *csr = new_val;

You're only handling one of the special cases from helper_csr_wrq, so I cannot believe 
this is correct.

I think you should not have a helper_csr_xchgq function, but reuse the read/write 
infrastructure from the other csr access instructions.  Note this would also fix...


> +static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +
> +    if (check_plv(ctx) || ro_csr(a->csr)) {
> +        return false;
> +    }
> +
> +    unsigned csr_offset = cpu_csr_offset(a->csr);
> +    if (csr_offset == 0) {
> +        /* CSR is undefined: write ignored. */
> +        return true;
> +    }
> +
> +    if ((a->csr == LOONGARCH_CSR_ASID) || (a->csr == LOONGARCH_CSR_TCFG) ||
> +        (a->csr == LOONGARCH_CSR_TICLR) || (a->csr == LOONGARCH_CSR_ESTAT)) {
> +        gen_helper_csr_wrq(dest, cpu_env, src1, tcg_constant_i64(a->csr));

ASID change may result in page translation changes (which is why you did tlb_flush).  This 
also means that the page you are now executing could change translation, so you have to 
exit the translation block.

> +    } else {
> +        TCGv temp = tcg_temp_new();
> +        tcg_gen_ld_tl(temp, cpu_env, csr_offset);
> +        tcg_gen_st_tl(src1, cpu_env, csr_offset);
> +        tcg_gen_mov_tl(dest, temp);
> +        tcg_temp_free(temp);
> +
> +        /* Cpu state may be changed, need exit */
> +        if ((a->csr == LOONGARCH_CSR_CRMD) || (a->csr == LOONGARCH_CSR_EUEN)) {
> +            tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
> +            ctx->base.is_jmp = DISAS_EXIT;

... like this.

> +static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
> +{
> +    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
> +    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
> +    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    if (check_plv(ctx) || ro_csr(a->csr)) {
> +        return false;
> +    }
> +    gen_helper_csr_xchgq(dest, cpu_env, src1, src2, tcg_constant_i64(a->csr));
> +    return true;
> +}

... back to xchg, you're not exiting the TB for any of the special cases above.


r~

