Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2666A47979A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 00:41:23 +0100 (CET)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myMqn-0006j0-9Y
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 18:41:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myMpF-0005mx-Dq
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:39:45 -0500
Received: from [2001:41c9:1:41f::167] (port=48906
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myMpD-00034e-2L
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 18:39:45 -0500
Received: from [2a00:23c4:8b9f:c400:72e2:646b:9043:c91d]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1myMob-0006zX-Tu; Fri, 17 Dec 2021 23:39:09 +0000
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
 <1638619645-11283-15-git-send-email-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0be32ddf-1b5b-18ed-4118-63e6bfc12a42@ilande.co.uk>
Date: Fri, 17 Dec 2021 23:39:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638619645-11283-15-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:c400:72e2:646b:9043:c91d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v3 14/27] hw/pci-host: Add ls7a1000 PCIe Host bridge
 support for Loongson3 Platform
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

> This is a model of the PCIe Host Bridge found on a Loongson-5000
> processor. It includes a interrupt controller, some interface for
> pci and nonpci devices. Mainly emulate part of it that is not
> exactly the same as the host and only use part devices for
> tcg mode. It support for MSI and MSIX interrupt sources.
> 
> For more detailed info about ls7a1000 you can see the doc at
> https://github.com/loongson/LoongArch-Documentation/releases/latest/
> download/Loongson-7A1000-usermanual-2.00-EN.pdf
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/pci-host/Kconfig        |   4 +
>   hw/pci-host/ls7a.c         | 174 +++++++++++++++++++++++++++++++++++++
>   hw/pci-host/meson.build    |   1 +
>   include/hw/pci-host/ls7a.h |  51 +++++++++++
>   4 files changed, 230 insertions(+)
>   create mode 100644 hw/pci-host/ls7a.c
>   create mode 100644 include/hw/pci-host/ls7a.h
> 
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 2b5f7d58cc..b02a9d1454 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -77,3 +77,7 @@ config MV64361
>       bool
>       select PCI
>       select I8259
> +
> +config PCI_EXPRESS_7A
> +    bool
> +    select PCI_EXPRESS
> diff --git a/hw/pci-host/ls7a.c b/hw/pci-host/ls7a.c
> new file mode 100644
> index 0000000000..a783fb2eda
> --- /dev/null
> +++ b/hw/pci-host/ls7a.c
> @@ -0,0 +1,174 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU Loongson 7A1000 North Bridge Emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "hw/irq.h"
> +#include "hw/pci/pci_bridge.h"
> +#include "hw/pci/pci_bus.h"
> +#include "sysemu/reset.h"
> +#include "hw/pci-host/ls7a.h"
> +#include "migration/vmstate.h"
> +
> +static const VMStateDescription vmstate_ls7a_pcie = {
> +    .name = "LS7A_PCIE",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PCI_DEVICE(parent_obj, LS7APCIState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void pci_ls7a_config_write(void *opaque, hwaddr addr,
> +                                  uint64_t val, unsigned size)
> +{
> +    pci_data_write(opaque, addr, val, size);
> +}
> +
> +static uint64_t pci_ls7a_config_read(void *opaque,
> +                                     hwaddr addr, unsigned size)
> +{
> +    uint64_t val;
> +
> +    val = pci_data_read(opaque, addr, size);
> +
> +    return val;
> +}
> +
> +static const MemoryRegionOps pci_ls7a_config_ops = {
> +    .read = pci_ls7a_config_read,
> +    .write = pci_ls7a_config_write,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 4,
> +    },
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void ls7a_pciehost_realize(DeviceState *dev, Error **errp)
> +{
> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> +    LS7APCIEHost *s = LS7A_HOST_DEVICE(dev);
> +    PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);

SysbusDevice *sbd = SYS_BUS_DEVICE(dev) will be needed for later use.

> +    pci->bus = pci_register_root_bus(dev, "pcie.0", NULL, NULL, s,
> +                                     get_system_memory(), get_system_io(),
> +                                     PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);

A device shouldn't map itself into an address space: that is the job of the board. To 
achieve this LS7APCIEHost should have separate mmio and io memory regions defined and 
pci_register_root_bus() configured to use these i.e.

     pci->bus = pci_register_root_bus(dev, "pcie.0", NULL, NULL, s,
                                      &s->pci_mmio, &s->pci_io,
                                      PCI_DEVFN(1, 0), 128, TYPE_PCIE_BUS);

> +    memory_region_init_io(&s->pci_conf, OBJECT(dev),
> +                          &pci_ls7a_config_ops, pci->bus,
> +                          "ls7a_pci_conf", HT1LO_PCICFG_SIZE);
> +    memory_region_add_subregion(get_system_memory(), HT1LO_PCICFG_BASE,
> +                                &s->pci_conf);

Here add sysbus_init_mmio(sbd, &s->pci_conf) and remove memory_region_add_subregion().

> +    /* Add ls7a pci-io */
> +    memory_region_init_alias(&s->pci_io, OBJECT(dev), "ls7a-pci-io",
> +                             get_system_io(), 0, LS7A_PCI_IO_SIZE);
> +    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
> +                                &s->pci_io);

Remove the alias onto the system io memory region and instead use 
sysbus_init_mmio(sbd, &s->pci_io).

You will also need to make the PCI mmio memory region availble to the board using 
sysbus_init_mmio(sbd, &s->pci_mmio).

> +    pcie_host_mmcfg_update(pex, true, LS_PCIECFG_BASE, LS_PCIECFG_SIZE);

It looks like the pcie_host_mmcfg_*() functions are hardcoded to map the device in 
system memory which is not recommended for new devices. The best example I can find 
is in hw/pci-host/xilinx-pcie.c whereby pcie_host_mmcfg_init() is used in 
xilinx_pcie_host_realize() to setup the MMCFG memory region and then 
sysbus_init_mmio(sbd, &pex->mmio) is used to make it available to the board.

Once all these sysbus memory regions have been defined they can be accessed in the 
board code using sysbus_mmio_get_region().

> +    qdev_realize(DEVICE(&s->pci_dev), BUS(pci->bus), &error_fatal);
> +}
> +
> +static void ls7a_pcie_realize(PCIDevice *d, Error **errp)
> +{
> +    /* pci status */
> +    d->config[0x6] = 0x01;
> +    /* base class code */
> +    d->config[0xb] = 0x06;
> +    /* header type */
> +    d->config[0xe] = 0x80;
> +    /* capabilities pointer */
> +    d->config[0x34] = 0x40;
> +    /* link status and control register 0 */
> +    d->config[0x44] = 0x20;
> +}

Should these definitely exist in realize() or should they belong in a reset() function?

> +static void ls7a_pcie_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->desc = "LS7A1000 PCIE Host bridge";
> +    dc->vmsd = &vmstate_ls7a_pcie;
> +    k->realize = ls7a_pcie_realize;
> +    k->vendor_id = 0x0014;
> +    k->device_id = 0x7a00;

Generally device and vendor ids are added as constants to include/hw/pci/pci_ids.h.

> +    k->revision = 0x0;
> +    k->class_id = PCI_CLASS_BRIDGE_HOST;
> +    /*
> +     * PCI-facing part of the host bridge, not usable without the
> +     * host-facing part, which can't be device_add'ed, yet.
> +     */
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo ls7a_pcie_device_info = {
> +    .name          = TYPE_LS7A_PCIE,

Why TYPE_LS7A_PCIE? The normal convention would be to call the type 
TYPE_LS7A_PCI_DEVICE to show that it is derived from a conventional PCI device.

> +    .parent        = TYPE_PCI_DEVICE,
> +    .instance_size = sizeof(LS7APCIState),
> +    .class_init    = ls7a_pcie_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> +        { },
> +    },
> +};
> +
> +static void ls7a_pciehost_initfn(Object *obj)
> +{
> +    LS7APCIEHost *s = LS7A_HOST_DEVICE(obj);
> +    LS7APCIState *ls7a_pci = &s->pci_dev;
> +
> +    object_initialize_child(obj, "ls7a_pci", ls7a_pci, TYPE_LS7A_PCIE);
> +    qdev_prop_set_int32(DEVICE(ls7a_pci), "addr", PCI_DEVFN(0, 0));
> +    qdev_prop_set_bit(DEVICE(ls7a_pci), "multifunction", false);
> +}
> +
> +static const char *ls7a_pciehost_root_bus_path(PCIHostState *host_bridge,
> +                                          PCIBus *rootbus)
> +{
> +    return "0000:00";
> +}
> +
> +static void ls7a_pciehost_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
> +
> +    hc->root_bus_path = ls7a_pciehost_root_bus_path;
> +    dc->realize = ls7a_pciehost_realize;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    dc->fw_name = "pci";
> +    dc->user_creatable = false;
> +}
> +
> +static const TypeInfo ls7a_pciehost_info = {
> +    .name          = TYPE_LS7A_HOST_DEVICE,

TYPE_LS7A_PCIE_HOST_BRIDGE would be the normal convention.

> +    .parent        = TYPE_PCIE_HOST_BRIDGE,
> +    .instance_size = sizeof(LS7APCIEHost),
> +    .instance_init = ls7a_pciehost_initfn,
> +    .class_init    = ls7a_pciehost_class_init,
> +};
> +
> +static void ls7a_register_types(void)
> +{
> +    type_register_static(&ls7a_pciehost_info);
> +    type_register_static(&ls7a_pcie_device_info);
> +}
> +
> +type_init(ls7a_register_types)
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index 4c4f39c15c..c4955455fd 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -11,6 +11,7 @@ pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
>   pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
>   pci_ss.add(when: 'CONFIG_REMOTE_PCIHOST', if_true: files('remote.c'))
>   pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
> +pci_ss.add(when: 'CONFIG_PCI_EXPRESS_7A', if_true: files('ls7a.c'))
>   
>   # PPC devices
>   pci_ss.add(when: 'CONFIG_RAVEN_PCI', if_true: files('raven.c'))
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> new file mode 100644
> index 0000000000..32d6f045dc
> --- /dev/null
> +++ b/include/hw/pci-host/ls7a.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LS7A_H
> +#define HW_LS7A_H
> +
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/pci-host/pam.h"
> +#include "qemu/units.h"
> +#include "qemu/range.h"
> +#include "qom/object.h"
> +
> +#define HT1LO_PCICFG_BASE        0x1a000000
> +#define HT1LO_PCICFG_SIZE        0x02000000
> +
> +#define LS_PCIECFG_BASE          0x20000000
> +#define LS_PCIECFG_SIZE          0x08000000
> +
> +#define LS7A_PCI_IO_BASE         0x18000000UL
> +#define LS7A_PCI_IO_SIZE         0x00010000
> +
> +struct LS7APCIState {
> +    /*< private >*/
> +    PCIDevice parent_obj;
> +    /*< public >*/
> +};
> +
> +typedef struct LS7APCIState LS7APCIState;
> +typedef struct LS7APCIEHost {
> +    /*< private >*/
> +    PCIExpressHost parent_obj;
> +    /*< public >*/
> +
> +    LS7APCIState pci_dev;
> +
> +    MemoryRegion pci_conf;
> +    MemoryRegion pci_io;
> +} LS7APCIEHost;
> +
> +#define TYPE_LS7A_HOST_DEVICE "ls7a1000-pciehost"
> +OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIEHost, LS7A_HOST_DEVICE)
> +
> +#define TYPE_LS7A_PCIE "ls7a1000_pcie"
> +OBJECT_DECLARE_SIMPLE_TYPE(LS7APCIState, LS7A_PCIE)
> +
> +#endif /* HW_LS7A_H */


ATB,

Mark.

