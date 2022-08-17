Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A557E596EB7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 14:50:19 +0200 (CEST)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOIV0-0000V1-7W
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 08:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOIQA-0006Yt-A4
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOIQ7-0008AO-9s
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 08:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660740314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uM2tGcVTz4JYQKDCLgKhnPc8WJPoKsr3pIWyLkRXIGg=;
 b=G45L0lLSyhYobo7uUSxk6/u/HSQDIQyMEr5wTIdYnU3hrD8SzKjKyW6Q0e7GYffGlJXxev
 5XoU+y2HdotRXTtVtSZ63U/+m3WueSwJhVVVJM1oWFuLhJZsM2tcARa5PfE1OsUFzg2CEU
 5jSN1iA6Ylqesu8Bvq6lUGDDO0i3y3g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-225-9uRxWtfWOUG1aOdoFPTHIw-1; Wed, 17 Aug 2022 08:45:05 -0400
X-MC-Unique: 9uRxWtfWOUG1aOdoFPTHIw-1
Received: by mail-qt1-f198.google.com with SMTP id
 bz20-20020a05622a1e9400b003436a76c6e6so10305881qtb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uM2tGcVTz4JYQKDCLgKhnPc8WJPoKsr3pIWyLkRXIGg=;
 b=7G2MCGlZD02DeA11KENP5qzLwE/9Lt//ZGQirijRUm8pzKkviaN0cBJ8A/uM1Y5II1
 KP6yhCQOQWXgOuDIM8WX5Fa54bqnzfWA8Zfr4ytZI2C2QWNR8BuaRnxPjbSQMkznEOc2
 1v75wuA5vaHX20A+O7f8N1dvpDmi9rVMR/X5KR2PXtoetkmZF+3loW/UKwgkiBMjSZ6q
 7D6bpLrFYPQPisKBnzpK8NVOzLsMXDdeIy9FbokekCobsB2yfKNCRaSP2nbeUl8vQ8wV
 Ub/3VPdOSFjy5poClnHyqeP8FVx3FDGm11U7KqzZaAIfvQeMhwALsY+JfYS5+RhhoChL
 OxtA==
X-Gm-Message-State: ACgBeo3O0kePMrjIgxlCqVSBzV/AWoflzxX60x4qMadGZfABUuYRRgpy
 YASRj+C342uZiFRpWTRhTdFYPNnAfI4h6DEM3fZWNujsLVNGPfNeGNDicLzwV5/V/BuWeOT9wqb
 4r7OHl7pHNcmfMW0=
X-Received: by 2002:ae9:ee14:0:b0:6b9:9b75:fcb7 with SMTP id
 i20-20020ae9ee14000000b006b99b75fcb7mr18004631qkg.66.1660740305284; 
 Wed, 17 Aug 2022 05:45:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7aepkRH2ocTxZpynboboAe4TGX/dewio6DHunE29nFH8l8ZHZSxdGooaGgcs7xwSilB/ZAww==
X-Received: by 2002:ae9:ee14:0:b0:6b9:9b75:fcb7 with SMTP id
 i20-20020ae9ee14000000b006b99b75fcb7mr18004614qkg.66.1660740304947; 
 Wed, 17 Aug 2022 05:45:04 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 dm14-20020a05620a1d4e00b006bad20a6cfesm12974884qkb.102.2022.08.17.05.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 05:45:04 -0700 (PDT)
Message-ID: <c2253f6a-e83f-5a7e-97b0-4483a98706b5@redhat.com>
Date: Wed, 17 Aug 2022 14:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com> <Yu0Uk3PhxGC39mf0@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yu0Uk3PhxGC39mf0@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/08/2022 um 15:01 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> Change the job_{lock/unlock} and macros to use job_mutex.
>>
>> Now that they are not nop anymore, remove the aiocontext
>> to avoid deadlocks.
> 
> Okay, so this is the big bad patch where we need to verify the
> completeness of all changes made so far. Let's see...
> 
>> Therefore:
>> - when possible, remove completely the aiocontext lock/unlock pair
>> - if it is used by some other function too, reduce the locking
>>   section as much as possible, leaving the job API outside.
>> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>>   are not using the aiocontext lock anymore
> 
> Does this imply that there is a new rule that job_*() must not be called
> with the AioContext lock held? Or is it optional now?
> 
> If it's a rule, it should be documented.
> 
> 
> (Coming back after reviewing more of the patch:)
> 
> 
> It doesn't seem to be a rule, or at least not a rule that is obeyed.
> 
> Actually each function in job.c belongs in one of at most three
> categories: Must hold the AioContext (because it calls callbacks that
> need it), may hold the AioContext optionally, and must not hold it
> (everything that would cause the deadlocks you're alluding to, but not
> explaining, in the commit message).
> 
> It is not obvious which function is in which category. So I maintain
> that we need some documentation for the assumptions made.
> 
> All coroutine_fns (which are called from the job coroutine) should be in
> the category that they still run with the AioContext locked, but that
> covers only a small minority of functions.
> 
> The driver callbacks look mostly correct at least with respect to
> AioContext locking, even if their status isn't documented. I suppose
> this is the most important part.
> 

