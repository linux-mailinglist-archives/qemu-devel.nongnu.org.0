Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A43F3A2E03
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:22:47 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLa2-0000gh-EN
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrLYg-0007d4-Av
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:21:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrLYd-0001Y4-WB
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623334878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cj3LMZQLi/jeGByA56FlIxVmzjWo3A1xLDq/jBNKA8g=;
 b=aGKLKk1uToeYZW/6C7sjkIZkDMXN9aPdbxLdL9XL2b07NZYZ/wWfAlR2Hs+9gtxxXv71ry
 VpH7sg6psKhoZxrWJcB5+Wa0NW0K+9mRh9Un1pWcsA8+hLmitCBXSNYyI5BO7xEq7HCmOm
 49swZwl2srgkr0kZjyYtaYp6ARxdQ8A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-0IpICI7bMdOmTZlUjAJ6ZQ-1; Thu, 10 Jun 2021 10:21:15 -0400
X-MC-Unique: 0IpICI7bMdOmTZlUjAJ6ZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ch5-20020a0564021bc5b029039389929f28so6480540edb.16
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cj3LMZQLi/jeGByA56FlIxVmzjWo3A1xLDq/jBNKA8g=;
 b=hg9fObJQv4wd0x+aVY5dB5KYJTGijfoFqUCBIaWHNFXTR3YKiSzjoVTJ369ZPvvSgx
 80RZYGHeez7T/g4oDu3driGXk1sXz5xBPy0YJdzumieTOOAgn5jppZBjLH98wTVp8EUp
 aUBiGafmsPvMtQEkmSEWfSUCXUaXr7Gn2GgDetTbLkee4IAOJXb+eBbnno/Xsi9eOOsB
 +i6TJanwGhVKsrre4ieqQ4lEMWMRburwJb5irm/4m/AgAPe2fEHz45mFZxtwOwTWy358
 qKYpT1AKD0tlxqnXA1F2QN39kjUii79PfUtf0gxsUv07/+3EefjHkicxP0XdIJr82rqJ
 Jang==
X-Gm-Message-State: AOAM532Hiimfm21RqMnyfrsBFH/G1I8Qv2Q+n++XjsceRJBgwvGNvL41
 1HuzdWmOwD4rkU+avl1TqyL646/ILw+mwwVioAm8Ump4TuSVOFTafhb6+R5p8gX4z1/fnkkxX6j
 1fup5blWTlnhqIRPmoEcFy0dRG+e52nz52qrRW1u2UVIV99vPgtivOjDWoF6hbR0GT5k=
X-Received: by 2002:a17:907:9607:: with SMTP id
 gb7mr4749008ejc.208.1623334873783; 
 Thu, 10 Jun 2021 07:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc0O++9fWSe9lLql1dLTx1siiH6HQbxZFVfFXMCvIeFcMwfiISceGFrhRlvNYPiDzIlqg1Lw==
X-Received: by 2002:a17:907:9607:: with SMTP id
 gb7mr4748966ejc.208.1623334873390; 
 Thu, 10 Jun 2021 07:21:13 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 o21sm1084460ejh.57.2021.06.10.07.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:21:12 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-3-eesposit@redhat.com>
 <b466cc82-3905-acba-a2f8-e0b3cbbe2af1@virtuozzo.com>
 <ff0e4ff0-681c-2827-31cd-efc6b01360ef@redhat.com>
 <d7869f84-bc1e-40c2-3309-e5f7ee868fc1@virtuozzo.com>
 <9d24d1c2-bcf0-59a7-f934-cd67bdff7fed@redhat.com>
 <ef104344-d857-c741-2893-315e9f0a77a5@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <f3790bfb-b151-df6b-5c78-0e536a8ad310@redhat.com>
Date: Thu, 10 Jun 2021 16:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ef104344-d857-c741-2893-315e9f0a77a5@virtuozzo.com>
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



