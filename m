Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477852BD8D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:28:51 +0200 (CEST)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKfS-0005XP-EJ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrKeI-0004gF-Vj
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrKeH-0003vF-3q
 for qemu-devel@nongnu.org; Wed, 18 May 2022 10:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652884056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zbi8orVQFlopk5Japt1k8/NSFEXfSWNsqhkU6bvtllo=;
 b=eFK0lf8SBsMy3MylOxbA84wtd1XEuPqPFppM5KCTIHT5u3XGuwqm3FTofBliM+LqDUj3TW
 r1Hc7VBfjTFd1QZzwYdAfi03SVUtGhz+Pcby6M1Rue7tQpvqBdH256q1pKn56Eb56laaWP
 UF1Xe1R72isXXkNpWBJ+xrnHKp3FGqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-IVvEuPSOPSqSH_jsAvsc5A-1; Wed, 18 May 2022 10:27:32 -0400
X-MC-Unique: IVvEuPSOPSqSH_jsAvsc5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E7E2185A7B2;
 Wed, 18 May 2022 14:27:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEF22166B3F;
 Wed, 18 May 2022 14:27:13 +0000 (UTC)
Date: Wed, 18 May 2022 15:27:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoUCQE/+PnTK0g69@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HbSE9qL1QO2iAo4/"
Content-Disposition: inline
In-Reply-To: <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--HbSE9qL1QO2iAo4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 02:28:41PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 17/05/2022 um 12:59 schrieb Stefan Hajnoczi:
> > On Wed, May 04, 2022 at 02:39:05PM +0100, Stefan Hajnoczi wrote:
> >> On Tue, Apr 26, 2022 at 04:51:06AM -0400, Emanuele Giuseppe Esposito w=
rote:
> >>> This is a new attempt to replace the need to take the AioContext lock=
 to
> >>> protect graph modifications. In particular, we aim to remove
> >>> (or better, substitute) the AioContext around bdrv_replace_child_nope=
rm,
> >>> since this function changes BlockDriverState's ->parents and ->childr=
en
> >>> lists.
> >>>
> >>> In the previous version, we decided to discard using subtree_drains to
> >>> protect the nodes, for different reasons: for those unfamiliar with i=
t,
> >>> please see https://patchew.org/QEMU/20220301142113.163174-1-eesposit@=
redhat.com/
> >>
> >> I reread the thread and it's unclear to me why drain is the wrong
> >> mechanism for protecting graph modifications. We theorized a lot but
> >> ultimately is this new mechanism sufficiently different from
> >> bdrv_drained_begin()/end() to make it worth implementing?
> >>
> >> Instead of invoking .drained_begin() callbacks to stop further I/O,
> >> we're now queuing coroutines (without backpressure information that
> >> whoever is spawning I/O needs so they can stop). The writer still waits
> >> for in-flight I/O to finish, including I/O not associated with the bdrv
> >> graph we wish to modify (because rdlock is per-AioContext and unrelated
> >> to a specific graph). Is this really more lightweight than drain?
> >>
> >> If I understand correctly, the original goal was to avoid the need to
> >> hold the AioContext lock across bdrv_replace_child_noperm(). I would
> >> focus on that and use drain for now.
> >>
> >> Maybe I've missed an important point about why the new mechanism is
> >> needed?
> >=20
> > Ping?
>=20
> label: // read till the end to see why I wrote this here
>=20
> I was hoping someone from the "No" party would answer to your question,
> because as you know we reached this same conclusion together.
>=20
> We thought about dropping the drain for various reasons, the main one
> (at least as far as I understood) is that we are not sure if something
> can still happen in between drain_begin/end, and it is a little bit
> confusing to use the same mechanism to block I/O and protect the graph.

We had discussions about what could go wrong and there was a feeling
that maybe a separate mechanism is appropriate for graph modifications,
but there was no concrete reason why draining around graph modification
won't work.

If no one has a concrete reason then drain still seems like the most
promising approach to protecting graph modifications. The rwlock patch
wasn't sufficiently different from drain to have significant advantages
in my opinion.

