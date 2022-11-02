Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDF6168AA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGOA-0000mv-Pb; Wed, 02 Nov 2022 12:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGNt-0000ey-0G
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:14:33 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGNr-0005cf-2P
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:14:32 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXHBo-1oX6Ow2kWM-00Yg0D; Wed, 02 Nov 2022 17:14:28 +0100
Message-ID: <c50bc38e-42cb-d715-dbfb-738815de2edb@vivier.eu>
Date: Wed, 2 Nov 2022 17:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user/hppa: Detect glibc ABORT_INSTRUCTION and
 EXCP_BREAK handler
Content-Language: fr
To: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y1osHVsylkuZNUnY@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y1osHVsylkuZNUnY@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9OiY6z1ixorBHE9VJUyk4KcQ1/cBio3pVIdVvIwbHmqNO8mbXYH
 jEx6VaLk7QxwNkzVo8/L6vcpaYPrh0XBcoAP9hG7oCvW/PEAETX4xuIrWO8LK0VLSfJbVAp
 sJjDwrpKqY4tO4v5nvJdSnpiqiKH+KHgyn/IrXaFOqeifSYRU0BZ9r9KEgLjO7149AWrUnk
 CA7sIM+HYz4GBL+1b7Rhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3+3iCZsNB7Y=:RV0USiyIyRaxv6tKVXtTmg
 Ibtsqrhqwv0rZjV2L/g+cuh6c8pzBZYsj1By35747LE9RZtFCG0VCrhv5pPSHCfDg+jqkP2ZS
 LtQVa0Zkm2n9S5FD88l4lKTJK5Fn+ylwYzvXt6/g4OcsNdkvLuvsdaPdKr+f+XJVRd6Sgj2Hu
 PQsFOmpg9NbRo2wTQ6u5hVZYJLdM8XFsanI0M+8ExGbZP911ojO+8q6mMnXWs0Lzit67nEIK2
 8vjqAN1WX4V/Snuvf5Otr3WDdUQRnrzLG7PiNf7wjQt8BapgOj7+iSSZeNzPK5fQ93dbSW5eQ
 B+7tMNNYVsxc397GbDuNo7Ab888KO27wqSCu2kLFLQS/LrMMfgA+ozzjn8QEK6vAyCmvdtAIn
 Zks6dXg0DCpB4eyF8Lgz5Flaejxej2hanAzDMU+gc4hWpy4E9yxP8CLNw8uIFG01/+cG8cBle
 pBxGm5L2FRrTpnO9Bg83bIviXBH1d65tTYrJgCG+T+mCpmd2bkAj/HF+olPNC1IRiReb1Op3q
 gmnTOmXdG3RRHCWL93SaZ3O+pWtGcohar1UD6FEREsY6pe0iE9LFu4yECW1VUr4JRclimD+a9
 2CP72DYZzUZisIk/1HnzRSlbDoMwoazbhda6idQPdlFsUmC+3SYaLUPbh0XG5oUV4OgeuD6mt
 hQsq4ZC3HTulEZ+fBo6X10lyEt1CmK4bTNC00NoaOrIgVr46HVbhLwXf9vG+Oy/f5CuccM93i
 Nsm2vNUPwyOWF2TiYTL9l5j6N7TpZOvlqefNxh0E2YNRShUrmGlqCVc2ysV12tVl2lXLolV2K
 sfZBj5y
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 27/10/2022 à 08:58, Helge Deller a écrit :
> The glibc on the hppa platform uses the "iitlbp %r0,(%sr0, %r0)"
> assembler instruction as ABORT_INSTRUCTION.
> If this (in userspace context) illegal assembler statement is found,
> dump the registers and report the failure to userspace the same way as
> the Linux kernel on physical hardware.
> 
> For other illegal instructions report TARGET_ILL_ILLOPC instead of
> TARGET_ILL_ILLOPN as si_code.
> 
> Additionally add the missing EXCP_BREAK exception handler which occurs
> when the "break x,y" assembler instruction is executed and report
> EXCP_ASSIST traps.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 98c51e9b8b..a42c34e549 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -196,15 +196,20 @@ void cpu_loop(CPUHPPAState *env)
>               force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->iaoq_f);
>               break;
>           case EXCP_ILL:
> -            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
> -            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
> +            EXCP_DUMP(env, "qemu: EXCP_ILL exception %#x\n", trapnr);
> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->iaoq_f);
>               break;
>           case EXCP_PRIV_OPR:
> -            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
> -            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
> +            /* check for glibc ABORT_INSTRUCTION "iitlbp %r0,(%sr0, %r0)" */
> +            EXCP_DUMP(env, "qemu: EXCP_PRIV_OPR exception %#x\n", trapnr);
> +            if (env->cr[CR_IIR] == 0x04000000) {
> +		    force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->iaoq_f);
> +            } else {
> +		    force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
> +            }
>               break;
>           case EXCP_PRIV_REG:
> -            EXCP_DUMP(env, "qemu: got CPU exception 0x%x - aborting\n", trapnr);
> +            EXCP_DUMP(env, "qemu: EXCP_PRIV_REG exception %#x\n", trapnr);
>               force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
>               break;
>           case EXCP_OVERFLOW:
> @@ -216,6 +221,10 @@ void cpu_loop(CPUHPPAState *env)
>           case EXCP_ASSIST:
>               force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
>               break;
> +        case EXCP_BREAK:
> +            EXCP_DUMP(env, "qemu: EXCP_BREAK exception %#x\n", trapnr);
> +            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f & ~3);
> +            break;
>           case EXCP_DEBUG:
>               force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
>               break;
> 

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



