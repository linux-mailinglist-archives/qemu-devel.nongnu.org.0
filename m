Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFE4A5B8E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:49:22 +0100 (CET)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErew-0001qX-1O
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:49:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nErWH-0001Ik-5o
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nErWC-0008ET-TX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643715615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLcYWdxsmc3LikeFQkF13E8CahwGSnpnZQ0UFv49D4Q=;
 b=QajzYRpBW94WJCOuNiL9A2p2d4SE6+B3SNNsQgVMsTAS6ftIKkgjthEMaPf9aHHmA06Hzk
 UUH5Yc1BniLX5iIprwNJUVa4LWW7hyaz4LD4cP9XVgUVPyR9hipRGB9WzMZ7ja6RFi9D8J
 nEkU0WgUyKxVOpS6ZZXjQHMisFm2Y9Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-NzwbD8pRO8GEkAifpQNMYg-1; Tue, 01 Feb 2022 06:40:14 -0500
X-MC-Unique: NzwbD8pRO8GEkAifpQNMYg-1
Received: by mail-ej1-f71.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso6433379ejj.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kLcYWdxsmc3LikeFQkF13E8CahwGSnpnZQ0UFv49D4Q=;
 b=pTj/P2hjePATUY0U02N3Byw4jcCqwHJ55AWF5LvXkxO4gMlzjjBc0OajgGq9xbNZbm
 DYnLZF30ng7IgT90DQ/nP1dJRo7+HH8L8o93eWttTfQpR7oNe/AvAEg7bQFcjU1aSaI5
 fYEitga1Ko/H95bd41laE/UuJZlbi7SSQZybt+E4QYFO3q7iV74EroSyxflnUaYIGq3u
 56QVBKhLBOhbUoephoxGgmNi7rMdywKokeXmKj711cM42FXGjy46jIE184iPzbImY4pe
 qIwA30v160ozchlj2/rUnJyRCyRpiSmMqFnpwpRSlVyCtl+3kY7w+ksmtTZRZwn3z0Ha
 3Pgg==
X-Gm-Message-State: AOAM530ZCK7qz2eu6KU7B0GS08jQv86lYHtN3U3yL8gO0r6Ufrfs0P0K
 ZBKM4TtL072+YDeZTsyttiEdwNcyXFdmTpSKxkdI/PU8xqFu2lSLS3E+AyXOE0efvo6eBPek6gb
 NtUPYZrnh26OYKvc=
X-Received: by 2002:a17:907:e9f:: with SMTP id
 ho31mr20688233ejc.646.1643715613405; 
 Tue, 01 Feb 2022 03:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYW8jMHbovXC5e4oNYyLvQt2FGnLPbaLTRVog1OUjwqcnRCr4Vp2Njlm5i0l/icdsGIrOE8Q==
X-Received: by 2002:a17:907:e9f:: with SMTP id
 ho31mr20688217ejc.646.1643715613123; 
 Tue, 01 Feb 2022 03:40:13 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c1sm1358023ejn.203.2022.02.01.03.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 03:40:12 -0800 (PST)
Message-ID: <6b28a0b4-8244-54bc-ec1b-91a123569c7c@redhat.com>
Date: Tue, 1 Feb 2022 12:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] block/nbd: Move s->ioc on AioContext change
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220128155130.13326-1-hreitz@redhat.com>
 <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <4836201a-a469-c063-babb-4e293daee297@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.02.22 12:18, Vladimir Sementsov-Ogievskiy wrote:
> 28.01.2022 18:51, Hanna Reitz wrote:
>> s->ioc must always be attached to the NBD node's AioContext.  If that
>> context changes, s->ioc must be attached to the new context.
>>
>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1990835
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>> This is an RFC because I believe there are some other things in the NBD
>> block driver that need attention on an AioContext change, too. Namely,
>> there are two timers (reconnect_delay_timer and open_timer) that are
>> also attached to the node's AioContext, and I'm afraid they need to be
>> handled, too.  Probably pause them on detach, and resume them on attach,
>> but I'm not sure, which is why I'm posting this as an RFC to get some
>> comments from that from someone who knows this code better than me. :)
>>
>> (Also, in a real v1, of course I'd want to add a regression test.)
>> ---
>>   block/nbd.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 63dbfa807d..119a774c04 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -2036,6 +2036,25 @@ static void 
>> nbd_cancel_in_flight(BlockDriverState *bs)
>>       nbd_co_establish_connection_cancel(s->conn);
>>   }
>>   +static void nbd_attach_aio_context(BlockDriverState *bs,
>> +                                   AioContext *new_context)
>> +{
>> +    BDRVNBDState *s = bs->opaque;
>> +
>> +    if (s->ioc) {
>> +        qio_channel_attach_aio_context(s->ioc, new_context);
>> +    }
>> +}
>> +
>> +static void nbd_detach_aio_context(BlockDriverState *bs)
>> +{
>> +    BDRVNBDState *s = bs->opaque;
>> +
>> +    if (s->ioc) {
>> +        qio_channel_detach_aio_context(s->ioc);
>> +    }
>> +}
>> +
>>   static BlockDriver bdrv_nbd = {
>>       .format_name                = "nbd",
>>       .protocol_name              = "nbd",
>> @@ -2059,6 +2078,9 @@ static BlockDriver bdrv_nbd = {
>>       .bdrv_dirname               = nbd_dirname,
>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>> +
>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>   };
>>     static BlockDriver bdrv_nbd_tcp = {
>> @@ -2084,6 +2106,9 @@ static BlockDriver bdrv_nbd_tcp = {
>>       .bdrv_dirname               = nbd_dirname,
>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>> +
>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>   };
>>     static BlockDriver bdrv_nbd_unix = {
>> @@ -2109,6 +2134,9 @@ static BlockDriver bdrv_nbd_unix = {
>>       .bdrv_dirname               = nbd_dirname,
>>       .strong_runtime_opts        = nbd_strong_runtime_opts,
>>       .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
>> +
>> +    .bdrv_attach_aio_context    = nbd_attach_aio_context,
>> +    .bdrv_detach_aio_context    = nbd_detach_aio_context,
>>   };
>>     static void bdrv_nbd_init(void)
>>
>
>
> Hmm. I was so happy to remove these handlers together with 
> connection-coroutine :) . But you are right, seems I've removed too 
> much :(.
>
>
> open_timer exists only during bdrv_open() handler, so, I hope on 
> attach/detach it should not exist.

That’s… kind of surprising.  It’s good for me here, but as far as I can 
see it means that all of qemu blocks until the connection succeeds, 
right?  That doesn’t seem quite ideal...

Anyway, good for me. O:)

> reconnect_delay_timer should exist only during IO request: it's 
> created during request if we don't have a connection. And request will 
> not finish until timer elapsed or connection established (timer should 
> be removed in this case too). So, again, when attaching / detaching 
> the context we should be in a drained sections, so no in-flight 
> requests and no reconnect_delay_timer.

Got it.  FWIW, other block drivers rely on this, too (e.g. null-aio with 
latency-ns set creates a timer in every I/O request and settles the 
request once the timer expires).

>
> So, I think assertions that both timer pointers are NULL should be 
> enough in attach / detach handlers.
>

Great!  I’ll cook up v1.


