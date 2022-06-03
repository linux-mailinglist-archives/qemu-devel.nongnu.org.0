Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33D53D2F0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:48:41 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxEDo-0003nc-Ga
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxECa-0002lW-1E; Fri, 03 Jun 2022 16:47:24 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nxECX-0001oz-Do; Fri, 03 Jun 2022 16:47:23 -0400
Received: by mail-oi1-x22c.google.com with SMTP id k11so11823348oia.12;
 Fri, 03 Jun 2022 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tgeAebl9jCJ17Kn/BY1QRjj243j6PUkZx178p1WKX3c=;
 b=CBLtB8JSGGDIQcaGwYDX9vPQYCQ3Nnk4HuIuZo2R3n+yW6Aq/YRck14TGtJKQDuees
 3ywH0tN9PZsZ/6hQLydEglp+IwI0hdbhPUciYyRrepOCUOVOlPceIh0fUmwQH8lCA1Bd
 GfqPDIIc7I8B2X98Q5Hi2WmfC9EpH+mfLc0AIyXkAO+R0zWskgrAVrEJGnf7jNL2gJSB
 OoO5MuaoEDF/3CcM7ud6Msy+mNTVJb6cbMrsMDsUZKhhIpUdw1rRonpBx3cSv8cPi41e
 UXhewAA8dkHp/Uf3X4HMpqyRMNEnBD7do8kDlzc9Pi+MiuaUm62R3FgGvvsohBoUG/Pl
 +3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tgeAebl9jCJ17Kn/BY1QRjj243j6PUkZx178p1WKX3c=;
 b=OapaBHZiWxfkXhAJVgl1vust6FRynegUDIIOw7LQaEM+ARUVvfRv54jzlQlDbPO2VH
 1TFu2FUWxm2RI9TBC6qjMvpRo+Z+zb9bsJKWvejCLhgNcbDaKPtJfCJ8FaZCGz0Dk8tR
 nJdSxjdlLgH6dyC2SbVs0bx0SSwaMBcNI6slenRW0V1ewuv2dBiq5RgeeEg0cXu0sm0I
 1beFI82wYZmEDaX0dgUJvR8PPMV56E6i6LHq81PhPw9LmbflOaU4J2NhLjNr5UVruJ4u
 9yrSHHAv4+eRtsqbZkkzujddqBiCD12AkH5yR6WbpCPv4lVjHnj3tYz4j+Jisb/prbyQ
 wBpg==
X-Gm-Message-State: AOAM533AhE8C8oc7nK8Axt5keBzuP+w1e1rMIZKARc9WG1YDzZrkPaW4
 GpukDz0p09WX8l8YFAM0y8M=
X-Google-Smtp-Source: ABdhPJw0hbws3ALE7+zJI1B9KhzTmuZ+//LPoc803C0rybqPZehLrBlyutMyRSpjOCbr2sJuAMvGRA==
X-Received: by 2002:a05:6808:d46:b0:32e:129b:bfb2 with SMTP id
 w6-20020a0568080d4600b0032e129bbfb2mr10270873oik.66.1654289239546; 
 Fri, 03 Jun 2022 13:47:19 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 fw11-20020a056870080b00b000f3321caa73sm4058106oab.16.2022.06.03.13.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 13:47:19 -0700 (PDT)
Message-ID: <3d6f05aa-8e40-0fc6-e0cb-69c614faddfd@gmail.com>
Date: Fri, 3 Jun 2022 17:47:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 11/16] ppc/pnv: add pnv-phb-root-port device
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-12-danielhb413@gmail.com>
 <84beb434-af3c-d882-bce8-869754828a04@ilande.co.uk>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <84beb434-af3c-d882-bce8-869754828a04@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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



On 6/2/22 05:12, Mark Cave-Ayland wrote:
> On 31/05/2022 22:49, Daniel Henrique Barboza wrote:
> 
>> We have two very similar root-port devices, pnv-phb3-root-port and
>> pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
>> that, until now, has no additional attributes.
>>
>> The main difference between the PHB3 and PHB4 root ports is that
>> pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
>> other differences can be merged in a single device without too much
>> trouble.
>>
>> This patch introduces the unified pnv-phb-root-port that, in time, will
>> be used as the default root port for the pnv-phb device.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb.c | 107 ++++++++++++++++++++++++++++++++++++++----
>>   hw/pci-host/pnv_phb.h |  17 +++++++
>>   2 files changed, 116 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
>> index 321c4e768a..5047e90d3a 100644
>> --- a/hw/pci-host/pnv_phb.c
>> +++ b/hw/pci-host/pnv_phb.c
>> @@ -114,15 +114,106 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
>>       dc->user_creatable = true;
>>   }
>> -static void pnv_phb_register_type(void)
>> +static void pnv_phb_root_port_reset(DeviceState *dev)
>>   {
>> -    static const TypeInfo pnv_phb_type_info = {
>> -        .name          = TYPE_PNV_PHB,
>> -        .parent        = TYPE_PCIE_HOST_BRIDGE,
>> -        .instance_size = sizeof(PnvPHB),
>> -        .class_init    = pnv_phb_class_init,
>> -    };
>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>> +    PnvPHBRootPort *rootport = PNV_PHB_ROOT_PORT(dev);
>> +    PCIDevice *d = PCI_DEVICE(dev);
>> +    uint8_t *conf = d->config;
>> +    rpc->parent_reset(dev);
>> +
>> +    if (rootport->version == 3) {
>> +        return;
>> +    }
>> +
>> +    /* PHB4 and later requires these extra reset steps */
>> +    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
>> +                               PCI_IO_RANGE_MASK & 0xff);
>> +    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
>> +                                 PCI_IO_RANGE_MASK & 0xff);
>> +    pci_set_word(conf + PCI_MEMORY_BASE, 0);
>> +    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
>> +    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
>> +    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
>> +    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
>> +    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
>> +    pci_config_set_interrupt_pin(conf, 0);
>> +}
>> +
>> +static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>> +{
>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>> +    PCIDevice *pci = PCI_DEVICE(dev);
>> +    PCIBus *bus = pci_get_bus(pci);
>> +    PnvPHB *phb = NULL;
>> +    Error *local_err = NULL;
>> +
>> +    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> +                                          TYPE_PNV_PHB);
> 
> Same here too.


