Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F73D33F4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:14:46 +0200 (CEST)
Received: from localhost ([::1]:33966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6nWH-0007pS-OQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6nUb-000629-R2
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:13:01 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6nUa-0005AK-4a
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:13:01 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j17-20020a17090aeb11b029017613554465so2239631pjz.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 22:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N3PHkCrd8XCqkd/IGMAYs0REJxMcjsCFgqFy2cmHVL8=;
 b=Fp/IRoUDR3ZydjZgM0qib0Qnhr4rgVlB3clTuSySlz/jB6TzC2Lw20V+CzvaYFgRjb
 YLOoaShdkgvjvIW8RHU+zA3R92xujYeKtm6BDWWtRdlgf3Y8WvWXa2/knghRype5IGgK
 nxA8+oJdxnEoiDpM6dX9OeF5W9FO7CGlASZMeceZIMBOTgu2CQmiy9OWvOR8TGXU3cTW
 saxnFxL2J8tBz0msY5eFLxElOBuZw24r4ij85zW4+zDDVW0+LsWog9Gqp9UpNCi4o2lK
 ZUzFLQx/6MhoNi1ES98zdhbB/fvDrvxrhgxQQdFruHm+xX2hXZrvYC1rBqRGYmuPDHL/
 GNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N3PHkCrd8XCqkd/IGMAYs0REJxMcjsCFgqFy2cmHVL8=;
 b=C9ozgA9hzywWYv7Zv/nA9yufbN9/HJkdO8MtjQ6KWpym+DL5H+FE6YRd3QPt5q9lFw
 BIffXEpWlQ2eGlvpQytujRpXx+62InDfFOKo5bLbZ3+yd/Nzp+UTGrKbykwop54uuupS
 imF/UIFODhM8z+jV97i46Zo3CYg7KwmHi7o608EE4K5URGunRkQE6qV5wP6bG3yhfBJ8
 p1HZ1SaBUg2sjDqdvagQdF9FjxkURjKW5oAm1CjdjNkX4j6MlnauNeIMW7JlrqAL8amM
 Dm/PBCXQlXxpBLe9QM5K7CBi3BKztsvKHHV43W1gapMlvb8rW+ruNK22pEoVF2msZ4Dq
 QN/g==
X-Gm-Message-State: AOAM533mLYfMGA+WGTWDwikfmi/Osw602FzUkfME0DJaXQZJL+D0o1V8
 +XmqXNL3I+Cs+ogRDON+quKMDA==
X-Google-Smtp-Source: ABdhPJytMLt1rFNOGSYxcRhLynGBLSzHiB8YfNGlDCt848KofkwhHWD94ayFd9UGUUgAhR+D/g8Wyw==
X-Received: by 2002:a63:e350:: with SMTP id o16mr3335507pgj.98.1627017178327; 
 Thu, 22 Jul 2021 22:12:58 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v25sm31491042pfm.202.2021.07.22.22.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 22:12:57 -0700 (PDT)
Subject: Re: [PATCH v2 12/22] target/loongarch: Add fixed point extra
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
Date: Thu, 22 Jul 2021 19:12:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
> +target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
> +{
> +    target_ulong r = 0;
> +
> +    switch (rj) {
> +    case 0:
> +        r = env->CSR_MCSR0 & 0xffffffff;
> +        break;
> +    case 1:
> +        r = (env->CSR_MCSR0 & 0xffffffff00000000) >> 32;
> +        break;

Why do you represent all of these as high and low portions of a 64-bit internal value, 
when the manual describes them as 32-bit values?


> +/* Fixed point extra instruction translation */
> +static bool trans_crc_w_b_w(DisasContext *ctx, arg_crc_w_b_w *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv_i32 tsz = tcg_const_i32(1 << 1);

This size is wrong.  It should be 1, not 1 << 1 (2).


> +static bool trans_crc_w_w_w(DisasContext *ctx, arg_crc_w_w_w *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv_i32 tsz = tcg_const_i32(1 << 4);

Because this size most certainly should not be 16...

> +static bool trans_crc_w_d_w(DisasContext *ctx, arg_crc_w_d_w *a)
> +{
> +    TCGv t0, t1;
> +    TCGv Rd = cpu_gpr[a->rd];
> +    TCGv_i32 tsz = tcg_const_i32(1 << 8);

... and this size should not be 256.  Both well larger than the 8 byte buffer that you've 
allocated.

Also, you need a helper so that you don't have 8 copies of this code.

> +static bool trans_asrtle_d(DisasContext *ctx, arg_asrtle_d * a)
> +{
> +    TCGv t0, t1;
> +
> +    t0 = get_gpr(a->rj);
> +    t1 = get_gpr(a->rk);
> +
> +    gen_helper_asrtle_d(cpu_env, t0, t1);
> +
> +    return true;
> +}
> +
> +static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
> +{
> +    TCGv t0, t1;
> +
> +    t0 = get_gpr(a->rj);
> +    t1 = get_gpr(a->rk);
> +
> +    gen_helper_asrtgt_d(cpu_env, t0, t1);
> +
> +    return true;
> +}

I'm not sure why both of these instructions are in the ISA, since

   ASRTLE X,Y <-> ASRTGT Y,X

but we certainly don't need two different helpers.
Just swap the arguments for one of them.

> +static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
> +{
> +    /* Nop */
> +    return true;
> +}
> +
> +static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
> +{
> +    /* Nop */
> +    return true;
> +}
> +
> +static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
> +{
> +    /* Nop */
> +    return true;
> +}

If you don't want to implement these right now, you should at least initialize the 
destination register to 0, or something.


r~

