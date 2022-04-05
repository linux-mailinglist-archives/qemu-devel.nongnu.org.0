Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD64F3D33
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 20:26:39 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbnt0-0003Vq-Ao
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 14:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbnr7-000219-9p
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nbnr3-0002q5-Ld
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649183075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wf1uuv4V3nJajsV1lyP+xs6pGJ6VISRly9wLyaaz5U=;
 b=ZUAgI6uqrh8JdlWlADWgm5CB4GhvkfCXTxPzgs61DUl0sk3DsyvcUWVuMC7fsa9hk1AQrJ
 po1CdasRFQjEz4Wr52Po11XosjKp+0neeLVdm4N03H2gUAlJDCzqFM6XOWTffo0lCw2Q3S
 30XRr9PmkmHoePJGkSlIlJXZcWAo6xs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-yfLJPpk6PaODAfffzmRXjQ-1; Tue, 05 Apr 2022 14:24:34 -0400
X-MC-Unique: yfLJPpk6PaODAfffzmRXjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b0038e7d07ebcaso1626wms.0
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 11:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=/wf1uuv4V3nJajsV1lyP+xs6pGJ6VISRly9wLyaaz5U=;
 b=eSrlKrd7D6+4jhoKUgcgOHOJar1O9OrZYjkSosa2Usq5XX6pHK5fVHST37GysKPKsJ
 E264ukO8yVUR1jCiFmL24cz5Xd+PK5Q7qZQJ03bUdLchMC41UIgbe8+7/dgctTh3T4f0
 1FIV3WH961fyAvKPAHABiD4YPGVMB8S7as/IVk4Oput1kxAwZytq1fdOMA5ITUiPzOfd
 4Qhkh6AJCT1TDopN5O6LZAg/vvuHYD4GxZ3RHkZEWpIl4n9Cx4pwlfdlmXT2xNnOJ4N0
 OZUT83mmYYjuDo4ceXXyndfS3jMJ4lmF110huPvrcL//R56Oxgduu78ftcL8VfGXRB6V
 TYAA==
X-Gm-Message-State: AOAM532ENSC1Hl52yJStCxLNc47YXStDjS9uCQCNzjXN+Ka+r0ttcisn
 gQuiCDBrzXa1yjL1hCCFcSZbTf4qpkJuOgB5IYzc5mv2LM3MLCbgaveZRV1EOOy4G8DKm/ZaBwV
 gYw0zdSwZFpwJgtw=
X-Received: by 2002:a05:6000:144b:b0:204:d97:8d12 with SMTP id
 v11-20020a056000144b00b002040d978d12mr3841332wrx.572.1649183073712; 
 Tue, 05 Apr 2022 11:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu88DMILyI0Y/WzLLWxI6yO8iLNUI3GOSneNNLk+9ur2PZsrP2EGkNUg/JQjIb46hk6adZpw==
X-Received: by 2002:a05:6000:144b:b0:204:d97:8d12 with SMTP id
 v11-20020a056000144b00b002040d978d12mr3841305wrx.572.1649183073365; 
 Tue, 05 Apr 2022 11:24:33 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm15170700wrb.8.2022.04.05.11.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 11:24:32 -0700 (PDT)
Message-ID: <88a3d2df-5c34-c547-e59d-98ce81c35af0@redhat.com>
Date: Tue, 5 Apr 2022 20:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block/stream: Drain subtree around graph change
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20220324125756.9950-1-hreitz@redhat.com>
 <YkwWbAoYmkVuHlQA@redhat.com>
 <87fb6a17-c1e8-cb50-5f0f-3979b8cc5ca6@redhat.com>
 <YkxagL00suVaVipU@redhat.com>
 <014d1e09-0e75-f7e3-cef8-9bb36d1cb48d@redhat.com>
In-Reply-To: <014d1e09-0e75-f7e3-cef8-9bb36d1cb48d@redhat.com>
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/04/2022 um 19:53 schrieb Emanuele Giuseppe Esposito:
> 
> 
> Am 05/04/2022 um 17:04 schrieb Kevin Wolf:
>> Am 05.04.2022 um 15:09 hat Emanuele Giuseppe Esposito geschrieben:
>>> Am 05/04/2022 um 12:14 schrieb Kevin Wolf:
>>>> I think all of this is really relevant for Emanuele's work, which
>>>> involves adding AIO_WAIT_WHILE() deep inside graph update functions. I
>>>> fully expect that we would see very similar problems, and just stacking
>>>> drain sections over drain sections that might happen to usually fix
>>>> things, but aren't guaranteed to, doesn't look like a good solution.
>>>
>>> Yes, I think at this point we all agreed to drop subtree_drain as
>>> replacement for AioContext.
>>>
>>> The alternative is what Paolo proposed in the other thread " Removal of
>>> AioContext lock, bs->parents and ->children: proof of concept"
>>> I am not sure which thread you replied first :)
>>
>> This one, I think. :-)
>>
>>> I think that proposal is not far from your idea, and it avoids to
>>> introduce or even use drains at all.
>>> Not sure why you called it a "step backwards even from AioContext locks".
>>
>> I was only referring to the lock locality there. AioContext locks are
>> really coarse, but still a finer granularity than a single global lock.
>>
>> In the big picture, it's still be better than the AioContext lock, but
>> that's because it's a different type of lock, not because it has better
>> locality.
>>
>> So I was just wondering if we can't have the different type of lock and
>> make it local to the BDS, too.
> 
> I guess this is the right time to discuss this.
> 
> I think that a global lock will be easier to handle, and we already have
> a concrete implementation (cpus-common).
> 
> I think that the reads in some sense are already BDS-specific, because
> each BDS that is reading has an internal a flag.
> Writes, on the other hand, are global. If a write is happening, no other
> read at all can run, even if it has nothing to do with it.
> 
> The question then is: how difficult would be to implement a BDS-specific
> write?
> From the API prospective, change
> bdrv_graph_wrlock(void);
> into
> bdrv_graph_wrlock(BlockDriverState *parent, BlockDriverState *child);
> I am not sure if/how complicated it will be. For sure all the global
> variables would end up in the BDS struct.
> 
> On the other side, also making instead read generic could be interesting.
> Think about drain: it is a recursive function, and it doesn't really
> make sense to take the rdlock for each node it traverses.

Otherwise a simple solution for drains that require no change at allis
to just take the rdlock on the bs calling drain, and since each write
waits for all reads to complete, it will work anyways.

The only detail is that assert_bdrv_graph_readable() will then need to
iterate through all nodes to be sure that at leas one of them is
actually reading.

So yeah I know this might be hard to realize without an implementation,
but my conclusion is to leave the lock as it is for now.

> Even though I don't know an easy way to replace ->has_waiter and
> ->reading_graph flags...
> 
> Emanuele
> 


