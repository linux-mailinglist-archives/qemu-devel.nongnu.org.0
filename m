Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64481421F84
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:38:08 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXf1b-0007KJ-DD
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXezt-0005zQ-6a
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:36:21 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:37306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mXezf-0004Lw-N1
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:36:20 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-qX7gzZq6MCKsHcDSZxJM2Q-1; Tue, 05 Oct 2021 03:36:03 -0400
X-MC-Unique: qX7gzZq6MCKsHcDSZxJM2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ED1919057A2;
 Tue,  5 Oct 2021 07:36:02 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E50360657;
 Tue,  5 Oct 2021 07:35:57 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:35:54 +0200
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Message-ID: <20211005093554.6d6eff10@bahia.huguette>
In-Reply-To: <20211005031333-mutt-send-email-mst@kernel.org>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <d39e127ecae12fa18bf01d1e405eb4010a275cf5.1633376313.git.qemu_oss@crudebyte.com>
 <20211005031333-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 qemu-block@nongnu.org, Amit Shah <amit@kernel.org>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021 03:16:07 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 04, 2021 at 09:38:08PM +0200, Christian Schoenebeck wrote:
> > Raise the maximum possible virtio transfer size to 128M
> > (more precisely: 32k * PAGE_SIZE). See previous commit for a
> > more detailed explanation for the reasons of this change.
> >=20
> > For not breaking any virtio user, all virtio users transition
> > to using the new macro VIRTQUEUE_LEGACY_MAX_SIZE instead of
> > VIRTQUEUE_MAX_SIZE, so they are all still using the old value
> > of 1k with this commit.
> >=20
> > On the long-term, each virtio user should subsequently either
> > switch from VIRTQUEUE_LEGACY_MAX_SIZE to VIRTQUEUE_MAX_SIZE
> > after checking that they support the new value of 32k, or
> > otherwise they should replace the VIRTQUEUE_LEGACY_MAX_SIZE
> > macro by an appropriate value supported by them.
> >=20
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>=20
>=20
> I don't think we need this. Legacy isn't descriptive either.  Just leave
> VIRTQUEUE_MAX_SIZE alone, and come up with a new name for 32k.
>=20

Yes I agree. Only virtio-9p is going to benefit from the new
size in the short/medium term, so it looks a bit excessive to
patch all devices. Also in the end, you end up reverting the name
change in the last patch for virtio-9p... which is a indication
that this patch does too much.

Introduce the new macro in virtio-9p and use it only there.

