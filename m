Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3F554D10
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:10 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o41Or-00067m-2b
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 10:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o41Jz-0000yu-F8
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o41Ju-0005YS-26
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 10:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655908021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CbK9WsItFjA+hsoQO5T+LTBrKjGyFMI34vm+nFGDBoA=;
 b=JZ+pmUMg787VtOzF7vWR5wQSdq/vDB75w19aNVqAhk/ILfgm1ue/9mLDxuX0rl6jPdyp8P
 EMwQBLcxdyqSrDmE38yH6basY+OM0oG7Ne+CelR++fsxfE9SKb6fXY6CrKb7JuO+yPKSRt
 nWH2wz/KQbdvMfamIJvFZiVRFRnfRdE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-AteG7DvXNcOQON1xsH0hbg-1; Wed, 22 Jun 2022 10:26:59 -0400
X-MC-Unique: AteG7DvXNcOQON1xsH0hbg-1
Received: by mail-qv1-f71.google.com with SMTP id
 10-20020a0562140cca00b004702e8ce21bso11856171qvx.22
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 07:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CbK9WsItFjA+hsoQO5T+LTBrKjGyFMI34vm+nFGDBoA=;
 b=5jGY6cc97zmU0bu51cCE0ipRsrHTuXUQoECiVUTSC+KcXr/kf2FoeqfiYvsVkWTm5s
 oIkrDt76Ch42c8u8Qi0THOaTHTltyy936Yb8YkKHRAKdqiOAkr57n+dpJjbM8KOK25Nj
 4MShZfOLJk9bZvu4EDy+mGaCCQEwrUp0WgXPcywPO1hQQvYl2V6nEhmwX3T8GVVIhcZl
 JCJX7nYcxth9Js4XpiH8LvA2BFoXhc+02C249rNbkbj8tGQcMY48qbXcuPnplJtBF0Pc
 FIZPS/VF4y+hLv676PnGeh2+m8FAHwEMN7E+Ara6DmtPYEcZ8rtu9E6Odwp1RWw7R8dK
 xyqA==
X-Gm-Message-State: AJIora+AXXzXX3CrQkAqds9at8SIXMLSYziJ7TW8vGP3ERiptylPo7oH
 TyEDONuIzn7113bncGxNm1Mcxkj7nXXCLgrsjO6F+QGDDi5mdDSxDTIZremW4lXdqMSoIAs7xIl
 7g485Sj5MCPpjmk0=
X-Received: by 2002:a05:622a:3cf:b0:305:2ea7:238 with SMTP id
 k15-20020a05622a03cf00b003052ea70238mr3250472qtx.334.1655908019195; 
 Wed, 22 Jun 2022 07:26:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uRLSCD8rvOjzLotgPYgrThgPjKrfv6vHtELUDdZr2v5aAd51qQdrzasMZAcfwMfPALryRjkQ==
X-Received: by 2002:a05:622a:3cf:b0:305:2ea7:238 with SMTP id
 k15-20020a05622a03cf00b003052ea70238mr3250425qtx.334.1655908018743; 
 Wed, 22 Jun 2022 07:26:58 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 ay35-20020a05620a17a300b006a716fed4d6sm15074137qkb.50.2022.06.22.07.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:26:58 -0700 (PDT)
Message-ID: <6bb1cd32-4d28-cb8e-cd22-bc8c2fc15bcc@redhat.com>
Date: Wed, 22 Jun 2022 16:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 05/18] job.h: add _locked duplicates for job API
 functions called with and without job_mutex
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
References: <20220616131835.2004262-1-eesposit@redhat.com>
 <20220616131835.2004262-6-eesposit@redhat.com>
 <09a6ad0c-8e18-9dd0-0cbb-a2ba0ecf33a9@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <09a6ad0c-8e18-9dd0-0cbb-a2ba0ecf33a9@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



