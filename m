Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED94863C6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:37:09 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5R4u-0001sc-7S
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5R2P-0000ZW-A5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:34:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n5R2M-0005p7-4f
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641468869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Ip+KQIzFQihfMHSLHkbGnlCMmHJDrTbfnqqWSQl0OA=;
 b=esk8gmtssYByN5QfUxN5fwtV4A2yEiWVT/W+7lxzWr3YomfxHpuG3tr9BIIQUcpOYrRabN
 3fI4OqHSLQx5Z37FfWpqb6ItdhI9M5hz2y6RGtO33gP56Dx9VYp80Hwq7i/NXi3B5fqQG6
 na/j2HBHm6j6uoluDj+75y9RCjRc6Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-eAwgSQUsNWO8EQi0EGhftA-1; Thu, 06 Jan 2022 06:34:25 -0500
X-MC-Unique: eAwgSQUsNWO8EQi0EGhftA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE6981015DA0;
 Thu,  6 Jan 2022 11:34:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 677F67AD1E;
 Thu,  6 Jan 2022 11:34:24 +0000 (UTC)
Date: Thu, 6 Jan 2022 11:34:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
Message-ID: <YdbTvxT8x3hiejKY@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-6-longpeng2@huawei.com>
 <YdVwOwVuEOgrRuBm@stefanha-x1.localdomain>
 <8abbe9c2599247599aec2d0d7ff01c32@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8abbe9c2599247599aec2d0d7ff01c32@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NPi4bmmTXWp2ThKP"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NPi4bmmTXWp2ThKP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 03:02:37AM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > Sent: Wednesday, January 5, 2022 6:18 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
> >=20
> > On Wed, Jan 05, 2022 at 08:58:55AM +0800, Longpeng(Mike) wrote:
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > Implements the .realize interface.
> > >
> > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > ---
> > >  hw/virtio/vdpa-dev.c         | 114 +++++++++++++++++++++++++++++++++=
++
> > >  include/hw/virtio/vdpa-dev.h |   8 +++
> > >  2 files changed, 122 insertions(+)
> > >
> > > diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> > > index 790117fb3b..2d534d837a 100644
> > > --- a/hw/virtio/vdpa-dev.c
> > > +++ b/hw/virtio/vdpa-dev.c
> > > @@ -15,9 +15,122 @@
> > >  #include "sysemu/sysemu.h"
> > >  #include "sysemu/runstate.h"
> > >
> > > +static void
> > > +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue =
*vq)
> > > +{
> > > +    /* Nothing to do */
> > > +}
> > > +
> > > +static int vdpa_dev_get_info_by_fd(int fd, uint64_t cmd, Error **err=
p)
> >=20
> > This looks similar to the helper function in a previous patch but this
> > time the return value type is int instead of uint32_t. Please make the
> > types consistent.
> >=20
>=20
> OK.
>=20
> > > +{
> > > +    int val;
> > > +
> > > +    if (ioctl(fd, cmd, &val) < 0) {
> > > +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
> > > +                   cmd, strerror(errno));
> > > +        return -1;
> > > +    }
> > > +
> > > +    return val;
> > > +}
> > > +
> > > +static inline int vdpa_dev_get_queue_size(int fd, Error **errp)
> > > +{
> > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VRING_NUM, err=
p);
> > > +}
> > > +
> > > +static inline int vdpa_dev_get_vqs_num(int fd, Error **errp)
> > > +{
> > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VQS_NUM, errp)=
;
> > > +}
> > > +
> > > +static inline int vdpa_dev_get_config_size(int fd, Error **errp)
> > > +{
> > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_CONFIG_SIZE, e=
rrp);
> > > +}
> > > +
> > >  static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp=
)
> > >  {
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> > > +    uint32_t device_id;
> > > +    int max_queue_size;
> > > +    int fd;
> > > +    int i, ret;
> > > +
> > > +    fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
> > > +    if (fd =3D=3D -1) {
> > > +        return;
> > > +    }
> > > +    s->vdpa.device_fd =3D fd;
> >=20
> > This is the field I suggest exposing as a QOM property so it can be set
> > from the proxy object (e.g. when the PCI proxy opens the vdpa device
> > before our .realize() function is called).
> >=20
>=20
> OK.
>=20
> > > +
> > > +    max_queue_size =3D vdpa_dev_get_queue_size(fd, errp);
> > > +    if (*errp) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    if (s->queue_size > max_queue_size) {
> > > +        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %d
> > (max:%d)",
> > > +                   s->queue_size, max_queue_size);
> > > +        goto out;
> > > +    } else if (!s->queue_size) {
> > > +        s->queue_size =3D max_queue_size;
> > > +    }
> > > +
> > > +    ret =3D vdpa_dev_get_vqs_num(fd, errp);
> > > +    if (*errp) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    s->dev.nvqs =3D ret;
> >=20
> > There is no input validation because we trust the kernel vDPA return
> > values. That seems okay for now but if there is a vhost-user version of
> > this in the future then input validation will be necessary to achieve
> > isolation between QEMU and the vhost-user processes. I suggest includin=
g
> > input validation code right away because it's harder to audit the code
> > and fix missing input validation later on.
> >=20
>=20
> Make sense!
>=20
> Should we only need to validate the upper boundary (e.g. <VIRTIO_QUEUE_MA=
X)?

