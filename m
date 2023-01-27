Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9067DAE4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:47:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLCsK-0004FH-Sc; Thu, 26 Jan 2023 19:45:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCsG-0004Ek-4H
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:45:51 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCs9-0000t6-Fy
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:45:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so4407320wmb.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 16:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=InzvcZnVFhPaK4/LtoJCQdVynxdIILOhSiCAdCNlaTc=;
 b=jS/A7RjzavGv5wSfoJadGRdt3Ag16Oz7L176ywLwrTC559s8dyey9jMKJx/AQuZCHo
 loOV84+70kD1d4bIYOb2P6nR788bJ560fERIhEb39rrySZEEFk0CSOEXeprM1Nzra2gX
 eHjl2WkRlAfi+QI6myGCL/3NqdBIzB9i0fw6k6I3UvO2vd53doQhGQ0KoOuePRhGQYNx
 MvqOfXTjhPznc0uW2NApySr6JmQtvRVQy0R4zU/Sva+Oy3USvzWH7zQ13TIkwAINNyUu
 7LFAAyBXm9AG+h8n/nRUlaquF+07oaax1myz5LwXLZnZKvZG3trt5ruyYnqdKE0GHzg5
 U2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=InzvcZnVFhPaK4/LtoJCQdVynxdIILOhSiCAdCNlaTc=;
 b=0kHAjbr6jwPcnXGDGfeKeL7lJonrjR4LRzXo9imMgaRYTjzeVE48E6t9fPLFhIjyLI
 fqc36iFVMSDAQ/4nM/F5dfM+sxWtn39WPAv+F+iJ2zAD7RBEv8PUEwo33DrN6RkPgVCl
 u0geze/w9X2Yy8aEqp42GUoY49FssQSpmk7B4EEIFw/uxpmCnh/RwLQXDfZJRlLbxO1a
 E6ggD+vFX+Mf+habm3CepQIddv7ybG+Et4m+MdSA2KkXI5zcekimLEpVbgqG1iziCt8E
 /EBiX/H1RpL+9tDA+rFZPnvpHHtwu7tmHPubVqESlyjVYxXHjbFvlaux5t+BLleYoLoR
 NJ6w==
X-Gm-Message-State: AFqh2koESUrKIyap0Yo4En4eN/eJWzWli+0qK18j0vRkXo55qCG+dr0/
 /2FjQTqMRlii10CQCQil7XHU9Q==
X-Google-Smtp-Source: AMrXdXu6DcGTu69ar6GndM+4VIw2LkgR9PHa5VGczp+XC6SL56FQ6//bf5enKUH65JB+0XZvPcnLLA==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id
 y9-20020a1c4b09000000b003db0f0a8726mr34801641wma.28.1674780339931; 
 Thu, 26 Jan 2023 16:45:39 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 y34-20020a05600c342200b003dc16dee9b1sm2697882wmp.15.2023.01.26.16.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:45:39 -0800 (PST)
Message-ID: <8b021470-b335-4b85-d516-906308ddea69@linaro.org>
Date: Fri, 27 Jan 2023 01:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126043824.54819-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
> This will allow targets to avoid rolling their own.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tcg-runtime.h       | 11 +++++
>   include/tcg/tcg-op.h          |  5 +++
>   tcg/tcg-op.c                  | 85 +++++++++++++++++++++++++++++++++++
>   accel/tcg/atomic_common.c.inc | 45 +++++++++++++++++++
>   4 files changed, 146 insertions(+)

> +void tcg_gen_nonatomic_cmpxchg_i128(TCGv_i128 retv, TCGv addr, TCGv_i128 cmpv,
> +                                    TCGv_i128 newv, TCGArg idx, MemOp memop)
> +{
> +    if (TCG_TARGET_REG_BITS == 32) {
> +        /* Inline expansion below is simply too large for 32-bit hosts. */
> +        gen_atomic_cx_i128 gen = ((memop & MO_BSWAP) == MO_LE
> +                                  ? gen_helper_nonatomic_cmpxchgo_le
> +                                  : gen_helper_nonatomic_cmpxchgo_be);
> +        MemOpIdx oi = make_memop_idx(memop, idx);
> +
> +        tcg_debug_assert((memop & MO_SIZE) == MO_128);
> +        tcg_debug_assert((memop & MO_SIGN) == 0);
> +
> +        gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
> +    } else {
> +        TCGv_i128 oldv = tcg_temp_new_i128();
> +        TCGv_i128 tmpv = tcg_temp_new_i128();
> +        TCGv_i64 t0 = tcg_temp_new_i64();
> +        TCGv_i64 t1 = tcg_temp_new_i64();
> +        TCGv_i64 z = tcg_constant_i64(0);
> +
> +        tcg_gen_qemu_ld_i128(oldv, addr, idx, memop);
> +
> +        /* Compare i128 */
> +        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
> +        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
> +        tcg_gen_or_i64(t0, t0, t1);

Can we skip the OR ...

> +        /* tmpv = equal ? newv : oldv */
> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
> +                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,

... and test t1 here to partially update LO/HI? (we could remove t1 and
just use t0 as twice 'xor + movcond' but the code is less readable).

> +                            TCGV128_HIGH(newv), TCGV128_HIGH(oldv));
> +
> +        /* Unconditional writeback. */
> +        tcg_gen_qemu_st_i128(tmpv, addr, idx, memop);
> +        tcg_gen_mov_i128(retv, oldv);
> +
> +        tcg_temp_free_i64(t0);
> +        tcg_temp_free_i64(t1);
> +        tcg_temp_free_i128(tmpv);
> +        tcg_temp_free_i128(oldv);
> +    }
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


