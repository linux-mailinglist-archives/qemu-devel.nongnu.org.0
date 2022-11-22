Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05E6338DC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPn4-0002mG-DM; Tue, 22 Nov 2022 04:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPn2-0002hh-D2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:42:04 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxPn0-00019h-AI
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:42:04 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-14263779059so15836354fac.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7yg1lQbQQIcbY6i15LxVzE7QqLL7Cp70DdBf92p1+aU=;
 b=WQXnjmFbFehjmayhEvvPWjjXoGzRa9mYLtJ1dqte7NmKzisnbwGGD0+AWobABCxzQy
 MDTYt23at3h3k+1IBLsZYc6YCmkn04hZw+ZpL4rBHsIUwUq4MCUua0dQu+hSGVs1Lued
 e2icCq7oKfQhZFhEyubd9xRu9TPrunRSM0ojnwsiGib+uMClDDYmdSgChq1P9UHdR9HB
 wEjvZXUMf3+8NtU6SzkjB3VHxQVUEajVtjdWmHdu6iXOZ7juGdNGxsSc8OqjUm2cYiSr
 NsR2LXuGJQ23lNjd+Z4HNyzY1DkwpSP1sW/WkdHxI8tS0k6VswEQGewE7BcUYocHrxUA
 xFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yg1lQbQQIcbY6i15LxVzE7QqLL7Cp70DdBf92p1+aU=;
 b=x0sijcbb9fa19LfLqR4+7KQumlxOvM52W+7GVNF+qUEcqAVW9UNd0q7XkA0HxW32ni
 qfbKzOcMyo78EEzFK0etyvPRIKuwvN2jrF7Z05mn61+Its+PNOhEY/Yka3yMAsertaDV
 KnnRBMXG2WAsFrycHu6CmTDBtE5V01082dNA8h5qccEE3cvnXt9EFc/EX4Z9FSQdpPUx
 zJHh7k/WttlSF910Tcr83st0I4yj+MT4ZkToREhmgat3n8uQ+6656oM5eMhytBgN7293
 7OtxoYj+iIx9tuqhpOqrwp19Ifj4hydGtZcooacg1iwo9Nuhi/CDDvqwwdgTnZNLR+IU
 lRQg==
X-Gm-Message-State: ANoB5pnyyUBeFofjEaE17arNIafRF4ZynCvp/ekQZlbohMaTTnobZjjn
 76g6CVn6aG+vvDsFIYQrNBE=
X-Google-Smtp-Source: AA0mqf7EsXoutCsESiWmpJ5IYXeERwliucGGC7uxe/Snx3qLFsxkdnhPwqL1R1OZsp+0e50tTovAbA==
X-Received: by 2002:a05:6870:3c0b:b0:136:fd83:6dc4 with SMTP id
 gk11-20020a0568703c0b00b00136fd836dc4mr15259200oab.138.1669110120765; 
 Tue, 22 Nov 2022 01:42:00 -0800 (PST)
Received: from [192.168.10.102] ([191.19.173.155])
 by smtp.gmail.com with ESMTPSA id
 c126-20020aca3584000000b00354948e04e4sm5230872oia.2.2022.11.22.01.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 01:42:00 -0800 (PST)
Message-ID: <86410eda-e0aa-89b8-6089-51bb75c4841f@gmail.com>
Date: Tue, 22 Nov 2022 06:41:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 v3 34/45] tcg: Introduce tcg_target_call_oarg_reg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-35-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221111074101.2069454-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
> Replace the flat array tcg_target_call_oarg_regs[] with
> a function call including the TCGCallReturnKind.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

