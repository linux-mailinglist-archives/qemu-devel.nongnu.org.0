Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B01479A05
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 10:47:50 +0100 (CET)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myWJh-0005U2-At
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 04:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myWIQ-0004eU-Qi
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 04:46:32 -0500
Received: from [2001:41c9:1:41f::167] (port=49298
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myWIM-0007o1-Tn
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 04:46:29 -0500
Received: from [2a00:23c4:8b9f:c400:72e2:646b:9043:c91d]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myWHs-000BX5-8s; Sat, 18 Dec 2021 09:46:00 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-22-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <d0b82366-449e-c276-de15-048345074159@ilande.co.uk>
Date: Sat, 18 Dec 2021 09:45:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638619645-11283-22-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:c400:72e2:646b:9043:c91d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 21/27] hw/loongarch: Add irq hierarchy for the
 system
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alex.bennee@linaro.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 i.qemu@xen0n.name, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/12/2021 12:07, Xiaojuan Yang wrote:

> This patch add the irq hierarchy for the virt board.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c   | 84 ++++++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/ls7a.h | 13 ++++++
>   2 files changed, 97 insertions(+)
> 
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 28b623e927..c42f830208 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -15,6 +15,10 @@
>   #include "sysemu/runstate.h"
>   #include "sysemu/reset.h"
>   #include "hw/loongarch/loongarch.h"
> +#include "hw/intc/loongarch_ipi.h"
> +#include "hw/intc/loongarch_extioi.h"
> +#include "hw/intc/loongarch_pch_pic.h"
> +#include "hw/intc/loongarch_pch_msi.h"
>   #include "hw/pci-host/ls7a.h"
>   
>   
> @@ -70,6 +74,83 @@ static const MemoryRegionOps loongarch_qemu_ops = {
>       },
>   };
>   
> +static void sysbus_mmio_map_loongarch(SysBusDevice *dev, int n,
> +                                      hwaddr addr, MemoryRegion *iocsr)
> +{
> +    assert(n >= 0 && n < dev->num_mmio);
> +
> +    if (dev->mmio[n].addr == addr) {
> +        /* ??? region already mapped here. */
> +        return;
> +    }
> +    if (dev->mmio[n].addr != (hwaddr)-1) {
> +        /* Unregister previous mapping. */
> +        memory_region_del_subregion(iocsr, dev->mmio[n].memory);
> +    }
> +    dev->mmio[n].addr = addr;
> +    memory_region_add_subregion(iocsr, addr, dev->mmio[n].memory);
> +}

Ah so this is a variant of QEMU's existing sysbus_mmio_map() but within the iocsr 
memory region instead? The sysbus API is designed to only map devices into the main 
memory address space.

> +static void loongson3_irq_init(MachineState *machine)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
> +    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev;
> +    SysBusDevice *d;
> +    int cpu, pin, i;
> +    unsigned long ipi_addr;
> +
> +    ipi = qdev_new(TYPE_LOONGARCH_IPI);
> +    d = SYS_BUS_DEVICE(ipi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    for (cpu = 0; cpu < machine->smp.cpus; cpu++) {
> +        cpudev = DEVICE(qemu_get_cpu(cpu));
> +        ipi_addr = SMP_IPI_MAILBOX + cpu * 0x100;
> +        sysbus_mmio_map_loongarch(d, cpu, ipi_addr, &lams->system_iocsr);

An alternative which doesn't need sysbus_mmio_map_loongarch() but can use memory 
regions exposed by a sysbus device:

     memory_region_add_subregion(&lams->system_iocsr, ipi_addr,
                                 sysbus_mmio_get_region(d, cpu));

> +        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
> +    }
> +
> +    extioi = qdev_new(TYPE_LOONGARCH_EXTIOI);
> +    d = SYS_BUS_DEVICE(extioi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    sysbus_mmio_map_loongarch(d, 0, APIC_BASE, &lams->system_iocsr);
> +
> +    for (i = 0; i < EXTIOI_IRQS; i++) {
> +        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
> +    }
> +
> +    /*
> +     * connect ext irq to the cpu irq
> +     * cpu_pin[9:2] <= intc_pin[7:0]
> +     */
> +    for (cpu = 0; cpu < machine->smp.cpus; cpu++) {
> +        cpudev = DEVICE(qemu_get_cpu(cpu));
> +        for (pin = 0; pin < LS3A_INTC_IP; pin++) {
> +            qdev_connect_gpio_out(extioi, (cpu * 8 + pin),
> +                                  qdev_get_gpio_in(cpudev, pin + 2));
> +        }
> +    }
> +
> +    pch_pic = qdev_new(TYPE_LOONGARCH_PCH_PIC);
> +    d = SYS_BUS_DEVICE(pch_pic);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    sysbus_mmio_map(d, 0, LS7A_IOAPIC_REG_BASE);
> +
> +    /* Connect 64 pch_pic irqs to extioi */
> +    for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
> +        sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
> +    }
> +
> +    pch_msi = qdev_new(TYPE_LOONGARCH_PCH_MSI);
> +    d = SYS_BUS_DEVICE(pch_msi);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    sysbus_mmio_map(d, 0, LS7A_PCH_MSI_ADDR_LOW);
> +    for (i = 0; i < PCH_MSI_IRQ_NUM; i++) {
> +        /* Connect 192 pch_msi irqs to extioi */
> +        sysbus_connect_irq(d, i,
> +                           qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
> +    }
> +}
> +
>   static void loongson3_init(MachineState *machine)
>   {
>       const char *cpu_model = machine->cpu_type;
> @@ -126,6 +207,9 @@ static void loongson3_init(MachineState *machine)
>       memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
>       offset += highram_size;
>   
> +    /* Initialize the IO interrupt subsystem */
> +    loongson3_irq_init(machine);
> +
>       LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
>       LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
>       LOONGARCH_SIMPLE_MMIO_OPS(CPUNAME_REG, "loongarch_cpuname", 0x8);
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index 32d6f045dc..ac938d6d5f 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -24,6 +24,19 @@
>   #define LS7A_PCI_IO_BASE         0x18000000UL
>   #define LS7A_PCI_IO_SIZE         0x00010000
>   
> +#define LS7A_PCH_REG_BASE       0x10000000UL
> +#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
> +#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
> +
> +/*
> + * According to the kernel pch irq start from 64 offset
> + * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
> + * used for pci device.
> + */
> +#define PCH_PIC_IRQ_OFFSET      64
> +#define LS7A_DEVICE_IRQS        16
> +#define LS7A_PCI_IRQS           48
> +
>   struct LS7APCIState {
>       /*< private >*/
>       PCIDevice parent_obj;

ATB,

Mark.

