Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA8401D0C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:34:03 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFhC-0001DL-Ip
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNFfz-0008S0-87
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:32:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNFfo-0001DR-5j
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ivwICj42Q5qHD19RqJMvK9Wkk8/QHD+z5oH+qK8H9SY=;
 b=RusNSaTXap/StUpTltLG3CSjLeo9WnchthsKQgu9pZCxU77pl0XzcsZjIZNxCArms1BzRk
 JmVM/Inn2qsUf/djZop3Mv1y1RK1QtXy974XJqYqM2n7DUNZ4b1d3cIae284sSZeW0PjJ0
 oWsYyq20wxGSvxHJglVEaUmUZaK71T4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-G9OYyArHP7mjgsxOcoQ3qg-1; Mon, 06 Sep 2021 10:32:32 -0400
X-MC-Unique: G9OYyArHP7mjgsxOcoQ3qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A36B100E417;
 Mon,  6 Sep 2021 14:32:26 +0000 (UTC)
Received: from localhost (unknown [10.39.194.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9F7710074E1;
 Mon,  6 Sep 2021 14:32:25 +0000 (UTC)
Date: Mon, 6 Sep 2021 15:32:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2] include/block.h: remove outdated comment
Message-ID: <YTYmeIlcIgHoK2e7@stefanha-x1.localdomain>
References: <20210903113800.59970-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903113800.59970-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YnnhAFw0L9qYidlb"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YnnhAFw0L9qYidlb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:38:00PM +0200, Emanuele Giuseppe Esposito wrote:
> There are a couple of errors in bdrv_drained_begin header comment:
> - block_job_pause does not exist anymore, it has been replaced
>   with job_pause in b15de82867
> - job_pause is automatically invoked as a .drained_begin callback
>   (child_job_drained_begin) by the child_job BdrvChildClass struct
>   in blockjob.c. So no additional pause should be required.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v2:
> + add "block jobs" to the external request sources
>=20
>  include/block/block.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--YnnhAFw0L9qYidlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE2JngACgkQnKSrs4Gr
c8ilwgf/ZKxerZkw9SJj2pAf9z6ET9cIhqM4X2ZoUPoiPVT/bVbcHXO9E1veOibY
k46CEHGTE21CuG5LatkDx7gvw8ffGr+4+pNXhvTE2MnKV5lliu34l0nJifVh7epK
uM/NDW17pcIJM/7DmI2mjYuyRMlPq67pRE5jNUVlKndC+hl5Z5pfxcHOuzz1HvZd
lGLCiER66AGYRXnQDcpzECN0DrceOXYryoeSr4zY/K9LK5sr8Og/Pp3pd3eACAsh
J5mPJdQU5TfB6RZ/fAyKmj8YJ/nsYz0n6v5eKrTMDNR7x7Fr9c3+mLsVi8yPxTTK
fcEjQT6FzaguQXy4F9EQP34a1mxf6Q==
=yOv8
-----END PGP SIGNATURE-----

--YnnhAFw0L9qYidlb--


