Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E39530F97
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:18:54 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7xV-0007gf-Eh
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt7uc-0006kM-MU
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nt7uT-00057F-MG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653311745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GzM5nPpqsDhVVHaACgX0S+nX5YEzcRU4dBVLbVXI0NU=;
 b=dTXupO/hNRYm3EZ75C3GBWG2Mx5G0hAzLzVhtw70Mvyqe5vuzhYT2MF6xMCu5U63FNjMmF
 LulvgN7KLPQt/SeLFeEL5xLS+CvkHNZVDkV6azm5a5I2nhcAWgdmPAlNTc5JAACzg4tFn/
 gs0nH8SaejVAzWUUtDsrrioUy083tzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-P5gM-YzmMnWMv5-WyLnX9g-1; Mon, 23 May 2022 09:15:40 -0400
X-MC-Unique: P5gM-YzmMnWMv5-WyLnX9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 141ED85A5B5;
 Mon, 23 May 2022 13:15:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6730540C1438;
 Mon, 23 May 2022 13:15:39 +0000 (UTC)
Date: Mon, 23 May 2022 14:15:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YouI+eI+cbUFZt6x@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <c5dd0db5-9108-1137-cfc8-7137f5658da9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZvyV5DFr5sCUd6qQ"
Content-Disposition: inline
In-Reply-To: <c5dd0db5-9108-1137-cfc8-7137f5658da9@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZvyV5DFr5sCUd6qQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 23, 2022 at 10:48:48AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 22/05/2022 um 17:06 schrieb Stefan Hajnoczi:
> > On Wed, May 18, 2022 at 06:14:17PM +0200, Kevin Wolf wrote:
> >> Am 18.05.2022 um 14:43 hat Paolo Bonzini geschrieben:
> >>> On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
> >>>> For example, all callers of bdrv_open() always take the AioContext l=
ock.
> >>>> Often it is taken very high in the call stack, but it's always taken.
> >>>
> >>> I think it's actually not a problem of who takes the AioContext lock =
or
> >>> where; the requirements are contradictory:
> >>>
> >>> * IO_OR_GS_CODE() functions, when called from coroutine context, expe=
ct to
> >>> be called with the AioContext lock taken (example: bdrv_co_yield_to_d=
rain)
> >>>
> >>> * to call these functions with the lock taken, the code has to run in=
 the
