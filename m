Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679353B431
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:15:02 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwf2p-0002Fu-9N
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nweub-0007cZ-Ez; Thu, 02 Jun 2022 03:06:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nweuZ-0001zd-1A; Thu, 02 Jun 2022 03:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wcIFm+hipqKJBxI14lkQ6/1aKYdGk6EYjwYTvk2YzmM=; b=1NcnTD0I5JllKNI1homKgUZ+Ul
 BDNSlkE0fzhLo3lOGvOP1qTjU5cesIyxgeWXnE9ePOI2cmp07my0VUAvq9tOsBQ2ZK1Zan3ths8Hp
 EWx5r0YQhlCqCtNB96VY4dM3EAbW/6+sYfIpIRiGNFLeuuM5FCqmj31p/9tVz8CJzWzDzcSnr4va9
 Ye4rIKnkbGhQndOoXDg6ye+iAcWIjGCoVbrV1riNvClAmK6dZ3R6Tuu2ln/XUOsh6bs9XQruNF6l7
 dS6Ck4TGVCywhd69yQd+V6OIRDt8ml1FPwjER35+ZMoQu0io9xqi9syLbLpsyPZIiTjURTEiV6dtV
 FustvHjkshvZb8hnYtcdZj+7q1XBUb4THcvo/uezrOGZCwwI1W4gyH77c+5cGNuPsnPYo2RQjwS7S
 H6+vZ5kd0O7Niwj9Etu+XK8jPCQX7Krzg2oWqnVp9AYmeV9YGEzkBIMGoKtC7SS3bNTIwc+NWIJ70
 XdIpFTIi7Fzlo4WyyaPi2Lr0YhE0jsgF4r+FZa0kGuK791GK4zoNoioIwIhTnumaALQVBOErlnnoL
 CxxhmnnE3XoEIibS0+OjLf+dUifLjh9hsEkJbvk3AqB8zbtQfPpbQ/5Ntlg30duDr5KcToAmtsd4S
 J+yDSlH2xqyNTKe1zavzr5A8Ab+nLK6jKY+Pz2quI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwetN-0002mL-PQ; Thu, 02 Jun 2022 08:05:17 +0100
Message-ID: <68b36acd-e88a-73a4-145e-30d5a97d40d6@ilande.co.uk>
Date: Thu, 2 Jun 2022 08:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-12-danielhb413@gmail.com>
 <9b633a09-f79f-0a5c-7073-ec1a92d47fb5@kaod.org>
 <867a5313-14f0-0b7f-a46c-7b7516d9a4c2@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <867a5313-14f0-0b7f-a46c-7b7516d9a4c2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 11/16] ppc/pnv: add pnv-phb-root-port device
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

On 01/06/2022 09:04, Daniel Henrique Barboza wrote:

