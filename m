Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7B953150E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:47:11 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntBD4-0001XJ-SS
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntBBK-0008SD-EO
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntBBF-0008A9-1o
 for qemu-devel@nongnu.org; Mon, 23 May 2022 12:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653324316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwwmKnG1Bfi/vSH1ICA8r7FXR8UZv+2DgOUKXhEQrUA=;
 b=DbNUbxpkZqQDqZYg2naDdRPfW66Az4d8QZGaiTPgMnep086qry7cDrxllY5TRTaQa6VOtn
 BB9WikcUNQaLKpwWR/nWK4K4OtHjz3xMfn9YLkvw0Vq5m07GoEUDPwPi4tkskNRrpardXW
 oZWLbiscxzZbtVYxitWELACitWvGwbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-a9MM45XTOQWX_bUYTRZJyQ-1; Mon, 23 May 2022 12:45:12 -0400
X-MC-Unique: a9MM45XTOQWX_bUYTRZJyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEEBC8039D7;
 Mon, 23 May 2022 16:45:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7224D2026D6A;
 Mon, 23 May 2022 16:45:10 +0000 (UTC)
Date: Mon, 23 May 2022 17:45:09 +0100
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
Message-ID: <You6FburTi7gVyxy@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <YouFzbBNu9sox+1m@redhat.com>
 <YouknD0sNvQdIgBL@stefanha-x1.localdomain>
 <Youwp6HeGXhOhB41@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FUa+Hh+FHcSL3+Kp"
Content-Disposition: inline
In-Reply-To: <Youwp6HeGXhOhB41@redhat.com>
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


--FUa+Hh+FHcSL3+Kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 06:04:55PM +0200, Kevin Wolf wrote:
> Am 23.05.2022 um 17:13 hat Stefan Hajnoczi geschrieben:
> > On Mon, May 23, 2022 at 03:02:05PM +0200, Kevin Wolf wrote:
> > > Am 22.05.2022 um 17:06 hat Stefan Hajnoczi geschrieben:
> > > > Hi,
> > > > Sorry for the long email. I've included three topics that may help =
us discuss
> > > > draining and AioContext removal further.
> > > >=20
> > > > The shortcomings of drain
> > > > -------------------------
> > > > I wanted to explore the logical argument that making graph modifica=
tions within
> > > > a drained section is correct:
> > > > - Graph modifications and BB/BDS lookup are Global State (GS).
> > > > - Graph traversal from a BB/BDS pointer is IO.
> > > > - Only one thread executes GS code at a time.
> > > > - IO is quiesced within a drained section.
> > >=20
> > > I think you're mixing two things here and calling both of them IO.
> > >=20
> > > If a function is marked as IO, that means that it is safe to call from
> > > I/O requests, which may be running in any iothread (they currently on=
ly
> > > run in the home thread of the node's AioContext, but the function
> > > annotations already promise that any thread is safe).
> > >=20
> > > However, if a function is marked as IO, this doesn't necessarily mean
> > > that it is always only called in the context of an I/O request. It can
> > > be called by any other code, too.
> > >=20
> > > So while drain does quiesce all I/O requests, this doesn't mean that
> > > functions marked as IO won't run any more.
> >=20
> > My model is that between bdrv_drained_begin() and bdrv_drained_end()
> > only the caller is allowed to invoke BB/BDS functions (including
> > functions marked IO).
>=20
> Okay, this sounds better. It's not actually related to IO/GS, but to
> BB/BDS functions, including both IO and GS functions.
>=20
> So graph traversal from a BB/BDS pointer makes it a BB/BDS function, and
> BB/BDS functions need to be quiesced within a drained section.
>=20
> > The caller isn't strictly one thread and one or no coroutines. The
> > caller could use threads and coroutines, but the important thing is
> > that everything else that accesses the BB/BDS is suspended due to
> > .drained_begin() callbacks (and is_external).
> >=20
> > So when you say a function marked IO can be called from outside an I/O
> > request, that "outside an I/O request" code must be quiesced too.
> > Otherwise drain is definitely not safe for graph modifications.
>=20
> If you phrase it as a condition and as a goal to achieve, then I agree
> that this is required when you want to use drain for locking.
>=20
> My impression was that you were using this to argue that the code is
> already doing this and is already safe in this scenario, and this isn't
> true. I think I misunderstood you there and you were really describing
> the future state that you're envisioning.

