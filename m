Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B34EA705
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 07:17:31 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ4EU-0002bZ-2e
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 01:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ4D1-0001rD-4i
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:15:59 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nZ4Cw-0002cC-Ut
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 01:15:57 -0400
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KSHlg6yy1zCr8P;
 Tue, 29 Mar 2022 13:13:35 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (7.185.36.37) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 29 Mar 2022 13:15:48 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 29 Mar 2022 13:15:47 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Tue, 29 Mar 2022 13:15:47 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, qemu devel list
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Thread-Topic: [PATCH v3 05/10] vdpa-dev: implement the realize interface
Thread-Index: AQHYO2HKNbgiltRNH0mkEivgf5l+b6zUbBWAgAFxh3A=
Date: Tue, 29 Mar 2022 05:15:47 +0000
Message-ID: <2fd4698cd9a54e1a928e9e6aa18c1965@huawei.com>
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

[snap]

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

Make sense.

I prefer to use 'vhostdev' for the file path, just like the usage in Netdev=
:
  -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhostvdpa1

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


