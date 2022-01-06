Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43BB485EDF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 03:40:42 +0100 (CET)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ihl-0001ty-SD
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 21:40:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5IgU-0001Dw-Kv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:39:22 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5IgO-00086D-Ci
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 21:39:21 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTrB929wjz9s43;
 Thu,  6 Jan 2022 10:38:09 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (7.185.36.37) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 10:39:09 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 10:39:09 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 10:39:09 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "sgarzare@redhat.com" <sgarzare@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan
 <yechuan@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Thread-Topic: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
 interface
Thread-Index: AQHYAc9weTTPJZNQ4EW4CFV6Z+MdlaxTrHkAgAGQB4A=
Date: Thu, 6 Jan 2022 02:39:09 +0000
Message-ID: <35dbd36f8a4c4a00ba8d0caa6238e093@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-5-longpeng2@huawei.com>
 <YdVsTKr7Ceed6nn7@stefanha-x1.localdomain>
In-Reply-To: <YdVsTKr7Ceed6nn7@stefanha-x1.localdomain>
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
> From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> Sent: Wednesday, January 5, 2022 6:01 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC 04/10] vdpa-dev: implement the instance_init/class_init
> interface
>=20
> On Wed, Jan 05, 2022 at 08:58:54AM +0800, Longpeng(Mike) wrote:
> > From: Longpeng <longpeng2@huawei.com>
> >
> > Implements the .instance_init and the .class_init interface.
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  hw/virtio/vdpa-dev-pci.c     | 80 +++++++++++++++++++++++++++++++++++-
> >  hw/virtio/vdpa-dev.c         | 68 +++++++++++++++++++++++++++++-
> >  include/hw/virtio/vdpa-dev.h |  2 +
> >  3 files changed, 146 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
> > index a5a7b528a9..0af54a26d4 100644
> > --- a/hw/virtio/vdpa-dev-pci.c
> > +++ b/hw/virtio/vdpa-dev-pci.c
> > @@ -23,14 +23,90 @@ struct VhostVdpaDevicePCI {
> >      VhostVdpaDevice vdev;
> >  };
> >
> > +static uint32_t
> > +vdpa_dev_pci_get_info(const char *name, uint64_t cmd, Error **errp)
>=20
> vdpa_dev_pci_get_u32() might be a clearer name.
>=20

OK.

> > +{
> > +    int device_fd;
> > +    uint32_t val;
> > +    int ret;
> > +
> > +    device_fd =3D qemu_open(name, O_RDWR, errp);
> > +    if (device_fd =3D=3D -1) {
> > +        return (uint32_t)-1;
> > +    }
> > +
> > +    ret =3D ioctl(device_fd, cmd, &val);
> > +    if (ret < 0) {
> > +        error_setg(errp, "vhost-vdpa-device-pci: cmd 0x%lx failed: %s"=
,
> > +                   cmd, strerror(errno));
> > +        goto out;
> > +    }
> > +
> > +out:
> > +    close(device_fd);
>=20
> Race conditions are possible if the device node is replaced between
> calls. Why not open the file once and reuse the fd across ioctl calls?
>=20
> Both VhostVdpaDevicePCI and VhostVdpaDevice need the fd but
> VhostVdpaDevicePCI needs it first. I suggest passing ownership of the fd
> to the VhostVdpaDevice. One way of doing this is using QOM properties so
> that VhostVdpaDevice can use the given fd instead of reopening the file.
> (If fd is -1 then VhostVdpaDevice can try to open the file. That is
> necessary when VhostVdpaDevice is used directly with virtio-mmio because
> there is no proxy object.)

Adding the fd field into the VhostVdpaDevice looks fine! I'll do it in V2.
Thanks.



