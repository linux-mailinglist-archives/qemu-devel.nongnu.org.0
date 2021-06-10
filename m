Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3CE3A299C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:48:10 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIEK-0004di-VB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrID3-0003JN-8x
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrICz-00044t-Uz
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623322004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsQMYfwQD566AbsZ08i+wU1K9yvqXQXICJFc3PpLFyg=;
 b=TSom95ztcaFwzejm3Fh59Fx/StZnLap4NMBdI3zjCEAPJttnETWhCK7KJvfhjLkBmteYp/
 oFRPAMMlGPeEdzsaPAzTg03b6QdltbnNYGBarN2jYACBbeUnCsqIn0owmkfamwLKX7hOxy
 r3MyEWmLPwstfb2FhRZsU8bTRqtW28w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-1YQPISKcN_iuELV-egmurA-1; Thu, 10 Jun 2021 06:46:43 -0400
X-MC-Unique: 1YQPISKcN_iuELV-egmurA-1
Received: by mail-ej1-f72.google.com with SMTP id
 n8-20020a1709067b48b02904171dc68f87so4340690ejo.21
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UsQMYfwQD566AbsZ08i+wU1K9yvqXQXICJFc3PpLFyg=;
 b=KbXhJiB6okdHOIh1I7XFBPpNsNEkMgDDYwrE8TP+vWySc1Jv+OBHSmrYe3J2dhJ5Df
 l4oyhcmxqvh/EK63MSTCQ87oOAWPoeIBR4K91I0oBWtI3gmvamh1RFQEtnZV4wrVhwM/
 TEEGTIf2Bcdu10BtD0wMzHf1xT0UhrjacAeYS7eQgY5lEAxRAD/S/m+CL7BeIX4vGAbV
 P6Skz/Hjw0ngwO4QtVLZGWxtwKyqJXTxDWWHfVa539elelipRQ5A+gyJf95A9sbDNg4H
 JqCeQ4gn32fI3gqPrP7HvknZhdcI1hlYZVIP/iMo2/4qjKDoN3Wj0L4WG28rFW0IysWv
 bcvA==
X-Gm-Message-State: AOAM531FGbWStZOLBA7Mzu4clD8GwvxJ5yed675vh4XfdaX7i2ObTxJW
 lVaV+EJRmsPQN81QWln6tYnUUC1kiF7+aKLoNK77VhOQnswzEAKqLQsKXyW1wYYyiqg/PUs9Wyz
 7mGbq2RQ+p/zftmJWAe/0/AT3+8bTvoh1pEdrPEZXm8zAcfBL1UkKRbyzBWTZLpvxktU=
X-Received: by 2002:a05:6402:111a:: with SMTP id
 u26mr3922923edv.260.1623322002020; 
 Thu, 10 Jun 2021 03:46:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvBEhNxXWhx3o1WdaU/TKkx/r0yjLB5wQ7nAJ5NUvV0PLw4IckTuGppcfPgvJAZKetmygYSw==
X-Received: by 2002:a05:6402:111a:: with SMTP id
 u26mr3922895edv.260.1623322001727; 
 Thu, 10 Jun 2021 03:46:41 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 lb23sm873517ejb.73.2021.06.10.03.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 03:46:40 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
 <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
 <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <9d24d1c2-bcf0-59a7-f934-cd67bdff7fed@redhat.com>
