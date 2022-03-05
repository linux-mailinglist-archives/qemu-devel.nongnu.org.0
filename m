Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E54CE365
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 08:13:08 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQObD-00049S-Hr
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 02:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQOZz-00037j-73
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:11:51 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nQOZx-0001x4-FS
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:11:50 -0500
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4K9bTc0GpXzdbMZ;
 Sat,  5 Mar 2022 15:10:28 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 5 Mar 2022 15:11:47 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Sat, 5 Mar 2022 15:11:47 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 06/10] vdpa-dev: implement the unrealize interface
Thread-Topic: [PATCH v2 06/10] vdpa-dev: implement the unrealize interface
Thread-Index: AQHYC5/Zjg1hZmXIMU+Qm0j03W3d6axptBuAgEb0/tA=
Date: Sat, 5 Mar 2022 07:11:47 +0000
Message-ID: <2fc59a3bd2a04257b86fb13901d9c54c@huawei.com>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-7-longpeng2@huawei.com>
 <20220119113601.rrd3fhr7lkyvu6lb@steredhat>
In-Reply-To: <20220119113601.rrd3fhr7lkyvu6lb@steredhat>
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
> Sent: Wednesday, January 19, 2022 7:36 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org
> Subject: Re: [PATCH v2 06/10] vdpa-dev: implement the unrealize interface
>=20
> On Mon, Jan 17, 2022 at 08:43:27PM +0800, Longpeng(Mike) via wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .unrealize interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev.c | 24 +++++++++++++++++++++++-
> > 1 file changed, 23 insertions(+), 1 deletion(-)
> >
> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >index bd28cf7a15..e5691d02bb 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -132,9 +132,31 @@ out:
> >     s->vdpa_dev_fd =3D -1;
> > }
> >
> >+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
> >+{
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> >+    int i;
> >+
> >+    for (i =3D 0; i < s->num_queues; i++) {
> >+        virtio_delete_queue(s->virtqs[i]);
> >+    }
> >+    g_free(s->virtqs);
> >+    virtio_cleanup(vdev);
> >+
> >+    g_free(s->config);
>=20
> Is there a particular reason for these steps in a separate function?
>=20
> >+}
> >+
> > static void vhost_vdpa_device_unrealize(DeviceState *dev)
> > {
> >-    return;
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >+    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >+
> >+    virtio_set_status(vdev, 0);
> >+    vhost_vdpa_vdev_unrealize(s);
> >+    g_free(s->dev.vqs);
> >+    vhost_dev_cleanup(&s->dev);
> >+    qemu_close(s->vdpa_dev_fd);
> >+    s->vdpa_dev_fd =3D -1;
> > }
>=20
> Maybe we can have all steps (in the reverse order of
> vhost_vdpa_device_realize) in vhost_vdpa_device_unrealize().
>=20

Make sense. Will do.

> Stefano


