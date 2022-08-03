Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B34589020
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 18:25:52 +0200 (CEST)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJHBw-0000N5-2P
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 12:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJH8q-0003RV-9j
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:22:41 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJH8n-0000b3-Di
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 12:22:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 05F8911C79AEB;
 Wed,  3 Aug 2022 18:22:25 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 18:22:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b82b82c8-2944-4972-a5e8-cc8c7e1472b9,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ed758ff2-fde7-8e35-a517-949c0fa5571f@kaod.org>
Date: Wed, 3 Aug 2022 18:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 01/10] ppc/pnv: add phb-id/chip-id PnvPHB3RootBus
 properties
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, Frederic Barrat <fbarrat@linux.ibm.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
 <20220803134459.2633902-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803134459.2633902-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 854a7589-48fa-47d0-97eb-85aea5b3b853
X-Ovh-Tracer-Id: 11583258241696631776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgsrghrrhgrtheslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
> We rely on the phb-id and chip-id, which are PHB properties, to assign
> chassis and slot to the root port. For default devices this is no big
> deal: the root port is being created under pnv_phb_realize() and the
> values are being passed on via the 'index' and 'chip-id' of the
> pnv_phb_attach_root_port() helper.
> 
> If we want to implement user created root ports we have a problem. The
> user created root port will not be aware of which PHB it belongs to,
> unless we're willing to violate QOM best practices and access the PHB
> via dev->parent_bus->parent. What we can do is to access the root bus
> parent bus.
> 
> Since we're already assigning the root port as QOM child of the bus, and
> the bus is initiated using PHB properties, let's add phb-id and chip-id
> as properties of the bus. This will allow us trivial access to them, for
> both user-created and default root ports, without doing anything too
> shady with QOM.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/pci-host/pnv_phb3.c         | 50 ++++++++++++++++++++++++++++++++++
>   include/hw/pci-host/pnv_phb3.h |  9 +++++-
>   2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index d4c04a281a..af8575c007 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1006,6 +1006,11 @@ void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
>                                        &phb->pci_mmio, &phb->pci_io,
>                                        0, 4, TYPE_PNV_PHB3_ROOT_BUS);
>   
> +    object_property_set_int(OBJECT(pci->bus), "phb-id", phb->phb_id,
> +                            &error_abort);
> +    object_property_set_int(OBJECT(pci->bus), "chip-id", phb->chip_id,
> +                            &error_abort);
> +
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   }
>   
> @@ -1105,10 +1110,55 @@ static const TypeInfo pnv_phb3_type_info = {
>       .instance_init = pnv_phb3_instance_init,
>   };
>   
> +static void pnv_phb3_root_bus_get_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +{
> +    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
> +static void pnv_phb3_root_bus_set_prop(Object *obj, Visitor *v,
> +                                       const char *name,
> +                                       void *opaque, Error **errp)
> +
> +{
> +    PnvPHB3RootBus *bus = PNV_PHB3_ROOT_BUS(obj);
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
>   static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
>   {
>       BusClass *k = BUS_CLASS(klass);
>   
> +    object_class_property_add(klass, "phb-id", "int",
> +                              pnv_phb3_root_bus_get_prop,
> +                              pnv_phb3_root_bus_set_prop,
> +                              NULL, NULL);
> +
> +    object_class_property_add(klass, "chip-id", "int",
> +                              pnv_phb3_root_bus_get_prop,
> +                              pnv_phb3_root_bus_set_prop,
> +                              NULL, NULL);
> +
>       /*
>        * PHB3 has only a single root complex. Enforce the limit on the
>        * parent bus
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index bff69201d9..4854f6d2f6 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -104,9 +104,16 @@ struct PnvPBCQState {
>   };
>   
>   /*
> - * PHB3 PCIe Root port
> + * PHB3 PCIe Root Bus
>    */
>   #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
> +struct PnvPHB3RootBus {
> +    PCIBus parent;
> +
> +    uint32_t chip_id;
> +    uint32_t phb_id;
> +};
> +OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB3RootBus, PNV_PHB3_ROOT_BUS)
>   
>   /*
>    * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)


