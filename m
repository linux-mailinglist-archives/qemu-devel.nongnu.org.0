Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC2596C33
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 11:42:13 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOFYy-0000YX-Iw
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 05:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOFST-0004rA-Ar
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOFSP-0006d7-LK
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 05:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660728924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smQbgbWtJ4/4y9ETs8V+2nosCmbzvNWVNAsKdcOqIbg=;
 b=MLO3caMEWk6XwrVKD6EjjkORY+KgDPiLt25gjfA3+mSO352nJ9SKigFoRVmoea0NRRit/P
 CcncwPLewkdUGxXJCLZO3F3MjjkUBV7p6MuJ6dKP9oT6UkyZb9rJVy6zC93MoytdLg+jRy
 B3mbd4WiMmwLi7Hi7Wy1AHBTp3kLN38=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-Z8z38EFuPtS3P7bASxwr8w-1; Wed, 17 Aug 2022 05:35:22 -0400
X-MC-Unique: Z8z38EFuPtS3P7bASxwr8w-1
Received: by mail-qk1-f197.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so11166018qkb.9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 02:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=smQbgbWtJ4/4y9ETs8V+2nosCmbzvNWVNAsKdcOqIbg=;
 b=b6xU0A266gREyBR5J9ToBhkW/DXeqUU8h5YnFj/gm7mZYQ9LUBei7ElBf2B7QKxsGT
 DJx3CbYTVZEFzoe7BFyEYW1rb6e+LLaIhCgy1CnJ4zCdbcq14C5AGv7iJkAqOYexVLJ5
 X2pm8lC8gHQM4UTrh427EPGNOcsmCZDJ8OWnSERuT0b9d94TJzccG1eSkVI5BVjqnxvR
 5l/mrDaR9pRcw4V5hmb+tKi39B6784uyWTthgqBac0lGfgwEpJLTbnEMZC1IFZFlZzTh
 o1fhyFpVE7j+xCdf5gaI95RFMxlHdz2YfQdcVoO4HM1yZ/dYDGTGKLbhG1gvS8j+q+Da
 2mSw==
X-Gm-Message-State: ACgBeo30B/Hx9BRAVRBtAOfc2U9PvQBC9tZr0DZ6m3eczAMKJQo8Xo39
 hlTqfKj45vbS1lzGDBPX6leSkwLoapARnlsWdhkYTMnLEnNR0DfCATHUWwk80sSGeYIoy0Ni66I
 w+mRQvEb4ie1uYL0=
X-Received: by 2002:a05:620a:1a04:b0:6bb:963d:44ce with SMTP id
 bk4-20020a05620a1a0400b006bb963d44cemr760136qkb.145.1660728922125; 
 Wed, 17 Aug 2022 02:35:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5NpBLKqo3+aEKWqjyUsPFr8zl3Iu04ktRmoWj1YmKbX+viBIhE0Y2fbLCRC5XNTJxV/oWoMw==
X-Received: by 2002:a05:620a:1a04:b0:6bb:963d:44ce with SMTP id
 bk4-20020a05620a1a0400b006bb963d44cemr760122qkb.145.1660728921918; 
 Wed, 17 Aug 2022 02:35:21 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05620a455500b006b893d135basm614115qkp.86.2022.08.17.02.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 02:35:21 -0700 (PDT)
Message-ID: <d818712b-b304-7646-5664-0bc262304138@redhat.com>
Date: Wed, 17 Aug 2022 11:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 11/21] jobs: group together API calls under the same
 job lock
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
 <20220725073855.76049-12-eesposit@redhat.com> <Yuv9cKJotWg0NEno@redhat.com>
 <1ed3c1c5-8393-2dc8-c930-606b73778a6b@redhat.com>
 <Yvyq/jhJ0B0W6mtF@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yvyq/jhJ0B0W6mtF@redhat.com>
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



Am 17/08/2022 um 10:46 schrieb Kevin Wolf:
>>>> @@ -475,13 +477,15 @@ void *block_job_create(const char *job_id, const BlockJobDriver *driver,
>>>>      job->ready_notifier.notify = block_job_event_ready;
>>>>      job->idle_notifier.notify = block_job_on_idle;
>>>>  
>>>> -    notifier_list_add(&job->job.on_finalize_cancelled,
>>>> -                      &job->finalize_cancelled_notifier);
>>>> -    notifier_list_add(&job->job.on_finalize_completed,
>>>> -                      &job->finalize_completed_notifier);
>>>> -    notifier_list_add(&job->job.on_pending, &job->pending_notifier);
>>>> -    notifier_list_add(&job->job.on_ready, &job->ready_notifier);
>>>> -    notifier_list_add(&job->job.on_idle, &job->idle_notifier);
>>>> +    WITH_JOB_LOCK_GUARD() {
>>>> +        notifier_list_add(&job->job.on_finalize_cancelled,
>>>> +                          &job->finalize_cancelled_notifier);
>>>> +        notifier_list_add(&job->job.on_finalize_completed,
>>>> +                          &job->finalize_completed_notifier);
>>>> +        notifier_list_add(&job->job.on_pending, &job->pending_notifier);
>>>> +        notifier_list_add(&job->job.on_ready, &job->ready_notifier);
>>>> +        notifier_list_add(&job->job.on_idle, &job->idle_notifier);
>>>> +    }
>>>>  
>>>>      error_setg(&job->blocker, "block device is in use by block job: %s",
>>>>                 job_type_str(&job->job));
>>> Why is this the right scope for the lock? It looks very arbitrary to
>>> lock only here, but not for the assignments above or the function calls
>>> below.
>>>
>>> Given that job_create() already puts the job in the job_list so it
>>> becomes visible for other code, should we not keep the job lock from the
>>> moment that we create the job until it is fully initialised?
>> I try to protect only what needs protection, nothing more. Otherwise
>> then it is not clear what are we protecting and why. According to the
>> split I made in job.h, things like job_type_str and whatever I did not
>> protect are not protected because they don't need the lock.
> I think the last paragraph above explains what it would protect?
> 
> Having a half-initialised job in the job list without holding the lock
> sounds dangerous to me. Maybe it's actually okay in practice because
> this is GLOBAL_STATE_CODE() and we can assume that code accessing
> the job list outside of the main thread probably skips over the
> half-initialised job, but it's another case where relying on the BQL is
> confusing when there would be a more specific lock for it.
> 

Ok, but this would imply:
1. create job_create_locked()
2. still drop the lock when calling block_job_add_bdrv(), since I am
pretty sure it can drain. So we still split the function in two (or
maybe three, if we need to reaqiure the lock after) parts.

Is that what you had in mind?

Emanuele


