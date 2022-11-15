Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AC62958E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 11:17:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ousyY-0001lb-Sj; Tue, 15 Nov 2022 05:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ousyW-0001l5-N8
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ousyU-0007Oo-U8
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 05:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668507325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qCW8o9G/JWLH2o8/YguXkKJjo5fK0H12dfpoNzO9he8=;
 b=g4f/+D/29orNizOkUYQ4MyKWdfzj5AC79w5UWVD1epGk1VqJphq+qC2u6PWxEP3MssmVqc
 bjthmXexalc3/PvUIX333I6JqYYnzvgJE3yWLAtANmWWDsD+JZnW+Xp1jlE5FU4zhTl5d2
 JCqvZSJF0qWHiAp9db6dpRVdnedBIQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-w8QimizwOk610w5LURRuHw-1; Tue, 15 Nov 2022 05:15:24 -0500
X-MC-Unique: w8QimizwOk610w5LURRuHw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C972E185A7A8;
 Tue, 15 Nov 2022 10:15:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40DB492B05;
 Tue, 15 Nov 2022 10:14:59 +0000 (UTC)
Date: Tue, 15 Nov 2022 11:14:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PULL 00/11] Block layer patches
Message-ID: <Y3NmoCvJ+PJoLeLK@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
 <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
 <Y3Ie4aH6Da4qgWbU@redhat.com>
 <CAFn=p-YnmrM4X0sbYsVq=GY-7y8kwevqW=jxWV79twTx+sxmGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFn=p-YnmrM4X0sbYsVq=GY-7y8kwevqW=jxWV79twTx+sxmGw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 15.11.2022 um 00:58 hat John Snow geschrieben:
> On Mon, Nov 14, 2022 at 5:56 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 11.11.2022 um 20:20 hat Stefan Hajnoczi geschrieben:
> > > > Hanna Reitz (9):
> > > >       block/mirror: Do not wait for active writes
> > > >       block/mirror: Drop mirror_wait_for_any_operation()
> > > >       block/mirror: Fix NULL s->job in active writes
> > > >       iotests/151: Test that active mirror progresses
> > > >       iotests/151: Test active requests on mirror start
> > > >       block: Make bdrv_child_get_parent_aio_context I/O
> > > >       block-backend: Update ctx immediately after root
> > > >       block: Start/end drain on correct AioContext
> > > >       tests/stream-under-throttle: New test
> > >
> > > Hi Hanna,
> > > This test is broken, probably due to the minimum Python version:
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3311521303
> >
> > This is exactly the problem I saw with running linters in a gating CI,
> > but not during 'make check'. And of course, we're hitting it during the
> > -rc phase now. :-(
> 
> I mean. I'd love to have it run in make check too. The alternative was
> never seeing this *anywhere* ...

What is the problem with running it in 'make check'? The additional
dependencies? If so, can we run it automatically if the dependencies
happen to be fulfilled and just skip it otherwise?

If I have to run 'make -C python check-pipenv' manually, I can guarantee
you that I'll forget it more often than I'll run it.

> ...but I'm sorry it's taken me so long to figure out how to get this
> stuff to work in "make check" and also from manual iotests runs
> without adding any kind of setup that you have to manage. It's just
> fiddly, sorry :(
> 
> >
> > But yes, it seems that asyncio.TimeoutError should be used instead of
> > asyncio.exceptions.TimeoutError, and Python 3.6 has only the former.
> > I'll fix this up and send a v2 if it fixes check-python-pipenv.
> 
> Hopefully this goes away when we drop 3.6. I want to, but I recall
> there was some question about some platforms that don't support 3.7+
> "by default" and how annoying that was or wasn't. We're almost a year
> out from 3.6 being EOL, so maybe after this release it's worth a crack
> to see how painful it is to move on.

If I understand the documentation right, asyncio.TimeoutError is what
you should be using either way. That it happens to be a re-export from
the internal module asyncio.exceptions seems to be more of an
implementation detail, not the official interface.

Kevin


