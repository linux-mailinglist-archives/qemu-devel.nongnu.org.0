Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503FC637F04
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 19:38:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyH5Y-0008IT-A3; Thu, 24 Nov 2022 13:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oyH5W-0008ID-AO
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oyH5T-0001on-OS
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669314998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0bEAk3u2aTpMYvYRW9YIDJPy9bBFDSu2hY+JY4MQNXA=;
 b=AnFY3OOT0BQuult8FzY4lVQKsvrXmf1mJz094bx3eDOjzci13knerZi33nN+y/tJxvdPyP
 09T6FTCH/FAkpULNvjV51ySqfjehTW+fja8iDr6b8Yo+jJMj4W2wYGl1pCm527jmgn7O5a
 YUxCmGnN2JMHJz6RJV4CXrORTIdnb5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-ddxtoF4gNVin_-qHfOYk_g-1; Thu, 24 Nov 2022 13:36:34 -0500
X-MC-Unique: ddxtoF4gNVin_-qHfOYk_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B2F8811E75;
 Thu, 24 Nov 2022 18:36:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D45C40C6FA0;
 Thu, 24 Nov 2022 18:36:32 +0000 (UTC)
Date: Thu, 24 Nov 2022 13:36:29 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, virtio-fs@redhat.com,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fam Zheng <fam@euphon.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 German Maglione <gmaglione@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-7.2] vhost: enable vrings in vhost_dev_start() for
 vhost-user devices
