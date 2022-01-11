Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA948A8F8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 08:55:01 +0100 (CET)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Bzg-0003ot-EW
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 02:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7BtY-0000KQ-Ng; Tue, 11 Jan 2022 02:48:42 -0500
Received: from [2607:f8b0:4864:20::235] (port=38443
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7BtR-0004ze-DA; Tue, 11 Jan 2022 02:48:40 -0500
Received: by mail-oi1-x235.google.com with SMTP id g205so67513oif.5;
 Mon, 10 Jan 2022 23:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QqLWPUFMbgEdo3Ow6cnnUQf0N2XilSd5WN9sLuAvVg0=;
 b=NelHmOBHuJtIlizZX89QHPStB1XZR97wbniavZHT7ekcF4IC6yJeYvxiuIKRMReZk3
 Cu4R7PCeubjYTu7jpMFRG2L2zwv/XwIgVOgv7XHCjej8r8x1yR1ZGdCytNj3GHJj5LRx
 F09kppn0HAzI8LCI9xwm+WbI2AMIc6Uma/sZCPD40HOvSQHL/K7taXx9Qe6LmcyRkXVN
 N6P1Xr75i39mHpy8i8QRhsqK5rBbPqpd92XtLj0V0oeSNz/i0ayw9VB1VVXihBbJIhSk
 VUhivYsCcvVoHu3j7HM+ccuGgPqLbsTc+1lLjKJPCir1Bc991uWxjcKOrB6P6nt9oEaq
 FPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QqLWPUFMbgEdo3Ow6cnnUQf0N2XilSd5WN9sLuAvVg0=;
 b=VlSMAsNCpWeRzcRG7cejhaQylC62+PVG7yT4UA4uEARzSCa2Fs9cqXX351b1xKR90R
 2H2BhJFdUR5v1tfxarpe9RDAjJahpvuOIFuItPwhWg2KTQ0Fe4QjupZ8Ti7Cp6R+KlnR
 HFrb8pu6sBiLY3BgWUVJOmKNj0//iJ8Hy0ZS1lalqGdSch99/25iKNOv2CIKLU+oAuvY
 UasbY2d8/tRt4ujw/AS9limjvrYJDM8sqzSiCDHtfrEQxVoKCWnZQEF0dLMrj/fMyp9I
 ok1OOkWgLzYCNzURVlQDesZcmP11Op3RcxVd4WDOS5lO5KlTdMfIn2r+8uZbqLlAMlvO
 xxGw==
X-Gm-Message-State: AOAM530qYygsgM7OgHJDOb3PYHUBjUDMxSmXw6oyOqvq1Eplu9odC/e6
 uRIpBWrl1bStFnMiL5/NuuP2aPGiHIGBlRaksfW+rXGXYjL5sw==
X-Google-Smtp-Source: ABdhPJwR4vE6dC2MPnmpjPj1HuNE49cohvElwUtB9mqc8dE2Qr0WfqIbza8jnGylchxgheYsqUPG4BATTF4jZPo5zC8=
X-Received: by 2002:a54:4f81:: with SMTP id g1mr645565oiy.172.1641887292808;
 Mon, 10 Jan 2022 23:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
 <20220110072125.1886683-2-troy_lee@aspeedtech.com>
 <a8d6b7b7-7072-9407-3135-f2459bc915b2@kaod.org>
In-Reply-To: <a8d6b7b7-7072-9407-3135-f2459bc915b2@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 11 Jan 2022 15:48:05 +0800
Message-ID: <CAN9Jwz0qFQKe5HuTMwo-u=1vSh47gXJm9DU2wdOjgH8ZcbAsAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/misc: Implementating dummy AST2600 I3C model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,
On Mon, Jan 10, 2022 at 10:25 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> Hello Troy,
>
> On 1/10/22 08:21, Troy Lee wrote:
> > Introduce a dummy AST2600 I3C model.
> >
> > Aspeed 2600 SDK enables I3C support by default.  The I3C driver will tr=
y
> > to reset the device controller and setup through device address table
> > register.  This dummy model response these register with default value
> > listed on ast2600v10 datasheet chapter 54.2.  If the device address
> > table register doesn't set correctly, it will cause guest machine kerne=
l
> > panic due to reference to invalid address.
> >
> > v2:
> > - Split i3c model into i3c and i3c_device
> > - Create 6x i3c devices
> > - Using register fields macro
> >
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > ---
> >   hw/misc/aspeed_i3c.c         | 410 ++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build          |   1 +
> >   hw/misc/trace-events         |   6 +
> >   include/hw/misc/aspeed_i3c.h |  57 +++++
> >   4 files changed, 474 insertions(+)
> >   create mode 100644 hw/misc/aspeed_i3c.c
> >   create mode 100644 include/hw/misc/aspeed_i3c.h
> >
> > diff --git a/hw/misc/aspeed_i3c.c b/hw/misc/aspeed_i3c.c
> > new file mode 100644
> > index 0000000000..16a4f2d4e4
> > --- /dev/null
> > +++ b/hw/misc/aspeed_i3c.c
> > @@ -0,0 +1,410 @@
> > +/*
> > + * ASPEED I3C Controller
> > + *
> > + * Copyright (C) 2021 ASPEED Technology Inc.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > +#include "hw/misc/aspeed_i3c.h"
> > +#include "hw/registerfields.h"
> > +#include "hw/qdev-properties.h"
> > +#include "qapi/error.h"
> > +#include "migration/vmstate.h"
> > +#include "trace.h"
> > +
> > +/* I3C Controller Registers */
> > +REG32(I3C1_REG0, 0x10)
> > +REG32(I3C1_REG1, 0x14)
> > +    FIELD(I3C1_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C1_REG1, SA_EN,     15, 1)
> > +REG32(I3C2_REG0, 0x20)
> > +REG32(I3C2_REG1, 0x24)
> > +    FIELD(I3C2_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C2_REG1, SA_EN,     15, 1)
> > +REG32(I3C3_REG0, 0x30)
> > +REG32(I3C3_REG1, 0x34)
> > +    FIELD(I3C3_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C3_REG1, SA_EN,     15, 1)
> > +REG32(I3C4_REG0, 0x40)
> > +REG32(I3C4_REG1, 0x44)
> > +    FIELD(I3C4_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C4_REG1, SA_EN,     15, 1)
> > +REG32(I3C5_REG0, 0x50)
> > +REG32(I3C5_REG1, 0x54)
> > +    FIELD(I3C5_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C5_REG1, SA_EN,     15, 1)
> > +REG32(I3C6_REG0, 0x60)
> > +REG32(I3C6_REG1, 0x64)
> > +    FIELD(I3C6_REG1, I2C_MODE,  0,  1)
> > +    FIELD(I3C6_REG1, SA_EN,     15, 1)
> > +
> > +/* I3C Device Registers */
> > +REG32(DEVICE_CTRL,                  0x00)
> > +REG32(DEVICE_ADDR,                  0x04)
> > +REG32(HW_CAPABILITY,                0x08)
> > +REG32(COMMAND_QUEUE_PORT,           0x0c)
> > +REG32(RESPONSE_QUEUE_PORT,          0x10)
> > +REG32(RX_TX_DATA_PORT,              0x14)
> > +REG32(IBI_QUEUE_STATUS,             0x18)
> > +REG32(IBI_QUEUE_DATA,               0x18)
> > +REG32(QUEUE_THLD_CTRL,              0x1c)
> > +REG32(DATA_BUFFER_THLD_CTRL,        0x20)
> > +REG32(IBI_QUEUE_CTRL,               0x24)
> > +REG32(IBI_MR_REQ_REJECT,            0x2c)
> > +REG32(IBI_SIR_REQ_REJECT,           0x30)
> > +REG32(RESET_CTRL,                   0x34)
> > +REG32(SLV_EVENT_CTRL,               0x38)
> > +REG32(INTR_STATUS,                  0x3c)
> > +REG32(INTR_STATUS_EN,               0x40)
> > +REG32(INTR_SIGNAL_EN,               0x44)
> > +REG32(INTR_FORCE,                   0x48)
> > +REG32(QUEUE_STATUS_LEVEL,           0x4c)
> > +REG32(DATA_BUFFER_STATUS_LEVEL,     0x50)
> > +REG32(PRESENT_STATE,                0x54)
> > +REG32(CCC_DEVICE_STATUS,            0x58)
> > +REG32(DEVICE_ADDR_TABLE_POINTER,    0x5c)
> > +    FIELD(DEVICE_ADDR_TABLE_POINTER, DEPTH, 16, 16)
> > +    FIELD(DEVICE_ADDR_TABLE_POINTER, ADDR,  0,  16)
> > +REG32(DEV_CHAR_TABLE_POINTER,       0x60)
> > +REG32(VENDOR_SPECIFIC_REG_POINTER,  0x6c)
> > +REG32(SLV_MIPI_PID_VALUE,           0x70)
> > +REG32(SLV_PID_VALUE,                0x74)
> > +REG32(SLV_CHAR_CTRL,                0x78)
> > +REG32(SLV_MAX_LEN,                  0x7c)
> > +REG32(MAX_READ_TURNAROUND,          0x80)
> > +REG32(MAX_DATA_SPEED,               0x84)
> > +REG32(SLV_DEBUG_STATUS,             0x88)
> > +REG32(SLV_INTR_REQ,                 0x8c)
> > +REG32(DEVICE_CTRL_EXTENDED,         0xb0)
> > +REG32(SCL_I3C_OD_TIMING,            0xb4)
> > +REG32(SCL_I3C_PP_TIMING,            0xb8)
> > +REG32(SCL_I2C_FM_TIMING,            0xbc)
> > +REG32(SCL_I2C_FMP_TIMING,           0xc0)
> > +REG32(SCL_EXT_LCNT_TIMING,          0xc8)
> > +REG32(SCL_EXT_TERMN_LCNT_TIMING,    0xcc)
> > +REG32(BUS_FREE_TIMING,              0xd4)
> > +REG32(BUS_IDLE_TIMING,              0xd8)
> > +REG32(I3C_VER_ID,                   0xe0)
> > +REG32(I3C_VER_TYPE,                 0xe4)
> > +REG32(EXTENDED_CAPABILITY,          0xe8)
> > +REG32(SLAVE_CONFIG,                 0xec)
> > +
> > +static uint64_t aspeed_i3c_device_read(void *opaque, hwaddr offset,
> > +                                       unsigned size)
> > +{
> > +    AspeedI3CDevice *s =3D ASPEED_I3C_DEVICE(opaque);
> > +    uint32_t addr =3D offset >> 2;
> > +    uint64_t value;
> > +
> > +    switch (addr) {
> > +    case R_COMMAND_QUEUE_PORT:
> > +        value =3D 0;
> > +        break;
> > +    default:
> > +        value =3D s->regs[addr];
> > +        break;
> > +    }
> > +
> > +    trace_aspeed_i3c_device_read(s->id, offset, value);
> > +
> > +    return value;
> > +}
> > +
> > +static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
> > +                                    uint64_t value, unsigned size)
> > +{
> > +    AspeedI3CDevice *s =3D ASPEED_I3C_DEVICE(opaque);
> > +    uint32_t addr =3D offset >> 2;
> > +
> > +    trace_aspeed_i3c_device_write(s->id, offset, value);
> > +
> > +    switch (addr) {
> > +    case R_HW_CAPABILITY:
> > +    case R_RESPONSE_QUEUE_PORT:
> > +    case R_IBI_QUEUE_DATA:
> > +    case R_QUEUE_STATUS_LEVEL:
> > +    case R_PRESENT_STATE:
> > +    case R_CCC_DEVICE_STATUS:
> > +    case R_DEVICE_ADDR_TABLE_POINTER:
> > +    case R_VENDOR_SPECIFIC_REG_POINTER:
> > +    case R_SLV_CHAR_CTRL:
> > +    case R_SLV_MAX_LEN:
> > +    case R_MAX_READ_TURNAROUND:
> > +    case R_I3C_VER_ID:
> > +    case R_I3C_VER_TYPE:
> > +    case R_EXTENDED_CAPABILITY:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: write to readonly register[%02lx] =3D %08lx=
\n",
> > +                      __func__, offset, value);
> > +        break;
> > +    case R_RX_TX_DATA_PORT:
> > +        break;
> > +    case R_RESET_CTRL:
> > +        break;
> > +    default:
> > +        s->regs[addr] =3D value;
> > +        break;
> > +    }
> > +}
> > +
> > +static const VMStateDescription aspeed_i3c_device_vmstate =3D {
> > +    .name =3D TYPE_ASPEED_I3C,
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]){
> > +        VMSTATE_UINT32_ARRAY(regs, AspeedI3CDevice, ASPEED_I3C_DEVICE_=
NR_REGS),
> > +        VMSTATE_END_OF_LIST(),
> > +    }
> > +};
> > +
> > +static const MemoryRegionOps aspeed_i3c_device_ops =3D {
> > +    .read =3D aspeed_i3c_device_read,
> > +    .write =3D aspeed_i3c_device_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +};
> > +
> > +static void aspeed_i3c_device_reset(DeviceState *dev)
> > +{
> > +    AspeedI3CDevice *s =3D ASPEED_I3C_DEVICE(dev);
> > +
> > +    memset(s->regs, 0, sizeof(s->regs));
> > +
> > +    s->regs[R_HW_CAPABILITY] =3D 0x000e00bf;
> > +    s->regs[R_QUEUE_THLD_CTRL] =3D 0x01000101;
> > +    s->regs[R_I3C_VER_ID] =3D 0x3130302a;
> > +    s->regs[R_I3C_VER_TYPE] =3D 0x6c633033;
> > +    s->regs[R_DEVICE_ADDR_TABLE_POINTER] =3D
> > +            (0x08 << R_DEVICE_ADDR_TABLE_POINTER_DEPTH_SHIFT) |
> > +            (0x280 << R_DEVICE_ADDR_TABLE_POINTER_ADDR_SHIFT);
> > +    s->regs[R_DEV_CHAR_TABLE_POINTER] =3D 0x00020200;
> > +    s->regs[A_VENDOR_SPECIFIC_REG_POINTER] =3D 0x000000b0;
> > +    s->regs[R_SLV_MAX_LEN] =3D (0xff << 16) | (0xff);
> > +}
>
>
> Some models store the reset definitions in an array and simply
> memset() the values in s->regs. See SCU. No need need to resend
> just for that.