> > ---
> >  hw/9pfs/virtio-9p-device.c     |  2 +-
> >  hw/block/vhost-user-blk.c      |  6 +++---
> >  hw/block/virtio-blk.c          |  6 +++---
> >  hw/char/virtio-serial-bus.c    |  2 +-
> >  hw/input/virtio-input.c        |  2 +-
> >  hw/net/virtio-net.c            | 12 ++++++------
> >  hw/scsi/virtio-scsi.c          |  2 +-
> >  hw/virtio/vhost-user-fs.c      |  6 +++---
> >  hw/virtio/vhost-user-i2c.c     |  2 +-
> >  hw/virtio/vhost-vsock-common.c |  2 +-
> >  hw/virtio/virtio-balloon.c     |  2 +-
> >  hw/virtio/virtio-crypto.c      |  2 +-
> >  hw/virtio/virtio-iommu.c       |  2 +-
> >  hw/virtio/virtio-mem.c         |  2 +-
> >  hw/virtio/virtio-mmio.c        |  4 ++--
> >  hw/virtio/virtio-pmem.c        |  2 +-
> >  hw/virtio/virtio-rng.c         |  3 ++-
> >  include/hw/virtio/virtio.h     | 20 +++++++++++++++++++-
> >  18 files changed, 49 insertions(+), 30 deletions(-)
> >=20
> > diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> > index cd5d95dd51..9013e7df6e 100644
> > --- a/hw/9pfs/virtio-9p-device.c
> > +++ b/hw/9pfs/virtio-9p-device.c
> > @@ -217,7 +217,7 @@ static void virtio_9p_device_realize(DeviceState *d=
ev, Error **errp)
> > =20
> >      v->config_size =3D sizeof(struct virtio_9p_config) + strlen(s->fsc=
onf.tag);
> >      virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size,
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> >      v->vq =3D virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
> >  }
> > =20
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 336f56705c..e5e45262ab 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -480,9 +480,9 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
> >          error_setg(errp, "queue size must be non-zero");
> >          return;
> >      }
> > -    if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
> > +    if (s->queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> >          error_setg(errp, "queue size must not exceed %d",
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> >          return;
> >      }
> > =20
> > @@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
> >      }
> > =20
> >      virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> > -                sizeof(struct virtio_blk_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_blk_config), VIRTQUEUE_LEGACY_MAX=
_SIZE);
> > =20
> >      s->virtqs =3D g_new(VirtQueue *, s->num_queues);
> >      for (i =3D 0; i < s->num_queues; i++) {
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 9c0f46815c..5883e3e7db 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -1171,10 +1171,10 @@ static void virtio_blk_device_realize(DeviceSta=
te *dev, Error **errp)
> >          return;
> >      }
> >      if (!is_power_of_2(conf->queue_size) ||
> > -        conf->queue_size > VIRTQUEUE_MAX_SIZE) {
> > +        conf->queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> >          error_setg(errp, "invalid queue-size property (%" PRIu16 "), "
> >                     "must be a power of 2 (max %d)",
> > -                   conf->queue_size, VIRTQUEUE_MAX_SIZE);
> > +                   conf->queue_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> >          return;
> >      }
> > =20
> > @@ -1214,7 +1214,7 @@ static void virtio_blk_device_realize(DeviceState=
 *dev, Error **errp)
> >      virtio_blk_set_config_size(s, s->host_features);
> > =20
> >      virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size,
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      s->blk =3D conf->conf.blk;
> >      s->rq =3D NULL;
> > diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> > index 9ad9111115..2d4285ab53 100644
> > --- a/hw/char/virtio-serial-bus.c
> > +++ b/hw/char/virtio-serial-bus.c
> > @@ -1045,7 +1045,7 @@ static void virtio_serial_device_realize(DeviceSt=
ate *dev, Error **errp)
> >          config_size =3D offsetof(struct virtio_console_config, emerg_w=
r);
> >      }
> >      virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
> > -                config_size, VIRTQUEUE_MAX_SIZE);
> > +                config_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      /* Spawn a new virtio-serial bus on which the ports will ride as d=
evices */
> >      qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
> > diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
> > index 345eb2cce7..b6b77488f2 100644
> > --- a/hw/input/virtio-input.c
> > +++ b/hw/input/virtio-input.c
> > @@ -258,7 +258,7 @@ static void virtio_input_device_realize(DeviceState=
 *dev, Error **errp)
> >      assert(vinput->cfg_size <=3D sizeof(virtio_input_config));
> > =20
> >      virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
> > -                vinput->cfg_size, VIRTQUEUE_MAX_SIZE);
> > +                vinput->cfg_size, VIRTQUEUE_LEGACY_MAX_SIZE);
> >      vinput->evt =3D virtio_add_queue(vdev, 64, virtio_input_handle_evt=
);
> >      vinput->sts =3D virtio_add_queue(vdev, 64, virtio_input_handle_sts=
);
> >  }
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index f74b5f6268..5100978b07 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -636,7 +636,7 @@ static int virtio_net_max_tx_queue_size(VirtIONet *=
n)
> >          return VIRTIO_NET_TX_QUEUE_DEFAULT_SIZE;
> >      }
> > =20
> > -    return VIRTQUEUE_MAX_SIZE;
> > +    return VIRTQUEUE_LEGACY_MAX_SIZE;
> >  }
> > =20
> >  static int peer_attach(VirtIONet *n, int index)
> > @@ -3365,7 +3365,7 @@ static void virtio_net_device_realize(DeviceState=
 *dev, Error **errp)
