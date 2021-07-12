Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846953C461B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:46:46 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2raP-0007cL-Ig
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXa-0004p2-3A
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rXX-00014f-9u
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLrH2a9zmx5KfNZI/Um+Dh1eMLwy6m5+IeeKMutpVII=;
 b=SE5l5L3NwfpnMF6mPZ3Ru+aeBFzqqDpVprKzzCgKT4ABXiMBrwfjqEp938oF+j0QivGImH
 Ao1WsQO3qMYpH7nVh18GdcjIHC2RN+fH5SOHcdLa9bQY5smzgzCZOYBX1uP/dBOXfnSIhd
 OcOUpqdSEWQL2X6K1IxQ8EPasOJUSqY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-ktdQ_S5VNpKh6ls8dbx9xw-1; Mon, 12 Jul 2021 04:43:45 -0400
X-MC-Unique: ktdQ_S5VNpKh6ls8dbx9xw-1
Received: by mail-ej1-f72.google.com with SMTP id
 br1-20020a170906d141b02905119310d7b9so786482ejb.23
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fLrH2a9zmx5KfNZI/Um+Dh1eMLwy6m5+IeeKMutpVII=;
 b=rW4Vef7tq0RR35itcLyfc3RQn/pKh6M9lWGDJRqc3zG2+5ezIR8xREZ0eGk7IsG0bq
 tdS1FWfgmSBiltYMeSoA2tzBIDNWuqxPPXR2bHEw4PUxltrQ1fKZDB2TNQkB1zIkYGIZ
 ntHeSDtiJHb99D0mc1A7F5j0fYa0XGyY2FmpJHBhpHZ1nA1pIET9iXg9qmRd7PhY+Q6Q
 pHMHiHMdFJ7bGqIescgSb6jRur77UGCpJ5jg7QogeCdQjxE5ONQRm5EvFbVfsQ2T8bBD
 Fr9mce35GqXPuM4Q4xKkaQ/0FxSKpZJ53poJ9q+ubM6sklFs1lPS1DnA64gB/vDoflbi
 IV9Q==
X-Gm-Message-State: AOAM533A/zvjtjOw/utMMCoPMxU1pmMObtT4BJIcQNdmNYMtEYlbcYPu
 C2fDxbhyp+QGgdXYjIxHJWv6B0WpPk43JaimjD15qmj09IEJ8tWtiUOHFtCuDnUZyudXZlJ8Nfx
 d4SSW16gTBSTrfNEqvj4A3Q9iuauavbr2xz50fNcxZDYsSZnGRNweWWiqmGDZS9f828M=
X-Received: by 2002:a05:6402:22bb:: with SMTP id
 cx27mr25434403edb.96.1626079423930; 
 Mon, 12 Jul 2021 01:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSKTAyiQq2Y8bcBz9mPsGUwsdDgsDtVNbHMtL3mFVYJ9LexbNu8pRxgIGXZwGhAQ8P1cyvgA==
X-Received: by 2002:a05:6402:22bb:: with SMTP id
 cx27mr25434384edb.96.1626079423718; 
 Mon, 12 Jul 2021 01:43:43 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 op26sm577788ejb.27.2021.07.12.01.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:43:43 -0700 (PDT)
Subject: Re: [RFC PATCH 5/6] job: use global job_mutex to protect struct Job
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-6-eesposit@redhat.com>
 <YOb16JltX56P88Vo@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <e039cc40-86de-0e04-8783-15e6bbf6053e@redhat.com>
