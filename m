Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421873AE67E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:51:28 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvGaV-00016g-Ao
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGZF-0000G6-B1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lvGZC-0000mC-CZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624269005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSEeUcvuPOhM6xMlETJB3Doe/kmvLKQRqsC1uxr2SrM=;
 b=EjF0fICkMj1tbyWiZZt0wV/F+pjZG/BrFw3R/CFEvS9DvZlPQ1L6nECQBMIdDiCv42w7oi
 uTvCAh52k3VgXtel5WwwyuXYhVHerzshHJJu9VIp5I8cDXIMlty3ZZkM6jnLH3oEKmFXPP
 bmnWFneBmN3QLzzw8+eLJ2jVRR0YIE0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-8zVb_yGOPD2Q6B3Tqp-AUQ-1; Mon, 21 Jun 2021 05:50:04 -0400
X-MC-Unique: 8zVb_yGOPD2Q6B3Tqp-AUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r15-20020aa7da0f0000b02903946a530334so7474108eds.22
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xSEeUcvuPOhM6xMlETJB3Doe/kmvLKQRqsC1uxr2SrM=;
 b=ggIgEyBmyMdn7Du2+z7N0CmEz5YDarEj+PmCAD3sgq5c4IUsR7UcvSZKGKQ7Of3Aob
 DtTRIFcVZwTQzPjny5QHEBra9CAF+kon7ZYWCxAOIzK/SAC8MWThWQNHEZjSWIkRwI1Y
 x2vamfT0RmodC0CgIwtVF9M7y+j6E0QnRvr9e0/p1bOJNXfJEFusnesl+38XAJM3YGYc
 9zWsx11sqwx1SuDlV789EcJ8St+BdptyOe8Q+1+I7DMw1IAqsF0yAmzQRVcBeHrYHab5
 jylF3tz3rWlYb+hAVE7HFS/MCHzvisQBNWVT3rU77rmKerWhqwvIjyj8fuZSlLI+U8Ow
 McJA==
X-Gm-Message-State: AOAM533llQXC4kVXK6TgnV9RszWTdgyfhHwf7eK3RDqtze0wM/+TFlAw
 mCETReBBrhmHV6/+rte8+q10N1I8OYs8DWUQq2Zu+5HdB5i4hr2nN/IuJ1uzANcOQ1Go50ZPX/q
 Fa5xsSvZx+OavHgaqzadT45OO/E7EBlCd7n0be7WzAn2zT3CII+OKC1foliS0ciyG
X-Received: by 2002:a17:907:20da:: with SMTP id
 qq26mr23292126ejb.42.1624269003314; 
 Mon, 21 Jun 2021 02:50:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxefmDb0GVIewwFiAXNPhdJ9Eql6TnN1asqj8D0A1P6WbUFWMOasYRm9w1XuHnRhS4bzYvI8w==
X-Received: by 2002:a17:907:20da:: with SMTP id
 qq26mr23292111ejb.42.1624269003140; 
 Mon, 21 Jun 2021 02:50:03 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w24sm4308884ejk.58.2021.06.21.02.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:50:02 -0700 (PDT)
Subject: Re: [PATCH 5/6] block/nbd: Do not force-cap *pnum
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210617155247.442150-1-mreitz@redhat.com>
 <20210617155247.442150-6-mreitz@redhat.com>
 <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <4440bf3e-cf11-67eb-59de-887cb451a2e3@redhat.com>
Date: Mon, 21 Jun 2021 11:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5b106499-94fb-2af7-3766-bc337d3f21ae@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.06.21 12:53, Vladimir Sementsov-Ogievskiy wrote:
> 17.06.2021 18:52, Max Reitz wrote:
>> bdrv_co_block_status() does it for us, we do not need to do it here.
>>
>> The advantage of not capping *pnum is that bdrv_co_block_status() can
>> cache larger data regions than requested by its caller.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/nbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 616f9ae6c4..930bd234de 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -1702,7 +1702,7 @@ static int coroutine_fn 
>> nbd_client_co_block_status(
>>           .type = NBD_CMD_BLOCK_STATUS,
>>           .from = offset,
>>           .len = MIN(QEMU_ALIGN_DOWN(INT_MAX, bs->bl.request_alignment),
>> -                   MIN(bytes, s->info.size - offset)),
>> +                   s->info.size - offset),
>>           .flags = NBD_CMD_FLAG_REQ_ONE,
>>       };
>>
>
> Hmm..
>
> I don't that this change is correct. In contrast with file-posix you 
> don't get extra information for free, you just make a larger request. 
> This means that server will have to do more work.

Oh, oops.  Seems I was blind in my rage to replace this MIN() pattern.

You’re absolutely right.  So this patch should be dropped.

Max

> (look at blockstatus_to_extents, it calls bdrv_block_status_above in a 
> loop).
>
> For example, assume that nbd export is a qcow2 image with all clusters 
> allocated. With this change, nbd server will loop through the whole 
> qcow2 image, load all L2 tables to return big allocated extent.
>
> So, only server can decide, could it add some extra free information 
> to request or not. But unfortunately NBD_CMD_FLAG_REQ_ONE doesn't 
> allow it.
>


