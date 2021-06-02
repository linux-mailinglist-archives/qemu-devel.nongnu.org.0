Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92193985B1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:52:11 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNXm-00066e-Ee
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1loNWT-0004s2-Cp
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1loNWR-0000Fa-HS
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxofdCqTCvUdvPVtaUt+qNHj6Tdv5uZ3+1Qup8Ih6Xs=;
 b=OX9S2R3IOfDQXRBDxsdLKUGmrycfO9igm+29l7R5V3EQNjafbSDBkqGBxZE7J7admyP6FB
 NI+8SPrsxEoDd2IMGuuZ/VY5dx8DMmWOGHXh3l4PwkyfBiUGUoBbjHa51YUZkNCmGBQREK
 3SHq73KINLiwu/REL1vuVXnLqbReXrA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-8SAP7cN3NwGkh6cNp9b2Lg-1; Wed, 02 Jun 2021 05:50:42 -0400
X-MC-Unique: 8SAP7cN3NwGkh6cNp9b2Lg-1
Received: by mail-wr1-f72.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so797077wri.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bxofdCqTCvUdvPVtaUt+qNHj6Tdv5uZ3+1Qup8Ih6Xs=;
 b=M63k4PUTxssApp51kkKM1PxNDwRduMTr/L+e0jyuvem+vylqD3pCKShlDaTMq9slCe
 dAtnKRHJ1d4PAZnQSrOeesbR3sqUKEtAbeA6ZD7GyUBBVqfu7y28W/zH4axJ+mODv1qs
 G/LoGTEp10u6YwNKrFpyirFI+n0cLOwffrnn6MrsNe/S9sYRHB8bUnaZu7zMATBMT2Fh
 gquT7FshZvh5ghVThAQ7SoVFi3t4c6IjbzNQeXa5reOFx+pYbQl+LFJyZ7IsxlZF/0zZ
 /HLlNAI6fI+/6hQTZTQP7oZx/f4zZKiws0EXShQPpGHqM64YoeMs1S1BdB6j3WHBjP1l
 ulMA==
X-Gm-Message-State: AOAM530uUzhcfJfzVMYBENba9xPbt6jZQW808b0mEYFguGWVPVapVQsE
 jINPY3jkBkvorCgf/x56bv+wl4NJOpu878mnk61I8Ax45VzCeFa7nyaM36uwQ7TXeyxThf+YpRs
 BxKivoiczPsQ6+Uw=
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr10593220wmm.156.1622627441848; 
 Wed, 02 Jun 2021 02:50:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdB0uaI1ASu4i3NitY48xojgaEVFvR3B5gVVO5AmSnVxFDBppwzjkBcRH5W+myNI3mQCD7Jg==
X-Received: by 2002:a05:600c:c9:: with SMTP id
 u9mr10593197wmm.156.1622627441601; 
 Wed, 02 Jun 2021 02:50:41 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6b6d.dip0.t-ipconnect.de. [91.12.107.109])
 by smtp.gmail.com with ESMTPSA id 62sm6480737wrm.1.2021.06.02.02.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 02:50:41 -0700 (PDT)
Subject: Re: [PATCH v2 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-2-david@redhat.com>
 <731bc385-463c-47e5-0841-f9bed4b48933@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <87dbbb72-e6e7-3904-ea9e-4bd17905b3f2@redhat.com>
Date: Wed, 2 Jun 2021 11:50:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <731bc385-463c-47e5-0841-f9bed4b48933@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.06.21 23:27, Richard Henderson wrote:
> On 5/17/21 7:27 AM, David Hildenbrand wrote:
>> @@ -634,6 +664,9 @@ uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
>>   
>>       s390_restore_bfp_rounding_mode(env, old_mode);
>>       handle_exceptions(env, xxc_from_m34(m34), GETPC());
>> +    if (float128_is_any_nan(make_float128(h, l))) {
>> +        return 0;
>> +    }
> 
> I wonder if handle_exceptions should return s390_exc.
> Then you can test
> 
>     exc = handle_exceptions(...);
>     if (unlikely(exc & S390_IEEE_MASK_INVALID)) {
>       ret = 0;
>     }
>     return ret;
> 

I'll give it a thought if that makes things easier.

> 
> 
>> +++ b/target/s390x/vec_fpu_helper.c
>> @@ -326,6 +326,9 @@ void HELPER(gvec_vcdlg64s)(void *v1, const void *v2, CPUS390XState *env,
>>    
>>    static uint64_t vcgd64(uint64_t a, float_status *s)
>>    {
>> +    if (float64_is_any_nan(a)) {
>> +        return INT64_MIN;
>> +    }
>>        return float64_to_int64(a, s);
>>    }
>>    
>> @@ -349,6 +352,9 @@ void HELPER(gvec_vcgd64s)(void *v1, const void *v2, CPUS390XState *env,
>>    
>>    static uint64_t vclgd64(uint64_t a, float_status *s)
>>    {
>> +    if (float64_is_any_nan(a)) {
>> +        return 0;
>> +    }
>>        return float64_to_uint64(a, s);
>>    }
> 
> You do still need to raise invalid, as far as I can see.

Good point, so maybe


uint64_t ret = float64_to_uint64(a, s);

/* Note: check after converting to properly raise exceptions. */
if (float64_is_any_nan(a)) {
	ret = 0;
}
return ret;


to minimize manual handling?

-- 
Thanks,

David / dhildenb


