Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F16F335C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 18:04:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVyt-0000Ux-JE; Mon, 01 May 2023 12:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVyL-0000CI-JH
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptVyJ-000303-Cd
 for qemu-devel@nongnu.org; Mon, 01 May 2023 12:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682956910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H4a4TRiPJmlX4SfND/Ww4f3lfek+b5VcGunIuszGPwg=;
 b=c7BEaOdKxgMY0TdwiWKKM0hZu09MImjRhwC83BILUOy4uQOEoEXagNt6yjFIDC1sxk17U3
 0dsemGgAW9ms5UzSy7dRayYfpGhq5WBrvz6/isW1Srmt1lIZWBNuxEMfs5vMAldJbnrIZo
 Bxdz5QvRLV+VYE8/QNW+CK8gURYNhjY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-TghNmgmqPdqDa295_JHMIw-1; Mon, 01 May 2023 12:01:40 -0400
X-MC-Unique: TghNmgmqPdqDa295_JHMIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF07A1C075BD;
 Mon,  1 May 2023 16:01:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF7363F2D;
 Mon,  1 May 2023 16:01:39 +0000 (UTC)
Date: Mon, 1 May 2023 12:01:37 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 08/20] block: .bdrv_open is non-coroutine and unlocked
Message-ID: <20230501160137.GJ14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-9-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vggftsAc1OigxgRu"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-9-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--vggftsAc1OigxgRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:46PM +0200, Kevin Wolf wrote:
> Drivers were a bit confused about whether .bdrv_open can run in a
> coroutine and whether or not it holds a graph lock.
>=20
> It cannot keep a graph lock from the caller across the whole function
> because it both changes the graph (requires a writer lock) and does I/O
> (requires a reader lock). Therefore, it should take these locks
> internally as needed.
>=20
> The functions used to be called in coroutine context during image
> creation. This was buggy for other reasons, and as of commit 32192301,
> all block drivers go through no_co_wrappers. So it is not called in
> coroutine context any more.
>=20
> Fix qcow2 and qed to work with the correct assumptions: The graph lock
> needs to be taken internally instead of just assuming it's already
> there, and the coroutine path is dead code that can be removed.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block_int-common.h |  8 ++++----
>  block.c                          |  6 +++---
>  block/qcow2.c                    | 15 ++++++---------
>  block/qed.c                      | 18 ++++++++----------
>  4 files changed, 21 insertions(+), 26 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vggftsAc1OigxgRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRP4mEACgkQnKSrs4Gr
c8g8Dgf9GSoIp/TeqoggUGmEB5xaS7ThttL2zd7x/sGNd9fpJaw0LLYLZcaf1dUA
3njLo+GSuYMpPgdgb4cOnViP8Z9CvCbn8wmjbZQJWIhxAXAwB7DHhT3brjoRGfQ8
WNBDHFvnxNzU6+P6/NyyOxnG1S6Ckxw/eE4IcteMbZPqWwDjvrr1SSXsSMYXMNtP
LEr/oiNw2kXDZlo20V04En84LHLqkbZXg0yWbmD6ImD05yhevDJFFmnw9c7SP7OC
r6c49xhuJZRyd8E1Q4/Ziil+rhaLy7o1lbNFPkFm6gdllGrYkv+75apTVVoCdx9J
8UtfJ4WjV40pKqzWbRDdA35y+a4QGg==
=4b7K
-----END PGP SIGNATURE-----

--vggftsAc1OigxgRu--


