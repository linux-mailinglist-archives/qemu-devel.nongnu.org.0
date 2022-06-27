Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B825655BB3F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:12:59 +0200 (CEST)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sIE-0002DE-Qw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5sFK-00081C-Fu; Mon, 27 Jun 2022 13:09:58 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o5sF1-0003pc-TC; Mon, 27 Jun 2022 13:09:58 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so13712909fac.9; 
 Mon, 27 Jun 2022 10:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9iVexefOIm9MrEtx+W5ndOa+kcIFelBfJDo1l3VLEmo=;
 b=KDTZL/hj+171L9lKazNPGAEhXAWisg46g/hLfMQrQTkTIK+7pK/uZbpjRZBWfrrAjd
 t6P+A6xZui4chcoLgzUd8/UC0QqMceGil+oCLXkbVYoTLmyplRruSwrXWWC0zAHFpuSZ
 bBApgr5xw0N5QwwTdZAIASZVaaQ9P+rQszKe0tRysl9lI8doS0bvDZHF6LtrpZSAEZBQ
 DynOgHIJ/DAJrjZ1j7vWFClA89yqaOVWGTmryAkUJnmM0F2Q8laP4oHm6PTXx+gWe96G
 AjMTO07mEzQsbzTC8T9kw5r59xtjT8TE6WAfHDGhfjObeRY1uVUN2B/HkQkwWYeVqeo1
 RCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9iVexefOIm9MrEtx+W5ndOa+kcIFelBfJDo1l3VLEmo=;
 b=T7NC3h3N5xGAFKhel9ZADkfwDS7FenxWilkhqtKGV1nyvF3vej9Klc12S4gykv8r63
 XAPMYoH8fF+bfz7jT4Lz0cu3+mbgPQQGu4cZZun9Tmc9uisHt7y0uDxUbRz6cJuwuY7B
 /q3twsU256W2cOo3b0t+y28lN16F8rqTJjhmPpDtIkZjm8iIoukPNAFXg36tgWSjXfiY
 P9udFQjFWmUZC2YlEM951P3DK7rnbg6Wnp6VwEZsLeX7LtyOsxzJazq0Gam194oqwCRy
 iKgd515wJbltNPIt80LrCfooJdj/ygQWceV/jRufYMCsZSPSlaqKDobuyf6xwhHaBjnB
 2uyQ==
X-Gm-Message-State: AJIora+8ogClcFLfwPHEumjL5PRgyOBxzwfcpir/rP2ZDP8nKkuyInV6
 k+JXYBmiNS/UAiSIbjPv6+AarDjxfO8=
X-Google-Smtp-Source: AGRyM1uvIepe057APB3TuAhmac9y3A4U1hpvjebwYjDd4ohr9l4/IU2NFiiWIOjaP2UbcREEQ72VuQ==
X-Received: by 2002:a05:6870:b148:b0:101:a001:77f with SMTP id
 a8-20020a056870b14800b00101a001077fmr8404049oal.90.1656349777821; 
 Mon, 27 Jun 2022 10:09:37 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05683033d100b0060c237c6355sm1761605ott.71.2022.06.27.10.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 10:09:37 -0700 (PDT)
Message-ID: <f1b0dace-8876-7654-41cb-fa068c4dfed1@gmail.com>
Date: Mon, 27 Jun 2022 14:09:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/12] ppc/pnv: add PHB3 bus init helper
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, fbarrat@linux.ibm.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-2-danielhb413@gmail.com>
 <9e8671ea-1d13-5df1-64e5-1d28cab0ac80@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <9e8671ea-1d13-5df1-64e5-1d28cab0ac80@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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



