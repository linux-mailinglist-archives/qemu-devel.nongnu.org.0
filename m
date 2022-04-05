Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525934F2997
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:45:02 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfkD-0004yf-EG
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbffP-0003CK-4R
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nbffM-0007sD-Eu
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649151599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nrYa9sUqSln5BlV4oX1sXA10ZfPvKOOyzeD33RJTsgU=;
 b=OAWRw8ixkSrDBPyp82Ym7c08CwvJdNa07er/YnxD0PwbJ1rpfEv1LwXvlo/vR5z+10si4p
 +khXRfJ+LCMMHUzPj+/p30n6bdIpUqaeGz7mVX5wKzqrWF3w4yrt2Dx4zfS60GhwpeK1BY
 UcOkeX843FiBnUmMhHffZwvC6LK5ZWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-7wL0Uv2UNTGrKGnkDybJVw-1; Tue, 05 Apr 2022 05:39:56 -0400
X-MC-Unique: 7wL0Uv2UNTGrKGnkDybJVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF571811E75;
 Tue,  5 Apr 2022 09:39:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E283AFFE1;
 Tue,  5 Apr 2022 09:39:52 +0000 (UTC)
Date: Tue, 5 Apr 2022 10:39:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Message-ID: <YkwOZ19J1mk8OSTa@stefanha-x1.localdomain>
References: <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <Ykq5cZPiC9uw9T1a@stefanha-x1.localdomain>
 <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZIO8P9w2A6tpIu7x"
Content-Disposition: inline
In-Reply-To: <CABgObfZ96TOf9nxdrHrtKtrfyG0sZS9rPqAaReQgxNQ+AkKKpA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZIO8P9w2A6tpIu7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 11:41:04AM +0200, Paolo Bonzini wrote:
> On Mon, Apr 4, 2022 at 11:25 AM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > - The new API still needs to be combined with bdrv_drained_begin/end()
> >   to ensure in-flight requests are done.
> >
>=20
> I don't think so, because in-flight requests would take the lock for
> reading. The write side would not start until those in-flight requests
> release the lock.

Good point!

> - It's not obvious to me whether the new API obsoletes is_external. I thi=
nk
> > it probably doesn't.
> >
>=20
> I agree that it doesn't. This new lock is only protecting ->parents and
> ->children. bdrv_drained_begin()/end() remains necessary, for example, wh=
en
> you need to send a request during the drained section. An example is
> block_resize.
>=20
> In addition, bdrv_drained_begin()/end() ensures that the callback of
> blk_aio_*() functions has been invoked (see commit 46aaf2a566,
> "block-backend: Decrease in_flight only after callback", 2018-09-25).  Th=
is
> new lock would not ensure that.
>=20
> As an aside, instead of is_external, QEMU could remove/add the ioeventfd
> handler in the blk->dev_ops->drained_begin and blk->dev_ops->drained_end
> callbacks respectively. But that's just a code cleanup.

Interesting idea. If is_external is a block layer-specific feature that
nothing else in QEMU uses then I like the idea because it's cleaner and
more obvious than is_external.

Stefan

--ZIO8P9w2A6tpIu7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJMDmcACgkQnKSrs4Gr
c8ilpwf/cSj8jx2yTFGcv/W19pDyhuM+yWFw5pzU9KPA86xJ8ltsex910HMYk3sn
DaiwQLZuNTofbwr3sJ+319U5/FHuCk4it6g/tQ0R6sqWgFKns6T4Fa04l/CRIoF8
pOPrxTHlmUeLlglLePGVwIs5NQ4UiVqh8QFLZcvQk7qgDPB9E7FqPTaiLUr/9Lt6
xp22YolAlnwoWNgslwuB3G4PScD2pbfLwy0atfOTfbs8WKfrRg7SI1FK/O0fFGEX
9Ecc6/qcMq1hY7Sn+hyfXYtJ7r+Lek3F2lOaMYgyzhupt/RLNfS3rnOwZ+1/66Mn
EDKo2pS7wiVwnL8ATRUJs3+ibEhY8A==
=XqtJ
-----END PGP SIGNATURE-----

--ZIO8P9w2A6tpIu7x--


