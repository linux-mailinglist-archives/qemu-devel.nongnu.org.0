Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E46586C5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 21:37:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAd9x-00013M-B8; Wed, 28 Dec 2022 15:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pAd9h-00011E-T4; Wed, 28 Dec 2022 15:36:05 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pAd9U-0001j2-Ag; Wed, 28 Dec 2022 15:35:56 -0500
Received: by mail-yb1-xb33.google.com with SMTP id t15so18582302ybq.4;
 Wed, 28 Dec 2022 12:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HIr1YgF4Y04cRB4ccM3VFYhYkNLtXm5EZeiolYatGc8=;
 b=cHj3LqYnxW6iOyAlkH+S/lEM0u7w2eSreZTHzXPQECS6LFeCk/WqVT2FpZASg+411Z
 4aYCLy6oz9EkeGY2iJKJx/BacXqBP7xYK4huGzTX1eXbeFlXbtIn5BgyuIitem3wdCMY
 MeFmVtJifEybwF1gYPZqYMfPVSb0bs2sWnUWGngMHSRKd0h0PcLtG8kJl4gP0rGtZfZr
 nOnFQpGr2kLyGw1C6jGaWIMquuDGJuYg52v+Yx7pfKXY7PAwKSRVQ30oK8aLw+6JMEEK
 U9pUgb5N+UTle0QJEjDS7CFH6TMIBH7AZVMyJEYtYR2RsuJhpYQt5H69jsK2Uhpck8wC
 yKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIr1YgF4Y04cRB4ccM3VFYhYkNLtXm5EZeiolYatGc8=;
 b=B/dT6Fb8RKzoEvh0B1saB+ctlF3tuUZ4HqDxHQZZAHL2Qil08MzDwJQEEkfW/whbcQ
 HVla7eZHqNMGNt8Np8JC+9EIvsKwhOMRebMQBASfQRFcw/e3HGXTPyaU9Zbe4NE5wuM4
 6RsUc0LjWWldj29LZzAmPnDAx2OxNZYi8APruesp/Pm+xwPidMQdLzQd07Xa14zQkcRv
 gD303A5eoNB1p5m/5Ql3Q7uceuZ+VRQfVlDV54b5wHUCxldq2yx7t6wKt8fNJh0XrM5j
 H0VEkWBqtpadMyJ6RF5D6gjiBpQ3wW6fRwyYs7sq7i8OFVEFt12cvHUlPtKRwJYM/LWI
 lcXQ==
X-Gm-Message-State: AFqh2kouf7bU5XYc9rIHVqYJNRAoBlF2wlh+SYuhuXwszBoBnYMd9uMU
 CtY5r/cH024G0T9vSeIVQ2rJTTFwT7WpSHj/zxM=
X-Google-Smtp-Source: AMrXdXsSWL87zLS+SeKGx7da+9Us1VFfUC0WWCqUi02NG6LfqmhWBBqG8GLxvRp4quzUtV27XX6m1BsLvLfDeQstGxY=
X-Received: by 2002:a25:da14:0:b0:707:34cf:b4b1 with SMTP id
 n20-20020a25da14000000b0070734cfb4b1mr2584436ybf.123.1672259750259; Wed, 28
 Dec 2022 12:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
 <20221226220303.14420-4-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221226220303.14420-4-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 28 Dec 2022 21:35:39 +0100
Message-ID: <CAPan3WqYpP9NxHnWnMpt0cC7BqxAZf8JZhhi=CV=KzLLh5bB2A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] {hw/i2c,
 docs/system/arm}: Allwinner TWI/I2C Emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, philmd@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000062f38605f0e9502e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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

