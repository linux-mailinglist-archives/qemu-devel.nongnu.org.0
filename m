Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731326F366F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:59:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYjK-0006kI-Me; Mon, 01 May 2023 14:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYjI-0006jl-If
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptYjG-0003sV-Oz
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682967509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lL7UZ5lQkAPYBI4SZsM6Tah1F3PBMzxXwRcGmL2j054=;
 b=e903nTAWwls+VLQV++5lwbfW2vIMl1ceFXv2b1arSnljRxjs0114DgzyvV3YmJo9NpTYVk
 qdEcKPo713Gv5P0xA3phZm9TcNXEBVMKzXxe6MG7O+7R596vNFdpDANKdVRgUY5HSpLndp
 Zpo3IvCXEG+vfn3PmFVzHIlNC/HB0bw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-obr1J8t6NP2ATkSMCvGsMQ-1; Mon, 01 May 2023 14:58:22 -0400
X-MC-Unique: obr1J8t6NP2ATkSMCvGsMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B0C4800B35;
 Mon,  1 May 2023 18:58:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC9B140C6E67;
 Mon,  1 May 2023 18:58:21 +0000 (UTC)
Date: Mon, 1 May 2023 14:58:20 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pbonzini@redhat.com, eesposit@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 11/20] vhdx: Take graph lock for accessing a node's
 parent list
Message-ID: <20230501185820.GM14869@fedora>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-12-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zwSisZP6ZuRH0PJY"
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-12-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zwSisZP6ZuRH0PJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 07:31:49PM +0200, Kevin Wolf wrote:
> This adds GRAPH_RDLOCK annotations to declare that functions accessing
> the parent list of a node need to hold a reader lock for the graph. As
> it happens, they already do.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/vhdx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

The commit message is misleading. This commit does not take the graph
lock, it declares that the caller must already hold the graph lock.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zwSisZP6ZuRH0PJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQC8sACgkQnKSrs4Gr
c8jM2ggAmhKb83n+Cn0QHutshK89O4Kqqp81EnRERBPuNUmtgcoXWbHV5VGgtgGa
LNBd1kopMzZWpFy5NkEEnVtk9OwY88B5ZqsAtq8qoLnod7JkpKVlwXQBrDEqHGQi
E5oa2AVAQCX8SsWHtYgXRNryKoAVFjl11tn+9BAKnNguN/YrROOqopVC/umSSSuu
tYB20JBC6DOQ3W8fep1upYC0N213lOrRsePurhYPup2iiViMToSlUtRFMffhke5j
XtMIPakZLuShy04ABv233WBGi3txml3JraqD7BhnAEbt9Qf5MN9bTiJGoeWFGaSe
YD0SaH5lfHwocQMTrzeRo84XJVms9A==
=ECAy
-----END PGP SIGNATURE-----

--zwSisZP6ZuRH0PJY--