Am 21/06/2022 um 17:03 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/16/22 16:18, Emanuele Giuseppe Esposito wrote:
>> In preparation to the job_lock/unlock usage, create _locked
>> duplicates of some functions, since they will be sometimes called with
>> job_mutex held (mostly within job.c),
>> and sometimes without (mostly from JobDrivers using the job API).
>>
>> Therefore create a _locked version of such function, so that it
>> can be used in both cases.
>>
>> List of functions duplicated as _locked:
>> job_is_ready (both versions are public)
>> job_is_completed (both versions are public)
>> job_is_cancelled (_locked version is public, needed by mirror.c)
>> job_pause_point (_locked version is static, purely done to simplify
>> the code)
>> job_cancel_requested (_locked version is static)
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
> 
> Great description, thanks!
> 
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Hmm, after this patch, part of public API has "called with/without lock"
> comments. But there are still public job_* functions that doesn't have
> this mark. That look inconsistent. I think, all public API without
> _locked suffix, should be called without a lock? If so, we don't need to
> write it for each function. And only mark _locked() functions with
> "called with lock held" marks.
> 
>> ---
>>   include/qemu/job.h | 25 +++++++++++++++++++++---
>>   job.c              | 48 ++++++++++++++++++++++++++++++++++++++++------
>>   2 files changed, 64 insertions(+), 9 deletions(-)
>>
> 
> [..]
> 
>>   -/** Returns whether the job is ready to be completed. */
>> +/** Just like job_is_completed, but called between job_lock and
>> job_unlock */
> 
> I'd prefer phrasing "called with job_lock held". You wording make me
> think about
> 
> job_lock()
> ...
> job_unlock()
> 
> foo()
> 
> job_lock()
> ...
> job_unlock()
> 
> - foo() actually called between job_lock and job_unlock :)
> 
> (it's a nitpicking, you may ignore it :)
> 
>> +bool job_is_completed_locked(Job *job);
>> +
>> +/**
>> + * Returns whether the job is ready to be completed.
>> + * Called with job_mutex *not* held.
>> + */
>>   bool job_is_ready(Job *job);
>>   +/** Just like job_is_ready, but called between job_lock and
>> job_unlock */
>> +bool job_is_ready_locked(Job *job);
>> +
>>   /**
>>    * Request @job to pause at the next pause point. Must be paired with
>>    * job_resume(). If the job is supposed to be resumed by user
>> action, call
>> diff --git a/job.c b/job.c
>> index cafd597ba4..c4776985c4 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -236,19 +236,32 @@ const char *job_type_str(const Job *job)
>>       return JobType_str(job_type(job));
>>   }
>>   -bool job_is_cancelled(Job *job)
>> +bool job_is_cancelled_locked(Job *job)
>>   {
>>       /* force_cancel may be true only if cancelled is true, too */
>>       assert(job->cancelled || !job->force_cancel);
>>       return job->force_cancel;
>>   }
>>   -bool job_cancel_requested(Job *job)
>> +bool job_is_cancelled(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    return job_is_cancelled_locked(job);
>> +}
>> +
>> +/* Called with job_mutex held. */
>> +static bool job_cancel_requested_locked(Job *job)
>>   {
>>       return job->cancelled;
>>   }
>>   -bool job_is_ready(Job *job)
>> +bool job_cancel_requested(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    return job_cancel_requested_locked(job);
>> +}
>> +
>> +bool job_is_ready_locked(Job *job)
>>   {
>>       switch (job->status) {
>>       case JOB_STATUS_UNDEFINED:
>> @@ -270,7 +283,13 @@ bool job_is_ready(Job *job)
>>       return false;
>>   }
>>   -bool job_is_completed(Job *job)
>> +bool job_is_ready(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    return job_is_ready_locked(job);
>> +}
>> +
>> +bool job_is_completed_locked(Job *job)
>>   {
>>       switch (job->status) {
>>       case JOB_STATUS_UNDEFINED:
>> @@ -292,6 +311,12 @@ bool job_is_completed(Job *job)
>>       return false;
>>   }
>>   +bool job_is_completed(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    return job_is_completed_locked(job);
>> +}
>> +
>>   static bool job_started(Job *job)
>>   {
>>       return job->co;
>> @@ -521,7 +546,8 @@ static void coroutine_fn job_do_yield(Job *job,
>> uint64_t ns)
>>       assert(job->busy);
>>   }
>>   -void coroutine_fn job_pause_point(Job *job)
>> +/* Called with job_mutex held, but releases it temporarily. */
>> +static void coroutine_fn job_pause_point_locked(Job *job)
>>   {
>>       assert(job && job_started(job));
> 
> In this function, we should now use job_pause_point_locked(), otherwise
> it looks incorrect. (I remember that lock is noop for now, but still,
> let's keep think as correct as possible)
> 

I miss your point here. What is incorrect?
> 
> And job_do_yield() takes lock by itself. How to resolve it?

You mean the real_job_lock/unlock taken in job_do_yield?

> 
>>   @@ -552,6 +578,12 @@ void coroutine_fn job_pause_point(Job *job)
>>       }
>>   }
>>   +void coroutine_fn job_pause_point(Job *job)
>> +{
>> +    JOB_LOCK_GUARD();
>> +    job_pause_point_locked(job);
>> +}
>> +
>>   void job_yield(Job *job)
>>   {
>>       assert(job->busy);
>> @@ -949,11 +981,15 @@ static void job_completed(Job *job)
>>       }
>>   }
>>   -/** Useful only as a type shim for aio_bh_schedule_oneshot. */
>> +/**
>> + * Useful only as a type shim for aio_bh_schedule_oneshot.
>> + * Called with job_mutex *not* held.
>> + */
>>   static void job_exit(void *opaque)
>>   {
>>       Job *job = (Job *)opaque;
>>       AioContext *ctx;
>> +    JOB_LOCK_GUARD();
> 
> That's not part of this patch.. Doesn't relate to "add _locked duplicates"
> 
>>         job_ref(job);
>>       aio_context_acquire(job->aio_context);
> 
> 


