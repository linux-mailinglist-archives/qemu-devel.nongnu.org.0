Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB029071F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 16:26:43 +0200 (CEST)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTQgr-0007ZT-Lj
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 10:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTQfB-00071R-U9
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 10:24:57 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTQf8-0008As-US
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 10:24:56 -0400
Received: by mail-wr1-x442.google.com with SMTP id n15so3175464wrq.2
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0n8yPa3KqRzYN7ytfWLLEZmdTGzAwpQjL7U1cSTSAtg=;
 b=gXrpe0r4/jwv043ZZSvcuqrT/9rpZ+9V6ZAL53BdxGjUKejGI4kKy8BQLKJRu0jHgs
 VcAskwgiWLdiU0Pck3ks8w4YspKC08bz146z+utwyDC4gFrh8BUrUqddDAWtbElV/p42
 rSLVCyUj/HpbqVjIBb7j/lSqQoGaoFSF+QjjPvQtfoD5X7nbLwMw0Eo0qu4VbvSz579n
 yl/IxSm0jMJfRxI1w7GJQ8eMDnM4R5es5fGsXW4toaE1M6xJf3OOoDP/95hQGvmw77zN
 noQAaxphL0uijLULwz3fm3wP58i3gdth+7EhnXcBTNJ4Fucf3qyv9yG/SzwGBJ1UDz35
 mVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0n8yPa3KqRzYN7ytfWLLEZmdTGzAwpQjL7U1cSTSAtg=;
 b=dwoZ3LB1NqyA91IC9JjXXrxLmzOsTJsdg0MphWU3eUNdqati7ABP827xJNQxBU5bEx
 ArPgyUBSG3mzRmspib9vryezttHkWxFz+fGxKUGL6sCXjVeeRXTRlY20jvoGfFJgUF5b
 nevB/rUKwkqUQEtD4LLsj73GhjcEGbFmwY1oQvxw9ysf9goKrnWTd1jVkt9inifASTU0
 Ag/c9y5iBove10rbh2R9nqFGk5fVwgtZmMmrzSUyRj17mF/MXu0LZVRNhk43f15XbP9h
 TVH3fo3i5Mu7tWj+fz0bSZBVuAsLTF2IE47QrEjVETSYxVbAETrGUBylQb1TSPyvG1fi
 g9AQ==
X-Gm-Message-State: AOAM533YL0k+iFwulmIxrJ10tBew4JR0OnQrdjRbUKPk3KQzZaiEuAFF
 KcLGfMoSn7vbdZ9TVgiAbHQ=
X-Google-Smtp-Source: ABdhPJz/F/AM1VVtaOnkXHGWvJC7TZMa1DZCiy7WcLOwYy4/ISDSUX+Y+bIKWTpJL4ptRpJetp8EKw==
X-Received: by 2002:a05:6000:1112:: with SMTP id
 z18mr4179118wrw.3.1602858293394; 
 Fri, 16 Oct 2020 07:24:53 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id t12sm3808633wrm.25.2020.10.16.07.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 07:24:52 -0700 (PDT)
Subject: Re: [PATCH V14 6/8] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
References: <1602831120-3377-1-git-send-email-chenhc@lemote.com>
 <1602831120-3377-7-git-send-email-chenhc@lemote.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <20c5dfdb-f856-8fbe-bdef-27f9df3f5885@amsat.org>
Date: Fri, 16 Oct 2020 16:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1602831120-3377-7-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.253,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Huacai,

On 10/16/20 8:51 AM, Huacai Chen wrote:
> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

 From the kernel documentation [*] on the "Co-developed-by" tag:

   A Co-Developed-by: states that the patch was also created
   by another developer along with the original author. This
   is useful at times when multiple people work on a single
   patch. Note, this person also needs to have a Signed-off-by:
   line in the patch as well.

Can Jiaxun Yang add his Signed-off-by tag?

[*] 
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> ---
>   hw/mips/loongson3_bootp.c | 162 +++++++++++++++++++++++++++
>   hw/mips/loongson3_bootp.h | 225 ++++++++++++++++++++++++++++++++++++++
>   hw/mips/meson.build       |   1 +
>   3 files changed, 388 insertions(+)
>   create mode 100644 hw/mips/loongson3_bootp.c
>   create mode 100644 hw/mips/loongson3_bootp.h

