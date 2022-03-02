Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D198E4CA13B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 10:49:30 +0100 (CET)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPLbt-0001bs-MR
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 04:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPLaG-0000sg-7z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPLaD-0003e2-4q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 04:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646214463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3x+D8yGQNWM+ZBo2KM5sNfJoh/iPOX6d+L7C8iHmy/U=;
 b=ASAa/wwy9+Aqc1ZiPqD4ImOqxS3+mp/lZ993spNeE2dey53Shon2e5IGV0F4vjJ11xyfBa
 LROHAdpe8QYRWYQTEdXkiJFWIpPxhS8Ng88tkr2p32c1U6CXVRXoy84+5Aflso28OCgMH+
 TVM/PLrmRKzQ4S32C6KaweGGI849S10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-54gioCxcPfK4uJQKnGUDBg-1; Wed, 02 Mar 2022 04:47:40 -0500
X-MC-Unique: 54gioCxcPfK4uJQKnGUDBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0DCA1006AA6;
 Wed,  2 Mar 2022 09:47:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C7228306A;
 Wed,  2 Mar 2022 09:47:29 +0000 (UTC)
Date: Wed, 2 Mar 2022 09:47:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7zY9dwhu9woywCsR"
Content-Disposition: inline
In-Reply-To: <20220301142113.163174-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7zY9dwhu9woywCsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 09:21:08AM -0500, Emanuele Giuseppe Esposito wrote:
> This serie tries to provide a proof of concept and a clear explanation
> on why we need to use drains (and more precisely subtree_drains)
> to replace the aiocontext lock, especially to protect BlockDriverState
> ->children and ->parent lists.
>=20
> Just a small recap on the key concepts:
> * We split block layer APIs in "global state" (GS), "I/O", and
> "global state or I/O".
>   GS are running in the main loop, under BQL, and are the only
>   one allowed to modify the BlockDriverState graph.
>=20
>   I/O APIs are thread safe and can run in any thread
>=20
>   "global state or I/O" are essentially all APIs that use
>   BDRV_POLL_WHILE. This is because there can be only 2 threads
>   that can use BDRV_POLL_WHILE: main loop and the iothread that
>   runs the aiocontext.
>=20
> * Drains allow the caller (either main loop or iothread running
> the context) to wait all in_flights requests and operations
> of a BDS: normal drains target a given node and is parents, while
> subtree ones also include the subgraph of the node. Siblings are
> not affected by any of these two kind of drains.

Siblings are drained to the extent required for their parent node to
reach in_flight =3D=3D 0.

I haven't checked the code but I guess the case you're alluding to is
that siblings with multiple parents could have other I/O in flight that
will not be drained and further I/O can be submitted after the parent
has drained?

> After bdrv_drained_begin, no more request is allowed to come
> from the affected nodes. Therefore the only actor left working
> on a drained part of the graph should be the main loop.

It's worth remembering that this invariant is not enforced. Draining is
a cooperative scheme. Everything *should* be notified and stop
submitting I/O, but there is no assertion or return -EBUSY if a request
is submitted while the BDS is drained.

If the thread that drained the BDS wants, I think it can (legally)
submit I/O within the drained section.

> What do we intend to do
> -----------------------
> We want to remove the AioContext lock. It is not 100% clear on how
> many things we are protecting with it, and why.
> As a starter, we want to protect BlockDriverState ->parents and
> ->children lists, since they are read by main loop and I/O but
> only written by main loop under BQL. The function that modifies
> these lists is bdrv_replace_child_common().
>=20
> How do we want to do it
> -----------------------
> We individuated as ideal subtitute of AioContext lock
> the subtree_drain API. The reason is simple: draining prevents the iothre=
ad to read or write the nodes, so once the main loop finishes
> executing bdrv_drained_begin() on the interested graph, we are sure that
> the iothread is not going to look or even interfere with that part of the=
 graph.
