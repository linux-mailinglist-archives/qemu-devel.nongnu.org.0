Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C768493EF5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:21:24 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEe9-0002ss-FE
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:21:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nAEZ2-0000no-Dc
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:16:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nAEYv-0008C8-Pr
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nXXOJUHaN54LlsfNUYhZM4coUBB6GNMO3fXCPYuWDNQ=;
 b=du40S1maLyZUFl2op8nvEq6fJgNvqRVJAn5MpMLmbRVT/8Uv/W0jAaAdFojCUru7TP9t48
 5BTcTz/eCC4wNtF5Q4jJcrOCf8TI4bRzd22nHW3npZClkKaLeAxao8nWEIX857bd4fPK6a
 pjIl1IKGtHK98uYTkZndNJ2CpsrI44A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-QP7OodXlPHaNrITc0PPp6Q-1; Wed, 19 Jan 2022 12:15:54 -0500
X-MC-Unique: QP7OodXlPHaNrITc0PPp6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4E794686E;
 Wed, 19 Jan 2022 17:15:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2295C798DA;
 Wed, 19 Jan 2022 17:15:46 +0000 (UTC)
Date: Wed, 19 Jan 2022 17:15:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
Message-ID: <YehHQuKTZztVq128@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-6-longpeng2@huawei.com>
 <YdVwOwVuEOgrRuBm@stefanha-x1.localdomain>
 <8abbe9c2599247599aec2d0d7ff01c32@huawei.com>
 <YdbTvxT8x3hiejKY@stefanha-x1.localdomain>
 <99584ad9258745e1a9d1ba2e7ee4239d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <99584ad9258745e1a9d1ba2e7ee4239d@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cTtuV5cpj1NUmZYL"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

--cTtuV5cpj1NUmZYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 12:34:50PM +0000, Longpeng (Mike, Cloud Infrastruct=
ure Service Product Dept.) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > Sent: Thursday, January 6, 2022 7:34 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>
> > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
> >=20
> > On Thu, Jan 06, 2022 at 03:02:37AM +0000, Longpeng (Mike, Cloud Infrast=
ructure
> > Service Product Dept.) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > > Sent: Wednesday, January 5, 2022 6:18 PM
> > > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > > <longpeng2@huawei.com>
> > > > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > > > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > > > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhich=
ao
> > > > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > > > Subject: Re: [RFC 05/10] vdpa-dev: implement the realize interface
> > > >
> > > > On Wed, Jan 05, 2022 at 08:58:55AM +0800, Longpeng(Mike) wrote:
> > > > > From: Longpeng <longpeng2@huawei.com>
> > > > >
> > > > > Implements the .realize interface.
> > > > >
> > > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > > ---
> > > > >  hw/virtio/vdpa-dev.c         | 114 +++++++++++++++++++++++++++++=
++++++
> > > > >  include/hw/virtio/vdpa-dev.h |   8 +++
> > > > >  2 files changed, 122 insertions(+)
> > > > >
> > > > > diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> > > > > index 790117fb3b..2d534d837a 100644
> > > > > --- a/hw/virtio/vdpa-dev.c
> > > > > +++ b/hw/virtio/vdpa-dev.c
> > > > > @@ -15,9 +15,122 @@
> > > > >  #include "sysemu/sysemu.h"
> > > > >  #include "sysemu/runstate.h"
> > > > >
> > > > > +static void
> > > > > +vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQu=
eue
> > *vq)
> > > > > +{
> > > > > +    /* Nothing to do */
> > > > > +}
> > > > > +
> > > > > +static int vdpa_dev_get_info_by_fd(int fd, uint64_t cmd, Error *=
*errp)
> > > >
> > > > This looks similar to the helper function in a previous patch but t=
his
> > > > time the return value type is int instead of uint32_t. Please make =
the
> > > > types consistent.
> > > >
> > >
> > > OK.
> > >
> > > > > +{
> > > > > +    int val;
> > > > > +
> > > > > +    if (ioctl(fd, cmd, &val) < 0) {
> > > > > +        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %=
s",
> > > > > +                   cmd, strerror(errno));
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    return val;
> > > > > +}
> > > > > +
> > > > > +static inline int vdpa_dev_get_queue_size(int fd, Error **errp)
> > > > > +{
> > > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VRING_NUM,=
 errp);
