Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C628468C82C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP8cR-0003y5-Tc; Mon, 06 Feb 2023 16:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pP8cP-0003wG-6Y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:01:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pP8cN-0004um-KY
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675717299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dn4pR7zoFXB8T03gPYpAvLj+TL85HXBBtymq3GCnfQ4=;
 b=UDXqCGGWlw+WqLznJTZs6bZ7XyzBaCunQWjUeakBCCeSoe+N97+Vl2HDnR+kGgHlDuCTo5
 ObW7me4cqYUrydt95lPOd9UxoZeRfbRH0/7aoZh2gVKAruCVv6jpdhVjV+S/wQ0YDrQ6Uz
 UWqLyYgY6Fb5SNmJMrtz60+NbAzfH9k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-6-Kp1pB7PHqsWzHMZBcF3w-1; Mon, 06 Feb 2023 16:01:37 -0500
X-MC-Unique: 6-Kp1pB7PHqsWzHMZBcF3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2617B181E084;
 Mon,  6 Feb 2023 21:01:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3597EC15BAD;
 Mon,  6 Feb 2023 21:01:25 +0000 (UTC)
Date: Mon, 6 Feb 2023 16:01:24 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, hreitz@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v3 0/4] block: fix detect-zeroes= with
 BDRV_REQ_REGISTERED_BUF
Message-ID: <Y+FqpMdHPDv0Nsd2@fedora>
References: <20230201152751.270508-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NWVAd1dONY1n+Wjk"
Content-Disposition: inline
In-Reply-To: <20230201152751.270508-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--NWVAd1dONY1n+Wjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2023 at 10:27:47AM -0500, Stefan Hajnoczi wrote:
> v3:
> - Restore alphabetical order in getopt strings [Eric]
> v2:
> - Add comment explaining unbalanced error code path in
>   qemu_io_alloc_from_file() [Eric]
> - List options alphabetically in help output [Eric]
> - Add Tested-by/Reviewed-by
> - CC qemu-stable on the fix
>=20
> The first patch fixes a regression in QEMU 7.2 where detect-zeroes breaks=
 with
> virtio-blk devices due to a BDRV_REQ_REGISTERED_BUF bug. Details of the
> regression can be found here:
> https://gitlab.com/qemu-project/qemu/-/issues/1404
>=20
> The remaining patches add a regression test that will protect this code p=
ath in
> the future. The qemu-io command is extended with the new -r option that c=
alls
> blk_register_buf(). This allows a qemu-iotests test case to trigger the s=
ame
> bug as virtio-blk.
>=20
> Stefan Hajnoczi (4):
>   block: fix detect-zeroes=3D with BDRV_REQ_REGISTERED_BUF
>   qemu-io: use BdrvRequestFlags instead of int
>   qemu-io: add -r option to register I/O buffer
>   iotests/detect-zeroes-registered-buf: add new test
>=20
>  block/io.c                                    |   3 +
>  qemu-io-cmds.c                                | 180 ++++++++++++------
>  .../tests/detect-zeroes-registered-buf        |  58 ++++++
>  .../tests/detect-zeroes-registered-buf.out    |   7 +
>  4 files changed, 189 insertions(+), 59 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
>  create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf=
=2Eout

Hi Kevin and Hanna,
Would you like to review this or should I go ahead and merge it?

Stefan

--NWVAd1dONY1n+Wjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPhaqQACgkQnKSrs4Gr
c8jXdgf8Clc7mRPmYjIqZ5MRE2QMr6/Olv+i7pMqNxsWdIrS6MwK1/J3dLhZfL0T
1d1JeIuLjSCyta96aqm+OD9hTaD4TLteyEx5W3wH3mdihpP8sq4kF4QyGDBwT3Bv
tE8HWILhw0DFF3nPGkka3yL+xv2wgpm8vPRmlgvdGOs+Hzixj3462ISoMI7kaacU
MO8tvCdy7rrH2qsW2QNuzUCWJLJ0FQYx/cf9Y1ljxM2KXIbwlNGQZXq1b8xXcAUv
qjlcSgNu2EaBST5Ta9gpb6ANlcC4FmAzJXdQ79QIE0QKKIJM/27FPwtY3wzi/c2W
mVOpvj2YDGf7z6lEu1Q/MOAWkRAh0A==
=tS/8
-----END PGP SIGNATURE-----

--NWVAd1dONY1n+Wjk--


