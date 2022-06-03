Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEC53D2D9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:34:29 +0200 (CEST)
Received: from localhost ([::1]:41442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxE03-0007hg-Om
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxDwH-0005j6-Ol; Fri, 03 Jun 2022 16:30:33 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:44180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxDwF-000668-Bu; Fri, 03 Jun 2022 16:30:33 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so12010141fac.11; 
 Fri, 03 Jun 2022 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=4BWxg8ioCeqc0QpnZaxZ7WtENVK6VQhJc4wr8OqEQTg=;
 b=AqgyUOIPEEoiLO/k/gVOQs/TTgsVmhR8xYWs+vQ97S0k83ic6rGVVXAow8HmFhn+dJ
 V7usWms69QA6aom9Of1B/X83iqSXHGiTWcSBmx4uUKFG9bWMjyxcC51WGltHvYy1f0Em
 oLHIUPTEkYnTIjml022yBlFuVIeZSdM91Fc4Md2CR8MD1iJluf0af3DUhGnBD1ARaYZ4
 AgEMvT1cqZO9+7FKV83psywmrV4k8CYJ7iiLKIap83SvjexVI0yQUtOgKouJokXJwVOe
 Ko0C4x+IM8pV03BXkCJXTAres4apL4VbmnN9W3KP/NWy0EzTv42xrA2VI2/5g1o5aQT2
 Srkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=4BWxg8ioCeqc0QpnZaxZ7WtENVK6VQhJc4wr8OqEQTg=;
 b=KnGwdHaBJN0XwWRqm1JvLA7kwQREg4rF1B7olcNAHsvKPbb23YLZ8W6udKkjEdfwmI
 joJbXatA/72D2eraXQodgEWmkCRF2P9l6eMj0IwP9ZfP5q9WewIGsB0+htr3L7L7+gEd
 +rc2G6mjHEFLu9c3ojprOaGFYnHW1hpPiZwW4dXTV1jr8ws0F/t+p30x5Kn2BT8HGsKp
 pzrbluSK7Z8SOXtc7Xf4QMgg3Bj+RAMfmjQ57XtO+OdlIz+v8EuqfemwuPRo2Dk9RHfj
 E/D8NMN/uZtLKFLjVFmXZS/FDhV433PlHxBBUPCvZ8DbEfA2L6nwVy6FdUV8x7pbclAd
 AaEg==
X-Gm-Message-State: AOAM5329cPi8UEzXKy1ucQDgnMjK4x0z57MpQKb22w3SPMrnEQ5mjJZq
 OtXdcrsAfSrKZ9xR//Ht3KY=
X-Google-Smtp-Source: ABdhPJztNBi6bzWPQURXCncq5VWCuh47vo1eftFsV+2akQ7RYXUH8HK4QsVtYrNM59LGvPxn+DZY1w==
X-Received: by 2002:a05:6870:23a6:b0:f2:2dfd:d6d5 with SMTP id
 e38-20020a05687023a600b000f22dfdd6d5mr7116546oap.100.1654288228741; 
 Fri, 03 Jun 2022 13:30:28 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 e1-20020aca2301000000b0032e59589d5dsm875779oie.54.2022.06.03.13.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 13:30:28 -0700 (PDT)
Message-ID: <d4585367-26f1-6714-14f9-d8db215d0775@gmail.com>
Date: Fri, 3 Jun 2022 17:30:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 04/16] ppc/pnv: change PnvPHB3 to be a PnvPHB backend
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-5-danielhb413@gmail.com>
 <d71266a9-6723-3247-e38f-abf77332c522@ilande.co.uk>
