Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E09224155
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 19:01:14 +0200 (CEST)
Received: from localhost ([::1]:37386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwTjV-0007MW-F2
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 13:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwTho-0005cJ-8o
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 12:59:28 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:37956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwThi-0001Op-Qh
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 12:59:27 -0400
Received: by mail-vs1-xe42.google.com with SMTP id s20so5204246vsq.5
 for <qemu-devel@nongnu.org>; Fri, 17 Jul 2020 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SGztlrNB1Yr3H1sS5eWJldY1Jg6YEGbYqT7FIE6VmcA=;
 b=rK9xgLMBVVq2yQtJwYa1tGCjXtZX+7HKJ6WaqN0Azhq3s4MQjQGVNfHDw2ScEIh45K
 gGAFR3sokFiRZQdxiXmV9oak6JLpFSWLEXF8BAjEHkzng22dGNXA8aGCka1UYnOS3vK/
 F0bJT2PNTbod0s2i7Tnou39k75FTGkzwyN5WlKXUjnSabjfFjFzjkMa1+4SPcRiZL7ob
 IVqtp+4ZJoBwzwYV6z6IGkqpo99DF3qgJ0Z8MVlxvhbHRnCy5/jK3d6K7eyqMpUGw7yV
 FYWk9f0sRNOUuKjF0Gay0/tR4s1M4knX/WOXfvUXUmngbdMQbRo7f1PKzEqTJu14XWMW
 i5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGztlrNB1Yr3H1sS5eWJldY1Jg6YEGbYqT7FIE6VmcA=;
 b=tH5Y2bIWWsBXORM/rOakrO8Eo5rLXQO+wSE9Qu9utYG0Pv0e70AcqV2ARf8GTNFJUQ
 mjX2GpBOHDhTeh7vE9uwXmWWz4G1Tj/DaGJRbYgb7++UzaBJgCpLoRccBiIac8uXH2j6
 XeMmKhshRaiwEPSj5cdR/eQbba6q+cS2J4z4VCIcGlJtuWI8kSGx7aR8CPu+lwegwqC1
 aFW1YoraF5OEdB1v5JMSzr8WDWIYuZC+JEhc5+YgWXiZi72E+DRsd4SdPAQwKfZhLgq1
 wuNSJbYY0b7X9QLetsL2cRscz+Ibsx978R3CJbxvww923LIWBq1Rkx0ZMLzpa7nxh8IT
 ac4A==
X-Gm-Message-State: AOAM5325EtHNvg9UW+Grq5lpxvUgmKIJTN7I6lnKWQDBFW4TqADL/JuJ
 HuzzLha9+WM7XNkZcNrlrsrmFjRkVCOnrr34igWwhw==
X-Google-Smtp-Source: ABdhPJy4yJ3vWLcHoTrJRNDRh0jxxUgF/uaVrfYSgWKqLu3Gr2wSGUsWj578kXpXYCLCaILoQL+nFiYVGAY8wWgrfcA=
X-Received: by 2002:a67:e0c3:: with SMTP id m3mr8490796vsl.1.1595005161007;
 Fri, 17 Jul 2020 09:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <20200717060258.1602319-5-hskinnemoen@google.com>
 <99db91b7-60e2-7212-abd2-a6505aee5d3d@kaod.org>
In-Reply-To: <99db91b7-60e2-7212-abd2-a6505aee5d3d@kaod.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 17 Jul 2020 09:59:09 -0700
Message-ID: <CAFQmdRZsGGc27-M_xfExsFD_M1dT4gVjvLewVoGCELJFbZ7hew@mail.gmail.com>
Subject: Re: [PATCH v6 04/13] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus Armbruster

On Fri, Jul 17, 2020 at 5:20 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> > The Nuvoton NPCM7xx SoC family are used to implement Baseboard
> > Management Controllers in servers. While the family includes four SoCs,
> > this patch implements limited support for two of them: NPCM730 (targete=
d
> > for Data Center applications) and NPCM750 (targeted for Enterprise
> > applications).
> >
> > This patch includes little more than the bare minimum needed to boot a
> > Linux kernel built with NPCM7xx support in direct-kernel mode:
> >
> >   - Two Cortex-A9 CPU cores with built-in periperhals.
> >   - Global Configuration Registers.
> >   - Clock Management.
> >   - 3 Timer Modules with 5 timers each.
> >   - 4 serial ports.
> >
> > The chips themselves have a lot more features, some of which will be
> > added to the model at a later stage.
> >
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> > ---
> >  include/hw/arm/npcm7xx.h |  85 ++++++++
> >  hw/arm/npcm7xx.c         | 407 +++++++++++++++++++++++++++++++++++++++
> >  hw/arm/Kconfig           |   5 +
> >  hw/arm/Makefile.objs     |   1 +
> >  4 files changed, 498 insertions(+)
> >  create mode 100644 include/hw/arm/npcm7xx.h
> >  create mode 100644 hw/arm/npcm7xx.c
> >
> > diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
> > new file mode 100644
> > index 0000000000..e68d9c79e6
> > --- /dev/null
> > +++ b/include/hw/arm/npcm7xx.h
> > @@ -0,0 +1,85 @@
> > +/*
> > + * Nuvoton NPCM7xx SoC family.
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms of the GNU General Public License as published by t=
he
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but=
 WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licens=
e
> > + * for more details.
> > + */
> > +#ifndef NPCM7XX_H
> > +#define NPCM7XX_H
> > +
> > +#include "hw/boards.h"
> > +#include "hw/cpu/a9mpcore.h"
> > +#include "hw/misc/npcm7xx_clk.h"
> > +#include "hw/misc/npcm7xx_gcr.h"
> > +#include "hw/timer/npcm7xx_timer.h"
> > +#include "target/arm/cpu.h"
> > +
> > +#define NPCM7XX_MAX_NUM_CPUS    (2)
> > +
> > +/* The first half of the address space is reserved for DDR4 DRAM. */
> > +#define NPCM7XX_DRAM_BA         (0x00000000)
> > +#define NPCM7XX_DRAM_SZ         (2 * GiB)
> > +
> > +/* Magic addresses for setting up direct kernel booting and SMP boot s=
tubs. */
> > +#define NPCM7XX_LOADER_START            (0x00000000)  /* Start of SDRA=
M */
> > +#define NPCM7XX_SMP_LOADER_START        (0xffff0000)  /* Boot ROM */
> > +#define NPCM7XX_SMP_BOOTREG_ADDR        (0xf080013c)  /* GCR.SCRPAD */
> > +#define NPCM7XX_GIC_CPU_IF_ADDR         (0xf03fe100)  /* GIC within A9=
 */
> > +
> > +typedef struct NPCM7xxState {
> > +    DeviceState         parent;
> > +
> > +    ARMCPU              cpu[NPCM7XX_MAX_NUM_CPUS];
> > +    A9MPPrivState       a9mpcore;
> > +
> > +    MemoryRegion        sram;
> > +    MemoryRegion        irom;
> > +    MemoryRegion        ram3;
> > +    MemoryRegion        *dram;
> > +
> > +    NPCM7xxGCRState     gcr;
> > +    NPCM7xxCLKState     clk;
> > +    NPCM7xxTimerCtrlState tim[3];
> > +} NPCM7xxState;
> > +
> > +#define TYPE_NPCM7XX    "npcm7xx"
> > +#define NPCM7XX(obj)    OBJECT_CHECK(NPCM7xxState, (obj), TYPE_NPCM7XX=
)
> > +
> > +#define TYPE_NPCM730    "npcm730"
> > +#define TYPE_NPCM750    "npcm750"
> > +
> > +typedef struct NPCM7xxClass {
> > +    DeviceClass         parent;
> > +
> > +    /* Bitmask of modules that are permanently disabled on this chip. =
*/
> > +    uint32_t            disabled_modules;
> > +    /* Number of CPU cores enabled in this SoC class (may be 1 or 2). =
*/
> > +    uint32_t            num_cpus;
> > +} NPCM7xxClass;
> > +
> > +#define NPCM7XX_CLASS(klass)                                          =
  \
