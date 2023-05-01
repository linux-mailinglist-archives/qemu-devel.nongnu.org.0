Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD66F3677
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:05:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYox-0001Zi-Rl; Mon, 01 May 2023 15:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYov-0001UW-2f
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYot-0004vJ-F9
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=01RYafiJ3B4DoLUmP5HhTU6gUpHRNKYkYjbBB4+n79k=;
 b=SZudIHFRhKmCIbXBmGw/anXUUYJGfUe8OZHbvzdL52eL7HNT/EVQFQ1GrhppVUhpubQ3Sf
 R7qcug4M18NjTo4oGqboKIM+6b+UBbIrsZCRJEXounlV/EE+uYNuaYdUFpW1sN9Usw/R4L
 zXt46nUPlEMNXDp6wQq8Z1Gz7TtImRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-MhdOsfbcNDSeQvF_AsW4yw-1; Mon, 01 May 2023 15:04:13 -0400
X-MC-Unique: MhdOsfbcNDSeQvF_AsW4yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29995185A790;
 Mon,  1 May 2023 19:04:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 812512027045;
 Mon,  1 May 2023 19:04:12 +0000 (UTC)
Date: Mon, 1 May 2023 15:04:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 14/20] block: Mark bdrv_co_get_info() and callers
 GRAPH_RDLOCK
Message-ID: <20230501190411.GP14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-15-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RtnBZHXGmTtWqUuZ"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-15-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--RtnBZHXGmTtWqUuZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:52PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_co_get_info() need to hold a reader lock for the graph.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-io.h         |  7 +++++--
>  include/block/block_int-common.h |  4 ++--
>  block.c                          |  2 ++
>  block/crypto.c                   |  2 +-
>  block/io.c                       | 11 +++++------
>  block/mirror.c                   |  8 ++++++--
>  block/raw-format.c               |  2 +-
>  7 files changed, 22 insertions(+), 14 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RtnBZHXGmTtWqUuZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDSoACgkQnKSrs4Gr
c8hLKgf+IvhKM0Mf30sZh7E7qlEWnj/GqpwSQaMBBHMLJD6mM88sk2WqMVMpah+y
w2WKPBYY11gUGdzEw7Nyv6DkWmzHjJijwpl6yo0+mgA3AT4hyUyNFW9tSrUpew2m
8Esaglkz1U15DsOteQm/uThGBr71oyAo9H6P5a7PhebY+CMcFy5xqabIgGy3sbyz
3oc9fsT+PLdz1zkZ27P4uRlWgfAEFf8lgL6nmDgVhB4g3EsudlO227U2q0u6EtgH
COmeD0Tb45U2uc+/k5ARu6J6zJq1tvVQeahVdrVKFGwFnf1uQeJM6Yrm20riNuUG
C2uzkhtMgS0yhwwThrkX+ojSh5+nwQ==
=e4VI
-----END PGP SIGNATURE-----

--RtnBZHXGmTtWqUuZ--


