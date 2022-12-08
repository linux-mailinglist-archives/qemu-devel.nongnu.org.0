Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F3E647626
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 20:22:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3MRm-0007XZ-Js; Thu, 08 Dec 2022 14:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MRL-0007T1-EO; Thu, 08 Dec 2022 14:20:16 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MRH-00087H-Vg; Thu, 08 Dec 2022 14:20:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id bj12so6277082ejb.13;
 Thu, 08 Dec 2022 11:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vnmsWkSx2w9oCXFlnRqOBzjptk76N0WBszfFAY3leko=;
 b=lUF90SzEg0rTIGdR8MuhV6d/VNJNnBeVBA7dgBKLuAj+/Yra975et133jdOMKLZOod
 2Knhz17oxvDs1u7V30vx2NjCxX/RwIRhd6avBePGG7YjqQWQcczCuNIZm8auKgQ7SlYw
 0YW+sxuRQTlMSmdervNaH/Fwoqk2Bay5i6YcBk1yjHMTYo9VIMMa0mqV0Y+fXDAuI8xy
 5z5uY61o9AA4FDOMTaFUMSHyYFkL0wm3d8IIJlyT6nsq443z3dnGrhDLlM6Oe5oJTWTb
 NEsxVbORI9TpIXlZsjibxHBRZtzOzW8oUjzHjJTUcPCQLDaYO3cy28hXKHqsc+K3lB3z
 EKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vnmsWkSx2w9oCXFlnRqOBzjptk76N0WBszfFAY3leko=;
 b=pn/zkDeudCubl+OJZHetOfW3mTbeYA2WqfXfhC2M8a6kQ9mZLmB7KMhJTv3N5jvDB/
 QtH3JVSogvXbudYVLilN0H8IPphxHd+ketoCSCnvJzKc1aT6ufb5qe+mLf5WGw5S90Pd
 CiD2+5a7VBlWsbF1HZxkxVapKuL5ev374K7OQsUIf+IBmI3uR32W9yrZznpaUs7Puo/w
 ajfgufOqbGZxTaq5NOheQ2vMTPXG6G/xV9HM0HM7bIXiHeOGNnQdKPLiVDQ7+d4pbfMK
 Q9+iRQVVNLBhY3vBJGVRNiYzcv3YQUX264uyG9u0emBXko4mFrtNsGU+mta/mn302/Lo
 elNQ==
X-Gm-Message-State: ANoB5plVjfCHP6bWivk+/KG1FblBVGKz09uBwxvDvDqruIMqB7iIkLxm
 l2lFF/u/ylrSbhDPKruH3oXfdlzmrbyql+CjXOE=
X-Google-Smtp-Source: AA0mqf67FVGzhbJ5+dAuz1s4OfVTWnErDHDHm3AIdAeYTffiA8P/rCl2leifjT2Rzg7k5LqL2mQwkAmc9/DOv5cU9Bs=
X-Received: by 2002:a17:907:9c0a:b0:7ae:1e53:8dd4 with SMTP id
 ld10-20020a1709079c0a00b007ae1e538dd4mr36666108ejc.42.1670527209395; Thu, 08
 Dec 2022 11:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-4-strahinja.p.jankovic@gmail.com>
 <CAPan3Wpoy5JdBUneR0o0W4qQ-5Ao1zxSxp7-FG08uUb+GqjmWg@mail.gmail.com>
In-Reply-To: <CAPan3Wpoy5JdBUneR0o0W4qQ-5Ao1zxSxp7-FG08uUb+GqjmWg@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Thu, 8 Dec 2022 20:19:58 +0100
Message-ID: <CABtshVRc_r4UjP+hpEaMV8qpMWsED_ZXeO++Fygk8MFL3BNqSg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/i2c: Allwinner TWI/I2C Emulation
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Niek,

On Wed, Dec 7, 2022 at 11:06 PM Niek Linnenbank
<nieklinnenbank@gmail.com> wrote:
>
> Hi Strahinja,
>
> On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <strahinjapjankovic@gmail.com> wrote:
>>
>> This patch implements Allwinner TWI/I2C controller emulation. Only
>> master-mode functionality is implemented.
>>
>> The SPL boot for Cubieboard expects AXP209 PMIC on TWI0/I2C0 bus, so this is
>> first part enabling the TWI/I2C bus operation.
>>
>> Since both Allwinner A10 and H3 use the same module, it is added for
>> both boards.
>
>
> The A10 and H3 datasheets have the same introduction text on the TWI, suggesting re-use indeed. Unfortunately
> the A10 datasheet seems to be missing register documentation, so I can't compare that with the H3 datasheet.

