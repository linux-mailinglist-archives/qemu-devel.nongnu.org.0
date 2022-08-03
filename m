Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3D589222
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 20:18:54 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIxI-00066o-Rs
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 14:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJIus-0004Ue-Ef
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 14:16:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJIuq-00009B-Cu
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 14:16:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id pm17so11715957pjb.3
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dVGB9P/T1FCFRFcoL24i7OVQVqlkeu1Zsy2XQhd2nRM=;
 b=j0UJKjqlyyJHlfgfhaMhMvi3NiuXaL1C7AFyUwdZzrjwi28Oeg/ZlDKcqiGVak7Ki7
 KS96+2NBDrJI4XmR5xBbdZB545jJ/tL8ebnPoBL70imVgq5gyw4VipPC0ayyO4BVtG+x
 P9o7CmgIwdtCPRe+lYOy+gOtHvJRHt3FHk4SSdwx8C8GbIIF+XLVRDrn+9771uewu/kd
 /KNrGe/KTpvYfGYW+ygl4xVxgz07IsLJjXLkMoGHOVTz3mG+AFjgxu9EN2hfMDqzr8gm
 fagohfu3fmaNnzGDI25aS8X71GDtydHK300awIkeBDcfaIACAXb8zipajFDpbBspkpM3
 o2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dVGB9P/T1FCFRFcoL24i7OVQVqlkeu1Zsy2XQhd2nRM=;
 b=MB7RFaXc11JGfSj5xmW6cR2W+CZlaavYylZHbijsPyhVAbvOCeaTfKTULAAOZ3Kl67
 A9gaXsT/y1mcY0UHs2zqatjprqsVEbCH8pPvHqiVkDMy7v5++ko/M7/T4T0+s1uTE0e4
 lpjHwJDmg1Lwtz7MtAOPbjatXoMpKvtGLJ5H1ylJqBubqtjvJPJecr12eGDrUPoOISyZ
 O+MIisXidvbFKF3KzzCLDfOV96nMLHyvJZ1QMdR15gGG3rBZkgFRVIPEyBZuzgCH1fLe
 83e8AmppPKMGBesYdvleFto61r1OdEuKJ1e5MxiXGm3bBGwy7f5jNz7tjT/EKzTmqm/b
 72xg==
X-Gm-Message-State: ACgBeo1warf57edPYSYVADGEPgt9xsWnoX7S6ndKpCBUVx1ft22vLFrU
 poyg60VEGn3wd6k+TzBW3Jy8f2kqoRObrA==
X-Google-Smtp-Source: AA6agR6M6VAVGA4UNL4aOftKkWV12qTQ6lPmTGq2M8dxLg8iMdjR7Zyru/83Uguj/fXRwm3e/AUe9Q==
X-Received: by 2002:a17:902:7c88:b0:16d:3e1e:9ee1 with SMTP id
 y8-20020a1709027c8800b0016d3e1e9ee1mr27547656pll.102.1659550578273; 
 Wed, 03 Aug 2022 11:16:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:74df:dfaf:5af0:e528?
 ([2602:ae:154e:e201:74df:dfaf:5af0:e528])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a621d07000000b0052d3ea78858sm8339537pfd.127.2022.08.03.11.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 11:16:17 -0700 (PDT)
Message-ID: <8857690e-2e0c-a67b-f654-972ac5b24e48@linaro.org>
Date: Wed, 3 Aug 2022 11:16:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 1/3] target/ppc: Bugfix fadd/fsub result with OE/UE set
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
 <20220803122217.20847-2-lucas.araujo@eldorado.org.br>
 <855034e1-2dd3-4b68-3c60-9fd2345b3b55@linaro.org>
 <077f61c4-8853-0b32-b9b2-9721bcf107cb@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <077f61c4-8853-0b32-b9b2-9721bcf107cb@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 8/3/22 10:45, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 03/08/2022 13:18, Richard Henderson wrote:
