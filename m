Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6267DAFA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:54:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLCzb-0005O3-3M; Thu, 26 Jan 2023 19:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCzZ-0005Nu-FM
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:53:21 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCzX-00022a-NS
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:53:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso2370904wms.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 16:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=COqPtx+aNhLuKXh7KBTwPyWPVGOxQDeMV49p1+ZkhuM=;
 b=VZJlfMONitJfndsTVW4GeXpbNsOlK7RQM9c+eJHTenloopHmKh502p2KzZ7xq6e4td
 zP3cVlOUH68Vrjy3cGoDotFRIqvuIWjpeFKVL9S1xfEPPA/Z5pT9L6Ndky6L36HpNpxH
 HnXKoINqg/cAAXr5Ht9jeN646BUZEWzSlIOYfw28E3nxdqni+l3etazJPjwgi787MI1+
 pYlr9I4OF2htt1luHlLc+YkKoO7TlZoBcg3ab7hE9mYdgO6YY34GD32w2jPobYDOEAXY
 aCPTp9O3WFfI9oG53g7wiAmWT0XkjKxKjlL/wgy0mn3rcBHmVQ99b8LkPCE2bKieF4yF
 nzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=COqPtx+aNhLuKXh7KBTwPyWPVGOxQDeMV49p1+ZkhuM=;
 b=TIg8f5VOTZWgpGvUymCgf5iM7OZu42uzzYsZTEY0eqwenJK3BSTEUf6HFQau25IGsq
 eBl6LuFrRa/kRI+d/NuxcEpMZf0QLPhyItbj0D4xtkXh1jTsEKZxP92rw3TSmRi21zzc
 Uu9L+rf5+MMd7a60QJ8k4Jf+tPtipF9C6KEtfhJy4ftGl234EEcFzivc2GSYijpxrjPS
 KcpRmf270hFlOq1dQWyOgIkw7Tnw/8kFNEcu/u2jJSmv834SBWHMQpVglTcIbc0qOZ8L
 VRgAfYzZkyE/JRLTKipEICxTGOUnKV3IYixPnXiks3pi+NSb5tVSUtPpQc5oF8P5hNvC
 KnaQ==
X-Gm-Message-State: AFqh2kqK5mkLAVLzOFQRAZQxo+zotz+FXJzumC4SmumdazUaEpfpBj9y
 UCyau6SClsPM5kgPTniW5/ks4Q==
X-Google-Smtp-Source: AMrXdXtD1vULGWWsakuUloTPBD3B9AB20MC5yxlRSDDDuhyh8voc9jHAhkH9nsGAnf8NXjmOkuhAPg==
X-Received: by 2002:a05:600c:1ca0:b0:3db:3687:78c0 with SMTP id
 k32-20020a05600c1ca000b003db368778c0mr24436456wms.6.1674780797876; 
 Thu, 26 Jan 2023 16:53:17 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c439300b003cfd4e6400csm2764069wmn.19.2023.01.26.16.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:53:17 -0800 (PST)
Message-ID: <abb025a0-8588-81b3-ddd3-a93b4b66f6f5@linaro.org>
Date: Fri, 27 Jan 2023 01:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 17/36] tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126043824.54819-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
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

On 26/1/23 05:38, Richard Henderson wrote:
> Normally this is automatically handled by the CF_PARALLEL checks
> with in tcg_gen_atomic_cmpxchg_i{32,64}, but x86 has a special
> case of !PREFIX_LOCK where it always wants the non-atomic version.
> 
> Split these out so that x86 does not have to roll its own.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |   4 ++
>   tcg/tcg-op.c         | 154 +++++++++++++++++++++++++++----------------
>   2 files changed, 101 insertions(+), 57 deletions(-)


> +void tcg_gen_nonatomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
> +                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
> +{
> +    TCGv_i64 t1, t2;
> +

This block from here ...

> +    if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
> +        tcg_gen_nonatomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
> +                                      TCGV_LOW(newv), idx, memop);
> +        if (memop & MO_SIGN) {
> +            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
> +        } else {
> +            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
> +        }
> +        return;
> +    }

