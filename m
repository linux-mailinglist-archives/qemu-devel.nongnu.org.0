Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5853E46C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:37:37 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBzD-0005r6-VI
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBok-0005ds-NC; Mon, 06 Jun 2022 08:26:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBoi-0001NB-Ak; Mon, 06 Jun 2022 08:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRz/zdhLexDKSS7FXeHPf9nnEju/nRUjgbArPm0NY/I=; b=yjO3vlZoIvFPtP2/OgfHp9XFAk
 sHM+yVpt/FSzmsKN0IkK1m0zhdOugnTP3l/jyl55q8rGEo6w5y9PIo2VyrxD+YrtoytX/kqIP3y4N
 Oc2E14oHoG1FeypnpzPrMtrcyBCDwmwVCqUuetyQ9Qoa+OPzTl47jQlgRbEhKYoAf+0WkzH0wMAYT
 +Y2gDmBKqMMKj7R1drQznt3kpVg79N3dcPTq737mqymFWgPGC/ZnUiivTKWzToXcXvIK8v4lkUbLU
 rqwLvGlvP0nt6GAtrRjZAl32C/DHbqlTl0NBtGXnTqqIGSSnsmhvjeYXnpxt0mnP+ZXNr5f/J//Xa
 ED+XMTMZbbLxYU3R/o3AsthY+/xjXzD3mrQoE6G9Wz2CQJp9pAEeiT3clEtBJJgz6u0hTb6mF1aAd
 0j31w5aOOGl5OectYzCCfDwuxwtNKQjQ+hk4dwMI3E3SyLcI32x40Egri/4mfzX2AsRsX9tFyeo7E
 E3OVTwJ3830vIBBOP43XPoLEr0jgIdUJP6LYZe5ny9qJyYiH8iIkbn6KBd16T949IuRnNYPZ8Dm/s
 y2YkYRJyh3Jc3KLOZfPXfeI0jXxf15ClhhucZUHsaHoJzfevFZIGdV8SSV2fUuoTchsIKsX3jIOzP
 9hIelb1L2Vkty2VhszKuCSHIRx/LpC8KQDQxQR4FQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyBnb-0003vJ-57; Mon, 06 Jun 2022 13:25:35 +0100
Message-ID: <2ce48ef0-7bc9-cf46-d036-614b2f7bfd1a@ilande.co.uk>
Date: Mon, 6 Jun 2022 13:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-5-danielhb413@gmail.com>
 <d71266a9-6723-3247-e38f-abf77332c522@ilande.co.uk>
 <d4585367-26f1-6714-14f9-d8db215d0775@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <d4585367-26f1-6714-14f9-d8db215d0775@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 04/16] ppc/pnv: change PnvPHB3 to be a PnvPHB backend
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/06/2022 21:30, Daniel Henrique Barboza wrote:

