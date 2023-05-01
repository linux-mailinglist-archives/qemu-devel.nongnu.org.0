Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AA6F3684
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:11:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYud-0005yz-8b; Mon, 01 May 2023 15:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYub-0005yr-T6
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYua-00067E-G0
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682968211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rcT06lMLwuoBEtpeF7ZuIuoI0t1YO8rH04P6nLZ4tL8=;
 b=jBwNsLQqNUiyttXqUMZG95RsQ72tvuBWFp4O4RAO+Z+PXR+SOr2eZzUZUmfwVju0uvhr6z
 VdGhtcqC6nVnVNe+JBwGq/RN6mOG8V3fuWx7jHxorZtd/P7/s6lFUo3RR39p+yf+70X2YR
 ssTv1yRnpeqW5In2MKrq7J8wR479vrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-dKbD3sQDOua4c9Eobb23LA-1; Mon, 01 May 2023 15:10:09 -0400
X-MC-Unique: dKbD3sQDOua4c9Eobb23LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 642351C051A8;
 Mon,  1 May 2023 19:10:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D693151E3;
 Mon,  1 May 2023 19:10:08 +0000 (UTC)
Date: Mon, 1 May 2023 15:10:06 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 19/20] block: Mark bdrv_recurse_can_replace() and callers
 GRAPH_RDLOCK
Message-ID: <20230501191006.GU14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-20-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XAjpP9j3srmYQsbM"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-20-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


--XAjpP9j3srmYQsbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:57PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_recurse_can_replace() need to hold a reader lock for the graph
> because it accesses the children list of a node.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-global-state.h     | 5 +++--
>  include/block/block_int-common.h       | 4 ++--
>  include/block/block_int-global-state.h | 4 ++--
>  block/blkverify.c                      | 5 +++--
>  block/mirror.c                         | 4 ++++
>  block/quorum.c                         | 4 ++--
>  blockdev.c                             | 3 +++
>  7 files changed, 19 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--XAjpP9j3srmYQsbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQDo4ACgkQnKSrs4Gr
c8gQ/Af8DgCdlQFk/8k3CnhK1ItSr0RJyG1363EmAGeABMGi21Owa8hsw69R88bQ
GPoZHv5bLnxd+DxvEfeyMS3R8dPYTL3KcP5+iuiOaJi20l1BAt7GuH6fBUTvYzuZ
wBK8A2JG5mq5k7aAOT0b4zxTSCAj8+JdXi1zJvNZA0KUXuKeVRGZOwSsq37tVKnT
ACyJnQqVKdOWbg9Rxiath//A8Cnfvw4U1ZNgCND3MiGyteI6q4sPMZLPheigZ0Uz
o0aSz+GrHXaUQOMjuY9QtH3iFJwHOz3OmiBGAiyJ8/1axvBWvoaxdWcI18jjQ2H/
5RIQCuN6Dnm/aUJjKcgUDZgtvXbP8w==
=dmL6
-----END PGP SIGNATURE-----

--XAjpP9j3srmYQsbM--


