Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57574673AF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:08:14 +0100 (CET)
Received: from localhost ([::1]:60786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4YA-0002ah-11
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4WE-0000K0-DC
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:06:14 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:55091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4WC-0000TE-6F
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:06:14 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1fag-1mQIIr357w-0122Nc; Fri, 03 Dec 2021 10:06:09 +0100
Message-ID: <d668ae3b-5d9c-57b9-25bd-a8edf46ec192@vivier.eu>
Date: Fri, 3 Dec 2021 10:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 02/15] target/m68k: Switch over exception type in
 m68k_interrupt_all
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211202204900.50973-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:36M/dho5aczG27VPG1ytP/Bn/FYgmaCEPwpu+I+Tm8jCYWz+lFo
 X14C5ervhxcuqn67feH/050ZQcQioTq6Bm1xCRPmegYHvJIA5MWAGexbuXMaPlK6xYA3isT
 5b5ScagRs5K0RQZ25M8aMR8Ba5UrXD7yvRC/IB3RlHQVkkAHWt0lLmxMrLXZCn0M6FfQuSw
 8efFz5p6GACddM3gPJFkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JC6bZRqIa+U=:vPf2BWVVHAVHkkZexbp9j0
 85qGKTUEvtwhFgoon4jqzcRn6rVtAvwAYa/HPjYkHTziv7KNwFElbXDipSzINSdo04LJCgTv5
 bJX91yurpnlxEs1T7/CZ6qP5L0sAI7wDdJoOlxIoUcgqA/rL25eFVKHsyd9YWfl3QxcLrMJtU
 EfMzAibwLemPc43Mb/UeW8d6oj/GgtoiUmnw8k3/HuibR+rH0R3TwpO5CCI/+QQDbUzks81F5
 dtM/FW61ebnz1PLXEfO/FIspg1zrFcnlKjeB3aM3CxjFipbtZqKQOXHAZQArT4mdry+YS4hJ6
 Q72MNdPsWJW0m6EMthupKTOcAl9RUGk+N6/AuhI7KwWoVvyTH0DMhnE1pbsiRi3mjUZoyFW+c
 F9YR7SU5gOmHXo0Uee1DVMW0wth5qnMQFG39+fBvo39ihDX0FPlt4MwVqM2g4CyWf7iYLsERF
 5M84gl7orRoSL7X2pMTLct3R95JmLK5Y1bpBUPFwwfpU6q6gho0VNeCudljNh5t9XnAtJ3C9d
 DAdttFo0S3fFIj+JAvxkWDP1TNJqMJrYzJwFLQryvihy2gPDXVRJXAyhE7iytZMDIVBiaqYfN
 S+CPWR40oBwXEpheGC/5o5T4PCBjVr2LluDr+8jqgEP2iyAP53Gz1sIROb0jK+zOaQJJDL8kE
 LCU/kg8Ajfx67Xe3lQzloIATxB+9OLhv4vwrrQPaYC5PKOVJgYIIPJBYX+aE4GKXRiRQ=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> Replace an if ladder with a switch for clarity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/op_helper.c | 45 +++++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 36662de149..71176eb3d8 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -332,7 +332,8 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>           sp &= ~1;
>       }
>   
> -    if (cs->exception_index == EXCP_ACCESS) {
> +    switch (cs->exception_index) {
> +    case EXCP_ACCESS:
>           if (env->mmu.fault) {
>               cpu_abort(cs, "DOUBLE MMU FAULT\n");
>           }
> @@ -390,26 +391,36 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
>                        "ssw:  %08x ea:   %08x sfc:  %d    dfc: %d\n",
>                        env->mmu.ssw, env->mmu.ar, env->sfc, env->dfc);
>           }
> -    } else if (cs->exception_index == EXCP_ADDRESS) {
> +        break;
> +
> +    case EXCP_ADDRESS:
>           do_stack_frame(env, &sp, 2, oldsr, 0, retaddr);
> -    } else if (cs->exception_index == EXCP_ILLEGAL ||
> -               cs->exception_index == EXCP_DIV0 ||
> -               cs->exception_index == EXCP_CHK ||
> -               cs->exception_index == EXCP_TRAPCC ||
> -               cs->exception_index == EXCP_TRACE) {
> +        break;
> +
> +    case EXCP_ILLEGAL:
> +    case EXCP_DIV0:
> +    case EXCP_CHK:
> +    case EXCP_TRAPCC:
> +    case EXCP_TRACE:
>           /* FIXME: addr is not only env->pc */
>           do_stack_frame(env, &sp, 2, oldsr, env->pc, retaddr);
> -    } else if (is_hw && oldsr & SR_M &&
> -               cs->exception_index >= EXCP_SPURIOUS &&
> -               cs->exception_index <= EXCP_INT_LEVEL_7) {
> -        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> -        oldsr = sr;
> -        env->aregs[7] = sp;
> -        cpu_m68k_set_sr(env, sr &= ~SR_M);
> -        sp = env->aregs[7] & ~1;
> -        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
> -    } else {
> +        break;
> +
> +    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
> +        if (is_hw && oldsr & SR_M) {
> +            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> +            oldsr = sr;
> +            env->aregs[7] = sp;
> +            cpu_m68k_set_sr(env, sr &= ~SR_M);
> +            sp = env->aregs[7] & ~1;
> +            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
> +            break;
> +        }
> +        /* fall through */
> +
> +    default:
>           do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> +        break;
>       }
>   
>       env->aregs[7] = sp;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

