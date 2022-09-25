Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F755E91C6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:13:39 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNhi-00014Z-9p
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNdZ-00066Z-E1; Sun, 25 Sep 2022 05:09:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNdW-0003EH-SO; Sun, 25 Sep 2022 05:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Dw9TQ6mXqAS+F0ZHegR5z0pycmGWr7g/fZDsdKQ6uk=; b=b3HSEith36Vo2oP9BiOrfHbRzE
 6gFv94l9e7airK2hx0oajSvjLd58OGYGQ8E+q3oet+PeENahrU2swZBtlivAUt+8HT/F/K5Tb5Dcm
 Uteaubd9aFweh1BqkPKVpTEiZJRkZbDsPlkGjMW65HLLWolTjOzBRsY/pSFApDu8Av4hkk+izUnS2
 z5+a4c5M6oIvLf6mm/C1Gt1NGVg47v15scRuqjdn2J/qJZJXHuA26FraXuFBwK+oOaHNRNs5fBbCU
 5cWNaU4qCGlH8KQYU3T1j18dqmHfj/ka6ksNdDie8im638NSVzY+2CNl6OCCgt8tx4f/dWKktcMWK
 MRhsFuoxMXg8no5cw3pX4clNV6ODBLt+rSm7GsUUFLm7Te3EHolmBL5js16uJmybtNoa7WDY8Y+AX
 B2SxpD3q6wBscDQfBHgLJG0DXkY+ThOYSuw/tThdgmT0fGjEBkyPd+T8c6MkK/0xGWlOPlZBvTypT
 q4ZomGrXC0kyd1VwcGt1H5HXkgEsubJlldXj3i3J8DFycv1iykar4mwYOQE+3pHzUowaJjYZ/OTHG
 zQ8t8qjsgkAGUkk1SFQEkpF2VhLZ31tEqao6MYT/v4rdc32xSe1EY9nwd8y/62w3mZPgswP+atbSE
 6+ujTIG1y8o2YCGKd8zgaP/ENvVQq6lkhLekD8D6Q=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ocNbl-0006sO-NY; Sun, 25 Sep 2022 10:07:33 +0100
Message-ID: <5389d351-e7c5-5d1f-dee9-a30227c6c1a0@ilande.co.uk>
Date: Sun, 25 Sep 2022 10:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1663368422.git.balaton@eik.bme.hu>
 <ab40167d23ee0777f99e8dadcf8e6050665092f9.1663368422.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ab40167d23ee0777f99e8dadcf8e6050665092f9.1663368422.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 05/10] mac_{old|new}world: Reduce number of QOM casts
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/09/2022 00:07, BALATON Zoltan wrote:

> By storing the device pointers in a variable with the right type the
> number of QOM casts can be reduced which also makes the code more
> readable.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 60 ++++++++++++++++++++-----------------------
>   hw/ppc/mac_oldworld.c | 26 ++++++++-----------
>   2 files changed, 39 insertions(+), 47 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 1038477793..ae90e5c353 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -116,18 +116,16 @@ static void ppc_core99_init(MachineState *machine)
>       MemoryRegion *bios = g_new(MemoryRegion, 1);
>       hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>       long kernel_size = 0, initrd_size = 0;
> -    UNINHostState *uninorth_pci;
>       PCIBus *pci_bus;
> -    PCIDevice *macio;
> -    ESCCState *escc;
>       bool has_pmu, has_adb;
> +    Object *macio;
>       MACIOIDEState *macio_ide;
>       BusState *adb_bus;
>       MacIONVRAMState *nvr;
>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>       void *fw_cfg;
>       SysBusDevice *s;
> -    DeviceState *dev, *pic_dev;
> +    DeviceState *dev, *pic_dev, *uninorth_pci;

Can you rename uninorth_pci to uninorth_pci_dev? The idea of the _dev suffix is to 
allow you to easily spot which variables are DEVICE casts.

