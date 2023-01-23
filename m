Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEA67871E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:04:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK31h-0002ce-6I; Mon, 23 Jan 2023 15:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK31L-0002Vl-EQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:02:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK31J-0005WE-Db
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674504140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tB6h7uyrKa3UJUuBah8OqJEl2dDBE99f+a6sFnMw6/k=;
 b=bwl9GEZHc1WzfbBDYN7Xizhl8rIVIaFUGD+kCSgpJ+DISlBx+HFyaB9pPQ5/398YQ+MBcK
 BA/0h+sf+2cg4m21UY2Qr/ukohl1+R4U4XifX/H+0kXE5hqOzw96yLFSTo+ypc7mPY4VqU
 jnHPhO2nGZfaR8xP/JiRf7Hq3mPoVxg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-taxD31oLNDqPth1Y6YgKQg-1; Mon, 23 Jan 2023 15:02:18 -0500
X-MC-Unique: taxD31oLNDqPth1Y6YgKQg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8C9D802BEE;
 Mon, 23 Jan 2023 20:02:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA01492C3C;
 Mon, 23 Jan 2023 20:02:16 +0000 (UTC)
Date: Mon, 23 Jan 2023 15:02:15 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block/blkio: Fix inclusion of required headers
Message-ID: <Y87nx8rF8gVOg+BW@fedora>
References: <2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qCLnm7WrM7Z8vPff"
Content-Disposition: inline
In-Reply-To: <2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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


--qCLnm7WrM7Z8vPff
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 01:39:27PM +0100, Peter Krempa wrote:
> After recent header file inclusion rework the build fails when the blkio
> module is enabled:
>=20
> ../block/blkio.c: In function =E2=80=98blkio_detach_aio_context=E2=80=99:
> ../block/blkio.c:321:24: error: implicit declaration of function =E2=80=
=98bdrv_get_aio_context=E2=80=99; did you mean =E2=80=98qemu_get_aio_contex=
t=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
>       |                        ^~~~~~~~~~~~~~~~~~~~
>       |                        qemu_get_aio_context
> ../block/blkio.c:321:24: error: nested extern declaration of =E2=80=98bdr=
v_get_aio_context=E2=80=99 [-Werror=3Dnested-externs]
> ../block/blkio.c:321:24: error: passing argument 1 of =E2=80=98aio_set_fd=
_handler=E2=80=99 makes pointer from integer without a cast [-Werror=3Dint-=
conversion]
>   321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                        |
>       |                        int
> In file included from /home/pipo/git/qemu.git/include/qemu/job.h:33,
>                  from /home/pipo/git/qemu.git/include/block/blockjob.h:30,
>                  from /home/pipo/git/qemu.git/include/block/block_int-glo=
bal-state.h:28,
>                  from /home/pipo/git/qemu.git/include/block/block_int.h:2=
7,
>                  from ../block/blkio.c:13:
> /home/pipo/git/qemu.git/include/block/aio.h:476:37: note: expected =E2=80=
=98AioContext *=E2=80=99 but argument is of type =E2=80=98int=E2=80=99
>   476 | void aio_set_fd_handler(AioContext *ctx,
>       |                         ~~~~~~~~~~~~^~~
> ../block/blkio.c: In function =E2=80=98blkio_file_open=E2=80=99:
> ../block/blkio.c:821:34: error: passing argument 2 of =E2=80=98blkio_atta=
ch_aio_context=E2=80=99 makes pointer from integer without a cast [-Werror=
=3Dint-conversion]
>   821 |     blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                                  |
>       |                                  int
>=20
> Fix it by including 'block/block-io.h' which contains the required
> declarations.
>=20
> Fixes: e2c1c34f139f49ef909bb4322607fb8b39002312
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>  block/blkio.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--qCLnm7WrM7Z8vPff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPO58cACgkQnKSrs4Gr
c8jcWwf/SnQMbxXpmeIr6g68rh6ci4v/aRDLHxUm8eWvN73gcGw5vh5a6SkmAm4a
7GzsRTEFGfG6ggjQFzivemJfqiSCEADlRjOCDyDkefJZ3FfSYVYVLd+K4BkqougQ
htD6Cgh7Nrb4Du5usePXWoV9sCLiC6x0aHREQss+g49aWytgYHOvIhV2S6BRRiAC
SBZ/lTpHoGVYckWcb8u1Ca5KGPbJhU850Bd49/q4mP4gVNXUup4AAT1WeI0rBB86
y8ZinqMTx8xziqfu8QECOBU5N/7cnEFmv1mqdqwnDLe4WXJyUs7QN4KFkCiO2QV9
3ho0YYoWIuXTAjxUvBY1okoO2PzrUA==
=bRbk
-----END PGP SIGNATURE-----

--qCLnm7WrM7Z8vPff--


