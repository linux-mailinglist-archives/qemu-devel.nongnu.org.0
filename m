Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EAE52BB9D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:54:15 +0200 (CEST)
Received: from localhost ([::1]:54204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrK7y-0002Bc-Pk
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK4n-0007OT-H5
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK4k-0006Sq-OH
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652881853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lv4xy3UwWwj3UF4+QcY4HPuqcLt9tZFkozcRWq3iXus=;
 b=Xu2uUcrJp0AmVgeB87fPBQk0QPJh/ORE4t24Jalw978F6ItQnTZeZ2NRzCgt69MEzz2IcM
 Sss7obAwumaXcyYkozI2BucjbZgd3Fy5zJDtS+pDxXq231dYbd5YEAxsYzEK1NM5CMfuXa
 X0DliHZmAY+Y4LwVCcfm+yRLFsRZYBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-fZfWUhUcOCuM8eWKQNmZfQ-1; Wed, 18 May 2022 09:50:49 -0400
X-MC-Unique: fZfWUhUcOCuM8eWKQNmZfQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C90A185A79C;
 Wed, 18 May 2022 13:50:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C12A2492C3B;
 Wed, 18 May 2022 13:50:48 +0000 (UTC)
Date: Wed, 18 May 2022 14:50:47 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 6/8] vduse-blk: Implement vduse-blk export
Message-ID: <YoT5t/0ReR/dZbFL@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-7-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FJcNgPmdIuLyh+MP"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-7-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--FJcNgPmdIuLyh+MP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:49PM +0800, Xie Yongji wrote:
> This implements a VDUSE block backends based on
> the libvduse library. We can use it to export the BDSs
> for both VM and container (host) usage.
>=20
> The new command-line syntax is:
>=20
> $ qemu-storage-daemon \
>     --blockdev file,node-name=3Ddrive0,filename=3Dtest.img \
>     --export vduse-blk,node-name=3Ddrive0,id=3Dvduse-export0,writable=3Don
>=20
> After the qemu-storage-daemon started, we need to use
> the "vdpa" command to attach the device to vDPA bus:
>=20
> $ vdpa dev add name vduse-export0 mgmtdev vduse
>=20
> Also the device must be removed via the "vdpa" command
> before we stop the qemu-storage-daemon.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  MAINTAINERS                   |   4 +-
>  block/export/export.c         |   6 +
>  block/export/meson.build      |   5 +
>  block/export/vduse-blk.c      | 312 ++++++++++++++++++++++++++++++++++
>  block/export/vduse-blk.h      |  20 +++
>  meson.build                   |  13 ++
>  meson_options.txt             |   2 +
>  qapi/block-export.json        |  25 ++-
>  scripts/meson-buildoptions.sh |   4 +
>  9 files changed, 388 insertions(+), 3 deletions(-)
>  create mode 100644 block/export/vduse-blk.c
>  create mode 100644 block/export/vduse-blk.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FJcNgPmdIuLyh+MP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE+bcACgkQnKSrs4Gr
c8goNwf/bKOJnM5PoN73sGAJupQS98pTWiCbINkIXyY6GTElGlXga0kCm6VO13o7
9JG9wmxbHspR7PLl8ZMYaAVwV7tDbcrPA4qk0EBmHehl1lLgDoRyLpSmUwsXrp6d
a/q/P8TWLEOZOMMODjKo9zJoNCEZ+Aoc2c2Kwd3sJvrXukXtP5ENING091FR54VL
mCHc1ZLzOFOhFK2+oXFLovuhBGGgNDP63i01MyOAuEDQr/4qUZOvoVYKjI/6mA3L
XV1D1zMo3y89l+UtawG5/S0/UX+uBm81EXgym5Mj0hEmgIuNt/5DFONMAFxE2D7Q
QV7XXw9417a2MkMktwIt76wijKODBQ==
=PWYc
-----END PGP SIGNATURE-----

--FJcNgPmdIuLyh+MP--


