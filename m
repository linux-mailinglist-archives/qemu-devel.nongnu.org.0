Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505F44ECA22
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:57:09 +0200 (CEST)
Received: from localhost ([::1]:54388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbd5-0001tl-U8
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:57:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZbbR-0001CE-Dj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:55:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZbbN-0001U2-GM
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:55:24 -0400
Received: from fraeml705-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KTCDg4tGbz67wfM;
 Thu, 31 Mar 2022 00:53:23 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml705-chm.china.huawei.com (10.206.15.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 30 Mar 2022 18:55:16 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 17:55:15 +0100
Date: Wed, 30 Mar 2022 17:55:14 +0100
To: Adam Manzanares <a.manzanares@samsung.com>
CC: "linuxarm@huawei.com" <linuxarm@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, 
 Chris Browy <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, 
 Dan Williams <dan.j.williams@intel.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, "dave@stgolabs.net" <dave@stgolabs.net>,
 Tong Zhang <t.zhang2@samsung.com>, "k.jensen@samsung.com"
 <k.jensen@samsung.com>
Subject: Re: [PATCH v8 02/46] hw/cxl/component: Introduce CXL components
 (8.1.x, 8.2.5)
Message-ID: <20220330175514.00000377@huawei.com>
In-Reply-To: <20220328142835.GA51107@bgt-140510-bm01>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-3-Jonathan.Cameron@huawei.com>
 <CGME20220328142843uscas1p231d68ea82ce825a0366392def9906500@uscas1p2.samsung.com>
 <20220328142835.GA51107@bgt-140510-bm01>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Mon, 28 Mar 2022 14:28:41 +0000
Adam Manzanares <a.manzanares@samsung.com> wrote:

> On Fri, Mar 18, 2022 at 03:05:51PM +0000, Jonathan Cameron wrote:
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >=20
> > A CXL 2.0 component is any entity in the CXL topology. All components
> > have a analogous function in PCIe. Except for the CXL host bridge, all
> > have a PCIe config space that is accessible via the common PCIe
> > mechanisms. CXL components are enumerated via DVSEC fields in the
> > extended PCIe header space. CXL components will minimally implement some
> > subset of CXL.mem and CXL.cache registers defined in 8.2.5 of the CXL
> > 2.0 specification. Two headers and a utility library are introduced to
> > support the minimum functionality needed to enumerate components.
> >=20
> > The cxl_pci header manages bits associated with PCI, specifically the
> > DVSEC and related fields. The cxl_component.h variant has data
> > structures and APIs that are useful for drivers implementing any of the
> > CXL 2.0 components. The library takes care of making use of the DVSEC
> > bits and the CXL.[mem|cache] registers. Per spec, the registers are
> > little endian.
> >=20
> > None of the mechanisms required to enumerate a CXL capable hostbridge
> > are introduced at this point.
> >=20
> > Note that the CXL.mem and CXL.cache registers used are always 4B wide.
> > It's possible in the future that this constraint will not hold.
> >=20
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
> > ---
> >  hw/Kconfig                     |   1 +
> >  hw/cxl/Kconfig                 |   3 +
> >  hw/cxl/cxl-component-utils.c   | 219 +++++++++++++++++++++++++++++++++
> >  hw/cxl/meson.build             |   4 +
> >  hw/meson.build                 |   1 +
> >  include/hw/cxl/cxl.h           |  16 +++
> >  include/hw/cxl/cxl_component.h | 197 +++++++++++++++++++++++++++++
> >  include/hw/cxl/cxl_pci.h       | 135 ++++++++++++++++++++
> >  8 files changed, 576 insertions(+)
> >=20

...

> > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> > new file mode 100644
> > index 0000000000..410f8ef328
> > --- /dev/null
> > +++ b/hw/cxl/cxl-component-utils.c
> > @@ -0,0 +1,219 @@
> > +/*
> > + * CXL Utility library for components
> > + *
> > + * Copyright(C) 2020 Intel Corporation.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/pci/pci.h"
> > +#include "hw/cxl/cxl.h"
> > +
> > +static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
> > +                                       unsigned size)
> > +{
> > +    CXLComponentState *cxl_cstate =3D opaque;
> > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > +
> > +    if (size =3D=3D 8) { =20
>=20
> Is there a define that can be used instead of 8 for clarity?

I can't think of one that would be clearer than the number as we
just checking if it is 8.=20
>=20
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "CXL 8 byte cache mem registers not implemented\=
n");
> > +        return 0;
> > +    }
> > +
> > +    if (cregs->special_ops && cregs->special_ops->read) {
> > +        return cregs->special_ops->read(cxl_cstate, offset, size);
> > +    } else {
> > +        return cregs->cache_mem_registers[offset / 4]; =20
>=20
> I think this could benefit from a define as well.=20

For this one, we can use offset / sizeof(*cregs->cache_mem_registers)
Bit of a long line but clear that we are indexing into the array.

>=20
> > +    }
> > +}
> > +
> > +static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint6=
4_t value,
> > +                                    unsigned size)
> > +{
> > +    CXLComponentState *cxl_cstate =3D opaque;
> > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > +
> > +    if (size =3D=3D 8) {
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "CXL 8 byte cache mem registers not implemented\=
n");
> > +        return;
> > +    }
> > +    if (cregs->special_ops && cregs->special_ops->write) {
> > +        cregs->special_ops->write(cxl_cstate, offset, value, size);
> > +    } else {
> > +        cregs->cache_mem_registers[offset / 4] =3D value;
> > +    }
> > +} =20
>=20
> See comments for the read reg function they apply here as well.=20
>=20

...

> > +
> > +void cxl_component_register_block_init(Object *obj,
> > +                                       CXLComponentState *cxl_cstate,
> > +                                       const char *type)
> > +{
> > +    ComponentRegisters *cregs =3D &cxl_cstate->crb;
> > +
> > +    memory_region_init(&cregs->component_registers, obj, type,
> > +                       CXL2_COMPONENT_BLOCK_SIZE);
> > +
> > +    /* io registers controls link which we don't care about in QEMU */
> > +    memory_region_init_io(&cregs->io, obj, NULL, cregs, ".io",
> > +                          CXL2_COMPONENT_IO_REGION_SIZE);
> > +    memory_region_init_io(&cregs->cache_mem, obj, &cache_mem_ops, creg=
s,
> > +                          ".cache_mem", CXL2_COMPONENT_CM_REGION_SIZE);
> > +
> > +    memory_region_add_subregion(&cregs->component_registers, 0, &cregs=
->io);
> > +    memory_region_add_subregion(&cregs->component_registers,
> > +                                CXL2_COMPONENT_IO_REGION_SIZE,
> > +                                &cregs->cache_mem);
> > +}
> > +
> > +static void ras_init_common(uint32_t *reg_state)
> > +{
> > +    reg_state[R_CXL_RAS_UNC_ERR_STATUS] =3D 0;
> > +    reg_state[R_CXL_RAS_UNC_ERR_MASK] =3D 0x1cfff;
> > +    reg_state[R_CXL_RAS_UNC_ERR_SEVERITY] =3D 0x1cfff; =20
>=20
> Should we add a comment that bits 12-13, 17-31 are reserved for the two=20
> previous register states, with all other bits set to 1 by default?

Ok. This one is unusual enough that it's worth calling out he reserved
bits. I'm not sure it's worth stating defaults of other bits though as we w=
ill
need a lot of words to explain all the similar spaces.

>=20
> > +    reg_state[R_CXL_RAS_COR_ERR_STATUS] =3D 0;
> > +    reg_state[R_CXL_RAS_COR_ERR_MASK] =3D 0x3f; =20
>=20
> I think this is supposed to be 0x7f

Oops. Fixed now.

>=20
> > +
> > +    /* CXL switches and devices must set */
> > +    reg_state[R_CXL_RAS_ERR_CAP_CTRL] =3D 0;
> > +}
> > +
> > +static void hdm_init_common(uint32_t *reg_state)
> > +{
> > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, DECODER_CO=
UNT, 0);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COU=
NT, 1);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_GLOBAL_CONTROL,
> > +                     HDM_DECODER_ENABLE, 0);
> > +}
> > +
> > +void cxl_component_register_init_common(uint32_t *reg_state, enum reg_=
type type)
> > +{
> > +    int caps =3D 0;
> > +    switch (type) {
> > +    case CXL2_DOWNSTREAM_PORT:
> > +    case CXL2_DEVICE:
> > +        /* CAP, RAS, Link */ =20
>=20
> Minor nit, could move the CAP comment above the switch statement and prov=
ide
> a bit more info. Something like CAP HEADER ARRAY SIZE INITITALIZATION?

This is weird enough (and kind of relies on a coincidence) that I agree more
commentary is needed.  I've introduced it with the following above the swit=
ch (type).

    /*
     * In CXL 2.0 the capabilities required for each CXL component are such=
 that,
     * with the ordering chosen here, a single number can be used to define
     * which capabilities should be provided.
     */

and dropped CAP from this first comment.

>=20
> > +        caps =3D 2;
> > +        break;
> > +    case CXL2_UPSTREAM_PORT:
> > +    case CXL2_TYPE3_DEVICE:
> > +    case CXL2_LOGICAL_DEVICE:
> > +        /* + HDM */
> > +        caps =3D 3;
> > +        break;
> > +    case CXL2_ROOT_PORT:
> > +        /* + Extended Security, + Snoop */
> > +        caps =3D 5;
> > +        break;
> > +    default:
> > +        abort();
> > +    }
> > +
> > +    memset(reg_state, 0, CXL2_COMPONENT_CM_REGION_SIZE);
> > +
> > +    /* CXL Capability Header Register */
> > +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ID, 1);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, VERSION, 1);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, CACHE_MEM_VERSI=
ON, 1);
> > +    ARRAY_FIELD_DP32(reg_state, CXL_CAPABILITY_HEADER, ARRAY_SIZE, cap=
s);
> > +
> > +
> > +#define init_cap_reg(reg, id, version)                                =
        \