This case is a bit different than the previous because there's no ->phb_base in
this device. Doing

PnvPHB *phb = PNV_PHB(PNV_PHB_ROOT_PORT(dev));

Will somehow retrieve a PnvPHB pointer but with zeroed properties. This makes
the slot/chassis code down below to fail when adding a second port.

I checked how other parts of the code handles that and the closer I found so
far is doing something like this:

     PCIDevice *pci = PCI_DEVICE(dev);
     PnvPHB *phb = PNV_PHB(pci_device_root_bus(pci)->qbus.parent);

This is how pci_bus_bypass_iommu() from hw/pci/pci.c retrieves a PCIHostState
pointer of a given bus.

Another idea is to simply add a pointer to the parent PnvPHB device that the
root port is attached to. This would trivialize this part and I could also
use the already set PnvPHB->version for the root port logic as well since they're
set to be the same.


Thanks,


Daniel



> 
>> +    if (!phb) {
>> +        error_setg(errp,
>> +"pnv_phb_root_port devices must be connected to pnv-phb buses");
>> +        return;
>> +    }
>> +
>> +    /* Set unique chassis/slot values for the root port */
>> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
>> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> 
> Again this is from older code, but we already have dev so these could be:
> 
>      qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
>      qdev_prop_set_uint16(dev, "slot", phb->phb_id);
> 
>> +    rpc->parent_realize(dev, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +    pci_config_set_interrupt_pin(pci->config, 0);
>> +}
>> +
>> +static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>> +
>> +    dc->desc     = "IBM PHB PCIE Root Port";
>> +
>> +    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
>> +                                    &rpc->parent_realize);
>> +
>> +    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
>> +                                  &rpc->parent_reset);
>> +    dc->reset = &pnv_phb_root_port_reset;
>> +
>> +    dc->user_creatable = true;
>> +
>> +    k->vendor_id = PCI_VENDOR_ID_IBM;
>> +    /* device_id represents the latest PHB root port version supported */
>> +    k->device_id = PNV_PHB5_DEVICE_ID;
>> +    k->revision  = 0;
>> +
>> +    rpc->exp_offset = 0x48;
>> +    rpc->aer_offset = 0x100;
>> +}
>> +
>> +static const TypeInfo pnv_phb_type_info = {
>> +    .name          = TYPE_PNV_PHB,
>> +    .parent        = TYPE_PCIE_HOST_BRIDGE,
>> +    .instance_size = sizeof(PnvPHB),
>> +    .class_init    = pnv_phb_class_init,
>> +};
>> +
>> +static const TypeInfo pnv_phb_root_port_info = {
>> +    .name          = TYPE_PNV_PHB_ROOT_PORT,
>> +    .parent        = TYPE_PCIE_ROOT_PORT,
>> +    .instance_size = sizeof(PnvPHBRootPort),
>> +    .class_init    = pnv_phb_root_port_class_init,
>> +};
>> +
>> +static void pnv_phb_register_types(void)
>> +{
>>       type_register_static(&pnv_phb_type_info);
>> +    type_register_static(&pnv_phb_root_port_info);
>>   }
>> -type_init(pnv_phb_register_type)
>> +
>> +type_init(pnv_phb_register_types)
>> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
>> index a7cc8610e2..c8eab4b767 100644
>> --- a/hw/pci-host/pnv_phb.h
>> +++ b/hw/pci-host/pnv_phb.h
>> @@ -36,4 +36,21 @@ struct PnvPHB {
>>   #define TYPE_PNV_PHB "pnv-phb"
>>   OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
>> +/*
>> + * PHB PCIe Root port
>> + */
>> +#define PNV_PHB3_DEVICE_ID         0x03dc
>> +#define PNV_PHB4_DEVICE_ID         0x04c1
>> +#define PNV_PHB5_DEVICE_ID         0x0652
>> +
>> +typedef struct PnvPHBRootPort {
>> +    PCIESlot parent_obj;
>> +
>> +    uint32_t version;
>> +} PnvPHBRootPort;
>> +
>> +#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
>> +#define PNV_PHB_ROOT_PORT(obj) \
>> +    OBJECT_CHECK(PnvPHBRootPort, obj, TYPE_PNV_PHB_ROOT_PORT)
>> +
>>   #endif /* PCI_HOST_PNV_PHB_H */
> 
> 
> ATB,
> 
> Mark.

