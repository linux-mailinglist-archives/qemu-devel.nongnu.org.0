Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F0380B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYZG-0007Ov-UP
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhYWp-000591-Nn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lhYWh-0001We-Mg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621001450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4KVFz9XdycCYjlsMvUw7qpPNcGdoLgf7WV/3ogRkcI=;
 b=MOvFfpZVwYK5L5l53CfD9pkjPI6oU/m49xSDi5YL5X0SJerZc6GoYxJPmdcA4oYyRGRA0M
 n0BfA427v6G2Uk+CKg27St03IyPrLCwV4+K2S7f/SRDSJHw7E+6oqrs01Ts5n3Zh5ScbdA
 5ggby+xONKbZNmVd7pzrYNiarWDTQ2g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-6r95e_gePciQ3nBa7Wo4Fg-1; Fri, 14 May 2021 10:10:49 -0400
X-MC-Unique: 6r95e_gePciQ3nBa7Wo4Fg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d8-20020a0564020008b0290387d38e3ce0so16446147edu.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T4KVFz9XdycCYjlsMvUw7qpPNcGdoLgf7WV/3ogRkcI=;
 b=knrNlkY/p15IDabGX7ESdI6EFb+iOmmiqhi9iFZZ+HrZFBpzmmLYinZgbi29cweVWo
 gKBaFTrfFn5AZvGLb7LVy0sFEsEzD60oouUzYTmXWVBTGk865wdh/1IQ9XJPa11kh5K7
 O9dnclsfqsPshAXuj5Gd4UV5K9yZDvKu6HQKXmCdfQwNNSEqvyl5qBYlFRVUEE9dIrF4
 v9HTCmyjnq4o89vd4l6CSC77Wm7wcMVJ98vtrc808TxFTt3EwNy5haqXS4FhR3FEraEl
 WfLrbO0mQ9EfVqZZwzw4BzHpaL3A8dZhwKJiplUFm4KuhaU/Klymgh0euMU+d37xhGx6
 zq6Q==
X-Gm-Message-State: AOAM531JlMtE4ISsetQr2a+aOWI8GVc5HC2FecExTL3N9Z76S51L8rqs
 +uyNvzp6maHsp7EmClXj6YkQEE/RLgQrl5ULJUSK5okeHsUNHzch1M20RU0Hl3hjKmG6bEe8LSf
 6nyoFHlq3y4/0N3j9tT4snmKEmc0OnDo4sUFQEap9AukSj0MZZ0bZTaliVGknF1RAoz0=
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr30412776ejk.94.1621001442336; 
 Fri, 14 May 2021 07:10:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO7e1cyOfSRTaJFqKr/Dnfxx+6z4/qHuUQG5pisKjxAldkqC03sUw+hlcLSxBmXjpDsQnI4Q==
X-Received: by 2002:a17:906:1f54:: with SMTP id
 d20mr30412116ejk.94.1621001435408; 
 Fri, 14 May 2021 07:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 p14sm4575308eds.28.2021.05.14.07.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:10:33 -0700 (PDT)
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
 <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <6d1e432e-f18a-39a4-0bb6-2a14347c2905@redhat.com>
Date: Fri, 14 May 2021 16:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/05/2021 17:44, Stefan Hajnoczi wrote:
> On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe Esposito wrote:
>> co-shared-resource is currently not thread-safe, as also reported
>> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
>> can also be invoked from non-coroutine context.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> Hmm...this thread-safety change is more fine-grained than I was
> expecting. If we follow this strategy basically any data structure used
> by coroutines needs its own fine-grained lock (like Java's Object base
> class which has its own lock).
> 
> I'm not sure I like it since callers may still need coarser grained
> locks to protect their own state or synchronize access to multiple
> items of data. Also, some callers may not need thread-safety.
> 
> Can the caller to be responsible for locking instead (e.g. using
> CoMutex)?

Right now co-shared-resource is being used only by block-copy, so I 
guess locking it from the caller or within the API won't really matter 
in this case.

One possible idea on how to delegate this to the caller without adding 
additional small lock/unlock in block-copy is to move co_get_from_shres 
in block_copy_task_end, and calling it only when a boolean passed to 
block_copy_task_end is true.

Otherwise make b_c_task_end always call co_get_from_shres and then 
include co_get_from_shres in block_copy_task_create, so that we always 
add and in case remove (if error) in the shared resource.

Something like:

diff --git a/block/block-copy.c b/block/block-copy.c
index 3a447a7c3d..1e4914b0cb 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -233,6 +233,7 @@ static coroutine_fn BlockCopyTask 
*block_copy_task_create(BlockCopyState *s,
      /* region is dirty, so no existent tasks possible in it */
      assert(!find_conflicting_task(s, offset, bytes));
      QLIST_INSERT_HEAD(&s->tasks, task, list);
+    co_get_from_shres(s->mem, task->bytes);
      qemu_co_mutex_unlock(&s->tasks_lock);

      return task;
@@ -269,6 +270,7 @@ static void coroutine_fn 
block_copy_task_end(BlockCopyTask *task, int ret)
          bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, 
task->bytes);
      }
      qemu_co_mutex_lock(&task->s->tasks_lock);
+    co_put_to_shres(task->s->mem, task->bytes);
      task->s->in_flight_bytes -= task->bytes;
      QLIST_REMOVE(task, list);
      progress_set_remaining(task->s->progress,
@@ -379,7 +381,6 @@ static coroutine_fn int 
block_copy_task_run(AioTaskPool *pool,

      aio_task_pool_wait_slot(pool);
      if (aio_task_pool_status(pool) < 0) {
-        co_put_to_shres(task->s->mem, task->bytes);
          block_copy_task_end(task, -ECANCELED);
          g_free(task);
          return -ECANCELED;
@@ -498,7 +499,6 @@ static coroutine_fn int 
block_copy_task_entry(AioTask *task)
      }
      qemu_mutex_unlock(&t->s->calls_lock);

-    co_put_to_shres(t->s->mem, t->bytes);
      block_copy_task_end(t, ret);

      return ret;
@@ -687,8 +687,6 @@ block_copy_dirty_clusters(BlockCopyCallState 
*call_state)

          trace_block_copy_process(s, task->offset);

-        co_get_from_shres(s->mem, task->bytes);
-
          offset = task_end(task);
          bytes = end - offset;




> 
>> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resource.c
>> index 1c83cd9d29..c455d02a1e 100644
>> --- a/util/qemu-co-shared-resource.c
>> +++ b/util/qemu-co-shared-resource.c
>> @@ -32,6 +32,7 @@ struct SharedResource {
>>       uint64_t available;
>>   
>>       CoQueue queue;
>> +    QemuMutex lock;
> 
> Please add a comment indicating what this lock protects.
> 
> Thread safety should also be documented in the header file so API users
> know what to expect.

Will do, thanks.

Emanuele


