Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21836F42EB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:42:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoNC-0005iB-Mf; Tue, 02 May 2023 07:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptoNA-0005hQ-TK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptoN9-00060Z-71
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683027642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hijrmQnj6V4ak+KgHw1r0JLEv7z49T5N5oFqrFlVGcs=;
 b=EN45qzzihKWvBqPzfQ3or9rN4Fzn/VhfKq3xspF1dcjhSrXdqZ9amkmk5L+rBG5ou1zkYF
 1SAq1Nw3LKOTfjf8xnBEarq/4pABrg+yxlvYFj/qNyXH3Z5wSDr1BgUrIfeiN7N6i4tRYG
 InXMQDPbizoiIfLaKTJkA0wwb21mdKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-rwhT_9yzMMyTjEBm-vlp9Q-1; Tue, 02 May 2023 07:40:37 -0400
X-MC-Unique: rwhT_9yzMMyTjEBm-vlp9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 879E4811E7B;
 Tue,  2 May 2023 11:40:36 +0000 (UTC)
Received: from localhost (unknown [10.39.194.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0876240C2009;
 Tue,  2 May 2023 11:40:35 +0000 (UTC)
Date: Tue, 2 May 2023 07:40:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Fam Zheng <fam@euphon.net>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Subject: Re: [PATCH] async: avoid use-after-free on re-entrancy guard
Message-ID: <20230502114034.GA293395@fedora>
References: <20230501141956.3444868-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0M1t5U2lwB1IBCXG"
Content-Disposition: inline
In-Reply-To: <20230501141956.3444868-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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


--0M1t5U2lwB1IBCXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 10:19:56AM -0400, Alexander Bulekov wrote:
> A BH callback can free the BH, causing a use-after-free in aio_bh_call.
> Fix that by keeping a local copy of the re-entrancy guard pointer.
>=20
> Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D58513
> Fixes: 9c86c97f12 ("async: Add an optional reentrancy guard to the BH API=
")
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  util/async.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--0M1t5U2lwB1IBCXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRQ9rIACgkQnKSrs4Gr
c8g83Af/eVD56H/DHXGhrh3CwJvmmYAJRySRewnMX29I5Ve2UyAIGRG1PCA/zeUr
XmivSrlR7UOaLDcuKE+0HojVIF16TK4gFXUx/1zef2JDHvHbkZK14h/qiXebyxkY
qg25l6v49Qc8y8DjusUCIqp7VaGl10HVJDd1YrsoQwUnZSpHX4I+52P3RTrAs8AD
3s7MzAIHj7fRcp6W/T4tAOzv9TOhAwjvuphYHt8Rik4KLwErbWeNFDLkicjWUHlP
dQxwwrqRskLvczNn420Bl96i2i58N8wycYxMMLwjF5hb9qIn7bTpM8hI1VakkiSl
YB3PIRz5cO1r7xUN44UDCQd8pC+Rkw==
=EBoo
-----END PGP SIGNATURE-----

--0M1t5U2lwB1IBCXG--


