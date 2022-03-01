Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAE4C8DCE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:33:00 +0100 (CET)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Yh-0000lg-P6
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:32:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3SP-0008LU-GE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:26:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3SM-0008U2-NT
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvvYV6ySUM2D2G00J+kmLQ7U9cIfqBtkOVD5d18GRjc=;
 b=RaGZbX3DJRAWOQl3zd/GnQNwD8WF6npafM1ZKhg/mbohd2H9zNNo0nilcuShM4AXJLbu4q
 /0DfJQzlxOu4zKoIqyZrmiCKW5OqgKBIju2WrtWftoraPmciMgSpa6Qx0qtfNjbMTNt/uv
 z4hYmUXm72dvN06tur5bpruSPxuzUO0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-qdU_bVpONh6NhAHUrRRPdw-1; Tue, 01 Mar 2022 09:26:24 -0500
X-MC-Unique: qdU_bVpONh6NhAHUrRRPdw-1
Received: by mail-qk1-f199.google.com with SMTP id
 r20-20020a37a814000000b00648f4cddf6bso14075137qke.5
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 06:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nvvYV6ySUM2D2G00J+kmLQ7U9cIfqBtkOVD5d18GRjc=;
 b=LpTiQwIJhqbKW2btCosxt77p2kDTnfGcQqaqNxbAOwR1zJ+N4oOCDB3hEVm2Egcnp5
 ySXUFy+mMzxG1WQbzrWbsDFB5d4eeMqHmi1yCwizRIkReeT1D6S5Pv1bfBJjLpo7d0f/
 VDfEu8qknvNgEkRSWtLG73j8hfe+q8Egi9xzFe/E9s5E5LkWYj8p6cZc/6nqMQp4hHH5
 mD1fHwsKjpmLBpUP2lC2+4ZGqNilxFZ4NgN4+3yAj81W+27iVICY1iuTh1oMOrC64zJf
 SDB5293bM3HGos66XOyawO/9GIbDZk7F+r6Fkkt5BxTy8oKqetjW/4hKr6VjQDFCqgnl
 Dnlw==
X-Gm-Message-State: AOAM531LWDu4eCnsDnQE3GlCWZ/rnk3y1XNFmRfO27Jh/9ZByqUE7nl+
 CR30+t5VdYQd/vLUYWXb4bfQ/6xYPhebTV44kKKd4rNIgs9mxAupKwsUnNJvaZ8MuLT/x7l2Idx
 wVP9s3R3kIHjW5FE=
X-Received: by 2002:a37:747:0:b0:60d:d709:2e20 with SMTP id
 68-20020a370747000000b0060dd7092e20mr13611974qkh.579.1646144784126; 
 Tue, 01 Mar 2022 06:26:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrtTIwyvqOE0Wet7PNfFOUgtpzt/mo8nygkDJakEKFzJo6Y6Od6jO/ESvwrxV5fiGdvwLMSA==
X-Received: by 2002:a37:747:0:b0:60d:d709:2e20 with SMTP id
 68-20020a370747000000b0060dd7092e20mr13611933qkh.579.1646144783690; 
 Tue, 01 Mar 2022 06:26:23 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a3795c2000000b0060cb44d7eb9sm6727407qkd.11.2022.03.01.06.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 06:26:23 -0800 (PST)
Message-ID: <2c15ced5-e6ec-d7e1-a534-ab6a574431ef@redhat.com>
Date: Tue, 1 Mar 2022 15:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I would really love to hear opinions on this, since we already had some
discussions on other similar patches.

Thank you,
Emanuele

