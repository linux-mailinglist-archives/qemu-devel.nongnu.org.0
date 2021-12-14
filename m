Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8246D474C48
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 20:51:17 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxDpU-0002OZ-3H
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 14:51:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxDn8-0000xe-FX
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxDn5-00006U-Ka
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639511326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaq0jZGhTSAWddHo1rvTq0pRIIXoNU0ml+dej36vAJ0=;
 b=M0Cj3EQPjNaZHJL/i/o38VOA2nWOImbVaqnBj08mvNhrOdq/rwT0uFWtI+kA+A0c5gM0de
 lZDX+ClyaZvhdnRY6t7kMXP88mvKHTmk7JiyGKx/PRd/Y6aXJpBQDnHoXwFvV8/19nyY33
 2o8JaY5cypiGCZveZQ5mNw4JwnjB0uU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-twfkkDY0Pt-wiiuVlARGgg-1; Tue, 14 Dec 2021 14:48:45 -0500
X-MC-Unique: twfkkDY0Pt-wiiuVlARGgg-1
Received: by mail-ed1-f70.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso18010851edt.2
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 11:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oaq0jZGhTSAWddHo1rvTq0pRIIXoNU0ml+dej36vAJ0=;
 b=aV5/981OCofdhdBtcTDkmuTm8Y8lpYevWvB2XnQ8uMtM3lGS5bmKYSboPDu6c39sOH
 ZrclExnKAh8pTMIz89VH5rBBGpnSj7LiXSqBCYfW5oK+kWCptKuFmQT22Bu74zddif29
 MeuQoafv6vOT2nckND2aWcdJ5fxxx8L1FJhqrLFz7GDCVyW3WoVxxJo5tLahJqsbzVjU
 qoV4C24rTk12wCU7/Yi8g1YCwyhRRIzH5ToABf4t26zGScuJvSOF9FntzahJlMoPdL2Z
 zI3s2ENwHFn19WwdFxOVcGgUXRwLrPnQEVY3XQAn8nn8PbJtNUr4u6rYy2zGL2l0TIaW
 cTgw==
X-Gm-Message-State: AOAM533A5lQeRa84lgKn9+4EpQEXEcOmhjOtlySdkw2qf3mOMEWLVK9d
 jVyC4M5dEvKR42BVwSKLaI7mGm8NRiI5W3Y7svcwj4agSqeAKzAcfL2iG+bBg7EFGvhH84QlCzs
 ZiDgyRYtiHC6lIBc=
X-Received: by 2002:a17:906:dff1:: with SMTP id
 lc17mr7563779ejc.215.1639511323874; 
 Tue, 14 Dec 2021 11:48:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5vGW/wcpxBvh8Zj/LgIL1JGGkssDP/acecYKOvmxlfjDgTqmkOj+Go5KsjcBfX/F827uMMQ==
X-Received: by 2002:a17:906:dff1:: with SMTP id
 lc17mr7563734ejc.215.1639511323576; 
 Tue, 14 Dec 2021 11:48:43 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id j5sm219439ejo.171.2021.12.14.11.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:48:43 -0800 (PST)
Message-ID: <9b8fae21-9263-7db6-1f51-cae4662395ab@redhat.com>
Date: Tue, 14 Dec 2021 20:48:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 09/31] block: introduce assert_bdrv_graph_writable
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-10-eesposit@redhat.com>
 <6dd02c7c-5f0e-9dce-28b8-6ed7fb834a50@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6dd02c7c-5f0e-9dce-28b8-6ed7fb834a50@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/12/2021 18:43, Hanna Reitz wrote:
> On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
>> We want to be sure that the functions that write the child and
>> parent list of a bs are under BQL and drain.
>>
>> BQL prevents from concurrent writings from the GS API, while
>> drains protect from I/O.
>>
>> TODO: drains are missing in some functions using this assert.
>> Therefore a proper assertion will fail. Because adding drains
>> requires additional discussions, they will be added in future
>> series.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   include/block/block_int-global-state.h | 10 +++++++++-
>>   block.c                                |  4 ++++
>>   block/io.c                             | 11 +++++++++++
>>   3 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/block/block_int-global-state.h 
>> b/include/block/block_int-global-state.h
>> index a1b7d0579d..fa96e8b449 100644
>> --- a/include/block/block_int-global-state.h
>> +++ b/include/block/block_int-global-state.h
>> @@ -312,4 +312,12 @@ void 
>> bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>>    */
>>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>> -#endif /* BLOCK_INT_GLOBAL_STATE*/
> 
> This looks like it should be squashed into patch 7, sorry I missed this 
> in v4...
> 
> (Rest of this patch looks good to me, for the record – and while I’m at 
> it, for patches I didn’t reply to so far, I planned to send an R-b 
> later.  But then there’s things like patches 2/3 looking good to me, but 
> it turned out in my review for patch 4 that bdrv_lock_medium() is used 
> in an I/O path, so I can’t really send an R-b now anymore...)
> 
Sorry I don't understand this, what should be squashed into patch 7? The 
assertion? If so, why?

Thank you,
Emanuele


