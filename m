Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608454B143D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:31:51 +0100 (CET)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDIM-00056C-5e
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAWO-0007hk-N7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAWL-00062V-LC
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644503626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TXakd4AEDu8fgI1PE2PfNbn+ft9Cb8IXnoVTg3HQNU=;
 b=ggIUMF8jPA2iElhrBqDUD2QvNKTruZoW1RQQxIuuyiABqYHCoQuw7mXPP1hPNk/4hsGRKR
 42oeUgr2mBRye8csTbfK/lL8008GY7Q23zJZdNaYiDedf8Xzbz++nvq4hrvqDZaUfW0i9A
 I+OjS7lExdrOs5X/rOKm+ExT5SeGrDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-yFK8MfdnNSidca7SJQi9vg-1; Thu, 10 Feb 2022 09:33:43 -0500
X-MC-Unique: yFK8MfdnNSidca7SJQi9vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04AAC189DF41;
 Thu, 10 Feb 2022 14:33:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8428C7D3E7;
 Thu, 10 Feb 2022 14:33:41 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:33:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Message-ID: <YgUiRHTuAmQKYlrD@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I1yCvtXGdhSJQms1"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I1yCvtXGdhSJQms1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:54AM -0500, Emanuele Giuseppe Esposito wrote:
> This test uses a callback of an I/O function (blk_aio_preadv)
> to modify the graph, using bdrv_attach_child.
> This is simply not allowed anymore. I/O cannot change the graph.
>=20
> Before "block/io.c: make bdrv_do_drained_begin_quiesce static
> and introduce bdrv_drained_begin_no_poll", the test would simply
> be at risk of failure, because if bdrv_replace_child_noperm()
> (called to modify the graph) would call a drain,
> then one callback of .drained_begin() is bdrv_do_drained_begin_quiesce,
> that specifically asserts that we are not in a coroutine.
>=20
> Now that we fixed the behavior, the drain will invoke a bh in the
> main loop, so we don't have such problem. However, this test is still
> illegal and fails because we forbid graph changes from I/O paths.
>=20
> Once we add the required subtree_drains to protect
> bdrv_replace_child_noperm(), the key problem in this test is in:
>=20
> acb =3D blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
> /* Drain and check the expected result */
> bdrv_subtree_drained_begin(parent_b);
>=20
> because the detach_by_parent_aio_cb calls detach_indirect_bh(), that
> modifies the graph and is invoked during bdrv_subtree_drained_begin().
> The call stack is the following:
> 1. blk_aio_preadv() creates a coroutine, increments in_flight counter
> and enters the coroutine running blk_aio_read_entry()
> 2. blk_aio_read_entry() performs the read and then schedules a bh to
>    complete (blk_aio_complete)
> 3. at this point, subtree_drained_begin() kicks in and waits for all
>    in_flight requests, polling
> 4. polling allows the bh to be scheduled, so blk_aio_complete runs
> 5. blk_aio_complete *first* invokes the callback
>    (detach_by_parent_aio_cb) and then decrements the in_flight counter
> 6. Here we have the problem: detach_by_parent_aio_cb modifies the graph,
>    so both bdrv_unref_child() and bdrv_attach_child() will have
>    subtree_drains inside. And this causes a deadlock, because the
>    nested drain will wait for in_flight counter to go to zero, which
>    is only happening once the drain itself finishes.
>=20
> Different story is test_detach_by_driver_cb(): in this case,
> detach_by_parent_aio_cb() does not call detach_indirect_bh(),
> but it is instead called as a bh running in the main loop by
> detach_by_driver_cb_drained_begin(), the callback for
> .drained_begin().
>=20
> This test was added in 231281ab42 and part of the series
> "Drain fixes and cleanups, part 3"
> https://lists.nongnu.org/archive/html/qemu-block/2018-05/msg01132.html
> but as explained above I believe that it is not valid anymore, and
> can be discarded.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c | 46 +++++++++---------------------------
>  1 file changed, 11 insertions(+), 35 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--I1yCvtXGdhSJQms1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFIkQACgkQnKSrs4Gr
c8jPYQf/dHX96IDb6Ap655bksfXKz9itezR+V8s7w4KPy0MJMkfb1KbrFQA2u8MM
dx1bhF87vdfhQ7Fy5jig2GRQW0WVOIRrLcbDskecZkeaAGopyL8mpWOzlYSFd1I6
dWU+BVH5H7QD8eFQkP3W3uLyTyWo0YoL+RqOtbhqbBOAiIiWcUgGWllTWosIeBH/
ttnV0R74qVARgGVOpg+C9EzlhN+D+QUQDyQRssFHpA/+kLaYNPnswIdyYewzK/tB
jmVsPnamYtJN1tjsKg8SY/RbSz17TQN0+UW0SqaGtPKqzyF9l6t5VZyiyAvnf5a7
7Twv0+1fKKsKmPwbEEx86Nge83pARA==
=Xg7S
-----END PGP SIGNATURE-----

--I1yCvtXGdhSJQms1--


