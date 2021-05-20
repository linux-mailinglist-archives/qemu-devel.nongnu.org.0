Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BBA38B251
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:56:52 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljk6V-0002Rg-Jc
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljjkV-0005DU-N8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljjkS-0003d7-UR
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621521244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u/1FoDjB+33JIseTrqNUFb4qRnjJYr1cKJ7vJVPAacQ=;
 b=b1Vlk+TzO6Zz29+pSwfo4EG5Yhb9ERzcGZBTXQ3LX/mp+4GY9HAyb0FvxI5c3MsnKx2Lwi
 mFbgcJa9Zw1+GAUUWIzkUaRfP8wf28U1kLdZl6V9WdeQ/koB8PW7x3gQvz0iNzfAWRvV85
 tpWiAXpzQhDOjbh8u4LbDmQcWxkVAZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-p68uEKcFMkiAKpbx8C1BmQ-1; Thu, 20 May 2021 10:34:02 -0400
X-MC-Unique: p68uEKcFMkiAKpbx8C1BmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so1493485wmc.7
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/1FoDjB+33JIseTrqNUFb4qRnjJYr1cKJ7vJVPAacQ=;
 b=mCLe06pUFukumLGXPc/M1nVk3OZgn6NMFnuQM+sK9xlQ+FdTu65fK92jxPPpnNte7r
 zOyf51fhQwxIbl1ZWKcZzQknSRfQFbsZVETfZm2+yXARxvtRAjcSA0WxsXsXH/36JCrX
 cjQjDjO//tGLHp6nzeztrWzS/YWT7bj52LY1Q1n0QyaAXfJTE2NjMjT9DoJAO2nrE9MI
 bB/wTMNIdl93rwXZJOwaKdZnYEo4uMkTW86W7PNVV3irY9MzJkUYT8IrfClT9KUKPPBJ
 CvaNcyFZQ3nvEniE66JvqEHw4vpwTtukVNQRMWlj18hcvi8Y5LP1i2tTp44iHsQxX/1r
 sL5g==
X-Gm-Message-State: AOAM531g/bvr1hloPTDA4yl16G8Az/n+385Ed/68RhlV3BajJc/dOTwO
 cy0NiiBZq7X9bDHJouqn7JJSDKt9MWHyQ/e0jCnKxFRcAQ2N0uRXQI8aVNbqF79zSd4uSjj/aZg
 Hhzo19GamWcUYkBYMzDK1mHT0rNUwy0puGzx9YXMAjgJHkiOrKtrhstGjF22/HFSZPS4=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr4004820wmh.151.1621521241162; 
 Thu, 20 May 2021 07:34:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4uDjB2zAsLWfgZj9qewxZFJYlJG8yz5cjmh6NH8coy4LgYwbRoDOf4bjdRWAOw7fZmRxoqw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr4004781wmh.151.1621521240780; 
 Thu, 20 May 2021 07:34:00 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 d9sm3450595wrx.11.2021.05.20.07.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 07:34:00 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] block-copy: protect block-copy internal structures
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <461d6a3f-9eea-1988-e283-7025329c2f33@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <aeba4cb7-a83b-689b-c323-c9bfb5f6d527@redhat.com>
Date: Thu, 20 May 2021 16:33:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <461d6a3f-9eea-1988-e283-7025329c2f33@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/05/2021 15:47, Vladimir Sementsov-Ogievskiy wrote:
> 18.05.2021 13:07, Emanuele Giuseppe Esposito wrote:
>> This serie of patches aims to reduce the usage of the global
>> AioContexlock in block-copy, by introducing smaller granularity
>> locks thus on making the block layer thread safe.
>>
>> This serie depends on Paolo's coroutine_sleep API and my previous
>> serie that brings thread safety to the smaller API used by block-copy,
>> like ratelimit, progressmeter abd co-shared-resource.
>>
>> What's missing for block-copy to be fully thread-safe is fixing
>> the CoSleep API to allow cross-thread sleep and wakeup.
>> Paolo is working on it and will post the patches once his new
>> CoSleep API is accepted.
>>
>> Patch 1 introduces the .method field instead of .use_copy_range
>> and .copy_size, so that it can be later used as atomic.
>> Patch 2-3 provide comments and refactoring in preparation to
>> the locks added in patch 4 on BlockCopyTask, patch 5-6 on
>> BlockCopyCallState and 7 BlockCopyState.
>>
>> Based-on: <20210517100548.28806-1-pbonzini@redhat.com>
>> Based-on: <20210518094058.25952-1-eesposit@redhat.com>
> 
> Hi! I failed to apply this all. Could you please export your branch with 
> your patches at some public git repo?

Hi, thank you for applying the patches. My branch is here:

https://gitlab.com/eesposit/qemu/-/commits/dataplane_new

Emanuele
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>> v1 -> v2:
>> * More field categorized as IN/State/OUT in the various struct, better
>>    documentation in the structs
>> * Fix a couple of places where I missed locks [Vladimir, Paolo]
>>
>>
>> Emanuele Giuseppe Esposito (6):
>>    block-copy: improve documentation of BlockCopyTask and BlockCopyState
>>      types and functions
>>    block-copy: move progress_set_remaining in block_copy_task_end
>>    block-copy: add a CoMutex to the BlockCopyTask list
>>    block-copy: add QemuMutex lock for BlockCopyCallState list
>>    block-copy: atomic .cancelled and .finished fields in
>>      BlockCopyCallState
>>    block-copy: protect BlockCopyState .method fields
>>
>> Paolo Bonzini (1):
>>    block-copy: streamline choice of copy_range vs. read/write
>>
>>   block/block-copy.c | 234 +++++++++++++++++++++++++++++----------------
>>   1 file changed, 150 insertions(+), 84 deletions(-)
>>
> 
> 


