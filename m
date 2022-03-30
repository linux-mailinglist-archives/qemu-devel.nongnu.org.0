Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0274EC647
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:14:01 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZ5E-0004zh-GB
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZZ3v-00043j-32
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZZ3r-00030n-Bj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648649554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vc+Jo462dcGJkkw4A5xhvqjuSvEPR3sR+ziyqhO0iM=;
 b=SMg9bK3eQyoNnC3ssX1/p1CWidiBME5tczycIYo2Rs4RKkAG+m+KVcYZPbOB5EqzGvnCoz
 /MCGtxiz7YE8aTPBd8INoasZb3TYfjSHWGM7B6Jc12rRj62Ma9o3Unh4AvIEBVQzRbwU/5
 8ZHf28ISoaF5Ii9HyXEhIQXSG6QxI/M=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-lPwPUNZBN3yYsDww3CL3LQ-1; Wed, 30 Mar 2022 10:12:33 -0400
X-MC-Unique: lPwPUNZBN3yYsDww3CL3LQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x1-20020a50f181000000b00418f6d4bccbso13085298edl.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 07:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5vc+Jo462dcGJkkw4A5xhvqjuSvEPR3sR+ziyqhO0iM=;
 b=XEdgSd53DTTH6a4If/nWiibQ4PMRYxBQgx0LxRh0DSvIFKoA0GwOH5LmE8vT3u7W2i
 wa9hC/h9dUmSURSqP4OZYmHrO5Jgk2fOYLOrCnghnY79HNIYIdgEg0H2pi7eikPVfzjs
 T05ijm1B4oITgUNrru7RvtD+ePDMZYcPhQD5GxhLj76nogfh4jT1fM4Elc8akQi2TeaG
 roQTbFaohXJeWyAsCo0Bx6nORgScUPu2sWglC/0hRtcrWwJEMu5QCjcjZssmpjZ9/2Ve
 saPGtwz/BOILPHYxLUnYrUJ9S1r3NsoE5ZS28gqqUKMhQ8/dx0Q0AtRvSKhQCqeY/jkm
 Im4w==
X-Gm-Message-State: AOAM532tH9mako381HmBh9277mrDLnmRePqrSWa0WoQlcojsxcFVDpDM
 QGjFWKE57sreCVdte+kyD/+H3uXVgUYyueYlLZvCv372+FvSRSP1YEh27+FMBXMqFMbZTkCvmnD
 2St3hP4pnYVKAo3M=
X-Received: by 2002:a17:907:7ea7:b0:6df:fb36:e8af with SMTP id
 qb39-20020a1709077ea700b006dffb36e8afmr40479773ejc.356.1648649552015; 
 Wed, 30 Mar 2022 07:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFaV58I0NeavNWM0y+XRpKe7A2OtHb4KIUTGcFtlBqkgjCbVe88yO+h1KvdzlPvIHt+z9WOw==
X-Received: by 2002:a17:907:7ea7:b0:6df:fb36:e8af with SMTP id
 qb39-20020a1709077ea700b006dffb36e8afmr40479738ejc.356.1648649551744; 
 Wed, 30 Mar 2022 07:12:31 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm8288507ejc.30.2022.03.30.07.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:12:31 -0700 (PDT)
