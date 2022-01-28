Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3AC49FCBF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:26:32 +0100 (CET)
Received: from localhost ([::1]:49198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDT8w-0002gS-VI
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSmS-0000vl-Hn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:03:16 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDSmN-00026W-Mm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:03:15 -0500
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JlgbQ5l8Hz67F8F;
 Fri, 28 Jan 2022 22:59:30 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 16:03:04 +0100
Received: from localhost (10.47.76.156) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 15:03:03 +0000
Date: Fri, 28 Jan 2022 15:02:54 +0000
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
Subject: Re: [PATCH v4 04/42] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20220128150254.000020e5@Huawei.com>
In-Reply-To: <87y232bc0f.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-5-Jonathan.Cameron@huawei.com>
 <87y232bc0f.fsf@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.76.156]
X-ClientProxiedBy: lhreml731-chm.china.huawei.com (10.201.108.82) To
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

On Wed, 26 Jan 2022 18:07:40 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > A CXL device is a type of CXL component. Conceptually, a CXL device
> > would be a leaf node in a CXL topology. From an emulation perspective,
> > CXL devices are the most complex and so the actual implementation is
> > reserved for discrete commits.
> >
> > This new device type is specifically catered towards the eventual
> > implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
> > specification.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  include/hw/cxl/cxl.h        |   1 +
> >  include/hw/cxl/cxl_device.h | 157 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 158 insertions(+)
> >
> > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > index 8c738c7a2b..b9d1ac3fad 100644
> > --- a/include/hw/cxl/cxl.h
> > +++ b/include/hw/cxl/cxl.h
> > @@ -12,5 +12,6 @@
> > =20
> >  #include "cxl_pci.h"
> >  #include "cxl_component.h"
> > +#include "cxl_device.h"
> > =20
> >  #endif
> > diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> > new file mode 100644
> > index 0000000000..3b6ed745f0
> > --- /dev/null
> > +++ b/include/hw/cxl/cxl_device.h
> > @@ -0,0 +1,157 @@
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
sters).
> > + *
> > + * This is roughly described in 8.2.8 Figure 138 of the CXL 2.0 spec.
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
> > + *                  0    +---------------------------------+
> > + *
> > + */ =20
>=20
> Excellent diagram ;-)
>=20
> > +
> > +#define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
> > +#define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
> > +#define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
> > +
> > +#define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
> > +#define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
> > +
> > +#define CXL_MAILBOX_REGISTERS_OFFSET \
> > +    (CXL_DEVICE_REGISTERS_OFFSET + CXL_DEVICE_REGISTERS_LENGTH)
> > +#define CXL_MAILBOX_REGISTERS_SIZE 0x20 /* 8.2.8.4, Figure 139 */
> > +#define CXL_MAILBOX_PAYLOAD_SHIFT 11
> > +#define CXL_MAILBOX_MAX_PAYLOAD_SIZE (1 << CXL_MAILBOX_PAYLOAD_SHIFT)
> > +#define CXL_MAILBOX_REGISTERS_LENGTH \
> > +    (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
> > +
> > +typedef struct cxl_device_state {
> > +    MemoryRegion device_registers;
> > +
> > +    /* mmio for device capabilities array - 8.2.8.2 */
> > +    MemoryRegion caps;
> > +
> > +    /* mmio for the device status registers 8.2.8.3 */
> > +    MemoryRegion device;
> > +
> > +    /* mmio for the mailbox registers 8.2.8.4 */
> > +    MemoryRegion mailbox;
> > +
> > +    /* memory region for persistent memory, HDM */
> > +    uint64_t pmem_size;
> > +} CXLDeviceState;
> > +
> > +/* Initialize the register block for a device */
> > +void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
> > +
> > +/* Set up default values for the register block */
> > +void cxl_device_register_init_common(CXLDeviceState *dev);
> > +
> > +/* CXL 2.0 - 8.2.8.1 */
> > +REG32(CXL_DEV_CAP_ARRAY, 0) /* 48b!?!?! */ =20
>=20
> What does this comment mean? A 48 bit register stuffed in a 32 bit one?
> Doesn't seem right.

ah. I'd forgotten about this.. !?!?! is code word for spec bug without
actually saying it in a public email...

It's fixed now in the published errata which makes this a 128bit
register but then says you can access it as a 64 bit register and reserves
everything above bit 48.  I'll update the comment and make it a REG64.

>=20
> > +    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
> > +    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
> > +REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
> > +    FIELD(CXL_DEV_CAP_ARRAY2, CAP_COUNT, 0, 16) =20
>=20
> I'm confused why you don't treat it as a single register it is in the
> spec.

Code predates introduction of REG64() and I'd missed that turning up.

>=20
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
> > + * Here we've chosen to make it 4 dwords. The spec allows any pow2 mul=
tiple
> > + * access to be used for a register (2 qwords, 8 words, 128 bytes).

The F4 errata covers this as well, making it clear that 128bit registers
can be accessed as 1,2,4,8 byte aligned reads.  No read advantage
of REG64 over REG32 as neither matches the spec, so I'll leave this one alo=
ne
but update the comment..

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
> > +
> > +REG32(CXL_DEV_MAILBOX_CAP, 0)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, BG_INT_CAP, 6, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CAP, MSI_N, 7, 4)
> > +
> > +REG32(CXL_DEV_MAILBOX_CTRL, 4)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, DOORBELL, 0, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
> > +    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)
> > +
> > +/* XXX: actually a 64b register */
> > +REG32(CXL_DEV_MAILBOX_STS, 0x10)
> > +    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
> > +    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
> > +    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
> > +
> > +/* XXX: actually a 64b register */
> > +REG32(CXL_DEV_BG_CMD_STS, 0x18)
> > +    FIELD(CXL_DEV_BG_CMD_STS, BG, 0, 16)
> > +    FIELD(CXL_DEV_BG_CMD_STS, DONE, 16, 7)
> > +    FIELD(CXL_DEV_BG_CMD_STS, ERRNO, 32, 16)
> > +    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_ERRNO, 48, 16) =20
>=20
> Again is there a reason not to use REG64? I can see the need to split
> 128 bit registers but not 64 bit ones.

Will do.

>=20
> > +
> > +REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
> > +
> > +#endif =20
>=20
> Otherwise:
>=20
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20


