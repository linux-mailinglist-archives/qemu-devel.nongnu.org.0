Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703444EA6CE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 07:03:08 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ40Z-0000Ju-GM
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 01:03:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ3zE-00083a-QM
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:01:44 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ3zB-0000kf-DM
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:01:44 -0400
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KSHP36DY4z9sSb;
 Tue, 29 Mar 2022 12:57:27 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 29 Mar 2022 13:01:29 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Tue, 29 Mar 2022 13:01:29 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, qemu devel list
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Thread-Topic: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Thread-Index: AQHYO2HKNbgiltRNH0mkEivgf5l+b6zUbBWAgAFuMWA=
Date: Tue, 29 Mar 2022 05:01:29 +0000
Message-ID: <e734b68e4ae24276a336fe184187153f@huawei.com>
References: <20220319072012.525-1-longpeng2@huawei.com>
 <20220319072012.525-6-longpeng2@huawei.com>
 <CAGxU2F5PTOdZtZPpb4q65=dh9omrAMridfOvpAEktBOF1EVnFA@mail.gmail.com>
In-Reply-To: <CAGxU2F5PTOdZtZPpb4q65=dh9omrAMridfOvpAEktBOF1EVnFA@mail.gmail.com>
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
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Monday, March 28, 2022 11:00 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>; Michael Tsirkin <mst@redhat.co=
m>;
> Cornelia Huck <cohuck@redhat.com>; Paolo Bonzini <pbonzini@redhat.com>;
> Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>;
> Huangzhichao <huangzhichao@huawei.com>; qemu devel list <qemu-devel@nongn=
u.org>
> Subject: Re: [PATCH v3 05/10] vdpa-dev: implement the realize interface
>=20
> On Sat, Mar 19, 2022 at 03:20:07PM +0800, Longpeng(Mike) wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .realize interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev-pci.c     |  18 ++++-
> > hw/virtio/vdpa-dev.c         | 132 +++++++++++++++++++++++++++++++++++
> > include/hw/virtio/vdpa-dev.h |  10 +++
> > 3 files changed, 159 insertions(+), 1 deletion(-)
> >
> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> >index 9eb590ce8c..31bd17353a 100644
> >--- a/hw/virtio/vdpa-dev-pci.c
> >+++ b/hw/virtio/vdpa-dev-pci.c
> >@@ -51,10 +51,26 @@ static Property vhost_vdpa_device_pci_properties[] =
=3D {
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >
> >+static int vhost_vdpa_device_pci_post_init(VhostVdpaDevice *v, Error **=
errp)
> >+{
> >+    VhostVdpaDevicePCI *dev =3D container_of(v, VhostVdpaDevicePCI, vde=
v);
> >+    VirtIOPCIProxy *vpci_dev =3D &dev->parent_obj;
> >+
> >+    vpci_dev->class_code =3D virtio_pci_get_class_id(v->vdev_id);
> >+    vpci_dev->trans_devid =3D virtio_pci_get_trans_devid(v->vdev_id);
> >+    /* one for config vector */
> >+    vpci_dev->nvectors =3D v->num_queues + 1;
> >+
> >+    return 0;
> >+}
> >+
> > static void
> > vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> > {
> >-    return;
> >+    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(vpci_dev);
> >+
> >+    dev->vdev.post_init =3D vhost_vdpa_device_pci_post_init;
> >+    qdev_realize(DEVICE(&dev->vdev), BUS(&vpci_dev->bus), errp);
> > }
> >
> > static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *=
data)
> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >index 993cbc7d11..4defe6c33d 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -29,9 +29,140 @@
> > #include "sysemu/sysemu.h"
> > #include "sysemu/runstate.h"
> >
> >+static void
> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq=
)
> >+{
> >+    /* Nothing to do */
> >+}
> >+
> >+static uint32_t
> >+vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
> >+{
> >+    uint32_t val =3D (uint32_t)-1;
> >+
> >+    if (ioctl(fd, cmd, &val) < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
> >+                   cmd, strerror(errno));
> >+    }
> >+
> >+    return val;
> >+}
> >+
> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> > {
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >+    VhostVdpaDevice *v =3D VHOST_VDPA_DEVICE(vdev);
> >+    uint32_t max_queue_size;
> >+    struct vhost_virtqueue *vqs;
> >+    int i, ret;
> >+
> >+    if (!v->vdpa_dev || v->vdpa_dev_fd =3D=3D -1) {
>                         ^
> Should we use && operator here?
>=20
> I can't start QEMU, how did you test this series?
>=20

Oh! I changed to && operator in my local environment when I test this serie=
s=20
but forgot to include it.

I'll fix it in the next version.

> $ ./qemu-system-x86_64 -m 512M -smp 2 -M q35,accel=3Dkvm \
>    ...
>    -device vhost-vdpa-device-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> qemu-system-x86_64: -device
> vhost-vdpa-device-pci,vdpa-dev=3D/dev/vhost-vdpa-0: both vpda-dev and
> vpda-dev-fd are missing
>=20
> >+        error_setg(errp, "both vpda-dev and vpda-dev-fd are missing");
>=20
> Typo s/vpda/vdpa
>=20

OK.

> >+        return;
> >+    }
> >+
> >+    if (v->vdpa_dev && v->vdpa_dev_fd !=3D -1) {
> >+        error_setg(errp, "both vpda-dev and vpda-dev-fd are set");
>=20
> Ditto
>=20

OK.

> >+        return;
> >+    }
> >+
> >+    if (v->vdpa_dev_fd =3D=3D -1) {
> >+        v->vdpa_dev_fd =3D qemu_open(v->vdpa_dev, O_RDWR, errp);
> >+        if (*errp) {
> >+            return;
> >+        }
> >+    }
> >+    v->vdpa.device_fd =3D v->vdpa_dev_fd;
> >+
> >+    v->vdev_id =3D vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
> >+                                           VHOST_VDPA_GET_DEVICE_ID, er=
rp);
> >+    if (*errp) {
> >+        goto out;
> >+    }
> >+
> >+    max_queue_size =3D vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
> >+                                               VHOST_VDPA_GET_VRING_NUM=
, errp);
> >+    if (*errp) {
> >+        goto out;
> >+    }
> >+
> >+    if (v->queue_size > max_queue_size) {
> >+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %u
> (max:%u)",
> >+                   v->queue_size, max_queue_size);
> >+        goto out;
> >+    } else if (!v->queue_size) {
> >+        v->queue_size =3D max_queue_size;
> >+    }
> >+
> >+    v->num_queues =3D vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
> >+                                              VHOST_VDPA_GET_VQS_COUNT,=
 errp);