This will be improved in v3.

> > +
> > +static void aspeed_i3c_device_realize(DeviceState *dev, Error **errp)
> > +{
> > +    AspeedI3CDevice *s =3D ASPEED_I3C_DEVICE(dev);
> > +    g_autofree char *name =3D g_strdup_printf(TYPE_ASPEED_I3C_DEVICE "=
.%d",
> > +                                            s->id);
> > +
> > +    if (!s->controller) {
> > +        error_setg(errp, TYPE_ASPEED_I3C_DEVICE ": 'controller' link n=
ot set");
> > +        return;
> > +    }
>
> AspeedI3CDevice does not use ->controller. Do you have plans for it ?

Nope, removed in v3.

> > +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> > +
> > +    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i3c_device_ops,
> > +                          s, name, 0x1000);
>
> I would initialize the register window for the exact number of regs becau=
se
> it's a good way to catch out of bounds accesses. 0x300 in this case.
>

Updated.

> > +
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
>
> You don't need to "sysbus-declare" the region. It will be mapped in
> the overall region of the I3C controller, which itself is mapped at
> 0x1e7a0000
>

Removed.

> > +}
> > +
> > +static uint64_t aspeed_i3c_read(void *opaque,
> > +                                hwaddr addr,
> > +                                unsigned int size)
>
> This prototype fits on one line.
>

