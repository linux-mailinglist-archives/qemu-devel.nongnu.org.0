Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C885F2C92
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:57:37 +0200 (CEST)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHGZ-0006jo-OE
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ofHBr-0002A1-TH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ofHBp-0003m8-N8
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664787160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNgMC5014HTxMbDrKRAmpGh1V5voXrR8mGN+O3bwnt8=;
 b=A7RC4MzqpH/WwrV+OqPWX1V7v7V+Ib5CpLUNpbB8nSACSAQTkNsHIk9wUBz6+rDOSHgRF6
 U7gNfmMdVvqzNGhR1BhbxEsJL8QLGCuWlTQC9pZjUsOdyZOPZTnzP/UesZZlUOJ1hfQel4
 g/JEBTtPOcM0mUgNqzg21anYsYsWtlY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-hAnoJcfLPDu4tuHvKbcyQw-1; Mon, 03 Oct 2022 04:52:39 -0400
X-MC-Unique: hAnoJcfLPDu4tuHvKbcyQw-1
Received: by mail-qt1-f197.google.com with SMTP id
 h7-20020ac85047000000b0035a6794699bso6834147qtm.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BNgMC5014HTxMbDrKRAmpGh1V5voXrR8mGN+O3bwnt8=;
 b=aqfKvhFZO7bnKuzw0nJFF+CAJ+AkFAy2hjM6yBGAi7FA+ZySwBdrT3fVg8iZENq7yk
 T+WOdUbIDqr4PCH2uQxKrsWnPyMzDqgG/Ngu+w4EKTrKmPbu3zepmnO9eoDPnrpR7Nzj
 dYzhmgIdj8zdIQV26rZJblOM+nzXNyypyuIUHt3reny1iw1p0rgZOpbH3fmXGXW78x5A
 AqX+K0uVKOLkSlt5BtiRKO4I0vTYnsnkCWLs0tIbEgThKX3emaKnyO1e3CzOqFh1js14
 /5y54YWHM42zccTiDF/OaE/Q+lgLXJKmMHdNOxHLsjRZOwXVhnVlmmYpyDirgjToIrF/
 mUpQ==
X-Gm-Message-State: ACrzQf1twzOzTSGtyQH9PyJn9xp7d9eZFybXb36AktY2TbKnDjQiR0Vu
 Erl0kbj0aq3tkHg7CjuLJxcRw7mA7jaRfs8F8nFGVzVqIYykpExbKe79+k29L250HO5cPs62xX6
 uzqSaOfO0iHDunMU=
X-Received: by 2002:a05:620a:16ba:b0:6ce:d74f:8268 with SMTP id
 s26-20020a05620a16ba00b006ced74f8268mr12982577qkj.370.1664787158751; 
 Mon, 03 Oct 2022 01:52:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xXL05mL1UTaiZ5uT7+5LOf9RQhEvRMlaQ/x1/5guBjhWQtjxr7k+Dl2CFKTbAJXcOSxlGjg==
X-Received: by 2002:a05:620a:16ba:b0:6ce:d74f:8268 with SMTP id
 s26-20020a05620a16ba00b006ced74f8268mr12982574qkj.370.1664787158501; 
 Mon, 03 Oct 2022 01:52:38 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05620a24cd00b006cbcdc6efedsm10776508qkn.41.2022.10.03.01.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:52:37 -0700 (PDT)
Message-ID: <dc4bf265-4cd9-ef29-2e3f-d15e779bd8db@redhat.com>
Date: Mon, 3 Oct 2022 10:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] thread-pool: use ThreadPool from the running thread
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220609134452.1146309-1-eesposit@redhat.com>
 <20220609134452.1146309-3-eesposit@redhat.com> <YzW6FkfT9LT7aE7d@redhat.com>
 <29c33add-81ca-5a16-a02a-d2a0c5bfaf88@redhat.com>
 <YzcPBFcf3idA4MLH@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YzcPBFcf3idA4MLH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 30/09/2022 um 17:45 schrieb Kevin Wolf:
> Am 30.09.2022 um 14:17 hat Emanuele Giuseppe Esposito geschrieben:
>> Am 29/09/2022 um 17:30 schrieb Kevin Wolf:
>>> Am 09.06.2022 um 15:44 hat Emanuele Giuseppe Esposito geschrieben:
>>>> Remove usage of aio_context_acquire by always submitting work items
>>>> to the current thread's ThreadPool.
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>>
>>> The thread pool is used by things outside of the file-* block drivers,
>>> too. Even outside the block layer. Not all of these seem to submit work
>>> in the same thread.
>>>
>>>
>>> For example:
>>>
>>> postcopy_ram_listen_thread() -> qemu_loadvm_state_main() ->
>>> qemu_loadvm_section_start_full() -> vmstate_load() ->
>>> vmstate_load_state() -> spapr_nvdimm_flush_post_load(), which has:
>>>
>>> ThreadPool *pool = aio_get_thread_pool(qemu_get_aio_context());
>>> ...
>>> thread_pool_submit_aio(pool, flush_worker_cb, state,
>>>                        spapr_nvdimm_flush_completion_cb, state);
>>>
>>> So it seems to me that we may be submitting work for the main thread
>>> from a postcopy migration thread.
>>>
>>> I believe the other direct callers of thread_pool_submit_aio() all
>>> submit work for the main thread and also run in the main thread.
>>>
>>>
>>> For thread_pool_submit_co(), pr_manager_execute() calls it with the pool
>>> it gets passed as a parameter. This is still bdrv_get_aio_context(bs) in
>>> hdev_co_ioctl() and should probably be changed the same way as for the
>>> AIO call in file-posix, i.e. use qemu_get_current_aio_context().
>>>
>>>
>>> We could consider either asserting in thread_pool_submit_aio() that we
>>> are really in the expected thread, or like I suggested for LinuxAio drop
>>> the pool parameter and always get it from the current thread (obviously
>>> this is only possible if migration could in fact schedule the work on
>>> its current thread - if it schedules it on the main thread and then
>>> exits the migration thread (which destroys the thread pool), that
>>> wouldn't be good).
>>
>> Dumb question: why not extend the already-existing poll->lock to cover
>> also the necessary fields like pool->head that are accessed by other
>> threads (only case I could find with thread_pool_submit_aio is the one
>> you pointed above)?
> 
> Other people are more familiar with this code, but I believe this could
> have performance implications. I seem to remember that this code is
> careful to avoid locking to synchronise between worker threads and the
> main thread.
> 
> But looking at the patch again, I have actually a dumb question, too:
> The locking you're removing is in thread_pool_completion_bh(). As this
> is a BH, it's running the the ThreadPool's context either way, no matter
> which thread called thread_pool_submit_aio().
> 
> I'm not sure what this aio_context_acquire/release pair is actually
> supposed to protect. Paolo's commit 1919631e6b5 introduced it. Was it
> just more careful than it needs to be?
> 

I think the goal is still to protect pool->head, but if so the
aiocontext lock is put in the wrong place, because as you said the bh is
always run in the thread pool context. Otherwise it seems to make no sense.

On the other side, thread_pool_submit_aio could be called by other
threads on behalf of the main loop, which means pool->head could be
modified (iothread calls thread_pool_submit_aio) while being read by the
main loop (another worker thread schedules thread_pool_completion_bh).

What are the performance implications? I mean, if the aiocontext lock in
the bh is actually useful and the bh really has to wait to take it,
being taken in much more places throughout the block layer won't be
better than extending the poll->lock I guess.

Thank you,
Emanuele


