Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321F485EE1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 03:42:05 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ij6-0003Rq-23
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 21:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5Ihu-0002bG-Q0
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:40:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5Ihr-0000KR-9n
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:40:50 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTrCy251Zz9s4Q;
 Thu,  6 Jan 2022 10:39:42 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 10:40:44 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 10:40:44 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Thread-Topic: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Thread-Index: AQHYAc9weTTPJZNQ4EW4CFV6Z+MdlaxTxRwAgAGEgCA=
Date: Thu, 6 Jan 2022 02:40:44 +0000
Message-ID: <41a5d68f9e234eadb3c88a8e0f027878@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-5-longpeng2@huawei.com>
 <20220105112854.62jwbii2uxg34nur@steredhat>
In-Reply-To: <20220105112854.62jwbii2uxg34nur@steredhat>
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
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Wednesday, January 5, 2022 7:29 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; jasowang@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
> interface
>=20
> On Wed, Jan 05, 2022 at 08:58:54AM +0800, Longpeng(Mike) wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .instance_init and the .class_init interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev-pci.c     | 80 +++++++++++++++++++++++++++++++++++-
> > hw/virtio/vdpa-dev.c         | 68 +++++++++++++++++++++++++++++-
> > include/hw/virtio/vdpa-dev.h |  2 +
> > 3 files changed, 146 insertions(+), 4 deletions(-)
> >
> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> >index a5a7b528a9..0af54a26d4 100644
> >--- a/hw/virtio/vdpa-dev-pci.c
> >+++ b/hw/virtio/vdpa-dev-pci.c
> >@@ -23,14 +23,90 @@ struct VhostVdpaDevicePCI {
> >     VhostVdpaDevice vdev;
> > };
> >
> >+static uint32_t
> >+vdpa_dev_pci_get_info(const char *name, uint64_t cmd, Error **errp)
> >+{
> >+    int device_fd;
> >+    uint32_t val;
> >+    int ret;
> >+
> >+    device_fd =3D qemu_open(name, O_RDWR, errp);
> >+    if (device_fd =3D=3D -1) {
> >+        return (uint32_t)-1;
> >+    }
> >+
> >+    ret =3D ioctl(device_fd, cmd, &val);
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device-pci: cmd 0x%lx failed: %s",
> >+                   cmd, strerror(errno));
> >+        goto out;
> >+    }
> >+
> >+out:
> >+    close(device_fd);
> >+    return val;
> >+}
> >+
> >+static inline uint32_t
> >+vdpa_dev_pci_get_devid(VhostVdpaDevicePCI *dev, Error **errp)
> >+{
> >+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
> >+                                 VHOST_VDPA_GET_DEVICE_ID, errp);
> >+}
> >+
> >+static inline uint32_t
> >+vdpa_dev_pci_get_vectors_num(VhostVdpaDevicePCI *dev, Error **errp)
> >+{
> >+    return vdpa_dev_pci_get_info(dev->vdev.vdpa_dev,
> >+                                 VHOST_VDPA_GET_VECTORS_NUM, errp);
> >+}
> >+
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
> >+    uint32_t devid;
> >+    uint32_t vectors;
> >+
> >+    devid =3D vdpa_dev_pci_get_devid(dev, errp);
> >+    if (*errp) {
> >+        return;
> >+    }
> >+
> >+    vectors =3D vdpa_dev_pci_get_vectors_num(dev, errp);
> >+    if (*errp) {
> >+        return;
> >+    }
> >+
> >+    vpci_dev->class_code =3D virtio_pci_get_class_id(devid);
> >+    vpci_dev->pdev_id =3D virtio_pci_get_pci_devid(devid);
> >+    vpci_dev->nvectors =3D vectors;
> >+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> > }
> >
> > static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *=
data)
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
> >index f4f92b90b0..790117fb3b 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -15,16 +15,80 @@
> > #include "sysemu/sysemu.h"
> > #include "sysemu/runstate.h"
> >
> >-static void vhost_vdpa_device_class_init(ObjectClass *klass, void *data=
)
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
> > {
> >     return;
> > }
> >
> >+static uint64_t vhost_vdpa_device_get_features(VirtIODevice *vdev,
> >+                                               uint64_t features,
> >+                                               Error **errp)
> >+{
> >+    return (uint64_t)-1;
> >+}
> >+
> >+static void vhost_vdpa_device_set_status(VirtIODevice *vdev, uint8_t st=
atus)
> >+{
> >+    return;
> >+}
> >+
> >+static Property vhost_vdpa_device_properties[] =3D {
> >+    DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
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
> >+    dc->desc =3D "VDPA-based generic PCI device assignment";
>=20
> IIUC, this should be the description of the generic vhost vDPA device,
> not the PCI implementation, right?
>=20

Good catch, thanks.

> Thanks,
> Stefano