Updated.

> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(opaque);
> > +    uint64_t val =3D 0;
> > +
> > +    if (addr >=3D (ASPEED_I3C_NR_REGS << 2)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PR=
Ix "\n",
> > +                      __func__, addr << 2);
> > +    } else if (addr < 0x800) {
>
> The controller only has 0x70 << 2 registers
>
> > +        /* I3C controller register */
> > +        val =3D s->regs[addr >> 2];
> > +    } else {
> > +        /* I3C device register */
> > +    }
>
> hmm, this read op looks a little weird.
>

After I applied the container/subregion design, the boundary check can be
removed. The weird code snippets are removed as well. It looks much cleaner=
.

> > +    trace_aspeed_i3c_read(addr, val);
> > +
> > +    return val;
> > +}
> > +
> > +static void aspeed_i3c_write(void *opaque,
> > +                             hwaddr addr,
> > +                             uint64_t data,
> > +                             unsigned int size)
> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(opaque);
> > +
> > +    trace_aspeed_i3c_write(addr, data);
> > +
> > +    addr >>=3D 2;
> > +
> > +    if (addr >=3D ASPEED_I3C_NR_REGS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Out-of-bounds write at offset 0x%" HWADDR_P=
RIx "\n",
> > +                      __func__, addr << 2);
> > +        return;
> > +    }
>
> If the window is correctly sized, you don't need this check.
>

