Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EFA47E26E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:39:56 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0MRu-0002mT-Jh
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0MQ5-0001Jj-6W
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:38:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n0MQ1-0002wg-Uy
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640259476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sder3y/cXxld13XVfdXxj6wtCuvcGhUHZhj+0R2hfzk=;
 b=IRdhyWDpa8CVsYtaKVMSiiwCUjXSLPP4lqszYP2BWTtasZrDnpMXORu+yzoQ3s9Loyc072
 xBNNw9LLIk2P9mGOydl7Aq1fcvLFqslbAWrAwQjWARv7SYU/NTAOzCO6QoW5VQMW5jw7wo
 qM58CJmkfp8ExaXrPOKPg2HtiIDvQU8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-5s6D1hXMN1SsJ_egNLkF2Q-1; Thu, 23 Dec 2021 06:37:55 -0500
X-MC-Unique: 5s6D1hXMN1SsJ_egNLkF2Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so4555425edc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sder3y/cXxld13XVfdXxj6wtCuvcGhUHZhj+0R2hfzk=;
 b=fJAE+Ny3m/vH1/4bHNcmM9iXfbSUOSRf1ABr7UoXaxAyOViZMVjiPm3jnSggrmYm7z
 9hTBXLNp22WXRpQqca7UaXza1MWExX59NOmYp8lQUGai/znmRbZa3/MOhHhrgZjBn+gp
 L/HlIyb/qcNZqrBF7//kwh8WgT81EbgSdntzG8C6veE0M3rc9+LgwIoipk7IOv4zDbmn
 9RlY2Yc16MLtVHNzQTW2kUc8kmmoIPeU+oBby0RO8UNWvned6YHNd87XD2hOpAmKjTf0
 6tv3JUsoZXsRHlLd/ZtFDw+pSGNcJOwCrlZby6ayHnjOgom0wtZ3PVmRJ79CziBwSMTN
 IDng==
X-Gm-Message-State: AOAM532MYfzjtFBVcDYBdNBReirRGr9dsqjNWqXCd72G12xYgZeRx+SA
 HkV/ACNEelSYausRayCsT1G5uf17CjdNFTbFm32A8BxibdG2N+HOqvCNvoWrzfmaATDAG1ica26
 rKFlZRc8ayUn6ayE=
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr1715738edd.35.1640259474519; 
 Thu, 23 Dec 2021 03:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyN3b1LLS+Q6/3ZfPM/OtHyhAXgyx6gQiiXDmquRtd8HITuQ3Y+rBOD1pQ8c9udSZTk3xBLmw==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr1715710edd.35.1640259474209; 
 Thu, 23 Dec 2021 03:37:54 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id w7sm1929505ede.66.2021.12.23.03.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 03:37:53 -0800 (PST)
Message-ID: <7b5a36d8-ad3b-9d70-93e2-ea43638d2cf9@redhat.com>
Date: Thu, 23 Dec 2021 12:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 05/14] block/mirror.c: use of job helpers in
 drivers to avoid TOC/TOU
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-6-eesposit@redhat.com>
 <e3d234fc-6937-61e0-c4d6-988196f16a09@virtuozzo.com>
 <67f2e473-b621-a57d-6c76-3235633649c5@redhat.com>
 <bed1cd66-2fe0-e619-fd08-d80dcafdd867@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <bed1cd66-2fe0-e619-fd08-d80dcafdd867@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.264, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/12/2021 11:47, Vladimir Sementsov-Ogievskiy wrote:
> 20.12.2021 13:34, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 18/12/2021 12:53, Vladimir Sementsov-Ogievskiy wrote:
>>> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>>>> Once job lock is used and aiocontext is removed, mirror has
>>>> to perform job operations under the same critical section,
>>>> using the helpers prepared in previous commit.
>>>>
>>>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>>>> are *nop*.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>   block/mirror.c | 8 +++-----
>>>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/block/mirror.c b/block/mirror.c
>>>> index 00089e519b..f22fa7da6e 100644
>>>> --- a/block/mirror.c
>>>> +++ b/block/mirror.c
>>>> @@ -653,7 +653,7 @@ static int mirror_exit_common(Job *job)
>>>>       BlockDriverState *target_bs;
>>>>       BlockDriverState *mirror_top_bs;
>>>>       Error *local_err = NULL;
>>>> -    bool abort = job->ret < 0;
>>>> +    bool abort = job_has_failed(job);
>>>>       int ret = 0;
>>>>       if (s->prepared) {
>>>> @@ -1161,9 +1161,7 @@ static void mirror_complete(Job *job, Error 
>>>> **errp)
>>>>       s->should_complete = true;
>>>>       /* If the job is paused, it will be re-entered when it is 
>>>> resumed */
>>>> -    if (!job->paused) {
>>>> -        job_enter(job);
>>>> -    }
>>>> +    job_enter_not_paused(job);
>>>>   }
>>>>   static void coroutine_fn mirror_pause(Job *job)
>>>> @@ -1182,7 +1180,7 @@ static bool mirror_drained_poll(BlockJob *job)
>>>>        * from one of our own drain sections, to avoid a deadlock 
>>>> waiting for
>>>>        * ourselves.
>>>>        */
>>>> -    if (!s->common.job.paused && !job_is_cancelled(&job->job) && 
>>>> !s->in_drain) {
>>>> +    if (job_not_paused_nor_cancelled(&s->common.job) && 
>>>> !s->in_drain) {
>>>>           return true;
>>>>       }
>>>>
>>>
>>> Why to introduce a separate API function for every use case?
>>>
>>> Could we instead just use WITH_JOB_LOCK_GUARD() ?
>>>
>>
>> This implies making the struct job_mutex public. Is that ok for you?
>>
> 
> Yes, I think it's OK.
> 
> Alternatively, you can use job_lock() / job_unlock(), or even rewrite 
> WITH_JOB_LOCK_GUARD() macro using job_lock/job_unlock, to keep mutex 
> private.. But I don't think it really worth it now.
> 
> Note that struct Job is already public, so if we'll use per-job mutex in 
> future it still is not a problem. Only when we decide to make struct Job 
> private, we'll have to decide something about JOB_LOCK_GUARD(), and at 
> this point we'll just rewrite it to work through some helper function 
> instead of directly touching the mutex.
> 
> 

Ok I will do that. Just FYI the initial idea was that drivers like 
monitor would not need to know about job_mutex lock, that is why I made 
the helpers in mirror.c.

Thank you,
Emanuele


