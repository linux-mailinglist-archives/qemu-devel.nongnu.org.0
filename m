Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFA4B552B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:49:06 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdb7-0000qQ-Pa
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJdHn-00072B-U8
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:29:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nJdHk-00048u-QI
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644852543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g3AFzjg8gEY61pSalYbZ6Umcj0CHjVYTddQBntVKw9U=;
 b=eN8t7GtTz2zXAvSgBL95acp0o132ZGiHhfQD2w7mGUr9mFXjaqUfpv1iTVACuTinoIlRLO
 ekYtkgZRGTn37/H5tntfFajn/+Kxo4wjUVftlOxIUIST8eT1L3bzzAnAkvKYSH5DdnjX+s
 5ku7VSdpIYHNzoZToQ6c3jmUooeQuHE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-fMOaRhviPkaEGVa5t_XDXA-1; Mon, 14 Feb 2022 10:28:57 -0500
X-MC-Unique: fMOaRhviPkaEGVa5t_XDXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EC661091DA1;
 Mon, 14 Feb 2022 15:28:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D54CF752C5;
 Mon, 14 Feb 2022 15:28:21 +0000 (UTC)
Date: Mon, 14 Feb 2022 16:28:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Message-ID: <Ygp1FJyh8v0SRxZq@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com>
 <YgaDBkblIA6wu82p@redhat.com>
 <db25869b-fbf2-f5ca-b2f8-4fe4f3c0a040@redhat.com>
MIME-Version: 1.0
In-Reply-To: <db25869b-fbf2-f5ca-b2f8-4fe4f3c0a040@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.02.2022 um 12:42 hat Paolo Bonzini geschrieben:
> On 2/11/22 16:38, Kevin Wolf wrote:
> > The callback of an I/O function isn't I/O, though. It is code_after_
> > the I/O has completed. If this doesn't work any more, it feels like this
> > is a bug.
> 
> The issue is that the I/O has *not* completed yet.  blk_aio_preadv(..., cb,
> opaque) is not equivalent to
> 
> 	ret = blk_co_preadv(...);
> 	cb(ret, opaque);
> 
> but rather to
> 
> 	blk_inc_in_flight(blk);
> 	ret = blk_co_preadv(...);
> 	cb(ret, opaque);
> 	blk_dec_in_flight(blk);

It depends on what you call "the I/O". The request to blk_bs(blk) has
already completed, but the request to blk itself hasn't yet.

This is exactly the difference I was talking about:
bdrv_replace_child_noperm() really only cares about requests to the
BlockDriverState, but drain currently waits for attached BlockBackends,
too.

The BlockBackend could safely return false from blk_root_drained_poll()
while requests are still in their callbacks (if they do anything that
touches a node, they would increase in_flight again), it just doesn't do
it yet. It's only blk_drain(_all)() that would still have to wait for
those.

> Your own commit message (yeah I know we've all been through that :))
> explains why, and notes that it is now invalid to drain in a callback:
> 
>     commit 46aaf2a566e364a62315219255099cbf1c9b990d
>     Author: Kevin Wolf <kwolf@redhat.com>
>     Date:   Thu Sep 6 17:47:22 2018 +0200
> 
>     block-backend: Decrease in_flight only after callback
> 
>     Request callbacks can do pretty much anything, including operations
>     that will yield from the coroutine (such as draining the backend).
>     In that case, a decreased in_flight would be visible to other code
>     and could lead to a drain completing while the callback hasn't
>     actually completed yet.
> 
>     Note that reordering these operations forbids calling drain directly
>     inside an AIO callback.

Yes, I wasn't aware of this any more, but I've come to the same
conclusion in my previous message in this thread.

> So the questions are:
> 
> 1) is the above commit wrong though well-intentioned?
> 
> 2) is it unexpected that bdrv_replace_child_noperm() drains (thus becoming
> invalid from the callback, albeit valid through a bottom half)?
> 
> 
> My answer is respectively 1) it's correct, many coroutines do inc_in_flight
> before creation and dec_in_flight at the end, we're just saying that it's
> _always_ the case for callback-based operations; 2) no, it's not unexpected
> and therefore the test is the incorrect one.

My question isn't really only about the test, though. If it is now
forbidden to call bdrv_replace_child_noperm() in a callback, how do we
verify that the test is the only incorrect one rather than just the
obvious one?

And is it better to throw away the test and find and fix all other
places that are using something that is now forbidden, or wouldn't it be
better to actually allow bdrv_replace_child_noperm() in callbacks?

Kevin


