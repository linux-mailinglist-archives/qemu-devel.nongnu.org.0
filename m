Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC687531193
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:23:31 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9u7-0002qu-04
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt9ke-00049L-77
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:13:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt9kb-000108-Cb
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653318820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zW0gkzz+d4UlNrjB5zUb0uts/BeC1yNNvtKseFV1+Mw=;
 b=QNNQGd4LAhuqpQ704z181H5Ia3TOEmFj/tSW6+G40KyHPCvdr9vNJu0Fj7YJdvGniM8UOV
 Un+ST+Ha0d0iOdtlGyhXejrb11GRyQ6RBg6keeWBKvyfrI+BvBy5S/IZzhY3xbtt8cvnEq
 e3gVlzL3mGqCPE/vowtQDP8hBia1fuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-3U-nGKctPsOAwtDfxJwUpA-1; Mon, 23 May 2022 11:13:37 -0400
X-MC-Unique: 3U-nGKctPsOAwtDfxJwUpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D646938107A1;
 Mon, 23 May 2022 15:13:34 +0000 (UTC)
Received: from localhost (unknown [10.39.195.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 410B7200BCE9;
 Mon, 23 May 2022 15:13:34 +0000 (UTC)
Date: Mon, 23 May 2022 16:13:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YouknD0sNvQdIgBL@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <YouFzbBNu9sox+1m@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="33wBArm4SMIqR0HL"
Content-Disposition: inline
In-Reply-To: <YouFzbBNu9sox+1m@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--33wBArm4SMIqR0HL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 03:02:05PM +0200, Kevin Wolf wrote:
> Am 22.05.2022 um 17:06 hat Stefan Hajnoczi geschrieben:
> > Hi,
> > Sorry for the long email. I've included three topics that may help us d=
iscuss
> > draining and AioContext removal further.
> >=20
> > The shortcomings of drain
> > -------------------------
> > I wanted to explore the logical argument that making graph modification=
s within
> > a drained section is correct:
> > - Graph modifications and BB/BDS lookup are Global State (GS).
> > - Graph traversal from a BB/BDS pointer is IO.
> > - Only one thread executes GS code at a time.
> > - IO is quiesced within a drained section.
>=20
> I think you're mixing two things here and calling both of them IO.
>=20
> If a function is marked as IO, that means that it is safe to call from
> I/O requests, which may be running in any iothread (they currently only
> run in the home thread of the node's AioContext, but the function
> annotations already promise that any thread is safe).
>=20
> However, if a function is marked as IO, this doesn't necessarily mean
> that it is always only called in the context of an I/O request. It can
> be called by any other code, too.
>=20
> So while drain does quiesce all I/O requests, this doesn't mean that
> functions marked as IO won't run any more.

My model is that between bdrv_drained_begin() and bdrv_drained_end()
only the caller is allowed to invoke BB/BDS functions (including
functions marked IO).

The caller isn't strictly one thread and one or no coroutines. The
caller could use threads and coroutines, but the important thing is that
everything else that accesses the BB/BDS is suspended due to
=2Edrained_begin() callbacks (and is_external).

So when you say a function marked IO can be called from outside an I/O
request, that "outside an I/O request" code must be quiesced too.
Otherwise drain is definitely not safe for graph modifications.

> > - Therefore a drained section in GS code suspends graph traversal, othe=
r graph
> >   modifications, and BB/BDS lookup.
> > - Therefore it is safe to modify the graph from a GS drained section.
>=20
> So unfortunately, I don't think this conclusion is correct.
>=20
> In order to make your assumption true, we would have to require that all
> callers of IO functions must have called bdrv_inc_in_flight(). We would
> also have to find a way to enforce this preferable at compile time or
> with static analysis, or at least with runtime assertions, because it
> would be very easy to get wrong.

Or that they are quiesced by .drained_begin() callbacks or is_external.

Do you have a concrete example?

>=20
> > However, I hit on a problem that I think Emanuele and Paolo have already
> > pointed out: draining is GS & IO. This might have worked under the 1 IO=
Thread
> > model but it does not make sense for multi-queue. It is possible to sub=
mit I/O
> > requests in drained sections. How can multiple threads be in drained se=
ctions
> > simultaneously and possibly submit further I/O requests in their drained
> > sections? Those sections wouldn't be "drained" in any useful sense of t=
he word.
>=20
> Drains asks other users not to touch the block node. Currently this only

BTW interesting language choice here: you're using the more general
definition of "other users" and "touch[ing] the block node" rather than
the narrow definition of just "I/O requests". That's exactly how I think
of drain but based on what you wrote above I'm not sure that's how you
think of it too?

> includes, but the desire to use drain for locking means that we need to
> extend it to pretty much any operation on the node, which would include
> calling drain on that block node. So you should never have two callers
> in a drain section at the same time, it would be a bug in this model.

Yes! Drain in its current form doesn't make sense for multi-queue since
multiple threads could be in drained sections at the same time and they
would all be allowed to submit new I/O requests.

> Of course, we know that currently drain is not respected by all relevant
> callers (most importantly, the monitor). If you want to use drain as a
> form of locking, you need to solve this first.
>=20
> > It is necessary to adjust how recursive drained sections work:
> > bdrv_drained_begin() must not return while there are deeper nested drai=
ned
> > sections.
> >=20
> > This is allowed:
> >=20
> >      Monitor command            Block job
> >      ---------------            ---------
> >   > bdrv_drained_begin()
> >            .                 > bdrv_drained_begin()
> >            .                 < bdrv_drained_begin()
> >            .                          .
> >            .                          .
> >            .                 > bdrv_drained_end()
> >            .                 < bdrv_drained_end()
> >   < bdrv_drained_begin()
> >            .
> >            .
> >   > bdrv_drained_end()
> >   < bdrv_drained_end()
>=20
> Just to make sure I understand the scenario that you have in mind here:
> The monitor command is not what causes the block job to do the draining
> because this is inside bdrv_drained_begin(), so the block job just
> randomly got a callback that caused it to do so (maybe completion)?

Yes, exactly that completion scenario. When the mirror block job
completes exactly when a monitor command calls bdrv_drained_begin(),
mirror_exit_common() deletes a temporary filter BDS node. It involves
drain and modifies the graph.

>=20
> Before bdrv_drained_begin() returns, anything is still allowed to run,
> so I agree that this is valid.

Thanks for confirming!

> > This is not allowed:
> >=20
> >      Monitor command            Block job
> >      ---------------            ---------
> >   > bdrv_drained_begin()
> >            .                 > bdrv_drained_begin()
> >            .                 < bdrv_drained_begin()
> >            .                          .
> >            .                          .
> >   < bdrv_drained_begin()              .
> >            .                          .
> >            .                 > bdrv_drained_end()
> >            .                 < bdrv_drained_end()
> >   > bdrv_drained_end()
> >   < bdrv_drained_end()
> >=20
> > This restriction creates an ordering between bdrv_drained_begin() calle=
rs. In
> > this example the block job must not depend on the monitor command compl=
eting
> > first. Otherwise there would be a deadlock just like with two threads w=
ait for
> > each other while holding a mutex.
>=20
> So essentially drain needs to increase bs->in_flight, so that the outer
> drain has to wait for the inner drain section to end before its
> bdrv_drained_begin() can return.
>=20
> > For sanity I think draining should be GS-only. IO code should not invoke
> > bdrv_drained_begin() to avoid ordering problems when multiple threads d=
rain
> > simultaneously and have dependencies on each other.
> >=20
> > block/mirror.c needs to be modified because it currently drains from IO=
 when
> > mirroring is about to end.
> >=20
> > With this change to draining I think the logical argument for correctne=
ss with
> > graph modifications holds.
>=20
> What is your suggestion how to modify mirror? It drains so that no new
> requests can sneak in and source and target stay in sync while it
> switches to the completion code running in the main AioContext. You
> can't just drop this.

I haven't read the code in enough depth to come up with a solution.

>=20
> > Enforcing GS/IO separation at compile time
> > ------------------------------------------
> > Right now GS/IO asserts check assumptions at runtime. The next step may=
 be
> > using the type system to separate GS and IO APIs so it's impossible for=
 IO code
> > to accidentally call GS code, for example.
> >=20
> >   typedef struct {
> >       BlockDriverState *bs;
> >   } BlockDriverStateIOPtr;
> >=20
> >   typedef struct {
> >       BlockDriverState *bs;
> >   } BlockDriverStateGSPtr;
> >=20
> > Then APIs can be protected as follows:
> >=20
> >   void bdrv_set_aio_context_ignore(BlockDriverStateGSPtr bs, ...);
> >=20
> > A function that only has a BlockDriverStateIOPtr cannot call
> > bdrv_set_aio_context_ignore() by mistake since the compiler will compla=
in that
> > the first argument must be a BlockDriverStateGSPtr.
>=20
> And then you have a set of functions that cast from GS to IO pointers,
> but not for the other way around? Or maybe getting as IO pointer would
> even be coupled with automatically increasing bs->in_flight?
>=20
> The other option that we were looking into for this was static analysis.
> I had hacked up a small script to check consistency of these annotations
> (without covering function pointers, though) to help me with the review
> of Emanuele's patches that introduced them. If I understand correctly,
> Paolo has scripts to do the same a little bit better.
>=20
> As long as we can integrate such a script in 'make check', we wouldn't
> necessarily have to have the churn in the C code to switch everything to
> new wrapper types.

Yes, that's the problem with the typedef Ptr approach. It would involve
a lot of code changes. Maybe static analysis tools are better.

>=20
> > Possible steps for AioContext removal
> > -------------------------------------
> > I also wanted to share my assumptions about multi-queue and AioContext =
removal.
> > Please let me know if anything seems wrong or questionable:
> >=20
> > - IO code can execute in any thread that has an AioContext.
> > - Multiple threads may execute a IO code at the same time.
> > - GS code only execute under the BQL.
> >=20
> > For AioContext removal this means:
> >=20
> > - bdrv_get_aio_context() becomes mostly meaningless since there is no n=
eed for
> >   a special "home" AioContext.
> > - bdrv_coroutine_enter() becomes mostly meaningless because there is no=
 need to
> >   run a coroutine in the BDS's AioContext.
> > - aio_disable_external(bdrv_get_aio_context(bs)) no longer works becaus=
e many
> >   threads/AioContexts may submit new I/O requests. BlockDevOps.drained_=
begin()
> >   may be used instead (e.g. to temporarily disable ioeventfds on a mult=
i-queue
> >   virtio-blk device).
> > - AIO_WAIT_WHILE() simplifies to
> >=20
> >     while ((cond)) {
> >         aio_poll(qemu_get_current_aio_context(), true);
> >         ...
> >     }
>=20
> Probably not exactly, because you still need aio_wait_kick() to wake up
> the thread. We use AioWait.num_waiters !=3D 0 to decide whether we need to
> schedule a BH in the main thread (because doing so unconditionally for
> every completed request would be very wasteful).
>=20
> If you want to be able to run this loop from any thread instead of just
> the main thread, you would have to store somewhere which thread to wake.

qemu_cond_broadcast() can be used since the wakeup is a slow path.

> >   and the distinction between home AioContext and non-home context is
> >   eliminated. AioContext unlocking is dropped.
> >=20
> > Does this make sense? I haven't seen these things in recent patch serie=
s.
>=20
> Intuitively I would agree with most. There may be details that I'm not
> aware of at the moment. I'm not surprised that we haven't seen any such
> things in recent patch series because there is an awful lot of
> preparational work to be done before we can reach this final state.

Yes. I'm mostly hoping to find out whether my view in fundamentally
flawed or very different from what you and others think.

Stefan

--33wBArm4SMIqR0HL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKLpJwACgkQnKSrs4Gr
c8gOQQgAmLqd2NralflccMWlMeD7KTkgM0qCxcNg2wSdPL49HUCXWz9ej+3K94qN
73N6TExqAVY2nlfTOaZVyg9TDhXfeDBozE99R/GHX+o3+8pjhrjSutWzoh5orHeb
bIFtJbQOIlzqX0F83oUn7VfRT3apd7P9lA9BgPIoWM8bAtgPKFuOxSDpm3a+Qixr
QnAwd+TCxLFuYQnDGYcfmG+/1oFDg2/PPHoGsCqQaVy4/DEqa85BFJ0FZG1gImRT
Gj61pf6GUy+IzV+9msgW00XgGCZkB1eCq0KtmcDzF8w4/vfik0xRX7vK0iXjmJYK
YLyx7izlBIweKXZDVGUxYbs7cS305g==
=/r1B
-----END PGP SIGNATURE-----

--33wBArm4SMIqR0HL--