Updated.

> > +    /* I3C controller register */
> > +    switch (addr) {
> > +    case R_I3C1_REG1:
> > +    case R_I3C2_REG1:
> > +    case R_I3C3_REG1:
> > +    case R_I3C4_REG1:
> > +    case R_I3C5_REG1:
> > +    case R_I3C6_REG1:
> > +        if (data & R_I3C1_REG1_I2C_MODE_MASK) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "%s: Not support I2C mode [%08lx]=3D%08lx",
> > +                          __func__, addr << 2, data);
> > +            break;
> > +        }
> > +        if (data & R_I3C1_REG1_SA_EN_MASK) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "%s: Not support slave mode [%08lx]=3D%08lx"=
,
> > +                          __func__, addr << 2, data);
> > +            break;
> > +        }
> > +        s->regs[addr] =3D data;
> > +        break;
> > +    default:
> > +        s->regs[addr] =3D data;
> > +        break;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps aspeed_i3c_ops =3D {
> > +    .read =3D aspeed_i3c_read,
> > +    .write =3D aspeed_i3c_write,
> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 1,
> > +        .max_access_size =3D 4,
> > +    }
> > +};
> > +
> > +static void aspeed_i3c_reset(DeviceState *dev)
> > +{
> > +    struct AspeedI3CState *s =3D ASPEED_I3C(dev);
>
> Remove 'struct'
>

Updated.

> > +    memset(s->regs, 0, sizeof(s->regs));
> > +}
> > +
> > +static void aspeed_i3c_realize(DeviceState *dev, Error **errp)
> > +{
> > +    int i;
> > +    AspeedI3CState *s =3D ASPEED_I3C(dev);
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> > +
> > +    sysbus_init_irq(sbd, &s->irq);
>
> I don't think the I3C controller has an IRQ line.
>

Removed.

> > +
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
> > +            TYPE_ASPEED_I3C, ASPEED_I3C_NR_REGS << 2);
> > +
> > +    sysbus_init_mmio(sbd, &s->iomem);
>
> I would add a container region containing all the regions :
>
>
>      memory_region_init(&s->iomem_container, OBJECT(s),
>                         TYPE_ASPEED_I3C ".container", 0x8000);
>
>      sysbus_init_mmio(sbd, &s->iomem_container);
>
>      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i3c_ops, s,
>              TYPE_ASPEED_I3C ".regs", 0x70);
>
>      memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
>
>
>
> The goal is to have a stricter layout so that you can catch errors :
>
>      000000001e7a0000-000000001e7a7fff (prio 0, i/o): aspeed.i3c.containe=
r
>        000000001e7a0000-000000001e7a006f (prio 0, i/o): aspeed.i3c.regs
>        000000001e7a2000-000000001e7a22ff (prio 0, i/o): aspeed.i3c.device=
.0
>        000000001e7a3000-000000001e7a32ff (prio 0, i/o): aspeed.i3c.device=
.1
>        000000001e7a4000-000000001e7a42ff (prio 0, i/o): aspeed.i3c.device=
.2
>        000000001e7a5000-000000001e7a52ff (prio 0, i/o): aspeed.i3c.device=
.3
>        000000001e7a6000-000000001e7a62ff (prio 0, i/o): aspeed.i3c.device=
.4
>        000000001e7a7000-000000001e7a72ff (prio 0, i/o): aspeed.i3c.device=
.5
>
> and if under U-Boot, you peek into unimplemented regs, you get a warning =
:
>
>      ast# md 1e7a0000
>      1e7a0000: 00000000 00000000 00000000 00000000    ................
>      1e7a0010: 00000000 00000000 00000000 00000000    ................
>      1e7a0020: 00000000 00000000 00000000 00000000    ................
>      1e7a0030: 00000000 00000000 00000000 00000000    ................
>      1e7a0040: 00000000 00000000 00000000 00000000    ................
>      1e7a0050: 00000000 00000000 00000000 00000000    ................
>      1e7a0060: 00000000 00000000 00000000 00000000    ................
>      1e7a0070:aspeed_soc.io: unimplemented device read  (size 4, offset 0=
x1a0070)
>       00000000aspeed_soc.io: unimplemented device read  (size 4, offset 0=
x1a0074)

