Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B932B2CAFDF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 23:18:26 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkDyb-0002h1-9G
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 17:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkDxA-0001z0-7T
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:16:56 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:37144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkDx8-0006Nj-0P
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 17:16:55 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id t23so799028oov.4
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 14:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xDh0Zx0mBv8xm9nrH4FSZIw5vJhBZ0OrId00N6Xy1QY=;
 b=sBb6OotXzvZxhfHPtuKuWtqmDmZq57FV5SLMo+yCGHZ6s51RBbWSLT8TfxmKucD7i3
 vu8c8649hJSzvHdm8nsnkBfEWxsd8rH4auBqxS5kwkDgdVNglSzb/zBNZ3xcUeJ4CERE
 UZwXsS9kK0C6BvZIxrHav8jo2Luuc207Tbdrq1lmnkilQSnq6d4ZqcfWxSc47YYRQiCs
 HmcJIlRxoWjlLCtd60xGplId1z4knUNojJfnAp/UWQTrZcl3ft8uPFuPn7FaEVV5J+6d
 A4cni1RPIBm75UeJVWU3lwKtk85yCaeiL4+ghR7LZQTzPvD2ZPvAqetJG9MUafWcx25d
 gp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xDh0Zx0mBv8xm9nrH4FSZIw5vJhBZ0OrId00N6Xy1QY=;
 b=tRdGhUs8sklpWbweRl6cthFypb+hTyL3MNO6JprCAXAxabRABgVn+AJRbBMVokfOe4
 YJ/w02ngqv6YTBFJyewsMfn05pIfM69Gmb3iC7h279PSPm13IE/I3SC5rm5RdnFhTkZ6
 0NdVSvxoTtl0smwYM/vxRK4YLfdZA2buczBq93sRXb5aGhTVxh9/harIlMDWHEtd/G7k
 z9vFCfwH/aH5ex3Y7UPKvjOT82mAXvDnZPC8kcQr5F/v96r0NMc3zHSdkIxeTJNJ5/2p
 Ew2DCFY0QIGrxjR7FFb43WBwHdidni3RrhxWAxoa5s+OnwOAn+5WOwUsjSaKniyuMvh4
 oOQw==
X-Gm-Message-State: AOAM530tJjn1tYI7sM+Kk8qx7vnN4QmFvmhTBSJdgSGnk8NiTaC8wGOk
 ud5XIuHA+rSkJAIxs6klgBHUNQ==
X-Google-Smtp-Source: ABdhPJyer4WuH6k+9QxwZY4zE0+qV0Ll3GoFozzcYhZX82dXqy2x1/3GjdBpZruOKEBwZ46q0Zl7ng==
X-Received: by 2002:a4a:7055:: with SMTP id b21mr3475556oof.66.1606861012479; 
 Tue, 01 Dec 2020 14:16:52 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id q129sm220202oif.43.2020.12.01.14.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 14:16:51 -0800 (PST)
Subject: Re: [PATCH 05/15] arc: TCG instruction generator and hand-definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-6-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b75a1e6-481c-1fe0-00b9-518b01fd53bd@linaro.org>
Date: Tue, 1 Dec 2020 16:16:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-6-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
> +/*
> + * The macro to add boiler plate code for conditional execution.
> + * It will add tcg_gen codes only if there is a condition to
> + * be checked (ctx->insn.cc != 0). This macro assumes that there
> + * is a "ctx" variable of type "DisasCtxt *" in context. Remember
> + * to pair it with CC_EPILOGUE macro.
> + */
> +#define CC_PROLOGUE                                   \
> +  TCGv cc = tcg_temp_local_new();                     \
> +  TCGLabel *done = gen_new_label();                   \
> +  do {                                                \
> +    if (ctx->insn.cc) {                               \
> +        arc_gen_verifyCCFlag(ctx, cc);                \
> +        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done); \
> +    }                                                 \
> +  } while (0)
> +
> +/*
> + * The finishing counter part of CC_PROLUGE. This is supposed
> + * to be put at the end of the function using it.
> + */
> +#define CC_EPILOGUE          \
> +    if (ctx->insn.cc) {      \
> +        gen_set_label(done); \
> +    }                        \
> +    tcg_temp_free(cc)

Why would this need to be boiler-plate?  Why would this not simply exist in
exactly one location?

You don't need a tcg_temp_local_new, because the cc value is not used past the
branch.  You should free the temp immediately after the branch.

