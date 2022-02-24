Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 867B34C2813
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:29:48 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNARX-0001qm-Kg
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAPI-0008Un-CM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAPE-0006Ri-TJ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645694837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJVC8RRMbD6MtOCfx3IYgdxHq1C6zyN4mHz7dBtyJFg=;
 b=YnpPHV/0ynPbkPAPeXQ1xmeUEyJbIhN39hsFKb5yOsPOAM9hRGOkbRQ23bbmU4BXuRaOeL
 Jn3aUX5mvAK97t4FxDAKvLJvrm0mW81gkg/109vhwMq/cWpe94RpdyQUjepIwpGZHpentE
 12cl2UGSPiwLjx749a6nohbuh6haPpE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-KX5R8loONLevK9Vsm0dRkw-1; Thu, 24 Feb 2022 04:27:16 -0500
X-MC-Unique: KX5R8loONLevK9Vsm0dRkw-1
Received: by mail-qk1-f200.google.com with SMTP id
 s12-20020a05620a030c00b0064971887744so296948qkm.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QJVC8RRMbD6MtOCfx3IYgdxHq1C6zyN4mHz7dBtyJFg=;
 b=BvGTzN1jjom/MH298X14+jQu7MV8CrBy57Mh553Jp4pRZaWLDkdUMeTMQm+tGSdCeR
 +ZIRcPOijUCoGNnFyHsY87vRoXloTzqEjJeQ7KnJkC/nQDHoJa3RwIQQG9GV1KtD9j2F
 hv8XQKZqVekGU0rlsGdwmak4itwqCjd1yJ086ulp5HRKlpNxjOID+7zprlMojqpenNQI
 my+uty79fjessZpbJSuunRycqHpv6+Re07PAG+XnV4y6WMpFAh3FTT/qH1RXA2fvjizn
 fANryvX3Q1OWOEdSLGxScv4KpZsG0fw9pZu9PHvNBcCukeBTJwtrI+somgOoJN2XBH+4
 vPaQ==
X-Gm-Message-State: AOAM5313ExnHldovQ4EV5FaQip9ZHiVS1XAL0NMhVbDvgqolr9v7b8O1
 wdA4sisff+FOhV4Z+L14dQrVinMpuDwlwT9h+cg1goVzxZRXfs5x4MNl/O+yWMBQVqQqDrerXJ+
 M7t1Rth1+chpc/Iw=
X-Received: by 2002:a05:622a:34f:b0:2de:4099:1ae3 with SMTP id
 r15-20020a05622a034f00b002de40991ae3mr1437586qtw.109.1645694835574; 
 Thu, 24 Feb 2022 01:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdcpfK5uxOU+We4qHGyhHZlVyKa3zIi4uYPFQ3o+bA+hWo00mblTIxAvOPXAWEFkvZzHTmQg==
X-Received: by 2002:a05:622a:34f:b0:2de:4099:1ae3 with SMTP id
 r15-20020a05622a034f00b002de40991ae3mr1437574qtw.109.1645694835385; 
 Thu, 24 Feb 2022 01:27:15 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id t23sm1159642qtp.67.2022.02.24.01.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 01:27:15 -0800 (PST)
Message-ID: <46219267-493d-ad69-5767-39f22457da6d@redhat.com>
Date: Thu, 24 Feb 2022 10:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 06/20] jobs: remove aiocontext locks since the
 functions are under BQL
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-7-eesposit@redhat.com>
 <Yg5X1V1md25LOxaP@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yg5X1V1md25LOxaP@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/02/2022 15:12, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:34:59AM -0500, Emanuele Giuseppe Esposito wrote:
>> In preparation to the job_lock/unlock patch, remove these
>> aiocontext locks.
>> The main reason these two locks are removed here is because
>> they are inside a loop iterating on the jobs list. Once the
>> job_lock is added, it will have to protect the whole loop,
>> wrapping also the aiocontext acquire/release.
>>
>> We don't want this, as job_lock must be taken inside the AioContext
>> lock, and taking it outside would cause deadlocks.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  blockdev.c | 4 ----
>>  job-qmp.c  | 4 ----
>>  2 files changed, 8 deletions(-)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index 8cac3d739c..e315466914 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -3713,15 +3713,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>>  
>>      for (job = block_job_next(NULL); job; job = block_job_next(job)) {
> 
> I'm confused. block_job_next() is supposed to be called with job_mutex
> held since it iterates the jobs list.

Ok here it is clear that the lock is taken to protect the list. So I
should squash this patch with the one that enables job lock/unlock
(patch 19).

Emanuele

> 
> The patch series might fix this later on but it's hard to review patches
> with broken invariants.
> 
> Does this mean git-bisect(1) is broken since intermediate commits are
> not thread-safe?
> 
>>          BlockJobInfo *value;
>> -        AioContext *aio_context;
>>  
>>          if (block_job_is_internal(job)) {
>>              continue;
>>          }
>> -        aio_context = block_job_get_aio_context(job);
>> -        aio_context_acquire(aio_context);
>>          value = block_job_query(job, errp);
> 
> This function accesses fields that are protected by job_mutex, which we
> don't hold.
> 


