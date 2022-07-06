Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EBA5681DF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:40:31 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90aD-00076y-W2
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o90JN-0004oY-To
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:23:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o90JI-0000Ae-Ga
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657095779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5+9jyYIDME5yOSGH6CMeMrNFdntSRMO0FKfRbf+fbc=;
 b=KL7LXFcl5ZzL5DRm+8O4WoQ5tmi2VrkTA8jvhQX0FvQspqlR/gc1qN8KIg91deM5a7cIde
 qEeaqF6xSHa0vMtgnan1gHjTiV1QECUTWC9kHOHV/TVQzDT098AwLviinxKx2Z3PBvRIMp
 JbkartZiQh4NjE4JL5I1+QLJKZ2uBtQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-rTKt46phMnOpmjFc4_G5Xg-1; Wed, 06 Jul 2022 04:22:58 -0400
X-MC-Unique: rTKt46phMnOpmjFc4_G5Xg-1
Received: by mail-qt1-f198.google.com with SMTP id
 m4-20020aed27c4000000b0031b0ef018aaso11790992qtg.20
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O5+9jyYIDME5yOSGH6CMeMrNFdntSRMO0FKfRbf+fbc=;
 b=TnnJyDPjI/mmo1smiOECAuprMPARjJ7aSqm6F9zwPBEbMkzynjNdx2DC0UZ5GWPICj
 0siaKP6w3GdvyrubdW1eO42z8FmHBL2h82ajM4tX1Pc61a60D77s4VlDVfH+4q6Ovoy1
 s01uCFd5ycVNwhcfc19xXwhxGMq8AVYHv+dyHua2iDXl4FUWtPx94tRTikp9tROJYSsH
 leu/vG1Dv7vCrJzeVczsYA6f1IkzegbZ5VRcIk5vHQsEP9xLeQOaCscnZ85UudkHwUML
 W77b1w+ClrKZ5skZna0Y/ORhIgOaSS/i8sCOC0JrPnka97l0rH2HWBPdYqe5xA3d29NJ
 8qlA==
X-Gm-Message-State: AJIora8w1qNiKBqXUwTgRl9hhizDZu0UpAQqigEG3Cay1V1PbGgDKQ+t
 YYwBTKmro8bZZYpNqfdRWeRv2/Ls46iS3Ot8cr12O++BLAbwPAn5nKVLFcwGQttaFNeilLCkBpr
 DMhkDRu6qvQRIqno=
X-Received: by 2002:a05:622a:508:b0:317:aefe:66bc with SMTP id
 l8-20020a05622a050800b00317aefe66bcmr31062630qtx.496.1657095777715; 
 Wed, 06 Jul 2022 01:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3HyNbJBPZ6fCqVuNPBsFwiUFtQzDoZKBp9m2cw7ySao1eh1VLG/yHO7SeDN+W+44+Tlpy+g==
X-Received: by 2002:a05:622a:508:b0:317:aefe:66bc with SMTP id
 l8-20020a05622a050800b00317aefe66bcmr31062612qtx.496.1657095777387; 
 Wed, 06 Jul 2022 01:22:57 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 hh10-20020a05622a618a00b003154e7466casm23522492qtb.51.2022.07.06.01.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 01:22:56 -0700 (PDT)
Message-ID: <a015b31a-a195-c146-576b-754517f3614a@redhat.com>
Date: Wed, 6 Jul 2022 10:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 06/20] job.h: define functions called without job lock
 held
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
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-7-eesposit@redhat.com>
 <b96f9001-66d3-3c4e-617b-c515982336de@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <b96f9001-66d3-3c4e-617b-c515982336de@yandex-team.ru>
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



