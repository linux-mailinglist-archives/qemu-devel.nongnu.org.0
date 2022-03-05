Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA434CE33C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 07:10:39 +0100 (CET)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQNck-0004IC-24
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 01:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQNZC-0007uM-1T
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 01:06:58 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQNZ8-0008N3-IQ
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 01:06:57 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K9Z2W4kwrzdhhl;
 Sat,  5 Mar 2022 14:05:23 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 5 Mar 2022 14:06:43 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Sat, 5 Mar 2022 14:06:42 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Thread-Topic: [PATCH v2 04/10] vdpa-dev: implement the
 instance_init/class_init interface
Thread-Index: AQHYC5/ZdHV3vKWLpkmweJSMX9QfraxpsK0AgEbkkMA=
Date: Sat, 5 Mar 2022 06:06:42 +0000
Message-ID: <ad7c799715714ec990ea82c8fbef4963@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-5-longpeng2@huawei.com>
 <20220119112344.5tj3ccnoeotc5abb@steredhat>
In-Reply-To: <20220119112344.5tj3ccnoeotc5abb@steredhat>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
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

Hi Stefano,

> -----Original Message-----
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Wednesday, January 19, 2022 7:24 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org
> Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the instance_init/class=
_init
> interface
>=20
> On Mon, Jan 17, 2022 at 08:43:25PM +0800, Longpeng(Mike) via wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .instance_init and the .class_init interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev-pci.c     | 52 ++++++++++++++++++++++-
> > hw/virtio/vdpa-dev.c         | 81 +++++++++++++++++++++++++++++++++++-
> > include/hw/virtio/vdpa-dev.h |  5 +++
> > 3 files changed, 134 insertions(+), 4 deletions(-)
> >
> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> >index a5a7b528a9..257538dbdd 100644
> >--- a/hw/virtio/vdpa-dev-pci.c
> >+++ b/hw/virtio/vdpa-dev-pci.c
> >@@ -25,12 +25,60 @@ struct VhostVdpaDevicePCI {
> >
> > static void vhost_vdpa_device_pci_instance_init(Object *obj)
> > {
> >-    return;
> >+    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(obj);
> >+
> >+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >+                                TYPE_VHOST_VDPA_DEVICE);
> >+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> >+                              "bootindex");
> >+}
> >+
> >+static Property vhost_vdpa_device_pci_properties[] =3D {
> >+    DEFINE_PROP_END_OF_LIST(),
> >+};
> >+
> >+static void
> >+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >+{
> >+    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(vpci_dev);
> >+    DeviceState *vdev =3D DEVICE(&dev->vdev);
> >+    uint32_t vdev_id;
> >+    uint32_t num_queues;
> >+    int fd;
> >+
> >+    fd =3D qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
>=20
> We should use `vdpa_dev_fd` if the user set it, and I think we should
> also check that `vdpa_dev` is not null.
>=20

The user can set both 'vdpa_dev_fd' and 'vdpa_dev' now, but how
to make sure the 'vdpa_dev_fd' is really a FD of the 'vdpa_dev' ?
Maybe we should remove 'vdpa_dev_fd' from 'vhost_vdpa_device_properties',
so the user can only set 'vdpa_dev'.

> >+    if (*errp) {
> >+        return;
> >+    }
> >+
> >+    vdev_id =3D vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_ID,=
 errp);
> >+    if (*errp) {
> >+        qemu_close(fd);
> >+        return;
> >+    }
> >+
> >+    num_queues =3D vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_NUM=
,
> errp);
>                                                   ^
> The build fails here, I think this should be VHOST_VDPA_GET_VQS_COUNT
>=20

Yes, I sent a wrong version, I'll send v3 later.

