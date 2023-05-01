Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E46F367F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:08:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYsg-0004DK-CV; Mon, 01 May 2023 15:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYsd-00044j-Uz
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:08:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYsb-0005dz-Tj
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ECABkpdogVYUJDGhMsVU4Ubjw945niETyICi1J0IPE=;
 b=FM16w2sxQtXP7bnRCWQoPWzSyTnkrEYEhN47nBKCA6KRPG1oEgBDQGJcpT1tZHDiHR2uNy
 3VOSAcyPxqop/mC4+1pgYejGig6yZ3+R6t8qbQMX0SCeD8F01hoDONLP4+ogf/bAN4OYoi
 EGdbAMxi9r0g5YzUDFfU80TnXbs/fZY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-oEvCm4BUNJiVrabrrRmNUg-1; Mon, 01 May 2023 15:08:05 -0400
X-MC-Unique: oEvCm4BUNJiVrabrrRmNUg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7713D2A59546;
 Mon,  1 May 2023 19:08:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEBD9483EC4;
 Mon,  1 May 2023 19:08:04 +0000 (UTC)
Date: Mon, 1 May 2023 15:08:03 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 17/20] block: Mark bdrv_query_bds_stats() and callers
 GRAPH_RDLOCK
Message-ID: <20230501190803.GS14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-18-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aU7T5NUmNKHQAKHC"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-18-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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


--aU7T5NUmNKHQAKHC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:55PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_query_bds_stats() need to hold a reader lock for the graph because
> it accesses the children list of a node.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/qapi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aU7T5NUmNKHQAKHC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDhMACgkQnKSrs4Gr
c8glfAf/XvlFGgsI6DC6rzOXDZdmSoEmynjf3Zrn60XpmjWWBYsg9yv3PPoAVyAM
ZNQqspFppYEdvIF0UWxepKl+UGLHTgC+rneh+lYjae5ZFke6Hy8sOrGQqMzz2lI3
s0sF0wgy1nJkDhmaN6XsN1NhM0lO6iY3E6YKMF7qxa1uFlqyM5aYbshurTXkHAEF
dHMAQPsGwGa0jznEmxJAfLPDyJllrl2IR0UoRhScmg2S2yYq12vO5yRSUv6UR6OI
CnA2StaqYCmSAFT6oR2Ukp+0txnxlCpfxGomDM+ZOq/37FXJMUCReaO5xvwKtFgS
fl2d6i3ZzDer1dvsGiLRbZC+/srOnA==
=riGP
-----END PGP SIGNATURE-----

--aU7T5NUmNKHQAKHC--


