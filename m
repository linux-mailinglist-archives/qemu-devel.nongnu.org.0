Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAC3043BA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:24:42 +0100 (CET)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4R8z-0000OS-R7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4R53-0007Zh-QA
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4R4x-0006jH-10
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611678030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEkS4acqpFa4PNtJuanNBXx0hHtXNMxs9EOpCjsbUfA=;
 b=JM21xFkmKsrWnOp3za+zgnU8v5Jpg/wirx5QIzAYBhXfpND/XnwvG5jWUrrK9GMbQ1JK9w
 i+Jvlsghox/tC6aTOwZJPnbnr2pj19JLM4EYpC3QrlcZr1D9DOBwcwHD+G1l7XQUZk2VFQ
 n/e9VQY/t5EOUOmF7vDKSl1RUPFskTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-xptw6nOXMZSfOa7AJlhnOw-1; Tue, 26 Jan 2021 11:20:27 -0500
X-MC-Unique: xptw6nOXMZSfOa7AJlhnOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC12C81440D;
 Tue, 26 Jan 2021 16:20:24 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F3BC5D720;
 Tue, 26 Jan 2021 16:20:24 +0000 (UTC)
Date: Tue, 26 Jan 2021 16:20:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <20210126162023.GB271392@stefanha-x1.localdomain>
References: <20210125204231.254925-1-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210125204231.254925-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 09:42:31PM +0100, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>=20
> Add support for using the broadcast nsid to issue a flush on all
> namespaces through a single command.
>=20
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h  |   8 +++
>  hw/block/nvme.c       | 123 +++++++++++++++++++++++++++++++++++++++---
>  hw/block/trace-events |   2 +
>  3 files changed, 126 insertions(+), 7 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAQQUcACgkQnKSrs4Gr
c8iPYgf/fGMm2YumYfeSbG+EEMU3DlPxCVBw/gQ8mRJx6C5KWREcXLG21w1Ysi96
+ly6RiSicK2wOyb8XFhTJNgqhuDoAo2Fgk3deYfiUF6dIjbl/3Nk/2OCScEkvx9E
crsv5Git4TcXsDNy5bE35TwGIIo08bhbRGf0DtRk05ek4JbsHwl+JL5llWdqC/aH
BpJg1l3zQ3sMDRMWjuFTHP2g23GyaSJerSdbjbgRoLV6ZSNc5YUhXjf+kPJ26dPm
7FrT4E6K62aj85Obu0Hgnpiu1RRySYZsom7H+8aFHvQ24w7xrwy9QldpKH0lzLcv
ctzaq0Qp8+u1mt5VG2XdvKXPuYve1w==
=f932
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--


