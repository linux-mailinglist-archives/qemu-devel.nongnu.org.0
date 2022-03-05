Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AFC4CE35B
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 08:09:33 +0100 (CET)
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQOXk-0001mP-Ic
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 02:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQOWJ-00016I-K0
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:08:03 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQOWG-0000zj-Fg
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:08:03 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K9bKC21h8zbdgW;
 Sat,  5 Mar 2022 15:03:11 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 5 Mar 2022 15:07:54 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Sat, 5 Mar 2022 15:07:54 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Thread-Topic: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Thread-Index: AQHYC5/ZtDScNT7N4USqi1oqnhFxU6xpsp8AgEbqwrA=
Date: Sat, 5 Mar 2022 07:07:54 +0000
Message-ID: <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
In-Reply-To: <20220119113042.a4dmwe4tnfsabnmn@steredhat>
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
> Sent: Wednesday, January 19, 2022 7:31 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org
> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>=20
> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .realize interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
> > include/hw/virtio/vdpa-dev.h |   8 +++
> > 2 files changed, 109 insertions(+)
> >
> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >index b103768f33..bd28cf7a15 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned =
long
> int cmd, Error **errp)
> >     return val;
> > }
> >
> >+static void
> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq=
)
> >+{
> >+    /* Nothing to do */
> >+}
> >+
> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
> > {
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >+    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >+    uint32_t vdev_id, max_queue_size;
> >+    struct vhost_virtqueue *vqs;
> >+    int i, ret;
> >+
> >+    if (s->vdpa_dev_fd =3D=3D -1) {
> >+        s->vdpa_dev_fd =3D qemu_open(s->vdpa_dev, O_RDWR, errp);
>=20
> So, here we are re-opening the `vdpa_dev` again (without checking if it
> is NULL).
>=20
> And we re-do the same ioctls already done in
> vhost_vdpa_device_pci_realize(), so I think we should do them in a
> single place, and that place should be here.
>=20
> So, what about doing all the ioctls here, setting appropriate fields in
> VhostVdpaDevice, then using that fields in
> vhost_vdpa_device_pci_realize() after qdev_realize() to set
> `class_code`, `trans_devid`, and `nvectors`?
>=20

vhost_vdpa_device_pci_realize()
  qdev_realize()
    virtio_device_realize()
      vhost_vdpa_device_realize()
      virtio_bus_device_plugged()
        virtio_pci_device_plugged()

These three fields would be used in virtio_pci_device_plugged(), so it's to=
o=20
late to set them after qdev_realize().  And they belong to VirtIOPCIProxy, =
so=20
we cannot set them in vhost_vdpa_device_realize() which is transport layer=
=20
independent.

> >+        if (*errp) {
> >+            return;
> >+        }
> >+    }
> >+    s->vdpa.device_fd =3D s->vdpa_dev_fd;
> >+
> >+    max_queue_size =3D vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
> >+                                               VHOST_VDPA_GET_VRING_NUM=
, errp);
> >+    if (*errp) {
> >+        goto out;
> >+    }
> >+
> >+    if (s->queue_size > max_queue_size) {
> >+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: %d
> (max:%d)",
> >+                   s->queue_size, max_queue_size);
> >+        goto out;
> >+    } else if (!s->queue_size) {
> >+        s->queue_size =3D max_queue_size;
> >+    }
> >+
> >+    s->num_queues =3D vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
> >+                                              VHOST_VDPA_GET_VQS_NUM, e=
rrp);
>                                                  ^
> VHOST_VDPA_GET_VQS_COUNT
>=20

OK, thanks :)

