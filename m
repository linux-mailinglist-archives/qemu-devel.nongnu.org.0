Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EA36463DE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32Yo-00082a-Vf; Wed, 07 Dec 2022 17:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32Yl-00081q-WC; Wed, 07 Dec 2022 17:06:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1p32Yh-0002UD-4y; Wed, 07 Dec 2022 17:06:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l26so8658312wms.4;
 Wed, 07 Dec 2022 14:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eLYOh1XjXrzpv7OkgdV+SCjY1tLpzCFPn18QJFAR44c=;
 b=nzGFa6cpCuidgMres2+GtLjGTdyCe+/RM/eqjF8r6DIpf+T+LpoK88ptqi5N9fPDc2
 Vvl1v0A9MOEUQm4F73ED8EhyC+iWhETyFaYonl2/Yzuwi6IrvTZFgUmoT+ppjVsk481J
 Lt+EeddW8h2qUTXBVt81zlrJXh0+kF3/GFmMxwCPIuQZihQuk69Wi02Qz16t46nFoFng
 M9zJMxSXjm33tPvFN4UTydrBp1AFGwA+OI76xrxwfQHHVdXZ8OPwBhp2npWoskOokGpv
 3mvnEsVLfsSrH+ox103xope7yZPnxOJPnd61nN53vC17qqki/oOKqr7+5x0ZNdIo5HAC
 qYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eLYOh1XjXrzpv7OkgdV+SCjY1tLpzCFPn18QJFAR44c=;
 b=RvoVQJHNnYDB00M6/j5qjMeoLhvKLBEzydiuMP9gIttyuRHcuQ8eo/FaZPu06QGWqn
 UJMaNUhSEYvWW1JALK3JH/W8ocKKhFxQGdzNZqwb7pa86GMHYmcFJjWNzSyPPwwcrFYT
 3V2J1sejKFuc7nm4AhFpGU3icady+i9b+aFR+j1RgcVAaohSjIZg6D9ndC8nxd+l2R+q
 Ik+sIbK4SELelTD4SGSPaPk0B6CI8SVHVWm0CBHIBTjE5GBuw8SHc6IYF9gc3+mmUCwV
 4a0MA2BvcvMBFglKVVdmbO+pXZCw74Qc1g8iba7b4Jgi4nkdy/kN0mie/215qQOWUK4j
 ETYg==
X-Gm-Message-State: ANoB5pkyuzyXw4efVlv4uGCFSSYCCQFkWpN+EXdnQrf1sj4vY8ebYv7I
 FSPgjdDEV8QHYzO1zU8y4mYm2qffW50pApmv6F4=
X-Google-Smtp-Source: AA0mqf4dO2+2IrAHmn1NUkuZXDvcnc7j5KASstqMzca1vfTT9hOOHNFi/I6IRvCi/TwTRC5b5I0YSetXlqw4Ml7kWDo=
X-Received: by 2002:a05:600c:3503:b0:3cf:f0a8:d04e with SMTP id
 h3-20020a05600c350300b003cff0a8d04emr59085294wmq.45.1670450788714; Wed, 07
 Dec 2022 14:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-4-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221203231904.25155-4-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 7 Dec 2022 23:06:16 +0100
Message-ID: <CAPan3Wpoy5JdBUneR0o0W4qQ-5Ao1zxSxp7-FG08uUb+GqjmWg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/i2c: Allwinner TWI/I2C Emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e04d3605ef442120"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e04d3605ef442120
Content-Type: text/plain; charset="UTF-8"

Hi Strahinja,

On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch implements Allwinner TWI/I2C controller emulation. Only
> master-mode functionality is implemented.
>
> The SPL boot for Cubieboard expects AXP209 PMIC on TWI0/I2C0 bus, so this
> is
> first part enabling the TWI/I2C bus operation.
>
> Since both Allwinner A10 and H3 use the same module, it is added for
> both boards.
>

The A10 and H3 datasheets have the same introduction text on the TWI,
suggesting re-use indeed. Unfortunately
the A10 datasheet seems to be missing register documentation, so I can't
compare that with the H3 datasheet.

At least according to what is implemented in the linux kernel, looks like
that indeed both SoCs implement the same I2C module.
The file drivers/i2c/busses/i2c-mv64xxx.c has the following
mv64xxx_i2c_of_match_table:
        { .compatible = "allwinner,sun4i-a10-i2c", .data =
&mv64xxx_i2c_regs_sun4i},
        { .compatible = "allwinner,sun6i-a31-i2c", .data =
&mv64xxx_i2c_regs_sun4i},

And both SoCs define the sun4i-a10-i2c and sun6i-a31-i2c in their device
tree files, respectively.

Could you please also update the documentation files for both boards, so we
can show that they now support TWI/I2C?
  docs/system/arm/cubieboard.rst
  docs/system/arm/orangepi.rst


