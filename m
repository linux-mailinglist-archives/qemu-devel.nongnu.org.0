Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4D1D4510
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 07:15:50 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZShJ-0002s7-1G
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 01:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZSgH-00026r-TX; Fri, 15 May 2020 01:14:45 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:32853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZSgG-0007PL-Lt; Fri, 15 May 2020 01:14:45 -0400
Received: by mail-yb1-xb43.google.com with SMTP id b8so516424ybn.0;
 Thu, 14 May 2020 22:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPMpGWNdMmwH/1zRFnqnkwiNrTq9UFY5wiaCddtI3kM=;
 b=NQ4L6MGJeYMrFf7eQNsZ/UhEm/zq06GZL1sbPw7shYoGynGgM4apFydlD1RVg/XFKo
 j9Vri5NzaEVR93bvVh5lAJleQiizZQmUfu3iNWpFBpZsYB5svDrJU44t8EiHIkdB1siI
 5X6gwQQHBPF8i6TZuWkF/eHCd2yfN1IJL0/QLehY76O9sqxzug8dit7fis4mlQseAV7m
 pf/VF+4gZ+NGi2he7aDCUV+KvN0AdsfPIpTJd/GbYTIhZq/4RRI3uJm3Oul0eXimrU76
 ZvlmQHzKQnwUvqcmi0PR3+4wdVEd5YgM3F7sRRdEZ0oMo2dox95USrox9tbeJaoaB276
 XQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPMpGWNdMmwH/1zRFnqnkwiNrTq9UFY5wiaCddtI3kM=;
 b=fHUAfr4AdWmZJmXFbQBzMVjpAM4c/NtcL5hrfngv0qCMmlKBeC4fCunzoN6xubgNWO
 LnLLloOWh2ObhcKsObFl2BVGK/37kG1aB8xGwT4DCNrc2Z9QMukE6c5L7UAQ49egQW4g
 UhgZkKRB900QJaWOim44AAFhvJ1cvscGjDrL2p1OZV+YDKPxEpVb9du8mDs0XMasH5jw
 pEyQ4DVBNuA5olJnzJLuBtyxRrnnm+1RvIl8ixcmJYJW+wrBsOt6oKMsKiSiy6Gd8vpx
 YauNqgAfuY2jx1j4x9piko20GJFm3ymluMIwf9KY9lCbVck8eccEbDkO1QB1MHWKxIRO
 0DpQ==
X-Gm-Message-State: AOAM533r+qy92lrKe8PA4qNr38TiYP2jXu8wL3NAkv2FlRkwx6Mis0kj
 Er9I0qH3q7PNFNq0oMqXnQWeMHQoqks1Jfe43tI=
X-Google-Smtp-Source: ABdhPJwEWzj/uE16G+l1i8vT0FNkr2J+IPfMg/G+TyHNyek5rvNHAIIfTyB8PlxbH1W8Vuc5TAIwA0g/GEAzi5+9mAk=
X-Received: by 2002:a25:c68e:: with SMTP id k136mr675993ybf.517.1589519682907; 
 Thu, 14 May 2020 22:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <b82d053d376f3540a38e60b8fec189b7a45f224d.1588878756.git.alistair.francis@wdc.com>
In-Reply-To: <b82d053d376f3540a38e60b8fec189b7a45f224d.1588878756.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 May 2020 13:14:32 +0800
Message-ID: <CAEUhbmVur5Xiucf71=yx9nTvS2ODYf2tHtaUvT9aP4DE+XPbEA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] riscv: Initial commit of OpenTitan machine
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 8, 2020 at 3:26 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> This adds a barebone OpenTitan machine to QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS                         |  10 ++
>  default-configs/riscv32-softmmu.mak |   1 +
>  default-configs/riscv64-softmmu.mak |  11 +-
>  hw/riscv/Kconfig                    |   5 +
>  hw/riscv/Makefile.objs              |   1 +
>  hw/riscv/opentitan.c                | 169 ++++++++++++++++++++++++++++
>  include/hw/riscv/opentitan.h        |  63 +++++++++++
>  7 files changed, 259 insertions(+), 1 deletion(-)
>  create mode 100644 hw/riscv/opentitan.c
>  create mode 100644 include/hw/riscv/opentitan.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f84e3ae2c..c3d77f0861 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1229,6 +1229,16 @@ F: pc-bios/canyonlands.dt[sb]
>  F: pc-bios/u-boot-sam460ex-20100605.bin
>  F: roms/u-boot-sam460ex
>
> +RISC-V Machines
> +-----------------

nits: please make --- end at an aligned place to the line before