Thanks for the code snippet, learnt and applied.
Yes, it would be easier to catch driver problems.

> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +
> > +    for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
> > +        Object *dev =3D OBJECT(&s->devices[i]);
> > +
> > +        if (!object_property_set_link(dev, "controller", OBJECT(s), er=
rp)) {
> > +            return;
> > +        }
>
> This might not be needed.
>

Removed.

> > +        if (!object_property_set_uint(dev, "device-id", i, errp)) {
> > +            return;
> > +        }
> > +
> > +        if (!sysbus_realize(SYS_BUS_DEVICE(dev), errp)) {
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * Register Address of I3CX Device =3D
> > +         *     (Base Address of Global Register) + (Offset of I3CX) + =
Offset
> > +         * X =3D 0, 1, 2, 3, 4, 5
> > +         * Offset of I3C0 =3D 0x2000
> > +         * Offset of I3C1 =3D 0x3000
> > +         * Offset of I3C2 =3D 0x4000
> > +         * Offset of I3C3 =3D 0x5000
> > +         * Offset of I3C4 =3D 0x6000
> > +         * Offset of I3C5 =3D 0x7000
> > +         */
> > +        memory_region_add_subregion(&s->iomem,
>
> and map in &s->iomem_container with the example above.
>
> > +                0x2000 + (i * (ASPEED_I3C_DEVICE_NR_REGS << 2)),
>
> Just use : 0x2000 + i * 0x1000,
>

Updated.

> > +                &s->devices[i].mr);
> > +    }
> > +
> > +}
> > +
> > +static Property aspeed_i3c_device_properties[] =3D {
> > +    DEFINE_PROP_UINT8("device-id", AspeedI3CDevice, id, 0),
> > +    DEFINE_PROP_LINK("controller", AspeedI3CDevice, controller, TYPE_A=
SPEED_I3C,
> > +            AspeedI3CState *),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void aspeed_i3c_device_class_init(ObjectClass *klass, void *dat=
a)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->desc =3D "Aspeed I3C Device";
> > +    dc->realize =3D aspeed_i3c_device_realize;
> > +    dc->reset =3D aspeed_i3c_device_reset;
> > +    device_class_set_props(dc, aspeed_i3c_device_properties);
> > +}
> > +
> > +static const TypeInfo aspeed_i3c_device_info =3D {
> > +    .name =3D TYPE_ASPEED_I3C_DEVICE,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(AspeedI3CDevice),
> > +    .class_init =3D aspeed_i3c_device_class_init,
> > +};
> > +
> > +static const VMStateDescription vmstate_aspeed_i3c =3D {
> > +    .name =3D TYPE_ASPEED_I3C,
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(regs, AspeedI3CState, ASPEED_I3C_NR_REGS)=
,
> > +        VMSTATE_STRUCT_ARRAY(devices, AspeedI3CState, ASPEED_I3C_NR_DE=
VICES, 1,
> > +                             aspeed_i3c_device_vmstate, AspeedI3CDevic=
e),
> > +        VMSTATE_END_OF_LIST(),
> > +    }
> > +};
> > +
> > +static void aspeed_i3c_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->realize =3D aspeed_i3c_realize;
> > +    dc->reset =3D aspeed_i3c_reset;
> > +    dc->desc =3D "Aspeed I3C Controller";
> > +    dc->vmsd =3D &vmstate_aspeed_i3c;
> > +}
> > +
> > +static void aspeed_i3c_instance_init(Object *obj)
> > +{
> > +    AspeedI3CState *s =3D ASPEED_I3C(obj);
> > +    int i;
> > +
> > +    for (i =3D 0; i < ASPEED_I3C_NR_DEVICES; ++i) {
> > +        object_initialize_child(obj, "device[*]", &s->devices[i],
> > +                TYPE_ASPEED_I3C_DEVICE);
> > +    }
> > +}
>
> Please put this aspeed_i3c_instance_init() routine above
> aspeed_i3c_realize(). It's cleaner.
>

