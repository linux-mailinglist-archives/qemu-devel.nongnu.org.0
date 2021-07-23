Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0423D3441
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:46:35 +0200 (CEST)
Received: from localhost ([::1]:44518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6o14-0007me-8e
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6nzW-0006TS-Vd
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:44:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6nzV-0006I0-BH
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:44:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id f1so1981971plt.7
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 22:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SLAewM/CCtjAbcuRilitL2AQb4u5x3gq+0eTwmWf7jY=;
 b=KGydOpaAx/t+sGswn2rLX6RF/vCBW6r5kJwq+u4BNXWYvlzLfQdOIXMcV0KAG+mjz6
 mqP2g32FyLiAUFmnvdwKdtuzXfMKj8zFqAGd0H9OAyjL9jTG6AxJBBXDo15gtq0nT9Dq
 /5ydKB8NYdG3nxpxdcj1M4RaEPglFMhpYLKqVJEGWv2DzQAVbyfVmlaTubEaNOxSOO0L
 dLekx1Lg531ttPtm9ms/oDF2NzYO9r5Lq1ewAGJJfK6iQ6Sd1S/35AHKd82K41+uOi1v
 IDfu4T37BbdzeO1dVqQjd3q57AHQWNo9IALox6/kthy7VQ2UZXngA+AoBlgAmvEI+qQo
 DHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SLAewM/CCtjAbcuRilitL2AQb4u5x3gq+0eTwmWf7jY=;
 b=a3UCeB3fynPYnV2xmQ0gfQBiJwodVuSFWqSxzlEOG86jVA7XDaDBKzbjF8kHF7hXyf
 FQnNuVAal7k6F5h/S+m+9LDibK0zLQYGM9Z19nGkQyAFHPu60MKg2DntFX8pXTrMEIBZ
 L8W7uPSSrDBrM0kkDYpZeS4mo0wF9uF7UYNxh3PcB5u1jh+VrGEc14qflO8Mifvmqrdl
 yjqQ6143XqzRMSKw0lyo+65G3nDuwbQk03A3ITBA46smYTiEoOs5IqGYJZunkItID34G
 /AIzF4UYpPEF6RRSkCKo7cuP4hDBeBDwWx4F6/3dQHQ1RXM7A80PFeXOoZgc8+Nw/aLS
 sG+Q==
X-Gm-Message-State: AOAM532y0JHt9cWX+/mOQrWTVAs36DpuzNWRho7/YEjm+pmPOEfKIauP
 WW/ajU1s7Yt04TdwkViwIMguPA==
X-Google-Smtp-Source: ABdhPJzwJnWD/LBs+wOu1BY7rqCbIAfjX/rzbTfbma58toZu4vjSdU1TbLXONq/Exq3H2RvAtfroWg==
X-Received: by 2002:a17:90a:db98:: with SMTP id
 h24mr3134585pjv.156.1627019095766; 
 Thu, 22 Jul 2021 22:44:55 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id pj3sm26208067pjb.35.2021.07.22.22.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 22:44:55 -0700 (PDT)
Subject: Re: [PATCH v2 13/22] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1729aea1-a773-ad78-59d3-294eb968a7ba@linaro.org>
Date: Thu, 22 Jul 2021 19:44:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-14-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +uint64_t helper_fp_sqrt_d(CPULoongArchState *env, uint64_t fp)
> +{
> +    fp = float64_sqrt(fp, &env->active_fpu.fp_status);
> +    update_fcsr0(env, GETPC());
> +    return fp;
> +}
> +
> +uint32_t helper_fp_sqrt_s(CPULoongArchState *env, uint32_t fp)
> +{
> +    fp = float32_sqrt(fp, &env->active_fpu.fp_status);
> +    update_fcsr0(env, GETPC());
> +    return fp;
> +}

I believe you will find it easier to take and return uint64_t, even for 32-bit operations. 
  The manual says that the high bits may contain any value, so in my opinion you should 
not work hard to preserve the high bits, as you currently do with

> +    gen_load_fpr32(fp0, a->fj);
> +    gen_load_fpr32(fp1, a->fk);
> +    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
> +    gen_store_fpr32(fp0, a->fd);

I think this should be as simple as

   gen_helper_fp_add_s(cpu_fpu[a->fd], cpu_env,
                       cpu_fpu[a->fj], cpu_fpu[a->fk]);

I also think that loongarch should learn from risc-v and change the architecture to 
"nan-box" single-precision results -- fill the high 32-bits with 1s.  This is an SNaN 
representation for double-precision and will immediately fail when incorrectly using a 
single-precision value as a double-precision input.

Thankfully the current architecture is backward compatible with nan-boxing.

> +/* Floating point arithmetic operation instruction translation */
> +static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s * a)
> +{
> +    TCGv_i32 fp0, fp1;
> +
> +    fp0 = tcg_temp_new_i32();
> +    fp1 = tcg_temp_new_i32();
> +
> +    check_fpu_enabled(ctx);
> +    gen_load_fpr32(fp0, a->fj);
> +    gen_load_fpr32(fp1, a->fk);
> +    gen_helper_fp_add_s(fp0, cpu_env, fp0, fp1);
> +    gen_store_fpr32(fp0, a->fd);
> +
> +    tcg_temp_free_i32(fp0);
> +    tcg_temp_free_i32(fp1);
> +
> +    return true;
> +}

Again, you should use some helper functions to reduce the repetition.

> +static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
> +{
> +    TCGv_i64 fp0, fp1, fp2, fp3;
> +
> +    fp0 = tcg_temp_new_i64();
> +    fp1 = tcg_temp_new_i64();
> +    fp2 = tcg_temp_new_i64();
> +    fp3 = tcg_temp_new_i64();
> +
> +    check_fpu_enabled(ctx);
> +    gen_load_fpr64(fp0, a->fj);
> +    gen_load_fpr64(fp1, a->fk);
> +    gen_load_fpr64(fp2, a->fa);
> +    check_fpu_enabled(ctx);

Repeating check_fpu_enabled.

> +    gen_helper_fp_madd_d(fp3, cpu_env, fp0, fp1, fp2);
> +    gen_store_fpr64(fp3, a->fd);

I think you might as well pass in the float_muladd_* constant to a single helper rather 
than having 4 different helpers.


r~

