Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402DD3780D3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:07:45 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2pD-0006GC-Bj
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg2hx-0006m5-NY
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lg2hs-00009l-2n
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620640806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LP/UxqtZg4lBUjcrVcWr800Kl2bWKnPY1npxhHpO4x8=;
 b=BIthLEjIMoO+NiBoNppbXg0q727iFUYkGCjLBsc/PKCyltl0PjXmWi9SJT9AeuOOt14q1g
 T4dcFTlAvAqnMjHCnAdipg+DMbdXJ+iPnppghqnDI0VRxBS73nDPPKkoXAQmmRHmn7ktiB
 bHznmU4nUbELTSC8sQBklzvdXO0jWCY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-D48UBL3ePLSedAeUcyD_Mw-1; Mon, 10 May 2021 06:00:05 -0400
X-MC-Unique: D48UBL3ePLSedAeUcyD_Mw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p19-20020adfc3930000b029010e10128a04so7224768wrf.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 03:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LP/UxqtZg4lBUjcrVcWr800Kl2bWKnPY1npxhHpO4x8=;
 b=aJQcmW0+bs3uShBn2KW7CO8aHtR7z5Hy4Osul/sxiBy2wWvAej9wYd3ak8qgR3FbDa
 qz0JIU4uYMim13hzwjmK+3YbbuYquSaaUaRWbzbFN7lFXkg446Iqf50zHSdIYKZjKA8n
 OM4IAmXHBsVmrP5D/bJcoV73e06+X4ic5iZs3iAP68mqI3J1Sf2MDLjKKYQ3pLQQCKsO
 443tE6tai1ceYhORRvhYzjpuqUJQR7WDPgX4si4hF/5qQDlvjeMpxxTtrmtA/9XtvvMX
 4M2gFDfihgx33uyoyoFQ/+I9KavZHCHW5rOyyl7n4PNLWLfozUqdfEyCWWc1LPIIZGju
 o6Cw==
X-Gm-Message-State: AOAM531PJy4gr2x5ceNz6N8QfsGaIQKKPbsOo1wpQQ5A2spwT07dvtYN
 3TT2U1EfsnCQrJ+nIQgPrV3qawCkQNdM8iGwz3PLYscPQRe5//jIhLf6StgbiGE4Bcwkh+RcdFS
 zsg6uVlEJYWf6GMM=
X-Received: by 2002:a5d:5989:: with SMTP id n9mr29312359wri.60.1620640804020; 
 Mon, 10 May 2021 03:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJk0ypBRG6LLJmZrI8gnfAtCKfuj3jktXurzUP+7Pc0UOBZsGL2II//QTigo8T6WnwVctvjw==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr29312336wri.60.1620640803812; 
 Mon, 10 May 2021 03:00:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676a.dip0.t-ipconnect.de. [91.12.103.106])
 by smtp.gmail.com with ESMTPSA id l12sm25138560wrq.36.2021.05.10.03.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 03:00:03 -0700 (PDT)
Subject: Re: [PATCH v1 01/20] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-2-david@redhat.com> <87o8lnnt3m.fsf@linaro.org>
 <1294d810-64a7-7e4d-fb73-238378e2197c@redhat.com> <87a6x6nl3q.fsf@linaro.org>
 <8ba9536d-dec1-54a2-d3e1-157beff16502@redhat.com> <87sg2uyknl.fsf@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5f43bced-2624-9bee-5c92-bd655c1b8410@redhat.com>
