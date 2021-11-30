Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A943C4633B5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 12:59:04 +0100 (CET)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms1mp-0004G3-A0
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 06:59:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ms1l8-0003Mc-QG
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 06:57:18 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ms1l6-0002Yv-4F
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 06:57:18 -0500
Received: from [192.168.100.1] ([82.142.5.50]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MYNW8-1n4lUR0PGk-00VPbA; Tue, 30 Nov 2021 12:57:13 +0100
Message-ID: <0c97b116-4f8a-de89-e656-1630470046ac@vivier.eu>
Date: Tue, 30 Nov 2021 12:57:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/3] target/m68k: Implement TRAPcc
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211130103752.72099-1-richard.henderson@linaro.org>
 <20211130103752.72099-3-richard.henderson@linaro.org>
Content-Language: fr
In-Reply-To: <20211130103752.72099-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:46Yq8LxH+FJjzHLx54Q4XJMvN0lB6uYxhoNGMlj3usm0veKxHWd
 6JmESnfUKO4XXN9m/jOWusmWGHOtfbq3uwz4AlmnKrDNCs3FLp2UHRHP/ZJCCtiRp3fVdBx
 m46OSI42gCpePT5PPJCSqejDPEty30z3rHQFuqQ7N/wK0nLR/MoG7vuzFoUnh7W2Yl3uwrE
 36fVjXjuQyvJ6kbdWHCzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1uT2tjk0QA=:nXwRXjcfc9Omx4fPO71TL4
 YahOU7bMTSqE+7SUqyjnpHZPj4EF3iwBuXBZ1A0ka8QU20Mhw5khlw1jvcRZRx3R9F7WnnSua
 V27P3nsrfY1m1pKGaTRQHXr8Dp1ZMq6ZSyGUoUttQmX2ZqEWhTSCpdSPyevfFuXgOC31Gz8rf
 baeZjZQk+b3s1bnG9oRyH5GyKTyqVBLrLsCfhiFno+jtrgkw3g/M34kVWe5YSbvsaWT6IEdCn
 HuEP5xOJO/M/PLOSyWA4AcWxBQV/MZqvtgduz8ShHhHnsYmko04N91IKMx84LvELI3yU2JbAx
 9CK2SW4ljsroD5hg+urEBs425w+TYLSGFI5BESIVss9IwJ4vg60QoIBBLDe+geLix/l1TgKWe
 WBDzsoQYmPggavc3S0UNMvcYs0xHtEeDw2zaLMmaVpdVlg4ywmuyPnyzRHFXNB21d1QDJNNjR
 H7x6zGiBGPH4z/Z5SB51ooNLXGLKbnGYXUB8NKhs88bRrI1+7lkUCQlpiF42ysWNP72GD+1xi
 R0yuBSKejkgrv+gdnkO6W9Oyb3DgSibdkcSSSJLDhlpWHdm7fcGGU2ACuEE25iUNG/1lMt0nN
 RB7BCdlB/c3xOyobUfGSoDqN+271DGmKjmVwU9C1YRe0CIhMb3jguW/8wGeO+u5Sf/eIVae3z
 YiLNhvkWI/KKosjJFkoM/Ggr/OBV2amPva3zE4+eVzjqVoowNGKboUtz4l4dy0dfHBfc=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2021 à 11:37, Richard Henderson a écrit :
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/754
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.h       |  2 ++
>   target/m68k/cpu.c       |  1 +
>   target/m68k/translate.c | 21 +++++++++++++++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index a3423729ef..03f600f7e7 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -527,6 +527,8 @@ enum m68k_features {
>       M68K_FEATURE_MOVEC,
>       /* Unaligned data accesses (680[2346]0) */
>       M68K_FEATURE_UNALIGNED_DATA,
> +    /* TRAPCC insn. (680[2346]0, and CPU32) */
> +    M68K_FEATURE_TRAPCC,
>   };
>   
>   static inline int m68k_feature(CPUM68KState *env, int feature)
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
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 858ba761fc..cf29f35d91 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -4879,6 +4879,26 @@ DISAS_INSN(trapv)
>       do_trapcc(s, 9); /* VS */
>   }
>   
> +DISAS_INSN(trapcc)
> +{
> +    /* Consume and discard the immediate operand. */
> +    switch (extract32(insn, 0, 3)) {
> +    case 2: /* trapcc.w */
> +        (void)read_im16(env, s);
> +        break;
> +    case 3: /* trapcc.l */
> +        (void)read_im32(env, s);
> +        break;

Do we need to actually read the memory to trigger a fault if needed or can we only increase the PC?

Normally these values are for the trap handler.

> +    case 4: /* trapcc (no operand) */
> +        break;
> +    default:
> +        /* Illegal insn */
> +        disas_undef(env, s, insn);
> +        return;
> +    }
> +    do_trapcc(s, extract32(insn, 8, 4));
> +}

Do we need to change something in m68k_interrupt_all()?

     if (!is_hw) {
         switch (cs->exception_index) {
         case EXCP_RTE:
             /* Return from an exception.  */
             m68k_rte(env);
             return;
         case EXCP_TRAP0 ...  EXCP_TRAP15:
             /* Move the PC after the trap instruction.  */
             retaddr += 2;
             break;
         }
     }

Thanks,
Laurent

> +
>   static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
>   {
>       switch (reg) {
> @@ -6051,6 +6071,7 @@ void register_m68k_insns (CPUM68KState *env)
>       INSN(scc,       50c0, f0f8, CF_ISA_A); /* Scc.B Dx   */
>       INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
>       INSN(dbcc,      50c8, f0f8, M68000);
> +    INSN(trapcc,    50f8, f0f8, TRAPCC);
>       INSN(tpf,       51f8, fff8, CF_ISA_A);
>   
>       /* Branch instructions.  */
> 