On 10/06/2021 13:12, Vladimir Sementsov-Ogievskiy wrote:
> 10.06.2021 13:46, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 10/06/2021 12:27, Vladimir Sementsov-Ogievskiy wrote:
>>> 10.06.2021 13:14, Emanuele Giuseppe Esposito wrote:
>>>>
>>>>
>>>> On 09/06/2021 11:12, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>>>>>> As done in BlockCopyCallState, categorize BlockCopyTask
>>>>>> and BlockCopyState in IN, State and OUT fields.
>>>>>> This is just to understand which field has to be protected with a 
>>>>>> lock.
>>>>>>
>>>>>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>>>>>> and thus here left as TODO.
>>>>>>
>>>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>>>> ---
>>>>>>   block/block-copy.c | 47 
>>>>>> ++++++++++++++++++++++++++++++----------------
>>>>>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>>>> index d58051288b..b3533a3003 100644
>>>>>> --- a/block/block-copy.c
>>>>>> +++ b/block/block-copy.c
>>>>>> @@ -56,25 +56,33 @@ typedef struct BlockCopyCallState {
>>>>>>       QLIST_ENTRY(BlockCopyCallState) list;
>>>>>>       /* State */
>>>>>
>>>>> Why previous @list field is not in the state? For sure it's not an 
>>>>> IN parameter and should be protected somehow.
>>>>>
>>>>>> -    int ret;
>>>>>>       bool finished;
>>>>>> -    QemuCoSleep sleep;
>>>>>> -    bool cancelled;
>>>>>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>>>>>>       /* OUT parameters */
>>>>>> +    bool cancelled;
>>>>>>       bool error_is_read;
>>>>>> +    int ret;
>>>>>>   } BlockCopyCallState;
>>>>>>   typedef struct BlockCopyTask {
>>>>>>       AioTask task;
>>>>>> +    /*
>>>>>> +     * IN parameters. Initialized in block_copy_task_create()
>>>>>> +     * and never changed.
>>>>>> +     */
>>>>>>       BlockCopyState *s;
>>>>>>       BlockCopyCallState *call_state;
>>>>>>       int64_t offset;
>>>>>> -    int64_t bytes;
>>>>>> -    BlockCopyMethod method;
>>>>>> -    QLIST_ENTRY(BlockCopyTask) list;
>>>>>> +    int64_t bytes; /* only re-set in task_shrink, before running 
>>>>>> the task */
>>>>>> +    BlockCopyMethod method; /* initialized in 
>>>>>> block_copy_dirty_clusters() */
>>>>>
>>>>> hmm. to be precise method is initialized in block_copy_task_create.
>>>>>
>>>>> And after block_copy_task_create finished, task is in the list and 
>>>>> can be read by parallel block_copy_dirty_clusters(). So, @bytes is 
>>>>> part of State, we must protect it..
>>>>
>>>> So if I understand correctly, you refer to the fact that a parallel 
>>>> block_copy_dirty_clusters() can create another task and search with 
>>>> find_conflicting_task_locked(), or in general also 
>>>> block_copy_wait_one() can do the same in parallel, correct?
>>>
>>> yes
>>>
>>>>
>>>> Here there is also another problem: if we add the task to the list 
>>>> and then shrink it in two different critical sections, we are going 
>>>> to have problems because in the meanwhile find_conflicting_tasks can 
>>>> be issued in parallel.
>>>
>>> But we shrink task only once, and we do it under mutex, so we are OK 
>>> I think?
>>
>> I think you understood, but just in case: I am thinking the case where 
>> we have:

>>
>> But maybe I am overcomplicating.
>>
> 
> Both shrink and find_ are done under mutex, so they can't intersect. But 
> yes, we should keep in mind that if we do find_ under mutex, and then 
> release mutex, the information get from find_ may become incorrect.
> 
> Check callers of find_conflicting_task_locked():
> 
> block_copy_wait_one has one critical section.
> 
> if no conflicting tasks we are OK.. Are we? Ok, look at the only caller 
> of block_copy_wait_one() - block_copy_common().
> 
> assume block_copy_dirty_clusters() returns 0, so there no dirty bits at 
> some moment...
> 
> than in parallel thread some task may finish with failure, leaving some 
> new dirty bits.. Then we check that there no conflicting tasks.. And 
> then we go out of the loop, when actually we must retry for these new 
> dirty bits.
> 
> So I'm afraid you are right, we are not threadsafe yet in 
> block_copy_common(), as we should check conflicting tasks and dirty bits 
> in same critical section to be consistent.

Wait, we are talking about two different problems:

- What I wanted to point out has to do with @bytes, not (as far as I 
understand) with the dirty bits. From the example I made below, I assume 
there are 3 separate non-overlapping critical sections:

>>> T1: block_copy_task_create()
>>> T2: find_conflicting_tasks() <-- sees the initial task
>>> T1: task_shrink() <-- bytes are updated, T2 saw the wrong amount of 
>>> bytes. This might or might not have consequences, I am not sure.

T1 creates the task, T2 iterates to search for conflicting tasks (called 
from a parallel block_copy_wait_one), T1 shrinks the current task. I 
think that T2 in this case misses the updated task, even though the 
worst it can happen is that the task is smaller, so a false positive (a 
task is not conflicting but might be marked as conflicting).
The outcome is that T2 is waiting for a task it shouldn't, but there is 
no error there.

- Your point is about a task failing between block_copy_dirty_clusters 
and block_copy_wait_one. The task failing calls block_copy_task_end and 
sets the dirty bitmap, but at that point block_copy_wait_one won't check 
it anymore and the bitmap is left dirty. I think the default behavior 
here should be that block_copy_dirty_clusters() is called and a new task 
is created. This, as you pointed out, is a proper error.

In this case, we need to stop iterating only when 1) the whole bitmap is 
clear, and 2) no conflicting task is present.

