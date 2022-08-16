Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F36595ECC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 17:11:54 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNyES-0005fB-Ti
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 11:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNyCP-0003nl-2b
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 11:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNyCL-0004Kp-Hu
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 11:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660662580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyJlrNxLg5L+bvDFhkOoeukbyNlushjMRVVM6+oEsWs=;
 b=Pm7RONLhF2f8Ejzy6V/32jh8VsLTCr4xz5DkB4DJaHDEvGUiSdf/ZWD6qyC7YuThiAEIKC
 L+AF/HLPp3VciSuoFV4PLFP4Sk0uHXPKdt9ro8PbPeqz+Lsnmh8iM7tLgJ0+z/Qc0/UcP1
 C8NXOBDV7h1JdYS3Tsa29s9Z/ZbrWDs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-D1_gA3nNMUmG9nc2FFPgsA-1; Tue, 16 Aug 2022 11:09:38 -0400
X-MC-Unique: D1_gA3nNMUmG9nc2FFPgsA-1
Received: by mail-qt1-f199.google.com with SMTP id
 bq11-20020a05622a1c0b00b003434f125b77so8673524qtb.20
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 08:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QyJlrNxLg5L+bvDFhkOoeukbyNlushjMRVVM6+oEsWs=;
 b=SHalaXFMGh+JiZqwfTzvSA962W0uoQ3wpMWp9QTGr93dsF/zxeP/U4vhKL20fJmT7z
 wcTySJ6ax5OJ4Ieuo/qboVIHjYh+mKnCe7UDKmfOjLQeLvI/lNgWp0jxc70p14mJPiCk
 xT0QA17fhFxX0NqywG74eUIvrLrqCgh9317A3NXN2Qh9scS0iS4Y4rRJmEXgjFgidxaH
 /tlCnIo9f53ZWehc+rrf8epABHoMvegMO83UwQYwjMoFjyOHsUyOxpl5Guw6UUreIwOQ
 U2hOLVgrCS81PBtGsPWD2lm24pxktrN+j0l/W0+rMU62txGjma4ulnTHFTx7ElrE7vcK
 opGg==
X-Gm-Message-State: ACgBeo1jnunzGHbLNeiPMxz82XAOThl9qpsFnFv1kh73qq7pEKn9eFu4
 fRirTuJF7A8V58IVLyt00xnn0nmIZG7PT0dnwlk/3DvPNYOAecqg5ffewyHEe5zxrGoBpJkcmyv
 LkIEZJ71kk0GkP6c=
X-Received: by 2002:a05:6214:20ad:b0:478:a967:560 with SMTP id
 13-20020a05621420ad00b00478a9670560mr18432702qvd.58.1660662577981; 
 Tue, 16 Aug 2022 08:09:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5eikFksvDhBHf/BoDS0KcCvNOSd6BSI1G0k4h+qwupdk5TqCYO2w0kbMf+v0tY6xxLURaGOw==
X-Received: by 2002:a05:6214:20ad:b0:478:a967:560 with SMTP id
 13-20020a05621420ad00b00478a9670560mr18432643qvd.58.1660662577543; 
 Tue, 16 Aug 2022 08:09:37 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a37ab08000000b006bb11f9a859sm5387251qke.122.2022.08.16.08.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 08:09:36 -0700 (PDT)
Message-ID: <85f03feb-0502-b32d-9bdf-f3239d759c87@redhat.com>
Date: Tue, 16 Aug 2022 17:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 13/21] job: detect change of aiocontext within job
 coroutine
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-14-eesposit@redhat.com> <YuzWy1wQPf6HXl+0@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YuzWy1wQPf6HXl+0@redhat.com>
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



Am 05/08/2022 um 10:37 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> From: Paolo Bonzini <pbonzini@redhat.com>
>>
>> We want to make sure access of job->aio_context is always done
>> under either BQL or job_mutex.
> 
> Is this the goal of this series? If so, it would have been useful to
> state somewhere more obvious, because I had assumed that holding the BQL
> would not be considered enough, but everyone needs to hold the job_mutex.

