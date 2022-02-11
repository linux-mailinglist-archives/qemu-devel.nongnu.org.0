Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7F4B20EA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 10:03:33 +0100 (CET)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRq0-0004nN-7D
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 04:03:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIRnX-0003YM-JO
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIRnV-0007DW-Qh
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 04:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644570051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72uAjeR7UqRHRI0BLjqqTsP8sZWxdn3ydz1sAp/jZ6E=;
 b=DsUv93kSQbdUiHhGHwflJufXVKzsIJGb3dtW7QXeen38ksko+QF5iccU4DQEbyv9TzA17O
 KWuMO0KKe2RwpLlyFv7cJ89b0cdbkSherJnNO7snTcdykm1SX19E62fGTlgTfFAkIbsyt7
 Nq1pZzunM3QEgCjBiPEFTSwMEptqXR4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-NAEOLVbrNnieJFEII_1RNg-1; Fri, 11 Feb 2022 04:00:50 -0500
X-MC-Unique: NAEOLVbrNnieJFEII_1RNg-1
Received: by mail-qk1-f199.google.com with SMTP id
 p20-20020a05620a22b400b0047ecab0db4fso5251688qkh.2
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 01:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=72uAjeR7UqRHRI0BLjqqTsP8sZWxdn3ydz1sAp/jZ6E=;
 b=gZjIU0FOxP1g8nlEd9XChuKx5bhPcJegpyT05KWveheQ2zb0xv8NbKJUJW5IsCyZ/Y
 m4sGXbw+w+2BcwwtcDTRmcVPdc210RbpnT3kDXLaM3buIWfOWa41pMLW2u5McygMYkYS
 e+BcqFlBEzXcUNmGteeVcyO9KHmZb/WkMwjdXqeoAE56WRgrwSRcC00E+Fb2i9pMiXjc
 wFbZfKhNcpBWNkGkee7r9rnCXvB3AgvYGBabjbSU1TCVigFc8X9cCUWX+15MOp77AHKK
 h5sq2k4OGDGMb2JA4LsnYYqxu+re7pD7o8fTtJJqTHyZeRjaE8CIJqOKcZo+LPhNKsdU
 AXAA==
X-Gm-Message-State: AOAM531ukeTaRW4KdBRV5FkYAZ/pbY6jZWtZicjESk4hlHdidJfGP0BR
 NcfVE+0opozACeFgugrjIGz5PAnGIMoSt1o9tCQT3hNQkX76Ud8tGv3T+YGGlB8K1rsN3IVV/7Q
 qqvb1qNys6lEGAKw=
X-Received: by 2002:a05:622a:2ca:: with SMTP id
 a10mr387346qtx.298.1644570049560; 
 Fri, 11 Feb 2022 01:00:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyksteUhGsdZl/7pPo6q7JECGEFhDwN42UjOcExbefbHdGNMlxoH5DpYyX7PyvrAb4f51LdsA==
X-Received: by 2002:a05:622a:2ca:: with SMTP id
 a10mr387338qtx.298.1644570049377; 
 Fri, 11 Feb 2022 01:00:49 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id k9sm11060976qkj.31.2022.02.11.01.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 01:00:48 -0800 (PST)
Message-ID: <66060a56-25de-fc8a-d6d5-a33e1d5e0359@redhat.com>
Date: Fri, 11 Feb 2022 10:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 02/20] job.h: categorize fields in struct Job
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-3-eesposit@redhat.com>
 <YgUx60M7dB+VLi3p@stefanha-x1.localdomain>
 <8607b985-22a9-c256-af1f-ff3ba250701f@redhat.com>
 <YgVM77u1XTlVbHbB@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgVM77u1XTlVbHbB@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/02/2022 18:35, Stefan Hajnoczi wrote:
> On Thu, Feb 10, 2022 at 05:26:52PM +0100, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 10/02/2022 16:40, Stefan Hajnoczi wrote:
>>> On Tue, Feb 08, 2022 at 09:34:55AM -0500, Emanuele Giuseppe Esposito wrote:
>>>> Categorize the fields in struct Job to understand which ones
>>>> need to be protected by the job mutex and which don't.
>>>>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>> ---
>>>>  include/qemu/job.h | 59 ++++++++++++++++++++++++++--------------------
>>>>  1 file changed, 34 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>>> index d1192ffd61..86ec46c09e 100644
>>>> --- a/include/qemu/job.h
>>>> +++ b/include/qemu/job.h
>>>> @@ -40,27 +40,50 @@ typedef struct JobTxn JobTxn;
>>>>   * Long-running operation.
>>>>   */
>>>>  typedef struct Job {
>>>> +
>>>> +    /* Fields set at initialization (job_create), and never modified */
>>>
>>> Is there a corresponding "Field protected by job_mutex" comment that
>>> separates fields that need locking?
>>>
>>
>> That would be the comment
>>
>>     /** Protected by job_mutex */
>>
>> situated right after the field "ProgressMeter progress;".
>>
>> Do you want me to change it in "Fields protected by job_mutex"?
> 
> I don't see it:
> 
> +    /** The opaque value that is passed to the completion function.  */
> +    void *opaque;
> +
> +    /* ProgressMeter API is thread-safe */
> +    ProgressMeter progress;
> +
> +
> +    /** AioContext to run the job coroutine in */
> +    AioContext *aio_context;
> +
> +    /** Reference count of the block job */
> +    int refcnt;
> 
> Is it added by a later patch or did I miss it?
> 

Yes sorry I forgot: it is added in patch 19, when the lock is not a nop
anymore.

I think this was suggested in one of the previous reviews, to avoid
having a misleading comment when the fields are not yet protected.

Emanuele


