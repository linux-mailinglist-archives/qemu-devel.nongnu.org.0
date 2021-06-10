Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4573A2EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:51:15 +0200 (CEST)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM1a-0005aL-5L
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrLzx-0004ee-Dz
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lrLzt-0003da-JV
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbLv54PpQi+d1lyJVMoM4g/QkXPTNk8QL1OGe32vr08=;
 b=HoDeXL0IATRdxztQcvRB5zGgr12bvKby5IpFQz3mMPGVov/XA4z07kxVaXu/HjdSmZnjh+
 WIHU44n438LhmO9GV8OexvKvNFEr1kHsm7GN+qGm+s9cKS4h0+Q+1SHnQUOuvRdbFk+ITV
 6NZ0xLjtXTCB7yKa4TlwSbwkyB1+xiw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-znEO4FhzPLmMXGDswK_4lw-1; Thu, 10 Jun 2021 10:49:27 -0400
X-MC-Unique: znEO4FhzPLmMXGDswK_4lw-1
Received: by mail-ed1-f69.google.com with SMTP id
 x12-20020a05640226ccb0290393aaa6e811so4509296edd.19
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xbLv54PpQi+d1lyJVMoM4g/QkXPTNk8QL1OGe32vr08=;
 b=kGeWctzKsotkb4tMjtgCVBDTmEkmWi/V+Dqw5204fs/Ceb6dGrWf3TrSWC/HmWgE06
 +7MDV1HOLDVph3j1uGn81x9VadkOd92BAvn1uaLon9HTmli8SX29tQfVjMWf2NIcfUB+
 ThQbtex/cFSLyISGPLLrUMPKRFCoK4CwUv2dtkkTeLt80kEbH+tzZET108fkOIopr3rC
 Vmaj0Dk7OhATy5EDJAIAoRHhwPmkI3gAQ5rpnlr3kihWkmjbcbkKSFxo2M5vHQi8MscT
 Uau0N7Qr3+M1nWhKYdMiZYJBwb5PINs4gEMTKK/Q7F6OeCoa1MmB5JCUgIDqWW12SoVd
 TR7w==
X-Gm-Message-State: AOAM531EAzT6t9h9+aL2RhrAxCP47sramTj7lbkvO5xA7AoVU+G3cewM
 0gFfgn4ZmZkx83Zo36Q9wTagy5/6poYPUQVKB+pe9sZSGFM9IoMw+jBdKuQDiba9kkI8Tgs7fQV
 JsC9YV/lxYiA3tWbQYU2kWDO8jAz5yfkwY5wf8BIg6R0uSwDP3E5h5ziMzjtB+lyoK0A=
X-Received: by 2002:a17:907:970f:: with SMTP id
 jg15mr4924983ejc.59.1623336565949; 
 Thu, 10 Jun 2021 07:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Flrsnb2zIvAxWC7r4zP93xC1r4sJ599Srm5dV4b+c+js8CjD/A5Uij0gRmsq4imInsYMYw==
X-Received: by 2002:a17:907:970f:: with SMTP id
 jg15mr4924968ejc.59.1623336565637; 
 Thu, 10 Jun 2021 07:49:25 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 b10sm1503742edf.77.2021.06.10.07.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:49:24 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] block-copy: add a CoMutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210608073344.53637-1-eesposit@redhat.com>
 <20210608073344.53637-5-eesposit@redhat.com>
 <94c227e0-e179-f675-cd77-d470e0aaec9b@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <19394f9e-5aca-222f-dc70-9089da99b598@redhat.com>
Date: Thu, 10 Jun 2021 16:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <94c227e0-e179-f675-cd77-d470e0aaec9b@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 09/06/2021 14:25, Vladimir Sementsov-Ogievskiy wrote:
> 08.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> Add a CoMutex to protect concurrent access of block-copy
>> data structures.
>>
>> This mutex also protects .copy_bitmap, because its thread-safe
>> API does not prevent it from assigning two tasks to the same
>> bitmap region.
>>
>> .finished, .cancelled and reads to .ret and .error_is_read will be
>> protected in the following patch, because are used also outside
>> coroutines.
>>
>> Also set block_copy_task_create as coroutine_fn because:
>> 1) it is static and only invoked by coroutine functions
>> 2) this patch introduces and uses a CoMutex lock there
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I missed, did you (where?) add a comment like "all APIs are 
> thread-safe", or what is thread-safe?

