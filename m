Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0766C4D44E3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:42:46 +0100 (CET)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGFp-0005Wa-4S
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:42:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSGEY-0004gs-Fo
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:41:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSGEW-0000IB-8u
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646908880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7Z57XwTtNoDFoKcQIzdmZlk1Um0UUAanw903KNpaE4=;
 b=W/z1xONH1gJfMBkimb5agoWTCpo1QLeswOqtMBXm1plzv8cDvcyzvdYuKItbqqv30v0gK8
 O5Q5W0csrBM7ZjblEXTSAKSlAhmQifGnPL9IGej46p4KwWKCKx/pNCYcFBTfOnb/jmOlkz
 JcsXX4rRZ+sUq87qmEhgxfMsI9vSzwE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-c4S90eA_MI6tuhEMSIk_HA-1; Thu, 10 Mar 2022 05:41:19 -0500
X-MC-Unique: c4S90eA_MI6tuhEMSIk_HA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso1956905wme.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 02:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M7Z57XwTtNoDFoKcQIzdmZlk1Um0UUAanw903KNpaE4=;
 b=5FtloE9VzQEPwdNn8aOU9rKTqyx0fJUW7m/lBCFusVg2n8PYBsKW/GEsG0zxZdhBDd
 1NB07MpXd6zaj9N2ixDu2ktXbtB3q5CuFdzNzfWsPzFXxQnQa+9TZ4stkx8GwWXCN4Im
 ZkFfUJBds2Uh5jH/D1vbsc9eay7ZA/erPa0fuIrlFp2O4Cc+tbDNUCZuiC+z2DdrwQhx
 NUy5ui8ZsIOXGFcWI3Todwn51o2Nm4+mKmf42pXORW/eEEIgl6fnHljdxnsDZ/Rk0PXy
 pCeJRYs5hRsyenQevUN3ImEZV9QCFucp+c/B2u3qFs2mmkJ3c3sABb4JAyq/K44/4MuR
 Cydg==
X-Gm-Message-State: AOAM5310wxApsKBhpxRw2Qqai7/Q8F9rwGWSCVIGoz6WVhbS+aYFBAKu
 7rnsRKJF8FYeQiO4UpfbkiRUoqModC6dh5NA7mMtaiesM/BeHzEaAtzSdFns6bXTWq+SG1Nwc/L
 60TeYhelnXGHdFlk=
X-Received: by 2002:a05:600c:154a:b0:389:d76c:8a07 with SMTP id
 f10-20020a05600c154a00b00389d76c8a07mr3035959wmg.60.1646908878397; 
 Thu, 10 Mar 2022 02:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfP2qwArdRxjmQx3vZGiHdtOzahC6JpNqxIAXXM9wQ0uj+eoZJYdSK5u2yScrJPyiLi//QMA==
X-Received: by 2002:a05:600c:154a:b0:389:d76c:8a07 with SMTP id
 f10-20020a05600c154a00b00389d76c8a07mr3035939wmg.60.1646908878139; 
 Thu, 10 Mar 2022 02:41:18 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm4252421wri.98.2022.03.10.02.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 02:41:17 -0800 (PST)
Message-ID: <d6f8c1af-b47b-ce2e-38b4-c8ef4ffc2204@redhat.com>
Date: Thu, 10 Mar 2022 11:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
 <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com> <87a6dy5c1s.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87a6dy5c1s.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 11.34, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 09/03/2022 12.22, Alex Bennée wrote:
>>> With -cpu max we get a warning:
>>>     qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
>>> But dropping the -cpu max and it still runs fine.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> ---
>>>    tests/tcg/s390x/Makefile.target | 2 --
>>>    1 file changed, 2 deletions(-)
>>> diff --git a/tests/tcg/s390x/Makefile.target
>>> b/tests/tcg/s390x/Makefile.target
>>> index 257c568c58..7aa502a557 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=-march=z13 -mvx -O3
>>>    sha512-mvx: sha512.c
>>>    	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>>>    -run-sha512-mvx: QEMU_OPTS+=-cpu max
>>> -
>>>    TESTS+=sha512-mvx
>>
>> Ok, this helps to get rid of the warnings, thus feel free to add:
>>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>>
>> However, the error still persists. I now had a closer look by running
>> the test with "qemu-s390x" on my z15 machine directly, and all tests
>> are failing! The problem happens with both, gcc v11.2.1 and clang
>> v13.0.1. The problem goes away (i.e. test works fine) if I compile the
>> code with -O1 instead of -O3, or if I use GCC v8.5 instead. I'll try
>> to find out more, but as a temporary workaround, we could also switch
>> to -O1 instead of -O3.
> 
> The -O3 is included to force the compiler to vectorise the code -
> otherwise you will get the same code as the plain sha512 test. However
> is it because gcc v11.2.1 is using even more advanced mvx instructions
> or just getting it's code generation wrong?
> 
> Do the tests also fail when run natively?

No, it's running fine natively (see my other mail), it must be something in 
the s390x TCG backend.

It's definitely related to commit 9bca986df88b8ea ... I just tried to switch 
TCG_TARGET_HAS_bitsel_vec back to 0, and then the test is working fine again...

  Thomas


