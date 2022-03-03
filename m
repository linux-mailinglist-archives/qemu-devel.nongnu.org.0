Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47674CC3C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:31:10 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpID-0003BA-U1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPpAL-0007YQ-K7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:23:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nPpAH-0004SJ-TV
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:23:00 -0500
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4K8d7m2w9tz67Xxg;
 Fri,  4 Mar 2022 01:21:40 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Thu, 3 Mar 2022 18:22:55 +0100
Received: from localhost (10.202.226.41) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Thu, 3 Mar
 2022 17:22:54 +0000
Date: Thu, 3 Mar 2022 17:22:52 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 16/43] hw/cxl/rp: Add a root port
Message-ID: <20220303172252.00004c04@Huawei.com>
In-Reply-To: <87lextlf1f.fsf@linaro.org>
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-17-Jonathan.Cameron@huawei.com>
 <87lextlf1f.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.226.41]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 01 Mar 2022 18:08:31 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > This adds just enough of a root port implementation to be able to
> > enumerate root ports (creating the required DVSEC entries). What's not
> > here yet is the MMIO nor the ability to write some of the DVSEC entries.
> >
> > This can be added with the qemu commandline by adding a rootport to a
> > specific CXL host bridge. For example:
> >   -device cxl-rp,id=3Drp0,bus=3D"cxl.0",addr=3D0.0,chassis=3D4
> >
> > Like the host bridge patch, the ACPI tables aren't generated at this
> > point and so system software cannot use it.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/pci-bridge/Kconfig          |   5 +
> >  hw/pci-bridge/cxl_root_port.c  | 231 +++++++++++++++++++++++++++++++++
> >  hw/pci-bridge/meson.build      |   1 +
> >  hw/pci-bridge/pcie_root_port.c |   6 +-
> >  hw/pci/pci.c                   |   4 +-
> >  5 files changed, 245 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
> > index f8df4315ba..02614f49aa 100644
> > --- a/hw/pci-bridge/Kconfig
> > +++ b/hw/pci-bridge/Kconfig
> > @@ -27,3 +27,8 @@ config DEC_PCI
> > =20
> >  config SIMBA
> >      bool
> > +
> > +config CXL
> > +    bool
> > +    default y if PCI_EXPRESS && PXB
> > +    depends on PCI_EXPRESS && MSI_NONBROKEN && PXB
> > diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_por=
t.c
> > new file mode 100644
> > index 0000000000..dd714db836
> > --- /dev/null
> > +++ b/hw/pci-bridge/cxl_root_port.c
> > @@ -0,0 +1,231 @@
> > +/*
> > + * CXL 2.0 Root Port Implementation
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <http://www.gnu.org/li=
censes/>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/range.h"
> > +#include "hw/pci/pci_bridge.h"
> > +#include "hw/pci/pcie_port.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/sysbus.h"
> > +#include "qapi/error.h"
> > +#include "hw/cxl/cxl.h"
> > +
> > +#define CXL_ROOT_PORT_DID 0x7075
> > +
> > +/* Copied from the gen root port which we derive */
> > +#define GEN_PCIE_ROOT_PORT_AER_OFFSET 0x100
> > +#define GEN_PCIE_ROOT_PORT_ACS_OFFSET \
> > +    (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
> > +#define CXL_ROOT_PORT_DVSEC_OFFSET \
> > +    (GEN_PCIE_ROOT_PORT_ACS_OFFSET + PCI_ACS_SIZEOF)
> > +
> > +typedef struct CXLRootPort {
> > +    /*< private >*/
> > +    PCIESlot parent_obj;
> > +
> > +    CXLComponentState cxl_cstate;
> > +    PCIResReserve res_reserve;
> > +} CXLRootPort;
> > +
> > +#define TYPE_CXL_ROOT_PORT "cxl-rp"
> > +DECLARE_INSTANCE_CHECKER(CXLRootPort, CXL_ROOT_PORT, TYPE_CXL_ROOT_POR=
T)
> > +
> > +static void latch_registers(CXLRootPort *crp)
> > +{
> > +    uint32_t *reg_state =3D crp->cxl_cstate.crb.cache_mem_registers;
> > +
> > +    cxl_component_register_init_common(reg_state, CXL2_ROOT_PORT);
> > +}
> > +
> > +static void build_dvsecs(CXLComponentState *cxl)
> > +{
> > +    uint8_t *dvsec;
> > +
> > +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_extensions){ 0 };
> > +    cxl_component_create_dvsec(cxl, EXTENSIONS_PORT_DVSEC_LENGTH,
> > +                               EXTENSIONS_PORT_DVSEC,
> > +                               EXTENSIONS_PORT_DVSEC_REVID, dvsec);
> > +
> > +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_gpf){
> > +        .rsvd        =3D 0,
> > +        .phase1_ctrl =3D 1, /* 1=CE=BCs timeout */
> > +        .phase2_ctrl =3D 1, /* 1=CE=BCs timeout */
> > +    };
> > +    cxl_component_create_dvsec(cxl, GPF_PORT_DVSEC_LENGTH, GPF_PORT_DV=
SEC,
> > +                               GPF_PORT_DVSEC_REVID, dvsec);
> > +
> > +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_port_flexbus){
> > +        .cap                     =3D 0x26, /* IO, Mem, non-MLD */
> > +        .ctrl                    =3D 0,
> > +        .status                  =3D 0x26, /* same */
> > +        .rcvd_mod_ts_data_phase1 =3D 0xef, /* WTF? */
> > +    };
> > +    cxl_component_create_dvsec(cxl, PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0,
> > +                               PCIE_FLEXBUS_PORT_DVSEC,
> > +                               PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0, dvse=
c);
> > +
> > +    dvsec =3D (uint8_t *)&(struct cxl_dvsec_register_locator){
> > +        .rsvd         =3D 0,
> > +        .reg0_base_lo =3D RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_ID=
X,
> > +        .reg0_base_hi =3D 0,
> > +    };
> > +    cxl_component_create_dvsec(cxl, REG_LOC_DVSEC_LENGTH, REG_LOC_DVSE=
C,
> > +                               REG_LOC_DVSEC_REVID, dvsec);
> > +}
> > +
> > +static void cxl_rp_realize(DeviceState *dev, Error **errp)
> > +{
> > +    PCIDevice *pci_dev     =3D PCI_DEVICE(dev);
> > +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(dev);
> > +    CXLRootPort *crp       =3D CXL_ROOT_PORT(dev);
> > +    CXLComponentState *cxl_cstate =3D &crp->cxl_cstate;
> > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > +    MemoryRegion *component_bar =3D &cregs->component_registers;
> > +    Error *local_err =3D NULL;
> > +
> > +    rpc->parent_realize(dev, &local_err);
> > +    if (local_err) {
> > +        error_propagate(errp, local_err);
> > +        return;
> > +    }
> > +
> > +    int rc =3D
> > +        pci_bridge_qemu_reserve_cap_init(pci_dev, 0, crp->res_reserve,=
 errp);
> > +    if (rc < 0) {
> > +        rpc->parent_class.exit(pci_dev);
> > +        return;
> > +    }
> > +
> > +    if (!crp->res_reserve.io || crp->res_reserve.io =3D=3D -1) {
> > +        pci_word_test_and_clear_mask(pci_dev->wmask + PCI_COMMAND,
> > +                                     PCI_COMMAND_IO);
> > +        pci_dev->wmask[PCI_IO_BASE]  =3D 0;
> > +        pci_dev->wmask[PCI_IO_LIMIT] =3D 0;
> > +    }
> > +
> > +    cxl_cstate->dvsec_offset =3D CXL_ROOT_PORT_DVSEC_OFFSET;
> > +    cxl_cstate->pdev =3D pci_dev;
> > +    build_dvsecs(&crp->cxl_cstate);
> > +
> > +    cxl_component_register_block_init(OBJECT(pci_dev), cxl_cstate,
> > +                                      TYPE_CXL_ROOT_PORT);
> > +
> > +    pci_register_bar(pci_dev, CXL_COMPONENT_REG_BAR_IDX,
> > +                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > +                         PCI_BASE_ADDRESS_MEM_TYPE_64,
> > +                     component_bar);
> > +}
> > +
> > +static void cxl_rp_reset(DeviceState *dev)
> > +{
> > +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_GET_CLASS(dev);
> > +    CXLRootPort *crp =3D CXL_ROOT_PORT(dev);
> > +
> > +    rpc->parent_reset(dev);
> > +
> > +    latch_registers(crp);
> > +}
> > +
> > +static Property gen_rp_props[] =3D {
> > +    DEFINE_PROP_UINT32("bus-reserve", CXLRootPort, res_reserve.bus, -1=
),
> > +    DEFINE_PROP_SIZE("io-reserve", CXLRootPort, res_reserve.io, -1),
> > +    DEFINE_PROP_SIZE("mem-reserve", CXLRootPort, res_reserve.mem_non_p=
ref, -1),
> > +    DEFINE_PROP_SIZE("pref32-reserve", CXLRootPort, res_reserve.mem_pr=
ef_32,
> > +                     -1),
> > +    DEFINE_PROP_SIZE("pref64-reserve", CXLRootPort, res_reserve.mem_pr=
ef_64,
> > +                     -1),
> > +    DEFINE_PROP_END_OF_LIST()
> > +};
> > +
> > +static void cxl_rp_dvsec_write_config(PCIDevice *dev, uint32_t addr,
> > +                                      uint32_t val, int len)
> > +{
> > +    CXLRootPort *crp =3D CXL_ROOT_PORT(dev);
> > +
> > +    if (range_contains(&crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC],=
 addr)) {
> > +        uint8_t *reg =3D &dev->config[addr];
> > +        addr -=3D crp->cxl_cstate.dvsecs[EXTENSIONS_PORT_DVSEC].lob;
> > +        if (addr =3D=3D PORT_CONTROL_OFFSET) {
> > +            if (pci_get_word(reg) & PORT_CONTROL_UNMASK_SBR) {
> > +                /* unmask SBR */
> > +            }
> > +            if (pci_get_word(reg) & PORT_CONTROL_ALT_MEMID_EN) {
> > +                /* Alt Memory & ID Space Enable */
> > +            } =20
>=20
> Can we have LOG_UNIMPs for these null implementations please.

Added.  I have implementation for SBR unmasking, but that will be part of
a future patch set so definitely makes sense to log for now.

The alt memory stuff is about making a CXL 1.1 device that is attached
to a CXL switch work (?).  In that case we have to make it
magically appear as an RCiEP despite being below a switch and
hence have to mess around with routing to make that work - effectively
we are tunneling an extra PCI topology through the existing one.

Given we generally don't care today about emulating CXL 1.1 devices
at all, it may never be implemented in QEMU.
So definitely good to log that...


>=20
> > +        }
> > +    }
> > +}
> > +

