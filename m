Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E935B13B5A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 00:07:28 +0100 (CET)
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irVHT-0004iF-Ki
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 18:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51228)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1irVFB-0003KP-7v
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 18:05:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1irVF6-0005Qy-RL
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 18:05:05 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42173)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1irVF6-0005QG-HO; Tue, 14 Jan 2020 18:05:00 -0500
Received: by mail-io1-xd41.google.com with SMTP id n11so15752552iom.9;
 Tue, 14 Jan 2020 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TauqHO5/KBnafkzf2xj8Oz2F8nh/vKfKOr1SY9clp5s=;
 b=HOtXNWAtwvdKy937vgdIhhnNAvZyvQQQuQdSbnWDZYhZBPi/fRxlCAKNfheU1dqEnZ
 dNhZeU5kYdp8kmsZzcg7NPX4fgsIAMXOAm/6GhNjZWtQEwbceAU4WM5nBp5jfAhrMtSt
 u+QzCNGbAIEp3VkweYrkAvCCZ1hu0ZQB53Qz2Yb00MVFY0FbqwsJfH6CkL7TSCTCjX6F
 Cvz1JG0N8hoGneVr8d8nXjfPqH0K3NbzBBBF2gIyUZW83LvxVyYfIDDtqF1okzrPbY88
 lOz2nIC5ek41ufJIPjd9HzhQ/hjuGFP2l16yfjMiIt4zYlkD65CrD53WFZIEDEdvxGuq
 6xSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TauqHO5/KBnafkzf2xj8Oz2F8nh/vKfKOr1SY9clp5s=;
 b=jMyWARirY8lEaUIIuMSx+/pO5tN3qeUwLOQxrlyXCpm1pmapv/6SU7pkjrxKgQOZ2m
 XMP0biTqjV9TOHdfGBXUnmb9cKUldKBwva39mn47/f4jwNJmQjU0dKITKr0LL5Ogm6uR
 KKIRhASVvy2v56lCSM960cAZunm/HIdb0SiDE/ZI+GRAUKrFmsK/Gr62Fv3Rp+VpGrS4
 Na/k2vYpz0F26LYKq94SwJoVZ+/SISzoFU2KJtcylQZxa62yBErS0NSwDVGfqii25bMt
 4USDuOHxE/u1eJ6H5EDXl2gH6c6EGL10Renp7wQg/8QinLAhcsYVeqAihsmW9ad8fACT
 Sc2g==
X-Gm-Message-State: APjAAAWgqxH4yHo3rto0rRpTfoD/NMxjEcKlgMiETxcQkWyLqwTnnztQ
 N2EYofEdM5hByLzIqPhBVYH0i8WTw3xxO8HqLqE=
X-Google-Smtp-Source: APXvYqx2BHXECUMBDDsfiGpe5zT0znX86qAN9ZCDf5+mPy6iOWinAW89sHsImfoWy0RZ08c081XNCaW0xueKnz9XS8U=
X-Received: by 2002:a02:8817:: with SMTP id r23mr21480325jai.120.1579043099506; 
 Tue, 14 Jan 2020 15:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20200108200020.4745-1-nieklinnenbank@gmail.com>
 <20200108200020.4745-7-nieklinnenbank@gmail.com>
 <8bbf88b2-867a-c95d-a3ae-e819f7dd08ac@redhat.com>
