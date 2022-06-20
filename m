Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F5552466
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:08:56 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Mlb-00069A-PJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3Mi3-0003mx-PN; Mon, 20 Jun 2022 15:05:16 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3Mi2-0004Uz-45; Mon, 20 Jun 2022 15:05:15 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso2276852ooi.11; 
 Mon, 20 Jun 2022 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JxRokALGr/J/qfYuKuDDsl3MwKXZIfg3jKdVS4ud76E=;
 b=Nly7PLpTzP+crJ2r1tkvZMXZEau3w43XZ3bJeyxVL+147fXKHsSaw19DixsrO5OvNc
 xUxfNQrLNLvBD90ZtxJvryWos04s3t9hVPIT4uPUmGDc1YUJbSc3t8Pswgw0M9cAGZrX
 cZuiVQ5AETdl/59G/qA2RwWH1MlYjr1/2loaL9JQIR3eD0LgHNQ6A9lncGQrs1yKeQ+6
 bpT5CbjvHOFxbxgo1bXZJKVXp18Y0TQezZPJN6khz/kfPlSK1Y8BewpBUrZWPxnWN7EM
 3XN5fKD9D4VCUPKZi9Wj6Hhwq5zF34G8ty3n6tvKAeOQ6nkq8UVUwUB+fiuBcEn3knbo
 N+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JxRokALGr/J/qfYuKuDDsl3MwKXZIfg3jKdVS4ud76E=;
 b=bu44YqUK5tmTg/YmwYIvaM8hAiOX4BzKx/5YZcbkMXtgxOSzDZDhDIOjwTkWKLSY6j
 M9aIGA8CJasCL5YhlZQThD2joxSs8fr1vXlm7He5K25b37KNe8pJcuHcZtJ0Hz8v9RGG
 e0ivLyyaKXyMXvXVz7WpkdJLlN6Gh/kjEpK8VHpAjZhz1HvRF+ogP5eU/o0qaOR9wcux
 umDkbtyFfrhA6NDHi7RjB/FFWRQFstcCrq0zeb7RYISgoAeGFsN3JcffC1DXcKE1fYLd
 dCc+039bJihTxXztetGtX0rRLK+1SGoqcgD2N1eZL4fGHVc99STKkFCY5oEfcwaxAIco
 +9SQ==
X-Gm-Message-State: AJIora/L5e7SGiyXQ+TsUiL0o4mmPeOICj1z7C/blnVBACjy8EzUyfdS
 DwedBCMl8r6NKe0wf7/ZcahDqWR/hKlF9Q==
X-Google-Smtp-Source: AGRyM1u8RL0+bfSKw7NfA4kbzsQHp6wcK8eb/g0RU8UFEZMuKyyDc4dsgSTpNajFQ/iXM/heYph8kA==
X-Received: by 2002:a4a:254e:0:b0:35e:679f:5f78 with SMTP id
 v14-20020a4a254e000000b0035e679f5f78mr9575554ooe.26.1655751912001; 
 Mon, 20 Jun 2022 12:05:12 -0700 (PDT)
Received: from [192.168.10.102] ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 u2-20020acaab02000000b0032eafcbd294sm7798266oie.16.2022.06.20.12.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:05:11 -0700 (PDT)
Message-ID: <675e09f8-ab0c-d2c7-e0f0-1f3c57bb7dd6@gmail.com>
Date: Mon, 20 Jun 2022 16:05:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/9] ppc/pnv: use dev->parent_bus->parent to get the PHB
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-4-danielhb413@gmail.com>
 <d36775a8-15f7-ab03-fc08-3fdcfc72d293@ilande.co.uk>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d36775a8-15f7-ab03-fc08-3fdcfc72d293@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
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



