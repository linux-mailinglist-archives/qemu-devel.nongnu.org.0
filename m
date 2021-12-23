Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACCA47E90F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:25:06 +0100 (CET)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0VaD-0004Jp-MZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:25:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0VXZ-0001vR-2Q
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:22:23 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:54241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n0VXX-0008Ql-7g
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:22:20 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mate1-1mUBvP3V4l-00cNEJ; Thu, 23 Dec 2021 22:22:16 +0100
Message-ID: <7bdd9dc1-4116-dab8-a300-9ea8241675b3@vivier.eu>
Date: Thu, 23 Dec 2021 22:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 6/6] target/sh4: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211220214135.189157-1-richard.henderson@linaro.org>
 <20211220214135.189157-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211220214135.189157-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pqJ6lJbhFl00OUPD689lAVdUbgl6FYyv1C/OlY3zCsoCZq9QYN+
 Tn/F2sUk04pa90y+S8NLJjBv1J8Ek6tRudJbF4mEu/aHvQTKppzOfoAaSTx7/j5ZrMlEjPP
 vyVW8UhGrFVoMDX3nSP3O9f+oYVe0RhDh1j5BBTJ0sIMQbEDnzu6LIl7PUxoKrfN4VeC7ce
 qDEUsDRDdnUUkwgCUkGuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VTYjGPpwlLM=:0xJyZAvlL4yFVfuW4aKsKQ
 Uz1UrvB50TJVPImh4eAJeZByNwuHVKrPVzsNbup+42lLNfiBR34ljJgSjWxn9vu0TEP4Uz3Tz
 H7m2llP/DqdSH5ALfUXAN9MaooqDEzLhCL6nogCyv+AWGKARFykykTYMFzjYvsXKz8UBi/Itw
 6gK+4FeLeN55+mG2ASwEvRPNJuiixlMy1UeDv8OQaIAUbCOFn4z29pOVk7YLZNlcp9Zts4+YO
 3E1KBUYTgLXp7m/EEt6g1IVFiJ10wRyCC4VMkjXUS2HFh9o9Cgm7jfkk3e1cmDzc8WxHdpvsC
 wmYlZVBe+y8WuVVEA8W7HSphh9k/o4AZ5ayo68I5XZbLt8eDHvRJPVga7+texedxVksFsKOd4
 m0WsktpRo+rkI0zuBzyH6n82L177bgfH8necUVdf8T8mM8E8LR3NogQ52s2dvAAo35Rf0vvan
 1fzLg4UL7naKb3MvW4Wq7L88q7P/1EcnMZMdgOP2XdiZ4/fOfJG1oSrPqD/RljMuzaRdweBka
 TTy2gFNNRkkFqV+FjS8+j7Z0XeVLicy3KogGwWYzHzO5nQgnkuyN4DQ73hN36KUb6GPa1bc66
 RIaaLSXZISQ1jHQbihqHyeigXarzTqi+46q2UY5ySo1jRGKiwKUqVrzdmvMq3xKFdmZ87kmzj
 nnnq0KeCWC6qUQoCOhT7Ml7OYhZ1hf9dIrpIhwZ9c/d9OKvkBr1nlcr2AWcsd9VApwE4=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Le 20/12/2021 à 22:41, Richard Henderson a écrit :
> Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
> flag to set MO_UNALN for the instructions that the kernel
> handles in the unaligned trap.
> 
> The Linux kernel does not handle all memory operations: no
> floating-point and no MAC.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sh4/target_prctl.h |  2 +-
>   target/sh4/cpu.h              |  4 +++
>   target/sh4/translate.c        | 50 ++++++++++++++++++++++++-----------
>   3 files changed, 39 insertions(+), 17 deletions(-)
> 
> diff --git a/linux-user/sh4/target_prctl.h b/linux-user/sh4/target_prctl.h
> index eb53b31ad5..5629ddbf39 100644
> --- a/linux-user/sh4/target_prctl.h
> +++ b/linux-user/sh4/target_prctl.h
> @@ -1 +1 @@
> -/* No special prctl support required. */
> +#include "../generic/target_prctl_unalign.h"
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 4cfb109f56..fb9dd9db2f 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -83,6 +83,7 @@
>   #define DELAY_SLOT_RTE         (1 << 2)
>   
>   #define TB_FLAG_PENDING_MOVCA  (1 << 3)
> +#define TB_FLAG_UNALIGN        (1 << 4)
>   
>   #define GUSA_SHIFT             4
>   #ifdef CONFIG_USER_ONLY
> @@ -373,6 +374,9 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
>               | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
>               | (env->sr & (1u << SR_FD))                        /* Bit 15 */
>               | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
> +#ifdef CONFIG_USER_ONLY
> +    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
> +#endif
>   }
>   
>   #endif /* SH4_CPU_H */
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index ce5d674a52..c959ce1508 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -50,8 +50,10 @@ typedef struct DisasContext {
>   
>   #if defined(CONFIG_USER_ONLY)
>   #define IS_USER(ctx) 1
> +#define UNALIGN(C)   (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : 0)

Why isn't it like the other targets: "ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN)"?

>   #else
>   #define IS_USER(ctx) (!(ctx->tbflags & (1u << SR_MD)))
> +#define UNALIGN(C)   0
>   #endif
>   
>   /* Target-specific values for ctx->base.is_jmp.  */

Thanks,
Laurent

