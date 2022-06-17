Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44454F600
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 12:54:34 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o29cW-0002Qw-S1
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 06:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o29Zz-0001MR-Cz
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 06:51:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o29Zw-0000Zd-HM
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 06:51:55 -0400
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPbR3033Rz67VbM;
 Fri, 17 Jun 2022 18:50:07 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 12:51:49 +0200
Received: from localhost (10.81.209.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.24; Fri, 17 Jun
 2022 11:51:48 +0100
Date: Fri, 17 Jun 2022 11:51:44 +0100
To: Igor Mammedov <imammedo@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, "Peter
 Maydell" <peter.maydell@linaro.org>, Ben Widawsky <ben.widawsky@intel.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v2 25/86] hw/cxl/component: Implement host bridge MMIO
 (8.2.5, table 142)
Message-ID: <20220617115144.00007690@Huawei.com>
In-Reply-To: <20220616164500.274842cb@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-26-mst@redhat.com>
 <20220616164500.274842cb@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.81.209.131]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 16 Jun 2022 16:45:00 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 16 May 2022 16:51:34 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >=20
> > CXL host bridges themselves may have MMIO. Since host bridges don't have
> > a BAR they are treated as special for MMIO.  This patch includes
> > i386/pc support.
> > Also hook up the device reset now that we have have the MMIO
> > space in which the results are visible.
> >=20
> > Note that we duplicate the PCI express case for the aml_build but
> > the implementations will diverge when the CXL specific _OSC is
> > introduced.
> >=20
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > Message-Id: <20220429144110.25167-24-Jonathan.Cameron@huawei.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/hw/cxl/cxl.h                | 14 ++++++
> >  hw/i386/acpi-build.c                | 25 ++++++++++-
> >  hw/i386/pc.c                        | 27 +++++++++++-
> >  hw/pci-bridge/pci_expander_bridge.c | 66 ++++++++++++++++++++++++++---
> >  4 files changed, 122 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > index 31af92fd5e..8d1a7245d0 100644
> > --- a/include/hw/cxl/cxl.h
> > +++ b/include/hw/cxl/cxl.h
> > @@ -10,6 +10,7 @@
> >  #ifndef CXL_H
> >  #define CXL_H
> > =20
> > +#include "hw/pci/pci_host.h"
> >  #include "cxl_pci.h"
> >  #include "cxl_component.h"
> >  #include "cxl_device.h"
> > @@ -17,8 +18,21 @@
> >  #define CXL_COMPONENT_REG_BAR_IDX 0
> >  #define CXL_DEVICE_REG_BAR_IDX 2
> > =20
> > +#define CXL_WINDOW_MAX 10
> > +
> >  typedef struct CXLState {
> >      bool is_enabled;
> > +    MemoryRegion host_mr;
> > +    unsigned int next_mr_idx;
> >  } CXLState;
> > =20
> > +struct CXLHost {
> > +    PCIHostState parent_obj;
> > +
> > +    CXLComponentState cxl_cstate;
> > +};
> > +
> > +#define TYPE_PXB_CXL_HOST "pxb-cxl-host"
> > +OBJECT_DECLARE_SIMPLE_TYPE(CXLHost, PXB_CXL_HOST)
> > +
> >  #endif
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index dcf6ece3d0..2d81b0f40c 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -28,6 +28,7 @@
> >  #include "qemu/bitmap.h"
> >  #include "qemu/error-report.h"
> >  #include "hw/pci/pci.h"
> > +#include "hw/cxl/cxl.h"
> >  #include "hw/core/cpu.h"
> >  #include "target/i386/cpu.h"
> >  #include "hw/misc/pvpanic.h"
> > @@ -1572,10 +1573,21 @@ build_dsdt(GArray *table_data, BIOSLinker *link=
er,
> >              }
> > =20
> >              scope =3D aml_scope("\\_SB");
> > -            dev =3D aml_device("PC%.02X", bus_num);
> > +
> > +            if (pci_bus_is_cxl(bus)) {
> > +                dev =3D aml_device("CL%.02X", bus_num);
> > +            } else {
> > +                dev =3D aml_device("PC%.02X", bus_num);
> > +            }
> >              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
> >              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
> > -            if (pci_bus_is_express(bus)) {
> > +            if (pci_bus_is_cxl(bus)) {
> > +                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0=
A08")));
> > +                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0=
A03")));
> > +
> > +                /* Expander bridges do not have ACPI PCI Hot-plug enab=
led */
> > +                aml_append(dev, build_q35_osc_method(true));
> > +            } else if (pci_bus_is_express(bus)) {
> >                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0=
A08")));
> >                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0=
A03")));
> > =20
> > @@ -1595,6 +1607,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
> >              aml_append(dev, aml_name_decl("_CRS", crs));
> >              aml_append(scope, dev);
> >              aml_append(dsdt, scope);
> > +
> > +            /* Handle the ranges for the PXB expanders */
> > +            if (pci_bus_is_cxl(bus)) {
> > +                MemoryRegion *mr =3D &machine->cxl_devices_state->host=
_mr;
> > +                uint64_t base =3D mr->addr;
> > +
> > +                crs_range_insert(crs_range_set.mem_ranges, base,
> > +                                 base + memory_region_size(mr) - 1);
> > +            }
> >          }
> >      }
> > =20
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 45e2d6092f..03d14f6564 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -75,6 +75,7 @@
> >  #include "acpi-build.h"
> >  #include "hw/mem/pc-dimm.h"
> >  #include "hw/mem/nvdimm.h"
> > +#include "hw/cxl/cxl.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-visit-common.h"
> >  #include "qapi/qapi-visit-machine.h"
> > @@ -816,6 +817,7 @@ void pc_memory_init(PCMachineState *pcms,
> >      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> >      PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> >      X86MachineState *x86ms =3D X86_MACHINE(pcms);
> > +    hwaddr cxl_base;
> > =20
> >      assert(machine->ram_size =3D=3D x86ms->below_4g_mem_size +
> >                                  x86ms->above_4g_mem_size);
> > @@ -905,6 +907,26 @@ void pc_memory_init(PCMachineState *pcms,
> >                                      &machine->device_memory->mr);
> >      }
> > =20
> > +    if (machine->cxl_devices_state->is_enabled) {
> > +        MemoryRegion *mr =3D &machine->cxl_devices_state->host_mr;
> > +        hwaddr cxl_size =3D MiB;
> > +
> > +        if (pcmc->has_reserved_memory && machine->device_memory->base)=
 {
> > +            cxl_base =3D machine->device_memory->base;
> > +            if (!pcmc->broken_reserved_end) {
> > +                cxl_base +=3D memory_region_size(&machine->device_memo=
ry->mr);
> > +            } =20
>=20
> while reviewing 1Tb hole patches, I've stumbled onto this
> it looks wrong to ignore device_memory size here as RAM is/might still be=
 mapped there
> and guest can try to use it as RAM and then as CXL MMIO or other way arou=
nd.
> Most likely nothing good will come out of it, suggest make it uncondition=
al and
> always put cxl_base _after_ actual device_memory

Ah. I didn't fully understand the broken_reserved_end handling.

Just to check I understand correctly are you suggesting.

        if (pcmc->has_reserved_memory && machine->device_memory->base) {
            cxl_base =3D machine->device_memory->base +=20
                memory_region_size(&machine->device_memory->mr);
        } else if (pcms->sgx_epc.size !=3D 0) {
...

?

Thanks,

Jonathan



>=20
>=20
> > +        } else if (pcms->sgx_epc.size !=3D 0) {
> > +            cxl_base =3D sgx_epc_above_4g_end(&pcms->sgx_epc);
> > +        } else {
> > +            cxl_base =3D 0x100000000ULL + x86ms->above_4g_mem_size;
> > +        }
> > +
> > +        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
> > +        memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_si=
ze);
> > +        memory_region_add_subregion(system_memory, cxl_base, mr);
> > +    }
> > +
> >      /* Initialize PC system firmware */
> >      pc_system_firmware_init(pcms, rom_memory);
> > =20
> > @@ -965,7 +987,10 @@ uint64_t pc_pci_hole64_start(void)
> >      X86MachineState *x86ms =3D X86_MACHINE(pcms);
> >      uint64_t hole64_start =3D 0;
> > =20
> > -    if (pcmc->has_reserved_memory && ms->device_memory->base) {
> > +    if (ms->cxl_devices_state->host_mr.addr) {
> > +        hole64_start =3D ms->cxl_devices_state->host_mr.addr +
> > +            memory_region_size(&ms->cxl_devices_state->host_mr);
> > +    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
> >          hole64_start =3D ms->device_memory->base;
> >          if (!pcmc->broken_reserved_end) {
> >              hole64_start +=3D memory_region_size(&ms->device_memory->m=
r);
> > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_ex=
pander_bridge.c
> > index f762eb4a6e..8fb4f2ea91 100644
> > --- a/hw/pci-bridge/pci_expander_bridge.c
> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -61,12 +61,6 @@ DECLARE_INSTANCE_CHECKER(PXBDev, PXB_PCIE_DEV,
> >  DECLARE_INSTANCE_CHECKER(PXBDev, PXB_CXL_DEV,
> >                           TYPE_PXB_CXL_DEVICE)
> > =20
> > -typedef struct CXLHost {
> > -    PCIHostState parent_obj;
> > -
> > -    CXLComponentState cxl_cstate;
> > -} CXLHost;
> > -
> >  struct PXBDev {
> >      /*< private >*/
> >      PCIDevice parent_obj;
> > @@ -75,6 +69,9 @@ struct PXBDev {
> >      uint8_t bus_nr;
> >      uint16_t numa_node;
> >      bool bypass_iommu;
> > +    struct cxl_dev {
> > +        CXLHost *cxl_host_bridge;
> > +    } cxl;
> >  };
> > =20
> >  static PXBDev *convert_to_pxb(PCIDevice *dev)
> > @@ -197,6 +194,52 @@ static const TypeInfo pxb_host_info =3D {
> >      .class_init    =3D pxb_host_class_init,
> >  };
> > =20
> > +static void pxb_cxl_realize(DeviceState *dev, Error **errp)
> > +{
> > +    MachineState *ms =3D MACHINE(qdev_get_machine());
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +    CXLHost *cxl =3D PXB_CXL_HOST(dev);
> > +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > +    struct MemoryRegion *mr =3D &cxl_cstate->crb.component_registers;
> > +    hwaddr offset;
> > +
> > +    cxl_component_register_block_init(OBJECT(dev), cxl_cstate,
> > +                                      TYPE_PXB_CXL_HOST);
> > +    sysbus_init_mmio(sbd, mr);
> > +
> > +    offset =3D memory_region_size(mr) * ms->cxl_devices_state->next_mr=
_idx;
> > +    if (offset > memory_region_size(&ms->cxl_devices_state->host_mr)) {
> > +        error_setg(errp, "Insufficient space for pxb cxl host register=
 space");
> > +        return;
> > +    }
> > +
> > +    memory_region_add_subregion(&ms->cxl_devices_state->host_mr, offse=
t, mr);
> > +    ms->cxl_devices_state->next_mr_idx++;
> > +}
> > +
> > +static void pxb_cxl_host_class_init(ObjectClass *class, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(class);
> > +    PCIHostBridgeClass *hc =3D PCI_HOST_BRIDGE_CLASS(class);
> > +
> > +    hc->root_bus_path =3D pxb_host_root_bus_path;
> > +    dc->fw_name =3D "cxl";
> > +    dc->realize =3D pxb_cxl_realize;
> > +    /* Reason: Internal part of the pxb/pxb-pcie device, not usable by=
 itself */
> > +    dc->user_creatable =3D false;
> > +}
> > +
> > +/*
> > + * This is a device to handle the MMIO for a CXL host bridge. It does =
nothing
> > + * else.
> > + */
> > +static const TypeInfo cxl_host_info =3D {
> > +    .name          =3D TYPE_PXB_CXL_HOST,
> > +    .parent        =3D TYPE_PCI_HOST_BRIDGE,
> > +    .instance_size =3D sizeof(CXLHost),
> > +    .class_init    =3D pxb_cxl_host_class_init,
> > +};
> > +
> >  /*
> >   * Registers the PXB bus as a child of pci host root bus.
> >   */
> > @@ -245,6 +288,13 @@ static int pxb_map_irq_fn(PCIDevice *pci_dev, int =
pin)
> > =20
> >  static void pxb_dev_reset(DeviceState *dev)
> >  {
> > +    CXLHost *cxl =3D PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
> > +    CXLComponentState *cxl_cstate =3D &cxl->cxl_cstate;
> > +    uint32_t *reg_state =3D cxl_cstate->crb.cache_mem_registers;
> > +    uint32_t *write_msk =3D cxl_cstate->crb.cache_mem_regs_write_mask;
> > +
> > +    cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT=
_PORT);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COU=
NT, 8);
> >  }
> > =20
> >  static gint pxb_compare(gconstpointer a, gconstpointer b)
> > @@ -281,12 +331,13 @@ static void pxb_dev_realize_common(PCIDevice *dev=
, enum BusType type,
> >          dev_name =3D dev->qdev.id;
> >      }
> > =20
> > -    ds =3D qdev_new(TYPE_PXB_HOST);
> > +    ds =3D qdev_new(type =3D=3D CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOS=
T);
> >      if (type =3D=3D PCIE) {
> >          bus =3D pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB=
_PCIE_BUS);
> >      } else if (type =3D=3D CXL) {
> >          bus =3D pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB=
_CXL_BUS);
> >          bus->flags |=3D PCI_BUS_CXL;
> > +        PXB_CXL_DEV(dev)->cxl.cxl_host_bridge =3D PXB_CXL_HOST(ds);
> >      } else {
> >          bus =3D pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TY=
PE_PXB_BUS);
> >          bds =3D qdev_new("pci-bridge");
> > @@ -475,6 +526,7 @@ static void pxb_register_types(void)
> >      type_register_static(&pxb_pcie_bus_info);
> >      type_register_static(&pxb_cxl_bus_info);
> >      type_register_static(&pxb_host_info);
> > +    type_register_static(&cxl_host_info);
> >      type_register_static(&pxb_dev_info);
> >      type_register_static(&pxb_pcie_dev_info);
> >      type_register_static(&pxb_cxl_dev_info); =20
>=20


