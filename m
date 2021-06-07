Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD9639E73E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:09:53 +0200 (CEST)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKdE-00038g-8f
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqKbb-00013O-Tz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqKbZ-0003qm-Rz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623092888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02F3S6c1rBua5tDLeQNLa6TZca6BAp/DfO06BCkqahM=;
 b=g7J9lr2GaVy0pWB5vo9II2oASzWyXLuoqN67XcAi3/ymm5BsQvt0NRO6OFrOqrHmBLc1L8
 GjfolROq+vj5PoIlgIadqKGWALncHMrJxNtfTlRVUnvNqa4C7OsAkBohztyR+h8BmKed//
 Xzr2xe+UsEbRII5yngA3ouvKga5pxuU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-IPrfpDxiM-e39jWxaHurpg-1; Mon, 07 Jun 2021 15:08:07 -0400
X-MC-Unique: IPrfpDxiM-e39jWxaHurpg-1
Received: by mail-wr1-f69.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so8213313wrm.17
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 12:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=02F3S6c1rBua5tDLeQNLa6TZca6BAp/DfO06BCkqahM=;
 b=ihfGo8C6GC6aNndo3XYVTVW9NkNuAPfZ+LshB+atrMT96HAJxFiz/aGfoLC2IRiWHt
 7IR2Y5n5/4nDCYX5YwGiiLJFzCxmmOr9WQgESL74E2kC7QNfx6zwRwg7tAgHnYrOBmjm
 vBus9aXJ+2q+b0GuB8hQs5Wq7+U/n3U8UkYpSnLskjsXvewAVeyC8NtfNJBP2/J/soFW
 6wsBWx4cDL3P9Di6ZlNprGT+oX7pjK6xhHX5zOh90zrR0hN2ulS94I40ddh2rxey9CAc
 RcOch9KX2Ijun5pwGGDEgFmPAUjjhZojIT674YJA5BdHBCmgjG+C15CPJ0ymBWodc5ku
 pJCg==
X-Gm-Message-State: AOAM5302HASVa1+36WaiTwuPp51mOx8QSP2rJWs+3LZZixfIr/yWI1m0
 bhxMs59ThkYxDxh6DAxGCkI7zXbqJcPxKAD1sPbCVhRvFt/o2HaW1HO7LaqPi32G6k4PGLIBbmH
 /CK6EmaUgWrg/sL0=
X-Received: by 2002:adf:ee4e:: with SMTP id w14mr14015617wro.14.1623092886285; 
 Mon, 07 Jun 2021 12:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4hNJVM2hB2RUoZJJrULPJf/y5I52cr1uemxYgSOeCVKYLgoAi6H9ixEwIqzLrkQRHHVeZ2Q==
X-Received: by 2002:adf:ee4e:: with SMTP id w14mr14015609wro.14.1623092886086; 
 Mon, 07 Jun 2021 12:08:06 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 t9sm10501759wmq.14.2021.06.07.12.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 12:08:05 -0700 (PDT)
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <YLdLrrTszu8MMxPv@stefanha-x1.localdomain> <YLd33jBVl5k3RAZK@redhat.com>
 <151b2470-9c6c-cda9-a77b-64cdb10a7550@redhat.com>
 <YL42y/CZIFJ6ICLB@redhat.com>
 <c8a57c4b-544c-a5a6-728e-390a924d34ba@redhat.com>
 <fecd8d65-b4c5-481e-ea8e-e9a8cb523a39@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <dc4aed87-dfe2-0f9f-77dd-ab47e37977d9@redhat.com>
Date: Mon, 7 Jun 2021 21:08:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <fecd8d65-b4c5-481e-ea8e-e9a8cb523a39@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: mreitz@redhat.com, jsnow@redhat.com, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/06/2021 18:18, Vladimir Sementsov-Ogievskiy wrote:
> 07.06.2021 18:16, Emanuele Giuseppe Esposito wrote:
>>
>>
>> On 07/06/2021 17:10, Kevin Wolf wrote:
>>> Am 03.06.2021 um 09:38 hat Paolo Bonzini geschrieben:
>>>> On 02/06/21 14:21, Kevin Wolf wrote:
>>>>> Am 02.06.2021 um 11:13 hat Stefan Hajnoczi geschrieben:
>>>>>> On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir 
>>>>>> Sementsov-Ogievskiy wrote:
>>>>>>> Hi all!
>>>>>>>
>>>>>>> This is my suggestion how to refactor block-copy to avoid extra 
>>>>>>> atomic
>>>>>>> operations in
>>>>>>> "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
>>>>>>>
>>>>>>> Vladimir Sementsov-Ogievskiy (2):
>>>>>>>     block-copy: fix block_copy_task_entry() progress update
>>>>>>>     block-copy: refactor copy_range handling
>>>>>>>
>>>>>>>    block/block-copy.c | 79 
>>>>>>> +++++++++++++++++++++++++++++++---------------
>>>>>>>    1 file changed, 53 insertions(+), 26 deletions(-)
>>>>>>
>>>>>> I posted suggestions for the doc comment on Patch 2, otherwise:
>>>>>>
>>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>>
>>>>> Thanks, fixed up the comment accordingly and applied to the block
>>>>> branch.
>>>>
>>>> I'm a bit confused.  Vladimir said in his review of Emanuele's patches
>>>> that he was okay with patch 7 and that he would rebase this
>>>> refactoring on top of it.
>>>>
>>>> Vladimir's main complaint for the s->method state machine was the
>>>> extra lines of code.  Here we have just as many new lines of code and
>>>> new parameters that are passed by reference.  Kevin, can you please
>>>> look at Emanuele's patches and possibly unqueue the second patch here?
>>>> It seems to me that it should have been tagged as RFC.
>>>
>>> Sorry, I was not aware that Vladimir intended to rebase this one. This
>>> has already landed in master, so if rebasing the other patch is a real
>>> problem, we'd have to revert this one first.
>>>
>> It shouldn't be a problem, I have already rebased on top of it. I will 
>> re-spin a new series with this and other minor (and hopefully final) 
>> fixes soon.
>>
> 
> Thanks, and sorry for the mess!
> 
> Hmm, actually, I said
> 
>> OK, I'm OK with patch as is. Finally I can refactor it later on top if 
>> needed.. I'll try now do some refactoring, you'll probably want to 
>> base on it, or vise-versa, I'll rebase it later on top of these patches. 
> 
> So, I considered both variants. Then I sent patches, everybody in CC, 
> everybody were silent.
> 
> 
> Honestly, I'm a bit confused too. I find my complains valid 
> (independently of me being "I'm OK and can refactor later") and you 
> agreed with them in general. I'm an author and maintainer of the 
> component. I do refactoring that makes it simple to follow my 
> suggestion. So for me it's a bit like doing your work for you. And you 
> ask to roll-back it.

I think it's useless to discuss about these things now. I rebased, all 
is clear and I am positive that in the next version we will have 
something that makes everyone happy :) and if not, feel free to comment it!

Emanuele

> 
> Still, misunderstanding and the mess with two parallel conflicting 
> series is my fault, sorry for this. At least I should have answered to 
> your series when Stefan gave an r-b to my series.
> 


