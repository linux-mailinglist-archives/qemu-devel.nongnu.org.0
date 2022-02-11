Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A2A4B292E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:40:06 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIY1l-0005pV-4J
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:40:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIY0t-00056N-1x
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 10:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nIY0o-0000uW-7D
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 10:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644593945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k/5hRW7aVMYzTtAqBMEg4rCDo84D27mcwdcQcjfEGys=;
 b=R/Ytj4pHovSyAuL6M3Uzz0tz8AUYOwxfT0q+la33X/mss1Jkfe03XdaWW37jsuMGFH40Tu
 mg7EFZhrZn+3M3uSthnUDjnOu1TVel3k5Te/G96wY6hc+QIvqlHtfYK5dvR9ElA0d5+X0E
 34ZT8NSpkMXWTGGYPgh9uGjokxSaes8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-HScg0Sx1PRis8QfbOfWczA-1; Fri, 11 Feb 2022 10:39:02 -0500
X-MC-Unique: HScg0Sx1PRis8QfbOfWczA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5752018460E6;
 Fri, 11 Feb 2022 15:38:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41D78798A6;
 Fri, 11 Feb 2022 15:38:48 +0000 (UTC)
Date: Fri, 11 Feb 2022 16:38:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Message-ID: <YgaDBkblIA6wu82p@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208153655.1251658-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2022 um 16:36 hat Emanuele Giuseppe Esposito geschrieben:
> This test uses a callback of an I/O function (blk_aio_preadv)
> to modify the graph, using bdrv_attach_child.
> This is simply not allowed anymore. I/O cannot change the graph.

The callback of an I/O function isn't I/O, though. It is code _after_
the I/O has completed. If this doesn't work any more, it feels like this
is a bug.

I think it becomes a bit more obvious when you translate the AIO into
the equivalent coroutine function:

    void coroutine_fn foo(...)
    {
        GLOBAL_STATE_CODE();

        blk_co_preadv(...);
        detach_by_parent_aio_cb(...);
    }

This is obviously correct code that must work. Calling an I/O function
from a GS function is allowed, and of course the GS function may
continue to do GS stuff after the I/O function returned.

(Actually, I'm not sure if it really works when blk is not in the main
AioContext, but your API split patches claim that it does, so let's
assume for the moment that this is already true :-))

> Before "block/io.c: make bdrv_do_drained_begin_quiesce static
> and introduce bdrv_drained_begin_no_poll", the test would simply
> be at risk of failure, because if bdrv_replace_child_noperm()
> (called to modify the graph) would call a drain,
> then one callback of .drained_begin() is bdrv_do_drained_begin_quiesce,
> that specifically asserts that we are not in a coroutine.
> 
> Now that we fixed the behavior, the drain will invoke a bh in the
> main loop, so we don't have such problem. However, this test is still
> illegal and fails because we forbid graph changes from I/O paths.
> 
> Once we add the required subtree_drains to protect
> bdrv_replace_child_noperm(), the key problem in this test is in:

Probably a question for a different patch, but why is a subtree drain
required instead of just a normal node drain? It feels like a bigger
hammer than what is needed for replacing a single child.

> acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
> /* Drain and check the expected result */
> bdrv_subtree_drained_begin(parent_b);
> 
> because the detach_by_parent_aio_cb calls detach_indirect_bh(), that
> modifies the graph and is invoked during bdrv_subtree_drained_begin().
> The call stack is the following:
> 1. blk_aio_preadv() creates a coroutine, increments in_flight counter
> and enters the coroutine running blk_aio_read_entry()
> 2. blk_aio_read_entry() performs the read and then schedules a bh to
>    complete (blk_aio_complete)
> 3. at this point, subtree_drained_begin() kicks in and waits for all
>    in_flight requests, polling
> 4. polling allows the bh to be scheduled, so blk_aio_complete runs
> 5. blk_aio_complete *first* invokes the callback
>    (detach_by_parent_aio_cb) and then decrements the in_flight counter
> 6. Here we have the problem: detach_by_parent_aio_cb modifies the graph,
>    so both bdrv_unref_child() and bdrv_attach_child() will have
>    subtree_drains inside. And this causes a deadlock, because the
>    nested drain will wait for in_flight counter to go to zero, which
>    is only happening once the drain itself finishes.

So the problem has nothing to do with detach_by_parent_aio_cb() being
an I/O function in the sense of locking rules (which it isn't), but with
calling a drain operation while having the in_flight counter increased.

In other words, an AIO callback like detach_by_parent_aio_cb() must
never call drain - and it doesn't before your changes to
bdrv_replace_child_noperm() break it. How confident are we that this
only breaks tests and not real code?

Part of the problem is probably that drain is serving two slightly
different purposes inside the block layer (just make sure that nothing
touches the node any more) and callers outside of the block layer (make
sure that everything has completed and no more callbacks will be
called). This bug sits exactly in the difference between those two
concepts - we're waiting for more than we would have to wait for, and it
causes a deadlock in this combination.

I guess it could be fixed if BlockBackend accounted for requests that
are already completed, but their callback hasn't yet. blk_drain() would
then have to wait for those requests, but blk_root_drained_poll()
wouldn't because these requests don't affect the root node any more.

> Different story is test_detach_by_driver_cb(): in this case,
> detach_by_parent_aio_cb() does not call detach_indirect_bh(),
> but it is instead called as a bh running in the main loop by
> detach_by_driver_cb_drained_begin(), the callback for
> .drained_begin().
> 
> This test was added in 231281ab42 and part of the series
> "Drain fixes and cleanups, part 3"
> https://lists.nongnu.org/archive/html/qemu-block/2018-05/msg01132.html
> but as explained above I believe that it is not valid anymore, and
> can be discarded.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

I feel throwing tests away just because they don't pass any more is a
bit too simple. :-)

Kevin