--00000000000062f38605f0e9502e
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 26, 2022 at 11:03 PM Strahinja Jankovic <
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
> Docs are also updated for Cubieboard and Orangepi-PC board to indicate
> I2C availability.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
>  docs/system/arm/cubieboard.rst |   1 +
>  docs/system/arm/orangepi.rst   |   1 +
>  hw/arm/Kconfig                 |   2 +
>  hw/arm/allwinner-a10.c         |   8 +
>  hw/arm/allwinner-h3.c          |  11 +-
>  hw/i2c/Kconfig                 |   4 +
>  hw/i2c/allwinner-i2c.c         | 459 +++++++++++++++++++++++++++++++++
>  hw/i2c/meson.build             |   1 +
>  hw/i2c/trace-events            |   5 +
>  include/hw/arm/allwinner-a10.h |   2 +
>  include/hw/arm/allwinner-h3.h  |   3 +
>  include/hw/i2c/allwinner-i2c.h |  55 ++++
>  12 files changed, 551 insertions(+), 1 deletion(-)
>  create mode 100644 hw/i2c/allwinner-i2c.c
>  create mode 100644 include/hw/i2c/allwinner-i2c.h
>
> diff --git a/docs/system/arm/cubieboard.rst
> b/docs/system/arm/cubieboard.rst
> index 344ff8cef9..8d485f5435 100644
> --- a/docs/system/arm/cubieboard.rst
> +++ b/docs/system/arm/cubieboard.rst
> @@ -14,3 +14,4 @@ Emulated devices:
>  - SDHCI
>  - USB controller
>  - SATA controller
> +- TWI (I2C) controller
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index 83c7445197..e5973600a1 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devices:
>   * Clock Control Unit
>   * System Control module
>   * Security Identifier device
> + * TWI (I2C)
>
>  Limitations
>  """""""""""
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
> index 0000000000..a435965836
> --- /dev/null
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -0,0 +1,459 @@
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
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/allwinner-i2c.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "hw/i2c/i2c.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "qemu/module.h"
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
> +/* Status value in STAT register is shifted by 3 bits */
> +#define TWI_STAT_SHIFT      3
> +#define STAT_FROM_STA(x)    ((x) << TWI_STAT_SHIFT)
> +#define STAT_TO_STA(x)      ((x) >> TWI_STAT_SHIFT)
> +
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
> +        if ((STAT_TO_STA(s->stat) == STAT_M_ADDR_RD_ACK) ||
> +            (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) ||
> +            (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_NACK)) {
> +            /* Get the next byte */
> +            s->data = i2c_recv(s->bus);
> +
> +            if (s->cntr & TWI_CNTR_A_ACK) {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_ACK);
> +            } else {
> +                s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
> +            }
> +            allwinner_i2c_raise_interrupt(s);
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
> +    trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), offset,
> value);
> +
> +    return (uint64_t)value;
> +}
> +
> +static void allwinner_i2c_write(void *opaque, hwaddr offset,
> +                                uint64_t value, unsigned size)
> +{
> +    AWI2CState *s = AW_I2C(opaque);
> +
> +    value &= 0xff;
> +
> +    trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset), offset,
> value);
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
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index af181d43ee..52dbd53a23 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -8,6 +8,11 @@ i2c_send_async(uint8_t address, uint8_t data)
> "send_async(addr:0x%02x) data:0x%0
>  i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>  i2c_ack(void) ""
>
> +# allwinner_i2c.c
> +
> +allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value)
> "read %s [0x%" PRIx64 "]: -> 0x%" PRIx64
> +allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t
> value) "write %s [0x%" PRIx64 "]: <- 0x%" PRIx64
> +
>  # aspeed_i2c.c
>
>  aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count,
> uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
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
> index 0000000000..4f378b86ba
> --- /dev/null
> +++ b/include/hw/i2c/allwinner-i2c.h
> @@ -0,0 +1,55 @@
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

-- 
Niek Linnenbank

--00000000000062f38605f0e9502e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 26, 2022 at 11:03 PM Stra=
hinja Jankovic &lt;<a href=3D"mailto:strahinjapjankovic@gmail.com">strahinj=
apjankovic@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">This patch implements Allwinner TWI/I2C controller emul=
ation. Only<br>
master-mode functionality is implemented.<br>
<br>
The SPL boot for Cubieboard expects AXP209 PMIC on TWI0/I2C0 bus, so this i=
s<br>
first part enabling the TWI/I2C bus operation.<br>
<br>
Since both Allwinner A10 and H3 use the same module, it is added for<br>
both boards.<br>
<br>
Docs are also updated for Cubieboard and Orangepi-PC board to indicate<br>
I2C availability.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br></=
blockquote><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinn=
enbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0docs/system/arm/cubieboard.rst |=C2=A0 =C2=A01 +<br>
=C2=A0docs/system/arm/orangepi.rst=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +<br>
=C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-=
<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/allwinner-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 459 +++++++=
++++++++++++++++++++++++++<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A05 +<br>
=C2=A0include/hw/arm/allwinner-a10.h |=C2=A0 =C2=A02 +<br>
=C2=A0include/hw/arm/allwinner-h3.h=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0include/hw/i2c/allwinner-i2c.h |=C2=A0 55 ++++<br>
=C2=A012 files changed, 551 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/i2c/allwinner-i2c.c<br>
=C2=A0create mode 100644 include/hw/i2c/allwinner-i2c.h<br>
<br>
diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rs=
t<br>
index 344ff8cef9..8d485f5435 100644<br>
--- a/docs/system/arm/cubieboard.rst<br>
+++ b/docs/system/arm/cubieboard.rst<br>
@@ -14,3 +14,4 @@ Emulated devices:<br>
=C2=A0- SDHCI<br>
=C2=A0- USB controller<br>
=C2=A0- SATA controller<br>
+- TWI (I2C) controller<br>
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst<br=
>
index 83c7445197..e5973600a1 100644<br>
--- a/docs/system/arm/orangepi.rst<br>
+++ b/docs/system/arm/orangepi.rst<br>
@@ -25,6 +25,7 @@ The Orange Pi PC machine supports the following devices:<=
br>
=C2=A0 * Clock Control Unit<br>
=C2=A0 * System Control module<br>
=C2=A0 * Security Identifier device<br>
+ * TWI (I2C)<br>
<br>
=C2=A0Limitations<br>
=C2=A0&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;&quot;<br=
>
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
index 0000000000..a435965836<br>
--- /dev/null<br>
+++ b/hw/i2c/allwinner-i2c.c<br>
@@ -0,0 +1,459 @@<br>
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
+ * SPDX-License-Identifier: MIT<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;hw/i2c/i2c.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
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
+<br>
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
+/* Status value in STAT register is shifted by 3 bits */<br>
+#define TWI_STAT_SHIFT=C2=A0 =C2=A0 =C2=A0 3<br>
+#define STAT_FROM_STA(x)=C2=A0 =C2=A0 ((x) &lt;&lt; TWI_STAT_SHIFT)<br>
+#define STAT_TO_STA(x)=C2=A0 =C2=A0 =C2=A0 ((x) &gt;&gt; TWI_STAT_SHIFT)<b=
r>
+<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((STAT_TO_STA(s-&gt;stat) =3D=3D STAT_M_ADD=
R_RD_ACK) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (STAT_TO_STA(s-&gt;stat) =3D=3D =
STAT_M_DATA_RX_ACK) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (STAT_TO_STA(s-&gt;stat) =3D=3D =
STAT_M_DATA_RX_NACK)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get the next byte */<br>
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
+=C2=A0 =C2=A0 trace_allwinner_i2c_read(allwinner_i2c_get_regname(offset), =
offset, value);<br>
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
+=C2=A0 =C2=A0 value &amp;=3D 0xff;<br>
+<br>
+=C2=A0 =C2=A0 trace_allwinner_i2c_write(allwinner_i2c_get_regname(offset),=
 offset, value);<br>
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
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events<br>
index af181d43ee..52dbd53a23 100644<br>
--- a/hw/i2c/trace-events<br>
+++ b/hw/i2c/trace-events<br>
@@ -8,6 +8,11 @@ i2c_send_async(uint8_t address, uint8_t data) &quot;send_a=
sync(addr:0x%02x) data:0x%0<br>
=C2=A0i2c_recv(uint8_t address, uint8_t data) &quot;recv(addr:0x%02x) data:=
0x%02x&quot;<br>
=C2=A0i2c_ack(void) &quot;&quot;<br>
<br>
+# allwinner_i2c.c<br>
+<br>
+allwinner_i2c_read(const char* reg_name, uint64_t offset, uint64_t value) =
&quot;read %s [0x%&quot; PRIx64 &quot;]: -&gt; 0x%&quot; PRIx64<br>
+allwinner_i2c_write(const char* reg_name, uint64_t offset, uint64_t value)=
 &quot;write %s [0x%&quot; PRIx64 &quot;]: &lt;- 0x%&quot; PRIx64<br>
+<br>
=C2=A0# aspeed_i2c.c<br>
<br>
=C2=A0aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t coun=
t, uint32_t intr_status) &quot;handling cmd=3D0x%x %s count=3D%d intr=3D0x%=
x&quot;<br>
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
index 0000000000..4f378b86ba<br>
--- /dev/null<br>
+++ b/include/hw/i2c/allwinner-i2c.h<br>
@@ -0,0 +1,55 @@<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000062f38605f0e9502e--

