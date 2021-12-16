Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBF4779C7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:56:15 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxu3C-0005A6-TL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxu1R-0004K7-HO
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxu1Q-0001Yv-5X
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639673663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPmP+Xe9BXdgKdDTlTxcitva/5WklcURFVIiCg3oTaA=;
 b=VOlmyjlw6tt4Hyikpt5YpDa0GVqIas8bxixMYa1MbaZi/JxTmdm3UYrBC8Be0g2y9uXRma
 +vBlYtGPThnoAIF91PoGZbJ/zlie2rcx/mxZO7iyNNOGCIul9sk03wWQKLj7lCP+PwDBno
 71aM8dXXE/0GBYKoT6+qKyzfdTKGhms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77--3wScdAVNAiktISIhYKklQ-1; Thu, 16 Dec 2021 11:54:20 -0500
X-MC-Unique: -3wScdAVNAiktISIhYKklQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB26B92503;
 Thu, 16 Dec 2021 16:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36EE25BD1C;
 Thu, 16 Dec 2021 16:54:18 +0000 (UTC)
Date: Thu, 16 Dec 2021 16:54:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 06/14] job.c: make job_event_* functions static
Message-ID: <YbtvOYQHhHivGLKO@stefanha-x1.localdomain>
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-7-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211104145334.1346363-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1cNZEfjpUTft11xA"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1cNZEfjpUTft11xA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 04, 2021 at 10:53:26AM -0400, Emanuele Giuseppe Esposito wrote:
> job_event_* functions can all be static, as they are not used
> outside job.c.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/qemu/job.h |  6 ------
>  job.c              | 12 ++++++++++--
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1cNZEfjpUTft11xA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7bzkACgkQnKSrs4Gr
c8jnzQgApNWU323CUD4ZRbVHgCjcpwxzibk4sVXg8P2nGwIXCoo4m10x9MMFnJdR
YrYQ9NN9b6WOFr1ppL3IHdb/5ZRwTZ0AVBVjfZaCgEwNtaUhP4W2aOovmIkeynLt
xNy95tf3/oqfBblctH20yzKWeJftRkb7mIonsdur+UYrq7pJqX/c8WV7ar36xhBA
pWoN6p881mX6O3lA5Vhy2G49MRP/y0MEJ8q40uFt3KIia38BJBdXdUEEwbEXxJbJ
Y43xbGKewHDww6tOZrUyZ/geKH/2LydmY03A7rFr2wT9+o4NVUH4mYh1z1YC3yle
dmqz5wC0T530lKCdz/TTQPxOMFuXiw==
=P5sW
-----END PGP SIGNATURE-----

--1cNZEfjpUTft11xA--


