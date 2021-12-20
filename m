Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE147B341
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:53:52 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNnD-0006T3-5s
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzKyW-0003D3-AL
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:53:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mzKyP-00056D-7x
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J46pX5p+fBaacwdYaV3FKT5veqrDjRq27lv7dsS9yPo=;
 b=ZAunc5r8lpZ0hPINKZuEwfLfnQOb9ZrMaNnyMQd5y/QCvMn36jrjcIDvMuDlSDQwB+6d96
 Ck3iN40HITEI7KOHapa15S2mKmYfUBzfuRNk4nvdib/Vs+cXsaoo2ReLhTyKbOU1UXik/t
 3eGPvbMk3i/D9m+uCeZrLWRtX4VSRqc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-NnpA0gVRNHaZGjU1OW1yHg-1; Mon, 20 Dec 2021 05:34:38 -0500
X-MC-Unique: NnpA0gVRNHaZGjU1OW1yHg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z3-20020a05640235c300b003f829cc299cso4318035edc.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 02:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J46pX5p+fBaacwdYaV3FKT5veqrDjRq27lv7dsS9yPo=;
 b=mC7Je4UIefIGmSefKdUtHL8AGL8iylC4bfJq7ohqoF2DEmLFT0HbbHVi8r8Zso7YN9
 e1RM5vqVBikNYrcAVxBqO0ttwcv+EWvzQokMIe9VPIWossRap+POg522nScVs1etApcq
 5e5p/ZBQawA/9F3XLRJ64PdrsLqnO1u/OjwVoZktrS2+GvxTji0UrcXYpmY2L5moi97s
 P0gnCo+dlV4quSyZXUB0LShS3vXmB3ZeOBoJ72dWV9HYMqouq08l4pHIP9WFZtNDpdqC
 Q1duxgpRX7Gao+6TGi3crb4f7Im2Q1/eTPyJ9twv0Goc5y1RDgCJyPGdDYPHoZFXBmoI
 WBBA==
X-Gm-Message-State: AOAM531b+XaOQpfl+qgut5DbhcYyqK/ZxeR1WlE9iuZ575DUsDUAYWUs
 VGCVjRjm7ojEuG0h1/NBRSlRvZXrAeFs2YRb1k8GtgFUc/uBXQuz7y64KEV2BdwH5EE1tAB9wtM
 74Na7vYEmu3N+BSA=
X-Received: by 2002:a17:906:ae14:: with SMTP id
 le20mr12139884ejb.64.1639996477641; 
 Mon, 20 Dec 2021 02:34:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXLyqbiYBmVtTLhRpuxuWg5LxfGgcxqw/s3rZKPuU2CT3WOeEr5UeXyqxskhKrtN7khnd4vw==
X-Received: by 2002:a17:906:ae14:: with SMTP id
 le20mr12139855ejb.64.1639996477332; 
 Mon, 20 Dec 2021 02:34:37 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id qa41sm1776707ejc.0.2021.12.20.02.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 02:34:36 -0800 (PST)
Message-ID: <67f2e473-b621-a57d-6c76-3235633649c5@redhat.com>
Date: Mon, 20 Dec 2021 11:34:35 +0100
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
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e3d234fc-6937-61e0-c4d6-988196f16a09@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 18/12/2021 12:53, Vladimir Sementsov-Ogievskiy wrote:
> 04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
>> Once job lock is used and aiocontext is removed, mirror has
>> to perform job operations under the same critical section,
>> using the helpers prepared in previous commit.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/mirror.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/mirror.c b/block/mirror.c
>> index 00089e519b..f22fa7da6e 100644
>> --- a/block/mirror.c
>> +++ b/block/mirror.c
>> @@ -653,7 +653,7 @@ static int mirror_exit_common(Job *job)
>>       BlockDriverState *target_bs;
>>       BlockDriverState *mirror_top_bs;
>>       Error *local_err = NULL;
>> -    bool abort = job->ret < 0;
>> +    bool abort = job_has_failed(job);
>>       int ret = 0;
>>       if (s->prepared) {
>> @@ -1161,9 +1161,7 @@ static void mirror_complete(Job *job, Error **errp)
>>       s->should_complete = true;
>>       /* If the job is paused, it will be re-entered when it is 
>> resumed */
>> -    if (!job->paused) {
>> -        job_enter(job);
>> -    }
>> +    job_enter_not_paused(job);
>>   }
>>   static void coroutine_fn mirror_pause(Job *job)
>> @@ -1182,7 +1180,7 @@ static bool mirror_drained_poll(BlockJob *job)
>>        * from one of our own drain sections, to avoid a deadlock 
>> waiting for
>>        * ourselves.
>>        */
>> -    if (!s->common.job.paused && !job_is_cancelled(&job->job) && 
>> !s->in_drain) {
>> +    if (job_not_paused_nor_cancelled(&s->common.job) && !s->in_drain) {
>>           return true;
>>       }
>>
> 
> Why to introduce a separate API function for every use case?
> 
> Could we instead just use WITH_JOB_LOCK_GUARD() ?
> 

This implies making the struct job_mutex public. Is that ok for you?

Thank you,
Emanuele


