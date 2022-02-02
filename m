Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD94A7617
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 17:39:56 +0100 (CET)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFIfi-0007M4-Ds
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 11:39:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFHho-0007dR-1M
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nFHhj-0006MX-JO
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:37:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643816272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TtrzBWclHxEoDCc6bYraRI2kbEHLKHcaEOoZVg6xLgs=;
 b=K60OM2qERKbJsR5Lw00XPOFV8B1hjlQgp6m960l0UmNwLUCyn+bBr2Wrz2mMjnvOxAs33O
 HkHGsShdkDJ5hWlnkDnI/5xgIvSApUQgLkkxEGv5JpR6tSTAKD28PvCvzuUtAoCyOzHMNw
 kB1ebWOBOzJPlppg6EUrkN6OGQFhscg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-8MqxP2JBPEGaEv5oeNnXrg-1; Wed, 02 Feb 2022 10:37:48 -0500
X-MC-Unique: 8MqxP2JBPEGaEv5oeNnXrg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so6971378wrc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 07:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TtrzBWclHxEoDCc6bYraRI2kbEHLKHcaEOoZVg6xLgs=;
 b=IQqKvbpki8QEIEg0NenCPCMIUG1JUK5jCaQddlS/dGHxbsqe7DofSSGNvf+hw1mO1g
 QH6lfD2oig2g8K/TImnVlamhPpKJVL+GZOB8gRWXt88zIDh8dbjzj9jOLNBoQggkYtzQ
 aS+ziuBwbscEeAhNiYj9VPvmeXy8PVb+kyeG5+e8Bi3eO9y5hYnf2OrCn/Ebkf3b+FQ3
 5UALR37Hgq7UjaPH9lsqSs0RbEbsJ1okQwLbvyJ6vJOE+CYnF4XbccRPva6+/+LJ2GPk
 7CSC5A3fwrMVFn8x8G3cwi51AdsRpG8LhzZ8naYc6TIPYBCWSHK48JaZiH7r+fqhYzIA
 qhbQ==
X-Gm-Message-State: AOAM530UFC7pkjxcOdVg8uqgcdw8fkAoBduJG0+0+AXPGPlau47qNSPc
 1I31vQ5KeD/xuwOd1wI/QWiGWr6CYASolSsxu8FPyTsB2uqDHbLADYtLYaH9RwLNjH1IHPIjnWu
 B0BKBKO+maEU+PtA=
X-Received: by 2002:adf:f605:: with SMTP id t5mr25736695wrp.505.1643816266611; 
 Wed, 02 Feb 2022 07:37:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0EtKRTDyYR0SGgGeP0D++hWxOrL1vQbVKkh0I4qEw5pMTGN+RUKqu73JDatRP1IXdzd4WnQ==
X-Received: by 2002:adf:f605:: with SMTP id t5mr25736670wrp.505.1643816266317; 
 Wed, 02 Feb 2022 07:37:46 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id n8sm5091191wmk.18.2022.02.02.07.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 07:37:44 -0800 (PST)
Message-ID: <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
Date: Wed, 2 Feb 2022 16:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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