> On 6/2/22 04:56, Mark Cave-Ayland wrote:
>> On 31/05/2022 22:49, Daniel Henrique Barboza wrote:
>>
>>> We need a handful of changes that needs to be done in a single swoop to
>>> turn PnvPHB3 into a PnvPHB backend.
>>>
>>> In the PnvPHB3, since the PnvPHB device implements PCIExpressHost and
>>> will hold the PCI bus, change PnvPHB3 parent to TYPE_DEVICE. There are a
>>> couple of instances in pnv_phb3.c that needs to access the PCI bus, so a
>>> phb_base pointer is added to allow access to the parent PnvPHB. The
>>> PnvPHB3 root port will now be connected to a PnvPHB object.
>>>
>>> In pnv.c, the powernv8 machine chip8 will now hold an array of PnvPHB
>>> objects.  pnv_get_phb3_child() needs to be adapted to return the PnvPHB3
>>> backend from the PnvPHB child. A global property is added in
>>> pnv_machine_power8_class_init() to ensure that all PnvPHBs are created
>>> with phb->version = 3.
>>>
>>> After all these changes we're still able to boot a powernv8 machine with
>>> default settings. The real gain will come with user created PnvPHB
>>> devices, coming up next.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/pci-host/pnv_phb3.c         | 29 ++++++++---------------------
>>>   hw/ppc/pnv.c                   | 21 +++++++++++++++++----
>>>   include/hw/pci-host/pnv_phb3.h |  5 ++++-
>>>   include/hw/ppc/pnv.h           |  3 ++-
>>>   4 files changed, 31 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>>> index 60584e2aae..a39aa0e8c4 100644
>>> --- a/hw/pci-host/pnv_phb3.c
>>> +++ b/hw/pci-host/pnv_phb3.c
>>> @@ -11,6 +11,7 @@
>>>   #include "qapi/visitor.h"
>>>   #include "qapi/error.h"
>>>   #include "hw/pci-host/pnv_phb3_regs.h"
>>> +#include "hw/pci-host/pnv_phb.h"
>>>   #include "hw/pci-host/pnv_phb3.h"
>>>   #include "hw/pci/pcie_host.h"
>>>   #include "hw/pci/pcie_port.h"
>>> @@ -26,7 +27,7 @@
>>>   static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
>>>   {
>>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>>       uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
>>>       uint8_t bus, devfn;
>>> @@ -590,7 +591,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t 
>>> val, unsigned size)
>>>   uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
>>>   {
>>>       PnvPHB3 *phb = opaque;
>>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>>       uint64_t val;
>>>       if ((off & 0xfffc) == PHB_CONFIG_DATA) {
>>> @@ -1057,8 +1058,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>>                             "phb3-regs", 0x1000);
>>>       pnv_phb3_bus_init(dev, phb);
>>> -
>>> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
>>>   }
>>>   void pnv_phb3_update_regions(PnvPHB3 *phb)
>>> @@ -1083,38 +1082,26 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
>>>       pnv_phb3_check_all_m64s(phb);
>>>   }
>>> -static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
>>> -                                          PCIBus *rootbus)
>>> -{
>>> -    PnvPHB3 *phb = PNV_PHB3(host_bridge);
>>> -
>>> -    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
>>> -             phb->chip_id, phb->phb_id);
>>> -    return phb->bus_path;
>>> -}
>>> -
>>>   static Property pnv_phb3_properties[] = {
>>>           DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
>>>           DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
>>>           DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
>>> +        DEFINE_PROP_LINK("phb-base", PnvPHB3, phb_base, TYPE_PNV_PHB, PnvPHB *),
>>>           DEFINE_PROP_END_OF_LIST(),
>>>   };
>>>   static void pnv_phb3_class_init(ObjectClass *klass, void *data)
>>>   {
>>> -    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    hc->root_bus_path = pnv_phb3_root_bus_path;
>>>       dc->realize = pnv_phb3_realize;
>>>       device_class_set_props(dc, pnv_phb3_properties);
>>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>>       dc->user_creatable = false;
>>>   }
>>>   static const TypeInfo pnv_phb3_type_info = {
>>>       .name          = TYPE_PNV_PHB3,
>>> -    .parent        = TYPE_PCIE_HOST_BRIDGE,
>>> +    .parent = TYPE_DEVICE,
>>>       .instance_size = sizeof(PnvPHB3),
>>>       .class_init    = pnv_phb3_class_init,
>>>       .instance_init = pnv_phb3_instance_init,
>>> @@ -1146,11 +1133,11 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, 
>>> Error **errp)
>>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>>       PCIDevice *pci = PCI_DEVICE(dev);
>>>       PCIBus *bus = pci_get_bus(pci);
>>> -    PnvPHB3 *phb = NULL;
>>> +    PnvPHB *phb = NULL;
>>>       Error *local_err = NULL;
>>> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>>> -                                          TYPE_PNV_PHB3);
>>> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>>> +                                         TYPE_PNV_PHB);
>>
>> I realize that this has come from existing code, however these days there generally 
>> isn't a good reason for anything to access bus->qbus directly (and C casts without 
>> a QOM macro often need a closer look). I'm also not convinced by the use of 
>> object_dynamic_cast() here either. Could this be rewritten as something like:
>>
>>      phb = PNV_PHB(PNV_PHB3_ROOT_PORT(dev)->phb_base);
> 
> Just checked. At this moment we can't because we don't declare a PNV_PHB3_ROOT_PORT()
> macro for this device. Yes, we're missing a OBJECT_DECLARE_SIMPLE_TYPE() for it. Same
> thing for PnvPHB4RootPort.
> 
> I can add the missing PNV_PHB3_ROOT_PORT() macro and do this change. Or I can make
> a comment mentioning that this code can be improved but it's going to be removed
> shortly and this will be amended appropriately in the pnv-phb-root-port code.
> 
> 
> What do you think? I'm fine with both alternatives.

I see there are some queries about the way these devices are modelled, so if that 
requires more than trivial changes it may make sense to integrate these changes into 
v3, particularly if it helps with type safety.

Otherwise I'd be simply inclined to add these changes to the end of your existing 
series as a final tidy-up and post that as v3.

