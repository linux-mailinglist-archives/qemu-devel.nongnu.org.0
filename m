Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C3495FBA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:24:52 +0100 (CET)
Received: from localhost ([::1]:46088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAtuM-0005IP-OL
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAt7G-0001K2-00
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAt7D-000505-5n
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642768442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe+AGrdCr8L1HzJdLlPx4rQ7HH6IUBOz1QMfF7KpyIQ=;
 b=YdjDpzAx+j+zrCLD/dzR5CnEXBCVagns1VQjRVNxK40NKMDXVSHBOE0VC4NHRGjDcOeONK
 sLvkGd78sBpL1u1yZ9lJTZmj5qR1YRjReLonXAGyFEjCjQR6ILPaIiJg3ocRzyETp6y0Ko
 gTULFflo4jahtbSxyU0vFV3uT663yJk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-xl13VB4RPemsgzlRgQclXw-1; Fri, 21 Jan 2022 07:34:00 -0500
X-MC-Unique: xl13VB4RPemsgzlRgQclXw-1
Received: by mail-ed1-f72.google.com with SMTP id
 s9-20020aa7d789000000b004021d03e2dfso8965775edq.18
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 04:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pe+AGrdCr8L1HzJdLlPx4rQ7HH6IUBOz1QMfF7KpyIQ=;
 b=chqQPkStHoTUNo6acZHUfkWFzMblxTpBaXaAb8S+l9/CdPYnJO1QvqOd62K6wx0mOF
 debN1OM1ofWoflEIqFvBfrv2IrtReEnYhMam65WuobMQ60SdDnoNpt+iqRMpGPQY3y2d
 84UHQ5Aepyd+NQNc3Xr3cBcyPZNAA2iymHjLN+8FJEWw0SHO3U26JXhkzcQYXLDHPdAd
 9jC42Z7vfWcYKBWhkv9oWdv/vo0peL0rlcI4gWocqDzu921dE2vMAiEKn5C3R4MZKH1D
 dZ777L3uDXwIYoFTElIPAwEl32XrTjCrkfrMDsW/7L0X47+FlYzjlFwcrlSo0/Ex6mLV
 1XTA==
X-Gm-Message-State: AOAM530cCDx/yBudwXDiA39WTMLwTQNt75hDJnRn47V4Gv91W68jH8fF
 VTlzMIJxSVU4wXg2Qk2ArL/wu14haTFgpTqBL9qhnEYmWMme8MkyjimODhLQisd7NvNrFz6QaSG
 Xrj2BPdpCiMgdGcg=
X-Received: by 2002:a05:6402:2752:: with SMTP id
 z18mr4095259edd.108.1642768439466; 
 Fri, 21 Jan 2022 04:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCCljiLFg7PJyF569c+aUR2t3AoOagXLU4wEk+1mDtFBkM0B4gUQFmySY//qUHRbcXj5nkRA==
X-Received: by 2002:a05:6402:2752:: with SMTP id
 z18mr4095251edd.108.1642768439312; 
 Fri, 21 Jan 2022 04:33:59 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id a14sm2564692edx.96.2022.01.21.04.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 04:33:58 -0800 (PST)
Message-ID: <bfbffe7e-88b6-353e-9cdd-e78106ed1867@redhat.com>
Date: Fri, 21 Jan 2022 13:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
 <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/01/2022 11:31, Paolo Bonzini wrote:
>> diff --git a/blockjob.c b/blockjob.c
>> index cf1f49f6c2..468ba735c5 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -155,14 +155,16 @@ static void child_job_set_aio_ctx(BdrvChild *c, 
>> AioContext *ctx,
>>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>>       }
>> -    job->job.aio_context = ctx;
>> +    WITH_JOB_LOCK_GUARD() {
>> +        job->job.aio_context = ctx;
>> +    }
>>   }
>>   static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>>   {
>>       BlockJob *job = c->opaque;
>> -    return job->job.aio_context;
>> +    return job_get_aio_context(&job->job);
>>   }
>>   static const BdrvChildClass child_job = {
> 
> Both called with BQL held, I think.

Yes, as their callbacks .get_parent_aio_context and .set_aio_context are 
defined as GS functions in block_int-common.h
> 
>> @@ -218,19 +220,21 @@ int block_job_add_bdrv(BlockJob *job, const char 
>> *name, BlockDriverState *bs,
>>   {
>>       BdrvChild *c;
>>       bool need_context_ops;
>> +    AioContext *job_aiocontext;
>>       assert(qemu_in_main_thread());
>>       bdrv_ref(bs);
>> -    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
>> +    job_aiocontext = job_get_aio_context(&job->job);
>> +    need_context_ops = bdrv_get_aio_context(bs) != job_aiocontext;
>> -    if (need_context_ops && job->job.aio_context != 
>> qemu_get_aio_context()) {
>> -        aio_context_release(job->job.aio_context);
>> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
>> +        aio_context_release(job_aiocontext);
>>       }
>>       c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, 
>> shared_perm, job,
>>                                  errp);
>> -    if (need_context_ops && job->job.aio_context != 
>> qemu_get_aio_context()) {
>> -        aio_context_acquire(job->job.aio_context);
>> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
>> +        aio_context_acquire(job_aiocontext);
>>       }
>>       if (c == NULL) {
>>           return -EPERM;
> 
> BQL held, too.

Wouldn't it be better to keep job_get_aio_context and implement like this:

AioContext *job_get_aio_context(Job *job)
{
     /*
      * Job AioContext can be written under BQL+job_mutex,
      * but can be read with just the BQL held.
      */
     assert(qemu_in_main_thread());
     return job->aio_context;
}

and instead job_set_aio_context:

void job_set_aio_context(Job *job, AioContext *ctx)
{
     JOB_LOCK_GUARD();
     assert(qemu_in_main_thread());
     job->aio_context = ctx;
}

(obviously implement also _locked version, if needed, and probably move 
the comment in get_aio_context in job.h).

Thank you,
Emanuele


