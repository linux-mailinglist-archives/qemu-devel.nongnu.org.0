Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9055D30BD68
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:51:10 +0100 (CET)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uD7-0001AU-MM
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6uBH-0008UA-0P
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:49:15 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6uB9-0007aR-R7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:49:14 -0500
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DVNGf4q57z67blR;
 Tue,  2 Feb 2021 19:42:50 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 2 Feb 2021 12:49:00 +0100
Received: from localhost (10.47.79.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 11:49:00 +0000
Date: Tue, 2 Feb 2021 11:48:15 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 02/31] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20210202114815.000000e4@Huawei.com>
In-Reply-To: <20210202005948.241655-3-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-3-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.79.68]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: David
 Hildenbrand <david@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 16:59:19 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> A CXL 2.0 component is any entity in the CXL topology. All components
> have a analogous function in PCIe. Except for the CXL host bridge, all
> have a PCIe config space that is accessible via the common PCIe
> mechanisms. CXL components are enumerated via DVSEC fields in the
> extended PCIe header space. CXL components will minimally implement some
> subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
> 2.0 specification. Two headers and a utility library are introduced to
> support the minimum functionality needed to enumerate components.
>=20
> The cxl_pci header manages bits associated with PCI, specifically the
> DVSEC and related fields. The cxl_component.h variant has data
> structures and APIs that are useful for drivers implementing any of the
> CXL 2.0 components. The library takes care of making use of the DVSEC
> bits and the CXL.[mem|cache] registers. Per spec, the registers are
> little endian.
>=20
> None of the mechanisms required to enumerate a CXL capable hostbridge
> are introduced at this point.
>=20
> Note that the CXL.mem and CXL.cache registers used are always 4B wide.
> It's possible in the future that this constraint will not hold.
>=20
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

A few minor discrepancies from the spec, + naming suggestions.

Otherwise LGTM.

