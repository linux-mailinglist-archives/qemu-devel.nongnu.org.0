Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8DEFA46
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 10:58:26 +0100 (CET)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRvbV-0003pg-Gb
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 04:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iRvXx-0007yJ-QT
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 04:54:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iRvXv-0004L8-7I
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 04:54:44 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iRvXu-0004Jz-UI
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 04:54:43 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKbPg-1iDYzD2Krs-00KwDi; Tue, 05 Nov 2019 10:54:39 +0100
Subject: Re: [PATCH v2 11/12] linux-user/sparc: Fix cpu_clone_regs_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191025113921.9412-1-richard.henderson@linaro.org>
 <20191025113921.9412-12-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <ee7b5006-a8bd-f626-bb2a-5f36104b45d3@vivier.eu>
Date: Tue, 5 Nov 2019 10:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025113921.9412-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZxG2K+7iO5AdHjeFG3/7830dYJ9TLscigU8mwTTosLLw8K3Iwf3
 j9TplnsA0umUXC2gTMyMd0yxrD9vm/3gKMaZHe0qROf6U1LyNrhOHy2/INdB5vpRFl2GPan
 y+t87vrKavszu2+/M+TuKnMIvs/06PAhnMXwLZzi0rHQWosMR8lgyWkKfYZnxKWjGlv96d8
 K7v0cEh6GNy+EufBYJXyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MB+BsBCoG2I=:rmbLckVElNCE2uXi+dRzYE
 lkDAsHJMWcmrz3CCw3m78Wm5Ji9vz0tqjtIJW6ToHqJYU5jFbhvMneZRJqFyhuXreQt3DOklq
 vFQlcJOfeJCpPB+X6kEJhpD88C0xCVdqEWdMW2POU7XHxReRTpn8wd0CuKpSrGknP/iNa19VY
 irSoIKKqLJhIxFhkzHLYOiZkmhvl4vp0etgjwDJjdfOpaZEIXoQWipFzz/KU8iy835vD3Mw6z
 sNN8IxH9c+5GZYvvZgRFqx8gQT6lnegq7U0ilaNoJI2YJVD8TH1E/y27YOLSoaC8XS0mX6Meb
 b7lVLLU1n27RpictRcGgdI3iDFIY1037Jjv/ui1UQNFW7isD63RxwDhmG3+rrgW61avVgWrGs
 46vNml23OmVfINOJ1uMaU/QAPv04fgyV7EZ7X9AbOqf6nfW4Sr8jbqABNnrrNtPcXnIz2BhBs
 UqUg09SfwOhHv1UveFgsq2TSPJWK2c4o1PTE9qI/Jz2VKRAIVd/uu/Df6WrxkJ2yb++N5lie/
 N5KaHjMC4Ydj+8S0I7MbNYqK0P2gtiSi1Dp1pz6Uk/T7i2kgBQ94VGFjHE89tGucchOV+pABN
 bbkTE/g3MoLtMlGW/7o2oMpOco8wbwJd5dFbTUPrErPfScTOqlEwq0/irA8akhdpLXlgXOwkF
 LBXKLxO+qb14Opzb52I4LlETXOqkZ0egLFRbDxROvGpG1SxJLk4Uipqp70P455+vbNF2/zbs1
 XHrwM7Ihb3IV1W+zW1C6JTlPnIqw2uD1q8sy/123p5KBHs/UGDr2kuKeJvWvUADFEmpT7v9A3
 TB4mMrtJ4v50U8Ooej2RS4R/4YwNX+9hqFeUx+kjADPUeKns3CmUDATat+AHL4THnlsZ6uy/v
 ZWZnsNPpordsfnxbqvhXI799Nnl3AkutU+Vb4wmkY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/10/2019 à 13:39, Richard Henderson a écrit :
> We failed to set the secondary return value in %o1
> we failed to advance the PC past the syscall,
> we failed to adjust regwptr into the new structure,
> we stored the stack pointer into the wrong register.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Take CLONE_VM into account when performing syscall return.
> ---
>  linux-user/sparc/target_cpu.h | 47 ++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
> index 8ff706adce..14b2158969 100644
> --- a/linux-user/sparc/target_cpu.h
> +++ b/linux-user/sparc/target_cpu.h
> @@ -23,22 +23,51 @@
>  static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
>                                          unsigned flags)
>  {
> -    if (newsp) {
> -        env->regwptr[22] = newsp;
> -    }
> -    /* syscall return for clone child: 0, and clear CF since
> -     * this counts as a success return value.
> +    /*
> +     * After cpu_copy, env->regwptr is pointing into the old env.
> +     * Update the new cpu to use its own register window.
>       */
> -    env->regwptr[0] = 0;
> -#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
> -    env->xcc &= ~PSR_CARRY;
> +    env->regwptr = env->regbase + (env->cwp * 16);
> +
> +    if (newsp) {
> +        /* When changing stacks, do it with clean register windows.  */
> +#ifdef TARGET_SPARC64
> +        env->cansave = env->nwindows - 2;
> +        env->cleanwin = env->nwindows - 2;
> +        env->canrestore = 0;
>  #else
> -    env->psr &= ~PSR_CARRY;
> +        env->wim = 1 << env->cwp;
>  #endif
> +        /* ??? The kernel appears to copy one stack frame to the new stack. */
> +        /* ??? The kernel force aligns the new stack. */
> +        env->regwptr[WREG_SP] = newsp;
> +    }
> +
> +    if (flags & CLONE_VM) {
> +        /*
> +         * Syscall return for clone child: %o0 = 0 and clear CF since this
> +         * counts as a success return value.  Advance the PC past the syscall.
> +         * For fork child, all of this happens in cpu_loop, and we must not
> +         * do the pc advance twice.
> +         */
> +        env->regwptr[WREG_O0] = 0;
> +#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
> +        env->xcc &= ~PSR_CARRY;
> +#else
> +        env->psr &= ~PSR_CARRY;
> +#endif
> +        env->pc = env->npc;
> +        env->npc = env->npc + 4;
> +    }
> +
> +    /* Set the second return value for the child: %o1 = 1.  */
> +    env->regwptr[WREG_O1] = 1;
>  }
>  
>  static inline void cpu_clone_regs_parent(CPUSPARCState *env, unsigned flags)
>  {
> +    /* Set the second return value for the parent: %o1 = 0.  */
> +    env->regwptr[WREG_O1] = 0;
>  }
>  
>  static inline void cpu_set_tls(CPUSPARCState *env, target_ulong newtls)
> 

Applied to my linux-user branch.

Thanks,
Laurent

