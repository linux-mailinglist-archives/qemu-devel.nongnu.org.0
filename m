Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA32CBD8F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:57:49 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRhc-0005Uk-J3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkRfu-00051C-6m
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:56:02 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkRfr-0007hg-E3
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:56:01 -0500
Received: by mail-yb1-xb29.google.com with SMTP id k65so1506073ybk.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 04:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEtaauzF07jmH9+ZnFfoXbyYqWHBC9lS2KeiW+7Buz0=;
 b=Lk1HF+T8ezpDMDooPs1kWNjayD5e9Avf8OpOvyrYLcCY5uwrxwRDsRhhCCfxYfhfnF
 p0vsKrif0F0LgxpPmsCrEgoetdBNVAfNvpKza/eyU50k41bs7+UqllNYSPrqDk15m97C
 9dCwuFdQtZXswP9NNqxCwr4kPSoH+kqtuOw+5+rMEzjDM7Vcw4+nIkqVK62n0tqc828x
 WQcem17GEm/13Sp/XHmPD5AsFU3Bga+vVi+5aNTavxRCd2KsjrhN6zIHPJWmabv3BjpK
 heDcCK4IzQAhaFoznxgH3N+nMzoOE1MZapXMAfE56H/XwK+O0DJdWEYH+V7VBb3+O9hG
 FHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEtaauzF07jmH9+ZnFfoXbyYqWHBC9lS2KeiW+7Buz0=;
 b=GK0KCVycGNmYEUXC4o96lsVxQ07LjiBsYNYDqemJuz7cp9E3wk6xmB++hDfdO0GMzO
 av5PeGB/DlQznUhZBM/7CA56VTKO3qKswmWIiTYyYfJHO6tWC4qj1mm0CiuFT2vilkEo
 4q1hx/Od6OApKzBwAc0XxWaYyqRqcL4iiIh0WZDgNeuVmmN/wr7LaQZ7eT9kt95lpsTE
 grz/heXHWNC6yhitPN4hE0A2tLyb8U1L3EzeZytncEtMl+wLROUPpj2AM6i9LD/VQu8B
 ebqZKwQLUUI1Pm9JlyrMcPsqmOYWQ/5FDDUwaDGz2HnU+q1DpGMeCx+wHxWXCm59yAPx
 xyHQ==
X-Gm-Message-State: AOAM530Fo5sfzN9RZwOvWOchdpja79a9WjD/e5qxXfu8FnIc+cRQWARi
 sTv4d6COG0Im8thQWUNFoS/tmeVznThCPDloV88=
X-Google-Smtp-Source: ABdhPJyuzfeW1i2P65voFnl0y4fd0pT/sig6gkyhVtp44CrHaOjrjNml4v7PchAjhveZCGT+ujznG94CD4iFCdX43D4=
X-Received: by 2002:a25:58f:: with SMTP id 137mr2460672ybf.200.1606913757663; 
 Wed, 02 Dec 2020 04:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
In-Reply-To: <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Wed, 2 Dec 2020 12:55:46 +0000
Message-ID: <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

Thank you so much for your reviews.
I will start working on improving the code straight away to try to
minimize waiting times.

However lets just address the elephant in the room.
Indeed we have the TCG definitions being generated.
However we are very serious about wanting to upstream our port and we
will certainly maintain this code.

I totally understand your concerns with generated code.

To explain our decision, we have an internal database that we are able
to describe the architecture and map encoding with hw semantics, and
for the sake of saving us debug time generating each and every
instruction, we use it to generate both the TCG and instruction
decoding tables that you have already reviewed.
This tool is not only used in QEmu but through all our tools code,
allowing us to cross validate the content of the database.

Considering our situation and current state of the port, what would
you think is a reasonable compromise?

Once again thanks for the reviews.

Best regards,
Cupertino