Date: Thu, 10 Jun 2021 12:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/06/2021 12:27, Vladimir Sementsov-Ogievskiy wrote:
> 10.06.2021 13:14, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
>>> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>>> and BlockCopyState in IN, State and OUT fields.
>>>> This is just to understand which field has to be protected with a lock.
>>>>
>>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>>> and thus here left as TODO.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>   block/block-copy.c | 47 
>>>> ++++++++++++++++++++++++++++++----------------
>>>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>> index d58051288b..b3533a3003 100644
>>>> --- a/block/block-copy.c
>>>> +++ b/block/block-copy.c
>>>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>>       /* State */
>>>
>>> Why previous @list field is not in the state? For sure it's not an IN 
>>> parameter and should be protected somehow.
>>>
>>>> -    int ret;
>>>>       bool finished;
>>>> -    QemuCoSleep sleep;
>>>> -    bool cancelled;
>>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>>       /* OUT parameters */
>>>> +    bool cancelled;
>>>>       bool error_is_read;
>>>> +    int ret;
>>>>   } BlockCopyCallState;
>>>>   typedef struct BlockCopyTask {
>>>>       AioTask task;
>>>> +    /*
>>>> +     * IN parameters. Initialized in block_copy_task_create()
>>>> +     * and never changed.
>>>> +     */
>>>>       BlockCopyState *s;
>>>>       BlockCopyCallState *call_state;
>>>>       int64_t offset;
>>>> -    int64_t bytes;
>>>> -    BlockCopyMethod method;
>>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>>> +    int64_t bytes; /* only re-set in task_shrink, before running 
>>>> the task */
>>>> +    BlockCopyMethod method; /* initialized in 
>>>> block_copy_dirty_clusters() */
>>>
>>> hmm. to be precise method is initialized in block_copy_task_create.
>>>
>>> And after block_copy_task_create finished, task is in the list and 
>>> can be read by parallel block_copy_dirty_clusters(). So, @bytes is 
>>> part of State, we must protect it..
>>
>> So if I understand correctly, you refer to the fact that a parallel 
>> block_copy_dirty_clusters() can create another task and search with 
>> find_conflicting_task_locked(), or in general also 
>> block_copy_wait_one() can do the same in parallel, correct?
> 
> yes
> 
>>
>> Here there is also another problem: if we add the task to the list and 
>> then shrink it in two different critical sections, we are going to 
>> have problems because in the meanwhile find_conflicting_tasks can be 
>> issued in parallel.
> 
> But we shrink task only once, and we do it under mutex, so we are OK I 
> think?

I think you understood, but just in case: I am thinking the case where 
we have:
T1: block_copy_task_create()
T2: find_conflicting_tasks() <-- sees the initial task
T1: task_shrink() <-- bytes are updated, T2 saw the wrong amount of 
bytes. This might or might not have consequences, I am not sure.

But maybe I am overcomplicating.


> 
>>
>> So, is there a reason why we don't want
>> QLIST_INSERT_HEAD(&s->tasks, task, list);
>> in block_copy_dirty_clusters()?
>>
>> By doing that, I think we also spare @bytes from the critical section, 
>> since it is only read from that point onwards.
> 
> This way find_conflicting_tasks will just skip our new creating task.. 
> And we'll get conflict when try to add our new task. No, we should add 
> task to the list at same critical section where we clear dirty bits from 
> the bitmap.


I agree, with the above.
So to me the most correct solution would be to call create and shrink in 
the same lock, but this creates a much wider critical section.

Alternatively, I can leave it as it is and just update the comment.

> 
> Then we shrink task in another critical section, it should be OK too.
> 
>>
>> I am also trying to see if I can group some critical sections.
>>
>> Btw I think we already talked about @bytes and it's not the first time 
>> we switch it from IN to STATE and vice-versa...
>> I mean, I agree with you but it starts to be confusing.
> 
> On last review it seemed to me that you actually protect bytes by 
> critical section where it is needed. So here I'm saying only about the 
> comment..
> 
>>
>>
>> This also goes against your comment later in patch 4,
>>>> @@ -212,7 +222,7 @@ static BlockCopyTask 
>>>> *block_copy_task_create(BlockCopyState *s,
>>>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>>>         /* region is dirty, so no existent tasks possible in it */
>>>> -    assert(!find_conflicting_task(s, offset, bytes));
>>>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>>>         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>>>       s->in_flight_bytes += bytes;
>>>> @@ -248,16 +258,19 @@ static void coroutine_fn 
>>>> block_copy_task_shrink(BlockCopyTask *task,
>>>
>>> The function reads task->bytes not under mutex.. It's safe, as only 
>>> that function is modifying the field, and it's called once. Still, 
>>> let's make critical section a little bit wider, just for simplicity. 
>>> I mean, simple QEMU_LOCK_GUARD() at start of function. 
>>
>> Where if I understand correctly, it is not safe, because 
>> find_conflicting_tasks might search the non-updated task.
>>
> 
> find_conflicting_tasks only reads bytes, so it can't make damage.. 
> Anyway making critical sections a bit wider won't hurt.
> 
> 


