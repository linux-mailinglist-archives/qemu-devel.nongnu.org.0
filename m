Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBC06F3680
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:09:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYtJ-00050T-IT; Mon, 01 May 2023 15:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYtD-0004sX-7u
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYtA-0005lx-8y
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nd9WMFJp9ji1Ot4AdUwNTOKkcdqGFmswLI5Sx/84sbs=;
 b=gzz7IMz8QyEq2k86hna2Vf0mXE4yciQZCOCaPATIRlTbz2vx2I1UkH27B9BJuCGDmKOKlL
 qIFjwrI4rWC+CEM1yLo94fxDaPat8KXQ693Nx4Wbgena+6auJTdST8kQQRI8wtwxYz5pRl
 FB/UcmB/Y232osyVleKR5sL0RxyFJ8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-NksUDjr2NeaCCg9Q5rXmDA-1; Mon, 01 May 2023 15:08:40 -0400
X-MC-Unique: NksUDjr2NeaCCg9Q5rXmDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68E1085A588;
 Mon,  1 May 2023 19:08:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 014AA2027043;
 Mon,  1 May 2023 19:08:39 +0000 (UTC)
Date: Mon, 1 May 2023 15:08:38 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 18/20] block: Mark bdrv_query_block_graph_info() and
 callers GRAPH_RDLOCK
Message-ID: <20230501190838.GT14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-19-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3c6QdWTfaMxNj45V"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-19-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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


--3c6QdWTfaMxNj45V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:56PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_query_block_graph_info() need to hold a reader lock for the graph
> because it accesses the children list of a node.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/qapi.h | 7 ++++---
>  qemu-img.c           | 2 ++
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3c6QdWTfaMxNj45V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDjYACgkQnKSrs4Gr
c8gw7gf/d0U+F1EVwLPHSlRmS8byryEiS3cGNhf5NgX4fEJaKsaSjphwttV27Y74
aedW6nuEiWBgZCqNTfPOqCwZNKjfBVtDeXbtFOKYYYG2RV9sEBOt5aKffQ9Xvs3g
noBinbHywhInhQvy7PU2vD0O0B1AUafARDTebObXy/o7wfJLyiPKvna9vRrnmmhG
hvBhCH4THQgVcJFQhWRSleNrcK+Ut8w6bObXJEG2NNjoQOPYvYDSwNpCoM23vywj
RIgoilgG7pFwf1krVPvxZJlhmRo58FqnxzTEVUp8EfH1unY41bDFotAInEoQH+Ye
ZfvtlOoin9joOhCltnxu9xodbqNoRA==
=iGUX
-----END PGP SIGNATURE-----

--3c6QdWTfaMxNj45V--


