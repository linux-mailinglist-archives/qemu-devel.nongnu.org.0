Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D43551143
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:17:35 +0200 (CEST)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3BfC-0003nq-Pk
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BYq-0004oB-6G; Mon, 20 Jun 2022 03:11:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BYn-0007dD-EL; Mon, 20 Jun 2022 03:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDCDtTYAR3HGpH8dDi6CchK0q/fpoc6D2cHWlf0tQic=; b=ouCmtTFFN24McajADXRPn/fgoL
 ojBZzphteWAbbRUZlEePU9YJUIMAT4rsO1iQk322N0swiY7b/CN9pM00RQRikha67/HlPnrw/nA6c
 qIsX2qaUqoGwQ0IuEmBoGPBVl9N/RcsyoRig8RJCoE/Pj12Tftso3OZhsfJKTm8VUt1Xs4s+54ADY
 HYXdIF4RPMjUwQngvFtJkNTP/PdjlUAS+MzRQWJ4rtbTiSXbT1IhssQAbP0B5mWCZa4zBeFx/Irpy
 2EpHkHND5hngZgC0QxY6/2zjrLHA6JCH2+DTG/Va1RWnZChwP+1E2Bx/wgx71kVJSTAZBAnhcSOUS
 Jh5Rm+hvE6TQ6/PScNg6w20GsE8RuqzsPzNBlLeb02UIA407zQ6pqpDyozUjz6iYSoEVfJM33QxKs
 vdyFB1fHy1/o7sExx3e5JF22VbJ9FZJIP/ZcEfLKqKmX6OWKtExWYiQE9RTb4LkvOdnTAV667LHXx
 vnPLZYWajLTXRyvsO6zqnZ+Ei8T2aiGTaOao48z464bi9kHDL1jMFBfPPhDUu5m3B32kMXbP8BPJG
 Qe0AC1BFyPH/m3aul+mR4BeeaVciCIn7P8ImY8RjzZJz1Gr00hifdfX7w7arWMID5AVFHmlYDGCs4
 1mSgPujpVWL8TK2KB7FaoxTwxF5W47WFRmeYnElDw=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3BXW-00084r-EF; Mon, 20 Jun 2022 08:09:42 +0100
Message-ID: <9175c24f-e026-3fcd-5a0e-4861d9668a62@ilande.co.uk>
Date: Mon, 20 Jun 2022 08:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: B <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
References: <20220612192800.40813-1-shentey@gmail.com>
 <14F9EAAB-1FF2-4718-BA5B-9F5971099C94@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <14F9EAAB-1FF2-4718-BA5B-9F5971099C94@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] hw/pci-host/i440fx: Remove unused parameter from
 i440fx_init()
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

On 19/06/2022 22:44, B wrote:

> Am 12. Juni 2022 19:28:00 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> pi440fx_state is an out-parameter which is never read by the caller.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> 
> Ping
> 
>> ---
>> hw/i386/pc_piix.c            | 3 ---
>> hw/pci-host/i440fx.c         | 4 +---
>> include/hw/pci-host/i440fx.h | 1 -
>> 3 files changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 0fc2361ffe..a234989ac3 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -82,7 +82,6 @@ static void pc_init1(MachineState *machine,
>>      MemoryRegion *system_io = get_system_io();
>>      PCIBus *pci_bus;
>>      ISABus *isa_bus;
>> -    PCII440FXState *i440fx_state;
>>      int piix3_devfn = -1;
>>      qemu_irq smi_irq;
>>      GSIState *gsi_state;
>> @@ -203,7 +202,6 @@ static void pc_init1(MachineState *machine,
>>
>>          pci_bus = i440fx_init(host_type,
>>                                pci_type,
>> -                              &i440fx_state,
>>                                system_memory, system_io, machine->ram_size,
>>                                x86ms->below_4g_mem_size,
>>                                x86ms->above_4g_mem_size,
>> @@ -217,7 +215,6 @@ static void pc_init1(MachineState *machine,
>>          isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
>>      } else {
>>          pci_bus = NULL;
>> -        i440fx_state = NULL;
>>          isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
>>                                &error_abort);
>>          pcms->hpet_enabled = false;
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index e08716142b..1c5ad5f918 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -238,7 +238,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>> }
>>
>> PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> -                    PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>>                      ram_addr_t ram_size,
>> @@ -264,8 +263,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>
>>      d = pci_create_simple(b, 0, pci_type);
>> -    *pi440fx_state = I440FX_PCI_DEVICE(d);
>> -    f = *pi440fx_state;
>> +    f = I440FX_PCI_DEVICE(d);
>>      f->system_memory = address_space_mem;
>>      f->pci_address_space = pci_address_space;
>>      f->ram_memory = ram_memory;
>> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
>> index f068aaba8f..52518dbf08 100644
>> --- a/include/hw/pci-host/i440fx.h
>> +++ b/include/hw/pci-host/i440fx.h
>> @@ -36,7 +36,6 @@ struct PCII440FXState {
>> #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>>
>> PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> -                    PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>>                      ram_addr_t ram_size,

Looks good to me, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

In fact that whole i440fx_init() function looks like it's another candidate for 
QOM-ification...


ATB,

Mark.