On 01/02/2022 15:47, Vladimir Sementsov-Ogievskiy wrote:
> 18.01.2022 19:27, Emanuele Giuseppe Esposito wrote:
>> Protect bdrv_replace_child_noperm, as it modifies the
>> graph by adding/removing elements to .children and .parents
>> list of a bs. Use the newly introduced
>> bdrv_subtree_drained_{begin/end}_unlocked drains to achieve
>> that and be free from the aiocontext lock.
>>
>> One important criteria to keep in mind is that if the caller of
>> bdrv_replace_child_noperm creates a transaction, we need to make sure
>> that the
>> whole transaction is under the same drain block. This is imperative,
>> as having
>> multiple drains also in the .abort() class of functions causes
>> discrepancies
>> in the drained counters (as nodes are put back into the original
>> positions),
>> making it really hard to retourn all to zero and leaving the code very
>> buggy.
>> See https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
>> for more explanations.
>>
>> Unfortunately we still need to have bdrv_subtree_drained_begin/end
>> in bdrv_detach_child() releasing and then holding the AioContext
>> lock, since it later invokes bdrv_try_set_aio_context() that is
>> not safe yet. Once all is cleaned up, we can also remove the
>> acquire/release locks in job_unref, artificially added because of this.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   block.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index fcc44a49a0..6196c95aae 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -3114,8 +3114,22 @@ static void bdrv_detach_child(BdrvChild **childp)
>>       BlockDriverState *old_bs = (*childp)->bs;
>>         assert(qemu_in_main_thread());
>> +    if (old_bs) {
>> +        /*
>> +         * TODO: this is called by job_unref with lock held, because
>> +         * afterwards it calls bdrv_try_set_aio_context.
>> +         * Once all of this is fixed, take care of removing
>> +         * the aiocontext lock and make this function _unlocked.
>> +         */
>> +        bdrv_subtree_drained_begin(old_bs);
>> +    }
>> +
>>       bdrv_replace_child_noperm(childp, NULL, true);
>>   +    if (old_bs) {
>> +        bdrv_subtree_drained_end(old_bs);
>> +    }
>> +
>>       if (old_bs) {
>>           /*
>>            * Update permissions for old node. We're just taking a
>> parent away, so
>> @@ -3154,6 +3168,7 @@ BdrvChild
>> *bdrv_root_attach_child(BlockDriverState *child_bs,
>>       Transaction *tran = tran_new();
>>         assert(qemu_in_main_thread());
>> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>>         ret = bdrv_attach_child_common(child_bs, child_name, child_class,
>>                                      child_role, perm, shared_perm,
>> opaque,
>> @@ -3168,6 +3183,7 @@ out:
>>       tran_finalize(tran, ret);
>>       /* child is unset on failure by bdrv_attach_child_common_abort() */
>>       assert((ret < 0) == !child);
>> +    bdrv_subtree_drained_end_unlocked(child_bs);
>>         bdrv_unref(child_bs);
>>       return child;
>> @@ -3197,6 +3213,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState
>> *parent_bs,
>>         assert(qemu_in_main_thread());
>>   +    bdrv_subtree_drained_begin_unlocked(parent_bs);
>> +    bdrv_subtree_drained_begin_unlocked(child_bs);
>> +
>>       ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name,
>> child_class,
>>                                      child_role, &child, tran, errp);
>>       if (ret < 0) {
>> @@ -3211,6 +3230,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState
>> *parent_bs,
>>   out:
>>       tran_finalize(tran, ret);
>>       /* child is unset on failure by bdrv_attach_child_common_abort() */
>> +    bdrv_subtree_drained_end_unlocked(child_bs);
>> +    bdrv_subtree_drained_end_unlocked(parent_bs);
>> +
>>       assert((ret < 0) == !child);
>>         bdrv_unref(child_bs);
>> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs,
>> BlockDriverState *backing_hd,
>>         assert(qemu_in_main_thread());
>>   +    bdrv_subtree_drained_begin_unlocked(bs);
>> +    if (backing_hd) {
>> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
>> +    }
>> +
>>       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>>       if (ret < 0) {
>>           goto out;
>> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs,
>> BlockDriverState *backing_hd,
>>       ret = bdrv_refresh_perms(bs, errp);
>>   out:
>>       tran_finalize(tran, ret);
>> +    if (backing_hd) {
>> +        bdrv_subtree_drained_end_unlocked(backing_hd);
>> +    }
>> +    bdrv_subtree_drained_end_unlocked(bs);
>>         return ret;
>>   }
>> @@ -5266,7 +5297,8 @@ static int
>> bdrv_replace_node_common(BlockDriverState *from,
>>         assert(qemu_get_current_aio_context() == qemu_get_aio_context());
>>       assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
>> -    bdrv_drained_begin(from);
>> +    bdrv_subtree_drained_begin_unlocked(from);
>> +    bdrv_subtree_drained_begin_unlocked(to);
>>         /*
>>        * Do the replacement without permission update.
>> @@ -5298,7 +5330,8 @@ static int
>> bdrv_replace_node_common(BlockDriverState *from,
>>   out:
>>       tran_finalize(tran, ret);
>>   -    bdrv_drained_end(from);
>> +    bdrv_subtree_drained_end_unlocked(to);
>> +    bdrv_subtree_drained_end_unlocked(from);
>>       bdrv_unref(from);
>>         return ret;
>> @@ -5345,6 +5378,9 @@ int bdrv_append(BlockDriverState *bs_new,
>> BlockDriverState *bs_top,
>>         assert(!bs_new->backing);
>>   +    bdrv_subtree_drained_begin_unlocked(bs_new);
>> +    bdrv_subtree_drained_begin_unlocked(bs_top);
>> +
>>       ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
>>                                      &child_of_bds,
>> bdrv_backing_role(bs_new),
>>                                      &bs_new->backing, tran, errp);
>> @@ -5360,6 +5396,8 @@ int bdrv_append(BlockDriverState *bs_new,
>> BlockDriverState *bs_top,
>>       ret = bdrv_refresh_perms(bs_new, errp);
>>   out:
>>       tran_finalize(tran, ret);
>> +    bdrv_subtree_drained_end_unlocked(bs_top);
>> +    bdrv_subtree_drained_end_unlocked(bs_new);
>>         bdrv_refresh_limits(bs_top, NULL, NULL);
>>   @@ -5379,8 +5417,8 @@ int bdrv_replace_child_bs(BdrvChild *child,
>> BlockDriverState *new_bs,
>>       assert(qemu_in_main_thread());
>>         bdrv_ref(old_bs);
>> -    bdrv_drained_begin(old_bs);
>> -    bdrv_drained_begin(new_bs);
>> +    bdrv_subtree_drained_begin_unlocked(old_bs);
>> +    bdrv_subtree_drained_begin_unlocked(new_bs);
>>         bdrv_replace_child_tran(&child, new_bs, tran, true);
>>       /* @new_bs must have been non-NULL, so @child must not have been
>> freed */
>> @@ -5394,8 +5432,8 @@ int bdrv_replace_child_bs(BdrvChild *child,
>> BlockDriverState *new_bs,
>>         tran_finalize(tran, ret);
>>   -    bdrv_drained_end(old_bs);
>> -    bdrv_drained_end(new_bs);
>> +    bdrv_subtree_drained_end_unlocked(new_bs);
>> +    bdrv_subtree_drained_end_unlocked(old_bs);
>>       bdrv_unref(old_bs);
>>         return ret;
>>

From the other thread:
> So you mean that backing_hd is modified as its parent is changed, do I understand correctly?

Yes

> 
> As we started to discuss in a thread started with my "[PATCH] block:
> bdrv_set_backing_hd(): use drained section", I think draining the whole
> subtree when we modify some parent-child relation is too much. In-flight
> requests in subtree don't touch these relations, so why to wait/stop
> them? Imagine two disks A and B with same backing file C. If we want to
> detach A from C, what is the reason to drain in-fligth read request of B
> in C?

If I am not mistaken, bdrv_set_backing_hd adds a new node (yes removes
the old backing_hd, but let's not think about this for a moment).
So we have disk B with backing file C, and new disk A that wants to have
backing file C.

I think I understand what you mean, so in theory the operation would be
- create new child
- add child to A->children list
- add child to C->parents list

So in theory we need to
* drain A (without subtree), because it can't happen that child nodes of
  A have in-flight requests that look at A status (children list), right?
  In other words, if A has another node X, can a request in X inspect
  A->children
* drain C, as parents can inspect C status (like B). Same assumption
  here, C->children[x]->bs cannot have requests inspecting C->parents
  list?

> Modifying children/parents lists should be protected somehow. Currently
> it's protected by aio-context lock.. If we drop it, we probably need
> some new mutex for it. Also, graph modification should be protected from
> each other, so that one graph modifiction is not started until another
> is in-flight, probably we need some global mutex for graph modification.
> But that's all not about drains.

The idea was to use BQL + drain, to obtain the same effect of aiocontext
lock. BQL should prevent concurrent graph modifications, drain
concurrent I/O reading the state while being modificated.

Emanuele
> 
> Drains are about in-flight requests. And when we switch a child of node
> X, we should do it in drained section for X, as in-flight requests in X
> can touch its children. But another in-flight requests in subtree are
> safe and should not be awaited.
> 
> 