> ---
>  MAINTAINERS                    |   6 +
>  hw/Kconfig                     |   1 +
>  hw/cxl/Kconfig                 |   3 +
>  hw/cxl/cxl-component-utils.c   | 208 +++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build             |   3 +
>  hw/meson.build                 |   1 +
>  include/hw/cxl/cxl.h           |  17 +++
>  include/hw/cxl/cxl_component.h | 187 +++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_pci.h       | 138 ++++++++++++++++++++++
>  9 files changed, 564 insertions(+)
>  create mode 100644 hw/cxl/Kconfig
>  create mode 100644 hw/cxl/cxl-component-utils.c
>  create mode 100644 hw/cxl/meson.build
>  create mode 100644 include/hw/cxl/cxl.h
>  create mode 100644 include/hw/cxl/cxl_component.h
>  create mode 100644 include/hw/cxl/cxl_pci.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bcd88668bc..981dc92e25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2234,6 +2234,12 @@ F: qapi/block*.json
>  F: qapi/transaction.json
>  T: git https://repo.or.cz/qemu/armbru.git block-next
> =20
> +Compute Express Link
> +M: Ben Widawsky <ben.widawsky@intel.com>
> +S: Supported
> +F: hw/cxl/
> +F: include/hw/cxl/
> +
>  Dirty Bitmaps
>  M: Eric Blake <eblake@redhat.com>
>  M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 5ad3c6b5a4..c03650c5ed 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -6,6 +6,7 @@ source audio/Kconfig
>  source block/Kconfig
>  source char/Kconfig
>  source core/Kconfig
> +source cxl/Kconfig
>  source display/Kconfig
>  source dma/Kconfig
>  source gpio/Kconfig
> diff --git a/hw/cxl/Kconfig b/hw/cxl/Kconfig
> new file mode 100644
> index 0000000000..8e67519b16
> --- /dev/null
> +++ b/hw/cxl/Kconfig
> @@ -0,0 +1,3 @@
> +config CXL
> +    bool
> +    default y if PCI_EXPRESS
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> new file mode 100644
> index 0000000000..8d56ad5c7d
> --- /dev/null
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -0,0 +1,208 @@
> +/*
> + * CXL Utility library for components
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/pci/pci.h"
> +#include "hw/cxl/cxl.h"
> +
> +static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    CXLComponentState *cxl_cstate =3D opaque;
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +
> +    assert(size =3D=3D 4);
> +
> +    if (cregs->special_ops && cregs->special_ops->read) {
> +        return cregs->special_ops->read(cxl_cstate, offset, size);
> +    } else {
> +        return cregs->cache_mem_registers[offset / 4];
> +    }
> +}
> +
> +static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_=
t value,
> +                                    unsigned size)
> +{
> +    CXLComponentState *cxl_cstate =3D opaque;
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +
> +    assert(size =3D=3D 4);
> +
> +    if (cregs->special_ops && cregs->special_ops->write) {
> +        cregs->special_ops->write(cxl_cstate, offset, value, size);
> +    } else {
> +        cregs->cache_mem_registers[offset / 4] =3D value;
> +    }
> +}
> +
> +/*
> + * 8.2.3
> + *   The access restrictions specified in Section 8.2.2 also apply to CX=
L 2.0
> + *   Component Registers.
> + *
> + * 8.2.2
> + *   =E2=80=A2 A 32 bit register shall be accessed as a 4 Bytes quantity=
. Partial
> + *   reads are not permitted.
> + *   =E2=80=A2 A 64 bit register shall be accessed as a 8 Bytes quantity=
. Partial
> + *   reads are not permitted.
> + *
> + * As of the spec defined today, only 4 byte registers exist.
> + */
> +static const MemoryRegionOps cache_mem_ops =3D {
> +    .read =3D cxl_cache_mem_read_reg,
> +    .write =3D cxl_cache_mem_write_reg,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +void cxl_component_register_block_init(Object *obj,
> +                                       CXLComponentState *cxl_cstate,
> +                                       const char *type)
> +{
> +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> +
> +    memory_region_init(&cregs->component_registers, obj, type,
> +                       CXL2_COMPONENT_BLOCK_SIZE);
> +
> +    /* io registers controls link which we don't care about in QEMU */
> +    memory_region_init_io(&cregs->io, obj, NULL, cregs, ".io",
> +                          CXL2_COMPONENT_IO_REGION_SIZE);
> +    memory_region_init_io(&cregs->cache_mem, obj, &cache_mem_ops, cregs,
> +                          ".cache_mem", CXL2_COMPONENT_CM_REGION_SIZE);
> +
> +    memory_region_add_subregion(&cregs->component_registers, 0, &cregs->=
io);
> +    memory_region_add_subregion(&cregs->component_registers,
> +                                CXL2_COMPONENT_IO_REGION_SIZE,
> +                                &cregs->cache_mem);
> +}
> +
> +static void ras_init_common(uint32_t *reg_state)
> +{
> +    reg_state[R_CXL_RAS_UNC_ERR_STATUS] =3D 0;
> +    reg_state[R_CXL_RAS_UNC_ERR_MASK] =3D 0x1efff; =20
This should be everything up to bit 11 then bits 14-16 I believe.
0x1cfff=20

> +    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] =3D 0x1efff;
0x1cfff as well

> +    reg_state[R_CXL_RAS_COR_ERR_STATUS] =3D 0;
> +    reg_state[R_CXL_RAS_COR_ERR_MASK] =3D 0x3f;
> +    reg_state[R_CXL_RAS_ERR_CAP_CTRL] =3D 0; /* CXL switches and devices=
 must set */
> +}
> +
> +static void hdm_init_common(uint32_t *reg_state)
> +{
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, DECODER_COUN=
T, 0);
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECO=
DER_ENABLE, 0);
> +}
> +
> +void cxl_component_register_init_common(uint32_t *reg_state, enum reg_ty=
pe type)
> +{
> +    int caps =3D 0;
> +    switch (type) {
> +    case CXL2_DOWNSTREAM_PORT:
> +    case CXL2_DEVICE:
> +        /* CAP, RAS, Link */
> +        caps =3D 2;
> +        break;
> +    case CXL2_UPSTREAM_PORT:
> +    case CXL2_TYPE3_DEVICE:
> +    case CXL2_LOGICAL_DEVICE:
> +        /* + HDM */
> +        caps =3D 3;
> +        break;
> +    case CXL2_ROOT_PORT:
> +        /* + Extended Security, + Snoop */
> +        caps =3D 5;
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    memset(reg_state, 0, 0x1000);

Better to pass the size in so it's apparent where that came from?

> +
> +    /* CXL Capability Header Register */
> +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ID, 1);
> +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, VERSION, 1);
> +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION=
, 1);
> +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ARRAY_SIZE, caps);
> +
> +
> +#define init_cap_reg(reg, id, version)                                  =
      \
