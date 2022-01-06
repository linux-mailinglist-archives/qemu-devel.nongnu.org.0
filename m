Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4549C485E3E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 02:53:09 +0100 (CET)
Received: from localhost ([::1]:48654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Hxi-0001uX-2C
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 20:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5HvI-00015S-B6
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 20:50:36 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1n5HvE-0006qm-R0
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 20:50:36 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JTq6S54XBzbjrY;
 Thu,  6 Jan 2022 09:49:52 +0800 (CST)
Received: from dggpeml100025.china.huawei.com (7.185.36.37) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 09:50:27 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100025.china.huawei.com (7.185.36.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 09:50:27 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Thu, 6 Jan 2022 09:50:27 +0800
To: Cornelia Huck <cohuck@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "sgarzare@redhat.com"
 <sgarzare@redhat.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, Huangzhichao
 <huangzhichao@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
Thread-Topic: [RFC 01/10] virtio: get class_id and pci device id by the virtio
 id
Thread-Index: AQHYAc9vCeFWPgdrrU+qsnWZQ04FAaxTuSQAgAF7zAA=
Date: Thu, 6 Jan 2022 01:50:27 +0000
Message-ID: <3ce8898bceba45a8a2ecd2189ee9dee2@huawei.com>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-2-longpeng2@huawei.com> <87h7aiwjdf.fsf@redhat.com>
In-Reply-To: <87h7aiwjdf.fsf@redhat.com>
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
> From: Cornelia Huck [mailto:cohuck@redhat.com]
> Sent: Wednesday, January 5, 2022 6:46 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>; stefanha@redhat.com; mst@redhat.com;
> jasowang@redhat.com; sgarzare@redhat.com
> Cc: pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechua=
n
> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
> qemu-devel@nongnu.org; Longpeng (Mike, Cloud Infrastructure Service Produ=
ct
> Dept.) <longpeng2@huawei.com>
> Subject: Re: [RFC 01/10] virtio: get class_id and pci device id by the vi=
rtio
> id
>=20
> On Wed, Jan 05 2022, "Longpeng(Mike)" <longpeng2@huawei.com> wrote:
>=20
> > From: Longpeng <longpeng2@huawei.com>
> >
> > Add helpers to get the "Transitional PCI Device ID" and "class_id" of t=
he
> > deivce which is specificed by the "Virtio Device ID".
> >
> > These helpers will be used to build the generic vDPA device later.
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  hw/virtio/virtio-pci.c | 93 ++++++++++++++++++++++++++++++++++++++++++
> >  hw/virtio/virtio-pci.h |  4 ++
> >  2 files changed, 97 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 750aa47ec1..843085c4ea 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -19,6 +19,7 @@
> >
> >  #include "exec/memop.h"
> >  #include "standard-headers/linux/virtio_pci.h"
> > +#include "standard-headers/linux/virtio_ids.h"
> >  #include "hw/boards.h"
> >  #include "hw/virtio/virtio.h"
> >  #include "migration/qemu-file-types.h"
> > @@ -213,6 +214,95 @@ static int virtio_pci_load_queue(DeviceState *d, i=
nt n,
> QEMUFile *f)
> >      return 0;
> >  }
> >
> > +typedef struct VirtIOPCIIDInfo {
> > +    uint16_t vdev_id; /* virtio id */
> > +    uint16_t pdev_id; /* pci device id */
> > +    uint16_t class_id;
> > +} VirtIOPCIIDInfo;
> > +
> > +static const VirtIOPCIIDInfo virtio_pci_id_info[] =3D {
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_NET,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_NET,
> > +        .class_id =3D PCI_CLASS_NETWORK_ETHERNET,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_BLOCK,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_BLOCK,
> > +        .class_id =3D PCI_CLASS_STORAGE_SCSI,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_CONSOLE,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_CONSOLE,
> > +        .class_id =3D PCI_CLASS_COMMUNICATION_OTHER,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_SCSI,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_SCSI,
> > +        .class_id =3D PCI_CLASS_STORAGE_SCSI,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_9P,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_9P,
> > +        .class_id =3D PCI_BASE_CLASS_NETWORK,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_VSOCK,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_VSOCK,
> > +        .class_id =3D PCI_CLASS_COMMUNICATION_OTHER,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_IOMMU,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_MEM,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_MEM,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_PMEM,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_PMEM,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_RNG,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_RNG,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +    {
> > +        .vdev_id =3D VIRTIO_ID_BALLOON,
> > +        .pdev_id =3D PCI_DEVICE_ID_VIRTIO_BALLOON,
> > +        .class_id =3D PCI_CLASS_OTHERS,
> > +    },
> > +};
> > +
> > +static VirtIOPCIIDInfo virtio_pci_get_id_info(uint16_t vdev_id)
> > +{
> > +    VirtIOPCIIDInfo info =3D {};
> > +    int i;
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(virtio_pci_id_info); i++) {
> > +        if (virtio_pci_id_info[i].vdev_id =3D=3D vdev_id) {
> > +            info =3D virtio_pci_id_info[i];
> > +            break;
> > +        }
> > +    }
> > +
> > +    return info;
> > +}
> > +
> > +uint16_t virtio_pci_get_pci_devid(uint16_t device_id)
> > +{
> > +    return virtio_pci_get_id_info(device_id).pdev_id;
> > +}
> > +
> > +uint16_t virtio_pci_get_class_id(uint16_t device_id)
> > +{
> > +    return virtio_pci_get_id_info(device_id).class_id;
> > +}
>=20
> What happens if these functions are called for a device_id that is not
> in the array, e.g. if we forgot to add a new id to the array?
>=20

It would return pdev_id=3D0 or class_id=3D0 as a result, the virtio device
with pdev_id=3D0 is undefined and class_id=3D0 is also treated as undefined
(PCI_CLASS_NOT_DEFINED), so the caller should check the returned value.

> Can the array be generated in some way?

For PCI Device ID:
  - If we need to support Transitional VIRTIO devices, there's no algorithm
    can map a VIRTIO ID to a PCI Device ID.
  - If we only need to support 1.0+ VIRTIO devices, then we can calculate t=
he
    PCI Device ID based on the VIRTIO ID.

For Class ID, seems no way :(


