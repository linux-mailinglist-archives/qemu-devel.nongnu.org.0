Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA50380F43
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:50:44 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbxT-0007sJ-2x
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhbbe-0007Jg-UT
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhbbc-0006Cs-0s
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JLVaTawlUpITY2YnsylmWlUcml8lPABdrBeAVO11vY=;
 b=G2eKZVW/WfBNeyjwpI740lFr+fJ+wZbzCTdZWb4wjGnq/bSXqecxmxH47Cv1ppBkPFEfzp
 fudjVwJF4I2hTz54S4IaaeMDPJiusRgEDxyNws8PBhvMB33enO9XfC3BRr5IhDB2DuQsUo
 vWH6jPS/lmTqetuu9zDTTTmVOguO9CQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-8Jqr1sqLPxy-XoM4X00d7w-1; Fri, 14 May 2021 13:28:05 -0400
X-MC-Unique: 8Jqr1sqLPxy-XoM4X00d7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 i3-20020aa7dd030000b029038ce772ffe4so2353076edv.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 10:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0JLVaTawlUpITY2YnsylmWlUcml8lPABdrBeAVO11vY=;
 b=Am5ekhEDQVKUN1PYre/ulI1ZAVlq+T72Jn5ouNdbhzPcakoocPMI4FCyNjHPa7IuLm
 8NGuplcKmwtShNjTWKYR4oItsNgvk2BVmkpvIaV/HiAl+6dqmmLQFHXpPFCgI+jDevz8
 RbBZXgg+wDWe+N4/vr8U4bYDnF4QPBMF8aksNy0ZU9Obrvl2dNQsFK9GBzqmw84YrXnI
 slV1Kf+og9D3FGZg1VL2YPyFfaFJgny7fGWf/7+shJ7IOUZnQfKyCpjkAQvJyf9w8QZ0
 Nc2m5cxrEuU3FPG45paqLs5YDjvSUnXwJxTsvNYDAaftnX2h7VvXynNKF8wbYzSc0PxB
 Vq5w==
X-Gm-Message-State: AOAM531w00++XUpUjbZ/81TVzjD+kl/QVxeJeV1GxsjZzBp4HvujqQnP
 XKSQgFTvZ6NyxYCf9lflwoWx8ykG7kV9zybomVszXe8IdarXd/GEhTSQ6phEGtn0ZRJt2YO6HFN
 tvv4tTzb3ndZLcvgrREk+dyCm2qXZ76jDl/3Q+zjunyStEJoGTLM97f106z0HPzr0WYs=
X-Received: by 2002:a17:906:e08c:: with SMTP id
 gh12mr51187722ejb.115.1621013283908; 
 Fri, 14 May 2021 10:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFM7ZzDujpVBhWIv/nlNqUzSizButaZb8KQa+ugtDVWjc93ymdqQfJcPS6n6IhzN+7WnykUg==
X-Received: by 2002:a17:906:e08c:: with SMTP id
 gh12mr51187697ejb.115.1621013283486; 
 Fri, 14 May 2021 10:28:03 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 n11sm4085485ejg.43.2021.05.14.10.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 10:28:01 -0700 (PDT)
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
 <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
 <6b9d7c37-aaf7-1745-260b-4cce8f0891ee@virtuozzo.com>
 <8008b39d-905c-3858-a96f-8609801a4ae0@redhat.com>
 <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <ce9c970e-d7f2-fef9-8b07-b1fc5f634cc6@redhat.com>
