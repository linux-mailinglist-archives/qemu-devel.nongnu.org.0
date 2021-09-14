Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9434040AE44
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:52:36 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7vN-00041A-GK
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ7pb-0006dR-5v
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:46:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQ7pY-0008OS-CV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631623590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AdwejRu1usMPGgC9nuLwPHr9+JEF0hgnqCqwhfp8JMM=;
 b=HELneTQGltw7A/qeJhGBrZnvQrElZ1fpIldeNz/F9AxHezonp3j8jcSKwzQSTFzWbOdIbT
 idHhrYaDWGDwlplSeVvk4ux0DXb5MQporj0NBFOAEO4Fuvfj2I5ely41aVF3kOe0WzqAVv
 ilrCUBVpK95AlEY7UScEZhfxXefLITw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-SV6lAdb4MUGyznZvOh7FOA-1; Tue, 14 Sep 2021 08:46:28 -0400
X-MC-Unique: SV6lAdb4MUGyznZvOh7FOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD4469017C3;
 Tue, 14 Sep 2021 12:46:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA69A5C3DF;
 Tue, 14 Sep 2021 12:46:23 +0000 (UTC)
Date: Tue, 14 Sep 2021 13:46:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v6] virtio/vsock: add two more queues for datagram types
Message-ID: <YUCZntCNrLQTu9Xu@stefanha-x1.localdomain>
References: <20210913221843.2304308-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210913221843.2304308-1-jiang.wang@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jbSHFr5jgSaStY/i"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: arseny.krasnov@kaspersky.com, jasowang@redhat.com, sgarzare@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jbSHFr5jgSaStY/i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 10:18:43PM +0000, Jiang Wang wrote:
> Datagram sockets are connectionless and unreliable.
> The sender does not know the capacity of the receiver
> and may send more packets than the receiver can handle.
>=20
> Add two more dedicate virtqueues for datagram sockets,
> so that it will not unfairly steal resources from
> stream and future connection-oriented sockets.
>=20
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---
> v1 -> v2: use qemu cmd option to control number of queues,
>         removed configuration settings for dgram.
> v2 -> v3: use ioctl to get features and decide number of
>         virt queues, instead of qemu cmd option.
> v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>         in vhost_vsock_common_realize to indicate dgram is supported or n=
ot.
> v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>         enable_dgram
> v5 -> v6: fix style errors. Imporve error handling of
>         vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and anothe=
r one.
>=20
>  hw/virtio/vhost-user-vsock.c                  |  2 +-
>  hw/virtio/vhost-vsock-common.c                | 25 ++++++++++++--
>  hw/virtio/vhost-vsock.c                       | 34 ++++++++++++++++++-
>  include/hw/virtio/vhost-vsock-common.h        |  6 ++--
>  include/hw/virtio/vhost-vsock.h               |  3 ++
>  include/standard-headers/linux/virtio_vsock.h |  1 +
>  6 files changed, 64 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
> index 6095ed7349..e9ec0e1c00 100644
> --- a/hw/virtio/vhost-user-vsock.c
> +++ b/hw/virtio/vhost-user-vsock.c
> @@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Erro=
r **errp)
>          return;
>      }
> =20
> -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
> +    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);

VIRTIO_VSOCK_F_DGRAM support should work equally well for
vhost-user-vsock. I don't think there is a need to disable it here.

> =20
>      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
> =20
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-commo=
n.c
> index 4ad6e234ad..d94636e04e 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -17,6 +17,8 @@
>  #include "hw/virtio/vhost-vsock.h"
>  #include "qemu/iov.h"
>  #include "monitor/monitor.h"
> +#include <sys/ioctl.h>
> +#include <linux/vhost.h>
> =20
>  int vhost_vsock_common_start(VirtIODevice *vdev)
>  {
> @@ -196,9 +198,11 @@ int vhost_vsock_common_post_load(void *opaque, int v=
ersion_id)
>      return 0;
>  }
> =20
> -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
> +void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> +                               bool enable_dgram)
>  {
>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> +    int nvqs =3D VHOST_VSOCK_NVQS;
> =20
>      virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>                  sizeof(struct virtio_vsock_config));
> @@ -209,12 +213,20 @@ void vhost_vsock_common_realize(VirtIODevice *vdev,=
 const char *name)