> > +    OBJECT_CLASS_CHECK(NPCM7xxClass, (klass), TYPE_NPCM7XX)
> > +#define NPCM7XX_GET_CLASS(obj)                                        =
  \
> > +    OBJECT_GET_CLASS(NPCM7xxClass, (obj), TYPE_NPCM7XX)
> > +
> > +/**
> > + * npcm7xx_load_kernel - Loads memory with everything needed to boot
> > + * @machine - The machine containing the SoC to be booted.
> > + * @soc - The SoC containing the CPU to be booted.
> > + *
> > + * This will set up the ARM boot info structure for the specific NPCM7=
xx
> > + * derivative and call arm_load_kernel() to set up loading of the kern=
el, etc.
> > + * into memory, if requested by the user.
> > + */
> > +void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc);
> > +
> > +#endif /* NPCM7XX_H */
> > diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> > new file mode 100644
> > index 0000000000..9669ac5fa0
> > --- /dev/null
> > +++ b/hw/arm/npcm7xx.c
> > @@ -0,0 +1,407 @@
> > +/*
> > + * Nuvoton NPCM7xx SoC family.
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y it
> > + * under the terms of the GNU General Public License as published by t=
he
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but=
 WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licens=
e
> > + * for more details.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "exec/address-spaces.h"
> > +#include "hw/arm/boot.h"
> > +#include "hw/arm/npcm7xx.h"
> > +#include "hw/char/serial.h"
> > +#include "hw/loader.h"
> > +#include "hw/misc/unimp.h"
> > +#include "hw/qdev-properties.h"
> > +#include "qapi/error.h"
> > +#include "qemu/units.h"
> > +#include "sysemu/sysemu.h"
> > +
> > +/*
> > + * This covers the whole MMIO space. We'll use this to catch any MMIO =
accesses
> > + * that aren't handled by any device.
> > + */
> > +#define NPCM7XX_MMIO_BA         (0x80000000)
> > +#define NPCM7XX_MMIO_SZ         (0x7ffd0000)
> > +
> > +/* Core system modules. */
> > +#define NPCM7XX_L2C_BA          (0xf03fc000)
> > +#define NPCM7XX_CPUP_BA         (0xf03fe000)
> > +#define NPCM7XX_GCR_BA          (0xf0800000)
> > +#define NPCM7XX_CLK_BA          (0xf0801000)
> > +
> > +/* Internal AHB SRAM */
> > +#define NPCM7XX_RAM3_BA         (0xc0008000)
> > +#define NPCM7XX_RAM3_SZ         (4 * KiB)
> > +
> > +/* Memory blocks at the end of the address space */
> > +#define NPCM7XX_RAM2_BA         (0xfffd0000)
> > +#define NPCM7XX_RAM2_SZ         (128 * KiB)
> > +#define NPCM7XX_ROM_BA          (0xffff0000)
> > +#define NPCM7XX_ROM_SZ          (64 * KiB)
> > +
> > +/*
> > + * Interrupt lines going into the GIC. This does not include internal =
Cortex-A9
> > + * interrupts.
> > + */
> > +enum NPCM7xxInterrupt {
> > +    NPCM7XX_UART0_IRQ           =3D 2,
> > +    NPCM7XX_UART1_IRQ,
> > +    NPCM7XX_UART2_IRQ,
> > +    NPCM7XX_UART3_IRQ,
> > +    NPCM7XX_TIMER0_IRQ          =3D 32,   /* Timer Module 0 */
> > +    NPCM7XX_TIMER1_IRQ,
> > +    NPCM7XX_TIMER2_IRQ,
> > +    NPCM7XX_TIMER3_IRQ,
> > +    NPCM7XX_TIMER4_IRQ,
> > +    NPCM7XX_TIMER5_IRQ,                 /* Timer Module 1 */
> > +    NPCM7XX_TIMER6_IRQ,
> > +    NPCM7XX_TIMER7_IRQ,
> > +    NPCM7XX_TIMER8_IRQ,
> > +    NPCM7XX_TIMER9_IRQ,
> > +    NPCM7XX_TIMER10_IRQ,                /* Timer Module 2 */
> > +    NPCM7XX_TIMER11_IRQ,
> > +    NPCM7XX_TIMER12_IRQ,
> > +    NPCM7XX_TIMER13_IRQ,
> > +    NPCM7XX_TIMER14_IRQ,
> > +};
> > +
> > +/* Total number of GIC interrupts, including internal Cortex-A9 interr=
upts. */
> > +#define NPCM7XX_NUM_IRQ         (160)
> > +
> > +/* Register base address for each Timer Module */
> > +static const hwaddr npcm7xx_tim_addr[] =3D {
> > +    0xf0008000,
> > +    0xf0009000,
> > +    0xf000a000,
> > +};
> > +
> > +/* Register base address for each 16550 UART */
> > +static const hwaddr npcm7xx_uart_addr[] =3D {
> > +    0xf0001000,
> > +    0xf0002000,
> > +    0xf0003000,
> > +    0xf0004000,
> > +};
> > +
> > +static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
> > +                                         const struct arm_boot_info *i=
nfo)
> > +{
> > +    /*
> > +     * The default smpboot stub halts the secondary CPU with a 'wfi'
> > +     * instruction, but the arch/arm/mach-npcm/platsmp.c in the Linux =
kernel
> > +     * does not send an IPI to wake it up, so the second CPU fails to =
boot. So
> > +     * we need to provide our own smpboot stub that can not use 'wfi',=
 it has
> > +     * to spin the secondary CPU until the first CPU writes to the SCR=
PAD reg.
> > +     */
> > +    uint32_t smpboot[] =3D {
> > +        0xe59f2018,     /* ldr r2, bootreg_addr */
> > +        0xe3a00000,     /* mov r0, #0 */
> > +        0xe5820000,     /* str r0, [r2] */
> > +        0xe320f002,     /* wfe */
> > +        0xe5921000,     /* ldr r1, [r2] */
> > +        0xe1110001,     /* tst r1, r1 */
> > +        0x0afffffb,     /* beq <wfe> */
> > +        0xe12fff11,     /* bx r1 */
> > +        NPCM7XX_SMP_BOOTREG_ADDR,
> > +    };
> > +    int i;
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(smpboot); i++) {
> > +        smpboot[i] =3D tswap32(smpboot[i]);
> > +    }
> > +
> > +    rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
> > +                       NPCM7XX_SMP_LOADER_START);
> > +}
> > +
> > +static struct arm_boot_info npcm7xx_binfo =3D {
> > +    .loader_start           =3D NPCM7XX_LOADER_START,
> > +    .smp_loader_start       =3D NPCM7XX_SMP_LOADER_START,
> > +    .smp_bootreg_addr       =3D NPCM7XX_SMP_BOOTREG_ADDR,
> > +    .gic_cpu_if_addr        =3D NPCM7XX_GIC_CPU_IF_ADDR,
> > +    .write_secondary_boot   =3D npcm7xx_write_secondary_boot,
> > +    .board_id               =3D -1,
> > +};
> > +
> > +void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
> > +{
> > +    NPCM7xxClass *sc =3D NPCM7XX_GET_CLASS(soc);
> > +
> > +    npcm7xx_binfo.ram_size =3D machine->ram_size;
> > +    npcm7xx_binfo.nb_cpus =3D sc->num_cpus;
> > +
> > +    arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
> > +}
> > +
> > +static qemu_irq npcm7xx_irq(NPCM7xxState *s, int n)
> > +{
> > +    return qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
> > +}
> > +
> > +static void npcm7xx_init(Object *obj)
> > +{
> > +    NPCM7xxState *s =3D NPCM7XX(obj);
> > +    int i;
> > +
> > +    for (i =3D 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
> > +        object_initialize_child(obj, "cpu[*]", &s->cpu[i],
> > +                                ARM_CPU_TYPE_NAME("cortex-a9"));
> > +    }
> > +
> > +    object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCO=
RE_PRIV);
> > +    object_initialize_child(obj, "gcr", &s->gcr, TYPE_NPCM7XX_GCR);
> > +    object_property_add_alias(obj, "power-on-straps", OBJECT(&s->gcr),
> > +                              "power-on-straps");
> > +    object_initialize_child(obj, "clk", &s->clk, TYPE_NPCM7XX_CLK);
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(s->tim); i++) {
> > +        object_initialize_child(obj, "tim[*]", &s->tim[i], TYPE_NPCM7X=
X_TIMER);
> > +    }
> > +}
> > +
> > +static void npcm7xx_realize(DeviceState *dev, Error **errp)
> > +{
> > +    NPCM7xxState *s =3D NPCM7XX(dev);
> > +    NPCM7xxClass *nc =3D NPCM7XX_GET_CLASS(s);
> > +    int i;
> > +
> > +    if (memory_region_size(s->dram) > NPCM7XX_DRAM_SZ) {
> > +        error_setg(errp, "%s: NPCM7xx cannot address more than %" PRIu=
64
> > +                   " MiB of DRAM", __func__, NPCM7XX_DRAM_SZ / MiB);
> > +        return;
> > +    }
> > +
> > +    /* CPUs */
> > +    for (i =3D 0; i < nc->num_cpus; i++) {
> > +        object_property_set_int(OBJECT(&s->cpu[i]), "mp-affinity",
> > +                                arm_cpu_mp_affinity(i, NPCM7XX_MAX_NUM=
_CPUS),
> > +                                &error_abort);
> > +        object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
> > +                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort)=
;
> > +        object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", t=
rue,
> > +                                 &error_abort);
> > +
> > +        /* Disable security extensions. */
> > +        object_property_set_bool(OBJECT(&s->cpu[i]), "has_el3", false,
> > +                                 &error_abort);
> > +
> > +        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
> > +            return;
> > +        }
> > +    }
> > +
> > +    /* A9MPCORE peripherals. Can only fail if we pass bad parameters h=
ere. */
> > +    object_property_set_int(OBJECT(&s->a9mpcore), "num-cpu", nc->num_c=
pus,
> > +                            &error_abort);
> > +    object_property_set_int(OBJECT(&s->a9mpcore), "num-irq", NPCM7XX_N=
UM_IRQ,
> > +                            &error_abort);
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->a9mpcore), &error_abort);
>
> shouldn't we test the return value and use errp ? I don't know what
> was agreed upon.