> We are also sure that the only two actors that can look at a specific
> BlockDriverState in any given context are the main loop and the
> iothread running the AioContext (ensured by "global state or IO" logic).
>=20
> Why use _subtree_ instead of normal drain
> -----------------------------------------
> A simple drain "blocks" a given node and all its parents.
> But it doesn't touch the child.
> This means that if we use a simple drain, a child can always
> keep processing requests, and eventually end up calling itself
> bdrv_drained_begin, ending up reading the parents node while the main loop
> is modifying them. Therefore a subtree drain is necessary.
>=20
> Possible scenarios
> -------------------
> Keeping in mind that we can only have an iothread and the main loop
> draining on a certain node, we could have:
>=20
> main loop successfully drains and then iothread tries to drain:
>   impossible scenario, as iothread is already stopped once main
>   successfully drains.
>=20
> iothread successfully drains and then main loop drains:
>   should not be a problem, as:
>   1) the iothread should be already "blocked" by its own drain

Once drained_begin() returns in the IOThread, the IOThread can do
anything it wants, including more submitting I/O. I don't consider that
"blocked", so I'm not sure what this sentence means?

The way the main loop thread protects itself against the IOThread is via
the aio "external" handler concept and block job drain callbacks, which
are activated by drained_begin(). They ensure that the IOThread will not
perform further processing that submits I/O, but the IOThread code that
invoked drained_begin() can still do anything it wants.

>   2) main loop would still wait for it to completely block
>   There is the issue of mirror overriding such scenario to avoid
>   having deadlocks, but that is handled in the next section.
>=20
> main loop and iothread try to drain together:
>   As above, this case doens't really matter. As long as
>   bdrv_drained_begin invariant is respected, the main loop will
>   continue only once the iothread is "blocked" on that part of the graph.

I'm not sure about this, see above.

>=20
> A note on iothread draining
> ---------------------------
> Theoretically draining from an iothread should not be possible,
> as the iothread would be scheduling a bh in the main loop waiting
> for itself to stop, even though it is not yet stopped since it is waiting=
 for the bh.

I'm not sure what you mean. Which function schedules this BH?

>=20
> This is what would happen in the tests in patch 5 if .drained_poll
> was not implemented.
>=20
> Therefore, one solution is to use .drained_poll callback in BlockJobDrive=
r.
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
>=20
> The other patches in this serie are cherry-picked from the various
> series I already sent, and are included here just to allow
> subtree_drained_begin/end_unlocked implementation.
>=20
> Emanuele Giuseppe Esposito (5):
>   aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
>   introduce BDRV_POLL_WHILE_UNLOCKED
>   block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
>   child_job_drained_poll: override polling condition only when in home
>     thread
>   test-bdrv-drain: ensure draining from main loop stops iothreads
>=20
>  block/io.c                   |  48 ++++++--
>  blockjob.c                   |   3 +-
>  include/block/aio-wait.h     |  15 ++-
>  include/block/block.h        |   7 ++
>  tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
>  5 files changed, 274 insertions(+), 17 deletions(-)
>=20
> --=20
> 2.31.1
>=20

--7zY9dwhu9woywCsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfPS8ACgkQnKSrs4Gr
c8hNewgAvowC1ZgEPT9sP1ImAjLF3HwNlVwGOmZKjf+QWBIVLP7iWXQpuc2nF+IF
CbtD4rys1fKeSMwIkifNHaEkFkMCRVtQBlxMmuY1pfU0yug3nXuRN93Vk9X2y1VF
40wbm6M2xLYkoBAkKHgag/l7bOzjlP3JCj5vJZhkL9qeSV6DeiVGN+l30aaYfUuu
pAL/mk/TSRpeZA4HVZW/P+qNeEU65Q0sX14eOBYO2ScDFeJmCJ67woSP5lymHLvv
+sZnfQCO27yLoUdUNgl7fjHZCFVBQP6k9VMGhS3WVOLns95ubG6KBtLVT0W6AI0+
XWfuNOjV/nW66hRPKRqGcE+btK0inw==
=kdCa
-----END PGP SIGNATURE-----

--7zY9dwhu9woywCsR--


