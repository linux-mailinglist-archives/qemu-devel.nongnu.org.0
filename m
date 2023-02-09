Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04905690CD9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:24:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8mh-0002ZQ-ID; Thu, 09 Feb 2023 10:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8mS-0002PY-NO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8mP-0000Mi-Um
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n5N20m/7MYJOPc6TvXvztGdIR1YPfOb+Pu9Yk4Lxxao=;
 b=DfAGBasDdU4W4UGM/YLqoeXzM7SlzbdNVyyGxXNDytC9IQHqT2PyYtC7FDiPG2c1ADQZpc
 rt/BJiSCeHlvpqnwJxKxc3omAUlk0m2voyir8X+ELijHqGhBMEBcd0oIKsunK4pEDGTWJZ
 yRbzEVNEowwlWY6ON7G8R9cVm4s4Wz0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-Lp3UwySHPUSTuVQTTfE1kQ-1; Thu, 09 Feb 2023 10:24:05 -0500
X-MC-Unique: Lp3UwySHPUSTuVQTTfE1kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D8EA1C02CB0;
 Thu,  9 Feb 2023 15:24:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D08E1121314;
 Thu,  9 Feb 2023 15:24:03 +0000 (UTC)
Date: Thu, 9 Feb 2023 10:24:02 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v4 0/4] block: fix detect-zeroes= with
 BDRV_REQ_REGISTERED_BUF
Message-ID: <Y+UQEndqouKIvgdj@fedora>
References: <20230207203719.242926-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CCKtr2KJP4AVpZux"
Content-Disposition: inline
In-Reply-To: <20230207203719.242926-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--CCKtr2KJP4AVpZux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 03:37:15PM -0500, Stefan Hajnoczi wrote:
> v4:
> - Add 'r' to read_f() getopt() call [Hanna]
> - Fix qemu_io_alloc() and friends buf and len with qemuio_misalign [Hanna]
> - Fix qemu_iovec_destroy()/qemu_io_free() ordering in aio_write_done() [H=
anna]
> - Add mutually exclusive -z -r option check in aio_write_f() [Hanna]
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
>  qemu-io-cmds.c                                | 215 +++++++++++-------
>  .../tests/detect-zeroes-registered-buf        |  58 +++++
>  .../tests/detect-zeroes-registered-buf.out    |   7 +
>  4 files changed, 203 insertions(+), 80 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
>  create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf=
=2Eout
>=20
> --=20
> 2.39.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--CCKtr2KJP4AVpZux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPlEBIACgkQnKSrs4Gr
c8g37AgApGVCS9kCh7GZFC5Y6he+vuuFBeHarFtmlNAB9AmtOQe6qG/oTNbwTH0Z
idhWAIC6PVZ7/jMHTGfWskhDa2D3vHJCrmS7RljYndgUyGTcGRULlOtjH6XW5W0B
Nnqs5yi3vQRyiijPIfLe8MLNZNP9kAXD7PmQeizFw9ZiX+/XFSSjWJotSf6of6+Y
eBRkz/Bk4w/nF9pKagvSrz2w/SEQmfjXQvKbEmEMbFndbnfs60VfxgGMpR14UT9z
tOttfhicqN9oQyYPmTQR8PYLtlkWMg6AnP1Z2zlBOqv3JORUq9hcURP92P7z7xwQ
rUKIdepUo+hSOChHbMWApKXaAbdVIQ==
=xIov
-----END PGP SIGNATURE-----

--CCKtr2KJP4AVpZux--


