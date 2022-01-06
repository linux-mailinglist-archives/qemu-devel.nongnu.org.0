Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B4D485F2F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 04:24:36 +0100 (CET)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5JOF-0004Z7-4S
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 22:24:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5JN2-0003sY-S4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 22:23:20 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5JMv-0003uE-Mv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 22:23:20 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JTs64003TzZdr5;
 Thu,  6 Jan 2022 11:19:39 +0800 (CST)
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 11:23:08 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 11:23:08 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 06/10] vdpa-dev: implement the unrealize interface
Thread-Topic: [RFC 06/10] vdpa-dev: implement the unrealize interface
Thread-Index: AQHYAc9xlWASqyyWWU2vC490mXUhcaxTwY8AgAGPTCA=
Date: Thu, 6 Jan 2022 03:23:07 +0000
Message-ID: <6e6f7fbb7db8498d985da9e50e65c324@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-7-longpeng2@huawei.com>
 <20220105111612.epxi3w3ebsaye5mm@steredhat>
In-Reply-To: <20220105111612.epxi3w3ebsaye5mm@steredhat>
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
> Sent: Wednesday, January 5, 2022 7:16 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: stefanha@redhat.com; mst@redhat.com; jasowang@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 06/10] vdpa-dev: implement the unrealize interface
>=20
> On Wed, Jan 05, 2022 at 08:58:56AM +0800, Longpeng(Mike) wrote:
> >From: Longpeng <longpeng2@huawei.com>
> >
> >Implements the .unrealize interface.
> >
> >Signed-off-by: Longpeng <longpeng2@huawei.com>
> >---
> > hw/virtio/vdpa-dev.c | 22 +++++++++++++++++++++-
> > 1 file changed, 21 insertions(+), 1 deletion(-)
> >
> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> >index 2d534d837a..4e4dd3d201 100644
> >--- a/hw/virtio/vdpa-dev.c
> >+++ b/hw/virtio/vdpa-dev.c
> >@@ -133,9 +133,29 @@ out:
> >     close(fd);
> > }
> >
> >+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
> >+{
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> >+    int i;
> >+
> >+    for (i =3D 0; i < s->num_queues; i++) {
>                        ^
> `s->num_queues` seems uninitialized to me, maybe we could just remove
> the num_queues field from VhostVdpaDevice, and use `s->dev.nvqs` as in
> vhost_vdpa_device_realize().
>=20

Good catch, I'll fix the bug.

But I think we should keep the num_queues field, we need it if we support
migration in the next step, right?

> >+        virtio_delete_queue(s->virtqs[i]);
> >+    }
> >+    g_free(s->virtqs);
> >+    virtio_cleanup(vdev);
> >+
> >+    g_free(s->config);
> >+}
> >+
> > static void vhost_vdpa_device_unrealize(DeviceState *dev)
> > {
> >-    return;
> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >+    VhostVdpaDevice *s =3D VHOST_VDPA_DEVICE(vdev);
> >+
> >+    virtio_set_status(vdev, 0);
> >+    vhost_dev_cleanup(&s->dev);
>=20
> If we will use `s->dev.nvqs` in vhost_vdpa_vdev_unrealize(), we should
> call vhost_dev_cleanup() after it, just before close() as we already do
> in the error path of vhost_vdpa_device_realize().
>=20

I'll try to fix the above bug first if you agree that we should keep the
num_queues field.

I just realize that I forgot to free s->dev.vqs here...

> >+    vhost_vdpa_vdev_unrealize(s);
> >+    close(s->vdpa.device_fd);
> > }
> >
> > static void
> >--
> >2.23.0
> >


