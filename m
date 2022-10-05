Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4335F57D9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:53:26 +0200 (CEST)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6i5-0004fa-6r
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6fm-0002LD-Dn
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6fc-0004Gw-Tj
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664985050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/C9Usl/mGF38jrUh1CSv1qX/XWBOlts1taGd5xUsbqc=;
 b=KHNfUHRhZce+ssbANnuzQ2UQQK5XlgVrSufXsT5EK7XpHL6OZ7sCDtJjmg5Uq5iAezZCd/
 zIivmgVm3tY5XaIorimlCeLdvH+HUojTCTeDSOMnDfhzg3sctXI1J/+RQuEwlr59P6HHO0
 QPOTYMpuG+1WH/dDYNwyPma1wt7FQUE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-_R-DxMr1M5y6QrPSZ7pwAA-1; Wed, 05 Oct 2022 11:50:47 -0400
X-MC-Unique: _R-DxMr1M5y6QrPSZ7pwAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10BF5800B30;
 Wed,  5 Oct 2022 15:50:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8B81400DFD9;
 Wed,  5 Oct 2022 15:50:45 +0000 (UTC)
Date: Wed, 5 Oct 2022 11:50:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC PATCH 1/1] block: add vhost-blk backend
Message-ID: <Yz2n0w1CYTv1Bflz@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <20220725205527.313973-2-andrey.zhadchenko@virtuozzo.com>
 <Yzx/TS7byHcj6phc@fedora>
 <1cd0bb13-f701-d050-edeb-ed056d3202ef@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b+tCFZ+EjG7QpP/B"
Content-Disposition: inline
In-Reply-To: <1cd0bb13-f701-d050-edeb-ed056d3202ef@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--b+tCFZ+EjG7QpP/B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 04:06:58PM +0300, Andrey Zhadchenko wrote:
> Thanks for the review!
>=20
> On 10/4/22 21:45, Stefan Hajnoczi wrote:
> > On Mon, Jul 25, 2022 at 11:55:27PM +0300, Andrey Zhadchenko wrote:
> > > Although QEMU virtio is quite fast, there is still some room for
> > > improvements. Disk latency can be reduced if we handle virito-blk req=
uests
> > > in host kernel istead of passing them to QEMU. The patch adds vhost-b=
lk
> > > backend which sets up vhost-blk kernel module to process requests.
> > >=20
> > > test setup and results:
> > > fio --direct=3D1 --rw=3Drandread  --bs=3D4k  --ioengine=3Dlibaio --io=
depth=3D128
> > > QEMU drive options: cache=3Dnone
> > > filesystem: xfs
> > >=20
> > > SSD:
> > >                 | randread, IOPS  | randwrite, IOPS |
> > > Host           |      95.8k	 |	85.3k	   |
> > > QEMU virtio    |      57.5k	 |	79.4k	   |
> > > QEMU vhost-blk |      95.6k	 |	84.3k	   |
> > >=20
> > > RAMDISK (vq =3D=3D vcpu):
> > >                   | randread, IOPS | randwrite, IOPS |
> > > virtio, 1vcpu    |	123k	  |	 129k       |
> > > virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> > > virtio, 4vcpu    |	158k	  |	 154k       |
> > > vhost-blk, 1vcpu |	110k	  |	 113k       |
> > > vhost-blk, 2vcpu |	247k	  |	 252k       |
> > > vhost-blk, 4vcpu |	576k	  |	 567k       |
> > >=20
> > > Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> > > ---
> > >   hw/block/Kconfig              |   5 +
> > >   hw/block/meson.build          |   4 +
> > >   hw/block/vhost-blk.c          | 394 +++++++++++++++++++++++++++++++=
+++
> > >   hw/virtio/meson.build         |   3 +
> > >   hw/virtio/vhost-blk-pci.c     | 102 +++++++++
> > >   include/hw/virtio/vhost-blk.h |  50 +++++
> > >   meson.build                   |   5 +
> > >   7 files changed, 563 insertions(+)
> > >   create mode 100644 hw/block/vhost-blk.c
> > >   create mode 100644 hw/virtio/vhost-blk-pci.c
> > >   create mode 100644 include/hw/virtio/vhost-blk.h
> > >=20
> > > diff --git a/hw/block/Kconfig b/hw/block/Kconfig
> > > index 9e8f28f982..b4286ad10e 100644
> > > --- a/hw/block/Kconfig
> > > +++ b/hw/block/Kconfig
> > > @@ -36,6 +36,11 @@ config VIRTIO_BLK
> > >       default y
> > >       depends on VIRTIO
> > > +config VHOST_BLK
> > > +    bool
> > > +    default n
> >=20
> > Feel free to enable it by default. That way it gets more CI/build
> > coverage.
> >=20
> > > +    depends on VIRTIO && LINUX
> > > +
> > >   config VHOST_USER_BLK
> > >       bool
> > >       # Only PCI devices are provided for now
> > > diff --git a/hw/block/meson.build b/hw/block/meson.build
> > > index 2389326112..caf9bedff3 100644
> > > --- a/hw/block/meson.build
> > > +++ b/hw/block/meson.build
> > > @@ -19,4 +19,8 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: fil=
es('tc58128.c'))
> > >   specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-b=
lk.c'))
> > >   specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhos=
t-user-blk.c'))
> > > +if have_vhost_blk
> > > +  specific_ss.add(files('vhost-blk.c'))
> > > +endif
> >=20
> > Can this use the same add(when: 'CONFIG_VHOST_BLK', ...) syntax as the
> > other conditional builds above?
> I tried but it didn't go well for me :)
> I will check this again