In-Reply-To: <8bbf88b2-867a-c95d-a3ae-e819f7dd08ac@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 15 Jan 2020 00:04:48 +0100
Message-ID: <CAPan3Wo3Li4XZJqHhhk5fnY_PnzGZ8YwUwCud8Ge4Z_+BOwW1w@mail.gmail.com>
Subject: Re: [PATCH v3 06/17] hw/arm/allwinner: add CPU Configuration module
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000080492059c219f8b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000080492059c219f8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 12:14 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 1/8/20 9:00 PM, Niek Linnenbank wrote:
> > Various Allwinner System on Chip designs contain multiple processors
> > that can be configured and reset using the generic CPU Configuration
> > module interface. This commit adds support for the Allwinner CPU
> > configuration interface which emulates the following features:
> >
> >   * CPU reset
> >   * CPU status
> >   * Shared 64-bit timer
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> >   include/hw/arm/allwinner-h3.h      |   3 +
> >   include/hw/misc/allwinner-cpucfg.h |  54 ++++++
> >   hw/arm/allwinner-h3.c              |   9 +-
> >   hw/misc/allwinner-cpucfg.c         | 282 ++++++++++++++++++++++++++++=
+
> >   hw/misc/Makefile.objs              |   1 +
> >   hw/misc/trace-events               |   5 +
> >   6 files changed, 353 insertions(+), 1 deletion(-)
> >   create mode 100644 include/hw/misc/allwinner-cpucfg.h
> >   create mode 100644 hw/misc/allwinner-cpucfg.c
> >
> > diff --git a/include/hw/arm/allwinner-h3.h
> b/include/hw/arm/allwinner-h3.h
> > index 26706f4fa6..5a25a92eae 100644
> > --- a/include/hw/arm/allwinner-h3.h
> > +++ b/include/hw/arm/allwinner-h3.h
> > @@ -44,6 +44,7 @@
> >   #include "hw/timer/allwinner-a10-pit.h"
> >   #include "hw/intc/arm_gic.h"
> >   #include "hw/misc/allwinner-h3-ccu.h"
> > +#include "hw/misc/allwinner-cpucfg.h"
> >   #include "hw/misc/allwinner-h3-sysctrl.h"
> >   #include "target/arm/cpu.h"
> >
> > @@ -80,6 +81,7 @@ enum {
> >       AW_H3_GIC_CPU,
> >       AW_H3_GIC_HYP,
> >       AW_H3_GIC_VCPU,
> > +    AW_H3_CPUCFG,
> >       AW_H3_SDRAM
> >   };
> >
> > @@ -111,6 +113,7 @@ typedef struct AwH3State {
> >       const hwaddr *memmap;
> >       AwA10PITState timer;
> >       AwH3ClockCtlState ccu;
> > +    AwCpuCfgState cpucfg;
> >       AwH3SysCtrlState sysctrl;
> >       GICState gic;
> >       MemoryRegion sram_a1;
> > diff --git a/include/hw/misc/allwinner-cpucfg.h
> b/include/hw/misc/allwinner-cpucfg.h
> > new file mode 100644
> > index 0000000000..2c0e5b7e03
> > --- /dev/null
> > +++ b/include/hw/misc/allwinner-cpucfg.h
> > @@ -0,0 +1,54 @@
> > +/*
> > + * Allwinner CPU Configuration Module emulation
> > + *
> > + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> > + *
> > + * This program is free software: you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation, either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +
> > +#ifndef HW_MISC_ALLWINNER_CPUCFG_H
> > +#define HW_MISC_ALLWINNER_CPUCFG_H
> > +
> > +#include "qemu/osdep.h"
> > +#include "qom/object.h"
> > +#include "hw/sysbus.h"
> > +
> > +/**
> > + * Object model
> > + * @{
> > + */
> > +
> > +#define TYPE_AW_CPUCFG   "allwinner-cpucfg"
> > +#define AW_CPUCFG(obj) \
> > +    OBJECT_CHECK(AwCpuCfgState, (obj), TYPE_AW_CPUCFG)
> > +
> > +/** @} */
> > +
> > +/**
> > + * Allwinner CPU Configuration Module instance state
> > + */
> > +typedef struct AwCpuCfgState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +    /*< public >*/
> > +
> > +    MemoryRegion iomem;
> > +    uint32_t gen_ctrl;
> > +    uint32_t super_standby;
> > +    uint32_t entry_addr;
> > +    uint32_t counter_ctrl;
> > +
> > +} AwCpuCfgState;
> > +
> > +#endif /* HW_MISC_ALLWINNER_CPUCFG_H */
> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> > index d261d7b2be..e9ad6d23df 100644
> > --- a/hw/arm/allwinner-h3.c
> > +++ b/hw/arm/allwinner-h3.c
> > @@ -54,6 +54,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
> >       [AW_H3_GIC_CPU]    =3D 0x01c82000,
> >       [AW_H3_GIC_HYP]    =3D 0x01c84000,
> >       [AW_H3_GIC_VCPU]   =3D 0x01c86000,
> > +    [AW_H3_CPUCFG]     =3D 0x01f01c00,
> >       [AW_H3_SDRAM]      =3D 0x40000000
> >   };
> >
> > @@ -120,7 +121,6 @@ struct AwH3Unimplemented {
> >       { "r_wdog",    0x01f01000, 1 * KiB },
> >       { "r_prcm",    0x01f01400, 1 * KiB },
> >       { "r_twd",     0x01f01800, 1 * KiB },
> > -    { "r_cpucfg",  0x01f01c00, 1 * KiB },
> >       { "r_cir-rx",  0x01f02000, 1 * KiB },
> >       { "r_twi",     0x01f02400, 1 * KiB },
> >       { "r_uart",    0x01f02800, 1 * KiB },
> > @@ -193,6 +193,9 @@ static void allwinner_h3_init(Object *obj)
> >
> >       sysbus_init_child_obj(obj, "sysctrl", &s->sysctrl,
> sizeof(s->sysctrl),
> >                             TYPE_AW_H3_SYSCTRL);
> > +
> > +    sysbus_init_child_obj(obj, "cpucfg", &s->cpucfg, sizeof(s->cpucfg)=
,
> > +                          TYPE_AW_CPUCFG);
> >   }
> >
> >   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> > @@ -309,6 +312,10 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
> >       qdev_init_nofail(DEVICE(&s->sysctrl));
> >       sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0,
> s->memmap[AW_H3_SYSCTRL]);
> >
> > +    /* CPU Configuration */
> > +    qdev_init_nofail(DEVICE(&s->cpucfg));
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->cpucfg), 0,
> s->memmap[AW_H3_CPUCFG]);
> > +
> >       /* Universal Serial Bus */
> >       sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
> >                            qdev_get_gpio_in(DEVICE(&s->gic),
> > diff --git a/hw/misc/allwinner-cpucfg.c b/hw/misc/allwinner-cpucfg.c
> > new file mode 100644
> > index 0000000000..58c7a1448d
> > --- /dev/null
> > +++ b/hw/misc/allwinner-cpucfg.c
> > @@ -0,0 +1,282 @@
> > +/*
> > + * Allwinner CPU Configuration Module emulation
> > + *
> > + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> > + *
> > + * This program is free software: you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation, either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/units.h"
> > +#include "hw/sysbus.h"
> > +#include "migration/vmstate.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/timer.h"
> > +#include "hw/core/cpu.h"
> > +#include "arm-powerctl.h"
> > +#include "hw/misc/allwinner-cpucfg.h"
> > +#include "trace.h"
> > +
> > +/* CPUCFG register offsets */
> > +enum {
> > +    REG_CPUS_RST_CTRL       =3D 0x0000, /* CPUs Reset Control */
> > +    REG_CPU0_RST_CTRL       =3D 0x0040, /* CPU#0 Reset Control */
> > +    REG_CPU0_CTRL           =3D 0x0044, /* CPU#0 Control */
> > +    REG_CPU0_STATUS         =3D 0x0048, /* CPU#0 Status */
> > +    REG_CPU1_RST_CTRL       =3D 0x0080, /* CPU#1 Reset Control */
> > +    REG_CPU1_CTRL           =3D 0x0084, /* CPU#1 Control */
> > +    REG_CPU1_STATUS         =3D 0x0088, /* CPU#1 Status */
> > +    REG_CPU2_RST_CTRL       =3D 0x00C0, /* CPU#2 Reset Control */
> > +    REG_CPU2_CTRL           =3D 0x00C4, /* CPU#2 Control */
> > +    REG_CPU2_STATUS         =3D 0x00C8, /* CPU#2 Status */
> > +    REG_CPU3_RST_CTRL       =3D 0x0100, /* CPU#3 Reset Control */
> > +    REG_CPU3_CTRL           =3D 0x0104, /* CPU#3 Control */
> > +    REG_CPU3_STATUS         =3D 0x0108, /* CPU#3 Status */
> > +    REG_CPU_SYS_RST         =3D 0x0140, /* CPU System Reset */
> > +    REG_CLK_GATING          =3D 0x0144, /* CPU Clock Gating */
> > +    REG_GEN_CTRL            =3D 0x0184, /* General Control */
> > +    REG_SUPER_STANDBY       =3D 0x01A0, /* Super Standby Flag */
> > +    REG_ENTRY_ADDR          =3D 0x01A4, /* Reset Entry Address */
> > +    REG_DBG_EXTERN          =3D 0x01E4, /* Debug External */
> > +    REG_CNT64_CTRL          =3D 0x0280, /* 64-bit Counter Control */
> > +    REG_CNT64_LOW           =3D 0x0284, /* 64-bit Counter Low */
> > +    REG_CNT64_HIGH          =3D 0x0288, /* 64-bit Counter High */
> > +};
> > +
> > +/* CPUCFG register flags */
> > +enum {
> > +    CPUX_RESET_RELEASED     =3D ((1 << 1) | (1 << 0)),
> > +    CPUX_STATUS_SMP         =3D (1 << 0),
> > +    CPU_SYS_RESET_RELEASED  =3D (1 << 0),
> > +    CLK_GATING_ENABLE       =3D ((1 << 8) | 0xF),
> > +};
> > +
> > +/* CPUCFG register reset values */
> > +enum {
> > +    REG_CLK_GATING_RST      =3D 0x0000010F,
> > +    REG_GEN_CTRL_RST        =3D 0x00000020,
> > +    REG_SUPER_STANDBY_RST   =3D 0x0,
> > +    REG_CNT64_CTRL_RST      =3D 0x0,
> > +};
> > +
> > +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_i=
d)
> > +{
> > +    int ret;
> > +
> > +    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
> > +
> > +    ret =3D arm_set_cpu_on(cpu_id, s->entry_addr, 0, 3, false);
>
> Can you add a definition for 3?
>
> #define CPU_EXCEPTION_LEVEL_ON_RESET 3 /* EL3 */
>

Sure, I'll add that.


>
> > +    if (ret !=3D QEMU_ARM_POWERCTL_RET_SUCCESS) {
> > +        error_report("%s: failed to bring up CPU %d: err %d",
> > +                     __func__, cpu_id, ret);
> > +        return;
> > +    }
> > +}
> > +
> > +static uint64_t allwinner_cpucfg_read(void *opaque, hwaddr offset,
> > +                                      unsigned size)
> > +{
> > +    const AwCpuCfgState *s =3D AW_CPUCFG(opaque);
> > +    uint64_t val =3D 0;
> > +
> > +    switch (offset) {
> > +    case REG_CPUS_RST_CTRL:     /* CPUs Reset Control */
> > +    case REG_CPU_SYS_RST:       /* CPU System Reset */
> > +        val =3D CPU_SYS_RESET_RELEASED;
> > +        break;
> > +    case REG_CPU0_RST_CTRL:     /* CPU#0 Reset Control */
> > +    case REG_CPU1_RST_CTRL:     /* CPU#1 Reset Control */
> > +    case REG_CPU2_RST_CTRL:     /* CPU#2 Reset Control */
> > +    case REG_CPU3_RST_CTRL:     /* CPU#3 Reset Control */
> > +        val =3D CPUX_RESET_RELEASED;
> > +        break;
> > +    case REG_CPU0_CTRL:         /* CPU#0 Control */
> > +    case REG_CPU1_CTRL:         /* CPU#1 Control */
> > +    case REG_CPU2_CTRL:         /* CPU#2 Control */
> > +    case REG_CPU3_CTRL:         /* CPU#3 Control */
> > +        val =3D 0;
> > +        break;
> > +    case REG_CPU0_STATUS:       /* CPU#0 Status */
> > +    case REG_CPU1_STATUS:       /* CPU#1 Status */
> > +    case REG_CPU2_STATUS:       /* CPU#2 Status */
> > +    case REG_CPU3_STATUS:       /* CPU#3 Status */
> > +        val =3D CPUX_STATUS_SMP;
> > +        break;
> > +    case REG_CLK_GATING:        /* CPU Clock Gating */
> > +        val =3D CLK_GATING_ENABLE;
> > +        break;
> > +    case REG_GEN_CTRL:          /* General Control */
> > +        val =3D s->gen_ctrl;
> > +        break;
> > +    case REG_SUPER_STANDBY:     /* Super Standby Flag */
> > +        val =3D s->super_standby;
> > +        break;
> > +    case REG_ENTRY_ADDR:        /* Reset Entry Address */
> > +        val =3D s->entry_addr;
> > +        break;
> > +    case REG_DBG_EXTERN:        /* Debug External */
> > +        break;
> > +    case REG_CNT64_CTRL:        /* 64-bit Counter Control */
> > +        val =3D s->counter_ctrl;
> > +        break;
> > +    case REG_CNT64_LOW:         /* 64-bit Counter Low */
> > +        val =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) & 0xffffffff;
> > +        break;
> > +    case REG_CNT64_HIGH:        /* 64-bit Counter High */
> > +        val =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) >> 32;
>
> Consider extract64(), but that's OK too.
>
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> > +                      __func__, (uint32_t)offset);
> > +        return 0;
>
> Please break instead, so we can see these calls when tracing.
>
Right, I missed that indeed. I'll change it to break.