>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  hw/arm/Kconfig                 |   2 +
>  hw/arm/allwinner-a10.c         |   8 +
>  hw/arm/allwinner-h3.c          |  11 +-
>  hw/i2c/Kconfig                 |   4 +
>  hw/i2c/allwinner-i2c.c         | 417 +++++++++++++++++++++++++++++++++
>  hw/i2c/meson.build             |   1 +
>  include/hw/arm/allwinner-a10.h |   2 +
>  include/hw/arm/allwinner-h3.h  |   3 +
>  include/hw/i2c/allwinner-i2c.h | 112 +++++++++
>  9 files changed, 559 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i2c/allwinner-i2c.c
>  create mode 100644 include/hw/i2c/allwinner-i2c.h
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 140f142ae5..eefe1fd134 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -322,6 +322,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_CCM
>      select ALLWINNER_A10_DRAMC
>      select ALLWINNER_EMAC
> +    select ALLWINNER_I2C
>      select SERIAL
>      select UNIMP
>
> @@ -329,6 +330,7 @@ config ALLWINNER_H3
>      bool
>      select ALLWINNER_A10_PIT
>      select ALLWINNER_SUN8I_EMAC
> +    select ALLWINNER_I2C
>      select SERIAL
>      select ARM_TIMER
>      select ARM_GIC
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index a5f7a36ac9..17e439777e 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -36,6 +36,7 @@
>  #define AW_A10_OHCI_BASE        0x01c14400
>  #define AW_A10_SATA_BASE        0x01c18000
>  #define AW_A10_RTC_BASE         0x01c20d00
> +#define AW_A10_I2C0_BASE        0x01c2ac00
>
>  static void aw_a10_init(Object *obj)
>  {
> @@ -56,6 +57,8 @@ static void aw_a10_init(Object *obj)
>
>      object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
>
> +    object_initialize_child(obj, "i2c0", &s->i2c0, TYPE_AW_I2C);
> +
>      if (machine_usb(current_machine)) {
>          int i;
>
> @@ -176,6 +179,11 @@ static void aw_a10_realize(DeviceState *dev, Error
> **errp)
>      /* RTC */
>      sysbus_realize(SYS_BUS_DEVICE(&s->rtc), &error_fatal);
>      sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->rtc), 0, AW_A10_RTC_BASE,
> 10);
> +
> +    /* I2C */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(dev,
> 7));
>  }
>
>  static void aw_a10_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 308ed15552..bfce3c8d92 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -53,6 +53,7 @@ const hwaddr allwinner_h3_memmap[] = {
>      [AW_H3_DEV_UART1]      = 0x01c28400,
>      [AW_H3_DEV_UART2]      = 0x01c28800,
>      [AW_H3_DEV_UART3]      = 0x01c28c00,
> +    [AW_H3_DEV_TWI0]       = 0x01c2ac00,
>      [AW_H3_DEV_EMAC]       = 0x01c30000,
>      [AW_H3_DEV_DRAMCOM]    = 0x01c62000,
>      [AW_H3_DEV_DRAMCTL]    = 0x01c63000,
> @@ -106,7 +107,6 @@ struct AwH3Unimplemented {
>      { "uart1",     0x01c28400, 1 * KiB },
>      { "uart2",     0x01c28800, 1 * KiB },
>      { "uart3",     0x01c28c00, 1 * KiB },
> -    { "twi0",      0x01c2ac00, 1 * KiB },
>      { "twi1",      0x01c2b000, 1 * KiB },
>      { "twi2",      0x01c2b400, 1 * KiB },
>      { "scr",       0x01c2c400, 1 * KiB },
> @@ -150,6 +150,7 @@ enum {
>      AW_H3_GIC_SPI_UART1     =  1,
>      AW_H3_GIC_SPI_UART2     =  2,
>      AW_H3_GIC_SPI_UART3     =  3,
> +    AW_H3_GIC_SPI_TWI0      =  6,
>      AW_H3_GIC_SPI_TIMER0    = 18,
>      AW_H3_GIC_SPI_TIMER1    = 19,
>      AW_H3_GIC_SPI_MMC0      = 60,
> @@ -225,6 +226,8 @@ static void allwinner_h3_init(Object *obj)
>                                "ram-size");
>
>      object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN6I);
> +
> +    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C);
>  }
>
>  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -423,6 +426,12 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->rtc), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, s->memmap[AW_H3_DEV_RTC]);
>
> +    /* I2C */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0,
> s->memmap[AW_H3_DEV_TWI0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic),
> AW_H3_GIC_SPI_TWI0));
> +
>      /* Unimplemented devices */
>      for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
>          create_unimplemented_device(unimplemented[i].device_name,
> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 9bb8870517..f8ec461be3 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -34,6 +34,10 @@ config MPC_I2C
>      bool
>      select I2C
>
> +config ALLWINNER_I2C
> +    bool
> +    select I2C
> +
>  config PCA954X
>      bool
>      select I2C
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> new file mode 100644
> index 0000000000..4c9080a18b
> --- /dev/null
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -0,0 +1,417 @@
> +/*
> + *  Allwinner I2C Bus Serial Interface Emulation
> + *
> + *  Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com
> >
> + *
> + *  This file is derived from IMX I2C controller,
> + *  by Jean-Christophe DUBOIS .
> + *
> + *  This program is free software; you can redistribute it and/or modify
> it
> + *  under the terms of the GNU General Public License as published by the
> + *  Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but
> WITHOUT
> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + *  for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> along
> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/allwinner-i2c.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "hw/i2c/i2c.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +#ifndef DEBUG_AW_I2C
> +#define DEBUG_AW_I2C 0
> +#endif
> +
> +#define DPRINTF(fmt, args...) \
> +    do { \
> +        if (DEBUG_AW_I2C) { \
> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_AW_I2C, \
> +                                             __func__, ##args); \
> +        } \
> +    } while (0)
>
As Philipe already suggested earlier, this could be replaced with tracing.
Maybe have a look at some of the other I2C drivers to see how its done, for
example aspeed_i2c.c.


> +
> +/* Status value in STAT register is shifted by 3 bits */
> +#define TWI_STAT_SHIFT      3
> +#define STAT_FROM_STA(x)    ((x) << TWI_STAT_SHIFT)
> +#define STAT_TO_STA(x)      ((x) >> TWI_STAT_SHIFT)
>
Maybe add a newline here for readability.


> +enum {
> +    STAT_BUS_ERROR = 0,
> +    /* Master mode */
> +    STAT_M_STA_TX,
> +    STAT_M_RSTA_TX,
> +    STAT_M_ADDR_WR_ACK,
> +    STAT_M_ADDR_WR_NACK,
> +    STAT_M_DATA_TX_ACK,
> +    STAT_M_DATA_TX_NACK,
> +    STAT_M_ARB_LOST,
> +    STAT_M_ADDR_RD_ACK,
> +    STAT_M_ADDR_RD_NACK,
> +    STAT_M_DATA_RX_ACK,
> +    STAT_M_DATA_RX_NACK,
> +    /* Slave mode */
> +    STAT_S_ADDR_WR_ACK,
> +    STAT_S_ARB_LOST_AW_ACK,
> +    STAT_S_GCA_ACK,
> +    STAT_S_ARB_LOST_GCA_ACK,
> +    STAT_S_DATA_RX_SA_ACK,
> +    STAT_S_DATA_RX_SA_NACK,
> +    STAT_S_DATA_RX_GCA_ACK,
> +    STAT_S_DATA_RX_GCA_NACK,
> +    STAT_S_STP_RSTA,
> +    STAT_S_ADDR_RD_ACK,
> +    STAT_S_ARB_LOST_AR_ACK,
> +    STAT_S_DATA_TX_ACK,
> +    STAT_S_DATA_TX_NACK,
> +    STAT_S_LB_TX_ACK,
> +    /* Master mode, 10-bit */
> +    STAT_M_2ND_ADDR_WR_ACK,
> +    STAT_M_2ND_ADDR_WR_NACK,
> +    /* Idle */
> +    STAT_IDLE = 0x1f
> +} TWI_STAT_STA;
> +
> +static const char *allwinner_i2c_get_regname(unsigned offset)
> +{
> +    switch (offset) {
> +    case TWI_ADDR_REG:
> +        return "ADDR";
> +    case TWI_XADDR_REG:
> +        return "XADDR";
> +    case TWI_DATA_REG:
> +        return "DATA";
> +    case TWI_CNTR_REG:
> +        return "CNTR";
> +    case TWI_STAT_REG:
> +        return "STAT";
> +    case TWI_CCR_REG:
> +        return "CCR";
> +    case TWI_SRST_REG:
> +        return "SRST";
> +    case TWI_EFR_REG:
> +        return "EFR";
> +    case TWI_LCR_REG:
> +        return "LCR";
> +    default:
> +        return "[?]";
> +    }
> +}
> +
> +static inline bool allwinner_i2c_is_reset(AWI2CState *s)
> +{
> +    return s->srst & TWI_SRST_MASK;
> +}
> +
> +static inline bool allwinner_i2c_bus_is_enabled(AWI2CState *s)
> +{
> +    return s->cntr & TWI_CNTR_BUS_EN;
> +}
> +
> +static inline bool allwinner_i2c_interrupt_is_enabled(AWI2CState *s)
> +{
> +    return s->cntr & TWI_CNTR_INT_EN;
> +}
> +
> +static void allwinner_i2c_reset_hold(Object *obj)
> +{
> +    AWI2CState *s = AW_I2C(obj);
> +
> +    if (STAT_TO_STA(s->stat) != STAT_IDLE) {
> +        i2c_end_transfer(s->bus);
> +    }
> +
> +    s->addr  = TWI_ADDR_RESET;
> +    s->xaddr = TWI_XADDR_RESET;
> +    s->data  = TWI_DATA_RESET;
> +    s->cntr  = TWI_CNTR_RESET;
> +    s->stat  = TWI_STAT_RESET;
> +    s->ccr   = TWI_CCR_RESET;
> +    s->srst  = TWI_SRST_RESET;
> +    s->efr   = TWI_EFR_RESET;
> +    s->lcr   = TWI_LCR_RESET;
> +}
> +
> +static inline void allwinner_i2c_raise_interrupt(AWI2CState *s)
> +{
> +    /*
> +     * Raise an interrupt if the device is not reset and it is configured
> +     * to generate some interrupts.
> +     */
> +    if (!allwinner_i2c_is_reset(s) && allwinner_i2c_bus_is_enabled(s)) {
> +        if (STAT_TO_STA(s->stat) != STAT_IDLE) {
> +            s->cntr |= TWI_CNTR_INT_FLAG;
> +            if (allwinner_i2c_interrupt_is_enabled(s)) {
> +                qemu_irq_raise(s->irq);
> +            }
> +        }
> +    }
> +}
> +
> +static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,
> +                                   unsigned size)
> +{
> +    uint16_t value;
> +    AWI2CState *s = AW_I2C(opaque);
> +
> +    switch (offset) {
> +    case TWI_ADDR_REG:
> +        value = s->addr;
> +        break;
> +    case TWI_XADDR_REG:
> +        value = s->xaddr;
> +        break;
> +    case TWI_DATA_REG:
> +        switch (STAT_TO_STA(s->stat)) {
> +        case STAT_M_ADDR_RD_ACK:
> +        case STAT_M_DATA_RX_ACK:
> +        case STAT_M_DATA_RX_NACK:
> +            /* get the next byte */
> +            s->data = i2c_recv(s->bus);
> +
> +            if (s->cntr & TWI_CNTR_A_ACK) {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
> +            } else {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
> +            }
> +            allwinner_i2c_raise_interrupt(s);
> +            break;
>

Looking at this code, here we have a nested switch statement. I just wonder
if it's well defined C programming behavior what really should happen
when calling 'break' in such construction. Should it step out of the first
switch or both? Perhaps it works OK with gcc, but what about other
compilers.
Also for readability, it may be better to avoid nesting switch statements
at all in my opinion.


> +        default:
> +            break;
> +        }
> +        value = s->data;
> +        break;
> +    case TWI_CNTR_REG:
> +        value = s->cntr;
> +        break;
> +    case TWI_STAT_REG:
> +        value = s->stat;
> +        /*
> +         * If polling when reading then change state to indicate data
> +         * is available
> +         */
> +        if (STAT_TO_STA(s->stat) == STAT_M_ADDR_RD_ACK) {
> +            if (s->cntr & TWI_CNTR_A_ACK) {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
> +            } else {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
> +            }
> +            allwinner_i2c_raise_interrupt(s);
> +        }
> +        break;
> +    case TWI_CCR_REG:
> +        value = s->ccr;
> +        break;
> +    case TWI_SRST_REG:
> +        value = s->srst;
> +        break;
> +    case TWI_EFR_REG:
> +        value = s->efr;
> +        break;
> +    case TWI_LCR_REG:
> +        value = s->lcr;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
> +                      HWADDR_PRIx "\n", TYPE_AW_I2C, __func__, offset);
> +        value = 0;
> +        break;
> +    }
> +
> +    DPRINTF("read %s [0x%" HWADDR_PRIx "] -> 0x%02x\n",
> +            allwinner_i2c_get_regname(offset), offset, value);
> +
> +    return (uint64_t)value;
> +}
> +
> +static void allwinner_i2c_write(void *opaque, hwaddr offset,
> +                                uint64_t value, unsigned size)
> +{
> +    AWI2CState *s = AW_I2C(opaque);
> +
> +    DPRINTF("write %s [0x%" HWADDR_PRIx "] <- 0x%02x\n",
> +            allwinner_i2c_get_regname(offset), offset, (int)value);
> +
> +    value &= 0xff;
> +
> +    switch (offset) {
> +    case TWI_ADDR_REG:
> +        s->addr = (uint8_t)value;
> +        break;
> +    case TWI_XADDR_REG:
> +        s->xaddr = (uint8_t)value;
> +        break;
> +    case TWI_DATA_REG:
> +        /* If the device is in reset or not enabled, nothing to do */
> +        if (allwinner_i2c_is_reset(s) ||
> (!allwinner_i2c_bus_is_enabled(s))) {
> +            break;
> +        }
> +
> +        s->data = value & TWI_DATA_MASK;
> +
> +        switch (STAT_TO_STA(s->stat)) {
> +        case STAT_M_STA_TX:
> +        case STAT_M_RSTA_TX:
> +            /* Send address */
> +            if (i2c_start_transfer(s->bus, extract32(s->data, 1, 7),
> +                                extract32(s->data, 0, 1))) {
> +                /* If non zero is returned, the address is not valid */
> +                s->stat = STAT_FROM_STA(STAT_M_ADDR_WR_NACK);
> +            } else {
> +                /* Determine if read of write */
> +                if (extract32(s->data, 0, 1)) {
> +                    s->stat = STAT_FROM_STA(STAT_M_ADDR_RD_ACK);
> +                } else {
> +                    s->stat = STAT_FROM_STA(STAT_M_ADDR_WR_ACK);
> +                }
> +                allwinner_i2c_raise_interrupt(s);
> +            }
> +            break;
> +        case STAT_M_ADDR_WR_ACK:
> +        case STAT_M_DATA_TX_ACK:
> +            if (i2c_send(s->bus, s->data)) {
> +                /* If the target return non zero then end the transfer */
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_TX_NACK);
> +                i2c_end_transfer(s->bus);
> +            } else {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_TX_ACK);
> +                allwinner_i2c_raise_interrupt(s);
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +        break;
> +    case TWI_CNTR_REG:
> +        if (!allwinner_i2c_is_reset(s)) {
> +            /* Do something only if not in software reset */
> +            s->cntr = value & TWI_CNTR_MASK;
> +
> +            /* Check if start condition should be sent */
> +            if (s->cntr & TWI_CNTR_M_STA) {
> +                /* Update status */
> +                if (STAT_TO_STA(s->stat) == STAT_IDLE) {
> +                    /* Send start condition */
> +                    s->stat = STAT_FROM_STA(STAT_M_STA_TX);
> +                } else {
> +                    /* Send repeated start condition */
> +                    s->stat = STAT_FROM_STA(STAT_M_RSTA_TX);
> +                }
> +                /* Clear start condition */
> +                s->cntr &= ~TWI_CNTR_M_STA;
> +            }
> +            if (s->cntr & TWI_CNTR_M_STP) {
> +                /* Update status */
> +                i2c_end_transfer(s->bus);
> +                s->stat = STAT_FROM_STA(STAT_IDLE);
> +                s->cntr &= ~TWI_CNTR_M_STP;
> +            }
> +            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
> +                /* Interrupt flag cleared */
> +                qemu_irq_lower(s->irq);
> +            }
> +            if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
> +                if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) {
> +                    s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
> +                }
> +            } else {
> +                if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_NACK) {
> +                    s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
> +                }
> +            }
> +            allwinner_i2c_raise_interrupt(s);
> +
> +        }
> +        break;
> +    case TWI_CCR_REG:
> +        s->ccr = value & TWI_CCR_MASK;
> +        break;
> +    case TWI_SRST_REG:
> +        if (((value & TWI_SRST_MASK) == 0) && (s->srst & TWI_SRST_MASK)) {
> +            /* Perform reset */
> +            allwinner_i2c_reset_hold(OBJECT(s));
> +        }
> +        s->srst = value & TWI_SRST_MASK;
> +        break;
> +    case TWI_EFR_REG:
> +        s->efr = value & TWI_EFR_MASK;
> +        break;
> +    case TWI_LCR_REG:
> +        s->lcr = value & TWI_LCR_MASK;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
> +                      HWADDR_PRIx "\n", TYPE_AW_I2C, __func__, offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps allwinner_i2c_ops = {
> +    .read = allwinner_i2c_read,
> +    .write = allwinner_i2c_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const VMStateDescription allwinner_i2c_vmstate = {
> +    .name = TYPE_AW_I2C,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(addr, AWI2CState),
> +        VMSTATE_UINT8(xaddr, AWI2CState),
> +        VMSTATE_UINT8(data, AWI2CState),
> +        VMSTATE_UINT8(cntr, AWI2CState),
> +        VMSTATE_UINT8(ccr, AWI2CState),
> +        VMSTATE_UINT8(srst, AWI2CState),
> +        VMSTATE_UINT8(efr, AWI2CState),
> +        VMSTATE_UINT8(lcr, AWI2CState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_i2c_realize(DeviceState *dev, Error **errp)
> +{
> +    AWI2CState *s = AW_I2C(dev);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_i2c_ops, s,
> +                          TYPE_AW_I2C, AW_I2C_MEM_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> +    s->bus = i2c_init_bus(dev, "i2c");
> +}
> +
> +static void allwinner_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    rc->phases.hold = allwinner_i2c_reset_hold;
> +    dc->vmsd = &allwinner_i2c_vmstate;
> +    dc->realize = allwinner_i2c_realize;
> +    dc->desc = "Allwinner I2C Controller";
> +}
> +
> +static const TypeInfo allwinner_i2c_type_info = {
> +    .name = TYPE_AW_I2C,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AWI2CState),
> +    .class_init = allwinner_i2c_class_init,
> +};
> +
> +static void allwinner_i2c_register_types(void)
> +{
> +    type_register_static(&allwinner_i2c_type_info);
> +}
> +
> +type_init(allwinner_i2c_register_types)
> diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
> index d3df273251..7de7f2f540 100644
> --- a/hw/i2c/meson.build
> +++ b/hw/i2c/meson.build
> @@ -8,6 +8,7 @@ i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true:
> files('bitbang_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
> +i2c_ss.add(when: 'CONFIG_ALLWINNER_I2C', if_true:
> files('allwinner-i2c.c'))
>  i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
>  i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
> diff --git a/include/hw/arm/allwinner-a10.h
> b/include/hw/arm/allwinner-a10.h
> index abe4ff7066..763935fca9 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -14,6 +14,7 @@
>  #include "hw/rtc/allwinner-rtc.h"
>  #include "hw/misc/allwinner-a10-ccm.h"
>  #include "hw/misc/allwinner-a10-dramc.h"
> +#include "hw/i2c/allwinner-i2c.h"
>
>  #include "target/arm/cpu.h"
>  #include "qom/object.h"
> @@ -39,6 +40,7 @@ struct AwA10State {
>      AwEmacState emac;
>      AllwinnerAHCIState sata;
>      AwSdHostState mmc0;
> +    AWI2CState i2c0;
>      AwRtcState rtc;
>      MemoryRegion sram_a;
>      EHCISysBusState ehci[AW_A10_NUM_USB];
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 63025fb27c..1d7ce20589 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -47,6 +47,7 @@
>  #include "hw/sd/allwinner-sdhost.h"
>  #include "hw/net/allwinner-sun8i-emac.h"
>  #include "hw/rtc/allwinner-rtc.h"
> +#include "hw/i2c/allwinner-i2c.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -82,6 +83,7 @@ enum {
>      AW_H3_DEV_UART2,
>      AW_H3_DEV_UART3,
>      AW_H3_DEV_EMAC,
> +    AW_H3_DEV_TWI0,
>      AW_H3_DEV_DRAMCOM,
>      AW_H3_DEV_DRAMCTL,
>      AW_H3_DEV_DRAMPHY,
> @@ -130,6 +132,7 @@ struct AwH3State {
>      AwH3SysCtrlState sysctrl;
>      AwSidState sid;
>      AwSdHostState mmc0;
> +    AWI2CState i2c0;
>      AwSun8iEmacState emac;
>      AwRtcState rtc;
>      GICState gic;
> diff --git a/include/hw/i2c/allwinner-i2c.h
> b/include/hw/i2c/allwinner-i2c.h
> new file mode 100644
> index 0000000000..1e3169a5b9
> --- /dev/null
> +++ b/include/hw/i2c/allwinner-i2c.h
> @@ -0,0 +1,112 @@
> +/*
> + *  Allwinner I2C Bus Serial Interface registers definition
> + *
> + *  Copyright (C) 2022 Strahinja Jankovic. <
> strahinja.p.jankovic@gmail.com>
> + *
> + *  This file is derived from IMX I2C controller,
> + *  by Jean-Christophe DUBOIS .
> + *
> + *  This program is free software; you can redistribute it and/or modify
> it
> + *  under the terms of the GNU General Public License as published by the
> + *  Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but
> WITHOUT
> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + *  for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> along
> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#ifndef ALLWINNER_I2C_H
> +#define ALLWINNER_I2C_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_AW_I2C "allwinner.i2c"
> +OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)
> +
> +#define AW_I2C_MEM_SIZE         0x24
> +
> +/* Allwinner I2C memory map */
> +#define TWI_ADDR_REG            0x00  /* slave address register */
> +#define TWI_XADDR_REG           0x04  /* extended slave address register
> */
> +#define TWI_DATA_REG            0x08  /* data register */
> +#define TWI_CNTR_REG            0x0c  /* control register */
> +#define TWI_STAT_REG            0x10  /* status register */
> +#define TWI_CCR_REG             0x14  /* clock control register */
> +#define TWI_SRST_REG            0x18  /* software reset register */
> +#define TWI_EFR_REG             0x1c  /* enhance feature register */
> +#define TWI_LCR_REG             0x20  /* line control register */
> +
>
If no other modules except for the new driver need these defines, it may be
a good idea to move them to the .c file instead.
Doing so helps avoiding accidental or unintentional use of the defines.
Same for the other flags below.


> +/* Used only in slave mode, do not set */
> +#define TWI_ADDR_RESET          0
> +#define TWI_XADDR_RESET         0
> +
> +/* Data register */
> +#define TWI_DATA_MASK           0xFF
> +#define TWI_DATA_RESET          0
> +
> +/* Control register */
> +#define TWI_CNTR_INT_EN         (1 << 7)
> +#define TWI_CNTR_BUS_EN         (1 << 6)
> +#define TWI_CNTR_M_STA          (1 << 5)
> +#define TWI_CNTR_M_STP          (1 << 4)
> +#define TWI_CNTR_INT_FLAG       (1 << 3)
> +#define TWI_CNTR_A_ACK          (1 << 2)
> +#define TWI_CNTR_MASK           0xFC
> +#define TWI_CNTR_RESET          0
> +
> +/* Status register */
> +#define TWI_STAT_MASK           0xF8
> +#define TWI_STAT_RESET          0xF8
> +
> +/* Clock register */
> +#define TWI_CCR_CLK_M_MASK      0x78
> +#define TWI_CCR_CLK_N_MASK      0x07
> +#define TWI_CCR_MASK            0x7F
> +#define TWI_CCR_RESET           0
> +
> +/* Soft reset */
> +#define TWI_SRST_MASK           0x01
> +#define TWI_SRST_RESET          0
> +
> +/* Enhance feature */
> +#define TWI_EFR_MASK            0x03
> +#define TWI_EFR_RESET           0
> +
> +/* Line control */
> +#define TWI_LCR_SCL_STATE       (1 << 5)
> +#define TWI_LCR_SDA_STATE       (1 << 4)
> +#define TWI_LCR_SCL_CTL         (1 << 3)
> +#define TWI_LCR_SCL_CTL_EN      (1 << 2)
> +#define TWI_LCR_SDA_CTL         (1 << 1)
> +#define TWI_LCR_SDA_CTL_EN      (1 << 0)
> +#define TWI_LCR_MASK            0x3F
> +#define TWI_LCR_RESET           0x3A
> +
> +struct AWI2CState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    I2CBus *bus;
> +    qemu_irq irq;
> +
> +    uint8_t addr;
> +    uint8_t xaddr;
> +    uint8_t data;
> +    uint8_t cntr;
> +    uint8_t stat;
> +    uint8_t ccr;
> +    uint8_t srst;
> +    uint8_t efr;
> +    uint8_t lcr;
> +};
> +
> +#endif /* ALLWINNER_I2C_H */
> --
> 2.30.2
>
>
Regards,
Niek

-- 
Niek Linnenbank

--000000000000e04d3605ef442120
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Strahinja,</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 4, 20=
22 at 12:19 AM Strahinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@=
gmail.com">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">This patch implements Allwinner TWI/=
I2C controller emulation. Only<br>
master-mode functionality is implemented.<br>
<br>
The SPL boot for Cubieboard expects AXP209 PMIC on TWI0/I2C0 bus, so this i=
s<br>
first part enabling the TWI/I2C bus operation.<br>
<br>
Since both Allwinner A10 and H3 use the same module, it is added for<br>
both boards.<br></blockquote><div><br></div><div><div>The A10 and H3 datash=
eets have the same introduction text on the TWI, suggesting re-use indeed. =
Unfortunately</div><div>the A10 datasheet seems to be missing register docu=
mentation, so I can&#39;t compare that with the H3 datasheet.<br></div><div=
><br></div></div><div><div>At least according to what is implemented in the=
 linux kernel, looks like that indeed both SoCs implement the same I2C modu=
le.</div><div>The file drivers/i2c/busses/i2c-mv64xxx.c has the following m=
v64xxx_i2c_of_match_table:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compati=
ble =3D &quot;allwinner,sun4i-a10-i2c&quot;, .data =3D &amp;mv64xxx_i2c_reg=
s_sun4i},<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 { .compatible =3D &quot;allwinner,=
sun6i-a31-i2c&quot;, .data =3D &amp;mv64xxx_i2c_regs_sun4i},</div><div><br>=
</div><div>And both SoCs define the sun4i-a10-i2c and sun6i-a31-i2c in thei=
r device tree files, respectively.</div><div><br></div></div><div>Could you=
 please also update the documentation files for both boards, so we can show=
 that they now support TWI/I2C?</div><div>=C2=A0 docs/system/arm/cubieboard=
.rst</div><div>=C2=A0 docs/system/arm/orangepi.rst<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-=
<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 417 +++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/allwinner-a10.h |=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/arm/allwinner-h3.h=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0include/hw/i2c/allwinner-i2c.h | 112 +++++++++<br>
=C2=A09 files changed, 559 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/i2c/allwinner-i2c.c<br>
=C2=A0create mode 100644 include/hw/i2c/allwinner-i2c.h<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 140f142ae5..eefe1fd134 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -322,6 +322,7 @@ config ALLWINNER_A10<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_CCM<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_DRAMC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_EMAC<br>
+=C2=A0 =C2=A0 select ALLWINNER_I2C<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
<br>
@@ -329,6 +330,7 @@ config ALLWINNER_H3<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIT<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_SUN8I_EMAC<br>
+=C2=A0 =C2=A0 select ALLWINNER_I2C<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select ARM_TIMER<br>
=C2=A0 =C2=A0 =C2=A0select ARM_GIC<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index a5f7a36ac9..17e439777e 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -36,6 +36,7 @@<br>
=C2=A0#define AW_A10_OHCI_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c14400<br>
=C2=A0#define AW_A10_SATA_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c18000<br>
=C2=A0#define AW_A10_RTC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20d00<b=
r>
+#define AW_A10_I2C0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2ac00<br>
<br>
=C2=A0static void aw_a10_init(Object *obj)<br>
=C2=A0{<br>
@@ -56,6 +57,8 @@ static void aw_a10_init(Object *obj)<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;sata&quot;, &amp;s-&=
gt;sata, TYPE_ALLWINNER_AHCI);<br>
<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;i2c0&quot;, &amp;s-&gt;i2=
c0, TYPE_AW_I2C);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (machine_usb(current_machine)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
@@ -176,6 +179,11 @@ static void aw_a10_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0/* RTC */<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;rtc), &amp;err=
or_fatal);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&amp;s-&gt;rtc),=
 0, AW_A10_RTC_BASE, 10);<br>