>>
>> On 8/3/22 05:22, Lucas Mateus Castro(alqotel) wrote:
>>> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
>>>
>>> As mentioned in the functions float_overflow_excp and
>>> float_underflow_excp, the result should be adjusted as mentioned in the
>>> ISA (subtracted 192/1536 from the exponent of the intermediate result if
>>> an overflow occurs with OE set and added 192/1536 to the exponent of the
>>> intermediate result if an underflow occurs with UE set), but at those
>>> functions the result has already been rounded so it is not possible to
>>> add/subtract from the intermediate result anymore.
>>>
>>> This patch creates a new function that receives the value that should be
>>> subtracted/added from the exponent if an overflow/underflow happens, to
>>> not leave some arbitrary numbers from the PowerISA in the middle of the
>>> FPU code. If these numbers are 0 the new functions just call the old
>>> ones.
>>>
>>> I used 2 values here for overflow and underflow, maybe it'd be better to
>>> just use the same ones, any thoughts?
>>>
>>> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
>>> ---
>>> An alternative I've thought was to always return the value adjusted if a
>>> overflow or underflow occurs and in float_underflow_excp and
>>> float_overflow_excp adjust it to inf/den/0 if OE/UE is 0, but I didn't
>>> saw many advantages to that approach.
>>> ---
>>>   fpu/softfloat.c         | 75 +++++++++++++++++++++++++++++++++++++++++
>>>   include/fpu/softfloat.h |  2 ++
>>>   target/ppc/fpu_helper.c | 10 ++++--
>>>   3 files changed, 85 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>>> index 4a871ef2a1..a407129dcb 100644
>>> --- a/fpu/softfloat.c
>>> +++ b/fpu/softfloat.c
>>> @@ -268,6 +268,8 @@ typedef bool (*f64_check_fn)(union_float64 a, union_float64 b);
>>>
>>>   typedef float32 (*soft_f32_op2_fn)(float32 a, float32 b, float_status *s);
>>>   typedef float64 (*soft_f64_op2_fn)(float64 a, float64 b, float_status *s);
>>> +typedef float64 (*soft_f64_op2_int2_fn)(float64 a, float64 b, int c, int d,
>>> +                                        float_status *s);
>>>   typedef float   (*hard_f32_op2_fn)(float a, float b);
>>>   typedef double  (*hard_f64_op2_fn)(double a, double b);
>>>
>>> @@ -401,6 +403,19 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
>>>       return soft(ua.s, ub.s, s);
>>>   }
>>>
>>> +static inline float64
>>> +float64_gen2_excp(float64 xa, float64 xb, int xc, int xd, float_status *s,
>>> +                  hard_f64_op2_fn hard, soft_f64_op2_fn soft,
>>> +                  soft_f64_op2_int2_fn soft_excp, f64_check_fn pre,
>>> +                  f64_check_fn post)
>>> +{
>>> +    if (xc || xd) {
>>> +        return soft_excp(xa, xb, xc, xd, s);
>>> +    } else {
>>> +        return float64_gen2(xa, xb, s, hard, soft, pre, post);
>>> +    }
>>> +}
>>> +
>>>   /*
>>>    * Classify a floating point number. Everything above float_class_qnan
>>>    * is a NaN so cls >= float_class_qnan is any NaN.
>>> @@ -1929,6 +1944,39 @@ static double hard_f64_sub(double a, double b)
>>>       return a - b;
>>>   }
>>>
>>> +static float64 QEMU_SOFTFLOAT_ATTR
>>> +soft_f64_addsub_excp_en(float64 a, float64 b, int oe_sub, int ue_sum,
>>> +                        float_status *status, bool subtract)
>>> +{
>>> +    FloatParts64 pa, pb, *pr;
>>> +
>>> +    float64_unpack_canonical(&pa, a, status);
>>> +    float64_unpack_canonical(&pb, b, status);
>>> +    pr = parts_addsub(&pa, &pb, status, subtract);
>>> +
>>> +    if (unlikely(oe_sub && (pr->exp > 1023))) {
>>> +        pr->exp -= oe_sub;
>>> +        float_raise(float_flag_overflow, status);
>>> +    } else if (unlikely(ue_sum && (pr->exp < -1022))) {
>>> +        pr->exp += ue_sum;
>>> +        float_raise(float_flag_underflow, status);
>>> +    }
>>> +
>>> +    return float64_round_pack_canonical(pr, status);
>>
>> This is incorrect, because the exponent is not fixed until the middle of 
>> round_pack_canonical.
>>
>> I think you should not add new functions like this, with new parameters, but instead add
>> fields to float_status, which would then be checked at the places currently setting
>> underflow and overflow.
> 
> So add overflow_correction and underflow_correction in 'partsN(uncanon_normal)' so that:
> 
> if (exp >= exp_max) {
>      if (overflow_correction != 0) {
>          exp -= overflow_correction;
>      }
> }
> 
> And the equivalent for underflow, or a bool ppc_overflow_enable that uses a fixed value like:
> 
> if (exp >= exp_max) {
>      if (ppc_overflow_enable) {
>          exp -= ((fmt->exp_bias + 1) + (fmt->exp_bias + 1)/2);
>      }
> }
> 
> (and the equivalent for underflow) ?

Something like that.

I would suggest pre-computing that adjustment into fmt, via FLOAT_PARAMS.
Naming is always hard, but how about exp_re_bias?

The flag(s) should not contain "ppc" in the name.  But perhaps

   s->rebias_overflow
   s->rebias_underflow


r~