>
> > +    }
> > +
> > +    trace_allwinner_cpucfg_read(offset, val, size);
> > +
> > +    return val;
> > +}
> > +
> > +static void allwinner_cpucfg_write(void *opaque, hwaddr offset,
> > +                                   uint64_t val, unsigned size)
> > +{
> > +    AwCpuCfgState *s =3D AW_CPUCFG(opaque);
> > +
> > +    trace_allwinner_cpucfg_write(offset, val, size);
> > +
> > +    switch (offset) {
> > +    case REG_CPUS_RST_CTRL:     /* CPUs Reset Control */
> > +    case REG_CPU_SYS_RST:       /* CPU System Reset */
> > +        break;
> > +    case REG_CPU0_RST_CTRL:     /* CPU#0 Reset Control */
> > +        if (val) {
> > +            allwinner_cpucfg_cpu_reset(s, 0);
> > +        }
> > +        break;
> > +    case REG_CPU1_RST_CTRL:     /* CPU#1 Reset Control */
> > +        if (val) {
> > +            allwinner_cpucfg_cpu_reset(s, 1);
> > +        }
> > +        break;
> > +    case REG_CPU2_RST_CTRL:     /* CPU#2 Reset Control */
> > +        if (val) {
> > +            allwinner_cpucfg_cpu_reset(s, 2);
> > +        }
> > +        break;
> > +    case REG_CPU3_RST_CTRL:     /* CPU#3 Reset Control */
> > +        if (val) {
> > +            allwinner_cpucfg_cpu_reset(s, 3);
> > +        }
> > +        break;
>
>        case REG_CPU0_RST_CTRL .,. REG_CPU3_RST_CTRL: /* CPU Reset Control
> */
>             if (val) {
>                 allwinner_cpucfg_cpu_reset(s, (offset -
> REG_CPU0_RST_CTRL) >> 6);
>             }
>             break;
>
> OK, that looks more compact and cleaner indeed. Thanks, I'll change it.



> > +    case REG_CPU0_CTRL:         /* CPU#0 Control */
> > +    case REG_CPU1_CTRL:         /* CPU#1 Control */
> > +    case REG_CPU2_CTRL:         /* CPU#2 Control */
> > +    case REG_CPU3_CTRL:         /* CPU#3 Control */
> > +    case REG_CPU0_STATUS:       /* CPU#0 Status */
> > +    case REG_CPU1_STATUS:       /* CPU#1 Status */
> > +    case REG_CPU2_STATUS:       /* CPU#2 Status */
> > +    case REG_CPU3_STATUS:       /* CPU#3 Status */
> > +    case REG_CLK_GATING:        /* CPU Clock Gating */
> > +    case REG_GEN_CTRL:          /* General Control */
> > +        s->gen_ctrl =3D val;
> > +        break;
> > +    case REG_SUPER_STANDBY:     /* Super Standby Flag */
> > +        s->super_standby =3D val;
> > +        break;
> > +    case REG_ENTRY_ADDR:        /* Reset Entry Address */
> > +        s->entry_addr =3D val;
> > +        break;
> > +    case REG_DBG_EXTERN:        /* Debug External */
> > +        break;
> > +    case REG_CNT64_CTRL:        /* 64-bit Counter Control */
> > +        s->counter_ctrl =3D val;
> > +        break;
> > +    case REG_CNT64_LOW:         /* 64-bit Counter Low */
> > +    case REG_CNT64_HIGH:        /* 64-bit Counter High */
>
> You forgot to set these. Maybe you can add a int64_t cnt64_diff, set it
> here to the difference with qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), and
> in the read() function return cnt64_diff +
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).
>

