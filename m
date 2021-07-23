Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8E3D34B6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:31:21 +0200 (CEST)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oiO-0002ct-FL
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6ogL-0000iY-Jm
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:29:13 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6ogJ-0001Df-Ns
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:29:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id c11so1972099plg.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=grQaqqh9rSO0JAg8kt0VJgfAVpX6WYUf6ChemyX8yps=;
 b=rx6ds+K7tOSA9lf2u2oKNYYcyyjVuJFOJGPtBUtzjnG7yA5W9Gcmd1VlDYhKQWzTcI
 c26FssOTtXkb8Fezyf1uMf2ZLOvweOEJrT62RXhLQ0xDvgeqWdfurftbqpdz81pelBM2
 RU1Q/RwQnqF/Dt4qTvCw6f6tolT/nD4MZM/vAjk38auPbTMPA2/AOOQXBf/2K5wn0D+d
 fpeyUMx9IUbLCIcGuIVKZ5eHuvb7orJ5M30w8xa4IKYZpVrWXAcYe7QByUuEOg1omicN
 ZWcC+VcvdeBGXuz4GiaUVinLC0dCbx9rH8aOrsiewn2varB/5GYmkpn9a3IT5Zmrflcb
 NUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=grQaqqh9rSO0JAg8kt0VJgfAVpX6WYUf6ChemyX8yps=;
 b=Ot/TavTpZt0vI/NTtj9uZylxs675slzno14ShKvphNcZ3i+fO/gzLHxk66us2KEz1o
 hOJR7/YnH9/Qg2zmL3xws37LlsZWZlESGgVQY4QzSA984UYONoMAQW0qyBw40v2/re33
 aINCRgzS4yDEG1AjtHPhw0dp+9v8XehuWyvENEKxa78b6y+3KshQYw9ZSYKRpR8IR8Oj
 PnYuPSRCwqSNKk6cLCZIGyNoIa4jvKzbbWv0si0qAI4GM+qjKMriFJx3BlXFCdn9P/e/
 AmiL5JqdwR/xA3emtsDh/Lon3ynGlBN0c0JqjXXVSmp8iB25+sW29VrKLmBxqzToFvRv
 +MBw==
X-Gm-Message-State: AOAM533rb4JKJBD0jKu2yPenD92r3WRvxmY4pSgWwzFrgDdXz0q6oLpl
 frEnYzcwMSHUsJ75IRLE7Qi4ZA==
X-Google-Smtp-Source: ABdhPJy9ozw0au7Pz+jK7BWce1cu1LDll/RyChLhWmQrhk051Z0N3x2ot+5TZhNnZGCIH1NXnLyo8Q==
X-Received: by 2002:a63:5b02:: with SMTP id p2mr3519945pgb.161.1627021749896; 
 Thu, 22 Jul 2021 23:29:09 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id k189sm36567300pgk.14.2021.07.22.23.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:29:09 -0700 (PDT)
Subject: Re: [PATCH v2 16/22] target/loongarch: Add floating point move
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-17-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
Date: Thu, 22 Jul 2021 20:29:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-17-git-send-email-gaosong@loongson.cn>
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
> This patch implement floationg point move instruction translation.
> 
> This includes:
> - FMOV.{S/D}
> - FSEL
> - MOVGR2FR.{W/D}, MOVGR2FRH.W
> - MOVFR2GR.{S/D}, MOVFRH2GR.S
> - MOVGR2FCSR, MOVFCSR2GR
> - MOVFR2CF, MOVCF2FR
> - MOVGR2CF, MOVCF2GR
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c |  80 +++++++++++++
>   target/loongarch/helper.h     |   6 +
>   target/loongarch/insns.decode |  41 +++++++
>   target/loongarch/trans.inc.c  | 270 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 397 insertions(+)
> 
> diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
> index 162085a..7662715 100644
> --- a/target/loongarch/fpu_helper.c
> +++ b/target/loongarch/fpu_helper.c
> @@ -379,6 +379,11 @@ uint64_t helper_fp_logb_d(CPULoongArchState *env, uint64_t fp)
>       return fp1;
>   }
>   
> +void helper_movreg2cf(CPULoongArchState *env, uint32_t cd, target_ulong src)
> +{
> +    env->active_fpu.cf[cd & 0x7] = src & 0x1;
> +}

tcg_gen_andi_tl + tcg_gen_st8_tl.

> +target_ulong helper_fsel(CPULoongArchState *env, target_ulong fj,
> +                         target_ulong fk, uint32_t ca)
> +{
> +    if (env->active_fpu.cf[ca & 0x7]) {
> +        return fk;
> +    } else {
> +        return fj;
> +    }
> +}

tcg_gen_movcond_i64.

> +void helper_movgr2fcsr(CPULoongArchState *env, target_ulong arg1,
> +                       uint32_t fcsr)
> +{
> +    switch (fcsr) {
> +    case 0:
> +        env->active_fpu.fcsr0 = arg1;
> +        break;
> +    case 1:
> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M1) |
> +                                (env->active_fpu.fcsr0 & ~FCSR0_M1);
> +        break;
> +    case 2:
> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M2) |
> +                                (env->active_fpu.fcsr0 & ~FCSR0_M2);
> +        break;
> +    case 3:
> +        env->active_fpu.fcsr0 = (arg1 & FCSR0_M3) |
> +                                (env->active_fpu.fcsr0 & ~FCSR0_M3);
> +        break;

This is easily implemented inline, followed by a single helper call to re-load the 
rounding mode (if required by the mask).

> +    case 16:
> +        env->active_fpu.vcsr16 = arg1;
> +        break;

The documentation I have does not describe the vector stuff?

> +    default:
> +        printf("%s: warning, fcsr '%d' not supported\n", __func__, fcsr);
> +        assert(0);
> +        break;

No printfs, no assert.  This should have been caught by

> +target_ulong helper_movcf2reg(CPULoongArchState *env, uint32_t cj)
> +{
> +    return (target_ulong)env->active_fpu.cf[cj & 0x7];
> +}

tcg_gen_ld8u_tl.


r~

