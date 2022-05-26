Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40150534BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:46:48 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu98p-00041G-2Y
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu93Z-00029S-0V
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu93W-0003bk-MY
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653554478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A9ceCHwT/0l1FsvGdeaz1WSzpM1f8XRtCZS3BFl2boo=;
 b=IYNTE7OkcX2A1w6d2s9O+ayAcoGi6fLiKTq4zJ3DD3kukLXegOcpkRiC5JD1opx47g2+mG
 POPxpwhJDF83zrjsUxJ0mzrFhLHb5+gbfF6ui/QOiOXYz3FtDfWdDvPIRbPZ4W6BsTY2sm
 qlmK6g2tGALeNCZ8+42gXJNJU4P8+ig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-pJDA3jpnMyGu0HCHI96lsA-1; Thu, 26 May 2022 04:41:13 -0400
X-MC-Unique: pJDA3jpnMyGu0HCHI96lsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8CCC3C0CD3E;
 Thu, 26 May 2022 08:41:12 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C77C40C128B;
 Thu, 26 May 2022 08:41:12 +0000 (UTC)
Date: Thu, 26 May 2022 09:41:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 02/10] block: Change bdrv_{pread, pwrite, pwrite_sync}()
 param order
Message-ID: <Yo89Jwy+C2r9iEo5@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-3-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ju7Zktfg4NMaJCY6"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-3-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Ju7Zktfg4NMaJCY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:32PM +0100, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with
> bdrv_co_{pread,pwrite}(), and in preparation to implement these
> functions using generated_co_wrapper.
>=20
> Callers were updated using this Coccinelle script:
>=20
>     @@ expression child, offset, buf, bytes, flags; @@
>     - bdrv_pread(child, offset, buf, bytes, flags)
>     + bdrv_pread(child, offset, bytes, buf, flags)
>=20
>     @@ expression child, offset, buf, bytes, flags; @@
>     - bdrv_pwrite(child, offset, buf, bytes, flags)
>     + bdrv_pwrite(child, offset, bytes, buf, flags)
>=20
>     @@ expression child, offset, buf, bytes, flags; @@
>     - bdrv_pwrite_sync(child, offset, buf, bytes, flags)
>     + bdrv_pwrite_sync(child, offset, bytes, buf, flags)
>=20
> Resulting overly-long lines were then fixed by hand.
>=20
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/blklogwrites.c             |  6 ++--
>  block/bochs.c                    | 10 +++---
>  block/cloop.c                    | 10 +++---
>  block/crypto.c                   |  4 +--
>  block/dmg.c                      | 26 +++++++--------
>  block/io.c                       | 12 +++----
>  block/parallels-ext.c            |  6 ++--
>  block/parallels.c                | 10 +++---
>  block/qcow.c                     | 34 +++++++++----------
>  block/qcow2-bitmap.c             | 14 ++++----
>  block/qcow2-cache.c              |  8 ++---
>  block/qcow2-cluster.c            | 22 ++++++-------
>  block/qcow2-refcount.c           | 56 +++++++++++++++++---------------
>  block/qcow2-snapshot.c           | 48 +++++++++++++--------------
>  block/qcow2.c                    | 47 ++++++++++++++-------------
>  block/qed.c                      |  8 ++---
>  block/vdi.c                      | 14 ++++----
>  block/vhdx-log.c                 | 18 +++++-----
>  block/vhdx.c                     | 28 ++++++++--------
>  block/vmdk.c                     | 50 ++++++++++++++--------------
>  block/vpc.c                      | 22 ++++++-------
>  block/vvfat.c                    | 10 +++---
>  include/block/block-io.h         | 10 +++---
>  tests/unit/test-block-iothread.c |  8 ++---
>  24 files changed, 242 insertions(+), 239 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Ju7Zktfg4NMaJCY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPPScACgkQnKSrs4Gr
c8hApQf/Wgo9OX2p1EZeo6cWxJf4+LDMrl4sBLYY+w8U/sxp8+VRmybXgGiveGXJ
eSFY7L2F4Mz/FvlAi5kQyBTJpmgojQzXeCEQH+XBMzaurA39INmG+eUJeRhjunRo
JSOPtHke6mz9Hi9UOBezrh5jyiePE6pnBBnFRHkGf2oza2ZY2yy26y4cuF2UDLa2
/9LEk63dOh5uHK95jnUng6G1ZdLKO8wDbrUeH40tArHAdinZ897v0eMaT/qRPcaU
LJ+EFV+qYo+onfFxVkVEy0p3YVidoK6U4teHKA9kFM/y1BjPA6nAZF6Mr/l94xYy
jUr99iYUmdZiHE3sCanIKow9go3ehQ==
=4DvF
-----END PGP SIGNATURE-----

--Ju7Zktfg4NMaJCY6--