>      vvc->trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                         vhost_vsock_common_handle_output)=
;
> =20
> +    if (enable_dgram) {
> +        nvqs =3D VHOST_VSOCK_NVQS_DGRAM;
> +        vvc->dgram_recv_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_=
SIZE,
> +                                              vhost_vsock_common_handle_=
output);
> +        vvc->dgram_trans_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE=
_SIZE,
> +                                              vhost_vsock_common_handle_=
output);
> +    }

I think the virtqueues can be added unconditionally.

> +
>      /* The event queue belongs to QEMU */
>      vvc->event_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>                                         vhost_vsock_common_handle_output)=
;
> =20
> -    vvc->vhost_dev.nvqs =3D ARRAY_SIZE(vvc->vhost_vqs);
> -    vvc->vhost_dev.vqs =3D vvc->vhost_vqs;
> +    vvc->vhost_dev.nvqs =3D nvqs;
> +    vvc->vhost_dev.vqs =3D g_new0(struct vhost_virtqueue, vvc->vhost_dev=
.nvqs);

IIUC the number of virtqueues needs to be the maximum supported number.
It's okay to have more virtqueues than needed. The feature bit is used
by the driver to detect the device's support for dgrams, not the number
of virtqueues.

> =20
>      vvc->post_load_timer =3D NULL;
>  }
> @@ -227,6 +239,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev=
)
> =20
>      virtio_delete_queue(vvc->recv_vq);
>      virtio_delete_queue(vvc->trans_vq);
> +    if (vvc->vhost_dev.nvqs =3D=3D VHOST_VSOCK_NVQS_DGRAM) {
> +        virtio_delete_queue(vvc->dgram_recv_vq);
> +        virtio_delete_queue(vvc->dgram_trans_vq);
> +    }
> +
> +    g_free(vvc->vhost_dev.vqs);
> +
>      virtio_delete_queue(vvc->event_vq);
>      virtio_cleanup(vdev);
>  }
> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
> index 1b1a5c70ed..891d38e226 100644
> --- a/hw/virtio/vhost-vsock.c
> +++ b/hw/virtio/vhost-vsock.c
> @@ -20,9 +20,12 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/virtio/vhost-vsock.h"
>  #include "monitor/monitor.h"
> +#include <sys/ioctl.h>
> +#include <linux/vhost.h>
> =20
>  const int feature_bits[] =3D {
>      VIRTIO_VSOCK_F_SEQPACKET,
> +    VIRTIO_VSOCK_F_DGRAM,

Stefano is currently working on a way to control live migration
compatibility when features like seqpacket or dgram aren't available. He
can suggest how to do this for dgram.

>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> @@ -116,6 +119,9 @@ static uint64_t vhost_vsock_get_features(VirtIODevice=
 *vdev,
>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> =20
>      virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
> +    if (vvc->vhost_dev.nvqs =3D=3D VHOST_VSOCK_NVQS_DGRAM) {
> +        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_DGRAM);
> +    }
>      return vhost_get_features(&vvc->vhost_dev, feature_bits,
>                                  requested_features);
>  }
> @@ -132,13 +138,34 @@ static const VMStateDescription vmstate_virtio_vhos=
t_vsock =3D {
>      .post_load =3D vhost_vsock_common_post_load,
>  };
> =20
> +static bool vhost_vsock_dgram_supported(int vhostfd, Error **errp)
> +{
> +    uint64_t features;
> +    int ret;
> +
> +    ret =3D ioctl(vhostfd, VHOST_GET_FEATURES, &features);
> +    if (ret) {
> +        error_setg(errp, "vhost-vsock: failed to read device freatures. =
%s",
> +                     strerror(errno));
> +        return false;
> +    }

ioctl(2) shouldn't be necessary. Let vhost detect features from the
device backend (vhost kernel or vhost-user) and don't worry about
conditionally adding the exact number of virtqueues.

> +
> +    if (features & (1 << VIRTIO_VSOCK_F_DGRAM)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
>  {
> +    ERRP_GUARD();
>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(dev);
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostVSock *vsock =3D VHOST_VSOCK(dev);
>      int vhostfd;
>      int ret;
> +    bool enable_dgram;
> =20
>      /* Refuse to use reserved CID numbers */
>      if (vsock->conf.guest_cid <=3D 2) {
> @@ -175,7 +202,11 @@ static void vhost_vsock_device_realize(DeviceState *=
dev, Error **errp)
>          qemu_set_nonblock(vhostfd);
>      }
> =20
> -    vhost_vsock_common_realize(vdev, "vhost-vsock");
> +    enable_dgram =3D vhost_vsock_dgram_supported(vhostfd, errp);
> +    if (*errp) {
> +        goto err_dgram;
> +    }
> +    vhost_vsock_common_realize(vdev, "vhost-vsock", enable_dgram);
> =20
>      ret =3D vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
>                           VHOST_BACKEND_TYPE_KERNEL, 0, errp);
> @@ -197,6 +228,7 @@ err_vhost_dev:
>      vhostfd =3D -1;
>  err_virtio:
>      vhost_vsock_common_unrealize(vdev);
> +err_dgram:
>      if (vhostfd >=3D 0) {
>          close(vhostfd);
>      }
> diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/v=
host-vsock-common.h
> index e412b5ee98..80151aee35 100644
> --- a/include/hw/virtio/vhost-vsock-common.h
> +++ b/include/hw/virtio/vhost-vsock-common.h
> @@ -27,12 +27,13 @@ enum {
>  struct VHostVSockCommon {
>      VirtIODevice parent;
> =20
> -    struct vhost_virtqueue vhost_vqs[2];
>      struct vhost_dev vhost_dev;
> =20
>      VirtQueue *event_vq;
>      VirtQueue *recv_vq;
>      VirtQueue *trans_vq;
> +    VirtQueue *dgram_recv_vq;
> +    VirtQueue *dgram_trans_vq;
> =20
>      QEMUTimer *post_load_timer;
>  };
> @@ -41,7 +42,8 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
>  void vhost_vsock_common_stop(VirtIODevice *vdev);
>  int vhost_vsock_common_pre_save(void *opaque);
>  int vhost_vsock_common_post_load(void *opaque, int version_id);
> -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
> +void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
> +                                bool enable_dgram);
>  void vhost_vsock_common_unrealize(VirtIODevice *vdev);
> =20
>  #endif /* _QEMU_VHOST_VSOCK_COMMON_H */
> diff --git a/include/hw/virtio/vhost-vsock.h b/include/hw/virtio/vhost-vs=
ock.h
> index 84f4e727c7..87b2019b5a 100644
> --- a/include/hw/virtio/vhost-vsock.h
> +++ b/include/hw/virtio/vhost-vsock.h
> @@ -33,4 +33,7 @@ struct VHostVSock {
>      /*< public >*/
>  };
> =20
> +#define VHOST_VSOCK_NVQS 2
> +#define VHOST_VSOCK_NVQS_DGRAM 4
> +
>  #endif /* QEMU_VHOST_VSOCK_H */
> diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/stan=
dard-headers/linux/virtio_vsock.h
> index 3a23488e42..7e35acf3d4 100644
> --- a/include/standard-headers/linux/virtio_vsock.h
> +++ b/include/standard-headers/linux/virtio_vsock.h
> @@ -40,6 +40,7 @@
> =20
>  /* The feature bitmap for virtio vsock */
>  #define VIRTIO_VSOCK_F_SEQPACKET=091=09/* SOCK_SEQPACKET supported */
> +#define VIRTIO_VSOCK_F_DGRAM=09=092=09/* SOCK_DGRAM supported */
> =20
>  struct virtio_vsock_config {
>  =09uint64_t guest_cid;
> --=20
> 2.20.1
>=20

--jbSHFr5jgSaStY/i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFAmZ4ACgkQnKSrs4Gr
c8h8cgf/UNMN8Wvbi/urtNIxJXRdIiKazix0+PFCGmOfKkhKLRj4SWbSGNew0ida
NreMY6XCP0y/zrQ6xeVKd7Zq7KSjSieYon7wgVKVlBCY9Uwmys1Dg4t5RxJFm+LZ
wXWFV+0BrqLXYDxRyBQ50mKRkynN3iUFIDi0c2Xc+cSR8PWOOyE7wx322Z0nTT8o
ouXUnCh6fO74v9CH15emwJF3iLdH17AQL+UJ7hru8iywqBOamAjUwP28XNS4iNrI
X24xbv4Gt+DQDq50wKv3fx1iJuNdXzevMRVJSqRH2hjvpwAMUhpRrzxlO7dm8gRd
+Mx5PipxURYKwaZkwm5BcR/z+lBCWw==
=8PBC
-----END PGP SIGNATURE-----

--jbSHFr5jgSaStY/i--