OK I'll need to look into that. Currently this timer is not used by Linux,
NetBSD or U-Boot as far
as I know. But since it is there, it should be correct indeed.


>
> Rest looks good.
>

Thanks for reviewing Philippe!
I'll get this in v4.

Regards,
Niek

>
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset
> 0x%04x\n",
> > +                      __func__, (uint32_t)offset);
> > +        return;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps allwinner_cpucfg_ops =3D {
> > +    .read =3D allwinner_cpucfg_read,
> > +    .write =3D allwinner_cpucfg_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +    .valid =3D {
> > +        .min_access_size =3D 4,
> > +        .max_access_size =3D 4,
> > +    },
> > +    .impl.min_access_size =3D 4,
> > +};
> > +
> > +static void allwinner_cpucfg_reset(DeviceState *dev)
> > +{
> > +    AwCpuCfgState *s =3D AW_CPUCFG(dev);
> > +
> > +    /* Set default values for registers */
> > +    s->gen_ctrl =3D REG_GEN_CTRL_RST;
> > +    s->super_standby =3D REG_SUPER_STANDBY_RST;
> > +    s->entry_addr =3D 0;
> > +    s->counter_ctrl =3D REG_CNT64_CTRL_RST;
> > +}
> > +
> > +static void allwinner_cpucfg_init(Object *obj)
> > +{
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> > +    AwCpuCfgState *s =3D AW_CPUCFG(obj);
> > +
> > +    /* Memory mapping */
> > +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_cpucfg_ops,
> s,
> > +                          TYPE_AW_CPUCFG, 1 * KiB);
> > +    sysbus_init_mmio(sbd, &s->iomem);
> > +}
> > +
> > +static const VMStateDescription allwinner_cpucfg_vmstate =3D {
> > +    .name =3D "allwinner-cpucfg",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT32(gen_ctrl, AwCpuCfgState),
> > +        VMSTATE_UINT32(super_standby, AwCpuCfgState),
> > +        VMSTATE_UINT32(counter_ctrl, AwCpuCfgState),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void allwinner_cpucfg_class_init(ObjectClass *klass, void *data=
)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->reset =3D allwinner_cpucfg_reset;
> > +    dc->vmsd =3D &allwinner_cpucfg_vmstate;
> > +}
> > +
> > +static const TypeInfo allwinner_cpucfg_info =3D {
> > +    .name          =3D TYPE_AW_CPUCFG,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_init =3D allwinner_cpucfg_init,
> > +    .instance_size =3D sizeof(AwCpuCfgState),
> > +    .class_init    =3D allwinner_cpucfg_class_init,
> > +};
> > +
> > +static void allwinner_cpucfg_register(void)
> > +{
> > +    type_register_static(&allwinner_cpucfg_info);
> > +}
> > +
> > +type_init(allwinner_cpucfg_register)
> > diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> > index 2d6b1a4257..12c2c306b5 100644
> > --- a/hw/misc/Makefile.objs
> > +++ b/hw/misc/Makefile.objs
> > @@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) +=3D macio/
> >   common-obj-$(CONFIG_IVSHMEM_DEVICE) +=3D ivshmem.o
> >
> >   common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-ccu.o
> > +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-cpucfg.o
> >   common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-sysctrl.o
> >   common-obj-$(CONFIG_REALVIEW) +=3D arm_sysctl.o
> >   common-obj-$(CONFIG_NSERIES) +=3D cbus.o
> > diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> > index 2e0c820834..d3e0952429 100644
> > --- a/hw/misc/trace-events
> > +++ b/hw/misc/trace-events
> > @@ -1,5 +1,10 @@
> >   # See docs/devel/tracing.txt for syntax documentation.
> >
> > +# allwinner-cpucfg.c
> > +allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u=
,
> reset_addr 0x%" PRIu32
> > +allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size)
> "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> > +allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size)
> "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> > +
> >   # eccmemctl.c
> >   ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
> >   ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
> >
>
>

