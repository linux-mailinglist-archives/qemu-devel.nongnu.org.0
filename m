Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2374938EA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:49:52 +0100 (CET)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8XH-0003Dy-Hq
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:49:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8FZ-0004S1-SS; Wed, 19 Jan 2022 05:31:33 -0500
Received: from [2a00:1450:4864:20::330] (port=35572
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nA8FY-0000w5-4H; Wed, 19 Jan 2022 05:31:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso13448836wmj.0; 
 Wed, 19 Jan 2022 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xzTxom39Z1uDLOtnOsouyZdv53TphArIbxzfz73AWnE=;
 b=dj+SVgb98ue5NWUCMa8gvbS/mieYOs3ViN7ZcXZ+TWOcSpLhJ7/WsjNT3SqL6S4mIf
 Z+o/hyH5ocgwqAyKCjdOLfBFPVoFlQGpxF+cpDjNdjDBoxDsSNH/0WjasmjfxzD6Pnow
 DlUEDoCq2DGWMYQJLQGXDwEDGbRStADoEpZpUXBrTWl24r5PWyMOuynwbZmW289WLTWu
 uB3dInF18L2FFEdcBZbdOwPRz3Du6wfZZ0yYQjWf40l/sZrThZxBzbTpSSqQjYFhMKU4
 CnoNB3SscGATOR3ZEsvrxyPdHKZfkdQoWmplTtKWyPiMpeP5PYg+KvDNwA4LvziWHt8D
 VebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xzTxom39Z1uDLOtnOsouyZdv53TphArIbxzfz73AWnE=;
 b=FVWwm5bZKKqfyT/tEQR9MaZ1VMZPiv9etO6o9Qn2vw8e7rMBXrDinMMQ3Y60anaG9N
 49HT0eU8eFTfn8TyrLaozI+itdzn3HKpumvZaiso8OO8g5pLHQnZTPmKZJ8NZrZHnwJV
 aHhCsf0k3y4QlsmSU47qwKh6HXifQNTH90LX6J/yDiKWboaFqNSXW7sP4QMBcgH1l/rb
 IA+Bq6Kq2UQAcDq0lRBrqri92iGiMc+QFEKimeXZFkI1Qd8Bf2sG0y/YFMHqJ+lToNBS
 gqElL24IzMFwxLn8zyi9ODu2J0+0ZdwfK1HuowBAw9fZJW2Nz5KAC6kxiDSnGk/ed1I2
 /58g==
X-Gm-Message-State: AOAM531SMiGVadwZWfDwpfX+274PM/tPj6/uDO9xV93N1M8+hnltHlDu
 b/oaoaEQilQ0iPJD+lvJQdg=
X-Google-Smtp-Source: ABdhPJyVhMlrwJQ8ti9SXHkYaBWItgWB9DoCqxSto5TCJOnM0V/LI1/x08uj8v8dE9rvV1mP4QhCxw==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr2812134wmh.140.1642588290257; 
 Wed, 19 Jan 2022 02:31:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 4sm15901773wrb.13.2022.01.19.02.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:31:29 -0800 (PST)
Message-ID: <19305447-1ba0-0646-1c81-83b83c56ba79@redhat.com>
Date: Wed, 19 Jan 2022 11:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 14/16] job.c: use job_get_aio_context()
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-15-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220105140208.365608-15-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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


Getters such as job_get_aio_context are often wrong because the 
AioContext can change immediately after returning.

So, I wonder if job.aio_context should be protected with a kind of "fake 
rwlock": read under BQL or job_lock, write under BQL+job_lock.  For this 
to work, you can add an assertion for qemu_in_main_thread() to 
child_job_set_aio_ctx, or even better have the assertion in a wrapper 
API job_set_aio_context_locked().

And then, we can remove job_get_aio_context().

Let's look at all cases individually:

On 1/5/22 15:02, Emanuele Giuseppe Esposito wrote:
> diff --git a/block/commit.c b/block/commit.c
> index f639eb49c5..961b57edf0 100644
> --- a/block/commit.c
> +++ b/block/commit.c
> @@ -369,7 +369,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
>           goto fail;
>       }
>   
> -    s->base = blk_new(s->common.job.aio_context,
> +    s->base = blk_new(job_get_aio_context(&s->common.job),
>                         base_perms,
>                         BLK_PERM_CONSISTENT_READ
>                         | BLK_PERM_GRAPH_MOD

Here the AioContext is the one of bs.  It cannot change because we're 
under BQL.  Replace with bdrv_get_aio_context.

> @@ -382,7 +382,7 @@ void commit_start(const char *job_id, BlockDriverState *bs,
>       s->base_bs = base;
>   
>       /* Required permissions are already taken with block_job_add_bdrv() */
> -    s->top = blk_new(s->common.job.aio_context, 0, BLK_PERM_ALL);
> +    s->top = blk_new(job_get_aio_context(&s->common.job), 0, BLK_PERM_ALL);
>       ret = blk_insert_bs(s->top, top, errp);
>       if (ret < 0) {
>           goto fail;

Same.

> diff --git a/block/mirror.c b/block/mirror.c
> index 41450df55c..72b4367b4e 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1743,7 +1743,7 @@ static BlockJob *mirror_start_job(
>           target_perms |= BLK_PERM_GRAPH_MOD;
>       }
>   
> -    s->target = blk_new(s->common.job.aio_context,
> +    s->target = blk_new(job_get_aio_context(&s->common.job),
>                           target_perms, target_shared_perms);
>       ret = blk_insert_bs(s->target, target, errp);
>       if (ret < 0) {

Same.

> diff --git a/block/replication.c b/block/replication.c
> index 50ea778937..68018948b9 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -148,8 +148,8 @@ static void replication_close(BlockDriverState *bs)
>       }
>       if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>           commit_job = &s->commit_job->job;
> -        assert(commit_job->aio_context == qemu_get_current_aio_context());
>           WITH_JOB_LOCK_GUARD() {
> +            assert(commit_job->aio_context == qemu_get_current_aio_context());
>               job_cancel_sync_locked(commit_job, false);
>           }
>       }

Ok.

> diff --git a/blockjob.c b/blockjob.c
> index cf1f49f6c2..468ba735c5 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -155,14 +155,16 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
>           bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>       }
>   
> -    job->job.aio_context = ctx;
> +    WITH_JOB_LOCK_GUARD() {
> +        job->job.aio_context = ctx;
> +    }
>   }
>   
>   static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>   {
>       BlockJob *job = c->opaque;
>   
> -    return job->job.aio_context;
> +    return job_get_aio_context(&job->job);
>   }
>   
>   static const BdrvChildClass child_job = {

Both called with BQL held, I think.

> @@ -218,19 +220,21 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
>   {
>       BdrvChild *c;
>       bool need_context_ops;
> +    AioContext *job_aiocontext;
>       assert(qemu_in_main_thread());
>   
>       bdrv_ref(bs);
>   
> -    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
> +    job_aiocontext = job_get_aio_context(&job->job);
> +    need_context_ops = bdrv_get_aio_context(bs) != job_aiocontext;
>   
> -    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
> -        aio_context_release(job->job.aio_context);
> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
> +        aio_context_release(job_aiocontext);
>       }
>       c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
>                                  errp);
> -    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
> -        aio_context_acquire(job->job.aio_context);
> +    if (need_context_ops && job_aiocontext != qemu_get_aio_context()) {
> +        aio_context_acquire(job_aiocontext);
>       }
>       if (c == NULL) {
>           return -EPERM;

BQL held, too.

> diff --git a/job.c b/job.c
> index f16a4ef542..8a5b710d9b 100644
> --- a/job.c
> +++ b/job.c
> @@ -566,7 +566,7 @@ void job_enter_cond_locked(Job *job, bool(*fn)(Job *job))
>       job->busy = true;
>       real_job_unlock();
>       job_unlock();
> -    aio_co_enter(job->aio_context, job->co);
> +    aio_co_enter(job_get_aio_context(job), job->co);
>       job_lock();
>   }
>   

If you replace aio_co_enter with aio_co_schedule, you can call it 
without dropping the lock.  The difference being that aio_co_schedule 
will always go through a bottom half.

> @@ -1138,7 +1138,6 @@ static void coroutine_fn job_co_entry(void *opaque)
>       Job *job = opaque;
>       int ret;
>   
> -    assert(job->aio_context == qemu_get_current_aio_context());
>       assert(job && job->driver && job->driver->run);
>       job_pause_point(job);
>       ret = job->driver->run(job, &job->err);
> @@ -1177,7 +1176,7 @@ void job_start(Job *job)
>           job->paused = false;
>           job_state_transition_locked(job, JOB_STATUS_RUNNING);
>       }
> -    aio_co_enter(job->aio_context, job->co);
> +    aio_co_enter(job_get_aio_context(job), job->co);

Better to use aio_co_schedule here, too, and move it under the previous 
WITH_JOB_LOCK_GUARD.

>   }
>   
>   void job_cancel_locked(Job *job, bool force)
> @@ -1303,7 +1302,8 @@ int job_finish_sync_locked(Job *job, void (*finish)(Job *, Error **errp),
>       }
>   
>       job_unlock();
> -    AIO_WAIT_WHILE(job->aio_context, (job_enter(job), !job_is_completed(job)));
> +    AIO_WAIT_WHILE(job_get_aio_context(job),
> +                   (job_enter(job), !job_is_completed(job)));
>       job_lock();

Here I think we are also holding the BQL, because this function is 
"sync", so it's safe to use job->aio_context.

Paolo

