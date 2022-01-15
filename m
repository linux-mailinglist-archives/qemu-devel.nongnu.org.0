Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01748F71D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 14:39:41 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jHQ-0000S7-Ii
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 08:39:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jDa-0007PF-G6
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:35:42 -0500
Received: from [2001:41c9:1:41f::167] (port=48750
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jDX-0007f0-Pr
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 08:35:42 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jD2-0005yc-VQ; Sat, 15 Jan 2022 13:35:13 +0000
Message-ID: <81217ed4-075b-5f2c-cb15-314d621cc2be@ilande.co.uk>
Date: Sat, 15 Jan 2022 13:35:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-16-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-16-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 15/30] hw/loongarch: Add support loongson3-ls7a
 machine type.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2022 09:14, Xiaojuan Yang wrote:

> Emulate a 3A5000 board use the new loongarch instruction.
> 3A5000 belongs to the Loongson3 series processors.
> The board consists of a 3A5000 cpu model and the 7A1000
> bridge. The host 3A5000 board is really complicated and
> contains many functions.Now for the tcg softmmu mode
> only part functions are emulated.
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
>   hw/loongarch/loongson3.c                      | 152 ++++++++++++++++++
>   hw/loongarch/meson.build                      |   4 +
>   hw/meson.build                                |   1 +
>   include/exec/poison.h                         |   2 +
>   include/hw/loongarch/loongarch.h              |  50 ++++++
>   include/sysemu/arch_init.h                    |   1 +
>   qapi/machine.json                             |   2 +-
>   target/Kconfig                                |   1 +
>   target/loongarch/Kconfig                      |   2 +
>   target/loongarch/cpu.c                        |   3 +
>   target/loongarch/cpu.h                        |   2 +
>   15 files changed, 229 insertions(+), 1 deletion(-)
>   create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>   create mode 100644 hw/loongarch/Kconfig
>   create mode 100644 hw/loongarch/loongson3.c
>   create mode 100644 hw/loongarch/meson.build
>   create mode 100644 include/hw/loongarch/loongarch.h
>   create mode 100644 target/loongarch/Kconfig
> 
> diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
> new file mode 100644
> index 0000000000..973ce4c30a
> --- /dev/null
> +++ b/configs/devices/loongarch64-softmmu/default.mak
> @@ -0,0 +1,3 @@
> +# Default configuration for loongarch64-softmmu
> +
> +CONFIG_LOONGSON3_LS7A=y
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
> index 0000000000..ae8498de6a
> --- /dev/null
> +++ b/hw/loongarch/Kconfig
> @@ -0,0 +1,3 @@
> +config LOONGSON3_LS7A
> +    bool
> +    select PCI_EXPRESS_7A
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> new file mode 100644
> index 0000000000..3e72c1666c
> --- /dev/null
> +++ b/hw/loongarch/loongson3.c
> @@ -0,0 +1,152 @@
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
> +static void loongarch_cpu_reset(void *opaque)
> +{
> +    LoongArchCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
> +#define LOONGARCH_SIMPLE_MMIO_OPS(ADDR, NAME, SIZE, INDEX) \
> +({\
> +     memory_region_init_io(env->iocsr_mem[INDEX], NULL, &loongarch_qemu_ops,\
> +                           (void *)ADDR, NAME, SIZE);\

The second parameter to memory_region_init_io() should be the name of the owning 
device if possible, which I believe here is the CPU (LoongArchCPU).

> +     memory_region_add_subregion(env->system_iocsr, ADDR, env->iocsr_mem[INDEX]);\
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

This looks odd...

> +    switch (addr) {
> +    case FEATURE_REG:
> +        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
> +                   1UL << IOCSRF_CSRIPI;
> +        return feature ;
> +    case VENDOR_REG:
> +        return *(uint64_t *)"Loongson";
> +    case CPUNAME_REG:
> +        return *(uint64_t *)"3A5000";
> +    case MISC_FUNC_REG:
> +        return 1UL << IOCSRM_EXTIOI_EN;
> +    }
> +    return 0;
> +}
> +
> +static const MemoryRegionOps loongarch_qemu_ops = {
> +    .read = loongarch_qemu_read,
> +    .write = loongarch_qemu_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
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
> +static void loongarch_init(MachineState *machine)
> +{
> +    const char *cpu_model = machine->cpu_type;
> +    LoongArchCPU *la_cpu;
> +    CPULoongArchState *env;
> +    ram_addr_t offset = 0;
> +    ram_addr_t ram_size = machine->ram_size;
> +    uint64_t highram_size = 0;
> +    MemoryRegion *address_space_mem = get_system_memory();
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
> +    int i;
> +
> +    if (!cpu_model) {
> +        cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
> +    }
> +
> +    if (!strstr(cpu_model, "Loongson-3A5000")) {
> +        error_report("LoongArch/TCG needs cpu type Loongson-3A5000");
> +        exit(1);
> +    }
> +
> +    /* Init CPUs */
> +    for (i = 0; i < machine->smp.cpus; i++) {
> +        la_cpu = LOONGARCH_CPU(cpu_create(machine->cpu_type));
> +
> +        qemu_register_reset(loongarch_cpu_reset, la_cpu);
> +
> +        env = &la_cpu->env;
> +        LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8, 0);
> +        LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8, 1);
> +        LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8, 2);
> +        LOONGARCH_SIMPLE_MMIO_OPS(MISC_FUNC_REG, "loongarch_misc_func", 0x8, 3);

How come these are separate memory regions? Could this not just be done with a single 
memory region or do the registers need to be sparse to return a fault for a unknown 
register.

This should enable you to remove the opaque cast to hwaddr if possible.

> +    }
> +
> +    /* Add memory region */
> +    memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
> +                             machine->ram, 0, 256 * MiB);
> +    memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
> +    offset += 256 * MiB;
> +
> +    highram_size = ram_size - 256 * MiB;
> +    memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
> +                             machine->ram, offset, highram_size);
> +    memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
> +    offset += highram_size;
> +
> +    /* Add isa io region */
> +    memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
> +                             get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
> +    memory_region_add_subregion(get_system_memory(), LOONGARCH_ISA_IO_BASE,
> +                                &lams->isa_io);