Message-ID: <Y3+5rfnNmR7R/h6/@fedora>
References: <20221123131630.52020-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="92byJgaEjwhnrXra"
Content-Disposition: inline
In-Reply-To: <20221123131630.52020-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--92byJgaEjwhnrXra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 02:16:30PM +0100, Stefano Garzarella wrote:
> Commit 02b61f38d3 ("hw/virtio: incorporate backend features in features")
> properly negotiates VHOST_USER_F_PROTOCOL_FEATURES with the vhost-user
> backend, but we forgot to enable vrings as specified in
> docs/interop/vhost-user.rst:
>=20
>     If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
>     ring starts directly in the enabled state.
>=20
>     If ``VHOST_USER_F_PROTOCOL_FEATURES`` has been negotiated, the ring is
>     initialized in a disabled state and is enabled by
>     ``VHOST_USER_SET_VRING_ENABLE`` with parameter 1.
>=20
> Some vhost-user front-ends already did this by calling
> vhost_ops.vhost_set_vring_enable() directly:
> - backends/cryptodev-vhost.c
> - hw/net/virtio-net.c
> - hw/virtio/vhost-user-gpio.c
>=20
> But most didn't do that, so we would leave the vrings disabled and some
> backends would not work. We observed this issue with the rust version of
> virtiofsd [1], which uses the event loop [2] provided by the
> vhost-user-backend crate where requests are not processed if vring is
> not enabled.
>=20
> Let's fix this issue by enabling the vrings in vhost_dev_start() for
> vhost-user front-ends that don't already do this directly. Same thing
> also in vhost_dev_stop() where we disable vrings.
>=20
> [1] https://gitlab.com/virtio-fs/virtiofsd
> [2] https://github.com/rust-vmm/vhost/blob/240fc2966/crates/vhost-user-ba=
ckend/src/event_loop.rs#L217
>=20
> Fixes: 02b61f38d3 ("hw/virtio: incorporate backend features in features")
> Reported-by: German Maglione <gmaglione@redhat.com>
> Tested-by: German Maglione <gmaglione@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/hw/virtio/vhost.h      |  6 +++--
>  backends/cryptodev-vhost.c     |  4 ++--
>  backends/vhost-user.c          |  4 ++--
>  hw/block/vhost-user-blk.c      |  4 ++--
>  hw/net/vhost_net.c             |  8 +++----
>  hw/scsi/vhost-scsi-common.c    |  4 ++--
>  hw/virtio/vhost-user-fs.c      |  4 ++--
>  hw/virtio/vhost-user-gpio.c    |  4 ++--
>  hw/virtio/vhost-user-i2c.c     |  4 ++--
>  hw/virtio/vhost-user-rng.c     |  4 ++--
>  hw/virtio/vhost-vsock-common.c |  4 ++--
>  hw/virtio/vhost.c              | 44 ++++++++++++++++++++++++++++++----
>  hw/virtio/trace-events         |  4 ++--
>  13 files changed, 67 insertions(+), 31 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 353252ac3e..67a6807fac 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -184,24 +184,26 @@ static inline bool vhost_dev_is_started(struct vhos=
t_dev *hdev)
>   * vhost_dev_start() - start the vhost device
>   * @hdev: common vhost_dev structure
>   * @vdev: the VirtIODevice structure
> + * @vrings: true to have vrings enabled in this call
>   *
>   * Starts the vhost device. From this point VirtIO feature negotiation
>   * can start and the device can start processing VirtIO transactions.
>   *
>   * Return: 0 on success, < 0 on error.
>   */
> -int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
> +int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs);
> =20
>  /**
>   * vhost_dev_stop() - stop the vhost device
>   * @hdev: common vhost_dev structure
>   * @vdev: the VirtIODevice structure
> + * @vrings: true to have vrings disabled in this call
>   *
>   * Stop the vhost device. After the device is stopped the notifiers
>   * can be disabled (@vhost_dev_disable_notifiers) and the device can
>   * be torn down (@vhost_dev_cleanup).
>   */
> -void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs);
> =20
>  /**
>   * DOC: vhost device configuration handling
> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
> index bc13e466b4..572f87b3be 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -94,7 +94,7 @@ cryptodev_vhost_start_one(CryptoDevBackendVhost *crypto,
>          goto fail_notifiers;
>      }
> =20
> -    r =3D vhost_dev_start(&crypto->dev, dev);
> +    r =3D vhost_dev_start(&crypto->dev, dev, false);
>      if (r < 0) {
>          goto fail_start;
>      }
> @@ -111,7 +111,7 @@ static void
>  cryptodev_vhost_stop_one(CryptoDevBackendVhost *crypto,
>                                   VirtIODevice *dev)
>  {
> -    vhost_dev_stop(&crypto->dev, dev);
> +    vhost_dev_stop(&crypto->dev, dev, false);
>      vhost_dev_disable_notifiers(&crypto->dev, dev);
>  }
> =20
> diff --git a/backends/vhost-user.c b/backends/vhost-user.c
> index 5dedb2d987..7bfcaef976 100644
> --- a/backends/vhost-user.c
> +++ b/backends/vhost-user.c
> @@ -85,7 +85,7 @@ vhost_user_backend_start(VhostUserBackend *b)
>      }
> =20
>      b->dev.acked_features =3D b->vdev->guest_features;
> -    ret =3D vhost_dev_start(&b->dev, b->vdev);
> +    ret =3D vhost_dev_start(&b->dev, b->vdev, true);
>      if (ret < 0) {
>          error_report("Error start vhost dev");
>          goto err_guest_notifiers;
> @@ -120,7 +120,7 @@ vhost_user_backend_stop(VhostUserBackend *b)
>          return;
>      }
> =20
> -    vhost_dev_stop(&b->dev, b->vdev);
> +    vhost_dev_stop(&b->dev, b->vdev, true);
> =20
>      if (k->set_guest_notifiers) {
>          ret =3D k->set_guest_notifiers(qbus->parent,
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0d5190accf..1177064631 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -178,7 +178,7 @@ static int vhost_user_blk_start(VirtIODevice *vdev, E=
rror **errp)
>      }
> =20
>      s->dev.vq_index_end =3D s->dev.nvqs;
> -    ret =3D vhost_dev_start(&s->dev, vdev);
> +    ret =3D vhost_dev_start(&s->dev, vdev, true);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "Error starting vhost");
>          goto err_guest_notifiers;
> @@ -213,7 +213,7 @@ static void vhost_user_blk_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(&s->dev, vdev);
> +    vhost_dev_stop(&s->dev, vdev, true);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>      if (ret < 0) {
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 26e4930676..043058ff43 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -259,7 +259,7 @@ static int vhost_net_start_one(struct vhost_net *net,
>          goto fail_notifiers;
>      }
> =20
> -    r =3D vhost_dev_start(&net->dev, dev);
> +    r =3D vhost_dev_start(&net->dev, dev, false);
>      if (r < 0) {
>          goto fail_start;
>      }
> @@ -308,7 +308,7 @@ fail:
>      if (net->nc->info->poll) {
>          net->nc->info->poll(net->nc, true);
>      }
> -    vhost_dev_stop(&net->dev, dev);
> +    vhost_dev_stop(&net->dev, dev, false);
>  fail_start:
>      vhost_dev_disable_notifiers(&net->dev, dev);
>  fail_notifiers:
> @@ -329,7 +329,7 @@ static void vhost_net_stop_one(struct vhost_net *net,
>      if (net->nc->info->poll) {
>          net->nc->info->poll(net->nc, true);
>      }
> -    vhost_dev_stop(&net->dev, dev);
> +    vhost_dev_stop(&net->dev, dev, false);
>      if (net->nc->info->stop) {
>          net->nc->info->stop(net->nc);
>      }
> @@ -606,7 +606,7 @@ err_start:
>          assert(r >=3D 0);
>      }
> =20
> -    vhost_dev_stop(&net->dev, vdev);
> +    vhost_dev_stop(&net->dev, vdev, false);
> =20
>      return r;
>  }
> diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
> index 767f827e55..18ea5dcfa1 100644
> --- a/hw/scsi/vhost-scsi-common.c
> +++ b/hw/scsi/vhost-scsi-common.c
> @@ -68,7 +68,7 @@ int vhost_scsi_common_start(VHostSCSICommon *vsc)
>          goto err_guest_notifiers;
>      }
> =20
> -    ret =3D vhost_dev_start(&vsc->dev, vdev);
> +    ret =3D vhost_dev_start(&vsc->dev, vdev, true);
>      if (ret < 0) {
>          error_report("Error start vhost dev");
>          goto err_guest_notifiers;
> @@ -101,7 +101,7 @@ void vhost_scsi_common_stop(VHostSCSICommon *vsc)
>      VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
>      int ret =3D 0;
> =20
> -    vhost_dev_stop(&vsc->dev, vdev);
> +    vhost_dev_stop(&vsc->dev, vdev, true);
> =20
>      if (k->set_guest_notifiers) {
>          ret =3D k->set_guest_notifiers(qbus->parent, vsc->dev.nvqs, fals=
e);
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index dc4014cdef..d97b179e6f 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -76,7 +76,7 @@ static void vuf_start(VirtIODevice *vdev)
>      }
> =20
>      fs->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&fs->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&fs->vhost_dev, vdev, true);
>      if (ret < 0) {
>          error_report("Error starting vhost: %d", -ret);
>          goto err_guest_notifiers;
> @@ -110,7 +110,7 @@ static void vuf_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(&fs->vhost_dev, vdev);
> +    vhost_dev_stop(&fs->vhost_dev, vdev, true);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, fs->vhost_dev.nvqs, fal=
se);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index 5851cb3bc9..0b40ebd15a 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -81,7 +81,7 @@ static int vu_gpio_start(VirtIODevice *vdev)
>       */
>      vhost_ack_features(&gpio->vhost_dev, feature_bits, vdev->guest_featu=
res);
> =20
> -    ret =3D vhost_dev_start(&gpio->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&gpio->vhost_dev, vdev, false);
>      if (ret < 0) {
>          error_report("Error starting vhost-user-gpio: %d", ret);
>          goto err_guest_notifiers;
> @@ -139,7 +139,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(vhost_dev, vdev);
> +    vhost_dev_stop(vhost_dev, vdev, false);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, vhost_dev->nvqs, false);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> index 1c9f3d20dc..dc5c828ba6 100644
> --- a/hw/virtio/vhost-user-i2c.c
> +++ b/hw/virtio/vhost-user-i2c.c
> @@ -46,7 +46,7 @@ static void vu_i2c_start(VirtIODevice *vdev)
> =20
>      i2c->vhost_dev.acked_features =3D vdev->guest_features;
> =20
> -    ret =3D vhost_dev_start(&i2c->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&i2c->vhost_dev, vdev, true);
>      if (ret < 0) {
>          error_report("Error starting vhost-user-i2c: %d", -ret);
>          goto err_guest_notifiers;
> @@ -80,7 +80,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(&i2c->vhost_dev, vdev);
> +    vhost_dev_stop(&i2c->vhost_dev, vdev, true);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, i2c->vhost_dev.nvqs, fa=
lse);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
> index f9084cde58..201a39e220 100644
> --- a/hw/virtio/vhost-user-rng.c
> +++ b/hw/virtio/vhost-user-rng.c
> @@ -47,7 +47,7 @@ static void vu_rng_start(VirtIODevice *vdev)
>      }
> =20
>      rng->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&rng->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&rng->vhost_dev, vdev, true);
>      if (ret < 0) {
>          error_report("Error starting vhost-user-rng: %d", -ret);
>          goto err_guest_notifiers;
> @@ -81,7 +81,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(&rng->vhost_dev, vdev);
> +    vhost_dev_stop(&rng->vhost_dev, vdev, true);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, rng->vhost_dev.nvqs, fa=
lse);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-commo=
n.c
> index a67a275de2..d21c72b401 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -70,7 +70,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev)
>      }
> =20
>      vvc->vhost_dev.acked_features =3D vdev->guest_features;
> -    ret =3D vhost_dev_start(&vvc->vhost_dev, vdev);
> +    ret =3D vhost_dev_start(&vvc->vhost_dev, vdev, true);
>      if (ret < 0) {
>          error_report("Error starting vhost: %d", -ret);
>          goto err_guest_notifiers;
> @@ -105,7 +105,7 @@ void vhost_vsock_common_stop(VirtIODevice *vdev)
>          return;
>      }
> =20
> -    vhost_dev_stop(&vvc->vhost_dev, vdev);
> +    vhost_dev_stop(&vvc->vhost_dev, vdev, true);
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, vvc->vhost_dev.nvqs, fa=
lse);
>      if (ret < 0) {
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index d1c4c20b8c..7fb008bc9e 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1777,15 +1777,36 @@ int vhost_dev_get_inflight(struct vhost_dev *dev,=
 uint16_t queue_size,
>      return 0;
>  }
> =20
> +static int vhost_dev_set_vring_enable(struct vhost_dev *hdev, int enable)

There is a similarly-named vhost_set_vring_enable(NetClientState *nc,
int enable) function which is actually part of vhost_net. Please rename
it to vhost_net_set_vring_enable(). It should probably call
vhost_dev_set_vring_enable().

> +{
> +    if (!hdev->vhost_ops->vhost_set_vring_enable) {
> +        return 0;
> +    }
> +
> +    /*
> +     * For vhost-user devices, if VHOST_USER_F_PROTOCOL_FEATURES has not
> +     * been negotiated, the rings start directly in the enabled state, a=
nd
> +     * .vhost_set_vring_enable callback will fail since
> +     * VHOST_USER_SET_VRING_ENABLE is not supported.
> +     */
> +    if (hdev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER &&
> +        !virtio_has_feature(hdev->backend_features,
> +                            VHOST_USER_F_PROTOCOL_FEATURES)) {
> +        return 0;
> +    }

These semantics are the opposite of vhost_user_set_vring_enable():

  if (!virtio_has_feature(dev->features, VHOST_USER_F_PROTOCOL_FEATURES)) {
      return -EINVAL;
  }

Please make vhost_user_set_vring_enable() and
vhost_dev_set_vring_enable() consistent. Code gets really confusing when
layers have different semantics for the same operation.

> +
> +    return hdev->vhost_ops->vhost_set_vring_enable(hdev, enable);
> +}

The return value is hard to understand. An error return is only returned
by vhost-user devices with VHOST_USER_F_PROTOCOL_FEATURES. There are
other cases that seem like they should return an error but return
success instead. For example, when called with enable=3Dfalse on a
non-VHOST_USER_F_PROTOCOL_FEATURES device (e.g. vhost-kernel or legacy
vhost-user) we return success even though the vring wasn't disabled.

I know a quick fix is needed for 7.2, but I don't think this patch
should be merged in its current state. Given that this is a new
function, it should be possible to come up with straightforward return
value semantics.

> +
>  /* Host notifiers must be enabled at this point. */
> -int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
> +int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs)
>  {
>      int i, r;
> =20
>      /* should only be called after backend is connected */
>      assert(hdev->vhost_ops);
> =20
> -    trace_vhost_dev_start(hdev, vdev->name);
> +    trace_vhost_dev_start(hdev, vdev->name, vrings);
> =20
>      vdev->vhost_started =3D true;
>      hdev->started =3D true;
> @@ -1830,10 +1851,16 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtI=
ODevice *vdev)
>              goto fail_log;
>          }
>      }
> +    if (vrings) {
> +        r =3D vhost_dev_set_vring_enable(hdev, true);
> +        if (r) {
> +            goto fail_log;
> +        }
> +    }
>      if (hdev->vhost_ops->vhost_dev_start) {
>          r =3D hdev->vhost_ops->vhost_dev_start(hdev, true);
>          if (r) {
> -            goto fail_log;
> +            goto fail_start;
>          }
>      }
>      if (vhost_dev_has_iommu(hdev) &&
> @@ -1848,6 +1875,10 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIO=
Device *vdev)
>          }
>      }
>      return 0;
> +fail_start:
> +    if (vrings) {
> +        vhost_dev_set_vring_enable(hdev, false);
> +    }
>  fail_log:
>      vhost_log_put(hdev, false);
>  fail_vq:
> @@ -1866,18 +1897,21 @@ fail_features:
>  }
> =20
>  /* Host notifiers must be enabled at this point. */
> -void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
> +void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vri=
ngs)
>  {
>      int i;
> =20
>      /* should only be called after backend is connected */
>      assert(hdev->vhost_ops);
> =20
> -    trace_vhost_dev_stop(hdev, vdev->name);
> +    trace_vhost_dev_stop(hdev, vdev->name, vrings);
> =20
>      if (hdev->vhost_ops->vhost_dev_start) {
>          hdev->vhost_ops->vhost_dev_start(hdev, false);
>      }
> +    if (vrings) {
> +        vhost_dev_set_vring_enable(hdev, false);
> +    }
>      for (i =3D 0; i < hdev->nvqs; ++i) {
>          vhost_virtqueue_stop(hdev,
>                               vdev,
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 820dadc26c..14fc5b9bb2 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -9,8 +9,8 @@ vhost_section(const char *name) "%s"
>  vhost_reject_section(const char *name, int d) "%s:%d"
>  vhost_iotlb_miss(void *dev, int step) "%p step %d"
>  vhost_dev_cleanup(void *dev) "%p"
> -vhost_dev_start(void *dev, const char *name) "%p:%s"
> -vhost_dev_stop(void *dev, const char *name) "%p:%s"
> +vhost_dev_start(void *dev, const char *name, bool vrings) "%p:%s vrings:=
%d"
> +vhost_dev_stop(void *dev, const char *name, bool vrings) "%p:%s vrings:%=
d"
> =20
> =20
>  # vhost-user.c
> --=20
> 2.38.1
>=20

--92byJgaEjwhnrXra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN/ua0ACgkQnKSrs4Gr
c8hPzAgAu1RFqnyPdzqV2X/qpX0YCDq2DJQd0fFjaDf48TKLmZefcOC4+83xsYSU
1yvyDmwGJlwsMvTho2bcH948eQjfozEX7DQaCiRhxbfS+dL12grRDQabi3J4Xa35
V0/tvCy0Dbcq0w9O/wcGWUy7HkeaLIh9Jqe9WL1Zy+D+xb47zG+9hzTrssupNU03
cmfNYObDR32TqhLUi/fgxM7Xm/8Z1XcSLGGVqbFNwb27AmcdEj5x2BxV6CwMCLOP
/vBmDSiEIZahkp3FT5HC4A1tR9eZcfjQzK9pUMmOfdesRYC6ez4DK24J5tqisupc
1ZnX6koaegugFuqDeRZwdmQIPZ1xow==
=Tsb4
-----END PGP SIGNATURE-----

--92byJgaEjwhnrXra--