> +    _Static_assert(CXL_##reg##_REGISTERS_OFFSET !=3D 0, "Invalid cap off=
set\n");\
> +    do {                                                                =
      \
> +        int which =3D R_CXL_##reg##_CAPABILITY_HEADER;                  =
        \
> +        reg_state[which] =3D FIELD_DP32(reg_state[which],               =
        \
> +                                      CXL_##reg##_CAPABILITY_HEADER, ID,=
 id); \
> +        reg_state[which] =3D                                            =
        \
> +            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER, =
      \
> +                       VERSION, version);                               =
      \
> +        reg_state[which] =3D                                            =
        \
> +            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER, =
PTR,  \
> +                       CXL_##reg##_REGISTERS_OFFSET);                   =
      \
> +    } while (0)
> +
> +    init_cap_reg(RAS, 2, 1);
> +    ras_init_common(reg_state);
> +
> +    init_cap_reg(LINK, 4, 2);
> +
> +    if (caps < 3) {

It strikes me that this approach of basing it purely on number of caps is
not particularly flexible or maintainable but I guess it will do for until =
we need
something more sophisticated. (i.e. when they aren't a series of expanding =
inclusive
sets of entries)

> +        return;
> +    }
> +
> +    init_cap_reg(HDM, 5, 1);
> +    hdm_init_common(reg_state);
> +
> +    if (caps < 5) {
> +        return;
> +    }
> +
> +    init_cap_reg(EXTSEC, 6, 1);
> +    init_cap_reg(SNOOP, 8, 1);
> +
> +#undef init_cap_reg
> +}
> +
> +/*
> + * Helper to creates a DVSEC header for a CXL entity. The caller is resp=
onsible
> + * for tracking the valid offset.
> + *
> + * This function will build the DVSEC header on behalf of the caller and=
 then
> + * copy in the remaining data for the vendor specific bits.
> + */
> +void cxl_component_create_dvsec(CXLComponentState *cxl, uint16_t length,
> +                                uint16_t type, uint8_t rev, uint8_t *bod=
y)
> +{
> +    PCIDevice *pdev =3D cxl->pdev;
> +    uint16_t offset =3D cxl->dvsec_offset;
> +
> +    assert(offset >=3D PCI_CFG_SPACE_SIZE &&
> +           ((offset + length) < PCI_CFG_SPACE_EXP_SIZE));
> +    assert((length & 0xf000) =3D=3D 0);
> +    assert((rev & ~0xf) =3D=3D 0);
> +
> +    /* Create the DVSEC in the MCFG space */
> +    pcie_add_capability(pdev, PCI_EXT_CAP_ID_DVSEC, 1, offset, length);
> +    pci_set_long(pdev->config + offset + PCIE_DVSEC_HEADER1_OFFSET,
> +                 (length << 20) | (rev << 16) | CXL_VENDOR_ID);
> +    pci_set_word(pdev->config + offset + PCIE_DVSEC_ID_OFFSET, type);
> +    memcpy(pdev->config + offset + sizeof(struct dvsec_header),
> +           body + sizeof(struct dvsec_header),
> +           length - sizeof(struct dvsec_header));
> +
> +    /* Update state for future DVSEC additions */
> +    range_init_nofail(&cxl->dvsecs[type], cxl->dvsec_offset, length);
> +    cxl->dvsec_offset +=3D length;
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> new file mode 100644
> index 0000000000..00c3876a0f
> --- /dev/null
> +++ b/hw/cxl/meson.build
> @@ -0,0 +1,3 @@
> +softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
> +  'cxl-component-utils.c',
> +))
> diff --git a/hw/meson.build b/hw/meson.build
> index 010de7219c..3e440c341a 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -6,6 +6,7 @@ subdir('block')
>  subdir('char')
>  subdir('core')
>  subdir('cpu')
> +subdir('cxl')
>  subdir('display')
>  subdir('dma')
>  subdir('gpio')
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> new file mode 100644
> index 0000000000..55f6cc30a5
> --- /dev/null
> +++ b/include/hw/cxl/cxl.h
> @@ -0,0 +1,17 @@
> +/*
> + * QEMU CXL Support
> + *
> + * Copyright (c) 2020 Intel
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef CXL_H
> +#define CXL_H
> +
> +#include "cxl_pci.h"
> +#include "cxl_component.h"
> +
> +#endif
> +
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_componen=
t.h
> new file mode 100644
> index 0000000000..762feb54da
> --- /dev/null
> +++ b/include/hw/cxl/cxl_component.h
> @@ -0,0 +1,187 @@
> +/*
> + * QEMU CXL Component
> + *
> + * Copyright (c) 2020 Intel
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef CXL_COMPONENT_H
> +#define CXL_COMPONENT_H
> +
> +/* CXL 2.0 - 8.2.4 */
> +#define CXL2_COMPONENT_IO_REGION_SIZE 0x1000
> +#define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
> +#define CXL2_COMPONENT_BLOCK_SIZE 0x10000
> +
> +#include "qemu/range.h"
> +#include "qemu/typedefs.h"
> +#include "hw/register.h"
> +
> +enum reg_type {
> +    CXL2_DEVICE,
> +    CXL2_TYPE3_DEVICE,
> +    CXL2_LOGICAL_DEVICE,
> +    CXL2_ROOT_PORT,
> +    CXL2_UPSTREAM_PORT,
> +    CXL2_DOWNSTREAM_PORT
> +};
> +
> +/*
> + * Capability registers are defined at the top of the CXL.cache/mem regi=
on and
> + * are packed. For our purposes we will always define the caps in the sa=
me
> + * order.
> + * CXL 2.0 - 8.2.5 Table 142 for details.
> + */
> +
> +/* CXL 2.0 - 8.2.5.1 */
> +REG32(CXL_CAPABILITY_HEADER, 0)
> +    FIELD(CXL_CAPABILITY_HEADER, ID, 0, 16)
> +    FIELD(CXL_CAPABILITY_HEADER, VERSION, 16, 4)
> +    FIELD(CXL_CAPABILITY_HEADER, CACHE_MEM_VERSION, 20, 4)
> +    FIELD(CXL_CAPABILITY_HEADER, ARRAY_SIZE, 24, 8)
> +
> +#define CXLx_CAPABILITY_HEADER(type, offset)                  \
> +    REG32(CXL_##type##_CAPABILITY_HEADER, offset)             \
> +        FIELD(CXL_##type##_CAPABILITY_HEADER, ID, 0, 16)      \
> +        FIELD(CXL_##type##_CAPABILITY_HEADER, VERSION, 16, 4) \
> +        FIELD(CXL_##type##_CAPABILITY_HEADER, PTR, 20, 12)
> +CXLx_CAPABILITY_HEADER(RAS, 0x4)
> +CXLx_CAPABILITY_HEADER(LINK, 0x8)
> +CXLx_CAPABILITY_HEADER(HDM, 0xc)
> +CXLx_CAPABILITY_HEADER(EXTSEC, 0x10)
> +CXLx_CAPABILITY_HEADER(SNOOP, 0x14)
> +
> +/*
> + * Capability structures contain the actual registers that the CXL compo=
nent
> + * implements. Some of these are specific to certain types of components=
, but
> + * this implementation leaves enough space regardless.
> + */
> +/* 8.2.5.9 - CXL RAS Capability Structure */
> +#define CXL_RAS_REGISTERS_OFFSET 0x80 /* Give ample space for caps befor=
e this */
> +#define CXL_RAS_REGISTERS_SIZE   0x58
> +REG32(CXL_RAS_UNC_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET)
> +REG32(CXL_RAS_UNC_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x4)
> +REG32(CXL_RAS_UNC_ERR_SEVERITY, CXL_RAS_REGISTERS_OFFSET + 0x8)
> +REG32(CXL_RAS_COR_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET + 0xc)
> +REG32(CXL_RAS_COR_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x10)
> +REG32(CXL_RAS_ERR_CAP_CTRL, CXL_RAS_REGISTERS_OFFSET + 0x14)
> +/* Offset 0x18 - 0x58 reserved for RAS logs */
> +
> +/* 8.2.5.10 - CXL Security Capability Structure */
> +#define CXL_SEC_REGISTERS_OFFSET (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REG=
ISTERS_SIZE)
> +#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream =
ports */
> +
> +/* 8.2.5.11 - CXL Link Capability Structure */
> +#define CXL_LINK_REGISTERS_OFFSET (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_RE=
GISTERS_SIZE)
> +#define CXL_LINK_REGISTERS_SIZE   0x38
> +
> +/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
> +#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
> +#define CXL_HDM_REGISTERS_OFFSET \
> +    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE) /* 8.2.5.12 */

The positioning of this isn't really defined by 8.2.5.12 that I can see. So=
 I'd drop
that trailing comment.

> +#define CXL_HDM_REGISTERS_SIZE (0x20 + HDM_DECODE_MAX * 10)

This doesn't look quite right.  0x10 + HDM_DECODE_MAX * 0x20 I think.
Offset to decoder 0 + number of HDM decoders * size of each decode descript=
ion.


> +#define HDM_DECODER_INIT(n)                                             =
       \
> +  REG32(CXL_HDM_DECODER##n##_BASE_LO,                                   =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x10)                   =
       \
this might be easier to read if you define something like
CXL_HDM_REGS_DECODER0_OFFSET  CXL_HDM_REGISTERS_OFFSET + 0x10
then use that for the base.

> +            FIELD(CXL_HDM_DECODER##n##_BASE_LO, L, 28, 4)               =
       \
> +  REG32(CXL_HDM_DECODER##n##_BASE_HI,                                   =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x14)                   =
       \
> +  REG32(CXL_HDM_DECODER##n##_SIZE_LO,                                   =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x18)                   =
       \
> +  REG32(CXL_HDM_DECODER##n##_SIZE_HI,                                   =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x1C)                   =
       \
> +  REG32(CXL_HDM_DECODER##n##_CTRL,                                      =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x20)                   =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, IG, 0, 4)                  =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, IW, 4, 4)                  =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, LOCK_ON_COMMIT, 8, 1)      =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMIT, 9, 1)              =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMITTED, 10, 1)          =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, ERROR, 11, 1)              =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, TYPE, 12, 1)               =
       \
> +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_LO, 0x24)                      =
       \
Offset should I think be per 'n'.

> +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_HI, 0x28)

Hmm. There is a hole here in the spec.  Probably needs a reserved 4 bytes
at CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x2c given next entry is at 0x30

Should be added to 8.2.5.12 table

> +
> +REG32(CXL_HDM_DECODER_CAPABILITY, CXL_HDM_REGISTERS_OFFSET)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0, 4)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 4, 4)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 8, 1)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTELEAVE_4K, 9, 1)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 10, 1)
> +REG32(CXL_HDM_DECODER_GLOBAL_CONTROL, CXL_HDM_REGISTERS_OFFSET + 4)=20

