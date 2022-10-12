Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE365FC7F2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:07:58 +0200 (CEST)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidKu-0007Bn-Po
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidCu-00014U-VZ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidCs-0002P4-5b
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665586777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oVIJ/7iPCs5h5C4xmhkCbFxEOyXDoMgf7I8mNyKeLL4=;
 b=cbpFHiP0KVmmvzWplfSUBx/OfSrkQR0eMMiCdAZryz69Eg3hGxmGhlvG75he2s6Np5XsiR
 PYY1i8xGG6SKSizfmlzyQ9atpfuqJO3kREoeUlAQVwfYR3nehh4JzCFA63hVFfXsk6ttmn
 jY/qNh/hIyg7BQiV+19MUweBQXh7CP8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-BJz2I1bqPCGNGT7cRW-bgw-1; Wed, 12 Oct 2022 10:59:36 -0400
X-MC-Unique: BJz2I1bqPCGNGT7cRW-bgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA2413C0D851;
 Wed, 12 Oct 2022 14:59:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E698140EBF3;
 Wed, 12 Oct 2022 14:59:34 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:09:58 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 pbonzini@redhat.com
Subject: Re: [PULL 0/1] testing: revert pc-bios build patch
Message-ID: <Y0bKtttz3pdzSct2@fedora>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uwZ9q4aBxtnYvfVY"
Content-Disposition: inline
In-Reply-To: <20221011192858.956078-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uwZ9q4aBxtnYvfVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--uwZ9q4aBxtnYvfVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNGyrYACgkQnKSrs4Gr
c8igdAf/XLn9avqpZ/kltVhvUiulMRk2oWW4iAAKCYOkTZCJi1Jo5hVH/5bVry8s
38alXtyhmLEweXe+wx1+zgs08SGWpZBRlSrDg+1dxkxJ2L9sNXq+uEHOvMX7rKs9
GBckN33EB3D2eELbaeKWk/iiIts/tOOyJ1zlqj64B/QtACLFDIEbwn0BtAKaghBG
WvqrkWxCuV7v3deaf8J8z8I9Bzf5RcBh/Z+mVrw0+D0L+leJz7vWklGDsFid5ixB
8PYbiIHGSPiuHrDOQDN8x664YoetqN/BhQjuudfqdqOMukrqPlEeJFUAoK3GMrlO
OrbDhr+mhRhZe2Yyq2+EepuFRvBxPQ==
=LrOl
-----END PGP SIGNATURE-----

--uwZ9q4aBxtnYvfVY--