The A10 register documentation for TWI exists in
https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf user
manual (unfortunately, register description for many other modules is
missing). From what I could see, the description matches the H3, so I
thought it would be good to use the same implementation.

>
> At least according to what is implemented in the linux kernel, looks like that indeed both SoCs implement the same I2C module.
> The file drivers/i2c/busses/i2c-mv64xxx.c has the following mv64xxx_i2c_of_match_table:
>         { .compatible = "allwinner,sun4i-a10-i2c", .data = &mv64xxx_i2c_regs_sun4i},
>         { .compatible = "allwinner,sun6i-a31-i2c", .data = &mv64xxx_i2c_regs_sun4i},
>
> And both SoCs define the sun4i-a10-i2c and sun6i-a31-i2c in their device tree files, respectively.
>
> Could you please also update the documentation files for both boards, so we can show that they now support TWI/I2C?
>   docs/system/arm/cubieboard.rst
>   docs/system/arm/orangepi.rst

Yes, I will update these documents in V2. I will also try to update
the description for the cubieboard to have some examples on how to run
the emulation.

>
>>
>>
>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>> ---
>>  hw/arm/Kconfig                 |   2 +
>>  hw/arm/allwinner-a10.c         |   8 +
>>  hw/arm/allwinner-h3.c          |  11 +-
>>  hw/i2c/Kconfig                 |   4 +
>>  hw/i2c/allwinner-i2c.c         | 417 +++++++++++++++++++++++++++++++++
>>  hw/i2c/meson.build             |   1 +
>>  include/hw/arm/allwinner-a10.h |   2 +
>>  include/hw/arm/allwinner-h3.h  |   3 +
>>  include/hw/i2c/allwinner-i2c.h | 112 +++++++++
>>  9 files changed, 559 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/i2c/allwinner-i2c.c
>>  create mode 100644 include/hw/i2c/allwinner-i2c.h
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 140f142ae5..eefe1fd134 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -322,6 +322,7 @@ config ALLWINNER_A10
>>      select ALLWINNER_A10_CCM
>>      select ALLWINNER_A10_DRAMC
>>      select ALLWINNER_EMAC
>> +    select ALLWINNER_I2C
>>      select SERIAL
>>      select UNIMP
>>
>> @@ -329,6 +330,7 @@ config ALLWINNER_H3
>>      bool
>>      select ALLWINNER_A10_PIT
>>      select ALLWINNER_SUN8I_EMAC
>> +    select ALLWINNER_I2C
>>      select SERIAL
>>      select ARM_TIMER
>>      select ARM_GIC
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index a5f7a36ac9..17e439777e 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -36,6 +36,7 @@
>>  #define AW_A10_OHCI_BASE        0x01c14400
>>  #define AW_A10_SATA_BASE        0x01c18000
>>  #define AW_A10_RTC_BASE         0x01c20d00
>> +#define AW_A10_I2C0_BASE        0x01c2ac00
>>
>>  static void aw_a10_init(Object *obj)
>>  {
>> @@ -56,6 +57,8 @@ static void aw_a10_init(Object *obj)
>>
>>      object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
>>
>> +    object_initialize_child(obj, "i2c0", &s->i2c0, TYPE_AW_I2C);
>> +
>>      if (machine_usb(current_machine)) {
>>          int i;
>>
>> @@ -176,6 +179,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>>      /* RTC */
>>      sysbus_realize(SYS_BUS_DEVICE(&s->rtc), &error_fatal);
>>      sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->rtc), 0, AW_A10_RTC_BASE, 10);
>> +
>> +    /* I2C */
>> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(dev, 7));
>>  }
>>
>>  static void aw_a10_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> index 308ed15552..bfce3c8d92 100644
>> --- a/hw/arm/allwinner-h3.c
>> +++ b/hw/arm/allwinner-h3.c
>> @@ -53,6 +53,7 @@ const hwaddr allwinner_h3_memmap[] = {
>>      [AW_H3_DEV_UART1]      = 0x01c28400,
>>      [AW_H3_DEV_UART2]      = 0x01c28800,
>>      [AW_H3_DEV_UART3]      = 0x01c28c00,
>> +    [AW_H3_DEV_TWI0]       = 0x01c2ac00,
>>      [AW_H3_DEV_EMAC]       = 0x01c30000,
>>      [AW_H3_DEV_DRAMCOM]    = 0x01c62000,
>>      [AW_H3_DEV_DRAMCTL]    = 0x01c63000,
>> @@ -106,7 +107,6 @@ struct AwH3Unimplemented {
>>      { "uart1",     0x01c28400, 1 * KiB },
>>      { "uart2",     0x01c28800, 1 * KiB },
>>      { "uart3",     0x01c28c00, 1 * KiB },
>> -    { "twi0",      0x01c2ac00, 1 * KiB },
>>      { "twi1",      0x01c2b000, 1 * KiB },
>>      { "twi2",      0x01c2b400, 1 * KiB },
>>      { "scr",       0x01c2c400, 1 * KiB },
>> @@ -150,6 +150,7 @@ enum {
>>      AW_H3_GIC_SPI_UART1     =  1,
>>      AW_H3_GIC_SPI_UART2     =  2,
>>      AW_H3_GIC_SPI_UART3     =  3,
>> +    AW_H3_GIC_SPI_TWI0      =  6,
>>      AW_H3_GIC_SPI_TIMER0    = 18,
>>      AW_H3_GIC_SPI_TIMER1    = 19,
>>      AW_H3_GIC_SPI_MMC0      = 60,
>> @@ -225,6 +226,8 @@ static void allwinner_h3_init(Object *obj)
>>                                "ram-size");
>>
>>      object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN6I);
>> +
>> +    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C);
>>  }
>>
>>  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>> @@ -423,6 +426,12 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>>      sysbus_realize(SYS_BUS_DEVICE(&s->rtc), &error_fatal);
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, s->memmap[AW_H3_DEV_RTC]);
>>
>> +    /* I2C */
>> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_H3_DEV_TWI0]);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
>> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI0));
>> +
>>      /* Unimplemented devices */
>>      for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
>>          create_unimplemented_device(unimplemented[i].device_name,
>> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
>> index 9bb8870517..f8ec461be3 100644
>> --- a/hw/i2c/Kconfig
>> +++ b/hw/i2c/Kconfig
>> @@ -34,6 +34,10 @@ config MPC_I2C
>>      bool
>>      select I2C
>>
>> +config ALLWINNER_I2C
>> +    bool
>> +    select I2C
>> +
>>  config PCA954X
>>      bool
>>      select I2C
>> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
>> new file mode 100644
>> index 0000000000..4c9080a18b
>> --- /dev/null
>> +++ b/hw/i2c/allwinner-i2c.c
>> @@ -0,0 +1,417 @@
>> +/*
>> + *  Allwinner I2C Bus Serial Interface Emulation
>> + *
>> + *  Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>> + *
>> + *  This file is derived from IMX I2C controller,
>> + *  by Jean-Christophe DUBOIS .
>> + *
>> + *  This program is free software; you can redistribute it and/or modify it
>> + *  under the terms of the GNU General Public License as published by the
>> + *  Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful, but WITHOUT
>> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
>> + *  for more details.
>> + *
>> + *  You should have received a copy of the GNU General Public License along
>> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/i2c/allwinner-i2c.h"
>> +#include "hw/irq.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/i2c/i2c.h"
>> +#include "qemu/log.h"
>> +#include "qemu/module.h"
>> +
>> +#ifndef DEBUG_AW_I2C
>> +#define DEBUG_AW_I2C 0
>> +#endif
>> +
>> +#define DPRINTF(fmt, args...) \
>> +    do { \
>> +        if (DEBUG_AW_I2C) { \
>> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_AW_I2C, \
>> +                                             __func__, ##args); \
>> +        } \
>> +    } while (0)
>
> As Philipe already suggested earlier, this could be replaced with tracing. Maybe have a look at some of the other I2C drivers to see how its done, for example aspeed_i2c.c.

I will, thanks.

>
>>
>> +
>> +/* Status value in STAT register is shifted by 3 bits */
>> +#define TWI_STAT_SHIFT      3
>> +#define STAT_FROM_STA(x)    ((x) << TWI_STAT_SHIFT)
>> +#define STAT_TO_STA(x)      ((x) >> TWI_STAT_SHIFT)
>
> Maybe add a newline here for readability.

Ok.

>
>>
>> +enum {
>> +    STAT_BUS_ERROR = 0,
>> +    /* Master mode */
>> +    STAT_M_STA_TX,
>> +    STAT_M_RSTA_TX,
>> +    STAT_M_ADDR_WR_ACK,
>> +    STAT_M_ADDR_WR_NACK,
>> +    STAT_M_DATA_TX_ACK,
>> +    STAT_M_DATA_TX_NACK,
>> +    STAT_M_ARB_LOST,
>> +    STAT_M_ADDR_RD_ACK,
>> +    STAT_M_ADDR_RD_NACK,
>> +    STAT_M_DATA_RX_ACK,
>> +    STAT_M_DATA_RX_NACK,
>> +    /* Slave mode */
>> +    STAT_S_ADDR_WR_ACK,
>> +    STAT_S_ARB_LOST_AW_ACK,
>> +    STAT_S_GCA_ACK,
>> +    STAT_S_ARB_LOST_GCA_ACK,
>> +    STAT_S_DATA_RX_SA_ACK,
>> +    STAT_S_DATA_RX_SA_NACK,
>> +    STAT_S_DATA_RX_GCA_ACK,
>> +    STAT_S_DATA_RX_GCA_NACK,
>> +    STAT_S_STP_RSTA,
>> +    STAT_S_ADDR_RD_ACK,
>> +    STAT_S_ARB_LOST_AR_ACK,
>> +    STAT_S_DATA_TX_ACK,
>> +    STAT_S_DATA_TX_NACK,
>> +    STAT_S_LB_TX_ACK,
>> +    /* Master mode, 10-bit */
>> +    STAT_M_2ND_ADDR_WR_ACK,
>> +    STAT_M_2ND_ADDR_WR_NACK,
>> +    /* Idle */
>> +    STAT_IDLE = 0x1f
>> +} TWI_STAT_STA;
>> +
>> +static const char *allwinner_i2c_get_regname(unsigned offset)
>> +{
>> +    switch (offset) {
>> +    case TWI_ADDR_REG:
>> +        return "ADDR";
>> +    case TWI_XADDR_REG:
>> +        return "XADDR";
>> +    case TWI_DATA_REG:
>> +        return "DATA";
>> +    case TWI_CNTR_REG:
>> +        return "CNTR";
>> +    case TWI_STAT_REG:
>> +        return "STAT";
>> +    case TWI_CCR_REG:
>> +        return "CCR";
>> +    case TWI_SRST_REG:
>> +        return "SRST";
>> +    case TWI_EFR_REG:
>> +        return "EFR";
>> +    case TWI_LCR_REG:
>> +        return "LCR";
>> +    default:
>> +        return "[?]";
>> +    }
>> +}
>> +
>> +static inline bool allwinner_i2c_is_reset(AWI2CState *s)
>> +{
>> +    return s->srst & TWI_SRST_MASK;
>> +}
>> +
>> +static inline bool allwinner_i2c_bus_is_enabled(AWI2CState *s)
>> +{
>> +    return s->cntr & TWI_CNTR_BUS_EN;
>> +}
>> +
>> +static inline bool allwinner_i2c_interrupt_is_enabled(AWI2CState *s)
>> +{
>> +    return s->cntr & TWI_CNTR_INT_EN;
>> +}
>> +
>> +static void allwinner_i2c_reset_hold(Object *obj)
>> +{
>> +    AWI2CState *s = AW_I2C(obj);
>> +
>> +    if (STAT_TO_STA(s->stat) != STAT_IDLE) {
>> +        i2c_end_transfer(s->bus);
>> +    }
>> +
>> +    s->addr  = TWI_ADDR_RESET;
>> +    s->xaddr = TWI_XADDR_RESET;
>> +    s->data  = TWI_DATA_RESET;
>> +    s->cntr  = TWI_CNTR_RESET;
>> +    s->stat  = TWI_STAT_RESET;
>> +    s->ccr   = TWI_CCR_RESET;
>> +    s->srst  = TWI_SRST_RESET;
>> +    s->efr   = TWI_EFR_RESET;
>> +    s->lcr   = TWI_LCR_RESET;
>> +}
>> +
>> +static inline void allwinner_i2c_raise_interrupt(AWI2CState *s)
>> +{
>> +    /*
>> +     * Raise an interrupt if the device is not reset and it is configured
>> +     * to generate some interrupts.
>> +     */
>> +    if (!allwinner_i2c_is_reset(s) && allwinner_i2c_bus_is_enabled(s)) {
>> +        if (STAT_TO_STA(s->stat) != STAT_IDLE) {
>> +            s->cntr |= TWI_CNTR_INT_FLAG;
>> +            if (allwinner_i2c_interrupt_is_enabled(s)) {
>> +                qemu_irq_raise(s->irq);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,
>> +                                   unsigned size)
>> +{
>> +    uint16_t value;
>> +    AWI2CState *s = AW_I2C(opaque);
>> +
>> +    switch (offset) {
>> +    case TWI_ADDR_REG:
>> +        value = s->addr;
>> +        break;
>> +    case TWI_XADDR_REG:
>> +        value = s->xaddr;
>> +        break;
>> +    case TWI_DATA_REG:
>> +        switch (STAT_TO_STA(s->stat)) {
>> +        case STAT_M_ADDR_RD_ACK:
>> +        case STAT_M_DATA_RX_ACK:
>> +        case STAT_M_DATA_RX_NACK:
>> +            /* get the next byte */
>> +            s->data = i2c_recv(s->bus);
>> +
>> +            if (s->cntr & TWI_CNTR_A_ACK) {
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
>> +            } else {
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
>> +            }
>> +            allwinner_i2c_raise_interrupt(s);
>> +            break;
>
>
> Looking at this code, here we have a nested switch statement. I just wonder if it's well defined C programming behavior what really should happen
> when calling 'break' in such construction. Should it step out of the first switch or both? Perhaps it works OK with gcc, but what about other compilers.
> Also for readability, it may be better to avoid nesting switch statements at all in my opinion.

No problem, I will convert the nested switch statement to if.

>
>>
>> +        default:
>> +            break;
>> +        }
>> +        value = s->data;
>> +        break;
>> +    case TWI_CNTR_REG:
>> +        value = s->cntr;
>> +        break;
>> +    case TWI_STAT_REG:
>> +        value = s->stat;
>> +        /*
>> +         * If polling when reading then change state to indicate data
>> +         * is available
>> +         */
>> +        if (STAT_TO_STA(s->stat) == STAT_M_ADDR_RD_ACK) {
>> +            if (s->cntr & TWI_CNTR_A_ACK) {
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
>> +            } else {
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
>> +            }
>> +            allwinner_i2c_raise_interrupt(s);
>> +        }
>> +        break;
>> +    case TWI_CCR_REG:
>> +        value = s->ccr;
>> +        break;
>> +    case TWI_SRST_REG:
>> +        value = s->srst;
>> +        break;
>> +    case TWI_EFR_REG:
>> +        value = s->efr;
>> +        break;
>> +    case TWI_LCR_REG:
>> +        value = s->lcr;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
>> +                      HWADDR_PRIx "\n", TYPE_AW_I2C, __func__, offset);
>> +        value = 0;
>> +        break;
>> +    }
>> +
>> +    DPRINTF("read %s [0x%" HWADDR_PRIx "] -> 0x%02x\n",
>> +            allwinner_i2c_get_regname(offset), offset, value);
>> +
>> +    return (uint64_t)value;
>> +}
>> +
>> +static void allwinner_i2c_write(void *opaque, hwaddr offset,
>> +                                uint64_t value, unsigned size)
>> +{
>> +    AWI2CState *s = AW_I2C(opaque);
>> +
>> +    DPRINTF("write %s [0x%" HWADDR_PRIx "] <- 0x%02x\n",
>> +            allwinner_i2c_get_regname(offset), offset, (int)value);
>> +
>> +    value &= 0xff;
>> +
>> +    switch (offset) {
>> +    case TWI_ADDR_REG:
>> +        s->addr = (uint8_t)value;
>> +        break;
>> +    case TWI_XADDR_REG:
>> +        s->xaddr = (uint8_t)value;
>> +        break;
>> +    case TWI_DATA_REG:
>> +        /* If the device is in reset or not enabled, nothing to do */
>> +        if (allwinner_i2c_is_reset(s) || (!allwinner_i2c_bus_is_enabled(s))) {
>> +            break;
>> +        }
>> +
>> +        s->data = value & TWI_DATA_MASK;
>> +
>> +        switch (STAT_TO_STA(s->stat)) {
>> +        case STAT_M_STA_TX:
>> +        case STAT_M_RSTA_TX:
>> +            /* Send address */
>> +            if (i2c_start_transfer(s->bus, extract32(s->data, 1, 7),
>> +                                extract32(s->data, 0, 1))) {
>> +                /* If non zero is returned, the address is not valid */
>> +                s->stat = STAT_FROM_STA(STAT_M_ADDR_WR_NACK);
>> +            } else {
>> +                /* Determine if read of write */
>> +                if (extract32(s->data, 0, 1)) {
>> +                    s->stat = STAT_FROM_STA(STAT_M_ADDR_RD_ACK);
>> +                } else {
>> +                    s->stat = STAT_FROM_STA(STAT_M_ADDR_WR_ACK);
>> +                }
>> +                allwinner_i2c_raise_interrupt(s);
>> +            }
>> +            break;
>> +        case STAT_M_ADDR_WR_ACK:
>> +        case STAT_M_DATA_TX_ACK:
>> +            if (i2c_send(s->bus, s->data)) {
>> +                /* If the target return non zero then end the transfer */
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_TX_NACK);
>> +                i2c_end_transfer(s->bus);
>> +            } else {
>> +                s->stat = STAT_FROM_STA(STAT_M_DATA_TX_ACK);
>> +                allwinner_i2c_raise_interrupt(s);
>> +            }
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +        break;
>> +    case TWI_CNTR_REG:
>> +        if (!allwinner_i2c_is_reset(s)) {
>> +            /* Do something only if not in software reset */
>> +            s->cntr = value & TWI_CNTR_MASK;
>> +
>> +            /* Check if start condition should be sent */
>> +            if (s->cntr & TWI_CNTR_M_STA) {
>> +                /* Update status */
>> +                if (STAT_TO_STA(s->stat) == STAT_IDLE) {
>> +                    /* Send start condition */
>> +                    s->stat = STAT_FROM_STA(STAT_M_STA_TX);
>> +                } else {
>> +                    /* Send repeated start condition */
>> +                    s->stat = STAT_FROM_STA(STAT_M_RSTA_TX);
>> +                }
>> +                /* Clear start condition */
>> +                s->cntr &= ~TWI_CNTR_M_STA;
>> +            }
>> +            if (s->cntr & TWI_CNTR_M_STP) {
>> +                /* Update status */
>> +                i2c_end_transfer(s->bus);
>> +                s->stat = STAT_FROM_STA(STAT_IDLE);
>> +                s->cntr &= ~TWI_CNTR_M_STP;
>> +            }
>> +            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
>> +                /* Interrupt flag cleared */
>> +                qemu_irq_lower(s->irq);
>> +            }
>> +            if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
>> +                if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) {
>> +                    s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
>> +                }
>> +            } else {
>> +                if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_NACK) {
>> +                    s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
>> +                }
>> +            }
>> +            allwinner_i2c_raise_interrupt(s);
>> +
>> +        }
>> +        break;
>> +    case TWI_CCR_REG:
>> +        s->ccr = value & TWI_CCR_MASK;
>> +        break;
>> +    case TWI_SRST_REG:
>> +        if (((value & TWI_SRST_MASK) == 0) && (s->srst & TWI_SRST_MASK)) {
>> +            /* Perform reset */
>> +            allwinner_i2c_reset_hold(OBJECT(s));
>> +        }
>> +        s->srst = value & TWI_SRST_MASK;
>> +        break;
>> +    case TWI_EFR_REG:
>> +        s->efr = value & TWI_EFR_MASK;
>> +        break;
>> +    case TWI_LCR_REG:
>> +        s->lcr = value & TWI_LCR_MASK;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
>> +                      HWADDR_PRIx "\n", TYPE_AW_I2C, __func__, offset);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps allwinner_i2c_ops = {
>> +    .read = allwinner_i2c_read,
>> +    .write = allwinner_i2c_write,
>> +    .valid.min_access_size = 1,
>> +    .valid.max_access_size = 4,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static const VMStateDescription allwinner_i2c_vmstate = {
>> +    .name = TYPE_AW_I2C,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(addr, AWI2CState),
>> +        VMSTATE_UINT8(xaddr, AWI2CState),
>> +        VMSTATE_UINT8(data, AWI2CState),
>> +        VMSTATE_UINT8(cntr, AWI2CState),
>> +        VMSTATE_UINT8(ccr, AWI2CState),
>> +        VMSTATE_UINT8(srst, AWI2CState),
>> +        VMSTATE_UINT8(efr, AWI2CState),
>> +        VMSTATE_UINT8(lcr, AWI2CState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void allwinner_i2c_realize(DeviceState *dev, Error **errp)
>> +{
>> +    AWI2CState *s = AW_I2C(dev);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_i2c_ops, s,
>> +                          TYPE_AW_I2C, AW_I2C_MEM_SIZE);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
>> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>> +    s->bus = i2c_init_bus(dev, "i2c");
>> +}
>> +
>> +static void allwinner_i2c_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>> +
>> +    rc->phases.hold = allwinner_i2c_reset_hold;
>> +    dc->vmsd = &allwinner_i2c_vmstate;
>> +    dc->realize = allwinner_i2c_realize;
>> +    dc->desc = "Allwinner I2C Controller";
>> +}
>> +
>> +static const TypeInfo allwinner_i2c_type_info = {
>> +    .name = TYPE_AW_I2C,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(AWI2CState),
>> +    .class_init = allwinner_i2c_class_init,
>> +};
>> +
>> +static void allwinner_i2c_register_types(void)
>> +{
>> +    type_register_static(&allwinner_i2c_type_info);
>> +}
>> +
>> +type_init(allwinner_i2c_register_types)
>> diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
>> index d3df273251..7de7f2f540 100644
>> --- a/hw/i2c/meson.build
>> +++ b/hw/i2c/meson.build
>> @@ -8,6 +8,7 @@ i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true: files('bitbang_i2c.c'))
>>  i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
>>  i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
>>  i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
>> +i2c_ss.add(when: 'CONFIG_ALLWINNER_I2C', if_true: files('allwinner-i2c.c'))
>>  i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
>>  i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
>>  i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
>> diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
>> index abe4ff7066..763935fca9 100644
>> --- a/include/hw/arm/allwinner-a10.h
>> +++ b/include/hw/arm/allwinner-a10.h
>> @@ -14,6 +14,7 @@
>>  #include "hw/rtc/allwinner-rtc.h"
>>  #include "hw/misc/allwinner-a10-ccm.h"
>>  #include "hw/misc/allwinner-a10-dramc.h"
>> +#include "hw/i2c/allwinner-i2c.h"
>>
>>  #include "target/arm/cpu.h"
>>  #include "qom/object.h"
>> @@ -39,6 +40,7 @@ struct AwA10State {
>>      AwEmacState emac;
>>      AllwinnerAHCIState sata;
>>      AwSdHostState mmc0;
>> +    AWI2CState i2c0;
>>      AwRtcState rtc;
>>      MemoryRegion sram_a;
>>      EHCISysBusState ehci[AW_A10_NUM_USB];
>> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
>> index 63025fb27c..1d7ce20589 100644
>> --- a/include/hw/arm/allwinner-h3.h
>> +++ b/include/hw/arm/allwinner-h3.h
>> @@ -47,6 +47,7 @@
>>  #include "hw/sd/allwinner-sdhost.h"
>>  #include "hw/net/allwinner-sun8i-emac.h"
>>  #include "hw/rtc/allwinner-rtc.h"
>> +#include "hw/i2c/allwinner-i2c.h"
>>  #include "target/arm/cpu.h"
>>  #include "sysemu/block-backend.h"
>>
>> @@ -82,6 +83,7 @@ enum {
>>      AW_H3_DEV_UART2,
>>      AW_H3_DEV_UART3,
>>      AW_H3_DEV_EMAC,
>> +    AW_H3_DEV_TWI0,
>>      AW_H3_DEV_DRAMCOM,
>>      AW_H3_DEV_DRAMCTL,
>>      AW_H3_DEV_DRAMPHY,
>> @@ -130,6 +132,7 @@ struct AwH3State {
>>      AwH3SysCtrlState sysctrl;
>>      AwSidState sid;
>>      AwSdHostState mmc0;
>> +    AWI2CState i2c0;
>>      AwSun8iEmacState emac;
>>      AwRtcState rtc;
>>      GICState gic;
>> diff --git a/include/hw/i2c/allwinner-i2c.h b/include/hw/i2c/allwinner-i2c.h
>> new file mode 100644
>> index 0000000000..1e3169a5b9
>> --- /dev/null
>> +++ b/include/hw/i2c/allwinner-i2c.h
>> @@ -0,0 +1,112 @@
>> +/*
>> + *  Allwinner I2C Bus Serial Interface registers definition
>> + *
>> + *  Copyright (C) 2022 Strahinja Jankovic. <strahinja.p.jankovic@gmail.com>
>> + *
>> + *  This file is derived from IMX I2C controller,
>> + *  by Jean-Christophe DUBOIS .
>> + *
>> + *  This program is free software; you can redistribute it and/or modify it
>> + *  under the terms of the GNU General Public License as published by the
>> + *  Free Software Foundation; either version 2 of the License, or
>> + *  (at your option) any later version.
>> + *
>> + *  This program is distributed in the hope that it will be useful, but WITHOUT
>> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
>> + *  for more details.
>> + *
>> + *  You should have received a copy of the GNU General Public License along
>> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
>> + *
>> + */
>> +
>> +#ifndef ALLWINNER_I2C_H
>> +#define ALLWINNER_I2C_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "qom/object.h"
>> +
>> +#define TYPE_AW_I2C "allwinner.i2c"
>> +OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)
>> +
>> +#define AW_I2C_MEM_SIZE         0x24
>> +
>> +/* Allwinner I2C memory map */
>> +#define TWI_ADDR_REG            0x00  /* slave address register */
>> +#define TWI_XADDR_REG           0x04  /* extended slave address register */
>> +#define TWI_DATA_REG            0x08  /* data register */
>> +#define TWI_CNTR_REG            0x0c  /* control register */
>> +#define TWI_STAT_REG            0x10  /* status register */
>> +#define TWI_CCR_REG             0x14  /* clock control register */
>> +#define TWI_SRST_REG            0x18  /* software reset register */
>> +#define TWI_EFR_REG             0x1c  /* enhance feature register */
>> +#define TWI_LCR_REG             0x20  /* line control register */
>> +
>
> If no other modules except for the new driver need these defines, it may be a good idea to move them to the .c file instead.
> Doing so helps avoiding accidental or unintentional use of the defines. Same for the other flags below.

That makes sense, I will move defines that are used only in this .c file to it.

Best regards,
Strahinja

>
>>
>> +/* Used only in slave mode, do not set */
>> +#define TWI_ADDR_RESET          0
>> +#define TWI_XADDR_RESET         0
>> +
>> +/* Data register */
>> +#define TWI_DATA_MASK           0xFF
>> +#define TWI_DATA_RESET          0
>> +
>> +/* Control register */
>> +#define TWI_CNTR_INT_EN         (1 << 7)
>> +#define TWI_CNTR_BUS_EN         (1 << 6)
>> +#define TWI_CNTR_M_STA          (1 << 5)
>> +#define TWI_CNTR_M_STP          (1 << 4)
>> +#define TWI_CNTR_INT_FLAG       (1 << 3)
>> +#define TWI_CNTR_A_ACK          (1 << 2)
>> +#define TWI_CNTR_MASK           0xFC
>> +#define TWI_CNTR_RESET          0
>> +
>> +/* Status register */
>> +#define TWI_STAT_MASK           0xF8
>> +#define TWI_STAT_RESET          0xF8
>> +
>> +/* Clock register */
>> +#define TWI_CCR_CLK_M_MASK      0x78
>> +#define TWI_CCR_CLK_N_MASK      0x07
>> +#define TWI_CCR_MASK            0x7F
>> +#define TWI_CCR_RESET           0
>> +
>> +/* Soft reset */
>> +#define TWI_SRST_MASK           0x01
>> +#define TWI_SRST_RESET          0
>> +
>> +/* Enhance feature */
>> +#define TWI_EFR_MASK            0x03
>> +#define TWI_EFR_RESET           0
>> +
>> +/* Line control */
>> +#define TWI_LCR_SCL_STATE       (1 << 5)
>> +#define TWI_LCR_SDA_STATE       (1 << 4)
>> +#define TWI_LCR_SCL_CTL         (1 << 3)
>> +#define TWI_LCR_SCL_CTL_EN      (1 << 2)
>> +#define TWI_LCR_SDA_CTL         (1 << 1)
>> +#define TWI_LCR_SDA_CTL_EN      (1 << 0)
>> +#define TWI_LCR_MASK            0x3F
>> +#define TWI_LCR_RESET           0x3A
>> +
>> +struct AWI2CState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +    I2CBus *bus;
>> +    qemu_irq irq;
>> +
>> +    uint8_t addr;
>> +    uint8_t xaddr;
>> +    uint8_t data;
>> +    uint8_t cntr;
>> +    uint8_t stat;
>> +    uint8_t ccr;
>> +    uint8_t srst;
>> +    uint8_t efr;
>> +    uint8_t lcr;
>> +};
>> +
>> +#endif /* ALLWINNER_I2C_H */
>> --
>> 2.30.2
>>
>
> Regards,
> Niek
>
> --
> Niek Linnenbank
>

