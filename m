Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8749D1AA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:24:57 +0100 (CET)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmyX-0006AC-27
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:24:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmoB-0000zr-Dj
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:14:15 -0500
Received: from [2a00:1450:4864:20::42b] (port=37522
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmo9-0003Cd-At
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:14:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w11so509884wra.4
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZvgK+QZyvEmyj+Fvgogwj2AL6mx7jH4qhulJ7qAj6ek=;
 b=RIGuTtFIiPUyNgVsNjOvHCUzFqzp35njVHhWkktXeHeFPaEBhd3HyNDdKS8bzlxBLM
 LAJKTx6lsyVb7SbOrOHuQfRw8TJgEQclm1Tc8ZHyGM5fBup+H4wcitclaoX3AujEEcWg
 VqVVNI41yVl54fTa0XnhNyeND2oQusMt8H9i+7TW8Jyu8vkIwxOWMJGMJH1w23NNVQBg
 9omRtt8VQh5n9herSrwpuuug9rWobHj+y2lhaVtEPfiPIge44Uc2ymw3Kroa0pHL7MQ/
 ikf6VOvwAAzbh0pgzu1BpEcsTtErZfYWIAtl402ZJftjqsnVZOuTr35ctK0cPxfRXWE/
 5nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZvgK+QZyvEmyj+Fvgogwj2AL6mx7jH4qhulJ7qAj6ek=;
 b=dVDThjAebh6KzZWNUjO5nQOw7/mVDXhcGKAwazOnmVmi1aa97qaEH3FLC3g+uRB1JU
 LQiHmGPz4xIFgYWUJuMFFU2b9+aoC2lEkr+utHWJu4FrQjiViirAObibuvA9zdxuvb8o
 +ZS8IdyToCYXAtzIwT8HDvPvJyev7sMV+O9fRGWqWEvc4+c49RrCs+C0gzmbGIIDn+41
 7yHStFgm8/Clg+i2eO/WFFfMywn8S8wrrb8XoZWtjO7KhNofg8EWy6IbEWSzzItC+kjH
 qyjjllceT1vmHAVIf6EKLtU5tlWGa4jMDvyhaUx1S2X+LB3FrPCWx+Zzi9eHNyfYFaXz
 pyuw==
X-Gm-Message-State: AOAM533WmYGsA7UDdFRTvRd+zHN9m6qSxyrfpSXMVWQQEARZmkTnk220
 S7oc6yTECVEW8onglznLksXPtQ==
X-Google-Smtp-Source: ABdhPJwMfQjquNHwTOcO8VFQ4Dhxpdu9olsPZpYY6+9f3Oiz9lx1DkRiQET5sStDkIVAxLh3/3sbRQ==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr10833417wrc.583.1643220851518; 
 Wed, 26 Jan 2022 10:14:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m187sm3667998wme.25.2022.01.26.10.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 10:14:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A2311FFB7;
 Wed, 26 Jan 2022 18:14:08 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-5-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 04/42] hw/cxl/device: Introduce a CXL device (8.2.8)
