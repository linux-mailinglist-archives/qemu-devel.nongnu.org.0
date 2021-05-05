Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAE373AC4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:14:18 +0200 (CEST)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGPx-0004nW-8N
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leGNy-0004Gm-Se
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leGNw-0003L2-2i
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620216731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWcNHoAd5Cy62Qq3EjCYIvMntuDKJ1T/OrzEk+HA84s=;
 b=YgbGZ2B93obMtAURvZc85alr5QzL6Mkswpa8wtHdb926jTfQnaLr+QSNGEDnjApZfmsDUZ
 C9uvkC6dBU9FXM32AhDsSUfLK+unSBSxf/9GGynKI9h2aEa5+vpABG/dRBJ9EzQ//wSJqS
 E6SsYy8jyQ2rWU+9oo/F1RFG0KZ0F7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-7jLvMT8sNvKhCZmZy4sX-g-1; Wed, 05 May 2021 08:12:07 -0400
X-MC-Unique: 7jLvMT8sNvKhCZmZy4sX-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6231922025;
 Wed,  5 May 2021 12:12:06 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67EC65D9DE;
 Wed,  5 May 2021 12:12:02 +0000 (UTC)
Date: Wed, 5 May 2021 13:12:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 08/26] DAX: virtio-fs: Add cache BAR
Message-ID: <YJKLkQA2s6sgF587@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-9-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-9-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VF0eZzRa3+i2nN3h"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VF0eZzRa3+i2nN3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:42PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add a cache BAR into which files will be directly mapped.
> The size can be set with the cache-size=3D property, e.g.
>    -device vhost-user-fs-pci,chardev=3Dchar0,tag=3Dmyfs,cache-size=3D16G
>=20
> The default is no cache.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> with PPC fixes by:
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/virtio/vhost-user-fs-pci.c     | 32 +++++++++++++++++++++++++++++++
>  hw/virtio/vhost-user-fs.c         | 32 +++++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-fs.h |  2 ++
>  3 files changed, 66 insertions(+)
>=20
> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.=
c
> index 2ed8492b3f..20e447631f 100644
> --- a/hw/virtio/vhost-user-fs-pci.c
> +++ b/hw/virtio/vhost-user-fs-pci.c
> @@ -12,14 +12,19 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "virtio-pci.h"
>  #include "qom/object.h"
> +#include "standard-headers/linux/virtio_fs.h"
> +
> +#define VIRTIO_FS_PCI_CACHE_BAR 2
> =20
>  struct VHostUserFSPCI {
>      VirtIOPCIProxy parent_obj;
>      VHostUserFS vdev;
> +    MemoryRegion cachebar;
>  };
> =20
>  typedef struct VHostUserFSPCI VHostUserFSPCI;
> @@ -38,7 +43,9 @@ static Property vhost_user_fs_pci_properties[] =3D {
>  static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **=
errp)
>  {
>      VHostUserFSPCI *dev =3D VHOST_USER_FS_PCI(vpci_dev);
> +    bool modern_pio =3D vpci_dev->flags & VIRTIO_PCI_FLAG_MODERN_PIO_NOT=
IFY;
>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> +    uint64_t cachesize;
> =20
>      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
>          /* Also reserve config change and hiprio queue vectors */
> @@ -46,6 +53,31 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *=
vpci_dev, Error **errp)
>      }
> =20
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +    cachesize =3D dev->vdev.conf.cache_size;
> +
> +    if (cachesize && modern_pio) {
> +        error_setg(errp, "DAX Cache can not be used together with modern=
_pio");

It's not necessary to respin but it would help to capture the reason for
this limitation either in the error message or at least in a comment.

The problem is that PCI BARs are limited resources and enabling modern
PIO notify conflicts with the DAX Window BAR usage.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--VF0eZzRa3+i2nN3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSi5EACgkQnKSrs4Gr
c8ipBwf/dbWQcc1rtFMlUWSUUI8GtWI9VGtA+0cmpc49WP9Tj3Zfd0JFD3CO56S3
TAE08mhCu4qh6vgwtdTYdxapo17k6l64WLMd2/XhgbTw25ic8liTSTmpbezlCHgU
pkYJzrs+VbYvaMWUS05XnHLi9+CRdAmHq5XRVV+D0uVTNDo6kABWnTny8yC4F2bh
hmCmB5y5tpkqZYFzjOEayKE3ny00Rnsz53stvW8S13/OhbXDZDlVkcTwT3h9pN53
5IJnES9JtK81H07carmQvsFtteLqBGzWoGK3/FIwqlKSD3aCcuVy2UHP1R+I866n
3CAqw9ATEcAm1cWqyfeUzAmO0o6kOg==
=Glh0
-----END PGP SIGNATURE-----

--VF0eZzRa3+i2nN3h--


