Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6686539F0A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 10:09:35 +0200 (CEST)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwJQ6-0000CM-OB
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 04:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwJLK-0006Ol-CA; Wed, 01 Jun 2022 04:04:45 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwJLE-0002RP-KH; Wed, 01 Jun 2022 04:04:35 -0400
Received: by mail-oi1-x232.google.com with SMTP id u140so1687655oie.3;
 Wed, 01 Jun 2022 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/7xq4gu/iq2wXv8D6cUrO7XJ2z/gFBo6TylonUB12nM=;
 b=lulHLT+oDASG83dES38nHzUyXVKnJBh0RU5PT8LH5bIs2StnCBaK95VD91AZG9EO4l
 T1ZUy93XDqV2wF9KmCU1T3+SKFGeTE07suhtZIGoZYrUcNvfY+oIzKZ5t8OiUo0dcfHN
 hxS+xhNbwoP0YvI0c/U+ls1+mxQkr5TtjrAAtNUmyqPwsRnY8NR8sZHEfZpWmJMBRP3U
 +fxBavoGkUHA0t63rAd6aXXtm2uRUprSi/uxTB4EsedPzSyfeZt6FqNWbCQPlExYAtpy
 a+4r2pJr2Gl6prOFRTH4XL0w0QwvZIayTKhQzM7DbxX6Z57OSgOeP6Yf6plZTVEiXBZw
 2YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/7xq4gu/iq2wXv8D6cUrO7XJ2z/gFBo6TylonUB12nM=;
 b=IT+JI8Sfyk/CEOJKcGePlVm8MMXLnfZjaTv81FRTPIZ+t4Nj7zVnq6+55WwTABVUrH
 Z5xFzRpgBSkBQ7GA2Jznw6oQ5RTHeoYhe8BRaTcXHL8mxbUO3gXvtXtcqLnWD61LtKJN
 qLibGvGZ0KI5+Ez7rtMvh+O7BAks8d84g1zHXA++ERsj9ir9EmYRu7qo4n/qyiTQSJ1/
 fszbFzeMoc1GPJ0ipve8N9ATHpcBmOr2p/s+ererbEKrlbfvtBgf7fweHGkmt7ySf+b2
 FzOLQuKKJm6Y8KpIRPkn2un4ysKqpLVZLgbDX06fyjQtGDlmHzZ/p5PKjIm1FCrq7tgw
 S6HA==
X-Gm-Message-State: AOAM531bVgG9OIL8BjwFU4ubCZB0eblaRWFt5gE3t2MDvHa2JpWo9sxC
 RX6EHzgWslOLkdLmkpSMKcE=
X-Google-Smtp-Source: ABdhPJx54HCL8vWEC5Hh9iJsgjdmtY4WA7kzHiPtyOdm70PVNFVobZbGpt5dkRxJN3Pwr3FfkpRPzQ==
X-Received: by 2002:a05:6808:1407:b0:32e:1ad1:2d4 with SMTP id
 w7-20020a056808140700b0032e1ad102d4mr1355977oiv.235.1654070670526; 
 Wed, 01 Jun 2022 01:04:30 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a056808055700b00325cda1ff9fsm588070oig.30.2022.06.01.01.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 01:04:30 -0700 (PDT)
Message-ID: <867a5313-14f0-0b7f-a46c-7b7516d9a4c2@gmail.com>
Date: Wed, 1 Jun 2022 05:04:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 11/16] ppc/pnv: add pnv-phb-root-port device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-12-danielhb413@gmail.com>
 <9b633a09-f79f-0a5c-7073-ec1a92d47fb5@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <9b633a09-f79f-0a5c-7073-ec1a92d47fb5@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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



On 6/1/22 02:56, Cédric Le Goater wrote:
> On 5/31/22 23:49, Daniel Henrique Barboza wrote:
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
>> +
>> +    if (!phb) {
>> +        error_setg(errp,
>> +"pnv_phb_root_port devices must be connected to pnv-phb buses");
>> +        return;
>> +    }
>> +
>> +    /* Set unique chassis/slot values for the root port */
>> +    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
>> +    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
>> +
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
> 
> does that mean powernv8 machines will see phb devices as phb5 devices ?


I had something like this in this patch that would set device_id properly:


diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 5d66264a96..d468e8d44a 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -144,6 +144,22 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
      PCIBus *bus = pci_get_bus(pci);
      PnvPHB *phb = NULL;
      Error *local_err = NULL;
+    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIDeviceClass *k = PCI_DEVICE_GET_CLASS(pci);
+
+    switch (phb_rp->version) {
+    case 3:
+        k->device_id = PNV_PHB3_DEVICE_ID;
+        break;
+    case 4:
+        k->device_id = PNV_PHB4_DEVICE_ID;
+        break;
+    case 5:
+        k->device_id = PNV_PHB5_DEVICE_ID;
+        break;
+    default:
+        g_assert_not_reached();
+    }
  
      phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
                                            TYPE_PNV_PHB);
@@ -166,6 +182,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
      pci_config_set_interrupt_pin(pci->config, 0);
  }
  
+static Property pnv_phb_root_port_properties[] = {
+    DEFINE_PROP_UINT32("version", PnvPHBRootPort, version, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
  static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
  {
      DeviceClass *dc = DEVICE_CLASS(klass);
@@ -181,6 +202,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
                                    &rpc->parent_reset);
      dc->reset = &pnv_phb_root_port_reset;
  
+    device_class_set_props(dc, pnv_phb_root_port_properties);
      dc->user_creatable = true;
  
      k->vendor_id = PCI_VENDOR_ID_IBM;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 4d2ea405db..13c8753eb2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2148,6 +2148,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
  
      static GlobalProperty phb_compat[] = {
          { TYPE_PNV_PHB, "version", "3" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },
      };
  
      mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
@@ -2173,6 +2174,7 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
  
      static GlobalProperty phb_compat[] = {
          { TYPE_PNV_PHB, "version", "4" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "4" },
      };
  
      mc->desc = "IBM PowerNV (Non-Virtualized) POWER9";
@@ -2199,6 +2201,7 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
  
      static GlobalProperty phb_compat[] = {
          { TYPE_PNV_PHB, "version", "5" },
+        { TYPE_PNV_PHB_ROOT_PORT, "version", "5" },
      };
  
      mc->desc = "IBM PowerNV (Non-Virtualized) POWER10";


The reason I didn't follow it through is because I wasn't sure if setting k->device_id
during realize() time was acceptable. Everyone else seems to set k->device_id during
class_init() or via an extra attribute 'device_id' that is written directly into
the PCI header.

If this is something that we can do then I'm fine with fixing this up in this patch.


Thanks,


Daniel

> 
> C.
> 
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