It is the goal for this patch :)
The whole job API can't rely on BQL since there are coroutines running
in another aiocontext.
> 
>> The problem is that using
>> aio_co_enter(job->aiocontext, job->co) in job_start and job_enter_cond
>> makes the coroutine immediately resume, so we can't hold the job lock.
>> And caching it is not safe either, as it might change.
>>
>> job_start is under BQL, so it can freely read job->aiocontext, but
>> job_enter_cond is not. In order to fix this, use aio_co_wake():
>> the advantage is that it won't use job->aiocontext, but the
>> main disadvantage is that it won't be able to detect a change of
>> job AioContext.
>>
>> Calling bdrv_try_set_aio_context() will issue the following calls
>> (simplified):
>> * in terms of  bdrv callbacks:
>>   .drained_begin -> .set_aio_context -> .drained_end
>> * in terms of child_job functions:
>>   child_job_drained_begin -> child_job_set_aio_context -> child_job_drained_end
>> * in terms of job functions:
>>   job_pause_locked -> job_set_aio_context -> job_resume_locked
>>
>> We can see that after setting the new aio_context, job_resume_locked
>> calls again job_enter_cond, which then invokes aio_co_wake(). But
>> while job->aiocontext has been set in job_set_aio_context,
>> job->co->ctx has not changed, so the coroutine would be entering in
>> the wrong aiocontext.
>>
>> Using aio_co_schedule in job_resume_locked() might seem as a valid
>> alternative, but the problem is that the bh resuming the coroutine
>> is not scheduled immediately, and if in the meanwhile another
>> bdrv_try_set_aio_context() is run (see test_propagate_mirror() in
>> test-block-iothread.c), we would have the first schedule in the
>> wrong aiocontext, and the second set of drains won't even manage
>> to schedule the coroutine, as job->busy would still be true from
>> the previous job_resume_locked().
>>
>> The solution is to stick with aio_co_wake(), but then detect every time
>> the coroutine resumes back from yielding if job->aio_context
>> has changed. If so, we can reschedule it to the new context.
> 
> Hm, but with this in place, what does aio_co_wake() actually buy us
> compared to aio_co_enter()?
> 
> I guess it's a bit simpler code because you don't have to explicitly
> specify the AioContext, but we're still going to enter the coroutine in
> the wrong AioContext occasionally and have to reschedule it, just like
> in the existing code (except that the rescheduling doesn't exist there
> yet).
> 
> So while I don't disagree with the change, I don't think the
> justification in the commit message is right for this part.

What do you suggest to change?

> 
>> Check for the aiocontext change in job_do_yield_locked because:
>> 1) aio_co_reschedule_self requires to be in the running coroutine
>> 2) since child_job_set_aio_context allows changing the aiocontext only
>>    while the job is paused, this is the exact place where the coroutine
>>    resumes, before running JobDriver's code.
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  job.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/job.c b/job.c
>> index b0729e2bb2..ecec66b44e 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -585,7 +585,9 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>>      timer_del(&job->sleep_timer);
>>      job->busy = true;
>>      real_job_unlock();
>> -    aio_co_enter(job->aio_context, job->co);
>> +    job_unlock();
>> +    aio_co_wake(job->co);
>> +    job_lock();
> 
> The addition of job_unlock/lock is unrelated, this was necessary even
> before this patch.

Ok

> 
>>  }
>>  
>>  void job_enter_cond(Job *job, bool(*fn)(Job *job))
>> @@ -611,6 +613,8 @@ void job_enter(Job *job)
>>   */
>>  static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>>  {
>> +    AioContext *next_aio_context;
>> +
>>      real_job_lock();
>>      if (ns != -1) {
>>          timer_mod(&job->sleep_timer, ns);
>> @@ -622,7 +626,20 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
>>      qemu_coroutine_yield();
>>      job_lock();
>>  
>> -    /* Set by job_enter_cond() before re-entering the coroutine.  */
>> +    next_aio_context = job->aio_context;
>> +    /*
>> +     * Coroutine has resumed, but in the meanwhile the job AioContext
>> +     * might have changed via bdrv_try_set_aio_context(), so we need to move
>> +     * the coroutine too in the new aiocontext.
>> +     */
>> +    while (qemu_get_current_aio_context() != next_aio_context) {
>> +        job_unlock();
>> +        aio_co_reschedule_self(next_aio_context);
>> +        job_lock();
>> +        next_aio_context = job->aio_context;
>> +    }
>> +
>> +    /* Set by job_enter_cond_locked() before re-entering the coroutine.  */
>>      assert(job->busy);
>>  }
> 

Emanuele


