Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED470496233
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:39:41 +0100 (CET)
Received: from localhost ([::1]:59122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAw0r-0006Zq-2G
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAvoa-00069t-U0
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAvoU-00006L-60
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642778763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yXK71wnvv6UUYGBXxH9aBE99gEo+NTy7GyGOuQk0t0U=;
 b=QyWTsvY7aLryOc6X0OKLyQ63Plav7jHlijM2I/Fu56CJPvG2sBCvLwlFaG2GaZN6HzTYkI
 08iXuguHCfiCFTGZw/9QOZMXdpHn0PnvI94g5LOLcQYy1jK44bSwz2eAYlRkngTzjDjnmu
 bCSkzPGbmnEatHZxScazlsEZx2PQJ8M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-t2S5t3zAPsuH1462KXof7w-1; Fri, 21 Jan 2022 10:25:59 -0500
X-MC-Unique: t2S5t3zAPsuH1462KXof7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 c23-20020a056402159700b00406aa42973eso2069273edv.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 07:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yXK71wnvv6UUYGBXxH9aBE99gEo+NTy7GyGOuQk0t0U=;
 b=fHv21g9nldZ2ElaTQXBExrU7nZCf1q4IHo9iEgQXRIVCoOOHXk209MIKaWm31yacOo
 BmWWmkBVXZzfclk1PsjelQdjVPyF3PmyTf0RPogvwSUBw4awjelo56pWVOraQEPMFNhY
 Rk76f1yBnARnuwO2ESi7cjONHbRi6YXi+p8NXPs+WBvtGj1Pd/h0Vu1PRWCtM7UrKeeT
 J0qM5Ry820e9SOJ9jrRVW0t1H1btAHe90K0y7c5bftO42ZnsAeVok2S6ysS7gRrLZdjQ
 LCFIHgwglRV93/3TIZ6WsDBvh9Pl7y2YhdmEUyfO3Vg7NokfONPUwmcGPXtmmZL17wtD
 uSqQ==
X-Gm-Message-State: AOAM530uprQATq+XZhTvc7TEPYoRP6UwyovOjn+Ub6NiqqFHwrO1QzPT
 SLMjNpHXkilDoHwiWmwo/q55SCIBZKak3ggOAWJHWDk2hGzENc1NUu6S/cAdZXAlBrP3GkWgYej
 NfHG+er6eVY5lG40=
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr3694642ejc.178.1642778758553; 
 Fri, 21 Jan 2022 07:25:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm8h1p2UgtibFj4bRYOMmHwWGzxL5VIGvay+tcXS9dYp10d8aK7aDfn2Zr2Q1mlJnoreEjiw==
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr3694623ejc.178.1642778758359; 
 Fri, 21 Jan 2022 07:25:58 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id gz12sm2153537ejc.124.2022.01.21.07.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 07:25:57 -0800 (PST)
Message-ID: <93565619-bff8-9f64-50f0-3e9acd570777@redhat.com>
Date: Fri, 21 Jan 2022 16:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 03/16] job.h: define locked functions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-4-eesposit@redhat.com>
 <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
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



On 19/01/2022 11:44, Paolo Bonzini wrote:
> On 1/5/22 15:01, Emanuele Giuseppe Esposito wrote:
>> These functions assume that the job lock is held by the
>> caller, to avoid TOC/TOU conditions. Therefore, their
>> name must end with _locked.
>>
>> Introduce also additional helpers that define _locked
>> functions (useful when the job_mutex is globally applied).
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are*nop*.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> 
> So, this is the only remaining issue: I am not sure about this rename.
> The functions you are changing are
> 
> +void job_txn_unref_locked(JobTxn *txn);
> +void job_txn_add_job_locked(JobTxn *txn, Job *job);
> +void job_ref_locked(Job *job);
> +void job_unref_locked(Job *job);
> +void job_enter_cond_locked(Job *job, bool(*fn)(Job *job));
> +bool job_is_completed_locked(Job *job);
> +bool job_is_ready_locked(Job *job);
> +void job_pause_locked(Job *job);
> +void job_resume_locked(Job *job);
> +void job_user_pause_locked(Job *job, Error **errp);
> +bool job_user_paused_locked(Job *job);
> +void job_user_resume_locked(Job *job, Error **errp);
> +Job *job_next_locked(Job *job);
> +Job *job_get_locked(const char *id);
> +int job_apply_verb_locked(Job *job, JobVerb verb, Error **errp);
> +void job_early_fail_locked(Job *job);
> +void job_complete_locked(Job *job, Error **errp);
> +void job_cancel_locked(Job *job, bool force);
> +void job_user_cancel_locked(Job *job, bool force, Error **errp);
> +int job_cancel_sync_locked(Job *job, bool force);
> +int job_complete_sync_locked(Job *job, Error **errp);
> +void job_finalize_locked(Job *job, Error **errp);
> +void job_dismiss_locked(Job **job, Error **errp);
> +int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
> 
> and most of them (if not all?) will never be called by the job driver, only
> by the monitor.  The two APIs (for driver / for monitor) are quite separate
> and have different locking policies: the monitor needs to take the lock to
> avoid TOC/TOU races, the driver generally can let the API take the lock.
> 
> The rename makes the monitor code heavier, but if you don't do the 
> rename the
> functions in job.c are named very inconsistently.  So I'm inclined to say
> this patch is fine---but I'd like to hear from others as well.
> 
> I think the two APIs should be in two different header files, similar
> to how you did the graph/IO split.

The split was proposed in previous versions, but Vladimir did not really 
like it and suggested to send it as a separate series:

https://patchew.org/QEMU/20211104153121.1362449-1-eesposit@redhat.com/


Vladimir's comment:
https://patchew.org/QEMU/20211104153121.1362449-1-eesposit@redhat.com/

Thank you,
Emanuele

> 
> Paolo
> 