> On 6/1/22 02:56, Cédric Le Goater wrote:
>> On 5/31/22 23:49, Daniel Henrique Barboza wrote:
>>> We have two very similar root-port devices, pnv-phb3-root-port and
>>> pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
>>> that, until now, has no additional attributes.
>>>
>>> The main difference between the PHB3 and PHB4 root ports is that
>>> pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
>>> other differences can be merged in a single device without too much
>>> trouble.
>>>
>>> This patch introduces the unified pnv-phb-root-port that, in time, will
>>> be used as the default root port for the pnv-phb device.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/pci-host/pnv_phb.c | 107 ++++++++++++++++++++++++++++++++++++++----
>>>   hw/pci-host/pnv_phb.h |  17 +++++++
>>>   2 files changed, 116 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>>> index 321c4e768a..5047e90d3a 100644
>>> --- a/hw/pci-host/pnv_phb.c
>>> +++ b/hw/pci-host/pnv_phb.c
>>> @@ -114,15 +114,106 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>>>       dc->user_creatable = true;
>>>   }
>>> -static void pnv_phb_register_type(void)
>>> +static void pnv_phb_root_port_reset(DeviceState *dev)
>>>   {
>>> -    static const TypeInfo pnv_phb_type_info = {
>>> -        .name          = TYPE_PNV_PHB,
>>> -        .parent        = TYPE_PCIE_HOST_BRIDGE,
>>> -        .instance_size = sizeof(PnvPHB),
>>> -        .class_init    = pnv_phb_class_init,
>>> -    };
>>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>> +    PnvPHBRootPort *rootport = PNV_PHB_ROOT_PORT(dev);
>>> +    PCIDevice *d = PCI_DEVICE(dev);
>>> +    uint8_t *conf = d->config;
>>> +    rpc->parent_reset(dev);
>>> +
>>> +    if (rootport->version == 3) {
>>> +        return;
>>> +    }
>>> +
>>> +    /* PHB4 and later requires these extra reset steps */
>>> +    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
>>> +                               PCI_IO_RANGE_MASK & 0xff);
>>> +    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
>>> +                                 PCI_IO_RANGE_MASK & 0xff);
>>> +    pci_set_word(conf + PCI_MEMORY_BASE, 0);
>>> +    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
>>> +    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
>>> +    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
>>> +    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
>>> +    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
>>> +    pci_config_set_interrupt_pin(conf, 0);
>>> +}
>>> +
>>> +static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>> +    PCIDevice *pci = PCI_DEVICE(dev);
>>> +    PCIBus *bus = pci_get_bus(pci);
>>> +    PnvPHB *phb = NULL;
>>> +    Error *local_err = NULL;
>>> +
>>> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>>> +                                          TYPE_PNV_PHB);
>>> +
>>> +    if (!phb) {
>>> +        error_setg(errp,
>>> +"pnv_phb_root_port devices must be connected to pnv-phb buses");
>>> +        return;
>>> +    }
>>> +
>>> +    /* Set unique chassis/slot values for the root port */
>>> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
>>> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
>>> +
>>> +    rpc->parent_realize(dev, &local_err);
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +    pci_config_set_interrupt_pin(pci->config, 0);
>>> +}
>>> +
>>> +static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>>> +
>>> +    dc->desc     = "IBM PHB PCIE Root Port";
>>> +
>>> +    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
>>> +                                    &rpc->parent_realize);
>>> +
>>> +    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
>>> +                                  &rpc->parent_reset);
>>> +    dc->reset = &pnv_phb_root_port_reset;
>>> +
>>> +    dc->user_creatable = true;
>>> +
>>> +    k->vendor_id = PCI_VENDOR_ID_IBM;
>>> +    /* device_id represents the latest PHB root port version supported */
>>> +    k->device_id = PNV_PHB5_DEVICE_ID;
>>
>> does that mean powernv8 machines will see phb devices as phb5 devices ?
> 
> 
> I had something like this in this patch that would set device_id properly:
> 
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 5d66264a96..d468e8d44a 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -144,6 +144,22 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error 
> **errp)
>       PCIBus *bus = pci_get_bus(pci);
>       PnvPHB *phb = NULL;
>       Error *local_err = NULL;
> +    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
> +    PCIDeviceClass *k = PCI_DEVICE_GET_CLASS(pci);
> +
> +    switch (phb_rp->version) {
> +    case 3:
> +        k->device_id = PNV_PHB3_DEVICE_ID;
> +        break;
> +    case 4:
> +        k->device_id = PNV_PHB4_DEVICE_ID;
> +        break;
> +    case 5:
> +        k->device_id = PNV_PHB5_DEVICE_ID;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> 
>       phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>                                             TYPE_PNV_PHB);
> @@ -166,6 +182,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error 
> **errp)
>       pci_config_set_interrupt_pin(pci->config, 0);
>   }
> 
> +static Property pnv_phb_root_port_properties[] = {
> +    DEFINE_PROP_UINT32("version", PnvPHBRootPort, version, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -181,6 +202,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void 
> *data)
>                                     &rpc->parent_reset);
>       dc->reset = &pnv_phb_root_port_reset;
> 
> +    device_class_set_props(dc, pnv_phb_root_port_properties);
>       dc->user_creatable = true;
> 
>       k->vendor_id = PCI_VENDOR_ID_IBM;
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 4d2ea405db..13c8753eb2 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2148,6 +2148,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void 
> *data)
> 
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "3" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },
>       };
> 
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
> @@ -2173,6 +2174,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void 
> *data)
> 
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "4" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "4" },
>       };
> 
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
> @@ -2199,6 +2201,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, 
> void *data)
> 
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "5" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "5" },
>       };
> 
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";
> 
> 
> The reason I didn't follow it through is because I wasn't sure if setting k->device_id
> during realize() time was acceptable. Everyone else seems to set k->device_id during
> class_init() or via an extra attribute 'device_id' that is written directly into
> the PCI header.
> 
> If this is something that we can do then I'm fine with fixing this up in this patch.

