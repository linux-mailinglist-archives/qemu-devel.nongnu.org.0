Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD1044449F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:24:23 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI7i-00018x-A9
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHv6-00080S-Vj
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:11:21 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHv2-0007Et-PE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:11:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so4860768wmj.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OJmiSn6VVv/fsv3QyEXp3lPPdqD8+4c/UVZof3eY30k=;
 b=ewCSi2cI4JQW+zbb8WJX4uPuQCok70PxGNxj3pbiyzXJGnlG59z9aDn4A8U8NSevhd
 UKNBmrWrgo5Q/TjgR/U43NbYsNZsZpHy4RWYzEFBMQOvXrJ6WiXQnRdXLeZGNdVzKKdp
 0BKS32lEgfh8cDuS3gWYG+iB434KPcLGF+ds55NVqCVlx1jTzX8UPcwUaykYuN7vL3Za
 t+HPezk92lg24vyKkrONwKV4N3o9g5a/AQ4RJfZDQiQ5glvKIfogG5P/IFpwR08XsFNA
 YHR0mOFgzzrOjqpXhgJZefwnairs3CO98BY1YmfIXicb/HoEMufgqsH8wveBPI0T5e0z
 8wXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OJmiSn6VVv/fsv3QyEXp3lPPdqD8+4c/UVZof3eY30k=;
 b=2Y+2gJVW3ubhl4QMWssgRTfgWvl0PrubzryLaN+A5wazkYogCCccgXIbAsSTVWrdL+
 ETYPtlrPS5UcNB88RGkiNy0Z4vDV4Lb7za8Cq45tp41u2znk4L2Z56MxhKaKTJiIn3Mo
 Oq4vBNkVd1O70nJPnIrR23yRNFd2e9Fz+P2Yu171rmCFzWg2fNjR3zu3Il+v0UmDSwQ9
 XwEGkx8jvxqu4X5ftzcReYK2eKwWCA3fQwOzc0JKJnIIPvShHdD4XJy0+gXSRFXRssgu
 ufHncry1tqv+b1nnR3hFS4ltfjC7jI6rkrI3AYm5HVFF00nEYSoX3Y5Gh3BFuqERxl0b
 lWnw==
X-Gm-Message-State: AOAM530JU1rn1dMgMTCN2qqvss3Mn7N+bvvmYYy94LAYwePPMJJ3r8ly
 FZ2IVrprUqzUZkLxcMZt2YI=
X-Google-Smtp-Source: ABdhPJzuMm0ze7/Zspfrrklz/9eDvg9GgOvNlroyaDmWCqdQCI57QVQmBIu6J8Nw34yM/ujvrshDbg==
X-Received: by 2002:a1c:3b04:: with SMTP id i4mr15969384wma.126.1635952275404; 
 Wed, 03 Nov 2021 08:11:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h22sm2557466wmq.14.2021.11.03.08.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:11:14 -0700 (PDT)
Message-ID: <6fb43925-c350-ad38-ed4f-37b236e755fc@amsat.org>
Date: Wed, 3 Nov 2021 16:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 15/23] target/mips: Extract break code into
 env->error_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103140847.454070-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 15:08, Richard Henderson wrote:
> Simplify cpu_loop by doing all of the decode in translate.
> 
> This fixes a bug in that cpu_loop was not handling the
> different layout of the R6 version of break16.  This fixes
> a bug in that cpu_loop extracted the wrong bits for the
> mips16e break16 instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.h               |  1 +
>  linux-user/mips/cpu_loop.c                | 73 +++--------------------
>  target/mips/tcg/translate.c               | 12 +++-
>  target/mips/tcg/micromips_translate.c.inc |  6 +-
>  target/mips/tcg/mips16e_translate.c.inc   |  2 +-
>  5 files changed, 25 insertions(+), 69 deletions(-)

> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 034b31f853..8efb6d2a24 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -65,6 +65,7 @@ void cpu_loop(CPUMIPSState *env)
>  {
>      CPUState *cs = env_cpu(env);
>      int trapnr, si_code;
> +    unsigned int code;
>      abi_long ret;
>  # ifdef TARGET_ABI_MIPSO32
>      unsigned int syscall_num;
> @@ -185,71 +186,15 @@ done_syscall:
>           * handling code in arch/mips/kernel/traps.c.
>           */
>          case EXCP_BREAK:
> -            {
> -                abi_ulong trap_instr;
> -                unsigned int code;
> -
> -                /*
> -                 * FIXME: It would be better to decode the trap number
> -                 * during translate, and store it in error_code while
> -                 * raising the exception.  We should not be re-reading
> -                 * the opcode here.
> -                 */
> -
> -                if (env->hflags & MIPS_HFLAG_M16) {
> -                    if (env->insn_flags & ASE_MICROMIPS) {
> -                        /* microMIPS mode */
> -                        ret = get_user_u16(trap_instr, env->active_tc.PC);
> -                        if (ret != 0) {
> -                            goto error;
> -                        }
> -
> -                        if ((trap_instr >> 10) == 0x11) {
> -                            /* 16-bit instruction */
> -                            code = trap_instr & 0xf;
> -                        } else {
> -                            /* 32-bit instruction */
> -                            abi_ulong instr_lo;
> -
> -                            ret = get_user_u16(instr_lo,
> -                                               env->active_tc.PC + 2);
> -                            if (ret != 0) {
> -                                goto error;
> -                            }
> -                            trap_instr = (trap_instr << 16) | instr_lo;
> -                            code = ((trap_instr >> 6) & ((1 << 20) - 1));
> -                            /* Unfortunately, microMIPS also suffers from
> -                               the old assembler bug...  */
> -                            if (code >= (1 << 10)) {
> -                                code >>= 10;
> -                            }
> -                        }
> -                    } else {
> -                        /* MIPS16e mode */
> -                        ret = get_user_u16(trap_instr, env->active_tc.PC);
> -                        if (ret != 0) {
> -                            goto error;
> -                        }
> -                        code = (trap_instr >> 6) & 0x3f;
> -                    }
> -                } else {
> -                    ret = get_user_u32(trap_instr, env->active_tc.PC);
> -                    if (ret != 0) {
> -                        goto error;
> -                    }
> -
> -                    /* As described in the original Linux kernel code, the
> -                     * below checks on 'code' are to work around an old
> -                     * assembly bug.
> -                     */
> -                    code = ((trap_instr >> 6) & ((1 << 20) - 1));
> -                    if (code >= (1 << 10)) {
> -                        code >>= 10;
> -                    }
> -                }
> -
> -                do_tr_or_bp(env, code, false);
> +            /*
> +             * As described in the original Linux kernel code, the below
> +             * checks on 'code' are to work around an old assembly bug.
> +             */
> +            code = env->error_code;
> +            if (code >= (1 << 10)) {
> +                code >>= 10;

Shouldn't we also move this to the translation (not in R6_BREAK16)?

>              }
> +            do_tr_or_bp(env, code, false);
>              break;
>          case EXCP_TRAP:
>              {
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 47db35d7dd..a42f507aed 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -1367,6 +1367,16 @@ void generate_exception_end(DisasContext *ctx, int excp)
>      generate_exception_err(ctx, excp, 0);
>  }
>  
> +void generate_exception_break(DisasContext *ctx, int code)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    /* Pass the break code along to cpu_loop. */
> +    tcg_gen_st_i32(tcg_constant_i32(code), cpu_env,
> +                   offsetof(CPUMIPSState, error_code));
> +#endif
> +    generate_exception_end(ctx, EXCP_BREAK);
> +}
> +
>  void gen_reserved_instruction(DisasContext *ctx)
>  {
>      generate_exception_end(ctx, EXCP_RI);
> @@ -14160,7 +14170,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
>          generate_exception_end(ctx, EXCP_SYSCALL);
>          break;
>      case OPC_BREAK:
> -        generate_exception_end(ctx, EXCP_BREAK);
> +        generate_exception_break(ctx, extract32(ctx->opcode, 6, 20));
>          break;
>      case OPC_SYNC:
>          check_insn(ctx, ISA_MIPS2);
> diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
> index 0da4c802a3..f91f7a96cd 100644
> --- a/target/mips/tcg/micromips_translate.c.inc
> +++ b/target/mips/tcg/micromips_translate.c.inc
> @@ -822,7 +822,7 @@ static void gen_pool16c_insn(DisasContext *ctx)
>          gen_HILO(ctx, OPC_MFLO, 0, uMIPS_RS5(ctx->opcode));
>          break;
>      case BREAK16:
> -        generate_exception_end(ctx, EXCP_BREAK);
> +        generate_exception_break(ctx, extract32(ctx->opcode, 0, 4));
>          break;
>      case SDBBP16:
>          if (is_uhi(extract32(ctx->opcode, 0, 4))) {
> @@ -937,7 +937,7 @@ static void gen_pool16c_r6_insn(DisasContext *ctx)
>              break;
>          case R6_BREAK16:
>              /* BREAK16 */
> -            generate_exception(ctx, EXCP_BREAK);
> +            generate_exception_break(ctx, extract32(ctx->opcode, 6, 4));
>              break;
>          case R6_SDBBP16:
>              /* SDBBP16 */
> @@ -1812,7 +1812,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
>              gen_pool32axf(env, ctx, rt, rs);
>              break;
>          case BREAK32:
> -            generate_exception_end(ctx, EXCP_BREAK);
> +            generate_exception_break(ctx, extract32(ctx->opcode, 6, 20));
>              break;
>          case SIGRIE:
>              check_insn(ctx, ISA_MIPS_R6);
> diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
> index 84d816603a..f57e0a5f2a 100644
> --- a/target/mips/tcg/mips16e_translate.c.inc
> +++ b/target/mips/tcg/mips16e_translate.c.inc
> @@ -969,7 +969,7 @@ static int decode_ase_mips16e(CPUMIPSState *env, DisasContext *ctx)
>              gen_slt(ctx, OPC_SLTU, 24, rx, ry);
>              break;
>          case RR_BREAK:
> -            generate_exception_end(ctx, EXCP_BREAK);
> +            generate_exception_break(ctx, extract32(ctx->opcode, 5, 6));
>              break;
>          case RR_SLLV:
>              gen_shift(ctx, OPC_SLLV, ry, rx, ry);
> 


