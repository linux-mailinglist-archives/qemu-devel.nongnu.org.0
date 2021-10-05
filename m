Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E542270D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:52:24 +0200 (CEST)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjvh-0007UD-KI
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjpp-000499-Kt
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mXjpg-0001g7-5H
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 08:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633437964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FpPlIwfFumI9IYgODmFdoEAXnlTp8J4y3IfAvnTuG6Q=;
 b=LNetqWogKkKipABbUQMabr/g+z6R2D2EMS+e32EzA3DAefJ3rzWlsrk2N1vFNPG7M8doei
 QAdhd0dl7N/wMfDH7AUhBOKsidi+XUIJMXa8lgTiNi2jio/sfiuZg1UMhxljhyLbAULAem
 C/5vaVkimQdaXAOGFKpvrbbNA0jU4cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-sxzpD7R6PDKnC2RldtPvEg-1; Tue, 05 Oct 2021 08:46:00 -0400
X-MC-Unique: sxzpD7R6PDKnC2RldtPvEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A592A5721E;
 Tue,  5 Oct 2021 12:45:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE1C5F4EC;
 Tue,  5 Oct 2021 12:45:57 +0000 (UTC)
Date: Tue, 5 Oct 2021 13:45:56 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/3] virtio: turn VIRTQUEUE_MAX_SIZE into a variable
Message-ID: <YVxJBKqsytKlos6M@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633376313.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
In-Reply-To: <c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633376313.git.qemu_oss@crudebyte.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1etZgNjk4d4mzbq0"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 virtio-fs@redhat.com, Eric Auger <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1etZgNjk4d4mzbq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 09:38:04PM +0200, Christian Schoenebeck wrote:
> Refactor VIRTQUEUE_MAX_SIZE to effectively become a runtime
> variable per virtio user.

virtio user =3D=3D virtio device model?

>=20
> Reasons:
>=20
> (1) VIRTQUEUE_MAX_SIZE should reflect the absolute theoretical
>     maximum queue size possible. Which is actually the maximum
>     queue size allowed by the virtio protocol. The appropriate
>     value for VIRTQUEUE_MAX_SIZE would therefore be 32768:
>=20
>     https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.=
html#x1-240006
>=20
>     Apparently VIRTQUEUE_MAX_SIZE was instead defined with a
>     more or less arbitrary value of 1024 in the past, which
>     limits the maximum transfer size with virtio to 4M
>     (more precise: 1024 * PAGE_SIZE, with the latter typically
>     being 4k).

Being equal to IOV_MAX is a likely reason. Buffers with more iovecs than
that cannot be passed to host system calls (sendmsg(2), pwritev(2),
etc).

> (2) Additionally the current value of 1024 poses a hidden limit,
>     invisible to guest, which causes a system hang with the
>     following QEMU error if guest tries to exceed it:
>=20
>     virtio: too many write descriptors in indirect table

I don't understand this point. 2.6.5 The Virtqueue Descriptor Table says:

  The number of descriptors in the table is defined by the queue size for t=
his virtqueue: this is the maximum possible descriptor chain length.

and 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:

  A driver MUST NOT create a descriptor chain longer than the Queue Size of=
 the device.

Do you mean a broken/malicious guest driver that is violating the spec?
That's not a hidden limit, it's defined by the spec.

> (3) Unfortunately not all virtio users in QEMU would currently
>     work correctly with the new value of 32768.
>=20
> So let's turn this hard coded global value into a runtime
> variable as a first step in this commit, configurable for each
> virtio user by passing a corresponding value with virtio_init()
> call.

virtio_add_queue() already has an int queue_size argument, why isn't
that enough to deal with the maximum queue size? There's probably a good
reason for it, but please include it in the commit description.

