Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCCB4ECB12
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:51:43 +0200 (CEST)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcTu-0004um-5V
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:51:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZcRH-0003MC-1C
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:48:59 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nZcRD-0001ub-LL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:48:58 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KTDQz0qDdz67xbc;
 Thu, 31 Mar 2022 01:47:23 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 30 Mar 2022 19:48:50 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 30 Mar
 2022 18:48:49 +0100
Date: Wed, 30 Mar 2022 18:48:48 +0100
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
Subject: Re: [PATCH v8 04/46] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20220330184848.000027f7@huawei.com>
In-Reply-To: <20220329181353.GA59203@bgt-140510-bm01>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
 <20220318150635.24600-5-Jonathan.Cameron@huawei.com>
 <CGME20220329181401uscas1p2b229afdbb479a012e140f84367c35ccd@uscas1p2.samsung.com>
 <20220329181353.GA59203@bgt-140510-bm01>
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

On Tue, 29 Mar 2022 18:13:59 +0000
Adam Manzanares <a.manzanares@samsung.com> wrote:

> On Fri, Mar 18, 2022 at 03:05:53PM +0000, Jonathan Cameron wrote:
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >=20
> > A CXL device is a type of CXL component. Conceptually, a CXL device
> > would be a leaf node in a CXL topology. From an emulation perspective,
> > CXL devices are the most complex and so the actual implementation is
> > reserved for discrete commits.
> >=20
> > This new device type is specifically catered towards the eventual
> > implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
> > specification.
> >=20
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>

...

> > diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> > new file mode 100644
> > index 0000000000..b2416e45bf
> > --- /dev/null
> > +++ b/include/hw/cxl/cxl_device.h
> > @@ -0,0 +1,165 @@
> > +/*
> > + * QEMU CXL Devices
> > + *
> > + * Copyright (c) 2020 Intel
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2. Se=
e the
> > + * COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef CXL_DEVICE_H
> > +#define CXL_DEVICE_H
> > +
> > +#include "hw/register.h"
> > +
> > +/*
> > + * The following is how a CXL device's MMIO space is laid out. The only
> > + * requirement from the spec is that the capabilities array and the ca=
pability
> > + * headers start at offset 0 and are contiguously packed. The headers =
themselves
> > + * provide offsets to the register fields. For this emulation, registe=
rs will
> > + * start at offset 0x80 (m =3D=3D 0x80). No secondary mailbox is imple=
mented which
> > + * means that n =3D m + sizeof(mailbox registers) + sizeof(device regi=
sters). =20
>=20
> What is n here, the start offset of the mailbox registers, this question =
is=20
> based on the figure below?

I'll expand on this to say

means that the offset of the start of the mailbox payload (n) is given by
n =3D m + sizeof....

Which means the diagram below is wrong as should align with top
of mailbox registers.

>=20
> > + *
> > + * This is roughly described in 8.2.8 Figure 138 of the CXL 2.0 spec
I'm going drop this comment as that figure appears unrelated to me.

> > + *
> > + *                       +---------------------------------+
> > + *                       |                                 |
> > + *                       |    Memory Device Registers      |
> > + *                       |                                 |
> > + * n + PAYLOAD_SIZE_MAX  -----------------------------------
> > + *                  ^    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |         Mailbox Payload         |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    -----------------------------------
> > + *                  |    |       Mailbox Registers         |
> > + *                  |    |                                 |
> > + *                  n    -----------------------------------
> > + *                  ^    |                                 |
> > + *                  |    |        Device Registers         |
> > + *                  |    |                                 |
> > + *                  m    ---------------------------------->
> > + *                  ^    |  Memory Device Capability Header|
> > + *                  |    -----------------------------------
> > + *                  |    |     Mailbox Capability Header   |
> > + *                  |    -------------- --------------------
> > + *                  |    |     Device Capability Header    |
> > + *                  |    -----------------------------------
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                  |    |      Device Cap Array[0..n]     |
> > + *                  |    |                                 |
> > + *                  |    |                                 |
> > + *                       |                                 |
> > + *                  0    +---------------------------------+ =20
>=20
> Would it make sense to add CXL cap header register to the diagram?

Too many similar names in the CXL spec. I'm not sure which one you mean,
could you let me have a reference?  If you mean the one that is
at the start of the CXL.cache and CXL.mem registers that whole region
isn't covered by this diagram and might be in a different BAR.
Here we are only dealing with the Memory Device Registers.  I'll
add statement to the initial comment block to make that clear
as it definitely isn't currently!

> n also=20
> seems to be the size of the cap array, but it is also an offset so that c=
ould
> be clarified.

Ah. Letter reuse. good point. Looking more closely it isn't an array anyway
in the diagram (the array would have to include the Device Capability Header
and Mailbox Capability headers.  Renamed as simply Device Cap Array Register

>=20
> > + *
> > + */
> > +
> > +#define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
> > +#define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
> > +#define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
> > +
> > +#define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */ =20
>=20
> Is this to plan for future capabilities? If we have CAPS MAX doesn't this=
=20
> allow us to remove the slack space.=20
>=20
> > +#define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */ =20
>=20
> Should we add status to the name here, or would it get too long?
>=20
> > +
> > +#define CXL_MAILBOX_REGISTERS_OFFSET \
> > +    (CXL_DEVICE_REGISTERS_OFFSET + CXL_DEVICE_REGISTERS_LENGTH)
> > +#define CXL_MAILBOX_REGISTERS_SIZE 0x20 /* 8.2.8.4, Figure 139 */
> > +#define CXL_MAILBOX_PAYLOAD_SHIFT 11 =20
>=20
> I see 20 in the spec.

