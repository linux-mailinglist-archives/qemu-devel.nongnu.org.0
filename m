Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7B4C2807
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:26:30 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAOL-00063K-7P
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAIh-0007hq-H0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nNAIe-0005M1-Oh
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645694436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QvQqTkaOa8slJysn9UJ8Z3cTK63LtA4dHia3xW72KXM=;
 b=Yap0t/cYziU4w/kVb+GJpUaEVhyK0nq+vBU2kTxZQrSPKFTOMkc7Chb/gwQkerw7u/EXHX
 v6Gkcz1Wp0LGfJJ1cJ9Yflt/Qc3VtduQTQ252CdAxRGEMv8lDfUNM0l+3Fmkgfgxr/iSz+
 MMb5iRR/On3NFaYWg5rp5/t9PMNOK/s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-6YrdFQTfPDa6l1pBsDTMdw-1; Thu, 24 Feb 2022 04:20:09 -0500
X-MC-Unique: 6YrdFQTfPDa6l1pBsDTMdw-1
Received: by mail-qk1-f198.google.com with SMTP id
 w4-20020a05620a094400b0060dd52a1445so1956744qkw.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 01:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QvQqTkaOa8slJysn9UJ8Z3cTK63LtA4dHia3xW72KXM=;
 b=PYnZXGi4bOazXDQExP7gSJQdY4qRK1num6ZKlsjwx6llHJczzJOMy5CiXeJEJBePgl
 eKaxT5e9BfnRvcLn2o57VaS/XAhcsPOw6/L7MAeTJL8FOa61d2fwS/gjNrtgmarQpfjF
 Y3lNiVwoSJEwafvnsn9gpqNFTW+n+5QCDZ+Y4osGjk69W3Nzq+eyyYLn8VOMKBQv85lz
 guQDuyOWt0bnBid5Mf9THAHsr1NFrLSQ4GI0f5Dmlu6Q1J5VvXIxqFkOewQ0X3K85fmy
 xtSOBt7F6YkAJ5AZ6NovBvepl8Him7vQJ7oMaxapG+9FlubvrIkk5NNY8hrMkcgbmikd
 VhHQ==
X-Gm-Message-State: AOAM530GHPR0ATnWBOPoK+uSi95KNtYQohvVkbUl5wKjzrGwNJFXXxBJ
 xSHwCvywrzQ7L5rGAG9q/MIjLRgBjzOTIK23ySNrOE9+t0cZsohzIrV8iA/heVejt8Y5VSGpPi6
 fpH0k36nPHFaK8ks=
X-Received: by 2002:a05:6214:5295:b0:425:4291:a18a with SMTP id
 kj21-20020a056214529500b004254291a18amr1123387qvb.54.1645694408812; 
 Thu, 24 Feb 2022 01:20:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySAHS5t7FgrBHCdKDYmQrFcCdgJ0bfnsrjFg9rgt6JwLjNI5OFDytJs+6s8yEGtpwjkZrhVw==
X-Received: by 2002:a05:6214:5295:b0:425:4291:a18a with SMTP id
 kj21-20020a056214529500b004254291a18amr1123379qvb.54.1645694408594; 
 Thu, 24 Feb 2022 01:20:08 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m24sm1012878qki.129.2022.02.24.01.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 01:20:08 -0800 (PST)
Message-ID: <50df9b3d-fa54-bbf0-9d5b-d40214dc209e@redhat.com>
Date: Thu, 24 Feb 2022 10:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 04/20] job.c: move inner aiocontext lock in callbacks
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-5-eesposit@redhat.com>
 <Yg5Rfyf2NvnCPAWq@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yg5Rfyf2NvnCPAWq@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/02/2022 14:45, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 09:34:57AM -0500, Emanuele Giuseppe Esposito wrote:
>> Instead of having the lock in job_tnx_apply, move it inside
> 
> s/tnx/txn/
> 
>> in the callback. This will be helpful for next commits, when
>> we introduce job_lock/unlock pairs.
>>
>> job_transition_to_pending() and job_needs_finalize() do not
>> need to be protected by the aiocontext lock.
>>
>> No functional change intended.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  job.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> I find this hard to review. The patch reduces the scope of the
> AioContext lock region and accesses Job in places where the AioContext
> was previously held. The commit description doesn't explain why it is
> safe to do this.

I will add this to the commit description, but in my opinion the
AioContext lock was not protecting any of the job fields in this patch.

It is only taken because the callbacks assume it is always held.
No job field in this patch is protected by the AioContext lock because
they are also read/written in functions that never take the lock.

Emanuele
> 
> I may need to audit the code myself but will try reviewing a few more
> patches first to see if I get the hang of this.
> 
>>
>> diff --git a/job.c b/job.c
>> index f13939d3c6..d8c13ac0d1 100644
>> --- a/job.c
>> +++ b/job.c
>> @@ -149,7 +149,6 @@ static void job_txn_del_job(Job *job)
>>  
>>  static int job_txn_apply(Job *job, int fn(Job *))
>>  {
>> -    AioContext *inner_ctx;
>>      Job *other_job, *next;
>>      JobTxn *txn = job->txn;
>>      int rc = 0;
>> @@ -164,10 +163,7 @@ static int job_txn_apply(Job *job, int fn(Job *))
>>      aio_context_release(job->aio_context);
>>  
>>      QLIST_FOREACH_SAFE(other_job, &txn->jobs, txn_list, next) {
>> -        inner_ctx = other_job->aio_context;
>> -        aio_context_acquire(inner_ctx);
>>          rc = fn(other_job);
>> -        aio_context_release(inner_ctx);
>>          if (rc) {
>>              break;
>>          }
>> @@ -717,11 +713,15 @@ static void job_clean(Job *job)
>>  
>>  static int job_finalize_single(Job *job)
>>  {
>> +    AioContext *ctx = job->aio_context;
>> +
>>      assert(job_is_completed(job));
>>  
>>      /* Ensure abort is called for late-transactional failures */
>>      job_update_rc(job);
>>  
>> +    aio_context_acquire(ctx);
>> +
>>      if (!job->ret) {
>>          job_commit(job);
>>      } else {
>> @@ -729,6 +729,8 @@ static int job_finalize_single(Job *job)
>>      }
>>      job_clean(job);
>>  
>> +    aio_context_release(ctx);
>> +
>>      if (job->cb) {
>>          job->cb(job->opaque, job->ret);
>>      }
>> @@ -833,8 +835,8 @@ static void job_completed_txn_abort(Job *job)
>>              assert(job_cancel_requested(other_job));
>>              job_finish_sync(other_job, NULL, NULL);
>>          }
>> -        job_finalize_single(other_job);
>>          aio_context_release(ctx);
>> +        job_finalize_single(other_job);
>>      }
>>  
>>      /*
>> @@ -849,11 +851,16 @@ static void job_completed_txn_abort(Job *job)
>>  
>>  static int job_prepare(Job *job)
>>  {
>> +    AioContext *ctx = job->aio_context;
>>      assert(qemu_in_main_thread());
>> +
>>      if (job->ret == 0 && job->driver->prepare) {
>> +        aio_context_acquire(ctx);
>>          job->ret = job->driver->prepare(job);
>> +        aio_context_release(ctx);
>>          job_update_rc(job);
>>      }
>> +
>>      return job->ret;
>>  }
>>  
>> -- 
>> 2.31.1
>>


