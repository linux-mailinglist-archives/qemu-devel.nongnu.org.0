Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07667469096
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 07:58:54 +0100 (CET)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu7xd-0004lA-3y
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 01:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mu7wZ-00043c-JI
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:57:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35060 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mu7wV-0007vj-TD
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 01:57:47 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax6shltK1heXcDAA--.7517S3;
 Mon, 06 Dec 2021 14:57:41 +0800 (CST)
Subject: Re: [RFC PATCH v3 15/27] hw/loongarch: Add support loongson3-ls7a
 machine type.
To: qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-16-git-send-email-yangxiaojuan@loongson.cn>
 <CABDp7Vo7ahsR305HH1JQ1NhoQ0gMjKWzij8XgRR2Q_j8HXmStQ@mail.gmail.com>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <6921284f-6f9d-31c7-4fd0-c0cc7ade12f2@loongson.cn>
Date: Mon, 6 Dec 2021 14:57:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABDp7Vo7ahsR305HH1JQ1NhoQ0gMjKWzij8XgRR2Q_j8HXmStQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Ax6shltK1heXcDAA--.7517S3
X-Coremail-Antispam: 1UD129KBjvAXoW3uw1UJF43trWUAFWfXw4kXrb_yoW8XFy5Go
 WavF1Igr4xGr1avFn8t3sIgrW7Kr1kCr4UAayxCw1DGanYya4UGFyUKw4YyrW3JFn5tr15
 Ca4agFZrZF97Jr95n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYm7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
 x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
 1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0
 I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjc
 xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVWUJVW8JwAv7VC0I7IYx2IY67AKxV
 WUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAK
 I48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bF4SrUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Huacai

