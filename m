Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466E49FB74
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:17:59 +0100 (CET)
Received: from localhost ([::1]:33192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDS4b-0005zB-Oq
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDRzH-0002Tc-WB
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nDRzD-0001ab-67
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643379141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyEKnDnvJPLuA69pCN8tyX3groxDEXOSsYXt18RkNdc=;
 b=fU9DKRcfyMgzmvWH35kmKcTRBoCX5CtB8JPt6JBvIh9zAEC2KeNXAwpHtm8Z2PZ2mP14Wl
 ZIvgsHrezENJ2D6NRAg0VN/AADMSXQDFWNkw2VevuJBepg3pRwds50a+SagMlAmAKB4GDo
 1e0JqJK43as/Fg/9nJkTMQD3gQMzufw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-Mb4V3ZlDPsG_BMKEkH2r3w-1; Fri, 28 Jan 2022 09:12:15 -0500
X-MC-Unique: Mb4V3ZlDPsG_BMKEkH2r3w-1
Received: by mail-qk1-f197.google.com with SMTP id
 l23-20020a37f517000000b0049b8b31c76cso4898860qkk.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xyEKnDnvJPLuA69pCN8tyX3groxDEXOSsYXt18RkNdc=;
 b=paP3iCD5MHjcl0p+mfTC6XHRf/nN7rZ+n1DW3UCu5gr2wpzXRP/ZSbYtjxJ1J90pm0
 yUikM+X1bGLqgKvXxX+9D9HAEKfl+wVKhIbX/CR34S5MSO5PmkuzVCuPRrODeQ68+P3B
 bGRelrxW9nXwtQzmko/oLPrWkBt4D0XIwXcCXfqmeC35g2396lTVWmoIUigAYw7mIbT9
 GYHOOpnmlrGr2s5FVkcRJYtW0rQYyGFAF4A8j1znI3a8FSXbc2EaEysBmjkDH0o98jVl
 dNdoZod9K7W91J9Umstu8HTByklWyuJKTe6vTQjQJJFp6FzhnUtIRVgIJl6cqZQfL55s
 yQmA==
X-Gm-Message-State: AOAM532tXTFXfT/lgJ3C/qpYDe+6EKD5J2Sq2c4mlODF1h2SWM4XDT6B
 /ml/zqEJ7XOuG7QoVr00uLhvz7JdCGtzIJELY5lPLkiaF9VdPNvX3IodOynv5me9Ja24+Dyem5j
 VAMcfwtYV58BYMEM=
X-Received: by 2002:ad4:5cae:: with SMTP id q14mr7884452qvh.19.1643379135117; 
 Fri, 28 Jan 2022 06:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqsHiDnDCJWXCBPI7VTdbGbo39hROkXQBQsYcGlaJiLra9IaPw6NEMWg+VRxnx8GntZ1Ir+g==
X-Received: by 2002:ad4:5cae:: with SMTP id q14mr7884419qvh.19.1643379134824; 
 Fri, 28 Jan 2022 06:12:14 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id a16sm3227918qtx.7.2022.01.28.06.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 06:12:14 -0800 (PST)
Message-ID: <196093af-80e8-20c0-3d73-4af642644af7@redhat.com>
Date: Fri, 28 Jan 2022 15:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
 <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
 <4aa42545-e0da-2a15-110e-3d7b2d8cd273@virtuozzo.com>
 <YfKobj+ZpzIxLasz@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YfKobj+ZpzIxLasz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, hreitz@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/01/2022 15:13, Kevin Wolf wrote:
> Am 25.01.2022 um 11:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 25.01.2022 12:24, Paolo Bonzini wrote:
>>> On 1/24/22 18:37, Vladimir Sementsov-Ogievskiy wrote:
>>>> Graph modifications should be done in drained section. stream_prepare()
>>>> handler of block stream job call bdrv_set_backing_hd() without using
>>>> drained section and it's theoretically possible that some IO request
>>>> will interleave with graph modification and will use outdated pointers
>>>> to removed block nodes.
>>>>
>>>> Some other callers use bdrv_set_backing_hd() not caring about drained
>>>> sections too. So it seems good to make a drained section exactly in
>>>> bdrv_set_backing_hd().
>>>
>>> Emanuele has a similar patch in his series to protect all graph
>>> modifications with drains:
>>>
>>> @@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>>
>>>       assert(qemu_in_main_thread());
>>>
>>> +    bdrv_subtree_drained_begin_unlocked(bs);
>>> +    if (backing_hd) {
>>> +        bdrv_subtree_drained_begin_unlocked(backing_hd);
>>> +    }
>>> +
>>>       ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
>>>       if (ret < 0) {
>>>           goto out;
>>> @@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>>       ret = bdrv_refresh_perms(bs, errp);
>>>   out:
>>>       tran_finalize(tran, ret);
>>> +    if (backing_hd) {
>>> +        bdrv_subtree_drained_end_unlocked(backing_hd);
>>> +    }
>>> +    bdrv_subtree_drained_end_unlocked(bs);
>>>
>>>       return ret;
>>>   }
>>>
>>> so the idea at least is correct.
>>>
>>> I don't object to fixing this independently, but please check
>>> 1) if a subtree drain would be more appropriate, 2) whether
>>> backing_hd should be drained as well, 3) whether we're guaranteed
>>> to be holding the AioContext lock as required for
>>> bdrv_drained_begin/end.
>>>
>>
>> Hmm.
>>
>> 1. Subtree draining of backing_hd will not help, as bs is not drained,
>> we still may have in-fight request in bs, touching old bs->backing.