I'd be consistent on using hex for all offsets (even when it clearly makes =
no
difference like here!)

> +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, POISON_ON_ERR_EN, 0, 1)
> +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 1, 1)
> +
> +HDM_DECODER_INIT(0);
> +
> +/* 8.2.5.13 - CXL Extended Security Capability Structure (Root complex o=
nly) */
> +#define EXTSEC_ENTRY_MAX        256
> +#define CXL_EXTSEC_REGISTERS_OFFSET (CXL_HDM_REGISTERS_OFFSET + CXL_HDM_=
REGISTERS_SIZE)
> +#define CXL_EXTSEC_REGISTERS_SIZE   (8 * EXTSEC_ENTRY_MAX + 4)
> +
> +/* 8.2.5.14 - CXL IDE Capability Structure */
> +#define CXL_IDE_REGISTERS_OFFSET (CXL_EXTSEC_REGISTERS_OFFSET + CXL_EXTS=
EC_REGISTERS_SIZE)
> +#define CXL_IDE_REGISTERS_SIZE   0

0x20 (given we seem to be sizing other things we aren't using yet)

> +
> +/* 8.2.5.15 - CXL Snoop Filter Capability Structure */
> +#define CXL_SNOOP_REGISTERS_OFFSET (CXL_IDE_REGISTERS_OFFSET + CXL_IDE_R=
EGISTERS_SIZE)
> +#define CXL_SNOOP_REGISTERS_SIZE   0x8
> +
> +_Static_assert((CXL_SNOOP_REGISTERS_OFFSET + CXL_SNOOP_REGISTERS_SIZE) <=
 0x1000,
> +               "No space for registers");
> +
> +typedef struct component_registers {
> +    /*
> +     * Main memory region to be registered with QEMU core.
> +     */
> +    MemoryRegion component_registers;
> +
> +    /*
> +     * 8.2.4 Table 141:
> +     *   0x0000 - 0x0fff CXL.io registers
> +     *   0x1000 - 0x1fff CXL.cache and CXL.mem
> +     *   0x2000 - 0xdfff Implementation specific
> +     *   0xe000 - 0xe3ff CXL ARB/MUX registers
> +     *   0xe400 - 0xffff RSVD
> +     */
> +    uint32_t io_registers[CXL2_COMPONENT_IO_REGION_SIZE >> 2];
> +    MemoryRegion io;
> +
> +    uint32_t cache_mem_registers[CXL2_COMPONENT_CM_REGION_SIZE >> 2];
> +    MemoryRegion cache_mem;
> +
> +    MemoryRegion impl_specific;
> +    MemoryRegion arb_mux;
> +    MemoryRegion rsvd;
> +
> +    /* special_ops is used for any component that needs any specific han=
dling */
> +    MemoryRegionOps *special_ops;
> +} ComponentRegisters;
> +
> +/*
> + * A CXL component represents all entities in a CXL hierarchy. This incl=
udes,
> + * host bridges, root ports, upstream/downstream switch ports, and devic=
es
> + */
> +typedef struct cxl_component {
> +    ComponentRegisters crb;
> +    union {
> +        struct {
> +            Range dvsecs[CXL20_MAX_DVSEC];
> +            uint16_t dvsec_offset;
> +            struct PCIDevice *pdev;
> +        };
> +    };
> +} CXLComponentState;
> +
> +void cxl_component_register_block_init(Object *obj,
> +                                       CXLComponentState *cxl_cstate,
> +                                       const char *type);
> +void cxl_component_register_init_common(uint32_t *reg_state,
> +                                        enum reg_type type);
> +
> +void cxl_component_create_dvsec(CXLComponentState *cxl_cstate, uint16_t =
length,
> +                                uint16_t type, uint8_t rev, uint8_t *bod=
y);
> +
> +#endif
> diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> new file mode 100644
> index 0000000000..a53c2e5ae7
> --- /dev/null
> +++ b/include/hw/cxl/cxl_pci.h
> @@ -0,0 +1,138 @@
> +/*
> + * QEMU CXL PCI interfaces
> + *
> + * Copyright (c) 2020 Intel
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef CXL_PCI_H
> +#define CXL_PCI_H
> +
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pcie.h"
> +
> +#define CXL_VENDOR_ID 0x1e98
> +
> +#define PCIE_DVSEC_HEADER1_OFFSET 0x4 /* Offset from start of extend cap=
 */
