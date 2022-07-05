Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD0C56645A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:45:44 +0200 (CEST)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dFf-00046R-AN
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dDo-0003Fr-Hn
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dDm-0004Sa-SJ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657007026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uOI7Zl95j0IuDyJ+GoLCZ3FF+6sUm2aLPgKY73ZpTmQ=;
 b=BSKa32ntDM+ojV3KuO/zI0en5LXTD9j2jwqN7tDAhInrBfZ5KSsSk0QYPU25fhlHtKvGY5
 2bbtohs9mRVXdbEj0RLL3J/EIJYjcASXBB1iUZS1yPMwyXEtlDvzFbZjaMch7kbarshHXW
 FIW+XzIdsVL7rLCm3YGUbijIAhmnDYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-VPdM-zhkNZePgZiQQmJwcg-1; Tue, 05 Jul 2022 03:43:38 -0400
X-MC-Unique: VPdM-zhkNZePgZiQQmJwcg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7331F81D9CC;
 Tue,  5 Jul 2022 07:43:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 320CD1121315;
 Tue,  5 Jul 2022 07:43:37 +0000 (UTC)
Date: Tue, 5 Jul 2022 08:43:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 06/20] job.h: define functions called without job lock
 held
Message-ID: <YsPrqPH73/UJo67f@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-7-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bYU/Ce9DM6FkI0dq"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


--bYU/Ce9DM6FkI0dq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:24AM -0400, Emanuele Giuseppe Esposito wrote:
> These functions don't need a _locked() counterpart, since
> they are all called outside job.c and take the lock only
> internally.
>=20
> Update also the comments in blockjob.c (and move them in job.c).
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> No functional change intended.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c         | 20 --------------------
>  include/qemu/job.h | 37 ++++++++++++++++++++++++++++++++++---
>  job.c              | 15 +++++++++++++++
>  3 files changed, 49 insertions(+), 23 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bYU/Ce9DM6FkI0dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD66cACgkQnKSrs4Gr
c8jkhwf+LKgfuN4m71MQYCdbRPdx7VoaU4owTvurCXGwFxVZ1ADgkjMrHDo3oIDt
qoaL1iFD36su5MeKHQwuq90HpNTar98/9uxsDAj1BD074y3njbCR+x8DykmYT6G+
TWFbH3RAhHdlEmr5szckH+bk8828ugV1AclaBwnrOrrYmlY+Vg5JVaxNckCp1hIf
W2e4/16ZaauYYv0u6WRP5wu1LZMl1P45YHMXH10WeB9ZTD7XcYUFsh7QBYHtr/E6
sZqZpVUsHX5bfGU0undGsH+ZGvVs7r4dn7GGsWLbJB7TRh1SxccwLkJ2EqjwbnMQ
xZjlxIuJrMwKsbPUqxNIxeO6lJUA8Q==
=333k
-----END PGP SIGNATURE-----

--bYU/Ce9DM6FkI0dq--