> > =20
> >      virtio_net_set_config_size(n, n->host_features);
> >      virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size,
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      /*
> >       * We set a lower limit on RX queue size to what it always was.
> > @@ -3373,23 +3373,23 @@ static void virtio_net_device_realize(DeviceSta=
te *dev, Error **errp)
> >       * help from us (using virtio 1 and up).
> >       */
> >      if (n->net_conf.rx_queue_size < VIRTIO_NET_RX_QUEUE_MIN_SIZE ||
> > -        n->net_conf.rx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > +        n->net_conf.rx_queue_size > VIRTQUEUE_LEGACY_MAX_SIZE ||
> >          !is_power_of_2(n->net_conf.rx_queue_size)) {
> >          error_setg(errp, "Invalid rx_queue_size (=3D %" PRIu16 "), "
> >                     "must be a power of 2 between %d and %d.",
> >                     n->net_conf.rx_queue_size, VIRTIO_NET_RX_QUEUE_MIN_=
SIZE,
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> >          virtio_cleanup(vdev);
> >          return;
> >      }
> > =20
> >      if (n->net_conf.tx_queue_size < VIRTIO_NET_TX_QUEUE_MIN_SIZE ||
> > -        n->net_conf.tx_queue_size > VIRTQUEUE_MAX_SIZE ||
> > +        n->net_conf.tx_queue_size > VIRTQUEUE_LEGACY_MAX_SIZE ||
> >          !is_power_of_2(n->net_conf.tx_queue_size)) {
> >          error_setg(errp, "Invalid tx_queue_size (=3D %" PRIu16 "), "
> >                     "must be a power of 2 between %d and %d",
> >                     n->net_conf.tx_queue_size, VIRTIO_NET_TX_QUEUE_MIN_=
SIZE,
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> >          virtio_cleanup(vdev);
> >          return;
> >      }
> > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > index 5e5e657e1d..f204e8878a 100644
> > --- a/hw/scsi/virtio-scsi.c
> > +++ b/hw/scsi/virtio-scsi.c
> > @@ -973,7 +973,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
> >      int i;
> > =20
> >      virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
> > -                sizeof(VirtIOSCSIConfig), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(VirtIOSCSIConfig), VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      if (s->conf.num_queues =3D=3D VIRTIO_SCSI_AUTO_NUM_QUEUES) {
> >          s->conf.num_queues =3D 1;
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index ae1672d667..decc5def39 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -209,9 +209,9 @@ static void vuf_device_realize(DeviceState *dev, Er=
ror **errp)
> >          return;
> >      }
> > =20
> > -    if (fs->conf.queue_size > VIRTQUEUE_MAX_SIZE) {
> > +    if (fs->conf.queue_size > VIRTQUEUE_LEGACY_MAX_SIZE) {
> >          error_setg(errp, "queue-size property must be %u or smaller",
> > -                   VIRTQUEUE_MAX_SIZE);
> > +                   VIRTQUEUE_LEGACY_MAX_SIZE);
> >          return;
> >      }
> > =20
> > @@ -220,7 +220,7 @@ static void vuf_device_realize(DeviceState *dev, Er=
ror **errp)
> >      }
> > =20
> >      virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
> > -                sizeof(struct virtio_fs_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_fs_config), VIRTQUEUE_LEGACY_MAX_=
SIZE);
> > =20
> >      /* Hiprio queue */
> >      fs->hiprio_vq =3D virtio_add_queue(vdev, fs->conf.queue_size, vuf_=
handle_output);
> > diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
> > index eeb1d8853a..b248ddbe93 100644
> > --- a/hw/virtio/vhost-user-i2c.c
> > +++ b/hw/virtio/vhost-user-i2c.c
> > @@ -221,7 +221,7 @@ static void vu_i2c_device_realize(DeviceState *dev,=
 Error **errp)