Sorry, I didn't present it clearly. I'm trying to think through the
model needed to make graph modifications under drain safe.

> > > > - Therefore a drained section in GS code suspends graph traversal, =
other graph
> > > >   modifications, and BB/BDS lookup.
> > > > - Therefore it is safe to modify the graph from a GS drained sectio=
n.
> > >=20
> > > So unfortunately, I don't think this conclusion is correct.
> > >=20
> > > In order to make your assumption true, we would have to require that =
all
> > > callers of IO functions must have called bdrv_inc_in_flight(). We wou=
ld
> > > also have to find a way to enforce this preferable at compile time or
> > > with static analysis, or at least with runtime assertions, because it
> > > would be very easy to get wrong.
> >=20
> > Or that they are quiesced by .drained_begin() callbacks or is_external.
> >=20
> > Do you have a concrete example?
>=20
> Yes, you're right, bdrv_inc_in_flight() is only one way to achieve this.
> They just need to make bdrv_drain_poll() return true as long as they are
> active so that bdrv_drained_begin() waits for them. .drained_poll() is
> another valid way to achieve this.
>=20
> However, if we want to rely on static analysis to verify that everything
> is covered, always requiring bdrv_inc_in_flight() might make this
> easier. So possibly we want to require it even in cases where
> .drained_poll() or aio_disable_external() would be enough in theory.
>=20
> > >=20
> > > > However, I hit on a problem that I think Emanuele and Paolo have al=
ready
> > > > pointed out: draining is GS & IO. This might have worked under the =
1 IOThread
> > > > model but it does not make sense for multi-queue. It is possible to=
 submit I/O
> > > > requests in drained sections. How can multiple threads be in draine=
d sections
> > > > simultaneously and possibly submit further I/O requests in their dr=
ained
> > > > sections? Those sections wouldn't be "drained" in any useful sense =
of the word.
> > >=20
> > > Drains asks other users not to touch the block node. Currently this o=
nly
> >=20
> > BTW interesting language choice here: you're using the more general
> > definition of "other users" and "touch[ing] the block node" rather than
> > the narrow definition of just "I/O requests". That's exactly how I think
> > of drain but based on what you wrote above I'm not sure that's how you
> > think of it too?
>=20
> I hope that my reply above made it clearer: The broader definition is
> what is needed if we want to use drain to replace the AioContext lock
> for protecting the graph, but the narrow definition is what is
> implemented today.

Okay.

