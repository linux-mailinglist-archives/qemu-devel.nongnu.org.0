Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB816FC73
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:43:23 +0100 (CET)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6u9y-0005PG-Kj
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1j6u9E-0004rf-Q1
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1j6u9D-00076v-8J
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:42:36 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2071 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1j6u9C-0006xg-ME
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:42:35 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 67A814133FB5CD0D5424;
 Wed, 26 Feb 2020 18:42:27 +0800 (CST)
Received: from dggeme758-chm.china.huawei.com (10.3.19.104) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 26 Feb 2020 18:42:27 +0800
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 26 Feb 2020 18:42:26 +0800
Received: from dggeme756-chm.china.huawei.com ([10.6.80.68]) by
 dggeme756-chm.china.huawei.com ([10.6.80.68]) with mapi id 15.01.1713.004;
 Wed, 26 Feb 2020 18:42:26 +0800
From: miaoyubo <miaoyubo@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH v4 2/3] acpi:pci-expender-bus: Add pxb support for arm
Thread-Topic: [PATCH v4 2/3] acpi:pci-expender-bus: Add pxb support for arm
Thread-Index: AQHV634DptZMLVW0EUqun9Ee8tGbGqgrJCyAgACsLcD//4BQgIAAiRsw//+DXwCAAeyBoA==
Date: Wed, 26 Feb 2020 10:42:26 +0000
Message-ID: <f8e49df0209149808e55b6cef7f2ff05@huawei.com>
References: <20200225015026.940-1-miaoyubo@huawei.com>
 <20200225015026.940-3-miaoyubo@huawei.com>
 <3086f4a2-fb0a-d276-7c76-f06474befa35@redhat.com>
 <c4aa08df40a74dbd876b9acfbbb09809@huawei.com>
 <20200225072522-mutt-send-email-mst@kernel.org>
 <766375327e6f422bbf751174269f7570@huawei.com>
 <20200225080529-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200225080529-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.221.29]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.189
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Xiexiangyou <xiexiangyou@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Tuesday, February 25, 2020 9:12 PM
> To: miaoyubo <miaoyubo@huawei.com>
> Cc: Philippe Mathieu-Daud=E9 <philmd@redhat.com>;
> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> berrange@redhat.com; qemu-devel@nongnu.org; Xiexiangyou
> <xiexiangyou@huawei.com>; imammedo@redhat.com
> Subject: Re: [PATCH v4 2/3] acpi:pci-expender-bus: Add pxb support for ar=
m
>=20
> On Tue, Feb 25, 2020 at 12:44:15PM +0000, miaoyubo wrote:
> >
> >
> > > -----Original Message-----
> > > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > > Sent: Tuesday, February 25, 2020 8:27 PM
> > > To: miaoyubo <miaoyubo@huawei.com>
> > > Cc: Philippe Mathieu-Daud=E9 <philmd@redhat.com>;
> > > peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
> > > berrange@redhat.com; qemu-devel@nongnu.org; Xiexiangyou
> > > <xiexiangyou@huawei.com>; imammedo@redhat.com
> > > Subject: Re: [PATCH v4 2/3] acpi:pci-expender-bus: Add pxb support
> > > for arm
> > >
> > > On Tue, Feb 25, 2020 at 12:12:12PM +0000, miaoyubo wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Philippe Mathieu-Daud=E9 [mailto:philmd@redhat.com]
> > > > > Sent: Tuesday, February 25, 2020 5:48 PM
> > > > > To: miaoyubo <miaoyubo@huawei.com>; peter.maydell@linaro.org;
> > > > > shannon.zhaosl@gmail.com
> > > > > Cc: berrange@redhat.com; mst@redhat.com; qemu-
> devel@nongnu.org;
> > > > > Xiexiangyou <xiexiangyou@huawei.com>; imammedo@redhat.com
> > > > > Subject: Re: [PATCH v4 2/3] acpi:pci-expender-bus: Add pxb
> > > > > support for arm
> > > > >
> > > > > On 2/25/20 2:50 AM, Yubo Miao wrote:
> > > > > > From: miaoyubo <miaoyubo@huawei.com>
> > > > > >
> > > > > > Currently virt machine is not supported by pxb-pcie, and only
> > > > > > one main host bridge described in ACPI tables.
> > > > > > In this patch,PXB-PCIE is supproted by arm and certain
> > > > >
> > > > > Typos: "expander" in subject and "supported" here.
> > > > >
> > > >
> > > > Thanks for your reply and sorry for the mistakes.
> > > > I will check all the subjects and comments.
> > > >
> > > > > > resource is allocated for each pxb-pcie in acpi table.
> > > > > > The resource for the main host bridge is also reallocated.
> > > > > >
> > > > > > Signed-off-by: miaoyubo <miaoyubo@huawei.com>
> > > > > > ---
> > > > > >   hw/arm/virt-acpi-build.c | 115
> > > > > ++++++++++++++++++++++++++++++++++++---
> > > > > >   hw/arm/virt.c            |   3 +
> > > > > >   include/hw/arm/virt.h    |   7 +++
> > > > > >   3 files changed, 118 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/arm/virt-acpi-build.c
> > > > > > b/hw/arm/virt-acpi-build.c index 37c34748a6..be1986c60d 100644
> > > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > > @@ -49,6 +49,8 @@
> > > > > >   #include "kvm_arm.h"
> > > > > >   #include "migration/vmstate.h"
> > > > > >
> > > > > > +#include "hw/arm/virt.h"
> > > > > > +#include "hw/pci/pci_bus.h"
> > > > > >   #define ARM_SPI_BASE 32
> > > > > >
> > > > > >       if (use_highmem) {
> > > > > >           hwaddr base_mmio_high =3D
> > > > > > memmap[VIRT_HIGH_PCIE_MMIO].base;
> > > > > @@
> > > > > > -746,7 +847,7 @@ build_dsdt(GArray *table_data, BIOSLinker
> > > > > > *linker,
> > > > > VirtMachineState *vms)
> > > > > >       acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> > > > > >                       (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> > > > > NUM_VIRTIO_TRANSPORTS);
> > > > > >       acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] +
> > > > > ARM_SPI_BASE),
> > > > > > -                      vms->highmem, vms->highmem_ecam);
> > > > > > +                      vms->highmem, vms->highmem_ecam, vms);
> > > > > >       if (vms->acpi_dev) {
> > > > > >           build_ged_aml(scope, "\\_SB."GED_DEVICE,
> > > > > >                         HOTPLUG_HANDLER(vms->acpi_dev), diff
> > > > > > --git a/hw/arm/virt.c b/hw/arm/virt.c index
> > > > > > f788fe27d6..6314928671
> > > > > > 100644
> > > > > > --- a/hw/arm/virt.c
> > > > > > +++ b/hw/arm/virt.c
> > > > > > @@ -1246,6 +1246,9 @@ static void create_pcie(VirtMachineState
> > > *vms)
> > > > > >       }
> > > > > >
> > > > > >       pci =3D PCI_HOST_BRIDGE(dev);
> > > > > > +
> > > > > > +    VIRT_MACHINE(qdev_get_machine())->bus =3D pci->bus;
> > > > > > +
> > > > > >       if (pci->bus) {
> > > > > >           for (i =3D 0; i < nb_nics; i++) {
> > > > > >               NICInfo *nd =3D &nd_table[i]; diff --git
> > > > > > a/include/hw/arm/virt.h b/include/hw/arm/virt.h index
> > > > > > 71508bf40c..90f10a1e46 100644
> > > > > > --- a/include/hw/arm/virt.h
> > > > > > +++ b/include/hw/arm/virt.h
> > > > > > @@ -140,6 +140,13 @@ typedef struct {
> > > > > >       DeviceState *gic;
> > > > > >       DeviceState *acpi_dev;
> > > > > >       Notifier powerdown_notifier;
> > > > > > +    /*
> > > > > > +     * pointer to devices and objects
> > > > > > +     * Via going through the bus, all
> > > > > > +     * pci devices and related objectes
> > > > >
> > > > > Typo "objects", but I don't understand the comment well.
> > > > >
> > > >
> > > > Sorry for any confusion caused ,I will rewrite the comment
> > > > /* point to the root bus, which is pcie.0 */ Does this comment
> > > > make sense?
> > >
> > > Not really. E.g. it doesn't say what happens if there's more than one=
 root.
> > >
> >
> > If there's more than one root, like pcie.0 and pcie.1, it still point t=
o pcie.0.
> > In docs/pci_expander_bridge.txt, it points out pxb could be placed
> > only on bus 0 (pci.0). Therfore, the structure still could help us to f=
ind all
> pxb devices.
> > /* point to the bus 0, which is pcie.0
> >   * pxb devices could only be placed on bus 0.
> >   */
> > Is this ok?
>=20
> All this needs more comments in the code constructing the tables.
>=20

Thanks for replying, I will add more comments in the table construction.

> Also, instead of trying to store bus and spreading logic around like this=
, how
> about just using object_resolve_path_type?
>=20
>=20

Thanks for the suggestion, using object_resolve_path_type  seems to be bett=
er.=20

> > > > > > +     * could be gained.
> > > > > > +     */
> > > > > > +    PCIBus *bus;
> > > > > >   } VirtMachineState;
> > > > > >
> > > > > >   #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :
> > > > > > VIRT_PCIE_ECAM)
> > > > > >
> > > >
> > > > Regards,
> > > > Miao
> >
> > Regards,
> > Miao

Regards,
Miao