Careful, ret is currently an int so negative values would bypass the <
VIRTIO_QUEUE_MAX check.

>=20
> > > +    s->dev.vqs =3D g_new0(struct vhost_virtqueue, s->dev.nvqs);
> > > +    s->dev.vq_index =3D 0;
> > > +    s->dev.vq_index_end =3D s->dev.nvqs;
> > > +    s->dev.backend_features =3D 0;
> > > +    s->started =3D false;
> > > +
> > > +    ret =3D vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDP=
A, 0,
> > NULL);
> > > +    if (ret < 0) {
> > > +        error_setg(errp, "vhost-vdpa-device: vhost initialization
> > failed: %s",
> > > +                   strerror(-ret));
> > > +        goto out;
> > > +    }
> > > +
> > > +    ret =3D s->dev.vhost_ops->vhost_get_device_id(&s->dev, &device_i=
d);
> >=20
> > The vhost_*() API abstracts the ioctl calls but this source file and th=
e
> > PCI proxy have ioctl calls. I wonder if it's possible to move the ioctl=
s
> > calls into the vhost_*() API? That would be cleaner and also make it
> > easier to add vhost-user vDPA support in the future.
>=20
> We need these ioctls calls because we need invoke them before the vhost-d=
ev
> object is initialized.

It may be possible to clean this up by changing how vhost_dev_init()
works but I haven't investigated. The issue is that the vhost_dev_init()
API requires information from the caller that has to be fetched from the
vDPA device. This forces the caller to communicate directly with the
vDPA device before calling vhost_dev_init(). It may be possible to move
this setup code inside vhost_dev_init() (and vhost_ops callbacks).

Stefan

--NPi4bmmTXWp2ThKP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHW078ACgkQnKSrs4Gr
c8g3LwgApNHW/oXb5qVSE+R/OzkFvT/Kej8P5yrNveuADCjnofSrGG3QUiZEx1GL
ulYEoWREYl8D8Fi+kAcCAmiQb6moqjqB8bMpDNUnyL6PLR/KZJl0NZLrkUiFnDRi
KkrR0qG0EFVr8O0R/MR+JZzQYmvvXULmj5O+9+btjONKO4b6bucESAHXWPe11Pok
sqUPB45u9Zoryn98Ond4934VLvCZqqogLRO5m5P6k6vUFAkEeIp4nCNfA5k77NDU
lXRWJEt5VEbQ60OzjPIehsSOXarUUYwM2WU719knYHsqlBkI5aCMWXzxN4yrct4g
zxSAD02nRATmXwhDEzVq88absQUmow==
=rbe/
-----END PGP SIGNATURE-----

--NPi4bmmTXWp2ThKP--