I'm not sure if I got it 100% right, but what I tried to do was to see
which submodules could possibly fail due to user input, and propagate
errors from those modules only.

For example, the GCR can fail if the user-provided memory size can't
be encoded into registers, so that one clearly needs to be propagated.

Other modules don't take any parameters at all, so they can only fail
due to programming errors, hence error_abort.

I wasn't able to find any way command line options could cause the
a9mpcore module to fail, but that's one of the cases I'm very unsure
about, so I'll be happy to propagate errors from that if you (or
anyone else) think it's needed.

I'm also not sure about the CPUs, but ended up going the other way
since there's a -cpu option, and it's plausible that the user could
cause it to fail even though I couldn't find any specific options to
trigger an error.

> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a9mpcore), 0, NPCM7XX_CPUP_BA);
> > +
> > +    for (i =3D 0; i < nc->num_cpus; i++) {
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
> > +                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CP=
U_IRQ));
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + nc->num_c=
pus,
> > +                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CP=
U_FIQ));
> > +    }
> > +
> > +    /* L2 cache controller */
> > +    sysbus_create_simple("l2x0", NPCM7XX_L2C_BA, NULL);
> > +
> > +    /* System Global Control Registers (GCR). Can fail due to user inp=
ut. */
> > +    object_property_set_int(OBJECT(&s->gcr), "disabled-modules",
> > +                            nc->disabled_modules, &error_abort);
> > +    object_property_add_const_link(OBJECT(&s->gcr), "dram-mr", OBJECT(=
s->dram));
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gcr), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gcr), 0, NPCM7XX_GCR_BA);
> > +
> > +    /* Clock Control Registers (CLK). Cannot fail. */
> > +    sysbus_realize(SYS_BUS_DEVICE(&s->clk), &error_abort);
>
> same here.

