Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785453056A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 21:20:35 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsr7y-0004qW-6T
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 15:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nsqCg-0000wq-90
 for qemu-devel@nongnu.org; Sun, 22 May 2022 14:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nsqCc-00045g-JJ
 for qemu-devel@nongnu.org; Sun, 22 May 2022 14:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653243676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pm/RkB+pCyRAJxbLjF01swK03hQqe7NL3b05VmIRHbQ=;
 b=iJ55/77M2JZfHAf//WW4Vp2EXcTjKuXpRmCiciX2pRoXfH+Czmnrx+F9GIxZ/9sLUScmVW
 Vh207eVEc+b0d/izhzPfBWCTEiubvAhCweRGLG8js44gm3a6S3G+uTbko4OOrNoNdL8Gkv
 Eae28DGkeaMP3ChINV3fEWYtXTt756Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-5A3XzL_LPYmCZXHG7nKxWQ-1; Sun, 22 May 2022 14:21:14 -0400
X-MC-Unique: 5A3XzL_LPYmCZXHG7nKxWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A54F85A5AA;
 Sun, 22 May 2022 18:21:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC4C7492C3B;
 Sun, 22 May 2022 18:21:13 +0000 (UTC)
Date: Sun, 22 May 2022 16:06:34 +0100
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
Message-ID: <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1BS5V72QdcdBPKdK"
Content-Disposition: inline
In-Reply-To: <YoUbWYfl0Bft3LiU@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1BS5V72QdcdBPKdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 06:14:17PM +0200, Kevin Wolf wrote:
> Am 18.05.2022 um 14:43 hat Paolo Bonzini geschrieben:
> > On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
> > > For example, all callers of bdrv_open() always take the AioContext lo=
ck.
> > > Often it is taken very high in the call stack, but it's always taken.
> >=20
> > I think it's actually not a problem of who takes the AioContext lock or
> > where; the requirements are contradictory:
> >=20
> > * IO_OR_GS_CODE() functions, when called from coroutine context, expect=
 to
> > be called with the AioContext lock taken (example: bdrv_co_yield_to_dra=
in)
> >=20
> > * to call these functions with the lock taken, the code has to run in t=
he
> > BDS's home iothread.  Attempts to do otherwise results in deadlocks (the
> > main loop's AIO_WAIT_WHILEs expect progress from the iothread, that can=
not
> > happen without releasing the aiocontext lock)
> >=20
> > * running the code in the BDS's home iothread is not possible for
> > GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main
> > thread, but that cannot be guaranteed in general)
> >=20
> > > We might suppose that many callbacks are called under drain and in
> > > GLOBAL_STATE, which should be enough, but from our experimentation in
> > > the previous series we saw that currently not everything is under dra=
in,
> > > leaving some operations unprotected (remember assert_graph_writable
> > > temporarily disabled, since drain coverage for bdrv_replace_child_nop=
erm
> > > was not 100%?).
> > > Therefore we need to add more drains. But isn't drain what we decided=
 to