On Tue, Dec 1, 2020 at 11:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/11/20 10:17 AM, cupertinomiranda@gmail.com wrote:
> > +    case 0x09:
> > +        /* (N & V & !Z) | (!N & !V & !Z) */
>
> This is xnor(N, V) & !Z, and since as you now know xnor = eqv, you can perform
> this in just two steps.
>
>     tcg_gen_eqv_tl(ret, cpu_Nf, cpu_Vf);
>     tcg_gen_andc_tl(ret, ret, cpu_Zf);
>
> > +    /* GE */
> > +    case 0x0A:
> > +        /* (N & V) | (!N & !V) */
>
> xnor(N, V)
>
> > +    /* LT */
> > +    case 0x0B:
> > +        /* (N & !V) | (!N & V) */
>
> xor(N, V)
>
> > +    /* LE */
> > +    case 0x0C:
> > +        /* Z | (N & !V) | (!N & V) */
>
> xor(N, V) | Z
>
> > +    /* HI */
> > +    case 0x0D:
> > +        /* !C & !Z */
> > +        tcg_gen_xori_tl(nC, cpu_Cf, 1);
> > +        tcg_gen_xori_tl(nZ, cpu_Zf, 1);
> > +
> > +        tcg_gen_and_tl(ret, nC, nZ);
>
> !A & !B -> !(A | B), so one fewer xor.
>
> > +    /* PNZ */
> > +    case 0x0F:
> > +        /* !N & !Z */
>
> Likewise.
>
> > +void arc_gen_set_memory(DisasCtxt *ctx, TCGv vaddr, int size,
> > +        TCGv src, bool sign_extend)
> > +{
> > +    switch (size) {
> > +    case 0x00:
> > +        tcg_gen_qemu_st_tl(src, vaddr, MEMIDX, MO_UL);
> > +        break;
>
> Surely you'd put all of this size+sign-extend mapping into a table and issue
> just one tcg_gen_qemu_st_tl.
>
> > +void arc_gen_get_memory(DisasCtxt *ctx, TCGv dest, TCGv vaddr,
> > +        int size, bool sign_extend)
> > +{
>
> And re-use the same table here, it would appear.
>
> > +void arc_gen_no_further_loads_pending(DisasCtxt *ctx, TCGv ret)
> > +{
> > +    tcg_gen_movi_tl(ret, 1);
> > +}
>
> Huh?  A missing TODO, perhaps?
>
> > +extern bool enabled_interrupts;
>
> Race condition.  What is a global variable doing being set by a translation thread?
>
>
> > +void
> > +arc_gen_execute_delayslot(DisasCtxt *ctx, TCGv bta, TCGv take_branch)
> > +{
> > +    static int in_delay_slot = false;
>
> And another one.  Surely these belong in DisasContext.
>
> > +
> > +    assert(ctx->insn.limm_p == 0 && !in_delay_slot);
> > +
> > +    if (ctx->insn.limm_p == 0 && !in_delay_slot) {
> > +        in_delay_slot = true;
> > +        uint32_t cpc = ctx->cpc;
> > +        uint32_t pcl = ctx->pcl;
> > +        insn_t insn = ctx->insn;
> > +
> > +        ctx->cpc = ctx->npc;
> > +        ctx->pcl = ctx->cpc & 0xfffffffc;
> > +
> > +        ++ctx->ds;
> > +
> > +        TCGLabel *do_not_set_bta_and_de = gen_new_label();
> > +        tcg_gen_brcondi_i32(TCG_COND_NE, take_branch, 1, do_not_set_bta_and_de);
> > +        /*
> > +         * In case an exception should be raised during the execution
> > +         * of delay slot, bta value is used to set erbta.
> > +         */
> > +        tcg_gen_mov_tl(cpu_bta, bta);
> > +        /* We are in a delay slot */
> > +        tcg_gen_mov_tl(cpu_DEf, take_branch);
> > +        gen_set_label(do_not_set_bta_and_de);
> > +
> > +        tcg_gen_movi_tl(cpu_is_delay_slot_instruction, 1);
> > +
> > +        /* Set the pc to the next pc */
> > +        tcg_gen_movi_tl(cpu_pc, ctx->npc);
> > +        /* Necessary for the likely call to restore_state_to_opc() */
> > +        tcg_gen_insn_start(ctx->npc);
>
> Wow, this looks wrong.
>
> It doesn't work with icount or single-stepping.  You need to be able to begin a
> TB at any instruction, including a delay slot.
>
> You should have a look at some of the other targets that handle this, e.g.
> openrisc or sparc.  Since you've got NPC already, for looping, sparc is
> probably the better match.
>
> There should be no reason why you'd need to emit insn_start outside of
> arc_tr_insn_start.
>
> > +void arc_gen_set_register(enum arc_registers reg, TCGv value)
> > +{
> > +    switch (reg) {
> > +    case R_SP:
> > +        tcg_gen_mov_i32(cpu_sp, value);
> > +        break;
> > +    case R_STATUS32:
> > +        gen_helper_set_status32(cpu_env, value);
>
> Lots of changes to status imply a significant change to processor state, and so
> you need to exit to the main loop.
>
> > +/* TODO: Get this from props ... */
> > +void arc_has_interrupts(DisasCtxt *ctx, TCGv ret)
> > +{
> > +    tcg_gen_movi_i32(ret, 1);
> > +}
> > +
> > +/*
> > + ***************************************
> > + * Statically inferred return function *
> > + ***************************************
> > + */
> > +
> > +TCGv arc_gen_next_reg(const DisasCtxt *ctx, TCGv reg)
> > +{
> > +    int i;
> > +    for (i = 0; i < 64; i += 2) {
> > +        if (reg == cpu_r[i]) {
> > +            return cpu_r[i + 1];
> > +        }
> > +    }
> > +    /* Check if REG is an odd register. */
> > +    for (i = 1; i < 64; i += 2) {
> > +        /* If so, that is unsanctioned. */
> > +        if (reg == cpu_r[i]) {
> > +            arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
> > +            return NULL;
> > +        }
> > +    }
>
> Wow, really?  Can't you grab this directly from the operand decoding?  Where
> surely we have already ensured that the relevant regnos are not odd.
>
> > +    /* REG was not a register after all. */
> > +    g_assert_not_reached();
> > +
> > +    /* We never get here, but to accommodate -Werror ... */
> > +    return NULL;
>
> The g_assert_not reached should have been sufficient.
>
> > @@ -0,0 +1,280 @@
> > +/*
> > + * QEMU ARC CPU
> > + *
> > + * Copyright (c) 2020 Synppsys Inc.
> > + * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see
> > + * http://www.gnu.org/licenses/lgpl-2.1.html
> > + */
> > +
> > +#ifndef TRANSLATE_INST_H_
> > +#define TRANSLATE_INST_H_
> > +
> > +#include "translate.h"
> > +#include "qemu/bitops.h"
> > +#include "tcg/tcg.h"
> > +#include "target/arc/regs.h"
> > +
> > +typedef enum ARC_COND {
> > +    ARC_COND_AL      = 0x00,
> > +    ARC_COND_RA      = 0x00,
> > +    ARC_COND_EQ      = 0x01,
> > +    ARC_COND_Z       = 0x01,
> > +    ARC_COND_NE      = 0x02,
> > +    ARC_COND_NZ      = 0x02,
> > +    ARC_COND_PL      = 0x03,
> > +    ARC_COND_P       = 0x03,
> > +    ARC_COND_MI      = 0x04,
> > +    ARC_COND_N       = 0x04,
> > +    ARC_COND_CS      = 0x05,
> > +    ARC_COND_C       = 0x05,
> > +    ARC_COND_LO      = 0x05,
> > +    ARC_COND_CC      = 0x06,
> > +    ARC_COND_NC      = 0x06,
> > +    ARC_COND_HS      = 0x06,
> > +    ARC_COND_VS      = 0x07,
> > +    ARC_COND_V       = 0x07,
> > +    ARC_COND_VC      = 0x08,
> > +    ARC_COND_NV      = 0x08,
> > +    ARC_COND_GT      = 0x09,
> > +    ARC_COND_GE      = 0x0a,
> > +    ARC_COND_LT      = 0x0b,
> > +    ARC_COND_LE      = 0x0c,
> > +    ARC_COND_HI      = 0x0d,
> > +    ARC_COND_LS      = 0x0e,
> > +    ARC_COND_PNZ     = 0x0f,
> > +} ARC_COND;
>
> arc_gen_verifyCCFlag should have used these enumerators.
>
> > +#define killDelaySlot()
>
> noop macro?
>
> > diff --git a/target/arc/semfunc.c b/target/arc/semfunc.c
> > new file mode 100644
> > index 0000000000..dc81563cc4
> > --- /dev/null
> > +++ b/target/arc/semfunc.c
> > @@ -0,0 +1,8473 @@
> > +/*
> > + * QEMU ARC CPU
> > + *
> > + * Copyright (c) 2020 Synppsys Inc.
> > + * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see
> > + * http://www.gnu.org/licenses/lgpl-2.1.html
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "translate.h"
> > +#include "target/arc/semfunc.h"
> > +
> > +/*
> > + * FLAG
> > + *    Variables: @src
> > + *    Functions: getCCFlag, getRegister, getBit, hasInterrupts, Halt, ReplMask,
> > + *               targetHasOption, setRegister
> > + * --- code ---
> > + * {
> > + *   cc_flag = getCCFlag ();
> > + *   if((cc_flag == true))
> > + *     {
> > + *       status32 = getRegister (R_STATUS32);
> > + *       if(((getBit (@src, 0) == 1) && (getBit (status32, 7) == 0)))
> > + *         {
> > + *           if((hasInterrupts () > 0))
> > + *             {
> > + *               status32 = (status32 | 1);
> > + *               Halt ();
> > + *             };
> > + *         }
> > + *       else
> > + *         {
> > + *           ReplMask (status32, @src, 3840);
> > + *           if(((getBit (status32, 7) == 0) && (hasInterrupts () > 0)))
> > + *             {
> > + *               ReplMask (status32, @src, 30);
> > + *               if(targetHasOption (DIV_REM_OPTION))
> > + *                 {
> > + *                   ReplMask (status32, @src, 8192);
> > + *                 };
> > + *               if(targetHasOption (STACK_CHECKING))
> > + *                 {
> > + *                   ReplMask (status32, @src, 16384);
> > + *                 };
> > + *               if(targetHasOption (LL64_OPTION))
> > + *                 {
> > + *                   ReplMask (status32, @src, 524288);
> > + *                 };
> > + *               ReplMask (status32, @src, 1048576);
> > + *             };
> > + *         };
> > + *       setRegister (R_STATUS32, status32);
> > + *     };
> > + * }
> > + */
> > +
> > +int
> > +arc_gen_FLAG(DisasCtxt *ctx, TCGv src)
> > +{
> > +    int ret = DISAS_NEXT;
> > +    TCGv temp_13 = tcg_temp_local_new_i32();
> > +    TCGv cc_flag = tcg_temp_local_new_i32();
> > +    TCGv temp_1 = tcg_temp_local_new_i32();
> > +    TCGv temp_2 = tcg_temp_local_new_i32();
> > +    TCGv temp_14 = tcg_temp_local_new_i32();
> > +    TCGv status32 = tcg_temp_local_new_i32();
> > +    TCGv temp_16 = tcg_temp_local_new_i32();
> > +    TCGv temp_15 = tcg_temp_local_new_i32();
> > +    TCGv temp_3 = tcg_temp_local_new_i32();
> > +    TCGv temp_18 = tcg_temp_local_new_i32();
> > +    TCGv temp_17 = tcg_temp_local_new_i32();
> > +    TCGv temp_4 = tcg_temp_local_new_i32();
> > +    TCGv temp_5 = tcg_temp_local_new_i32();
> > +    TCGv temp_6 = tcg_temp_local_new_i32();
> > +    TCGv temp_19 = tcg_temp_local_new_i32();
> > +    TCGv temp_7 = tcg_temp_local_new_i32();
> > +    TCGv temp_8 = tcg_temp_local_new_i32();
> > +    TCGv temp_20 = tcg_temp_local_new_i32();
> > +    TCGv temp_22 = tcg_temp_local_new_i32();
> > +    TCGv temp_21 = tcg_temp_local_new_i32();
> > +    TCGv temp_9 = tcg_temp_local_new_i32();
> > +    TCGv temp_23 = tcg_temp_local_new_i32();
> > +    TCGv temp_10 = tcg_temp_local_new_i32();
> > +    TCGv temp_11 = tcg_temp_local_new_i32();
> > +    TCGv temp_12 = tcg_temp_local_new_i32();
> > +    TCGv temp_24 = tcg_temp_local_new_i32();
> > +    TCGv temp_25 = tcg_temp_local_new_i32();
> > +    TCGv temp_26 = tcg_temp_local_new_i32();
> > +    TCGv temp_27 = tcg_temp_local_new_i32();
> > +    TCGv temp_28 = tcg_temp_local_new_i32();
> > +    getCCFlag(temp_13);
> > +    tcg_gen_mov_i32(cc_flag, temp_13);
> > +    TCGLabel *done_1 = gen_new_label();
> > +    tcg_gen_setcond_i32(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> > +    tcg_gen_xori_i32(temp_2, temp_1, 1);
> > +    tcg_gen_andi_i32(temp_2, temp_2, 1);
> > +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_2, arc_true, done_1);
> > +    getRegister(temp_14, R_STATUS32);
> > +    tcg_gen_mov_i32(status32, temp_14);
> > +    TCGLabel *else_2 = gen_new_label();
> > +    TCGLabel *done_2 = gen_new_label();
> > +    tcg_gen_movi_i32(temp_16, 0);
> > +    getBit(temp_15, src, temp_16);
> > +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_3, temp_15, 1);
> > +    tcg_gen_movi_i32(temp_18, 7);
> > +    getBit(temp_17, status32, temp_18);
> > +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_4, temp_17, 0);
> > +    tcg_gen_and_i32(temp_5, temp_3, temp_4);
> > +    tcg_gen_xori_i32(temp_6, temp_5, 1);
> > +    tcg_gen_andi_i32(temp_6, temp_6, 1);
> > +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_6, arc_true, else_2);
> > +    TCGLabel *done_3 = gen_new_label();
> > +    hasInterrupts(temp_19);
> > +    tcg_gen_setcondi_i32(TCG_COND_GT, temp_7, temp_19, 0);
> > +    tcg_gen_xori_i32(temp_8, temp_7, 1);
> > +    tcg_gen_andi_i32(temp_8, temp_8, 1);
> > +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_8, arc_true, done_3);
> > +    tcg_gen_ori_i32(status32, status32, 1);
> > +    Halt();
> > +    gen_set_label(done_3);
> > +    tcg_gen_br(done_2);
> > +    gen_set_label(else_2);
> > +    tcg_gen_movi_i32(temp_20, 3840);
> > +    ReplMask(status32, src, temp_20);
> > +    TCGLabel *done_4 = gen_new_label();
> > +    tcg_gen_movi_i32(temp_22, 7);
> > +    getBit(temp_21, status32, temp_22);
> > +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_9, temp_21, 0);
> > +    hasInterrupts(temp_23);
> > +    tcg_gen_setcondi_i32(TCG_COND_GT, temp_10, temp_23, 0);
> > +    tcg_gen_and_i32(temp_11, temp_9, temp_10);
> > +    tcg_gen_xori_i32(temp_12, temp_11, 1);
> > +    tcg_gen_andi_i32(temp_12, temp_12, 1);
> > +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_12, arc_true, done_4);
> > +    tcg_gen_movi_i32(temp_24, 30);
> > +    ReplMask(status32, src, temp_24);
> > +    if (targetHasOption (DIV_REM_OPTION)) {
> > +        tcg_gen_movi_i32(temp_25, 8192);
> > +        ReplMask(status32, src, temp_25);
> > +    }
> > +    if (targetHasOption (STACK_CHECKING)) {
> > +        tcg_gen_movi_i32(temp_26, 16384);
> > +        ReplMask(status32, src, temp_26);
> > +    }
> > +    if (targetHasOption (LL64_OPTION)) {
> > +        tcg_gen_movi_i32(temp_27, 524288);
> > +        ReplMask(status32, src, temp_27);
> > +    }
> > +    tcg_gen_movi_i32(temp_28, 1048576);
> > +    ReplMask(status32, src, temp_28);
> > +    gen_set_label(done_4);
> > +    gen_set_label(done_2);
> > +    setRegister(R_STATUS32, status32);
> > +    gen_set_label(done_1);
> > +    tcg_temp_free(temp_13);
> > +    tcg_temp_free(cc_flag);
> > +    tcg_temp_free(temp_1);
> > +    tcg_temp_free(temp_2);
> > +    tcg_temp_free(temp_14);
> > +    tcg_temp_free(status32);
> > +    tcg_temp_free(temp_16);
> > +    tcg_temp_free(temp_15);
> > +    tcg_temp_free(temp_3);
> > +    tcg_temp_free(temp_18);
> > +    tcg_temp_free(temp_17);
> > +    tcg_temp_free(temp_4);
> > +    tcg_temp_free(temp_5);
> > +    tcg_temp_free(temp_6);
> > +    tcg_temp_free(temp_19);
> > +    tcg_temp_free(temp_7);
> > +    tcg_temp_free(temp_8);
> > +    tcg_temp_free(temp_20);
> > +    tcg_temp_free(temp_22);
> > +    tcg_temp_free(temp_21);
> > +    tcg_temp_free(temp_9);
> > +    tcg_temp_free(temp_23);
> > +    tcg_temp_free(temp_10);
> > +    tcg_temp_free(temp_11);
> > +    tcg_temp_free(temp_12);
> > +    tcg_temp_free(temp_24);
> > +    tcg_temp_free(temp_25);
> > +    tcg_temp_free(temp_26);
> > +    tcg_temp_free(temp_27);
> > +    tcg_temp_free(temp_28);
> > +
> > +    return ret;
> > +}
>
> Riiiight.  Auto-generated code, clearly.
>
> What program generated this, and from what source?  As it stands this is
> unmaintainable.  I'm going to stop reviewing now.
>
>
> r~

