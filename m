Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEB4E7483
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 14:51:32 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXkLg-0003wO-FA
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 09:51:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nXkGi-0002PI-Ic
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:46:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nXkGe-00085D-Ju
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 09:46:20 -0400
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KQ3Gm4h8tz67NY6;
 Fri, 25 Mar 2022 21:44:16 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 25 Mar 2022 14:46:02 +0100
Received: from localhost (10.47.31.18) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 25 Mar
 2022 13:46:00 +0000
Date: Fri, 25 Mar 2022 13:45:55 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Be?=
 =?ISO-8859-1?Q?nn=E9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, 
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, 
 Dan Williams <dan.j.williams@intel.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v8 02/46] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20220325134555.000040ae@Huawei.com>
In-Reply-To: <20220318150635.24600-3-Jonathan.Cameron@huawei.com>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-3-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.31.18]
X-ClientProxiedBy: lhreml753-chm.china.huawei.com (10.201.108.203) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 18 Mar 2022 15:05:51 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> From: Ben Widawsky <ben.widawsky@intel.com>
>=20
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
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

As a heads up for anyone follow current state of this series...

Whilst wiring up more of the PCI config space elements
off these devices (for a future series, we don't need
that to work yet) for kernel testing it's become clear
we are getting lots of
offsetof(struct cxl_dvsec_port_extensions, whatever)

so I'm going to switch to typdefs and CamelCase naming though
it gets a bit ugly for some of these as they are made up
of a string of acronyms and we get things like

CXLDVSECDeviceGPF

However I think that's still fairly readable.

Thanks,

Jonathan

> ---
>  hw/Kconfig                     |   1 +
>  hw/cxl/Kconfig                 |   3 +
>  hw/cxl/cxl-component-utils.c   | 219 +++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build             |   4 +
>  hw/meson.build                 |   1 +
>  include/hw/cxl/cxl.h           |  16 +++
>  include/hw/cxl/cxl_component.h | 197 +++++++++++++++++++++++++++++
>  include/hw/cxl/cxl_pci.h       | 135 ++++++++++++++++++++
>  8 files changed, 576 insertions(+)
>=20
> diff --git a/hw/Kconfig b/hw/Kconfig
> index ad20cce0a9..50e0952889 100644
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
> index 0000000000..410f8ef328
> --- /dev/null
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -0,0 +1,219 @@
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
> +    if (size =3D=3D 8) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "CXL 8 byte cache mem registers not implemented\n"=
);
> +        return 0;
> +    }
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
> +    if (size =3D=3D 8) {
> +        qemu_log_mask(LOG_UNIMP,
> +                      "CXL 8 byte cache mem registers not implemented\n"=
);
> +        return;
> +    }
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
> +        .max_access_size =3D 8,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 8,
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
> +    reg_state[R_CXL_RAS_UNC_ERR_MASK] =3D 0x1cfff;
> +    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] =3D 0x1cfff;
> +    reg_state[R_CXL_RAS_COR_ERR_STATUS] =3D 0;
> +    reg_state[R_CXL_RAS_COR_ERR_MASK] =3D 0x3f;
> +
> +    /* CXL switches and devices must set */
> +    reg_state[R_CXL_RAS_ERR_CAP_CTRL] =3D 0;
> +}
> +
> +static void hdm_init_common(uint32_t *reg_state)
> +{
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, DECODER_COUN=
T, 0);
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT=
, 1);
> +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_GLOBAL_CONTROL,
> +                     HDM_DECODER_ENABLE, 0);
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
> +    memset(reg_state, 0, CXL2_COMPONENT_CM_REGION_SIZE);
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
> +    QEMU_BUILD_BUG_ON(CXL_##reg##_REGISTERS_OFFSET =3D=3D 0);           =
          \
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
> index 0000000000..3231b5de1e
> --- /dev/null
> +++ b/hw/cxl/meson.build
> @@ -0,0 +1,4 @@
> +softmmu_ss.add(when: 'CONFIG_CXL',
> +               if_true: files(
> +                   'cxl-component-utils.c',
> +               ))
> diff --git a/hw/meson.build b/hw/meson.build
> index b3366c888e..9992c5101e 100644
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
> index 0000000000..8c738c7a2b
> --- /dev/null
> +++ b/include/hw/cxl/cxl.h
> @@ -0,0 +1,16 @@
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
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_componen=
t.h
> new file mode 100644
> index 0000000000..74e9bfe1ff
> --- /dev/null
> +++ b/include/hw/cxl/cxl_component.h
> @@ -0,0 +1,197 @@
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
> +#include "qemu/compiler.h"
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
> +
> +/* Give ample space for caps before this */
> +#define CXL_RAS_REGISTERS_OFFSET 0x80
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
> +#define CXL_SEC_REGISTERS_OFFSET \
> +    (CXL_RAS_REGISTERS_OFFSET + CXL_RAS_REGISTERS_SIZE)
> +#define CXL_SEC_REGISTERS_SIZE   0 /* We don't implement 1.1 downstream =
ports */
> +
> +/* 8.2.5.11 - CXL Link Capability Structure */
> +#define CXL_LINK_REGISTERS_OFFSET \
> +    (CXL_SEC_REGISTERS_OFFSET + CXL_SEC_REGISTERS_SIZE)
> +#define CXL_LINK_REGISTERS_SIZE   0x38
> +
> +/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
> +#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
> +#define CXL_HDM_REGISTERS_OFFSET \
> +    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE)
> +#define CXL_HDM_REGISTERS_SIZE (0x20 + HDM_DECODE_MAX + 10)
> +#define HDM_DECODER_INIT(n)                                             =
       \