> > +    QEMU_BUILD_BUG_ON(CXL_##reg##_REGISTERS_OFFSET =3D=3D 0);         =
            \
> > +    do {                                                              =
        \
> > +        int which =3D R_CXL_##reg##_CAPABILITY_HEADER;                =
          \
> > +        reg_state[which] =3D FIELD_DP32(reg_state[which],             =
          \
> > +                                      CXL_##reg##_CAPABILITY_HEADER, I=
D, id); \
> > +        reg_state[which] =3D                                          =
          \
> > +            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER=
,       \
> > +                       VERSION, version);                             =
        \
> > +        reg_state[which] =3D                                          =
          \
> > +            FIELD_DP32(reg_state[which], CXL_##reg##_CAPABILITY_HEADER=
, PTR,  \
> > +                       CXL_##reg##_REGISTERS_OFFSET);                 =
        \
> > +    } while (0)
> > +
> > +    init_cap_reg(RAS, 2, 1); =20
>=20
> Is the version of the RAS cap header supposed to be 1 here?

Ah CXL 2.0 has this as version 2.  Good spot.

>=20
> > +    ras_init_common(reg_state);
> > +
> > +    init_cap_reg(LINK, 4, 2);
> > +
> > +    if (caps < 3) {
> > +        return;
> > +    }
> > +
> > +    init_cap_reg(HDM, 5, 1);
> > +    hdm_init_common(reg_state);
> > +
> > +    if (caps < 5) {
> > +        return;
> > +    }
> > +
> > +    init_cap_reg(EXTSEC, 6, 1);
> > +    init_cap_reg(SNOOP, 8, 1);
> > +
> > +#undef init_cap_reg
> > +}