Content-Language: en-US
In-Reply-To: <d71266a9-6723-3247-e38f-abf77332c522@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/2/22 04:56, Mark Cave-Ayland wrote:
> On 31/05/2022 22:49, Daniel Henrique Barboza wrote:
> 
>> We need a handful of changes that needs to be done in a single swoop to
>> turn PnvPHB3 into a PnvPHB backend.
>>
>> In the PnvPHB3, since the PnvPHB device implements PCIExpressHost and
>> will hold the PCI bus, change PnvPHB3 parent to TYPE_DEVICE. There are a
>> couple of instances in pnv_phb3.c that needs to access the PCI bus, so a
>> phb_base pointer is added to allow access to the parent PnvPHB. The
>> PnvPHB3 root port will now be connected to a PnvPHB object.
>>
>> In pnv.c, the powernv8 machine chip8 will now hold an array of PnvPHB
>> objects.  pnv_get_phb3_child() needs to be adapted to return the PnvPHB3
>> backend from the PnvPHB child. A global property is added in
>> pnv_machine_power8_class_init() to ensure that all PnvPHBs are created
>> with phb->version = 3.
>>
>> After all these changes we're still able to boot a powernv8 machine with
>> default settings. The real gain will come with user created PnvPHB
>> devices, coming up next.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb3.c         | 29 ++++++++---------------------
>>   hw/ppc/pnv.c                   | 21 +++++++++++++++++----
>>   include/hw/pci-host/pnv_phb3.h |  5 ++++-
>>   include/hw/ppc/pnv.h           |  3 ++-
>>   4 files changed, 31 insertions(+), 27 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 60584e2aae..a39aa0e8c4 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -11,6 +11,7 @@
>>   #include "qapi/visitor.h"
>>   #include "qapi/error.h"
>>   #include "hw/pci-host/pnv_phb3_regs.h"
>> +#include "hw/pci-host/pnv_phb.h"
>>   #include "hw/pci-host/pnv_phb3.h"
>>   #include "hw/pci/pcie_host.h"
>>   #include "hw/pci/pcie_port.h"
>> @@ -26,7 +27,7 @@
>>   static PCIDevice *pnv_phb3_find_cfg_dev(PnvPHB3 *phb)
>>   {
>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>       uint64_t addr = phb->regs[PHB_CONFIG_ADDRESS >> 3];
>>       uint8_t bus, devfn;
>> @@ -590,7 +591,7 @@ void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size)
>>   uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size)
>>   {
>>       PnvPHB3 *phb = opaque;
>> -    PCIHostState *pci = PCI_HOST_BRIDGE(phb);
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(phb->phb_base);
>>       uint64_t val;
>>       if ((off & 0xfffc) == PHB_CONFIG_DATA) {
>> @@ -1057,8 +1058,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>                             "phb3-regs", 0x1000);
>>       pnv_phb3_bus_init(dev, phb);
>> -
>> -    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB3_ROOT_PORT);
>>   }
>>   void pnv_phb3_update_regions(PnvPHB3 *phb)
>> @@ -1083,38 +1082,26 @@ void pnv_phb3_update_regions(PnvPHB3 *phb)
>>       pnv_phb3_check_all_m64s(phb);
>>   }
>> -static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
>> -                                          PCIBus *rootbus)
>> -{
>> -    PnvPHB3 *phb = PNV_PHB3(host_bridge);
>> -
>> -    snprintf(phb->bus_path, sizeof(phb->bus_path), "00%02x:%02x",
>> -             phb->chip_id, phb->phb_id);
>> -    return phb->bus_path;
>> -}
>> -
>>   static Property pnv_phb3_properties[] = {
>>           DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
>>           DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
>>           DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
>> +        DEFINE_PROP_LINK("phb-base", PnvPHB3, phb_base, TYPE_PNV_PHB, PnvPHB *),
>>           DEFINE_PROP_END_OF_LIST(),
>>   };
>>   static void pnv_phb3_class_init(ObjectClass *klass, void *data)
>>   {
>> -    PCIHostBridgeClass *hc = PCI_HOST_BRIDGE_CLASS(klass);
>>       DeviceClass *dc = DEVICE_CLASS(klass);
>> -    hc->root_bus_path = pnv_phb3_root_bus_path;
>>       dc->realize = pnv_phb3_realize;
>>       device_class_set_props(dc, pnv_phb3_properties);
>> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>>       dc->user_creatable = false;
>>   }
>>   static const TypeInfo pnv_phb3_type_info = {
>>       .name          = TYPE_PNV_PHB3,
>> -    .parent        = TYPE_PCIE_HOST_BRIDGE,
>> +    .parent = TYPE_DEVICE,
>>       .instance_size = sizeof(PnvPHB3),
>>       .class_init    = pnv_phb3_class_init,
>>       .instance_init = pnv_phb3_instance_init,
>> @@ -1146,11 +1133,11 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>>       PCIBus *bus = pci_get_bus(pci);
>> -    PnvPHB3 *phb = NULL;
>> +    PnvPHB *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB3);
>> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> +                                         TYPE_PNV_PHB);
> 
> I realize that this has come from existing code, however these days there generally isn't a good reason for anything to access bus->qbus directly (and C casts without a QOM macro often need a closer look). I'm also not convinced by the use of object_dynamic_cast() here either. Could this be rewritten as something like:
> 
>      phb = PNV_PHB(PNV_PHB3_ROOT_PORT(dev)->phb_base);

Just checked. At this moment we can't because we don't declare a PNV_PHB3_ROOT_PORT()
macro for this device. Yes, we're missing a OBJECT_DECLARE_SIMPLE_TYPE() for it. Same
thing for PnvPHB4RootPort.

I can add the missing PNV_PHB3_ROOT_PORT() macro and do this change. Or I can make
a comment mentioning that this code can be improved but it's going to be removed
shortly and this will be amended appropriately in the pnv-phb-root-port code.


