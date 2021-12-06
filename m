Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C3468FDD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 05:39:08 +0100 (CET)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu5mM-00054q-ST
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 23:39:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mu5kO-0004LP-0P
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 23:37:04 -0500
Received: from [2a00:1450:4864:20::32b] (port=40659
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1mu5kL-00005P-Lh
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 23:37:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so9453592wmj.5
 for <qemu-devel@nongnu.org>; Sun, 05 Dec 2021 20:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nt00hfupH6GJeMMBjpIzoScJ+EpHTMkyn+MdWC5NAvc=;
 b=gtGyGE1++G/d+ZjgjhyUvFDwM9qdVQlBiz+7eEBElNgntgAYKM53ds/Z4FieO9M+gP
 XWtb6SLuA9ErWZQMkCuAJ67Q8XzD47RIpn3Q7CMWErv8jCUv1ybE/Qbyaogvy1Ix7khY
 Gez/9MTX+jZ8Ql6M2lgJ4YxuwluKefwpQFiF7RFTQEqwjA+0sNEgOkirdU/+0fJGwwZC
 N67IB0DsFD2lCCcbRkled7rOichWsWIgl+j+fmvY8lMGw12d1QfDgsT8b9mfTylaWSgQ
 Tcd6dV6ufCxE8nse0s/rh1R5sUYYeX5dvPPDN2CgGtMKaWu3YNhBtXu1TTQA3I6EPehp
 VA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nt00hfupH6GJeMMBjpIzoScJ+EpHTMkyn+MdWC5NAvc=;
 b=xKFjQGIEpYmwcCVRWDsCdq3yLJnFZyhQEFEzDpk1LOgdHrRetHG9d0/pivCpUBoFEL
 BkkAMlK5PS+GCM8Gp1O0JlYc0F5uKHCwlPCo2cnBJB/6v5SCnpEvtFaBT1bR478Q/o/z
 RNtWxqE9q2AGrepR4mqlijUFL8J4fLwOq3uEzXN+AxjXyVfuL+U16QjYeGu0Krdh/44B
 Z2cijUzdgNh99s/kj4GIjdTI6hJtpNIT0Jt/Eat8ouyjMWKVc9EHsK1kpcCvXvMaQUU2
 0pJjdgDGVIQ5CYbNcocmjmZBqMDzixdcRsrHKYz5BHG7aQKcbF5jyKhoKugnUJsODgDA
 unwg==
X-Gm-Message-State: AOAM533aJ/k+GP4DQnH9sMpCvTeOTOhxeq8hojejIlZ7EsLQ53CFJPgq
 QWrVmpagQLjeGgMr/T9EMZH1CcTf2EFBQtoYu3c=
X-Google-Smtp-Source: ABdhPJzMbM3RUfeyF769Jfv5/ln+3oFMw+NoHW2D5NmEOT2OMDCVk9ELXSVxzdnZg2kH13m6GNYEiUHw0OZaUHVg0FQ=
X-Received: by 2002:a7b:cf02:: with SMTP id l2mr36267967wmg.78.1638765419696; 
 Sun, 05 Dec 2021 20:36:59 -0800 (PST)
MIME-Version: 1.0
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-16-git-send-email-yangxiaojuan@loongson.cn>
In-Reply-To: <1638619645-11283-16-git-send-email-yangxiaojuan@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Mon, 6 Dec 2021 12:36:48 +0800
Message-ID: <CABDp7Vo7ahsR305HH1JQ1NhoQ0gMjKWzij8XgRR2Q_j8HXmStQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 15/27] hw/loongarch: Add support loongson3-ls7a
 machine type.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=zltjiangshi@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 mark.cave-ayland@ilande.co.uk, qemu-level <qemu-devel@nongnu.org>,
 peterx@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 alistair.francis@wdc.com, maobibo@loongson.cn, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, i.qemu@xen0n.name,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xiaojuan,

