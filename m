Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB106F3685
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:11:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYv1-0006aA-0W; Mon, 01 May 2023 15:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYuy-0006ZB-OZ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYux-0006Fi-CO
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pfkf3YQT6OSbYMnDNATUk7PzdYw3dc5bGlvMqrA5K+k=;
 b=Jd4MJ5VfcxXuecXbZi1JBFS/rfZ/kHPizQFx5k3vi4XhcAeGlZp1CAlXZy3dAmcABnAGlp
 AcJvEl76sEwaGtKPdsH6QrJuB4LbpmdxlPYzu6MtVmUFwbmo+INkjAZ+0TCZfCLD08OnKs
 skn7a4Iw3Dm674WRQkCLS7NUBbmlk0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-CNn-K5ScOiSoIpcn6PE9fw-1; Mon, 01 May 2023 15:10:30 -0400
X-MC-Unique: CNn-K5ScOiSoIpcn6PE9fw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94E0087B2A7;
 Mon,  1 May 2023 19:10:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3182483EC4;
 Mon,  1 May 2023 19:10:29 +0000 (UTC)
Date: Mon, 1 May 2023 15:10:28 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 20/20] block: Mark bdrv_refresh_limits() and callers
 GRAPH_RDLOCK
Message-ID: <20230501191028.GV14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-21-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vWwDENYeC+0E4fB7"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-21-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--vWwDENYeC+0E4fB7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:58PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_refresh_limits() need to hold a reader lock for the graph because
> it accesses the children list of a node.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h | 5 ++++-
>  include/block/block_int-common.h   | 3 ++-
>  block.c                            | 9 +++++++++
>  block/io.c                         | 1 -
>  4 files changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--vWwDENYeC+0E4fB7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDqQACgkQnKSrs4Gr
c8hhOgf+OlTtTpP64N6fQY0oexiGxxxa03S4HVMA1VqkymPX9bHYHvZ7AatP2dVa
k1wrEt2237S3t6eF0Duhnxid3JwqIpVyEPcNUaCoSnHcOUleSGBP4XqcN7cucFGm
fZpNVLJEAEpuaEQZtewNjRLDBIBe+EJyY9IP2dKpnXzppUGsBkLrzPEfZYtFM8R4
RQSWqJ1fr7wXu5i7LIjzSWmpDDgkbp0zrC2dWrIDGJ8jasM58gTnASt3gPSbDUik
TmMHDV5mlV1HcsIIqCd8C5AooQk9zyMcchUyPw/snImAoS45uMnhTCTAqLj/KZ/E
IDqnJtmI6/dZkfnReeOHiU5j067weQ==
=J0/z
-----END PGP SIGNATURE-----

--vWwDENYeC+0E4fB7--