Date: Wed, 26 Jan 2022 18:07:40 +0000
In-reply-to: <20220124171705.10432-5-Jonathan.Cameron@huawei.com>
Message-ID: <87y232bc0f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Ben Widawsky <ben.widawsky@intel.com>
>
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
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  include/hw/cxl/cxl.h        |   1 +
>  include/hw/cxl/cxl_device.h | 157 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 158 insertions(+)
>
> diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> index 8c738c7a2b..b9d1ac3fad 100644
> --- a/include/hw/cxl/cxl.h
> +++ b/include/hw/cxl/cxl.h
> @@ -12,5 +12,6 @@
>=20=20
>  #include "cxl_pci.h"
>  #include "cxl_component.h"
> +#include "cxl_device.h"
>=20=20
>  #endif
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> new file mode 100644
> index 0000000000..3b6ed745f0
> --- /dev/null
> +++ b/include/hw/cxl/cxl_device.h
> @@ -0,0 +1,157 @@
> +/*
> + * QEMU CXL Devices
> + *
> + * Copyright (c) 2020 Intel
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2. See =
the
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
> + * requirement from the spec is that the capabilities array and the capa=
bility
> + * headers start at offset 0 and are contiguously packed. The headers th=
emselves
> + * provide offsets to the register fields. For this emulation, registers=
 will
> + * start at offset 0x80 (m =3D=3D 0x80). No secondary mailbox is impleme=
nted which
> + * means that n =3D m + sizeof(mailbox registers) + sizeof(device regist=
ers).
> + *
> + * This is roughly described in 8.2.8 Figure 138 of the CXL 2.0 spec.
> + *
> + *                       +---------------------------------+
> + *                       |                                 |
> + *                       |    Memory Device Registers      |
> + *                       |                                 |
> + * n + PAYLOAD_SIZE_MAX  -----------------------------------
> + *                  ^    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |         Mailbox Payload         |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    -----------------------------------
> + *                  |    |       Mailbox Registers         |
> + *                  |    |                                 |
> + *                  n    -----------------------------------
> + *                  ^    |                                 |
> + *                  |    |        Device Registers         |
> + *                  |    |                                 |
> + *                  m    ---------------------------------->
> + *                  ^    |  Memory Device Capability Header|
> + *                  |    -----------------------------------
> + *                  |    |     Mailbox Capability Header   |
> + *                  |    -------------- --------------------
> + *                  |    |     Device Capability Header    |
> + *                  |    -----------------------------------
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                  |    |      Device Cap Array[0..n]     |
> + *                  |    |                                 |
> + *                  |    |                                 |
> + *                       |                                 |
> + *                  0    +---------------------------------+
> + *
> + */

Excellent diagram ;-)

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
> +#define CXL_MAILBOX_REGISTERS_SIZE 0x20 /* 8.2.8.4, Figure 139 */
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
> +    uint64_t pmem_size;
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

What does this comment mean? A 48 bit register stuffed in a 32 bit one?
Doesn't seem right.

> +    FIELD(CXL_DEV_CAP_ARRAY, CAP_ID, 0, 16)
> +    FIELD(CXL_DEV_CAP_ARRAY, CAP_VERSION, 16, 8)
> +REG32(CXL_DEV_CAP_ARRAY2, 4) /* We're going to pretend it's 64b */
> +    FIELD(CXL_DEV_CAP_ARRAY2, CAP_COUNT, 0, 16)

I'm confused why you don't treat it as a single register it is in the
spec.

> +
> +/*
> + * Helper macro to initialize capability headers for CXL devices.
> + *
> + * In the 8.2.8.2, this is listed as a 128b register, but in 8.2.8, it s=
ays:
> + * > No registers defined in Section 8.2.8 are larger than 64-bits wide =
so that
> + * > is the maximum access size allowed for these registers. If this rul=
e is not
> + * > followed, the behavior is undefined
> + *
> + * Here we've chosen to make it 4 dwords. The spec allows any pow2 multi=
ple
> + * access to be used for a register (2 qwords, 8 words, 128 bytes).
> + */
> +#define CXL_DEVICE_CAPABILITY_HEADER_REGISTER(n, offset)  \
> +    REG32(CXL_DEV_##n##_CAP_HDR0, offset)                 \
> +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_ID, 0, 16)      \
> +        FIELD(CXL_DEV_##n##_CAP_HDR0, CAP_VERSION, 16, 8) \
> +    REG32(CXL_DEV_##n##_CAP_HDR1, offset + 4)             \
> +        FIELD(CXL_DEV_##n##_CAP_HDR1, CAP_OFFSET, 0, 32)  \
> +    REG32(CXL_DEV_##n##_CAP_HDR2, offset + 8)             \
> +        FIELD(CXL_DEV_##n##_CAP_HDR2, CAP_LENGTH, 0, 32)
> +
> +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(DEVICE, CXL_DEVICE_CAP_HDR1_OFFSET)
> +CXL_DEVICE_CAPABILITY_HEADER_REGISTER(MAILBOX, CXL_DEVICE_CAP_HDR1_OFFSE=
T + \
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

Again is there a reason not to use REG64? I can see the need to split
128 bit registers but not 64 bit ones.

> +
> +REG32(CXL_DEV_CMD_PAYLOAD, 0x20)
> +
> +#endif

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