> +#define PCIE_DVSEC_ID_OFFSET 0x8
> +
> +#define PCIE_CXL_DEVICE_DVSEC_LENGTH 0x38
> +#define PCIE_CXL1_DEVICE_DVSEC_REVID 0
> +#define PCIE_CXL2_DEVICE_DVSEC_REVID 1
> +
> +#define EXTENSIONS_PORT_DVSEC_LENGTH 0x28
> +#define EXTENSIONS_PORT_DVSEC_REVID 0
> +
> +#define GPF_PORT_DVSEC_LENGTH 0x10
> +#define GPF_PORT_DVSEC_REVID  0
> +
> +#define PCIE_FLEXBUS_PORT_DVSEC_LENGTH_2_0 0x14
> +#define PCIE_FLEXBUS_PORT_DVSEC_REVID_2_0  1
> +
> +#define REG_LOC_DVSEC_LENGTH 0x24
> +#define REG_LOC_DVSEC_REVID  0
> +
> +enum {
> +    PCIE_CXL_DEVICE_DVSEC      =3D 0,
> +    NON_CXL_FUNCTION_MAP_DVSEC =3D 2,
> +    EXTENSIONS_PORT_DVSEC      =3D 3,
> +    GPF_PORT_DVSEC             =3D 4,
> +    GPF_DEVICE_DVSEC           =3D 5,
> +    PCIE_FLEXBUS_PORT_DVSEC    =3D 7,
> +    REG_LOC_DVSEC              =3D 8,
> +    MLD_DVSEC                  =3D 9,
> +    CXL20_MAX_DVSEC
> +};
> +
> +struct dvsec_header {
> +    uint32_t cap_hdr;
> +    uint32_t dv_hdr1;
> +    uint16_t dv_hdr2;
> +} __attribute__((__packed__));
> +_Static_assert(sizeof(struct dvsec_header) =3D=3D 10,

Be consistent on decimal or hex for these checks. I don't really
care which but odd to mix and match.

> +               "dvsec header size incorrect");
> +
> +/*
> + * CXL 2.0 devices must implement certain DVSEC IDs, and can [optionally]
> + * implement others.
> + *
> + * CXL 2.0 Device: 0, [2], 5, 8
> + * CXL 2.0 RP: 3, 4, 7, 8
> + * CXL 2.0 Upstream Port: [2], 7, 8
> + * CXL 2.0 Downstream Port: 3, 4, 7, 8
> + */
> +
> +/* CXL 2.0 - 8.1.5 (ID 0003) */
> +struct extensions_dvsec_port {
Probably want consistent naming (as can be done anyway) so
cxl_dvsec_port_extensions maybe?

> +    struct dvsec_header hdr;
> +    uint16_t status;
> +    uint16_t control;
> +    uint8_t alt_bus_base;
> +    uint8_t alt_bus_limit;
> +    uint16_t alt_memory_base;
> +    uint16_t alt_memory_limit;
> +    uint16_t alt_prefetch_base;
> +    uint16_t alt_prefetch_limit;
> +    uint32_t alt_prefetch_base_high;
> +    uint32_t alt_prefetch_base_low;
> +    uint32_t rcrb_base;
> +    uint32_t rcrb_base_high;
> +};
> +_Static_assert(sizeof(struct extensions_dvsec_port) =3D=3D 0x28,
> +               "extensions dvsec port size incorrect");
> +#define PORT_CONTROL_OVERRIDE_OFFSET 0xc

