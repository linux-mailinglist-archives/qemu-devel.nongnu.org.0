Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F715664E8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:19:28 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dmJ-0005kN-Fp
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dYM-0006sL-F7
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8dYL-00080z-0c
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Apkp7ftwJbNi0rB74cOa0VgovqX+MYmJfSUxbF6kgI=;
 b=LfO1WShVt4IcBnkDRCXFBIfO8ay6e5+8evKOcXdcAdoDYtrSxVKnFgcZgaftNvkRkhw2T0
 1xkmnQPg578NsGzo19TptTJlxMaK9GuSJ/lklBGUWTZPZHLB/z9B42HEw6dy5GCHyNyICa
 6wYOBNTNNWt+apnQuZhAgF2uz8DDR04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-CrlWscmFMkKGoYJRUzcF2w-1; Tue, 05 Jul 2022 04:04:56 -0400
X-MC-Unique: CrlWscmFMkKGoYJRUzcF2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D90D1019E1D;
 Tue,  5 Jul 2022 08:04:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21655C2811B;
 Tue,  5 Jul 2022 08:04:55 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:04:53 +0100
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
Subject: Re: [PATCH v8 11/20] jobs: use job locks also in the unit tests
Message-ID: <YsPwpRUoUR+DPl+P@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-12-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GthT8WtL0zt8j6GS"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-12-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


--GthT8WtL0zt8j6GS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:29AM -0400, Emanuele Giuseppe Esposito wrote:
> Add missing job synchronization in the unit tests, with
> explicit locks.
>=20
> We are deliberately using _locked functions wrapped by a guard
> instead of a normal call because the normal call will be removed
> in future, as the only usage is limited to the tests.
>=20
> In other words, if a function like job_pause() is/will be only used
> in tests to avoid:
>=20
> WITH_JOB_LOCK_GUARD(){
>     job_pause_locked();
> }
>=20
> then it is not worth keeping job_pause(), and just use the guard.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  tests/unit/test-bdrv-drain.c     | 76 +++++++++++++++++---------
>  tests/unit/test-block-iothread.c |  8 ++-
>  tests/unit/test-blockjob-txn.c   | 24 +++++---
>  tests/unit/test-blockjob.c       | 94 ++++++++++++++++++++++++--------
>  4 files changed, 141 insertions(+), 61 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--GthT8WtL0zt8j6GS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLD8KUACgkQnKSrs4Gr
c8ijhgf6A5iTk9TO1xctIZWjCYLhBApu1/eB3Lqy+Md5/EbxE56Rlh8mHZs4b/+W
0rfdsYsxcBaY5JzZ6dfoe2UMaDsHx0RNeRLZE8PVTnBZKG7EW1Ob4NJaUztbK3fB
XL9WDX0vyH+dy9OhMCSLTZO6uWthb2f1ZLEJvZkRxXIf4NPLWuyXDtAnrCADgmg9
vgJhAa13SDg38MGA8qmKgqYrrnOyGOWhy0YJmnGG+hjKoBbYfrGJtjqLoL9LZK3t
6Z/aNdNqaO2mXyFvY0UoJxGT5JNTbpbGs/B0TYs8zTRPwwfdQpi2lGG/P7KZrq8x
A4M8k6oTTgjFbLgWXs9beA8SKR9kyA==
=Nz+i
-----END PGP SIGNATURE-----

--GthT8WtL0zt8j6GS--


