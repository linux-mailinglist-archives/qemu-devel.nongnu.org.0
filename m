Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE6530EC6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:07:53 +0200 (CEST)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7mp-0007r8-Sn
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nt7hp-0004Iw-Q0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nt7hV-00032l-4E
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653310939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wJYOXnZWVXkyMEcZWbpMxex5RJju+MNf7VFW6E3za5c=;
 b=bJJfCqEnCsT+vF6P9emCDMcjzMsdLw44dWU76+R3qfdDdcgosOQkTa4KwmaHpE1xRRN6PE
 a3NaFrpbaee0G+F9BDZ6famDb4WvXS1p5Mr5IruGdApEJ5lI+xLpG53ZmtlinhAeqJZIos
 WW23ubEOggIH22UpSIVqRhTS3DDqW+I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-ezoaHWPDPBWXl-mxBUjtTg-1; Mon, 23 May 2022 09:02:12 -0400
X-MC-Unique: ezoaHWPDPBWXl-mxBUjtTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAA86299E747;
 Mon, 23 May 2022 13:02:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40B5492C14;
 Mon, 23 May 2022 13:02:06 +0000 (UTC)
Date: Mon, 23 May 2022 15:02:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YouFzbBNu9sox+1m@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HfUfpTHX3Ui6RPX1"
Content-Disposition: inline
In-Reply-To: <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HfUfpTHX3Ui6RPX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 22.05.2022 um 17:06 hat Stefan Hajnoczi geschrieben:
> Hi,
> Sorry for the long email. I've included three topics that may help us dis=
cuss
> draining and AioContext removal further.
>=20
> The shortcomings of drain
> -------------------------
> I wanted to explore the logical argument that making graph modifications =
within
> a drained section is correct:
> - Graph modifications and BB/BDS lookup are Global State (GS).
> - Graph traversal from a BB/BDS pointer is IO.
> - Only one thread executes GS code at a time.
> - IO is quiesced within a drained section.

I think you're mixing two things here and calling both of them IO.

If a function is marked as IO, that means that it is safe to call from
I/O requests, which may be running in any iothread (they currently only
run in the home thread of the node's AioContext, but the function
annotations already promise that any thread is safe).

However, if a function is marked as IO, this doesn't necessarily mean
that it is always only called in the context of an I/O request. It can
be called by any other code, too.

So while drain does quiesce all I/O requests, this doesn't mean that
functions marked as IO won't run any more.

> - Therefore a drained section in GS code suspends graph traversal, other =
graph
>   modifications, and BB/BDS lookup.
> - Therefore it is safe to modify the graph from a GS drained section.

So unfortunately, I don't think this conclusion is correct.

In order to make your assumption true, we would have to require that all
callers of IO functions must have called bdrv_inc_in_flight(). We would
also have to find a way to enforce this preferable at compile time or
with static analysis, or at least with runtime assertions, because it
would be very easy to get wrong.

> However, I hit on a problem that I think Emanuele and Paolo have already
> pointed out: draining is GS & IO. This might have worked under the 1 IOTh=
read
> model but it does not make sense for multi-queue. It is possible to submi=
t I/O
> requests in drained sections. How can multiple threads be in drained sect=
ions
> simultaneously and possibly submit further I/O requests in their drained
> sections? Those sections wouldn't be "drained" in any useful sense of the=
 word.

Drains asks other users not to touch the block node. Currently this only
includes, but the desire to use drain for locking means that we need to
extend it to pretty much any operation on the node, which would include
calling drain on that block node. So you should never have two callers
in a drain section at the same time, it would be a bug in this model.

Of course, we know that currently drain is not respected by all relevant
callers (most importantly, the monitor). If you want to use drain as a
form of locking, you need to solve this first.

> It is necessary to adjust how recursive drained sections work:
> bdrv_drained_begin() must not return while there are deeper nested drained
> sections.
>=20
> This is allowed:
>=20
>      Monitor command            Block job
>      ---------------            ---------
>   > bdrv_drained_begin()
>            .                 > bdrv_drained_begin()
>            .                 < bdrv_drained_begin()
>            .                          .
>            .                          .
>            .                 > bdrv_drained_end()
>            .                 < bdrv_drained_end()
>   < bdrv_drained_begin()
>            .
>            .
>   > bdrv_drained_end()
>   < bdrv_drained_end()

Just to make sure I understand the scenario that you have in mind here:
The monitor command is not what causes the block job to do the draining
because this is inside bdrv_drained_begin(), so the block job just
randomly got a callback that caused it to do so (maybe completion)?

Before bdrv_drained_begin() returns, anything is still allowed to run,
so I agree that this is valid.

> This is not allowed:
>=20
>      Monitor command            Block job
>      ---------------            ---------
>   > bdrv_drained_begin()
>            .                 > bdrv_drained_begin()
>            .                 < bdrv_drained_begin()
>            .                          .
>            .                          .
>   < bdrv_drained_begin()              .
>            .                          .
>            .                 > bdrv_drained_end()
>            .                 < bdrv_drained_end()
>   > bdrv_drained_end()
>   < bdrv_drained_end()
>=20
> This restriction creates an ordering between bdrv_drained_begin() callers=
=2E In
> this example the block job must not depend on the monitor command complet=
ing
> first. Otherwise there would be a deadlock just like with two threads wai=
t for
> each other while holding a mutex.

So essentially drain needs to increase bs->in_flight, so that the outer
drain has to wait for the inner drain section to end before its
bdrv_drained_begin() can return.