Yeah I'd be slightly nervous about doing this outside of class_init() too. I think my 
preferred method would be that used by virtio, which is to write the value to config 
space (see virtio_pci_device_plugged()) and then set k->device_id to 0 with an 
appropriate comment as per 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/virtio/vhost-user-rng-pci.c#L53. That 
makes it quite clear that the 0 value in class_init() is a placeholder for something 
else.

> Thanks,
>  
> Daniel
> 
>>
>> C.
>>
>>> +    k->revision  = 0;
>>> +
>>> +    rpc->exp_offset = 0x48;
>>> +    rpc->aer_offset = 0x100;
>>> +}
>>> +
>>> +static const TypeInfo pnv_phb_type_info = {
>>> +    .name          = TYPE_PNV_PHB,
>>> +    .parent        = TYPE_PCIE_HOST_BRIDGE,
>>> +    .instance_size = sizeof(PnvPHB),
>>> +    .class_init    = pnv_phb_class_init,
>>> +};
>>> +
>>> +static const TypeInfo pnv_phb_root_port_info = {
>>> +    .name          = TYPE_PNV_PHB_ROOT_PORT,
>>> +    .parent        = TYPE_PCIE_ROOT_PORT,
>>> +    .instance_size = sizeof(PnvPHBRootPort),
>>> +    .class_init    = pnv_phb_root_port_class_init,
>>> +};
>>> +
>>> +static void pnv_phb_register_types(void)
>>> +{
>>>       type_register_static(&pnv_phb_type_info);
>>> +    type_register_static(&pnv_phb_root_port_info);
>>>   }
>>> -type_init(pnv_phb_register_type)
>>> +
>>> +type_init(pnv_phb_register_types)
>>> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
>>> index a7cc8610e2..c8eab4b767 100644
>>> --- a/hw/pci-host/pnv_phb.h
>>> +++ b/hw/pci-host/pnv_phb.h
>>> @@ -36,4 +36,21 @@ struct PnvPHB {
>>>   #define TYPE_PNV_PHB "pnv-phb"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>>> +/*
>>> + * PHB PCIe Root port
>>> + */
>>> +#define PNV_PHB3_DEVICE_ID         0x03dc
>>> +#define PNV_PHB4_DEVICE_ID         0x04c1
>>> +#define PNV_PHB5_DEVICE_ID         0x0652
>>> +
>>> +typedef struct PnvPHBRootPort {
>>> +    PCIESlot parent_obj;
>>> +
>>> +    uint32_t version;
>>> +} PnvPHBRootPort;
>>> +
>>> +#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
>>> +#define PNV_PHB_ROOT_PORT(obj) \
>>> +    OBJECT_CHECK(PnvPHBRootPort, obj, TYPE_PNV_PHB_ROOT_PORT)
>>> +
>>>   #endif /* PCI_HOST_PNV_PHB_H */

ATB,

Mark.