Updated.

> > +
> > +static const TypeInfo aspeed_i3c_info =3D {
> > +    .name =3D TYPE_ASPEED_I3C,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_init =3D aspeed_i3c_instance_init,
> > +    .instance_size =3D sizeof(AspeedI3CState),
> > +    .class_init =3D aspeed_i3c_class_init,
> > +};
> > +
> > +static void aspeed_i3c_register_types(void)
> > +{
> > +    type_register_static(&aspeed_i3c_device_info);
> > +    type_register_static(&aspeed_i3c_info);
> > +}
> > +
> > +type_init(aspeed_i3c_register_types);
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 3f41a3a5b2..d1a1169108 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -105,6 +105,7 @@ softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true:=
 files('pvpanic-pci.c'))
> >   softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
> >   softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> >     'aspeed_hace.c',
> > +  'aspeed_i3c.c',
> >     'aspeed_lpc.c',
> >     'aspeed_scu.c',
> >     'aspeed_sdmc.c',
> > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > index 2da96d167a..1c373dd0a4 100644
> > --- a/hw/misc/trace-events
> > +++ b/hw/misc/trace-events
> > @@ -199,6 +199,12 @@ armsse_mhu_write(uint64_t offset, uint64_t data, u=
nsigned size) "SSE-200 MHU wri
> >   # aspeed_xdma.c
> >   aspeed_xdma_write(uint64_t offset, uint64_t data) "XDMA write: offset=
 0x%" PRIx64 " data 0x%" PRIx64