> For sanity I think draining should be GS-only. IO code should not invoke
> bdrv_drained_begin() to avoid ordering problems when multiple threads dra=
in
> simultaneously and have dependencies on each other.
>=20
> block/mirror.c needs to be modified because it currently drains from IO w=
hen
> mirroring is about to end.
>=20
> With this change to draining I think the logical argument for correctness=
 with
> graph modifications holds.

What is your suggestion how to modify mirror? It drains so that no new
requests can sneak in and source and target stay in sync while it
switches to the completion code running in the main AioContext. You
can't just drop this.

> Enforcing GS/IO separation at compile time
> ------------------------------------------
> Right now GS/IO asserts check assumptions at runtime. The next step may be
> using the type system to separate GS and IO APIs so it's impossible for I=
O code
> to accidentally call GS code, for example.
>=20
>   typedef struct {
>       BlockDriverState *bs;
>   } BlockDriverStateIOPtr;
>=20
>   typedef struct {
>       BlockDriverState *bs;
>   } BlockDriverStateGSPtr;
>=20
> Then APIs can be protected as follows:
>=20
>   void bdrv_set_aio_context_ignore(BlockDriverStateGSPtr bs, ...);
>=20
> A function that only has a BlockDriverStateIOPtr cannot call
> bdrv_set_aio_context_ignore() by mistake since the compiler will complain=
 that
> the first argument must be a BlockDriverStateGSPtr.

And then you have a set of functions that cast from GS to IO pointers,
but not for the other way around? Or maybe getting as IO pointer would
even be coupled with automatically increasing bs->in_flight?

The other option that we were looking into for this was static analysis.
I had hacked up a small script to check consistency of these annotations
(without covering function pointers, though) to help me with the review
of Emanuele's patches that introduced them. If I understand correctly,
Paolo has scripts to do the same a little bit better.

As long as we can integrate such a script in 'make check', we wouldn't
necessarily have to have the churn in the C code to switch everything to
new wrapper types.

> Possible steps for AioContext removal
> -------------------------------------
> I also wanted to share my assumptions about multi-queue and AioContext re=
moval.
> Please let me know if anything seems wrong or questionable:
>=20
> - IO code can execute in any thread that has an AioContext.
> - Multiple threads may execute a IO code at the same time.
> - GS code only execute under the BQL.
>=20
> For AioContext removal this means:
>=20
> - bdrv_get_aio_context() becomes mostly meaningless since there is no nee=
d for
>   a special "home" AioContext.
> - bdrv_coroutine_enter() becomes mostly meaningless because there is no n=
eed to
>   run a coroutine in the BDS's AioContext.
> - aio_disable_external(bdrv_get_aio_context(bs)) no longer works because =
many
>   threads/AioContexts may submit new I/O requests. BlockDevOps.drained_be=
gin()
>   may be used instead (e.g. to temporarily disable ioeventfds on a multi-=
queue
>   virtio-blk device).
> - AIO_WAIT_WHILE() simplifies to
>=20
>     while ((cond)) {
>         aio_poll(qemu_get_current_aio_context(), true);
>         ...
>     }

Probably not exactly, because you still need aio_wait_kick() to wake up
the thread. We use AioWait.num_waiters !=3D 0 to decide whether we need to
schedule a BH in the main thread (because doing so unconditionally for
every completed request would be very wasteful).

If you want to be able to run this loop from any thread instead of just
the main thread, you would have to store somewhere which thread to wake.

>   and the distinction between home AioContext and non-home context is
>   eliminated. AioContext unlocking is dropped.
>=20
> Does this make sense? I haven't seen these things in recent patch series.

Intuitively I would agree with most. There may be details that I'm not
aware of at the moment. I'm not surprised that we haven't seen any such
things in recent patch series because there is an awful lot of
preparational work to be done before we can reach this final state.

Kevin

--HfUfpTHX3Ui6RPX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmKLhc0ACgkQfwmycsiP
L9actRAAmgYMK0pUFv/+oxjjjI1wMJeEhgvbsrhgETQSr5rbVX3a/JJ17HcACumr
9h09OFGmG9n8NHDf7zToxCogYZG+3oD55OVF6mAWH2ETR1Q/G0EgkFIAT9i5Zz90
WluilpAu4Bpjy5SJA44R+daO8tfZjolX8kB/zuHER2WBi1yq7fjmy9FozEQdLRuh
v9ds2ehn+NdS0097nCyXRZy4bGxNWk4YuuEWfKN8PhS3sTj2dbROOmWPasQTTa8b
B9LXgpeeZ5jZTw4fBabRs10byIj08O9Em/nYgvyWabfiDpp7xh3J8WCoQomQcrha
QJQgm3iY5uBQezlKTJB8UoIHq95XqTpg/Hn7cUtzpqOwuy8BjFf1yRdGXj9Dedfq
SVKeeEpjDskrvdrAbNZ6szIrPgRc3slSMlxKBPc3ZygrSRCouUIYmbnBMRTUuZXP
L2ZB/SnL1NRHk1hYsMdBRX8GP8SkObNw+cnbQyjlnEEy6dhhL2BNsu3KV46k5Tj6
JpsSFqh999UHNOIQa5mzRE4xR+2Mr4vansLKZ1jAfQ5bpUru0y2vW8Rxbdwx6KLd
hthbJ3Km1A3/WHazxzroLL1gvcQLkFoA+LkF2uMPvbMm0jJ42nEa2IB6xB6+FaHK
wdqBgX41BiSPfZDRqRPZwos2Dx2TIXo/XC9yomMPgQdu6zO50yc=
=9QeU
-----END PGP SIGNATURE-----

--HfUfpTHX3Ui6RPX1--


