Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A230938FE6F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:08:54 +0200 (CEST)
Received: from localhost ([::1]:39682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTzZ-0008MK-Ho
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llTyI-0007YP-MG
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1llTyF-0005Sn-S6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621937250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mmr/T26Yck8rFQmPN+fFGuZkBab8DFzIy2nEH5DRdGY=;
 b=dAHRUKGsqI0hWFCD1rJsULoI1tkc078WPUocSgQO6/naoG8vzDmM6sqShbWraENc3mnTzc
 Md/p1CBmSTLfaluBW/q108LiyGur4ozU2YwCyZZXvnCpiqXCMwi4XlkyMVTvzBMI4XQmmC
 NNZEBZ9aWI4mssnuFV2XaumStoWwX7A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-j2UeKN4aPDG50u2wrDKbPA-1; Tue, 25 May 2021 06:07:29 -0400
X-MC-Unique: j2UeKN4aPDG50u2wrDKbPA-1
Received: by mail-ej1-f71.google.com with SMTP id
 eb10-20020a170907280ab02903d65bd14481so8288581ejc.21
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mmr/T26Yck8rFQmPN+fFGuZkBab8DFzIy2nEH5DRdGY=;
 b=HkzEocxrJ2GX0FPRjgNqiUqDIaX/EPmG1KayRZqUgtL/sNO6X855ZrtDZGIDE+jaFg
 UH7n+xaKCWQHK6Ac5aY7vnkciKuMME3mlVLs0plDTZlVc5TmQ92gt4RtzHsJfwLZs+Ue
 T9c2nJ+2jBzm6J7CLu9Qr3ZrN1uAL7//MgrFT52LaNI6YvSFysabVHArqcFgvhM08gty
 jcRQxf/MaE0iLKVm+MjxUg6zl/Yo4bB8k4BzP8Xz7xtHNb0jNKoBsfL6t441+FNu2yT/
 pguy0rQEFWBtR+HURwDCZaolikOXJRrud68bdMdgTsH09DJmjAE+N9Ti6o7tQIMfAbxL
 fsHg==
X-Gm-Message-State: AOAM5304O4M1G+jkA54cgWAB+x19FYJ3Kq8Taj+9j+db2mAdbS7SQxI3
 5dMzKhuR4uwZq2Gs/rCOiA60TY3/j6rADNAVmG9wC/n5DHjKShEcR0zubLVh7srvTG8oYhTuVJC
 iInKPutI9ujFbo0oTuJxqM44Q+cOCxSCBDFMOVESACXXg75Vzn4rq9/j5OBAziMuFPKo=
X-Received: by 2002:a17:906:148f:: with SMTP id
 x15mr11384450ejc.535.1621937247522; 
 Tue, 25 May 2021 03:07:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQUB3FntAICuaOu06evrDcmlDUV9603RsfJW2DNRsPPo6jyYbkoDQfyYTkXwViUa2BV/MxLQ==
X-Received: by 2002:a17:906:148f:: with SMTP id
 x15mr11384422ejc.535.1621937247291; 
 Tue, 25 May 2021 03:07:27 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 l25sm8960024ejk.100.2021.05.25.03.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 03:07:26 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
 <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <26cc90a9-756d-902e-3559-81cc01439e24@redhat.com>
Date: Tue, 25 May 2021 12:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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



On 20/05/2021 17:19, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> Because the list of tasks is only modified by coroutine
>> functions, add a CoMutex in order to protect them.
>>
>> Use the same mutex to protect also BlockCopyState in_flight_bytes
>> field to avoid adding additional syncronization primitives.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 55 +++++++++++++++++++++++++++++-----------------
>>   1 file changed, 35 insertions(+), 20 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 2e610b4142..3a949fab64 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -83,7 +83,7 @@ typedef struct BlockCopyTask {
>>        */
>>       bool zeroes;
>> -    /* State */
>> +    /* State. Protected by tasks_lock */
>>       CoQueue wait_queue; /* coroutines blocked on this task */
>>       /* To reference all call states from BlockCopyState */
>> @@ -106,8 +106,9 @@ typedef struct BlockCopyState {
>>       BdrvChild *target;
>>       /* State */
>> -    int64_t in_flight_bytes;
>> +    int64_t in_flight_bytes; /* protected by tasks_lock */
> 
> only this field is protected? or the whole State section?

I guess you figured it already, here there is only in_flight_bytes 
because in next patches I take care of the others.

[...]

>>   }
>> @@ -213,11 +219,7 @@ static coroutine_fn BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>>       assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
>>       bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
> 
> Looking at block_copy_task_create():
> 
> First, !bdrv_dirty_bitmap_next_dirty_area() doesn't take bitmaps lock, 
> so it's not protected at all.
> 
> Next, even if we take bitmaps lock in 
> bdrv_dirty_bitmap_next_dirty_area() or around it, it doesn't bring 
> thread-safety to block_copy_task_create():

The simplest solution here seems to protect 
bdrv_dirty_bitmap_next_dirty_area and also bdrv_reset_dirty_bitmap with 
the tasks lock, so that once it is released the bitmap is updated 
accordingly and from my understanding no other task can get that region.

Btw, out of curiosity, why is bdrv_dirty_bitmap_next_dirty_area not 
protected by a lock? Can't we have a case where two threads (like you 
just mention below) check the bitmap? Or am I missing something?

> 
> Imagine block_copy_task_create() is called from two threads 
> simultaneously. Both calls will get same dirty area and create equal 
> tasks. Then, "assert(!find_conflicting_task_locked(s, offset, bytes));" 
> will crash.
> 


> 
>> -    /* region is dirty, so no existent tasks possible in it */
>> -    assert(!find_conflicting_task(s, offset, bytes));
>> -
>>       bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
>> -    s->in_flight_bytes += bytes;
>>       task = g_new(BlockCopyTask, 1);
>>       *task = (BlockCopyTask) {
>> @@ -228,7 +230,13 @@ static coroutine_fn BlockCopyTask 
>> *block_copy_task_create(BlockCopyState *s,
>>           .bytes = bytes,
>>       };
>>       qemu_co_queue_init(&task->wait_queue);
>> -    QLIST_INSERT_HEAD(&s->tasks, task, list);
>> +
>> +    WITH_QEMU_LOCK_GUARD(&s->tasks_lock) {
>> +        s->in_flight_bytes += bytes;
>> +        /* region is dirty, so no existent tasks possible in it */
>> +        assert(!find_conflicting_task_locked(s, offset, bytes));
>> +        QLIST_INSERT_HEAD(&s->tasks, task, list);
>> +    }
>>       return task;
>>   }
>> @@ -249,25 +257,29 @@ static void coroutine_fn 
>> block_copy_task_shrink(BlockCopyTask *task,
>>       assert(new_bytes > 0 && new_bytes < task->bytes);
>> -    task->s->in_flight_bytes -= task->bytes - new_bytes;
>>       bdrv_set_dirty_bitmap(task->s->copy_bitmap,
>>                             task->offset + new_bytes, task->bytes - 
>> new_bytes);
> 
> Then look here. Imagine, immediately after bdrv_set_dirty_bitmap() in 
> parallel thread the new task is created, which consumes these new dirty 
> bits. Again, it will find conflicting task (this one, as task->bytes is 
> not modified yet) and crash.

Also here, the lock guard should be enlarged to cover also the dirty 
bitmap. Thank you for pointing these cases!

Emanuele

> 
>> -    task->bytes = new_bytes;
>> -    qemu_co_queue_restart_all(&task->wait_queue);
>> +    WITH_QEMU_LOCK_GUARD(&task->s->tasks_lock) {
>> +        task->s->in_flight_bytes -= task->bytes - new_bytes;
>> +        task->bytes = new_bytes;
>> +        qemu_co_queue_restart_all(&task->wait_queue);
>> +    }
>>   }


