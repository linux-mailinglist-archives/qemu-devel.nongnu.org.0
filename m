Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38292CB0AA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 00:12:41 +0100 (CET)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkEp6-0003CE-9x
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 18:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkEm3-00029L-BL
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 18:09:32 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkEly-0006Oa-L6
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 18:09:29 -0500
Received: by mail-ot1-x330.google.com with SMTP id n12so3418058otk.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g9WvD/MnpIRXqZUygolR2YAxUCnF0V067lynpeZCE6A=;
 b=NJGee2K4+5l93HEryBBPNjISL2G+KXlAslT4jbkPLlrM8i/avggQUiM4kjqJmmZkdK
 VQVIIBU2EXZlHQUOgSXklMqBD3k34LZ7xYTOZb7hzv1+AwxDGFowTFvKPpLJtv4OjqTq
 jOARSPP5exnHMmvtUIc1yLNDhrKZTOh8LbgGiV4IkFf+5ZLgyUfHBNUXR135UOT47hKd
 P/4XchIJ3rYLqlGQykWBDLtlCPbu+sxL8E9eD1b4uIu8HNLSVuWv3Q5Q1qZhzX/3BL1j
 bdi8qrmBOKhmsZ4gDO2YA2NIufK2qFWjNuZWjAwcXAYkOkk2RM5EWbCoOhysShikKsaX
 Y48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g9WvD/MnpIRXqZUygolR2YAxUCnF0V067lynpeZCE6A=;
 b=rWpFGrQigEr3f1aNtIWUiRTiZgWcU6ciLJOqLJsh0Y8lqp844Itq5Dai2b3BVcaS1L
 AiDwwaKj4My3biqC3najJWcgLkk0XL8jNqIZxRCW3Y4O/qoRALu1TT+Hv88gKYrZoERr
 p8BNAIAduFhl/yBUBopzKMpuvssRiyrkJxaLesUs1WP/qV7eS6mkZbB4wew/f8c7iZPL
 /N7fN5vxsE5JYgN4eqX7FZGLkVxNbUa3G301mviguRV1EUqmh7Ol+o/gtH+/dQ/rQmRY
 85FKpp983/d7WpR/dfQdK5mo8uZk579qdo8qzKDXpGH5Ih+Rh+vin01c7q6nWniOW9n8
 0zhA==
X-Gm-Message-State: AOAM530Z1TgEc9KVZXFvWTD7MS9aHZW6zI8am5ZZos9mR7mbzY32Q4Kj
 zH+bDrAfNOOj4uYO7qXT2c+Mpg==
X-Google-Smtp-Source: ABdhPJwvy3t89FedMXns4fTvbViSHuokDtKCiE8ye6d7xVEibxP3jJabI1r+kWq4WBDfcLQP9HcahA==
X-Received: by 2002:a05:6830:2143:: with SMTP id
 r3mr3543534otd.189.1606864160991; 
 Tue, 01 Dec 2020 15:09:20 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g2sm291439ooh.39.2020.12.01.15.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 15:09:20 -0800 (PST)
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
Date: Tue, 1 Dec 2020 17:09:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111161758.9636-7-cupertinomiranda@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
> +    case 0x09:
> +        /* (N & V & !Z) | (!N & !V & !Z) */

This is xnor(N, V) & !Z, and since as you now know xnor = eqv, you can perform
this in just two steps.

    tcg_gen_eqv_tl(ret, cpu_Nf, cpu_Vf);
    tcg_gen_andc_tl(ret, ret, cpu_Zf);

> +    /* GE */
> +    case 0x0A:
> +        /* (N & V) | (!N & !V) */

xnor(N, V)

> +    /* LT */
> +    case 0x0B:
> +        /* (N & !V) | (!N & V) */

xor(N, V)

> +    /* LE */
> +    case 0x0C:
> +        /* Z | (N & !V) | (!N & V) */

xor(N, V) | Z

> +    /* HI */
> +    case 0x0D:
> +        /* !C & !Z */
> +        tcg_gen_xori_tl(nC, cpu_Cf, 1);
> +        tcg_gen_xori_tl(nZ, cpu_Zf, 1);
> +
> +        tcg_gen_and_tl(ret, nC, nZ);

!A & !B -> !(A | B), so one fewer xor.

> +    /* PNZ */
> +    case 0x0F:
> +        /* !N & !Z */

Likewise.

> +void arc_gen_set_memory(DisasCtxt *ctx, TCGv vaddr, int size,
> +        TCGv src, bool sign_extend)
> +{
> +    switch (size) {
> +    case 0x00:
> +        tcg_gen_qemu_st_tl(src, vaddr, MEMIDX, MO_UL);
> +        break;

Surely you'd put all of this size+sign-extend mapping into a table and issue
just one tcg_gen_qemu_st_tl.

> +void arc_gen_get_memory(DisasCtxt *ctx, TCGv dest, TCGv vaddr,
> +        int size, bool sign_extend)
> +{

And re-use the same table here, it would appear.

> +void arc_gen_no_further_loads_pending(DisasCtxt *ctx, TCGv ret)
> +{
> +    tcg_gen_movi_tl(ret, 1);
> +}

Huh?  A missing TODO, perhaps?

> +extern bool enabled_interrupts;

Race condition.  What is a global variable doing being set by a translation thread?


> +void
> +arc_gen_execute_delayslot(DisasCtxt *ctx, TCGv bta, TCGv take_branch)
> +{
> +    static int in_delay_slot = false;

And another one.  Surely these belong in DisasContext.

> +
> +    assert(ctx->insn.limm_p == 0 && !in_delay_slot);
> +
> +    if (ctx->insn.limm_p == 0 && !in_delay_slot) {
> +        in_delay_slot = true;
> +        uint32_t cpc = ctx->cpc;
> +        uint32_t pcl = ctx->pcl;
> +        insn_t insn = ctx->insn;
> +
> +        ctx->cpc = ctx->npc;
> +        ctx->pcl = ctx->cpc & 0xfffffffc;
> +
> +        ++ctx->ds;
> +
> +        TCGLabel *do_not_set_bta_and_de = gen_new_label();
> +        tcg_gen_brcondi_i32(TCG_COND_NE, take_branch, 1, do_not_set_bta_and_de);
> +        /*
> +         * In case an exception should be raised during the execution
> +         * of delay slot, bta value is used to set erbta.
> +         */
> +        tcg_gen_mov_tl(cpu_bta, bta);
> +        /* We are in a delay slot */
> +        tcg_gen_mov_tl(cpu_DEf, take_branch);
> +        gen_set_label(do_not_set_bta_and_de);
> +
> +        tcg_gen_movi_tl(cpu_is_delay_slot_instruction, 1);
> +
> +        /* Set the pc to the next pc */
> +        tcg_gen_movi_tl(cpu_pc, ctx->npc);
> +        /* Necessary for the likely call to restore_state_to_opc() */
> +        tcg_gen_insn_start(ctx->npc);

Wow, this looks wrong.

It doesn't work with icount or single-stepping.  You need to be able to begin a
TB at any instruction, including a delay slot.

You should have a look at some of the other targets that handle this, e.g.
openrisc or sparc.  Since you've got NPC already, for looping, sparc is
probably the better match.

There should be no reason why you'd need to emit insn_start outside of
arc_tr_insn_start.

> +void arc_gen_set_register(enum arc_registers reg, TCGv value)
> +{
> +    switch (reg) {
> +    case R_SP:
> +        tcg_gen_mov_i32(cpu_sp, value);
> +        break;
> +    case R_STATUS32:
> +        gen_helper_set_status32(cpu_env, value);

Lots of changes to status imply a significant change to processor state, and so
you need to exit to the main loop.

> +/* TODO: Get this from props ... */
> +void arc_has_interrupts(DisasCtxt *ctx, TCGv ret)
> +{
> +    tcg_gen_movi_i32(ret, 1);
> +}
> +
> +/*
> + ***************************************
> + * Statically inferred return function *
> + ***************************************
> + */
> +
> +TCGv arc_gen_next_reg(const DisasCtxt *ctx, TCGv reg)
> +{
> +    int i;
> +    for (i = 0; i < 64; i += 2) {
> +        if (reg == cpu_r[i]) {
> +            return cpu_r[i + 1];
> +        }
> +    }
> +    /* Check if REG is an odd register. */
> +    for (i = 1; i < 64; i += 2) {
> +        /* If so, that is unsanctioned. */
> +        if (reg == cpu_r[i]) {
> +            arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
> +            return NULL;
> +        }
> +    }

Wow, really?  Can't you grab this directly from the operand decoding?  Where
surely we have already ensured that the relevant regnos are not odd.

> +    /* REG was not a register after all. */
> +    g_assert_not_reached();
> +
> +    /* We never get here, but to accommodate -Werror ... */
> +    return NULL;

The g_assert_not reached should have been sufficient.

> @@ -0,0 +1,280 @@
> +/*
> + * QEMU ARC CPU
> + *
> + * Copyright (c) 2020 Synppsys Inc.
> + * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * http://www.gnu.org/licenses/lgpl-2.1.html
> + */
> +
> +#ifndef TRANSLATE_INST_H_
> +#define TRANSLATE_INST_H_
> +
> +#include "translate.h"
> +#include "qemu/bitops.h"
> +#include "tcg/tcg.h"
> +#include "target/arc/regs.h"
> +
> +typedef enum ARC_COND {
> +    ARC_COND_AL      = 0x00,
> +    ARC_COND_RA      = 0x00,
> +    ARC_COND_EQ      = 0x01,
> +    ARC_COND_Z       = 0x01,
> +    ARC_COND_NE      = 0x02,
> +    ARC_COND_NZ      = 0x02,
> +    ARC_COND_PL      = 0x03,
> +    ARC_COND_P       = 0x03,
> +    ARC_COND_MI      = 0x04,
> +    ARC_COND_N       = 0x04,
> +    ARC_COND_CS      = 0x05,
> +    ARC_COND_C       = 0x05,
> +    ARC_COND_LO      = 0x05,
> +    ARC_COND_CC      = 0x06,
> +    ARC_COND_NC      = 0x06,
> +    ARC_COND_HS      = 0x06,
> +    ARC_COND_VS      = 0x07,
> +    ARC_COND_V       = 0x07,
> +    ARC_COND_VC      = 0x08,
> +    ARC_COND_NV      = 0x08,
> +    ARC_COND_GT      = 0x09,
> +    ARC_COND_GE      = 0x0a,
> +    ARC_COND_LT      = 0x0b,
> +    ARC_COND_LE      = 0x0c,
> +    ARC_COND_HI      = 0x0d,
> +    ARC_COND_LS      = 0x0e,
> +    ARC_COND_PNZ     = 0x0f,
> +} ARC_COND;

arc_gen_verifyCCFlag should have used these enumerators.

> +#define killDelaySlot()

noop macro?

> diff --git a/target/arc/semfunc.c b/target/arc/semfunc.c
> new file mode 100644
> index 0000000000..dc81563cc4
> --- /dev/null
> +++ b/target/arc/semfunc.c
> @@ -0,0 +1,8473 @@
> +/*
> + * QEMU ARC CPU
> + *
> + * Copyright (c) 2020 Synppsys Inc.
> + * Contributed by Cupertino Miranda <cmiranda@synopsys.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * http://www.gnu.org/licenses/lgpl-2.1.html
> + */
> +
> +#include "qemu/osdep.h"
> +#include "translate.h"
> +#include "target/arc/semfunc.h"
> +
> +/*
> + * FLAG
> + *    Variables: @src
> + *    Functions: getCCFlag, getRegister, getBit, hasInterrupts, Halt, ReplMask,
> + *               targetHasOption, setRegister
> + * --- code ---
> + * {
> + *   cc_flag = getCCFlag ();
> + *   if((cc_flag == true))
> + *     {
> + *       status32 = getRegister (R_STATUS32);
> + *       if(((getBit (@src, 0) == 1) && (getBit (status32, 7) == 0)))
> + *         {
> + *           if((hasInterrupts () > 0))
> + *             {
> + *               status32 = (status32 | 1);
> + *               Halt ();
> + *             };
> + *         }
> + *       else
> + *         {
> + *           ReplMask (status32, @src, 3840);
> + *           if(((getBit (status32, 7) == 0) && (hasInterrupts () > 0)))
> + *             {
> + *               ReplMask (status32, @src, 30);
> + *               if(targetHasOption (DIV_REM_OPTION))
> + *                 {
> + *                   ReplMask (status32, @src, 8192);
> + *                 };
> + *               if(targetHasOption (STACK_CHECKING))
> + *                 {
> + *                   ReplMask (status32, @src, 16384);
> + *                 };
> + *               if(targetHasOption (LL64_OPTION))
> + *                 {
> + *                   ReplMask (status32, @src, 524288);
> + *                 };
> + *               ReplMask (status32, @src, 1048576);
> + *             };
> + *         };
> + *       setRegister (R_STATUS32, status32);
> + *     };
> + * }
> + */
> +
> +int
> +arc_gen_FLAG(DisasCtxt *ctx, TCGv src)
> +{
> +    int ret = DISAS_NEXT;
> +    TCGv temp_13 = tcg_temp_local_new_i32();
> +    TCGv cc_flag = tcg_temp_local_new_i32();
> +    TCGv temp_1 = tcg_temp_local_new_i32();
> +    TCGv temp_2 = tcg_temp_local_new_i32();
> +    TCGv temp_14 = tcg_temp_local_new_i32();
> +    TCGv status32 = tcg_temp_local_new_i32();
> +    TCGv temp_16 = tcg_temp_local_new_i32();
> +    TCGv temp_15 = tcg_temp_local_new_i32();
> +    TCGv temp_3 = tcg_temp_local_new_i32();
> +    TCGv temp_18 = tcg_temp_local_new_i32();
> +    TCGv temp_17 = tcg_temp_local_new_i32();
> +    TCGv temp_4 = tcg_temp_local_new_i32();
> +    TCGv temp_5 = tcg_temp_local_new_i32();
> +    TCGv temp_6 = tcg_temp_local_new_i32();
> +    TCGv temp_19 = tcg_temp_local_new_i32();
> +    TCGv temp_7 = tcg_temp_local_new_i32();
> +    TCGv temp_8 = tcg_temp_local_new_i32();
> +    TCGv temp_20 = tcg_temp_local_new_i32();
> +    TCGv temp_22 = tcg_temp_local_new_i32();
> +    TCGv temp_21 = tcg_temp_local_new_i32();
> +    TCGv temp_9 = tcg_temp_local_new_i32();
> +    TCGv temp_23 = tcg_temp_local_new_i32();
> +    TCGv temp_10 = tcg_temp_local_new_i32();
> +    TCGv temp_11 = tcg_temp_local_new_i32();
> +    TCGv temp_12 = tcg_temp_local_new_i32();
> +    TCGv temp_24 = tcg_temp_local_new_i32();
> +    TCGv temp_25 = tcg_temp_local_new_i32();
> +    TCGv temp_26 = tcg_temp_local_new_i32();
> +    TCGv temp_27 = tcg_temp_local_new_i32();
> +    TCGv temp_28 = tcg_temp_local_new_i32();
> +    getCCFlag(temp_13);
> +    tcg_gen_mov_i32(cc_flag, temp_13);
> +    TCGLabel *done_1 = gen_new_label();
> +    tcg_gen_setcond_i32(TCG_COND_EQ, temp_1, cc_flag, arc_true);
> +    tcg_gen_xori_i32(temp_2, temp_1, 1);
> +    tcg_gen_andi_i32(temp_2, temp_2, 1);
> +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_2, arc_true, done_1);
> +    getRegister(temp_14, R_STATUS32);
> +    tcg_gen_mov_i32(status32, temp_14);
> +    TCGLabel *else_2 = gen_new_label();
> +    TCGLabel *done_2 = gen_new_label();
> +    tcg_gen_movi_i32(temp_16, 0);
> +    getBit(temp_15, src, temp_16);
> +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_3, temp_15, 1);
> +    tcg_gen_movi_i32(temp_18, 7);
> +    getBit(temp_17, status32, temp_18);
> +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_4, temp_17, 0);
> +    tcg_gen_and_i32(temp_5, temp_3, temp_4);
> +    tcg_gen_xori_i32(temp_6, temp_5, 1);
> +    tcg_gen_andi_i32(temp_6, temp_6, 1);
> +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_6, arc_true, else_2);
> +    TCGLabel *done_3 = gen_new_label();
> +    hasInterrupts(temp_19);
> +    tcg_gen_setcondi_i32(TCG_COND_GT, temp_7, temp_19, 0);
> +    tcg_gen_xori_i32(temp_8, temp_7, 1);
> +    tcg_gen_andi_i32(temp_8, temp_8, 1);
> +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_8, arc_true, done_3);
> +    tcg_gen_ori_i32(status32, status32, 1);
> +    Halt();
> +    gen_set_label(done_3);
> +    tcg_gen_br(done_2);
> +    gen_set_label(else_2);
> +    tcg_gen_movi_i32(temp_20, 3840);
> +    ReplMask(status32, src, temp_20);
> +    TCGLabel *done_4 = gen_new_label();
> +    tcg_gen_movi_i32(temp_22, 7);
> +    getBit(temp_21, status32, temp_22);
> +    tcg_gen_setcondi_i32(TCG_COND_EQ, temp_9, temp_21, 0);
> +    hasInterrupts(temp_23);
> +    tcg_gen_setcondi_i32(TCG_COND_GT, temp_10, temp_23, 0);
> +    tcg_gen_and_i32(temp_11, temp_9, temp_10);
> +    tcg_gen_xori_i32(temp_12, temp_11, 1);
> +    tcg_gen_andi_i32(temp_12, temp_12, 1);
> +    tcg_gen_brcond_i32(TCG_COND_EQ, temp_12, arc_true, done_4);
> +    tcg_gen_movi_i32(temp_24, 30);
> +    ReplMask(status32, src, temp_24);
> +    if (targetHasOption (DIV_REM_OPTION)) {
> +        tcg_gen_movi_i32(temp_25, 8192);
> +        ReplMask(status32, src, temp_25);
> +    }
> +    if (targetHasOption (STACK_CHECKING)) {
> +        tcg_gen_movi_i32(temp_26, 16384);
> +        ReplMask(status32, src, temp_26);
> +    }
> +    if (targetHasOption (LL64_OPTION)) {
> +        tcg_gen_movi_i32(temp_27, 524288);
> +        ReplMask(status32, src, temp_27);
> +    }
> +    tcg_gen_movi_i32(temp_28, 1048576);
> +    ReplMask(status32, src, temp_28);
> +    gen_set_label(done_4);
> +    gen_set_label(done_2);
> +    setRegister(R_STATUS32, status32);
> +    gen_set_label(done_1);
> +    tcg_temp_free(temp_13);
> +    tcg_temp_free(cc_flag);
> +    tcg_temp_free(temp_1);
> +    tcg_temp_free(temp_2);
> +    tcg_temp_free(temp_14);
> +    tcg_temp_free(status32);
> +    tcg_temp_free(temp_16);
> +    tcg_temp_free(temp_15);
> +    tcg_temp_free(temp_3);
> +    tcg_temp_free(temp_18);
> +    tcg_temp_free(temp_17);
> +    tcg_temp_free(temp_4);
> +    tcg_temp_free(temp_5);
> +    tcg_temp_free(temp_6);
> +    tcg_temp_free(temp_19);
> +    tcg_temp_free(temp_7);
> +    tcg_temp_free(temp_8);
> +    tcg_temp_free(temp_20);
> +    tcg_temp_free(temp_22);
> +    tcg_temp_free(temp_21);
> +    tcg_temp_free(temp_9);
> +    tcg_temp_free(temp_23);
> +    tcg_temp_free(temp_10);
> +    tcg_temp_free(temp_11);
> +    tcg_temp_free(temp_12);
> +    tcg_temp_free(temp_24);
> +    tcg_temp_free(temp_25);
> +    tcg_temp_free(temp_26);
> +    tcg_temp_free(temp_27);
> +    tcg_temp_free(temp_28);
> +
> +    return ret;
> +}

Riiiight.  Auto-generated code, clearly.

What program generated this, and from what source?  As it stands this is
unmaintainable.  I'm going to stop reviewing now.


r~