> >>> BDS's home iothread.  Attempts to do otherwise results in deadlocks (=
the
> >>> main loop's AIO_WAIT_WHILEs expect progress from the iothread, that c=
annot
> >>> happen without releasing the aiocontext lock)
> >>>
> >>> * running the code in the BDS's home iothread is not possible for
> >>> GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the ma=
in
> >>> thread, but that cannot be guaranteed in general)
> >>>
> >>>> We might suppose that many callbacks are called under drain and in
> >>>> GLOBAL_STATE, which should be enough, but from our experimentation in
> >>>> the previous series we saw that currently not everything is under dr=
ain,
> >>>> leaving some operations unprotected (remember assert_graph_writable
> >>>> temporarily disabled, since drain coverage for bdrv_replace_child_no=
perm
> >>>> was not 100%?).
> >>>> Therefore we need to add more drains. But isn't drain what we decide=
d to
> >>>> drop at the beginning? Why isn't drain good?
> >>>
> >>> To sum up the patch ordering deadlock that we have right now:
> >>>
> >>> * in some cases, graph manipulations are protected by the AioContext =
lock
> >>>
> >>> * eliminating the AioContext lock is needed to move callbacks to coro=
utine
> >>> contexts (see above for the deadlock scenario)
> >>>
> >>> * moving callbacks to coroutine context is needed by the graph rwlock
> >>> implementation
> >>>
> >>> On one hand, we cannot protect the graph across manipulations with a =
graph
> >>> rwlock without removing the AioContext lock; on the other hand, the
> >>> AioContext lock is what _right now_ protects the graph.
> >>>
> >>> So I'd rather go back to Emanuele's draining approach.  It may not be
> >>> beautiful, but it allows progress.  Once that is in place, we can rem=
ove the
> >>> AioContext lock (which mostly protects virtio-blk/virtio-scsi code ri=
ght
> >>> now) and reevaluate our next steps.
> >>
> >> If we want to use drain for locking, we need to make sure that drain
> >> actually does the job correctly. I see two major problems with it:
> >>
> >> The first one is that drain only covers I/O paths, but we need to
> >> protect against _anything_ touching block nodes. This might mean a
> >> massive audit and making sure that everything in QEMU that could
> >> possibly touch a block node is integrated with drain.
> >>
> >> I think Emanuele has argued before that because writes to the graph on=
ly
> >> happen in the main thread and we believe that currently only I/O
> >> requests are processed in iothreads, this is safe and we don't actually
> >> need to audit everything.
> >>
> >> This is true as long as the assumption holds true (how do we ensure th=
at
> >> nobody ever introduces non-I/O code touching a block node in an
> >> iothread?) and as long as the graph writer never yields or polls. I
> >> think the latter condition is violated today, a random example is that
> >> adjusting drain counts in bdrv_replace_child_noperm() does poll. Witho=
ut
> >> cooperation from all relevant places, the effectively locked code
> >> section ends right there, even if the drained section continues. Even =
if
> >> we can fix this, verifying that the conditions are met everywhere seems
> >> not trivial.
> >>
> >> And that's exactly my second major concern: Even if we manage to
> >> correctly implement things with drain, I don't see a way to meaningful=
ly
> >> review it. I just don't know how to verify with some confidence that
> >> it's actually correct and covering everything that needs to be covered.
> >>
> >> Drain is not really a lock. But if you use it as one, the best it can
> >> provide is advisory locking (callers, inside and outside the block
> >> layer, need to explicitly support drain instead of having the lock
> >> applied somewhere in the block layer functions). And even if all
> >> relevant pieces actually make use of it, it still has an awkward
> >> interface for locking:
> >>
> >> /* Similar to rdlock(), but doesn't wait for writers to finish. It is
> >>  * the callers responsibility to make sure that there are no writers. =
*/
> >> bdrv_inc_in_flight()
> >>
> >> /* Similar to wrlock(). Waits for readers to finish. New readers are n=
ot
> >>  * prevented from starting after it returns. Third parties are politely
> >>  * asked not to touch the block node while it is drained. */
> >> bdrv_drained_begin()
> >>
> >> (I think the unlock counterparts actually behave as expected from a re=
al
> >> lock.)
> >>
> >> Having an actual rdlock() (that waits for writers), and using static
> >> analysis to verify that all relevant places use it (so that wrlock()
> >> doesn't rely on politely asking third parties to leave the node alone)
> >> gave me some confidence that we could verify the result.
> >>
> >> I'm not sure at all how to achieve the same with the drain interface. =
In
> >> theory, it's possible. But it complicates the conditions so much that
> >> I'm pretty much sure that the review wouldn't only be very time
> >> consuming, but I would make mistakes during the review, rendering it
> >> useless.
> >>
> >> Maybe throwing some more static analysis on the code can help, not sur=
e.
> >> It's going to be a bit more complex than with the other approach,
> >> though.
> >=20
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
> > - Therefore a drained section in GS code suspends graph traversal, othe=
r graph
> >   modifications, and BB/BDS lookup.
> > - Therefore it is safe to modify the graph from a GS drained section.
> >=20
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
> >=20
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
> >=20
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
> >=20
> > For sanity I think draining should be GS-only. IO code should not invoke
> > bdrv_drained_begin() to avoid ordering problems when multiple threads d=
rain
> > simultaneously and have dependencies on each other.
> >=20
> > block/mirror.c needs to be modified because it currently drains from IO=
 when
> > mirroring is about to end.
>=20
> Yes, mirror seems to be the only clear place where draining is performed
> from IO, namely in mirror_run. It's also a little bit weird because just
> drained_begin is invoked from IO, while drained_end is in the main loop.
>=20
> If I understand correctly, the reason for that is that we want to
> prevent bdrv_get_dirty_count to be modified (ie that additional
> modifications come) after we just finished mirroring.
>=20
> Not sure how to deal with this though.

I don't know the code so I don't have a concrete solution in mind.

> >=20
> > With this change to draining I think the logical argument for correctne=
ss with
> > graph modifications holds.
> >=20
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
> What about functions that do not need a BlockDriverState *, and for
> example they use BdrvChild? I would assume that we need to replicate it
> also for that.
>=20
> And what about GS & IO functions? Not only drain, but also all the
> generated_co_wrapper should be GS & IO.

What is the meaning of GS & IO in a multi-queue world? I guess it's
effectively IO except it's well-behaved if called with the BQL held?

>=20
> >=20
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
>=20
> Makes sense
>=20
> > - bdrv_coroutine_enter() becomes mostly meaningless because there is no=
 need to
> >   run a coroutine in the BDS's AioContext.
>=20
> Why is there no need?

The coroutine can execute in the current thread since the BDS must be
thread-safe.

If bdrv_coroutine_enter() is used in cases like block jobs to mean "run
in the same AioContext as the job coroutine" then the code should
probably be changed to explicitly use the job AioContext instead of the
more vague BDS AioContext.

> > - aio_disable_external(bdrv_get_aio_context(bs)) no longer works becaus=
e many
> >   threads/AioContexts may submit new I/O requests. BlockDevOps.drained_=
begin()
> >   may be used instead (e.g. to temporarily disable ioeventfds on a mult=
i-queue
> >   virtio-blk device).
>=20
> Ok
>=20
> > - AIO_WAIT_WHILE() simplifies to
> >=20
> >     while ((cond)) {
> >         aio_poll(qemu_get_current_aio_context(), true);
> >         ...
> >     }
> >=20
> >   and the distinction between home AioContext and non-home context is
> >   eliminated. AioContext unlocking is dropped.
>=20
> I guess this implies no coroutine in BDS's AioContext.

I'm not sure what you mean but coroutines accessing the BDS can run in
any AioContext with multi-queue. If they have any locking requirements
amongst each other then that should be explicit instead of just throwing
them all into the BDS AioContext.

> >=20
> > Does this make sense? I haven't seen these things in recent patch serie=
s.
>=20
> You haven't seen them because there's no way to do it if we don't even
> agree on what to replace the AioContext lock with.
> Getting to this point would imply firstly having something (drain,
> rwlock, whatever) together with AioContext, and then gradually remove
> it. At least, that's how I understood it.

What, besides graph modification and the things I listed in this email,
still needs to be untangled from AioContext?

Stefan

--ZvyV5DFr5sCUd6qQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKLiPkACgkQnKSrs4Gr
c8jaEQgAidetdUg/C8NMpTiBrr6xniSxNEEPCiipSrqjzjs5pxjxb6j1G+z0u5Fh
1fTCRNbE4jIl6StMvIz7PZVfITcUwws+E/RB4syqrMgTf53Ba4rF9vu0oDsWQOwV
gU8roO3+r9DHfTVDkSS3s5uYXdhKhLTOmDoV+nEWVQmb1VWiSAhPbKPWwqwelusx
wc75VKJKW9mKXrA903SJjz6L5kXZGCIqLHfevnXOTroAO1ghHJI5mOwu9B4drR+r
8GmEgGf16uWGu5nfSIgEQ7pp6ZYvHYuMQZgBlx2Ye+2I3uMdiAkWq5LazIpfDbsT
cpBnFaGxU5ppCLMLpFT/qq/rz27qbg==
=6y/K
-----END PGP SIGNATURE-----

--ZvyV5DFr5sCUd6qQ--


