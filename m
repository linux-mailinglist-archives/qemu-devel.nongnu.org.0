Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46C526267
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:56:36 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUqR-0000Bz-BM
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npUYw-00054F-2g
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npUYu-0000P3-1u
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652445506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlXUfPb90M2vLiW6MAHn4eC3cJM6FuKcc75W8N2QSts=;
 b=JA8TSVvUli2T8DhcChNqK94/uzdIUJHFhfWmcI3RED5YH8XxcDZp188Ux5TfgUrsuO863g
 3yA/3ouiC8BTFFOfxFUxi566tvpMtT3cFHMGZ234V87f3P+2vPFgPJG2uhXmNvYTTobSLG
 cUT98gerKSz0NTlXb39LFLDrRsXc7LM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-3Ym95hifNcm3YrwbfC7D8Q-1; Fri, 13 May 2022 08:38:25 -0400
X-MC-Unique: 3Ym95hifNcm3YrwbfC7D8Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 f1-20020a50fe01000000b004282af18d8bso4853432edt.23
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 05:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KlXUfPb90M2vLiW6MAHn4eC3cJM6FuKcc75W8N2QSts=;
 b=unasVO9WYhrvEvRIrX23KXmJoeelZgo9w50+4XtV3wuA6FzDxn9K+xJ9nIAaVEkSj2
 zb8mRBHMO7aI7PMIh9omTnij25HRjCRuVPcSCBoCURu00g13kiiJ39BLIfsigkq2e5bj
 8Hd8+M0U7WaFKnhIAOa2zTm7qB/20/W56DWMgKuUvb9JukKWpLwPBmdTvgh2BJRd0CIM
 TeU3CnFsgqitUUzpN7Oo5Sx4eVYIrf5QICX5/KAbFj2jHLkz8Rd3MPLLLfnyodKrSuJ6
 IFunqUBOWDcET1hwc/3MAagbXYh3eN366imfj4UxOpMwbetDmJFKxzCKW81GVlbbJMk4
 BVKQ==
X-Gm-Message-State: AOAM531bGpOid4tePXLJRSqOs2vVBJWkCvBYNLFEHzpGzntcN9BEbtFa
 ix1qptKmN4Vop81aSV1aXMLGsVxHooM0DooxOVBp0ggUO0WOx0s7aqc2swl71vrb913XdcKPD5O
 xPj8Gj0UiHAs2J/w=
X-Received: by 2002:a17:906:ece3:b0:6f3:da10:138a with SMTP id
 qt3-20020a170906ece300b006f3da10138amr4219607ejb.438.1652445504336; 
 Fri, 13 May 2022 05:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsvJLJpNnArDuDHsoJbV8Pic+HwZlDQ7R3aog7Y7KIHJjVR4scWII+7rluA+Y/xczJ6IuKNg==
X-Received: by 2002:a17:906:ece3:b0:6f3:da10:138a with SMTP id
 qt3-20020a170906ece300b006f3da10138amr4219580ejb.438.1652445503988; 
 Fri, 13 May 2022 05:38:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 em7-20020a170907288700b006f3ef214e37sm740392ejc.157.2022.05.13.05.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 05:38:23 -0700 (PDT)
Message-ID: <e95b8018-f729-958c-91ee-5c7ec88d046f@redhat.com>
Date: Fri, 13 May 2022 14:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] thread-pool: replace semaphore with condition
 variable
Content-Language: en-US
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
References: <20220512104346.865536-1-pbonzini@redhat.com>
 <20220512104346.865536-3-pbonzini@redhat.com>
 <dd8c888aac88b0fd70ee5a73cf9dca3406efe606.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <dd8c888aac88b0fd70ee5a73cf9dca3406efe606.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 5/13/22 13:56, Nicolas Saenz Julienne wrote:
>>               pool->idle_threads++;
>> -            qemu_mutex_unlock(&pool->lock);
>> -            ret = qemu_sem_timedwait(&pool->sem, 10000);
>> -            qemu_mutex_lock(&pool->lock);
>> +            ret = qemu_cond_timedwait(&pool->request_cond, &pool-
>>> lock, 10000);
>>               pool->idle_threads--;
>> -        } while (back_to_sleep(pool, ret));
>> -        if (ret == -1 || pool->stopping ||
>
> I think, you need to check for 'pool->stopping' upon exiting wait_cond().
> Otherwise it'll blindly try to dequeue a request from a list that is otherwise
> empty.

Good point, thanks.

>> -    if (elem->state == THREAD_QUEUED &&
>> -        /* No thread has yet started working on elem. we can try to
>> "steal"
>> -         * the item from the worker if we can get a signal from the
>> -         * semaphore.  Because this is non-blocking, we can do it
>> with
>> -         * the lock taken and ensure that elem will remain
>> THREAD_QUEUED.
>> -         */
>> -        qemu_sem_timedwait(&pool->sem, 0) == 0) {
>> +    if (elem->state == THREAD_QUEUED) {
>>           QTAILQ_REMOVE(&pool->request_list, elem, reqs);
>>           qemu_bh_schedule(pool->completion_bh);
> 
> The 'thread-pool cancel' unit test fails.
> 
> I think it's because there is an assumption in worker_thread() that if you get
> woken up, you'll have a pending request. And you're now 'stealing' work
> requests, without 'stealing' a wakeup (what qemu_sem_timedwait(sem, 0) achieved
> in the past).

You don't need to steal a wakeup because cond_wait does not "count", but 
yeah it's essentially the same issue that you mentioned above.

Paolo