What do you think? I'm fine with both alternatives.


Thanks,


Daniel

> 
>>       if (!phb) {
>>           error_setg(errp,
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index aaf4d241c3..6cd0af9adf 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -43,6 +43,7 @@
>>   #include "hw/ipmi/ipmi.h"
>>   #include "target/ppc/mmu-hash64.h"
>>   #include "hw/pci/msi.h"
>> +#include "hw/pci-host/pnv_phb.h"
>>   #include "hw/ppc/xics.h"
>>   #include "hw/qdev-properties.h"
>> @@ -654,7 +655,13 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>>   static PnvPHB3 *pnv_get_phb3_child(Object *child)
>>   {
>> -    return (PnvPHB3 *)object_dynamic_cast(child, TYPE_PNV_PHB3);
>> +    PnvPHB *phb = (PnvPHB *) object_dynamic_cast(child, TYPE_PNV_PHB);
> 
> And here, assuming child is of type TYPE_PNV_PHB then as it is already known at compile time so I think this could become just:
> 
>      PnvPHB *phb = PNV_PHB(child);
> 
>> +    if (!phb) {
>> +        return NULL;
>> +    }
>> +
>> +    return (PnvPHB3 *)phb->backend;
>>   }
>>   static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
>> @@ -1160,7 +1167,7 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>       chip8->num_phbs = pcc->num_phbs;
>>       for (i = 0; i < chip8->num_phbs; i++) {
>> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>> +        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
>>       }
>>   }
>> @@ -1282,9 +1289,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>>       memory_region_add_subregion(get_system_memory(), PNV_HOMER_BASE(chip),
>>                                   &chip8->homer.regs);
>> -    /* PHB3 controllers */
>> +    /* PHB controllers */
>>       for (i = 0; i < chip8->num_phbs; i++) {
>> -        PnvPHB3 *phb = &chip8->phbs[i];
>> +        PnvPHB *phb = &chip8->phbs[i];
>>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>> @@ -1957,6 +1964,7 @@ static int pnv_ics_get_child(Object *child, void *opaque)
>>               args->ics = ICS(&phb3->msis);
>>           }
>>       }
>> +
>>       return args->ics ? 1 : 0;
>>   }
>> @@ -2112,8 +2120,13 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>>       PnvMachineClass *pmc = PNV_MACHINE_CLASS(oc);
>>       static const char compat[] = "qemu,powernv8\0qemu,powernv\0ibm,powernv";
>> +    static GlobalProperty phb_compat[] = {
>> +        { TYPE_PNV_PHB, "version", "3" },
>> +    };
>> +
>>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
>>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power8_v2.0");
>> +    compat_props_add(mc->compat_props, phb_compat, G_N_ELEMENTS(phb_compat));
>>       xic->icp_get = pnv_icp_get;
>>       xic->ics_get = pnv_ics_get;
>> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
>> index 1375f18fc1..3b9ff1096a 100644
>> --- a/include/hw/pci-host/pnv_phb3.h
>> +++ b/include/hw/pci-host/pnv_phb3.h
>> @@ -14,6 +14,7 @@
>>   #include "hw/pci/pcie_port.h"
>>   #include "hw/ppc/xics.h"
>>   #include "qom/object.h"
>> +#include "hw/pci-host/pnv_phb.h"
>>   typedef struct PnvPHB3 PnvPHB3;
>>   typedef struct PnvChip PnvChip;
>> @@ -127,7 +128,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3, PNV_PHB3)
>>   #define PCI_MMIO_TOTAL_SIZE   (0x1ull << 60)
>>   struct PnvPHB3 {
>> -    PCIExpressHost parent_obj;
>> +    DeviceState parent;
>> +
>> +    PnvPHB *phb_base;
>>       uint32_t chip_id;
>>       uint32_t phb_id;
>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>> index 86cb7d7f97..4595db418e 100644
>> --- a/include/hw/ppc/pnv.h
>> +++ b/include/hw/ppc/pnv.h
>> @@ -32,6 +32,7 @@
>>   #include "hw/ppc/pnv_core.h"
>>   #include "hw/pci-host/pnv_phb3.h"
>>   #include "hw/pci-host/pnv_phb4.h"
>> +#include "hw/pci-host/pnv_phb.h"
>>   #include "qom/object.h"
>>   #define TYPE_PNV_CHIP "pnv-chip"
>> @@ -80,7 +81,7 @@ struct Pnv8Chip {
>>       PnvHomer     homer;
>>   #define PNV8_CHIP_PHB3_MAX 4
>> -    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>> +    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
>>       uint32_t     num_phbs;
>>       XICSFabric    *xics;
> 
> 
> ATB,
> 
> Mark.

