Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C545BBF1B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 19:24:40 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZy22-0005Kk-Ji
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 13:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZy0N-0003lO-St
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 13:22:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oZy0J-0003Wo-LI
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 13:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663521768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEBPBSX7hl3S9ieJ9sYLo/9vxPlyVOQiEg+aUzR0SV4=;
 b=DuORFPI7ErMJtp47TvGW9nhHxVAa2g5uvTZFoBZxc7I3+eag1/V4TWqhFLZRuZS1mFn9qe
 vTKxwbZjcxd8k+TuW//LEBD/D2aO+0KAWr83Pks/nyEzsQjYia7jajcIQfKgApBoZTLyX8
 eBXkHr8HTZMzZ82JfWy3NDwFRUCXzBk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-529-M6Zxm_UnO9eC6tzZrGFD-g-1; Sun, 18 Sep 2022 13:22:47 -0400
X-MC-Unique: M6Zxm_UnO9eC6tzZrGFD-g-1
Received: by mail-qk1-f199.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so22505932qkp.7
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 10:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CEBPBSX7hl3S9ieJ9sYLo/9vxPlyVOQiEg+aUzR0SV4=;
 b=BTPjTqogEMqOtYuq5MMay+1CsHg9bi+ejto95nesx4NGqnTl9tC1CWDVPgY7XZKzTU
 zi2I90lpsh6qhqMpxLJkOBCbDfyef2lYM+C2GAOOhm2m0CtcGPuOhjqMsneCwxcFMg8H
 9XxDeLRTUSt+vHctSDZ1ka15cQAV8Ds/8Hswkwflsmfb9ic0aYJYPAHgF8jaQkKSy9SH
 DKHxAP3XcX4JJNjH1GhZ6A8R+BTwvrAJcAXtGZv9IFwEp/o9099vMm8NPncKCqmmGs2D
 AnCb6t5H6v6T/Do6JP4Rr5kZK/T4QCovarR8gbbJ/WrxT9DCpEcDpbhR+OHQFBOV90YG
 whAQ==
X-Gm-Message-State: ACrzQf3J2rQXMH9fKcOlWrN7slu/TKyFJy9RgObk51isr4RBS9Qvjit/
 E5C5BbffLkK1RTNytVl2BMjf9e+Np4VNf4P2hP43dmxuJhQA3JmOcuUE54a/hX2rcmip7R2/VJe
 4zNqOnL52HEMj9Mw=
X-Received: by 2002:ac8:5a13:0:b0:35c:e9b0:430b with SMTP id
 n19-20020ac85a13000000b0035ce9b0430bmr1345177qta.472.1663521766582; 
 Sun, 18 Sep 2022 10:22:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PiJrhjS2FUFFUfCl2Z47LJ3ke7Pps8gNuEZvSveEIPF4gvzZ6pVuGF3E7uBZPNZu//0wP9A==
X-Received: by 2002:ac8:5a13:0:b0:35c:e9b0:430b with SMTP id
 n19-20020ac85a13000000b0035ce9b0430bmr1345154qta.472.1663521766367; 
 Sun, 18 Sep 2022 10:22:46 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 q26-20020ac8451a000000b003445b83de67sm8981673qtn.3.2022.09.18.10.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 10:22:45 -0700 (PDT)
Message-ID: <a10720c9-a7d2-bae2-2967-9abe00b06343@redhat.com>
Date: Sun, 18 Sep 2022 19:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 21/21] job: remove unused functions
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
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-22-eesposit@redhat.com>
 <6da86669-f177-7d34-ba8e-5291327b2723@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6da86669-f177-7d34-ba8e-5291327b2723@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 14/09/2022 um 16:28 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/26/22 16:21, Emanuele Giuseppe Esposito wrote:
>> These public functions are not used anywhere, thus can be dropped.
>> Also, since this is the final job API that doesn't use AioContext
>> lock and replaces it with job_lock, adjust all remaining function
>> documentation to clearly specify if the job lock is taken or not.
>>
>> Also document the locking requirements for a few functions
>> where the second version is not removed.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   include/qemu/job.h |  96 ++++++++++++++----------------------------
>>   job.c              | 101 ++-------------------------------------------
>>   2 files changed, 34 insertions(+), 163 deletions(-)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index ad8b32b4ba..762d6a98a7 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -384,6 +384,8 @@ JobTxn *job_txn_new(void);
>>   /**
>>    * Release a reference that was previously acquired with
>> job_txn_add_job or
> 
> [..]
> 
>> +/**
>> + * Returns true if the job is user-paused.
>> + * Called with job lock held.
>> + */
>>   bool job_user_paused_locked(Job *job);
>>     /**
>>    * Resume the specified @job.
>>    * Must be paired with a preceding job_user_pause.
> 
> in comment: job_user_puase_locked
> 
> 
> Please also fix other removed function mentioning in comments, for
> example I see in comments mentioning of removed job_ref, job_unref,
> job_user_pause...

Ok

>> @@ -725,9 +703,6 @@ void job_cancel_sync_all(void);
>>    * Returns the return value from the job.
>>    * Called with job_lock *not* held.
> 
> in comment: with lock held.
> 

No idea what you mean here.

Thank you,
Emanuele