...


> > diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_compon=
ent.h
> > new file mode 100644
> > index 0000000000..74e9bfe1ff
> > --- /dev/null
> > +++ b/include/hw/cxl/cxl_component.h
> > @@ -0,0 +1,197 @@

...

> > +/* 8.2.5.12 - CXL HDM Decoder Capability Structure */
> > +#define HDM_DECODE_MAX 10 /* 8.2.5.12.1 */
> > +#define CXL_HDM_REGISTERS_OFFSET \
> > +    (CXL_LINK_REGISTERS_OFFSET + CXL_LINK_REGISTERS_SIZE)
> > +#define CXL_HDM_REGISTERS_SIZE (0x20 + HDM_DECODE_MAX + 10) =20
>=20
> Do we need to multiply HDM_DECODE_MAX here, I am under the impression tha=
t=20
> HDM_DECODE_MAX represents the number of decoders and we need register spa=
ce
> for each of the possible decoders.

Indeed curious.  We don't currently hit this because the code
only enables a single HDM decoder so far.=20

It should be
0x10 + 0x20 * HDM_DECODE_MAX  assuming intent is to leave space for up to 1=
0.

Previously the last few bytes would have spilled into the next cap. As those
are either DPA skip which isn't implemented yet or the top of the target
list (which I never hit as only did 4 way at most at a given decoder).