+<br>
+=C2=A0 =C2=A0 /* I2C */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), &amp;error_f=
atal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, AW_A10_I=
2C0_BASE);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, qdev_=
get_gpio_in(dev, 7));<br>
=C2=A0}<br>
<br>
=C2=A0static void aw_a10_class_init(ObjectClass *oc, void *data)<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index 308ed15552..bfce3c8d92 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -53,6 +53,7 @@ const hwaddr allwinner_h3_memmap[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART1]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28400,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART2]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28800,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_UART3]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c28c00,<b=
r>
+=C2=A0 =C2=A0 [AW_H3_DEV_TWI0]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c2ac00,<b=
r>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_EMAC]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c300=
00,<br>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_DRAMCOM]=C2=A0 =C2=A0 =3D 0x01c62000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_H3_DEV_DRAMCTL]=C2=A0 =C2=A0 =3D 0x01c63000,<br>
@@ -106,7 +107,6 @@ struct AwH3Unimplemented {<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;uart1&quot;,=C2=A0 =C2=A0 =C2=A00x01c28400, 1 *=
 KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;uart2&quot;,=C2=A0 =C2=A0 =C2=A00x01c28800, 1 *=
 KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;uart3&quot;,=C2=A0 =C2=A0 =C2=A00x01c28c00, 1 *=
 KiB },<br>