This looks like the odd one out: should it also be address_space_mem, or should the 
others use get_system_memory() directory and then drop address_space_mem entirely?

> +}
> +
> +static void loongarch_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Loongson-3A5000 LS7A1000 machine";
> +    mc->init = loongarch_init;
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
> index 0000000000..1db3529cbc
> --- /dev/null
> +++ b/hw/loongarch/meson.build
> @@ -0,0 +1,4 @@
> +loongarch_ss = ss.source_set()
> +loongarch_ss.add(when: 'CONFIG_LOONGSON3_LS7A', if_true: files('loongson3.c'))
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
> index 0000000000..fd95fbce91
> --- /dev/null
> +++ b/include/hw/loongarch/loongarch.h
> @@ -0,0 +1,50 @@
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
> +
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
> +#define MISC_FUNC_REG           0x420
> +#define IOCSRM_EXTIOI_EN        48
> +
> +#define LOONGARCH_ISA_IO_BASE   0x18000000UL
> +#define LOONGARCH_ISA_IO_SIZE   0x0004000
> +
> +typedef struct LoongArchMachineState {
> +    /*< private >*/
> +    MachineState parent_obj;
> +
> +    MemoryRegion lowmem;
> +    MemoryRegion highmem;
> +    MemoryRegion isa_io;
> +} LoongArchMachineState;
> +
> +#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
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
> index b6a37e17c4..b261017e90 100644
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
> index 8d0be47d4b..f97206ac67 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -403,6 +403,9 @@ static void loongarch_3a5000_initfn(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       env->address_space_iocsr = g_malloc(sizeof(*env->address_space_iocsr));
>       env->system_iocsr = g_malloc(sizeof(*env->system_iocsr));
> +    for (i = 0; i < IOCSR_NUM; i++) {
> +        env->iocsr_mem[i] = g_malloc(sizeof(*env->system_iocsr));
> +    }

These g_malloc() allocations look odd: since they are all constant size could they 
not be declared inline in env?

>       memory_region_init_io(env->system_iocsr, obj, NULL,
>                             env, "iocsr", UINT64_MAX);
>       address_space_init(env->address_space_iocsr, env->system_iocsr, "IOCSR");
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index e623e358ec..5d6ad4a5a4 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -152,6 +152,7 @@ extern const char * const fregnames[32];
>   #define N_IRQS      14
>   #define IRQ_TIMER   11
>   #define IRQ_IPI     12
> +#define IOCSR_NUM   4
>   
>   #define LOONGARCH_TLB_MAX      (2048 + 64) /* 2048 STLB + 64 MTLB */
>   #define LOONGARCH_STLB         2048 /* 2048 STLB */
> @@ -261,6 +262,7 @@ struct CPULoongArchState {
>   
>       AddressSpace *address_space_iocsr;
>       MemoryRegion *system_iocsr;
> +    MemoryRegion *iocsr_mem[IOCSR_NUM];

As above I'd expect these fields to be inline in CPULoongArchState since they are 
constant.

>   #endif
>   };
>   

ATB,

Mark.

