Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A33FD9D4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:50:17 +0200 (CEST)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPh2-0001Pj-ES
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPeg-00070Q-OC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLPee-0004QT-CW
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:47:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630500467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mGzzDyUsdOkWEPVeeQ1x6dkJCiZbweQ1UbyOWhiu24=;
 b=dnHILTNuMwwPZxt+ll3MMYuuHL8T9TbtQwZByfpi0TbQMRemDMSZF2wWSkShpkq43pEdwd
 AMvBP8cGPdTN+hcfx9YaaRRlv+tpnBZlElIFQh4g/BRIrcjEnrsbYbY7cxzM7kc+Jy5RIa
 mWg4bs/m6ZjiDKWZn1D7bj7TCGbsVzs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-LoWaCR6kOy2WwftWw6W1-g-1; Wed, 01 Sep 2021 08:47:46 -0400
X-MC-Unique: LoWaCR6kOy2WwftWw6W1-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so2784256wmc.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9mGzzDyUsdOkWEPVeeQ1x6dkJCiZbweQ1UbyOWhiu24=;
 b=Sedoc608s58qyc38RRGaiOMMCpEZWeHQWIXePtt2inLgYJ4QM70ZC8hJsVddqbPpPI
 358rPxV+7y1dn6lVkHH2M74vHYC8w7N+wJePRqA3s3Zvu0poP5XUtIOsv4Hcww6U3gjI
 5VfPZYLSAs/CqcMTgQKmsqjhMGFTQo8Amqj49xO1YkcdnHB0VTOuX2XKxCibxFp9SSVT
 nKhn2NSWDcZFWS4eVA4+5Jq8Xhwp0yeu3mOR+xVwVxVLz3Re9KM8+YRG63DzX786exZz
 YIAOfDc89eiO4I9KBWOZO38XUPh1lZWzxvYBdu+h9B1bCH/kfoNZOitpn5U4kPWh6R9J
 UvSA==
X-Gm-Message-State: AOAM533wi2IpxpnfE5/mD1AvcyhgHkMV0SMZQIaZl0k1b+btf0+/5F8x
 mTMRZLPVtPOY+FhM05fMMPnHi0jmFsLCJJ8gm+uu9nlhYAXXskaAAXOS9WplYmZsJm8s7DJzRiv
 /39aBM2n78rn5Y9g=
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr9642261wmq.165.1630500465046; 
 Wed, 01 Sep 2021 05:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU9o5Yqvs6igXTL51P5+PrwCFYN32QogPMvnauBguLIqIoDweAEwnXj3c00uRYWoecqC5rLQ==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id
 f11mr9642248wmq.165.1630500464823; 
 Wed, 01 Sep 2021 05:47:44 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e9sm18786251wrd.69.2021.09.01.05.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:47:44 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v3 01/12] job: Context changes in
 job_completed_txn_abort()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210806093859.706464-1-mreitz@redhat.com>
 <20210806093859.706464-2-mreitz@redhat.com>
 <bfffbce1-c62f-5ae2-0de3-202b97fd593b@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <9793f3ef-f570-2d67-e742-2df967547684@redhat.com>
Date: Wed, 1 Sep 2021 14:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bfffbce1-c62f-5ae2-0de3-202b97fd593b@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 12:05, Vladimir Sementsov-Ogievskiy wrote:
> 06.08.2021 12:38, Max Reitz wrote:
>> Finalizing the job may cause its AioContext to change.  This is noted by
>> job_exit(), which points at job_txn_apply() to take this fact into
>> account.
>>
>> However, job_completed() does not necessarily invoke job_txn_apply()
>> (through job_completed_txn_success()), but potentially also
>> job_completed_txn_abort().  The latter stores the context in a local
>> variable, and so always acquires the same context at its end that it has
>> released in the beginning -- which may be a different context from the
>> one that job_exit() releases at its end.  If it is different, qemu
>> aborts ("qemu_mutex_unlock_impl: Operation not permitted").
>>
>> Drop the local @outer_ctx variable from job_completed_txn_abort(), and
>> instead re-acquire the actual job's context at the end of the function,
>> so job_exit() will release the same.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   job.c | 23 ++++++++++++++++++-----
>>   1 file changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/job.c b/job.c
>> index e7a5d28854..3fe23bb77e 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -737,7 +737,6 @@ static void job_cancel_async(Job *job, bool force)
>>     static void job_completed_txn_abort(Job *job)
>>   {
>> -    AioContext *outer_ctx = job->aio_context;
>>       AioContext *ctx;
>>       JobTxn *txn = job->txn;
>>       Job *other_job;
>> @@ -751,10 +750,14 @@ static void job_completed_txn_abort(Job *job)
>>       txn->aborting = true;
>>       job_txn_ref(txn);
>>   -    /* We can only hold the single job's AioContext lock while 
>> calling
>> +    /*
>> +     * We can only hold the single job's AioContext lock while calling
>>        * job_finalize_single() because the finalization callbacks can 
>> involve
>> -     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise. */
>> -    aio_context_release(outer_ctx);
>> +     * calls of AIO_WAIT_WHILE(), which could deadlock otherwise.
>> +     * Note that the job's AioContext may change when it is finalized.
>> +     */
>> +    job_ref(job);
>> +    aio_context_release(job->aio_context);
>>         /* Other jobs are effectively cancelled by us, set the status 
>> for
>>        * them; this job, however, may or may not be cancelled, depending
>> @@ -769,6 +772,10 @@ static void job_completed_txn_abort(Job *job)
>>       }
>>       while (!QLIST_EMPTY(&txn->jobs)) {
>>           other_job = QLIST_FIRST(&txn->jobs);
>> +        /*
>> +         * The job's AioContext may change, so store it in @ctx so we
>> +         * release the same context that we have acquired before.
>> +         */
>>           ctx = other_job->aio_context;
>>           aio_context_acquire(ctx);
>>           if (!job_is_completed(other_job)) {
>> @@ -779,7 +786,13 @@ static void job_completed_txn_abort(Job *job)
>>           aio_context_release(ctx);
>>       }
>>   -    aio_context_acquire(outer_ctx);
>> +    /*
>> +     * Use job_ref()/job_unref() so we can read the AioContext here
>> +     * even if the job went away during job_finalize_single().
>> +     */
>> +    ctx = job->aio_context;
>> +    job_unref(job);
>> +    aio_context_acquire(ctx);
>
>
> why to use ctx variable and not do it exactly same as in 
> job_txn_apply() :
>
>    aio_context_acquire(job->aio_context);
>    job_unref(job);
>
> ?

Oh, I just didn’t think of that.  Sounds good, thanks!

Hanna

> anyway:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>


