Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FF4EABAA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:53:02 +0200 (CEST)
Received: from localhost ([::1]:59606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9TB-0001TK-Nc
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:53:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ9FI-0006M1-Ha
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZ9FF-0001SC-1Z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648550316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GG9lc+/ucGvRb9YU5Gm3Gl2yHPuEzjJCaB7dIzXxcKo=;
 b=M0DPrms1pmgtKrXD3UY5/n3+CA8metvngplNBxmuMlj0EIWeXXsIXnCBMERGx1vMffnuf1
 ZnBbaZLLmnlvw16MDQpRNVgsommQsbE1341epuy/q3maOKZAC6Sp9V8pUS4ELWoBl34oCb
 JNEzhDYuYD3ZD+4+SoqYX9hyzMC7oTg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-z2By-5V8MlmW6wIUG64sJQ-1; Tue, 29 Mar 2022 06:38:32 -0400
X-MC-Unique: z2By-5V8MlmW6wIUG64sJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d28-20020a50f69c000000b00419125c67f4so10793882edn.17
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GG9lc+/ucGvRb9YU5Gm3Gl2yHPuEzjJCaB7dIzXxcKo=;
 b=ubXSybDqdZj7KcUE8nCH2nMgR34quUjVnbf1UYrHNeoIsksMagJQkpHXiEjVrA5Ked
 tz12AWX9eFMcIfx6mWtrM+qVLkFJ7wyhvoii16FkM2IqWSLUwYovjXyU3wR634lp8xyA
 R+q6RudFyV+dq0oflHeCUp3ho20zl+VTG/O+JIU/enMdGJK1aZ54UZlTkX1rSJJugLqs
 LZY1GOjjR4Xs1oEOA2wLzCRNZlMI3f/hVhkD2rOScsN5e6kBcjDH0ZMuoM8MkELU4qAJ
 Y77FPeA+rUGmaCTPmL8caYsc6DrHcrKDjmdGFc8MehyLUT9abxI22iJg5t9flJLdulNM
 nf5g==
X-Gm-Message-State: AOAM532m6iSz7ahTZMi+vLxUuzOMAAIuz36b2UZjp5Bn8uW8KzZfO0YJ
 S2RM7uLLcWAEnEb/Gu01PrOieY4aJfSwnIP67oJ/PolJgZZp3i4mOPddLWK/ZKw+ZX7vxY7VZvz
 oTVnWN4iBZvgB5sY=
X-Received: by 2002:a17:906:c145:b0:6da:aaaf:770c with SMTP id
 dp5-20020a170906c14500b006daaaaf770cmr33457315ejc.504.1648550311389; 
 Tue, 29 Mar 2022 03:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqPhbkByDaZkHj6tBEzkalh4vHm60LVaS3C+ZVRLb05eh8z2hpr6JweYkppnZONUHbX065mw==
X-Received: by 2002:a17:906:c145:b0:6da:aaaf:770c with SMTP id
 dp5-20020a170906c14500b006daaaaf770cmr33457296ejc.504.1648550311199; 
 Tue, 29 Mar 2022 03:38:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 y27-20020a170906519b00b006dfaf4466ebsm6950802ejk.116.2022.03.29.03.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:38:30 -0700 (PDT)
Message-ID: <9c34125b-875f-e3b2-c0d4-2f6a283deb5a@redhat.com>
Date: Tue, 29 Mar 2022 12:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] main-loop: Disable GLOBAL_STATE_CODE() assertions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-block@nongnu.org
References: <20220329093545.52114-1-hreitz@redhat.com>
 <dab63073-d532-2795-fce4-77bd0839f578@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <dab63073-d532-2795-fce4-77bd0839f578@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.22 12:17, Philippe Mathieu-Daudé wrote:
> On 29/3/22 11:35, Hanna Reitz wrote:
>> These assertions are very useful for developers to find bugs, and so
>> they have indeed pointed us towards bugs already.  For users, it is not
>> so useful to find these bugs.  We should probably not enable them in
>> releases until we are sufficiently certain that they will not fire
>> during normal operation, unless something is going seriously wrong.
>>
>> For example, we have received a bug report that you cannot add an NBD
>> server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
>> is a real bug that needs investigation, but we do not really have that
>> time right now, so close to release, and so I would rather disable the
>> assertions to get time to investigate such reports.
>>
>> (I am just putting the link as "buglink" below, not "closes", because
>> disabling the assertion will not fix the likely underlying bug.)
>>
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945
>
> Also helps:
> https://gitlab.com/qemu-project/qemu/-/issues/926
>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   include/qemu/main-loop.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
>> index 7a4d6a0920..3bf8aeb3cd 100644
>> --- a/include/qemu/main-loop.h
>> +++ b/include/qemu/main-loop.h
>> @@ -272,7 +272,8 @@ bool qemu_in_main_thread(void);
>>   /* Mark and check that the function is part of the global state 
>> API. */
>>   #define GLOBAL_STATE_CODE()                                         \
>>       do {                                                            \
>> - assert(qemu_in_main_thread());                              \
>> +        /* FIXME: Re-enable after 7.0 release */                    \
>> +        /* assert(qemu_in_main_thread()); */                        \
>>       } while (0)
>>     /* Mark and check that the function is part of the I/O API. */
>
> Do you want me to cancel/repost my PR without this patch?
>
> https://lore.kernel.org/qemu-devel/20220328224012.32737-3-philippe.mathieu.daude@gmail.com/

I think we should let Peter take your PR first, as long as the 
discussion on this is still out.  I’d like to give it a couple more 
hours, and as far as I understand, we definitely want yours.

(Taking mine will then cause me rebase conflicts and make it look weird, 
but that’s not too bad for something that’s just a temporary band-aid 
anyway.)

Hanna