On 12/06/2021 12:36 PM, chen huacai wrote:
> Hi, Xiaojuan,
> 
> On Sat, Dec 4, 2021 at 8:11 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>>
>> Emulate a 3A5000 board use the new loongarch instruction.
>> 3A5000 belongs to the Loongson3 series processors.
>> The board consists of a 3A5000 cpu model and the 7A1000
>> bridge. The host 3A5000 board is really complicated and
>> contains many functions.Now for the tcg softmmu mode
>> only part functions are emulated.
>>
>> More detailed info you can see
>> https://github.com/loongson/LoongArch-Documentation
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  .../devices/loongarch64-softmmu/default.mak   |   3 +
>>  configs/targets/loongarch64-softmmu.mak       |   3 +
>>  hw/Kconfig                                    |   1 +
>>  hw/loongarch/Kconfig                          |   3 +
>>  hw/loongarch/loongson3.c                      | 160 ++++++++++++++++++
>>  hw/loongarch/meson.build                      |   4 +
>>  hw/meson.build                                |   1 +
>>  include/exec/poison.h                         |   2 +
>>  include/hw/loongarch/loongarch.h              |  48 ++++++
>>  include/sysemu/arch_init.h                    |   1 +
>>  qapi/machine.json                             |   2 +-
>>  target/Kconfig                                |   1 +
>>  target/loongarch/Kconfig                      |   2 +
>>  target/loongarch/cpu.c                        |   8 +
>>  target/loongarch/cpu.h                        |   4 +
>>  15 files changed, 242 insertions(+), 1 deletion(-)
>>  create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>>  create mode 100644 hw/loongarch/Kconfig
>>  create mode 100644 hw/loongarch/loongson3.c
>>  create mode 100644 hw/loongarch/meson.build
>>  create mode 100644 include/hw/loongarch/loongarch.h
>>  create mode 100644 target/loongarch/Kconfig
>>
>> diff --git a/configs/devices/loongarch64-softmmu/default.mak b/configs/devices/loongarch64-softmmu/default.mak
>> new file mode 100644
>> index 0000000000..973ce4c30a
>> --- /dev/null
>> +++ b/configs/devices/loongarch64-softmmu/default.mak
>> @@ -0,0 +1,3 @@
>> +# Default configuration for loongarch64-softmmu
>> +
>> +CONFIG_LOONGSON3_LS7A=y
>> diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
>> index f33fa1590b..7bc06c850c 100644
>> --- a/configs/targets/loongarch64-softmmu.mak
>> +++ b/configs/targets/loongarch64-softmmu.mak
>> @@ -1 +1,4 @@
>> +TARGET_ARCH=loongarch64
>> +TARGET_BASE_ARCH=loongarch
>> +TARGET_SUPPORTS_MTTCG=y
>>  TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
>> diff --git a/hw/Kconfig b/hw/Kconfig
>> index ad20cce0a9..f71b2155ed 100644
>> --- a/hw/Kconfig
>> +++ b/hw/Kconfig
>> @@ -49,6 +49,7 @@ source avr/Kconfig
>>  source cris/Kconfig
>>  source hppa/Kconfig
>>  source i386/Kconfig
>> +source loongarch/Kconfig
>>  source m68k/Kconfig
>>  source microblaze/Kconfig
>>  source mips/Kconfig
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> new file mode 100644
>> index 0000000000..ae8498de6a
>> --- /dev/null
>> +++ b/hw/loongarch/Kconfig
>> @@ -0,0 +1,3 @@
>> +config LOONGSON3_LS7A
>> +    bool
>> +    select PCI_EXPRESS_7A
>> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
>> new file mode 100644
>> index 0000000000..28b623e927
>> --- /dev/null
>> +++ b/hw/loongarch/loongson3.c
>> @@ -0,0 +1,160 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * QEMU loongson 3a5000 develop board emulation
>> + *
>> + * Copyright (c) 2021 Loongson Technology Corporation Limited
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include "qemu/units.h"
>> +#include "qemu/datadir.h"
>> +#include "qapi/error.h"
>> +#include "hw/boards.h"
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/qtest.h"
>> +#include "sysemu/runstate.h"
>> +#include "sysemu/reset.h"
>> +#include "hw/loongarch/loongarch.h"
>> +#include "hw/pci-host/ls7a.h"
>> +
>> +
>> +static void loongarch_cpu_reset(void *opaque)
>> +{
>> +    LoongArchCPU *cpu = opaque;
>> +
>> +    cpu_reset(CPU(cpu));
>> +}
>> +
>> +#define LOONGARCH_SIMPLE_MMIO_OPS(ADDR, NAME, SIZE) \
>> +({\
>> +     MemoryRegion *iomem = g_new(MemoryRegion, 1);\
>> +     memory_region_init_io(iomem, NULL, &loongarch_qemu_ops,\
>> +                           (void *)ADDR, NAME, SIZE);\
>> +     memory_region_add_subregion(&lams->system_iocsr, ADDR, iomem);\
>> +})
>> +
>> +static void loongarch_qemu_write(void *opaque, hwaddr addr,
>> +                                 uint64_t val, unsigned size)
>> +{
>> +}
>> +
>> +static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    uint64_t feature = 0UL;
>> +    addr = ((hwaddr)(long)opaque) + addr;
>> +
>> +    switch (addr) {
>> +    case FEATURE_REG:
>> +        feature |= 1UL << IOCSRF_MSI | 1UL << IOCSRF_EXTIOI |
>> +                   1UL << IOCSRF_CSRIPI;
>> +        return feature ;
>> +    case VENDOR_REG:
>> +        return *(uint64_t *)"Loongson-3A5000";
>> +    case CPUNAME_REG:
>> +        return *(uint64_t *)"3A5000";
> Due to the user manual, VENDOR register only include "Loongson", and
> CPUNAME register include "3A5000".
> 

yes, I see it, I will fix it, thanks.

> Huacai
>> +    }
>> +    return 0;
>> +}
>> +
>> +static const MemoryRegionOps loongarch_qemu_ops = {
>> +    .read = loongarch_qemu_read,
>> +    .write = loongarch_qemu_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 8,
>> +    },
>> +};
>> +
>> +static void loongson3_init(MachineState *machine)
>> +{
>> +    const char *cpu_model = machine->cpu_type;
>> +    LoongArchCPU *cpu;
>> +    ram_addr_t offset = 0;
>> +    ram_addr_t ram_size = machine->ram_size;
>> +    uint64_t highram_size = 0;
>> +    MemoryRegion *address_space_mem = get_system_memory();
>> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>> +    int i;
>> +
>> +    if (!cpu_model) {
>> +        cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
>> +    }
>> +    if (!strstr(cpu_model, "Loongson-3A5000")) {
>> +        error_report("LoongArch/TCG needs cpu type Loongson-3A5000");
>> +        exit(1);
>> +    }
>> +
>> +    memory_region_init_io(&lams->system_iocsr, NULL, NULL,
>> +                          lams, "iocsr", UINT64_MAX);
>> +    address_space_init(&lams->address_space_iocsr,
>> +                       &lams->system_iocsr, "IOCSR");
>> +
>> +    /* Init CPUs */
>> +    for (i = 0; i < machine->smp.cpus; i++) {
>> +        Object *cpuobj = NULL;
>> +        CPUState *cs;
>> +
>> +        cpuobj = object_new(machine->cpu_type);
>> +
>> +        cs = CPU(cpuobj);
>> +        cs->cpu_index = i;
>> +
>> +        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
>> +        object_unref(cpuobj);
>> +
>> +        cpu = LOONGARCH_CPU(cs);
>> +        if (cpu == NULL) {
>> +            fprintf(stderr, "Unable to find CPU definition\n");
>> +            exit(1);
>> +        }
>> +        qemu_register_reset(loongarch_cpu_reset, cpu);
>> +    }
>> +
>> +    memory_region_init_alias(&lams->lowmem, NULL, "loongarch.lowram",
>> +                             machine->ram, 0, 256 * MiB);
>> +    memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
>> +    offset += 256 * MiB;
>> +
>> +    highram_size = ram_size - 256 * MiB;
>> +    memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
>> +                             machine->ram, offset, highram_size);
>> +    memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
>> +    offset += highram_size;
>> +
>> +    LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
>> +    LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
>> +    LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
>> +}
>> +
>> +static void loongarch_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    mc->desc = "Loongson-3A5000 LS7A1000 machine";
>> +    mc->init = loongson3_init;
>> +    mc->default_ram_size = 1 * GiB;
>> +    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
>> +    mc->default_ram_id = "loongarch.ram";
>> +    mc->max_cpus = LOONGARCH_MAX_VCPUS;
>> +    mc->is_default = 1;
>> +    mc->default_kernel_irqchip_split = false;
>> +    mc->block_default_type = IF_VIRTIO;
>> +    mc->default_boot_order = "c";
>> +    mc->no_cdrom = 1;
>> +}
>> +
>> +static const TypeInfo loongarch_machine_types[] = {
>> +    {
>> +        .name           = TYPE_LOONGARCH_MACHINE,
>> +        .parent         = TYPE_MACHINE,
>> +        .instance_size  = sizeof(LoongArchMachineState),
>> +        .class_init     = loongarch_class_init,
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(loongarch_machine_types)
>> diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
>> new file mode 100644
>> index 0000000000..1db3529cbc
>> --- /dev/null
>> +++ b/hw/loongarch/meson.build
>> @@ -0,0 +1,4 @@
>> +loongarch_ss = ss.source_set()
>> +loongarch_ss.add(when: 'CONFIG_LOONGSON3_LS7A', if_true: files('loongson3.c'))
>> +
>> +hw_arch += {'loongarch': loongarch_ss}
>> diff --git a/hw/meson.build b/hw/meson.build
>> index b3366c888e..95202649b7 100644
>> --- a/hw/meson.build
>> +++ b/hw/meson.build
>> @@ -49,6 +49,7 @@ subdir('avr')
>>  subdir('cris')
>>  subdir('hppa')
>>  subdir('i386')
>> +subdir('loongarch')
>>  subdir('m68k')
>>  subdir('microblaze')
>>  subdir('mips')
>> diff --git a/include/exec/poison.h b/include/exec/poison.h
>> index 7ad4ad18e8..590bc305c7 100644
>> --- a/include/exec/poison.h
>> +++ b/include/exec/poison.h
>> @@ -14,6 +14,7 @@
>>  #pragma GCC poison TARGET_CRIS
>>  #pragma GCC poison TARGET_HEXAGON
>>  #pragma GCC poison TARGET_HPPA
>> +#pragma GCC poison TARGET_LOONGARCH64
>>  #pragma GCC poison TARGET_M68K
>>  #pragma GCC poison TARGET_MICROBLAZE
>>  #pragma GCC poison TARGET_MIPS
>> @@ -73,6 +74,7 @@
>>  #pragma GCC poison CONFIG_HPPA_DIS
>>  #pragma GCC poison CONFIG_I386_DIS
>>  #pragma GCC poison CONFIG_HEXAGON_DIS
>> +#pragma GCC poison CONFIG_LOONGARCH_DIS
>>  #pragma GCC poison CONFIG_M68K_DIS
>>  #pragma GCC poison CONFIG_MICROBLAZE_DIS
>>  #pragma GCC poison CONFIG_MIPS_DIS
>> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
>> new file mode 100644
>> index 0000000000..150403c93d
>> --- /dev/null
>> +++ b/include/hw/loongarch/loongarch.h
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Definitions for loongarch board emulation.
>> + *
>> + * Copyright (C) 2021 Loongson Technology Corporation Limited
>> + */
>> +
>> +#ifndef HW_LOONGARCH_H
>> +#define HW_LOONGARCH_H
>> +
>> +#include "target/loongarch/cpu.h"
>> +#include "qemu-common.h"
>> +#include "hw/boards.h"
>> +#include "qemu/queue.h"
>> +
>> +#define LOONGARCH_MAX_VCPUS     4
>> +#define PM_MMIO_ADDR            0x10080000UL
>> +#define PM_MMIO_SIZE            0x100
>> +#define PM_CNT_MODE             0x10
>> +#define FEATURE_REG             0x8
>> +#define IOCSRF_TEMP             0
>> +#define IOCSRF_NODECNT          1
>> +#define IOCSRF_MSI              2
>> +#define IOCSRF_EXTIOI           3
>> +#define IOCSRF_CSRIPI           4
>> +#define IOCSRF_FREQCSR          5
>> +#define IOCSRF_FREQSCALE        6
>> +#define IOCSRF_DVFSV1           7
>> +#define IOCSRF_GMOD             9
>> +#define IOCSRF_VM               11
>> +
>> +#define VENDOR_REG              0x10
>> +#define CPUNAME_REG             0x20
>> +
>> +typedef struct LoongArchMachineState {
>> +    /*< private >*/
>> +    MachineState parent_obj;
>> +
>> +    AddressSpace address_space_iocsr;
>> +    MemoryRegion system_iocsr;
>> +    MemoryRegion lowmem;
>> +    MemoryRegion highmem;
>> +} LoongArchMachineState;
>> +
>> +#define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
>> +DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
>> +                         TYPE_LOONGARCH_MACHINE)
>> +#endif
>> diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
>> index 70c579560a..3ac3634bbb 100644
>> --- a/include/sysemu/arch_init.h
>> +++ b/include/sysemu/arch_init.h
>> @@ -24,6 +24,7 @@ enum {
>>      QEMU_ARCH_RX = (1 << 20),
>>      QEMU_ARCH_AVR = (1 << 21),
>>      QEMU_ARCH_HEXAGON = (1 << 22),
>> +    QEMU_ARCH_LOONGARCH = (1 << 23),
>>  };
>>
>>  extern const uint32_t arch_type;
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 067e3f5378..510ad6e566 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -30,7 +30,7 @@
>>  ##
>>  { 'enum' : 'SysEmuTarget',
>>    'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
>> -             'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>> +             'loongarch64', 'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>>               'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
>>               'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
>>               'sh4eb', 'sparc', 'sparc64', 'tricore',
>> diff --git a/target/Kconfig b/target/Kconfig
>> index ae7f24fc66..83da0bd293 100644
>> --- a/target/Kconfig
>> +++ b/target/Kconfig
>> @@ -4,6 +4,7 @@ source avr/Kconfig
>>  source cris/Kconfig
>>  source hppa/Kconfig
>>  source i386/Kconfig
>> +source loongarch/Kconfig
>>  source m68k/Kconfig
>>  source microblaze/Kconfig
>>  source mips/Kconfig
>> diff --git a/target/loongarch/Kconfig b/target/loongarch/Kconfig
>> new file mode 100644
>> index 0000000000..46b26b1a85
>> --- /dev/null
>> +++ b/target/loongarch/Kconfig
>> @@ -0,0 +1,2 @@
>> +config LOONGARCH64
>> +    bool
>> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
>> index 6d3839ea10..62c2a4d813 100644
>> --- a/target/loongarch/cpu.c
>> +++ b/target/loongarch/cpu.c
>> @@ -11,6 +11,7 @@
>>  #include "qemu/module.h"
>>  #include "sysemu/qtest.h"
>>  #include "exec/exec-all.h"
>> +#include "hw/qdev-properties.h"
>>  #include "qapi/qapi-commands-machine-target.h"
>>  #include "cpu.h"
>>  #include "internals.h"
>> @@ -521,6 +522,12 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>>      return oc;
>>  }
>>
>> +static Property loongarch_cpu_properties[] = {
>> +    DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
>> +    DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
>> +    DEFINE_PROP_END_OF_LIST()
>> +};
>> +
>>  void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>  {
>>      LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>> @@ -603,6 +610,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>>      device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
>>                                      &lacc->parent_realize);
>>      device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
>> +    device_class_set_props(dc, loongarch_cpu_properties);
>>
>>      cc->class_by_name = loongarch_cpu_class_by_name;
>>      cc->has_work = loongarch_cpu_has_work;
>> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
>> index 37cbe8924e..01bed0786c 100644
>> --- a/target/loongarch/cpu.h
>> +++ b/target/loongarch/cpu.h
>> @@ -16,6 +16,8 @@
>>
>>  #define TCG_GUEST_DEFAULT_MO (0)
>>
>> +#define UNASSIGNED_CPU_ID 0xFFFFFFFF
>> +
>>  #define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
>>  #define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
>>  #define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
>> @@ -362,6 +364,8 @@ struct LoongArchCPU {
>>      CPUNegativeOffsetState neg;
>>      CPULoongArchState env;
>>      QEMUTimer timer; /* Internal timer */
>> +    uint32_t id;
>> +    int32_t core_id;
>>  };
>>
>>  #define TYPE_LOONGARCH_CPU "loongarch-cpu"
>> --
>> 2.27.0
>>
>>
> 
> 