On Sat, Dec 4, 2021 at 8:11 PM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
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
>  .../devices/loongarch64-softmmu/default.mak   |   3 +
>  configs/targets/loongarch64-softmmu.mak       |   3 +
>  hw/Kconfig                                    |   1 +
>  hw/loongarch/Kconfig                          |   3 +
>  hw/loongarch/loongson3.c                      | 160 ++++++++++++++++++
>  hw/loongarch/meson.build                      |   4 +
>  hw/meson.build                                |   1 +
>  include/exec/poison.h                         |   2 +
>  include/hw/loongarch/loongarch.h              |  48 ++++++
>  include/sysemu/arch_init.h                    |   1 +
>  qapi/machine.json                             |   2 +-
>  target/Kconfig                                |   1 +
>  target/loongarch/Kconfig                      |   2 +
>  target/loongarch/cpu.c                        |   8 +
>  target/loongarch/cpu.h                        |   4 +
>  15 files changed, 242 insertions(+), 1 deletion(-)
>  create mode 100644 configs/devices/loongarch64-softmmu/default.mak
>  create mode 100644 hw/loongarch/Kconfig
>  create mode 100644 hw/loongarch/loongson3.c
>  create mode 100644 hw/loongarch/meson.build
>  create mode 100644 include/hw/loongarch/loongarch.h
>  create mode 100644 target/loongarch/Kconfig
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
>  TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
> diff --git a/hw/Kconfig b/hw/Kconfig
> index ad20cce0a9..f71b2155ed 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -49,6 +49,7 @@ source avr/Kconfig
>  source cris/Kconfig
>  source hppa/Kconfig
>  source i386/Kconfig
> +source loongarch/Kconfig
>  source m68k/Kconfig
>  source microblaze/Kconfig
>  source mips/Kconfig
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
> index 0000000000..28b623e927
> --- /dev/null
> +++ b/hw/loongarch/loongson3.c
> @@ -0,0 +1,160 @@
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
> +
> +static void loongarch_cpu_reset(void *opaque)
> +{
> +    LoongArchCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +}
> +
> +#define LOONGARCH_SIMPLE_MMIO_OPS(ADDR, NAME, SIZE) \
> +({\
> +     MemoryRegion *iomem = g_new(MemoryRegion, 1);\
> +     memory_region_init_io(iomem, NULL, &loongarch_qemu_ops,\
> +                           (void *)ADDR, NAME, SIZE);\
> +     memory_region_add_subregion(&lams->system_iocsr, ADDR, iomem);\
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
Due to the user manual, VENDOR register only include "Loongson", and
CPUNAME register include "3A5000".

Huacai
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
> +static void loongson3_init(MachineState *machine)
> +{
> +    const char *cpu_model = machine->cpu_type;
> +    LoongArchCPU *cpu;
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
> +    if (!strstr(cpu_model, "Loongson-3A5000")) {
> +        error_report("LoongArch/TCG needs cpu type Loongson-3A5000");
> +        exit(1);
> +    }
> +
> +    memory_region_init_io(&lams->system_iocsr, NULL, NULL,
> +                          lams, "iocsr", UINT64_MAX);
> +    address_space_init(&lams->address_space_iocsr,
> +                       &lams->system_iocsr, "IOCSR");
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
> +
> +        qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
> +        object_unref(cpuobj);
> +
> +        cpu = LOONGARCH_CPU(cs);
> +        if (cpu == NULL) {
> +            fprintf(stderr, "Unable to find CPU definition\n");
> +            exit(1);
> +        }
> +        qemu_register_reset(loongarch_cpu_reset, cpu);
> +    }
> +
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
> +    LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
> +    LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
> +    LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
> +}
> +
> +static void loongarch_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Loongson-3A5000 LS7A1000 machine";
> +    mc->init = loongson3_init;
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
>  subdir('cris')
>  subdir('hppa')
>  subdir('i386')
> +subdir('loongarch')
>  subdir('m68k')
>  subdir('microblaze')
>  subdir('mips')
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index 7ad4ad18e8..590bc305c7 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -14,6 +14,7 @@
>  #pragma GCC poison TARGET_CRIS
>  #pragma GCC poison TARGET_HEXAGON
>  #pragma GCC poison TARGET_HPPA
> +#pragma GCC poison TARGET_LOONGARCH64
>  #pragma GCC poison TARGET_M68K
>  #pragma GCC poison TARGET_MICROBLAZE
>  #pragma GCC poison TARGET_MIPS
> @@ -73,6 +74,7 @@
>  #pragma GCC poison CONFIG_HPPA_DIS
>  #pragma GCC poison CONFIG_I386_DIS
>  #pragma GCC poison CONFIG_HEXAGON_DIS
> +#pragma GCC poison CONFIG_LOONGARCH_DIS
>  #pragma GCC poison CONFIG_M68K_DIS
>  #pragma GCC poison CONFIG_MICROBLAZE_DIS
>  #pragma GCC poison CONFIG_MIPS_DIS
> diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
> new file mode 100644
> index 0000000000..150403c93d
> --- /dev/null
> +++ b/include/hw/loongarch/loongarch.h
> @@ -0,0 +1,48 @@
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
> +    AddressSpace address_space_iocsr;
> +    MemoryRegion system_iocsr;
> +    MemoryRegion lowmem;
> +    MemoryRegion highmem;
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
>      QEMU_ARCH_RX = (1 << 20),
>      QEMU_ARCH_AVR = (1 << 21),
>      QEMU_ARCH_HEXAGON = (1 << 22),
> +    QEMU_ARCH_LOONGARCH = (1 << 23),
>  };
>
>  extern const uint32_t arch_type;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..510ad6e566 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -30,7 +30,7 @@
>  ##
>  { 'enum' : 'SysEmuTarget',
>    'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
> -             'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
> +             'loongarch64', 'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
>               'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
>               'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
>               'sh4eb', 'sparc', 'sparc64', 'tricore',
> diff --git a/target/Kconfig b/target/Kconfig
> index ae7f24fc66..83da0bd293 100644
> --- a/target/Kconfig
> +++ b/target/Kconfig
> @@ -4,6 +4,7 @@ source avr/Kconfig
>  source cris/Kconfig
>  source hppa/Kconfig
>  source i386/Kconfig
> +source loongarch/Kconfig
>  source m68k/Kconfig
>  source microblaze/Kconfig
>  source mips/Kconfig
> diff --git a/target/loongarch/Kconfig b/target/loongarch/Kconfig
> new file mode 100644
> index 0000000000..46b26b1a85
> --- /dev/null
> +++ b/target/loongarch/Kconfig
> @@ -0,0 +1,2 @@
> +config LOONGARCH64
> +    bool
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 6d3839ea10..62c2a4d813 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -11,6 +11,7 @@
>  #include "qemu/module.h"
>  #include "sysemu/qtest.h"
>  #include "exec/exec-all.h"
> +#include "hw/qdev-properties.h"
>  #include "qapi/qapi-commands-machine-target.h"
>  #include "cpu.h"
>  #include "internals.h"
> @@ -521,6 +522,12 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
>      return oc;
>  }
>
> +static Property loongarch_cpu_properties[] = {
> +    DEFINE_PROP_INT32("core-id", LoongArchCPU, core_id, -1),
> +    DEFINE_PROP_UINT32("id", LoongArchCPU, id, UNASSIGNED_CPU_ID),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
>      LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> @@ -603,6 +610,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_parent_realize(dc, loongarch_cpu_realizefn,
>                                      &lacc->parent_realize);
>      device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
> +    device_class_set_props(dc, loongarch_cpu_properties);
>
>      cc->class_by_name = loongarch_cpu_class_by_name;
>      cc->has_work = loongarch_cpu_has_work;
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 37cbe8924e..01bed0786c 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -16,6 +16,8 @@
>
>  #define TCG_GUEST_DEFAULT_MO (0)
>
> +#define UNASSIGNED_CPU_ID 0xFFFFFFFF
> +
>  #define FCSR0_M1    0x1f         /* FCSR1 mask, Enables */
>  #define FCSR0_M2    0x1f1f0000   /* FCSR2 mask, Cause and Flags */
>  #define FCSR0_M3    0x300        /* FCSR3 mask, Round Mode */
> @@ -362,6 +364,8 @@ struct LoongArchCPU {
>      CPUNegativeOffsetState neg;
>      CPULoongArchState env;
>      QEMUTimer timer; /* Internal timer */
> +    uint32_t id;
> +    int32_t core_id;
>  };
>
>  #define TYPE_LOONGARCH_CPU "loongarch-cpu"
> --
> 2.27.0
>
>


-- 
Huacai Chen

