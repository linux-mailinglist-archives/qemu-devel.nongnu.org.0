Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BD3FEB9A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:53:20 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjPL-0006uN-Ri
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLjIh-0006OQ-EZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLjIe-0004ZN-Lz
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vqf6YJK41I9hsdt1ZGLXngnfr0RWByRwTCE2raw2NEg=;
 b=Y2t2YKYD8hVtKP9a39pzasH8IVApXKi01IpqDdTGOxe970RhqtKPPbO/t9OWTLdT/NJ6GX
 UImLruldEfWof6Lte2OxL1OKV/17bstqSeqIKR9DorIDabg6dBbXFGOlEwgATbkI1nPMLF
 r5xHAffxrido8LtcAaYA+HKumrmgwvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-TRG6WUn0MnaIcLvNPvxijA-1; Thu, 02 Sep 2021 05:46:22 -0400
X-MC-Unique: TRG6WUn0MnaIcLvNPvxijA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BF4984A5E4;
 Thu,  2 Sep 2021 09:46:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C95255DEB8;
 Thu,  2 Sep 2021 09:46:16 +0000 (UTC)
Date: Thu, 2 Sep 2021 10:46:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 00/11] block/nvme: Rework error reporting
Message-ID: <YTCdZ59BmlyIKip0@stefanha-x1.localdomain>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hFVi6TGVKcqwDSb5"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hFVi6TGVKcqwDSb5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 09:00:14AM +0200, Philippe Mathieu-Daud=E9 wrote:
> (Series fully reviewed)
>=20
> Hi,
>=20
> This series contains various patches sent last year with
> review comments addressed, few more cleanups, and a new
> patch which remove the spurious "VFIO_MAP_DMA failed: No
> space left on device" now poping up since commit 15a730e7a.
> (it is the expected behavior, which is why we retry the
> same call after flushing the DMA mappings).
>=20
> Since v2:
> - qemu_vfio_find_[fixed/temp]_iova retun bool (Klaus)
> - Add Klaus's R-b
>=20
> Since v1:
> - Addressed Klaus review comments (cleaner Error* handling)
> - Add Klaus's R-b
>=20
> Regards,
>=20
> Phil.
>=20
> Philippe Mathieu-Daud=E9 (11):
>   block/nvme: Use safer trace format string
>   util/vfio-helpers: Let qemu_vfio_verify_mappings() use error_report()
>   util/vfio-helpers: Replace qemu_mutex_lock() calls with
>     QEMU_LOCK_GUARD
>   util/vfio-helpers: Remove unreachable code in qemu_vfio_dma_map()
>   block/nvme: Have nvme_create_queue_pair() report errors consistently
>   util/vfio-helpers: Pass Error handle to qemu_vfio_dma_map()
>   util/vfio-helpers: Extract qemu_vfio_water_mark_reached()
>   util/vfio-helpers: Use error_setg in qemu_vfio_find_[fixed/temp]_iova
>   util/vfio-helpers: Simplify qemu_vfio_dma_map() returning directly
>   util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error
>   block/nvme: Only report VFIO error on failed retry
>=20
>  include/qemu/vfio-helpers.h |  2 +-
>  block/nvme.c                | 29 +++++++----
>  util/vfio-helpers.c         | 99 ++++++++++++++++++++-----------------
>  block/trace-events          |  2 +-
>  4 files changed, 76 insertions(+), 56 deletions(-)
>=20
> --=20
> 2.31.1
>=20
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--hFVi6TGVKcqwDSb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEwnWcACgkQnKSrs4Gr
c8gzYAf/f04hWqPa7l+pmDbCLgYclbh3E9BiDZrOYCdHdYxpS7V9ePf+MnIsQYha
Jprtrv8FD0u8nzKYW0wpeWnFcGl6FjJgbX+rdBINIHbhoX5NQxf61pibmHyzGviV
UMDK/iwtmXyZRmatVY/f2FJh3si4tN6kukxFeMvLJaiAGN7RPalIrZCMDMOjHJuY
/vOcbr0p7Ads82Y8xUAlz9hdNU+8Gvpj4GdGh5H8maMrnTp//RopefDi0dfYmDrY
2pR/0igQGzV+bYRvuao/EIsdkiNKzQ/Uo9ydEv1ozitRGBKifAMA2ErtBPBMWpVl
3oRTeYJc8SYRdNN/YWbpL2fjqG/Y4g==
=lryr
-----END PGP SIGNATURE-----

--hFVi6TGVKcqwDSb5--


