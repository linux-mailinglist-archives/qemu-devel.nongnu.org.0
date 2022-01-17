Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110549097F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:25:23 +0100 (CET)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9S0g-0001ao-EY
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:25:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RDz-0002Wd-91
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:35:03 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n9RDv-0000eM-Iq
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 07:35:02 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JcrrM1fRFz8wPR;
 Mon, 17 Jan 2022 20:32:03 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 20:34:51 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Mon, 17 Jan 2022 20:34:50 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 05/10] vdpa-dev: implement the realize interface
Thread-Topic: [RFC 05/10] vdpa-dev: implement the realize interface
Thread-Index: AQHYAc9x2eZeGsh4c02Kkb+31MnmdqxTsSqAgAGZVyCAAA54gIAR4AbQ
Date: Mon, 17 Jan 2022 12:34:50 +0000
Message-ID: <99584ad9258745e1a9d1ba2e7ee4239d@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-6-longpeng2@huawei.com>
 <YdVwOwVuEOgrRuBm@stefanha-x1.localdomain>
 <8abbe9c2599247599aec2d0d7ff01c32@huawei.com>
 <YdbTvxT8x3hiejKY@stefanha-x1.localdomain>
In-Reply-To: <YdbTvxT8x3hiejKY@stefanha-x1.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> Sent: Thursday, January 6, 2022 7:34 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
>=20
> On Thu, Jan 06, 2022 at 03:02:37AM +0000, Longpeng (Mike, Cloud Infrastru=
cture
> Service Product Dept.) wrote:
> >
> >
> > > -----Original Message-----
> > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > Sent: Wednesday, January 5, 2022 6:18 PM
> > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > <longpeng2@huawei.com>
> > > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > > Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
> > >
> > > On Wed, Jan 05, 2022 at 08:58:55AM +0800, Longpeng(Mike) wrote:
> > > > From: Longpeng <longpeng2@huawei.com>
> > > >
> > > > Implements the .realize interface.
> > > >
> > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > ---
> > > >  hw/virtio/vdpa-dev.c         | 114 +++++++++++++++++++++++++++++++=
++++
> > > >  include/hw/virtio/vdpa-dev.h |   8 +++
> > > >  2 files changed, 122 insertions(+)
> > > >
> > > > diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> > > > index 790117fb3b..2d534d837a 100644
> > > > --- a/hw/virtio/vdpa-dev.c
> > > > +++ b/hw/virtio/vdpa-dev.c
> > > > @@ -15,9 +15,122 @@
> > > >  #include "sysemu/sysemu.h"
> > > >  #include "sysemu/runstate.h"
> > > >
> > > > +static void
> > > > +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueu=
e
> *vq)
> > > > +{
> > > > +    /* Nothing to do */
> > > > +}
> > > > +
> > > > +static int vdpa_dev_get_info_by_fd(int fd, uint64_t cmd, Error **e=
rrp)
> > >
> > > This looks similar to the helper function in a previous patch but thi=
s
> > > time the return value type is int instead of uint32_t. Please make th=
e
> > > types consistent.
> > >
> >
> > OK.
> >
> > > > +{
> > > > +    int val;
> > > > +
> > > > +    if (ioctl(fd, cmd, &val) < 0) {
> > > > +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s"=
,
> > > > +                   cmd, strerror(errno));
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    return val;
> > > > +}
> > > > +
> > > > +static inline int vdpa_dev_get_queue_size(int fd, Error **errp)
> > > > +{
> > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VRING_NUM, e=
rrp);
> > > > +}
> > > > +
> > > > +static inline int vdpa_dev_get_vqs_num(int fd, Error **errp)
> > > > +{
> > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VQS_NUM, err=
p);
> > > > +}
> > > > +
> > > > +static inline int vdpa_dev_get_config_size(int fd, Error **errp)
> > > > +{
> > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_CONFIG_SIZE,
> errp);
> > > > +}
> > > > +
> > > >  static void vhost_vdpa_device_realize(DeviceState *dev, Error **er=
rp)
> > > >  {
> > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > > +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> > > > +    uint32_t device_id;
> > > > +    int max_queue_size;
> > > > +    int fd;
> > > > +    int i, ret;
> > > > +
> > > > +    fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
> > > > +    if (fd =3D=3D -1) {
> > > > +        return;
> > > > +    }
> > > > +    s->vdpa.device_fd =3D fd;
> > >
> > > This is the field I suggest exposing as a QOM property so it can be s=
et
> > > from the proxy object (e.g. when the PCI proxy opens the vdpa device
> > > before our .realize() function is called).
> > >
> >
> > OK.
> >
> > > > +
> > > > +    max_queue_size =3D vdpa_dev_get_queue_size(fd, errp);
> > > > +    if (*errp) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    if (s->queue_size > max_queue_size) {
> > > > +        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %=
d
> > > (max:%d)",
> > > > +                   s->queue_size, max_queue_size);
> > > > +        goto out;
> > > > +    } else if (!s->queue_size) {
> > > > +        s->queue_size =3D max_queue_size;
> > > > +    }
> > > > +
> > > > +    ret =3D vdpa_dev_get_vqs_num(fd, errp);
> > > > +    if (*errp) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    s->dev.nvqs =3D ret;
> > >
> > > There is no input validation because we trust the kernel vDPA return
> > > values. That seems okay for now but if there is a vhost-user version =
of
> > > this in the future then input validation will be necessary to achieve
> > > isolation between QEMU and the vhost-user processes. I suggest includ=
ing
> > > input validation code right away because it's harder to audit the cod=
e
> > > and fix missing input validation later on.
> > >
> >
> > Make sense!
> >
> > Should we only need to validate the upper boundary (e.g. <VIRTIO_QUEUE_=
MAX)?
>=20
> Careful, ret is currently an int so negative values would bypass the <
> VIRTIO_QUEUE_MAX check.
>=20
> >
> > > > +    s->dev.vqs =3D g_new0(struct vhost_virtqueue, s->dev.nvqs);
> > > > +    s->dev.vq_index =3D 0;
> > > > +    s->dev.vq_index_end =3D s->dev.nvqs;
> > > > +    s->dev.backend_features =3D 0;
> > > > +    s->started =3D false;
> > > > +
> > > > +    ret =3D vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_V=
DPA, 0,
> > > NULL);
> > > > +    if (ret < 0) {
> > > > +        error_setg(errp, "vhost-vdpa-device: vhost initialization
> > > failed: %s",
> > > > +                   strerror(-ret));
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    ret =3D s->dev.vhost_ops->vhost_get_device_id(&s->dev, &device=
_id);
> > >
> > > The vhost_*() API abstracts the ioctl calls but this source file and =
the
> > > PCI proxy have ioctl calls. I wonder if it's possible to move the ioc=
tls
> > > calls into the vhost_*() API? That would be cleaner and also make it
> > > easier to add vhost-user vDPA support in the future.
> >
> > We need these ioctls calls because we need invoke them before the vhost=
-dev
> > object is initialized.
>=20
> It may be possible to clean this up by changing how vhost_dev_init()
> works but I haven't investigated. The issue is that the vhost_dev_init()
> API requires information from the caller that has to be fetched from the
> vDPA device. This forces the caller to communicate directly with the
> vDPA device before calling vhost_dev_init(). It may be possible to move
> this setup code inside vhost_dev_init() (and vhost_ops callbacks).
>=20

Hmm, this is still not clear to me, so let's continue to discuss this
in v2 if you think it's necessary.

> Stefan

