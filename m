Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C15496505
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:29:27 +0100 (CET)
Received: from localhost ([::1]:58734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyf8-0005s7-Ae
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxwf-0007Dm-Qn
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxwb-000792-Ju
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642787004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSr8sOKmQH0o2YNvCmsI786ibhkLqUl+Ji0a37l/+lE=;
 b=aKm9YwZQalPkxuPJxJUNh9LNdYcD//txiJZUE1dYKzuAQwRoAXWf1VKbK4ErnoXU7XgpuQ
 BM21poK/EgnOaduZN3rg3rP5LD9sJi+cQE8jgJyXiak1fPUwxcmBBxi3mNbVRIn2eUdpgJ
 7AAQutisiJ306Dw4FJ5/28sO3QGcrJo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-bCaJAWGJPaW9C3H2SKhBIQ-1; Fri, 21 Jan 2022 12:43:22 -0500
X-MC-Unique: bCaJAWGJPaW9C3H2SKhBIQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so2340400edf.22
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 09:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uSr8sOKmQH0o2YNvCmsI786ibhkLqUl+Ji0a37l/+lE=;
 b=pvQh0p1ABNUz6kHN0PHpRJptEQgVkyPr1B5T7RwRlk/vjEbS5qE3r5r1YVbu478pRr
 G/fLqS40h3K65LOf7Yf1e6ktiNtTep1rkoGmGi6WkfH2Du3dPWj8VNnVAawdVnKgytJL
 WdfSVARXCM+KK4APiXx9ItDEQjlWrYUSQfJB4UgzhLH0rTH7XIfv0lYhZOvdyVygpDuy
 Ol1Cj52J0QV0NL39wxamsfBfktjbCfoJPy4mO/1TshIQ8OeZXA7rFTP3/0Ec5kqKU3Pj
 5SZR1ZTOD4qO5+bGIMll0wMX4yXZD7QUmHESbqiuAiTFVKW1jBT8noxMrRQGnr/6RmFU
 hjGA==
X-Gm-Message-State: AOAM5314gc8qp3hCinOowzzLxtWsyTzZYauFS08+UiRWJO5ZVRDUfXsF
 Juc119+Y8Zr4UG9v1zOigF1SRZRoQum3oyJGW0XRP6bkzdg3UUM/ZsDPgl9bqSyt0pJW9lC5xCQ
 V18yCsuc7tzs76nw=
X-Received: by 2002:a05:6402:1d54:: with SMTP id
 dz20mr5165997edb.395.1642787001604; 
 Fri, 21 Jan 2022 09:43:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvChIXoweednUo0VZi9nvgBSGALWIbefvw1yD5SSLGFU4wbPgkPh8UKAchbjZbNJp8OKOSsg==
X-Received: by 2002:a05:6402:1d54:: with SMTP id
 dz20mr5165961edb.395.1642787001295; 
 Fri, 21 Jan 2022 09:43:21 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id gz12sm2248650ejc.124.2022.01.21.09.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 09:43:20 -0800 (PST)
Message-ID: <89193ddf-2c1a-d6ca-12a1-9b1e4d255c30@redhat.com>
Date: Fri, 21 Jan 2022 18:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
 <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
 <bfbffe7e-88b6-353e-9cdd-e78106ed1867@redhat.com>
In-Reply-To: <bfbffe7e-88b6-353e-9cdd-e78106ed1867@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/01/2022 13:33, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 19/01/2022 11:31, Paolo Bonzini wrote:
>>> diff --git a/blockjob.c b/blockjob.c
>>> index cf1f49f6c2..468ba735c5 100644
>>> --- a/blockjob.c
>>> +++ b/blockjob.c
>>> @@ -155,14 +155,16 @@ static void child_job_set_aio_ctx(BdrvChild *c, 
>>> AioContext *ctx,
>>>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>>>       }
>>> -    job->job.aio_context = ctx;
>>> +    WITH_JOB_LOCK_GUARD() {
>>> +        job->job.aio_context = ctx;
>>> +    }
>>>   }
>>>   static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>>>   {
>>>       BlockJob *job = c->opaque;
>>> -    return job->job.aio_context;
>>> +    return job_get_aio_context(&job->job);
>>>   }
>>>   static const BdrvChildClass child_job = {
>>
>> Both called with BQL held, I think.
> 
> Yes, as their callbacks .get_parent_aio_context and .set_aio_context are 
> defined as GS functions in block_int-common.h
>>
>>> @@ -218,19 +220,21 @@ int block_job_add_bdrv(BlockJob *job, const 
>>> char *name, BlockDriverState *bs,
>>>   {
>>>       BdrvChild *c;
>>>       bool need_context_ops;
>>> +    AioContext *job_aiocontext;
>>>       assert(qemu_in_main_thread());
>>>       bdrv_ref(bs);
>>> -    need_context_ops = bdrv_get_aio_context(bs) != 
>>> job->job.aio_context;
>>> +    job_aiocontext = job_get_aio_context(&job->job);
>>> +    need_context_ops = bdrv_get_aio_context(bs) != job_aiocontext;
>>> -    if (need_context_ops && job->job.aio_context != 
>>> qemu_get_aio_context()) {
>>> -        aio_context_release(job->job.aio_context);
>>> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
>>> +        aio_context_release(job_aiocontext);
>>>       }
>>>       c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, 
>>> shared_perm, job,
>>>                                  errp);
>>> -    if (need_context_ops && job->job.aio_context != 
>>> qemu_get_aio_context()) {
>>> -        aio_context_acquire(job->job.aio_context);
>>> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
>>> +        aio_context_acquire(job_aiocontext);
>>>       }
>>>       if (c == NULL) {
>>>           return -EPERM;
>>
>> BQL held, too.
> 
> Wouldn't it be better to keep job_get_aio_context and implement like this:
> 
> AioContext *job_get_aio_context(Job *job)
> {
>      /*
>       * Job AioContext can be written under BQL+job_mutex,
>       * but can be read with just the BQL held.
>       */
>      assert(qemu_in_main_thread());
>      return job->aio_context;
> }

Uhm ok this one doesn't really work, because it's ok to read it under 
either BQL or job lock. So I will get rid of job_get_aio_context, but 
add job_set_aio_context (and use it in child_job_set_aio_ctx).

Emanuele
> 
> and instead job_set_aio_context:
> 
> void job_set_aio_context(Job *job, AioContext *ctx)
> {
>      JOB_LOCK_GUARD();
>      assert(qemu_in_main_thread());
>      job->aio_context = ctx;
> }
> 
> (obviously implement also _locked version, if needed, and probably move 
> the comment in get_aio_context in job.h).
> 
> Thank you,
> Emanuele


