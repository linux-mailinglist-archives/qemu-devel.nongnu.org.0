Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF33D30BE31
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:29:43 +0100 (CET)
Received: from localhost ([::1]:34592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uoQ-0003VK-Pu
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6ujd-0007dZ-1Q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:24:45 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6ujZ-00079e-W4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:24:44 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DVP3k1LV8z67jvS;
 Tue,  2 Feb 2021 20:18:26 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 2 Feb 2021 13:24:36 +0100
Received: from localhost (10.47.79.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 12:24:35 +0000
Date: Tue, 2 Feb 2021 12:23:50 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 04/31] hw/cxl/device: Implement the CAP array
 (8.2.8.1-2)
Message-ID: <20210202122350.000047f3@Huawei.com>
In-Reply-To: <20210202005948.241655-5-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-5-ben.widawsky@intel.com>
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

On Mon, 1 Feb 2021 16:59:21 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> This implements all device MMIO up to the first capability. That
> includes the CXL Device Capabilities Array Register, as well as all of
> the CXL Device Capability Header Registers. The latter are filled in as
> they are implemented in the following patches.
>=20
> Endianness and alignment are managed by softmmu memory core.
>=20
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
A few trivials
> ---
>  hw/cxl/cxl-device-utils.c   | 105 ++++++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build          |   1 +
>  include/hw/cxl/cxl_device.h |  27 +++++++++-
>  3 files changed, 132 insertions(+), 1 deletion(-)
>  create mode 100644 hw/cxl/cxl-device-utils.c
>=20
> diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
> new file mode 100644
> index 0000000000..bb15ad9a0f
> --- /dev/null
> +++ b/hw/cxl/cxl-device-utils.c
> @@ -0,0 +1,105 @@
> +/*
> + * CXL Utility library for devices
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
> +#include "hw/cxl/cxl.h"
> +
> +/*
> + * Device registers have no restrictions per the spec, and so fall back =
to the
> + * default memory mapped register rules in 8.2:
> + *   Software shall use CXL.io Memory Read and Write to access memory ma=
pped
> + *   register defined in this section. Unless otherwise specified, softw=
are
> + *   shall restrict the accesses width based on the following:
> + *   =E2=80=A2 A 32 bit register shall   be accessed as a 1 Byte, 2 Byte=
s or 4 Bytes

odd spacing

> + *     quantity.
> + *   =E2=80=A2 A 64 bit register shall be accessed as a 1 Byte, 2 Bytes,=
 4 Bytes or 8
> + *     Bytes
> + *   =E2=80=A2 The address shall be a multiple of the access width, e.g.=
 when
> + *     accessing a register as a 4 Byte quantity, the address shall be
> + *     multiple of 4.
> + *   =E2=80=A2 The accesses shall map to contiguous bytes.If these rules=
 are not
> + *     followed, the behavior is undefined
> + */
> +
> +static uint64_t caps_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    CXLDeviceState *cxl_dstate =3D opaque;
> +
> +    return cxl_dstate->caps_reg_state32[offset / 4];
> +}
> +
> +static uint64_t dev_reg_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static const MemoryRegionOps dev_ops =3D {
> +    .read =3D dev_reg_read,
> +    .write =3D NULL, /* status register is read only */
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +    },
> +};
> +
> +static const MemoryRegionOps caps_ops =3D {
> +    .read =3D caps_reg_read,
> +    .write =3D NULL, /* caps registers are read only */
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 1,
> +        .max_access_size =3D 8,
> +        .unaligned =3D false,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +};
> +
> +void cxl_device_register_block_init(Object *obj, CXLDeviceState *cxl_dst=
ate)
> +{
> +    /* This will be a BAR, so needs to be rounded up to pow2 for PCI spe=
c */
> +    memory_region_init(&cxl_dstate->device_registers, obj, "device-regis=
ters",
> +                       pow2ceil(CXL_MMIO_SIZE));
> +
> +    memory_region_init_io(&cxl_dstate->caps, obj, &caps_ops, cxl_dstate,
> +                          "cap-array", CXL_DEVICE_REGISTERS_OFFSET - 0);

Specifying a size in terms of the offset of another region isn't exactly=20
intuitive so perhaps a comment on why or better yet actually use a size
parameter covering what is there rather than simply the region below
the CXL_DEVICE_REGISTERS_OFFSET.


> +    memory_region_init_io(&cxl_dstate->device, obj, &dev_ops, cxl_dstate,
> +                          "device-status", CXL_DEVICE_REGISTERS_LENGTH);
> +
> +    memory_region_add_subregion(&cxl_dstate->device_registers, 0,
> +                                &cxl_dstate->caps);
> +    memory_region_add_subregion(&cxl_dstate->device_registers,
> +                                CXL_DEVICE_REGISTERS_OFFSET,
> +                                &cxl_dstate->device);
> +}
> +
> +static void device_reg_init_common(CXLDeviceState *cxl_dstate) { }
> +
> +void cxl_device_register_init_common(CXLDeviceState *cxl_dstate)
> +{
> +    uint32_t *cap_hdrs =3D cxl_dstate->caps_reg_state32;
> +    const int cap_count =3D 1;
> +
> +    /* CXL Device Capabilities Array Register */
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_ID, 0);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY, CAP_VERSION, 1);
> +    ARRAY_FIELD_DP32(cap_hdrs, CXL_DEV_CAP_ARRAY2, CAP_COUNT, cap_count);
> +
> +    cxl_device_cap_init(cxl_dstate, DEVICE, 1);
> +    device_reg_init_common(cxl_dstate);
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 00c3876a0f..47154d6850 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,3 +1,4 @@
>  softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
> +  'cxl-device-utils.c',
>  ))
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index a85f250503..f3bcf19410 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -58,6 +58,8 @@
>  #define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
>  #define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
>  #define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
> +#define CXL_CAPS_SIZE \
> +    (CXL_DEVICE_CAP_REG_SIZE * CXL_DEVICE_CAPS_MAX + 1) /* +1 for header=
 */