Therefore a possible solution can be the one below:

int stop_looping = 0;

...

do {

     // create all the tasks, clears the bitmap but
     // adds tasks to the task list
     block_copy_dirty_clusters();

     /* here a task can fail, but then the dirty map will be set */

     lock();
     // make sure no task is running for this operation
     stop_looping = (find_conflicting_task() == NULL);
     // make sure that the dirty bitmap is clear
     stop_looping |= (!bdrv_dirty_bitmap_next_dirty_area()) << 1;
     unlock();

     /* if stop_looping is == 0, no task can fail */

     /* if a task fails here, the if below won't see it but it will
      * block_copy_dirty_clusters in the next iteration */

     if (stop_looping & 1) {
	// there is some conflicting task, wait for it
         qemu_co_queue_wait(&task->wait_queue);
     }

} while(stop_looping != 0);

...

What do you think?

Emanuele

> 
>>
>>>
>>>>
>>>> So, is there a reason why we don't want
>>>> QLIST_INSERT_HEAD(&s->tasks, task, list);
>>>> in block_copy_dirty_clusters()?
>>>>
>>>> By doing that, I think we also spare @bytes from the critical 
>>>> section, since it is only read from that point onwards.
>>>
>>> This way find_conflicting_tasks will just skip our new creating 
>>> task.. And we'll get conflict when try to add our new task. No, we 
>>> should add task to the list at same critical section where we clear 
>>> dirty bits from the bitmap.
>>
>>
>> I agree, with the above.
>> So to me the most correct solution would be to call create and shrink 
>> in the same lock, but this creates a much wider critical section.
>>
>> Alternatively, I can leave it as it is and just update the comment.
>>
>>>
>>> Then we shrink task in another critical section, it should be OK too.
>>>
>>>>
>>>> I am also trying to see if I can group some critical sections.
>>>>
>>>> Btw I think we already talked about @bytes and it's not the first 
>>>> time we switch it from IN to STATE and vice-versa...
>>>> I mean, I agree with you but it starts to be confusing.
>>>
>>> On last review it seemed to me that you actually protect bytes by 
>>> critical section where it is needed. So here I'm saying only about 
>>> the comment..
>>>
>>>>
>>>>
>>>> This also goes against your comment later in patch 4,
>>>>>> @@ -212,7 +222,7 @@ static BlockCopyTask 
>>>>>> *block_copy_task_create(BlockCopyState *s,
>>>>>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>>>>>         /* region is dirty, so no existent tasks possible in it */
>>>>>> -    assert(!find_conflicting_task(s, offset, bytes));
>>>>>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>>>>>         bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>>>>>       s->in_flight_bytes += bytes;
>>>>>> @@ -248,16 +258,19 @@ static void coroutine_fn 
>>>>>> block_copy_task_shrink(BlockCopyTask *task,
>>>>>
>>>>> The function reads task->bytes not under mutex.. It's safe, as only 
>>>>> that function is modifying the field, and it's called once. Still, 
>>>>> let's make critical section a little bit wider, just for 
>>>>> simplicity. I mean, simple QEMU_LOCK_GUARD() at start of function. 
>>>>
>>>> Where if I understand correctly, it is not safe, because 
>>>> find_conflicting_tasks might search the non-updated task.
>>>>
>>>
>>> find_conflicting_tasks only reads bytes, so it can't make damage.. 
>>> Anyway making critical sections a bit wider won't hurt.
>>>
>>>
>>
> 
> 