On 6/20/22 04:27, Mark Cave-Ayland wrote:
> On 18/06/2022 12:01, Daniel Henrique Barboza wrote:
> 
>> It is not advisable to execute an object_dynamic_cast() to poke into
>> bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
>> think we got.
>>
>> A better way is to access the PnvPHB object via a QOM macro accessing
>> the existing parent links of the DeviceState. For a given
>> pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
>> and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
>> assert the type, and keep the NULL check in case we didn't get the
>> object we were expecting.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb3.c | 10 +++++++---
>>   hw/pci-host/pnv_phb4.c | 10 +++++++---
>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index 4ba660f8b9..5e7f827415 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>> -    PCIBus *bus = pci_get_bus(pci);
>>       PnvPHB3 *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB3);
>> +    /*
>> +     * dev->parent_bus gives access to the pnv-phb-root bus.
>> +     * The PnvPHB3 is the owner (parent) of the bus.
>> +     */
>> +    if (dev->parent_bus) {
> 
> Here dev->parent_bus shouldn't be accessed directly: you should use qdev_get_parent_bus() instead.
> 
>> +        phb = PNV_PHB3(dev->parent_bus->parent);
>> +    }
> 
> This one is a bit trickier, since part of the qdev design is that devices should only be aware of their immediate bus, and not the device parenting that bus i.e. dev->parent_bus->parent shouldn't be allowed.
> 
> What is really needed here is to use QOM links (or embed the device as a suitable QOM child) to get the PHB reference which I imagine will be changed as part of the follow-up series. So I think this can be left as-is for now, and fixed later.


In the previous patch (2) I've put the root port as a child of the bus,
giving us this hierarchy:


     /pnv-phb3[0] (pnv-phb3)  <====== PHB
       /lsi (ics)
       /msi (phb3-msi)
       /msi32[0] (memory-region)
       /msi64[0] (memory-region)
       /pbcq (pnv-pbcq)
     (...)
       /phb3_iommu[0] (pnv-phb3-iommu-memory-region)
       /pnv-phb3-root.0 (pnv-phb3-root)  <=== bus
         /pnv-phb3-root-port[0] (pnv-phb3-root-port) <==== root-port
           /bus master container[0] (memory-region)
           /bus master[0] (memory-region)
           /pci_bridge_io[0] (memory-region)
           /pci_bridge_io[1] (memory-region)
           /pci_bridge_mem[0] (memory-region)
           /pci_bridge_pci[0] (memory-region)
           /pci_bridge_pref_mem[0] (memory-region)
           /pci_bridge_vga_io_hi[0] (memory-region)
           /pci_bridge_vga_io_lo[0] (memory-region)
           /pci_bridge_vga_mem[0] (memory-region)
           /pcie.0 (PCIE)


I did it like this instead of the PHB for no particular reason. If the root port of
other PHBs are located as a direct child of the PHB I can change it.


All that said, thinking more about it, since I need to access the PHB just
to set "chassis" and "slot" of the device, and I'm already setting a QOM
parent for it, I guess I'll just set that before root_port_realize() and spare us
from having to accessing the parent of the parent bus of the root_port.



Thanks,


Daniel

> 
>>       if (!phb) {
>>           error_setg(errp,
>> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
>> index ffd9d8a947..a0ee52e820 100644
>> --- a/hw/pci-host/pnv_phb4.c
>> +++ b/hw/pci-host/pnv_phb4.c
>> @@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
>>   {
>>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
>>       PCIDevice *pci = PCI_DEVICE(dev);
>> -    PCIBus *bus = pci_get_bus(pci);
>>       PnvPHB4 *phb = NULL;
>>       Error *local_err = NULL;
>> -    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
>> -                                          TYPE_PNV_PHB4);
>> +    /*
>> +     * dev->parent_bus gives access to the pnv-phb-root bus.
>> +     * The PnvPHB4 is the owner (parent) of the bus.
>> +     */
>> +    if (dev->parent_bus) {
>> +        phb = PNV_PHB4(dev->parent_bus->parent);
>> +    }
>>       if (!phb) {
>>           error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
> 
> I've had a quick look over the rest of the series and from what I can see this is definitely heading in the right direction :)
> 
> 
> ATB,
> 
> Mark.