Message-ID: <c7f6fe7e-c309-010a-eaba-549fbfcb45ce@redhat.com>
Date: Wed, 30 Mar 2022 16:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <a4d3fc47-0769-7d11-47aa-a1c4ac503406@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <a4d3fc47-0769-7d11-47aa-a1c4ac503406@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 13:55, Emanuele Giuseppe Esposito wrote:
>
> Am 30/03/2022 um 12:53 schrieb Hanna Reitz:
>> On 17.03.22 17:23, Emanuele Giuseppe Esposito wrote:
>>> Am 09/03/2022 um 14:26 schrieb Emanuele Giuseppe Esposito:
>>>>>> * Drains allow the caller (either main loop or iothread running
>>>>>> the context) to wait all in_flights requests and operations
>>>>>> of a BDS: normal drains target a given node and is parents, while
>>>>>> subtree ones also include the subgraph of the node. Siblings are
>>>>>> not affected by any of these two kind of drains.
>>>>> Siblings are drained to the extent required for their parent node to
>>>>> reach in_flight == 0.
>>>>>
>>>>> I haven't checked the code but I guess the case you're alluding to is
>>>>> that siblings with multiple parents could have other I/O in flight that
>>>>> will not be drained and further I/O can be submitted after the parent
>>>>> has drained?
>>>> Yes, this in theory can happen. I don't really know if this happens
>>>> practically, and how likely is to happen.
>>>>
>>>> The alternative would be to make a drain that blocks the whole graph,
>>>> siblings included, but that would probably be an overkill.
>>>>
>>> So I have thought about this, and I think maybe this is not a concrete
>>> problem.
>>> Suppose we have a graph where "parent" has 2 children: "child" and
>>> "sibling". "sibling" also has a blockjob.
>>>
>>> Now, main loop wants to modify parent-child relation and maybe detach
>>> child from parent.
>>>
>>> 1st wrong assumption: the sibling is not drained. Actually my strategy
>>> takes into account draining both nodes, also because parent could be in
>>> another graph. Therefore sibling is drained.
>>>
>>> But let's assume "sibling" is the sibling of the parent.
>>>
>>> Therefore we have
>>> "child" -> "parent" -> "grandparent"
>>> and
>>> "blockjob" -> "sibling" -> "grandparent"
>>>
>>> The issue is the following: main loop can't drain "sibling", because
>>> subtree_drained does not reach it. Therefore blockjob can still run
>>> while main loop modifies "child" -> "parent". Blockjob can either:
>>> 1) drain, but this won't affect "child" -> "parent"
>>> 2) read the graph in other ways different from drain, for example
>>> .set_aio_context recursively touches the whole graph.
>>> 3) write the graph.
>> I don’t really understand the problem here.  If the block job only
>> operates on the sibling subgraph, why would it care what’s going on in
>> the other subgraph?
> We are talking about something that probably does not happen, but what
> if it calls a callback similar to .set_aio_context that goes through the
> whole graph?

Hm.  Quite unfortunate if such a callback can operate on drained nodes, 
I’d say.  Ideally callbacks wouldn’t do that, but probably they will. :/

> Even though the first question is: is there such callback?

I mean, you could say any callback qualifies.  Draining a node will only 
drain its recursive parents, so siblings are not affected.  If the 
sibling issues the callback on its parent...  (E.g. changes in the 
backing chain requiring a qcow2 parent node to change the backing file 
string in its image file)

> Second even more irrealistic case is when a job randomly looks for a bs
> in another connectivity component and for example drains it.
> Again probably impossible.

I hope so, but the block layer sure likes to surprise me.

>> Block jobs should own all nodes that are associated with them (e.g.
>> because they intend to drop or replace them when the job is done), so
>> when part of the graph is drained, all jobs that could modify that part
>> should be drained, too.
> What do you mean with "own"?

They’re added with block_job_add_bdrv(), and then are children of the 
BlockJob object.

>>> 3) can be only performed in the main loop, because it's a graph
>>> operation. It means that the blockjob runs when the graph modifying
>>> coroutine/bh is not running. They never run together.
>>> The safety of this operation relies on where the drains are and will be
>>> inserted. If you do like in my patch "block.c:
>>> bdrv_replace_child_noperm: first call ->attach(), and then add child",
>>> then we would have problem, because we drain between two writes, and the
>>> blockjob will find an inconsistent graph. If we do it as we seem to do
>>> it so far, then we won't really have any problem.
>>>
>>> 2) is a read, and can theoretically be performed by another thread. But
>>> is there a function that does that? .set_aio_context for example is a GS
>>> function, so we will fall back to case 3) and nothing bad would happen.
>>>
>>> Is there a counter example for this?
>>>
>>> -----------
>>>
>>> Talking about something else, I discussed with Kevin what *seems* to be
>>> an alternative way to do this, instead of adding drains everywhere.
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
>> Well, sounds complicated.  So I’m asking myself whether this would be
>> noticeably better than just an RwLock for graph modifications, like the
>> global lock Vladimir has proposed.
> But the point is then: aren't we re-inventing an AioContext lock?

I don’t know how AioContext locks would even help with graph changes.  
If I want to change a block subgraph that’s in a different I/O thread, 
locking that thread isn’t enough (I would’ve thought); because I have no 
idea what the thread is doing when I’m locking it.  Perhaps it’s 
iterating through ->children right now (with some yields in between), 
and by pausing it, changing the graph, and then resuming it, it’ll still 
cause problems.

> the lock will protect not only ->parents and ->child, but also other
> bdrv fields that are concurrently read/written.

I would’ve thought this lock should only protect ->parents and ->children.

> I don't know, it seems to me that there is a lot of uncertainty on which
> way to take...

Definitely. :)

I wouldn’t call that a bad thing, necessarily.  Let’s look at the 
positive side: There are many ideas!

Hanna