> +OpenTitan
> +M: Alistair Francis <Alistair.Francis@wdc.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: hw/riscv/opentitan.c
> +F: include/hw/riscv/opentitan.h
> +
> +
>  SH4 Machines
>  ------------
>  R2D
> diff --git a/default-configs/riscv32-softmmu.mak b/default-configs/riscv32-softmmu.mak
> index 1ae077ed87..94a236c9c2 100644
> --- a/default-configs/riscv32-softmmu.mak
> +++ b/default-configs/riscv32-softmmu.mak
> @@ -10,3 +10,4 @@ CONFIG_SPIKE=y
>  CONFIG_SIFIVE_E=y
>  CONFIG_SIFIVE_U=y
>  CONFIG_RISCV_VIRT=y
> +CONFIG_OPENTITAN=y
> diff --git a/default-configs/riscv64-softmmu.mak b/default-configs/riscv64-softmmu.mak
> index 235c6f473f..aaf6d735bb 100644
> --- a/default-configs/riscv64-softmmu.mak
> +++ b/default-configs/riscv64-softmmu.mak
> @@ -1,3 +1,12 @@
>  # Default configuration for riscv64-softmmu
>
> -include riscv32-softmmu.mak
> +# Uncomment the following lines to disable these optional devices:
> +#
> +#CONFIG_PCI_DEVICES=n
> +
> +# Boards:
> +#
> +CONFIG_SPIKE=y
> +CONFIG_SIFIVE_E=y
> +CONFIG_SIFIVE_U=y
> +CONFIG_RISCV_VIRT=y
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index ff9fbe958a..94d19571f7 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -27,6 +27,11 @@ config SPIKE
>      select HTIF
>      select SIFIVE
>
> +config OPENTITAN
> +    bool
> +    select HART
> +    select UNIMP
> +
>  config RISCV_VIRT
>      bool
>      imply PCI_DEVICES
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index fc3c6dd7c8..57cc708f5d 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -1,6 +1,7 @@
>  obj-y += boot.o
>  obj-$(CONFIG_SPIKE) += riscv_htif.o
>  obj-$(CONFIG_HART) += riscv_hart.o
> +obj-$(CONFIG_OPENTITAN) += opentitan.o
>  obj-$(CONFIG_SIFIVE_E) += sifive_e.o
>  obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_clint.o
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> new file mode 100644
> index 0000000000..c00f0720ab
> --- /dev/null
> +++ b/hw/riscv/opentitan.c
> @@ -0,0 +1,169 @@
> +/*
> + * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
> + *
> + * Copyright (c) 2020 Western Digital
> + *
> + * Provides a board compatible with the OpenTitan FPGA platform:
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/riscv/opentitan.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/misc/unimp.h"
> +#include "hw/riscv/boot.h"
> +#include "exec/address-spaces.h"
> +
> +static const struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +} ibex_memmap[] = {
> +    [IBEX_ROM] =            {  0x00008000,   0xc000 },
> +    [IBEX_RAM] =            {  0x10000000,  0x10000 },
> +    [IBEX_FLASH] =          {  0x20000000,  0x80000 },
> +    [IBEX_UART] =           {  0x40000000,  0x10000 },
> +    [IBEX_GPIO] =           {  0x40010000,  0x10000 },
> +    [IBEX_SPI] =            {  0x40020000,  0x10000 },
> +    [IBEX_FLASH_CTRL] =     {  0x40030000,  0x10000 },
> +    [IBEX_PINMUX] =         {  0x40070000,  0x10000 },
> +    [IBEX_RV_TIMER] =       {  0x40080000,  0x10000 },
> +    [IBEX_PLIC] =           {  0x40090000,  0x10000 },
> +    [IBEX_AES] =            {  0x40110000,  0x10000 },
> +    [IBEX_HMAC] =           {  0x40120000,  0x10000 },
> +    [IBEX_ALERT_HANDLER] =  {  0x40130000,  0x10000 },
> +    [IBEX_USBDEV] =         {  0x40150000,  0x10000 }
> +};
> +
> +static void riscv_opentitan_init(MachineState *machine)
> +{
> +    const struct MemmapEntry *memmap = ibex_memmap;
> +    OpenTitanState *s = g_new0(OpenTitanState, 1);
> +    MemoryRegion *sys_mem = get_system_memory();
> +    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +
> +    /* Initialize SoC */
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc,
> +                            sizeof(s->soc), TYPE_RISCV_IBEX_SOC,
> +                            &error_abort, NULL);
> +    object_property_set_bool(OBJECT(&s->soc), true, "realized",
> +                            &error_abort);
> +
> +    memory_region_init_ram(main_mem, NULL, "riscv.lowrisc.ibex.ram",
> +        memmap[IBEX_RAM].size, &error_fatal);
> +    memory_region_add_subregion(sys_mem,
> +        memmap[IBEX_RAM].base, main_mem);
> +
> +
> +    if (machine->firmware) {
> +        riscv_load_firmware(machine->firmware, memmap[IBEX_RAM].base, NULL);
> +    }
> +
> +    if (machine->kernel_filename) {
> +        riscv_load_kernel(machine->kernel_filename, NULL);
> +    }
> +}
> +
> +static void riscv_opentitan_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "RISC-V Board compatible with OpenTitan";
> +    mc->init = riscv_opentitan_init;
> +    mc->max_cpus = 1;
> +    mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
> +}
> +
> +DEFINE_MACHINE("opentitan", riscv_opentitan_machine_init)
> +
> +static void riscv_lowrisc_ibex_soc_init(Object *obj)
> +{
> +    LowRISCIbexSoCState *s = RISCV_IBEX_SOC(obj);
> +
> +    object_initialize_child(obj, "cpus", &s->cpus,
> +                            sizeof(s->cpus), TYPE_RISCV_HART_ARRAY,
> +                            &error_abort, NULL);
> +}
> +
> +static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    const struct MemmapEntry *memmap = ibex_memmap;
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
> +    MemoryRegion *sys_mem = get_system_memory();
> +
> +    object_property_set_str(OBJECT(&s->cpus), ms->cpu_type, "cpu-type",
> +                            &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
> +                            &error_abort);
> +    object_property_set_bool(OBJECT(&s->cpus), true, "realized",
> +                            &error_abort);
> +
> +    /* Boot ROM */
> +    memory_region_init_rom(&s->rom, OBJECT(dev_soc), "riscv.lowrisc.ibex.rom",
> +                           memmap[IBEX_ROM].size, &error_fatal);
> +    memory_region_add_subregion(sys_mem,
> +        memmap[IBEX_ROM].base, &s->rom);
> +
> +    /* Flash memory */
> +    memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
> +                           memmap[IBEX_FLASH].size, &error_fatal);
> +    memory_region_add_subregion(sys_mem, memmap[IBEX_FLASH].base,
> +                                &s->flash_mem);
> +
> +    create_unimplemented_device("riscv.lowrisc.ibex.uart",
> +        memmap[IBEX_UART].base, memmap[IBEX_UART].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.gpio",
> +        memmap[IBEX_GPIO].base, memmap[IBEX_GPIO].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.spi",
> +        memmap[IBEX_SPI].base, memmap[IBEX_SPI].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
> +        memmap[IBEX_FLASH_CTRL].base, memmap[IBEX_FLASH_CTRL].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
> +        memmap[IBEX_RV_TIMER].base, memmap[IBEX_RV_TIMER].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.aes",
> +        memmap[IBEX_AES].base, memmap[IBEX_AES].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.hmac",
> +        memmap[IBEX_HMAC].base, memmap[IBEX_HMAC].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.plic",
> +        memmap[IBEX_PLIC].base, memmap[IBEX_PLIC].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
> +        memmap[IBEX_PINMUX].base, memmap[IBEX_PINMUX].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
> +        memmap[IBEX_ALERT_HANDLER].base, memmap[IBEX_ALERT_HANDLER].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.USBDEV",
> +        memmap[IBEX_USBDEV].base, memmap[IBEX_USBDEV].size);
> +}
> +
> +static void riscv_lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = riscv_lowrisc_ibex_soc_realize;
> +    /* Reason: Uses serial_hds in realize function, thus can't be used twice */
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo riscv_lowrisc_ibex_soc_type_info = {
> +    .name = TYPE_RISCV_IBEX_SOC,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(LowRISCIbexSoCState),
> +    .instance_init = riscv_lowrisc_ibex_soc_init,
> +    .class_init = riscv_lowrisc_ibex_soc_class_init,
> +};
> +
> +static void riscv_lowrisc_ibex_soc_register_types(void)
> +{
> +    type_register_static(&riscv_lowrisc_ibex_soc_type_info);
> +}
> +
> +type_init(riscv_lowrisc_ibex_soc_register_types)
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> new file mode 100644
> index 0000000000..15a3d87ed0
> --- /dev/null
> +++ b/include/hw/riscv/opentitan.h
> @@ -0,0 +1,63 @@
> +/*
> + * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
> + *
> + * Copyright (c) 2020 Western Digital
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_OPENTITAN_H
> +#define HW_OPENTITAN_H
> +
> +#include "hw/riscv/riscv_hart.h"
> +
> +#define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> +#define RISCV_IBEX_SOC(obj) \
> +    OBJECT_CHECK(LowRISCIbexSoCState, (obj), TYPE_RISCV_IBEX_SOC)
> +
> +typedef struct LowRISCIbexSoCState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    RISCVHartArrayState cpus;
> +    MemoryRegion flash_mem;
> +    MemoryRegion rom;
> +} LowRISCIbexSoCState;
> +
> +typedef struct OpenTitanState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    LowRISCIbexSoCState soc;
> +} OpenTitanState;
> +
> +enum {
> +    IBEX_ROM,
> +    IBEX_RAM,
> +    IBEX_FLASH,
> +    IBEX_UART,
> +    IBEX_GPIO,
> +    IBEX_SPI,
> +    IBEX_FLASH_CTRL,
> +    IBEX_RV_TIMER,
> +    IBEX_AES,
> +    IBEX_HMAC,
> +    IBEX_PLIC,
> +    IBEX_PINMUX,
> +    IBEX_ALERT_HANDLER,
> +    IBEX_USBDEV,
> +};
> +
> +#endif

Looks good otherwise,
Reviewed-by: Bin Meng <bin.meng@windriver.com>

Regards,
Bin