> We then thought about implementing a rwlock. A rdlock would clarify what
> we are protecting and who is using the lock. I had a rwlock draft
> implementation sent in this thread, but this also lead to additional
> problems.
> Main problem was that this new lock would introduce nested event loops,
> that together with such locking would just create deadlocks.
> If readers are in coroutines and writers are not (because graph
> operations are not running in coroutines), we have a lot of deadlocks.
> If a writer has to take the lock, it must wait all other readers to
> finish. And it does it by internally calling AIO_WAIT_WHILE, creating
> nested event loop. We don't know what could execute when polling for
> events, and for example another writer could be resumed.
> Ideally, we want writers in coroutines too.

What is the deadlock? Do the readers depend on the writer somehow?

> Additionally, many readers are running in what we call "mixed"
> functions: usually implemented automatically with generated_co_wrapper
> tag, they let a function (usually bdrv callback) run always in a
> coroutine, creating one if necessary. For example, bdrv_flush() makes
> sure hat bs->bdrv_co_flush() is always run in a coroutine.
> Such mixed functions are used in other callbacks too, making it really
> difficult to understand if we are in a coroutine or not, and mostly
> important make rwlock usage very difficult.
>=20
> Which lead us to stepping back once more and try to convert all
> BlockDriverState callbacks in coroutines. This would greatly simplify
> rwlock usage, because we could make the rwlock coroutine-frendly
> (without any AIO_WAIT_WHILE, allowing a writer to wait for readers by
> just yielding and queuing itself in coroutine queues).
>=20
> First step was then to convert all callbacks in coroutines, using
> generated_coroutine_wrapper (g_c_w).
> A typical g_c_w is implemented in this way:
> 	if (qemu_in_coroutine()) {
> 		callback();
> 	} else { // much simplified
> 		co =3D qemu_coroutine_create(callback);
> 		bdrv_coroutine_enter(bs, co);
> 		BDRV_POLL_WHILE(bs, coroutine_in_progress);
> 	}
> Once all callbacks are implemented using g_c_w, we can start splitting
> the two sides of the if function to only create a coroutine when we are
> outside from a bdrv callback.
>=20
> However, we immediately found a problem while starting to convert the
> first callbacks: the AioContext lock is taken around some non coroutine
> callbacks! For example, bs->bdrv_open() is always called with the
> AioContext lock taken. In addition, callbacks like bdrv_open are
> graph-modifying functions, which is probably why we are taking the
> Aiocontext lock, and they do not like to run in coroutines.
> Anyways, the real problem comes when we create a coroutine in such
> places where the AioContext lock is taken and we have a graph-modifying
> function.
>=20
> bdrv_coroutine_enter() calls aio_co_enter(), which in turns first checks
>  if the coroutine is entering another context from the current (which is
> not the case for open) and if we are already in coroutine (for sure
> not). Therefore it resorts to the following calls;
> 	aio_context_acquire(ctx);
>         qemu_aio_coroutine_enter(ctx, co);
>         aio_context_release(ctx);
> Which is clearly a problem, because we are taking the lock twice: once
> from the original caller of the callback, and once here due to the
> coroutine. This creates a lot of deadlock situations.

aio_context_acquire() is a recursive lock. Where is the deadlock?

Stefan

--HbSE9qL1QO2iAo4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKFAkAACgkQnKSrs4Gr
c8jtEgf+N+gO9VZFjsK51EMHnw/nhRR7+FCUvz+gp7iu5nxi+QdXWE2+1SbnIJJ+
m7izkDlaKLUx802cRPNk1mfIRkWRpZGGJ+bTnf0OUcbFd9/FsQE8nHE6wJ5Shpuz
S9uP5gOZBZZlYPb7aQjCYEskEhqLD9Z9PLhtTbn6pp8RUBoNVsMg4bPouQzV+tf8
cKvO+pjR4Aa9YCZP21rEiSQOqLCo5d10JUcYcIdTmwt6wybPdELwcDCiZTrUP2bZ
x9Mb0YbMWnTp1rnJRTRtNHJr6aEDGBK6Z3O738MtFrw8DwiKIspokZkOyh3IMlli
zs/arh5NEhqh0h2ZoAFumeQ8pDm/Lg==
=0YAK
-----END PGP SIGNATURE-----

--HbSE9qL1QO2iAo4/--