> =20
>  #define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
>  #define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
> @@ -70,11 +72,18 @@
>  #define CXL_MAILBOX_REGISTERS_LENGTH \
>      (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
> =20
> +#define CXL_MMIO_SIZE                                       \
> +    CXL_DEVICE_CAP_REG_SIZE + CXL_DEVICE_REGISTERS_LENGTH + \
> +        CXL_MAILBOX_REGISTERS_LENGTH
> +
>  typedef struct cxl_device_state {
>      MemoryRegion device_registers;
> =20
>      /* mmio for device capabilities array - 8.2.8.2 */
> -    MemoryRegion caps;
> +    struct {
> +        MemoryRegion caps;
> +        uint32_t caps_reg_state32[CXL_CAPS_SIZE / 4];
> +    };

With this unnamed,w hat is the benefit of having these two in a
struct?  The naming makes it clear they are related anyway.

> =20
>      /* mmio for the device status registers 8.2.8.3 */
>      MemoryRegion device;
> @@ -126,6 +135,22 @@ CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DE=
VICE_CAP_HDR1_OFFSET)
>  CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSE=
T + \
>                                                 CXL_DEVICE_CAP_REG_SIZE)
> =20
> +#define cxl_device_cap_init(dstate, reg, cap_id)                        =
           \
> +    do {                                                                =
           \
> +        uint32_t *cap_hdrs =3D dstate->caps_reg_state32;                =
             \
> +        int which =3D R_CXL_DEV_##reg##_CAP_HDR0;                       =
             \
> +        cap_hdrs[which] =3D                                             =
             \
> +            FIELD_DP32(cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_ID=
, cap_id); \
> +        cap_hdrs[which] =3D FIELD_DP32(                                 =
             \
> +            cap_hdrs[which], CXL_DEV_##reg##_CAP_HDR0, CAP_VERSION, 1); =
           \
> +        cap_hdrs[which + 1] =3D                                         =
             \
> +            FIELD_DP32(cap_hdrs[which + 1], CXL_DEV_##reg##_CAP_HDR1,   =
           \
> +                       CAP_OFFSET, CXL_##reg##_REGISTERS_OFFSET);       =
           \
> +        cap_hdrs[which + 2] =3D                                         =
             \
> +            FIELD_DP32(cap_hdrs[which + 2], CXL_DEV_##reg##_CAP_HDR2,   =
           \
> +                       CAP_LENGTH, CXL_##reg##_REGISTERS_LENGTH);       =
           \
> +    } while (0)
> +
>  REG32(CXL_DEV_MAILBOX_CAP, 0)
>      FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
>      FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)


