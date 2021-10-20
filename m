Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B85434464
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 06:47:31 +0200 (CEST)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3Vi-0007y1-1j
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 00:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3UH-0007Gz-Oi
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:46:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md3UF-0005e9-Nn
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 00:46:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so1544856pjc.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 21:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NqxxJJcCpIBI67MZfHirF3Y0xVOi/ILTxm1Kh+Y5jHk=;
 b=hx8Ubpbxd9ywEyjJ2cg+u7rBF3B98agm2GYsxnLd8VSH0DRstMi/6jeYVP0I0UOdnh
 GjpwaPVEuwxtIfVa5DJLMzAmrKgqZNBtPC1rjLCJxzBppAKw4i08XVUR8/ebpjUNm7bI
 xkMgULihGPLI4hrqWxogDkoE+sXDRKRqqj24bSUvwBmgUKnnuaYtcWIywA1pS7Cf0A17
 WT+xcOqHVbnd1oLSMGVtqCkHmNITEr7/G/9YeCQqiy5CJFr3a35+EgBH83XTwZEwXefa
 XSjx2HoiEnuqfakQgCTOQVihEHSxF3wiZ9hsyvW4qY2oq9CurA4LI2nPjKF+8D9RYK1j
 uyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NqxxJJcCpIBI67MZfHirF3Y0xVOi/ILTxm1Kh+Y5jHk=;
 b=tpJFESyB7AbYZXo9Xkh4mDMpoMVGGYSX0/KlJFMtTRqtYExyWX+vlzcl/j2xkHV2yU
 SQpwb8quBvwViJDQEwC5EZOV7YV0lgV4NXHSCc5O6VII1CJVcCTNJOpGWqSqJ94WWYPg
 WoaA3HSP5qbO0Cv2LYKK2tgJwqqfZ0h2FTJps9Q4sif3PnR/+W7lOzc4rm2pA29rwIMS
 QsEkAWAcgmPzuZoe0UYRrTWldeUxjiOtwdaV9i7DLKJzSLsOu3swLiGpOLxj9cAjwC0l
 Z0umAC//B80WEy1aBZAy1hIhFWKLzhJ3QIyz/P+UquvRbYzO8tZhGHBbS6kG7YbHbeLQ
 zx4w==
X-Gm-Message-State: AOAM530IbZaxuNLGWQd714ODWBqAm7PhbAsP+vkp+QP5y1zGDkCZzGDC
 5rbcSjiZtlVczed0vWuTN1+Y4w==
X-Google-Smtp-Source: ABdhPJwedgTB9tJ7kbTMmfOZMn0wGdf5OOdb1zhive4xNA5z1xEG21n1/yoqKh153w4YtTtWlhfqpg==
X-Received: by 2002:a17:902:d314:b0:13f:7705:819f with SMTP id
 b20-20020a170902d31400b0013f7705819fmr36993913plc.79.1634705157914; 
 Tue, 19 Oct 2021 21:45:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l207sm786699pfd.199.2021.10.19.21.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 21:45:57 -0700 (PDT)
Subject: Re: [PATCH 09/31] target/loongarch: Add other core instructions
 support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <1634628917-10031-10-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1900952-5335-d3df-27f7-9e5bb09085bc@linaro.org>
Date: Tue, 19 Oct 2021 21:45:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634628917-10031-10-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 12:34 AM, Xiaojuan Yang wrote:
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index afd186abac..7fa3851251 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -45,6 +45,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
>       [EXCP_TLBPE] = "TLB priviledged error",
>       [EXCP_TLBNX] = "TLB execute-inhibit",
>       [EXCP_TLBNR] = "TLB read-inhibit",
> +    [EXCP_DBP] = "debug breakpoint",
>   };
>   
>   const char *loongarch_exception_name(int32_t exception)
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 567fc7620d..d39c618d6b 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -166,10 +166,13 @@ enum {
>       EXCP_TLBPE,
>       EXCP_TLBNX,
>       EXCP_TLBNR,
> +    EXCP_DBP,
>   
> -    EXCP_LAST = EXCP_TLBNR,
> +    EXCP_LAST = EXCP_DBP,
>   };

These should have been added with the other exceptions earlier.

> @@ -173,6 +179,11 @@ static bool trans_iocsrwr_d(DisasContext *ctx, arg_iocsrwr_d *a)
>       return true;
>   }
>   
> +static bool trans_cacop(DisasContext *ctx, arg_cacop *a)
> +{
> +    return false;
> +}