What do you mean bs is not drained? In my patch I drain both.

>>
>> 2. I think non-recursive drain of bs is enough. We modify only bs
>> node, so we should drain it. backing_hd itself is not modified. If
>> backing_hd participate in some other backing chain - it's not touched,
>> and in-flight requests in that other chain are not broken by
>> modification, so why to drain it? Same for old bs->backing and other
>> bs children. We are not interested in in-flight requests in subtree
>> which are not part of request in bs. So, if no inflight requests in
>> bs, we can modify bs and not care about requests in subtree.
> 
> I agree on both points. Emanuele's patch seems to be doing unnecessary
> work there.

Wait, the point of my patches[*] is to protect
bdrv_replace_child_noperm(). See the cover letter of my series for more
info.

The reason for a subtree drain is that one callback of .attach() in
bdrv_replace_child_noperm() is bdrv_child_cb_attach().
This attaches the node in child->opaque->children list, so both nodes
pointed by the BdrvChild are modified (child->bs and child->opaque).
Simply draining on child->bs won't be enough to also get child->opaque
in my opinion[*].
Same applies with detach.
One interesting side note is what happens if we are moving the child
from one bs to another (old_bs and new_bs are both != NULL):
child->opaque will just lose and re-gain the same child.

Regarding this specific drain: I am missing something for sure here,
because if I try to follow the code I see that from
bdrv_set_backing_hd(bs, backing_hd)
the call stack eventually ends up to
bdrv_replace_child_noperm(child, new_bs /* -> backing_hd */)
and then the graph modification there is:
QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);

So why not protecting backing_hd?

Full stack:
bdrv_set_backing_hd(bs, backing_hd)
 bdrv_set_backing_noperm(bs, backing_hd)
  bdrv_set_file_or_backing_noperm(bs, backing_hd)
    bdrv_attach_child_noperm(parent_bs = bs, child_bs = backing_hd)
     bdrv_attach_child_common(child_bs = backing_hd, .., parent_bs = bs)
      new_child.bs = NULL;
      new_child.opaque = parent_bs = bs;
      bdrv_replace_child_noperm(new_child, child_bs = backing_hd)

[*] = BTW, I see that you understand this stuff way deeper than I do, so
feel free to review my drained-related series if you have time :)

> 
>> 3. Jobs are bound to aio context, so I believe that they care to hold
>> AioContext lock. For example, on path job_prepare may be called
>> through job_exit(), job_exit() does
>> aio_context_acquire(job->aio_context), or it may be called through
>> job_cancel(), which seems to be called under aio_context_acquire() as
>> well. So, seems in general we care about it, and of course
>> bdrv_set_backing_hd() must be called with AioContext lock held. If for
>> some code path it isn't, it's a bug..
> 
> We do have some code that does exactly that: In the main thread, we
> often don't hold the AioContext lock, but only the BQL. I find it quite
> ugly, but it works as long as the node is in the main AioContext.
> 
> One path where this is relevant is bdrv_open_inherit() ->
> bdrv_open_backing_file() -> bdrv_set_backing_hd(). This one is harmless
> because we know that we just created the new node in the main
> AioContext.
> 
> All the other paths seem to come either from jobs (which take the
> AioContext as you explained) or directly from monitor commands, which I
> just checked to take the lock as well.
> 

This won't hold anymore when the job patches are applied. So that is why
in my case subtree_drained_begin/end_unlocked() works.

Thank you,
Emanuele


