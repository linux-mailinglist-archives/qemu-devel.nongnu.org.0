Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FDF53E477
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:44:55 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyC6I-00079d-Im
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyC3E-0004J8-86; Mon, 06 Jun 2022 08:41:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyC36-00045e-Kz; Mon, 06 Jun 2022 08:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNvx5F1aRmwgnCV3cHuCjrW9Djws3Ur+k10GDpKt+A4=; b=PrQWM6NuV4Cr3KauwZaxx4GfXS
 mkIkWFjv72TN7aNma47YDtSfZAP/PCrxu5JXKCthRSpIl1vOb5vR3g5gwTLZppZWMXAu7av4VseL9
 UoUY6eIpXp9/Hj4OoLpZv7OQ0JMeo8Jl26jX7Oc0Nt5iql0EpEJv7L98gUtPCsurYXm9/63dk89Uy
 SJxRvn36Yshj+OguylTxvB+vcQTP8biEzndv9ueb5TvJjk0KaW1BjQxOEyh4dplvYq9DGfIZhMCox
 rQTJpDao89s6udwpYGCApPF3aLBUofyYnaCJefCIb08gJWFeezkr9Aj0ne6BYwIYtmWk+3wV5BeII
 dzCcI/qtReVa+k/gVyg+vLL7v3W/nOgQr5qrJu8geLiWBbb1+NA1y2Gmxg6c+scYeQYH4HZmvuVQy
 aApLVR+BPfE46zhQzBYYXLA/cN7Qq8O8nMpfz8hnKIboeJRVGsbgku/ZHTm6o+1rQRyyBUNiZSTUM
 M066oKM6RafkbGZ3FsB45+XOXwVqAmdvQvaqjyh57aBETGTyGKJP0vWaAJo8sTh/BRH5TMUOc03Xo
 QOOJXHHXrIYcPoGoSEcnI9DkDBQaDO3B+1nl1FRZY3mRL5JnXc8vKbng0E8CTpKrdZzBHFkhcdyIA
 Yvdf9Fv+0COmvMrDcA/h2WckAve6gFD/xkB09opf4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nyC20-00044P-1o; Mon, 06 Jun 2022 13:40:28 +0100
Message-ID: <f8d7a430-fdf2-f4d6-1807-4a6c40b9c0c1@ilande.co.uk>
Date: Mon, 6 Jun 2022 13:41:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-12-danielhb413@gmail.com>
 <84beb434-af3c-d882-bce8-869754828a04@ilande.co.uk>
 <3d6f05aa-8e40-0fc6-e0cb-69c614faddfd@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3d6f05aa-8e40-0fc6-e0cb-69c614faddfd@gmail.com>
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

On 03/06/2022 21:47, Daniel Henrique Barboza wrote:

> On 6/2/22 05:12, Mark Cave-Ayland wrote:
>> On 31/05/2022 22:49, Daniel Henrique Barboza wrote:
>>
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
>>
>> Same here too.
> 
> 
> This case is a bit different than the previous because there's no ->phb_base in
> this device. Doing
> 
> PnvPHB *phb = PNV_PHB(PNV_PHB_ROOT_PORT(dev));
> 
> Will somehow retrieve a PnvPHB pointer but with zeroed properties. This makes
> the slot/chassis code down below to fail when adding a second port.

Hmmm that's odd.

> I checked how other parts of the code handles that and the closer I found so
> far is doing something like this:
> 
>      PCIDevice *pci = PCI_DEVICE(dev);
>      PnvPHB *phb = PNV_PHB(pci_device_root_bus(pci)->qbus.parent);
> 
> This is how pci_bus_bypass_iommu() from hw/pci/pci.c retrieves a PCIHostState
> pointer of a given bus.
> 
> Another idea is to simply add a pointer to the parent PnvPHB device that the
> root port is attached to. This would trivialize this part and I could also
> use the already set PnvPHB->version for the root port logic as well since they're
> set to be the same.

I think what should happen is that the parent device should instantiate the pnv_phb 
root port via object_initialize_child() so it is embedded within it, at which point 
the pnv_phb root port device can just use container_of() to obtain the reference to 
the parent device state.

But certainly dereferencing the internal qbus object is not the right long-term solution.

>>> +    if (!phb) {
>>> +        error_setg(errp,
>>> +"pnv_phb_root_port devices must be connected to pnv-phb buses");
>>> +        return;
>>> +    }
>>> +
>>> +    /* Set unique chassis/slot values for the root port */
>>> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
>>> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
>>
>> Again this is from older code, but we already have dev so these could be:
>>
>>      qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
>>      qdev_prop_set_uint16(dev, "slot", phb->phb_id);
>>
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