It's an implementation choice between 8 and 20. For now, this code goes
with 11 for no particularly strong reason.

>=20
> > +#define CXL_MAILBOX_MAX_PAYLOAD_SIZE (1 << CXL_MAILBOX_PAYLOAD_SHIFT)
> > +#define CXL_MAILBOX_REGISTERS_LENGTH \
> > +    (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
> > +
> > +typedef struct cxl_device_state {
> > +    MemoryRegion device_registers;
> > +
> > +    /* mmio for device capabilities array - 8.2.8.2 */
> > +    MemoryRegion device;
> > +    MemoryRegion caps;
> > +
> > +    /* mmio for the mailbox registers 8.2.8.4 */
> > +    MemoryRegion mailbox;
> > +
> > +    /* memory region for persistent memory, HDM */
> > +    uint64_t pmem_size; =20
>=20
> Can we switch this to mem_size and drop the persistent comment? It is my=
=20
> understanding that HDM is independent of persistence.

Discussed in the other branch of this thread.  Short answer is we don't
support non persistent yet but it's on the todo list.  What exactly
that looks like is to be determined.  One aspect of that is there
isn't currently a software stack to test volatile memory.

>=20
> > +} CXLDeviceState;
> > +
> > +/* Initialize the register block for a device */
> > +void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
> > +
> > +/* Set up default values for the register block */
> > +void cxl_device_register_init_common(CXLDeviceState *dev);
> > +
> > +/*
> > + * CXL 2.0 - 8.2.8.1 including errata F4
> > + * Documented as a 128 bit register, but 64 bit accesses and the second
> > + * 64 bits are currently reserved.
> > + */
> > +REG64(CXL_DEV_CAP_ARRAY, 0) /* Documented as 128 bit register but 64 b=
yte accesses */
> > +    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
> > +    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
> > +    FIELD(CXL_DEV_CAP_ARRAY, CAP_COUNT, 32, 16)
> > +
> > +/*
> > + * Helper macro to initialize capability headers for CXL devices.
> > + *
> > + * In the 8.2.8.2, this is listed as a 128b register, but in 8.2.8, it=
 says:
> > + * > No registers defined in Section 8.2.8 are larger than 64-bits wid=
e so that
> > + * > is the maximum access size allowed for these registers. If this r=
ule is not
> > + * > followed, the behavior is undefined
> > + *
> > + * CXL 2.0 Errata F4 states futher that the layouts in the specificati=
on are
> > + * shown as greater than 128 bits, but implementations are expected to
> > + * use any size of access up to 64 bits.
> > + *
> > + * Here we've chosen to make it 4 dwords. The spec allows any pow2 mul=
tiple
> > + * access to be used for a register up to 64 bits.
> > + */
> > +#define CXL_DEVICE_CAPABILITY_HEADER_REGISTER(n, offset)  \
> > +    REG32(CXL_DEV_##n##_CAP_HDR0, offset)                 \
> > +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_ID, 0, 16)      \
> > +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_VERSION, 16, 8) \
> > +    REG32(CXL_DEV_##n##_CAP_HDR1, offset + 4)             \
> > +        FIELD(CXL_DEV_##n##_CAP_HDR1, CAP_OFFSET, 0, 32)  \
> > +    REG32(CXL_DEV_##n##_CAP_HDR2, offset + 8)             \
> > +        FIELD(CXL_DEV_##n##_CAP_HDR2, CAP_LENGTH, 0, 32)
> > +
> > +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFS=
ET)
> > +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFF=
SET + \
> > +                                               CXL_DEVICE_CAP_REG_SIZE)
> > + =20
>=20
> Fig139 for the following registers.
Added ref

>=20
> 8.2.8.4.3
Good idea. Added all these references.

> > +REG32(CXL_DEV_MAILBOX_CAP, 0)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, BG_INT_CAP, 6, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, MSI_N, 7, 4)
> > + =20
>=20
> 8.2.8.4.4=20
> > +REG32(CXL_DEV_MAILBOX_CTRL, 4)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, DOORBELL, 0, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
> > + =20
>=20
> 8.2.8.4.5 + 8.2.9
> > +REG64(CXL_DEV_MAILBOX_CMD, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND, 0, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, COMMAND_SET, 8, 8)
> > +    FIELD(CXL_DEV_MAILBOX_CMD, LENGTH, 16, 20)
> > + =20
>=20
> 8.2.8.4.6
> > +REG64(CXL_DEV_MAILBOX_STS, 0x10)
> > +    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
> > +    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
> > +    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
> > + =20
>=20
> 8.2.8.4.7
> > +REG64(CXL_DEV_BG_CMD_STS, 0x18)
> > +    FIELD(CXL_DEV_BG_CMD_STS, BG, 0, 16) =20
>=20
> Should we call this OP since it is implied that we are BG given the regis=
ter?
Sure. It's a better name than BG.
>=20
> > +    FIELD(CXL_DEV_BG_CMD_STS, DONE, 16, 7) =20
>=20
> NUM_DONE? since this is a percentage.
Let's be verbose as NUM_DONE still seems confusing to me.
PERCENTAGE_COMP

I hadn't really noticed these names as I don't think any of
them are used yet.

>=20
> > +    FIELD(CXL_DEV_BG_CMD_STS, ERRNO, 32, 16) =20
>=20
> Isn't this a RET_CODE since it is only valid if previous field is 100%

Changed

>=20
> > +    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_ERRNO, 48, 16) =20
>=20
> VENDOR_RET_CODE since the same rule for the previous field applies here.
Changed
>=20
> > +
> > +REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
> > +
> > +#endif
> > --=20
> > 2.32.0
> >=20
> >  =20
>=20
> +cc Dave, Klaus, Tong
> Other than the minor issues raised.
>=20
> Looks good.
>=20
> Reviewed by: Adam Manzanares <a.manzanares@samsung.com>

Btw I haven't accepted all changes, but have been picking up
your RB.  Shout if that's not fine with you.

Thanks.

Jonathan