-=C2=A0 =C2=A0 { &quot;twi0&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c2ac00, 1 * KiB =
},<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;twi1&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c2b000, 1 *=
 KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;twi2&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c2b400, 1 *=
 KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;scr&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2c400=
, 1 * KiB },<br>
@@ -150,6 +150,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_UART1=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 1,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_UART2=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 2,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_UART3=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 3,<br>
+=C2=A0 =C2=A0 AW_H3_GIC_SPI_TWI0=C2=A0 =C2=A0 =C2=A0 =3D=C2=A0 6,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_TIMER0=C2=A0 =C2=A0 =3D 18,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_TIMER1=C2=A0 =C2=A0 =3D 19,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_GIC_SPI_MMC0=C2=A0 =C2=A0 =C2=A0 =3D 60,<br>
@@ -225,6 +226,8 @@ static void allwinner_h3_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ram-size&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;rtc&quot;, &amp;s-&g=
t;rtc, TYPE_AW_RTC_SUN6I);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;twi0&quot;, &amp;s-&gt;i2=
c0, TYPE_AW_I2C);<br>
=C2=A0}<br>
<br>
=C2=A0static void allwinner_h3_realize(DeviceState *dev, Error **errp)<br>
@@ -423,6 +426,12 @@ static void allwinner_h3_realize(DeviceState *dev, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;rtc), &amp;err=
or_fatal);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;rtc), 0, s-&g=
t;memmap[AW_H3_DEV_RTC]);<br>
<br>
+=C2=A0 =C2=A0 /* I2C */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), &amp;error_f=
atal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, s-&gt;me=
mmap[AW_H3_DEV_TWI0]);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_H3_GIC_SPI_TWI0));<br=
>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Unimplemented devices */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(unimplemented); i++) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(unimplemented=
[i].device_name,<br>
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig<br>
index 9bb8870517..f8ec461be3 100644<br>
--- a/hw/i2c/Kconfig<br>
+++ b/hw/i2c/Kconfig<br>
@@ -34,6 +34,10 @@ config MPC_I2C<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
<br>
+config ALLWINNER_I2C<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select I2C<br>
+<br>
=C2=A0config PCA954X<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c<br>
new file mode 100644<br>
index 0000000000..4c9080a18b<br>
--- /dev/null<br>
+++ b/hw/i2c/allwinner-i2c.c<br>
@@ -0,0 +1,417 @@<br>
+/*<br>
+ *=C2=A0 Allwinner I2C Bus Serial Interface Emulation<br>
+ *<br>
+ *=C2=A0 Copyright (C) 2022 Strahinja Jankovic &lt;<a href=3D"mailto:strah=
inja.p.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com=
</a>&gt;<br>
+ *<br>
+ *=C2=A0 This file is derived from IMX I2C controller,<br>
+ *=C2=A0 by Jean-Christophe DUBOIS .<br>
+ *<br>
+ *=C2=A0 This program is free software; you can redistribute it and/or mod=
ify it<br>
+ *=C2=A0 under the terms of the GNU General Public License as published by=
 the<br>
+ *=C2=A0 Free Software Foundation; either version 2 of the License, or<br>
+ *=C2=A0 (at your option) any later version.<br>
+ *<br>
+ *=C2=A0 This program is distributed in the hope that it will be useful, b=
ut WITHOUT<br>
+ *=C2=A0 ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or<br>
+ *=C2=A0 FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lice=
nse<br>
+ *=C2=A0 for more details.<br>
+ *<br>
+ *=C2=A0 You should have received a copy of the GNU General Public License=
 along<br>
+ *=C2=A0 with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;hw/i2c/i2c.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+<br>
+#ifndef DEBUG_AW_I2C<br>
+#define DEBUG_AW_I2C 0<br>
+#endif<br>
+<br>
+#define DPRINTF(fmt, args...) \<br>
+=C2=A0 =C2=A0 do { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (DEBUG_AW_I2C) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;[%s]%s: &q=
uot; fmt , TYPE_AW_I2C, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0__func__, ##args); \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
+=C2=A0 =C2=A0 } while (0)<br></blockquote><div>As Philipe already suggeste=
d earlier, this could be replaced with tracing. Maybe have a look at some o=
f the other I2C drivers to see how its done, for example aspeed_i2c.c.<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+/* Status value in STAT register is shifted by 3 bits */<br>
+#define TWI_STAT_SHIFT=C2=A0 =C2=A0 =C2=A0 3<br>
+#define STAT_FROM_STA(x)=C2=A0 =C2=A0 ((x) &lt;&lt; TWI_STAT_SHIFT)<br>
+#define STAT_TO_STA(x)=C2=A0 =C2=A0 =C2=A0 ((x) &gt;&gt; TWI_STAT_SHIFT)<b=
r></blockquote><div>Maybe add a newline here for readability.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+enum {<br>
+=C2=A0 =C2=A0 STAT_BUS_ERROR =3D 0,<br>
+=C2=A0 =C2=A0 /* Master mode */<br>
+=C2=A0 =C2=A0 STAT_M_STA_TX,<br>
+=C2=A0 =C2=A0 STAT_M_RSTA_TX,<br>
+=C2=A0 =C2=A0 STAT_M_ADDR_WR_ACK,<br>
+=C2=A0 =C2=A0 STAT_M_ADDR_WR_NACK,<br>
+=C2=A0 =C2=A0 STAT_M_DATA_TX_ACK,<br>
+=C2=A0 =C2=A0 STAT_M_DATA_TX_NACK,<br>
+=C2=A0 =C2=A0 STAT_M_ARB_LOST,<br>
+=C2=A0 =C2=A0 STAT_M_ADDR_RD_ACK,<br>
+=C2=A0 =C2=A0 STAT_M_ADDR_RD_NACK,<br>
+=C2=A0 =C2=A0 STAT_M_DATA_RX_ACK,<br>
+=C2=A0 =C2=A0 STAT_M_DATA_RX_NACK,<br>
+=C2=A0 =C2=A0 /* Slave mode */<br>
+=C2=A0 =C2=A0 STAT_S_ADDR_WR_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_ARB_LOST_AW_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_GCA_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_ARB_LOST_GCA_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_RX_SA_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_RX_SA_NACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_RX_GCA_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_RX_GCA_NACK,<br>
+=C2=A0 =C2=A0 STAT_S_STP_RSTA,<br>
+=C2=A0 =C2=A0 STAT_S_ADDR_RD_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_ARB_LOST_AR_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_TX_ACK,<br>
+=C2=A0 =C2=A0 STAT_S_DATA_TX_NACK,<br>
+=C2=A0 =C2=A0 STAT_S_LB_TX_ACK,<br>
+=C2=A0 =C2=A0 /* Master mode, 10-bit */<br>
+=C2=A0 =C2=A0 STAT_M_2ND_ADDR_WR_ACK,<br>
+=C2=A0 =C2=A0 STAT_M_2ND_ADDR_WR_NACK,<br>
+=C2=A0 =C2=A0 /* Idle */<br>
+=C2=A0 =C2=A0 STAT_IDLE =3D 0x1f<br>
+} TWI_STAT_STA;<br>
+<br>
+static const char *allwinner_i2c_get_regname(unsigned offset)<br>
+{<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case TWI_ADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;ADDR&quot;;<br>
+=C2=A0 =C2=A0 case TWI_XADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;XADDR&quot;;<br>
+=C2=A0 =C2=A0 case TWI_DATA_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;DATA&quot;;<br>
+=C2=A0 =C2=A0 case TWI_CNTR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;CNTR&quot;;<br>
+=C2=A0 =C2=A0 case TWI_STAT_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;STAT&quot;;<br>
+=C2=A0 =C2=A0 case TWI_CCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;CCR&quot;;<br>
+=C2=A0 =C2=A0 case TWI_SRST_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;SRST&quot;;<br>
+=C2=A0 =C2=A0 case TWI_EFR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;EFR&quot;;<br>
+=C2=A0 =C2=A0 case TWI_LCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;LCR&quot;;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;[?]&quot;;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static inline bool allwinner_i2c_is_reset(AWI2CState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return s-&gt;srst &amp; TWI_SRST_MASK;<br>
+}<br>
+<br>
+static inline bool allwinner_i2c_bus_is_enabled(AWI2CState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return s-&gt;cntr &amp; TWI_CNTR_BUS_EN;<br>
+}<br>
+<br>
+static inline bool allwinner_i2c_interrupt_is_enabled(AWI2CState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return s-&gt;cntr &amp; TWI_CNTR_INT_EN;<br>
+}<br>
+<br>
+static void allwinner_i2c_reset_hold(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 AWI2CState *s =3D AW_I2C(obj);<br>
+<br>
+=C2=A0 =C2=A0 if (STAT_TO_STA(s-&gt;stat) !=3D STAT_IDLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c_end_transfer(s-&gt;bus);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;addr=C2=A0 =3D TWI_ADDR_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;xaddr =3D TWI_XADDR_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;data=C2=A0 =3D TWI_DATA_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;cntr=C2=A0 =3D TWI_CNTR_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;stat=C2=A0 =3D TWI_STAT_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;ccr=C2=A0 =C2=A0=3D TWI_CCR_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;srst=C2=A0 =3D TWI_SRST_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;efr=C2=A0 =C2=A0=3D TWI_EFR_RESET;<br>
+=C2=A0 =C2=A0 s-&gt;lcr=C2=A0 =C2=A0=3D TWI_LCR_RESET;<br>
+}<br>
+<br>
+static inline void allwinner_i2c_raise_interrupt(AWI2CState *s)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Raise an interrupt if the device is not reset and it=
 is configured<br>
+=C2=A0 =C2=A0 =C2=A0* to generate some interrupts.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!allwinner_i2c_is_reset(s) &amp;&amp; allwinner_i2c_bus_=
is_enabled(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (STAT_TO_STA(s-&gt;stat) !=3D STAT_IDLE) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;cntr |=3D TWI_CNTR_INT_FLA=
G;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allwinner_i2c_interrupt_is_e=
nabled(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&=
gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint64_t allwinner_i2c_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t value;<br>
+=C2=A0 =C2=A0 AWI2CState *s =3D AW_I2C(opaque);<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case TWI_ADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_XADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;xaddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_DATA_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (STAT_TO_STA(s-&gt;stat)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_ADDR_RD_ACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_DATA_RX_ACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_DATA_RX_NACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get the next byte */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;data =3D i2c_recv(s-&gt;bu=
s);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;cntr &amp; TWI_CNTR_A_=
ACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_RX_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_RX_NACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_raise_interrupt(s)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br></blockquote><div><br>=
</div><div>Looking at this code, here we have a nested switch statement. I =
just wonder if it&#39;s well defined C programming behavior what really sho=
uld happen</div><div>when calling &#39;break&#39; in such construction. Sho=
uld it step out of the first switch or both? Perhaps it works OK with gcc, =
but what about other compilers.</div><div>Also for readability, it may be b=
etter to avoid nesting switch statements at all in my opinion.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_CNTR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;cntr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_STAT_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;stat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If polling when reading then change st=
ate to indicate data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (STAT_TO_STA(s-&gt;stat) =3D=3D STAT_M_ADDR=
_RD_ACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;cntr &amp; TWI_CNTR_A_=
ACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_RX_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_RX_NACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_raise_interrupt(s)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_CCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;ccr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_SRST_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;srst;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_EFR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;efr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_LCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D s-&gt;lcr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;[%s]%s: B=
ad address at offset 0x%&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 HWADDR_PRIx &quot;\n&quot;, TYPE_AW_I2C, __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 DPRINTF(&quot;read %s [0x%&quot; HWADDR_PRIx &quot;] -&gt; 0=
x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_get_regname(offset=
), offset, value);<br>
+<br>
+=C2=A0 =C2=A0 return (uint64_t)value;<br>
+}<br>
+<br>
+static void allwinner_i2c_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 AWI2CState *s =3D AW_I2C(opaque);<br>
+<br>
+=C2=A0 =C2=A0 DPRINTF(&quot;write %s [0x%&quot; HWADDR_PRIx &quot;] &lt;- =
0x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_get_regname(offset=
), offset, (int)value);<br>
+<br>
+=C2=A0 =C2=A0 value &amp;=3D 0xff;<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case TWI_ADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;addr =3D (uint8_t)value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_XADDR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;xaddr =3D (uint8_t)value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_DATA_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the device is in reset or not enabled, n=
othing to do */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allwinner_i2c_is_reset(s) || (!allwinner_i=
2c_bus_is_enabled(s))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;data =3D value &amp; TWI_DATA_MASK;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (STAT_TO_STA(s-&gt;stat)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_STA_TX:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_RSTA_TX:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Send address */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i2c_start_transfer(s-&gt;bus=
, extract32(s-&gt;data, 1, 7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extract32(s-&gt;data, 0, 1))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If non zero is =
returned, the address is not valid */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_ADDR_WR_NACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Determine if re=
ad of write */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (extract32(s-&g=
t;data, 0, 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_ADDR_RD_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_ADDR_WR_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_rais=
e_interrupt(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_ADDR_WR_ACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case STAT_M_DATA_TX_ACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i2c_send(s-&gt;bus, s-&gt;da=
ta)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the target r=
eturn non zero then end the transfer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_TX_NACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c_end_transfer(s=
-&gt;bus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_M_DATA_TX_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_rais=
e_interrupt(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_CNTR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!allwinner_i2c_is_reset(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do something only if not in s=
oftware reset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;cntr =3D value &amp; TWI_C=
NTR_MASK;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if start condition shou=
ld be sent */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;cntr &amp; TWI_CNTR_M_=
STA) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update status *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (STAT_TO_STA(s-=
&gt;stat) =3D=3D STAT_IDLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* S=
end start condition */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_STA_TX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* S=
end repeated start condition */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_RSTA_TX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear start con=
dition */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;cntr &amp;=
=3D ~TWI_CNTR_M_STA;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;cntr &amp; TWI_CNTR_M_=
STP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Update status *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c_end_transfer(s=
-&gt;bus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;stat =3D STA=
T_FROM_STA(STAT_IDLE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;cntr &amp;=
=3D ~TWI_CNTR_M_STP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((s-&gt;cntr &amp; TWI_CNTR_I=
NT_FLAG) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt flag =
cleared */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&=
gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((s-&gt;cntr &amp; TWI_CNTR_A=
_ACK) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (STAT_TO_STA(s-=
&gt;stat) =3D=3D STAT_M_DATA_RX_ACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_DATA_RX_NACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (STAT_TO_STA(s-=
&gt;stat) =3D=3D STAT_M_DATA_RX_NACK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&g=
t;stat =3D STAT_FROM_STA(STAT_M_DATA_RX_ACK);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_raise_interrupt(s)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_CCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;ccr =3D value &amp; TWI_CCR_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_SRST_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((value &amp; TWI_SRST_MASK) =3D=3D 0) &am=
p;&amp; (s-&gt;srst &amp; TWI_SRST_MASK)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Perform reset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_i2c_reset_hold(OBJECT(=
s));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;srst =3D value &amp; TWI_SRST_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_EFR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;efr =3D value &amp; TWI_EFR_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TWI_LCR_REG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;lcr =3D value &amp; TWI_LCR_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;[%s]%s: B=
ad address at offset 0x%&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 HWADDR_PRIx &quot;\n&quot;, TYPE_AW_I2C, __func__, offset);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps allwinner_i2c_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D allwinner_i2c_read,<br>
+=C2=A0 =C2=A0 .write =3D allwinner_i2c_write,<br>
+=C2=A0 =C2=A0 .valid.min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 .valid.max_access_size =3D 4,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+};<br>
+<br>
+static const VMStateDescription allwinner_i2c_vmstate =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_AW_I2C,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(addr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(xaddr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(data, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(cntr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(ccr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(srst, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(efr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(lcr, AWI2CState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void allwinner_i2c_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 AWI2CState *s =3D AW_I2C(dev);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp;allw=
inner_i2c_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_AW_I2C, AW_I2C_MEM_SIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVICE(dev), &amp;s-&gt;iomem);<br>
+=C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_DEVICE(dev), &amp;s-&gt;irq);<br>
+=C2=A0 =C2=A0 s-&gt;bus =3D i2c_init_bus(dev, &quot;i2c&quot;);<br>
+}<br>
+<br>
+static void allwinner_i2c_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 rc-&gt;phases.hold =3D allwinner_i2c_reset_hold;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_i2c_vmstate;<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D allwinner_i2c_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;Allwinner I2C Controller&quot;;<br>
+}<br>
+<br>
+static const TypeInfo allwinner_i2c_type_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_AW_I2C,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(AWI2CState),<br>
+=C2=A0 =C2=A0 .class_init =3D allwinner_i2c_class_init,<br>
+};<br>
+<br>
+static void allwinner_i2c_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;allwinner_i2c_type_info);<br>
+}<br>
+<br>
+type_init(allwinner_i2c_register_types)<br>
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build<br>
index d3df273251..7de7f2f540 100644<br>
--- a/hw/i2c/meson.build<br>
+++ b/hw/i2c/meson.build<br>
@@ -8,6 +8,7 @@ i2c_ss.add(when: &#39;CONFIG_BITBANG_I2C&#39;, if_true: fil=
es(&#39;bitbang_i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_EXYNOS4&#39;, if_true: files(&#39;exynos=
4210_i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_IMX_I2C&#39;, if_true: files(&#39;imx_i2=
c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_MPC_I2C&#39;, if_true: files(&#39;mpc_i2=
c.c&#39;))<br>
+i2c_ss.add(when: &#39;CONFIG_ALLWINNER_I2C&#39;, if_true: files(&#39;allwi=
nner-i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_NRF51_SOC&#39;, if_true: files(&#39;micr=
obit_i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_NPCM7XX&#39;, if_true: files(&#39;npcm7x=
x_smbus.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_SMBUS_EEPROM&#39;, if_true: files(&#39;s=
mbus_eeprom.c&#39;))<br>
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.=
h<br>
index abe4ff7066..763935fca9 100644<br>
--- a/include/hw/arm/allwinner-a10.h<br>
+++ b/include/hw/arm/allwinner-a10.h<br>
@@ -14,6 +14,7 @@<br>
=C2=A0#include &quot;hw/rtc/allwinner-rtc.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-dramc.h&quot;<br>
+#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -39,6 +40,7 @@ struct AwA10State {<br>
=C2=A0 =C2=A0 =C2=A0AwEmacState emac;<br>
=C2=A0 =C2=A0 =C2=A0AllwinnerAHCIState sata;<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState mmc0;<br>
+=C2=A0 =C2=A0 AWI2CState i2c0;<br>
=C2=A0 =C2=A0 =C2=A0AwRtcState rtc;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a;<br>
=C2=A0 =C2=A0 =C2=A0EHCISysBusState ehci[AW_A10_NUM_USB];<br>
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h<=
br>
index 63025fb27c..1d7ce20589 100644<br>
--- a/include/hw/arm/allwinner-h3.h<br>
+++ b/include/hw/arm/allwinner-h3.h<br>
@@ -47,6 +47,7 @@<br>
=C2=A0#include &quot;hw/sd/allwinner-sdhost.h&quot;<br>
=C2=A0#include &quot;hw/net/allwinner-sun8i-emac.h&quot;<br>
=C2=A0#include &quot;hw/rtc/allwinner-rtc.h&quot;<br>
+#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
<br>
@@ -82,6 +83,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_UART2,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_UART3,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_EMAC,<br>
+=C2=A0 =C2=A0 AW_H3_DEV_TWI0,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_DRAMCOM,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_DRAMCTL,<br>
=C2=A0 =C2=A0 =C2=A0AW_H3_DEV_DRAMPHY,<br>
@@ -130,6 +132,7 @@ struct AwH3State {<br>
=C2=A0 =C2=A0 =C2=A0AwH3SysCtrlState sysctrl;<br>
=C2=A0 =C2=A0 =C2=A0AwSidState sid;<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState mmc0;<br>
+=C2=A0 =C2=A0 AWI2CState i2c0;<br>
=C2=A0 =C2=A0 =C2=A0AwSun8iEmacState emac;<br>
=C2=A0 =C2=A0 =C2=A0AwRtcState rtc;<br>
=C2=A0 =C2=A0 =C2=A0GICState gic;<br>
diff --git a/include/hw/i2c/allwinner-i2c.h b/include/hw/i2c/allwinner-i2c.=
h<br>
new file mode 100644<br>
index 0000000000..1e3169a5b9<br>
--- /dev/null<br>
+++ b/include/hw/i2c/allwinner-i2c.h<br>
@@ -0,0 +1,112 @@<br>
+/*<br>
+ *=C2=A0 Allwinner I2C Bus Serial Interface registers definition<br>
+ *<br>
+ *=C2=A0 Copyright (C) 2022 Strahinja Jankovic. &lt;<a href=3D"mailto:stra=
hinja.p.jankovic@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.co=
m</a>&gt;<br>
+ *<br>
+ *=C2=A0 This file is derived from IMX I2C controller,<br>
+ *=C2=A0 by Jean-Christophe DUBOIS .<br>
+ *<br>
+ *=C2=A0 This program is free software; you can redistribute it and/or mod=
ify it<br>
+ *=C2=A0 under the terms of the GNU General Public License as published by=
 the<br>
+ *=C2=A0 Free Software Foundation; either version 2 of the License, or<br>
+ *=C2=A0 (at your option) any later version.<br>
+ *<br>
+ *=C2=A0 This program is distributed in the hope that it will be useful, b=
ut WITHOUT<br>
+ *=C2=A0 ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or<br>
+ *=C2=A0 FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Lice=
nse<br>
+ *=C2=A0 for more details.<br>
+ *<br>
+ *=C2=A0 You should have received a copy of the GNU General Public License=
 along<br>
+ *=C2=A0 with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef ALLWINNER_I2C_H<br>
+#define ALLWINNER_I2C_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+#define TYPE_AW_I2C &quot;allwinner.i2c&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)<br>
+<br>
+#define AW_I2C_MEM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x24<br>
+<br>
+/* Allwinner I2C memory map */<br>
+#define TWI_ADDR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00=C2=A0 /=
* slave address register */<br>
+#define TWI_XADDR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04=C2=A0 /=
* extended slave address register */<br>
+#define TWI_DATA_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x08=C2=A0 /=
* data register */<br>
+#define TWI_CNTR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0c=C2=A0 /=
* control register */<br>
+#define TWI_STAT_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10=C2=A0 /=
* status register */<br>
+#define TWI_CCR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x14=C2=
=A0 /* clock control register */<br>
+#define TWI_SRST_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x18=C2=A0 /=
* software reset register */<br>
+#define TWI_EFR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1c=C2=
=A0 /* enhance feature register */<br>
+#define TWI_LCR_REG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x20=C2=
=A0 /* line control register */<br>
+<br></blockquote><div>If no other modules except for the new driver need t=
hese defines, it may be a good idea to move them to the .c file instead.</d=
iv><div>Doing so helps avoiding accidental or unintentional use of the defi=
nes. Same for the other flags below.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+/* Used only in slave mode, do not set */<br>
+#define TWI_ADDR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+#define TWI_XADDR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+<br>
+/* Data register */<br>
+#define TWI_DATA_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF<br>
+#define TWI_DATA_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+<br>
+/* Control register */<br>
+#define TWI_CNTR_INT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br=
>
+#define TWI_CNTR_BUS_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br=
>
+#define TWI_CNTR_M_STA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 5)<br=
>
+#define TWI_CNTR_M_STP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 4)<br=
>
+#define TWI_CNTR_INT_FLAG=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 3)<br>
+#define TWI_CNTR_A_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 2)<br=
>
+#define TWI_CNTR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFC<br>
+#define TWI_CNTR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+<br>
+/* Status register */<br>
+#define TWI_STAT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xF8<br>
+#define TWI_STAT_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xF8<br>
+<br>
+/* Clock register */<br>
+#define TWI_CCR_CLK_M_MASK=C2=A0 =C2=A0 =C2=A0 0x78<br>
+#define TWI_CCR_CLK_N_MASK=C2=A0 =C2=A0 =C2=A0 0x07<br>
+#define TWI_CCR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x7F<br>
+#define TWI_CCR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+<br>
+/* Soft reset */<br>
+#define TWI_SRST_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01<br>
+#define TWI_SRST_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
+<br>
+/* Enhance feature */<br>
+#define TWI_EFR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03<br>
+#define TWI_EFR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+<br>
+/* Line control */<br>
+#define TWI_LCR_SCL_STATE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 5)<br>
+#define TWI_LCR_SDA_STATE=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 4)<br>
+#define TWI_LCR_SCL_CTL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 3)<br=
>
+#define TWI_LCR_SCL_CTL_EN=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 2)<br>
+#define TWI_LCR_SDA_CTL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1)<br=
>
+#define TWI_LCR_SDA_CTL_EN=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
+#define TWI_LCR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x3F<br>
+#define TWI_LCR_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x3A<br>
+<br>
+struct AWI2CState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+=C2=A0 =C2=A0 I2CBus *bus;<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+<br>
+=C2=A0 =C2=A0 uint8_t addr;<br>
+=C2=A0 =C2=A0 uint8_t xaddr;<br>
+=C2=A0 =C2=A0 uint8_t data;<br>
+=C2=A0 =C2=A0 uint8_t cntr;<br>
+=C2=A0 =C2=A0 uint8_t stat;<br>
+=C2=A0 =C2=A0 uint8_t ccr;<br>
+=C2=A0 =C2=A0 uint8_t srst;<br>
+=C2=A0 =C2=A0 uint8_t efr;<br>
+=C2=A0 =C2=A0 uint8_t lcr;<br>
+};<br>
+<br>
+#endif /* ALLWINNER_I2C_H */<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br><div>Regards,</div><div>Niek<br></div><br>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Niek Linnenba=
nk<br><br></div></div></div></div>

--000000000000e04d3605ef442120--

