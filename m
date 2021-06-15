Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40943A783E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:47:18 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3n3-0002d2-71
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3iN-0005zY-Kz; Tue, 15 Jun 2021 03:42:28 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt3iI-0002iL-Pq; Tue, 15 Jun 2021 03:42:27 -0400
Received: by mail-io1-xd31.google.com with SMTP id 5so42377337ioe.1;
 Tue, 15 Jun 2021 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4JuVkg0m2q5CwlJidJy2UG85t+wBJuQVlMGQOxWBECY=;
 b=SSoztEAYSlRznJN8JcADoDBfyZRehQN6Iik+We2Bt2nHaK8ID5N/K1ltuTkhtiTSkG
 gUDOp8Js+KbbfUwmN9meZRJdpMj8cio3nv38U7zHfbvXRT15Hz3qwcKdPADj9TnH6NUK
 qFrsTFCfLWgVhpN/+7GlWysGfVXqjXta5oxD2POE0zqkDEhwBpmesRb4akAXssaDrfx6
 DPyQymKudhHH6nz0zXz1z7X0DiO3VS0Bm6Ate8RMy+RcNtp/ct7m6QmHWakaIHrq5vp0
 L/EIzNtF5Mx0GHljaM4c6biT/GCJtzEsqp3MkrOrLQj938qpN1fakq2mR9Rn5SOdmr6u
 gNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4JuVkg0m2q5CwlJidJy2UG85t+wBJuQVlMGQOxWBECY=;
 b=C++YJcIpJFdyF2dt5U+h8kld/xT54IZ30ojoL0elr5FywzvaIb61Z4BV6mcUhxJQbM
 7WC80Zp6MN8y7Yok4E+acr0mHeEnQysRvdYk9XMKQ1E5Pdd79SvYs1Qbdl10uX1PV2rP
 D96CHXliiDknnOdeuNw1U3Vv0g6qONgq7ua5/0WTtVqzxzt416U2KNREWwGgtMY7RGEf
 S/pgePS1RYyw9nvWuvvTNO5R3BU7Ge+FCD0b8iLyLGHBb7PIfK5SvblzOxMSWb1cOhgV
 glPMWbi01Ys5a+X7hyHwjWf9ainObomC2D03l0zxls4qtxDbuKGQX4i2UN9K4gCelSWS
 T2hQ==
X-Gm-Message-State: AOAM530UK3KnPr/HgeKREuPeFl49bkblakNBqHm+b1/c/Qcl2IFxLtZM
 35d/HeUmLaJkI0I8SuxD9phYLGScf0TmF+gzB0g=
X-Google-Smtp-Source: ABdhPJx6aCjZL9mHX2FvMbA4wLDNIwazrXqk17hOoY8r3rzCUEUM0tULU1oumJSlLhowUighmmeeEcn65aaMlph6zjY=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr20135280jak.91.1623742939944; 
 Tue, 15 Jun 2021 00:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
