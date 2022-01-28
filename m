Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAABD4A010A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 20:41:24 +0100 (CET)
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDX7b-0000lR-Om
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 14:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDWJ2-0004Ja-3K
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:49:08 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDWIy-0003N7-D2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:49:07 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jlmgk4y5tz67kNj;
 Sat, 29 Jan 2022 02:48:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Fri, 28 Jan 2022 19:49:01 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 18:49:00 +0000
Date: Fri, 28 Jan 2022 18:48:59 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 13/42] hw/pxb: Allow creation of a CXL PXB (host bridge)
Message-ID: <20220128184859.000005eb@huawei.com>
In-Reply-To: <20220128182001.00006886@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-14-Jonathan.Cameron@huawei.com>
 <87ee4t9szh.fsf@linaro.org> <20220128182001.00006886@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 28 Jan 2022 18:20:01 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 27 Jan 2022 13:59:56 +0000
> Alex Benn=E9e <alex.bennee@linaro.org> wrote:
>=20
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
> >  =20
> > > From: Ben Widawsky <ben.widawsky@intel.com>
> > >
> > > This works like adding a typical pxb device, except the name is
> > > 'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
> > > follows:
> > >   -device pxb-cxl,id=3Dcxl.0,bus=3D"pcie.0",bus_nr=3D1
> > >
> > > A CXL PXB is backward compatible with PCIe. What this means in practi=
ce
> > > is that an operating system that is unaware of CXL should still be ab=
le
> > > to enumerate this topology as if it were PCIe.
> > >
> > > One can create multiple CXL PXB host bridges, but a host bridge can o=
nly
> > > be connected to the main root bus. Host bridges cannot appear elsewhe=
re
> > > in the topology.
> > >
> > > Note that as of this patch, the ACPI tables needed for the host bridge
> > > (specifically, an ACPI object in _SB named ACPI0016 and the CEDT) are=
n't
> > > created. So while this patch internally creates it, it cannot be
> > > properly used by an operating system or other system software.
> > >
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > > Signed-off-by: Jonathan.Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > >  hw/pci-bridge/pci_expander_bridge.c | 98 +++++++++++++++++++++++++++=
+-
> > >  hw/pci/pci.c                        |  7 +++
> > >  include/hw/pci/pci.h                |  6 ++
> > >  3 files changed, 109 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_=
expander_bridge.c
> > > index a6caa1e7b5..7009b541de 100644
> > > --- a/hw/pci-bridge/pci_expander_bridge.c
> > > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > > @@ -17,6 +17,7 @@
> > >  #include "hw/pci/pci_host.h"
> > >  #include "hw/qdev-properties.h"
> > >  #include "hw/pci/pci_bridge.h"
> > > +#include "hw/cxl/cxl.h"
> > >  #include "qemu/range.h"
> > >  #include "qemu/error-report.h"
> > >  #include "qemu/module.h"
> > > @@ -56,6 +57,10 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_DEV,
> > >  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
> > >                           TYPE_PXB_PCIE_DEVICE)
> > > =20
> > > +#define TYPE_PXB_CXL_DEVICE "pxb-cxl"
> > > +DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> > > +                         TYPE_PXB_CXL_DEVICE)
> > > +
> > >  struct PXBDev {
> > >      /*< private >*/
> > >      PCIDevice parent_obj;
> > > @@ -66,8 +71,19 @@ struct PXBDev {
> > >      bool bypass_iommu;
> > >  };
> > > =20
> > > +typedef struct CXLHost {
> > > +    PCIHostState parent_obj;
> > > +
> > > +    CXLComponentState cxl_cstate;
> > > +} CXLHost;
> > > +
> > >  static PXBDev *convert_to_pxb(PCIDevice *dev)
> > >  {
> > > +    /* A CXL PXB's parent bus is PCIe, so the normal check won't wor=
k */
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PXB_CXL_DEVICE)) {
> > > +        return PXB_CXL_DEV(dev);
> > > +    }
> > > +
> > >      return pci_bus_is_express(pci_get_bus(dev))
> > >          ? PXB_PCIE_DEV(dev) : PXB_DEV(dev);
> > >  }
> > > @@ -76,6 +92,9 @@ static GList *pxb_dev_list;
> > > =20
> > >  #define TYPE_PXB_HOST "pxb-host"
> > > =20
> > > +#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
> > > +#define PXB_CXL_HOST(obj) OBJECT_CHECK(CXLHost, (obj), TYPE_PXB_CXL_=
HOST)
> > > +
> > >  static int pxb_bus_num(PCIBus *bus)
> > >  {
> > >      PXBDev *pxb =3D convert_to_pxb(bus->parent_dev);
> > > @@ -112,11 +131,20 @@ static const TypeInfo pxb_pcie_bus_info =3D {
> > >      .class_init    =3D pxb_bus_class_init,
> > >  };
> > > =20
> > > +static const TypeInfo pxb_cxl_bus_info =3D {
> > > +    .name          =3D TYPE_PXB_CXL_BUS,
> > > +    .parent        =3D TYPE_CXL_BUS,
> > > +    .instance_size =3D sizeof(PXBBus),
> > > +    .class_init    =3D pxb_bus_class_init,
> > > +};
> > > +
> > >  static const char *pxb_host_root_bus_path(PCIHostState *host_bridge,
> > >                                            PCIBus *rootbus)
> > >  {
> > > -    PXBBus *bus =3D pci_bus_is_express(rootbus) ?
> > > -                  PXB_PCIE_BUS(rootbus) : PXB_BUS(rootbus);
> > > +    PXBBus *bus =3D pci_bus_is_cxl(rootbus) ?
> > > +                      PXB_CXL_BUS(rootbus) :
> > > +                      pci_bus_is_express(rootbus) ? PXB_PCIE_BUS(roo=
tbus) :
> > > +                                                    PXB_BUS(rootbus);
> > > =20
> > >      snprintf(bus->bus_path, 8, "0000:%02x", pxb_bus_num(rootbus));
> > >      return bus->bus_path;
> > > @@ -218,6 +246,16 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, in=
t pin)
> > >      return pin - PCI_SLOT(pxb->devfn);
> > >  }
> > > =20
> > > +static void pxb_dev_reset(DeviceState *dev)
> > > +{
> > > +    CXLHost *cxl =3D PXB_CXL_HOST(dev); =20
> Having fixed the stuff you observed below...
>=20
> It's not that device by rather the PXB_CXL_DEV and we
> can access the CXLHost via
> PXB_CXL_DEV(dv)->cxl.cxl_host_bridge()
> at which point this seems to be working.

The infrastructure to do this isn't in place until patch 24 so I'll have
to pull some of it into this patch to allow this reset to work.

Jonathan


>=20
> > > +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > > +    uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
> > > +
> > > +    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
> > > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_C=
OUNT, 8);
> > > +}
> > > +
> > >  static gint pxb_compare(gconstpointer a, gconstpointer b)
> > >  {
> > >      const PXBDev *pxb_a =3D a, *pxb_b =3D b;
> > > @@ -290,6 +328,11 @@ static void pxb_dev_realize_common(PCIDevice *de=
v, enum BusType type,
> > >      pci_config_set_class(dev->config, PCI_CLASS_BRIDGE_HOST);
> > > =20
> > >      pxb_dev_list =3D g_list_insert_sorted(pxb_dev_list, pxb, pxb_com=
pare);
> > > +
> > > +    if (type =3D=3D CXL) {
> > > +        pxb_dev_reset(ds);
> > > +    }
> > > +   =20
> >=20
> > Couldn't this just be done in the cxl realize function after it calls t=
he
> > common code? =20
> yup.
>=20
> >  =20
> > >      return;
> > > =20
> > >  err_register_bus:
> > > @@ -338,6 +381,12 @@ static void pxb_dev_class_init(ObjectClass *klas=
s, void *data)
> > >      device_class_set_props(dc, pxb_dev_properties);
> > >      dc->hotpluggable =3D false;
> > >      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > > +
> > > +    /*
> > > +     * Reset doesn't seem to actually be called, but maybe it will i=
n the
> > > +     * future?
> > > +     */
> > > +    dc->reset =3D pxb_dev_reset;   =20
> >=20
> > Surely because this should be in pxb_cxl_dev_class_init? =20
>=20
> That would indeed do it.
>=20
> Thanks.
>=20
> Jonathan
>=20
> >  =20
> > >  }
> > > =20
> > >  static const TypeInfo pxb_dev_info =3D {
> > > @@ -389,13 +438,58 @@ static const TypeInfo pxb_pcie_dev_info =3D {
> > >      },
> > >  };
> > > =20
> > > +static void pxb_cxl_dev_realize(PCIDevice *dev, Error **errp)
> > > +{
> > > +    /* A CXL PXB's parent bus is still PCIe */
> > > +    if (!pci_bus_is_express(pci_get_bus(dev))) {
> > > +        error_setg(errp, "pxb-cxl devices cannot reside on a PCI bus=
");
> > > +        return;
> > > +    }
> > > +
> > > +    pxb_dev_realize_common(dev, CXL, errp);
> > > +}
> > > +
> > > +static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
> > > +{
> > > +    DeviceClass *dc   =3D DEVICE_CLASS(klass);
> > > +    PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> > > +
> > > +    k->realize             =3D pxb_cxl_dev_realize;
> > > +    k->exit                =3D pxb_dev_exitfn;
> > > +    /*
> > > +     * XXX: These types of bridges don't actually show up in the hie=
rarchy so
> > > +     * vendor, device, class, etc. ids are intentionally left out.
> > > +     */
> > > +
> > > +    dc->desc =3D "CXL Host Bridge";
> > > +    device_class_set_props(dc, pxb_dev_properties);
> > > +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > > +
> > > +    /* Host bridges aren't hotpluggable. FIXME: spec reference */
> > > +    dc->hotpluggable =3D false;
> > > +}
> > > +
> > > +static const TypeInfo pxb_cxl_dev_info =3D {
> > > +    .name          =3D TYPE_PXB_CXL_DEVICE,
> > > +    .parent        =3D TYPE_PCI_DEVICE,
> > > +    .instance_size =3D sizeof(PXBDev),
> > > +    .class_init    =3D pxb_cxl_dev_class_init,
> > > +    .interfaces =3D
> > > +        (InterfaceInfo[]){
> > > +            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > > +            {},
> > > +        },
> > > +};
> > > +
> > >  static void pxb_register_types(void)
> > >  {
> > >      type_register_static(&pxb_bus_info);
> > >      type_register_static(&pxb_pcie_bus_info);
> > > +    type_register_static(&pxb_cxl_bus_info);
> > >      type_register_static(&pxb_host_info);
> > >      type_register_static(&pxb_dev_info);
> > >      type_register_static(&pxb_pcie_dev_info);
> > > +    type_register_static(&pxb_cxl_dev_info);
> > >  }
> > > =20
> > >  type_init(pxb_register_types)
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index 474ea98c1d..cafebf6f59 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -229,6 +229,12 @@ static const TypeInfo pcie_bus_info =3D {
> > >      .class_init =3D pcie_bus_class_init,
> > >  };
> > > =20
> > > +static const TypeInfo cxl_bus_info =3D {
> > > +    .name       =3D TYPE_CXL_BUS,
> > > +    .parent     =3D TYPE_PCIE_BUS,
> > > +    .class_init =3D pcie_bus_class_init,
> > > +};
> > > +
> > >  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
> > >  static void pci_update_mappings(PCIDevice *d);
> > >  static void pci_irq_handler(void *opaque, int irq_num, int level);
> > > @@ -2892,6 +2898,7 @@ static void pci_register_types(void)
> > >  {
> > >      type_register_static(&pci_bus_info);
> > >      type_register_static(&pcie_bus_info);
> > > +    type_register_static(&cxl_bus_info);
> > >      type_register_static(&conventional_pci_interface_info);
> > >      type_register_static(&cxl_interface_info);
> > >      type_register_static(&pcie_interface_info);
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index 908896ebe8..97cbbad375 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -409,6 +409,7 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *op=
aque, int pin);
> > >  #define TYPE_PCI_BUS "PCI"
> > >  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
> > >  #define TYPE_PCIE_BUS "PCIE"
> > > +#define TYPE_CXL_BUS "CXL"
> > > =20
> > >  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque=
);
> > >  typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
> > > @@ -768,6 +769,11 @@ static inline void pci_irq_pulse(PCIDevice *pci_=
dev)
> > >      pci_irq_deassert(pci_dev);
> > >  }
> > > =20
> > > +static inline int pci_is_cxl(const PCIDevice *d)
> > > +{
> > > +    return d->cap_present & QEMU_PCIE_CAP_CXL;
> > > +}
> > > +
> > >  static inline int pci_is_express(const PCIDevice *d)
> > >  {
> > >      return d->cap_present & QEMU_PCI_CAP_EXPRESS;   =20
> >=20
> >  =20
>=20


