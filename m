Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C6650BD7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:38:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FG8-0002w8-8f; Mon, 19 Dec 2022 07:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FG0-0002v5-B5
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:28:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p7FFy-00088K-Ak
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671452913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLOLh31bldeWepvU2Vp3/K2fcVdxkXngrwGC2k3o09Y=;
 b=hIKREQoWYZ3E2s66fMFY7hPJo5SxXlCdcRwOJLaH22jH5gy0K1PQZbOfdBpRbPHaI4sS3h
 z6q+RKmxYNdTFvaAgXyBBk4Tpy+JoQIsOUyUYTDFuDWUSiuuB/2ZGD8hF0fFKn4AI9eiPu
 Cvx/6kpIsIaYavyTfdXbHcPUqs9oW8U=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-1eTwD3QXOYCgFJft0CVmdg-1; Mon, 19 Dec 2022 07:28:31 -0500
X-MC-Unique: 1eTwD3QXOYCgFJft0CVmdg-1
Received: by mail-qt1-f198.google.com with SMTP id
 bb12-20020a05622a1b0c00b003a98dd528f0so476542qtb.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sLOLh31bldeWepvU2Vp3/K2fcVdxkXngrwGC2k3o09Y=;
 b=qY+1X7yoBpscylwGM0OLoBd8+wcrboCVA8LL7RiyL0f9qf+ywLQo9jI5XmVy7h7Jte
 WHYioPNJVBS3wHd6jNeNBdcPIO/SokGLz0/S5Odm7alp78hQr0gDRXnwbx8PbNPwAts1
 wSlyetJ3rLueI+1j1Gd+eZZB1pdoNkZHNVaHJY/ty9iD4aaZf/mt9RIZy7zCO3uqMv25
 M8Xd87Pjke+e075IfL+sFWW6DAKapUS+Pqsmf1GQq+SPloUTAZBNYCH30XJGRfN03WH+
 wDVSdQVxdeGDDzst2cw/Pjrgat4qOQ2zK0oUnYBljoUaPpm/clY5upg+8ZuL/+F6ZJOB
 2Q7w==
X-Gm-Message-State: ANoB5plkZgh/RB24raJxJZcwvxrH8cAMlkzgkjxtLrdAsJzkFPQhPobQ
 sMCUjkRoH7plZJzt2gjpFZKaXmeullRpEXxv/jyiR3ib4ZjuopqO418xQWRGF5iVCEe3E1OcM0N
 ZA5ynloTmHTe8uGg=
X-Received: by 2002:a05:622a:98c:b0:3a8:10c1:4ba with SMTP id
 bw12-20020a05622a098c00b003a810c104bamr50214180qtb.14.1671452911325; 
 Mon, 19 Dec 2022 04:28:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59SAiTtsNQT7MifT6dCAKJBOyoEYwod84x4h+qqJs35JiXVma/HPNmJoqQmDpjdT7OnlvaAA==
X-Received: by 2002:a05:622a:98c:b0:3a8:10c1:4ba with SMTP id
 bw12-20020a05622a098c00b003a810c104bamr50214156qtb.14.1671452911083; 
 Mon, 19 Dec 2022 04:28:31 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05620a2a1300b006f8665f483fsm6910888qkp.85.2022.12.19.04.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 04:28:30 -0800 (PST)
Message-ID: <631397c2-612e-4736-2449-9b19f59a2c51@redhat.com>
Date: Mon, 19 Dec 2022 13:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 06/14] block-backend: use bdrv_getlength instead of
 blk_getlength
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20221213085320.95673-1-kwolf@redhat.com>
 <20221213085320.95673-7-kwolf@redhat.com>
 <b49bb54b-d8ce-50b0-3827-6acdef1554d3@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <b49bb54b-d8ce-50b0-3827-6acdef1554d3@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 16/12/2022 um 18:22 schrieb Vladimir Sementsov-Ogievskiy:
> On 12/13/22 11:53, Kevin Wolf wrote:
>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> The only difference is that blk_ checks if the block is available,
>> but this check is already performed above in blk_check_byte_request().
>>
>> This is in preparation for the graph rdlock, which will be taken
>> by both the callers of blk_check_byte_request() and blk_getlength().
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block/block-backend.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 0194d86113..5b8da86772 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -1253,7 +1253,7 @@ static int blk_check_byte_request(BlockBackend
>> *blk, int64_t offset,
>>       }
>>         if (!blk->allow_write_beyond_eof) {
>> -        len = blk_getlength(blk);
>> +        len = bdrv_getlength(blk_bs(blk));
> 
> I understand the reasoning, but the change looks like a degradation..
> bdrv_* functions becomes kind of *_locked() ? If we are going to
> introduce a lot of such changes, that's not good. But this one is not a
> problem of course.

Nope, that's the only one (you can check my previous series "part 1",
"part 2" and "part 3" to have an idea on what is coming).

Thank you,
Emanuele
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
>>           if (len < 0) {
>>               return len;
>>           }
> 


