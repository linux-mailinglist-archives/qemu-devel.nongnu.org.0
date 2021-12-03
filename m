Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8694673AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:07:51 +0100 (CET)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4Xm-0001Yf-KJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4UL-0006aP-1Z
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:04:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:37955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4UI-0000AC-RW
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:04:16 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8XLj-1mWbjX2vXV-014XMg; Fri, 03 Dec 2021 10:04:10 +0100
Message-ID: <0a617ffc-1d91-df53-cb85-ad03cfaa099d@vivier.eu>
Date: Fri, 3 Dec 2021 10:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 01/15] target/m68k: Raise the TRAPn exception with the
 correct pc
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211202204900.50973-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mm8HzP97w3ncfJ0mVBnjBwZUsemjDaiyIr/FUm7zIwj9JOM+2S+
 CHgb5cGznNSQsD0QqTe7iMxDcZe35wTK/pDC45jCadc7d2o6/oSmVKo444xyqhQlqKdFXRm
 jYLTZsZi+z3ShjloBJLneSe8C3qkqzqsb8mZFoNrvaFFterbXKZMGGF14nI1mV6qj4EfdLK
 szkW/8ebxhAuO+sgzqGpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:foV2gNT/IY8=:B02FvIJORfJVUwOlPm2Q+p
 WmG4DXISUnBz1ZZVupc9hPVJOBBhM0w8ooRUsUMeCNqwaakrU58BPAJHDMhlc9q1e4Dlo6oGh
 VtmZmv35MCrypDFQzh76dz9fzEBnOZh5MhcZ+UC+YKCZwIERjpY4UHVMPdQ8APv2TAUAQko9q
 IKKf1H3o1X/8caWyZXwBCTk4TYwyFb2UvB2EObapxXZ5WGVVlNJO5ZQue2ztbuEwKkJh9CWSp
 qe7ylHG9b4LiuNYsm5cDa7WsvH0TEp0Cpf7J+y6VbY3Ax43UIQYpeThSNTTm6WEhWqUyNMgxN
 owu5WdfySmOtP8eetu304pqVcM5YQn/zBidydSOs8rOzuOCTOMBpGzEP9uL0rRtwqzRFf2dD7
 Tbx39/M2GbnM9ZEyWdVQImm6hY1iyTyDRC7qFxSyA0opSMX5G9F0jVxDXM/PqK1kgxc9YXvCC
 wpwzRS0WIrSLocDYTxwhwvA3RGcIK7Cu9LigMGL5SO0En5SWntclaLNjku7xlQQIbwT8Q62ip
 cmZjUD0UlODxK3U2daEqpopTYmdkQsOTiiA1zhR2VMlKATK85BydEdgJZ5/Owf9fy42PSxMk7
 xZOw+AdbQnvLL74XDHctJEylaZd7rDgvdBKU6gqPN8xS1LHjERN2uNxqNGrGWHQBjnwmgYOx2
 5JwlkrOr5CwYyBxkxv6oZvJ+pdmQJXx5B5FmaiHqCC5qmTgrHbUW1FsPOAo6VfKL8C3g=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 02/12/2021 à 21:48, Richard Henderson a écrit :
> Rather than adjust the PC in all of the consumers, raise
> the exception with the correct PC in the first place.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c | 1 -
>   target/m68k/op_helper.c    | 9 ---------
>   target/m68k/translate.c    | 2 +-
>   3 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 790bd558c3..287f24cc60 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -70,7 +70,6 @@ void cpu_loop(CPUM68KState *env)
>               {
>                   abi_long ret;
>                   n = env->dregs[0];
> -                env->pc += 2;
>                   ret = do_syscall(env,
>                                    n,
>                                    env->dregs[1],
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index cfbc987ba6..36662de149 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -216,11 +216,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
>               cpu_loop_exit(cs);
>               return;
>           }
> -        if (cs->exception_index >= EXCP_TRAP0
> -            && cs->exception_index <= EXCP_TRAP15) {
> -            /* Move the PC after the trap instruction.  */
> -            retaddr += 2;
> -        }
>       }
>   
>       vector = cs->exception_index << 2;
> @@ -303,10 +298,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>               /* Return from an exception.  */
>               m68k_rte(env);
>               return;
> -        case EXCP_TRAP0 ...  EXCP_TRAP15:
> -            /* Move the PC after the trap instruction.  */
> -            retaddr += 2;
> -            break;
>           }
>       }
>   
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index af43c8eab8..af3febdd48 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -4860,7 +4860,7 @@ DISAS_INSN(wdebug)
>   
>   DISAS_INSN(trap)
>   {
> -    gen_exception(s, s->base.pc_next, EXCP_TRAP0 + (insn & 0xf));
> +    gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
>   }
>   
>   static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

