Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50930597A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:21:25 +0100 (CET)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4it1-0001eG-G6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4ira-0001DC-Vr
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4irY-0005nm-2w
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611746390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JD5wQ4kMhvhyFGuRWis7alx5lgnVsePET2Y4oTY/JXc=;
 b=AzuBGsNGxXRyo+A32FwqTo4PmkdAaFzHNfdNH21/UiC9Q+dGr62jSPOffxTgB5ykzhGZFS
 +MKp/ko68Ks8NVXtQtYMPSz7voSzAtqVyJDNHyeCTbQcOlUjErJpyuth+MDqoF5jj1Mjv7
 KA9iYPD8SXhnlxjIdmT317B3M6ZCwcA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-9q7-wa3_MIGkJ-z5u2_50g-1; Wed, 27 Jan 2021 06:19:44 -0500
X-MC-Unique: 9q7-wa3_MIGkJ-z5u2_50g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30D48144E0;
 Wed, 27 Jan 2021 11:19:42 +0000 (UTC)
Received: from localhost (ovpn-115-15.ams2.redhat.com [10.36.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2825D768;
 Wed, 27 Jan 2021 11:19:39 +0000 (UTC)
Date: Wed, 27 Jan 2021 11:19:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: lagarcia@linux.ibm.com
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
Message-ID: <20210127111938.GH299797@stefanha-x1.localdomain>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
In-Reply-To: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
>=20
> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
> any of them and tries to mount the vhost-user filesystem inside the
> guest, whenever the user tries to access the mount point, the system
> will hang forever.
>=20
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---
>  hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>  hw/virtio/vhost-user-fs.c     | 5 +++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.=
c
> index 2ed8492b3f..564d1fd108 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -11,6 +11,8 @@
>   * top-level directory.
>   */
> =20
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "qemu/osdep.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/vhost-user-fs.h"
> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *=
vpci_dev, Error **errp)
>          vpci_dev->nvectors =3D dev->vdev.conf.num_request_queues + 2;
>      }
> =20
> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
> +        error_setg(errp, "ATS is currently not supported with vhost-user=
-fs-pci");
> +        return;
> +    }

Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?

What needs to be added to support ATS?

> +
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>  }
> =20
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index ac4fc34b36..914d68b3ee 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Err=
or **errp)
>          return;
>      }
> =20
> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
> +        error_setg(errp, "IOMMU is currently not supported with vhost-us=
er-fs");
> +        return;
> +    }
> +
>      if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {

I thought IOMMU support depends on the vhost-user device backend (e.g.
virtiofsd), so the vhost-user backend should participate in advertising
this feature.

Perhaps the check should be:

    ret =3D vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
                         VHOST_BACKEND_TYPE_USER, 0);
    if (ret < 0) {
        error_setg_errno(errp, -ret, "vhost_dev_init failed");
        goto err_virtio;
    }
+
+   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
+       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM)))=
 {
+       error_setg(errp, "IOMMU is not supported by the vhost-user device b=
ackend");
+       goto err_iommu_needed;
+   }

Also, can this logic be made generic for all vhost-user devices? It's
not really specific to vhost-user-fs.

Stefan

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmARTEoACgkQnKSrs4Gr
c8jblQf/fPz2o4FRHFx2TrXEnktNh/RoTm75VdvMCSZe6l/pVTUZVl7jEKHNdV8t
owv5V6ALxc0xj9zX1ghWYbIzBzhG8z6YqrXtTaQSTokjm5UNVfW/UCWgmdC+fGg+
KONFP2tVLmZlCReQ5ZfzJmMEtkh9Bj1h+7/XXGO1bby0+dM24NACJ3wd/jn22TVm
ebr7BNKSxbAyaJpX1zvsSydwpjqfNxC1sqzN0Jz+0Yc+7Zxahj7jgJZk4OfwrlKo
BUXFPMvfulWyxmxjpRbnP3JKmQbx9o2qN+qavIRLzVsHSJQBWYJUdq28H0vjySMq
tb9yZafxPCoZj84h0N5gTuFce+S5lw==
=y/v3
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--


