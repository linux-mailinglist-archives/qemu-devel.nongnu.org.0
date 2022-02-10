Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588BA4B1489
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:48:27 +0100 (CET)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDYP-0002bL-SX
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAFj-0002rN-9L
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAFh-0001RF-RJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644502613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3VinG7LgJtAe2+5EFY+0Mm8oTkKuPSJwR/v8XBxf9DU=;
 b=VFUZtzJpRsyZfs+O9fzhWT67VxoSWi4VYja8o5ws7AXoJ7pZZ5EVn7SuxjFTPhuZEwtG75
 eSCGTiWiGw8b8eG5zGCEw7aqy1xvVbW/QCTn6Fk89kcPcLmhkmU5iHFQVw9vNtd9iCzDPj
 u0YjjI4DInTXtSmJTuMNlF1nTCBpIrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-dNbtFuJpP0eNmlb-mMaDWQ-1; Thu, 10 Feb 2022 09:16:51 -0500
X-MC-Unique: dNbtFuJpP0eNmlb-mMaDWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6119546866;
 Thu, 10 Feb 2022 14:16:42 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A306574EBB;
 Thu, 10 Feb 2022 14:16:31 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:16:30 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 3/6] block.c: bdrv_replace_child_noperm: first call
 ->attach(), and then add child
Message-ID: <YgUePqCV+kB32CQq@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-4-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Rzx+4Cl2oVlgLZPr"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--Rzx+4Cl2oVlgLZPr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:52AM -0500, Emanuele Giuseppe Esposito wrote:
> Doing the opposite can make adding the child node to a non-drained node,
> as apply_subtree_drain is only done in ->attach() and thus make
> assert_bdrv_graph_writable fail.
>=20
> This can happen for example during a transaction rollback (test 245,
> test_io_with_graph_changes):
> 1. a node is removed from the graph, thus it is undrained
> 2. then something happens, and we need to roll back the transactions
>    through tran_abort()
> 3. at this point, the current code would first attach the undrained node
>    to the graph via QLIST_INSERT_HEAD, and then call ->attach() that
>    will take care of restoring the drain with apply_subtree_drain(),
>    leaving the node undrained between the two operations.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Rzx+4Cl2oVlgLZPr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFHj4ACgkQnKSrs4Gr
c8hIWgf+LBSYVZb5gv0FSD08qsIXjjgY32qFm7YQ5ekH/ZmbsrjbYMSOEJ104D5J
vuFI2Sp+sYmvEB/0bJ6aWlkAF3C7H7lYYA4qVPfky5yTA8vpICJqHrQT+qg4UIS+
1kxbtosSBTSDEreo4tAqOlWgwM7eElc6+wh99o0v48E/kxpjFCgvpwqvGesJiE+G
lBcpBP/WtmM6GsxYKkG+qcbLwTEghIMKo/Sn7QLorFej4y99EwBE9h/ea/7TaicG
aR7z2Zcs2PeXS1oldIgkbhLsdiigLndiCeHz9vzAt2vbSnRZSAtWAHdMw2LpHzwc
9IpA/DfOHoPMSDcmckqrUTT/xjAnsw==
=ALCL
-----END PGP SIGNATURE-----

--Rzx+4Cl2oVlgLZPr--


