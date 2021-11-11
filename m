Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71E44D85A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:33:12 +0100 (CET)
Received: from localhost ([::1]:58636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB8Z-0006BZ-8c
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:33:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAtD-0004As-TK
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:17:20 -0500
Received: from [2001:41c9:1:41f::167] (port=36096
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAtB-0006rd-1I
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:17:19 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mlAsz-0003ql-Cs; Thu, 11 Nov 2021 14:17:09 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-17-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1b27d890-8cfe-56bb-68e8-5d2618104188@ilande.co.uk>
Date: Thu, 11 Nov 2021 14:17:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-17-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v2 16/30] hw/loongarch: Add a virt LoongArch 3A5000
 board support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2021 01:35, Xiaojuan Yang wrote:

> LoongArch is a new RISC ISA, support 32bit mode
> or 64bit mode. Now we only add 64bit support.
> 
> More detailed info you can see
> https://github.com/loongson/LoongArch-Documentation
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   .../devices/loongarch64-softmmu/default.mak   |   3 +
>   configs/targets/loongarch64-softmmu.mak       |   3 +
>   hw/Kconfig                                    |   1 +
>   hw/loongarch/Kconfig                          |   3 +
>   hw/loongarch/ls3a5000_virt.c                  | 210 ++++++++++++++++++
>   hw/loongarch/meson.build                      |   4 +
>   hw/meson.build                                |   1 +
>   include/exec/poison.h                         |   2 +
>   include/hw/loongarch/loongarch.h              |  46 ++++
>   include/sysemu/arch_init.h                    |   1 +
>   qapi/machine.json                             |   2 +-
>   target/Kconfig                                |   1 +
>   target/loongarch/Kconfig                      |   2 +
>   target/loongarch/cpu.c                        |   8 +
>   target/loongarch/cpu.h                        |   4 +
>   15 files changed, 290 insertions(+), 1 deletion(-)
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/ls3a5000_virt.c
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 include/hw/loongarch/loongarch.h
>   create mode 100644 target/loongarch/Kconfig
> 
> diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
> new file mode 100644
> index 0000000000..a6705b9e4a
> --- /dev/null
> +++ b/configs/devices/loongarch64-softmmu/default.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongarch64-softmmu
> +
> +CONFIG_LOONGSON_3A5000=y
> diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
> index f33fa1590b..7bc06c850c 100644
> --- a/configs/targets/loongarch64-softmmu.mak
> +++ b/configs/targets/loongarch64-softmmu.mak
> @@ -1 +1,4 @@
> +TARGET_ARCH=loongarch64
> +TARGET_BASE_ARCH=loongarch
> +TARGET_SUPPORTS_MTTCG=y
>   TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
> diff --git a/hw/Kconfig b/hw/Kconfig
> index ad20cce0a9..f71b2155ed 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -49,6 +49,7 @@ source avr/Kconfig
>   source cris/Kconfig
>   source hppa/Kconfig
>   source i386/Kconfig
> +source loongarch/Kconfig
>   source m68k/Kconfig
>   source microblaze/Kconfig
>   source mips/Kconfig
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> new file mode 100644
> index 0000000000..720822f32c
> --- /dev/null
> +++ b/hw/loongarch/Kconfig
> @@ -0,0 +1,3 @@
> +config LOONGSON_3A5000
> +    bool
> +    select PCI_EXPRESS_7A
> diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
> new file mode 100644
> index 0000000000..7c88d64795
> --- /dev/null
> +++ b/hw/loongarch/ls3a5000_virt.c
> @@ -0,0 +1,210 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU loongson 3a5000 develop board emulation
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/units.h"
> +#include "qemu/datadir.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/qtest.h"
> +#include "sysemu/runstate.h"
> +#include "sysemu/reset.h"
> +#include "hw/loongarch/loongarch.h"
> +#include "hw/pci-host/ls7a.h"
> +
> +CPULoongArchState *cpu_states[LOONGARCH_MAX_VCPUS];

This doesn't look right - shouldn't this be in LoongArchMachineState?

> +static void main_cpu_reset(void *opaque)
> +{
> +    LoongArchCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
> +static uint64_t loongarch_pm_mem_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void loongarch_pm_mem_write(void *opaque, hwaddr addr,
> +                                   uint64_t val, unsigned size)
> +{
> +
> +    if (addr != PM_CNT_MODE) {
> +        return;
> +    }
> +
> +    switch (val) {
> +    case 0x00:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +    case 0xff:
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        return;
> +    default:
> +        return;
> +    }
> +}
> +
> +static const MemoryRegionOps loongarch_pm_ops = {
> +    .read  = loongarch_pm_mem_read,
> +    .write = loongarch_pm_mem_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

This should likely be DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN.

> +};
> +
> +#define LOONGARCH_SIMPLE_MMIO_OPS(ADDR, NAME, SIZE) \
> +({\
> +     MemoryRegion *iomem = g_new(MemoryRegion, 1);\
> +     memory_region_init_io(iomem, NULL, &loongarch_qemu_ops,\
> +                           (void *)ADDR, NAME, SIZE);\
> +     memory_region_add_subregion(lams->system_iocsr, ADDR, iomem);\
> +})
> +
> +static void loongarch_qemu_write(void *opaque, hwaddr addr,
> +                                 uint64_t val, unsigned size)
> +{
> +}
> +
> +static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    uint64_t feature = 0UL;
> +    addr = ((hwaddr)(long)opaque) + addr;
> +
> +    switch (addr) {
> +    case FEATURE_REG:
> +        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
> +                   1UL << IOCSRF_CSRIPI;
> +        return feature ;
> +    case VENDOR_REG:
> +        return *(uint64_t *)"Loongson-3A5000";
> +    case CPUNAME_REG:
> +        return *(uint64_t *)"3A5000";
> +    }
> +    return 0;
> +}
> +
> +static const MemoryRegionOps loongarch_qemu_ops = {
> +    .read = loongarch_qemu_read,
> +    .write = loongarch_qemu_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

Same comment here about DEVICE_NATIVE_ENDIAN.

> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
> +    },
> +};
> +
> +static void ls3a5000_virt_init(MachineState *machine)
> +{
> +    const char *cpu_model = machine->cpu_type;
> +    LoongArchCPU *cpu;
> +    CPULoongArchState *env;
> +    uint64_t lowram_size = 0, highram_size = 0;
> +    MemoryRegion *lowmem = g_new(MemoryRegion, 1);
> +    char *ramName = NULL;
> +    ram_addr_t ram_size = machine->ram_size;
> +    MemoryRegion *address_space_mem = get_system_memory();
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
> +    int i;
> +    MemoryRegion *iomem = NULL;
> +
> +    if (!cpu_model) {
> +        cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
> +    }
> +    if (!strstr(cpu_model, "Loongson-3A5000")) {
> +        error_report("LoongArch/TCG needs cpu type Loongson-3A5000");
> +        exit(1);
> +    }
> +
> +    lams->system_iocsr = g_new0(MemoryRegion, 1);
> +    lams->address_space_iocsr = g_new0(AddressSpace, 1);

Heap allocations are not recommended because they disassociate the MemoryRegion from 
its owner. Here it would make sense to embed them directly in LoongArchMachineState 
directly i.e.

   typedef struct LoongArchMachineState {
       /*< private >*/
       MachineState parent_obj;

       AddressSpace address_space_iocsr;
       MemoryRegion system_iocsr;
   } LoongArchMachineState;

and then update the pointer references accordingly.

> +    memory_region_init_io(lams->system_iocsr, NULL, NULL, lams, "iocsr", UINT64_MAX);
> +    address_space_init(lams->address_space_iocsr, lams->system_iocsr, "IOCSR");
> +
> +    /* Init CPUs */
> +    for (i = 0; i < machine->smp.cpus; i++) {
> +        Object *cpuobj = NULL;
> +        CPUState *cs;
> +
> +        cpuobj = object_new(machine->cpu_type);
> +
> +        cs = CPU(cpuobj);
> +        cs->cpu_index = i;

Is this needed? I think cs->cpu_index gets set automatically.

> +        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +        object_unref(cpuobj);
> +
> +        cpu = LOONGARCH_CPU(cs);
> +        if (cpu == NULL) {
> +            fprintf(stderr, "Unable to find CPU definition\n");
> +            exit(1);
> +        }
> +        env = &cpu->env;
> +        cpu_states[i] = env;

This looks wrong as per my comment above. Can you explain further what you're trying 
to do here?

> +        cpu_loongarch_clock_init(cpu);
> +        qemu_register_reset(main_cpu_reset, cpu);

The function is called main_cpu_reset however it seems to be used for all CPUs?

> +    }
> +
> +    ramName = g_strdup_printf("loongarch.lowram");

QEMU doesn't generally use camel-case for variable names.

> +    lowram_size = MIN(ram_size, 256 * 0x100000);
> +    memory_region_init_alias(lowmem, NULL, ramName, machine->ram,
> +                             0, lowram_size);
> +    memory_region_add_subregion(address_space_mem, 0, lowmem);

Missing a g_free(ramName).

> +    highram_size = ram_size > lowram_size ? ram_size - 256 * 0x100000 : 0;
> +    if (highram_size > 0) {
> +        MemoryRegion *highmem = g_new(MemoryRegion, 1);

Another heap allocation: should highmem also belong in LoongArchMachineState?

> +        ramName = g_strdup_printf("loongarch.highram");
> +        memory_region_init_alias(highmem, NULL, ramName, machine->ram,
> +                                 lowram_size, highram_size);
> +        memory_region_add_subregion(address_space_mem, 0x90000000, highmem);

Also missing a g_free(ramName) here.

> +    }
> +
> +    /* Add PM mmio memory for reboot and shutdown*/
> +    iomem = g_new(MemoryRegion, 1);

Another heap allocation: should iomem also belong in LoongArchMachineState?

> +    memory_region_init_io(iomem, NULL, &loongarch_pm_ops, NULL,
> +                          "loongarch_pm", PM_MMIO_SIZE);
> +    memory_region_add_subregion(address_space_mem,
> +                                PM_MMIO_ADDR, iomem);
> +
> +    LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
> +    LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
> +    LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
> +}
> +
> +static void loongarch_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Loongson-5000 LS7A1000 machine";
> +    mc->init = ls3a5000_virt_init;
> +    mc->default_ram_size = 1 * GiB;
> +    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
> +    mc->default_ram_id = "loongarch.ram";
> +    mc->max_cpus = LOONGARCH_MAX_VCPUS;
> +    mc->is_default = 1;
> +    mc->default_kernel_irqchip_split = false;
> +    mc->block_default_type = IF_VIRTIO;
> +    mc->default_boot_order = "c";
> +    mc->no_cdrom = 1;
> +}
> +
> +static const TypeInfo loongarch_machine_types[] = {
> +    {
> +        .name           = TYPE_LOONGARCH_MACHINE,
> +        .parent         = TYPE_MACHINE,
> +        .instance_size  = sizeof(LoongArchMachineState),
> +        .class_init     = loongarch_class_init,
> +    }
> +};
> +
> +DEFINE_TYPES(loongarch_machine_types)
> diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
> new file mode 100644
> index 0000000000..1e743cadb8
> --- /dev/null
> +++ b/hw/loongarch/meson.build
> @@ -0,0 +1,4 @@
> +loongarch_ss = ss.source_set()
> +loongarch_ss.add(when: 'CONFIG_LOONGSON_3A5000', if_true: files('ls3a5000_virt.c'))
> +
> +hw_arch += {'loongarch': loongarch_ss}
> diff --git a/hw/meson.build b/hw/meson.build
> index b3366c888e..95202649b7 100644
> --- a/hw/meson.build
> +++ b/hw/meson.build
> @@ -49,6 +49,7 @@ subdir('avr')
>   subdir('cris')
>   subdir('hppa')
>   subdir('i386')
> +subdir('loongarch')
>   subdir('m68k')
>   subdir('microblaze')
>   subdir('mips')
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 7ad4ad18e8..590bc305c7 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -14,6 +14,7 @@
>   #pragma GCC poison TARGET_CRIS
>   #pragma GCC poison TARGET_HEXAGON
>   #pragma GCC poison TARGET_HPPA
> +#pragma GCC poison TARGET_LOONGARCH64
>   #pragma GCC poison TARGET_M68K
>   #pragma GCC poison TARGET_MICROBLAZE
>   #pragma GCC poison TARGET_MIPS
> @@ -73,6 +74,7 @@
>   #pragma GCC poison CONFIG_HPPA_DIS
>   #pragma GCC poison CONFIG_I386_DIS
>   #pragma GCC poison CONFIG_HEXAGON_DIS
> +#pragma GCC poison CONFIG_LOONGARCH_DIS
>   #pragma GCC poison CONFIG_M68K_DIS
>   #pragma GCC poison CONFIG_MICROBLAZE_DIS
>   #pragma GCC poison CONFIG_MIPS_DIS
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> new file mode 100644
> index 0000000000..edab069f76
> --- /dev/null
> +++ b/include/hw/loongarch/loongarch.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Definitions for loongarch board emulation.
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LOONGARCH_H
> +#define HW_LOONGARCH_H
> +
> +#include "target/loongarch/cpu.h"
> +#include "qemu-common.h"
> +#include "hw/boards.h"
> +#include "qemu/queue.h"
> +
> +#define LOONGARCH_MAX_VCPUS     4
> +#define PM_MMIO_ADDR            0x10080000UL
> +#define PM_MMIO_SIZE            0x100
> +#define PM_CNT_MODE             0x10
> +#define FEATURE_REG             0x8
> +#define IOCSRF_TEMP             0
> +#define IOCSRF_NODECNT          1
> +#define IOCSRF_MSI              2
> +#define IOCSRF_EXTIOI           3
> +#define IOCSRF_CSRIPI           4
> +#define IOCSRF_FREQCSR          5
> +#define IOCSRF_FREQSCALE        6
> +#define IOCSRF_DVFSV1           7
> +#define IOCSRF_GMOD             9
> +#define IOCSRF_VM               11
> +
> +#define VENDOR_REG              0x10
> +#define CPUNAME_REG             0x20
> +
> +typedef struct LoongArchMachineState {
> +    /*< private >*/
> +    MachineState parent_obj;
> +
> +    AddressSpace *address_space_iocsr;
> +    MemoryRegion *system_iocsr;
> +} LoongArchMachineState;
> +
> +#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson7a")
> +DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
> +                         TYPE_LOONGARCH_MACHINE)
> +#endif
> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
> index 70c579560a..3ac3634bbb 100644
> --- a/include/sysemu/arch_init.h
> +++ b/include/sysemu/arch_init.h
> @@ -24,6 +24,7 @@ enum {
>       QEMU_ARCH_RX = (1 << 20),
>       QEMU_ARCH_AVR = (1 << 21),
>       QEMU_ARCH_HEXAGON = (1 << 22),
> +    QEMU_ARCH_LOONGARCH = (1 << 23),
>   };
>   
>   extern const uint32_t arch_type;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 17794ef681..b23456ce98 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -30,7 +30,7 @@
>   ##
>   { 'enum' : 'SysEmuTarget',
>     'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
> -             'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
> +             'loongarch64', 'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>                'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
>                'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
>                'sh4eb', 'sparc', 'sparc64', 'tricore',
> diff --git a/target/Kconfig b/target/Kconfig
> index ae7f24fc66..83da0bd293 100644
> --- a/target/Kconfig
> +++ b/target/Kconfig
> @@ -4,6 +4,7 @@ source avr/Kconfig
>   source cris/Kconfig
>   source hppa/Kconfig
>   source i386/Kconfig
> +source loongarch/Kconfig
>   source m68k/Kconfig
>   source microblaze/Kconfig
>   source mips/Kconfig
> diff --git a/target/loongarch/Kconfig b/target/loongarch/Kconfig
> new file mode 100644
> index 0000000000..46b26b1a85
> --- /dev/null
> +++ b/target/loongarch/Kconfig
> @@ -0,0 +1,2 @@
> +config LOONGARCH64
> +    bool
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index c789acaf2f..a6010deef0 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -11,6 +11,7 @@
>   #include "qemu/module.h"
>   #include "sysemu/qtest.h"
>   #include "exec/exec-all.h"
> +#include "hw/qdev-properties.h"
>   #include "qapi/qapi-commands-machine-target.h"
>   #include "migration/vmstate.h"
>   #include "cpu.h"
> @@ -534,6 +535,12 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>       return oc;
>   }
>   
> +static Property loongarch_cpu_properties[] = {
> +    DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
> +    DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>   void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>   {
>       LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> @@ -629,6 +636,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>       device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
>                                       &lacc->parent_realize);
>       device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
> +    device_class_set_props(dc, loongarch_cpu_properties);
>   
>       cc->class_by_name = loongarch_cpu_class_by_name;
>       cc->has_work = loongarch_cpu_has_work;
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 6f7c13d366..77afe9e26a 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -15,6 +15,8 @@
>   
>   #define TCG_GUEST_DEFAULT_MO (0)
>   
> +#define UNASSIGNED_CPU_ID 0xFFFFFFFF
> +
>   #define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
>   #define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
>   #define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
> @@ -371,6 +373,8 @@ struct LoongArchCPU {
>   
>       CPUNegativeOffsetState neg;
>       CPULoongArchState env;
> +    uint32_t id;
> +    int32_t core_id;
>   };
>   
>   #define TYPE_LOONGARCH_CPU "loongarch-cpu"


ATB,

Mark.