> >
> > +# aspeed_i3c.c
> > +aspeed_i3c_read(uint64_t offset, uint64_t data) "I3C read: offset 0x%"=
 PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_write(uint64_t offset, uint64_t data) "I3C write: offset 0x=
%" PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t da=
ta) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
> > +aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t d=
ata) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
> > +
> >   # bcm2835_property.c
> >   bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen)=
 "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
> >
> > diff --git a/include/hw/misc/aspeed_i3c.h b/include/hw/misc/aspeed_i3c.=
h
> > new file mode 100644
> > index 0000000000..276f70b001
> > --- /dev/null
> > +++ b/include/hw/misc/aspeed_i3c.h
> > @@ -0,0 +1,57 @@
> > +/*
> > + * ASPEED I3C Controller
> > + *
> > + * Copyright (C) 2021 ASPEED Technology Inc.
> > + *
> > + * This code is licensed under the GPL version 2 or later.  See
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef ASPEED_I3C_H
> > +#define ASPEED_I3C_H
> > +
> > +#include "hw/sysbus.h"
> > +
> > +#define TYPE_ASPEED_I3C "aspeed.i3c"
> > +#define TYPE_ASPEED_I3C_DEVICE "aspeed.i3c.device"
> > +OBJECT_DECLARE_TYPE(AspeedI3CState, AspeedI3CClass, ASPEED_I3C)
> > +
> > +#define ASPEED_I3C_NR_REGS (0x8000 >> 2)
> > +#define ASPEED_I3C_DEVICE_NR_REGS (0x1000 >> 2)
>
> There are less registers.
>

Updated in v3.
- I3C_REG to 0x80 >> 2
- I3C_DEVICE to 0x300 >> 2

> > +#define ASPEED_I3C_NR_DEVICES 6
> > +
> > +OBJECT_DECLARE_SIMPLE_TYPE(AspeedI3CDevice, ASPEED_I3C_DEVICE)
> > +typedef struct AspeedI3CDevice {
> > +    /* <private> */
> > +    SysBusDevice parent;
> > +    struct AspeedI3CState *controller;
> > +
> > +    /* <public> */
> > +    MemoryRegion mr;
> > +    qemu_irq irq;
> > +
> > +    uint8_t id;
> > +    uint32_t regs[ASPEED_I3C_DEVICE_NR_REGS];
> > +} AspeedI3CDevice;
> > +
> > +typedef struct AspeedI3CClass {
> > +    SysBusDeviceClass parent_class;
> > +
> > +    uint8_t num_devices;
> > +    uint8_t reg_size;
> > +
> > +    qemu_irq (*bus_get_irq)(AspeedI3CDevice *);
> > +} AspeedI3CClass;
>
> The class is unused. Do you have plans for other SoCs with different
> layouts ?
>
Correct, removed in v3.

Thanks for the review, I've learnt a lot in this series.
Troy Lee

> Thanks,
>
> C.
>
>
> > +typedef struct AspeedI3CState {
> > +    /* <private> */
> > +    SysBusDevice parent;
> > +
> > +    /* <public> */
> > +    MemoryRegion iomem;
> > +    qemu_irq irq;
> > +
> > +    uint32_t regs[ASPEED_I3C_NR_REGS];
> > +    AspeedI3CDevice devices[ASPEED_I3C_NR_DEVICES];
> > +} AspeedI3CState;
> > +#endif /* ASPEED_I3C_H */
> >
>