> +  REG32(CXL_HDM_DECODER##n##_BASE_LO,                                   =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x10)                   =
       \
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
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, ERR, 11, 1)                =
       \
> +            FIELD(CXL_HDM_DECODER##n##_CTRL, TYPE, 12, 1)               =
       \
> +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_LO,                            =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x24)                   =
       \
> +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_HI,                            =
       \
> +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x28)
> +
> +REG32(CXL_HDM_DECODER_CAPABILITY, CXL_HDM_REGISTERS_OFFSET)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0, 4)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 4, 4)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 8, 1)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTELEAVE_4K, 9, 1)
> +    FIELD(CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 10, 1)
> +REG32(CXL_HDM_DECODER_GLOBAL_CONTROL, CXL_HDM_REGISTERS_OFFSET + 4)
> +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, POISON_ON_ERR_EN, 0, 1)
> +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 1, 1)
> +
> +HDM_DECODER_INIT(0);
> +
> +/* 8.2.5.13 - CXL Extended Security Capability Structure (Root complex o=
nly) */
> +#define EXTSEC_ENTRY_MAX        256
> +#define CXL_EXTSEC_REGISTERS_OFFSET \
> +    (CXL_HDM_REGISTERS_OFFSET + CXL_HDM_REGISTERS_SIZE)
> +#define CXL_EXTSEC_REGISTERS_SIZE   (8 * EXTSEC_ENTRY_MAX + 4)
> +
> +/* 8.2.5.14 - CXL IDE Capability Structure */
> +#define CXL_IDE_REGISTERS_OFFSET \
> +    (CXL_EXTSEC_REGISTERS_OFFSET + CXL_EXTSEC_REGISTERS_SIZE)
> +#define CXL_IDE_REGISTERS_SIZE   0x20
> +
> +/* 8.2.5.15 - CXL Snoop Filter Capability Structure */
> +#define CXL_SNOOP_REGISTERS_OFFSET \
> +    (CXL_IDE_REGISTERS_OFFSET + CXL_IDE_REGISTERS_SIZE)
> +#define CXL_SNOOP_REGISTERS_SIZE   0x8
> +
> +QEMU_BUILD_BUG_MSG((CXL_SNOOP_REGISTERS_OFFSET + CXL_SNOOP_REGISTERS_SIZ=
E) >=3D 0x1000,
> +                   "No space for registers");
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
> index 0000000000..810a244fab
> --- /dev/null
> +++ b/include/hw/cxl/cxl_pci.h
> @@ -0,0 +1,135 @@
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
> +#include "qemu/compiler.h"
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
> +} QEMU_PACKED;
> +QEMU_BUILD_BUG_ON(sizeof(struct dvsec_header) !=3D 10);
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
> +struct cxl_dvsec_port_extensions {
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
> +QEMU_BUILD_BUG_ON(sizeof(struct cxl_dvsec_port_extensions) !=3D 0x28);
> +
> +#define PORT_CONTROL_OFFSET          0xc
> +#define PORT_CONTROL_UNMASK_SBR      1
> +#define PORT_CONTROL_ALT_MEMID_EN    4
> +
> +/* CXL 2.0 - 8.1.6 GPF DVSEC (ID 0004) */
> +struct cxl_dvsec_port_gpf {
> +    struct dvsec_header hdr;
> +    uint16_t rsvd;
> +    uint16_t phase1_ctrl;
> +    uint16_t phase2_ctrl;
> +};
> +QEMU_BUILD_BUG_ON(sizeof(struct cxl_dvsec_port_gpf) !=3D 0x10);
> +
> +/* CXL 2.0 - 8.1.8/8.2.1.3 Flexbus DVSEC (ID 0007) */
> +struct cxl_dvsec_port_flexbus {
> +    struct dvsec_header hdr;
> +    uint16_t cap;
> +    uint16_t ctrl;
> +    uint16_t status;
> +    uint32_t rcvd_mod_ts_data_phase1;
> +};
> +QEMU_BUILD_BUG_ON(sizeof(struct cxl_dvsec_port_flexbus) !=3D 0x14);
> +
> +/* CXL 2.0 - 8.1.9 Register Locator DVSEC (ID 0008) */
> +struct cxl_dvsec_register_locator {
> +    struct dvsec_header hdr;
> +    uint16_t rsvd;
> +    uint32_t reg0_base_lo;
> +    uint32_t reg0_base_hi;
> +    uint32_t reg1_base_lo;
> +    uint32_t reg1_base_hi;
> +    uint32_t reg2_base_lo;
> +    uint32_t reg2_base_hi;
> +};
> +QEMU_BUILD_BUG_ON(sizeof(struct cxl_dvsec_register_locator) !=3D 0x24);
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


