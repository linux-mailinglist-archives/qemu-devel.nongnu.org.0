Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993544A9A1C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:39:49 +0100 (CET)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFyoS-0003Oi-BL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:39:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFyfq-0008Mu-SI
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:30:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFyfm-0007IB-NY
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:30:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643981445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGIv8WMdHHkqEj71U3NfOWDNlIpkZAnUumNeGkq2kUI=;
 b=dAbABlEJIx0rSoVJetd1l0a+Tquqqy/L0e9ZqyhPyKLfDF+8KIa/l0e7h/ThqDxN4Kp3r4
 uJbUQr27JQSjQhiWhOrvpUeB4VIsOfw75sU4sM4elGci/jVMZnMSWTL7Wv6QkYupxd9RSY
 wofDNW2HkPGkIo6JDtZ87Uhgq3tv8IA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-jxBycFaSPOCvmUSTLlP9KQ-1; Fri, 04 Feb 2022 08:30:44 -0500
X-MC-Unique: jxBycFaSPOCvmUSTLlP9KQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 e2-20020adfa442000000b001e2dd248341so561554wra.20
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 05:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FGIv8WMdHHkqEj71U3NfOWDNlIpkZAnUumNeGkq2kUI=;
 b=S9JzG0ZpLUL4BtDrc0OKIelyYPBzn3FG+mUzMSpEhee3q3aAd/pjXZVJp5cwPbKLK3
 1gKVjkQzbLJNGhzrJK69Q72TWdE3sLsNdTfX4XukPPA+t1hyq0TJZndESGElVyuMxuGp
 WVV37y3oBM2Y3dCkwtg1TsH3TjsOsN72gpjsLkbT4IHXxvHzpE3d0NxBXpvANpzVUN9P
 Spmfs8ljTkKW05Qhj7R8mCs5Md+LMeLDTb0dHTfLUjUywxMBRe8e3YBnZkfAjpyor7Bf
 kMibD+IDqWP2p7ZRdz2H7soOKsIaOEfAuWdVxbtV/XpBcmgVMI+SlRMSOM/qQsqhVI0f
 FKEw==
X-Gm-Message-State: AOAM53131vLNP0BBhvahubXdEwDhUrRIrkJp9zfWHG9V2kX4s2UWWL5q
 vE8L5inUlRAI+dUD8hmjZQIH/vJ0ecOKCR+EO4otT6e1Fbug7r2BAjQ31JCBelmZ4ofFUfXFnE0
 TWLbN9OSK6RLp/Vk=
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr2321052wmm.52.1643981442840; 
 Fri, 04 Feb 2022 05:30:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaW71LYEZWj5v8g/fV09nC4RziZuR618CZhr9rpZm3JId0JJVvzNwdjPyxr6T33OEbFIRqSQ==
X-Received: by 2002:a05:600c:d4:: with SMTP id
 u20mr2321027wmm.52.1643981442596; 
 Fri, 04 Feb 2022 05:30:42 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m5sm1799162wrs.22.2022.02.04.05.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 05:30:41 -0800 (PST)
Message-ID: <bd6aee9e-1627-94c9-bc92-a88769ea075b@redhat.com>
Date: Fri, 4 Feb 2022 14:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
 <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
 <13a6f342-3525-7929-e8c4-d82f6887ca49@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <13a6f342-3525-7929-e8c4-d82f6887ca49@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>
>>  From the other thread:
>>> So you mean that backing_hd is modified as its parent is changed, do
>>> I understand correctly?
>>
>> Yes
>>
>>>
>>> As we started to discuss in a thread started with my "[PATCH] block:
>>> bdrv_set_backing_hd(): use drained section", I think draining the whole
>>> subtree when we modify some parent-child relation is too much. In-flight
>>> requests in subtree don't touch these relations, so why to wait/stop
>>> them? Imagine two disks A and B with same backing file C. If we want to
>>> detach A from C, what is the reason to drain in-fligth read request of B
>>> in C?
>>
>> If I am not mistaken, bdrv_set_backing_hd adds a new node (yes removes
>> the old backing_hd, but let's not think about this for a moment).
>> So we have disk B with backing file C, and new disk A that wants to have
>> backing file C.
>>
>> I think I understand what you mean, so in theory the operation would be
>> - create new child
>> - add child to A->children list
>> - add child to C->parents list
>>
>> So in theory we need to
>> * drain A (without subtree), because it can't happen that child nodes of
>>    A have in-flight requests that look at A status (children list),
>> right?
>>    In other words, if A has another node X, can a request in X inspect
>>    A->children
> 
> It should not happen. In my understanding, IO request never access
> parents of the node.
> 
>> * drain C, as parents can inspect C status (like B). Same assumption
>>    here, C->children[x]->bs cannot have requests inspecting C->parents
>>    list?
> 
> No, I think we should not drain C. IO requests don't inspect parents
> list. And if some _other_ operations do inspect it, drain will not help,
> as drain is only about IO requests.

I am still not convinced about this, because of the draining.

While drain can only be called by either main loop or the "home
iothread" (the one running the AioContext), it still means there are 2
threads involved. So while the iothread runs set_backing_hd, main loop
could easily drain one of the children of the nodes. Or the other way
around.
I am not saying that this happens, but it *might* happen.

I am a little bit confused about this, it would be nice to hear opinions
from others as well.

Once we figure this, I will know where exactly to put the assertions,
and consequently what to drain and with which function.

Emanuele