...

> > +static void cxl_root_port_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc        =3D DEVICE_CLASS(oc);
> > +    PCIDeviceClass *k      =3D PCI_DEVICE_CLASS(oc);
> > +    PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_CLASS(oc);
> > +
> > +    k->vendor_id =3D PCI_VENDOR_ID_INTEL;
> > +    k->device_id =3D CXL_ROOT_PORT_DID;
> > +    dc->desc     =3D "CXL Root Port";
> > +    k->revision  =3D 0;
> > +    device_class_set_props(dc, gen_rp_props);
> > +    k->config_write =3D cxl_rp_write_config;
> > +
> > +    device_class_set_parent_realize(dc, cxl_rp_realize, &rpc->parent_r=
ealize);
> > +    device_class_set_parent_reset(dc, cxl_rp_reset, &rpc->parent_reset=
);
> > +
> > +    rpc->aer_offset =3D GEN_PCIE_ROOT_PORT_AER_OFFSET;
> > +    rpc->acs_offset =3D GEN_PCIE_ROOT_PORT_ACS_OFFSET;
> > +
> > +    /*
> > +     * Explain
> > +     */ =20
>=20
> You might as well either expand the comment or drop it, the code makes
> it clear it is not hot pluggable (although an explanation would be
> better - given it's PCIe like roots isn't hotplug a thing you see on CXL?)

Hotplug of devices is indeed something we care about in CXL
though for now it's untested. Hotplug of the root ports themselves is going
to be 'interesting' due to the memory decoding targeting the ports.
For now I've just dropped the pointless comment.

Ben: If you had a planned explanation to put here, can you remember what
it was?  We can add it later though - for now just dropping the comment
seems best way forward to me.

Thanks,

Jonathan