... to here,

> +    t1 = tcg_temp_new_i64();
> +    t2 = tcg_temp_new_i64();
> +
> +    tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
> +
> +    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
> +    tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
> +    tcg_gen_qemu_st_i64(t2, addr, idx, memop);
> +    tcg_temp_free_i64(t2);
> +
> +    if (memop & MO_SIGN) {
> +        tcg_gen_ext_i64(retv, t1, memop);
> +    } else {
> +        tcg_gen_mov_i64(retv, t1);
> +    }
> +    tcg_temp_free_i64(t1);
>   }
>   
>   void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
>                                   TCGv_i64 newv, TCGArg idx, MemOp memop)
>   {
> -    memop = tcg_canonicalize_memop(memop, 1, 0);
> -
>       if (!(tcg_ctx->gen_tb->cflags & CF_PARALLEL)) {
> -        TCGv_i64 t1 = tcg_temp_new_i64();
> -        TCGv_i64 t2 = tcg_temp_new_i64();
> +        tcg_gen_nonatomic_cmpxchg_i64(retv, addr, cmpv, newv, idx, memop);
> +        return;
> +    }
>   
> -        tcg_gen_ext_i64(t2, cmpv, memop & MO_SIZE);
> -
> -        tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
> -        tcg_gen_movcond_i64(TCG_COND_EQ, t2, t1, t2, newv, t1);
> -        tcg_gen_qemu_st_i64(t2, addr, idx, memop);
> -        tcg_temp_free_i64(t2);
> -
> -        if (memop & MO_SIGN) {
> -            tcg_gen_ext_i64(retv, t1, memop);
> -        } else {
> -            tcg_gen_mov_i64(retv, t1);
> -        }
> -        tcg_temp_free_i64(t1);
> -    } else if ((memop & MO_SIZE) == MO_64) {
> -#ifdef CONFIG_ATOMIC64
> +    if ((memop & MO_SIZE) == MO_64) {
>           gen_atomic_cx_i64 gen;
> -        MemOpIdx oi;
>   
> +        memop = tcg_canonicalize_memop(memop, 1, 0);
>           gen = table_cmpxchg[memop & (MO_SIZE | MO_BSWAP)];
> -        tcg_debug_assert(gen != NULL);
> +        if (gen) {
> +            MemOpIdx oi = make_memop_idx(memop, idx);
> +            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
> +            return;
> +        }
>   
> -        oi = make_memop_idx(memop, idx);
> -        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
> -#else
>           gen_helper_exit_atomic(cpu_env);
> -        /* Produce a result, so that we have a well-formed opcode stream
> -           with respect to uses of the result in the (dead) code following.  */
> +
> +        /*
> +         * Produce a result for a well-formed opcode stream.  This satisfies
> +         * liveness for set before used, which happens before this dead code
> +         * is removed.
> +         */
>           tcg_gen_movi_i64(retv, 0);
> -#endif /* CONFIG_ATOMIC64 */
> +        return;
> +    }

and this one here:
> +    if (TCG_TARGET_REG_BITS == 32) {
> +        tcg_gen_atomic_cmpxchg_i32(TCGV_LOW(retv), addr, TCGV_LOW(cmpv),
> +                                   TCGV_LOW(newv), idx, memop);
> +        if (memop & MO_SIGN) {
> +            tcg_gen_sari_i32(TCGV_HIGH(retv), TCGV_LOW(retv), 31);
> +        } else {
> +            tcg_gen_movi_i32(TCGV_HIGH(retv), 0);
> +        }

belong to a subsequent patch IMO. Otherwise LGTM.

>       } else {
>           TCGv_i32 c32 = tcg_temp_new_i32();
>           TCGv_i32 n32 = tcg_temp_new_i32();


