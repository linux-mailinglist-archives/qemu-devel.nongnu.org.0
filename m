Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C326338E4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:46:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPqr-0005dJ-Np; Tue, 22 Nov 2022 04:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPqi-0005bt-85
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:45:52 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPqg-0003l7-8i
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:45:52 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-14263779059so15844910fac.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ph6rt4OzHj94X5Q1ZGC0NnvRW0N89JV+w3oxV2MurSk=;
 b=BE+0JnjQ5zrzmEIvQWLZFvPhw0erqHWXn8MvVlkBJbaVPoOTBNsIc4ANfLH8ElA/Iu
 ogRS9hK9LWgYZ0pG+MZfE6+de77BrIjJcS7Lqf/woJaTw5ghFne3YZZODBiB9jLHu5u3
 eXnYhwIcjvTDLDnXhGo7yH32Na9xwYb78UB3BA33d9irIxy9paZGJUxukC6YAToNJljX
 XVIFHesreZbCtbJPkAgUki3zzvqQ4oU3t57FU9t3p/6hscT4kIiAA21kStctr4+nwBp6
 8Xns9sZ7q1nZNTqcziAcH5uV1WY99rVaGyM73DZsiUyaMQdiI2YlblvgNwEJdJMMrMns
 7Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ph6rt4OzHj94X5Q1ZGC0NnvRW0N89JV+w3oxV2MurSk=;
 b=UD/BA3Cv9R/MG20D5T8rwWo2D39vrMsVt8+fYxnwl+kdu9PO020vyvmXif7oeeboUG
 tt96+o79fu72CABs3WljQFoQPS1gylGBzaQus9gnia9Odhl/Y7oTj06z05vwgsBtiK3V
 zgYY9zFqoNd5IXFFGjBn4jhH3LAjXtE59r4es7r3wfBwvMY9ZbuB+RLQJ7Q7IYdX/THk
 H9LVSVSKIg+GZGBq0N9pIf2BcdkTgqtyLdbYSYmm03o/SIeZ7ur6WM8cxbforRLBpAwe
 qYENWDLAWgDfH+3fw3RCgf9/+90m55viMoK5Mhi2e0x0mmOtx+fFPVqgub2/hxQx18xo
 +MWw==
X-Gm-Message-State: ANoB5pmPQnOhcyByfQ7+CZC3vtLMTEUmOXaVP5q/3ZPpTij8Hx1+Y6E3
 +c5H/fSyDQQzgv5pdfTL4RaP52r4Jzc=
X-Google-Smtp-Source: AA0mqf5ST+u0Izj+bucnuSWXhqvU8LCQvy0WdWIr0M+BZd6RhaZLx6DnTChBvFhEMh/rSdZToZM09A==
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr2710949oab.35.1669110348974; 
 Tue, 22 Nov 2022 01:45:48 -0800 (PST)
Received: from [192.168.10.102] ([191.19.173.155])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a544617000000b00353ef11d6c9sm5117322oip.19.2022.11.22.01.45.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 01:45:48 -0800 (PST)
Message-ID: <759bcbaa-24b9-5919-8f2e-19c0290b8efb@gmail.com>
Date: Tue, 22 Nov 2022 06:45:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 v3 32/45] tcg: Introduce tcg_out_addi_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-33-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221111074101.2069454-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/11/22 04:40, Richard Henderson wrote:
> Implement the function for arm, i386, and s390x, which will use it.
> Add stubs for all other backends.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

For ppc and common code bits:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   tcg/tcg.c                        |  2 ++
>   tcg/aarch64/tcg-target.c.inc     |  7 +++++++
>   tcg/arm/tcg-target.c.inc         | 20 ++++++++++++++++++++
>   tcg/i386/tcg-target.c.inc        |  8 ++++++++
>   tcg/loongarch64/tcg-target.c.inc |  7 +++++++
>   tcg/mips/tcg-target.c.inc        |  7 +++++++
>   tcg/ppc/tcg-target.c.inc         |  7 +++++++
>   tcg/riscv/tcg-target.c.inc       |  7 +++++++
>   tcg/s390x/tcg-target.c.inc       |  7 +++++++
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         |  7 +++++++
>   11 files changed, 86 insertions(+)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 3eabb6ef4d..c276cc87ee 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -103,6 +103,8 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
>   static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
>   static void tcg_out_movi(TCGContext *s, TCGType type,
>                            TCGReg ret, tcg_target_long arg);
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
> +    __attribute__((unused));
>   static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                          const TCGArg args[TCG_MAX_OP_ARGS],
>                          const int const_args[TCG_MAX_OP_ARGS]);
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index ad1816e32d..2279a14c11 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1102,6 +1102,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>       tcg_out_insn(s, 3305, LDR, 0, rd);
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   /* Define something more legible for general use.  */
>   #define tcg_out_ldst_r  tcg_out_insn_3310
>   
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index e82749a602..2950a29d49 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -2548,6 +2548,26 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>       tcg_out_movi32(s, COND_AL, ret, arg);
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    int enc, opc = ARITH_ADD;
> +
> +    /* All of the easiest immediates to encode are positive. */
> +    if (imm < 0) {
> +        imm = -imm;
> +        opc = ARITH_SUB;
> +    }
> +    enc = encode_imm(imm);
> +    if (enc >= 0) {
> +        tcg_out_dat_imm(s, COND_AL, opc, rd, rs, enc);
> +    } else {
> +        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, imm);
> +        tcg_out_dat_reg(s, COND_AL, opc, rd, rs,
> +                        TCG_REG_TMP, SHIFT_IMM_LSL(0));
> +    }
> +}
> +
>   /* Type is always V128, with I64 elements.  */
>   static void tcg_out_dup2_vec(TCGContext *s, TCGReg rd, TCGReg rl, TCGReg rh)
>   {
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 58bd5873f5..6a021dda8b 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1069,6 +1069,14 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>       }
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
> +    tcg_out_modrm_offset(s, OPC_LEA, rd, rs, imm);
> +}
> +
>   static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
>   {
>       if (val == (int8_t)val) {
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index c9e99e8ec3..54b1dcd911 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -389,6 +389,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>       }
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
>       tcg_out_opc_andi(s, ret, arg, 0xff);
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 292e490b5c..22b5463f0f 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -550,6 +550,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>       }
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
>   {
>       /* ret and arg can't be register tmp0 */
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index f561a3492f..d9e4ba8883 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1125,6 +1125,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
>       }
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static bool mask_operand(uint32_t c, int *mb, int *me)
>   {
>       uint32_t lsb, test;
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index aa017d665a..6072945ccb 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -545,6 +545,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>       tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
>       tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index c3c0bcc3eb..8663a963a6 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -1020,6 +1020,13 @@ static inline bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
>       return false;
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    tcg_out_mem(s, RX_LA, RXY_LAY, rd, rs, TCG_REG_NONE, imm);
> +}
> +
>   /* load data from an absolute host address */
>   static void tcg_out_ld_abs(TCGContext *s, TCGType type,
>                              TCGReg dest, const void *abs)
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index eb913f33c8..f6a8a8e605 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -497,6 +497,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>       tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
>                               TCGReg a2, int op)
>   {
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index d36a7ebdd1..633345d74b 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -557,6 +557,13 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>       }
>   }
>   
> +static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
> +                             tcg_target_long imm)
> +{
> +    /* This function is only used for passing structs by reference. */
> +    g_assert_not_reached();
> +}
> +
>   static void tcg_out_call(TCGContext *s, const tcg_insn_unit *func,
>                            const TCGHelperInfo *info)
>   {

