Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB778534626
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 00:01:04 +0200 (CEST)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntz3w-0005Fv-17
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 18:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntz1T-00043A-5S
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:58:31 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:53525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntz1R-0000hI-26
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:58:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLR5h-1oBNJa0fJ5-00IRfb; Wed, 25 May 2022 23:58:25 +0200
Message-ID: <7c8b37b8-b4e2-ae6c-7a21-339f293e4166@vivier.eu>
Date: Wed, 25 May 2022 23:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 08/17] target/m68k: Fix address argument for EXCP_TRACE
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-9-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZX96qc9X/eXkVdRN86sgWd6X9R1pu8jb6Nr4+SYEsIevYsMlT37
 7LWwshCeItolZTWKKZFGx2+Vr/fXUPBKNd04++GxkB3Kw9YHmuUi9GMqygpmrzJjLSoM9Gr
 Kd+AIRVsx399DbDZ+XrYqX6hAAAqysGhovbWdmng7T7l3F3N2s/01RobNT9WIi+WeF9AnE5
 KO9QeFip01oUQbLOTGLcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tqaMAhVj/IA=:9WxmrfDK2vT8gDe3D/ZMJL
 d9+Th1zqPw402f0lDfN5J+ULFQA1EdgW03VYifuF6f0/Rk9MW8N1CfRnKA8iKd7SszrSlEuz0
 KW8ZiaFGPHmW2Y8QIgcZ2rMMCUxN9KVN1sLnltFdaqYZw2fTt81wXhCapA1ajOCSUwGtn3xll
 tQCRDo57AT6EwRkzFHrSWAd7XJBd/hU9/jSS8l6JmKQrJWup1ppDEr/Y0xq6woYOdRwDezfdv
 /F21bBSfgNgMEYh9NbpR+oaklB2d+snFJpQf+EQWGHZfIS5jSzY5a3DalrI0Xoht4GuRjImFt
 Qff/G1Cy7VenMmJLB4SXj8VQ/FakClUhXL9gfGQXp2L/eTe14XR6LcATqpYrdrA4CdodtxSfO
 rZbvcRUwb41RZaBAtNfy3asqXrzV8Em8jLXDiP0TGY3fXLi7aXOeg9BywkAb9QOawBY9HbVfC
 ZErwRV6ZfjxntMeGFc+DovbxR2hCYfU2rCuC5Tw6AsMVeC2PjyVmGPchc1o+OnOHDlEuy0xOR
 mcu8V9n+Me6PbtoUrXQ1uMLAYtLUBpXkGZd3KhBJsxcijfVYycMkf9wrm7YaFpa+gOftOgPOw
 3tH0zfthmayC0ULogB1W6izxkiLB8UDugU4roTRT1oxiGwrywfugefbutFdrMCbL28TP+34oF
 Bq+BgWBWUdRvGqWJCjMRtRU7cytW2Ek4loaxyD2QTQw8sBSXfVXgTNn7yflx0jgba3I3FUvPP
 cbAofJ2n6FE8j7nwI0Uqx/AfRhaAvcaWHHe63w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> According to the M68040 Users Manual, section 8.4.3,