> > > drop at the beginning? Why isn't drain good?
> >=20
> > To sum up the patch ordering deadlock that we have right now:
> >=20
> > * in some cases, graph manipulations are protected by the AioContext lo=
ck
> >=20
> > * eliminating the AioContext lock is needed to move callbacks to corout=
ine
> > contexts (see above for the deadlock scenario)
> >=20
> > * moving callbacks to coroutine context is needed by the graph rwlock
> > implementation
> >=20
> > On one hand, we cannot protect the graph across manipulations with a gr=
aph
> > rwlock without removing the AioContext lock; on the other hand, the
> > AioContext lock is what _right now_ protects the graph.
> >=20
> > So I'd rather go back to Emanuele's draining approach.  It may not be
> > beautiful, but it allows progress.  Once that is in place, we can remov=
e the
> > AioContext lock (which mostly protects virtio-blk/virtio-scsi code right
> > now) and reevaluate our next steps.
>=20
> If we want to use drain for locking, we need to make sure that drain
> actually does the job correctly. I see two major problems with it:
>=20
> The first one is that drain only covers I/O paths, but we need to
> protect against _anything_ touching block nodes. This might mean a
> massive audit and making sure that everything in QEMU that could
> possibly touch a block node is integrated with drain.
>=20
> I think Emanuele has argued before that because writes to the graph only
> happen in the main thread and we believe that currently only I/O
> requests are processed in iothreads, this is safe and we don't actually
> need to audit everything.
>=20
> This is true as long as the assumption holds true (how do we ensure that
> nobody ever introduces non-I/O code touching a block node in an
> iothread?) and as long as the graph writer never yields or polls. I
> think the latter condition is violated today, a random example is that
> adjusting drain counts in bdrv_replace_child_noperm() does poll. Without
> cooperation from all relevant places, the effectively locked code
> section ends right there, even if the drained section continues. Even if
> we can fix this, verifying that the conditions are met everywhere seems
> not trivial.
>=20
> And that's exactly my second major concern: Even if we manage to
> correctly implement things with drain, I don't see a way to meaningfully
> review it. I just don't know how to verify with some confidence that
> it's actually correct and covering everything that needs to be covered.
>=20
> Drain is not really a lock. But if you use it as one, the best it can
> provide is advisory locking (callers, inside and outside the block
> layer, need to explicitly support drain instead of having the lock
> applied somewhere in the block layer functions). And even if all
> relevant pieces actually make use of it, it still has an awkward
> interface for locking:
>=20
> /* Similar to rdlock(), but doesn't wait for writers to finish. It is
>  * the callers responsibility to make sure that there are no writers. */
> bdrv_inc_in_flight()
>=20
> /* Similar to wrlock(). Waits for readers to finish. New readers are not
>  * prevented from starting after it returns. Third parties are politely
>  * asked not to touch the block node while it is drained. */
> bdrv_drained_begin()
>=20
> (I think the unlock counterparts actually behave as expected from a real
> lock.)
>=20
> Having an actual rdlock() (that waits for writers), and using static
> analysis to verify that all relevant places use it (so that wrlock()
> doesn't rely on politely asking third parties to leave the node alone)
> gave me some confidence that we could verify the result.
>=20
> I'm not sure at all how to achieve the same with the drain interface. In
> theory, it's possible. But it complicates the conditions so much that
> I'm pretty much sure that the review wouldn't only be very time
> consuming, but I would make mistakes during the review, rendering it
> useless.
>=20
> Maybe throwing some more static analysis on the code can help, not sure.
> It's going to be a bit more complex than with the other approach,
> though.

Hi,
Sorry for the long email. I've included three topics that may help us discu=
ss
draining and AioContext removal further.

The shortcomings of drain
-------------------------
I wanted to explore the logical argument that making graph modifications wi=
thin
a drained section is correct:
- Graph modifications and BB/BDS lookup are Global State (GS).
- Graph traversal from a BB/BDS pointer is IO.
- Only one thread executes GS code at a time.
- IO is quiesced within a drained section.
- Therefore a drained section in GS code suspends graph traversal, other gr=
aph
  modifications, and BB/BDS lookup.
- Therefore it is safe to modify the graph from a GS drained section.

However, I hit on a problem that I think Emanuele and Paolo have already
pointed out: draining is GS & IO. This might have worked under the 1 IOThre=
ad
model but it does not make sense for multi-queue. It is possible to submit =
I/O
requests in drained sections. How can multiple threads be in drained sectio=
ns
simultaneously and possibly submit further I/O requests in their drained
sections? Those sections wouldn't be "drained" in any useful sense of the w=
ord.

It is necessary to adjust how recursive drained sections work:
bdrv_drained_begin() must not return while there are deeper nested drained
sections.

This is allowed:

     Monitor command            Block job
     ---------------            ---------
  > bdrv_drained_begin()
           .                 > bdrv_drained_begin()
           .                 < bdrv_drained_begin()
           .                          .
           .                          .
           .                 > bdrv_drained_end()
           .                 < bdrv_drained_end()
  < bdrv_drained_begin()
           .
           .
  > bdrv_drained_end()
  < bdrv_drained_end()

This is not allowed:

     Monitor command            Block job
     ---------------            ---------
  > bdrv_drained_begin()
           .                 > bdrv_drained_begin()
           .                 < bdrv_drained_begin()
           .                          .
           .                          .
  < bdrv_drained_begin()              .
           .                          .
           .                 > bdrv_drained_end()
           .                 < bdrv_drained_end()
  > bdrv_drained_end()
  < bdrv_drained_end()

This restriction creates an ordering between bdrv_drained_begin() callers. =
In
this example the block job must not depend on the monitor command completing
first. Otherwise there would be a deadlock just like with two threads wait =
for
each other while holding a mutex.

For sanity I think draining should be GS-only. IO code should not invoke
bdrv_drained_begin() to avoid ordering problems when multiple threads drain
simultaneously and have dependencies on each other.

block/mirror.c needs to be modified because it currently drains from IO when
mirroring is about to end.

With this change to draining I think the logical argument for correctness w=
ith
graph modifications holds.

Enforcing GS/IO separation at compile time
------------------------------------------
Right now GS/IO asserts check assumptions at runtime. The next step may be
using the type system to separate GS and IO APIs so it's impossible for IO =
code
to accidentally call GS code, for example.

  typedef struct {
      BlockDriverState *bs;
  } BlockDriverStateIOPtr;

  typedef struct {
      BlockDriverState *bs;
  } BlockDriverStateGSPtr;

Then APIs can be protected as follows:

  void bdrv_set_aio_context_ignore(BlockDriverStateGSPtr bs, ...);

A function that only has a BlockDriverStateIOPtr cannot call
bdrv_set_aio_context_ignore() by mistake since the compiler will complain t=
hat
the first argument must be a BlockDriverStateGSPtr.

Possible steps for AioContext removal
-------------------------------------
I also wanted to share my assumptions about multi-queue and AioContext remo=
val.
Please let me know if anything seems wrong or questionable:

- IO code can execute in any thread that has an AioContext.
- Multiple threads may execute a IO code at the same time.
- GS code only execute under the BQL.

For AioContext removal this means:

- bdrv_get_aio_context() becomes mostly meaningless since there is no need =
for
  a special "home" AioContext.
- bdrv_coroutine_enter() becomes mostly meaningless because there is no nee=
d to
  run a coroutine in the BDS's AioContext.
- aio_disable_external(bdrv_get_aio_context(bs)) no longer works because ma=
ny
  threads/AioContexts may submit new I/O requests. BlockDevOps.drained_begi=
n()
  may be used instead (e.g. to temporarily disable ioeventfds on a multi-qu=
eue
  virtio-blk device).
- AIO_WAIT_WHILE() simplifies to

    while ((cond)) {
        aio_poll(qemu_get_current_aio_context(), true);
        ...
    }

  and the distinction between home AioContext and non-home context is
  eliminated. AioContext unlocking is dropped.

Does this make sense? I haven't seen these things in recent patch series.

Stefan

--1BS5V72QdcdBPKdK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKKUXoACgkQnKSrs4Gr
c8hR5Qf8DDjifSAHDuEhEXWz+LuLoNUVgXpX1co6goxumku7kTvJBOZ+6vhEN3SC
La9MB1Sq14g5aGw+do+fAwqxr4txEPlCz/kuhH08pqHy3rBg9VzADk74Erg//yL/
C/84WRcsO+bhlNGuKkxYV02Gb3l/47RZbj7mLtMDNrgwdCvD8YFkdCXnjwXQKKq1
PEASNeXWyXkwTk41Eo2gCh8MTkkgZ6VL7GQBuyz+kxu4PC3nsEsS+qVFOOxJtKZE
lBAwl9fEaaaJIrhmMcQntO4BHg8om+4GApMgLlYIybYIbpS3k1IZIDjjR7fL2ATB
1mm+ukZRHUkLDnWd29nhrbqo72WrMQ==
=fgb5
-----END PGP SIGNATURE-----

--1BS5V72QdcdBPKdK--