I think you meant to return true here, so that cacop is interpreted as a nop.  You would 
add a comment to that effect.

> +static bool trans_ldpte(DisasContext *ctx, arg_ldpte *a)
> +{
> +    TCGv_i32 mem_idx = tcg_constant_i32(ctx->mem_idx);
> +    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
> +
> +    gen_helper_ldpte(cpu_env, src1, tcg_constant_tl(a->seq), mem_idx);
> +    return true;
> +}

Missing priv checks again.

> +static bool trans_idle(DisasContext *ctx, arg_idle *a)
> +{
> +    ctx->base.pc_next += 4;
> +    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
> +    ctx->base.pc_next -= 4;

Why would you add and subtract like this?

> +#ifndef CONFIG_USER_ONLY
> +static inline void exception_return(CPULoongArchState *env)
> +{
> +    if (env->CSR_TLBRERA & 0x1) {
> +        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV,
> +                                   FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV));
> +        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE,
> +                                   FIELD_EX64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE));
> +        /* Clear Refill flag and set pc */
> +        env->CSR_TLBRERA &= (~0x1);
> +        env->pc = env->CSR_TLBRERA;
> +        if (qemu_loglevel_mask(CPU_LOG_INT)) {
> +            qemu_log("%s: TLBRERA 0x%lx\n", __func__, env->CSR_TLBRERA);
> +        }
> +    } else {
> +        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV,
> +                                   FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PPLV));
> +        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE,
> +                                   FIELD_EX64(env->CSR_PRMD, CSR_PRMD, PIE));
> +        /* set pc*/
> +        env->pc = env->CSR_ERA;
> +        if (qemu_loglevel_mask(CPU_LOG_INT)) {
> +            qemu_log("%s: ERA 0x%lx\n", __func__, env->CSR_ERA);
> +        }
> +    }
> +}
> +
> +void helper_ertn(CPULoongArchState *env)
> +{
> +    exception_return(env);
> +    env->lladdr = 1;
> +}

Any reason to have exception_return be a separate function?

> +target_ulong helper_lddir(CPULoongArchState *env, target_ulong base,
> +                          target_ulong level, uint32_t mem_idx)
> +{
> +    target_ulong badvaddr;
> +    target_ulong index;
> +    target_ulong vaddr;
> +    int shift;
> +    uint64_t dir1_base, dir1_width;
> +    uint64_t dir3_base, dir3_width;
> +
> +    badvaddr = env->CSR_TLBRBADV;
> +
> +    /* 0:8B, 1:16B, 2:32B, 3:64B */
> +    shift = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, PTEWIDTH);
> +    shift = (shift + 1) * 3;
> +
> +    switch (level) {
> +    case 1:
> +        dir1_base = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, DIR1_BASE);
> +        dir1_width = FIELD_EX64(env->CSR_PWCL, CSR_PWCL, DIR1_WIDTH);
> +        index = (badvaddr >> dir1_base) & ((1 << dir1_width) - 1);
> +        break;
> +    case 3:
> +        dir3_base = FIELD_EX64(env->CSR_PWCH, CSR_PWCH, DIR3_BASE);
> +        dir3_width = FIELD_EX64(env->CSR_PWCH, CSR_PWCH, DIR3_WIDTH);
> +        index = (badvaddr >> dir3_base) & ((1 << dir3_width) - 1);
> +        break;
> +    default:
> +        do_raise_exception(env, EXCP_INE, GETPC());
> +        return 0;
> +    }
> +
> +    vaddr = base | index << shift;
> +    return cpu_ldq_mmuidx_ra(env, vaddr, mem_idx, GETPC());

A load from mem_idx is incorrect -- you have a physical address (thus the name "vaddr" is 
at best misleading). There are two possible solutions:

(1) ldq_phys.

(2) Add a separate MMU_PHYS_IDX, which you could use here.  You would also return this 
value from cpu_mem_index when CRMD.{DA,PG} indicates that direct address translation is 
enabled.

> +void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
> +                  uint32_t mem_idx)
> +{
...
> +        vaddr = base | (odd ? ptoffset1 : ptoffset0);
> +        tmp0 = cpu_ldq_mmuidx_ra(env, vaddr, mem_idx, GETPC());

Likewise.


r~

