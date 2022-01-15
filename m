Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148448F73E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 15:06:36 +0100 (CET)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8jhT-000680-CN
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 09:06:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jeY-00046N-Jv
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:03:36 -0500
Received: from [2001:41c9:1:41f::167] (port=48800
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8jeV-0006c9-Oe
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 09:03:33 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8je3-00063g-Vz; Sat, 15 Jan 2022 14:03:07 +0000
Message-ID: <a7c5e2f0-2f40-566b-2fa2-f1274fbb2afd@ilande.co.uk>
Date: Sat, 15 Jan 2022 14:03:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-level <qemu-devel@nongnu.org>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-23-git-send-email-yangxiaojuan@loongson.cn>
 <1984f2fa-1ccd-af3a-7fb8-6770e0b27596@ilande.co.uk>
 <51bc3c8e-370b-7c42-1003-5b7535491adb@loongson.cn>
 <6226db5a-3082-63d3-56a7-5a9b154bb056@ilande.co.uk>
 <5d087f15-d1c7-4573-5678-e4ef191aed15@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <5d087f15-d1c7-4573-5678-e4ef191aed15@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 22/27] hw/loongarch: Add some devices support for
 3A5000.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 02:26, yangxiaojuan wrote:

> Hi, Mark
> 
> On 12/23/2021 06:52 PM, Mark Cave-Ayland wrote:
>> On 22/12/2021 08:26, yangxiaojuan wrote:
>>
>>> Hi, Mark
>>>
>>> On 12/18/2021 06:02 PM, Mark Cave-Ayland wrote:
>>>> On 04/12/2021 12:07, Xiaojuan Yang wrote:
>>>>
>>>>> 1.Add uart,virtio-net,vga and usb for 3A5000.
>>>>> 2.Add irq set and map for the pci host. Non pci device
>>>>> use irq 0-16, pci device use 16-64.
>>>>> 3.Add some unimplented device to emulate guest unused
>>>>> memory space.
>>>>>
>>>>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>>>> ---
>>>>>     hw/loongarch/Kconfig            |  8 +++++
>>>>>     hw/loongarch/loongson3.c        | 63 +++++++++++++++++++++++++++++++--
>>>>>     hw/pci-host/ls7a.c              | 42 +++++++++++++++++++++-
>>>>>     include/hw/intc/loongarch_ipi.h |  2 ++
>>>>>     include/hw/pci-host/ls7a.h      |  4 +++
>>>>>     softmmu/qdev-monitor.c          |  3 +-
>>>>>     6 files changed, 117 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>>>>> index 468e3acc74..9ea3b92708 100644
>>>>> --- a/hw/loongarch/Kconfig
>>>>> +++ b/hw/loongarch/Kconfig
>>>>> @@ -1,5 +1,13 @@
>>>>>     config LOONGSON3_LS7A
>>>>>         bool
>>>>> +    imply VGA_PCI
>>>>> +    imply VIRTIO_VGA
>>>>> +    imply PARALLEL
>>>>> +    imply PCI_DEVICES
>>>>> +    select ISA_BUS
>>>>> +    select SERIAL
>>>>> +    select SERIAL_ISA
>>>>> +    select VIRTIO_PCI
>>>>>         select PCI_EXPRESS_7A
>>>>>         select LOONGARCH_IPI
>>>>>         select LOONGARCH_PCH_PIC
>>>>> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
>>>>> index c42f830208..e4a02e7c18 100644
>>>>> --- a/hw/loongarch/loongson3.c
>>>>> +++ b/hw/loongarch/loongson3.c
>>>>> @@ -10,8 +10,11 @@
>>>>>     #include "qemu/datadir.h"
>>>>>     #include "qapi/error.h"
>>>>>     #include "hw/boards.h"
>>>>> +#include "hw/char/serial.h"
>>>>>     #include "sysemu/sysemu.h"
>>>>>     #include "sysemu/qtest.h"
>>>>> +#include "hw/irq.h"
>>>>> +#include "net/net.h"
>>>>>     #include "sysemu/runstate.h"
>>>>>     #include "sysemu/reset.h"
>>>>>     #include "hw/loongarch/loongarch.h"
>>>>> @@ -20,6 +23,7 @@
>>>>>     #include "hw/intc/loongarch_pch_pic.h"
>>>>>     #include "hw/intc/loongarch_pch_msi.h"
>>>>>     #include "hw/pci-host/ls7a.h"
>>>>> +#include "hw/misc/unimp.h"
>>>>>         static void loongarch_cpu_reset(void *opaque)
>>>>> @@ -91,11 +95,12 @@ static void sysbus_mmio_map_loongarch(SysBusDevice *dev, int n,
>>>>>         memory_region_add_subregion(iocsr, addr, dev->mmio[n].memory);
>>>>>     }
>>>>>     -static void loongson3_irq_init(MachineState *machine)
>>>>> +static PCIBus *loongson3_irq_init(MachineState *machine)
>>>>>     {
>>>>>         LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>>>>> -    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev;
>>>>> +    DeviceState *ipi, *extioi, *pch_pic, *pch_msi, *cpudev, *pciehost;
>>>>>         SysBusDevice *d;
>>>>> +    PCIBus *pci_bus;
>>>>>         int cpu, pin, i;
>>>>>         unsigned long ipi_addr;
>>>>>     @@ -135,6 +140,10 @@ static void loongson3_irq_init(MachineState *machine)
>>>>>         sysbus_realize_and_unref(d, &error_fatal);
>>>>>         sysbus_mmio_map(d, 0, LS7A_IOAPIC_REG_BASE);
>>>>>     +    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
>>>>> +                   qdev_get_gpio_in(pch_pic, LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
>>>>> +                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>>>> +
>>>>>         /* Connect 64 pch_pic irqs to extioi */
>>>>>         for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
>>>>>             sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
>>>>> @@ -149,6 +158,35 @@ static void loongson3_irq_init(MachineState *machine)
>>>>>             sysbus_connect_irq(d, i,
>>>>>                                qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
>>>>>         }
>>>>> +
>>>>> +    pciehost = qdev_new(TYPE_LS7A_HOST_DEVICE);
>>>>> +    d = SYS_BUS_DEVICE(pciehost);
>>>>> +    sysbus_realize_and_unref(d, &error_fatal);
>>>>> +    pci_bus = PCI_HOST_BRIDGE(pciehost)->bus;
>>>>> +
>>>>> +    /* Connect 48 pci irq to pch_pic */
>>>>> +    for (i = 0; i < LS7A_PCI_IRQS; i++) {
>>>>> +        qdev_connect_gpio_out(pciehost, i,
>>>>> +                              qdev_get_gpio_in(pch_pic, i + LS7A_DEVICE_IRQS));
>>>>> +    }
>>>>> +
>>>>> +    return pci_bus;
>>>>> +}
>>>>> +
>>>>> +/* Network support */
>>>>> +static void network_init(PCIBus *pci_bus)
>>>>> +{
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < nb_nics; i++) {
>>>>> +        NICInfo *nd = &nd_table[i];
>>>>> +
>>>>> +        if (!nd->model) {
>>>>> +            nd->model = g_strdup("virtio");
>>>>> +        }
>>>>> +
>>>>> +        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
>>>>> +    }
>>>>>     }
>>>>>       static void loongson3_init(MachineState *machine)
>>>>> @@ -161,6 +199,7 @@ static void loongson3_init(MachineState *machine)
>>>>>         MemoryRegion *address_space_mem = get_system_memory();
>>>>>         LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>>>>>         int i;
>>>>> +    PCIBus *pci_bus = NULL;
>>>>>           if (!cpu_model) {
>>>>>             cpu_model = LOONGARCH_CPU_TYPE_NAME("Loongson-3A5000");
>>>>> @@ -207,8 +246,26 @@ static void loongson3_init(MachineState *machine)
>>>>>         memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
>>>>>         offset += highram_size;
>>>>>     +    /*
>>>>> +     * There are some invalid guest memory access.
>>>>> +     * Create some unimplemented devices to emulate this.
>>>>> +     */
>>>>> +    create_unimplemented_device("ls7a-lpc", 0x10002000, 0x14);
>>>>> +    create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
>>>>> +    create_unimplemented_device("node-bridge", 0xEFDFB000274, 0x4);
>>>>> +    create_unimplemented_device("ls7a-lionlpc", 0x1fe01400, 0x38);
>>>>> +    create_unimplemented_device("ls7a-node0", 0x0EFDFB000274, 0x4);
>>>>> +
>>>>>         /* Initialize the IO interrupt subsystem */
>>>>> -    loongson3_irq_init(machine);
>>>>> +    pci_bus = loongson3_irq_init(machine);
>>>>> +
>>>>> +    /* Network card */
>>>>> +    network_init(pci_bus);
>>>>> +
>>>>> +    /* VGA setup. Don't bother loading the bios. */
>>>>> +    pci_vga_init(pci_bus);
>>>>> +
>>>>> +    pci_create_simple(pci_bus, -1, "pci-ohci");
>>>>
>>>> By passing in -1 then you're allowing the PCI code to choose a suitable device/function which feels odd for an in-built device. Is this not fixed in real hardware?
>>>>
>>>> Same with pci_nic_init_nofail() and pci_vga_init() which are intended for machines that don't have these devices in-built.
>>>
>>> The machine has these devices but we don't want to emulate all the devices, only emulated part devices.
>>> I don't know if it is ok to do like this.
>>
>> I'm not sure I understand what you mean by part devices here - could you give an example?
> 
> 
> For example the ls7a1000 support multiple devices, such as sata, gmac, uart, rtc and so on. But we just realize the rtc.

 From what I understand from the patchset you are creating a special "virt" board so 
of course it is up to you which devices you wish to support as long as they are 
documented somewhere.

>>
>>>>>         LOONGARCH_SIMPLE_MMIO_OPS(FEATURE_REG, "loongarch_feature", 0x8);
>>>>>         LOONGARCH_SIMPLE_MMIO_OPS(VENDOR_REG, "loongarch_vendor", 0x8);
>>>>> diff --git a/hw/pci-host/ls7a.c b/hw/pci-host/ls7a.c
>>>>> index a783fb2eda..06cd641573 100644
>>>>> --- a/hw/pci-host/ls7a.c
>>>>> +++ b/hw/pci-host/ls7a.c
>>>>> @@ -28,6 +28,41 @@ static const VMStateDescription vmstate_ls7a_pcie = {
>>>>>         }
>>>>>     };
>>>>>     +static PCIINTxRoute ls7a_route_intx_pin_to_irq(void *opaque, int pin)
>>>>> +{
>>>>> +    PCIINTxRoute route;
>>>>> +
>>>>> +    route.irq = pin;
>>>>> +    route.mode = PCI_INTX_ENABLED;
>>>>> +    return route;
>>>>> +}
>>>>> +
>>>>> +static int pci_ls7a_map_irq(PCIDevice *d, int irq_num)
>>>>> +{
>>>>> +    PCIBus *bus;
>>>>> +    int offset, irq;
>>>>> +
>>>>> +    bus = pci_get_bus(d);
>>>>> +    if (bus->parent_dev) {
>>>>> +        irq = pci_swizzle_map_irq_fn(d, irq_num);
>>>>> +        return irq;
>>>>> +    }
>>>>
>>>> Isn't this part already handled by the code in hw/pci/pci.c when the IRQ is asserted, for example pci_change_irq_level()?
>>>
>>> We design a different rule for the pcie devices connect to the root bridge, assign more irqs to these devices.
>>> For the pci device connect to a pcie-to-pci bridge use the common pci_swizzle_map_irq_fn to map irq.
>>
>> I'm less familiar with PCIe but shouldn't the interrupt mapping for devices connected via a pcie-to-pci bridge be handled by the bridge in this case? Have a look at pci_bridge_map_irq() to see how this is used. I'd expect the pcie-to-pci bridge to map the PCI irq to your host controller irq first before calling pci_ls7a_map_irq(), which I think then becomes just a simple call to pci_swizzle_map_irq_fn()?
>>
> 
> For this part, I'm a bit confused. I think some pcie devices can directly connect to the host bridges while the pci devices will connected via a pcie-to-pci bridge. So the map irq is like this.
> I will learn more about PCIe to verify whether this idea is correct. Thank you!
>   
>>>>> +    /* pci device start from irq 80 */
>>>>> +    offset = PCH_PIC_IRQ_OFFSET + LS7A_DEVICE_IRQS;
>>>>> +    irq = offset + ((PCI_SLOT(d->devfn) * 4 + irq_num)) % LS7A_PCI_IRQS;
>>>>> +
>>>>> +    return irq;
>>>>> +}
>>>>> +
>>>>> +static void pci_ls7a_set_irq(void *opaque, int irq_num, int level)
>>>>> +{
>>>>> +    LS7APCIEHost *pciehost = opaque;
>>>>> +    int offset = PCH_PIC_IRQ_OFFSET + LS7A_DEVICE_IRQS;
>>>>> +
>>>>> +    qemu_set_irq(pciehost->irqs[irq_num - offset], level);
>>>>> +}
>>>>> +
>>>>>     static void pci_ls7a_config_write(void *opaque, hwaddr addr,
>>>>>                                       uint64_t val, unsigned size)
>>>>>     {
>>>>> @@ -64,10 +99,13 @@ static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
>>>>>         LS7APCIEHost *s = LS7A_HOST_DEVICE(dev);
>>>>>         PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
>>>>>     -    pci->bus = pci_register_root_bus(dev, "pcie.0", NULL, NULL, s,
>>>>> +    pci->bus = pci_register_root_bus(dev, "pcie.0", pci_ls7a_set_irq,
>>>>> +                                     pci_ls7a_map_irq, s,
>>>>>                                          get_system_memory(), get_system_io(),
>>>>>                                          PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);
>>>>>     +    pci_bus_set_route_irq_fn(pci->bus, ls7a_route_intx_pin_to_irq);
>>>>> +
>>>>>         memory_region_init_io(&s->pci_conf, OBJECT(dev),
>>>>>                               &pci_ls7a_config_ops, pci->bus,
>>>>>                               "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
>>>>> @@ -137,6 +175,8 @@ static void ls7a_pciehost_initfn(Object *obj)
>>>>>         object_initialize_child(obj, "ls7a_pci", ls7a_pci, TYPE_LS7A_PCIE);
>>>>>         qdev_prop_set_int32(DEVICE(ls7a_pci), "addr", PCI_DEVFN(0, 0));
>>>>>         qdev_prop_set_bit(DEVICE(ls7a_pci), "multifunction", false);
>>>>> +
>>>>> +    qdev_init_gpio_out(DEVICE(obj), s->irqs, LS7A_PCI_IRQS);
>>>>>     }
>>>>>       static const char *ls7a_pciehost_root_bus_path(PCIHostState *host_bridge,
>>>>> diff --git a/include/hw/intc/loongarch_ipi.h b/include/hw/intc/loongarch_ipi.h
>>>>> index d2397e53e7..1113c3b1a8 100644
>>>>> --- a/include/hw/intc/loongarch_ipi.h
>>>>> +++ b/include/hw/intc/loongarch_ipi.h
>>>>> @@ -8,6 +8,8 @@
>>>>>     #ifndef HW_LOONGARCH_IPI_H
>>>>>     #define HW_LOONGARCH_IPI_H
>>>>>     +#include "hw/sysbus.h"
>>>>> +
>>>>>     /* Mainy used by iocsr read and write */
>>>>>     #define SMP_IPI_MAILBOX      0x1000ULL
>>>>>     #define CORE_STATUS_OFF       0x0
>>>>> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
>>>>> index ac938d6d5f..3b9ad1e175 100644
>>>>> --- a/include/hw/pci-host/ls7a.h
>>>>> +++ b/include/hw/pci-host/ls7a.h
>>>>> @@ -37,6 +37,9 @@
>>>>>     #define LS7A_DEVICE_IRQS        16
>>>>>     #define LS7A_PCI_IRQS           48
>>>>>     +#define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
>>>>> +#define LS7A_UART_BASE          0x1fe001e0
>>>>> +
>>>>>     struct LS7APCIState {
>>>>>         /*< private >*/
>>>>>         PCIDevice parent_obj;
>>>>> @@ -51,6 +54,7 @@ typedef struct LS7APCIEHost {
>>>>>           LS7APCIState pci_dev;
>>>>>     +    qemu_irq irqs[LS7A_PCI_IRQS];
>>>>>         MemoryRegion pci_conf;
>>>>>         MemoryRegion pci_io;
>>>>>     } LS7APCIEHost;
>>>>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>>>>> index 01f3834db5..49491d74a1 100644
>>>>> --- a/softmmu/qdev-monitor.c
>>>>> +++ b/softmmu/qdev-monitor.c
>>>>> @@ -60,7 +60,8 @@ typedef struct QDevAlias
>>>>>                                   QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
>>>>>                                   QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
>>>>>                                   QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
>>>>> -                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
>>>>> +                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA | \
>>>>> +                              QEMU_ARCH_LOONGARCH)
>>>>
>>>> This part looks like it belongs to another patch?
>>>
>>> OK, I will put this part to a separate patch.
>>>
>>> Thanks,
>>> Xiaojuan
>>>
>>>>
>>>>>     #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
>>>>>     #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
>>
>> ATB,
>>
>> Mark.


ATB,

Mark.

