Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1B579413
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:24:33 +0200 (CEST)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhaq-0008RJ-Ji
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhPk-0001Dg-B5
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:13:04 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:37427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhPh-0004BR-SS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:13:03 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id m10so6577746qvu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k6NwZkNZ1yyC0Eb4qyamBsEkLhKpjP59azMuYa/GwV8=;
 b=NKeA/187Gz1H6hi8FIvG3Cl8QNfp+r92acp9U86yDZJq5tat7nSW0mwofpdcZuoc89
 461Lgkd8kgYzbLOU96FNJsbhg16QhOjJ0nzqRg6AwVaLQjLd6TzIu8JoveDRJhL/E9wg
 rUl0pXrZSyr0BZBPrMlHPNW4vVavaO3wspNek2lL7CkHcl3XjQ8eg7DADVmMIEYZ7Cz2
 UkD7a2p0QcXEWb153+HAOZog8IlOiX1pATRrySt5YK2dxmwUausfdhM1JYF3DvX8i0Nh
 DIxbZBInKQzVXCTYR6UvJFbpq1sq9+eJYofDwJ7jZUtQsqua+d+i2KGiU64lZdvMTTI9
 4oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k6NwZkNZ1yyC0Eb4qyamBsEkLhKpjP59azMuYa/GwV8=;
 b=pfnpJ2W/IjLAFCfaH6+GO+df9U75TLXCiBqR14U0e6iFaXUX93ymNXddrs4fyVTLvh
 j9xblt7YQkAjCKGbPvOoU2LT6fsXWMYTK7WYf/8v87fDCDLMZVbY4pyJ2lEzvXpcdbME
 SSQ649zZpJH/lFfvIujtM4zi1D6f50Feltqlo08yCw6+P0PDbtEBeIJyb95RoZuthVnS
 kOGlRWplTtkFnGRpgfWHHR3O6xVHGZgRPeMlxMrsYHlLFqe5xDEIPYqthibZ7ycp4nK6
 v9VqxY+jZGCYTTwYzdztefNAvCKbKSIbpkaco/dMSBwWUOSPA1bEWbIt4qYKpch30EBN
 J6OA==
X-Gm-Message-State: AJIora+AU3elP+wnutZZP3+47S4WT6j8DR1WYYKjybrKatO/wEWeAukF
 TvGn+SUbKoFxWUlkde30iHubRA==
X-Google-Smtp-Source: AGRyM1tZu/hecuRe7CKjjuMYgv3/0u05NIfJ5Xzv/IkRmtYt8KAvtSsaiIHFz0B/yUXrW6PMqIgaEA==
X-Received: by 2002:a05:6214:762:b0:473:7fa0:61eb with SMTP id
 f2-20020a056214076200b004737fa061ebmr23995902qvz.100.1658214780749; 
 Tue, 19 Jul 2022 00:13:00 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 k10-20020ac8474a000000b00304bc2acc25sm10307985qtp.6.2022.07.19.00.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:13:00 -0700 (PDT)
Message-ID: <00a72795-ced5-5e0f-bf0b-5a5056540589@linaro.org>
Date: Tue, 19 Jul 2022 12:42:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/8] target/loongarch: Fix float_convd/float_convs test
 failing
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220716085426.3098060-1-gaosong@loongson.cn>
 <20220716085426.3098060-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220716085426.3098060-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/22 14:24, Song Gao wrote:
> We should result zero when exception is invalid and operation is nan
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/fpu_helper.c | 143 +++++++++++++++++++---------------
>   1 file changed, 80 insertions(+), 63 deletions(-)
> 
> diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
> index 3d0cb8dd0d..bd76529219 100644
> --- a/target/loongarch/fpu_helper.c
> +++ b/target/loongarch/fpu_helper.c
> @@ -13,9 +13,6 @@
>   #include "fpu/softfloat.h"
>   #include "internals.h"
>   
> -#define FLOAT_TO_INT32_OVERFLOW 0x7fffffff
> -#define FLOAT_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
> -
>   static inline uint64_t nanbox_s(float32 fp)
>   {
>       return fp | MAKE_64BIT_MASK(32, 32);
> @@ -544,9 +541,10 @@ uint64_t helper_ftintrm_l_d(CPULoongArchState *env, uint64_t fj)
>       fd = float64_to_int64(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }

The check for invalid is sufficient, the check for nan should be redundant with that.


r~

>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -561,9 +559,10 @@ uint64_t helper_ftintrm_l_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int64((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -578,9 +577,10 @@ uint64_t helper_ftintrm_w_d(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -595,9 +595,10 @@ uint64_t helper_ftintrm_w_s(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -612,9 +613,10 @@ uint64_t helper_ftintrp_l_d(CPULoongArchState *env, uint64_t fj)
>       fd = float64_to_int64(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -629,9 +631,10 @@ uint64_t helper_ftintrp_l_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int64((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -646,9 +649,10 @@ uint64_t helper_ftintrp_w_d(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -663,9 +667,10 @@ uint64_t helper_ftintrp_w_s(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -679,9 +684,10 @@ uint64_t helper_ftintrz_l_d(CPULoongArchState *env, uint64_t fj)
>       fd = float64_to_int64_round_to_zero(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -695,9 +701,10 @@ uint64_t helper_ftintrz_l_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int64_round_to_zero((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -711,9 +718,10 @@ uint64_t helper_ftintrz_w_d(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float64_to_int32_round_to_zero(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -727,9 +735,10 @@ uint64_t helper_ftintrz_w_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int32_round_to_zero((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return (uint64_t)fd;
> @@ -744,9 +753,10 @@ uint64_t helper_ftintrne_l_d(CPULoongArchState *env, uint64_t fj)
>       fd = float64_to_int64(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -761,9 +771,10 @@ uint64_t helper_ftintrne_l_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int64((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -778,9 +789,10 @@ uint64_t helper_ftintrne_w_d(CPULoongArchState *env, uint64_t fj)
>       fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -795,9 +807,10 @@ uint64_t helper_ftintrne_w_s(CPULoongArchState *env, uint64_t fj)
>       fd = float32_to_int32((uint32_t)fj, &env->fp_status);
>       set_float_rounding_mode(old_mode, &env->fp_status);
>   
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return (uint64_t)fd;
> @@ -808,9 +821,10 @@ uint64_t helper_ftint_l_d(CPULoongArchState *env, uint64_t fj)
>       uint64_t fd;
>   
>       fd = float64_to_int64(fj, &env->fp_status);
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -821,9 +835,10 @@ uint64_t helper_ftint_l_s(CPULoongArchState *env, uint64_t fj)
>       uint64_t fd;
>   
>       fd = float32_to_int64((uint32_t)fj, &env->fp_status);
> -    if (get_float_exception_flags(&env->fp_status) &
> -        (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT64_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -834,9 +849,10 @@ uint64_t helper_ftint_w_s(CPULoongArchState *env, uint64_t fj)
>       uint64_t fd;
>   
>       fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
> -    if (get_float_exception_flags(&env->fp_status)
> -        & (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float32_is_any_nan((uint32_t)fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;
> @@ -847,9 +863,10 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
>       uint64_t fd;
>   
>       fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
> -    if (get_float_exception_flags(&env->fp_status)
> -        & (float_flag_invalid | float_flag_overflow)) {
> -        fd = FLOAT_TO_INT32_OVERFLOW;
> +    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
> +        if (float64_is_any_nan(fj)) {
> +            fd = 0;
> +        }
>       }
>       update_fcsr0(env, GETPC());
>       return fd;


