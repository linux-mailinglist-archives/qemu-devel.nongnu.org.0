Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E04B1470
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:42:20 +0100 (CET)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDSV-0004ar-GV
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAFN-0002Mj-H5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAFK-0001BM-KU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644502589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h8AGlGv5WvFsunEB02ObTGa2kryHQc78LCJfRulX04Q=;
 b=OMnE8eTOa2ZS4E633ltu5RtVDDLpl/hTO/ObRxwG6OgbRQn51V7IgBmqPYnhOfS+EM2n4E
 JuZpeyfrsOAh2rR345kKaZc67dJCxmX/SGDhHiSyK3EBJpIIRV/UNvtEazY9eFRRe0V4r1
 jnEYUsqbqa+NLxt1SVz/UU8q9LPEzZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-YxA78Y__PwKGMNUGm-k6Qw-1; Thu, 10 Feb 2022 09:16:26 -0500
X-MC-Unique: YxA78Y__PwKGMNUGm-k6Qw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D66F851A12;
 Thu, 10 Feb 2022 14:16:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCA3E2B6ED;
 Thu, 10 Feb 2022 14:16:14 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:16:13 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 2/6] block.c: bdrv_replace_child_noperm: first remove the
 child, and then call ->detach()
Message-ID: <YgUeLTRnKHQiAhi7@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/lhv9WNYr5yxga4N"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--/lhv9WNYr5yxga4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:51AM -0500, Emanuele Giuseppe Esposito wrote:
> Doing the opposite can make ->detach() (more precisely
> bdrv_unapply_subtree_drain() in bdrv_child_cb_detach) undo the subtree_dr=
ain
> just performed to protect the removal of the child from the graph,
> thus making the fully-enabled assert_bdrv_graph_writable fail.
>=20
> Note that assert_bdrv_graph_writable is not yet fully enabled.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/lhv9WNYr5yxga4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFHi0ACgkQnKSrs4Gr
c8i8KwgAs1OxA9SB9FmD6GxKLNrTBSPYbYBLmWXnLrhz0U/Cr9QjHwGyT+0Cp6DK
bGr+Heql3nfv5vie6zxv3MFC4YTspFTojSWGuVQwSe2M/vY848Bnx5TRX3LaMlqP
f83LyOiYtBlFy3uLN3QSORsT3mPsPvhUSByyRiWQmkdtBuJpsOFlE6aIbBYd6y9p
3dsTlRcvZ2E6QQfMYifunH6ePJxTdYFIzVXJnviHge2bfobUARgnL+zrqJwneygC
wzWU7pBzaQbaa9pnOXgJGZ997FjACL/O6xfpyN9Il1OD7Zta4LwLEm/9J6ExyKOw
cr8c01LQb0ug/Yq4zNli//tXVJXiJA==
=oeME
-----END PGP SIGNATURE-----

--/lhv9WNYr5yxga4N--


