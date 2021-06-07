Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E839D6B6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 10:05:39 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqAGP-00075a-Ru
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 04:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqAEy-0006Mx-Ry
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lqAEw-0000oV-Cc
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623053045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlDixlYYITAaETlQ/yB50SlyueGiW+90/9kVKM0vohM=;
 b=iVSRDvTgIW/I+gInDtbT7ItfqEJHHQsr/VvTkBDKhPl0X92swhZ0xNxPlzLII2VwkMYkrC
 jO8Jo2rSCtczY6iob9pWI0kl1Kilxn7p1wG52/K/OIyav52NTa4wZ4BM9aHPGECJ18DThx
 yyfeeBfD18vF8cRgnf5csv/FYwxbecs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-i8bvaLLkOnGtcaKEkL3mCA-1; Mon, 07 Jun 2021 04:04:03 -0400
X-MC-Unique: i8bvaLLkOnGtcaKEkL3mCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n2-20020a05600c3b82b02901aeb7a4ac06so718478wms.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 01:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nlDixlYYITAaETlQ/yB50SlyueGiW+90/9kVKM0vohM=;
 b=YRTbZtCUkRubys4SVA/O9Yb4xUrC3OcAyVXPusRwJ0r3FU7MivnZXqHWGk6JiZPR2y
 FmaRQpkCvYgNGTb9U0zONv11+n4HRe1eRdzkoti6p2RKS1NyuRCKFNoiE9IBiJDQVumC
 d3QkHgfXOK0jf851qtm0eBwb9bO11BB9NaYzoThSqPTjRScENR1Db/dGUqLvhK9xiKNY
 7eeCHT8Fs/3GczOf0V2N7lf0FH7nXIWoMCd8TTMCPl1WOqFomkyIvA67OhQHwnestnqc
 Yj0J7OVrX4Z3/q4V9A4AHgUhEpqPaIOXwmUPs8bmQFAN37JkonB9Bjt0eqHKrYw0xNHg
 elSQ==
X-Gm-Message-State: AOAM5302Rks31i2DTYIdVkoepfmk7CJDLJcgLRRcxqPWGiLcWTwpxbNj
 3Sszejnr72h1Fk9OcbzQQJB5s3dHBnpkI5ggjJq8V/dfbGdFjhCYb/6Uzc8MtwhnmtAOlamVWad
 OkyJtc12OdxAQ+tw=
X-Received: by 2002:a1c:f019:: with SMTP id a25mr16218592wmb.64.1623053041956; 
 Mon, 07 Jun 2021 01:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw35zIptACkmFE9RYSgFt/ncrdKxXNoB5vkuWv0PGLtN4N8FJ5xpmwzil4uC271gL7OVwdWgg==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr16218569wmb.64.1623053041760; 
 Mon, 07 Jun 2021 01:04:01 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6188.dip0.t-ipconnect.de. [91.12.97.136])
 by smtp.gmail.com with ESMTPSA id
 b10sm14295354wrt.24.2021.06.07.01.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 01:04:01 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210517142739.38597-1-david@redhat.com>
 <20210517142739.38597-2-david@redhat.com>
 <731bc385-463c-47e5-0841-f9bed4b48933@linaro.org>
 <87dbbb72-e6e7-3904-ea9e-4bd17905b3f2@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 01/26] s390x/tcg: Fix FP CONVERT TO (LOGICAL) FIXED NaN
 handling
Message-ID: <3135116a-65d4-efef-82c0-998c76290e9b@redhat.com>
Date: Mon, 7 Jun 2021 10:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87dbbb72-e6e7-3904-ea9e-4bd17905b3f2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.06.21 11:50, David Hildenbrand wrote:
> On 01.06.21 23:27, Richard Henderson wrote:
>> On 5/17/21 7:27 AM, David Hildenbrand wrote:
>>> @@ -634,6 +664,9 @@ uint64_t HELPER(clfxb)(CPUS390XState *env, uint64_t h, uint64_t l, uint32_t m34)
>>>    
>>>        s390_restore_bfp_rounding_mode(env, old_mode);
>>>        handle_exceptions(env, xxc_from_m34(m34), GETPC());
>>> +    if (float128_is_any_nan(make_float128(h, l))) {
>>> +        return 0;
>>> +    }
>>
>> I wonder if handle_exceptions should return s390_exc.
>> Then you can test
>>
>>      exc = handle_exceptions(...);
>>      if (unlikely(exc & S390_IEEE_MASK_INVALID)) {
>>        ret = 0;
>>      }
>>      return ret;
>>
> 
> I'll give it a thought if that makes things easier.

Looking at partsN(float_to_uint), we also raise float_flag_invalid in 
other cases, for example with float_class_inf. So IIUC, your proposal 
would also set "ret = 0" in case our input is +inf, which would be wrong.


-- 
Thanks,

David / dhildenb


