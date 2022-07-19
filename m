Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663D579D63
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:51:04 +0200 (CEST)
Received: from localhost ([::1]:57854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmgo-0000ww-Bh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmeq-0005ow-Do
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:49:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmel-0007jb-VW
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658234935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raC5UrMcYOkWtGBHG7phdXg31oe6smiLYn3ZHtR2C8I=;
 b=d5ZHeZjirQ32Q+pnzS4FYOJUfBDPLZ1u4iDx7J98KyWbraycgiQaSfVenqdIQ9EsFWpHnr
 za/6rU0OmX98mdZfbqgHMC1dor10MMBt+iVC0Gm9SZngyKt0DW58x8nSQ1BU4PU9ylE9sr
 o3PhaSri0KY8KKx36E8AOer6cmHgdmY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-gBcJIiZdNQeo33kx7wfbWQ-1; Tue, 19 Jul 2022 08:48:53 -0400
X-MC-Unique: gBcJIiZdNQeo33kx7wfbWQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk21-20020a05620a1a1500b006b5c24695a4so11727121qkb.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=raC5UrMcYOkWtGBHG7phdXg31oe6smiLYn3ZHtR2C8I=;
 b=XEu9nVRVqvUWZwS9lkfNtj2pEkbuHghyfQ5WdC1M47MKS/rRQZvIJQcBTJH+HkguYr
 n3a6majWRb/cztbOoXpkCErXF3rENKDam1Tt0/w8v+la/jvsTz053XBfcvuYCaq6tMAx
 Cq+Q6JqNrJq0SGI9rrvtm6a6nYpz6TG4uvVDo4WQnqtqnOWuVodgUngqa64qk20wIMiS
 nFrJzVhfmHF9YK+QqzdRtWJXOj9YCfQ76k61nyhYIF6WSVMY6ry4MpFkMW7UfAGjVO2B
 8k5bSD7WyyGhXrnSfUFXXhn3oic6N12r1A2XJHb+6gQX9+FA89LfsP80FNSY3WZptdq0
 1drA==
X-Gm-Message-State: AJIora/8KwY30DVJfZj/vB74GRvfcBogPMw/DF9Va9dXbje4cnuwzlGH
 h/HqMCxjsVAjTW43uNNL8V5Xee5KYy67ioJUf/uICCDL8d6x7l8GnYL+1DgaHf06BbnSMd8R5tY
 aryfzrUzWn3lKhT8=
X-Received: by 2002:ad4:5be9:0:b0:473:558e:84b9 with SMTP id
 k9-20020ad45be9000000b00473558e84b9mr24121450qvc.8.1658234933360; 
 Tue, 19 Jul 2022 05:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vk6trhcspdyolBwlPO1SXDZC3oio2CjHpaqrit6wYgo2e10F7RZQEBA9F3HvXKFs+3IzwXpg==
X-Received: by 2002:ad4:5be9:0:b0:473:558e:84b9 with SMTP id
 k9-20020ad45be9000000b00473558e84b9mr24121434qvc.8.1658234933103; 
 Tue, 19 Jul 2022 05:48:53 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bn7-20020a05620a2ac700b006b5d0b9c5d8sm10897884qkb.116.2022.07.19.05.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 05:48:52 -0700 (PDT)
Message-ID: <c281c26a-97e0-651e-7988-8b7c350160dd@redhat.com>
Date: Tue, 19 Jul 2022 14:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 14/21] jobs: protect job.aio_context with BQL and
 job_mutex
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-15-eesposit@redhat.com>
 <07e652a7-a56a-4097-469a-94899140cf8a@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <07e652a7-a56a-4097-469a-94899140cf8a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11/07/2022 um 16:19 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> In order to make it thread safe, implement a "fake rwlock",