> > > > > +}
> > > > > +
> > > > > +static inline int vdpa_dev_get_vqs_num(int fd, Error **errp)
> > > > > +{
> > > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_VQS_NUM, e=
rrp);
> > > > > +}
> > > > > +
> > > > > +static inline int vdpa_dev_get_config_size(int fd, Error **errp)
> > > > > +{
> > > > > +    return vdpa_dev_get_info_by_fd(fd, VHOST_VDPA_GET_CONFIG_SIZ=
E,
> > errp);
> > > > > +}
> > > > > +
> > > > >  static void vhost_vdpa_device_realize(DeviceState *dev, Error **=
errp)
> > > > >  {
> > > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > > > +    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> > > > > +    uint32_t device_id;
> > > > > +    int max_queue_size;
> > > > > +    int fd;
> > > > > +    int i, ret;
> > > > > +
> > > > > +    fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
> > > > > +    if (fd =3D=3D -1) {
> > > > > +        return;
> > > > > +    }
> > > > > +    s->vdpa.device_fd =3D fd;
> > > >
> > > > This is the field I suggest exposing as a QOM property so it can be=
 set
> > > > from the proxy object (e.g. when the PCI proxy opens the vdpa devic=
e
> > > > before our .realize() function is called).
> > > >
> > >
> > > OK.
> > >
> > > > > +
> > > > > +    max_queue_size =3D vdpa_dev_get_queue_size(fd, errp);
> > > > > +    if (*errp) {
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    if (s->queue_size > max_queue_size) {
> > > > > +        error_setg(errp, "vhost-vdpa-device: invalid queue_size:=
 %d
> > > > (max:%d)",
> > > > > +                   s->queue_size, max_queue_size);
> > > > > +        goto out;
> > > > > +    } else if (!s->queue_size) {
> > > > > +        s->queue_size =3D max_queue_size;
> > > > > +    }
> > > > > +
> > > > > +    ret =3D vdpa_dev_get_vqs_num(fd, errp);
> > > > > +    if (*errp) {
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    s->dev.nvqs =3D ret;
> > > >
> > > > There is no input validation because we trust the kernel vDPA retur=
n
> > > > values. That seems okay for now but if there is a vhost-user versio=
n of
> > > > this in the future then input validation will be necessary to achie=
ve
> > > > isolation between QEMU and the vhost-user processes. I suggest incl=
uding
> > > > input validation code right away because it's harder to audit the c=
ode
> > > > and fix missing input validation later on.
> > > >
> > >
> > > Make sense!
> > >
> > > Should we only need to validate the upper boundary (e.g. <VIRTIO_QUEU=
E_MAX)?
> >=20
> > Careful, ret is currently an int so negative values would bypass the <
> > VIRTIO_QUEUE_MAX check.
> >=20
> > >
> > > > > +    s->dev.vqs =3D g_new0(struct vhost_virtqueue, s->dev.nvqs);
> > > > > +    s->dev.vq_index =3D 0;
> > > > > +    s->dev.vq_index_end =3D s->dev.nvqs;
> > > > > +    s->dev.backend_features =3D 0;
> > > > > +    s->started =3D false;
> > > > > +
> > > > > +    ret =3D vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE=
_VDPA, 0,
> > > > NULL);
> > > > > +    if (ret < 0) {
> > > > > +        error_setg(errp, "vhost-vdpa-device: vhost initializatio=
n
> > > > failed: %s",
> > > > > +                   strerror(-ret));
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    ret =3D s->dev.vhost_ops->vhost_get_device_id(&s->dev, &devi=
ce_id);
> > > >
> > > > The vhost_*() API abstracts the ioctl calls but this source file an=
d the
> > > > PCI proxy have ioctl calls. I wonder if it's possible to move the i=
octls
> > > > calls into the vhost_*() API? That would be cleaner and also make i=
t
> > > > easier to add vhost-user vDPA support in the future.
> > >
> > > We need these ioctls calls because we need invoke them before the vho=
st-dev
> > > object is initialized.
> >=20
> > It may be possible to clean this up by changing how vhost_dev_init()
> > works but I haven't investigated. The issue is that the vhost_dev_init(=
)
> > API requires information from the caller that has to be fetched from th=
e
> > vDPA device. This forces the caller to communicate directly with the
> > vDPA device before calling vhost_dev_init(). It may be possible to move
> > this setup code inside vhost_dev_init() (and vhost_ops callbacks).
> >=20
>=20
> Hmm, this is still not clear to me, so let's continue to discuss this
> in v2 if you think it's necessary.

Okay.

Stefan

--cTtuV5cpj1NUmZYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHoR0IACgkQnKSrs4Gr
c8j1IAf/bEZcHEnfxQhPEGyZtidm51cvAcudDAWkBIQj6sdz8P4QXv0h5yskSrB5
QVwJMCBWfiilu1rtgghF0n6vCrUOPLK8Pz1PSvN2AE/q/5GA8vD8YcBBvXigKD+a
u7nae3Kf8LHiklVvIHzdOpHTmwR/DaVNQ22vR4aRvQUx62F6lvAxvOXahmfM7pIX
PKzzJuF1b7PzAVxaNUm21gi16KqkYE30JPB6HCe4w6cpjjw8CGFgB2+CikqUd5wX
he+olV7mS/GdxyYUxCWoOgw7NlfzUsJunpB3WDl0Ra6lizmhlCov0Z6PFrAArqDq
SJ0ZNlAi3RsOtD45vxzV3WChDmysrw==
=CuHa
-----END PGP SIGNATURE-----

--cTtuV5cpj1NUmZYL--


