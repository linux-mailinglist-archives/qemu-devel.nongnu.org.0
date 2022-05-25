Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1535345EF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:43:11 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntymb-0001nM-O8
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyki-00010v-42
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:41:12 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntykf-0006hu-0R
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:41:11 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5wTt-1nvvcm32D5-007Unh; Wed, 25 May 2022 23:41:00 +0200
Message-ID: <ce53c8b1-b3fc-1cd4-7c65-58d970df5733@vivier.eu>
Date: Wed, 25 May 2022 23:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 10/17] target/m68k: Implement TRAPcc
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-11-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vATKq4H+M0da7lzP2JwEx7uZ0DqnusXq9kLt2Lup14pKxEcEPxb
 T22UGpUy+rswGQ19yZWf2ZkiVp5zVVxA0LKDRweJoe0zLVj9nvK20+U5HSWu42IIc5NrtJN
 MrvykqMeGDt1xMstC3rxMgCsiyYxpN7XUYYLrHq4rzJfU0EUJ+INwVPHxcjSDYlyKAxRDG/
 vPC9+quAyfz7aFGGgNK5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QwBNWcpwuE8=:T2QphBi6mF0kisrqtDkfgK
 CtUXplylUsz3fQrexMVe0WdW3g8gnILzBrBBFDLoKOro2kCXJiO25DE4tyR55QK/RZSM8F6M5
 ryYGZHsPBAxis98OpzDwYt7alru4RYcPh6be9FoPyHnKfCbw3g2nnnAC5XBaqrEcu6J96jrp/
 1X2T5MuWMOpSijyxdAjPTaMuHE6n36HONQvzhGngtDSSu1jhXohDlVz9dHUmyQI1ama7SlWb6
 w8y20NuZidYVl4wGyAiw9VruV+qsKuAoFa77AdbUHsewYPd5N0g1sea3GR6I8C5j3wtdi/Ssz
 g6PhtdbKLYxg0g3WfFYw0H0JbqoP/I1CmWU6gQtt8ib+qu6nqIrqgOh7aLJ3q260FJh9E1s0z
 RDO7vLoZbC29WjhxBBFKN/YDxPKkJuOL6jC0W+7X8uHEyF50R25lufCySNww5fMJLtH2AsknP
 KkJwRCgklHH2rw1SOwhSMZZe4teMh71ij3phj3J8zTE8aS6Q4ILb1kwcGdY4whSHN47Y3234L
 EkXFUrhAxbQor8gQbrbzkUdNIISo+Q+NCuzSG3bpvuoU/1w9xTs7qbBNm88lNhuaKjYfP4zcg
 Wgrp2l0edj9At/qQDLF6WfdWX2NMPGUjywdvI2egwy02Us1qwxJJFNw2g8C/OZYzkIlWfHtWJ
 op/A/coQatEUkxoZLQkWIVVBz7Z0jZLB/RQwXN9Dk0DUb8JTJbegoUqYMxYBScYOmmstrdrct
 ikStRD3a69Fz6XFY4rnQB/oCYY0j7PalIcYhAQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.h          |  2 ++
>   linux-user/m68k/cpu_loop.c |  1 +
>   target/m68k/cpu.c          |  1 +
>   target/m68k/op_helper.c    |  6 +----
>   target/m68k/translate.c    | 49 ++++++++++++++++++++++++++++++++++++++
>   5 files changed, 54 insertions(+), 5 deletions(-)
> 
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 558c3c67d6..4d8f48e8c7 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -534,6 +534,8 @@ enum m68k_features {
>       M68K_FEATURE_MOVEC,
>       /* Unaligned data accesses (680[2346]0) */
>       M68K_FEATURE_UNALIGNED_DATA,
> +    /* TRAPcc insn. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_TRAPCC,
>   };
>   
>   static inline int m68k_feature(CPUM68KState *env, int feature)
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 000bb44cc3..5007b24c03 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -48,6 +48,7 @@ void cpu_loop(CPUM68KState *env)
>               force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
>               break;
>           case EXCP_CHK:
> +        case EXCP_TRAPCC:
>               force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->mmu.ar);
>               break;
>           case EXCP_DIV0:
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index c7aeb7da9c..5f778773d1 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -162,6 +162,7 @@ static void m68020_cpu_initfn(Object *obj)
>       m68k_set_feature(env, M68K_FEATURE_CHK2);
>       m68k_set_feature(env, M68K_FEATURE_MSP);
>       m68k_set_feature(env, M68K_FEATURE_UNALIGNED_DATA);
> +    m68k_set_feature(env, M68K_FEATURE_TRAPCC);
>   }
>   
>   /*
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index aa62158eb9..61948d92bb 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -399,14 +399,10 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>           do_stack_frame(env, &sp, 2, oldsr, 0, env->pc);
>           break;
>   
> -    case EXCP_TRAPCC:
> -        /* FIXME: addr is not only env->pc */
> -        do_stack_frame(env, &sp, 2, oldsr, env->pc, env->pc);
> -        break;
> -
>       case EXCP_CHK:
>       case EXCP_DIV0:
>       case EXCP_TRACE:
> +    case EXCP_TRAPCC:
>           do_stack_frame(env, &sp, 2, oldsr, env->mmu.ar, env->pc);
>           break;
>   
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 399d9232e4..c4fe8abc03 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -4879,6 +4879,54 @@ DISAS_INSN(trap)
>       gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
>   }
>   
> +static void do_trapcc(DisasContext *s, DisasCompare *c)
> +{
> +    if (c->tcond != TCG_COND_NEVER) {
> +        TCGLabel *over = NULL;
> +
> +        update_cc_op(s);
> +
> +        if (c->tcond != TCG_COND_ALWAYS) {
> +            /* Jump over if !c. */
> +            over = gen_new_label();
> +            tcg_gen_brcond_i32(tcg_invert_cond(c->tcond), c->v1, c->v2, over);
> +        }
> +
> +        tcg_gen_movi_i32(QREG_PC, s->pc);
> +        gen_raise_exception_format2(s, EXCP_TRAPCC, s->base.pc_next);
> +
> +        if (over != NULL) {
> +            gen_set_label(over);
> +            s->base.is_jmp = DISAS_NEXT;
> +        }
> +    }
> +    free_cond(c);
> +}
> +
> +DISAS_INSN(trapcc)
> +{
> +    DisasCompare c;
> +
> +    /* Consume and discard the immediate operand. */
> +    switch (extract32(insn, 0, 3)) {
> +    case 2: /* trapcc.w */
> +        (void)read_im16(env, s);
> +        break;
> +    case 3: /* trapcc.l */
> +        (void)read_im32(env, s);
> +        break;

Do we really need to read the data or do we only need to increment s->pc (as the data are only here 
to be available for the trap handler)?

> +    case 4: /* trapcc (no operand) */
> +        break;
> +    default:
> +        /* Illegal insn */
> +        disas_undef(env, s, insn);
> +        return;
> +    }
> +
> +    gen_cc_cond(&c, s, extract32(insn, 8, 4));
> +    do_trapcc(s, &c);
> +}
> +
>   static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
>   {
>       switch (reg) {
> @@ -6050,6 +6098,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>       INSN(dbcc,      50c8, f0f8, M68000);
> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>       INSN(tpf,       51f8, fff8, CF_ISA_A);
>   
>       /* Branch instructions.  */

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