> Six word stack frame (format 2), Trace (and others) is
> supposed to record the next insn in PC and the address
> of the trapping instruction in ADDRESS.
> 
> Create gen_raise_exception_format2 to record the trapping
> pc in env->mmu.ar.  Update m68k_interrupt_all to pass the
> value to do_stack_frame.  Update cpu_loop to handle EXCP_TRACE.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c |  3 +++
>   target/m68k/op_helper.c    |  2 +-
>   target/m68k/translate.c    | 49 +++++++++++++++++++++++++-------------
>   3 files changed, 36 insertions(+), 18 deletions(-)
> 
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 45419d4471..000bb44cc3 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -53,6 +53,9 @@ void cpu_loop(CPUM68KState *env)
>           case EXCP_DIV0:
>               force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->mmu.ar);
>               break;
> +        case EXCP_TRACE:
> +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_TRACE, env->mmu.ar);
> +            break;
>           case EXCP_TRAP0:
>               {
>                   abi_long ret;
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 729ee0e934..3cb71c9140 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -397,13 +397,13 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>   
>       case EXCP_ILLEGAL:
>       case EXCP_TRAPCC:
> -    case EXCP_TRACE:
>           /* FIXME: addr is not only env->pc */
>           do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
>           break;
>   
>       case EXCP_CHK:
>       case EXCP_DIV0:
> +    case EXCP_TRACE:
>           do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
>           break;
>   
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index d775345bfa..399d9232e4 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -114,6 +114,7 @@ typedef struct DisasContext {
>       DisasContextBase base;
>       CPUM68KState *env;
>       target_ulong pc;
> +    target_ulong pc_prev;
>       CCOp cc_op; /* Current CC operation */
>       int cc_op_synced;
>       TCGv_i64 mactmp;
> @@ -298,6 +299,21 @@ static void gen_raise_exception(int nr)
>       tcg_temp_free_i32(tmp);
>   }
>   
> +static void gen_raise_exception_format2(DisasContext *s, int nr,
> +                                        target_ulong this_pc)
> +{
> +    /*
> +     * Pass the address of the insn to the exception handler,
> +     * for recording in the Format $2 (6-word) stack frame.
> +     * Re-use mmu.ar for the purpose, since that's only valid
> +     * after tlb_fill.
> +     */
> +    tcg_gen_st_i32(tcg_constant_i32(this_pc), cpu_env,
> +                   offsetof(CPUM68KState, mmu.ar));
> +    gen_raise_exception(nr);
> +    s->base.is_jmp = DISAS_NORETURN;
> +}
> +
>   static void gen_exception(DisasContext *s, uint32_t dest, int nr)
>   {
>       update_cc_op(s);
> @@ -1494,12 +1510,13 @@ static void gen_exit_tb(DisasContext *s)
>       } while (0)
>   
>   /* Generate a jump to an immediate address.  */
> -static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
> +static void gen_jmp_tb(DisasContext *s, int n, target_ulong dest,
> +                       target_ulong src)
>   {
>       if (unlikely(s->ss_active)) {
>           update_cc_op(s);
>           tcg_gen_movi_i32(QREG_PC, dest);
> -        gen_raise_exception(EXCP_TRACE);
> +        gen_raise_exception_format2(s, EXCP_TRACE, src);
>       } else if (translator_use_goto_tb(&s->base, dest)) {
>           tcg_gen_goto_tb(n);
>           tcg_gen_movi_i32(QREG_PC, dest);
> @@ -1548,9 +1565,9 @@ DISAS_INSN(dbcc)
>       tcg_gen_addi_i32(tmp, tmp, -1);
>       gen_partset_reg(OS_WORD, reg, tmp);
>       tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, -1, l1);
> -    gen_jmp_tb(s, 1, base + offset);
> +    gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
>       gen_set_label(l1);
> -    gen_jmp_tb(s, 0, s->pc);
> +    gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
>   }
>   
>   DISAS_INSN(undef_mac)
> @@ -3096,13 +3113,13 @@ DISAS_INSN(branch)
>           /* Bcc */
>           TCGLabel *l1 = gen_new_label();
>           gen_jmpcc(s, ((insn >> 8) & 0xf) ^ 1, l1);
> -        gen_jmp_tb(s, 1, base + offset);
> +        gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
>           gen_set_label(l1);
> -        gen_jmp_tb(s, 0, s->pc);
> +        gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
>       } else {
>           /* Unconditional branch.  */
>           update_cc_op(s);
> -        gen_jmp_tb(s, 0, base + offset);
> +        gen_jmp_tb(s, 0, base + offset, s->base.pc_next);
>       }
>   }
>   
> @@ -5485,9 +5502,9 @@ DISAS_INSN(fbcc)
>       l1 = gen_new_label();
>       update_cc_op(s);
>       gen_fjmpcc(s, insn & 0x3f, l1);
> -    gen_jmp_tb(s, 0, s->pc);
> +    gen_jmp_tb(s, 0, s->pc, s->base.pc_next);
>       gen_set_label(l1);
> -    gen_jmp_tb(s, 1, base + offset);
> +    gen_jmp_tb(s, 1, base + offset, s->base.pc_next);
>   }
>   
>   DISAS_INSN(fscc)
> @@ -6158,6 +6175,8 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>   
>       dc->env = env;
>       dc->pc = dc->base.pc_first;
> +    /* This value will always be filled in properly before m68k_tr_tb_stop. */
> +    dc->pc_prev = 0xdeadbeef;
>       dc->cc_op = CC_OP_DYNAMIC;
>       dc->cc_op_synced = 1;
>       dc->done_mac = 0;
> @@ -6191,6 +6210,7 @@ static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       do_writebacks(dc);
>       do_release(dc);
>   
> +    dc->pc_prev = dc->base.pc_next;
>       dc->base.pc_next = dc->pc;
>   
>       if (dc->base.is_jmp == DISAS_NEXT) {
> @@ -6225,17 +6245,12 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>           break;
>       case DISAS_TOO_MANY:
>           update_cc_op(dc);
> -        if (dc->ss_active) {
> -            tcg_gen_movi_i32(QREG_PC, dc->pc);
> -            gen_raise_exception(EXCP_TRACE);
> -        } else {
> -            gen_jmp_tb(dc, 0, dc->pc);
> -        }
> +        gen_jmp_tb(dc, 0, dc->pc, dc->pc_prev);
>           break;
>       case DISAS_JUMP:
>           /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
>           if (dc->ss_active) {
> -            gen_raise_exception(EXCP_TRACE);
> +            gen_raise_exception_format2(dc, EXCP_TRACE, dc->pc_prev);
>           } else {
>               tcg_gen_lookup_and_goto_ptr();
>           }
> @@ -6246,7 +6261,7 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>            * other state that may require returning to the main loop.
>            */
>           if (dc->ss_active) {
> -            gen_raise_exception(EXCP_TRACE);
> +            gen_raise_exception_format2(dc, EXCP_TRACE, dc->pc_prev);
>           } else {
>               tcg_gen_exit_tb(NULL, 0);
>           }

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

