Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D036594C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:54:14 +0200 (CEST)
Received: from localhost ([::1]:48946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYptN-0000Yb-2d
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYpqd-0006YZ-Ne
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYpqQ-0006iM-EQ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxGF8yi5Ux/7E2tPpmi5y4GVPasPhKynEybJj56mVig=;
 b=I7MY0DmjwQTPJFDZEx2maZwX7ojO0rvnGUMRwepp0Fso2XFLiUc/nRmdAbWz5LfU7dPalw
 IkXKec/9mdplzh9v7Ei2lf5EVyeqE76EjRkOEW2doUg2VwtyHV4CVrOlmMdWv3r/OM4PkT
 8tE6YxoXw6m0V790pjgLubt2MQVrV4U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-A86Iev19MXaG2QfKjVijHg-1; Tue, 20 Apr 2021 08:51:07 -0400
X-MC-Unique: A86Iev19MXaG2QfKjVijHg-1
Received: by mail-ed1-f70.google.com with SMTP id
 cz7-20020a0564021ca7b02903853d41d8adso3759518edb.17
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WxGF8yi5Ux/7E2tPpmi5y4GVPasPhKynEybJj56mVig=;
 b=jr2FXz+AZybq2nm/n+xtIZujxbCzAYFe+sL6ggKoqFRgy3aSHBXvYiIJFtz9xF3Bp6
 RzTYu08lE2b9ONixoVQcmt1Yg9lK/c9Jv6OWCpyIQRLxzO2dcG05nw+nQN/EY8aYw5C0
 AKPGUJia9wOECN782SwmJvU8E9Jpv4MzGK490lVjbE19MHadKdIwXSDq4HfhH8oiP6El
 fdv2rZHLmfZXezXTf5aTdN//gyNFTpHEB7fr881tUZiPZ3SbnrVVOdQPaprrIkmvDdJz
 ucKd4+v/lsCp7M/2tOxOUkDXXqTgQlSMdpZZNCST+nznloEMjumTpqloV57q+YJ2B4pc
 6eDg==
X-Gm-Message-State: AOAM532wTO2ukXr52B6nckW/PJrvHbXhjkumggzjwGkpZYyASqt4w961
 VvV2qhdkc1YJG0b7ooyVKlVCk4+F+lkl9mwGmyY/0+Z4DTFgnrkzQKCVAq8LLzkqwyaycg83fvn
 ZrUh0Mh5hXFM2WOx9kaFGHd6zzE46OmJMAgsdQQDbg7SLVPsMwQq3aXS1asyJuDmSv/0=
X-Received: by 2002:a05:6402:1741:: with SMTP id
 v1mr32017881edx.127.1618923065853; 
 Tue, 20 Apr 2021 05:51:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFRfjrOoJJqnvUNH8JVfbDOun0I9Av8jJMp5XWu2RwHuhxeOOUrn1+oPfpgkjCF973L9ME9Q==
X-Received: by 2002:a05:6402:1741:: with SMTP id
 v1mr32017852edx.127.1618923065615; 
 Tue, 20 Apr 2021 05:51:05 -0700 (PDT)
Received: from localhost.localdomain (mob-194-230-155-141.cgn.sunrise.net.
 [194.230.155.141])
 by smtp.gmail.com with ESMTPSA id m14sm15811966edd.63.2021.04.20.05.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:51:05 -0700 (PDT)
Subject: Re: [RFC PATCH 1/3] block-copy: improve documentation for
 BlockCopyTask type and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210420100416.30713-1-eesposit@redhat.com>
 <20210420100416.30713-2-eesposit@redhat.com>
 <9576b9d5-c40b-14d4-399f-4d14473433bb@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <2210f74d-53f8-caf3-6f7b-6f2478d8d507@redhat.com>
Date: Tue, 20 Apr 2021 14:51:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9576b9d5-c40b-14d4-399f-4d14473433bb@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/04/2021 14:03, Vladimir Sementsov-Ogievskiy wrote:
> 20.04.2021 13:04, Emanuele Giuseppe Esposito wrote:
>> As done in BlockCopyCallState, categorize BlockCopyTask
>> in IN, State and OUT fields. This is just to understand
>> which field has to be protected with a lock.
>>
>> Also add coroutine_fn attribute to block_copy_task_create,
>> because it is only usedn block_copy_dirty_clusters, a coroutine
>> function itself.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 39ae481c8b..03df50a354 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -48,25 +48,32 @@ typedef struct BlockCopyCallState {
>>       QLIST_ENTRY(BlockCopyCallState) list;
>>       /* State */
>> -    int ret;
>>       bool finished;
>>       QemuCoSleepState *sleep_state;
>>       bool cancelled;
>>       /* OUT parameters */
>> +    int ret;
> 
> Hmm. Somehow, ret may be considered is part of state too.. But I don't 
> really care. Here it looks not bad. Will see how and what you are going 
> protect by new lock.
> 
> Note, that ret is concurently set in block_copy_task_entry..

It is set but as far as I understood it contains the result of the 
operation (thus OUT), correct?

> 
>>       bool error_is_read;
>>   } BlockCopyCallState;
>>   typedef struct BlockCopyTask {
>> +    /* IN parameters. Initialized in block_copy_task_create()
>> +     * and never changed.
>> +     */
> 
> It's wrong about task field, as it has "ret" inside.
Not sure I understand what you mean here.

> 
>>       AioTask task;
>> -
>>       BlockCopyState *s;
>>       BlockCopyCallState *call_state;
>> +
>> +    /* State */
>>       int64_t offset;
> 
> I think, offset is never changed after block_copy_task_create()..

right, will revert that for offset
> 
>>       int64_t bytes;
>>       bool zeroes;
>> -    QLIST_ENTRY(BlockCopyTask) list;
>>       CoQueue wait_queue; /* coroutines blocked on this task */
>> +
>> +    /* To reference all call states from BlockCopyTask */
> 
> Amm.. Actually,
> 
> To reference all tasks from BlockCopyState

right, agree, thanks
> 
>> +    QLIST_ENTRY(BlockCopyTask) list;
>> +
>>   } BlockCopyTask;
>>   static int64_t task_end(BlockCopyTask *task)
>> @@ -153,7 +160,7 @@ static bool coroutine_fn 
>> block_copy_wait_one(BlockCopyState *s, int64_t offset,
>>    * Search for the first dirty area in offset/bytes range and create 
>> task at
>>    * the beginning of it.
>>    */
>> -static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>> +static BlockCopyTask *coroutine_fn 
>> block_copy_task_create(BlockCopyState *s,
>>                                                BlockCopyCallState 
>> *call_state,
>>                                                int64_t offset, int64_t 
>> bytes)
>>   {
>>
> 
> We mark by "coroutine_fn" functions that can be called _only_ from 
> coroutine context. 
In my opinion, block_copy_task_create is a static function and it's 
called only by another coroutine_fn, block_copy_dirty_clusters, so it 
matches what you just wrote above.

> block_copy_task_create() may be called from any 
> context, both coroutine and non-coroutine. So, it shouldn't have this mark.

Thank you,
Emanuele


