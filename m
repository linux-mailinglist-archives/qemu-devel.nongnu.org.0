Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEE402B9F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:19:50 +0200 (CEST)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNct3-0003iN-Nh
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcpA-0006Eb-Hi
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNcp7-0002pf-PD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631027744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EhVI4lxwLD3pWuHG+RZ3/IJwKtGMft+hIJPZKq+t4i0=;
 b=WSUvrdraCBDeZ0ml95iLV53frUrTxzcnvsNDuiiLM9q3USJh4YvFJqfBVRr5GsZGvnkEBy
 LI+/P+5BRCMMN0aoQZ//gw6y1lm+pnoy8dlD5a29CHz2JzkircfVMR3B97ir23lDjq3cDK
 74MusEO7UWcOQtzOh1UIHtNfQOTMeoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-jd89WWacNp6rP9_V-AeMVg-1; Tue, 07 Sep 2021 11:15:42 -0400
X-MC-Unique: jd89WWacNp6rP9_V-AeMVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FBB10C4E1C;
 Tue,  7 Sep 2021 15:14:48 +0000 (UTC)
Received: from localhost (unknown [10.39.194.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39B435D9DE;
 Tue,  7 Sep 2021 15:14:43 +0000 (UTC)
Date: Tue, 7 Sep 2021 16:14:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 11/16] vfio-user: get and set IRQs
Message-ID: <YTeB4n1CkgutJJmA@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <4d292fab645b18b8a20f0f5a83356ae7fc0efa28.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4d292fab645b18b8a20f0f5a83356ae7fc0efa28.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wXiT7BqV+ZRk/dHw"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--wXiT7BqV+ZRk/dHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:42:44AM -0700, Elena Ufimtseva wrote:
> From: John Johnson <john.g.johnson@oracle.com>
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/vfio/user-protocol.h |  25 ++++++++++
>  hw/vfio/user.h          |   2 +
>  hw/vfio/common.c        |  26 ++++++++--
>  hw/vfio/pci.c           |  31 ++++++++++--
>  hw/vfio/user.c          | 106 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 181 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 56904cf872..5614efa0a4 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -109,6 +109,31 @@ typedef struct {
>      uint64_t offset;
>  } VFIOUserRegionInfo;
> =20
> +/*
> + * VFIO_USER_DEVICE_GET_IRQ_INFO
> + * imported from struct vfio_irq_info
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t index;
> +    uint32_t count;
> +} VFIOUserIRQInfo;
> +
> +/*
> + * VFIO_USER_DEVICE_SET_IRQS
> + * imported from struct vfio_irq_set
> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t index;
> +    uint32_t start;
> +    uint32_t count;
> +} VFIOUserIRQSet;
> +
>  /*
>   * VFIO_USER_REGION_READ
>   * VFIO_USER_REGION_WRITE
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 02f832a173..248ad80943 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -74,6 +74,8 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Er=
ror **errp);
>  int vfio_user_get_info(VFIODevice *vbasedev);
>  int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
>                                struct vfio_region_info *info, VFIOUserFDs=
 *fds);
> +int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *i=
nfo);
> +int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq);
>  int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t=
 offset,
>                            uint32_t count, void *data);
>  int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a8b1ea9358..9fe3e05dc6 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -71,7 +71,11 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int i=
ndex)
>          .count =3D 0,
>      };
> =20
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    if (vbasedev->proxy !=3D NULL) {
> +        vfio_user_set_irqs(vbasedev, &irq_set);
> +    } else {
> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    }
>  }
> =20
>  void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -84,7 +88,11 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev,=
 int index)
>          .count =3D 1,
>      };
> =20
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    if (vbasedev->proxy !=3D NULL) {
> +        vfio_user_set_irqs(vbasedev, &irq_set);
> +    } else {
> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    }
>  }
> =20
>  void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
> @@ -97,7 +105,11 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, =
int index)
>          .count =3D 1,
>      };
> =20
> -    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    if (vbasedev->proxy !=3D NULL) {
> +        vfio_user_set_irqs(vbasedev, &irq_set);
> +    } else {
> +        ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
> +    }
>  }
> =20
>  static inline const char *action_to_str(int action)
> @@ -178,8 +190,12 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int=
 index, int subindex,
>      pfd =3D (int32_t *)&irq_set->data;
>      *pfd =3D fd;
> =20
> -    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> -        ret =3D -errno;
> +    if (vbasedev->proxy !=3D NULL) {
> +        ret =3D vfio_user_set_irqs(vbasedev, irq_set);
> +    } else {
> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
> +            ret =3D -errno;
> +        }
>      }
>      g_free(irq_set);
> =20
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ea0df8be65..282de6a30b 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -403,7 +403,11 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, =
bool msix)
>          fds[i] =3D fd;
>      }
> =20
> -    ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> +    if (vdev->vbasedev.proxy !=3D NULL) {
> +        ret =3D vfio_user_set_irqs(&vdev->vbasedev, irq_set);
> +    } else {
> +        ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
> +    }
> =20
>      g_free(irq_set);
> =20
> @@ -2675,7 +2679,13 @@ static void vfio_populate_device(VFIOPCIDevice *vd=
ev, Error **errp)
> =20
>      irq_info.index =3D VFIO_PCI_ERR_IRQ_INDEX;
> =20
> -    ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info=
);
> +    if (vbasedev->proxy !=3D NULL) {
> +        ret =3D vfio_user_get_irq_info(vbasedev, &irq_info);
> +    } else {
> +        ret =3D ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_=
info);
> +    }
> +
> +
>      if (ret) {
>          /* This can fail for an old kernel or legacy PCI dev */
>          trace_vfio_populate_device_get_irq_info_failure(strerror(errno))=
;
> @@ -2794,8 +2804,16 @@ static void vfio_register_req_notifier(VFIOPCIDevi=
ce *vdev)
>          return;
>      }
> =20
> -    if (ioctl(vdev->vbasedev.fd,
> -              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count=
 < 1) {
> +    if (vdev->vbasedev.proxy !=3D NULL) {
> +        if (vfio_user_get_irq_info(&vdev->vbasedev, &irq_info) < 0) {
> +            return;
> +        }
> +    } else {
> +        if (ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info=
) < 0) {
> +            return;
> +        }
> +    }
> +    if (irq_info.count < 1) {
>          return;
>      }
> =20
> @@ -3557,6 +3575,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev,=
 Error **errp)