Date: Mon, 10 May 2021 12:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87sg2uyknl.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.05.21 11:57, Alex Bennée wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 01.10.20 15:15, Alex Bennée wrote:
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> On 30.09.20 18:10, Alex Bennée wrote:
>>>>>
>>>>> David Hildenbrand <david@redhat.com> writes:
>>>>>
>>>>>> Implementation inspired by minmax_floats(). Unfortuantely, we don't have
>>>>>> any tests we can simply adjust/unlock.
>>>>>>
>>>>>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>>> ---
>>>>>>    fpu/softfloat.c         | 100 ++++++++++++++++++++++++++++++++++++++++
>>>>>>    include/fpu/softfloat.h |   6 +++
>>>>>>    2 files changed, 106 insertions(+)
>>>>>>
>>>>>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>>>>>> index 9af75b9146..9463c5ea56 100644
>>>>>> --- a/fpu/softfloat.c
>>>>>> +++ b/fpu/softfloat.c
>>>>>> @@ -621,6 +621,8 @@ static inline FloatParts float64_unpack_raw(float64 f)
>>>>>>        return unpack_raw(float64_params, f);
>>>>>>    }
>>>>>>    +static void float128_unpack(FloatParts128 *p, float128 a,
>>>>>> float_status *status);
>>>>>> +
>>>>>>    /* Pack a float from parts, but do not canonicalize.  */
>>>>>>    static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
>>>>>>    {
>>>>>> @@ -3180,6 +3182,89 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
>>>>>>        }
>>>>>>    }
>>>>>
>>>>> It would be desirable to share as much logic for this as possible with
>>>>> the existing minmax_floats code. I appreciate at some point we end up
>>>>> having to deal with fractions and we haven't found a good way to
>>>>> efficiently handle dealing with FloatParts and FloatParts128 in the same
>>>>> unrolled code, however:
>>>>>
>>>>>>    +static float128 float128_minmax(float128 a, float128 b, bool
>>>>>> ismin, bool ieee,
>>>>>> +                                bool ismag, float_status *s)
>>>>>> +{
>>>>>> +    FloatParts128 pa, pb;
>>>>>> +    int a_exp, b_exp;
>>>>>> +    bool a_less;
>>>>>> +
>>>>>> +    float128_unpack(&pa, a, s);
>>>>>> +    float128_unpack(&pb, b, s);
>>>>>> +
>>>>>
>>>>>   From here:
>>>>>> +    if (unlikely(is_nan(pa.cls) || is_nan(pb.cls))) {
>>>>>> +        /* See comment in minmax_floats() */
>>>>>> +        if (ieee && !is_snan(pa.cls) && !is_snan(pb.cls)) {
>>>>>> +            if (is_nan(pa.cls) && !is_nan(pb.cls)) {
>>>>>> +                return b;
>>>>>> +            } else if (is_nan(pb.cls) && !is_nan(pa.cls)) {
>>>>>> +                return a;
>>>>>> +            }
>>>>>> +        }
>>>>>> +
>>>>>> +        /* Similar logic to pick_nan(), avoiding re-packing. */
>>>>>> +        if (is_snan(pa.cls) || is_snan(pb.cls)) {
>>>>>> +            s->float_exception_flags |= float_flag_invalid;
>>>>>> +        }
>>>>>> +        if (s->default_nan_mode) {
>>>>>> +            return float128_default_nan(s);
>>>>>> +        }
>>>>>
>>>>> to here is common logic - is there anyway we could share it?
>>>>
>>>> I can try to factor it out, similar to pickNaN() - passing weird boolean
>>>> flags and such. It most certainly won't win in a beauty contest, that's
>>>> for sure.
>>>>>
>>>>> Likewise I wonder if there is scope for a float_minmax_exp helper that
>>>>> could be shared here?
>>>>
>>>> I'll try, but I have the feeling that it might make the code harder to
>>>> read than actually help. Will give it a try.
>>> Give it a try - if it really does become harder to follow then we'll
>>> stick with the duplication however if we can have common code you'll
>>> know at least the nan handling and minmax behaviour for float128 will be
>>> partially tested by the 16/32/64 float code.
>>
>> (finally had time to look into this)
>>
>> What about something like this:
>>
> 
> I was just about to look this morning but I see Richard has posted his
> mega series:
> 
>    From: Richard Henderson <richard.henderson@linaro.org>
>    Subject: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
>    Date: Fri,  7 May 2021 18:46:50 -0700
>    Message-Id: <20210508014802.892561-1-richard.henderson@linaro.org>
> 
> which I think also includes the
> float128_(min|minnum|minnummag|max|maxnum|maxnummag) functions. I'm
> going to have a look at that first if that's ok.

Sure, I have the gut feeling that it follows a similar approach :)


-- 
Thanks,

David / dhildenb


