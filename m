Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40557595C57
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:54:55 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNw5t-0006vN-Jf
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNw42-0002sG-8g
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNw3x-0005ec-DJ
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660654372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2daFjGvybwfH6zyKux8A/vPjoF/a6fiTuth9EXEXXgA=;
 b=RA0/WmXf2Xox52/1X7QZ+7swbdDEVPjulXBlbijIL262zHh4VsqKDjC7Zkm4vWOYdfeZL1
 dibo5alSf+KBSsNt5OTMwoovm37K11QzbfLzEezxUt/iTsIQAGD45u1JOrgnJk8Ha1T5Z3
 hedSoKf7R8u/MC1yDxHPYWCIRkaPZnc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595--teyA0lwMkiYvECKtyRE8g-1; Tue, 16 Aug 2022 08:52:51 -0400
X-MC-Unique: -teyA0lwMkiYvECKtyRE8g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so4758413wmo.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2daFjGvybwfH6zyKux8A/vPjoF/a6fiTuth9EXEXXgA=;
 b=vrhVMmapmCiec2+s8CmlNc9WZVUX7iiclVAIfvfsuq3iHukosjShFcw0FEiXsP21Oc
 qC4by+BASaWFJ3t8LIjxeXxyRomGqE4zyDpjrww5I3kMXZ2f1zYnrCbDsU5I/wFNSM/g
 BXdGRyWfqkqKY9ESeKHAF2KjZFHfZSvodyJrTdP4/ImQyjP7p9GNXZF2rT3s+rdPj2hl
 /jbWIETlWr9nAqP3OLtrRf9KWGN2UtyuUqXAeNz7YcBPichNJYYGu3c6Xbn0uHoqSiR2
 ZDLUkpyPCqUHRg1fQkzlrQWlXPNWLnQuqRR2AZXBvzPj1A92iQV2X4nNOqccc72mIOHd
 4Qpg==
X-Gm-Message-State: ACgBeo0obVFpyfbFAOioMlf7enbCSbw4t5OgdbaErzWctgwhJSLsHQvL
 ctUHihxCq54bxn6f818buG6jcJ5XDY+NQYoa/xBfY0MHWQ3QYfQ3Mtv4XKQCtf7a40Rn2g62XCy
 8hlJKFMjPFF30v1k=
X-Received: by 2002:a05:6000:60a:b0:220:62ec:4f2b with SMTP id
 bn10-20020a056000060a00b0022062ec4f2bmr11243097wrb.313.1660654370090; 
 Tue, 16 Aug 2022 05:52:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6aBWP40Z+CX7pAdb+vi///WEiS5W1zkYo/aCSBMrZsUylDjin2x4PvQhQBHee7964KVCkKkg==
X-Received: by 2002:a05:6000:60a:b0:220:62ec:4f2b with SMTP id
 bn10-20020a056000060a00b0022062ec4f2bmr11243076wrb.313.1660654369874; 
 Tue, 16 Aug 2022 05:52:49 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c4e1500b003a50924f1c0sm12515295wmq.18.2022.08.16.05.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 05:52:49 -0700 (PDT)
Message-ID: <43acbcd7-d00f-ee74-df22-314745900f93@redhat.com>
Date: Tue, 16 Aug 2022 14:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
 <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


> 
>>   }
>> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)>          
>> assert(!job->txn);
>>             if (job->driver->free) {
>> +            AioContext *aio_context = job->aio_context;
>>               job_unlock();
>> +            /* FIXME: aiocontext lock is required because cb calls
>> blk_unref */
>> +            aio_context_acquire(aio_context);
>>               job->driver->free(job);
>> +            aio_context_release(aio_context);
> 
> So, job_unref_locked() must be called with aio_context not locked,
> otherwise we dead-lock here? That should be documented in function
> declaration comment.
> 
> For example in qemu-img.c in run_block_job() we do exactly that: call
> job_unref_locked()  inside aio-context lock critical seaction..

No, job_unref_locked has also status and refcnt and all the other fields
that need to be protectd. Only free must be called without job lock held.

> 
> 
>>               job_lock();
>>           }
>>   @@ -581,21 +565,17 @@ void job_enter_cond_locked(Job *job,
>> bool(*fn)(Job *job))
>>           return;
>>       }
>>   -    real_job_lock();
>>       if (job->busy) {
>> -        real_job_unlock();
>>           return;
>>       }
>>         if (fn && !fn(job)) {
>> -        real_job_unlock();
>>           return;
>>       }
>>         assert(!job->deferred_to_main_loop);
>>       timer_del(&job->sleep_timer);
>>       job->busy = true;
>> -    real_job_unlock();
>>       job_unlock();
>>       aio_co_wake(job->co);
>>       job_lock();
>> @@ -626,13 +606,11 @@ static void coroutine_fn job_do_yield_locked(Job
>> *job, uint64_t ns)
>>   {
>>       AioContext *next_aio_context;
>>   -    real_job_lock();
>>       if (ns != -1) {
>>           timer_mod(&job->sleep_timer, ns);
>>       }
>>       job->busy = false;
>>       job_event_idle_locked(job);
>> -    real_job_unlock();
>>       job_unlock();
>>       qemu_coroutine_yield();
>>       job_lock();
>> @@ -922,6 +900,7 @@ static void job_clean(Job *job)
>>   static int job_finalize_single_locked(Job *job)
>>   {
>>       int job_ret;
>> +    AioContext *ctx = job->aio_context;
>>         assert(job_is_completed_locked(job));
>>   @@ -929,6 +908,7 @@ static int job_finalize_single_locked(Job *job)
>>       job_update_rc_locked(job);
>>         job_unlock();
>> +    aio_context_acquire(ctx);
> 
> Hmm, and this function and all its callers now should be called with
> aio-context lock not locked?

Why not leave it as it is?
> 
> For example job_exit is scheduled as as BH. Aren't BHs called with
> aio-context lock held?

I see no aiocontext call in aio_bh_schedule_oneshot and callees...

So summing up, no, I don't think I will apply your suggestions for this
patch here (assume the opposite for all the others).

Emanuele
> 
>>         if (!job->ret) {
>>           job_commit(job);
>> @@ -937,6 +917,7 @@ static int job_finalize_single_locked(Job *job)
>>       }
>>       job_clean(job);
>>   +    aio_context_release(ctx);
>>       job_lock();
>>         if (job->cb) {
> 
> [..]
> 
> 


