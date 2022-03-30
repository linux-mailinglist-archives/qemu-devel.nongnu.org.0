Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9AC4EBE40
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:02:57 +0200 (CEST)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVAG-00005c-KB
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:02:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZV5s-0006l0-D1
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZV5p-0005K3-Sq
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648634300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNBbP+HZPQ66KLN8iMErz/CFiJJQNW+fdUADIEjrApQ=;
 b=AgT3f/cX7HenJq043RYkg6eAiR2Q+JQ+KSFy86Z4WyS336GiSEv+DvmV8xtuStSJRpZkCm
 A8T262ZE5fpygY6jGoFNhXxuIDg4mI7ejC44I+pea7ohuGFYEdn4SbM0+Hz7U8ILE2Ea0K
 zUmOZIjFf+6uKn2BLZ+nq+LBIltE/0A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-aFrEO_P-OPCzguKqT3HgJg-1; Wed, 30 Mar 2022 05:58:19 -0400
X-MC-Unique: aFrEO_P-OPCzguKqT3HgJg-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a1c0202000000b0038c71e8c49cso884235wmc.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FNBbP+HZPQ66KLN8iMErz/CFiJJQNW+fdUADIEjrApQ=;
 b=PQs4OG+OIAXbyja5uL62kqW294m0EumwGRgntnnbxxYZJcmIUusnM/y+7SwZ6jniSe
 Aq1Y5Rd1fd7P/nJtRNCT4VRmJQIV3V96w8BU2NTiacOYu7ehUVSNDwEjHOZpcPXKY9q6
 gzhEYGMk/GJZewTV0EdAN6QDVPpogxNnog6zXFWDHzYV1H3ztm9riJRWytGbmjtq2qbU
 +emi6lVvur8Iyk3PxRggdAPP0ybTavDZDHm3s6WiYzosL+V2DDThVRrLDlkxydfxVt0Z
 zQzIfqJkg8YhUahsgCNfHDHob/hQd4Kitq8oK9qLIglBppko3YPhb9E7ia8rvYMaeXnS
 24Kg==
X-Gm-Message-State: AOAM530zyQuSGO6pP0vEArG/+yx4mRNA/SKoIAeGZRGWqOKidlbpWC08
 GIX2j6kxKHqGfbbdMIyBqFtSw/bDhUHFb29UmwwWKddcYjhYxvF6EFFeb+r+C7+AXlIAv9Eprab
 a1gr7i5d6MDcQ5f8=
X-Received: by 2002:a05:6000:184c:b0:204:ffc:1b1c with SMTP id
 c12-20020a056000184c00b002040ffc1b1cmr36747062wri.141.1648634298182; 
 Wed, 30 Mar 2022 02:58:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf+AVuhfnrrBNK7e3J6WPPouv/9wHIJDWtTinjAgn1Q0LWgS4fL3JxhPYd+iLoUfHB4c5b+A==
X-Received: by 2002:a05:6000:184c:b0:204:ffc:1b1c with SMTP id
 c12-20020a056000184c00b002040ffc1b1cmr36747041wri.141.1648634297876; 
 Wed, 30 Mar 2022 02:58:17 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm19962943wrb.8.2022.03.30.02.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:58:17 -0700 (PDT)
Message-ID: <b1bbf8a5-5d21-64c4-2ecd-f9f7a33d810b@redhat.com>
Date: Wed, 30 Mar 2022 11:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
 <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
 <160b0358-b96b-c1ff-e08f-7488366a1755@mail.ru>
 <dd644d13-720f-c720-83bc-bab291b45d7b@redhat.com>
 <6694cad1-058b-d1bf-3f6c-61879799fa22@mail.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <6694cad1-058b-d1bf-3f6c-61879799fa22@mail.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 30/03/2022 um 11:52 schrieb Vladimir Sementsov-Ogievskiy:
> 30.03.2022 12:09, Emanuele Giuseppe Esposito wrote:
>>>
>>> Ah seems I understand what you mean.
>>>
>>> One of my arguments is that "drain" - is not a lock against other
>>> clients who want to modify the graph. Because, drained section allows
>>> nested drained sections.
>>>
>>> And you try to solve it, by draining more things, this way, we'll drain
>>> also the job, which is a possible client, who may want to modify the
>>> graph in parallel.
>>>
>>> So, in other words, when we want to modify the graph, we drain the whole
>>> connectivity component of the graph. And we think that we are safe from
>>> other graph modifications because all related jobs are drained.
>>> Interesting, is that possible that some not drained job from another
>>> connectivity component will want to connect some node from our drained
>>> component?
>>
>> You mean another job or whathever calling bdrv_find_node() on a random
>> graph? Yes that is not protected. But can this happen?
>>
>> That's the question. What are the invariants here? Can anything happen?
>>
>>>
>>> I just still feel that draining is a wrong mechanism to avoid
>>> interaction with other clients who want to modify the graph, because:
>>>
>>> 1. we stop the whole IO on all subgraph which is not necessary
>>> 2. draining is not a mutex, it allows nesting and it's ok when two
>>> different clients drain same nodes. Draining is just a requirement to do
>>> no IO at these nodes.
>>>
>>> And in your way, it seems that to be absolutely safe we'll need to drain
>>> everything..
>>>
>>> In my feeling it's better to keep draining what it is now: requirement
>>> to have no IO requests. And to isolate graph modifications from each
>>> other make a new synchronization mechanism, something like a global
>>> queue, where clients who want to get an access to graph modifications
>>> wait for their turn.
>>
>> This is a matter of definitions. Subtree drains can theoretically work,
>> I managed to answer to my own doubts in the last email I sent.
>>
>> Yes, there is still some completely random case like the one I wrote
>> above, but I think it is more a matter of what we want to use and what
>> meaning we want to give to drains.
>>
>> Global queue is what Kevin proposes, I will try to implement it.
>>
>>>
>>>
>>> As I understand:
>>>
>>> You want to make drained section to be a kind of lock, so that if we
>>> take this lock, we can modify the graph and we are sure that no other
>>> client will modify it in parallel.
>>
>> Yes
>>
>>>
>>> But drained sections can be nested. So to solve the problem you try to
>>> drain more nodes: include subtree for example, or may be we need to
>>> drain the whole graph connectivity component, or (to be more safe) the
>>> whole block layer (to be sure that during drained section in one
>>> connectivity component some not-drained block-job from another
>>> connectivity component will not try to attach some node from our drained
>>> connectivity component)..
>>>
>>> I still feel that draining is wrong tool for isolating graph modifying
>>> operations from each other:
>>>
>>> 1. Drained sections can be nested, and natively that's not a kind of
>>> lock. That's just a requirement to have no IO requests. There may be
>>> several clients that want this condition on same set of nodes.
>>>
>>> 2. Blocking IO on the whole connected subgraph or even on the whole
>>> block layer graph is not necessary, so that's an extra blocking.
>>>
>>>
>>> Could we instead do the following:
>>>
>>> 1. Keep draining as is - a mechanism to stop IO on some nodes
>>>
>>> 2. To isolate graph-modifying operations implement another mechanism:
>>> something like a global queue, where clients wait until they gen an
>>> access to modify block layer.
>>>
>>>
>>> This way, any graph modifying process would look like this:
>>>
>>> 1. drained_begin(only where necessary, not the whole subgraph in
>>> general)
>>>
>>> 2. wait in the global queue
>>>
>>> 3. Ok, now we can do all the modifications
>>>
>>> 4. Kick the global queue, so that next client will get an access
>>>
>>> 5. drained_end()
>>>
>>>
>>
>> Please give a look at what Kevin (described by me) proposed. I think
>> it's the same as you are suggesting. I am pasting it below.
>> I will try to implement this and see if it is doable or not.
>>
>> I think the advantage of drains is that it isn't so complicated and
>> doesn't add any complication to the existing code.
>> But we'll see how it goes with this global queue.
>>
>>> His idea is to replicate what blk_wait_while_drained() currently does
>>> but on a larger scale. It is something in between this subtree_drains
>>> logic and a rwlock.
>>>
>>> Basically if I understood correctly, we could implement
>>> bdrv_wait_while_drained(), and put in all places where we would put a
>>> read lock: all the reads to ->parents and ->children.
>>> This function detects if the bdrv is under drain, and if so it will stop
>>> and wait that the drain finishes (ie the graph modification).
>>> On the other side, each write would just need to drain probably both
>>> nodes (simple drain), to signal that we are modifying the graph. Once
>>> bdrv_drained_begin() finishes, we are sure all coroutines are stopped.
>>> Once bdrv_drained_end() finishes, we automatically let all coroutine
>>> restart, and continue where they left off.
>>>
>>> Seems a good compromise between drains and rwlock. What do you think?
>>>
>>> I am not sure how painful it will be to implement though.
>>
> 
> Hm, I don't see, where is global queue here? Or
> bdrv_wait_while_drained() is global and has no bs arguement?
> 
> 

From what I understand, blk_wait_while_drained has a queue internally.
Yes, the queue would be global, and all coroutines that want to perform
a read will have to wait until the modification is ended.

Whether to wake the queue up with a drain or a write lock is also
another point worth discussion maybe.