Consider using scripts/git.orderfile to avoid reviewer
scrolling down/up/down/up.

> 
> diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
> new file mode 100644
> index 0000000000..eab6f51a01
> --- /dev/null
> +++ b/hw/mips/loongson3_bootp.c
> @@ -0,0 +1,162 @@
> +/*
> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) helpers
> + *
> + * Copyright (c) 2017-2020 Huacai Chen (chenhc@lemote.com)
> + * Copyright (c) 2017-2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <https://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/cutils.h"
> +#include "cpu.h"
> +#include "hw/boards.h"
> +#include "hw/mips/loongson3_bootp.h"
> +
> +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
> +{
> +    struct efi_cpuinfo_loongson *c = g_cpuinfo;
> +
> +    stl_le_p(&c->cputype, Loongson_3A);
> +    stl_le_p(&c->processor_id, MIPS_CPU(first_cpu)->env.CP0_PRid);
> +    if (cpu_freq > UINT_MAX) {
> +        stl_le_p(&c->cpu_clock_freq, UINT_MAX);
> +    } else {
> +        stl_le_p(&c->cpu_clock_freq, cpu_freq);
> +    }
> +
> +    stw_le_p(&c->cpu_startup_core_id, 0);
> +    stl_le_p(&c->nr_cpus, current_machine->smp.cpus);
> +    stl_le_p(&c->total_node, (current_machine->smp.cpus + 3) / 4);

Please replace this magic values by a definition, such:

#define LOONGSON3_CORE_PER_NODE 4

Then you can use:

    stl_le_p(&c->total_node, DIV_ROUND_UP(current_machine->smp.cpus,
                                          LOONGSON3_CORE_PER_NODE));

> +
> +    return c;
> +}
> +
> +static struct efi_memory_map_loongson *init_memory_map(void *g_map, uint64_t ram_size)
> +{
> +    struct efi_memory_map_loongson *emap = g_map;
> +
> +    stl_le_p(&emap->nr_map, 2);
> +    stl_le_p(&emap->mem_freq, 300000000);
> +
> +    stl_le_p(&emap->map[0].node_id, 0);
> +    stl_le_p(&emap->map[0].mem_type, 1);
> +    stq_le_p(&emap->map[0].mem_start, 0x0);
> +    stl_le_p(&emap->map[0].mem_size, 240);
> +
> +    stl_le_p(&emap->map[1].node_id, 0);
> +    stl_le_p(&emap->map[1].mem_type, 2);
> +    stq_le_p(&emap->map[1].mem_start, 0x90000000);
> +    stl_le_p(&emap->map[1].mem_size, (ram_size / MiB) - 256);
> +
> +    return emap;
> +}
> +
> +static struct system_loongson *init_system_loongson(void *g_system)
> +{
> +    struct system_loongson *s = g_system;
> +
> +    stl_le_p(&s->ccnuma_smp, 0);
> +    stl_le_p(&s->sing_double_channel, 1);
> +    stl_le_p(&s->nr_uarts, 1);
> +    stl_le_p(&s->uarts[0].iotype, 2);
> +    stl_le_p(&s->uarts[0].int_offset, 2);
> +    stl_le_p(&s->uarts[0].uartclk, 25000000); /* Random value */
> +    stq_le_p(&s->uarts[0].uart_base, virt_memmap[VIRT_UART].base);
> +
> +    return s;
> +}
> +
> +static struct irq_source_routing_table *init_irq_source(void *g_irq_source)
> +{
> +    struct irq_source_routing_table *irq_info = g_irq_source;
> +
> +    stl_le_p(&irq_info->node_id, 0);
> +    stl_le_p(&irq_info->PIC_type, 0);
> +    stw_le_p(&irq_info->dma_mask_bits, 64);
> +    stq_le_p(&irq_info->pci_mem_start_addr, virt_memmap[VIRT_PCIE_MMIO].base);
> +    stq_le_p(&irq_info->pci_mem_end_addr, virt_memmap[VIRT_PCIE_MMIO].base +
> +                                          virt_memmap[VIRT_PCIE_MMIO].size - 1);
> +    stq_le_p(&irq_info->pci_io_start_addr, virt_memmap[VIRT_PCIE_PIO].base);
> +
> +    return irq_info;
> +}
> +
> +static struct interface_info *init_interface_info(void *g_interface)
> +{
> +    struct interface_info *interface = g_interface;
> +
> +    stw_le_p(&interface->vers, 0x01);
> +    strpadcpy(interface->description, 64, "UEFI_Version_v1.0", '\0');
> +
> +    return interface;
> +}
> +
> +static struct board_devices *board_devices_info(void *g_board)
> +{
> +    struct board_devices *bd = g_board;
> +
> +    strpadcpy(bd->name, 64, "Loongson-3A-VIRT-1w-V1.00-demo", '\0');
> +
> +    return bd;
> +}
> +
> +static struct loongson_special_attribute *init_special_info(void *g_special)
> +{
> +    struct loongson_special_attribute *special = g_special;
> +
> +    strpadcpy(special->special_name, 64, "2017-10-12", '\0');
> +
> +    return special;
> +}
> +
> +void init_loongson_params(struct loongson_params *lp, void *p,
> +                          uint64_t cpu_freq, uint64_t ram_size)
> +{
> +    stq_le_p(&lp->cpu_offset,
> +              (uintptr_t)init_cpu_info(p, cpu_freq) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct efi_cpuinfo_loongson), 64);
> +
> +    stq_le_p(&lp->memory_offset,
> +              (uintptr_t)init_memory_map(p, ram_size) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct efi_memory_map_loongson), 64);
> +
> +    stq_le_p(&lp->system_offset,
> +              (uintptr_t)init_system_loongson(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct system_loongson), 64);
> +
> +    stq_le_p(&lp->irq_offset,
> +              (uintptr_t)init_irq_source(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct irq_source_routing_table), 64);
> +
> +    stq_le_p(&lp->interface_offset,
> +              (uintptr_t)init_interface_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct interface_info), 64);
> +
> +    stq_le_p(&lp->boarddev_table_offset,
> +              (uintptr_t)board_devices_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct board_devices), 64);
> +
> +    stq_le_p(&lp->special_offset,
> +              (uintptr_t)init_special_info(p) - (uintptr_t)lp);
> +    p += ROUND_UP(sizeof(struct loongson_special_attribute), 64);
> +}
> +
> +void init_reset_system(struct efi_reset_system_t *reset)
> +{
> +    stq_le_p(&reset->Shutdown, 0xffffffffbfc000a8);
> +    stq_le_p(&reset->ResetCold, 0xffffffffbfc00080);
> +    stq_le_p(&reset->ResetWarm, 0xffffffffbfc00080);
> +}
> diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
> new file mode 100644
> index 0000000000..1edd736b6a
> --- /dev/null
> +++ b/hw/mips/loongson3_bootp.h
> @@ -0,0 +1,225 @@
> +/*
> + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) data structrues
> + * defined at arch/mips/include/asm/mach-loongson64/boot_param.h in Linux kernel

Missing license boilerplate.

> + */
> +
> +#ifndef HW_MIPS_LOONGSON3_BOOTP_H
> +#define HW_MIPS_LOONGSON3_BOOTP_H
> +
> +struct efi_memory_map_loongson {
> +    uint16_t vers;               /* version of efi_memory_map */
> +    uint32_t nr_map;             /* number of memory_maps */
> +    uint32_t mem_freq;           /* memory frequence */
> +    struct mem_map {
> +        uint32_t node_id;        /* node_id which memory attached to */
> +        uint32_t mem_type;       /* system memory, pci memory, pci io, etc. */
> +        uint64_t mem_start;      /* memory map start address */
> +        uint32_t mem_size;       /* each memory_map size, not the total size */
> +    } map[128];
> +} QEMU_PACKED;
> +
> +enum loongson_cpu_type {
> +    Legacy_2E = 0x0,
> +    Legacy_2F = 0x1,
> +    Legacy_3A = 0x2,
> +    Legacy_3B = 0x3,
> +    Legacy_1A = 0x4,
> +    Legacy_1B = 0x5,
> +    Legacy_2G = 0x6,
> +    Legacy_2H = 0x7,
> +    Loongson_1A = 0x100,
> +    Loongson_1B = 0x101,
> +    Loongson_2E = 0x200,
> +    Loongson_2F = 0x201,
> +    Loongson_2G = 0x202,
> +    Loongson_2H = 0x203,
> +    Loongson_3A = 0x300,
> +    Loongson_3B = 0x301
> +};
> +
> +/*
> + * Capability and feature descriptor structure for MIPS CPU
> + */
> +struct efi_cpuinfo_loongson {
> +    uint16_t vers;               /* version of efi_cpuinfo_loongson */
> +    uint32_t processor_id;       /* PRID, e.g. 6305, 6306 */
> +    uint32_t cputype;            /* Loongson_3A/3B, etc. */
> +    uint32_t total_node;         /* num of total numa nodes */
> +    uint16_t cpu_startup_core_id;   /* Boot core id */
> +    uint16_t reserved_cores_mask;
> +    uint32_t cpu_clock_freq;     /* cpu_clock */
> +    uint32_t nr_cpus;
> +    char cpuname[64];
> +} QEMU_PACKED;
> +
> +#define MAX_UARTS 64
> +struct uart_device {
> +    uint32_t iotype;
> +    uint32_t uartclk;
> +    uint32_t int_offset;
> +    uint64_t uart_base;
> +} QEMU_PACKED;
> +
> +#define MAX_SENSORS 64
> +#define SENSOR_TEMPER  0x00000001
> +#define SENSOR_VOLTAGE 0x00000002
> +#define SENSOR_FAN     0x00000004
> +struct sensor_device {
> +    char name[32];  /* a formal name */
> +    char label[64]; /* a flexible description */
> +    uint32_t type;       /* SENSOR_* */
> +    uint32_t id;         /* instance id of a sensor-class */
> +    uint32_t fan_policy; /* step speed or constant speed */
> +    uint32_t fan_percent;/* only for constant speed policy */
> +    uint64_t base_addr;  /* base address of device registers */
> +} QEMU_PACKED;
> +
> +struct system_loongson {
> +    uint16_t vers;               /* version of system_loongson */
> +    uint32_t ccnuma_smp;         /* 0: no numa; 1: has numa */
> +    uint32_t sing_double_channel;/* 1: single; 2: double */
> +    uint32_t nr_uarts;
> +    struct uart_device uarts[MAX_UARTS];
> +    uint32_t nr_sensors;
> +    struct sensor_device sensors[MAX_SENSORS];
> +    char has_ec;
> +    char ec_name[32];
> +    uint64_t ec_base_addr;
> +    char has_tcm;
> +    char tcm_name[32];
> +    uint64_t tcm_base_addr;
> +    uint64_t workarounds;
> +    uint64_t of_dtb_addr; /* NULL if not support */
> +} QEMU_PACKED;
> +
> +struct irq_source_routing_table {
> +    uint16_t vers;
> +    uint16_t size;
> +    uint16_t rtr_bus;
> +    uint16_t rtr_devfn;
> +    uint32_t vendor;
> +    uint32_t device;
> +    uint32_t PIC_type;           /* conform use HT or PCI to route to CPU-PIC */
> +    uint64_t ht_int_bit;         /* 3A: 1<<24; 3B: 1<<16 */
> +    uint64_t ht_enable;          /* irqs used in this PIC */
> +    uint32_t node_id;            /* node id: 0x0-0; 0x1-1; 0x10-2; 0x11-3 */
> +    uint64_t pci_mem_start_addr;
> +    uint64_t pci_mem_end_addr;
> +    uint64_t pci_io_start_addr;
> +    uint64_t pci_io_end_addr;
> +    uint64_t pci_config_addr;
> +    uint16_t dma_mask_bits;
> +    uint16_t dma_noncoherent;
> +} QEMU_PACKED;
> +
> +struct interface_info {
> +    uint16_t vers;               /* version of the specificition */
> +    uint16_t size;
> +    uint8_t  flag;
> +    char description[64];
> +} QEMU_PACKED;
> +
> +#define MAX_RESOURCE_NUMBER 128
> +struct resource_loongson {
> +    uint64_t start;              /* resource start address */
> +    uint64_t end;                /* resource end address */
> +    char name[64];
> +    uint32_t flags;
> +};
> +
> +struct archdev_data {};          /* arch specific additions */
> +
> +struct board_devices {
> +    char name[64];               /* hold the device name */
> +    uint32_t num_resources;      /* number of device_resource */
> +    /* for each device's resource */
> +    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
> +    /* arch specific additions */
> +    struct archdev_data archdata;

Maybe drop archdev_data and use:

        char arch_specific_data[];

> +};
> +
> +struct loongson_special_attribute {
> +    uint16_t vers;               /* version of this special */
> +    char special_name[64];       /* special_atribute_name */
> +    uint32_t loongson_special_type; /* type of special device */
> +    /* for each device's resource */
> +    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
> +};
> +
> +struct loongson_params {
> +    uint64_t memory_offset;      /* efi_memory_map_loongson struct offset */
> +    uint64_t cpu_offset;         /* efi_cpuinfo_loongson struct offset */
> +    uint64_t system_offset;      /* system_loongson struct offset */
> +    uint64_t irq_offset;         /* irq_source_routing_table struct offset */
> +    uint64_t interface_offset;   /* interface_info struct offset */
> +    uint64_t special_offset;     /* loongson_special_attribute struct offset */
> +    uint64_t boarddev_table_offset;  /* board_devices offset */
> +};
> +
> +struct smbios_tables {
> +    uint16_t vers;               /* version of smbios */
> +    uint64_t vga_bios;           /* vga_bios address */
> +    struct loongson_params lp;
> +};
> +
> +struct efi_reset_system_t {
> +    uint64_t ResetCold;
> +    uint64_t ResetWarm;
> +    uint64_t ResetType;
> +    uint64_t Shutdown;
> +    uint64_t DoSuspend; /* NULL if not support */
> +};
> +
> +struct efi_loongson {
> +    uint64_t mps;                /* MPS table */
> +    uint64_t acpi;               /* ACPI table (IA64 ext 0.71) */
> +    uint64_t acpi20;             /* ACPI table (ACPI 2.0) */
> +    struct smbios_tables smbios; /* SM BIOS table */
> +    uint64_t sal_systab;         /* SAL system table */
> +    uint64_t boot_info;          /* boot info table */
> +};
> +
> +struct boot_params {
> +    struct efi_loongson efi;
> +    struct efi_reset_system_t reset_system;
> +};
> +
> +/* Overall MMIO & Memory layout */
> +enum {
> +    VIRT_LOWMEM,
> +    VIRT_PM,
> +    VIRT_FW_CFG,
> +    VIRT_RTC,
> +    VIRT_PCIE_PIO,
> +    VIRT_PCIE_ECAM,
> +    VIRT_BIOS_ROM,
> +    VIRT_UART,
> +    VIRT_LIOINTC,
> +    VIRT_PCIE_MMIO,
> +    VIRT_HIGHMEM
> +};
> +
> +/* Low MEM layout for QEMU kernel loader */
> +enum {
> +    LOADER_KERNEL,
> +    LOADER_INITRD,
> +    LOADER_CMDLINE
> +};
> +
> +/* BIOS ROM layout for QEMU kernel loader */
> +enum {
> +    LOADER_BOOTROM,
> +    LOADER_PARAM,
> +};
> +
> +struct MemmapEntry {
> +    hwaddr base;
> +    hwaddr size;
> +};
> +
> +extern const struct MemmapEntry virt_memmap[];
> +void init_loongson_params(struct loongson_params *lp, void *p,
> +                          uint64_t cpu_freq, uint64_t ram_size);
> +void init_reset_system(struct efi_reset_system_t *reset);
> +
> +#endif
> diff --git a/hw/mips/meson.build b/hw/mips/meson.build
> index c98391ce99..802e5e4a1d 100644
> --- a/hw/mips/meson.build
> +++ b/hw/mips/meson.build
> @@ -1,6 +1,7 @@
>   mips_ss = ss.source_set()
>   mips_ss.add(files('addr.c', 'mips_int.c', 'fw_cfg.c'))
>   mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
> +mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c'))
>   mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
>   mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
>   mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
> 

With comment addressed: Reviewed-by: Philippe Mathieu-Daudé 
<f4bug@amsat.org>

