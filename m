Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56276D88A4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 22:34:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk9oW-0001ZY-Rz; Wed, 05 Apr 2023 16:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9oT-0001ZA-2W
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 16:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pk9oQ-0002zd-UY
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 16:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680726777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cwbwTElw7lBzTQdX7EUqMAWF9iJbExQX9VNXFKI6tSI=;
 b=cA2ttnYw/GBubQp3wYEeyRBSiBDUIuevfysg9Bp0U2fA/8xgfjj9GNbMsLqDcBXHU3klBK
 p0weLvL+zkXYzsDHmuewBz2a0mcO36KrvLQ7D+ibKci6/+0aQrJ2qFiQ6p81ouwRLskIc5
 sWmdmpVWRxww3H3Xtw4E0FHPbYq47aY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-x7pGG7lyOV62gg7BUIc96A-1; Wed, 05 Apr 2023 16:32:54 -0400
X-MC-Unique: x7pGG7lyOV62gg7BUIc96A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D613280049F;
 Wed,  5 Apr 2023 20:32:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26A922166B26;
 Wed,  5 Apr 2023 20:32:52 +0000 (UTC)
Date: Wed, 5 Apr 2023 16:32:51 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, damien.lemoal@opensource.wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v8 2/4] block: introduce zone append write for zoned
 devices
Message-ID: <20230405203251.GE676473@fedora>
References: <20230404153239.32234-1-faithilikerun@gmail.com>
 <20230404153239.32234-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HgU+M88XtWMSEDSR"
Content-Disposition: inline
In-Reply-To: <20230404153239.32234-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--HgU+M88XtWMSEDSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:32:37PM +0800, Sam Li wrote:
> A zone append command is a write operation that specifies the first
> logical block of a zone as the write position. When writing to a zoned
> block device using zone append, the byte offset of the call may point at
> any position within the zone to which the data is being appended. Upon
> completion the device will respond with the position where the data has
> been written in the zone.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  block/block-backend.c             | 60 +++++++++++++++++++++++++++++++
>  block/file-posix.c                | 56 +++++++++++++++++++++++++----
>  block/io.c                        | 27 ++++++++++++++
>  block/io_uring.c                  |  4 +++
>  block/linux-aio.c                 |  3 ++
>  block/raw-format.c                |  8 +++++
>  include/block/block-io.h          |  4 +++
>  include/block/block_int-common.h  |  3 ++
>  include/block/raw-aio.h           |  4 ++-
>  include/sysemu/block-backend-io.h |  9 +++++
>  10 files changed, 171 insertions(+), 7 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--HgU+M88XtWMSEDSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQt2vMACgkQnKSrs4Gr
c8j4Twf+PAo8bVQHx3QjeY4nLI5bwzmiu4cxPrn/9XY8XCBP4Q1zfejEawX15Ds3
5Nioarx8WJihaALw8hG0KRZmV7WmNa/EIRwesM/PVqPJUDpAkGIw2eIgbjeGFGNV
9YMf5oEWIGIGlYp7yvhSIrkgGEVup6fgAH0VvZGqmT/IFIT/P2t4uWdhnqRjdZ4b
zxfCZ648rezY62qgZUNZ+u9jyn8rF2MS5QnHqpe+hWw/N4pTctdFSiKKcxH7ZkPn
6AHlWP1XrXpUX0ziRWgAPNDXNMIc1p2rKXDA+pPo/BU5r0CHtCDKZhfKMnm/NY5L
B99UlP0bM1/4R5KXgllPUu0uAeN8EQ==
=bt9a
-----END PGP SIGNATURE-----

--HgU+M88XtWMSEDSR--