Well I would say the general case is that no function should need the
aiocontext lock taken. The only ones that need the aiocontext lock are
the functions currently taking it, so just the driver callbacks. But
they take it internally, so what do you propose to document here?

After looking at your feedbacks, I think we just need the driver
callbacks to be documented, right?


>> @@ -197,23 +186,14 @@ static int job_txn_apply_locked(Job *job, int fn(Job *))
>>       * break AIO_WAIT_WHILE from within fn.
>>       */
>>      job_ref_locked(job);
>> -    aio_context_release(job->aio_context);
>>  
>>      QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
>> -        inner_ctx = other_job->aio_context;
>> -        aio_context_acquire(inner_ctx);
>>          rc = fn(other_job);
>> -        aio_context_release(inner_ctx);
> 
> Okay, so fn() is now called without the AioContext lock while it was
> called with it previously. This requires checking all callers.
> 
> What isn't immediately clear, but seems to be true, is that all notifiers
> don't need the AioContext lock. Probably worth documenting in struct
> Job. (Needed because of job_transition_to_pending_locked(), which is
> passed as fn.)

I am not sure what you mean here, but all fn() passed take the
AioContext lock internally if they need to take it (ie just for the
drivers callback). Reading also below comment, I will add the comment
"Called with AioContext lock held, since many callback implementations
use bdrv_* functions that require to hold the lock." to the following
callbacks:
- prepare
- free
- commit
- abort
- clean
- cancel

Sounds good?