> >+    if (*errp) {
> >+        goto out;
> >+    }
> >+
> >+    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
> >+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
> >+                   s->num_queues, VIRTIO_QUEUE_MAX);
> >+        goto out;
> >+    }
> >+
> >+    s->dev.nvqs =3D s->num_queues;
> >+    vqs =3D g_new0(struct vhost_virtqueue, s->dev.nvqs);
> >+    s->dev.vqs =3D vqs;
> >+    s->dev.vq_index =3D 0;
> >+    s->dev.vq_index_end =3D s->dev.nvqs;
> >+    s->dev.backend_features =3D 0;
> >+    s->started =3D false;
> >+
> >+    ret =3D vhost_dev_init(&s->dev, &s->vdpa, VHOST_BACKEND_TYPE_VDPA, =
0,
> NULL);
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: vhost initialization
> failed: %s",
> >+                   strerror(-ret));
> >+        goto free_vqs;
> >+    }
> >+
> >+    vdev_id =3D vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
> >+                                        VHOST_VDPA_GET_DEVICE_ID, errp)=
;
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: vhost get device id failed=
: %s",
> >+                   strerror(-ret));
> >+        goto vhost_cleanup;
> >+    }
> >+
> >+    s->config_size =3D vhost_vdpa_device_get_u32(s->vdpa_dev_fd,
> >+                                               VHOST_VDPA_GET_CONFIG_SI=
ZE,
> errp);
> >+    if (*errp) {
> >+        goto vhost_cleanup;
> >+    }
> >+    s->config =3D g_malloc0(s->config_size);
> >+
> >+    ret =3D vhost_dev_get_config(&s->dev, s->config, s->config_size, NU=
LL);
> >+    if (ret < 0) {
> >+        error_setg(errp, "vhost-vdpa-device: get config failed");
> >+        goto free_config;
> >+    }
> >+
> >+    virtio_init(vdev, "vhost-vdpa", vdev_id, s->config_size);
> >+
> >+    s->virtqs =3D g_new0(VirtQueue *, s->dev.nvqs);
> >+    for (i =3D 0; i < s->dev.nvqs; i++) {
> >+        s->virtqs[i] =3D virtio_add_queue(vdev, s->queue_size,
> >+
> vhost_vdpa_device_dummy_handle_output);
> >+    }
> >+
> >     return;
> >+
> >+free_config:
> >+    g_free(s->config);
> >+vhost_cleanup:
> >+    vhost_dev_cleanup(&s->dev);
> >+free_vqs:
> >+    g_free(vqs);
> >+out:
> >+    qemu_close(s->vdpa_dev_fd);
> >+    s->vdpa_dev_fd =3D -1;
> > }
> >
> > static void vhost_vdpa_device_unrealize(DeviceState *dev)
> >@@ -64,6 +164,7 @@ static void vhost_vdpa_device_set_status(VirtIODevice=
 *vdev,
> uint8_t status)
> > static Property vhost_vdpa_device_properties[] =3D {
> >     DEFINE_PROP_STRING("vdpa-dev", VhostVdpaDevice, vdpa_dev),
> >     DEFINE_PROP_INT32("vdpa-dev-fd", VhostVdpaDevice, vdpa_dev_fd, -1),
> >+    DEFINE_PROP_UINT16("queue-size", VhostVdpaDevice, queue_size, 0),
> >     DEFINE_PROP_END_OF_LIST(),
> > };
> >
> >diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
> >index e7ad349113..e0482035cf 100644
> >--- a/include/hw/virtio/vdpa-dev.h
> >+++ b/include/hw/virtio/vdpa-dev.h
> >@@ -14,6 +14,14 @@ struct VhostVdpaDevice {
> >     char *vdpa_dev;
> >     int vdpa_dev_fd;
> >     int32_t bootindex;
> >+    struct vhost_dev dev;
> >+    struct vhost_vdpa vdpa;
> >+    VirtQueue **virtqs;
> >+    uint8_t *config;
> >+    int config_size;
> >+    uint32_t num_queues;
> >+    uint16_t queue_size;
> >+    bool started;
> > };
> >
> > uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error
> **errp);
> >--
> >2.23.0
> >
> >


