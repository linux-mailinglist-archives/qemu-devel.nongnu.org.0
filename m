Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940D3190C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:18:29 +0100 (CET)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFbo-0003UY-JL
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lAFTe-000788-8U
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:10:02 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lAFTb-0000sQ-Go
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:10:01 -0500
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Dc2y43pbmz67lsC;
 Fri, 12 Feb 2021 01:03:08 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Feb 2021 18:09:47 +0100
Received: from localhost (10.47.31.44) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Thu, 11 Feb
 2021 17:09:46 +0000
Date: Thu, 11 Feb 2021 17:08:45 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 02/31] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20210211170845.0000451d@Huawei.com>
In-Reply-To: <20210202005948.241655-3-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-3-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.31.44]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
A few additions to previous comments.

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

The exciting exception to this is the RAS header log which is
defined as 512 bits.  Will seek clarification but I think the spec should
probably say that is a set of 32 bit registers.

A bunch of the other elements that we probably want to block in plausible
values for also seem to use 64 bit registers.

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

..
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

Seems like this would be cleaner using ARRAY_FIELD_DP32 as you did for the =
header.

    #define init_cap_reg(reg, id, version)                                 =
       \
        _Static_assert(CXL_##reg##_REGISTERS_OFFSET !=3D 0, "Invalid cap of=
fset\n");\
        do {                                                               =
     \
            ARRAY_FIELD_DP32(reg_state, CXL_##reg##_CAPABILITY_HEADER, ID, =
id); \
            ARRAY_FIELD_DP32(reg_state, CXL_##reg##_CAPABILITY_HEADER,     =
     \
                             VERSION, version);                            =
     \
            ARRAY_FIELD_DP32(reg_state, CXL_##reg##_CAPABILITY_HEADER,     =
     \
                             PTR, CXL_##reg##_REGISTRS_OFFSET);            =
     \
	} while (0)
I think gives the same result.

> +
> +    init_cap_reg(RAS, 2, 1);
> +    ras_init_common(reg_state);
> +
> +    init_cap_reg(LINK, 4, 2);

Feels like we'll want to block some values for the rest of these to at least
ensure whatever is read isn't crazy.

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
...


