Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E3C53252C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 10:23:35 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntPpG-0001oP-DG
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 04:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntPb2-0007av-EJ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntPaz-0000Z0-IB
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653379728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5uOcCkeqZRZO3bt2tWUqUNDyiWXGYNc6aYPyDueBB8=;
 b=jNx195wFqd6ivBsbkTZSfO0/9nKsNW/+uFx6nr2DKY9eF0S4j67f6Q9Jjm6bwxqN/8NUQU
 sGyWyLGXhzkfPRH5KDRsIEwQ6KPmkFAayC1yzv6GP9AC9D3EC2dyAKyQiQfXm3uNq3POxc
 emhUpwffPloyBJzZgc1xsh19V1vCzFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-K-T6uuIDMw6oiC0SfIZAWQ-1; Tue, 24 May 2022 04:08:43 -0400
X-MC-Unique: K-T6uuIDMw6oiC0SfIZAWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BF71801396;
 Tue, 24 May 2022 08:08:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE62740D2820;
 Tue, 24 May 2022 08:08:42 +0000 (UTC)
Date: Tue, 24 May 2022 09:08:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Message-ID: <YoySiI+ReM2O8WEs@stefanha-x1.localdomain>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com>
 <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
 <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fvF2WhvrbhlPOyQ3"
Content-Disposition: inline
In-Reply-To: <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--fvF2WhvrbhlPOyQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 09:55:39AM +0200, Paolo Bonzini wrote:
> On 5/22/22 17:06, Stefan Hajnoczi wrote:
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
> Yeah, that works only if the drained sections are well-behaved.
>=20
> "External" sources of I/O are fine; they are disabled using is_external, =
and
> don't drain themselves I think.

I/O requests for a given BDS may be executing in multiple AioContexts,
so how do you call aio_disable_external() on all relevant AioContexts?

We covered this below but I wanted to reply here in case someone else
reads this part without reading the rest.

> Mirror is the only I/O user of drain, and it's fine because it never subm=
its
> I/O to the drained BDS.
>
> Drained sections in the main thread can be special cased to allow I/O
> (wrlock in this series would also allow I/O).
>=20
> So I think that the "cooperation from all relevant places" that Kevin
> mentioned is already there, except for coroutine commands in the monitor.
> Those are a bad idea in my opinion and I'd rather revert commit eb94b81a94
> ("block: Convert 'block_resize' to coroutine") until we have a clearer id=
ea
> of how to handle them.
>=20
> I agree that it's basically impossible to review the change.  On the other
> hand, there's already a substantial amount of faith involved in the
> correctness of the current code.
>=20
> In particular the AioContext lock does absolutely nothing to protect
> corutines in the main thread against graph changes---both from the monitor
> (including BHs as in "block: Fix BB.root changing across bdrv_next()") and
> from BDS coroutines.  The former are unprotected; the latter are protected
> by drain only: using drain to protect against graph writes would be a mat=
ter
> of extending *existing* faith to the multi-iothread case.
>=20
> Once the deadlock is broken, we can proceed to remove the AioContext lock
> and then introduce actual coroutine-based locking.
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
> >    a special "home" AioContext.
>=20
> Correct.  bdrv_set_aio_context() remains useful as a way to set a home
> AioContext for sockets.
>=20
> > - bdrv_coroutine_enter() becomes mostly meaningless because there is no=
 need to
> >    run a coroutine in the BDS's AioContext.
> > - aio_disable_external(bdrv_get_aio_context(bs)) no longer works becaus=
e many
> >    threads/AioContexts may submit new I/O requests. BlockDevOps.drained=
_begin()
> >    may be used instead (e.g. to temporarily disable ioeventfds on a mul=
ti-queue
> >    virtio-blk device).
>=20
> This is a change that can be done independent of this work.
>=20
> > - AIO_WAIT_WHILE() simplifies to
> >=20
> >      while ((cond)) {
> >          aio_poll(qemu_get_current_aio_context(), true);
> >          ...
> >      }
> >=20
> >    and the distinction between home AioContext and non-home context is
> >    eliminated. AioContext unlocking is dropped.
>=20
> (I'll reply on this from elsewhere in the thread).
>=20
> > Does this make sense? I haven't seen these things in recent patch serie=
s.
>=20
> I agree, and yeah all these are blocked on protecting graph modifications.
>=20
> In parallel to the block layer discussions, it's possible to work on
> introducing a request queue lock in virtio-blk and virtio-scsi.  That's t=
he
> only thing that relies on the AioContext lock outside the block layer.

I'm not sure what the request queue lock protects in virtio-blk? In
virtio-scsi I guess a lock is needed to protect SCSI target emulation
state?

Stefan

--fvF2WhvrbhlPOyQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKMkocACgkQnKSrs4Gr
c8j9QwgAi3Oz8kTyKD/yXiwLEZPC8X/6EqBazY+dYKoQbZ0ZoJGRY/Kc7IPJImJw
A5hLJqXgzwZ+V9PX069KpSYZl+4LsAHL5zF/pCI8Yq/LrYlvydhG35oJwUkmxncU
DrS4KnrWix90QFPsz59C8KLTtxkJPqQqbZ8PxkzTNhcgWrTew2mq/u+2wfjPVxTn
Y5kESC3sa+11zmaJh+EMGqicedkVeKZRDgkmWOOZ2ux8YOOYitdEmcfGTQrIS8tW
IzhvCS2eB3EMFeRP+sHWIUfHcpzW7l33WtPv9q77oLZuPqG8weFLv8nJ/p+paHpN
QsazOyWa5p0AYr+/f/HphR8pvXpmXQ==
=+CJs
-----END PGP SIGNATURE-----

--fvF2WhvrbhlPOyQ3--


