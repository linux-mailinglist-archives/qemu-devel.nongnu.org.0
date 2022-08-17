Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A7596B40
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:18:01 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEFT-0002do-Tl
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOE2T-0006Z3-Si
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOE2R-0006kS-0P
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:04:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660723470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anngLp3MWQpeGlT+zr3HzdmA3XcocVWCsNbFM3Qpknc=;
 b=I0rl2xFQIkNXIITxC+tc807dOk9aGkO/vPx8LiP6opmwfHfFSdQsXvbW4pK/5hn8VfBfOu
 Hl7vhsAAg7mmfRr6zCtgMjs6spd7nwJ3RFTV8jYmJ1bfE4GTzT2fM3OXTv8ikNbYfQLC97
 BQMiAkOPzubsSS6yfqWTfRx9jX4X75Y=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-9RWD7WuzPxWQ9aVsbH6D3A-1; Wed, 17 Aug 2022 04:04:28 -0400
X-MC-Unique: 9RWD7WuzPxWQ9aVsbH6D3A-1
Received: by mail-qk1-f199.google.com with SMTP id
 s9-20020a05620a254900b006b54dd4d6deso11037135qko.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 01:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=anngLp3MWQpeGlT+zr3HzdmA3XcocVWCsNbFM3Qpknc=;
 b=vDBGBhny5/mgYK3vf5to376VKtUF9D26VdUS29wQ8LsFPYdbxvaAM7Xz8uZUA8b6kO
 GL57riGSaQRmHXtWiIw/ixzAot+/olzjoQ5htd2/iVusRpaVjbUj2n27gnFzQjcgf0r1
 aVErgYHSZKD6Z987/cscffatocf1Mt++dueMoYwu8hrUguIoNk2C04/7zptNZQTfVAZ6
 PFSTAhlEmJnZ+3bGu5SnCYdsDkM/dmHrnCftdnUjDlA8e580S1s79dWzTPY0DQ2FlMnK
 kenjOvOKVPYvR7b1RWJ9259emS4wGLUgEtVQxOU1O48L7su5PRDkRJcEjYybGOWViTSY
 n+tQ==
X-Gm-Message-State: ACgBeo3RZ82Gur9UXDA9Kf2BRJlp/v70CjLSgfDNQmbfRaY5JhqsY1kB
 sENXY5VdsdYreNBgZZPsaFhVN9fjWpilOwBLjwe9b2p0DD0XDc0VhyOdg2YMy/Z+HSGGCpGi8WQ
 L6zBwQYDsukEf1uY=
X-Received: by 2002:ac8:5b93:0:b0:343:752b:395b with SMTP id
 a19-20020ac85b93000000b00343752b395bmr19156195qta.20.1660723467702; 
 Wed, 17 Aug 2022 01:04:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cLYroTOf9lZ4cSyDVtRbz3yD2EMnU+9hyLVDzeNbd/iLho+dT3QEqsc6MI/9NJm+yXfGj7A==
X-Received: by 2002:ac8:5b93:0:b0:343:752b:395b with SMTP id
 a19-20020ac85b93000000b00343752b395bmr19156173qta.20.1660723467452; 
 Wed, 17 Aug 2022 01:04:27 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a05620a415400b006bb83c2be40sm2408460qko.59.2022.08.17.01.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 01:04:26 -0700 (PDT)
Message-ID: <bbb32ac1-0212-a0b6-9fae-a5907fbc9668@redhat.com>
Date: Wed, 17 Aug 2022 10:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 14/21] jobs: protect job.aio_context with BQL and
 job_mutex
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
 <20220725073855.76049-15-eesposit@redhat.com> <Yuze6ldui3LtEcZm@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yuze6ldui3LtEcZm@redhat.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 05/08/2022 um 11:12 schrieb Kevin Wolf:
> Am 25.07.2022 um 09:38 hat Emanuele Giuseppe Esposito geschrieben:
>> In order to make it thread safe, implement a "fake rwlock",
>> where we allow reads under BQL *or* job_mutex held, but
>> writes only under BQL *and* job_mutex.
> 
> Oh, so the "or BQL" part is only for job.aio_context? Okay.
> 
>> The only write we have is in child_job_set_aio_ctx, which always
>> happens under drain (so the job is paused).
>> For this reason, introduce job_set_aio_context and make sure that
>> the context is set under BQL, job_mutex and drain.
>> Also make sure all other places where the aiocontext is read
>> are protected.
>>
>> Note: at this stage, job_{lock/unlock} and job lock guard macros
>> are *nop*.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  block/replication.c |  6 ++++--
>>  blockjob.c          |  3 ++-
>>  include/qemu/job.h  | 19 ++++++++++++++++++-
>>  job.c               | 12 ++++++++++++
>>  4 files changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/replication.c b/block/replication.c
>> index 55c8f894aa..2189863df1 100644
>> --- a/block/replication.c
>> +++ b/block/replication.c
>> @@ -148,8 +148,10 @@ static void replication_close(BlockDriverState *bs)
>>      }
>>      if (s->stage == BLOCK_REPLICATION_FAILOVER) {
>>          commit_job = &s->commit_job->job;
>> -        assert(commit_job->aio_context == qemu_get_current_aio_context());
>> -        job_cancel_sync(commit_job, false);
>> +        WITH_JOB_LOCK_GUARD() {
>> +            assert(commit_job->aio_context == qemu_get_current_aio_context());
>> +            job_cancel_sync_locked(commit_job, false);
>> +        }
>>      }
> 
> .bdrv_close runs under the BQL, so why is this needed? Maybe a
> GLOBAL_STATE_CODE() annotation would be helpful, though.

I think I left it because it would be confusing to leave a _locked
function without the job lock. I'll add the GLOBAL_STATE_CODE anyways.

> 
>>      if (s->mode == REPLICATION_MODE_SECONDARY) {
>> diff --git a/blockjob.c b/blockjob.c
>> index 96fb9d9f73..9ff2727025 100644
>> --- a/blockjob.c
>> +++ b/blockjob.c
>> @@ -162,12 +162,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
>>          bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
>>      }
>>  
>> -    job->job.aio_context = ctx;
>> +    job_set_aio_context(&job->job, ctx);
>>  }
>>  
>>  static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
>>  {
>>      BlockJob *job = c->opaque;
>> +    assert(qemu_in_main_thread());
> 
> Any reason not to use GLOBAL_STATE_CODE()?

4 months ago GLOBAL_STATE_CODE did not exist yet, and I didn't think
about updating it :)
> 
>>      return job->job.aio_context;
>>  }

>> +    /* protect against read in job_do_yield_locked */
>> +    JOB_LOCK_GUARD();
>> +    /* ensure the coroutine is quiescent while the AioContext is changed */
>> +    assert(job->pause_count > 0);
> 
> job->pause_count only shows that pausing was requested. The coroutine is
> only really quiescent if job->busy == false, too.
> 
> Or maybe job->paused is actually the one you want here.
I think job->paused works too.

Emanuele


