Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD29632FED
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFPs-0001R3-5S; Mon, 21 Nov 2022 17:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxFPq-0001Qk-8X; Mon, 21 Nov 2022 17:37:26 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oxFPo-0003Wv-8S; Mon, 21 Nov 2022 17:37:26 -0500
Received: by mail-oi1-x230.google.com with SMTP id l127so14042570oia.8;
 Mon, 21 Nov 2022 14:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YDdnx8Vun02FYaShpGiFYVNJXg7yb0/OEQlkqvCV/Mk=;
 b=eUa8G7Z61upi8VPFuV/md/cflIJVPEKvx5Qca8dEdFwG2oNiA4+A4QRBErKhNggYVR
 uWuXYRw6w+rbZHgdfn2f0hpJ5hXgrTyeBOJt1yU7mfvsKeG2d7nV5SvZpVqGkkF1PiQX
 w1M+Xow6Wg1PdlWPjQtlrcoU1YOxbw00vC7NShgKXN3+FS94rImozJGYCl6CF99j1tWo
 EGhT+j67+/0WT+K4Ykw4JAptBsS6O403MQ/xFyVk3adhFkejzTJ52M4Xy8z3Avmu0h2q
 +FGMc9r2F5vo7RgVftuaE7GpqcwghR5YsdoksO+Ld6e09La70kvIRvl6Ba3WW9Rq3Rxh
 PQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDdnx8Vun02FYaShpGiFYVNJXg7yb0/OEQlkqvCV/Mk=;
 b=SsjkdY5hpA+SN7PzLCIS053TufOb1EjCtqXBCpgJMbMwZLoWjX6k+fkTIdPSKz2poa
 C/rMd0GpJ3n86yyYFJpXLiuld45l0JVP6WkAlBQLrwgoftRuG20K/wpsZoGFn72uboFx
 vRToSQP4bHU+RTlrV1Z5+gtL9JNR9uRnOp/5JahZnkj5Vy2SESBhq+27ODV1IX4FGnKM
 xarYZqKAzs2DU5CPqyHjIpPZ2zTbx3MOiWpkEtw8DDqZLTQplINvyRRNRQC2MJRpuMKc
 /0Ha+QFwfWKrTSv+WnF9P5NlkXGw5ITaI0fZSt0hOtuSZbTWx8PgNrKZh0vstH55Al5q
 8lDA==
X-Gm-Message-State: ANoB5pmL55OMl2rpueRdhrXdm1MxiQqhFPq0yGLQMEMEK78GFCPkmtGF
 Gyt0+wW6h1S132Q9GQ/aWxxtXx5KR58=
X-Google-Smtp-Source: AA0mqf7RV5R5h43ruy+vDKnqg+9V6xlvt83tx+u4R0AJJfEaL505OuLqAn2/YumHtTTNKuARb/zaDg==
X-Received: by 2002:aca:1c10:0:b0:35a:78ae:d666 with SMTP id
 c16-20020aca1c10000000b0035a78aed666mr10155347oic.60.1669070241902; 
 Mon, 21 Nov 2022 14:37:21 -0800 (PST)
Received: from [192.168.10.102] ([191.19.173.155])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a4a890a000000b0049f098f4fb4sm4654033ooi.24.2022.11.21.14.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:37:21 -0800 (PST)
Message-ID: <f456f0e6-e69a-bda3-f2ee-7e4d4b7c8cd4@gmail.com>
Date: Mon, 21 Nov 2022 19:37:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 1/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128
 for STQCX
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org
References: <20221112061122.2720163-1-richard.henderson@linaro.org>
 <20221112061122.2720163-2-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221112061122.2720163-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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



On 11/12/22 03:11, Richard Henderson wrote:
> Note that the previous direct reference to reserve_val,
> 
> -   tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> -                                ? offsetof(CPUPPCState, reserve_val2)
> -                                : offsetof(CPUPPCState, reserve_val)));
> 
> was incorrect because all references should have gone through
> cpu_reserve_val.  Create a cpu_reserve_val2 tcg temp to fix this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


Richard, since this depends on your int128 with helpers, do you want to
queue this in the same queue?



Daniel