For ppc and common code bits:

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   tcg/tcg.c                        |  9 ++++++---
>   tcg/aarch64/tcg-target.c.inc     | 10 +++++++---
>   tcg/arm/tcg-target.c.inc         | 10 +++++++---
>   tcg/i386/tcg-target.c.inc        | 16 ++++++++++------
>   tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
>   tcg/mips/tcg-target.c.inc        | 10 ++++++----
>   tcg/ppc/tcg-target.c.inc         | 10 ++++++----
>   tcg/riscv/tcg-target.c.inc       | 10 ++++++----
>   tcg/s390x/tcg-target.c.inc       |  9 ++++++---
>   tcg/sparc64/tcg-target.c.inc     | 12 ++++++------
>   tcg/tci/tcg-target.c.inc         | 12 ++++++------
>   11 files changed, 72 insertions(+), 46 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index b61551913b..97c97158cd 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -148,6 +148,7 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
>                           TCGReg base, intptr_t ofs);
>   static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target,
>                            const TCGHelperInfo *info);
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot);
>   static bool tcg_target_const_match(int64_t val, TCGType type, int ct);
>   #ifdef TCG_TARGET_NEED_LDST_LABELS
>   static int tcg_out_ldst_finalize(TCGContext *s);
> @@ -718,14 +719,16 @@ static void init_call_layout(TCGHelperInfo *info)
>       case dh_typecode_s64:
>           info->nr_out = 64 / TCG_TARGET_REG_BITS;
>           info->out_kind = TCG_CALL_RET_NORMAL;
> -        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
> +        /* Query the last register now to trigger any assert early. */
> +        tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
>           break;
>       case dh_typecode_i128:
>           info->nr_out = 128 / TCG_TARGET_REG_BITS;
>           info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
>           switch (/* TODO */ TCG_CALL_RET_NORMAL) {
>           case TCG_CALL_RET_NORMAL:
> -            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
> +            /* Query the last register now to trigger any assert early. */
> +            tcg_target_call_oarg_reg(info->out_kind, info->nr_out - 1);
>               break;
>           case TCG_CALL_RET_BY_REF:
>               /*
> @@ -4579,7 +4582,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
>       case TCG_CALL_RET_NORMAL:
>           for (i = 0; i < nb_oargs; i++) {
>               TCGTemp *ts = arg_temp(op->args[i]);
> -            TCGReg reg = tcg_target_call_oarg_regs[i];
> +            TCGReg reg = tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, i);
>   
>               /* ENV should not be modified.  */
>               tcg_debug_assert(!temp_readonly(ts));
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 2279a14c11..dfe569dd8c 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -63,9 +63,13 @@ static const int tcg_target_call_iarg_regs[8] = {
>       TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
>       TCG_REG_X4, TCG_REG_X5, TCG_REG_X6, TCG_REG_X7
>   };
> -static const int tcg_target_call_oarg_regs[1] = {
> -    TCG_REG_X0
> -};
> +
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 1);
> +    return TCG_REG_X0 + slot;
> +}
>   
>   #define TCG_REG_TMP TCG_REG_X30
>   #define TCG_VEC_TMP TCG_REG_V31
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 2950a29d49..add90ddeb4 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -79,9 +79,13 @@ static const int tcg_target_reg_alloc_order[] = {
>   static const int tcg_target_call_iarg_regs[4] = {
>       TCG_REG_R0, TCG_REG_R1, TCG_REG_R2, TCG_REG_R3
>   };
> -static const int tcg_target_call_oarg_regs[2] = {
> -    TCG_REG_R0, TCG_REG_R1
> -};
> +
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 3);
> +    return TCG_REG_R0 + slot;
> +}
>   
>   #define TCG_REG_TMP  TCG_REG_R12
>   #define TCG_VEC_TMP  TCG_REG_Q15
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 6a021dda8b..ab6881a4f3 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -109,12 +109,16 @@ static const int tcg_target_call_iarg_regs[] = {
>   #endif
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_EAX,
> -#if TCG_TARGET_REG_BITS == 32
> -    TCG_REG_EDX
> -#endif
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    switch (kind) {
> +    case TCG_CALL_RET_NORMAL:
> +        tcg_debug_assert(slot >= 0 && slot <= 1);
> +        return slot ? TCG_REG_EDX : TCG_REG_EAX;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
>   
>   /* Constants we accept.  */
>   #define TCG_CT_CONST_S32 0x100
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 54b1dcd911..f6b0ed00bb 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -114,10 +114,12 @@ static const int tcg_target_call_iarg_regs[] = {
>       TCG_REG_A7,
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_A0,
> -    TCG_REG_A1,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 1);
> +    return TCG_REG_A0 + slot;
> +}
>   
>   #ifndef CONFIG_SOFTMMU
>   #define USE_GUEST_BASE     (guest_base != 0)
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 22b5463f0f..92883176c6 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -136,10 +136,12 @@ static const TCGReg tcg_target_call_iarg_regs[] = {
>   #endif
>   };
>   
> -static const TCGReg tcg_target_call_oarg_regs[2] = {
> -    TCG_REG_V0,
> -    TCG_REG_V1
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 1);
> +    return TCG_REG_V0 + slot;
> +}
>   
>   static const tcg_insn_unit *tb_ret_addr;
>   static const tcg_insn_unit *bswap32_addr;
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index d9e4ba8883..781ecfe161 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -186,10 +186,12 @@ static const int tcg_target_call_iarg_regs[] = {
>       TCG_REG_R10
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_R3,
> -    TCG_REG_R4
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 1);
> +    return TCG_REG_R3 + slot;
> +}
>   
>   static const int tcg_target_callee_save_regs[] = {
>   #ifdef _CALL_DARWIN
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 6072945ccb..417736cae7 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -113,10 +113,12 @@ static const int tcg_target_call_iarg_regs[] = {
>       TCG_REG_A7,
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_A0,
> -    TCG_REG_A1,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 1);
> +    return TCG_REG_A0 + slot;
> +}
>   
>   #define TCG_CT_CONST_ZERO  0x100
>   #define TCG_CT_CONST_S12   0x200
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 8663a963a6..50655e9d1d 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -390,9 +390,12 @@ static const int tcg_target_call_iarg_regs[] = {
>       TCG_REG_R6,
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_R2,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot == 0);
> +    return TCG_REG_R2;
> +}
>   
>   #define S390_CC_EQ      8
>   #define S390_CC_LT      4
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index f6a8a8e605..9b5afb8248 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -133,12 +133,12 @@ static const int tcg_target_call_iarg_regs[6] = {
>       TCG_REG_O5,
>   };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_O0,
> -    TCG_REG_O1,
> -    TCG_REG_O2,
> -    TCG_REG_O3,
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot <= 3);
> +    return TCG_REG_O0 + slot;
> +}
>   
>   #define INSN_OP(x)  ((x) << 30)
>   #define INSN_OP2(x) ((x) << 22)
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 633345d74b..cd53cb6b6b 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -200,12 +200,12 @@ static const int tcg_target_reg_alloc_order[] = {
>   /* No call arguments via registers.  All will be stored on the "stack". */
>   static const int tcg_target_call_iarg_regs[] = { };
>   
> -static const int tcg_target_call_oarg_regs[] = {
> -    TCG_REG_R0,
> -#if TCG_TARGET_REG_BITS == 32
> -    TCG_REG_R1
> -#endif
> -};
> +static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
> +{
> +    tcg_debug_assert(kind == TCG_CALL_RET_NORMAL);
> +    tcg_debug_assert(slot >= 0 && slot < 64 / TCG_TARGET_REG_BITS);
> +    return TCG_REG_R0 + slot;
> +}
>   
>   #ifdef CONFIG_DEBUG_TCG
>   static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {

