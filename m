Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9C6F3679
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:05:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYpr-0002dQ-OG; Mon, 01 May 2023 15:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYpm-0002cw-Kd
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:05:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYpl-0005Bc-7t
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWGYtFJ4rOtH/ANsCwBXzjJurm8m8hR9suT70LIaMl0=;
 b=IF+G3Y0aHvhPWrAl4s/qRIbQyTT/x5ql/mqChGSeW0yP3AVcE9he5f1HCwwFH4QzhyILNV
 p/QfhhHbXMIPNCNxgo1ExegJKVKEObB0TZbRoLt0znOixEBFQvUKqq5EopFeUN5Yp8xVyR
 z/G2n7pf2czKx6uf6AZCTq0zsfCxZlQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-si6IZPsHPPSa9wXREAX7Sw-1; Mon, 01 May 2023 15:05:08 -0400
X-MC-Unique: si6IZPsHPPSa9wXREAX7Sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A27138123D4;
 Mon,  1 May 2023 19:05:08 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E38C51121331;
 Mon,  1 May 2023 19:05:07 +0000 (UTC)
Date: Mon, 1 May 2023 15:05:05 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 15/20] block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
Message-ID: <20230501190505.GQ14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-16-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D2yXjJIft2c+ItvR"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-16-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--D2yXjJIft2c+ItvR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:53PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>=20
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_co_debug_event() need to hold a reader lock for the graph.
>=20
> Unfortunately we cannot use a co_wrapper_bdrv_rdlock, because the
> function is called by mixed functions that run both in coroutine and
> non-coroutine context (for example blkdebug_open).
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-io.h         | 9 +++++----
>  include/block/block_int-common.h | 4 ++--
>  block.c                          | 2 ++
>  3 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--D2yXjJIft2c+ItvR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDWEACgkQnKSrs4Gr
c8jIvQgAlYThfCSdCU88xHqrQ8P9gA4dn7uYGF17WuSE0ie+Z8mAJVIqXxH12Xbx
X6/9TH9XL4JHoeVHS2G/tDyb7xRxInH6TztVmSmjB5a0jPcqeOi2gcIu8iBM6Ln3
PJcFmf88TYc2lKrodfc8gjQNlLYx4ckjQ7rGwTaWJQi1o/tHNQmd2Ipx6g7UY5aS
8/wdvc8Y3QTr9EoQvRdGJDT4afgQnWqi9+4fDSsqtMyE6xWhIT60s/GyBDBxcVKY
BQ1ND4kKb7WL71Oq1e1htwEDbaKsp/WHCVhp/Th4/GWfZY5gZSSbiKYQtO5G789T
Y5Lwe2NL7Fz1kZqSmOCWD1Oda2WghQ==
=yASG
-----END PGP SIGNATURE-----

--D2yXjJIft2c+ItvR--