Am 05/07/2022 um 12:53 schrieb Vladimir Sementsov-Ogievskiy:
> On 6/29/22 17:15, Emanuele Giuseppe Esposito wrote:
>> These functions don't need a _locked() counterpart, since
>> they are all called outside job.c and take the lock only
>> internally.
>>
>> Update also the comments in blockjob.c (and move them in job.c).
> 
> Still, that would be better as a separate patch.
> 
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> No functional change intended.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   blockjob.c         | 20 --------------------
>>   include/qemu/job.h | 37 ++++++++++++++++++++++++++++++++++---
>>   job.c              | 15 +++++++++++++++
>>   3 files changed, 49 insertions(+), 23 deletions(-)
>>
>> diff --git a/blockjob.c b/blockjob.c
>> index 4868453d74..7da59a1f1c 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -36,21 +36,6 @@
>>   #include "qemu/main-loop.h"
>>   #include "qemu/timer.h"
>>   -/*
>> - * The block job API is composed of two categories of functions.
>> - *
>> - * The first includes functions used by the monitor.  The monitor is
>> - * peculiar in that it accesses the block job list with
>> block_job_get, and
>> - * therefore needs consistency across block_job_get and the actual
>> operation
>> - * (e.g. block_job_set_speed).  The consistency is achieved with
>> - * aio_context_acquire/release.  These functions are declared in
>> blockjob.h.
>> - *
>> - * The second includes functions used by the block job drivers and
>> sometimes
>> - * by the core block layer.  These do not care about locking, because
>> the
>> - * whole coroutine runs under the AioContext lock, and are declared in
>> - * blockjob_int.h.
>> - */
>> -
>>   static bool is_block_job(Job *job)
>>   {
>>       return job_type(job) == JOB_TYPE_BACKUP ||
>> @@ -433,11 +418,6 @@ static void block_job_event_ready(Notifier *n,
>> void *opaque)
>>   }
>>     -/*
>> - * API for block job drivers and the block layer.  These functions are
>> - * declared in blockjob_int.h.
>> - */
>> -
>>   void *block_job_create(const char *job_id, const BlockJobDriver
>> *driver,
>>                          JobTxn *txn, BlockDriverState *bs, uint64_t
>> perm,
>>                          uint64_t shared_perm, int64_t speed, int flags,
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 99960cc9a3..b714236c1a 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -363,6 +363,7 @@ void job_txn_unref_locked(JobTxn *txn);
>>     /**
>>    * Create a new long-running job and return it.
>> + * Called with job_mutex *not* held.
>>    *
>>    * @job_id: The id of the newly-created job, or %NULL for internal jobs
>>    * @driver: The class object for the newly-created job.
>> @@ -400,6 +401,8 @@ void job_unref_locked(Job *job);
>>    * @done: How much progress the job made since the last call
>>    *
>>    * Updates the progress counter of the job.
>> + *
>> + * Progress API is thread safe.
> 
> This tell nothing for function user. Finally the whole job_ API will be
> thread safe, isn't it?
> 
> I think here we need simply "called with mutex not held". (Or even "may
> be called with mutex held or not held" if we need it, or just nothing)
> 
> and note about progress API should be somewhere in job.c, as that's
> implementation details.

What about "Progress API is thread safe. Can be called with job mutex
held or not"?

> 
[...]
> 
> I'd merge all new comments in job.h to the previous commit, as they are
> related to the questions risen by it.

I disagree, I think it will be a mess of functions again if we mix these
one that don't need the lock held and the ones that need it.

You understand it because you got the logic of this serie, but others
may not.

> 
> 
>>   void job_cancel_sync_all(void);
>>     /**
>> diff --git a/job.c b/job.c
>> index dd44fac8dd..7a3cc93f66 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -32,12 +32,27 @@
>>   #include "trace/trace-root.h"
>>   #include "qapi/qapi-events-job.h"
>>   +/*
>> + * The job API is composed of two categories of functions.
>> + *
>> + * The first includes functions used by the monitor.  The monitor is
>> + * peculiar in that it accesses the block job list with job_get, and
>> + * therefore needs consistency across job_get and the actual operation
>> + * (e.g. job_user_cancel). To achieve this consistency, the caller
>> + * calls job_lock/job_unlock itself around the whole operation.
>> + *
>> + *
>> + * The second includes functions used by the block job drivers and
>> sometimes
>> + * by the core block layer. These delegate the locking to the callee
>> instead.
>> + */
>> +
>>   /*
>>    * job_mutex protects the jobs list, but also makes the
>>    * struct job fields thread-safe.
>>    */
>>   QemuMutex job_mutex;
>>   +/* Protected by job_mutex */
>>   static QLIST_HEAD(, Job) jobs = QLIST_HEAD_INITIALIZER(jobs);
>>     /* Job State Transition Table */
> 
> 
> So the logic is: the function that doesn't have public _locked
> counterpart has explicit comment that mutex should be not held. OK.
> 