Date: Fri, 14 May 2021 19:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24be08c6-d1f1-802c-a045-3a5c3fe102b0@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/05/2021 17:30, Vladimir Sementsov-Ogievskiy wrote:
> 14.05.2021 17:32, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 14/05/2021 16:26, Vladimir Sementsov-Ogievskiy wrote:
>>> 14.05.2021 17:10, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> On 12/05/2021 17:44, Stefan Hajnoczi wrote:
>>>>> On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe 
>>>>> Esposito wrote:
>>>>>> co-shared-resource is currently not thread-safe, as also reported
>>>>>> in co-shared-resource.h. Add a QemuMutex because 
>>>>>> co_try_get_from_shres
>>>>>> can also be invoked from non-coroutine context.
>>>>>>
>>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>>> ---
>>>>>>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>>>>>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>>>>
>>>>> Hmm...this thread-safety change is more fine-grained than I was
>>>>> expecting. If we follow this strategy basically any data structure 
>>>>> used
>>>>> by coroutines needs its own fine-grained lock (like Java's Object base
>>>>> class which has its own lock).
>>>>>
>>>>> I'm not sure I like it since callers may still need coarser grained
>>>>> locks to protect their own state or synchronize access to multiple
>>>>> items of data. Also, some callers may not need thread-safety.
>>>>>
>>>>> Can the caller to be responsible for locking instead (e.g. using
>>>>> CoMutex)?
>>>>
>>>> Right now co-shared-resource is being used only by block-copy, so I 
>>>> guess locking it from the caller or within the API won't really 
>>>> matter in this case.
>>>>
>>>> One possible idea on how to delegate this to the caller without 
>>>> adding additional small lock/unlock in block-copy is to move 
>>>> co_get_from_shres in block_copy_task_end, and calling it only when a 
>>>> boolean passed to block_copy_task_end is true.
>>>>
>>>> Otherwise make b_c_task_end always call co_get_from_shres and then 
>>>> include co_get_from_shres in block_copy_task_create, so that we 
>>>> always add and in case remove (if error) in the shared resource.
>>>>
>>>> Something like:
>>>>
>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>> index 3a447a7c3d..1e4914b0cb 100644
>>>> --- a/block/block-copy.c
>>>> +++ b/block/block-copy.c
>>>> @@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask 
>>>> *block_copy_task_create(BlockCopyState *s,
>>>>       /* region is dirty, so no existent tasks possible in it */
>>>>       assert(!find_conflicting_task(s, offset, bytes));
>>>>       QLIST_INSERT_HEAD(&s->tasks, task, list);
>>>> +    co_get_from_shres(s->mem, task->bytes);
>>>>       qemu_co_mutex_unlock(&s->tasks_lock);
>>>>
>>>>       return task;
>>>> @@ -269,6 +270,7 @@ static void coroutine_fn 
>>>> block_copy_task_end(BlockCopyTask *task, int ret)
>>>>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, 
>>>> task->bytes);
>>>>       }
>>>>       qemu_co_mutex_lock(&task->s->tasks_lock);
>>>> +    co_put_to_shres(task->s->mem, task->bytes);
>>>>       task->s->in_flight_bytes -= task->bytes;
>>>>       QLIST_REMOVE(task, list);
>>>>       progress_set_remaining(task->s->progress,
>>>> @@ -379,7 +381,6 @@ static coroutine_fn int 
>>>> block_copy_task_run(AioTaskPool *pool,
>>>>
>>>>       aio_task_pool_wait_slot(pool);
>>>>       if (aio_task_pool_status(pool) < 0) {
>>>> -        co_put_to_shres(task->s->mem, task->bytes);
>>>>           block_copy_task_end(task, -ECANCELED);
>>>>           g_free(task);
>>>>           return -ECANCELED;
>>>> @@ -498,7 +499,6 @@ static coroutine_fn int 
>>>> block_copy_task_entry(AioTask *task)
>>>>       }
>>>>       qemu_mutex_unlock(&t->s->calls_lock);
>>>>
>>>> -    co_put_to_shres(t->s->mem, t->bytes);
>>>>       block_copy_task_end(t, ret);
>>>>
>>>>       return ret;
>>>> @@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState 
>>>> *call_state)
>>>>
>>>>           trace_block_copy_process(s, task->offset);
>>>>
>>>> -        co_get_from_shres(s->mem, task->bytes);
>>>
>>> we want to get from shres here, after possible call to 
>>> block_copy_task_shrink(), as task->bytes may be reduced.
>>
>> Ah right, I missed that. So I guess if we want the caller to protect 
>> co-shared-resource, get_from_shres stays where it is, and put_ instead 
>> can still go into task_end (with a boolean enabling it).
> 
> honestly, I don't follow how it helps thread-safety

 From my understanding, the whole point here is to have no lock in 
co-shared-resource but let the caller take care of it (block-copy).

The above was just an idea on how to do it.

> 
>>>
>>>> -
>>>>           offset = task_end(task);
>>>>           bytes = end - offset;
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>>> diff --git a/util/qemu-co-shared-resource.c 
>>>>>> b/util/qemu-co-shared-resource.c
>>>>>> index 1c83cd9d29..c455d02a1e 100644
>>>>>> --- a/util/qemu-co-shared-resource.c
>>>>>> +++ b/util/qemu-co-shared-resource.c
>>>>>> @@ -32,6 +32,7 @@ struct SharedResource {
>>>>>>       uint64_t available;
>>>>>>       CoQueue queue;
>>>>>> +    QemuMutex lock;
>>>>>
>>>>> Please add a comment indicating what this lock protects.
>>>>>
>>>>> Thread safety should also be documented in the header file so API 
>>>>> users
>>>>> know what to expect.
>>>>
>>>> Will do, thanks.
>>>>
>>>> Emanuele
>>>>
>>>
>>>
>>
> 
> 


