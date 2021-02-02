Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0864430BDB5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:08:36 +0100 (CET)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uTz-0007mi-3P
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6uQN-0005Jv-LS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:04:51 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1l6uQK-0006U8-Ld
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:04:51 -0500
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DVNcm3qYrz67jjQ;
 Tue,  2 Feb 2021 19:58:32 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Feb 2021 13:04:43 +0100
Received: from localhost (10.47.79.68) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 2 Feb 2021
 12:04:41 +0000
Date: Tue, 2 Feb 2021 12:03:57 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 03/31] hw/cxl/device: Introduce a CXL device (8.2.8)
Message-ID: <20210202120357.0000206a@Huawei.com>
In-Reply-To: <20210202005948.241655-4-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-4-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
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

On Mon, 1 Feb 2021 16:59:20 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> A CXL device is a type of CXL component. Conceptually, a CXL device
> would be a leaf node in a CXL topology. From an emulation perspective,
> CXL devices are the most complex and so the actual implementation is
> reserved for discrete commits.
> 
> This new device type is specifically catered towards the eventual
> implementation of a Type3 CXL.mem device, 8.2.8.5 in the CXL 2.0
> specification.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Really minor comments inline.

In the interests of avoiding giving myself a headache again
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  include/hw/cxl/cxl.h        |   1 +
>  include/hw/cxl/cxl_device.h | 155 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 include/hw/cxl/cxl_device.h
> 
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 55f6cc30a5..23f52c4cf9 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -12,6 +12,7 @@
>  
>  #include "cxl_pci.h"
>  #include "cxl_component.h"
> +#include "cxl_device.h"
>  
>  #endif
>  
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> new file mode 100644
> index 0000000000..a85f250503
> --- /dev/null
> +++ b/include/hw/cxl/cxl_device.h
> @@ -0,0 +1,155 @@
> +/*
> + * QEMU CXL Devices
> + *
> + * Copyright (c) 2020 Intel
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef CXL_DEVICE_H
> +#define CXL_DEVICE_H
> +
> +#include "hw/register.h"
> +
> +/*
> + * The following is how a CXL device's MMIO space is laid out. The only
> + * requirement from the spec is that the capabilities array and the capability
> + * headers start at offset 0 and are contiguously packed. The headers themselves
> + * provide offsets to the register fields. For this emulation, registers will
> + * start at offset 0x80 (m == 0x80). No secondary mailbox is implemented which
> + * means that n = m + sizeof(mailbox registers) + sizeof(device registers).
> + *
> + * This is roughly described in 8.2.8 Figure 138 of the CXL 2.0 spec.
> + *
> + * n + PAYLOAD_SIZE_MAX  +---------------------------------+
> + *                       |                                 |
> + *                  ^    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |         Command Payload         |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  n    +---------------------------------+
> + *                  ^    |                                 |
> + *                  |    |    Device Capability Registers  |
> + *                  |    |    x, mailbox, y                |
> + *                  |    |                                 |
> + *                  m    +---------------------------------+
> + *                  ^    |     Device Capability Header y  |
> + *                  |    +---------------------------------+
> + *                  |    | Device Capability Header Mailbox|
> + *                  |    +------------- --------------------
> + *                  |    |     Device Capability Header x  |
> + *                  |    +---------------------------------+
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |      Device Cap Array[0..n]     |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  0    +---------------------------------+
> + */
> +
> +#define CXL_DEVICE_CAP_HDR1_OFFSET 0x10 /* Figure 138 */
> +#define CXL_DEVICE_CAP_REG_SIZE 0x10 /* 8.2.8.2 */
> +#define CXL_DEVICE_CAPS_MAX 4 /* 8.2.8.2.1 + 8.2.8.5 */
> +
> +#define CXL_DEVICE_REGISTERS_OFFSET 0x80 /* Read comment above */
> +#define CXL_DEVICE_REGISTERS_LENGTH 0x8 /* 8.2.8.3.1 */
> +
> +#define CXL_MAILBOX_REGISTERS_OFFSET \
> +    (CXL_DEVICE_REGISTERS_OFFSET + CXL_DEVICE_REGISTERS_LENGTH)
> +#define CXL_MAILBOX_REGISTERS_SIZE 0x20

Perhaps a ref to 8.2.8.4 or Figure 139 here somewhere?
Thanks for all the refs by the way. They make checking this a lot quicker!

