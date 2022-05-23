Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB553113D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:56:56 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8YJ-0002ln-Oj
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nt8WD-0000ln-Ng
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nt8W9-0004Ay-9k
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653314080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZzppufIliHQADVVEt0uVMMH0aztH902HSKh69Ikb0I=;
 b=ehVUjM8+IkJS+s5HHvSz2VP/xU6JCuIRTC816DKtI1rlKj0mGXG84ABuDSwWHlLtH984pS
 /W8kuGdtXj5FIDhkg9STdLw2iDnFbmasuM73qqaCH/lMy2YGKJwVH56OMCOS5L5q+tNWg0
 PjhUQoYNC2bGX6+TF8Szs+qoSTeDxqw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-wi2JyOm4MN2r8omE0AlovA-1; Mon, 23 May 2022 09:54:39 -0400
X-MC-Unique: wi2JyOm4MN2r8omE0AlovA-1
Received: by mail-qv1-f70.google.com with SMTP id
 r13-20020a056214068d00b00461d27bf0fdso11032016qvz.1
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IZzppufIliHQADVVEt0uVMMH0aztH902HSKh69Ikb0I=;
 b=oBgC124rlT62hfsVicNDCb8cHB5fMWwMhINKndvb53F57EJqF6wKu3AUB2xy/Luuq5
 IedzHWrzoPVLfZs3ylOn2v03ayd5cyou9YLTLImktHbW6yBnRrDPbKXdZ8tIyT7ATgz6
 7YrwxowRpwACNX9cqL9AejwTUrP+ejr1b9+oHsIsIwyqxfi4T00ictoc1uv08WR4rFWE
 sXmEvYKQpxuVchktWqMNSQwXyPU8z8ct3r27nUDPJhxPABCOg2pkEirL64XstZAab9o3
 D4zf+4rgBWGN1k/WjhQDL7uMydt0PtRpwtHcDIAyTU8PCQmiNMST1sAMSqgVuIHG/lMn
 QGDA==
X-Gm-Message-State: AOAM532TXFRqMjX4qpc9w47wm+2kDlkimC0sJAfUiQWX1W5Ahj7/AVO0
 BxpEXMPc4WxvYTOExszccezzNGAFOwaw+Lt8qXIP7O8xFDbd0tetRYdpkXmVYr6yY2LwHVJZs4l
 +6UFZ14Om5dk35qA=
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr17302758qvp.18.1653314078127; 
 Mon, 23 May 2022 06:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrGt/hzfZN7FJUAZiDd8FQuFR1zx7quIC0ZVEjKcJz4BqsPr0sNFZULMk1T0VlhCqbKi6fng==
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr17302732qvp.18.1653314077732; 
 Mon, 23 May 2022 06:54:37 -0700 (PDT)
Received: from [192.168.149.183]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 o18-20020ae9f512000000b006a38debe62csm1899428qkg.89.2022.05.23.06.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 06:54:37 -0700 (PDT)
Message-ID: <0aeeef05-37ec-51a4-820a-633c29776609@redhat.com>
Date: Mon, 23 May 2022 15:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com> <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <c5dd0db5-9108-1137-cfc8-7137f5658da9@redhat.com>
 <YouI+eI+cbUFZt6x@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YouI+eI+cbUFZt6x@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 23/05/2022 um 15:15 schrieb Stefan Hajnoczi:
> On Mon, May 23, 2022 at 10:48:48AM +0200, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 22/05/2022 um 17:06 schrieb Stefan Hajnoczi:
>>> On Wed, May 18, 2022 at 06:14:17PM +0200, Kevin Wolf wrote:
>>>> Am 18.05.2022 um 14:43 hat Paolo Bonzini geschrieben:
>>>>> On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
>>>>>> For example, all callers of bdrv_open() always take the AioContext lock.
>>>>>> Often it is taken very high in the call stack, but it's always taken.
>>>>>
>>>>> I think it's actually not a problem of who takes the AioContext lock or
>>>>> where; the requirements are contradictory:
>>>>>
>>>>> * IO_OR_GS_CODE() functions, when called from coroutine context, expect to
>>>>> be called with the AioContext lock taken (example: bdrv_co_yield_to_drain)
>>>>>
>>>>> * to call these functions with the lock taken, the code has to run in the
>>>>> BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
>>>>> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that cannot
>>>>> happen without releasing the aiocontext lock)
>>>>>
>>>>> * running the code in the BDS's home iothread is not possible for
>>>>> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
>>>>> thread, but that cannot be guaranteed in general)
>>>>>
>>>>>> We might suppose that many callbacks are called under drain and in
>>>>>> GLOBAL_STATE, which should be enough, but from our experimentation in
>>>>>> the previous series we saw that currently not everything is under drain,
>>>>>> leaving some operations unprotected (remember assert_graph_writable
>>>>>> temporarily disabled, since drain coverage for bdrv_replace_child_noperm
>>>>>> was not 100%?).
>>>>>> Therefore we need to add more drains. But isn't drain what we decided to
>>>>>> drop at the beginning? Why isn't drain good?
>>>>>
>>>>> To sum up the patch ordering deadlock that we have right now:
>>>>>
>>>>> * in some cases, graph manipulations are protected by the AioContext lock
>>>>>
>>>>> * eliminating the AioContext lock is needed to move callbacks to coroutine
>>>>> contexts (see above for the deadlock scenario)
>>>>>
>>>>> * moving callbacks to coroutine context is needed by the graph rwlock
>>>>> implementation
>>>>>
>>>>> On one hand, we cannot protect the graph across manipulations with a graph
>>>>> rwlock without removing the AioContext lock; on the other hand, the
>>>>> AioContext lock is what _right now_ protects the graph.
>>>>>
>>>>> So I'd rather go back to Emanuele's draining approach.  It may not be
>>>>> beautiful, but it allows progress.  Once that is in place, we can remove the
>>>>> AioContext lock (which mostly protects virtio-blk/virtio-scsi code right
>>>>> now) and reevaluate our next steps.
>>>>
>>>> If we want to use drain for locking, we need to make sure that drain
>>>> actually does the job correctly. I see two major problems with it:
>>>>
>>>> The first one is that drain only covers I/O paths, but we need to
>>>> protect against _anything_ touching block nodes. This might mean a
>>>> massive audit and making sure that everything in QEMU that could
>>>> possibly touch a block node is integrated with drain.
>>>>
>>>> I think Emanuele has argued before that because writes to the graph only
>>>> happen in the main thread and we believe that currently only I/O
>>>> requests are processed in iothreads, this is safe and we don't actually
>>>> need to audit everything.
>>>>
>>>> This is true as long as the assumption holds true (how do we ensure that
>>>> nobody ever introduces non-I/O code touching a block node in an
>>>> iothread?) and as long as the graph writer never yields or polls. I
>>>> think the latter condition is violated today, a random example is that
>>>> adjusting drain counts in bdrv_replace_child_noperm() does poll. Without
>>>> cooperation from all relevant places, the effectively locked code
>>>> section ends right there, even if the drained section continues. Even if
>>>> we can fix this, verifying that the conditions are met everywhere seems
>>>> not trivial.
>>>>
>>>> And that's exactly my second major concern: Even if we manage to
>>>> correctly implement things with drain, I don't see a way to meaningfully
>>>> review it. I just don't know how to verify with some confidence that
>>>> it's actually correct and covering everything that needs to be covered.
>>>>
>>>> Drain is not really a lock. But if you use it as one, the best it can
>>>> provide is advisory locking (callers, inside and outside the block
>>>> layer, need to explicitly support drain instead of having the lock
>>>> applied somewhere in the block layer functions). And even if all
>>>> relevant pieces actually make use of it, it still has an awkward
>>>> interface for locking:
>>>>
>>>> /* Similar to rdlock(), but doesn't wait for writers to finish. It is
>>>>  * the callers responsibility to make sure that there are no writers. */
>>>> bdrv_inc_in_flight()
>>>>
>>>> /* Similar to wrlock(). Waits for readers to finish. New readers are not
>>>>  * prevented from starting after it returns. Third parties are politely
>>>>  * asked not to touch the block node while it is drained. */
>>>> bdrv_drained_begin()
>>>>
>>>> (I think the unlock counterparts actually behave as expected from a real
>>>> lock.)
>>>>
>>>> Having an actual rdlock() (that waits for writers), and using static
>>>> analysis to verify that all relevant places use it (so that wrlock()
>>>> doesn't rely on politely asking third parties to leave the node alone)
>>>> gave me some confidence that we could verify the result.
>>>>
>>>> I'm not sure at all how to achieve the same with the drain interface. In
>>>> theory, it's possible. But it complicates the conditions so much that
>>>> I'm pretty much sure that the review wouldn't only be very time
>>>> consuming, but I would make mistakes during the review, rendering it
>>>> useless.
>>>>
>>>> Maybe throwing some more static analysis on the code can help, not sure.
>>>> It's going to be a bit more complex than with the other approach,
>>>> though.
>>>
>>> Hi,
>>> Sorry for the long email. I've included three topics that may help us discuss
>>> draining and AioContext removal further.
>>>
>>> The shortcomings of drain
>>> -------------------------
>>> I wanted to explore the logical argument that making graph modifications within
>>> a drained section is correct:
>>> - Graph modifications and BB/BDS lookup are Global State (GS).
>>> - Graph traversal from a BB/BDS pointer is IO.
>>> - Only one thread executes GS code at a time.
>>> - IO is quiesced within a drained section.
>>> - Therefore a drained section in GS code suspends graph traversal, other graph
>>>   modifications, and BB/BDS lookup.
>>> - Therefore it is safe to modify the graph from a GS drained section.
>>>
>>> However, I hit on a problem that I think Emanuele and Paolo have already
>>> pointed out: draining is GS & IO. This might have worked under the 1 IOThread
>>> model but it does not make sense for multi-queue. It is possible to submit I/O
>>> requests in drained sections. How can multiple threads be in drained sections
>>> simultaneously and possibly submit further I/O requests in their drained
>>> sections? Those sections wouldn't be "drained" in any useful sense of the word.
>>>
>>> It is necessary to adjust how recursive drained sections work:
>>> bdrv_drained_begin() must not return while there are deeper nested drained
>>> sections.
>>>
>>> This is allowed:
>>>
>>>      Monitor command            Block job
>>>      ---------------            ---------
>>>   > bdrv_drained_begin()
>>>            .                 > bdrv_drained_begin()
>>>            .                 < bdrv_drained_begin()
>>>            .                          .
>>>            .                          .
>>>            .                 > bdrv_drained_end()
>>>            .                 < bdrv_drained_end()
>>>   < bdrv_drained_begin()
>>>            .
>>>            .
>>>   > bdrv_drained_end()
>>>   < bdrv_drained_end()
>>>
>>> This is not allowed:
>>>
>>>      Monitor command            Block job
>>>      ---------------            ---------
>>>   > bdrv_drained_begin()
>>>            .                 > bdrv_drained_begin()
>>>            .                 < bdrv_drained_begin()
>>>            .                          .
>>>            .                          .
>>>   < bdrv_drained_begin()              .
>>>            .                          .
>>>            .                 > bdrv_drained_end()
>>>            .                 < bdrv_drained_end()
>>>   > bdrv_drained_end()
>>>   < bdrv_drained_end()
>>>
>>> This restriction creates an ordering between bdrv_drained_begin() callers. In
>>> this example the block job must not depend on the monitor command completing
>>> first. Otherwise there would be a deadlock just like with two threads wait for
>>> each other while holding a mutex.
>>>
>>> For sanity I think draining should be GS-only. IO code should not invoke
>>> bdrv_drained_begin() to avoid ordering problems when multiple threads drain
>>> simultaneously and have dependencies on each other.
>>>
>>> block/mirror.c needs to be modified because it currently drains from IO when
>>> mirroring is about to end.
>>
>> Yes, mirror seems to be the only clear place where draining is performed
>> from IO, namely in mirror_run. It's also a little bit weird because just
>> drained_begin is invoked from IO, while drained_end is in the main loop.
>>
>> If I understand correctly, the reason for that is that we want to
>> prevent bdrv_get_dirty_count to be modified (ie that additional
>> modifications come) after we just finished mirroring.
>>
>> Not sure how to deal with this though.
> 
> I don't know the code so I don't have a concrete solution in mind.
> 
>>>
>>> With this change to draining I think the logical argument for correctness with
>>> graph modifications holds.
>>>
>>> Enforcing GS/IO separation at compile time
>>> ------------------------------------------
>>> Right now GS/IO asserts check assumptions at runtime. The next step may be
>>> using the type system to separate GS and IO APIs so it's impossible for IO code
>>> to accidentally call GS code, for example.
>>>
>>>   typedef struct {
>>>       BlockDriverState *bs;
>>>   } BlockDriverStateIOPtr;
>>>
>>>   typedef struct {
>>>       BlockDriverState *bs;
>>>   } BlockDriverStateGSPtr;
>>>
>>> Then APIs can be protected as follows:
>>>
>>>   void bdrv_set_aio_context_ignore(BlockDriverStateGSPtr bs, ...);
>>>
>>> A function that only has a BlockDriverStateIOPtr cannot call
>>> bdrv_set_aio_context_ignore() by mistake since the compiler will complain that
>>> the first argument must be a BlockDriverStateGSPtr.
>>
>> What about functions that do not need a BlockDriverState *, and for
>> example they use BdrvChild? I would assume that we need to replicate it
>> also for that.
>>
>> And what about GS & IO functions? Not only drain, but also all the
>> generated_co_wrapper should be GS & IO.
> 
> What is the meaning of GS & IO in a multi-queue world? I guess it's
> effectively IO except it's well-behaved if called with the BQL held?

Good question. I think so. But will need to be protected, as they will
be probably graph traversing while being either GS or IO.

> 
>>
>>>
>>> Possible steps for AioContext removal
>>> -------------------------------------
>>> I also wanted to share my assumptions about multi-queue and AioContext removal.
>>> Please let me know if anything seems wrong or questionable:
>>>
>>> - IO code can execute in any thread that has an AioContext.
>>> - Multiple threads may execute a IO code at the same time.
>>> - GS code only execute under the BQL.
>>>
>>> For AioContext removal this means:
>>>
>>> - bdrv_get_aio_context() becomes mostly meaningless since there is no need for
>>>   a special "home" AioContext.
>>
>> Makes sense
>>
>>> - bdrv_coroutine_enter() becomes mostly meaningless because there is no need to
>>>   run a coroutine in the BDS's AioContext.
>>
>> Why is there no need?
> 
> The coroutine can execute in the current thread since the BDS must be
> thread-safe.
> 
> If bdrv_coroutine_enter() is used in cases like block jobs to mean "run
> in the same AioContext as the job coroutine" then the code should
> probably be changed to explicitly use the job AioContext instead of the
> more vague BDS AioContext.

Ok makes sense

> 
>>> - aio_disable_external(bdrv_get_aio_context(bs)) no longer works because many
>>>   threads/AioContexts may submit new I/O requests. BlockDevOps.drained_begin()
>>>   may be used instead (e.g. to temporarily disable ioeventfds on a multi-queue
>>>   virtio-blk device).
>>
>> Ok
>>
>>> - AIO_WAIT_WHILE() simplifies to
>>>
>>>     while ((cond)) {
>>>         aio_poll(qemu_get_current_aio_context(), true);
>>>         ...
>>>     }
>>>
>>>   and the distinction between home AioContext and non-home context is
>>>   eliminated. AioContext unlocking is dropped.
>>
>> I guess this implies no coroutine in BDS's AioContext.
> 
> I'm not sure what you mean but coroutines accessing the BDS can run in
> any AioContext with multi-queue. If they have any locking requirements
> amongst each other then that should be explicit instead of just throwing
> them all into the BDS AioContext.

Ok
> 
>>>
>>> Does this make sense? I haven't seen these things in recent patch series.
>>
>> You haven't seen them because there's no way to do it if we don't even
>> agree on what to replace the AioContext lock with.
>> Getting to this point would imply firstly having something (drain,
>> rwlock, whatever) together with AioContext, and then gradually remove
>> it. At least, that's how I understood it.
> 
> What, besides graph modification and the things I listed in this email,
> still needs to be untangled from AioContext?

Nothing else (I hope), but as Kevin also said, this requires a lot of
preliminary work before getting to this state.

Emanuele

> 
> Stefan
> 