> > > includes, but the desire to use drain for locking means that we need =
to
> > > extend it to pretty much any operation on the node, which would inclu=
de
> > > calling drain on that block node. So you should never have two callers
> > > in a drain section at the same time, it would be a bug in this model.
> >=20
> > Yes! Drain in its current form doesn't make sense for multi-queue since
> > multiple threads could be in drained sections at the same time and they
> > would all be allowed to submit new I/O requests.
>=20
> Nobody would be allowed to submit new requests (because someone else has
> drained the node), but they would do so anyway. ;-)
>=20
> Actually, only half joking, because this shows how weak the protection
> by drain is if we don't have a way to verify that the whole codebase
> supports drain correctly.
>=20
> > > Of course, we know that currently drain is not respected by all relev=
ant
> > > callers (most importantly, the monitor). If you want to use drain as a
> > > form of locking, you need to solve this first.
> > >=20
> > > > It is necessary to adjust how recursive drained sections work:
> > > > bdrv_drained_begin() must not return while there are deeper nested =
drained
> > > > sections.
> > > >=20
> > > > This is allowed:
> > > >=20
> > > >      Monitor command            Block job
> > > >      ---------------            ---------
> > > >   > bdrv_drained_begin()
> > > >            .                 > bdrv_drained_begin()
> > > >            .                 < bdrv_drained_begin()
> > > >            .                          .
> > > >            .                          .
> > > >            .                 > bdrv_drained_end()
> > > >            .                 < bdrv_drained_end()
> > > >   < bdrv_drained_begin()
> > > >            .
> > > >            .
> > > >   > bdrv_drained_end()
> > > >   < bdrv_drained_end()
> > >=20
> > > Just to make sure I understand the scenario that you have in mind her=
e:
> > > The monitor command is not what causes the block job to do the draini=
ng
> > > because this is inside bdrv_drained_begin(), so the block job just
> > > randomly got a callback that caused it to do so (maybe completion)?
> >=20
> > Yes, exactly that completion scenario. When the mirror block job
> > completes exactly when a monitor command calls bdrv_drained_begin(),
> > mirror_exit_common() deletes a temporary filter BDS node. It involves
> > drain and modifies the graph.
> >=20
> > >=20
> > > Before bdrv_drained_begin() returns, anything is still allowed to run,
> > > so I agree that this is valid.
> >=20
> > Thanks for confirming!
> >=20
> > > > This is not allowed:
> > > >=20
> > > >      Monitor command            Block job
> > > >      ---------------            ---------
> > > >   > bdrv_drained_begin()
> > > >            .                 > bdrv_drained_begin()
> > > >            .                 < bdrv_drained_begin()
> > > >            .                          .
> > > >            .                          .
> > > >   < bdrv_drained_begin()              .
> > > >            .                          .
> > > >            .                 > bdrv_drained_end()
> > > >            .                 < bdrv_drained_end()
> > > >   > bdrv_drained_end()
> > > >   < bdrv_drained_end()
> > > >=20
> > > > This restriction creates an ordering between bdrv_drained_begin() c=
allers. In
> > > > this example the block job must not depend on the monitor command c=
ompleting
> > > > first. Otherwise there would be a deadlock just like with two threa=
ds wait for
> > > > each other while holding a mutex.
> > >=20
> > > So essentially drain needs to increase bs->in_flight, so that the out=
er
> > > drain has to wait for the inner drain section to end before its
> > > bdrv_drained_begin() can return.
> > >=20
> > > > For sanity I think draining should be GS-only. IO code should not i=
nvoke
> > > > bdrv_drained_begin() to avoid ordering problems when multiple threa=
ds drain
> > > > simultaneously and have dependencies on each other.
> > > >=20
> > > > block/mirror.c needs to be modified because it currently drains fro=
m IO when
> > > > mirroring is about to end.
> > > >=20
> > > > With this change to draining I think the logical argument for corre=
ctness with
> > > > graph modifications holds.
> > >=20
> > > What is your suggestion how to modify mirror? It drains so that no new
> > > requests can sneak in and source and target stay in sync while it
> > > switches to the completion code running in the main AioContext. You
> > > can't just drop this.
> >=20
> > I haven't read the code in enough depth to come up with a solution.
>=20
> So this sounds like it needs more thought before we can assume that
> we'll have a final state where drain is GS-only.

I will look into solutions for mirror but it might be a few days before
I have time.

> > >=20
> > > > Enforcing GS/IO separation at compile time
> > > > ------------------------------------------
> > > > Right now GS/IO asserts check assumptions at runtime. The next step=
 may be
> > > > using the type system to separate GS and IO APIs so it's impossible=
 for IO code
> > > > to accidentally call GS code, for example.
> > > >=20
> > > >   typedef struct {
> > > >       BlockDriverState *bs;
> > > >   } BlockDriverStateIOPtr;
> > > >=20
> > > >   typedef struct {
> > > >       BlockDriverState *bs;
> > > >   } BlockDriverStateGSPtr;
> > > >=20
> > > > Then APIs can be protected as follows:
> > > >=20
> > > >   void bdrv_set_aio_context_ignore(BlockDriverStateGSPtr bs, ...);
> > > >=20
> > > > A function that only has a BlockDriverStateIOPtr cannot call
> > > > bdrv_set_aio_context_ignore() by mistake since the compiler will co=
mplain that
> > > > the first argument must be a BlockDriverStateGSPtr.
> > >=20
> > > And then you have a set of functions that cast from GS to IO pointers,
> > > but not for the other way around? Or maybe getting as IO pointer would
> > > even be coupled with automatically increasing bs->in_flight?
> > >=20
> > > The other option that we were looking into for this was static analys=
is.
> > > I had hacked up a small script to check consistency of these annotati=
ons
> > > (without covering function pointers, though) to help me with the revi=
ew
> > > of Emanuele's patches that introduced them. If I understand correctly,
> > > Paolo has scripts to do the same a little bit better.
> > >=20
> > > As long as we can integrate such a script in 'make check', we wouldn't
> > > necessarily have to have the churn in the C code to switch everything=
 to