--=20
Niek Linnenbank

--000000000000080492059c219f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 14, 2020 at 12:14 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 1/8/20 9:00 PM, Niek Linnenbank wrote:<br>
&gt; Various Allwinner System on Chip designs contain multiple processors<b=
r>
&gt; that can be configured and reset using the generic CPU Configuration<b=
r>
&gt; module interface. This commit adds support for the Allwinner CPU<br>
&gt; configuration interface which emulates the following features:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0* CPU reset<br>
&gt;=C2=A0 =C2=A0* CPU status<br>
&gt;=C2=A0 =C2=A0* Shared 64-bit timer<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/hw/arm/allwinner-h3.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
&gt;=C2=A0 =C2=A0include/hw/misc/allwinner-cpucfg.h |=C2=A0 54 ++++++<br>
&gt;=C2=A0 =C2=A0hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 =C2=A0hw/misc/allwinner-cpucfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 282 +++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A06 files changed, 353 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/misc/allwinner-cpucfg.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/misc/allwinner-cpucfg.c<br>
&gt; <br>
&gt; diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-=
h3.h<br>
&gt; index 26706f4fa6..5a25a92eae 100644<br>
&gt; --- a/include/hw/arm/allwinner-h3.h<br>
&gt; +++ b/include/hw/arm/allwinner-h3.h<br>
&gt; @@ -44,6 +44,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/timer/allwinner-a10-pit.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/intc/arm_gic.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/misc/allwinner-h3-ccu.h&quot;<br>
&gt; +#include &quot;hw/misc/allwinner-cpucfg.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/misc/allwinner-h3-sysctrl.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;target/arm/cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -80,6 +81,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_CPU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_HYP,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_GIC_VCPU,<br>
&gt; +=C2=A0 =C2=A0 AW_H3_CPUCFG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AW_H3_SDRAM<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -111,6 +113,7 @@ typedef struct AwH3State {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const hwaddr *memmap;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AwA10PITState timer;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AwH3ClockCtlState ccu;<br>
&gt; +=C2=A0 =C2=A0 AwCpuCfgState cpucfg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AwH3SysCtrlState sysctrl;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GICState gic;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a1;<br>
&gt; diff --git a/include/hw/misc/allwinner-cpucfg.h b/include/hw/misc/allw=
inner-cpucfg.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2c0e5b7e03<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/misc/allwinner-cpucfg.h<br>
&gt; @@ -0,0 +1,54 @@<br>
&gt; +/*<br>
&gt; + * Allwinner CPU Configuration Module emulation<br>
&gt; + *<br>
&gt; + * Copyright (C) 2019 Niek Linnenbank &lt;<a href=3D"mailto:nieklinne=
nbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software: you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_MISC_ALLWINNER_CPUCFG_H<br>
&gt; +#define HW_MISC_ALLWINNER_CPUCFG_H<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qom/object.h&quot;<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Object model<br>
&gt; + * @{<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define TYPE_AW_CPUCFG=C2=A0 =C2=A0&quot;allwinner-cpucfg&quot;<br>
&gt; +#define AW_CPUCFG(obj) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_CHECK(AwCpuCfgState, (obj), TYPE_AW_CPUCFG)<br>
&gt; +<br>
&gt; +/** @} */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Allwinner CPU Configuration Module instance state<br>
&gt; + */<br>
&gt; +typedef struct AwCpuCfgState {<br>
&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion iomem;<br>
&gt; +=C2=A0 =C2=A0 uint32_t gen_ctrl;<br>
&gt; +=C2=A0 =C2=A0 uint32_t super_standby;<br>
&gt; +=C2=A0 =C2=A0 uint32_t entry_addr;<br>
&gt; +=C2=A0 =C2=A0 uint32_t counter_ctrl;<br>
&gt; +<br>
&gt; +} AwCpuCfgState;<br>
&gt; +<br>
&gt; +#endif /* HW_MISC_ALLWINNER_CPUCFG_H */<br>
&gt; diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
&gt; index d261d7b2be..e9ad6d23df 100644<br>
&gt; --- a/hw/arm/allwinner-h3.c<br>
&gt; +++ b/hw/arm/allwinner-h3.c<br>
&gt; @@ -54,6 +54,7 @@ const hwaddr allwinner_h3_memmap[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_GIC_CPU]=C2=A0 =C2=A0 =3D 0x01c82000,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_GIC_HYP]=C2=A0 =C2=A0 =3D 0x01c84000,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_GIC_VCPU]=C2=A0 =C2=A0=3D 0x01c86000,=
<br>
&gt; +=C2=A0 =C2=A0 [AW_H3_CPUCFG]=C2=A0 =C2=A0 =C2=A0=3D 0x01f01c00,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[AW_H3_SDRAM]=C2=A0 =C2=A0 =C2=A0 =3D 0x4000=
0000<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -120,7 +121,6 @@ struct AwH3Unimplemented {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_wdog&quot;,=C2=A0 =C2=A0 0x01f0100=
0, 1 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_prcm&quot;,=C2=A0 =C2=A0 0x01f0140=
0, 1 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_twd&quot;,=C2=A0 =C2=A0 =C2=A00x01=
f01800, 1 * KiB },<br>
&gt; -=C2=A0 =C2=A0 { &quot;r_cpucfg&quot;,=C2=A0 0x01f01c00, 1 * KiB },<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_cir-rx&quot;,=C2=A0 0x01f02000, 1 =
* KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_twi&quot;,=C2=A0 =C2=A0 =C2=A00x01=
f02400, 1 * KiB },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r_uart&quot;,=C2=A0 =C2=A0 0x01f0280=
0, 1 * KiB },<br>
&gt; @@ -193,6 +193,9 @@ static void allwinner_h3_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(obj, &quot;sysctrl&quo=
t;, &amp;s-&gt;sysctrl, sizeof(s-&gt;sysctrl),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_AW_H3_SYSCTRL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_child_obj(obj, &quot;cpucfg&quot;, &amp;s-&=
gt;cpucfg, sizeof(s-&gt;cpucfg),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_AW_CPUCFG);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void allwinner_h3_realize(DeviceState *dev, Error *=
*errp)<br>
&gt; @@ -309,6 +312,10 @@ static void allwinner_h3_realize(DeviceState *dev=
, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_init_nofail(DEVICE(&amp;s-&gt;sysctrl))=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;sy=
sctrl), 0, s-&gt;memmap[AW_H3_SYSCTRL]);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* CPU Configuration */<br>
&gt; +=C2=A0 =C2=A0 qdev_init_nofail(DEVICE(&amp;s-&gt;cpucfg));<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;cpucfg), 0, s=
-&gt;memmap[AW_H3_CPUCFG]);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Universal Serial Bus */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_create_simple(TYPE_AW_H3_EHCI, s-&gt;=
memmap[AW_H3_EHCI0],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic),<br>
&gt; diff --git a/hw/misc/allwinner-cpucfg.c b/hw/misc/allwinner-cpucfg.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..58c7a1448d<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/misc/allwinner-cpucfg.c<br>
&gt; @@ -0,0 +1,282 @@<br>
&gt; +/*<br>
&gt; + * Allwinner CPU Configuration Module emulation<br>
&gt; + *<br>
&gt; + * Copyright (C) 2019 Niek Linnenbank &lt;<a href=3D"mailto:nieklinne=
nbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software: you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;hw/core/cpu.h&quot;<br>
&gt; +#include &quot;arm-powerctl.h&quot;<br>
&gt; +#include &quot;hw/misc/allwinner-cpucfg.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +/* CPUCFG register offsets */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 REG_CPUS_RST_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0000,=
 /* CPUs Reset Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU0_RST_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0040,=
 /* CPU#0 Reset Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU0_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0044, /* CPU#0 Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU0_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
0048, /* CPU#0 Status */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU1_RST_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0080,=
 /* CPU#1 Reset Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU1_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0084, /* CPU#1 Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU1_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
0088, /* CPU#1 Status */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU2_RST_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x00C0,=
 /* CPU#2 Reset Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU2_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x00C4, /* CPU#2 Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU2_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
00C8, /* CPU#2 Status */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU3_RST_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x0100,=
 /* CPU#3 Reset Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU3_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0104, /* CPU#3 Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU3_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
0108, /* CPU#3 Status */<br>
&gt; +=C2=A0 =C2=A0 REG_CPU_SYS_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
0140, /* CPU System Reset */<br>
&gt; +=C2=A0 =C2=A0 REG_CLK_GATING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
0144, /* CPU Clock Gating */<br>
&gt; +=C2=A0 =C2=A0 REG_GEN_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0x0184, /* General Control */<br>
&gt; +=C2=A0 =C2=A0 REG_SUPER_STANDBY=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01A0,=
 /* Super Standby Flag */<br>
