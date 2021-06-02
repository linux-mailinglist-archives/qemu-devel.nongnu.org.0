Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B93995DD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 00:24:22 +0200 (CEST)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loZHh-0004QB-E3
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 18:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZGu-0003l8-MD
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:23:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZGt-0008TK-1W
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:23:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 jz2-20020a17090b14c2b0290162cf0b5a35so4270181pjb.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 15:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hSnKl061itBsf2eC/ma8y+gN9BmWreDWa4dVOeJy+GA=;
 b=EazGj/42mFGDKgmgHsTqOUh2cYybi3M9RtE+dF6b1tC2niRsSRrFDQ6ipahZEUUmaj
 3x4gStLSnxkukbt8OQoWPhsp7tDs6wAn6okOFCQqTKjWkQoPrubA/rqOn7z9kgENIvkm
 ejPpZMNkoBynEYwWIzspdzP0lb47caSCnXgQdE8ZARoSHAXre0qXE/llN2RegTHqSdnT
 UeIrhlx+aPEh9Eha0HqnmalhR8Mk7SooNhPgRu88QdczhaI+fmIerF+hkWspSR98y9jw
 8LbPdF41G+Q4mNTe6aMpPjL6E7rjuwLndPO11Q2eapDJ4J5XPl+88vswg0mVhl9RLDzB
 SKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSnKl061itBsf2eC/ma8y+gN9BmWreDWa4dVOeJy+GA=;
 b=a4tZol3pxwKzTx8leBCvPaslg/Fowk1ePsY8s+WUNdUVRAPExkVib1ATzmo1Cfv0mz
 OPlf3GrBzGWzREL8Cb896oBOXuQuWscNQUtN3NDpac1PKmz/Nhrbwysz1GqmAIQo9viz
 GcP/TqLlUngCTn1+qO5Rn6LahZEIiDA0NT8HMdFlSd6Pp4yYt9rsyxe//7Me9h+1/BGV
 qWiZVavkVdPxjL2kWj3dwchDYdLsnVW8TM9vq9a1zkV7t1HRSi/iPVu0ogOd559++hIw
 n1Hh/EeF5bc3V7Ve710Wk7qS+2Z+9qGOTJXwRKsffhb/ugDMVjM79y3LqYu4VS7XvfiW
 hcsQ==
X-Gm-Message-State: AOAM5302jHN16BdENd35+6OPrfJkRaVNevCeUCNGWHhIwnkDqKtHnGly
 hnNBql3zUmBBLLCyMGq7zCY0Ow==
X-Google-Smtp-Source: ABdhPJynclRseCYbmFPOnPU7AqbzOYXsS5HuFnz5/ethfm8T7TMJwU88ml3N/QQVZ3eQyHcBA3nWNw==
X-Received: by 2002:a17:90b:1113:: with SMTP id
 gi19mr7552649pjb.96.1622672609336; 
 Wed, 02 Jun 2021 15:23:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r16sm492396pfq.140.2021.06.02.15.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 15:23:29 -0700 (PDT)
Subject: Re: [PATCH v2 04/28] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-5-richard.henderson@linaro.org>
 <87wnrc9f3c.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed6ad6ba-838f-9b67-fd8b-81a6dad0351d@linaro.org>
Date: Wed, 2 Jun 2021 15:23:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnrc9f3c.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 1:36 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask,
>> return a tri-state value to indicate nan vs unchanged operand.
>> Introduce ftype_minmax functions as a common optimization point.
>> Fold bfloat16 expansions into the same macro as the other types.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> <snip>
>> -        switch (a.cls) {
>> -        case float_class_normal:
>> -            a_exp = a.exp;
>> -            break;
>> -        case float_class_inf:
>> -            a_exp = INT_MAX;
>> -            break;
>> -        case float_class_zero:
>> -            a_exp = INT_MIN;
>> -            break;
>> -        default:
>> -            g_assert_not_reached();
>> -            break;
>> -        }
>> -        switch (b.cls) {
>> -        case float_class_normal:
>> -            b_exp = b.exp;
>> -            break;
>> -        case float_class_inf:
>> -            b_exp = INT_MAX;
>> -            break;
>> -        case float_class_zero:
>> -            b_exp = INT_MIN;
>> -            break;
>> -        default:
>> -            g_assert_not_reached();
>> -            break;
>> -        }
>> -
> <snip>
>> +    if (unlikely(ab_mask != float_cmask_normal)) {
>> +        switch (a->cls) {
>> +        case float_class_normal:
>> +            break;
>> +        case float_class_inf:
>> +            a_exp = INT16_MAX;
> 
> We've gone from min/max of our internal representation to INT16_MIN/MAX
> - I guess that doesn't break until we get to Float256 but why the change?

Ah, because I've changed from "bool a_less" to "int cmp".  I subtract the two 
exponents and I don't want that subtraction to overflow.


r~

