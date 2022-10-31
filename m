Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA1613EF0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:24:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbJV-00038V-HS; Mon, 31 Oct 2022 16:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJP-00035A-5m
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opbJN-0003gs-KD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667247788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FNUYbMGy0s4SYZcwPIB3kAHZEMduVlezgT5E/dDJ9FY=;
 b=B1QAq4c+YV1Qk6lVVDWw0DVOIaboribOysZ0PTLH1EgBKLA2phUKQSrchC2iK0TNYX4Z5U
 Bhyxk2evVpW5AQ/FQFhvErA/FGG2hi5sMzUUMQUdZrE/NgRZPAemakIQyw2zn+TA+AMIvk
 vRjsir6gI1PP+D0+iHPlORQGWo2iLyk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-xKNjorc2NcCs_Bxy-p09Bw-1; Mon, 31 Oct 2022 16:23:04 -0400
X-MC-Unique: xKNjorc2NcCs_Bxy-p09Bw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 232D08582B9;
 Mon, 31 Oct 2022 20:23:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A4BD4B3FE0;
 Mon, 31 Oct 2022 20:23:03 +0000 (UTC)
Date: Mon, 31 Oct 2022 15:42:30 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/3] io_uring: use LuringState from the running thread
Message-ID: <Y2AlJkcpjFXAru84@fedora>
References: <20221031125936.3458740-1-eesposit@redhat.com>
 <20221031125936.3458740-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DPfJtPEKSOqWBhX1"
Content-Disposition: inline
In-Reply-To: <20221031125936.3458740-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--DPfJtPEKSOqWBhX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 08:59:35AM -0400, Emanuele Giuseppe Esposito wrote:
> Remove usage of aio_context_acquire by always submitting asynchronous
> AIO to the current thread's LuringState.
>=20
> In order to prevent mistakes from the caller side, avoid passing LuringSt=
ate
> in luring_io_{plug/unplug} and luring_co_submit.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/file-posix.c      | 12 ++++--------
>  block/io_uring.c        | 22 ++++++++++++++--------
>  include/block/aio.h     |  4 ----
>  include/block/raw-aio.h |  8 ++++----
>  4 files changed, 22 insertions(+), 24 deletions(-)

The same comments from the previous patch also apply here.

--DPfJtPEKSOqWBhX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgJSYACgkQnKSrs4Gr
c8jihgf9Gn5qax/BIv9ZTDcKuuWB+mCMXrNzPW9nbwjFiLBtEBi0mihqUZFh1pXh
NdRo2qindJh9d2tlSjCfXaoTDwEy4cD5+ejma5nbPCOjpOSJKn2hdSPEK3KCv6le
4NnYtduGFV6zPWsDRfIQElipJ2viBuqd1nZhvbKkGJqdVEKl93fCaVJldwFPcNY7
DTUvRQfiPq+uEyoaqql+6QtBtfV0HPehLrcmnjIUKLauVF5SPUZjuvoJIHFXcd+I
rNglr/BoHMZG2oxBcrEHQatIU/iaopcpKMj816UwLB/LJyK/FxY5/SlzB2dN+qXI
vIGqvEJ2J7+BsGMvBnqLew/1d6ljrA==
=TS+t
-----END PGP SIGNATURE-----

--DPfJtPEKSOqWBhX1--