In-Reply-To: <20210608161028.4159582-2-erdnaxe@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 17:41:53 +1000
Message-ID: <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 2:12 AM Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This SoC is similar to stm32f205 SoC.
> This will be used by the STM32VLDISCOVERY to create a machine.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  MAINTAINERS                    |   6 ++
>  hw/arm/Kconfig                 |   6 ++
>  hw/arm/meson.build             |   1 +
>  hw/arm/stm32f100_soc.c         | 182 +++++++++++++++++++++++++++++++++
>  include/hw/arm/stm32f100_soc.h |  58 +++++++++++
>  5 files changed, 253 insertions(+)
>  create mode 100644 hw/arm/stm32f100_soc.c
>  create mode 100644 include/hw/arm/stm32f100_soc.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd29042..62dfa31800 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -946,6 +946,12 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
>
> +STM32F100
> +M: Alexandre Iooss <erdnaxe@crans.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/stm32f100_soc.c
> +
>  STM32F205
>  M: Alistair Francis <alistair@alistair23.me>
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 67723d9ea6..0bc3ee3e91 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -326,6 +326,12 @@ config RASPI
>      select SDHCI
>      select USB_DWC2
>
> +config STM32F100_SOC
> +    bool
> +    select ARM_V7M
> +    select STM32F2XX_USART
> +    select STM32F2XX_SPI
> +
>  config STM32F205_SOC
>      bool
>      select ARM_V7M
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index be39117b9b..0e637e6a9e 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -39,6 +39,7 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
>  arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
>  arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
>  arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
> +arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
>  arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
> diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
> new file mode 100644
> index 0000000000..4655aaf05a
> --- /dev/null
> +++ b/hw/arm/stm32f100_soc.c
> @@ -0,0 +1,182 @@
> +/*
> + * STM32F100 SoC
> + *
> + * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
> + * Copyright (c) 2014 Alistair Francis <alistair@alistair23.me>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "hw/arm/boot.h"
> +#include "exec/address-spaces.h"
> +#include "hw/arm/stm32f100_soc.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/unimp.h"
> +#include "sysemu/sysemu.h"
> +
> +/* stm32f100_soc implementation is derived from stm32f205_soc */
> +
> +static const uint32_t usart_addr[STM_NUM_USARTS] = { 0x40013800, 0x40004400,
> +    0x40004800 };
> +static const uint32_t spi_addr[STM_NUM_SPIS] = { 0x40013000, 0x40003800 };
> +
> +static const int usart_irq[STM_NUM_USARTS] = {37, 38, 39};
> +static const int spi_irq[STM_NUM_SPIS] = {35, 36};
> +
> +static void stm32f100_soc_initfn(Object *obj)
> +{
> +    STM32F100State *s = STM32F100_SOC(obj);
> +    int i;
> +
> +    object_initialize_child(obj, "armv7m", &s->armv7m, TYPE_ARMV7M);
> +
> +    for (i = 0; i < STM_NUM_USARTS; i++) {
> +        object_initialize_child(obj, "usart[*]", &s->usart[i],
> +                                TYPE_STM32F2XX_USART);
> +    }
> +
> +    for (i = 0; i < STM_NUM_SPIS; i++) {
> +        object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
> +    }
> +}
> +
> +static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    STM32F100State *s = STM32F100_SOC(dev_soc);
> +    DeviceState *dev, *armv7m;
> +    SysBusDevice *busdev;
> +    int i;
> +
> +    MemoryRegion *system_memory = get_system_memory();
> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash = g_new(MemoryRegion, 1);
> +    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
> +
> +    /*
> +     * Init flash region
> +     * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
> +     */
> +    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
> +                           FLASH_SIZE, &error_fatal);
> +    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
> +                             "STM32F100.flash.alias", flash, 0, FLASH_SIZE);
> +    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
> +    memory_region_add_subregion(system_memory, 0, flash_alias);
> +
> +    /* Init SRAM region */
> +    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
> +                           &error_fatal);
> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
> +
> +    /* Init ARMv7m */
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
> +    qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    object_property_set_link(OBJECT(&s->armv7m), "memory",
> +                             OBJECT(get_system_memory()), &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
> +        return;
> +    }
> +
> +    /* Attach UART (uses USART registers) and USART controllers */
> +    for (i = 0; i < STM_NUM_USARTS; i++) {
> +        dev = DEVICE(&(s->usart[i]));
> +        qdev_prop_set_chr(dev, "chardev", serial_hd(i));
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->usart[i]), errp)) {
> +            return;
> +        }
> +        busdev = SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, usart_addr[i]);
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, usart_irq[i]));
> +    }
> +
> +    /* SPI 1 and 2 */
> +    for (i = 0; i < STM_NUM_SPIS; i++) {
> +        dev = DEVICE(&(s->spi[i]));
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
> +            return;
> +        }
> +        busdev = SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, spi_addr[i]);
> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, spi_irq[i]));
> +    }
> +
> +    create_unimplemented_device("timer[2]",  0x40000000, 0x400);
> +    create_unimplemented_device("timer[3]",  0x40000400, 0x400);
> +    create_unimplemented_device("timer[4]",  0x40000800, 0x400);
> +    create_unimplemented_device("timer[6]",  0x40001000, 0x400);
> +    create_unimplemented_device("timer[7]",  0x40001400, 0x400);
> +    create_unimplemented_device("RTC",       0x40002800, 0x400);
> +    create_unimplemented_device("WWDG",      0x40002C00, 0x400);
> +    create_unimplemented_device("IWDG",      0x40003000, 0x400);
> +    create_unimplemented_device("I2C1",      0x40005400, 0x400);
> +    create_unimplemented_device("I2C2",      0x40005800, 0x400);
> +    create_unimplemented_device("BKP",       0x40006C00, 0x400);
> +    create_unimplemented_device("PWR",       0x40007000, 0x400);
> +    create_unimplemented_device("DAC",       0x40007400, 0x400);
> +    create_unimplemented_device("CEC",       0x40007800, 0x400);
> +    create_unimplemented_device("AFIO",      0x40010000, 0x400);
> +    create_unimplemented_device("EXTI",      0x40010400, 0x400);
> +    create_unimplemented_device("GPIOA",     0x40010800, 0x400);
> +    create_unimplemented_device("GPIOB",     0x40010C00, 0x400);
> +    create_unimplemented_device("GPIOC",     0x40011000, 0x400);
> +    create_unimplemented_device("GPIOD",     0x40011400, 0x400);
> +    create_unimplemented_device("GPIOE",     0x40011800, 0x400);
> +    create_unimplemented_device("ADC1",      0x40012400, 0x400);
> +    create_unimplemented_device("timer[1]",  0x40012C00, 0x400);
> +    create_unimplemented_device("timer[15]", 0x40014000, 0x400);
> +    create_unimplemented_device("timer[16]", 0x40014400, 0x400);
> +    create_unimplemented_device("timer[17]", 0x40014800, 0x400);
> +    create_unimplemented_device("DMA",       0x40020000, 0x400);
> +    create_unimplemented_device("RCC",       0x40021000, 0x400);
> +    create_unimplemented_device("Flash Int", 0x40022000, 0x400);
> +    create_unimplemented_device("CRC",       0x40023000, 0x400);

