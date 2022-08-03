Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62558901A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:23:27 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJH9a-0005Lx-6E
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJH5K-000701-HG
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:19:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJH5H-0007lz-Mv
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:19:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id g12so16921899pfb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TQVcbEey4gWBO9GO3XmyFZLKYrTau9i/2zXePdjIArI=;
 b=KITBgG5Ae2bcYtiVeF3RH/DWkjXDZ8xizlc/nS5h5ay3OpNg7cmwg27O7W1x2HiV+9
 AoZ+ikjeTHgkmRbSbwhcW8VcAEPrJc3bzzS2zaf3AVTxRaJU0e03Wjdpt/kOCJdjpDzS
 CBw9xP7IwFm4vfRJxRwho61s5CUwBtuuk6ozqNflJD61BAlO+zarh4FdjAk1QRN2IeFh
 fNbWXmK+zyUOQHiUnFhvN8/KkI8oC0N2hebWU2rFkfs6gpRyrgYWF22MWCXDV6ijoNSb
 JywwpCuOIg0caNQAHE52BVjzlOqV/KREixnxgB5vj7cAogi4LdifXsBWwBihOZ5QFM23
 HEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TQVcbEey4gWBO9GO3XmyFZLKYrTau9i/2zXePdjIArI=;
 b=yr8A5YZxvXOJx7FmPZCDTiCqr0Qbojz45OhzVv1d8LD/Tn8pTWZCvl3vEYokSncM9A
 xTzo/u4sxc3iFVrZ/COtASMJTBrHZCARybhEpMml0xP5zAAwZeTPMBlY8OW8Jya5ZJKN
 iyafxDQ4eJkq48kly4D95bLh/LGl4+sS6p/HuQ9Kgd9Y/Y8tWwymzg8/tvpqopB+0vQl
 N3MoiknSfG3Ln4YXg8mIRl325dUT1LI2zt/erK9E112J+yIpWU/cqua0cbD0qQbOHMEz
 9cNcqq9SugIi8sWYsOaLHeI9WWYuN9443bsGF2YzaYRp5uXsEoSfLYCFph20lfjpt8/O
 Q/DQ==
X-Gm-Message-State: ACgBeo35yy/e3uhzGSbMy09SFQmIMMyeqxxcsTOwzgtMRfQZD9cP/kgg
 rGF6fnnxGifmEwOKEMAUYC3y7g==
X-Google-Smtp-Source: AA6agR5u32NRt/9Hbyid8EMo4bxffX+cjiC72J2PBHC2fKobBAMZ1qGUdXlSlwBw/3uIN9ZiG+MoOw==
X-Received: by 2002:a63:8b4c:0:b0:41c:4981:6162 with SMTP id
 j73-20020a638b4c000000b0041c49816162mr9567815pge.150.1659543537808; 
 Wed, 03 Aug 2022 09:18:57 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:74df:dfaf:5af0:e528?
 ([2602:ae:154e:e201:74df:dfaf:5af0:e528])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a17090a5d8c00b001f200eabc65sm1787102pji.41.2022.08.03.09.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 09:18:56 -0700 (PDT)
Message-ID: <855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org>
Date: Wed, 3 Aug 2022 09:18:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/3] target/ppc: Bugfix fadd/fsub result with OE/UE set
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
 <20220803122217.20847-2-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220803122217.20847-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/3/22 05:22, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> As mentioned in the functions float_overflow_excp and
> float_underflow_excp, the result should be adjusted as mentioned in the
> ISA (subtracted 192/1536 from the exponent of the intermediate result if
> an overflow occurs with OE set and added 192/1536 to the exponent of the
> intermediate result if an underflow occurs with UE set), but at those
> functions the result has already been rounded so it is not possible to
> add/subtract from the intermediate result anymore.
>   
> This patch creates a new function that receives the value that should be
> subtracted/added from the exponent if an overflow/underflow happens, to
> not leave some arbitrary numbers from the PowerISA in the middle of the
> FPU code. If these numbers are 0 the new functions just call the old
> ones.
> 
> I used 2 values here for overflow and underflow, maybe it'd be better to
> just use the same ones, any thoughts?
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> An alternative I've thought was to always return the value adjusted if a
> overflow or underflow occurs and in float_underflow_excp and
> float_overflow_excp adjust it to inf/den/0 if OE/UE is 0, but I didn't
> saw many advantages to that approach.
> ---
>   fpu/softfloat.c         | 75 +++++++++++++++++++++++++++++++++++++++++
>   include/fpu/softfloat.h |  2 ++
>   target/ppc/fpu_helper.c | 10 ++++--
>   3 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 4a871ef2a1..a407129dcb 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -268,6 +268,8 @@ typedef bool (*f64_check_fn)(union_float64 a, union_float64 b);
>   
>   typedef float32 (*soft_f32_op2_fn)(float32 a, float32 b, float_status *s);
>   typedef float64 (*soft_f64_op2_fn)(float64 a, float64 b, float_status *s);
> +typedef float64 (*soft_f64_op2_int2_fn)(float64 a, float64 b, int c, int d,
> +                                        float_status *s);
>   typedef float   (*hard_f32_op2_fn)(float a, float b);
>   typedef double  (*hard_f64_op2_fn)(double a, double b);
>   
> @@ -401,6 +403,19 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
>       return soft(ua.s, ub.s, s);
>   }
>   
> +static inline float64
> +float64_gen2_excp(float64 xa, float64 xb, int xc, int xd, float_status *s,
> +                  hard_f64_op2_fn hard, soft_f64_op2_fn soft,
> +                  soft_f64_op2_int2_fn soft_excp, f64_check_fn pre,
> +                  f64_check_fn post)
> +{
> +    if (xc || xd) {
> +        return soft_excp(xa, xb, xc, xd, s);
> +    } else {
> +        return float64_gen2(xa, xb, s, hard, soft, pre, post);
> +    }
> +}
> +
>   /*
>    * Classify a floating point number. Everything above float_class_qnan
>    * is a NaN so cls >= float_class_qnan is any NaN.
> @@ -1929,6 +1944,39 @@ static double hard_f64_sub(double a, double b)
>       return a - b;
>   }
>   
> +static float64 QEMU_SOFTFLOAT_ATTR
> +soft_f64_addsub_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
> +                        float_status *status, bool subtract)
> +{
> +    FloatParts64 pa, pb, *pr;
> +
> +    float64_unpack_canonical(&pa, a, status);
> +    float64_unpack_canonical(&pb, b, status);
> +    pr = parts_addsub(&pa, &pb, status, subtract);
> +
> +    if (unlikely(oe_sub && (pr->exp > 1023))) {
> +        pr->exp -= oe_sub;
> +        float_raise(float_flag_overflow, status);
> +    } else if (unlikely(ue_sum && (pr->exp < -1022))) {
> +        pr->exp += ue_sum;
> +        float_raise(float_flag_underflow, status);
> +    }
> +
> +    return float64_round_pack_canonical(pr, status);

This is incorrect, because the exponent is not fixed until the middle of round_pack_canonical.

I think you should not add new functions like this, with new parameters, but instead add 
fields to float_status, which would then be checked at the places currently setting 
underflow and overflow.


r~