> Thanks,
> 
> 
> Daniel
> 
>>
>>>       if (!phb) {
>>>           error_setg(errp,
>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>> index aaf4d241c3..6cd0af9adf 100644
>>> --- a/hw/ppc/pnv.c
>>> +++ b/hw/ppc/pnv.c
>>> @@ -43,6 +43,7 @@
>>>   #include "hw/ipmi/ipmi.h"
>>>   #include "target/ppc/mmu-hash64.h"
>>>   #include "hw/pci/msi.h"
>>> +#include "hw/pci-host/pnv_phb.h"
>>>   #include "hw/ppc/xics.h"
>>>   #include "hw/qdev-properties.h"
>>> @@ -654,7 +655,13 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>>>   static PnvPHB3 *pnv_get_phb3_child(Object *child)
>>>   {
>>> -    return (PnvPHB3 *)object_dynamic_cast(child, TYPE_PNV_PHB3);
>>> +    PnvPHB *phb = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
>>
>> And here, assuming child is of type TYPE_PNV_PHB then as it is already known at 
>> compile time so I think this could become just:
>>
>>      PnvPHB *phb = PNV_PHB(child);
>>
>>> +    if (!phb) {
>>> +        return NULL;
>>> +    }
>>> +
>>> +    return (PnvPHB3 *)phb->backend;
>>>   }
>>>   static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
>>> @@ -1160,7 +1167,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>>       chip8->num_phbs = pcc->num_phbs;
>>>       for (i = 0; i < chip8->num_phbs; i++) {
>>> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>>> +        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
>>>       }
>>>   }
>>> @@ -1282,9 +1289,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error 
>>> **errp)
>>>       memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
>>>                                   &chip8->homer.regs);
>>> -    /* PHB3 controllers */
>>> +    /* PHB controllers */
>>>       for (i = 0; i < chip8->num_phbs; i++) {
>>> -        PnvPHB3 *phb = &chip8->phbs[i];
>>> +        PnvPHB *phb = &chip8->phbs[i];
>>>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>>>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>>> @@ -1957,6 +1964,7 @@ static int pnv_ics_get_child(Object *child, void *opaque)
>>>               args->ics = ICS(&phb3->msis);
>>>           }
>>>       }
>>> +
>>>       return args->ics ? 1 : 0;
>>>   }
>>> @@ -2112,8 +2120,13 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, 
>>> void *data)
>>>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>>>       static const char compat[] = "qemu,powernv8\0qemu,powernv\0ibm,powernv";
>>> +    static GlobalProperty phb_compat[] = {
>>> +        { TYPE_PNV_PHB, "version", "3" },
>>> +    };
>>> +
>>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
>>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
>>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>>>       xic->icp_get = pnv_icp_get;
>>>       xic->ics_get = pnv_ics_get;
>>> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
>>> index 1375f18fc1..3b9ff1096a 100644
>>> --- a/include/hw/pci-host/pnv_phb3.h
>>> +++ b/include/hw/pci-host/pnv_phb3.h
>>> @@ -14,6 +14,7 @@
>>>   #include "hw/pci/pcie_port.h"
>>>   #include "hw/ppc/xics.h"
>>>   #include "qom/object.h"
>>> +#include "hw/pci-host/pnv_phb.h"
>>>   typedef struct PnvPHB3 PnvPHB3;
>>>   typedef struct PnvChip PnvChip;
>>> @@ -127,7 +128,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
>>>   #define PCI_MMIO_TOTAL_SIZE   (0x1ull << 60)
>>>   struct PnvPHB3 {
>>> -    PCIExpressHost parent_obj;
>>> +    DeviceState parent;
>>> +
>>> +    PnvPHB *phb_base;
>>>       uint32_t chip_id;
>>>       uint32_t phb_id;
>>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>>> index 86cb7d7f97..4595db418e 100644
>>> --- a/include/hw/ppc/pnv.h
>>> +++ b/include/hw/ppc/pnv.h
>>> @@ -32,6 +32,7 @@
>>>   #include "hw/ppc/pnv_core.h"
>>>   #include "hw/pci-host/pnv_phb3.h"
>>>   #include "hw/pci-host/pnv_phb4.h"
>>> +#include "hw/pci-host/pnv_phb.h"
>>>   #include "qom/object.h"
>>>   #define TYPE_PNV_CHIP "pnv-chip"
>>> @@ -80,7 +81,7 @@ struct Pnv8Chip {
>>>       PnvHomer     homer;
>>>   #define PNV8_CHIP_PHB3_MAX 4
>>> -    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>>> +    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
>>>       uint32_t     num_phbs;
>>>       XICSFabric    *xics;


ATB,

Mark.

