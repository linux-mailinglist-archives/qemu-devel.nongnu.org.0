Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107604037B8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:19:44 +0200 (CEST)
Received: from localhost ([::1]:36734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNugB-000477-3i
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuRo-0006XN-Tn
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNuRl-0002ys-5e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631095488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hKbytCQcHoIiZgL3lHMpYb4IRomg4nyFm8vBDrF/2g=;
 b=NvfG0dl36G7numVGhhXzMsGPDNB4mY3h+H1teSBRKTKlPJE0aIB7qQk+tC2Yi3uzcVnBY5
 TsfrAn29rgGJLdvyyenIDa2FIJjlk935z06Z99Gw4lttZawX81I5cx6p0MNZSgW1U0kT+K
 4nt5H7YBl2ljksgnOVboJemjowjGR84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-wiJCwNYeM6SQC9rLABAOUg-1; Wed, 08 Sep 2021 06:04:44 -0400
X-MC-Unique: wiJCwNYeM6SQC9rLABAOUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 881AF9126D;
 Wed,  8 Sep 2021 10:04:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 788D260C17;
 Wed,  8 Sep 2021 10:04:39 +0000 (UTC)
Date: Wed, 8 Sep 2021 11:04:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 16/16] vfio-user: migration support
Message-ID: <YTiKtg7peEyOUQI8@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <42758d8b56b1036d86cf2252c175071c1094a8b0.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <42758d8b56b1036d86cf2252c175071c1094a8b0.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yIvnKdsuY5B/OB93"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yIvnKdsuY5B/OB93
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:49AM -0700, Elena Ufimtseva wrote:
> @@ -1356,7 +1365,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *co=
ntainer, uint64_t iova,
>          goto err_out;
>      }
> =20
> -    ret =3D ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
> +    if (container->proxy !=3D NULL) {
> +        ret =3D vfio_user_dirty_bitmap(container->proxy, dbitmap, range)=
;
> +    } else {
> +        ret =3D ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
> +    }
>      if (ret) {
>          error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
>                  " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,

This error_report() relies on errno. vfio_user_region_write() doesn't
set errno.

> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 82f654afb6..89926a3b01 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -27,6 +27,7 @@
>  #include "pci.h"
>  #include "trace.h"
>  #include "hw/hw.h"
> +#include "user.h"
> =20
>  /*
>   * Flags to be used as unique delimiters for VFIO devices in the migrati=
on
> @@ -49,10 +50,18 @@ static int64_t bytes_transferred;
>  static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int c=
ount,
>                                    off_t off, bool iswrite)
>  {
> +    VFIORegion *region =3D &vbasedev->migration->region;
>      int ret;
> =20
> -    ret =3D iswrite ? pwrite(vbasedev->fd, val, count, off) :
> -                    pread(vbasedev->fd, val, count, off);
> +    if (vbasedev->proxy !=3D NULL) {
> +        ret =3D iswrite ?
> +            vfio_user_region_write(vbasedev, region->nr, off, count, val=
) :
> +            vfio_user_region_read(vbasedev, region->nr, off, count, val)=
;
> +    } else {
> +        off +=3D region->fd_offset;
> +        ret =3D iswrite ? pwrite(vbasedev->fd, val, count, off) :
> +                        pread(vbasedev->fd, val, count, off);
> +    }
>      if (ret < count) {
>          error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
>                       HWADDR_PRIx", err: %s", iswrite ? "write" : "read",=
 count,

Another errno user. I haven't exhaustively audited all the code for
these issues. Please take a look.

--yIvnKdsuY5B/OB93
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4irYACgkQnKSrs4Gr
c8jtzAf/YJORePUMUvmf93+9yvvUSRHvXZfH0rYfCLT79pNeZAhqeu4MS4oUaXu/
+CO5SfuIiRCNOQZ/2FlzTfaPa22lYiJV/8H5/W8E4Q5tEtD48HrEt11WLguNVN5F
sKgk9NJEuJGNH/fh8sD/6vddxBWR1iEiJi47S2NPTCP9KGZ8MvqLzTHJHfChBITt
chxLc11styQyGUXF6iBF1oNnz8AuZYBb3lFx5JRvb+xDuH0YO8i9qtQGzUbY8SjP
34dyKmuDdElWAA8q0zWSCODsZ0N+jb5pzxCx/3WU+vUWo79rBa7IPnr3CtLRrX4v
InjdNWNhJmysMXnioOLtxs0+BdpskQ==
=JyeE
-----END PGP SIGNATURE-----

--yIvnKdsuY5B/OB93--


