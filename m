Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8D4D0E43
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 04:21:16 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRQPT-00054q-6r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 22:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nRQOJ-0003ky-PV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 22:20:03 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nRQOG-00046v-IE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 22:20:03 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KCLB11mRkzBrJW;
 Tue,  8 Mar 2022 11:18:01 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 8 Mar 2022 11:19:55 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Tue, 8 Mar 2022 11:19:55 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Thread-Topic: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Thread-Index: AQHYC5/ZtDScNT7N4USqi1oqnhFxU6xpsp8AgEbqwrCAAr6QgIAAkLJA//+vxwCAAVhGgA==
Date: Tue, 8 Mar 2022 03:19:55 +0000
Message-ID: <c102cbc9856a42c888a64767c3265325@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
 <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
 <20220307082341.qr3jwzygqxo7kx3o@sgarzare-redhat>
 <5d8e8b6c4c794be9867be45463251d39@huawei.com>
 <20220307121426.ecuy4doxuz7g6d2o@sgarzare-redhat>
In-Reply-To: <20220307121426.ecuy4doxuz7g6d2o@sgarzare-redhat>
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



> -----Original Message-----
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Monday, March 7, 2022 8:14 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org
> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>=20
> On Mon, Mar 07, 2022 at 11:13:02AM +0000, Longpeng (Mike, Cloud Infrastru=
cture
> Service Product Dept.) wrote:
> >
> >
> >> -----Original Message-----
> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> >> Sent: Monday, March 7, 2022 4:24 PM
> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> >> <longpeng2@huawei.com>
> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> >> qemu-devel@nongnu.org
> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interfac=
e
> >>
> >> On Sat, Mar 05, 2022 at 07:07:54AM +0000, Longpeng (Mike, Cloud Infras=
tructure
> >> Service Product Dept.) wrote:
> >> >
> >> >
> >> >> -----Original Message-----
> >> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> >> >> Sent: Wednesday, January 19, 2022 7:31 PM
> >> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> >> >> <longpeng2@huawei.com>
> >> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> >> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yech=
uan
> >> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> >> >> qemu-devel@nongnu.org
> >> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize inter=
face
> >> >>
> >> >> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
> >> >> >From: Longpeng <longpeng2@huawei.com>
> >> >> >
> >> >> >Implements the .realize interface.
> >> >> >
> >> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >> >> >---
> >> >> > hw/virtio/vdpa-dev.c         | 101 ++++++++++++++++++++++++++++++=
+++++
> >> >> > include/hw/virtio/vdpa-dev.h |   8 +++
> >> >> > 2 files changed, 109 insertions(+)
> >> >> >
> >> >> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >> >> >index b103768f33..bd28cf7a15 100644
> >> >> >--- a/hw/virtio/vdpa-dev.c
> >> >> >+++ b/hw/virtio/vdpa-dev.c
> >> >> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, uns=
igned
> long
> >> >> int cmd, Error **errp)
> >> >> >     return val;
> >> >> > }
> >> >> >
> >> >> >+static void
> >> >> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQue=
ue
> *vq)
> >> >> >+{
> >> >> >+    /* Nothing to do */
> >> >> >+}
> >> >> >+
> >> >> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **e=
rrp)
> >> >> > {
> >> >> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >> >> >+    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >> >> >+    uint32_t vdev_id, max_queue_size;
> >> >> >+    struct vhost_virtqueue *vqs;
> >> >> >+    int i, ret;
> >> >> >+
> >> >> >+    if (s->vdpa_dev_fd =3D=3D -1) {
> >> >> >+        s->vdpa_dev_fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
> >> >>
> >> >> So, here we are re-opening the `vdpa_dev` again (without checking i=
f it
> >> >> is NULL).
> >> >>
> >> >> And we re-do the same ioctls already done in
> >> >> vhost_vdpa_device_pci_realize(), so I think we should do them in a
> >> >> single place, and that place should be here.
> >> >>
> >> >> So, what about doing all the ioctls here, setting appropriate field=
s in
> >> >> VhostVdpaDevice, then using that fields in
> >> >> vhost_vdpa_device_pci_realize() after qdev_realize() to set
> >> >> `class_code`, `trans_devid`, and `nvectors`?
> >> >>
> >> >
> >> >vhost_vdpa_device_pci_realize()
> >> >  qdev_realize()
> >> >    virtio_device_realize()
> >> >      vhost_vdpa_device_realize()
> >> >      virtio_bus_device_plugged()
> >> >        virtio_pci_device_plugged()
> >> >
> >> >These three fields would be used in virtio_pci_device_plugged(), so i=
t's
> too
> >> >late to set them after qdev_realize().  And they belong to VirtIOPCIP=
roxy,
> so
> >> >we cannot set them in vhost_vdpa_device_realize() which is transport =
layer
> >> >independent.
> >>
> >> Maybe I expressed myself wrong, I was saying to open the file and make
> >> ioctls in vhost_vdpa_device_realize(). Save the values we use on both
> >> sides in VhostVdpaDevice (e.g. num_queues, queue_size) and use these
> >> saved values in virtio_pci_device_plugged() without re-opening the fil=
e
> >> again.
> >>
> >
> >This means we need to access VhostVdpaDevice in virtio_pci_device_plugge=
d()?
>=20
> Yep, or implement some functions to get those values.
>=20

I prefer not to modify the VIRTIO or the VIRTIO_PCI core too much.
How about the following proposal?

struct VhostVdpaDevice {
    ...
    void (*post_init)(VhostVdpaDevice *vdpa_dev);
    ...
}

vhost_vdpa_device_pci_post_init(VhostVdpaDevice *vdpa_dev)
{
    ...
    vpci_dev->class_code =3D virtio_pci_get_class_id(vdpa_dev->vdev_id);
    vpci_dev->trans_devid =3D virtio_pci_get_trans_devid(vdpa_dev->vdev_id)=
;
    vpci_dev->nvectors =3D vdpa_dev->num_queues + 1;
    ...
}

vhost_vdpa_device_pci_realize():
    post_init =3D vhost_vdpa_device_pci_post_init;

vhost_vdpa_device_realize()
{
    ...
    Open the file.
    Set vdpa_dev->vdev_id, vdpa_dev->vdev_id, vdpa_dev->num_queues
    ...
    if (vdpa_dev->post_init) {
        vdpa_dev->post_init(vdpa_dev);
    }
    ...
}

> Stefano