>=20
> > +#define HDM_DECODER_INIT(n)                                           =
         \
> > +  REG32(CXL_HDM_DECODER##n##_BASE_LO,                                 =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x10)                 =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_BASE_LO, L, 28, 4)             =
         \
> > +  REG32(CXL_HDM_DECODER##n##_BASE_HI,                                 =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x14)                 =
         \
> > +  REG32(CXL_HDM_DECODER##n##_SIZE_LO,                                 =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x18)                 =
         \
> > +  REG32(CXL_HDM_DECODER##n##_SIZE_HI,                                 =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x1C)                 =
         \
> > +  REG32(CXL_HDM_DECODER##n##_CTRL,                                    =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x20)                 =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, IG, 0, 4)                =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, IW, 4, 4)                =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, LOCK_ON_COMMIT, 8, 1)    =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMIT, 9, 1)            =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, COMMITTED, 10, 1)        =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, ERR, 11, 1)              =
         \
> > +            FIELD(CXL_HDM_DECODER##n##_CTRL, TYPE, 12, 1)             =
         \
> > +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_LO,                          =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x24)                 =
         \
> > +  REG32(CXL_HDM_DECODER##n##_TARGET_LIST_HI,                          =
         \
> > +        CXL_HDM_REGISTERS_OFFSET + (0x20 * n) + 0x28)
> > +
> > +REG32(CXL_HDM_DECODER_CAPABILITY, CXL_HDM_REGISTERS_OFFSET)
> > +    FIELD(CXL_HDM_DECODER_CAPABILITY, DECODER_COUNT, 0, 4)
> > +    FIELD(CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 4, 4)
> > +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTERLEAVE_256B, 8, 1)
> > +    FIELD(CXL_HDM_DECODER_CAPABILITY, INTELEAVE_4K, 9, 1)
> > +    FIELD(CXL_HDM_DECODER_CAPABILITY, POISON_ON_ERR_CAP, 10, 1)
> > +REG32(CXL_HDM_DECODER_GLOBAL_CONTROL, CXL_HDM_REGISTERS_OFFSET + 4)
> > +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, POISON_ON_ERR_EN, 0, 1)
> > +    FIELD(CXL_HDM_DECODER_GLOBAL_CONTROL, HDM_DECODER_ENABLE, 1, 1)
> > +
> > +HDM_DECODER_INIT(0);
> > +

...


> > diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
> > new file mode 100644
> > index 0000000000..810a244fab
> > --- /dev/null
> > +++ b/include/hw/cxl/cxl_pci.h

...

> > +
> > +/* CXL 2.0 - 8.1.5 (ID 0003) */
> > +struct cxl_dvsec_port_extensions {
> > +    struct dvsec_header hdr;
> > +    uint16_t status;
> > +    uint16_t control;
> > +    uint8_t alt_bus_base;
> > +    uint8_t alt_bus_limit;
> > +    uint16_t alt_memory_base;
> > +    uint16_t alt_memory_limit;
> > +    uint16_t alt_prefetch_base;
> > +    uint16_t alt_prefetch_limit;
> > +    uint32_t alt_prefetch_base_high;
> > +    uint32_t alt_prefetch_base_low; =20
>=20
> Limit high?
>=20

Good spot. Fixed. (this one turned up when I enabled the write masks
for these registers, but I'd failed to push it down into this patch).
 =20
>=20
> +cc (Klaus, Dave, Tong)
>=20
> Other than the minor cleanups/nits.
> Looks good.
>=20
> Reviewed by: Adam Manzanares <a.manzanares@samsung.com>

Thanks for taking such a close look!

Jonathan