Maybe a line needs to be added to meson_options.txt.

>=20
> >=20
> > > +
> > >   subdir('dataplane')
> > > diff --git a/hw/block/vhost-blk.c b/hw/block/vhost-blk.c
> > > new file mode 100644
> > > index 0000000000..33d90af270
> > > --- /dev/null
> > > +++ b/hw/block/vhost-blk.c
> > > @@ -0,0 +1,394 @@
> > > +/*
> > > + * Copyright (c) 2022 Virtuozzo International GmbH.
> > > + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> > > + *
> > > + * vhost-blk is host kernel accelerator for virtio-blk.
> > > + *
> > > + * This work is licensed under the terms of the GNU LGPL, version 2 =
or later.
> > > + * See the COPYING.LIB file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qom/object.h"
> > > +#include "hw/qdev-core.h"
> > > +#include "hw/boards.h"
> > > +#include "hw/virtio/vhost.h"
> > > +#include "hw/virtio/vhost-blk.h"
> > > +#include "hw/virtio/virtio.h"
> > > +#include "hw/virtio/virtio-blk.h"
> > > +#include "hw/virtio/virtio-bus.h"
> > > +#include "hw/virtio/virtio-access.h"
> > > +#include "hw/virtio/virtio-pci.h"
> > > +#include "sysemu/sysemu.h"
> > > +#include "linux-headers/linux/vhost.h"
> > > +#include <sys/ioctl.h>
> > > +#include <linux/fs.h>
> > > +
> > > +static int vhost_blk_start(VirtIODevice *vdev)
> > > +{
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    struct vhost_vring_file backend;
> > > +    int ret, i;
> > > +    int *fd =3D blk_bs(s->conf.conf.blk)->file->bs->opaque;
> >=20
> > This needs a clean API so vhost-blk.c doesn't make assumptions about the
> > file-posix BlockDriver's internal state memory layout.
> I thought it did have some API but I didn't manage to find it. Does it
> exist?
> Probably I can just open file by the name? But I didn't really want to
> manage flags like readonly. And if BlockDriver already opens this fd why
> bother with another copy?

I thought I added something like this in the past, but now I can't find
an API. One approach is to add a public API to block/file-posix.c like
int raw_get_fd(BlockDriverState *bs) that verifies that bs->drv is one
of the file-posix.c BlockDrivers and then returns
((BDRVRawState*)bs->opaque)->fd.

> >=20
> > > +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > > +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> > > +
> > > +    if (!k->set_guest_notifiers) {
> > > +        error_report("vhost-blk: binding does not support guest noti=
fiers");
> > > +        return -ENOSYS;
> > > +    }
> > > +
> > > +    if (s->vhost_started) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (ioctl(s->vhostfd, VHOST_SET_OWNER, NULL)) {
> > > +        error_report("vhost-blk: unable to set owner");
> > > +        return -ENOSYS;
> > > +    }
> > > +
> > > +    ret =3D vhost_dev_enable_notifiers(&s->dev, vdev);
> > > +    if (ret < 0) {
> > > +        error_report("vhost-blk: unable to enable dev notifiers", er=
rno);
> > > +        return ret;
> > > +    }
> > > +
> > > +    s->dev.acked_features =3D vdev->guest_features & s->dev.backend_=
features;
> > > +
> > > +    ret =3D vhost_dev_start(&s->dev, vdev);
> > > +    if (ret < 0) {
> > > +        error_report("vhost-blk: unable to start vhost dev");
> > > +        return ret;
> > > +    }
> > > +
> > > +    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> > > +    if (ret < 0) {
> > > +        error_report("vhost-blk: unable to bind guest notifiers");
> > > +        goto out;
> > > +    }
> > > +
> > > +    memset(&backend, 0, sizeof(backend));
> > > +    backend.index =3D 0;
> > > +    backend.fd =3D *fd;
> > > +    if (ioctl(s->vhostfd, VHOST_BLK_SET_BACKEND, &backend)) {
> > > +        error_report("vhost-blk: unable to set backend");
> > > +        ret =3D -errno;
> > > +        goto out;
> > > +    }
> > > +
> > > +    for (i =3D 0; i < s->dev.nvqs; i++) {
> > > +        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> > > +    }
> > > +
> > > +    event_notifier_set(virtio_queue_get_host_notifier(virtio_get_que=
ue(vdev, 0)));
> >=20
> > Should this be done for all vqs?
> >=20
> > > +
> > > +    s->vhost_started =3D true;
> > > +
> > > +    return 0;
> > > +
> > > +out:
> > > +    vhost_dev_stop(&s->dev, vdev);
> > > +    return ret;
> > > +
> > > +}
> > > +
> > > +static void vhost_blk_stop(VirtIODevice *vdev)
> > > +{
> > > +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> > > +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    int ret;
> > > +
> > > +    if (!s->vhost_started) {
> > > +        return;
> > > +    }
> > > +
> > > +    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> > > +    if (ret < 0) {
> > > +        error_report("vhost-blk: unable to unbind guest notifiers");
> > > +    }
> > > +    vhost_dev_disable_notifiers(&s->dev, vdev);
> > > +    vhost_dev_stop(&s->dev, vdev);
> > > +
> > > +    s->vhost_started =3D false;
> > > +}
> > > +
> > > +static void vhost_blk_reset(VirtIODevice *vdev)
> > > +{
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    int ret;
> > > +
> > > +    vhost_blk_stop(vdev);
> > > +    ret =3D ioctl(s->vhostfd, VHOST_RESET_OWNER, NULL);
> > > +    if (ret && errno !=3D EPERM) {
> > > +            error_report("vhost-blk: failed to reset owner %d", errn=
o);
> > > +    }
> > > +}
> > > +
> > > +static void vhost_blk_set_status(VirtIODevice *vdev, uint8_t status)
> > > +{
> > > +    if (status & (VIRTIO_CONFIG_S_NEEDS_RESET | VIRTIO_CONFIG_S_FAIL=
ED)) {
> > > +        vhost_blk_stop(vdev);
> > > +        return;
> > > +    }
> > > +
> > > +    if (!(status & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > +        return;
> > > +    }
> > > +
> > > +    if (vhost_blk_start(vdev)) {
> > > +        error_report("vhost-blk: failed to start");
> > > +    }
> > > +}
> > > +
> > > +static void vhost_blk_handle_output(VirtIODevice *vdev, VirtQueue *v=
q)
> > > +{
> > > +}
> > > +
> > > +static void vhost_blk_device_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    VhostBlkConf *conf =3D &s->conf;
> > > +    int i, ret;
> > > +
> > > +    if (!conf->conf.blk) {
> > > +        error_setg(errp, "vhost-blk: drive property not set");
> > > +        return;
> > > +    }
> > > +
> > > +    if (!blk_is_inserted(conf->conf.blk)) {
> > > +        error_setg(errp, "vhost-blk: device needs media, but drive i=
s empty");
> > > +        return;
> > > +    }
> > > +
> > > +    if (conf->num_queues =3D=3D VHOST_BLK_AUTO_NUM_QUEUES) {
> > > +        conf->num_queues =3D MIN(virtio_pci_optimal_num_queues(0),
> > > +                               VHOST_BLK_MAX_QUEUES);
> >=20
> > Why is 8 (VHOST_BLK_MAX_QUEUES) queues the maximum?
>=20
> Arbitrary number for RFC patch to simplify memory management in kernel. I
> will re-do it if we will get this series past RFC.
>=20
> >=20
> > > +    }
> > > +
> > > +    if (!conf->num_queues) {
> > > +        error_setg(errp, "vhost-blk: num-queues property must be lar=
ger than 0");
> > > +        return;
> > > +    }
> > > +
> > > +    if (conf->queue_size <=3D 2) {
> > > +        error_setg(errp, "vhost-blk: invalid queue-size property (%"=
 PRIu16 "), "
> > > +                   "must be > 2", conf->queue_size);
> > > +        return;
> > > +    }
> > > +
> > > +    if (!is_power_of_2(conf->queue_size) ||
> > > +        conf->queue_size > VIRTQUEUE_MAX_SIZE) {
> > > +        error_setg(errp, "vhost_blk: invalid queue-size property (%"=
 PRIu16 "), "
> > > +                   "must be a power of 2 (max %d)",
> > > +                   conf->queue_size, VIRTQUEUE_MAX_SIZE);
> > > +        return;
> > > +    }
> > > +
> > > +    if (!blkconf_apply_backend_options(&conf->conf,
> > > +                                       !blk_supports_write_perm(conf=
->conf.blk),
> > > +                                       true, errp)) {
> > > +        return;
> > > +    }
> > > +
> > > +    if (!blkconf_geometry(&conf->conf, NULL, 65535, 255, 255, errp))=
 {
> > > +        return;
> > > +    }
> > > +
> > > +    if (!blkconf_blocksizes(&conf->conf, errp)) {
> > > +        return;
> > > +    }
> > > +
> > > +    s->dev.nvqs =3D conf->num_queues;
> > > +    s->dev.max_queues =3D conf->num_queues;
> > > +    s->dev.vqs =3D g_new(struct vhost_virtqueue, s->dev.nvqs);
> > > +    s->dev.vq_index =3D 0;
> > > +
> > > +    virtio_init(vdev, VIRTIO_ID_BLOCK, sizeof(struct virtio_blk_conf=
ig));
> > > +
> > > +    for (i =3D 0; i < conf->num_queues; i++) {
> > > +        virtio_add_queue(vdev, conf->queue_size, vhost_blk_handle_ou=
tput);
> > > +    }
> > > +
> > > +    s->vhostfd =3D open("/dev/vhost-blk", O_RDWR);
> > > +    if (s->vhostfd < 0) {
> > > +        error_setg(errp, "vhost-blk: unable to open /dev/vhost-blk");
> > > +        goto cleanup;
> > > +    }
> > > +
> > > +    s->dev.acked_features =3D 0;
> > > +    ret =3D ioctl(s->vhostfd, VHOST_GET_FEATURES, &s->dev.backend_fe=
atures);
> > > +    if (ret < 0) {
> > > +        error_setg(errp, "vhost-blk: unable to get backend features"=
);
> > > +        goto cleanup;
> > > +    }
> > > +
> > > +    ret =3D vhost_dev_init(&s->dev, (void *)((size_t)s->vhostfd),
> > > +                         VHOST_BACKEND_TYPE_KERNEL, 0, false);
> >=20
> > The last parameter should be NULL (Error **) instead of false.
> >=20
> > > +    if (ret < 0) {
> > > +        error_setg(errp, "vhost-blk: vhost initialization failed: %s=
",
> > > +                strerror(-ret));
> > > +        goto cleanup;
> > > +    }
> > > +
> > > +    return;
> > > +
> > > +cleanup:
> > > +    g_free(s->dev.vqs);
> > > +    close(s->vhostfd);
> > > +    for (i =3D 0; i < conf->num_queues; i++) {
> > > +        virtio_del_queue(vdev, i);
> > > +    }
> > > +    virtio_cleanup(vdev);
> > > +    return;
> > > +}
> > > +
> > > +static void vhost_blk_device_unrealize(DeviceState *dev)
> > > +{
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > +    VHostBlk *s =3D VHOST_BLK(dev);
> > > +
> > > +    vhost_blk_set_status(vdev, 0);
> > > +    vhost_dev_cleanup(&s->dev);
> > > +    g_free(s->dev.vqs);
> > > +    virtio_cleanup(vdev);
> > > +}
> > > +
> > > +static const int user_feature_bits[] =3D {
> > > +    VIRTIO_BLK_F_FLUSH,
> > > +    VIRTIO_RING_F_INDIRECT_DESC,
> > > +    VIRTIO_RING_F_EVENT_IDX,
> > > +    VHOST_INVALID_FEATURE_BIT
> > > +};
> > > +
> > > +
> > > +static uint64_t vhost_blk_get_features(VirtIODevice *vdev,
> > > +                                            uint64_t features,
> > > +                                            Error **errp)
> > > +{
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    uint64_t res;
> > > +
> > > +    features |=3D s->host_features;
> > > +
> > > +    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> > > +    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> > > +    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> > > +    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> > > +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
> > > +
> > > +    virtio_add_feature(&features, VIRTIO_F_VERSION_1);
> > > +
> > > +    if (!blk_is_writable(s->conf.conf.blk)) {
> > > +        virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> > > +    }
> > > +
> > > +    if (s->conf.num_queues > 1) {
> > > +        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> > > +    }
> > > +
> > > +    res =3D vhost_get_features(&s->dev, user_feature_bits, features);
> > > +
> > > +    return res;
> > > +}
> > > +
> > > +static void vhost_blk_update_config(VirtIODevice *vdev, uint8_t *con=
fig)
> > > +{
> > > +    VHostBlk *s =3D VHOST_BLK(vdev);
> > > +    BlockConf *conf =3D &s->conf.conf;
> > > +    struct virtio_blk_config blkcfg;
> > > +    uint64_t capacity;
> > > +    int64_t length;
> > > +    int blk_size =3D conf->logical_block_size;
> > > +
> > > +    blk_get_geometry(s->conf.conf.blk, &capacity);
> > > +    memset(&blkcfg, 0, sizeof(blkcfg));
> > > +    virtio_stq_p(vdev, &blkcfg.capacity, capacity);
> > > +    virtio_stl_p(vdev, &blkcfg.seg_max, s->conf.queue_size - 2);
> > > +    virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
> > > +    virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
> > > +    blkcfg.geometry.heads =3D conf->heads;
> > > +
> > > +    length =3D blk_getlength(s->conf.conf.blk);
> > > +    if (length > 0 && length / conf->heads / conf->secs % blk_size) {
> > > +        unsigned short mask;
> > > +
> > > +        mask =3D (s->conf.conf.logical_block_size / BDRV_SECTOR_SIZE=
) - 1;
> > > +        blkcfg.geometry.sectors =3D conf->secs & ~mask;
> > > +    } else {
> > > +        blkcfg.geometry.sectors =3D conf->secs;
> > > +    }
> > > +
> > > +    blkcfg.size_max =3D 0;
> > > +    blkcfg.physical_block_exp =3D get_physical_block_exp(conf);
> > > +    blkcfg.alignment_offset =3D 0;
> > > +    virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
> > > +
> > > +    memcpy(config, &blkcfg, sizeof(struct virtio_blk_config));
> > > +}
> > > +
> > > +static Property vhost_blk_properties[] =3D {
> > > +    DEFINE_BLOCK_PROPERTIES(VHostBlk, conf.conf),
> > > +    DEFINE_PROP_UINT16("num-queues", VHostBlk, conf.num_queues,
> > > +                       VHOST_BLK_AUTO_NUM_QUEUES),
> > > +    DEFINE_PROP_UINT16("queue-size", VHostBlk, conf.queue_size, 256),
> > > +/* Discard and write-zeroes not yet implemented in kernel module */
> > > +    DEFINE_PROP_BIT64("discard", VHostBlk, host_features,
> > > +                      VIRTIO_BLK_F_DISCARD, false),
> > > +    DEFINE_PROP_BIT64("write-zeroes", VHostBlk, host_features,
> > > +                      VIRTIO_BLK_F_WRITE_ZEROES, false),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > > +static const VMStateDescription vmstate_vhost_blk =3D {
> > > +    .name =3D "vhost-blk",
> > > +    .minimum_version_id =3D 1,
> > > +    .version_id =3D 1,
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_VIRTIO_DEVICE,
> > > +        VMSTATE_END_OF_LIST()
> > > +    },
> > > +};
> > > +
> > > +static void vhost_blk_class_init(ObjectClass *klass, void *data)
> > > +{
> > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> > > +
> > > +    device_class_set_props(dc, vhost_blk_properties);
> > > +    dc->vmsd =3D &vmstate_vhost_blk;
> >=20
> > Does this really support live migration? Are in-flight requests drained
> > when pausing for live migration handover?
>=20
> Not yet but it doesn't look hard to implement. Resetting device will drain
> all requests.
>=20
> >=20
> > > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> > > +    vdc->realize =3D vhost_blk_device_realize;
> > > +    vdc->unrealize =3D vhost_blk_device_unrealize;
> > > +    vdc->get_config =3D vhost_blk_update_config;
> > > +    vdc->get_features =3D vhost_blk_get_features;
> > > +    vdc->set_status =3D vhost_blk_set_status;
> > > +    vdc->reset =3D vhost_blk_reset;
> > > +}
> > > +
> > > +static void vhost_blk_instance_init(Object *obj)
> > > +{
> > > +    VHostBlk *s =3D VHOST_BLK(obj);
> > > +
> > > +    device_add_bootindex_property(obj, &s->conf.conf.bootindex,
> > > +                                  "bootindex", "/disk@0,0",
> > > +                                  DEVICE(obj));
> > > +}
> > > +
> > > +static const TypeInfo vhost_blk_info =3D {
> > > +    .name =3D TYPE_VHOST_BLK,
> > > +    .parent =3D TYPE_VIRTIO_DEVICE,
> > > +    .instance_size =3D sizeof(VHostBlk),
> > > +    .instance_init =3D vhost_blk_instance_init,
> > > +    .class_init =3D vhost_blk_class_init,
> > > +};
> > > +
> > > +static void virtio_register_types(void)
> > > +{
> > > +    type_register_static(&vhost_blk_info);
> > > +}
> > > +
> > > +type_init(virtio_register_types)
> > > diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> > > index 7e8877fd64..fb2c0e7242 100644
> > > --- a/hw/virtio/meson.build
> > > +++ b/hw/virtio/meson.build
> > > @@ -40,6 +40,9 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_RNG', if=
_true: files('vhost-user-rng-
> > >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('v=
host-user-scsi-pci.c'))
> > >   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-=
scsi-pci.c'))
> > >   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vho=
st-user-fs-pci.c'))
> > > +if have_vhost_blk
> > > +  virtio_ss.add(files('vhost-blk-pci.c'))
> > > +endif
> > >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('vir=
tio-crypto-pci.c'))
> > >   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files(=
'virtio-input-host-pci.c'))
> > > diff --git a/hw/virtio/vhost-blk-pci.c b/hw/virtio/vhost-blk-pci.c
> > > new file mode 100644
> > > index 0000000000..f3b6e112b4
> > > --- /dev/null
> > > +++ b/hw/virtio/vhost-blk-pci.c
> > > @@ -0,0 +1,102 @@
> > > +/*
> > > + * Copyright (c) 2022 Virtuozzo International GmbH.
> > > + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> > > + *
> > > + * vhost-blk PCI bindings
> > > + *
> > > + * This work is licensed under the terms of the GNU LGPL, version 2 =
or later.
> > > + * See the COPYING.LIB file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +
> > > +#include "standard-headers/linux/virtio_pci.h"
> > > +#include "hw/virtio/virtio.h"
> > > +#include "hw/virtio/vhost-blk.h"
> > > +#include "hw/pci/pci.h"
> > > +#include "hw/qdev-properties.h"
> > > +#include "qapi/error.h"
> > > +#include "qemu/error-report.h"
> > > +#include "qemu/module.h"
> > > +#include "hw/virtio/virtio-pci.h"
> > > +#include "qom/object.h"
> > > +
> > > +typedef struct VHostBlkPCI VHostBlkPCI;
> > > +
> > > +/*
> > > + * vhost-blk-pci: This extends VirtioPCIProxy.
> > > + */
> > > +#define TYPE_VHOST_BLK_PCI "vhost-blk-pci-base"
> > > +DECLARE_INSTANCE_CHECKER(VHostBlkPCI, VHOST_BLK_PCI,
> > > +                         TYPE_VHOST_BLK_PCI)
> > > +
> > > +struct VHostBlkPCI {
> > > +    VirtIOPCIProxy parent_obj;
> > > +    VHostBlk vdev;
> > > +};
> > > +
> > > +static Property vhost_blk_pci_properties[] =3D {
> > > +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> > > +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> > > +                       DEV_NVECTORS_UNSPECIFIED),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > > +
> > > +static void vhost_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **=
errp)
> > > +{
> > > +    VHostBlkPCI *dev =3D VHOST_BLK_PCI(vpci_dev);
> > > +    DeviceState *vdev =3D DEVICE(&dev->vdev);
> > > +
> > > +    if (dev->vdev.conf.num_queues =3D=3D VHOST_BLK_AUTO_NUM_QUEUES) {
> > > +        dev->vdev.conf.num_queues =3D MIN(virtio_pci_optimal_num_que=
ues(0),
> > > +                                        VHOST_BLK_MAX_QUEUES);
> > > +    }
> > > +
> > > +    if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> > > +        vpci_dev->nvectors =3D dev->vdev.conf.num_queues + 1;
> > > +    }
> > > +
> > > +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > > +}
> > > +
> > > +static void vhost_blk_pci_class_init(ObjectClass *klass, void *data)
> > > +{
> > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > +    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> > > +    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
> > > +
> > > +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> > > +    device_class_set_props(dc, vhost_blk_pci_properties);
> > > +    k->realize =3D vhost_blk_pci_realize;
> > > +    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
> > > +    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_BLOCK;
> > > +    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
> > > +    pcidev_k->class_id =3D PCI_CLASS_STORAGE_SCSI;
> > > +}
> > > +
> > > +static void vhost_blk_pci_instance_init(Object *obj)
> > > +{
> > > +    VHostBlkPCI *dev =3D VHOST_BLK_PCI(obj);
> > > +
> > > +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> > > +                                TYPE_VHOST_BLK);
> > > +    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> > > +                              "bootindex");
> > > +}
> > > +
> > > +static const VirtioPCIDeviceTypeInfo vhost_blk_pci_info =3D {
> > > +    .base_name               =3D TYPE_VHOST_BLK_PCI,
> > > +    .generic_name            =3D "vhost-blk-pci",
> > > +    .transitional_name       =3D "vhost-blk-pci-transitional",
> > > +    .non_transitional_name   =3D "vhost-blk-pci-non-transitional",
> > > +    .instance_size  =3D sizeof(VHostBlkPCI),
> > > +    .instance_init  =3D vhost_blk_pci_instance_init,
> > > +    .class_init     =3D vhost_blk_pci_class_init,
> > > +};
> > > +
> > > +static void vhost_blk_pci_register(void)
> > > +{
> > > +    virtio_pci_types_register(&vhost_blk_pci_info);
> > > +}
> > > +
> > > +type_init(vhost_blk_pci_register)
> > > diff --git a/include/hw/virtio/vhost-blk.h b/include/hw/virtio/vhost-=
blk.h
> > > new file mode 100644
> > > index 0000000000..76ece4215d
> > > --- /dev/null
> > > +++ b/include/hw/virtio/vhost-blk.h
> > > @@ -0,0 +1,50 @@
> > > +/*
> > > + * Copyright (c) 2022 Virtuozzo International GmbH.
> > > + * Author: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
> > > + *
> > > + * vhost-blk is host kernel accelerator for virtio-blk.
> > > + *
> > > + * This work is licensed under the terms of the GNU LGPL, version 2 =
or later.
> > > + * See the COPYING.LIB file in the top-level directory.
> > > + */
> > > +
> > > +#ifndef VHOST_BLK_H
> > > +#define VHOST_BLK_H
> > > +
> > > +#include "standard-headers/linux/virtio_blk.h"
> > > +#include "hw/block/block.h"
> > > +#include "hw/virtio/vhost.h"
> > > +#include "sysemu/block-backend.h"
> > > +
> > > +#define TYPE_VHOST_BLK "vhost-blk"
> > > +#define VHOST_BLK(obj) \
> > > +        OBJECT_CHECK(VHostBlk, (obj), TYPE_VHOST_BLK)
> > > +
> > > +#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
> > > +#define VHOST_BLK_MAX_QUEUES 8
> > > +
> > > +/*
> > > + * normally should be visible from imported headers
> > > + * temporary define here to simplify development
> > > + */
> > > +#define VHOST_BLK_SET_BACKEND          _IOW(VHOST_VIRTIO, 0x90, \
> > > +                                            struct vhost_vring_file)
> > > +
> > > +typedef struct VhostBlkConf {
> > > +    BlockConf conf;
> >=20
> > What is the purpose of using BlockConf but bypassing the QEMU block
> > layer?
>=20
> I did not want to
> - Decalre several properties BlockConf already have
> - Duplicate configuration helpers like
> blkconf_geometry() for the above
> These were the main reasons.
>=20
> >=20
> > If the file is a qcow2 file or there are additional block drivers like
> > the luks crypto driver then this doesn't work. If block jobs and other
> > block operations are performed on the QMP monitor then the image can be
> > corrupted.
>=20
> Thank you for the pointing this out. Unfortunately I know little about qe=
mu
> block layer and did not think such things can happen in this case. I will
> try to re-evaluate this.

Kevin may have an opinion on whether to use the QEMU block layer or to
have a filename=3D<str>/fd=3D<fdnum> options for setting the file/block
device. I think in the past the suggestion was to avoid using the QEMU
block layer if I/O won't actually go through the QEMU block layer.

>=20
> >=20
> > > +    uint16_t num_queues;
> > > +    uint16_t queue_size;
> > > +} VhostBlkConf;
> > > +
> > > +typedef struct VHostBlk {
> > > +    VirtIODevice parent_obj;
> > > +    VhostBlkConf conf;
> > > +    uint64_t host_features;
> > > +    uint64_t decided_features;
> > > +    struct virtio_blk_config blkcfg;
> > > +    int vhostfd;
> > > +    struct vhost_dev dev;
> > > +    bool vhost_started;
> > > +} VHostBlk;
> > > +
> > > +#endif
> > > diff --git a/meson.build b/meson.build
> > > index 8a8c415fc1..7c00a8ce89 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -336,6 +336,9 @@ have_vhost_kernel =3D get_option('vhost_kernel') \
> > >   have_vhost_user_crypto =3D get_option('vhost_crypto') \
> > >     .require(have_vhost_user,
> > >              error_message: 'vhost-crypto requires vhost-user to be e=
nabled').allowed()
> > > +have_vhost_blk =3D get_option('vhost_blk') \
> > > +  .require(targetos =3D=3D 'linux',
> > > +           error_message: 'vhost-kernel is only available on Linux')=
=2Eallowed()
> > >   have_vhost =3D have_vhost_user or have_vhost_vdpa or have_vhost_ker=
nel
> > > @@ -1814,6 +1817,7 @@ config_host_data.set('CONFIG_VHOST_KERNEL', hav=
e_vhost_kernel)
> > >   config_host_data.set('CONFIG_VHOST_USER', have_vhost_user)
> > >   config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
> > >   config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
> > > +config_host_data.set('CONFIG_VHOST_BLK', have_vhost_blk)
> > >   config_host_data.set('CONFIG_VMNET', vmnet.found())
> > >   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_use=
r_blk_server)
> > >   config_host_data.set('CONFIG_VDUSE_BLK_EXPORT', have_vduse_blk_expo=
rt)
> > > @@ -3756,6 +3760,7 @@ summary_info +=3D {'vhost-user support': have_v=
host_user}
> > >   summary_info +=3D {'vhost-user-crypto support': have_vhost_user_cry=
pto}
> > >   summary_info +=3D {'vhost-user-blk server support': have_vhost_user=
_blk_server}
> > >   summary_info +=3D {'vhost-vdpa support': have_vhost_vdpa}
> > > +summary_info +=3D {'vhost-blk support': have_vhost_blk}
> > >   summary_info +=3D {'build guest agent': have_ga}
> > >   summary(summary_info, bool_yn: true, section: 'Configurable feature=
s')
> > > --=20
> > > 2.31.1
> > >=20
>=20

--b+tCFZ+EjG7QpP/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9p9MACgkQnKSrs4Gr
c8hmWQgAq6/ljgdFMbmP095l+AaGTpCMr/QyM0I3aoh5uDWsWJECd5I2zfcCd8XS
WKiP08LLf9g5zeGMePTCS9lHvP4XCb0AOZiPy1XypNM1cK1Vdz17HJuU0gQs7a7Q
k0Yp5waOzy2H7C7EJzox34/G2ZSscRNgOZrKWA4YBE/j7+MFGCX6lCWKnH4ekTmD
zFcyjzlYPDzk7mRxOD5RyIEdqzgbSrNGCHNAOsAStuYqJMDLTvypqJqA78shLDsK
rvhL10+ibL+BPwGQG2OCpgE8/8ykq1dYuXyJwG3JC5avFrI8TW1valMYAMEjdjHz
lUHiBhdTW/TpXXsh5AZGxh1XkGGydg==
=61Qa
-----END PGP SIGNATURE-----

--b+tCFZ+EjG7QpP/B--