> +void gen_goto_tb(DisasContext *ctx, int n, TCGv dest)
> +{
> +    tcg_gen_mov_tl(cpu_pc, dest);
> +    tcg_gen_andi_tl(cpu_pcl, dest, 0xfffffffc);
> +    if (ctx->base.singlestep_enabled) {
> +        gen_helper_debug(cpu_env);
> +    }
> +    tcg_gen_exit_tb(NULL, 0);

Missing else.  This is dead code for single-step.

> +void arc_translate_init(void)
> +{
> +    int i;
> +    static int init_not_done = 1;
> +
> +    if (init_not_done == 0) {
> +        return;
> +    }

Useless.  This will only be called once.

> +#define ARC_REG_OFFS(x) offsetof(CPUARCState, x)
> +
> +#define NEW_ARC_REG(x) \
> +        tcg_global_mem_new_i32(cpu_env, offsetof(CPUARCState, x), #x)
> +
> +    cpu_S1f = NEW_ARC_REG(macmod.S1);
> +    cpu_S2f = NEW_ARC_REG(macmod.S2);
> +    cpu_CSf = NEW_ARC_REG(macmod.CS);
> +
> +    cpu_Zf  = NEW_ARC_REG(stat.Zf);
> +    cpu_Lf  = NEW_ARC_REG(stat.Lf);
> +    cpu_Nf  = NEW_ARC_REG(stat.Nf);
> +    cpu_Cf  = NEW_ARC_REG(stat.Cf);
> +    cpu_Vf  = NEW_ARC_REG(stat.Vf);
> +    cpu_Uf  = NEW_ARC_REG(stat.Uf);
> +    cpu_DEf = NEW_ARC_REG(stat.DEf);
> +    cpu_ESf = NEW_ARC_REG(stat.ESf);
> +    cpu_AEf = NEW_ARC_REG(stat.AEf);
> +    cpu_Hf  = NEW_ARC_REG(stat.Hf);
> +    cpu_IEf = NEW_ARC_REG(stat.IEf);
> +    cpu_Ef  = NEW_ARC_REG(stat.Ef);
> +
> +    cpu_is_delay_slot_instruction = NEW_ARC_REG(stat.is_delay_slot_instruction);
> +
> +    cpu_l1_Zf = NEW_ARC_REG(stat_l1.Zf);
> +    cpu_l1_Lf = NEW_ARC_REG(stat_l1.Lf);
> +    cpu_l1_Nf = NEW_ARC_REG(stat_l1.Nf);
> +    cpu_l1_Cf = NEW_ARC_REG(stat_l1.Cf);
> +    cpu_l1_Vf = NEW_ARC_REG(stat_l1.Vf);
> +    cpu_l1_Uf = NEW_ARC_REG(stat_l1.Uf);
> +    cpu_l1_DEf = NEW_ARC_REG(stat_l1.DEf);
> +    cpu_l1_AEf = NEW_ARC_REG(stat_l1.AEf);
> +    cpu_l1_Hf = NEW_ARC_REG(stat_l1.Hf);
> +
> +    cpu_er_Zf = NEW_ARC_REG(stat_er.Zf);
> +    cpu_er_Lf = NEW_ARC_REG(stat_er.Lf);
> +    cpu_er_Nf = NEW_ARC_REG(stat_er.Nf);
> +    cpu_er_Cf = NEW_ARC_REG(stat_er.Cf);
> +    cpu_er_Vf = NEW_ARC_REG(stat_er.Vf);
> +    cpu_er_Uf = NEW_ARC_REG(stat_er.Uf);
> +    cpu_er_DEf = NEW_ARC_REG(stat_er.DEf);
> +    cpu_er_AEf = NEW_ARC_REG(stat_er.AEf);
> +    cpu_er_Hf = NEW_ARC_REG(stat_er.Hf);
> +
> +    cpu_eret = NEW_ARC_REG(eret);
> +    cpu_erbta = NEW_ARC_REG(erbta);
> +    cpu_ecr = NEW_ARC_REG(ecr);
> +    cpu_efa = NEW_ARC_REG(efa);
> +    cpu_bta = NEW_ARC_REG(bta);
> +    cpu_lps = NEW_ARC_REG(lps);
> +    cpu_lpe = NEW_ARC_REG(lpe);
> +    cpu_pc = NEW_ARC_REG(pc);
> +    cpu_npc = NEW_ARC_REG(npc);
> +
> +    cpu_bta_l1 = NEW_ARC_REG(bta_l1);
> +    cpu_bta_l2 = NEW_ARC_REG(bta_l2);
> +
> +    cpu_intvec = NEW_ARC_REG(intvec);
> +
> +    for (i = 0; i < 64; i++) {
> +        char name[16];
> +
> +        sprintf(name, "r[%d]", i);
> +
> +        cpu_r[i] = tcg_global_mem_new_i32(cpu_env,
> +                                          ARC_REG_OFFS(r[i]),
> +                                          strdup(name));
> +    }
> +
> +    cpu_gp     = cpu_r[26];
> +    cpu_fp     = cpu_r[27];
> +    cpu_sp     = cpu_r[28];
> +    cpu_ilink1 = cpu_r[29];
> +    cpu_ilink2 = cpu_r[30];
> +    cpu_blink  = cpu_r[31];
> +    cpu_acclo  = cpu_r[58];
> +    cpu_acchi  = cpu_r[59];
> +    cpu_lpc    = cpu_r[60];
> +    cpu_limm   = cpu_r[62];
> +    cpu_pcl    = cpu_r[63];

You shouldn't need two pointers to these.  Either use cpu_r[PCL] (preferred) or
#define cpu_pcl cpu_r[63].

You could put all of these into a const static table.

> +static int arc_gen_INVALID(const DisasContext *ctx)
> +{
> +    fprintf(stderr, "invalid inst @:%08x\n", ctx->cpc);

Never fprintf.  Raise an exception like you're supposed to.

> +/* Arrange to middle endian, used by LITTLE ENDIAN systems. */
> +static uint32_t arc_getm32(uint32_t data)
> +{
> +    uint32_t value = 0;
> +
> +    value  = (data & 0x0000ffff) << 16;
> +    value |= (data & 0xffff0000) >> 16;
> +    return value;
> +}

This is ror32(data, 16).

> +/* Check if OPR is a register _and_ an even numbered one. */
> +static inline bool is_odd_numbered_register(const operand_t opr)

comment s/even/odd/.

> +static void add_constant_operand(enum arc_opcode_map mapping,
> +                                 uint8_t operand_number,
> +                                 uint32_t value)
> +{
> +    struct constant_operands **t = &(map_constant_operands[mapping]);
> +    while (*t != NULL) {
> +        t = &((*t)->next);
> +    }
> +    *t = (struct constant_operands *) malloc(sizeof(struct constant_operands));

Use g_new, which doesn't require error checking, which is missing here.

That said...

> +static void init_constants(void)
> +{
> +#define SEMANTIC_FUNCTION(...)
> +#define MAPPING(...)
> +#define CONSTANT(NAME, MNEMONIC, OP_NUM, VALUE) \
> +  add_constant_operand(MAP_##MNEMONIC##_##NAME, OP_NUM, VALUE);
> +#include "target/arc/semfunc_mapping.def"
> +#include "target/arc/extra_mapping.def"
> +#undef MAPPING
> +#undef CONSTANT
> +#undef SEMANTIC_FUNCTION
> +}

Ew.  Yet another thing that can be done at build time.

> +static TCGv arc_decode_operand(const struct arc_opcode *opcode,
> +                               DisasContext *ctx,
> +                               unsigned char nop,
> +                               enum arc_opcode_map mapping)
> +{
> +    TCGv ret;
> +
> +    if (nop >= ctx->insn.n_ops) {
> +        struct constant_operands *co = constant_entry_for(mapping, nop);
> +        assert(co != NULL);
> +        ret = tcg_const_local_i32(co->default_value);
> +        return ret;
> +    } else {
> +        operand_t operand = ctx->insn.operands[nop];
> +
> +        if (operand.type & ARC_OPERAND_IR) {
> +            ret = cpu_r[operand.value];
> +            if (operand.value == 63) {
> +                tcg_gen_movi_tl(cpu_pcl, ctx->pcl);
> +            }
> +      } else {

Really bad indention.

> +            int32_t limm = operand.value;
> +            if (operand.type & ARC_OPERAND_LIMM) {
> +                limm = ctx->insn.limm;
> +                tcg_gen_movi_tl(cpu_limm, limm);
> +                ret = cpu_r[62];
> +            } else {
> +                ret = tcg_const_local_i32(limm);
> +            }
> +        }
> +    }
> +
> +  return ret;

Why are you using locals for everything?  Is it because you have no proper
control over your use of branching?

> +    qemu_log_mask(CPU_LOG_TB_IN_ASM,
> +                  "CPU in sleep mode, waiting for an IRQ.\n");

Incorrect level at which to log this.

You wanted the logging at runtime, not translate. Which suggests you'd be
better off moving this entire function to a helper.

> +/* Return from exception. */
> +static void gen_rtie(DisasContext *ctx)
> +{
> +    tcg_gen_movi_tl(cpu_pc, ctx->cpc);
> +    gen_helper_rtie(cpu_env);
> +    tcg_gen_mov_tl(cpu_pc, cpu_pcl);
> +    gen_goto_tb(ctx, 1, cpu_pc);
> +}

You must return to the main loop here, not goto_tb.  You must return to the
main loop every time your interrupt mask changes, so that pending interrupts
may be accepted.

> +    val = ((val << 16) & 0xffff0000) | (val & 0xffff);

  val = deposit32(val, 16, 16, val);

> +static TCGv_i64 dup_limm_to_i64(int32_t limm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = limm;
> +    val = (val << 32) | (val & 0xffffffff);

  val = deposit64(val, 32, 32, val);
or
  val = dup_const(val, MO_32);

> +static TCGv_i64 quad_shimm_to_i64(int16_t shimm)
> +{
> +    TCGv_i64 vec64 = tcg_temp_new_i64();
> +    int64_t val = shimm;
> +    val = (val << 48) | ((val << 32) & 0x0000ffff00000000) |
> +          ((val << 16) & 0x00000000ffff0000) | (val & 0xffff);

  val = dup_const(val, MO_16);

> + *    This is a truth table for XNOR(a,b):
> + *      NOT(XOR(a,b))=XOR(XOR(a,b),1)

Yes, well, XNOR = tcg_gen_eqv_tl, which is what tcg_gen_vec_sub16_i64 uses.
Unfortunately, we only have 64-bit implementations of these generically.

> +        default:
> +            arc_debug_opcode(opcode, ctx, "No handle for map opcode");
> +            g_assert(!"Semantic not handled: Use -d unimp to list it.");

This must raise an exception, or return false, or something.


r~

