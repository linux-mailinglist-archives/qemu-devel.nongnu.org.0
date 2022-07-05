Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F5D566EE4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:06:28 +0200 (CEST)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8iG1-00012E-Fu
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8iBT-0003nx-Gf
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8iBM-000668-7z
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657026095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhgXRRDQR/ERY8fhUgVTPAHigBYf4opgY+E5cYMFsbU=;
 b=XauSgJMQ2bYOO0f1sh5m6gb0MU1A1pGqhghCB6gqGVT8DfWKlwdSoLEe9N2mq7A5uowQco
 iBL96UPPjF4gri7nidO9Fc0ablayCo/LlnV0MZmFTpuO7R2Owz0sXuBKI+k1KDzqQCOa82
 BWgykoKV4+r9uCkQSQP3Cf/hNp/AopU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-7nHGYJTIPRuJKQuDV4Nf4A-1; Tue, 05 Jul 2022 09:01:34 -0400
X-MC-Unique: 7nHGYJTIPRuJKQuDV4Nf4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 m7-20020a05600c3b0700b003a1994306e5so1793230wms.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 06:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uhgXRRDQR/ERY8fhUgVTPAHigBYf4opgY+E5cYMFsbU=;
 b=7DomkQ3hgtXD0dDJtOIUHV1FiIW2XpkGyIQN73UEitCKBUK48xjh2rUs+lT7BDme7/
 65SAKHQaWzClAwBOZlvMJaejYuiW3RhJpVm0ZMf6bF1ffjLqzNiWJ+osKu/AuiUWrkM4
 7/xsYtIJQbRf0az9ndHUexuYLgDJ7Vp7l0duK8C9gKrj3wpSon13vw/V6Hy7coKHpM7v
 gE2J/y+cefaURaDD9gz8Fy3IEgqnky5B5BVY7e4h6x8HmyhYPEjMa2ayV3fGw6DKqj++
 O3zVBWujRAT5c7yutSj9+ToJWDs4KGz2Ttc+R5E97vFMwLpQutexNUxoC5dcXG1zyfaf
 TIdw==
X-Gm-Message-State: AJIora8+OqN1N0PTc0e/8UTonopdJAOk49TAGckSfa81hF8nF6Kbcg1X
 09qWoyK4EtYMovdXv8vPjww/bAcGM6+FT3tKYifNZW8BtPu06mqZPp+oRnqGyfDqAYdtnTewrw8
 SWs0e9zw3S18ACQE=
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr20001122wmp.158.1657026092805; 
 Tue, 05 Jul 2022 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubnS1BM4+ys27+YTOrQQt4B/QqmMk+8gZTzv62x21H3WE3KLIr07wTpF6gM2zs2OCQa4ByIg==
X-Received: by 2002:a05:600c:a08:b0:3a1:9319:ab78 with SMTP id
 z8-20020a05600c0a0800b003a19319ab78mr20001071wmp.158.1657026092456; 
 Tue, 05 Jul 2022 06:01:32 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0021d4aca9d1esm14728317wru.99.2022.07.05.06.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 06:01:32 -0700 (PDT)
Message-ID: <fa3e1d40-fe1c-7ae8-81da-d0122c753cc8@redhat.com>
Date: Tue, 5 Jul 2022 15:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-14-eesposit@redhat.com>
 <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
 <85eb06db-15ab-1451-c420-ec4956febe98@redhat.com>
In-Reply-To: <85eb06db-15ab-1451-c420-ec4956febe98@redhat.com>
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



Am 05/07/2022 um 10:17 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 05/07/2022 um 10:14 schrieb Stefan Hajnoczi:
>> On Wed, Jun 29, 2022 at 10:15:31AM -0400, Emanuele Giuseppe Esposito wrote:
>>> diff --git a/blockdev.c b/blockdev.c
>>> index 71f793c4ab..5b79093155 100644
>>> --- a/blockdev.c
>>> +++ b/blockdev.c
>>> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>>>          return;
>>>      }
>>>  
>>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>>> +    JOB_LOCK_GUARD();
>>> +
>>> +    for (job = block_job_next_locked(NULL); job;
>>> +         job = block_job_next_locked(job)) {
>>>          if (block_job_has_bdrv(job, blk_bs(blk))) {
>>>              AioContext *aio_context = job->job.aio_context;
>>>              aio_context_acquire(aio_context);
>>
>> Is there a lock ordering rule for job_mutex and the AioContext lock? I
>> haven't audited the code, but there might be ABBA lock ordering issues.
> 
> Doesn't really matter here, as lock is nop. To be honest I forgot which
> one should go first, probably job_lock because the aiocontext lock can
> be taken and released in callbacks.
> 
> Should I resend with ordering fixed? Just to have a consistent logic

Well actually how do I fix that? I would just add useless additional
changes into the diff, because for example in the case below I am not
even sure what exactly is the aiocontext protecting.

So I guess I'll leave as it is. I will just update the commit message to
make sure it is clear that the lock is nop and ordering is mixed.

Thank you,
Emanuele
> 
>>
>>> diff --git a/qemu-img.c b/qemu-img.c
>>> index 4cf4d2423d..289d88a156 100644
>>> --- a/qemu-img.c
>>> +++ b/qemu-img.c
>>> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>>>      int ret = 0;
>>>  
>>>      aio_context_acquire(aio_context);
>>> -    job_ref(&job->job);
>>> -    do {
>>> -        float progress = 0.0f;
>>> -        aio_poll(aio_context, true);
>>> +    WITH_JOB_LOCK_GUARD() {
>>
>> Here the lock order is the opposite of above.
>>


