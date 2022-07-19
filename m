Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D68579DED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:56:19 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmls-0007f3-Rn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmj5-0003IH-17
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:53:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmj3-0000WH-GQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658235200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtEkvWQT+MxyoGBJOoWq/DXgpqSxd1FiY8gTokEltec=;
 b=JsmM5T71cea7Gp6TXqvORjpLFBJ2LdQzS4LcEBTOD611rmqsdFqTep3DEVd+3o3ZPhYmN0
 RkUqYrVfuBQesegXFKMYNZqryX4ZopT9yiVkiUPHvlUeUsxpfeIHfurGh3S5xdfemW3LAm
 xTYPLvb3tQPKDa0iWZJSVFwyMPO0ZGk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-3qGgp-EeMjaXFJ1w7I6evA-1; Tue, 19 Jul 2022 08:53:13 -0400
X-MC-Unique: 3qGgp-EeMjaXFJ1w7I6evA-1
Received: by mail-qk1-f198.google.com with SMTP id
 f20-20020a05620a409400b006b5fc740485so1709071qko.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BtEkvWQT+MxyoGBJOoWq/DXgpqSxd1FiY8gTokEltec=;
 b=rAfipgl+0bXo0e+fZ+t5s9nCOyy9zhSgy5U4ubv3H/4+jbsDeLMmze5NJOqZzXVRMm
 lg9l/1HZ+flWXu6pf87kauuKVqcerSVDTkh3qgVk3JLs1Z7tlA37r67Zr3he92uz50cK
 zbRYcns8wKeFyjff7UgnCE//bkFDTBHtNgGOXunCrG+qX5OBmra4GeOzFum4Bi5TsLbg
 PHVu1xWm/KEceENn3mPV1yud67z+DVPMliwSsZGHsvAT+A8lbWHkSOehojBl3lXHLxzk
 AUN6w05RKtXdniXPlimtgrVIadfXQmJ+7vDcNnEXrjB8jsyX3od9dfVCYTN1I8gFYjBd
 PWsA==
X-Gm-Message-State: AJIora/ZIYCOaH90AA/vftLF7p6WN4x9LG74mEpEF57rFRMYwsfjnAwH
 dFMi71avdviTjDx6e4zXLMJHm72P8RFQYymSzsZ8dp439fvZQxajryGG91gfsLry3RSLND5FcYH
 F3JYPbyszqtuODHY=
X-Received: by 2002:ad4:5beb:0:b0:473:38b7:e0a2 with SMTP id
 k11-20020ad45beb000000b0047338b7e0a2mr25032766qvc.85.1658235192767; 
 Tue, 19 Jul 2022 05:53:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ui+yeOOSkvkVl/kFdhH1zcLGqnxkdjCG6vqUSBnCb+sKr+aisDr7AdwA1GFI2SC1KML0DDmQ==
X-Received: by 2002:ad4:5beb:0:b0:473:38b7:e0a2 with SMTP id
 k11-20020ad45beb000000b0047338b7e0a2mr25032753qvc.85.1658235192559; 
 Tue, 19 Jul 2022 05:53:12 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w22-20020ac843d6000000b0031eb02307a9sm10650464qtn.80.2022.07.19.05.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 05:53:12 -0700 (PDT)
Message-ID: <77b3d5ef-3201-23a9-9881-7bbcc74220bd@redhat.com>
Date: Tue, 19 Jul 2022 14:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 17/21] blockjob.h: categorize fields in struct BlockJob
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
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-18-eesposit@redhat.com>
 <35baa5a3-2427-8268-a699-4db6c3f73e37@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <35baa5a3-2427-8268-a699-4db6c3f73e37@yandex-team.ru>
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



Am 11/07/2022 um 16:44 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> The same job lock is being used also to protect some of blockjob fields.
>> Categorize them just as done in job.h.
> 
> Thanks!
> 
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/block/blockjob.h | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
>> index 8b65d3949d..912e10b083 100644
>> --- a/include/block/blockjob.h
>> +++ b/include/block/blockjob.h
>> @@ -40,10 +40,16 @@ typedef struct BlockJobDriver BlockJobDriver;
>>    * Long-running operation on a BlockDriverState.
>>    */
>>   typedef struct BlockJob {
>> -    /** Data belonging to the generic Job infrastructure */
>> +    /**
>> +     * Data belonging to the generic Job infrastructure.
>> +     * Protected by job mutex.
>> +     */
>>       Job job;
>>   -    /** Status that is published by the query-block-jobs QMP API */
>> +    /**
>> +     * Status that is published by the query-block-jobs QMP API.
>> +     * Protected by job mutex.
>> +     */
>>       BlockDeviceIoStatus iostatus;
>>         /** Speed that was set with @block_job_set_speed.  */
>> @@ -55,6 +61,8 @@ typedef struct BlockJob {
>>       /** Block other operations when block job is running */
>>       Error *blocker;
>>   +    /** All notifiers are set once in block_job_create() and never
>> modified. */
>> +
>>       /** Called when a cancelled job is finalised. */
>>       Notifier finalize_cancelled_notifier;
>>   @@ -70,7 +78,10 @@ typedef struct BlockJob {
>>       /** Called when the job coroutine yields or terminates */
>>       Notifier idle_notifier;
>>   -    /** BlockDriverStates that are involved in this block job */
>> +    /**
>> +     * BlockDriverStates that are involved in this block job.
>> +     * Always modified and read under QEMU global mutex
>> (GLOBAL_STATE_CODE)
>> +     */
>>       GSList *nodes;
>>   } BlockJob;
>>   
> 
> Can we also add GLOBAL_STATE_CODE();  marker into
> child_job_can_set_aio_ctx() and child_job_set_aio_ctx() ?

Usually for callbacks I feel redundant to add assertions there. It is
enough to look at their definition in the header to understand which
category are they in.

Emanuele
> 
> Anyway:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 