On 01/03/2022 15:21, Emanuele Giuseppe Esposito wrote:
> This serie tries to provide a proof of concept and a clear explanation
> on why we need to use drains (and more precisely subtree_drains)
> to replace the aiocontext lock, especially to protect BlockDriverState
> ->children and ->parent lists.
> 
> Just a small recap on the key concepts:
> * We split block layer APIs in "global state" (GS), "I/O", and
> "global state or I/O".
>   GS are running in the main loop, under BQL, and are the only
>   one allowed to modify the BlockDriverState graph.
> 
>   I/O APIs are thread safe and can run in any thread
> 
>   "global state or I/O" are essentially all APIs that use
>   BDRV_POLL_WHILE. This is because there can be only 2 threads
>   that can use BDRV_POLL_WHILE: main loop and the iothread that
>   runs the aiocontext.
> 
> * Drains allow the caller (either main loop or iothread running
> the context) to wait all in_flights requests and operations
> of a BDS: normal drains target a given node and is parents, while
> subtree ones also include the subgraph of the node. Siblings are
> not affected by any of these two kind of drains.
> After bdrv_drained_begin, no more request is allowed to come
> from the affected nodes. Therefore the only actor left working
> on a drained part of the graph should be the main loop.
> 
> What do we intend to do
> -----------------------
> We want to remove the AioContext lock. It is not 100% clear on how
> many things we are protecting with it, and why.
> As a starter, we want to protect BlockDriverState ->parents and
> ->children lists, since they are read by main loop and I/O but
> only written by main loop under BQL. The function that modifies
> these lists is bdrv_replace_child_common().
> 
> How do we want to do it
> -----------------------
> We individuated as ideal subtitute of AioContext lock
> the subtree_drain API. The reason is simple: draining prevents the iothread to read or write the nodes, so once the main loop finishes
> executing bdrv_drained_begin() on the interested graph, we are sure that
> the iothread is not going to look or even interfere with that part of the graph.
> We are also sure that the only two actors that can look at a specific
> BlockDriverState in any given context are the main loop and the
> iothread running the AioContext (ensured by "global state or IO" logic).
> 
> Why use _subtree_ instead of normal drain
> -----------------------------------------
> A simple drain "blocks" a given node and all its parents.
> But it doesn't touch the child.
> This means that if we use a simple drain, a child can always
> keep processing requests, and eventually end up calling itself
> bdrv_drained_begin, ending up reading the parents node while the main loop
> is modifying them. Therefore a subtree drain is necessary.
> 
> Possible scenarios
> -------------------
> Keeping in mind that we can only have an iothread and the main loop
> draining on a certain node, we could have:
> 
> main loop successfully drains and then iothread tries to drain:
>   impossible scenario, as iothread is already stopped once main
>   successfully drains.
> 
> iothread successfully drains and then main loop drains:
>   should not be a problem, as:
>   1) the iothread should be already "blocked" by its own drain
>   2) main loop would still wait for it to completely block
>   There is the issue of mirror overriding such scenario to avoid
>   having deadlocks, but that is handled in the next section.
> 
> main loop and iothread try to drain together:
>   As above, this case doens't really matter. As long as
>   bdrv_drained_begin invariant is respected, the main loop will
>   continue only once the iothread is "blocked" on that part of the graph.
> 
> A note on iothread draining
> ---------------------------
> Theoretically draining from an iothread should not be possible,
> as the iothread would be scheduling a bh in the main loop waiting
> for itself to stop, even though it is not yet stopped since it is waiting for the bh.
> 
> This is what would happen in the tests in patch 5 if .drained_poll
> was not implemented.
> 
> Therefore, one solution is to use .drained_poll callback in BlockJobDriver.
> This callback overrides the default job poll() behavior, and
> allows the polling condition to stop waiting for the job.
> It is actually used only in mirror.
> This however breaks bdrv_drained_begin invariant, because the
> iothread is not really blocked on that node but continues running.
> In order to fix this, patch 4 allows the polling condition to be
> used only by the iothread, and not the main loop too, preventing
> the drain to return before the iothread is effectively stopped.
> This is also shown in the tests in patch 5. If the fix in patch
> 4 is removed, then the main loop drain will return earlier and
> allow the iothread to run and drain together.
> 
> The other patches in this serie are cherry-picked from the various
> series I already sent, and are included here just to allow
> subtree_drained_begin/end_unlocked implementation.
> 
> Emanuele Giuseppe Esposito (5):
>   aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>   introduce BDRV_POLL_WHILE_UNLOCKED
>   block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>   child_job_drained_poll: override polling condition only when in home
>     thread
>   test-bdrv-drain: ensure draining from main loop stops iothreads
> 
>  block/io.c                   |  48 ++++++--
>  blockjob.c                   |   3 +-
>  include/block/aio-wait.h     |  15 ++-
>  include/block/block.h        |   7 ++
>  tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>  5 files changed, 274 insertions(+), 17 deletions(-)
> 