>          }
>      }
> =20
> +    vfio_register_err_notifier(vdev);
> +    vfio_register_req_notifier(vdev);
> +
> +    return;
> +
>  out_deregister:
>      pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
>      kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 83235b2411..b68ca1279d 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -768,6 +768,112 @@ int vfio_user_get_region_info(VFIODevice *vbasedev,=
 int index,
>      return 0;
>  }
> =20
> +int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *i=
nfo)
> +{
> +    VFIOUserIRQInfo msg;
> +
> +    memset(&msg, 0, sizeof(msg));
> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_IRQ_INFO,
> +                          sizeof(msg), 0);
> +    msg.argsz =3D info->argsz;
> +    msg.index =3D info->index;
> +
> +    vfio_user_send_recv(vbasedev->proxy, &msg.hdr, NULL, 0, 0);
> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> +        return -msg.hdr.error_reply;
> +    }
> +
> +    memcpy(info, &msg.argsz, sizeof(*info));

Should this be info.count =3D msg.count instead? Not sure why argsz is
used here.

Also, I just noticed the lack of endianness conversion in this patch
series. The spec says values are little-endian but these patches mostly
use host-endian. Did I miss something?

--wXiT7BqV+ZRk/dHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE3geIACgkQnKSrs4Gr
c8jqJwgAl6Z05067T+RpDkQGIXUjHsGqkbFwXqB2SNweUOjztUWa5PXpiLIdsprR
WOF9z3gkgObEL5tbUZ6e7fCj4ZOB5Ht8CldkdB2wHRLDp+vjZVnychAUjQ3xPNb6
V+TxpHodv5o4cYvOCt2a+TH7MaNKFK/ebNrkB6/s+8JViKd8OdzLiaOw/XFA8aT/
tlhXDOp/gsHet68n3xc93hP7kJwb4DgWOn1uZi8uE1AI9RO5yJNZoVtFuOAJLW3N
IHFuSWx0/GwaIElihipIx8Jez/jBJkdQZLqjAErSCxdRMrR8V9VpO4xNBGx8yP4z
zdVjgn+PvosfN0k8A2OIRoZempin8w==
=dSr9
-----END PGP SIGNATURE-----

--wXiT7BqV+ZRk/dHw--