This module doesn't take any parameters, and it doesn't implement the
realize() method, so any error could only be caused by a programming
error.

> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->clk), 0, NPCM7XX_CLK_BA);
> > +
> > +    /* Timer Modules (TIM). Cannot fail. */
> > +    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) !=3D ARRAY_SIZE(s->=
tim));
> > +    for (i =3D 0; i < ARRAY_SIZE(s->tim); i++) {
> > +        SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->tim[i]);
> > +        int first_irq;
> > +        int j;
> > +
> > +        sysbus_realize(sbd, &error_abort);
>
> and here.
>
> > +        sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[i]);
> > +
> > +        first_irq =3D NPCM7XX_TIMER0_IRQ + i * NPCM7XX_TIMERS_PER_CTRL=
;
> > +        for (j =3D 0; j < NPCM7XX_TIMERS_PER_CTRL; j++) {
> > +            qemu_irq irq =3D npcm7xx_irq(s, first_irq + j);
> > +            sysbus_connect_irq(sbd, j, irq);
> > +        }
> > +    }
> > +
> > +    /* UART0..3 (16550 compatible) */
> > +    for (i =3D 0; i < ARRAY_SIZE(npcm7xx_uart_addr); i++) {
> > +        serial_mm_init(get_system_memory(), npcm7xx_uart_addr[i], 2,
> > +                       npcm7xx_irq(s, NPCM7XX_UART0_IRQ + i), 115200,
> > +                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
> > +    }
> > +
> > +    /* RAM2 (SRAM) */
> > +    memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
> > +                           NPCM7XX_RAM2_SZ, &error_abort);
> > +    memory_region_add_subregion(get_system_memory(), NPCM7XX_RAM2_BA, =
&s->sram);
> > +
> > +    /* RAM3 (SRAM) */
> > +    memory_region_init_ram(&s->ram3, OBJECT(dev), "ram3",
> > +                           NPCM7XX_RAM3_SZ, &error_abort);
> > +    memory_region_add_subregion(get_system_memory(), NPCM7XX_RAM3_BA, =
&s->ram3);
> > +
> > +    /* Internal ROM */
> > +    memory_region_init_rom(&s->irom, OBJECT(dev), "irom", NPCM7XX_ROM_=
SZ,
> > +                           &error_abort);
> > +    memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &=
s->irom);
> > +
> > +    create_unimplemented_device("npcm7xx.shm",          0xc0001000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  6=
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.rng",          0xf000b000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.adc",          0xf000c000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[2]",      0xf0012000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[3]",      0xf0013000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[4]",      0xf0014000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[5]",      0xf0015000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[6]",      0xf0016000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gpio[7]",      0xf0017000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[3]",     0xf0083000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[4]",     0xf0084000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[5]",     0xf0085000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[6]",     0xf0086000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[7]",     0xf0087000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[8]",     0xf0088000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[9]",     0xf0089000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[10]",    0xf008a000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[11]",    0xf008b000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[12]",    0xf008c000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[13]",    0xf008d000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[14]",    0xf008e000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.smbus[15]",    0xf008f000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.espi",         0xf009f000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.peci",         0xf0100000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.pwm[0]",       0xf0103000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.pwm[1]",       0xf0104000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[3]",       0xf0183000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[4]",       0xf0184000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[5]",       0xf0185000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[6]",       0xf0186000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.mft[7]",       0xf0187000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   =
1 * MiB);
> > +    create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  6=
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.ehci",         0xf0806000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.ohci",         0xf0807000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  6=
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.ece",          0xf0820000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.emc1",         0xf0825000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.emc2",         0xf0826000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[0]",      0xf0830000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[1]",      0xf0831000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[2]",      0xf0832000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[3]",      0xf0833000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[4]",      0xf0834000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[5]",      0xf0835000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[6]",      0xf0836000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[7]",      0xf0837000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.sd",           0xf0840000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.mmc",          0xf0842000,   =
8 * KiB);
> > +    create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 51=
2 * KiB);
> > +    create_unimplemented_device("npcm7xx.aes",          0xf0858000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.des",          0xf0859000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.sha",          0xf085a000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.secacc",       0xf085b000,   =
4 * KiB);
> > +    create_unimplemented_device("npcm7xx.spixcs0",      0xf8000000,  1=
6 * MiB);
> > +    create_unimplemented_device("npcm7xx.spixcs1",      0xf9000000,  1=
6 * MiB);
> > +    create_unimplemented_device("npcm7xx.spix",         0xfb001000,   =
4 * KiB);
> > +}
> > +
> > +static Property npcm7xx_properties[] =3D {
> > +    DEFINE_PROP_LINK("dram-mr", NPCM7xxState, dram, TYPE_MEMORY_REGION=
,
> > +                     MemoryRegion *),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void npcm7xx_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> > +
> > +    dc->realize =3D npcm7xx_realize;
> > +    dc->user_creatable =3D false;
> > +    device_class_set_props(dc, npcm7xx_properties);
> > +}
> > +
> > +static void npcm730_class_init(ObjectClass *oc, void *data)
> > +{
> > +    NPCM7xxClass *nc =3D NPCM7XX_CLASS(oc);
> > +
> > +    /* NPCM730 is optimized for data center use, so no graphics, etc. =
*/
> > +    nc->disabled_modules =3D 0x00300395;
> > +    nc->num_cpus =3D 2;
> > +}
> > +
> > +static void npcm750_class_init(ObjectClass *oc, void *data)
> > +{
> > +    NPCM7xxClass *nc =3D NPCM7XX_CLASS(oc);
> > +
> > +    /* NPCM750 has 2 cores and a full set of peripherals */
> > +    nc->disabled_modules =3D 0x00000000;
> > +    nc->num_cpus =3D 2;
> > +}
> > +
> > +static const TypeInfo npcm7xx_soc_types[] =3D {
> > +    {
> > +        .name           =3D TYPE_NPCM7XX,
> > +        .parent         =3D TYPE_DEVICE,
> > +        .instance_size  =3D sizeof(NPCM7xxState),
> > +        .instance_init  =3D npcm7xx_init,
> > +        .class_size     =3D sizeof(NPCM7xxClass),
> > +        .class_init     =3D npcm7xx_class_init,
> > +        .abstract       =3D true,
> > +    }, {
> > +        .name           =3D TYPE_NPCM730,
> > +        .parent         =3D TYPE_NPCM7XX,
> > +        .class_init     =3D npcm730_class_init,
> > +    }, {
> > +        .name           =3D TYPE_NPCM750,
> > +        .parent         =3D TYPE_NPCM7XX,
> > +        .class_init     =3D npcm750_class_init,
> > +    },
> > +};
> > +
> > +DEFINE_TYPES(npcm7xx_soc_types);
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 192a8dec3b..a31d0d282f 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -356,6 +356,11 @@ config XLNX_VERSAL
> >
> >  config NPCM7XX
> >      bool
> > +    select A9MPCORE
> > +    select ARM_GIC
> > +    select PL310  # cache controller
> > +    select SERIAL
> > +    select UNIMP
> >
> >  config FSL_IMX25
> >      bool
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index 534a6a119e..13d163a599 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
> >  obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
> >  obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
> >  obj-$(CONFIG_XLNX_VERSAL) +=3D xlnx-versal.o xlnx-versal-virt.o
> > +obj-$(CONFIG_NPCM7XX) +=3D npcm7xx.o
> >  obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
> >  obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
> >  obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o
> >
>

