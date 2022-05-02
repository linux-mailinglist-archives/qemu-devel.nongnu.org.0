Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC71516B79
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 09:57:39 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlQw5-0002fc-F9
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 03:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nlQsw-0001Yz-3I
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nlQst-0008P7-S5
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651478058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwjEuGKvDycQomFzTMKgJgYkgrfwYBcwUnz8fGI4to4=;
 b=FTD6CyhqgyOX3pmEDOZ+KI14iJ8lfYlQvH/dWrIkUiuGOF7uIaY7hcyVS+IRn2qVmXEMvD
 D4m4k71NwSVtHD4iUM6XxOQddHbhb5aE8F+u9l4MMymQ9umxWd7F7OsH4CvfR4za506Lqr
 SerHJRWYUfBPSUOAjW9DRRmLkAZ+YBI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-aUdigachNJGAe0rtrt8IhA-1; Mon, 02 May 2022 03:54:17 -0400
X-MC-Unique: aUdigachNJGAe0rtrt8IhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o24-20020a05600c379800b003943412e81dso919718wmr.6
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 00:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xwjEuGKvDycQomFzTMKgJgYkgrfwYBcwUnz8fGI4to4=;
 b=KcpZro9C7u5E+d1xed0nrBaxSaN281bC6Fd7Ii1yjYU7GavWBFs3MARyqh6c4WV3QV
 4+szd59k+01RQWzc5gwir2LYbELJAWbCi8fLB1G3GNJMSvreBzSuNUAQXtNyuK5GupMb
 u23zztpVq6LnD0TEjRW+Rt4CGElmoo4ZfCU/MgztThZrCxTSE2OL8YeBH+xEoyYYdmlZ
 m9NTH0PpGRpLNh3gxr2QDoEp4Nc46zMIjLt4lqO55HcSCOa2ysVZdcfN6DaFCUzEYP2B
 IJMiPFIw5OfP20rBdcAKNfQjsycJ0jy4rhyjayG8EaPFxuiEVoC02oAjR/NJzib/rEeA
 W2sA==
X-Gm-Message-State: AOAM5307t7zt2GPpYzQfcoUbf3qaMRkAuGnbhfGGdW4MpZtq7WG26K8h
 MBe8CzTuenEzHbzFVyxplkyyGRYMocVoAoENeVVrwxzjPZ49bkJ8aw34nJ4y+gojonSVzGLl2L/
 ptQAMNxNNfLI7qfk=
X-Received: by 2002:a05:600c:b4e:b0:394:4551:113b with SMTP id
 k14-20020a05600c0b4e00b003944551113bmr716436wmr.9.1651478056454; 
 Mon, 02 May 2022 00:54:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbcZWwTixUZDKGUqqJb43dO5XINJcZiGvlulKAQt/yPxBfjCW/Pwde8TTIdOuViKns4nQ3TQ==
X-Received: by 2002:a05:600c:b4e:b0:394:4551:113b with SMTP id
 k14-20020a05600c0b4e00b003944551113bmr716423wmr.9.1651478056214; 
 Mon, 02 May 2022 00:54:16 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1cf614000000b003942a244ed0sm5621494wmc.21.2022.05.02.00.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 00:54:15 -0700 (PDT)
Message-ID: <8f317a24-b166-0fc9-5ec7-81c2c3d18509@redhat.com>
Date: Mon, 2 May 2022 09:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 3/8] block: introduce a lock to protect graph
 operations
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-4-eesposit@redhat.com>
 <Ymqaa1dDUZau9rdS@stefanha-x1.localdomain>
 <1650055a-6b58-2a1a-c19c-3c663e131602@redhat.com>
 <YmzNxS8A3ETA9duq@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YmzNxS8A3ETA9duq@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 30/04/2022 um 07:48 schrieb Stefan Hajnoczi:
> On Fri, Apr 29, 2022 at 10:37:54AM +0200, Emanuele Giuseppe Esposito wrote:
>> Am 28/04/2022 um 15:45 schrieb Stefan Hajnoczi:
>>> On Tue, Apr 26, 2022 at 04:51:09AM -0400, Emanuele Giuseppe Esposito wrote:
>>>> +static int has_writer;
>>>
>>> bool?
>>
>> Yes and no. With the latest findings and current implementation we could
>> have something like:
>>
>> wrlock()
>> 	has_writer = 1
>> 	AIO_WAIT_WHILE(reader_count >=1) --> job_exit()
>> 						wrlock()
>>
>> But we are planning to get rid of AIO_WAIT_WHILE and allow wrlock to
>> only run in coroutines. This requires a lot of changes, and switch a lot
>> of callbacks in coroutines, but then we would avoid having such problems
>> and nested event loops.
> 
> I don't understand how this answer is related to the question about
> whether the type of has_writer should be bool?

Yes sorry I did not conclude the explanation, but taking into account
the above case we would have an assertion failure `assert(!has_writer)`
in bdrv_graph_wrlock(), and just removing that would make the lock
inconsistent because the first unlock() would reset the flag to
zero/false and forget about the previous wrlock().
Example:

wrlock()
	has_writer = 1
	AIO_WAIT_WHILE(reader_count >=1) --> job_exit()
						wrlock()
							has_writer = 1
						/* performs a write */
						wrunlock()
							has_writer = 0
					<---
	/* performs a write but has_writer = 0! */
> 
>>> How can rd be negative, it's uint32_t? If AioContext->reader_count can
>>> be negative then please use a signed type.
>>
>> It's just "conceptually negative" while summing. The result is
>> guaranteed to be >= 0, otherwise we have a problem.
>>
>> For example, we could have the following AioContext counters:
>> A1: -5 A2: -4 A3: 10
>>
>> rd variable below could become negative while looping, but we read it
>> only once we finish reading all counters, so it will always be >= 0.
> 
> AioContext->reader_count is uint32_t but can hold negative values. It
> should be int32_t.
> 
> IMO even rd should be int32_t so it's clear that it will hold negative
> values, even temporarily.
> 
> The return value of reader_count() should be uint32_t because it's
> always a positive value.
> 
> That way the types express what is going on clearly.

Makes sense

Emanuele

> 
>>>
>>>> +            aio_wait_kick();
>>>> +            qemu_co_queue_wait(&exclusive_resume, &aio_context_list_lock);
>>>
>>> Why loop here instead of incrementing reader_count and then returning?
>>> Readers cannot starve writers but writers can starve readers?
>>
>> Not sure what you mean here. Why returning?
> 
> It was a misconception on my part. Looping is necessary. Somehow I
> thought that since we have aio_context_list_lock when we awake,
> has_writer cannot be 1 but that's incorrect.
> 
>>
>>>
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +/* Mark bs as not reading anymore, and release pending exclusive ops.  */
>>>> +void coroutine_fn bdrv_graph_co_rdunlock(void)
>>>> +{
>>>> +    AioContext *aiocontext;
>>>> +    aiocontext = qemu_get_current_aio_context();
>>>> +
>>>> +    qatomic_store_release(&aiocontext->reader_count,
>>>> +                          aiocontext->reader_count - 1);
>>>
>>> This is the point where reader_count can go negative if the coroutine
>>> was created in another thread. I think the type of reader_count should
>>> be signed.
>>
>> I think as long as we don't read it as a single, there's no problem
> 
> There is no problem with the program's behavior, two's complement means
> unsigned integer operations produce the same result as signed integer
> operations.
> 
> The issue is clarity: types should communicate the nature of the values
> held in a variable. If someone takes a look at the struct definition
> they will not know that ->reader_count is used to hold negative values.
> That can lead to misunderstandings and bugs in the future.
> 
> Stefan
> 


