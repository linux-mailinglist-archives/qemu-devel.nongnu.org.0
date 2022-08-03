Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5AA58901C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:24:28 +0200 (CEST)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJHAZ-0007DK-G6
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJH8y-0003iM-Vi
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:22:49 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:46115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJH8w-0000wB-Ps
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:22:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2924423787;
 Wed,  3 Aug 2022 16:22:43 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 18:22:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0055d466913-aa0e-44a2-a2e0-b32655636e1f,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aa2ba31d-310c-fbb0-b4da-3b8da02d8201@kaod.org>
Date: Wed, 3 Aug 2022 18:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 02/10] ppc/pnv: add phb-id/chip-id PnvPHB4RootBus
 properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, Frederic Barrat <fbarrat@linux.ibm.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-3-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803134459.2633902-3-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9214068e-2d09-4911-a5d9-20493c145303
X-Ovh-Tracer-Id: 11588606266630966240
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/3/22 15:44, Daniel Henrique Barboza wrote:
> The same rationale provided in the PHB3 bus case applies here.
> 
> Note: we could have merged both buses in a single object, like we did
> with the root ports, and spare some boilerplate. The reason we opted to
> preserve both buses objects is twofold:
> 
> - there's not user side advantage in doing so. Unifying the root ports
> presents a clear user QOL change when we enable user created devices back.
> The buses objects, aside from having a different QOM name, is transparent
> to the user;
> 
> - we leave a door opened in case we want to increase the root port limit
> for phb4/5 later on without having to deal with phb3 code.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 51 ++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/pnv_phb4.h | 10 +++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index b98c394713..824e1a73fb 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1551,6 +1551,12 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>                                        pnv_phb4_set_irq, pnv_phb4_map_irq, phb,
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB4_ROOT_BUS);
> +
> +    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
> +                            &error_abort);
> +
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   }
> @@ -1708,10 +1714,55 @@ static const TypeInfo pnv_phb5_type_info = {
>       .instance_size = sizeof(PnvPHB4),
>   };
>   
> +static void pnv_phb4_root_bus_get_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +{
> +    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
> +    uint64_t value = 0;
> +
> +    if (strcmp(name, "phb-id") == 0) {
> +        value = bus->phb_id;
> +    } else {
> +        value = bus->chip_id;
> +    }
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pnv_phb4_root_bus_set_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +
> +{
> +    PnvPHB4RootBus *bus = PNV_PHB4_ROOT_BUS(obj);
> +    uint64_t value;
> +
> +    if (!visit_type_size(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (strcmp(name, "phb-id") == 0) {
> +        bus->phb_id = value;
> +    } else {
> +        bus->chip_id = value;
> +    }
> +}
> +
>   static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
>   {
>       BusClass *k = BUS_CLASS(klass);
>   
> +    object_class_property_add(klass, "phb-id", "int",
> +                              pnv_phb4_root_bus_get_prop,
> +                              pnv_phb4_root_bus_set_prop,
> +                              NULL, NULL);
> +
> +    object_class_property_add(klass, "chip-id", "int",
> +                              pnv_phb4_root_bus_get_prop,
> +                              pnv_phb4_root_bus_set_prop,
> +                              NULL, NULL);
> +
>       /*
>        * PHB4 has only a single root complex. Enforce the limit on the
>        * parent bus
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 20aa4819d3..50d4faa001 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -45,7 +45,17 @@ typedef struct PnvPhb4DMASpace {
>       QLIST_ENTRY(PnvPhb4DMASpace) list;
>   } PnvPhb4DMASpace;
>   
> +/*
> + * PHB4 PCIe Root Bus
> + */
>   #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
> +struct PnvPHB4RootBus {
> +    PCIBus parent;
> +
> +    uint32_t chip_id;
> +    uint32_t phb_id;
> +};
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4RootBus, PNV_PHB4_ROOT_BUS)
>   
>   /*
>    * PHB4 PCIe Host Bridge for PowerNV machines (POWER9)


