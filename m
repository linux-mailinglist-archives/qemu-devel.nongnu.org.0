Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F121FCDEB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 14:56:29 +0200 (CEST)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlXcC-0003sS-On
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 08:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlXZf-0000ph-R9
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 08:53:51 -0400
Received: from 16.mo6.mail-out.ovh.net ([87.98.139.208]:60072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jlXZc-0006Ny-N3
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 08:53:51 -0400
Received: from player698.ha.ovh.net (unknown [10.108.35.110])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 750B221A45A
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 14:53:45 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 4D6FC13705FB6;
 Wed, 17 Jun 2020 12:53:35 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00101998fd0-1f20-4bb9-bc11-82cd07dd816d,ABECD89738EEB0C75E5395B338997A57DB3A3EEE)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org,
 joel@jms.id.au
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-6-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1cd5c285-aa2f-a452-f892-7505d06e5495@kaod.org>
Date: Wed, 17 Jun 2020 14:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611223016.259837-6-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1322087965671263145
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhffegleefjeduveeuvddvieegudetteevfffhffdugefggeelleejueeifeeuvdenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.139.208; envelope-from=clg@kaod.org;
 helo=16.mo6.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 08:53:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> The Nuvoton NPCM7xx SoC family are used to implement Baseboard
> Management Controllers in servers. While the family includes four SoCs,
> this patch implements limited support for two of them: NPCM730 (targeted
> for Data Center applications) and NPCM750 (targeted for Enterprise
> applications).
> 
> This patch includes little more than the bare minimum needed to boot a
> Linux kernel built with NPCM7xx support in direct-kernel mode:
> 
>   - Two Cortex-A9 CPU cores with built-in periperhals.
>   - Global Configuration Registers.
>   - Clock Management.
>   - 3 Timer Modules with 5 timers each.
>   - 4 serial ports.
> 
> The chips themselves have a lot more features, some of which will be
> added to the model at a later stage.
> 
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>  MAINTAINERS              |   2 +
>  hw/arm/Makefile.objs     |   1 +
>  hw/arm/npcm7xx.c         | 330 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h |  80 ++++++++++
>  4 files changed, 413 insertions(+)
>  create mode 100644 hw/arm/npcm7xx.c
>  create mode 100644 include/hw/arm/npcm7xx.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97d24b1443..077c86643c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -726,8 +726,10 @@ M: Havard Skinnemoen <hskinnemoen@google.com>
>  M: Tyrone Ting <kfting@nuvoton.com>
>  L: qemu-arm@nongnu.org
>  S: Supported
> +F: hw/arm/npcm7xx*
>  F: hw/misc/npcm7xx*
>  F: hw/timer/npcm7xx*
> +F: include/hw/arm/npcm7xx*
>  F: include/hw/misc/npcm7xx*
>  F: include/hw/timer/npcm7xx*
>  
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 534a6a119e..13d163a599 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -41,6 +41,7 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
>  obj-$(CONFIG_STM32F405_SOC) += stm32f405_soc.o
>  obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
>  obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
> +obj-$(CONFIG_NPCM7XX) += npcm7xx.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> new file mode 100644
> index 0000000000..a5dbf08c00
> --- /dev/null
> +++ b/hw/arm/npcm7xx.c
> @@ -0,0 +1,330 @@
> +/*
> + * Nuvoton NPCM7xx SoC family.
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/address-spaces.h"
> +#include "hw/arm/npcm7xx.h"
> +#include "hw/char/serial.h"
> +#include "hw/loader.h"
> +#include "hw/misc/unimp.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/units.h"
> +#include "sysemu/sysemu.h"
> +
> +/* The first half of the address space is reserved for DDR4 DRAM. */
> +#define NPCM7XX_DRAM_BA         (0x00000000)
> +#define NPCM7XX_DRAM_SZ         (2 * GiB)
> +
> +/*
> + * This covers the whole MMIO space. We'll use this to catch any MMIO accesses
> + * that aren't handled by any device.
> + */
> +#define NPCM7XX_MMIO_BA         (0x80000000)
> +#define NPCM7XX_MMIO_SZ         (0x7FFD0000)
> +
> +/* Core system modules. */
> +#define NPCM7XX_L2C_BA          (0xF03FC000)
> +#define NPCM7XX_CPUP_BA         (0xF03FE000)
> +#define NPCM7XX_GCR_BA          (0xF0800000)
> +#define NPCM7XX_CLK_BA          (0xF0801000)
> +
> +/* Memory blocks at the end of the address space */
> +#define NPCM7XX_RAM2_BA         (0xFFFD0000)
> +#define NPCM7XX_RAM2_SZ         (128 * KiB)
> +#define NPCM7XX_ROM_BA          (0xFFFF0000)
> +#define NPCM7XX_ROM_SZ          (64 * KiB)
> +
> +/*
> + * Interrupt lines going into the GIC. This does not include internal Cortex-A9
> + * interrupts.
> + */
> +enum NPCM7xxInterrupt {
> +    NPCM7XX_UART0_IRQ           = 2,
> +    NPCM7XX_UART1_IRQ,
> +    NPCM7XX_UART2_IRQ,
> +    NPCM7XX_UART3_IRQ,
> +    NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
> +    NPCM7XX_TIMER1_IRQ,
> +    NPCM7XX_TIMER2_IRQ,
> +    NPCM7XX_TIMER3_IRQ,
> +    NPCM7XX_TIMER4_IRQ,
> +    NPCM7XX_TIMER5_IRQ,                 /* Timer Module 1 */
> +    NPCM7XX_TIMER6_IRQ,
> +    NPCM7XX_TIMER7_IRQ,
> +    NPCM7XX_TIMER8_IRQ,
> +    NPCM7XX_TIMER9_IRQ,
> +    NPCM7XX_TIMER10_IRQ,                /* Timer Module 2 */
> +    NPCM7XX_TIMER11_IRQ,
> +    NPCM7XX_TIMER12_IRQ,
> +    NPCM7XX_TIMER13_IRQ,
> +    NPCM7XX_TIMER14_IRQ,
> +};
> +
> +/* Total number of GIC interrupts, including internal Cortex-A9 interrupts. */
> +#define NPCM7XX_NUM_IRQ         (160)
> +
> +/* Register base address for each Timer Module */
> +static const hwaddr npcm7xx_tim_addr[] = {
> +    0xF0008000,
> +    0xF0009000,
> +    0xF000A000,
> +};
> +
> +/* Register base address for each 16550 UART */
> +static const hwaddr npcm7xx_uart_addr[] = {
> +    0xF0001000,
> +    0xF0002000,
> +    0xF0003000,
> +    0xF0004000,
> +};
> +
> +void npcm7xx_write_secondary_boot(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    /*
> +     * The default smpboot stub halts the secondary CPU with a 'wfi'
> +     * instruction, but the arch/arm/mach-npcm/platsmp.c in the Linux kernel
> +     * does not send an IPI to wake it up, so the second CPU fails to boot. So
> +     * we need to provide our own smpboot stub that can not use 'wfi', it has
> +     * to spin the secondary CPU until the first CPU writes to the SCRPAD reg.
> +     */
> +    static const uint8_t smpboot[] = {
> +        0x18, 0x20, 0x9f, 0xe5,     /* ldr r2, bootreg_addr */
> +        0x00, 0x00, 0xa0, 0xe3,     /* mov r0, #0 */
> +        0x00, 0x00, 0x82, 0xe5,     /* str r0, [r2] */
> +        0x02, 0xf0, 0x20, 0xe3,     /* wfe */
> +        0x00, 0x10, 0x92, 0xe5,     /* ldr r1, [r2] */
> +        0x01, 0x00, 0x11, 0xe1,     /* tst r1, r1 */
> +        0xfb, 0xff, 0xff, 0x0a,     /* beq <wfe> */
> +        0x11, 0xff, 0x2f, 0xe1,     /* bx r1 */
> +        (NPCM7XX_SMP_BOOTREG_ADDR >>  0) & 0xff,
> +        (NPCM7XX_SMP_BOOTREG_ADDR >>  8) & 0xff,
> +        (NPCM7XX_SMP_BOOTREG_ADDR >> 16) & 0xff,
> +        (NPCM7XX_SMP_BOOTREG_ADDR >> 24) & 0xff,
> +    };
> +
> +    rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
> +                       NPCM7XX_SMP_LOADER_START);
> +}
> +
> +static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)
> +{
> +    return qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
> +}
> +
> +static void npcm7xx_init(Object *obj)
> +{
> +    NPCM7xxState *s = NPCM7XX(obj);
> +    int i;
> +
> +    for (i = 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
> +        object_initialize_child(obj, "cpu[*]", OBJECT(&s->cpu[i]),
> +                                sizeof(s->cpu[i]),
> +                                ARM_CPU_TYPE_NAME("cortex-a9"),
> +                                &error_abort, NULL);
> +    }
> +
> +    sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore,
> +                          sizeof(s->a9mpcore), TYPE_A9MPCORE_PRIV);
> +    sysbus_init_child_obj(obj, "gcr", OBJECT(&s->gcr), sizeof(s->gcr),
> +                          TYPE_NPCM7XX_GCR);
> +    sysbus_init_child_obj(obj, "clk", OBJECT(&s->clk), sizeof(s->clk),
> +                          TYPE_NPCM7XX_CLK);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
> +        sysbus_init_child_obj(obj, "tim[*]", OBJECT(&s->tim[i]),
> +                              sizeof(s->tim[i]), TYPE_NPCM7XX_TIMER);
> +    }