>> where we allow reads under BQL *or* job_mutex held, but
>> writes only under BQL *and* job_mutex.
>>
>> The only write we have is in child_job_set_aio_ctx
> 
> also in job_create of course, but it seems safe anyway
> 
>> , which always
>> happens under drain (so the job is paused).
>> For this reason, introduce job_set_aio_context and make sure that
>> the context is set under BQL, job_mutex and drain.
>> Also make sure all other places where the aiocontext is read
>> are protected.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block/replication.c |  6 ++++--
>>   blockjob.c          |  3 ++-
>>   include/qemu/job.h  | 19 ++++++++++++++++++-
>>   job.c               | 12 ++++++++++++
>>   4 files changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/replication.c b/block/replication.c
>> index 55c8f894aa..2189863df1 100644
>> --- a/block/replication.c
>> +++ b/block/replication.c
>> @@ -148,8 +148,10 @@ static void replication_close(BlockDriverState *bs)
>>       }
>>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>>           commit_job = &s->commit_job->job;
>> -        assert(commit_job->aio_context ==
>> qemu_get_current_aio_context());
>> -        job_cancel_sync(commit_job, false);
>> +        WITH_JOB_LOCK_GUARD() {
>> +            assert(commit_job->aio_context ==
>> qemu_get_current_aio_context());
>> +            job_cancel_sync_locked(commit_job, false);
>> +        }
>>       }
>>         if (s->mode == REPLICATION_MODE_SECONDARY) {
>> diff --git a/blockjob.c b/blockjob.c
>> index bce05a9096..0d120ed126 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -166,12 +166,13 @@ static void child_job_set_aio_ctx(BdrvChild *c,
>> AioContext *ctx,
>>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>>       }
>>   -    job->job.aio_context = ctx;
>> +    job_set_aio_context(&job->job, ctx);
>>   }
>>     static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>>   {
>>       BlockJob *job = c->opaque;
>> +    assert(qemu_in_main_thread());
>>         return job->job.aio_context;
>>   }
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 5709e8d4a8..c144aabefc 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -77,7 +77,12 @@ typedef struct Job {
>>         /** Protected by AioContext lock */
>>   -    /** AioContext to run the job coroutine in */
>> +    /**
>> +     * AioContext to run the job coroutine in.
>> +     * This field can be read when holding either the BQL (so we are in
>> +     * the main loop) or the job_mutex.
>> +     * It can be only written when we hold *both* BQL and job_mutex.
>> +     */
>>       AioContext *aio_context;
>>         /** Reference count of the block job */
>> @@ -741,4 +746,16 @@ int job_finish_sync(Job *job, void (*finish)(Job
>> *, Error **errp),
>>   int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error
>> **errp),
>>                              Error **errp);
>>   +/**
>> + * Sets the @job->aio_context.
>> + * Called with job_mutex *not* held.
>> + *
>> + * This function must run in the main thread to protect against
>> + * concurrent read in job_finish_sync_locked(),
>> + * takes the job_mutex lock to protect against the read in
>> + * job_do_yield_locked(), and must be called when the coroutine
>> + * is quiescent.
>> + */
>> +void job_set_aio_context(Job *job, AioContext *ctx);
>> +
>>   #endif
>> diff --git a/job.c b/job.c
>> index 405f39566b..66cae82593 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -394,6 +394,17 @@ Job *job_get(const char *id)
>>       return job_get_locked(id);
>>   }
>>   +void job_set_aio_context(Job *job, AioContext *ctx)
>> +{
>> +    /* protect against read in job_finish_sync_locked and job_start */
>> +    assert(qemu_in_main_thread());
>> +    /* protect against read in job_do_yield_locked */
>> +    JOB_LOCK_GUARD();
>> +    /* ensure the coroutine is quiescent while the AioContext is
>> changed */
>> +    assert(job->pause_count > 0);
>> +    job->aio_context = ctx;
>> +}
>> +
>>   /* Called with job_mutex *not* held. */
>>   static void job_sleep_timer_cb(void *opaque)
>>   {
>> @@ -1380,6 +1391,7 @@ int job_finish_sync_locked(Job *job,
>>   {
>>       Error *local_err = NULL;
>>       int ret;
>> +    assert(qemu_in_main_thread());
>>         job_ref_locked(job);
>>   
> 
> 
> Missed update of block_job_add_bdrv(), block_job_get_aio_context().
> Should they have an assertion too?
> 
> Also some occurences in test, but that doesn't seem significant.
> 

Both have GLOBAL_STATE_CODE.

Emanuele


