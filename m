Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537916A2919
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 11:35:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrrs-0005XW-OP; Sat, 25 Feb 2023 05:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrrq-0005K9-1G
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:33:26 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVrrm-0001Oz-Vm
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 05:33:25 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-172334d5c8aso2389332fac.8
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 02:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ECmqiOxl/WbBgpvqRmEGupHEyPuAxiWmANQ5KYPZv0=;
 b=Z96E//v37D9Xes3n5jdxdDPX2HU8ogmhQkp2E4GpEPV8KdP0TBn72eGcMhTNV5L03G
 PzSBUNmKT3jI4J4LVX5/0L+gzyN8FIRfMRbozaLVdIouHT/KeDvlqIWcwwVvN+PsrpoD
 N3ycyQ/td1EuU+rfX+Ra4w5GLdmblOCtgq/J5iNdArNhdZiySbahc35gupxgaJ2pUg7N
 1ULcjqMI59jOb3VEWaFuFrqI7/Hkns9EhdWoCZMpv2lkr5m52eG2Y9irJyXa6TewhhxG
 j+tCdjv2UtO57sEvyz0xtDoVNEV/RqFMIANioMaoStFB+dWZty3lSiDUMo9w4OjomYMh
 eyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ECmqiOxl/WbBgpvqRmEGupHEyPuAxiWmANQ5KYPZv0=;
 b=cqNC0Z0UQS/VZaxu8IZ1pBlKxkP0v66ZLldY8ge3eHFK5bdjMSDc2aPgU+Qy5j8Y/h
 whu8PbcxCsCV/bu9tNZKnEyOvgFR4sWccxYYrH9/KnP/LZ5MqeLWBTIKDNl6s3ud7qE2
 Eom3TfNVAJQ/pPfNpxYBtLqNl1r5BRoCeeeZu3pXZBrRKqN/dkJ9UIMDN0lOkxAOVo68
 n1aPETA8PPkKWx24ZqfB4zfgm1JXoKj30zADH5LFVUAFzhcwxi53K3e4Kot71yzmxRKn
 wIo1LOo/N3yshylV97pidKoPD2vu9Vi8H+DkM82aKODLk4Qnn/uHHBUzccRGsDd9tE0S
 pciw==
X-Gm-Message-State: AO0yUKV3NBCgvZBreRwLxUSVxG61lmhPiH/qcrO4k7X4S3muhQnGYfVv
 W6apnjKV8ncTTtlNJyjxbVYNuQ==
X-Google-Smtp-Source: AK7set8xl/1R2WsQ4G6zRNYlNaEeVi5YAvfMy7eSFcYhpsY9js4BYCrIMvvKUgIvaQkS1JTsJmiwCQ==
X-Received: by 2002:a05:6870:ea97:b0:16d:c5c3:de1b with SMTP id
 s23-20020a056870ea9700b0016dc5c3de1bmr14064121oap.45.1677321198133; 
 Sat, 25 Feb 2023 02:33:18 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 du1-20020a0568703a0100b0016a310dc4a9sm500921oab.9.2023.02.25.02.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 02:33:17 -0800 (PST)
Message-ID: <c9d96abc-50ce-6c30-acff-368e74c04aca@ventanamicro.com>
Date: Sat, 25 Feb 2023 07:33:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 51/76] target/riscv: Drop ftemp_new
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-52-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225091427.1817156-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 2/25/23 06:14, Richard Henderson wrote:
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/translate.c | 24 ++++--------------------
>   1 file changed, 4 insertions(+), 20 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f9d5d1097e..273e566d66 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -106,9 +106,6 @@ typedef struct DisasContext {
>       TCGv zero;
>       /* Space for 3 operands plus 1 extra for address computation. */
>       TCGv temp[4];
> -    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
> -    TCGv_i64 ftemp[4];
> -    uint8_t nftemp;
>       /* PointerMasking extension */
>       bool pm_mask_enabled;
>       bool pm_base_enabled;
> @@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
>       }
>   }
>   
> -static TCGv_i64 ftemp_new(DisasContext *ctx)
> -{
> -    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
> -    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
> -}
> -
>   static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>   {
>       if (!ctx->cfg_ptr->ext_zfinx) {
> @@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>       case MXL_RV32:
>   #ifdef TARGET_RISCV32
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
>           return t;
>       }
> @@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
>       {
> -        TCGv_i64 t = ftemp_new(ctx);
> +        TCGv_i64 t = tcg_temp_new_i64();
>           tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
>           return t;
>       }
> @@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
>       }
>   
>       if (reg_num == 0) {
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>       }
>   
>       switch (get_xl(ctx)) {
>       case MXL_RV32:
> -        return ftemp_new(ctx);
> +        return tcg_temp_new_i64();
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
>           return cpu_gpr[reg_num];
> @@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cs = cs;
>       ctx->ntemp = 0;
>       memset(ctx->temp, 0, sizeof(ctx->temp));
> -    ctx->nftemp = 0;
> -    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> @@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>           ctx->temp[i] = NULL;
>       }
>       ctx->ntemp = 0;
> -    for (i = ctx->nftemp - 1; i >= 0; --i) {
> -        tcg_temp_free_i64(ctx->ftemp[i]);
> -        ctx->ftemp[i] = NULL;
> -    }
> -    ctx->nftemp = 0;
>   
>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>       if (ctx->base.is_jmp == DISAS_NEXT) {

