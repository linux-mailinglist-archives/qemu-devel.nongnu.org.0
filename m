Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837ED511E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 18:46:38 +0200 (CEST)
Received: from localhost ([::1]:34884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJKXN-0003gM-G2
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 12:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1iJKUR-0001Ff-6y
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 12:43:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1iJKLY-0002Y8-05
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 12:34:30 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:37564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1iJKLX-0002Xy-OU
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 12:34:23 -0400
Received: by mail-qt1-x843.google.com with SMTP id l49so4662725qtc.4
 for <qemu-devel@nongnu.org>; Sat, 12 Oct 2019 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvYby465Nw+y1snz4lmgvicevZ5EhdkmkiOmB6uRn44=;
 b=caBD8VtWEWsaJ48z+H8qHWFvPE5cSTLoky3HtN5NmzmLAa9p31dI7bhe8kFEzyBgw0
 CuT/4747cpxBj5ILqs55ZG0nWRE7ebDdYPmjHd5BLGibY/ID3AFgei8AdY1HU7xxwu8d
 AGUABRoTE97ocEYc9DYi/NLaKDjfCyhd2rKU+8a1npS41xbZdndyboZJAuX0JjnyccA0
 chJDVhaltW2PasJZGhzAgneIicThsBgDBkp6HVF3qCP5wZwEXHS2F9iH29sZabc8i7Y1
 jRzMpcdsm9kQDbdY26TP29mUUylKLnKBryFFFHq2VcxmWJ/viLBmnsLJhNru5ue0uM6L
 y6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvYby465Nw+y1snz4lmgvicevZ5EhdkmkiOmB6uRn44=;
 b=td2f4i1Wc3FkPnmIthT9hzeObPrdGkO2XvYZBtKBmjCptoKtMn8fvOXG1lKnLFGl/S
 iX4rionxnufaELiiEg+X6x8Tb7a+iWY9b75TQ673HfUgQQ9DlgF9w6pkxpCXUS/qchC+
 XzpH/thLsjriMsLBEUCPZpCF+RpqozygsVKd4qiYBcLorGVBDsGROCLa/oIf8lEsJJiL
 /S6JboJG+k6zGt6ATf3vnHD+Ter9FR/leGAslfLmBclAwkmLnkNRcSxx4N4KDYnvFhPb
 c5dCfiwlaE0BRekNJUZ70AIsl8yXshTUxnW9tyvAAFJYg/C9UxfkMNCZt/ku8+cjNBF3
 1HoA==
X-Gm-Message-State: APjAAAU+o13d5oY0z/49eOJy1gz5sYoB4qvnhwzHSDgYYymmuqLIf7Au
 ihknIPRv2gKLhOuzCpmYFyJE57VFeU2i9e92mTA=
X-Google-Smtp-Source: APXvYqwc6wdAH/cvjC2AQW9+BdQdMWitwkokCYDpxJqfyD1fXh2zbL/gIQB9nJNVCDVdio/XqnQOTH5+XoskHrdHc9E=
X-Received: by 2002:ac8:5147:: with SMTP id h7mr23305511qtn.160.1570898061220; 
 Sat, 12 Oct 2019 09:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190902140134.74081-1-mrolnik@gmail.com>
 <20190902140134.74081-5-mrolnik@gmail.com>
 <CAL1e-=jMDpeku_7GB5H5Xv1=5cChZJLoz7fCmem3upds9QEtvQ@mail.gmail.com>
In-Reply-To: <CAL1e-=jMDpeku_7GB5H5Xv1=5cChZJLoz7fCmem3upds9QEtvQ@mail.gmail.com>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Sat, 12 Oct 2019 19:33:32 +0300
Message-ID: <CAK4993gy9No3PocJf+8QF+09tdi4g_3zJ8gzwS_8NOsb5n=DjQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v30 4/8] target/avr: Add instruction
 translation
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: "thuth@redhat.com" <thuth@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dovgaluk@ispras.ru" <dovgaluk@ispras.ru>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Aleksandar.

If I break it to multiple patches, does every patch have to compile?

On Fri, Oct 11, 2019 at 5:13 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
>
>
> On Monday, September 2, 2019, Michael Rolnik <mrolnik@gmail.com> wrote:
>>
>> This includes:
>> - TCG translations for each instruction
>>
>> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
>> ---
>>  target/avr/translate.c | 2888 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 2888 insertions(+)
>>  create mode 100644 target/avr/translate.c
>>
>
> Hi, Michael,
>
>
> This patch is way too large. I suggest splitting it into:
>
> - register definitions
> - load instruction handling
> - store instruction handling
> - logic instruction handling
>
> etc.
>
> Thanks, Aleksandar
>
> P.S. One more hurdle with your communication on the list is that you don't use "inline responding" while replaying, please use it in future. See other messages in the mailing list how "inline responding" looks.
>
>
>
>
>>
>> diff --git a/target/avr/translate.c b/target/avr/translate.c
>> new file mode 100644
>> index 0000000000..42cb4a690c
>> --- /dev/null
>> +++ b/target/avr/translate.c
>> @@ -0,0 +1,2888 @@
>> +/*
>> + * QEMU AVR CPU
>> + *
>> + * Copyright (c) 2019 Michael Rolnik
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation; either
>> + * version 2.1 of the License, or (at your option) any later version.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; if not, see
>> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/qemu-print.h"
>> +#include "tcg/tcg.h"
>> +#include "cpu.h"
>> +#include "exec/exec-all.h"
>> +#include "disas/disas.h"
>> +#include "tcg-op.h"
>> +#include "exec/cpu_ldst.h"
>> +#include "exec/helper-proto.h"
>> +#include "exec/helper-gen.h"
>> +#include "exec/log.h"
>> +#include "exec/gdbstub.h"
>> +#include "exec/translator.h"
>> +
>> +/*
>> + *  Define if you want a BREAK instruction translated to a breakpoint
>> + *  Active debugging connection is assumed
>> + *  This is for
>> + *  https://github.com/seharris/qemu-avr-tests/tree/master/instruction-tests
>> + *  tests
>> + */
>> +#undef BREAKPOINT_ON_BREAK
>> +
>> +static TCGv cpu_pc;
>> +
>> +static TCGv cpu_Cf;
>> +static TCGv cpu_Zf;
>> +static TCGv cpu_Nf;
>> +static TCGv cpu_Vf;
>> +static TCGv cpu_Sf;
>> +static TCGv cpu_Hf;
>> +static TCGv cpu_Tf;
>> +static TCGv cpu_If;
>> +
>> +static TCGv cpu_rampD;
>> +static TCGv cpu_rampX;
>> +static TCGv cpu_rampY;
>> +static TCGv cpu_rampZ;
>> +
>> +static TCGv cpu_r[NO_CPU_REGISTERS];
>> +static TCGv cpu_eind;
>> +static TCGv cpu_sp;
>> +
>> +static TCGv cpu_skip;
>> +
>> +static const char reg_names[NO_CPU_REGISTERS][8] = {
>> +    "r0",  "r1",  "r2",  "r3",  "r4",  "r5",  "r6",  "r7",
>> +    "r8",  "r9",  "r10", "r11", "r12", "r13", "r14", "r15",
>> +    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
>> +    "r24", "r25", "r26", "r27", "r28", "r29", "r30", "r31",
>> +};
>> +#define REG(x) (cpu_r[x])
>> +
>> +enum {
>> +    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
>> +    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
>> +    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
>> +};
>> +
>> +typedef struct DisasContext DisasContext;
>> +
>> +/* This is the state at translation time. */
>> +struct DisasContext {
>> +    TranslationBlock *tb;
>> +
>> +    CPUAVRState *env;
>> +    CPUState *cs;
>> +
>> +    target_long npc;
>> +    uint32_t opcode;
>> +
>> +    /* Routine used to access memory */
>> +    int memidx;
>> +    int bstate;
>> +    int singlestep;
>> +
>> +    TCGv skip_var0;
>> +    TCGv skip_var1;
>> +    TCGCond skip_cond;
>> +    bool free_skip_var0;
>> +};
>> +
>> +static int to_A(DisasContext *ctx, int indx) { return 16 + (indx % 16); }
>> +static int to_B(DisasContext *ctx, int indx) { return 16 + (indx % 8); }
>> +static int to_C(DisasContext *ctx, int indx) { return 24 + (indx % 4) * 2; }
>> +static int to_D(DisasContext *ctx, int indx) { return (indx % 16) * 2; }
>> +
>> +static uint16_t next_word(DisasContext *ctx)
>> +{
>> +    return cpu_lduw_code(ctx->env, ctx->npc++ * 2);
>> +}
>> +
>> +static int append_16(DisasContext *ctx, int x)
>> +{
>> +    return x << 16 | next_word(ctx);
>> +}
>> +
>> +static bool decode_insn(DisasContext *ctx, uint16_t insn);
>> +#include "decode_insn.inc.c"
>> +
>> +static bool avr_have_feature(DisasContext *ctx, int feature)
>> +{
>> +    if (!avr_feature(ctx->env, feature)) {
>> +        gen_helper_unsupported(cpu_env);
>> +        ctx->bstate = DISAS_NORETURN;
>> +        return false;
>> +    }
>> +    return true;
>> +}
>> +
>> +static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>> +{
>> +    TranslationBlock *tb = ctx->tb;
>> +
>> +    if (ctx->singlestep == 0) {
>> +        tcg_gen_goto_tb(n);
>> +        tcg_gen_movi_i32(cpu_pc, dest);
>> +        tcg_gen_exit_tb(tb, n);
>> +    } else {
>> +        tcg_gen_movi_i32(cpu_pc, dest);
>> +        gen_helper_debug(cpu_env);
>> +        tcg_gen_exit_tb(NULL, 0);
>> +    }
>> +    ctx->bstate = DISAS_NORETURN;
>> +}
>> +
>> +#include "exec/gen-icount.h"
>> +
>> +static void gen_add_CHf(TCGv R, TCGv Rd, TCGv Rr)
>> +{
>> +    TCGv t1 = tcg_temp_new_i32();
>> +    TCGv t2 = tcg_temp_new_i32();
>> +    TCGv t3 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_and_tl(t1, Rd, Rr); /* t1 = Rd & Rr */
>> +    tcg_gen_andc_tl(t2, Rd, R); /* t2 = Rd & ~R */
>> +    tcg_gen_andc_tl(t3, Rr, R); /* t3 = Rr & ~R */
>> +    tcg_gen_or_tl(t1, t1, t2); /* t1 = t1 | t2 | t3 */
>> +    tcg_gen_or_tl(t1, t1, t3);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, t1, 7); /* Cf = t1(7) */
>> +    tcg_gen_shri_tl(cpu_Hf, t1, 3); /* Hf = t1(3) */
>> +    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
>> +
>> +    tcg_temp_free_i32(t3);
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t1);
>> +}
>> +
>> +static void gen_add_Vf(TCGv R, TCGv Rd, TCGv Rr)
>> +{
>> +    TCGv t1 = tcg_temp_new_i32();
>> +    TCGv t2 = tcg_temp_new_i32();
>> +
>> +    /* t1 = Rd & Rr & ~R | ~Rd & ~Rr & R = (Rd ^ R) & ~(Rd ^ Rr) */
>> +    tcg_gen_xor_tl(t1, Rd, R);
>> +    tcg_gen_xor_tl(t2, Rd, Rr);
>> +    tcg_gen_andc_tl(t1, t1, t2);
>> +
>> +    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
>> +
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t1);
>> +}
>> +
>> +static void gen_sub_CHf(TCGv R, TCGv Rd, TCGv Rr)
>> +{
>> +    TCGv t1 = tcg_temp_new_i32();
>> +    TCGv t2 = tcg_temp_new_i32();
>> +    TCGv t3 = tcg_temp_new_i32();
>> +
>> +    /* Cf & Hf */
>> +    tcg_gen_not_tl(t1, Rd); /* t1 = ~Rd */
>> +    tcg_gen_and_tl(t2, t1, Rr); /* t2 = ~Rd & Rr */
>> +    tcg_gen_or_tl(t3, t1, Rr); /* t3 = (~Rd | Rr) & R */
>> +    tcg_gen_and_tl(t3, t3, R);
>> +    tcg_gen_or_tl(t2, t2, t3); /* t2 = ~Rd & Rr | ~Rd & R | R & Rr */
>> +    tcg_gen_shri_tl(cpu_Cf, t2, 7); /* Cf = t2(7) */
>> +    tcg_gen_shri_tl(cpu_Hf, t2, 3); /* Hf = t2(3) */
>> +    tcg_gen_andi_tl(cpu_Hf, cpu_Hf, 1);
>> +
>> +    tcg_temp_free_i32(t3);
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t1);
>> +}
>> +
>> +static void gen_sub_Vf(TCGv R, TCGv Rd, TCGv Rr)
>> +{
>> +    TCGv t1 = tcg_temp_new_i32();
>> +    TCGv t2 = tcg_temp_new_i32();
>> +
>> +    /* Vf */
>> +    /* t1 = Rd & ~Rr & ~R | ~Rd & Rr & R = (Rd ^ R) & (Rd ^ R) */
>> +    tcg_gen_xor_tl(t1, Rd, R);
>> +    tcg_gen_xor_tl(t2, Rd, Rr);
>> +    tcg_gen_and_tl(t1, t1, t2);
>> +    tcg_gen_shri_tl(cpu_Vf, t1, 7); /* Vf = t1(7) */
>> +
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(t1);
>> +}
>> +
>> +static void gen_rshift_ZNVSf(TCGv R)
>> +{
>> +    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
>> +    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
>> +    tcg_gen_xor_tl(cpu_Vf, cpu_Nf, cpu_Cf);
>> +    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
>> +}
>> +
>> +static void gen_NSf(TCGv R)
>> +{
>> +    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
>> +    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
>> +}
>> +
>> +static void gen_ZNSf(TCGv R)
>> +{
>> +    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
>> +    tcg_gen_shri_tl(cpu_Nf, R, 7); /* Nf = R(7) */
>> +    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf); /* Sf = Nf ^ Vf */
>> +}
>> +
>> +static void gen_push_ret(DisasContext *ctx, int ret)
>> +{
>> +    if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
>> +
>> +        TCGv t0 = tcg_const_i32((ret & 0x0000ff));
>> +
>> +        tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
>> +        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
>> +
>> +        tcg_temp_free_i32(t0);
>> +    } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
>> +
>> +        TCGv t0 = tcg_const_i32((ret & 0x00ffff));
>> +
>> +        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
>> +        tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
>> +        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
>> +
>> +        tcg_temp_free_i32(t0);
>> +
>> +    } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
>> +
>> +        TCGv lo = tcg_const_i32((ret & 0x0000ff));
>> +        TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
>> +
>> +        tcg_gen_qemu_st_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
>> +        tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
>> +        tcg_gen_qemu_st_tl(hi, cpu_sp, MMU_DATA_IDX, MO_BEUW);
>> +        tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
>> +
>> +        tcg_temp_free_i32(lo);
>> +        tcg_temp_free_i32(hi);
>> +    }
>> +}
>> +
>> +static void gen_pop_ret(DisasContext *ctx, TCGv ret)
>> +{
>> +    if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
>> +        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
>> +        tcg_gen_qemu_ld_tl(ret, cpu_sp, MMU_DATA_IDX, MO_UB);
>> +    } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
>> +        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
>> +        tcg_gen_qemu_ld_tl(ret, cpu_sp, MMU_DATA_IDX, MO_BEUW);
>> +        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
>> +    } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
>> +        TCGv lo = tcg_temp_new_i32();
>> +        TCGv hi = tcg_temp_new_i32();
>> +
>> +        tcg_gen_addi_tl(cpu_sp, cpu_sp, 1);
>> +        tcg_gen_qemu_ld_tl(hi, cpu_sp, MMU_DATA_IDX, MO_BEUW);
>> +
>> +        tcg_gen_addi_tl(cpu_sp, cpu_sp, 2);
>> +        tcg_gen_qemu_ld_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
>> +
>> +        tcg_gen_deposit_tl(ret, lo, hi, 8, 16);
>> +
>> +        tcg_temp_free_i32(lo);
>> +        tcg_temp_free_i32(hi);
>> +    }
>> +}
>> +
>> +static void gen_jmp_ez(DisasContext *ctx)
>> +{
>> +    tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
>> +    tcg_gen_or_tl(cpu_pc, cpu_pc, cpu_eind);
>> +    ctx->bstate = DISAS_LOOKUP;
>> +}
>> +
>> +static void gen_jmp_z(DisasContext *ctx)
>> +{
>> +    tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
>> +    ctx->bstate = DISAS_LOOKUP;
>> +}
>> +
>> +/*
>> + *  in the gen_set_addr & gen_get_addr functions
>> + *  H assumed to be in 0x00ff0000 format
>> + *  M assumed to be in 0x000000ff format
>> + *  L assumed to be in 0x000000ff format
>> + */
>> +static void gen_set_addr(TCGv addr, TCGv H, TCGv M, TCGv L)
>> +{
>> +
>> +    tcg_gen_andi_tl(L, addr, 0x000000ff);
>> +
>> +    tcg_gen_andi_tl(M, addr, 0x0000ff00);
>> +    tcg_gen_shri_tl(M, M, 8);
>> +
>> +    tcg_gen_andi_tl(H, addr, 0x00ff0000);
>> +}
>> +
>> +static void gen_set_xaddr(TCGv addr)
>> +{
>> +    gen_set_addr(addr, cpu_rampX, cpu_r[27], cpu_r[26]);
>> +}
>> +
>> +static void gen_set_yaddr(TCGv addr)
>> +{
>> +    gen_set_addr(addr, cpu_rampY, cpu_r[29], cpu_r[28]);
>> +}
>> +
>> +static void gen_set_zaddr(TCGv addr)
>> +{
>> +    gen_set_addr(addr, cpu_rampZ, cpu_r[31], cpu_r[30]);
>> +}
>> +
>> +static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
>> +{
>> +    TCGv addr = tcg_temp_new_i32();
>> +
>> +    tcg_gen_deposit_tl(addr, M, H, 8, 8);
>> +    tcg_gen_deposit_tl(addr, L, addr, 8, 16);
>> +
>> +    return addr;
>> +}
>> +
>> +static TCGv gen_get_xaddr(void)
>> +{
>> +    return gen_get_addr(cpu_rampX, cpu_r[27], cpu_r[26]);
>> +}
>> +
>> +static TCGv gen_get_yaddr(void)
>> +{
>> +    return gen_get_addr(cpu_rampY, cpu_r[29], cpu_r[28]);
>> +}
>> +
>> +static TCGv gen_get_zaddr(void)
>> +{
>> +    return gen_get_addr(cpu_rampZ, cpu_r[31], cpu_r[30]);
>> +}
>> +
>> +/*
>> + *  Adds two registers and the contents of the C Flag and places the result in
>> + *  the destination register Rd.
>> + */
>> +static bool trans_ADC(DisasContext *ctx, arg_ADC *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_add_tl(R, Rd, Rr); /* R = Rd + Rr + Cf */
>> +    tcg_gen_add_tl(R, R, cpu_Cf);
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_add_CHf(R, Rd, Rr);
>> +    gen_add_Vf(R, Rd, Rr);
>> +    gen_ZNSf(R);
>> +
>> +    /* R */
>> +    tcg_gen_mov_tl(Rd, R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Adds two registers without the C Flag and places the result in the
>> + *  destination register Rd.
>> + */
>> +static bool trans_ADD(DisasContext *ctx, arg_ADD *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_add_tl(R, Rd, Rr); /* Rd = Rd + Rr */
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_add_CHf(R, Rd, Rr);
>> +    gen_add_Vf(R, Rd, Rr);
>> +    gen_ZNSf(R);
>> +
>> +    /* R */
>> +    tcg_gen_mov_tl(Rd, R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Adds an immediate value (0 - 63) to a register pair and places the result
>> + *  in the register pair. This instruction operates on the upper four register
>> + *  pairs, and is well suited for operations on the pointer registers.  This
>> + *  instruction is not available in all devices. Refer to the device specific
>> + *  instruction set summary.
>> + */
>> +static bool trans_ADIW(DisasContext *ctx, arg_ADIW *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_ADIW_SBIW)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv RdL = cpu_r[a->rd];
>> +    TCGv RdH = cpu_r[a->rd + 1];
>> +    int Imm = (a->imm);
>> +    TCGv R = tcg_temp_new_i32();
>> +    TCGv Rd = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_deposit_tl(Rd, RdL, RdH, 8, 8); /* Rd = RdH:RdL */
>> +    tcg_gen_addi_tl(R, Rd, Imm); /* R = Rd + Imm */
>> +    tcg_gen_andi_tl(R, R, 0xffff); /* make it 16 bits */
>> +
>> +    /* Cf */
>> +    tcg_gen_andc_tl(cpu_Cf, Rd, R); /* Cf = Rd & ~R */
>> +    tcg_gen_shri_tl(cpu_Cf, cpu_Cf, 15);
>> +
>> +    /* Vf */
>> +    tcg_gen_andc_tl(cpu_Vf, R, Rd); /* Vf = R & ~Rd */
>> +    tcg_gen_shri_tl(cpu_Vf, cpu_Vf, 15);
>> +
>> +    /* Zf */
>> +    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
>> +
>> +    /* Nf */
>> +    tcg_gen_shri_tl(cpu_Nf, R, 15); /* Nf = R(15) */
>> +
>> +    /* Sf */
>> +    tcg_gen_xor_tl(cpu_Sf, cpu_Nf, cpu_Vf);/* Sf = Nf ^ Vf */
>> +
>> +    /* R */
>> +    tcg_gen_andi_tl(RdL, R, 0xff);
>> +    tcg_gen_shri_tl(RdH, R, 8);
>> +
>> +    tcg_temp_free_i32(Rd);
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Performs the logical AND between the contents of register Rd and register
>> + *  Rr and places the result in the destination register Rd.
>> + */
>> +static bool trans_AND(DisasContext *ctx, arg_AND *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_and_tl(R, Rd, Rr); /* Rd = Rd and Rr */
>> +
>> +    /* Vf */
>> +    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
>> +
>> +    /* Zf */
>> +    tcg_gen_mov_tl(cpu_Zf, R); /* Zf = R */
>> +
>> +    gen_ZNSf(R);
>> +
>> +    /* R */
>> +    tcg_gen_mov_tl(Rd, R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Performs the logical AND between the contents of register Rd and a constant
>> + *  and places the result in the destination register Rd.
>> + */
>> +static bool trans_ANDI(DisasContext *ctx, arg_ANDI *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    int Imm = (a->imm);
>> +
>> +    /* op */
>> +    tcg_gen_andi_tl(Rd, Rd, Imm); /* Rd = Rd & Imm */
>> +
>> +    tcg_gen_movi_tl(cpu_Vf, 0x00); /* Vf = 0 */
>> +    gen_ZNSf(Rd);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Shifts all bits in Rd one place to the right. Bit 7 is held constant. Bit 0
>> + *  is loaded into the C Flag of the SREG. This operation effectively divides a
>> + *  signed value by two without changing its sign. The Carry Flag can be used to
>> + *  round the result.
>> + */
>> +static bool trans_ASR(DisasContext *ctx, arg_ASR *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv t0 = tcg_temp_new_i32();
>> +
>> +    /* Cf */
>> +    tcg_gen_andi_tl(cpu_Cf, Rd, 1); /* Cf = Rd(0) */
>> +
>> +    /* op */
>> +    tcg_gen_andi_tl(t0, Rd, 0x80); /* Rd = (Rd & 0x80) | (Rd >> 1) */
>> +    tcg_gen_shri_tl(Rd, Rd, 1);
>> +    tcg_gen_or_tl(Rd, Rd, t0);
>> +
>> +    gen_rshift_ZNVSf(Rd);
>> +
>> +    tcg_temp_free_i32(t0);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Clears a single Flag in SREG.
>> + */
>> +static bool trans_BCLR(DisasContext *ctx, arg_BCLR *a)
>> +{
>> +    switch (a->bit) {
>> +    case 0x00:
>> +        tcg_gen_movi_tl(cpu_Cf, 0x00);
>> +        break;
>> +    case 0x01:
>> +        tcg_gen_movi_tl(cpu_Zf, 0x01);
>> +        break;
>> +    case 0x02:
>> +        tcg_gen_movi_tl(cpu_Nf, 0x00);
>> +        break;
>> +    case 0x03:
>> +        tcg_gen_movi_tl(cpu_Vf, 0x00);
>> +        break;
>> +    case 0x04:
>> +        tcg_gen_movi_tl(cpu_Sf, 0x00);
>> +        break;
>> +    case 0x05:
>> +        tcg_gen_movi_tl(cpu_Hf, 0x00);
>> +        break;
>> +    case 0x06:
>> +        tcg_gen_movi_tl(cpu_Tf, 0x00);
>> +        break;
>> +    case 0x07:
>> +        tcg_gen_movi_tl(cpu_If, 0x00);
>> +        break;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Copies the T Flag in the SREG (Status Register) to bit b in register Rd.
>> + */
>> +static bool trans_BLD(DisasContext *ctx, arg_BLD *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_andi_tl(Rd, Rd, ~(1u << a->bit)); /* clear bit */
>> +    tcg_gen_shli_tl(t1, cpu_Tf, a->bit); /* create mask */
>> +    tcg_gen_or_tl(Rd, Rd, t1);
>> +
>> +    tcg_temp_free_i32(t1);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Conditional relative branch. Tests a single bit in SREG and branches
>> + *  relatively to PC if the bit is cleared. This instruction branches relatively
>> + *  to PC in either direction (PC - 63 < = destination <= PC + 64). The
>> + *  parameter k is the offset from PC and is represented in two's complement
>> + *  form.
>> + */
>> +static bool trans_BRBC(DisasContext *ctx, arg_BRBC *a)
>> +{
>> +    TCGLabel *not_taken = gen_new_label();
>> +    TCGCond cond = TCG_COND_EQ;
>> +    TCGv var;
>> +
>> +    switch (a->bit) {
>> +    case 0x00:
>> +        var = cpu_Cf;
>> +        break;
>> +    case 0x01:
>> +        cond = TCG_COND_NE;
>> +        var = cpu_Zf;
>> +        break;
>> +    case 0x02:
>> +        var = cpu_Nf;
>> +        break;
>> +    case 0x03:
>> +        var = cpu_Vf;
>> +        break;
>> +    case 0x04:
>> +        var = cpu_Sf;
>> +        break;
>> +    case 0x05:
>> +        var = cpu_Hf;
>> +        break;
>> +    case 0x06:
>> +        var = cpu_Tf;
>> +        break;
>> +    case 0x07:
>> +        var = cpu_If;
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +
>> +    tcg_gen_brcondi_i32(tcg_invert_cond(cond), var, 0, not_taken);
>> +    gen_goto_tb(ctx, 0, ctx->npc + a->imm);
>> +    gen_set_label(not_taken);
>> +
>> +    ctx->bstate = DISAS_CHAIN;
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Conditional relative branch. Tests a single bit in SREG and branches
>> + *  relatively to PC if the bit is set. This instruction branches relatively to
>> + *  PC in either direction (PC - 63 < = destination <= PC + 64). The parameter k
>> + *  is the offset from PC and is represented in two's complement form.
>> + */
>> +static bool trans_BRBS(DisasContext *ctx, arg_BRBS *a)
>> +{
>> +    TCGLabel *not_taken = gen_new_label();
>> +    TCGCond cond = TCG_COND_NE;
>> +    TCGv var;
>> +
>> +    switch (a->bit) {
>> +    case 0x00:
>> +        var = cpu_Cf;
>> +        break;
>> +    case 0x01:
>> +        cond = TCG_COND_EQ;
>> +        var = cpu_Zf;
>> +        break;
>> +    case 0x02:
>> +        var = cpu_Nf;
>> +        break;
>> +    case 0x03:
>> +        var = cpu_Vf;
>> +        break;
>> +    case 0x04:
>> +        var = cpu_Sf;
>> +        break;
>> +    case 0x05:
>> +        var = cpu_Hf;
>> +        break;
>> +    case 0x06:
>> +        var = cpu_Tf;
>> +        break;
>> +    case 0x07:
>> +        var = cpu_If;
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +
>> +    tcg_gen_brcondi_i32(tcg_invert_cond(cond), var, 0, not_taken);
>> +    gen_goto_tb(ctx, 0, ctx->npc + a->imm);
>> +    gen_set_label(not_taken);
>> +
>> +    ctx->bstate = DISAS_CHAIN;
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Sets a single Flag or bit in SREG.
>> + */
>> +static bool trans_BSET(DisasContext *ctx, arg_BSET *a)
>> +{
>> +    switch (a->bit) {
>> +    case 0x00:
>> +        tcg_gen_movi_tl(cpu_Cf, 0x01);
>> +        break;
>> +    case 0x01:
>> +        tcg_gen_movi_tl(cpu_Zf, 0x00);
>> +        break;
>> +    case 0x02:
>> +        tcg_gen_movi_tl(cpu_Nf, 0x01);
>> +        break;
>> +    case 0x03:
>> +        tcg_gen_movi_tl(cpu_Vf, 0x01);
>> +        break;
>> +    case 0x04:
>> +        tcg_gen_movi_tl(cpu_Sf, 0x01);
>> +        break;
>> +    case 0x05:
>> +        tcg_gen_movi_tl(cpu_Hf, 0x01);
>> +        break;
>> +    case 0x06:
>> +        tcg_gen_movi_tl(cpu_Tf, 0x01);
>> +        break;
>> +    case 0x07:
>> +        tcg_gen_movi_tl(cpu_If, 0x01);
>> +        break;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  The BREAK instruction is used by the On-chip Debug system, and is
>> + *  normally not used in the application software. When the BREAK instruction is
>> + *  executed, the AVR CPU is set in the Stopped Mode. This gives the On-chip
>> + *  Debugger access to internal resources.  If any Lock bits are set, or either
>> + *  the JTAGEN or OCDEN Fuses are unprogrammed, the CPU will treat the BREAK
>> + *  instruction as a NOP and will not enter the Stopped mode.  This instruction
>> + *  is not available in all devices. Refer to the device specific instruction
>> + *  set summary.
>> + */
>> +static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_BREAK)) {
>> +        return true;
>> +    }
>> +
>> +#ifdef BREAKPOINT_ON_BREAK
>> +    tcg_gen_movi_tl(cpu_pc, ctx->npc - 1);
>> +    gen_helper_debug(cpu_env);
>> +    ctx->bstate = DISAS_EXIT;
>> +#else
>> +    /* NOP */
>> +#endif
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Stores bit b from Rd to the T Flag in SREG (Status Register).
>> + */
>> +static bool trans_BST(DisasContext *ctx, arg_BST *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +
>> +    tcg_gen_andi_tl(cpu_Tf, Rd, 1 << a->bit);
>> +    tcg_gen_shri_tl(cpu_Tf, cpu_Tf, a->bit);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Calls to a subroutine within the entire Program memory. The return
>> + *  address (to the instruction after the CALL) will be stored onto the Stack.
>> + *  (See also RCALL). The Stack Pointer uses a post-decrement scheme during
>> + *  CALL.  This instruction is not available in all devices. Refer to the device
>> + *  specific instruction set summary.
>> + */
>> +static bool trans_CALL(DisasContext *ctx, arg_CALL *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_JMP_CALL)) {
>> +        return true;
>> +    }
>> +
>> +    int Imm = a->imm;
>> +    int ret = ctx->npc;
>> +
>> +    gen_push_ret(ctx, ret);
>> +    gen_goto_tb(ctx, 0, Imm);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Clears a specified bit in an I/O Register. This instruction operates on
>> + *  the lower 32 I/O Registers -- addresses 0-31.
>> + */
>> +static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
>> +{
>> +    TCGv data = tcg_temp_new_i32();
>> +    TCGv port = tcg_const_i32(a->reg);
>> +
>> +    gen_helper_inb(data, cpu_env, port);
>> +    tcg_gen_andi_tl(data, data, ~(1 << a->bit));
>> +    gen_helper_outb(cpu_env, port, data);
>> +
>> +    tcg_temp_free_i32(data);
>> +    tcg_temp_free_i32(port);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Clears the specified bits in register Rd. Performs the logical AND
>> + *  between the contents of register Rd and the complement of the constant mask
>> + *  K. The result will be placed in register Rd.
>> + */
>> +static bool trans_COM(DisasContext *ctx, arg_COM *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    tcg_gen_xori_tl(Rd, Rd, 0xff);
>> +
>> +    tcg_gen_movi_tl(cpu_Cf, 1); /* Cf = 1 */
>> +    tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
>> +    gen_ZNSf(Rd);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs a compare between two registers Rd and Rr.
>> + *  None of the registers are changed. All conditional branches can be used
>> + *  after this instruction.
>> + */
>> +static bool trans_CP(DisasContext *ctx, arg_CP *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_sub_CHf(R, Rd, Rr);
>> +    gen_sub_Vf(R, Rd, Rr);
>> +    gen_ZNSf(R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs a compare between two registers Rd and Rr and
>> + *  also takes into account the previous carry. None of the registers are
>> + *  changed. All conditional branches can be used after this instruction.
>> + */
>> +static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
>> +    tcg_gen_sub_tl(R, R, cpu_Cf);
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_sub_CHf(R, Rd, Rr);
>> +    gen_sub_Vf(R, Rd, Rr);
>> +    gen_NSf(R);
>> +
>> +    /*
>> +     * Previous value remains unchanged when the result is zero;
>> +     * cleared otherwise.
>> +     */
>> +    tcg_gen_or_tl(cpu_Zf, cpu_Zf, R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs a compare between register Rd and a constant.
>> + *  The register is not changed. All conditional branches can be used after this
>> + *  instruction.
>> + */
>> +static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    int Imm = a->imm;
>> +    TCGv Rr = tcg_const_i32(Imm);
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_sub_CHf(R, Rd, Rr);
>> +    gen_sub_Vf(R, Rd, Rr);
>> +    gen_ZNSf(R);
>> +
>> +    tcg_temp_free_i32(R);
>> +    tcg_temp_free_i32(Rr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs a compare between two registers Rd and Rr, and
>> + *  skips the next instruction if Rd = Rr.
>> + */
>> +static bool trans_CPSE(DisasContext *ctx, arg_CPSE *a)
>> +{
>> +    ctx->skip_cond = TCG_COND_EQ;
>> +    ctx->skip_var0 = cpu_r[a->rd];
>> +    ctx->skip_var1 = cpu_r[a->rr];
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Subtracts one -1- from the contents of register Rd and places the result
>> + *  in the destination register Rd.  The C Flag in SREG is not affected by the
>> + *  operation, thus allowing the DEC instruction to be used on a loop counter in
>> + *  multiple-precision computations.  When operating on unsigned values, only
>> + *  BREQ and BRNE branches can be expected to perform consistently.  When
>> + *  operating on two's complement values, all signed branches are available.
>> + */
>> +static bool trans_DEC(DisasContext *ctx, arg_DEC *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +
>> +    tcg_gen_subi_tl(Rd, Rd, 1); /* Rd = Rd - 1 */
>> +    tcg_gen_andi_tl(Rd, Rd, 0xff); /* make it 8 bits */
>> +
>> +    /* cpu_Vf = Rd == 0x7f */
>> +    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x7f);
>> +    gen_ZNSf(Rd);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  The module is an instruction set extension to the AVR CPU, performing
>> + *  DES iterations. The 64-bit data block (plaintext or ciphertext) is placed in
>> + *  the CPU register file, registers R0-R7, where LSB of data is placed in LSB
>> + *  of R0 and MSB of data is placed in MSB of R7. The full 64-bit key (including
>> + *  parity bits) is placed in registers R8- R15, organized in the register file
>> + *  with LSB of key in LSB of R8 and MSB of key in MSB of R15. Executing one DES
>> + *  instruction performs one round in the DES algorithm. Sixteen rounds must be
>> + *  executed in increasing order to form the correct DES ciphertext or
>> + *  plaintext. Intermediate results are stored in the register file (R0-R15)
>> + *  after each DES instruction. The instruction's operand (K) determines which
>> + *  round is executed, and the half carry flag (H) determines whether encryption
>> + *  or decryption is performed.  The DES algorithm is described in
>> + *  "Specifications for the Data Encryption Standard" (Federal Information
>> + *  Processing Standards Publication 46). Intermediate results in this
>> + *  implementation differ from the standard because the initial permutation and
>> + *  the inverse initial permutation are performed each iteration. This does not
>> + *  affect the result in the final ciphertext or plaintext, but reduces
>> + *  execution time.
>> + */
>> +static bool trans_DES(DisasContext *ctx, arg_DES *a)
>> +{
>> +    /* TODO */
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_DES)) {
>> +        return true;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Indirect call of a subroutine pointed to by the Z (16 bits) Pointer
>> + *  Register in the Register File and the EIND Register in the I/O space. This
>> + *  instruction allows for indirect calls to the entire 4M (words) Program
>> + *  memory space. See also ICALL. The Stack Pointer uses a post-decrement scheme
>> + *  during EICALL.  This instruction is not available in all devices. Refer to
>> + *  the device specific instruction set summary.
>> + */
>> +static bool trans_EICALL(DisasContext *ctx, arg_EICALL *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_EIJMP_EICALL)) {
>> +        return true;
>> +    }
>> +
>> +    int ret = ctx->npc;
>> +
>> +    gen_push_ret(ctx, ret);
>> +    gen_jmp_ez(ctx);
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Indirect jump to the address pointed to by the Z (16 bits) Pointer
>> + *  Register in the Register File and the EIND Register in the I/O space. This
>> + *  instruction allows for indirect jumps to the entire 4M (words) Program
>> + *  memory space. See also IJMP.  This instruction is not available in all
>> + *  devices. Refer to the device specific instruction set summary.
>> + */
>> +static bool trans_EIJMP(DisasContext *ctx, arg_EIJMP *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_EIJMP_EICALL)) {
>> +        return true;
>> +    }
>> +
>> +    gen_jmp_ez(ctx);
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte pointed to by the Z-register and the RAMPZ Register in
>> + *  the I/O space, and places this byte in the destination register Rd. This
>> + *  instruction features a 100% space effective constant initialization or
>> + *  constant data fetch. The Program memory is organized in 16-bit words while
>> + *  the Z-pointer is a byte address. Thus, the least significant bit of the
>> + *  Z-pointer selects either low byte (ZLSB = 0) or high byte (ZLSB = 1). This
>> + *  instruction can address the entire Program memory space. The Z-pointer
>> + *  Register can either be left unchanged by the operation, or it can be
>> + *  incremented. The incrementation applies to the entire 24-bit concatenation
>> + *  of the RAMPZ and Z-pointer Registers.  Devices with Self-Programming
>> + *  capability can use the ELPM instruction to read the Fuse and Lock bit value.
>> + *  Refer to the device documentation for a detailed description.  This
>> + *  instruction is not available in all devices. Refer to the device specific
>> + *  instruction set summary.
>> + */
>> +static bool trans_ELPM1(DisasContext *ctx, arg_ELPM1 *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_ELPM)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[0];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_ELPM2(DisasContext *ctx, arg_ELPM2 *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_ELPM)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_ELPMX(DisasContext *ctx, arg_ELPMX *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_ELPMX)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
>> +
>> +    gen_set_zaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Performs the logical EOR between the contents of register Rd and
>> + *  register Rr and places the result in the destination register Rd.
>> + */
>> +static bool trans_EOR(DisasContext *ctx, arg_EOR *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +
>> +    tcg_gen_xor_tl(Rd, Rd, Rr);
>> +
>> +    tcg_gen_movi_tl(cpu_Vf, 0);
>> +    gen_ZNSf(Rd);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit unsigned
>> + *  multiplication and shifts the result one bit left.
>> + */
>> +static bool trans_FMUL(DisasContext *ctx, arg_FMUL *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd *Rr */
>> +    tcg_gen_shli_tl(R, R, 1);
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +    tcg_gen_andi_tl(R1, R1, 0xff);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
>> +    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication
>> + *  and shifts the result one bit left.
>> + */
>> +static bool trans_FMULS(DisasContext *ctx, arg_FMULS *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
>> +    tcg_gen_ext8s_tl(t1, Rr); /* make Rr full 32 bit signed */
>> +    tcg_gen_mul_tl(R, t0, t1); /* R = Rd *Rr */
>> +    tcg_gen_shli_tl(R, R, 1);
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +    tcg_gen_andi_tl(R1, R1, 0xff);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
>> +    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication
>> + *  and shifts the result one bit left.
>> + */
>> +static bool trans_FMULSU(DisasContext *ctx, arg_FMULSU *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
>> +    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd *Rr */
>> +    tcg_gen_shli_tl(R, R, 1);
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +    tcg_gen_andi_tl(R1, R1, 0xff);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
>> +    tcg_gen_andi_tl(cpu_Zf, R, 0x0000ffff);
>> +
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Calls to a subroutine within the entire 4M (words) Program memory. The
>> + *  return address (to the instruction after the CALL) will be stored onto the
>> + *  Stack. See also RCALL. The Stack Pointer uses a post-decrement scheme during
>> + *  CALL.  This instruction is not available in all devices. Refer to the device
>> + *  specific instruction set summary.
>> + */
>> +static bool trans_ICALL(DisasContext *ctx, arg_ICALL *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_IJMP_ICALL)) {
>> +        return true;
>> +    }
>> +
>> +    int ret = ctx->npc;
>> +
>> +    gen_push_ret(ctx, ret);
>> +    gen_jmp_z(ctx);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Indirect jump to the address pointed to by the Z (16 bits) Pointer
>> + *  Register in the Register File. The Z-pointer Register is 16 bits wide and
>> + *  allows jump within the lowest 64K words (128KB) section of Program memory.
>> + *  This instruction is not available in all devices. Refer to the device
>> + *  specific instruction set summary.
>> + */
>> +static bool trans_IJMP(DisasContext *ctx, arg_IJMP *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_IJMP_ICALL)) {
>> +        return true;
>> +    }
>> +
>> +    gen_jmp_z(ctx);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads data from the I/O Space (Ports, Timers, Configuration Registers,
>> + *  etc.) into register Rd in the Register File.
>> + */
>> +static bool trans_IN(DisasContext *ctx, arg_IN *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv port = tcg_const_i32(a->imm);
>> +
>> +    gen_helper_inb(Rd, cpu_env, port);
>> +
>> +    tcg_temp_free_i32(port);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Adds one -1- to the contents of register Rd and places the result in the
>> + *  destination register Rd.  The C Flag in SREG is not affected by the
>> + *  operation, thus allowing the INC instruction to be used on a loop counter in
>> + *  multiple-precision computations.  When operating on unsigned numbers, only
>> + *  BREQ and BRNE branches can be expected to perform consistently. When
>> + *  operating on two's complement values, all signed branches are available.
>> + */
>> +static bool trans_INC(DisasContext *ctx, arg_INC *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +
>> +    tcg_gen_addi_tl(Rd, Rd, 1);
>> +    tcg_gen_andi_tl(Rd, Rd, 0xff);
>> +
>> +    /* cpu_Vf = Rd == 0x80 */
>> +    tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_Vf, Rd, 0x80);
>> +    gen_ZNSf(Rd);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Jump to an address within the entire 4M (words) Program memory. See also
>> + *  RJMP.  This instruction is not available in all devices. Refer to the device
>> + *  specific instruction set summary.0
>> + */
>> +static bool trans_JMP(DisasContext *ctx, arg_JMP *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_JMP_CALL)) {
>> +        return true;
>> +    }
>> +
>> +    gen_goto_tb(ctx, 0, a->imm);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Load one byte indirect from data space to register and stores an clear
>> + *  the bits in data space specified by the register. The instruction can only
>> + *  be used towards internal SRAM.  The data location is pointed to by the Z (16
>> + *  bits) Pointer Register in the Register File. Memory access is limited to the
>> + *  current data segment of 64KB. To access another data segment in devices with
>> + *  more than 64KB data space, the RAMPZ in register in the I/O area has to be
>> + *  changed.  The Z-pointer Register is left unchanged by the operation. This
>> + *  instruction is especially suited for clearing status bits stored in SRAM.
>> + */
>> +static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
>> +{
>> +    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
>> +        gen_helper_fullwr(cpu_env, data, addr);
>> +    } else {
>> +        tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
>> +    }
>> +}
>> +
>> +static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
>> +{
>> +    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
>> +        gen_helper_fullrd(data, cpu_env, addr);
>> +    } else {
>> +        tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
>> +    }
>> +}
>> +
>> +static bool trans_LAC(DisasContext *ctx, arg_LAC *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rr = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
>> +        /* t1 = t0 & (0xff - Rr) = t0 and ~Rr */
>> +    tcg_gen_andc_tl(t1, t0, Rr);
>> +
>> +    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
>> +    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Load one byte indirect from data space to register and set bits in data
>> + *  space specified by the register. The instruction can only be used towards
>> + *  internal SRAM.  The data location is pointed to by the Z (16 bits) Pointer
>> + *  Register in the Register File. Memory access is limited to the current data
>> + *  segment of 64KB. To access another data segment in devices with more than
>> + *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
>> + *  The Z-pointer Register is left unchanged by the operation. This instruction
>> + *  is especially suited for setting status bits stored in SRAM.
>> + */
>> +static bool trans_LAS(DisasContext *ctx, arg_LAS *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rr = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
>> +    tcg_gen_or_tl(t1, t0, Rr);
>> +
>> +    tcg_gen_mov_tl(Rr, t0); /* Rr = t0 */
>> +    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Load one byte indirect from data space to register and toggles bits in
>> + *  the data space specified by the register.  The instruction can only be used
>> + *  towards SRAM.  The data location is pointed to by the Z (16 bits) Pointer
>> + *  Register in the Register File. Memory access is limited to the current data
>> + *  segment of 64KB. To access another data segment in devices with more than
>> + *  64KB data space, the RAMPZ in register in the I/O area has to be changed.
>> + *  The Z-pointer Register is left unchanged by the operation. This instruction
>> + *  is especially suited for changing status bits stored in SRAM.
>> + */
>> +static bool trans_LAT(DisasContext *ctx, arg_LAT *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_RMW)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    gen_data_load(ctx, t0, addr); /* t0 = mem[addr] */
>> +    tcg_gen_xor_tl(t1, t0, Rd);
>> +
>> +    tcg_gen_mov_tl(Rd, t0); /* Rd = t0 */
>> +    gen_data_store(ctx, t1, addr); /* mem[addr] = t1 */
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte indirect from the data space to a register. For parts
>> + *  with SRAM, the data space consists of the Register File, I/O memory and
>> + *  internal SRAM (and external SRAM if applicable). For parts without SRAM, the
>> + *  data space consists of the Register File only. In some parts the Flash
>> + *  Memory has been mapped to the data space and can be read using this command.
>> + *  The EEPROM has a separate address space.  The data location is pointed to by
>> + *  the X (16 bits) Pointer Register in the Register File. Memory access is
>> + *  limited to the current data segment of 64KB. To access another data segment
>> + *  in devices with more than 64KB data space, the RAMPX in register in the I/O
>> + *  area has to be changed.  The X-pointer Register can either be left unchanged
>> + *  by the operation, or it can be post-incremented or predecremented.  These
>> + *  features are especially suited for accessing arrays, tables, and Stack
>> + *  Pointer usage of the X-pointer Register. Note that only the low byte of the
>> + *  X-pointer is updated in devices with no more than 256 bytes data space. For
>> + *  such devices, the high byte of the pointer is not used by this instruction
>> + *  and can be used for other purposes. The RAMPX Register in the I/O area is
>> + *  updated in parts with more than 64KB data space or more than 64KB Program
>> + *  memory, and the increment/decrement is added to the entire 24-bit address on
>> + *  such devices.  Not all variants of this instruction is available in all
>> + *  devices. Refer to the device specific instruction set summary.  In the
>> + *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
>> + *  operation as LPM since the program memory is mapped to the data memory
>> + *  space.
>> + */
>> +static bool trans_LDX1(DisasContext *ctx, arg_LDX1 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_xaddr();
>> +
>> +    gen_data_load(ctx, Rd, addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDX2(DisasContext *ctx, arg_LDX2 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_xaddr();
>> +
>> +    gen_data_load(ctx, Rd, addr);
>> +    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
>> +
>> +    gen_set_xaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDX3(DisasContext *ctx, arg_LDX3 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_xaddr();
>> +
>> +    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
>> +    gen_data_load(ctx, Rd, addr);
>> +    gen_set_xaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte indirect with or without displacement from the data space
>> + *  to a register. For parts with SRAM, the data space consists of the Register
>> + *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
>> + *  parts without SRAM, the data space consists of the Register File only. In
>> + *  some parts the Flash Memory has been mapped to the data space and can be
>> + *  read using this command. The EEPROM has a separate address space.  The data
>> + *  location is pointed to by the Y (16 bits) Pointer Register in the Register
>> + *  File. Memory access is limited to the current data segment of 64KB. To
>> + *  access another data segment in devices with more than 64KB data space, the
>> + *  RAMPY in register in the I/O area has to be changed.  The Y-pointer Register
>> + *  can either be left unchanged by the operation, or it can be post-incremented
>> + *  or predecremented.  These features are especially suited for accessing
>> + *  arrays, tables, and Stack Pointer usage of the Y-pointer Register. Note that
>> + *  only the low byte of the Y-pointer is updated in devices with no more than
>> + *  256 bytes data space. For such devices, the high byte of the pointer is not
>> + *  used by this instruction and can be used for other purposes. The RAMPY
>> + *  Register in the I/O area is updated in parts with more than 64KB data space
>> + *  or more than 64KB Program memory, and the increment/decrement/displacement
>> + *  is added to the entire 24-bit address on such devices.  Not all variants of
>> + *  this instruction is available in all devices. Refer to the device specific
>> + *  instruction set summary.  In the Reduced Core tinyAVR the LD instruction can
>> + *  be used to achieve the same operation as LPM since the program memory is
>> + *  mapped to the data memory space.
>> + */
>> +static bool trans_LDY2(DisasContext *ctx, arg_LDY2 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_yaddr();
>> +
>> +    gen_data_load(ctx, Rd, addr);
>> +    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
>> +
>> +    gen_set_yaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDY3(DisasContext *ctx, arg_LDY3 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_yaddr();
>> +
>> +    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
>> +    gen_data_load(ctx, Rd, addr);
>> +    gen_set_yaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDDY(DisasContext *ctx, arg_LDDY *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_yaddr();
>> +
>> +    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
>> +    gen_data_load(ctx, Rd, addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte indirect with or without displacement from the data space
>> + *  to a register. For parts with SRAM, the data space consists of the Register
>> + *  File, I/O memory and internal SRAM (and external SRAM if applicable). For
>> + *  parts without SRAM, the data space consists of the Register File only. In
>> + *  some parts the Flash Memory has been mapped to the data space and can be
>> + *  read using this command. The EEPROM has a separate address space.  The data
>> + *  location is pointed to by the Z (16 bits) Pointer Register in the Register
>> + *  File. Memory access is limited to the current data segment of 64KB. To
>> + *  access another data segment in devices with more than 64KB data space, the
>> + *  RAMPZ in register in the I/O area has to be changed.  The Z-pointer Register
>> + *  can either be left unchanged by the operation, or it can be post-incremented
>> + *  or predecremented.  These features are especially suited for Stack Pointer
>> + *  usage of the Z-pointer Register, however because the Z-pointer Register can
>> + *  be used for indirect subroutine calls, indirect jumps and table lookup, it
>> + *  is often more convenient to use the X or Y-pointer as a dedicated Stack
>> + *  Pointer. Note that only the low byte of the Z-pointer is updated in devices
>> + *  with no more than 256 bytes data space. For such devices, the high byte of
>> + *  the pointer is not used by this instruction and can be used for other
>> + *  purposes. The RAMPZ Register in the I/O area is updated in parts with more
>> + *  than 64KB data space or more than 64KB Program memory, and the
>> + *  increment/decrement/displacement is added to the entire 24-bit address on
>> + *  such devices.  Not all variants of this instruction is available in all
>> + *  devices. Refer to the device specific instruction set summary.  In the
>> + *  Reduced Core tinyAVR the LD instruction can be used to achieve the same
>> + *  operation as LPM since the program memory is mapped to the data memory
>> + *  space.  For using the Z-pointer for table lookup in Program memory see the
>> + *  LPM and ELPM instructions.
>> + */
>> +static bool trans_LDZ2(DisasContext *ctx, arg_LDZ2 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    gen_data_load(ctx, Rd, addr);
>> +    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
>> +
>> +    gen_set_zaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDZ3(DisasContext *ctx, arg_LDZ3 *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    tcg_gen_subi_tl(addr, addr, 1); /* addr = addr - 1 */
>> +    gen_data_load(ctx, Rd, addr);
>> +
>> +    gen_set_zaddr(addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LDDZ(DisasContext *ctx, arg_LDDZ *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = gen_get_zaddr();
>> +
>> +    tcg_gen_addi_tl(addr, addr, a->imm); /* addr = addr + q */
>> +    gen_data_load(ctx, Rd, addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + * Loads an 8 bit constant directly to register 16 to 31.
>> + */
>> +static bool trans_LDI(DisasContext *ctx, arg_LDI *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    int imm = a->imm;
>> +
>> +    tcg_gen_movi_tl(Rd, imm);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte from the data space to a register. For parts with SRAM,
>> + *  the data space consists of the Register File, I/O memory and internal SRAM
>> + *  (and external SRAM if applicable). For parts without SRAM, the data space
>> + *  consists of the register file only. The EEPROM has a separate address space.
>> + *  A 16-bit address must be supplied. Memory access is limited to the current
>> + *  data segment of 64KB. The LDS instruction uses the RAMPD Register to access
>> + *  memory above 64KB. To access another data segment in devices with more than
>> + *  64KB data space, the RAMPD in register in the I/O area has to be changed.
>> + *  This instruction is not available in all devices. Refer to the device
>> + *  specific instruction set summary.
>> + */
>> +static bool trans_LDS(DisasContext *ctx, arg_LDS *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = tcg_temp_new_i32();
>> +    TCGv H = cpu_rampD;
>> +    a->imm = next_word(ctx);
>> +
>> +    tcg_gen_mov_tl(addr, H); /* addr = H:M:L */
>> +    tcg_gen_shli_tl(addr, addr, 16);
>> +    tcg_gen_ori_tl(addr, addr, a->imm);
>> +
>> +    gen_data_load(ctx, Rd, addr);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Loads one byte pointed to by the Z-register into the destination
>> + *  register Rd. This instruction features a 100% space effective constant
>> + *  initialization or constant data fetch. The Program memory is organized in
>> + *  16-bit words while the Z-pointer is a byte address. Thus, the least
>> + *  significant bit of the Z-pointer selects either low byte (ZLSB = 0) or high
>> + *  byte (ZLSB = 1). This instruction can address the first 64KB (32K words) of
>> + *  Program memory. The Zpointer Register can either be left unchanged by the
>> + *  operation, or it can be incremented. The incrementation does not apply to
>> + *  the RAMPZ Register.  Devices with Self-Programming capability can use the
>> + *  LPM instruction to read the Fuse and Lock bit values.  Refer to the device
>> + *  documentation for a detailed description.  The LPM instruction is not
>> + *  available in all devices. Refer to the device specific instruction set
>> + *  summary
>> + */
>> +static bool trans_LPM1(DisasContext *ctx, arg_LPM1 *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_LPM)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[0];
>> +    TCGv addr = tcg_temp_new_i32();
>> +    TCGv H = cpu_r[31];
>> +    TCGv L = cpu_r[30];
>> +
>> +    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
>> +    tcg_gen_or_tl(addr, addr, L);
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LPM2(DisasContext *ctx, arg_LPM2 *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_LPM)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = tcg_temp_new_i32();
>> +    TCGv H = cpu_r[31];
>> +    TCGv L = cpu_r[30];
>> +
>> +    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
>> +    tcg_gen_or_tl(addr, addr, L);
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_LPMX(DisasContext *ctx, arg_LPMX *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_LPMX)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv addr = tcg_temp_new_i32();
>> +    TCGv H = cpu_r[31];
>> +    TCGv L = cpu_r[30];
>> +
>> +    tcg_gen_shli_tl(addr, H, 8); /* addr = H:L */
>> +    tcg_gen_or_tl(addr, addr, L);
>> +
>> +    tcg_gen_qemu_ld8u(Rd, addr, MMU_CODE_IDX); /* Rd = mem[addr] */
>> +
>> +    tcg_gen_addi_tl(addr, addr, 1); /* addr = addr + 1 */
>> +
>> +    tcg_gen_andi_tl(L, addr, 0xff);
>> +
>> +    tcg_gen_shri_tl(addr, addr, 8);
>> +    tcg_gen_andi_tl(H, addr, 0xff);
>> +
>> +    tcg_temp_free_i32(addr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Shifts all bits in Rd one place to the right. Bit 7 is cleared. Bit 0 is
>> + *  loaded into the C Flag of the SREG. This operation effectively divides an
>> + *  unsigned value by two. The C Flag can be used to round the result.
>> + */
>> +static bool trans_LSR(DisasContext *ctx, arg_LSR *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +
>> +    tcg_gen_andi_tl(cpu_Cf, Rd, 1);
>> +
>> +    tcg_gen_shri_tl(Rd, Rd, 1);
>> +
>> +    tcg_gen_mov_tl(cpu_Zf, Rd);
>> +    tcg_gen_movi_tl(cpu_Nf, 0);
>> +    tcg_gen_mov_tl(cpu_Vf, cpu_Cf);
>> +    tcg_gen_mov_tl(cpu_Sf, cpu_Vf);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction makes a copy of one register into another. The source
>> + *  register Rr is left unchanged, while the destination register Rd is loaded
>> + *  with a copy of Rr.
>> + */
>> +static bool trans_MOV(DisasContext *ctx, arg_MOV *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +
>> +    tcg_gen_mov_tl(Rd, Rr);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction makes a copy of one register pair into another register
>> + *  pair. The source register pair Rr+1:Rr is left unchanged, while the
>> + *  destination register pair Rd+1:Rd is loaded with a copy of Rr + 1:Rr.  This
>> + *  instruction is not available in all devices. Refer to the device specific
>> + *  instruction set summary.
>> + */
>> +static bool trans_MOVW(DisasContext *ctx, arg_MOVW *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MOVW)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv RdL = cpu_r[a->rd];
>> +    TCGv RdH = cpu_r[a->rd + 1];
>> +    TCGv RrL = cpu_r[a->rr];
>> +    TCGv RrH = cpu_r[a->rr + 1];
>> +
>> +    tcg_gen_mov_tl(RdH, RrH);
>> +    tcg_gen_mov_tl(RdL, RrL);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit unsigned multiplication.
>> + */
>> +static bool trans_MUL(DisasContext *ctx, arg_MUL *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    tcg_gen_mul_tl(R, Rd, Rr); /* R = Rd *Rr */
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(16) */
>> +    tcg_gen_mov_tl(cpu_Zf, R);
>> +
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit signed multiplication.
>> + */
>> +static bool trans_MULS(DisasContext *ctx, arg_MULS *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +    TCGv t1 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
>> +    tcg_gen_ext8s_tl(t1, Rr); /* make Rr full 32 bit signed */
>> +    tcg_gen_mul_tl(R, t0, t1); /* R = Rd * Rr */
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 15); /* Cf = R(16) */
>> +    tcg_gen_mov_tl(cpu_Zf, R);
>> +
>> +    tcg_temp_free_i32(t1);
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  This instruction performs 8-bit x 8-bit -> 16-bit multiplication of a
>> + *  signed and an unsigned number.
>> + */
>> +static bool trans_MULSU(DisasContext *ctx, arg_MULSU *a)
>> +{
>> +    if (!avr_have_feature(ctx, AVR_FEATURE_MUL)) {
>> +        return true;
>> +    }
>> +
>> +    TCGv R0 = cpu_r[0];
>> +    TCGv R1 = cpu_r[1];
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv Rr = cpu_r[a->rr];
>> +    TCGv R = tcg_temp_new_i32();
>> +    TCGv t0 = tcg_temp_new_i32();
>> +
>> +    tcg_gen_ext8s_tl(t0, Rd); /* make Rd full 32 bit signed */
>> +    tcg_gen_mul_tl(R, t0, Rr); /* R = Rd *Rr */
>> +
>> +    tcg_gen_andi_tl(R0, R, 0xff);
>> +    tcg_gen_shri_tl(R1, R, 8);
>> +
>> +    tcg_gen_shri_tl(cpu_Cf, R, 16); /* Cf = R(16) */
>> +    tcg_gen_mov_tl(cpu_Zf, R);
>> +
>> +    tcg_temp_free_i32(t0);
>> +    tcg_temp_free_i32(R);
>> +
>> +    return true;
>> +}
>> +
>> +/*
>> + *  Replaces the contents of register Rd with its two's complement; the
>> + *  value $80 is left unchanged.
>> + */
>> +static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
>> +{
>> +    TCGv Rd = cpu_r[a->rd];
>> +    TCGv t0 = tcg_const_i32(0);
>> +    TCGv R = tcg_temp_new_i32();
>> +
>> +    /* op */
>> +    tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
>> +    tcg_gen_andi_tl(R, R, 0xff); /* make it 8 bits */
>> +
>> +    gen_sub_CHf(R, t0, Rd);
>> +    gen_sub_Vf(R, t0, Rd);
>> +    gen_ZNSf(R);
>> +
>> +    /* R */
>> +    tcg_gen_mov_tl(Rd,--
>> 2.17.2 (Apple Git-113)
>>
>>


-- 
Best Regards,
Michael Rolnik