> >+    if (*errp) {
> >+        goto out;
> >+    }
> >+
> >+    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
> >+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
> >+                   v->num_queues, VIRTIO_QUEUE_MAX);
> >+        goto out;
> >+    }
> >+
> >+    v->dev.nvqs =3D v->num_queues;
> >+    vqs =3D g_new0(struct vhost_virtqueue, v->dev.nvqs);
> >+    v->dev.vqs =3D vqs;
> >+    v->dev.vq_index =3D 0;
> >+    v->dev.vq_index_end =3D v->dev.nvqs;
> >+    v->dev.backend_features =3D 0;
> >+    v->started =3D false;
> >+
> >+    ret =3D vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, =
0,
> NULL);
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: vhost initialization
> failed: %s",
> >+                   strerror(-ret));
> >+        goto free_vqs;
> >+    }
> >+
> >+    v->config_size =3D vhost_vdpa_device_get_u32(v->vdpa_dev_fd,
> >+                                               VHOST_VDPA_GET_CONFIG_SI=
ZE,
> errp);
> >+    if (*errp) {
> >+        goto vhost_cleanup;
> >+    }
> >+    v->config =3D g_malloc0(v->config_size);
> >+
> >+    ret =3D vhost_dev_get_config(&v->dev, v->config, v->config_size, NU=
LL);
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: get config failed");
> >+        goto free_config;
> >+    }
> >+
> >+    virtio_init(vdev, "vhost-vdpa", v->vdev_id, v->config_size);
> >+
> >+    v->virtqs =3D g_new0(VirtQueue *, v->dev.nvqs);
> >+    for (i =3D 0; i < v->dev.nvqs; i++) {
> >+        v->virtqs[i] =3D virtio_add_queue(vdev, v->queue_size,
> >+
> vhost_vdpa_device_dummy_handle_output);
> >+    }
> >+
> >+    if (v->post_init && v->post_init(v, errp) < 0) {
> >+        goto free_virtio;
> >+    }
> >+
> >     return;
> >+
> >+free_virtio:
> >+    for (i =3D 0; i < v->num_queues; i++) {
> >+        virtio_delete_queue(v->virtqs[i]);
> >+    }
> >+    g_free(v->virtqs);
> >+    virtio_cleanup(vdev);
> >+free_config:
> >+    g_free(v->config);
> >+vhost_cleanup:
> >+    vhost_dev_cleanup(&v->dev);
> >+free_vqs:
> >+    g_free(vqs);
> >+out:
> >+    qemu_close(v->vdpa_dev_fd);
> >+    v->vdpa_dev_fd =3D -1;
> > }
> >
> > static void vhost_vdpa_device_unrealize(DeviceState *dev)
> >@@ -66,6 +197,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice=
 *vdev,
> uint8_t status)
> > static Property vhost_vdpa_device_properties[] =3D {
> >     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
> >     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
>=20
> Other vhost devices use the `vhostfd` property, maybe we should use the
> same name.
>=20
> If we go for this change, then maybe we also need to change `vdpa-dev`
> to `vhostpath` or something like that
>=20
> Thanks,
> Stefano
>=20
> >+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >
> >diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
> >index 476bda0873..cf11abd0f7 100644
> >--- a/include/hw/virtio/vdpa-dev.h
> >+++ b/include/hw/virtio/vdpa-dev.h
> >@@ -28,6 +28,16 @@ struct VhostVdpaDevice {
> >     char *vdpa_dev;
> >     int vdpa_dev_fd;
> >     int32_t bootindex;
> >+    uint32_t vdev_id;
> >+    uint32_t num_queues;
> >+    struct vhost_dev dev;
> >+    struct vhost_vdpa vdpa;
> >+    VirtQueue **virtqs;
> >+    uint8_t *config;
> >+    int config_size;
> >+    uint16_t queue_size;
> >+    bool started;
> >+    int (*post_init)(VhostVdpaDevice *v, Error **errp);
> > };
> >
> > #endif
> >--
> >2.23.0
> >