>   target/ppc/helper.h     |   2 -
>   target/ppc/mem_helper.c |  44 -----------------
>   target/ppc/translate.c  | 102 ++++++++++++++++++----------------------
>   3 files changed, 47 insertions(+), 101 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 8dd22a35e4..0beaca5c7a 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -818,6 +818,4 @@ DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG,
>                      void, env, tl, i64, i64, i32)
>   DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,
>                      void, env, tl, i64, i64, i32)
> -DEF_HELPER_5(stqcx_le_parallel, i32, env, tl, i64, i64, i32)
> -DEF_HELPER_5(stqcx_be_parallel, i32, env, tl, i64, i64, i32)
>   #endif
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index d1163f316c..1578887a8f 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -413,50 +413,6 @@ void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
>       val = int128_make128(lo, hi);
>       cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
>   }
> -
> -uint32_t helper_stqcx_le_parallel(CPUPPCState *env, target_ulong addr,
> -                                  uint64_t new_lo, uint64_t new_hi,
> -                                  uint32_t opidx)
> -{
> -    bool success = false;
> -
> -    /* We will have raised EXCP_ATOMIC from the translator.  */
> -    assert(HAVE_CMPXCHG128);
> -
> -    if (likely(addr == env->reserve_addr)) {
> -        Int128 oldv, cmpv, newv;
> -
> -        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
> -        newv = int128_make128(new_lo, new_hi);
> -        oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv,
> -                                          opidx, GETPC());
> -        success = int128_eq(oldv, cmpv);
> -    }
> -    env->reserve_addr = -1;
> -    return env->so + success * CRF_EQ_BIT;
> -}
> -
> -uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
> -                                  uint64_t new_lo, uint64_t new_hi,
> -                                  uint32_t opidx)
> -{
> -    bool success = false;
> -
> -    /* We will have raised EXCP_ATOMIC from the translator.  */
> -    assert(HAVE_CMPXCHG128);
> -
> -    if (likely(addr == env->reserve_addr)) {
> -        Int128 oldv, cmpv, newv;
> -
> -        cmpv = int128_make128(env->reserve_val2, env->reserve_val);
> -        newv = int128_make128(new_lo, new_hi);
> -        oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv,
> -                                          opidx, GETPC());
> -        success = int128_eq(oldv, cmpv);
> -    }
> -    env->reserve_addr = -1;
> -    return env->so + success * CRF_EQ_BIT;
> -}
>   #endif
>   
>   /*****************************************************************************/
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 19c1d17cb0..85f95a9045 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -72,6 +72,7 @@ static TCGv cpu_cfar;
>   static TCGv cpu_xer, cpu_so, cpu_ov, cpu_ca, cpu_ov32, cpu_ca32;
>   static TCGv cpu_reserve;
>   static TCGv cpu_reserve_val;
> +static TCGv cpu_reserve_val2;
>   static TCGv cpu_fpscr;
>   static TCGv_i32 cpu_access_type;
>   
> @@ -141,8 +142,11 @@ void ppc_translate_init(void)
>                                        offsetof(CPUPPCState, reserve_addr),
>                                        "reserve_addr");
>       cpu_reserve_val = tcg_global_mem_new(cpu_env,
> -                                     offsetof(CPUPPCState, reserve_val),
> -                                     "reserve_val");
> +                                         offsetof(CPUPPCState, reserve_val),
> +                                         "reserve_val");
> +    cpu_reserve_val2 = tcg_global_mem_new(cpu_env,
> +                                          offsetof(CPUPPCState, reserve_val2),
> +                                          "reserve_val2");
>   
>       cpu_fpscr = tcg_global_mem_new(cpu_env,
>                                      offsetof(CPUPPCState, fpscr), "fpscr");
> @@ -3979,78 +3983,66 @@ static void gen_lqarx(DisasContext *ctx)
>   /* stqcx. */
>   static void gen_stqcx_(DisasContext *ctx)
>   {
> +    TCGLabel *lab_fail, *lab_over;
>       int rs = rS(ctx->opcode);
> -    TCGv EA, hi, lo;
> +    TCGv EA, t0, t1;
> +    TCGv_i128 cmp, val;
>   
>       if (unlikely(rs & 1)) {
>           gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
>           return;
>       }
>   
> +    lab_fail = gen_new_label();
> +    lab_over = gen_new_label();
> +
>       gen_set_access_type(ctx, ACCESS_RES);
>       EA = tcg_temp_new();
>       gen_addr_reg_index(ctx, EA);
>   
> +    tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
> +    tcg_temp_free(EA);
> +
> +    cmp = tcg_temp_new_i128();
> +    val = tcg_temp_new_i128();
> +
> +    tcg_gen_concat_i64_i128(cmp, cpu_reserve_val2, cpu_reserve_val);
> +
>       /* Note that the low part is always in RS+1, even in LE mode.  */
> -    lo = cpu_gpr[rs + 1];
> -    hi = cpu_gpr[rs];
> +    tcg_gen_concat_i64_i128(val, cpu_gpr[rs + 1], cpu_gpr[rs]);
>   
> -    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
> -        if (HAVE_CMPXCHG128) {
> -            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
> -            if (ctx->le_mode) {
> -                gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
> -                                             EA, lo, hi, oi);
> -            } else {
> -                gen_helper_stqcx_be_parallel(cpu_crf[0], cpu_env,
> -                                             EA, lo, hi, oi);
> -            }
> -            tcg_temp_free_i32(oi);
> -        } else {
> -            /* Restart with exclusive lock.  */
> -            gen_helper_exit_atomic(cpu_env);
> -            ctx->base.is_jmp = DISAS_NORETURN;
> -        }
> -        tcg_temp_free(EA);
> -    } else {
> -        TCGLabel *lab_fail = gen_new_label();
> -        TCGLabel *lab_over = gen_new_label();
> -        TCGv_i64 t0 = tcg_temp_new_i64();
> -        TCGv_i64 t1 = tcg_temp_new_i64();
> +    tcg_gen_atomic_cmpxchg_i128(val, cpu_reserve, cmp, val, ctx->mem_idx,
> +                                DEF_MEMOP(MO_128 | MO_ALIGN));
> +    tcg_temp_free_i128(cmp);
>   
> -        tcg_gen_brcond_tl(TCG_COND_NE, EA, cpu_reserve, lab_fail);
> -        tcg_temp_free(EA);
> +    t0 = tcg_temp_new();
> +    t1 = tcg_temp_new();
> +    tcg_gen_extr_i128_i64(t1, t0, val);
> +    tcg_temp_free_i128(val);
>   
> -        gen_qemu_ld64_i64(ctx, t0, cpu_reserve);
> -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> -                                     ? offsetof(CPUPPCState, reserve_val2)
> -                                     : offsetof(CPUPPCState, reserve_val)));
> -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
> +    tcg_gen_xor_tl(t1, t1, cpu_reserve_val2);
> +    tcg_gen_xor_tl(t0, t0, cpu_reserve_val);
> +    tcg_gen_or_tl(t0, t0, t1);
> +    tcg_temp_free(t1);
>   
> -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
> -        gen_qemu_ld64_i64(ctx, t0, t0);
> -        tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
> -                                     ? offsetof(CPUPPCState, reserve_val)
> -                                     : offsetof(CPUPPCState, reserve_val2)));
> -        tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, lab_fail);
> +    tcg_gen_setcondi_tl(TCG_COND_EQ, t0, t0, 0);
> +    tcg_gen_shli_tl(t0, t0, CRF_EQ_BIT);
> +    tcg_gen_or_tl(t0, t0, cpu_so);
> +    tcg_gen_trunc_tl_i32(cpu_crf[0], t0);
> +    tcg_temp_free(t0);
>   
> -        /* Success */
> -        gen_qemu_st64_i64(ctx, ctx->le_mode ? lo : hi, cpu_reserve);
> -        tcg_gen_addi_i64(t0, cpu_reserve, 8);
> -        gen_qemu_st64_i64(ctx, ctx->le_mode ? hi : lo, t0);
> +    tcg_gen_br(lab_over);
> +    gen_set_label(lab_fail);
>   
> -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> -        tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
> -        tcg_gen_br(lab_over);
> +    /*
> +     * Address mismatch implies failure.  But we still need to provide
> +     * the memory barrier semantics of the instruction.
> +     */
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
>   
> -        gen_set_label(lab_fail);
> -        tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
> -
> -        gen_set_label(lab_over);
> -        tcg_gen_movi_tl(cpu_reserve, -1);
> -        tcg_temp_free_i64(t0);
> -        tcg_temp_free_i64(t1);
> -    }
> +    gen_set_label(lab_over);
> +    tcg_gen_movi_tl(cpu_reserve, -1);
>   }
>   #endif /* defined(TARGET_PPC64) */
>   