On 6/24/22 10:44, Cédric Le Goater wrote:
> (Adding people who could help making the right change)
> 
> On 6/24/22 10:49, Daniel Henrique Barboza wrote:
>> The PnvPHB3 bus init consists of initializing the pci_io and pci_mmio
>> regions, registering it via pci_register_root_bus() and then setup the
>> iommu.
>>
>> We'll want to init the bus from outside pnv_phb3.c when the bus is
>> removed from the PnvPHB3 device and put into a new parent PnvPHB device.
>> The new pnv_phb3_bus_init() helper will be used by the parent to init
>> the bus when using the PHB3 backend.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/pci-host/pnv_phb3.c         | 39 ++++++++++++++++++++--------------
>>   include/hw/pci-host/pnv_phb3.h |  1 +
>>   2 files changed, 24 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
>> index d58d3c1701..058cbab555 100644
>> --- a/hw/pci-host/pnv_phb3.c
>> +++ b/hw/pci-host/pnv_phb3.c
>> @@ -986,6 +986,28 @@ static void pnv_phb3_instance_init(Object *obj)
>>   }
>> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb)
>> +{
>> +    PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>> +
>> +    /*
>> +     * PHB3 doesn't support IO space. However, qemu gets very upset if
>> +     * we don't have an IO region to anchor IO BARs onto so we just
>> +     * initialize one which we never hook up to anything
>> +     */
>> +    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
>> +    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
>> +                       PCI_MMIO_TOTAL_SIZE);
> 
> 
> Could we change the root port settings with io-reserve=0 to remove
> the IO range ?


I don't think so, and I think this is what the comment right before refers to. Even
with io-reserve=0 I can't remove phb->pci_io. The code breaks in the middle of
the root port realize core code, pci_bridge_initfn(), when trying to create the
bridge windows via

     br->windows = pci_bridge_region_init(br);

There's no verification of io-reserve value (via res_reserve.io) influencing the
init of those regions. What I can see related to io-reserve, for example, is this
piece of code from gen_rp_realize() in gen_pcie_root_port.c:


     if (!grp->res_reserve.io) {
         pci_word_test_and_clear_mask(d->wmask + PCI_COMMAND,
                                      PCI_COMMAND_IO);
         d->wmask[PCI_IO_BASE] = 0;
         d->wmask[PCI_IO_LIMIT] = 0;
     }

Of course that this piece of code does nothing to avoid the segfault described
below.


I think this might be worth a investigation later on as a follow up. For now
I'd like to focus on pnv-phb changes (including the user created support)
before the freeze.


Thanks,


Daniel

> 
> 
> Thanks,
> 
> C.
> 
> 
> 
>> +    pci->bus = pci_register_root_bus(dev,
>> +                                     dev->id ? dev->id : NULL,
>> +                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
>> +                                     &phb->pci_mmio, &phb->pci_io,
>> +                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
>> +
>> +    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>> +}
>> +
>>   static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>   {
>>       PnvPHB3 *phb = PNV_PHB3(dev);
>> @@ -1035,22 +1057,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>>       memory_region_init_io(&phb->mr_regs, OBJECT(phb), &pnv_phb3_reg_ops, phb,
>>                             "phb3-regs", 0x1000);
>> -    /*
>> -     * PHB3 doesn't support IO space. However, qemu gets very upset if
>> -     * we don't have an IO region to anchor IO BARs onto so we just
>> -     * initialize one which we never hook up to anything
>> -     */
>> -    memory_region_init(&phb->pci_io, OBJECT(phb), "pci-io", 0x10000);
>> -    memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
>> -                       PCI_MMIO_TOTAL_SIZE);
>> -
>> -    pci->bus = pci_register_root_bus(dev,
>> -                                     dev->id ? dev->id : NULL,
>> -                                     pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
>> -                                     &phb->pci_mmio, &phb->pci_io,
>> -                                     0, 4, TYPE_PNV_PHB3_ROOT_BUS);
>> -
>> -    pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>> +    pnv_phb3_bus_init(dev, phb);
>>       pnv_phb_attach_root_port(pci, TYPE_PNV_PHB3_ROOT_PORT,
>>                                phb->phb_id, phb->chip_id);
>> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
>> index af6ec83cf6..1375f18fc1 100644
>> --- a/include/hw/pci-host/pnv_phb3.h
>> +++ b/include/hw/pci-host/pnv_phb3.h
>> @@ -164,5 +164,6 @@ uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
>>   void pnv_phb3_reg_write(void *opaque, hwaddr off, uint64_t val, unsigned size);
>>   void pnv_phb3_update_regions(PnvPHB3 *phb);
>>   void pnv_phb3_remap_irqs(PnvPHB3 *phb);
>> +void pnv_phb3_bus_init(DeviceState *dev, PnvPHB3 *phb);
>>   #endif /* PCI_HOST_PNV_PHB3_H */
> 

