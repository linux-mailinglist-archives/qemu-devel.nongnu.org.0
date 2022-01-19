Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91547493951
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:13:30 +0100 (CET)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8u9-00035i-4F
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:13:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8q2-0001ie-7T; Wed, 19 Jan 2022 06:09:19 -0500
Received: from [2a00:1450:4864:20::336] (port=56070
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8pz-0006PD-Lb; Wed, 19 Jan 2022 06:09:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id c66so4636560wma.5;
 Wed, 19 Jan 2022 03:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=acG2kxGvIAZAVaUEg8N0rUPMrz8m+39nInkf7vkXviQ=;
 b=SYEQiUfdduGxHtJSmmsy0oPUFvqeTvSihsqJBbBqEK5rVCH1TvRAN/nh4kbw0X2i4B
 WSiGrf2y8pX+moP0kOK1JzcXD6OkmW1iCoAXmwITyz/PU+0zyshfEqAhpro8chGDaJsy
 zcfO8rzVviJKX5743JAhAuVftX9deNYwDQTjy6QhWmUasXlL5NkdTkwoCpG50hbFVCSM
 1nKL1Y/ZbBnZUUrHFOHiAj36QqChrWACM7yMflkYbxzlIciV1Aqhz0qzOS1w78bfrgIF
 NWEZ89PlODYB7/uDguB05GksJrWKoTsM+mueV4qFsPf3llQ/x10/6Bxg8ZY+A5krt+Rx
 OXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=acG2kxGvIAZAVaUEg8N0rUPMrz8m+39nInkf7vkXviQ=;
 b=CKNKJp10Nt2OYWSjdiZfShKZ02u/UZj9vyokYvYsoHC9P4Bb9o03VgUX2yuugvc/YN
 yY7NsqjuZzbCoRB0l3n2JH83k2fFvUAiWEsrgfI8OjkgqkUKGrfvlrhRiOibrb8pK9FC
 f88m67VTYCnkdJDf9HpnHV6DwNZfNfmeDcy2EiAFxcS1H5jCUnS9ol3L2Wa25vTgo/e9
 v7IqxWOHgqqVqnJtIRRrpyNNsNrCc7+hWrQBHVzCj7CkBWvKzTjvIbhBImfnJjoodYLC
 AOEd8lapXS0W+BSJ1LwLYWNwMqD0gKGEX93sC3S5iH/pPlo1uiuSIUc0fLXev3nlS2p7
 o69w==
X-Gm-Message-State: AOAM532kEaatXNDOgi8w89JKBiVFIKzmKJKiHs7jUj5XNImhxH0bwJaM
 PuokZPY0B+Aiy1iJWB7n8TY=
X-Google-Smtp-Source: ABdhPJzi7avPF6eu+qX01owUMTRinuarklKGr/l+R+IDQXbsuV+7BMTQwjiIEaiVtV8zNJ5VtP272g==
X-Received: by 2002:a5d:660a:: with SMTP id n10mr5655407wru.40.1642590549098; 
 Wed, 19 Jan 2022 03:09:09 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f5sm4793492wmf.47.2022.01.19.03.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 03:09:08 -0800 (PST)
Message-ID: <bd1bcce3-1a9b-dca6-7373-af2ca42e949b@redhat.com>
Date: Wed, 19 Jan 2022 12:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 09/16] jobs: remove aiocontext locks since the
 functions are under BQL
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-10-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-10-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/5/22 15:02, Emanuele Giuseppe Esposito wrote:
> In preparation to the job_lock/unlock patch, remove these
> aiocontext locks.
> The main reason these two locks are removed here is because
> they are inside a loop iterating on the jobs list. Once the
> job_lock is added, it will have to protect the whole loop,
> wrapping also the aiocontext acquire/release.
> 
> We don't want this, as job_lock can only be *wrapped by*
> the aiocontext lock, and not vice-versa, to avoid deadlocks.

Better to avoid the passive: "must be taken inside the AioContext lock, 
and taking it outside would cause deadlocks".  Also add a note about the 
lock hierarchy to patch 1.

> @@ -3707,15 +3707,11 @@ BlockJobInfoList *qmp_query_block_jobs(Error **errp)
>   
>       for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>           BlockJobInfo *value;
> -        AioContext *aio_context;
>   
>           if (block_job_is_internal(job)) {
>               continue;
>           }

block_job_next, block_job_query, etc. do not have the _locked suffix. 
Is this because all block_job_ functions need the job_mutex held, or 
just laziness? :)

Paolo

> -        aio_context = blk_get_aio_context(job->blk);
> -        aio_context_acquire(aio_context);
>           value = block_job_query(job, errp);
> -        aio_context_release(aio_context);
>           if (!value) {
>               qapi_free_BlockJobInfoList(head);
>               return NULL;
> diff --git a/job-qmp.c b/job-qmp.c
> index de4120a1d4..f6f9840436 100644
> --- a/job-qmp.c
> +++ b/job-qmp.c
> @@ -173,15 +173,11 @@ JobInfoList *qmp_query_jobs(Error **errp)
>   
>       for (job = job_next_locked(NULL); job; job = job_next_locked(job)) {
>           JobInfo *value;
> -        AioContext *aio_context;
>   
>           if (job_is_internal(job)) {
>               continue;
>           }
> -        aio_context = job->aio_context;
> -        aio_context_acquire(aio_context);
>           value = job_query_single(job, errp);
> -        aio_context_release(aio_context);
>           if (!value) {
>               qapi_free_JobInfoList(head);
>               return NULL;