>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/virtio-9p-device.c     |  3 ++-
>  hw/block/vhost-user-blk.c      |  2 +-
>  hw/block/virtio-blk.c          |  3 ++-
>  hw/char/virtio-serial-bus.c    |  2 +-
>  hw/display/virtio-gpu-base.c   |  2 +-
>  hw/input/virtio-input.c        |  2 +-
>  hw/net/virtio-net.c            | 15 ++++++++-------
>  hw/scsi/virtio-scsi.c          |  2 +-
>  hw/virtio/vhost-user-fs.c      |  2 +-
>  hw/virtio/vhost-user-i2c.c     |  3 ++-
>  hw/virtio/vhost-vsock-common.c |  2 +-
>  hw/virtio/virtio-balloon.c     |  4 ++--
>  hw/virtio/virtio-crypto.c      |  3 ++-
>  hw/virtio/virtio-iommu.c       |  2 +-
>  hw/virtio/virtio-mem.c         |  2 +-
>  hw/virtio/virtio-pmem.c        |  2 +-
>  hw/virtio/virtio-rng.c         |  2 +-
>  hw/virtio/virtio.c             | 35 +++++++++++++++++++++++-----------
>  include/hw/virtio/virtio.h     |  5 ++++-
>  19 files changed, 57 insertions(+), 36 deletions(-)
>=20
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 54ee93b71f..cd5d95dd51 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -216,7 +216,8 @@ static void virtio_9p_device_realize(DeviceState *dev=
, Error **errp)
>      }
> =20
>      v->config_size =3D sizeof(struct virtio_9p_config) + strlen(s->fscon=
f.tag);
> -    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
> +    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size,
> +                VIRTQUEUE_MAX_SIZE);
>      v->vq =3D virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
>  }
> =20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb87e5..336f56705c 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>      }
> =20
>      virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> -                sizeof(struct virtio_blk_config));
> +                sizeof(struct virtio_blk_config), VIRTQUEUE_MAX_SIZE);
> =20
>      s->virtqs =3D g_new(VirtQueue *, s->num_queues);
>      for (i =3D 0; i < s->num_queues; i++) {
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7cc9..9c0f46815c 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -1213,7 +1213,8 @@ static void virtio_blk_device_realize(DeviceState *=
dev, Error **errp)
> =20
>      virtio_blk_set_config_size(s, s->host_features);
> =20
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
> +    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size,
> +                VIRTQUEUE_MAX_SIZE);
> =20
>      s->blk =3D conf->conf.blk;
>      s->rq =3D NULL;
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index f01ec2137c..9ad9111115 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -1045,7 +1045,7 @@ static void virtio_serial_device_realize(DeviceStat=
e *dev, Error **errp)
>          config_size =3D offsetof(struct virtio_console_config, emerg_wr)=
;
>      }
>      virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
> -                config_size);
> +                config_size, VIRTQUEUE_MAX_SIZE);
> =20
>      /* Spawn a new virtio-serial bus on which the ports will ride as dev=
ices */
>      qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index c8da4806e0..20b06a7adf 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -171,7 +171,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
> =20
>      g->virtio_config.num_scanouts =3D cpu_to_le32(g->conf.max_outputs);
>      virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
> -                sizeof(struct virtio_gpu_config));
> +                sizeof(struct virtio_gpu_config), VIRTQUEUE_MAX_SIZE);
> =20
>      if (virtio_gpu_virgl_enabled(g->conf)) {
>          /* use larger control queue in 3d mode */
> diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> index 54bcb46c74..345eb2cce7 100644
> --- a/hw/input/virtio-input.c
> +++ b/hw/input/virtio-input.c
> @@ -258,7 +258,7 @@ static void virtio_input_device_realize(DeviceState *=
dev, Error **errp)
>      assert(vinput->cfg_size <=3D sizeof(virtio_input_config));
> =20
>      virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
> -                vinput->cfg_size);
> +                vinput->cfg_size, VIRTQUEUE_MAX_SIZE);
>      vinput->evt =3D virtio_add_queue(vdev, 64, virtio_input_handle_evt);
>      vinput->sts =3D virtio_add_queue(vdev, 64, virtio_input_handle_sts);
>  }
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f205331dcf..f74b5f6268 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -1746,9 +1746,9 @@ static ssize_t virtio_net_receive_rcu(NetClientStat=
e *nc, const uint8_t *buf,
>      VirtIONet *n =3D qemu_get_nic_opaque(nc);
>      VirtIONetQueue *q =3D virtio_net_get_subqueue(nc);
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(n);
> -    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
> -    size_t lens[VIRTQUEUE_MAX_SIZE];
> -    struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
> +    VirtQueueElement *elems[vdev->queue_max_size];
> +    size_t lens[vdev->queue_max_size];
> +    struct iovec mhdr_sg[vdev->queue_max_size];

Can you make this value per-vq instead of per-vdev since virtqueues can
have different queue sizes?

The same applies to the rest of this patch. Anything using
vdev->queue_max_size should probably use vq->vring.num instead.

--1etZgNjk4d4mzbq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFcSQQACgkQnKSrs4Gr
c8hrsAf/TA5H5Q3u1uLa9YtVuqwhBwEKcQVlG9VgXmh2lhhAjrkOGtBqt3a3FSIa
Yz4ERbLyDw8j+Cxdtt0rWYZCyRXtge5dQSvUkfxWBSrF8ZMIZPYs3JTWGRCZrDOw
msZ5yzwnM6lcI0/VXsgUVBwHejKh1d0L40svfPR6ccH8yzYqYcqf301cDC8wTn11
BRnq0ZHJmirSA9Es46j9oV1JVJbaXAf3E05edIIt2OHOmZge5on7Gf64Cx8YV1Vu
ACJct4BkBCdObOrNT6ZQr7ZYJCMWGdvTiZRQa74N2XowyXo8lEjhQeBFbOR4LN1K
XyO+h0gx4XvpIcMSWf8F+sQ7yzyFaw==
=MM9Z
-----END PGP SIGNATURE-----

--1etZgNjk4d4mzbq0--


