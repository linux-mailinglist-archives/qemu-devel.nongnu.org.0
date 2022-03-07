Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EB34CF42C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:01:39 +0100 (CET)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9FK-0005GH-Ad
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nR99h-0002Bb-6X
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:55:50 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nR99e-000151-4Z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:55:48 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KBshR06RMzdZnN;
 Mon,  7 Mar 2022 16:54:15 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 16:55:35 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Mon, 7 Mar 2022 16:55:35 +0800
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
Thread-Index: AQHYC5/ZdHV3vKWLpkmweJSMX9QfraxpsK0AgEbkkMCAAsL6AIAAkP2Q
Date: Mon, 7 Mar 2022 08:55:35 +0000
Message-ID: <40c8c74f3bfb4527934c9e082f848593@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-5-longpeng2@huawei.com>
 <20220119112344.5tj3ccnoeotc5abb@steredhat>
 <ad7c799715714ec990ea82c8fbef4963@huawei.com>
 <20220307081020.xzfuyquqrxvca2dw@sgarzare-redhat>
In-Reply-To: <20220307081020.xzfuyquqrxvca2dw@sgarzare-redhat>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
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
> Sent: Monday, March 7, 2022 4:10 PM
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
> Hi Longpeng,
>=20
> On Sat, Mar 05, 2022 at 06:06:42AM +0000, Longpeng (Mike, Cloud Infrastru=
cture
> Service Product Dept.) wrote:
> >Hi Stefano,
> >
> >> -----Original Message-----
> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> >> Sent: Wednesday, January 19, 2022 7:24 PM
> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> >> <longpeng2@huawei.com>
> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> >> qemu-devel@nongnu.org
> >> Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the
> instance_init/class_init
> >> interface
> >>
> >> On Mon, Jan 17, 2022 at 08:43:25PM +0800, Longpeng(Mike) via wrote:
> >> >From: Longpeng <longpeng2@huawei.com>
> >> >
> >> >Implements the .instance_init and the .class_init interface.
> >> >
> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >> >---
> >> > hw/virtio/vdpa-dev-pci.c     | 52 ++++++++++++++++++++++-
> >> > hw/virtio/vdpa-dev.c         | 81 ++++++++++++++++++++++++++++++++++=
+-
> >> > include/hw/virtio/vdpa-dev.h |  5 +++
> >> > 3 files changed, 134 insertions(+), 4 deletions(-)
> >> >
> >> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> >> >index a5a7b528a9..257538dbdd 100644
> >> >--- a/hw/virtio/vdpa-dev-pci.c
> >> >+++ b/hw/virtio/vdpa-dev-pci.c
> >> >@@ -25,12 +25,60 @@ struct VhostVdpaDevicePCI {
> >> >
> >> > static void vhost_vdpa_device_pci_instance_init(Object *obj)
> >> > {
> >> >-    return;
> >> >+    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(obj);
> >> >+
> >> >+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> >> >+                                TYPE_VHOST_VDPA_DEVICE);
> >> >+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> >> >+                              "bootindex");
> >> >+}
> >> >+
> >> >+static Property vhost_vdpa_device_pci_properties[] =3D {
> >> >+    DEFINE_PROP_END_OF_LIST(),
> >> >+};
> >> >+
> >> >+static void
> >> >+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp=
)
> >> >+{
> >> >+    VhostVdpaDevicePCI *dev =3D VHOST_VDPA_DEVICE_PCI(vpci_dev);
> >> >+    DeviceState *vdev =3D DEVICE(&dev->vdev);
> >> >+    uint32_t vdev_id;
> >> >+    uint32_t num_queues;
> >> >+    int fd;
> >> >+
> >> >+    fd =3D qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
> >>
> >> We should use `vdpa_dev_fd` if the user set it, and I think we should
> >> also check that `vdpa_dev` is not null.
> >>
> >
> >The user can set both 'vdpa_dev_fd' and 'vdpa_dev' now, but how
> >to make sure the 'vdpa_dev_fd' is really a FD of the 'vdpa_dev' ?
> >Maybe we should remove 'vdpa_dev_fd' from
> >'vhost_vdpa_device_properties',
> >so the user can only set 'vdpa_dev'.
>=20
> This is the same problem that would happen if the user passed a path any
> file or device (e.g. /dev/null). I believe that on the first operation
> on it (e.g. an ioctl) we would get an error and exit.
>=20

Yes, but how about the 'vdpa_dev_fd' refers to /dev/vhost-vdpa-0 but
the 'vdpa_dev' refers to /dev/vhost-vdpa-1 ? Should we need to consider
this case ?

> I think we should allow to specify an fd (as we already do for other
> vhost devices), because it's a common use case when qemu is launched
> from higher layers (e.g. libvirt).
>=20
> >
> >> >+    if (*errp) {
> >> >+        return;
> >> >+    }
> >> >+
> >> >+    vdev_id =3D vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_=
ID,
> errp);
> >> >+    if (*errp) {
> >> >+        qemu_close(fd);
> >> >+        return;
> >> >+    }
> >> >+
> >> >+    num_queues =3D vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_=
NUM,
> >> errp);
> >>                                                   ^
> >> The build fails here, I think this should be VHOST_VDPA_GET_VQS_COUNT
> >>
> >
> >Yes, I sent a wrong version, I'll send v3 later.
>=20
> Thanks,
> Stefano


