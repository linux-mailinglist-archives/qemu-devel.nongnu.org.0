Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541B4624B4F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:14:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDvV-0005UO-8s; Thu, 10 Nov 2022 15:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otDvT-0005T5-8z
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otDvR-0006ev-33
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668111203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lqr7VUbpPq8ogAfTtgpo9D+706sGDP3PKwkmcQ7YylQ=;
 b=TuADeMxlRV0ANSOidWiZC6jw6lkGG40JuZZe9RiLKHTNVj1pE/WBWJDnNWjjaewBZvgDbL
 T7bHUCx7DnYHRBEPJGg/hOj6l/v/5M3cTwuJ2XRoBXxD5OUhCO8c7sHM4541D1QZ55n9ut
 AbDyzLDyob3aiIBNmfgQDKsm9zZJh5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-AlO2iFIpOTmQa2Y-TMN-HQ-1; Thu, 10 Nov 2022 15:13:21 -0500
X-MC-Unique: AlO2iFIpOTmQa2Y-TMN-HQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A59800B23;
 Thu, 10 Nov 2022 20:13:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BABCD1121330;
 Thu, 10 Nov 2022 20:13:20 +0000 (UTC)
Date: Thu, 10 Nov 2022 15:13:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/13] block: Simplify drain
Message-ID: <Y21bXnkdi56JlgHi@fedora>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+yTjzFkndmeZbkxy"
Content-Disposition: inline
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--+yTjzFkndmeZbkxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 01:37:25PM +0100, Kevin Wolf wrote:
> I'm aware that exactly nobody has been looking forward to a series with
> this title, but it has to be. The way drain works means that we need to
> poll in bdrv_replace_child_noperm() and that makes things rather messy
> with Emanuele's multiqueue work because you must not poll while you hold
> the graph lock.
>=20
> The other reason why it has to be is that drain is way too complex and
> there are too many different cases. Some simplification like this will
> hopefully make it considerably more maintainable. The diffstat probably
> tells something, too.
>=20
> There are roughly speaking three parts in this series:
>=20
> 1. Make BlockDriver.bdrv_drained_begin/end() non-coroutine_fn again,
>    which allows us to not poll on bdrv_drained_end() any more.
>=20
> 2. Remove subtree drains. They are a considerable complication in the
>    whole drain machinery (in particular, they require polling in the
>    BdrvChildClass.attach/detach() callbacks that are called during
>    bdrv_replace_child_noperm()) and none of their users actually has a
>    good reason to use them.
>=20
> 3. Finally get rid of polling in bdrv_replace_child_noperm() by
>    requiring that the child is already drained by the caller and calling
>    callbacks only once and not again for every nested drain section.
>=20
> If necessary, a prefix of this series can be merged that covers only the
> first or the first two parts and it would still make sense.
>=20
> Kevin Wolf (13):
>   qed: Don't yield in bdrv_qed_co_drain_begin()
>   test-bdrv-drain: Don't yield in .bdrv_co_drained_begin/end()
>   block: Revert .bdrv_drained_begin/end to non-coroutine_fn
>   block: Remove drained_end_counter
>   block: Inline bdrv_drain_invoke()
>   block: Drain invidual nodes during reopen
>   block: Don't use subtree drains in bdrv_drop_intermediate()
>   stream: Replace subtree drain with a single node drain
>   block: Remove subtree drains
>   block: Call drain callbacks only once
>   block: Remove ignore_bds_parents parameter from drain functions
>   block: Don't poll in bdrv_replace_child_noperm()
>   block: Remove poll parameter from bdrv_parent_drained_begin_single()
>=20
>  include/block/block-global-state.h |   3 +
>  include/block/block-io.h           |  52 +---
>  include/block/block_int-common.h   |  17 +-
>  include/block/block_int-io.h       |  12 -
>  block.c                            | 132 ++++++-----
>  block/block-backend.c              |   4 +-
>  block/io.c                         | 281 ++++------------------
>  block/qed.c                        |  24 +-
>  block/replication.c                |   6 -
>  block/stream.c                     |  20 +-
>  block/throttle.c                   |   6 +-
>  blockdev.c                         |  13 -
>  blockjob.c                         |   2 +-
>  tests/unit/test-bdrv-drain.c       | 369 +++++++----------------------
>  14 files changed, 270 insertions(+), 671 deletions(-)

I have looked through all patches but don't understand the code well
enough to give an opinion or spot bugs. Removing subtree drains and
aio_poll() in bdrv_replace_child_noperm() are nice.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--+yTjzFkndmeZbkxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNtW14ACgkQnKSrs4Gr
c8jfqAgApu7tq7JqW6c50BA89aV3Bxad4YXDzBe5vh4VRvrAZJZes7pfce4hxnpt
QXZrJh+4yS7xD0XuD5DLVh4SQMZf0NRkgAj98KOzP9HMOw0OinepcokGpJhn+5wl
ARo5IKP5d63lQC4h+We+bg0OYsNfaj3GftvwKYAND/E+vtZjBiS0QCogzqVNRxl5
uPkrHHXm3pn8Ue120Fx+bm3WVvMQJRCQTArot/Nj1e+UuHv348kcmjA8rN7kiUVn
q9ciFL/+BRTDhwCgqHDVFwiOAmRPjXgydsPEYBVbkE24keaCJGPYQbByS0b3KUSr
YzeYjwzd/bbR/Os6t2LjrUzNTZUWlw==
=mp2k
-----END PGP SIGNATURE-----

--+yTjzFkndmeZbkxy--