> 
>>          if (rc) {
>>              break;
>>          }
>>      }
>>  
>> -    /*
>> -     * Note that job->aio_context might have been changed by calling fn, so we
>> -     * can't use a local variable to cache it.
>> -     */
>> -    aio_context_acquire(job->aio_context);
>>      job_unref_locked(job);
>>      return rc;
>>  }
>> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)
>>          assert(!job->txn);
>>  
>>          if (job->driver->free) {
>> +            AioContext *aio_context = job->aio_context;
>>              job_unlock();
>> +            /* FIXME: aiocontext lock is required because cb calls blk_unref */
>> +            aio_context_acquire(aio_context);
>>              job->driver->free(job);
>> +            aio_context_release(aio_context);
> 
> The documentation of JobDriver doesn't specify which callbacks are
> called with the AioContext locked and which are called without it. It
> probably should.
> 
> (A good part of the documentation clarifications I'm asking for in this
> review should probably done in a patch before this one, so that
> reviewing the documentation involves checking that the requirements of
> the callback match what we're documenting, and then the review of this
> patch can focus on that the documented contract is still obeyed.)

Makes sense, I'll do what I stated in the answer above.

> 
>>              job_lock();
>>          }
>>  
>> @@ -922,6 +900,7 @@ static void job_clean(Job *job)
>>  static int job_finalize_single_locked(Job *job)
>>  {
>>      int job_ret;
>> +    AioContext *ctx = job->aio_context;
>>  
>>      assert(job_is_completed_locked(job));
>>  
>> @@ -929,6 +908,7 @@ static int job_finalize_single_locked(Job *job)
>>      job_update_rc_locked(job);
>>  
>>      job_unlock();
>> +    aio_context_acquire(ctx);
>>  
>>      if (!job->ret) {
>>          job_commit(job);
>> @@ -937,6 +917,7 @@ static int job_finalize_single_locked(Job *job)
>>      }
>>      job_clean(job);
>>  
>> +    aio_context_release(ctx);
>>      job_lock();
> 
> Let's add comments to job_commit(), job_abort() and job_clean() that
> they are called with the AioContext lock held.
> 
> A few lines below we are now calling job->cb() without the AioContext
> lock even though previously it was called with it. Which way is right?
> The intended behaviour should be documented in struct Job.

I think we unfortunately need the aiocontext lock here too.

backup_job_create -> passes cb to block_job_create -> passes it to
job_create

cb is
backup_job_completed -> calls backup_job_cleanup -> calls
reopen_backing_file

Which has subtree drains and so on. So yes, I will wrap cb under
aiocontext lock, merging it in the same aiocontext lock section of
job_commit and friends.

> 
>>      if (job->cb) {
>> @@ -1002,7 +983,6 @@ static void job_cancel_async_locked(Job *job, bool force)
>>  /* Called with job_mutex held, but releases it temporarily. */
>>  static void job_completed_txn_abort_locked(Job *job)
>>  {
>> -    AioContext *ctx;
>>      JobTxn *txn = job->txn;
>>      Job *other_job;
>>  
>> @@ -1015,54 +995,31 @@ static void job_completed_txn_abort_locked(Job *job)
>>      txn->aborting = true;
>>      job_txn_ref_locked(txn);
>>  
>> -    /*
>> -     * We can only hold the single job's AioContext lock while calling
>> -     * job_finalize_single() because the finalization callbacks can involve
>> -     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
>> -     * Note that the job's AioContext may change when it is finalized.
>> -     */
>>      job_ref_locked(job);
>> -    aio_context_release(job->aio_context);
>>  
>>      /* Other jobs are effectively cancelled by us, set the status for
>>       * them; this job, however, may or may not be cancelled, depending
>>       * on the caller, so leave it. */
>>      QLIST_FOREACH(other_job, &txn->jobs, txn_list) {
>>          if (other_job != job) {
>> -            ctx = other_job->aio_context;
>> -            aio_context_acquire(ctx);
>>              /*
>>               * This is a transaction: If one job failed, no result will matter.
>>               * Therefore, pass force=true to terminate all other jobs as quickly
>>               * as possible.
>>               */
>>              job_cancel_async_locked(other_job, true);
> 
> job_cancel_async_locked() calls job->driver->cancel() without the
> AioContext lock now. Some implementations call bdrv_cancel_in_flight().
> Generally bdrv_*() are called with the AioContext lock held.
> 
> If we want to make bdrv_cancel_in_flight() an exception, at the very
> least this need to be documented.
> 
> The more obvious solution would be to acquire the AioContext lock in
> job_cancel_async_locked() around the callback.
> 

Added to the above list of callbacks to document.


>> diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
>> index b0cd06c529..8a9350078f 100644
>> --- a/tests/unit/test-blockjob.c
>> +++ b/tests/unit/test-blockjob.c
>> @@ -228,10 +228,6 @@ static void cancel_common(CancelJob *s)
>>      BlockJob *job = &s->common;
>>      BlockBackend *blk = s->blk;
>>      JobStatus sts = job->job.status;
>> -    AioContext *ctx;
>> -
>> -    ctx = job->job.aio_context;
>> -    aio_context_acquire(ctx);
>>  
>>      job_cancel_sync(&job->job, true);
>>      WITH_JOB_LOCK_GUARD() {
>> @@ -244,7 +240,6 @@ static void cancel_common(CancelJob *s)
>>      }
>>      destroy_blk(blk);
>>  
>> -    aio_context_release(ctx);
> 
> destroy_blk() requires the AioContext to be locked.

Makes sense.
> 
>>  }
>>  
>>  static void test_cancel_created(void)
>> @@ -384,12 +379,10 @@ static void test_cancel_concluded(void)
>>      aio_poll(qemu_get_aio_context(), true);
>>      assert_job_status_is(job, JOB_STATUS_PENDING);
>>  
>> -    aio_context_acquire(job->aio_context);
>>      WITH_JOB_LOCK_GUARD() {
>>          job_finalize_locked(job, &error_abort);
>> +        assert(job->status == JOB_STATUS_CONCLUDED);
>>      }
>> -    aio_context_release(job->aio_context);
>> -    assert_job_status_is(job, JOB_STATUS_CONCLUDED);
>>  
>>      cancel_common(s);
>>  }
>> @@ -482,13 +475,11 @@ static void test_complete_in_standby(void)
>>  
>>      /* Wait for the job to become READY */
>>      job_start(job);
>> -    aio_context_acquire(ctx);
>>      /*
>>       * Here we are waiting for the status to change, so don't bother
>>       * protecting the read every time.
>>       */
>> -    AIO_WAIT_WHILE(ctx, job->status != JOB_STATUS_READY);
>> -    aio_context_release(ctx);
>> +    AIO_WAIT_WHILE_UNLOCKED(ctx, job->status != JOB_STATUS_READY);
>>  
>>      /* Begin the drained section, pausing the job */
>>      bdrv_drain_all_begin();
>> @@ -507,6 +498,7 @@ static void test_complete_in_standby(void)
>>          job_complete_locked(job, &error_abort);
>>  
>>          /* The test is done now, clean up. */
>> +        aio_context_release(ctx);
> 
> job_complete_locked() is not supposed to be called with the AioContext
> locked (otherwise blockdev.c would be wrong).
> 

Not sure what it has to do with blockdev.c, but you're right, the lock
is not needed there. Test is not affected by the lock position, I will
move it right after bdrv_drain_all_begin.

Emanuele