This needs to use object_initialize_child() now. sysbus_init_child_obj() 
was deprecated.

> +}
> +
> +static void npcm7xx_realize(DeviceState *dev, Error **errp)
> +{
> +    NPCM7xxState *s = NPCM7XX(dev);
> +    NPCM7xxClass *sc = NPCM7XX_GET_CLASS(s);

'nc' maybe.

> +    Error *err = NULL;
> +    int i;
> +
> +    /* I/O space -- unimplemented unless overridden below. */
> +    create_unimplemented_device("npcm7xx.io", NPCM7XX_MMIO_BA, NPCM7XX_MMIO_SZ);
> +
> +    /* CPUs */
> +    for (i = 0; i < sc->num_cpus; i++) {
> +        object_property_set_int(OBJECT(&s->cpu[i]),
> +                                arm_cpu_mp_affinity(i, NPCM7XX_MAX_NUM_CPUS),
> +                                "mp-affinity", &error_abort);
> +        object_property_set_int(OBJECT(&s->cpu[i]), NPCM7XX_GIC_CPU_IF_ADDR,
> +                                "reset-cbar", &error_abort);
> +        object_property_set_bool(OBJECT(&s->cpu[i]), true,
> +                                 "reset-hivecs", &error_abort);
> +
> +        /* Disable security extensions. */
> +        if (object_property_find(OBJECT(&s->cpu[i]), "has_el3", NULL)) {
> +            object_property_set_bool(OBJECT(&s->cpu[i]), false, "has_el3",
> +                                     &error_abort);
> +        }
> +
> +        object_property_set_bool(OBJECT(&s->cpu[i]), true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +    }
> +
> +    /* A9MPCORE peripherals */
> +    object_property_set_int(OBJECT(&s->a9mpcore), sc->num_cpus, "num-cpu",
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->a9mpcore), NPCM7XX_NUM_IRQ, "num-irq",
> +                            &error_abort);
> +    object_property_set_bool(OBJECT(&s->a9mpcore), true, "realized",
> +                             &error_abort);

you should use sysbus_realize() now and below also.

C.

> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a9mpcore), 0, NPCM7XX_CPUP_BA);
> +
> +    for (i = 0; i < sc->num_cpus; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
> +                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + sc->num_cpus,
> +                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
> +    }
> +
> +    /* L2 cache controller */
> +    sysbus_create_simple("l2x0", NPCM7XX_L2C_BA, NULL);
> +
> +    /* System Global Control Registers (GCR) */
> +    object_property_set_int(OBJECT(&s->gcr), sc->disabled_modules,
> +                            "disabled-modules", &err);
> +    object_property_set_link(OBJECT(&s->gcr), OBJECT(s->dram), "dram", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    object_property_set_bool(OBJECT(&s->gcr), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gcr), 0, NPCM7XX_GCR_BA);
> +
> +    /* Clock Control Registers (CLK) */
> +    object_property_set_bool(OBJECT(&s->clk), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->clk), 0, NPCM7XX_CLK_BA);
> +
> +    /* Timer Modules (TIM) */
> +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) != ARRAY_SIZE(s->tim));
> +    for (i = 0; i < ARRAY_SIZE(s->tim); i++) {
> +        Object *t = OBJECT(&s->tim[i]);
> +        int first_irq;
> +        int j;
> +
> +        object_property_set_bool(t, true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(t), 0, npcm7xx_tim_addr[i]);
> +
> +        first_irq = NPCM7XX_TIMER0_IRQ + i * NPCM7XX_TIMERS_PER_CTRL;
> +        for (j = 0; j < NPCM7XX_TIMERS_PER_CTRL; j++) {
> +            qemu_irq irq = npcm7xx_irq(s, first_irq + j);
> +            sysbus_connect_irq(SYS_BUS_DEVICE(t), j, irq);
> +        }
> +    }
> +
> +    /* UART0..3 (16550 compatible) */
> +    for (i = 0; i < ARRAY_SIZE(npcm7xx_uart_addr); i++) {
> +        serial_mm_init(get_system_memory(), npcm7xx_uart_addr[i], 2,
> +                       npcm7xx_irq(s, NPCM7XX_UART0_IRQ + i), 115200,
> +                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> +    }
> +
> +    /* RAM2 (SRAM) */
> +    memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
> +                           NPCM7XX_RAM2_SZ, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(get_system_memory(), NPCM7XX_RAM2_BA, &s->sram);
> +
> +    /* Internal ROM */
> +    memory_region_init_rom(&s->irom, OBJECT(dev), "irom", NPCM7XX_ROM_SZ, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
> +
> +    /* External DDR4 SDRAM */
> +    memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA, s->dram);
> +}
> +
> +static Property npcm7xx_properties[] = {
> +    DEFINE_PROP_LINK("dram", NPCM7xxState, dram, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void npcm7xx_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = npcm7xx_realize;
> +    dc->user_creatable = false;
> +    device_class_set_props(dc, npcm7xx_properties);
> +}
> +
> +static void npcm730_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
> +
> +    /* NPCM730 is optimized for data center use, so no graphics, etc. */
> +    nc->disabled_modules = 0x00300395;
> +    nc->num_cpus = 2;
> +}
> +
> +static void npcm750_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
> +
> +    /* NPCM750 has 2 cores and a full set of peripherals */
> +    nc->disabled_modules = 0x00000000;
> +    nc->num_cpus = 2;
> +}
> +
> +static const TypeInfo npcm7xx_soc_types[] = {
> +    {
> +        .name           = TYPE_NPCM7XX,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(NPCM7xxState),
> +        .instance_init  = npcm7xx_init,
> +        .class_size     = sizeof(NPCM7xxClass),
> +        .class_init     = npcm7xx_class_init,
> +        .abstract       = true,
> +    }, {
> +        .name           = TYPE_NPCM730,
> +        .parent         = TYPE_NPCM7XX,
> +        .class_init     = npcm730_class_init,
> +    }, {
> +        .name           = TYPE_NPCM750,
> +        .parent         = TYPE_NPCM7XX,
> +        .class_init     = npcm750_class_init,
> +    },
> +};
> +
> +DEFINE_TYPES(npcm7xx_soc_types);
> diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> new file mode 100644
> index 0000000000..38b8c33729
> --- /dev/null
> +++ b/include/hw/arm/npcm7xx.h
> @@ -0,0 +1,80 @@
> +/*
> + * Nuvoton NPCM7xx SoC family.
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +#ifndef NPCM7XX_H
> +#define NPCM7XX_H
> +
> +#include "hw/boards.h"
> +#include "hw/cpu/a9mpcore.h"
> +#include "hw/misc/npcm7xx_clk.h"
> +#include "hw/misc/npcm7xx_gcr.h"
> +#include "hw/timer/npcm7xx_timer.h"
> +#include "target/arm/cpu.h"
> +
> +#define NPCM7XX_MAX_NUM_CPUS    (2)
> +
> +/* Magic addresses for setting up direct kernel booting and SMP boot stubs. */
> +#define NPCM7XX_LOADER_START            (0x00000000)  /* Start of SDRAM */
> +#define NPCM7XX_SMP_LOADER_START        (0xFFFF0000)  /* Boot ROM */
> +#define NPCM7XX_SMP_BOOTREG_ADDR        (0xF080013C)  /* GCR.SCRPAD */
> +#define NPCM7XX_GIC_CPU_IF_ADDR         (0xF03FE100)  /* GIC within A9 */
> +
> +typedef struct NPCM7xxState {
> +    DeviceState         parent;
> +
> +    ARMCPU              cpu[NPCM7XX_MAX_NUM_CPUS];
> +    A9MPPrivState       a9mpcore;
> +
> +    MemoryRegion        sram;
> +    MemoryRegion        irom;
> +    MemoryRegion        *dram;
> +
> +    NPCM7xxGCRState     gcr;
> +    NPCM7xxCLKState     clk;
> +    NPCM7xxTimerCtrlState tim[3];
> +} NPCM7xxState;
> +
> +#define TYPE_NPCM7XX    "npcm7xx"
> +#define NPCM7XX(obj)    OBJECT_CHECK(NPCM7xxState, (obj), TYPE_NPCM7XX)
> +
> +#define TYPE_NPCM730    "npcm730"
> +#define TYPE_NPCM750    "npcm750"
> +
> +typedef struct NPCM7xxClass {
> +    DeviceClass         parent;
> +
> +    /* Bitmask of modules that are permanently disabled on this chip. */
> +    uint32_t            disabled_modules;
> +    /* Number of CPU cores enabled in this SoC class (may be 1 or 2). */
> +    uint32_t            num_cpus;
> +} NPCM7xxClass;
> +
> +#define NPCM7XX_CLASS(klass)                                            \
> +    OBJECT_CLASS_CHECK(NPCM7xxClass, (klass), TYPE_NPCM7XX)
> +#define NPCM7XX_GET_CLASS(obj)                                          \
> +    OBJECT_GET_CLASS(NPCM7xxClass, (obj), TYPE_NPCM7XX)
> +
> +/**
> + * npcm7xx_write_secondary_boot - Write stub for booting secondary CPU.
> + * @cpu: The CPU to be booted.
> + * @info: Boot info structure for the board.
> + *
> + * This will write a short code stub to the internal ROM that will keep the
> + * secondary CPU spinning until the primary CPU writes an address to the SCRPAD
> + * register in the GCR, after which the secondary CPU will jump there.
> + */
> +extern void npcm7xx_write_secondary_boot(ARMCPU *cpu,
> +                                         const struct arm_boot_info *info);
> +
> +#endif /* NPCM7XX_H */
> 