Aren't you missing some timers, like timer[5] 0x4000_0C00?

Alistair

> +}
> +
> +static Property stm32f100_soc_properties[] = {
> +    DEFINE_PROP_STRING("cpu-type", STM32F100State, cpu_type),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void stm32f100_soc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = stm32f100_soc_realize;
> +    device_class_set_props(dc, stm32f100_soc_properties);
> +}
> +
> +static const TypeInfo stm32f100_soc_info = {
> +    .name          = TYPE_STM32F100_SOC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(STM32F100State),
> +    .instance_init = stm32f100_soc_initfn,
> +    .class_init    = stm32f100_soc_class_init,
> +};
> +
> +static void stm32f100_soc_types(void)
> +{
> +    type_register_static(&stm32f100_soc_info);
> +}
> +
> +type_init(stm32f100_soc_types)
> diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
> new file mode 100644
> index 0000000000..c55f7774fa
> --- /dev/null
> +++ b/include/hw/arm/stm32f100_soc.h
> @@ -0,0 +1,58 @@
> +/*
> + * STM32F100 SoC
> + *
> + * Copyright (c) 2021 Alexandre Iooss <erdnaxe@crans.org>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_ARM_STM32F100_SOC_H
> +#define HW_ARM_STM32F100_SOC_H
> +
> +#include "hw/char/stm32f2xx_usart.h"
> +#include "hw/ssi/stm32f2xx_spi.h"
> +#include "hw/arm/armv7m.h"
> +#include "qom/object.h"
> +
> +#define TYPE_STM32F100_SOC "stm32f100-soc"
> +OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
> +
> +#define STM_NUM_USARTS 3
> +#define STM_NUM_SPIS 2
> +
> +#define FLASH_BASE_ADDRESS 0x08000000
> +#define FLASH_SIZE (128 * 1024)
> +#define SRAM_BASE_ADDRESS 0x20000000
> +#define SRAM_SIZE (8 * 1024)
> +
> +struct STM32F100State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    char *cpu_type;
> +
> +    ARMv7MState armv7m;
> +
> +    STM32F2XXUsartState usart[STM_NUM_USARTS];
> +    STM32F2XXSPIState spi[STM_NUM_SPIS];
> +};
> +
> +#endif
> +
> --
> 2.25.1
>
>