What's this one?  Looks to just be the PORT_CONTROL_OFFSET
though admittedly the spec does refer to this as OVERRIDE_OFFSET in
one place.

> +#define PORT_CONTROL_UNMASK_SBR      1
> +#define PORT_CONTROL_ALT_MEMID_EN    4
> +
> +/* CXL 2.0 - 8.1.6 GPF DVSEC (ID 0004) */
> +struct dvsec_port_gpf {
> +    struct dvsec_header hdr;
> +    uint16_t rsvd;
> +    uint16_t phase1_ctrl;
> +    uint16_t phase2_ctrl;
> +};
> +_Static_assert(sizeof(struct dvsec_port_gpf) =3D=3D 0x10,
> +               "dvsec port GPF size incorrect");
> +
> +/* CXL 2.0 - 8.1.8/8.2.1.3 Flexbus DVSEC (ID 0007) */
> +struct dvsec_port_flexbus {
> +    struct dvsec_header hdr;
> +    uint16_t cap;
> +    uint16_t ctrl;
> +    uint16_t status;
> +    uint32_t rcvd_mod_ts_data;

Whilst it is wordy, I'd keep the full naming of that field.
rcvd_mod_ts_data_phase_1;=20

> +};
> +_Static_assert(sizeof(struct dvsec_port_flexbus) =3D=3D 0x14,
> +               "dvsec port flexbus size incorrect");
> +
> +/* CXL 2.0 - 8.1.9 Register Locator DVSEC (ID 0008) */
> +struct dvsec_register_locator {

I'd prefix these structures with cxl_ for all the normal
namespacing collision reasons.
Same for #defines


> +    struct dvsec_header hdr;
> +    uint16_t rsvd;
> +    uint32_t reg0_base_lo;
> +    uint32_t reg0_base_hi;
> +    uint32_t reg1_base_lo;
> +    uint32_t reg1_base_hi;
> +    uint32_t reg2_base_lo;
> +    uint32_t reg2_base_hi;
> +};
> +_Static_assert(sizeof(struct dvsec_register_locator) =3D=3D 0x24,
> +               "dvsec register locator size incorrect");
> +
> +/* BAR Equivalence Indicator */
> +#define BEI_BAR_10H 0
> +#define BEI_BAR_14H 1
> +#define BEI_BAR_18H 2
> +#define BEI_BAR_1cH 3
> +#define BEI_BAR_20H 4
> +#define BEI_BAR_24H 5
> +
> +/* Register Block Identifier */
> +#define RBI_EMPTY          0
> +#define RBI_COMPONENT_REG  (1 << 8)
> +#define RBI_BAR_VIRT_ACL   (2 << 8)
> +#define RBI_CXL_DEVICE_REG (3 << 8)
> +
> +#endif


