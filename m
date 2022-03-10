Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54E4D4494
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:28:18 +0100 (CET)
Received: from localhost ([::1]:45008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSG1p-0006Oc-Jz
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nSFzX-0004gD-IM
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nSFzV-00063z-Sg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646907953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yr3637AvYqYCmL1rTVncX1AGfVWfG0Mwc0qOoOjeqBE=;
 b=Dftn2zmyb9Y0RIm1gIQqRffUWB0ab/Iw47u5Gpjo+QdLVJDsc2ZDOVUin6pool8ne0lfja
 qcTXiQj2saVy/zj9eUBlC7kEfHioRhmJLg8k0nEynCs2v5C0UIuGZEfTYPtecBHRvlBjcX
 6pA8n6EpM7myM51p9fhcuCHYl3jlilg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-CpPjl0ynNcCVsC1_tq_dbQ-1; Thu, 10 Mar 2022 05:25:52 -0500
X-MC-Unique: CpPjl0ynNcCVsC1_tq_dbQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 i189-20020a3786c6000000b00646d7b30998so3530328qkd.10
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 02:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yr3637AvYqYCmL1rTVncX1AGfVWfG0Mwc0qOoOjeqBE=;
 b=4z+8DSDodLHsCaK+rULXw/S/ls1u5WAUg42HSV8mMcEV6GPLJM01xYHpwQefuv3uqa
 t4+7W67iNCX38LzPGmRk1XfPVL2s0Cz/2gtVmAemvil6ajonfpVKZWCHD3YiDRFxTdsV
 E+qyL6zXZKuf8EeVxTdQn9pbKCbGxiRbKeJvl/cX5K34k4HTzRjWD6LzAGJFSnVHJA+2
 J+K/77wJkCQAqKLieMWCf1Bkyj4OnCLGPCh+XrMp7jVyoiiAW5NGfrGF1rLZmQpgy78E
 PhbCRgwm9X8ZdD/tIHD1pplykdYEsaurtWRu/iX53wAN6QjPeTUtalSLjJXV021Y0dJx
 6e9g==
X-Gm-Message-State: AOAM530yrG4nwDwXxhkw4+TGCRo1+qzCWvnmbozK7MqtvQDlFXkLxMNG
 VF3NFFif4wBWqNFgwP1F/QLP01aRhLBEjrQ/M9kG7K4A3R9rhO2OKv6zjH34W4LJcBPCKT0Os0+
 E8wmJRWaPaqsD6ZQ=
X-Received: by 2002:a37:af45:0:b0:47c:ddbb:b63b with SMTP id
 y66-20020a37af45000000b0047cddbbb63bmr2629842qke.42.1646907951793; 
 Thu, 10 Mar 2022 02:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRfwo1qjyneUmo9JachYnz0LmREfxLWfV0QapQGMYjVOsv7ylsGAIHwUfDUZndNx0GCNc2vw==
X-Received: by 2002:a37:af45:0:b0:47c:ddbb:b63b with SMTP id
 y66-20020a37af45000000b0047cddbbb63bmr2629824qke.42.1646907951498; 
 Thu, 10 Mar 2022 02:25:51 -0800 (PST)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o21-20020ac85a55000000b002e16389b501sm2960586qta.96.2022.03.10.02.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 02:25:51 -0800 (PST)
Message-ID: <51debd4a-94a5-5990-c951-81c010014f49@redhat.com>
Date: Thu, 10 Mar 2022 11:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 19/20] job.c: enable job lock/unlock and remove
 Aiocontext locks
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-20-eesposit@redhat.com>
 <Yidicn/GkSzaezdr@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Yidicn/GkSzaezdr@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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



Am 08/03/2022 um 15:04 schrieb Stefan Hajnoczi:
> On Tue, Feb 08, 2022 at 09:35:12AM -0500, Emanuele Giuseppe Esposito wrote:
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index ca46e46f5b..574110a1f2 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -75,11 +75,14 @@ typedef struct Job {
>>      ProgressMeter progress;
>>  
>>  
>> +    /** Protected by job_mutex */
>> +
>>      /**
>>       * AioContext to run the job coroutine in.
>> -     * This field can be read when holding either the BQL (so we are in
>> -     * the main loop) or the job_mutex.
>> -     * Instead, it can be only written when we hold *both* BQL and job_mutex.
>> +     * The job Aiocontext can be read when holding *either*
>> +     * the BQL (so we are in the main loop) or the job_mutex.
>> +     * Instead, it can only be written when we hold *both* BQL
> 
> s/Instead,//
> 
>> @@ -456,7 +440,10 @@ void job_unref_locked(Job *job)
>>  
>>          if (job->driver->free) {
>>              job_unlock();
>> +            /* FIXME: aiocontext lock is required because cb calls blk_unref */
>> +            aio_context_acquire(job->aio_context);
> 
> We break the locking rules for job->aio_context here because the job is
> already being destroyed and there can be no races? Can we avoid the
> special case:
> 
>   AioContext *aio_context = job->aio_context;
> 
>   job_unlock();
>   /* FIXME: aiocontext lock is required because cb calls blk_unref */
>   aio_context_acquire(aio_context);
>   job->driver->free(job);
>   aio_context_release(aio_context);
>   job_lock();
> 
> ?
> 
Makes sense.

Emanuele