> >+    if (*errp) {
> >+        qemu_close(fd);
> >+        return;
> >+    }
> >+
> >+    dev->vdev.vdpa_dev_fd =3D fd;
> >+    vpci_dev->class_code =3D virtio_pci_get_class_id(vdev_id);
> >+    vpci_dev->trans_devid =3D virtio_pci_get_trans_devid(vdev_id);
> >+    /* one for config interrupt, one per vq */
> >+    vpci_dev->nvectors =3D num_queues + 1;
> >+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > }
> >
> > static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void
> > *data)
> > {
> >-    return;
> >+    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >+    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
> >+
> >+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >+    device_class_set_props(dc, vhost_vdpa_device_pci_properties);
> >+    k->realize =3D vhost_vdpa_device_pci_realize;
> > }
> >
> > static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info =3D {
> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >index f4f92b90b0..b103768f33 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -15,16 +15,93 @@
> > #include "sysemu/sysemu.h"
> > #include "sysemu/runstate.h"
> >
> >-static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data=
)
> >+uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error
> **errp)
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
> >+static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> > {
> >     return;
> > }
> >
> >-static void vhost_vdpa_device_instance_init(Object *obj)
> >+static void vhost_vdpa_device_unrealize(DeviceState *dev)
> >+{
> >+    return;
> >+}
> >+
> >+static void
> >+vhost_vdpa_device_get_config(VirtIODevice *vdev, uint8_t *config)
> >+{
> >+    return;
> >+}
> >+
> >+static void
> >+vhost_vdpa_device_set_config(VirtIODevice *vdev, const uint8_t *config)
> >+{
> >+    return;
> >+}
> >+
> >+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
> >+                                               uint64_t features,
> >+                                               Error **errp)
> >+{
> >+    return (uint64_t)-1;
> >+}
> >+
> >+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t st=
atus)
> > {
> >     return;
> > }
> >
> >+static Property vhost_vdpa_device_properties[] =3D {
> >+    DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
> >+    DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd,
> >-1),
> >+    DEFINE_PROP_END_OF_LIST(),
> >+};
> >+
> >+static const VMStateDescription vmstate_vhost_vdpa_device =3D {
> >+    .name =3D "vhost-vdpa-device",
> >+    .minimum_version_id =3D 1,
> >+    .version_id =3D 1,
> >+    .fields =3D (VMStateField[]) {
> >+        VMSTATE_VIRTIO_DEVICE,
> >+        VMSTATE_END_OF_LIST()
> >+    },
> >+};
> >+
> >+static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data=
)
> >+{
> >+    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> >+
> >+    device_class_set_props(dc, vhost_vdpa_device_properties);
> >+    dc->desc =3D "VDPA-based generic device assignment";
> >+    dc->vmsd =3D &vmstate_vhost_vdpa_device;
> >+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >+    vdc->realize =3D vhost_vdpa_device_realize;
> >+    vdc->unrealize =3D vhost_vdpa_device_unrealize;
> >+    vdc->get_config =3D vhost_vdpa_device_get_config;
> >+    vdc->set_config =3D vhost_vdpa_device_set_config;
> >+    vdc->get_features =3D vhost_vdpa_device_get_features;
> >+    vdc->set_status =3D vhost_vdpa_device_set_status;
> >+}
> >+
> >+static void vhost_vdpa_device_instance_init(Object *obj)
> >+{
> >+    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(obj);
> >+
> >+    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> >+                                  NULL, DEVICE(obj));
> >+}
> >+
> > static const TypeInfo vhost_vdpa_device_info =3D {
> >     .name =3D TYPE_VHOST_VDPA_DEVICE,
> >     .parent =3D TYPE_VIRTIO_DEVICE,
> >diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
> >index dd94bd74a2..e7ad349113 100644
> >--- a/include/hw/virtio/vdpa-dev.h
> >+++ b/include/hw/virtio/vdpa-dev.h
> >@@ -11,6 +11,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(VhostVdpaDevice,
> VHOST_VDPA_DEVICE)
> >
> > struct VhostVdpaDevice {
> >     VirtIODevice parent_obj;
> >+    char *vdpa_dev;
> >+    int vdpa_dev_fd;
> >+    int32_t bootindex;
> > };
> >
> >+uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error
> **errp);
> >+
> > #endif
> >--
> >2.23.0
> >
> >


