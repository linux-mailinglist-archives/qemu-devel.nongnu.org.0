Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654ED484133
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 12:50:32 +0100 (CET)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iKl-0007zc-HB
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 06:50:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iIB-0005x6-EX
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:47:52 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:39573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n4iI5-0008S3-AP
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 06:47:47 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McY0L-1mX2Ul336b-00cxOK; Tue, 04 Jan 2022 12:47:42 +0100
Message-ID: <591a5169-06af-3786-69aa-d6efe8a5d2ee@vivier.eu>
Date: Tue, 4 Jan 2022 12:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/6] target/sh4: Implement prctl_unalign_sigbus
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211227150127.2659293-1-richard.henderson@linaro.org>
 <20211227150127.2659293-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211227150127.2659293-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eNmLHoRmXRSwtwCE/pBB9myDk47cSxpl0GVEltfEvGmIk9mzypz
 6T8u3yes/b3+1kGq5hSpDm/x1bGWaTBMH9YaFvnuUpSLRtkbs2VPtuwGq5PG/2PfRKQ8Sfe
 evNdJQ16IWWhfG4HNTSAYFdXthczdk1/B56OpRq/3fEjKKa1AHFF3qmJKavPol2NFU6WFgw
 qLzxqViwrHIubMkUi8GsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CIVWada++UE=:PGKHPjOOhMFhBpISOZblXH
 ZwEWFZC/XB+s34uIPcassjm2gaveJLu0lQ+qF4XFPOzSpw2y0tx2aBRubjVGB9rEdswragWy4
 ud4RPPmQlj2m9h4zrVbjv2HDokpusDyehEUO5rvraYLexnwfELvaSf8EfTMhYs0WDWXhK0IVC
 DQXTVXExw5Gswc4zFUabG9KF97Xy67dgvY40yZghFjUYLV0uTzSfe4kMhqRlVi7wyfvp0AzGf
 tiiSR3PeZlNTsF225Ax+cp6LpMpzNYqZEpw2jXDhPP+15jOh2MBjs5V0B+ndZTwuxxrWjsOsi
 G7oSh5rVx03W6rRgjndsQrizV9DYECeyqBIG3SjrgMDhRmpN/hKOrUXc2kUUTBFiO1P+toGNz
 CkhW5VAQ9dpB+Y585vbRO2n/tkXSqxeorvv02MedT+cTklarZGIfSMGDmg3+PoK92O6xkINXv
 3gOErQa+nu733r1+Fnr/Czncy5/G/DenywLO7UZk19gNIHo4ZQdwoFM2JfWDGF3wLJHRLum//
 GAKfgkmn9nIXlPRegpxsUoQFe20nogsFLPLcm0VksKLZWdyVTiYSx1fyxglm4z3m+lkFzHivn
 PADBEo8CIvMCbfsNe32ZrzQ64EBpKsQ1qiSw6rXeuSKaATtGADpuhrlYxFJ12dVNwk0DxPtBd
 KCz4DcFOfrm/WbkCqBKE6PdlAiJL4hSEZOcB4dQMv6Dzd5+w2CczeeXyGqRT/fFtWG84=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Le 27/12/2021 à 16:01, Richard Henderson a écrit :
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
> index ce5d674a52..50493c61ea 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -50,8 +50,10 @@ typedef struct DisasContext {
>   
>   #if defined(CONFIG_USER_ONLY)
>   #define IS_USER(ctx) 1
> +#define UNALIGN(C)   (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN)
>   #else
>   #define IS_USER(ctx) (!(ctx->tbflags & (1u << SR_MD)))
> +#define UNALIGN(C)   0
>   #endif
>   
>   /* Target-specific values for ctx->base.is_jmp.  */
> @@ -495,7 +497,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
> -            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
> +            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
> +                                MO_TEUL | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -503,7 +506,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
> -            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
> +            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
> +                                MO_TESL | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -558,19 +562,23 @@ static void _decode_opc(DisasContext * ctx)
>           tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_UB);
>   	return;
>       case 0x2001:		/* mov.w Rm,@Rn */
> -        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUW);
> +        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
> +                            MO_TEUW | UNALIGN(ctx));
>   	return;
>       case 0x2002:		/* mov.l Rm,@Rn */
> -        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
> +        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
> +                            MO_TEUL | UNALIGN(ctx));
>   	return;
>       case 0x6000:		/* mov.b @Rm,Rn */
>           tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_SB);
>   	return;
>       case 0x6001:		/* mov.w @Rm,Rn */
> -        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
> +        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
> +                            MO_TESW | UNALIGN(ctx));
>   	return;
>       case 0x6002:		/* mov.l @Rm,Rn */
> -        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
> +        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
> +                            MO_TESL | UNALIGN(ctx));
>   	return;
>       case 0x2004:		/* mov.b Rm,@-Rn */
>   	{
> @@ -586,7 +594,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_subi_i32(addr, REG(B11_8), 2);
> -            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
> +            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
> +                                MO_TEUW | UNALIGN(ctx));
>   	    tcg_gen_mov_i32(REG(B11_8), addr);
>   	    tcg_temp_free(addr);
>   	}
> @@ -595,7 +604,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
> -            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
> +            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
> +                                MO_TEUL | UNALIGN(ctx));
>   	    tcg_gen_mov_i32(REG(B11_8), addr);
>           tcg_temp_free(addr);
>   	}
> @@ -606,12 +616,14 @@ static void _decode_opc(DisasContext * ctx)
>   		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 1);
>   	return;
>       case 0x6005:		/* mov.w @Rm+,Rn */
> -        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
> +        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
> +                            MO_TESW | UNALIGN(ctx));
>   	if ( B11_8 != B7_4 )
>   		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
>   	return;
>       case 0x6006:		/* mov.l @Rm+,Rn */
> -        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
> +        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
> +                            MO_TESL | UNALIGN(ctx));
>   	if ( B11_8 != B7_4 )
>   		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
>   	return;
> @@ -627,7 +639,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
> -            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
> +            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
> +                                MO_TEUW | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -635,7 +648,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
> -            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
> +            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
> +                                MO_TEUL | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -651,7 +665,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
> -            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
> +            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
> +                                MO_TESW | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -659,7 +674,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
> -            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
> +            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
> +                                MO_TESL | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -1253,7 +1269,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
> -            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
> +            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx,
> +                                MO_TEUW | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;
> @@ -1269,7 +1286,8 @@ static void _decode_opc(DisasContext * ctx)
>   	{
>   	    TCGv addr = tcg_temp_new();
>   	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
> -            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
> +            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx,
> +                                MO_TESW | UNALIGN(ctx));
>   	    tcg_temp_free(addr);
>   	}
>   	return;

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


