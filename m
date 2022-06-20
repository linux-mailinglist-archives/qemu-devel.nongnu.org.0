Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5848551131
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:15:39 +0200 (CEST)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3BdK-0001QW-Q8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BaW-0006sj-Ki
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:12:44 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BaT-0007r4-IL
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b6s5cdgFwBdQ31RgLw8CeAtflbp1GgdfDiR86jVSUS0=; b=DtyXl4dfoQuUqXMCvgmWwGFjh7
 Gv8WKakt2U30PjbAr2pni7OAgujPPZo2ODGX2FveMB3MzQSOPiZVWqgZFGQ7L9gN1FlEvCkt3CPYs
 Ge12VLiRk8nXOlgR1G+7zCKHzJa6fU6anUZdbwQxORAyLkM30JyAbkmJg95oEKe4hbm2HPvWi3ATk
 N+7dphfzqV73Sc1xTWV/LbSVmEGpQwoy9ixFY8W8+1MXxSf4B7sEcmcPfNlCajgJssAOrSAG7Gb/3
 pYewLjWVngNMr5TPJ6RqcMObFvANra/bdrEGTx1P21rQ4Cc63Ipv+6stXs5SZnH+l0LZv2iREg80I
 X6ZU7sAkOoD/6gy0ivXCoOgZMqwimiEgj3wpTan9sZjlIHB8Gn1ATriR7cZeUZSsyA1rTPwx1En9j
 sso/4i4/RTHVh2dvzgZR56HimXMUv36zrU2a4Q5t4lO0u3bP0UIwobc/hPp9tCdwY53JPROne/6TR
 d41dTvEsBAzOxX9g1gBIcVrU1bGlYzWLBxbyMErip06/vjDyHavr96Tow3ncQptLR0LZQScE/qkST
 BTdjw99n9ZG8NXhYjP9g6U2iopIBBmCCIEa7wrDBTZLU13+yGz4peyKcuoj+gMRVcZxfoRTNt1s2e
 zkn96sfdGpi0dgpoe5vm+WIgJ+8fOHYp6NCyLATI8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BZD-00085o-HZ; Mon, 20 Jun 2022 08:11:27 +0100
Message-ID: <7be04e62-2f9a-e05f-e5f6-9e40ae00a924@ilande.co.uk>
Date: Mon, 20 Jun 2022 08:12:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-3-joao.m.martins@oracle.com>
 <20220616152151.42d6140a@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220616152151.42d6140a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 2/5] i386/pc: create pci-host qdev prior to
 pc_memory_init()
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

On 16/06/2022 14:21, Reviewed-by: Igor Mammedov wrote:

> On Fri, 20 May 2022 11:45:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> At the start of pc_memory_init() we usually pass a range of
>> 0..UINT64_MAX as pci_memory, when really its 2G (i440fx) or
>> 32G (q35). To get the real user value, we need to get pci-host
>> passed property for default pci_hole64_size. Thus to get that,
>> create the qdev prior to memory init to better make estimations
>> on max used/phys addr.
>>
>> This is in preparation to determine that host-phys-bits are
>> enough and also for pci-hole64-size to be considered to relocate
>> ram-above-4g to be at 1T (on AMD platforms).
> 
> with comments below fixed
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>   
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/i386/pc_piix.c            | 5 ++++-
>>   hw/i386/pc_q35.c             | 6 +++---
>>   hw/pci-host/i440fx.c         | 3 +--
>>   include/hw/pci-host/i440fx.h | 2 +-
>>   4 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 578e537b3525..12d4a279c793 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>>       MemoryRegion *pci_memory;
>>       MemoryRegion *rom_memory;
>>       ram_addr_t lowmem;
>> +    DeviceState *i440fx_dev;
>>   
>>       /*
>>        * Calculate ram split, for memory below and above 4G.  It's a bit
>> @@ -164,9 +165,11 @@ static void pc_init1(MachineState *machine,
>>           pci_memory = g_new(MemoryRegion, 1);
>>           memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>>           rom_memory = pci_memory;
>> +        i440fx_dev = qdev_new(host_type);
>>       } else {
>>           pci_memory = NULL;
>>           rom_memory = system_memory;
>> +        i440fx_dev = NULL;
>>       }
>>   
>>       pc_guest_info_init(pcms);
>> @@ -199,7 +202,7 @@ static void pc_init1(MachineState *machine,
>>   
>>           pci_bus = i440fx_init(host_type,
>>                                 pci_type,
>> -                              &i440fx_state,
>> +                              i440fx_dev, &i440fx_state,
> confusing names, suggest to rename i440fx_state -> pci_i440fx and i440fx_dev -> i440fx_host
> or something like this

It might be worth considering this series on top of Bernhard's patch here: 
https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02206.html.

>>                                 system_memory, system_io, machine->ram_size,
>>                                 x86ms->below_4g_mem_size,
>>                                 x86ms->above_4g_mem_size,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 42eb8b97079a..8d867bdb274a 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -203,12 +203,12 @@ static void pc_q35_init(MachineState *machine)
>>                               pcms->smbios_entry_point_type);
>>       }
>>   
>> -    /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> -
>>       /* create pci host bus */
>>       q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>   
>> +    /* allocate ram and load rom/bios */
>> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> +
>>       object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>>                                OBJECT(ram_memory), NULL);
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index e08716142b6e..5c1bab5c58ed 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -238,6 +238,7 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>>   }
>>   
>>   PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> 
> does it still need 'host_type'?
> 
>> +                    DeviceState *dev,
>>                       PCII440FXState **pi440fx_state,
>>                       MemoryRegion *address_space_mem,
>>                       MemoryRegion *address_space_io,
>> @@ -247,7 +248,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                       MemoryRegion *pci_address_space,
>>                       MemoryRegion *ram_memory)
>>   {
>> -    DeviceState *dev;
>>       PCIBus *b;
>>       PCIDevice *d;
>>       PCIHostState *s;
>> @@ -255,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>       unsigned i;
>>       I440FXState *i440fx;
>>   
>> -    dev = qdev_new(host_type);
>>       s = PCI_HOST_BRIDGE(dev);
>>       b = pci_root_bus_new(dev, NULL, pci_address_space,
>>                            address_space_io, 0, TYPE_PCI_BUS);
>> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
>> index f068aaba8fda..c4710445e30a 100644
>> --- a/include/hw/pci-host/i440fx.h
>> +++ b/include/hw/pci-host/i440fx.h
>> @@ -36,7 +36,7 @@ struct PCII440FXState {
>>   #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>>   
>>   PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> -                    PCII440FXState **pi440fx_state,
>> +                    DeviceState *dev, PCII440FXState **pi440fx_state,
>>                       MemoryRegion *address_space_mem,
>>                       MemoryRegion *address_space_io,
>>                       ram_addr_t ram_size,


ATB,

Mark.