> > > new wrapper types.
> >=20
> > Yes, that's the problem with the typedef Ptr approach. It would involve
> > a lot of code changes. Maybe static analysis tools are better.
> >=20
> > >=20
> > > > Possible steps for AioContext removal
> > > > -------------------------------------
> > > > I also wanted to share my assumptions about multi-queue and AioCont=
ext removal.
> > > > Please let me know if anything seems wrong or questionable:
> > > >=20
> > > > - IO code can execute in any thread that has an AioContext.
> > > > - Multiple threads may execute a IO code at the same time.
> > > > - GS code only execute under the BQL.
> > > >=20
> > > > For AioContext removal this means:
> > > >=20
> > > > - bdrv_get_aio_context() becomes mostly meaningless since there is =
no need for
> > > >   a special "home" AioContext.
> > > > - bdrv_coroutine_enter() becomes mostly meaningless because there i=
s no need to
> > > >   run a coroutine in the BDS's AioContext.
> > > > - aio_disable_external(bdrv_get_aio_context(bs)) no longer works be=
cause many
> > > >   threads/AioContexts may submit new I/O requests. BlockDevOps.drai=
ned_begin()
> > > >   may be used instead (e.g. to temporarily disable ioeventfds on a =
multi-queue
> > > >   virtio-blk device).
> > > > - AIO_WAIT_WHILE() simplifies to
> > > >=20
> > > >     while ((cond)) {
> > > >         aio_poll(qemu_get_current_aio_context(), true);
> > > >         ...
> > > >     }
> > >=20
> > > Probably not exactly, because you still need aio_wait_kick() to wake =
up
> > > the thread. We use AioWait.num_waiters !=3D 0 to decide whether we ne=
ed to
> > > schedule a BH in the main thread (because doing so unconditionally for
> > > every completed request would be very wasteful).
> > >=20
> > > If you want to be able to run this loop from any thread instead of ju=
st
> > > the main thread, you would have to store somewhere which thread to wa=
ke.
> >=20
> > qemu_cond_broadcast() can be used since the wakeup is a slow path.
>=20
> I don't think we have a QemuCond for waking up a blocking aio_poll()?
> Doesn't this usually involve writing to the event notifier file
> descriptor of the specific AioContext?

You're right, I forgot that the waiter is sitting in their own
aio_poll() so we cannot use qemu_cond_wait(). Another mechanism would be
necessary.

> > > >   and the distinction between home AioContext and non-home context =
is
> > > >   eliminated. AioContext unlocking is dropped.
> > > >=20
> > > > Does this make sense? I haven't seen these things in recent patch s=
eries.
> > >=20
> > > Intuitively I would agree with most. There may be details that I'm not
> > > aware of at the moment. I'm not surprised that we haven't seen any su=
ch
> > > things in recent patch series because there is an awful lot of
> > > preparational work to be done before we can reach this final state.
> >=20
> > Yes. I'm mostly hoping to find out whether my view in fundamentally
> > flawed or very different from what you and others think.
>=20
> No, not fundamentally.
>=20
> The big challenge in my mind is how to verify that the conditions are
> actually met. I'm fairly sure that using drain this way is by far too
> complex to rely on review only.

I agree there needs to some kind of automated checker because relying on
code review won't work.

Stefan

--FUa+Hh+FHcSL3+Kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKLuhUACgkQnKSrs4Gr
c8jVhAf/UfWaYY2VWw8J1VDovx4rkzSGOXAcWb/UR3nPd8eAzrjfl4oGBYIFMHXy
89aQ2Y23KOkY6MW6Nxg6RfECmQhlv/lNOGxrYEUvY+bO5cjcLC+/usq0ZsKxAIX7
7fGCiSpQ5dqkriJ5/TlMZJDbppsCPaBrM3txhneeWhyAk4z8sI0k14w3wgTxZ9Vz
WHVO9/kypmfIoJvXQw3qNBY3rMK4ML/HZzLZDvia3Y7PDbJ395iMZdVnTL90Q6ke
o8LjxiU8FCMxSZONk1eKCZ+RnaGWp5b4MDIyxh5dE8A1Xfnw8dV739AhCs0LYvfh
kQW+8P6QDWGogH/nOdm+xFcygBmXBA==
=ab4i
-----END PGP SIGNATURE-----

--FUa+Hh+FHcSL3+Kp--