Date: Mon, 12 Jul 2021 10:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YOb16JltX56P88Vo@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 14:56, Stefan Hajnoczi wrote:
> On Wed, Jul 07, 2021 at 06:58:12PM +0200, Emanuele Giuseppe Esposito wrote:
>> This lock is going to replace most of the AioContext locks
>> in the job and blockjob, so that a Job can run in an arbitrary
>> AioContext.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/block/blockjob_int.h |   1 +
>>   include/qemu/job.h           |   2 +
>>   block/backup.c               |   4 +
>>   block/mirror.c               |  11 +-
>>   blockdev.c                   |  62 ++++----
>>   blockjob.c                   |  67 +++++++--
>>   job-qmp.c                    |  55 +++----
>>   job.c                        | 284 +++++++++++++++++++++++++++--------
>>   qemu-img.c                   |  15 +-
>>   9 files changed, 350 insertions(+), 151 deletions(-)
>>
>> diff --git a/include/block/blockjob_int.h b/include/block/blockjob_int.h
>> index 6633d83da2..8b91126506 100644
>> --- a/include/block/blockjob_int.h
>> +++ b/include/block/blockjob_int.h
>> @@ -53,6 +53,7 @@ struct BlockJobDriver {
>>        */
>>       void (*attached_aio_context)(BlockJob *job, AioContext *new_context);
>>   
>> +    /* Called with job mutex *not* held. */
>>       void (*set_speed)(BlockJob *job, int64_t speed);
>>   };
>>   
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 4421d08d93..359f4e6b3a 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -49,6 +49,8 @@ typedef struct Job {
>>       /**
>>        * The type of this job.
>>        * Set it in job_create and just read.
>> +     * All calls to the driver function must be not locked by job_mutex,
>> +     * to avoid deadlocks.
>>        */
>>       const JobDriver *driver;
>>   
>> diff --git a/block/backup.c b/block/backup.c
>> index bd3614ce70..80ce956299 100644
>> --- a/block/backup.c
>> +++ b/block/backup.c
>> @@ -315,6 +315,10 @@ static void coroutine_fn backup_pause(Job *job)
>>       }
>>   }
>>   
>> +/*
>> + * Called with job mutex *not* held (we don't want to call block_copy_kick
>> + * with the lock held!)
>> + */
>>   static void coroutine_fn backup_set_speed(BlockJob *job, int64_t speed)
>>   {
>>       BackupBlockJob *s = container_of(job, BackupBlockJob, common);
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 49aaaafffa..deefaa6a39 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -1150,9 +1150,11 @@ static void mirror_complete(Job *job, Error **errp)
>>       s->should_complete = true;
>>   
>>       /* If the job is paused, it will be re-entered when it is resumed */
>> +    job_lock();
>>       if (!job_is_paused(job)) {
>> -        job_enter(job);
>> +        job_enter_locked(job);
>>       }
>> +    job_unlock();
>>   }
>>   
>>   static void coroutine_fn mirror_pause(Job *job)
>> @@ -1171,10 +1173,13 @@ static bool mirror_drained_poll(BlockJob *job)
>>        * from one of our own drain sections, to avoid a deadlock waiting for
>>        * ourselves.
>>        */
>> -    if (!job_is_paused(&s->common.job) && !job_is_cancelled(&s->common.job) &&
>> -        !s->in_drain) {
>> +    job_lock();
>> +    if (!job_is_paused(&s->common.job) &&
>> +        !job_is_cancelled_locked(&s->common.job) && !s->in_drain) {
>> +        job_unlock();
>>           return true;
>>       }
>> +    job_unlock();
>>   
>>       return !!s->in_flight;
>>   }
>> diff --git a/blockdev.c b/blockdev.c
>> index 8e2c15370e..9255aea6a2 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -150,9 +150,11 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>>               AioContext *aio_context = job_get_aiocontext(&job->job);
>>               aio_context_acquire(aio_context);
>>   
>> +            job_lock();
>>               job_cancel(&job->job, false);
>>   
>>               aio_context_release(aio_context);
>> +            job_unlock();
> 
> This looks strange. The way it's written suggests there is a reason why
> job_unlock() has to be called after aio_context_release(). Can
> job_unlock() be called immediately after job_cancel()?

Yes, another mistake I shouldn't have done.
> 
>>           }
>>       }
>>   
>> @@ -3309,48 +3311,44 @@ out:
>>       aio_context_release(aio_context);
>>   }
>>   
>> -/* Get a block job using its ID and acquire its AioContext */
>> -static BlockJob *find_block_job(const char *id, AioContext **aio_context,
>> -                                Error **errp)
>> +/* Get a block job using its ID and acquire its job_lock */
> 
> "its" suggests job_lock is per-Job. I suggest saying something like
> "Returns with job_lock held on success" instead.
> 
Agree. Changed the same comment also for find_job() in job-qmp.c

Emanuele