> +#define CXL_MAILBOX_PAYLOAD_SHIFT 11
> +#define CXL_MAILBOX_MAX_PAYLOAD_SIZE (1 << CXL_MAILBOX_PAYLOAD_SHIFT)
> +#define CXL_MAILBOX_REGISTERS_LENGTH \
> +    (CXL_MAILBOX_REGISTERS_SIZE + CXL_MAILBOX_MAX_PAYLOAD_SIZE)
> +
> +typedef struct cxl_device_state {
> +    MemoryRegion device_registers;
> +
> +    /* mmio for device capabilities array - 8.2.8.2 */
> +    MemoryRegion caps;
> +
> +    /* mmio for the device status registers 8.2.8.3 */
> +    MemoryRegion device;
> +
> +    /* mmio for the mailbox registers 8.2.8.4 */
> +    MemoryRegion mailbox;
> +
> +    /* memory region for persistent memory, HDM */
> +    MemoryRegion *pmem;
> +
> +    /* memory region for volatile  memory, HDM */
> +    MemoryRegion *vmem;
> +} CXLDeviceState;
> +
> +/* Initialize the register block for a device */
> +void cxl_device_register_block_init(Object *obj, CXLDeviceState *dev);
> +
> +/* Set up default values for the register block */
> +void cxl_device_register_init_common(CXLDeviceState *dev);
> +
> +/* CXL 2.0 - 8.2.8.1 */
> +REG32(CXL_DEV_CAP_ARRAY, 0) /* 48b!?!?! */

Also missing a reserved 64 bits to fill in below the device capability headers
which are offset by 0x10

> +    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
> +    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
> +REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
> +    FIELD(CXL_DEV_CAP_ARRAY2, CAP_COUNT, 0, 16)
> +
> +/*
> + * Helper macro to initialize capability headers for CXL devices.
> + *
> + * In the 8.2.8.2, this is listed as a 128b register, but in 8.2.8, it says:
> + * > No registers defined in Section 8.2.8 are larger than 64-bits wide so that
> + * > is the maximum access size allowed for these registers. If this rule is not
> + * > followed, the behavior is undefined
> + *
> + * Here we've chosen to make it 4 dwords. The spec allows any pow2 multiple
> + * access to be used for a register (2 qwords, 8 words, 128 bytes).
> + */
> +#define CXL_DEVICE_CAPABILITY_HEADER_REGISTER(n, offset)                            \
> +    REG32(CXL_DEV_##n##_CAP_HDR0, offset)                 \
> +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_ID, 0, 16)      \
> +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_VERSION, 16, 8) \
> +    REG32(CXL_DEV_##n##_CAP_HDR1, offset + 4)             \
> +        FIELD(CXL_DEV_##n##_CAP_HDR1, CAP_OFFSET, 0, 32)  \
> +    REG32(CXL_DEV_##n##_CAP_HDR2, offset + 8)             \
> +        FIELD(CXL_DEV_##n##_CAP_HDR2, CAP_LENGTH, 0, 32)
> +
> +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
> +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSET + \
> +                                               CXL_DEVICE_CAP_REG_SIZE)
> +
> +REG32(CXL_DEV_MAILBOX_CAP, 0)
> +    FIELD(CXL_DEV_MAILBOX_CAP, PAYLOAD_SIZE, 0, 5)
> +    FIELD(CXL_DEV_MAILBOX_CAP, INT_CAP, 5, 1)
> +    FIELD(CXL_DEV_MAILBOX_CAP, BG_INT_CAP, 6, 1)
> +    FIELD(CXL_DEV_MAILBOX_CAP, MSI_N, 7, 4)
> +
> +REG32(CXL_DEV_MAILBOX_CTRL, 4)
> +    FIELD(CXL_DEV_MAILBOX_CTRL, DOORBELL, 0, 1)
> +    FIELD(CXL_DEV_MAILBOX_CTRL, INT_EN, 1, 1)
> +    FIELD(CXL_DEV_MAILBOX_CTRL, BG_INT_EN, 2, 1)

Is it not worth defining the
CXL_DEV_MAILBOX_CMD register for completeness? off set 0x8

> +
> +/* XXX: actually a 64b register */
> +REG32(CXL_DEV_MAILBOX_STS, 0x10)
> +    FIELD(CXL_DEV_MAILBOX_STS, BG_OP, 0, 1)
> +    FIELD(CXL_DEV_MAILBOX_STS, ERRNO, 32, 16)
> +    FIELD(CXL_DEV_MAILBOX_STS, VENDOR_ERRNO, 48, 16)
> +
> +/* XXX: actually a 64b register */
> +REG32(CXL_DEV_BG_CMD_STS, 0x18)
> +    FIELD(CXL_DEV_BG_CMD_STS, BG, 0, 16)
> +    FIELD(CXL_DEV_BG_CMD_STS, DONE, 16, 7)
> +    FIELD(CXL_DEV_BG_CMD_STS, ERRNO, 32, 16)
> +    FIELD(CXL_DEV_BG_CMD_STS, VENDOR_ERRNO, 48, 16)
> +
> +REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
Probably want a comment for this one that it might be huge.

> +
> +#endif