>       DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
>       hwaddr nvram_addr = 0xFFF04000;
>       uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
> @@ -229,6 +227,7 @@ static void ppc_core99_init(MachineState *machine)
>       }
>   
>       openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
> +    dev = DEVICE(cpu);
>       for (i = 0; i < machine->smp.cpus; i++) {
>           /* Mac99 IRQ connection between OpenPIC outputs pins
>            * and PowerPC input pins
> @@ -236,30 +235,30 @@ static void ppc_core99_init(MachineState *machine)
>           switch (PPC_INPUT(env)) {
>           case PPC_FLAGS_INPUT_6xx:
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
> +                qdev_get_gpio_in(dev, PPC6xx_INPUT_INT);
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
> -                 qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
> +                 qdev_get_gpio_in(dev, PPC6xx_INPUT_INT);
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_MCP);
> +                qdev_get_gpio_in(dev, PPC6xx_INPUT_MCP);
>               /* Not connected ? */
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
>               /* Check this */
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
> +                qdev_get_gpio_in(dev, PPC6xx_INPUT_HRESET);
>               break;
>   #if defined(TARGET_PPC64)
>           case PPC_FLAGS_INPUT_970:
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
> +                qdev_get_gpio_in(dev, PPC970_INPUT_INT);
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
> +                qdev_get_gpio_in(dev, PPC970_INPUT_INT);
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_MCP);
> +                qdev_get_gpio_in(dev, PPC970_INPUT_MCP);
>               /* Not connected ? */
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
>               /* Check this */
>               openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
> -                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_HRESET);
> +                qdev_get_gpio_in(dev, PPC970_INPUT_HRESET);
>               break;
>   #endif /* defined(TARGET_PPC64) */
>           default:
> @@ -275,9 +274,9 @@ static void ppc_core99_init(MachineState *machine)
>           machine_arch = ARCH_MAC99_U3;
>           /* 970 gets a U3 bus */
>           /* Uninorth AGP bus */
> -        s = SYS_BUS_DEVICE(sysbus_create_simple(TYPE_U3_AGP_HOST_BRIDGE,
> -                                                0xf0800000, NULL));
> -        uninorth_pci = U3_AGP_HOST_BRIDGE(s);
> +        uninorth_pci = sysbus_create_simple(TYPE_U3_AGP_HOST_BRIDGE,
> +                                            0xf0800000, NULL);
> +        s = SYS_BUS_DEVICE(uninorth_pci);
>           sysbus_mmio_map(s, 1, 0xf0c00000);
>           /* PCI hole */
>           memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> @@ -300,10 +299,9 @@ static void ppc_core99_init(MachineState *machine)
>           sysbus_mmio_map(SYS_BUS_DEVICE(uninorth_internal_dev), 1, 0xf4c00000);
>   
>           /* Uninorth main bus */
> -        dev = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
> -        qdev_prop_set_uint32(dev, "ofw-addr", 0xf2000000);
> -        uninorth_pci = UNI_NORTH_PCI_HOST_BRIDGE(dev);
> -        s = SYS_BUS_DEVICE(dev);
> +        uninorth_pci = qdev_new(TYPE_UNI_NORTH_PCI_HOST_BRIDGE);
> +        qdev_prop_set_uint32(uninorth_pci, "ofw-addr", 0xf2000000);
> +        s = SYS_BUS_DEVICE(uninorth_pci);
>           sysbus_realize_and_unref(s, &error_fatal);
>           sysbus_mmio_map(s, 0, 0xf2800000);
>           sysbus_mmio_map(s, 1, 0xf2c00000);
> @@ -324,21 +322,21 @@ static void ppc_core99_init(MachineState *machine)
>       pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
>   
>       /* MacIO */
> -    macio = pci_new(-1, TYPE_NEWWORLD_MACIO);
> +    macio = OBJECT(pci_new(-1, TYPE_NEWWORLD_MACIO));
>       dev = DEVICE(macio);
>       qdev_prop_set_uint64(dev, "frequency", tbfreq);
>       qdev_prop_set_bit(dev, "has-pmu", has_pmu);
>       qdev_prop_set_bit(dev, "has-adb", has_adb);
>   
> -    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
> -    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
> -    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
> +    dev = DEVICE(object_resolve_path_component(macio, "escc"));
> +    qdev_prop_set_chr(dev, "chrA", serial_hd(0));
> +    qdev_prop_set_chr(dev, "chrB", serial_hd(1));
>   
> -    pci_realize_and_unref(macio, pci_bus, &error_fatal);
> +    pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
>   
> -    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
> +    pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
>       for (i = 0; i < 4; i++) {
> -        qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
> +        qdev_connect_gpio_out(uninorth_pci, i,
>                                 qdev_get_gpio_in(pic_dev, 0x1b + i));
>       }
>   
> @@ -370,19 +368,17 @@ static void ppc_core99_init(MachineState *machine)
>       /* We only emulate 2 out of 3 IDE controllers for now */
>       ide_drive_get(hd, ARRAY_SIZE(hd));
>   
> -    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
> -                                                        "ide[0]"));
> +    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[0]"));
>       macio_ide_init_drives(macio_ide, hd);
>   
> -    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
> -                                                        "ide[1]"));
> +    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[1]"));
>       macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
>   
>       if (has_adb) {
>           if (has_pmu) {
> -            dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pmu"));
> +            dev = DEVICE(object_resolve_path_component(macio, "pmu"));
>           } else {
> -            dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
> +            dev = DEVICE(object_resolve_path_component(macio, "cuda"));
>           }
>   
>           adb_bus = qdev_get_child_bus(dev, "adb.0");
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index cb67e44081..a497507f1d 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -90,9 +90,8 @@ static void ppc_heathrow_init(MachineState *machine)
>       uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
>       int32_t kernel_size = 0, initrd_size = 0;
>       PCIBus *pci_bus;
> -    PCIDevice *macio;
> +    Object *macio;
>       MACIOIDEState *macio_ide;
> -    ESCCState *escc;
>       SysBusDevice *s;
>       DeviceState *dev, *pic_dev, *grackle_dev;
>       BusState *adb_bus;
> @@ -231,17 +230,16 @@ static void ppc_heathrow_init(MachineState *machine)
>       pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
>   
>       /* MacIO */
> -    macio = pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO);
> -    dev = DEVICE(macio);
> -    qdev_prop_set_uint64(dev, "frequency", tbfreq);
> +    macio = OBJECT(pci_new(PCI_DEVFN(16, 0), TYPE_OLDWORLD_MACIO));
> +    qdev_prop_set_uint64(DEVICE(macio), "frequency", tbfreq);
>   
> -    escc = ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
> -    qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
> -    qdev_prop_set_chr(DEVICE(escc), "chrB", serial_hd(1));
> +    dev = DEVICE(object_resolve_path_component(macio, "escc"));
> +    qdev_prop_set_chr(dev, "chrA", serial_hd(0));
> +    qdev_prop_set_chr(dev, "chrB", serial_hd(1));
>   
> -    pci_realize_and_unref(macio, pci_bus, &error_fatal);
> +    pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
>   
> -    pic_dev = DEVICE(object_resolve_path_component(OBJECT(macio), "pic"));
> +    pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
>       for (i = 0; i < 4; i++) {
>           qdev_connect_gpio_out(grackle_dev, i,
>                                 qdev_get_gpio_in(pic_dev, 0x15 + i));
> @@ -269,16 +267,14 @@ static void ppc_heathrow_init(MachineState *machine)
>   
>       /* MacIO IDE */
>       ide_drive_get(hd, ARRAY_SIZE(hd));
> -    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
> -                                                        "ide[0]"));
> +    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[0]"));
>       macio_ide_init_drives(macio_ide, hd);
>   
> -    macio_ide = MACIO_IDE(object_resolve_path_component(OBJECT(macio),
> -                                                        "ide[1]"));
> +    macio_ide = MACIO_IDE(object_resolve_path_component(macio, "ide[1]"));
>       macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
>   
>       /* MacIO CUDA/ADB */
> -    dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
> +    dev = DEVICE(object_resolve_path_component(macio, "cuda"));
>       adb_bus = qdev_get_child_bus(dev, "adb.0");
>       dev = qdev_new(TYPE_ADB_KEYBOARD);
>       qdev_realize_and_unref(dev, adb_bus, &error_fatal);

with that:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