You're right, I can't find that comment too. I will add it once more.
> 
>> ---
>>   block/block-copy.c | 82 ++++++++++++++++++++++++++++++----------------
>>   1 file changed, 54 insertions(+), 28 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index e2adb5b2ea..56f62913e4 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -61,6 +61,7 @@ typedef struct BlockCopyCallState {
>>       /* OUT parameters */
>>       bool cancelled;
>> +    /* Fields protected by lock in BlockCopyState */
>>       bool error_is_read;
>>       int ret;
>>   } BlockCopyCallState;
>> @@ -78,7 +79,7 @@ typedef struct BlockCopyTask {
>>       int64_t bytes; /* only re-set in task_shrink, before running the 
>> task */
>>       BlockCopyMethod method; /* initialized in 
>> block_copy_dirty_clusters() */
>> -    /* State */
>> +    /* State. Protected by lock in BlockCopyState */
>>       CoQueue wait_queue; /* coroutines blocked on this task */
>>       /* To reference all call states from BlockCopyState */
>> @@ -99,7 +100,8 @@ typedef struct BlockCopyState {
>>       BdrvChild *source;
>>       BdrvChild *target;
>> -    /* State */
>> +    /* State. Protected by lock */
>> +    CoMutex lock;
>>       int64_t in_flight_bytes;
>>       BlockCopyMethod method;
>>       QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all 
>> block-copy calls */
>> @@ -139,8 +141,10 @@ typedef struct BlockCopyState {
>>       bool skip_unallocated;
>>   } BlockCopyState;
> 
> May be nitpicking, but if we want block_copy_set_progress_meter to be 
> threadsafe it should set s->progress under mutex. Or we should document 
> that it's not threadsafe and called once.

Document it definitely. It is only called by the job before starting 
block-copy, so it is safe to do as it is.

> 
> 
>> -static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
>> -                                            int64_t offset, int64_t 
>> bytes)
>> +/* Called with lock held */
>> +static BlockCopyTask *find_conflicting_task_locked(BlockCopyState *s,
>> +                                                   int64_t offset,
>> +                                                   int64_t bytes)
>>   {
>>       BlockCopyTask *t;
>> @@ -160,18 +164,22 @@ static BlockCopyTask 
>> *find_conflicting_task(BlockCopyState *s,
>>   static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, 
>> int64_t offset,
>>                                                int64_t bytes)
>>   {
>> -    BlockCopyTask *task = find_conflicting_task(s, offset, bytes);
>> +    BlockCopyTask *task;
>> +
>> +    QEMU_LOCK_GUARD(&s->lock);
>> +    task = find_conflicting_task_locked(s, offset, bytes);
>>       if (!task) {
>>           return false;
>>       }
>> -    qemu_co_queue_wait(&task->wait_queue, NULL);
>> +    qemu_co_queue_wait(&task->wait_queue, &s->lock);
>>       return true;
>>   }
>> -static int64_t block_copy_chunk_size(BlockCopyState *s)
>> +/* Called with lock held */
>> +static int64_t block_copy_chunk_size_locked(BlockCopyState *s)
>>   {
>>       switch (s->method) {
>>       case COPY_READ_WRITE_CLUSTER:
>> @@ -193,14 +201,16 @@ static int64_t 
>> block_copy_chunk_size(BlockCopyState *s)
>>    * Search for the first dirty area in offset/bytes range and create 
>> task at
>>    * the beginning of it.
>>    */
>> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>> -                                             BlockCopyCallState 
>> *call_state,
>> -                                             int64_t offset, int64_t 
>> bytes)
>> +static coroutine_fn BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>> +                                                BlockCopyCallState 
>> *call_state,
>> +                                                int64_t offset, 
>> int64_t bytes)
>>   {
>>       BlockCopyTask *task;
>> -    int64_t max_chunk = block_copy_chunk_size(s);
>> +    int64_t max_chunk;
>> -    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);
>> +    QEMU_LOCK_GUARD(&s->lock);
>> +    max_chunk = MIN_NON_ZERO(block_copy_chunk_size_locked(s),
>> +                             call_state->max_chunk);
>>       if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
>>                                              offset, offset + bytes,
>>                                              max_chunk, &offset, &bytes))
>> @@ -212,7 +222,7 @@ static BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
>>       /* region is dirty, so no existent tasks possible in it */
>> -    assert(!find_conflicting_task(s, offset, bytes));
>> +    assert(!find_conflicting_task_locked(s, offset, bytes));
>>       bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>       s->in_flight_bytes += bytes;
>> @@ -248,16 +258,19 @@ static void coroutine_fn 
>> block_copy_task_shrink(BlockCopyTask *task,
> 
> The function reads task->bytes not under mutex.. It's safe, as only that 
> function is modifying the field, and it's called once. Still, let's make 
> critical section a little bit wider, just for simplicity. I mean, simple 
> QEMU_LOCK_GUARD() at start of function.

Done.
> 
>>       assert(new_bytes > 0 && new_bytes < task->bytes);
>> -    task->s->in_flight_bytes -= task->bytes - new_bytes;
>> -    bdrv_set_dirty_bitmap(task->s->copy_bitmap,
>> -                          task->offset + new_bytes, task->bytes - 
>> new_bytes);
>> -
>> -    task->bytes = new_bytes;
>> -    qemu_co_queue_restart_all(&task->wait_queue);
>> +    WITH_QEMU_LOCK_GUARD(&task->s->lock) {
>> +        task->s->in_flight_bytes -= task->bytes - new_bytes;
>> +        bdrv_set_dirty_bitmap(task->s->copy_bitmap,
>> +                              task->offset + new_bytes,
>> +                              task->bytes - new_bytes);
>> +        task->bytes = new_bytes;
>> +        qemu_co_queue_restart_all(&task->wait_queue);
>> +    }
>>   }
>>   static void coroutine_fn block_copy_task_end(BlockCopyTask *task, 
>> int ret)
>>   {
>> +    QEMU_LOCK_GUARD(&task->s->lock);
>>       task->s->in_flight_bytes -= task->bytes;
>>       if (ret < 0) {
>>           bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, 
>> task->bytes);
>> @@ -335,6 +348,7 @@ BlockCopyState *block_copy_state_new(BdrvChild 
>> *source, BdrvChild *target,
>>       }
>>       ratelimit_init(&s->rate_limit);
>> +    qemu_co_mutex_init(&s->lock);
>>       QLIST_INIT(&s->tasks);
>>       QLIST_INIT(&s->calls);
>> @@ -390,6 +404,8 @@ static coroutine_fn int 
>> block_copy_task_run(AioTaskPool *pool,
> 
> Oops. seems block_copy_task_run misses block_copy_task_end() call 
> befokre freeing the task. preexisting bug..

Nope, it is not a bug.  .func() internally calls block_copy_task_end(). 
All good here.

> 
>>    * a full-size buffer or disabled if the copy_range attempt fails.  
>> The output
>>    * value of @method should be used for subsequent tasks.
>>    * Returns 0 on success.
>> + *
>> + * Called with lock held.
>>    */
>>   static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
>>                                              int64_t offset, int64_t 
>> bytes,
>> @@ -476,16 +492,20 @@ static coroutine_fn int 
>> block_copy_task_entry(AioTask *task)
>>       int ret;
>>       ret = block_copy_do_copy(s, t->offset, t->bytes, &method, 
>> &error_is_read);
>> -    if (s->method == t->method) {
>> -        s->method = method;
>> -    }
>> -    if (ret < 0) {
>> -        if (!t->call_state->ret) {
>> -            t->call_state->ret = ret;
>> -            t->call_state->error_is_read = error_is_read;
>> +
>> +    WITH_QEMU_LOCK_GUARD(&t->s->lock) {
>> +        if (s->method == t->method) {
>> +            s->method = method;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            if (!t->call_state->ret) {
>> +                t->call_state->ret = ret;
>> +                t->call_state->error_is_read = error_is_read;
>> +            }
>> +        } else {
>> +            progress_work_done(t->s->progress, t->bytes);
>>           }
>> -    } else {
>> -        progress_work_done(t->s->progress, t->bytes);
>>       }
>>       co_put_to_shres(t->s->mem, t->bytes);
>>       block_copy_task_end(t, ret);
>> @@ -587,10 +607,12 @@ int64_t 
>> block_copy_reset_unallocated(BlockCopyState *s,
>>       bytes = clusters * s->cluster_size;
>>       if (!ret) {
>> +        qemu_co_mutex_lock(&s->lock);
>>           bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>>           progress_set_remaining(s->progress,
>>                                  bdrv_get_dirty_count(s->copy_bitmap) +
>>                                  s->in_flight_bytes);
>> +        qemu_co_mutex_unlock(&s->lock);
>>       }
>>       *count = bytes;
>> @@ -729,7 +751,9 @@ static int coroutine_fn 
>> block_copy_common(BlockCopyCallState *call_state)
>>   {
>>       int ret;
>> +    qemu_co_mutex_lock(&call_state->s->lock);
>>       QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
>> +    qemu_co_mutex_unlock(&call_state->s->lock);
>>       do {
>>           ret = block_copy_dirty_clusters(call_state);
>> @@ -756,7 +780,9 @@ static int coroutine_fn 
>> block_copy_common(BlockCopyCallState *call_state)
>>           call_state->cb(call_state->cb_opaque);
>>       }
>> +    qemu_co_mutex_lock(&call_state->s->lock);
>>       QLIST_REMOVE(call_state, list);
>> +    qemu_co_mutex_unlock(&call_state->s->lock);
>>       return ret;
>>   }
>>
> 
> I looked through the whole file on top of the series, and it seems 
> overall OK to me. I still don't really like additional atomics, but they 
> probably should be refactored together with refactoring all 
> status-getters into one block_copy_call_status().. So it's a work for 
> some future day, I will not do it in parallel :)
> 
> I don't insist, but for me patches 2,4,5 only make sense as a whole, so, 
> I'd merge them into one patch called "make block-copy APIs thread-safe". 
> Otherwise, thread-safety comes only in last patch, and patches 2 and 4 
> are a kind of preparations that hard to review in separate.

I will try to see how they look. I think that separate do not look too 
bad, putting everything together might be very difficult to understand. 
And this stuff is already complicated on its own...

Thank you,
Emanuele
> 
> Anyway, reviewing of such change is a walk through the whole file trying 
> to understand, how much is it thread-safe now.
> 