&gt; +=C2=A0 =C2=A0 REG_ENTRY_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
01A4, /* Reset Entry Address */<br>
&gt; +=C2=A0 =C2=A0 REG_DBG_EXTERN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
01E4, /* Debug External */<br>
&gt; +=C2=A0 =C2=A0 REG_CNT64_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
0280, /* 64-bit Counter Control */<br>
&gt; +=C2=A0 =C2=A0 REG_CNT64_LOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x0284, /* 64-bit Counter Low */<br>
&gt; +=C2=A0 =C2=A0 REG_CNT64_HIGH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
0288, /* 64-bit Counter High */<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* CPUCFG register flags */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 CPUX_RESET_RELEASED=C2=A0 =C2=A0 =C2=A0=3D ((1 &lt;&lt;=
 1) | (1 &lt;&lt; 0)),<br>
&gt; +=C2=A0 =C2=A0 CPUX_STATUS_SMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D (1=
 &lt;&lt; 0),<br>
&gt; +=C2=A0 =C2=A0 CPU_SYS_RESET_RELEASED=C2=A0 =3D (1 &lt;&lt; 0),<br>
&gt; +=C2=A0 =C2=A0 CLK_GATING_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ((1 &lt=
;&lt; 8) | 0xF),<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* CPUCFG register reset values */<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 REG_CLK_GATING_RST=C2=A0 =C2=A0 =C2=A0 =3D 0x0000010F,<=
br>
&gt; +=C2=A0 =C2=A0 REG_GEN_CTRL_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00000=
020,<br>
&gt; +=C2=A0 =C2=A0 REG_SUPER_STANDBY_RST=C2=A0 =C2=A0=3D 0x0,<br>
&gt; +=C2=A0 =C2=A0 REG_CNT64_CTRL_RST=C2=A0 =C2=A0 =C2=A0 =3D 0x0,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_=
id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_allwinner_cpucfg_cpu_reset(cpu_id, s-&gt;entry_ad=
dr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D arm_set_cpu_on(cpu_id, s-&gt;entry_addr, 0, 3, =
false);<br>
<br>
Can you add a definition for 3?<br>
<br>
#define CPU_EXCEPTION_LEVEL_ON_RESET 3 /* EL3 */<br></blockquote><div><br><=
/div><div>Sure, I&#39;ll add that.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 if (ret !=3D QEMU_ARM_POWERCTL_RET_SUCCESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: failed to bring up=
 CPU %d: err %d&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, cpu_id, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t allwinner_cpucfg_read(void *opaque, hwaddr offset,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned si=
ze)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const AwCpuCfgState *s =3D AW_CPUCFG(opaque);<br>
&gt; +=C2=A0 =C2=A0 uint64_t val =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case REG_CPUS_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPUs Rese=
t Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU_SYS_RST:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU =
System Reset */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D CPU_SYS_RESET_RELEASED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU0_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#0 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#1 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#2 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#3 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D CPUX_RESET_RELEASED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU0_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#0 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#1 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#2 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#3 Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU0_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
0 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
1 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
2 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
3 Status */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D CPUX_STATUS_SMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CLK_GATING:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CPU =
Clock Gating */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D CLK_GATING_ENABLE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_GEN_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 General Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;gen_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_SUPER_STANDBY:=C2=A0 =C2=A0 =C2=A0/* Super Sta=
ndby Flag */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;super_standby;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_ENTRY_ADDR:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Rese=
t Entry Address */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;entry_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_DBG_EXTERN:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Debu=
g External */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 64-b=
it Counter Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;counter_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_LOW:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 64-bit Counter Low */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL) &amp; 0xffffffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_HIGH:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 64-b=
it Counter High */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL) &gt;&gt; 32;<br>
<br>
Consider extract64(), but that&#39;s OK too.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
out-of-bounds offset 0x%04x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (uint32_t)offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
Please break instead, so we can see these calls when tracing.<br></blockquo=
te><div>Right, I missed that indeed. I&#39;ll change it to break.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_allwinner_cpucfg_read(offset, val, size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_write(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t val, unsig=
ned size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AwCpuCfgState *s =3D AW_CPUCFG(opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 trace_allwinner_cpucfg_write(offset, val, size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case REG_CPUS_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPUs Rese=
t Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU_SYS_RST:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU =
System Reset */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU0_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#0 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_cpucfg_cpu_reset(=
s, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#1 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_cpucfg_cpu_reset(=
s, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#2 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_cpucfg_cpu_reset(=
s, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_RST_CTRL:=C2=A0 =C2=A0 =C2=A0/* CPU#3 Res=
et Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_cpucfg_cpu_reset(=
s, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case REG_CPU0_RST_CTRL .,. REG_CPU3_RST_CTRL: /*=
 CPU Reset Control */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allwinner_cpucfg_cp=
u_reset(s, (offset - <br>
REG_CPU0_RST_CTRL) &gt;&gt; 6);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br></blockquote><div>OK, that looks more compact and cleaner indeed. Thank=
s, I&#39;ll change it.<br></div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 case REG_CPU0_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#0 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#1 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#2 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 CPU#3 Control */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU0_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
0 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU1_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
1 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU2_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
2 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CPU3_STATUS:=C2=A0 =C2=A0 =C2=A0 =C2=A0/* CPU#=
3 Status */<br>
&gt; +=C2=A0 =C2=A0 case REG_CLK_GATING:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CPU =
Clock Gating */<br>
&gt; +=C2=A0 =C2=A0 case REG_GEN_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 General Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;gen_ctrl =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_SUPER_STANDBY:=C2=A0 =C2=A0 =C2=A0/* Super Sta=
ndby Flag */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;super_standby =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_ENTRY_ADDR:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Rese=
t Entry Address */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;entry_addr =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_DBG_EXTERN:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Debu=
g External */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_CTRL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 64-b=
it Counter Control */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;counter_ctrl =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_LOW:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 64-bit Counter Low */<br>
&gt; +=C2=A0 =C2=A0 case REG_CNT64_HIGH:=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 64-b=
it Counter High */<br>
<br>
You forgot to set these. Maybe you can add a int64_t cnt64_diff, set it <br=
>
here to the difference with qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), and <br>
in the read() function return cnt64_diff + <br>
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).<br></blockquote><div>=C2=A0</div><di=
v>OK I&#39;ll need to look into that. Currently this timer is not used by L=
inux, NetBSD or U-Boot as far</div><div>as I know. But since it is there, i=
t should be correct indeed.<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Rest looks good.<br></blockquote><div><br></div><div>Thanks for reviewing P=
hilippe!</div><div>I&#39;ll get this in v4.</div><div><br></div><div>Regard=
s,</div><div>Niek<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
out-of-bounds offset 0x%04x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (uint32_t)offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps allwinner_cpucfg_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D allwinner_cpucfg_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D allwinner_cpucfg_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 .impl.min_access_size =3D 4,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AwCpuCfgState *s =3D AW_CPUCFG(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Set default values for registers */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;gen_ctrl =3D REG_GEN_CTRL_RST;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;super_standby =3D REG_SUPER_STANDBY_RST;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;entry_addr =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;counter_ctrl =3D REG_CNT64_CTRL_RST;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
&gt; +=C2=A0 =C2=A0 AwCpuCfgState *s =3D AW_CPUCFG(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Memory mapping */<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s), &amp=
;allwinner_cpucfg_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_AW_CPUCFG, 1 * KiB);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;iomem);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription allwinner_cpucfg_vmstate =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;allwinner-cpucfg&quot;,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(gen_ctrl, AwCpuCfgState),<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(super_standby, AwCpuCfgSta=
te),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(counter_ctrl, AwCpuCfgStat=
e),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_class_init(ObjectClass *klass, void *dat=
a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;reset =3D allwinner_cpucfg_reset;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;allwinner_cpucfg_vmstate;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo allwinner_cpucfg_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_AW_CPU=
CFG,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D allwinner_cpucfg_init,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(AwCpuCfgState),<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D allwinner_cpucfg_class_ini=
t,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void allwinner_cpucfg_register(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;allwinner_cpucfg_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(allwinner_cpucfg_register)<br>
&gt; diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
&gt; index 2d6b1a4257..12c2c306b5 100644<br>
&gt; --- a/hw/misc/Makefile.objs<br>
&gt; +++ b/hw/misc/Makefile.objs<br>
&gt; @@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) +=3D macio/<br>
&gt;=C2=A0 =C2=A0common-obj-$(CONFIG_IVSHMEM_DEVICE) +=3D ivshmem.o<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-ccu.o<=
br>
&gt; +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-cpucfg.o<br>
&gt;=C2=A0 =C2=A0common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-sysctr=
l.o<br>
&gt;=C2=A0 =C2=A0common-obj-$(CONFIG_REALVIEW) +=3D arm_sysctl.o<br>
&gt;=C2=A0 =C2=A0common-obj-$(CONFIG_NSERIES) +=3D cbus.o<br>
&gt; diff --git a/hw/misc/trace-events b/hw/misc/trace-events<br>
&gt; index 2e0c820834..d3e0952429 100644<br>
&gt; --- a/hw/misc/trace-events<br>
&gt; +++ b/hw/misc/trace-events<br>
&gt; @@ -1,5 +1,10 @@<br>
&gt;=C2=A0 =C2=A0# See docs/devel/tracing.txt for syntax documentation.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# allwinner-cpucfg.c<br>
&gt; +allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) &quot=
;id %u, reset_addr 0x%&quot; PRIu32<br>
&gt; +allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) =
&quot;offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx64 &quot; size %&qu=
ot; PRIu32<br>
&gt; +allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size)=
 &quot;offset 0x%&quot; PRIx64 &quot; data 0x%&quot; PRIx64 &quot; size %&q=
uot; PRIu32<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# eccmemctl.c<br>
&gt;=C2=A0 =C2=A0ecc_mem_writel_mer(uint32_t val) &quot;Write memory enable=
 0x%08x&quot;<br>
&gt;=C2=A0 =C2=A0ecc_mem_writel_mdr(uint32_t val) &quot;Write memory delay =
0x%08x&quot;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000080492059c219f8b--