> >      }
> > =20
> >      virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0,
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      i2c->vhost_dev.nvqs =3D 1;
> >      i2c->vq =3D virtio_add_queue(vdev, 4, vu_i2c_handle_output);
> > diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-com=
mon.c
> > index a81fa884a8..73e6b72bba 100644
> > --- a/hw/virtio/vhost-vsock-common.c
> > +++ b/hw/virtio/vhost-vsock-common.c
> > @@ -201,7 +201,7 @@ void vhost_vsock_common_realize(VirtIODevice *vdev,=
 const char *name)
> >      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
> > =20
> >      virtio_init(vdev, name, VIRTIO_ID_VSOCK,
> > -                sizeof(struct virtio_vsock_config), VIRTQUEUE_MAX_SIZE=
);
> > +                sizeof(struct virtio_vsock_config), VIRTQUEUE_LEGACY_M=
AX_SIZE);
> > =20
> >      /* Receive and transmit queues belong to vhost */
> >      vvc->recv_vq =3D virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index 067c73223d..890fb15ed3 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -886,7 +886,7 @@ static void virtio_balloon_device_realize(DeviceSta=
te *dev, Error **errp)
> >      int ret;
> > =20
> >      virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
> > -                virtio_balloon_config_size(s), VIRTQUEUE_MAX_SIZE);
> > +                virtio_balloon_config_size(s), VIRTQUEUE_LEGACY_MAX_SI=
ZE);
> > =20
> >      ret =3D qemu_add_balloon_handler(virtio_balloon_to_target,
> >                                     virtio_balloon_stat, s);
> > diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> > index 1e70d4d2a8..e13b6091d6 100644
> > --- a/hw/virtio/virtio-crypto.c
> > +++ b/hw/virtio/virtio-crypto.c
> > @@ -811,7 +811,7 @@ static void virtio_crypto_device_realize(DeviceStat=
e *dev, Error **errp)
> >      }
> > =20
> >      virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->conf=
ig_size,
> > -                VIRTQUEUE_MAX_SIZE);
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> >      vcrypto->curr_queues =3D 1;
> >      vcrypto->vqs =3D g_malloc0(sizeof(VirtIOCryptoQueue) * vcrypto->ma=
x_queues);
> >      for (i =3D 0; i < vcrypto->max_queues; i++) {
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index ca360e74eb..845df78842 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -974,7 +974,7 @@ static void virtio_iommu_device_realize(DeviceState=
 *dev, Error **errp)
> >      VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
> > =20
> >      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> > -                sizeof(struct virtio_iommu_config), VIRTQUEUE_MAX_SIZE=
);
> > +                sizeof(struct virtio_iommu_config), VIRTQUEUE_LEGACY_M=
AX_SIZE);
> > =20
> >      memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bu=
s_num));
> > =20
> > diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> > index 1d9d01b871..7a39550cde 100644
> > --- a/hw/virtio/virtio-mem.c
> > +++ b/hw/virtio/virtio-mem.c
> > @@ -738,7 +738,7 @@ static void virtio_mem_device_realize(DeviceState *=
dev, Error **errp)
> >      vmem->bitmap =3D bitmap_new(vmem->bitmap_size);
> > =20
> >      virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
> > -                sizeof(struct virtio_mem_config), VIRTQUEUE_MAX_SIZE);
> > +                sizeof(struct virtio_mem_config), VIRTQUEUE_LEGACY_MAX=
_SIZE);
> >      vmem->vq =3D virtio_add_queue(vdev, 128, virtio_mem_handle_request=
);
> > =20
> >      host_memory_backend_set_mapped(vmem->memdev, true);
> > diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> > index 7b3ebca178..ae0cc223e9 100644
> > --- a/hw/virtio/virtio-mmio.c
> > +++ b/hw/virtio/virtio-mmio.c
> > @@ -174,7 +174,7 @@ static uint64_t virtio_mmio_read(void *opaque, hwad=
dr offset, unsigned size)
> >          if (!virtio_queue_get_num(vdev, vdev->queue_sel)) {
> >              return 0;
> >          }
> > -        return VIRTQUEUE_MAX_SIZE;
> > +        return VIRTQUEUE_LEGACY_MAX_SIZE;
> >      case VIRTIO_MMIO_QUEUE_PFN:
> >          if (!proxy->legacy) {
> >              qemu_log_mask(LOG_GUEST_ERROR,
> > @@ -348,7 +348,7 @@ static void virtio_mmio_write(void *opaque, hwaddr =
offset, uint64_t value,
> >          }
> >          break;
> >      case VIRTIO_MMIO_QUEUE_NUM:
> > -        trace_virtio_mmio_queue_write(value, VIRTQUEUE_MAX_SIZE);
> > +        trace_virtio_mmio_queue_write(value, VIRTQUEUE_LEGACY_MAX_SIZE=
);
> >          virtio_queue_set_num(vdev, vdev->queue_sel, value);
> > =20
> >          if (proxy->legacy) {
> > diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> > index 82b54b00c5..5f4d375b58 100644
> > --- a/hw/virtio/virtio-pmem.c
> > +++ b/hw/virtio/virtio-pmem.c
> > @@ -124,7 +124,7 @@ static void virtio_pmem_realize(DeviceState *dev, E=
rror **errp)
> > =20
> >      host_memory_backend_set_mapped(pmem->memdev, true);
> >      virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
> > -                sizeof(struct virtio_pmem_config), VIRTQUEUE_MAX_SIZE)=
;
> > +                sizeof(struct virtio_pmem_config), VIRTQUEUE_LEGACY_MA=
X_SIZE);
> >      pmem->rq_vq =3D virtio_add_queue(vdev, 128, virtio_pmem_flush);
> >  }
> > =20
> > diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
> > index 0e91d60106..ab075b22b6 100644
> > --- a/hw/virtio/virtio-rng.c
> > +++ b/hw/virtio/virtio-rng.c
> > @@ -215,7 +215,8 @@ static void virtio_rng_device_realize(DeviceState *=
dev, Error **errp)
> >          return;
> >      }
> > =20
> > -    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0, VIRTQUEUE_MAX_SI=
ZE);
> > +    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0,
> > +                VIRTQUEUE_LEGACY_MAX_SIZE);
> > =20
> >      vrng->vq =3D virtio_add_queue(vdev, 8, handle_input);
> >      vrng->quota_remaining =3D vrng->conf.max_bytes;
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index a37d1f7d52..fe0f13266b 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -48,7 +48,25 @@ size_t virtio_feature_get_config_size(const VirtIOFe=
ature *features,
> > =20
> >  typedef struct VirtQueue VirtQueue;
> > =20
> > -#define VIRTQUEUE_MAX_SIZE 1024
> > +/*
> > + * This is meant as transitional measure for VIRTQUEUE_MAX_SIZE's old =
value
> > + * of 1024 to its new value of 32768. On the long-term virtio users sh=
ould
> > + * either switch to VIRTQUEUE_MAX_SIZE, provided they support 32768,
> > + * otherwise they should replace this macro on their side with an
> > + * appropriate value actually supported by them.
> > + *
> > + * Once all virtio users switched, this macro will be removed.
> > + */
> > +#define VIRTQUEUE_LEGACY_MAX_SIZE 1024
> > +
> > +/*
> > + * Reflects the absolute theoretical maximum queue size (in amount of =
pages)
> > + * ever possible, which is actually the maximum queue size allowed by =
the
> > + * virtio protocol. This value therefore construes the maximum transfe=
r size
> > + * possible with virtio (multiplied by system dependent PAGE_SIZE); as=
suming
> > + * a typical page size of 4k this would be a maximum transfer size of =
128M.
> > + */
> > +#define VIRTQUEUE_MAX_SIZE 32768
> > =20
> >  typedef struct VirtQueueElement
> >  {
> > --=20
> > 2.20.1
>=20


