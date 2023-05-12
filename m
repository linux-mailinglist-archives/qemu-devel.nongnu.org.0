Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85EE70025E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 10:17:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxNwP-0000BJ-GG; Fri, 12 May 2023 04:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxNwH-0000Au-Hm
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:15:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxNwE-0006pP-TZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 04:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MknOdaJ7d0W+TcrHt6dN+psMCTS7c+KnaTbgKh6JJHw=; b=XJplBaPO3tOYMna5lJQMOg52/9
 vXT+wPvzc5atagLUXm4zEM2ckMnvf8VTf8iWs9PLSiCJDPDHVMuTLsPcQMO/x5/qQgOH4nLJhbToL
 dBjslnzgp8P4EJ66zJdGroDeBgimXbnLiivVPw+c02PS1/RABVs5i5+fOGvamLNppHHXjvQkXjfDJ
 sROBBqN9AxBODOJ/RqMQ1d1yuVqZBBQEUg3B5qZbLYA+lch8cKM8IN5qnGYjls06d02kBpGt+lwMD
 V+Z/7gkENc8118xI49RrcSZSR6p6gcj7D0xjXhum9NWTnWa7tbEvp/IBTRsuKTRyNxf2BXdfPdEsy
 8t+qchK6HZzVngnmlIeDCXeWKiLBCoW/y2TSZpq6q+N3vakP1YLzz77Dm10HfA9FZEwYdih7JLe5N
 JHPykzAinTD963nHi3clLY4xoNjCjTXTiA5+FZJp6JHsLLzfVvIrjIxLP6ZFPYmB7TbkHuxBcNxD8
 1Jp23iNa4B9N80pspBu/SY6oJ6BTVTSGIzMxqSy73Se84TQRfouEeMh4DRvWpeHgVMw+k9T/50Efy
 JKvo5VwCEfbdcjBTQ3BBAqc69GH6aNW6NlOhRlO5ddygvzMUT1KGRK9sVidb6tnyUwODCcKTaARZZ
 9pvRAlWefHzHcUS8u3Om3m79yo+zVvR6bq+APZhVo=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pxNv6-0007dr-PM; Fri, 12 May 2023 09:14:36 +0100
Message-ID: <335269d0-3720-654e-7e6a-5e71f969d458@ilande.co.uk>
Date: Fri, 12 May 2023 09:15:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20230511085731.171565-1-mark.cave-ayland@ilande.co.uk>
 <20230511085731.171565-4-mark.cave-ayland@ilande.co.uk>
 <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
Content-Language: en-US
In-Reply-To: <C77CADEE-2FB5-4928-A9F2-8ECD2643CFF2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 03/18] hw/pci: use PCIDevice gpio for device IRQ
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/05/2023 22:44, Bernhard Beschow wrote:

> Am 11. Mai 2023 08:57:16 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> Change pci_set_irq() to call qemu_set_irq() on the PCI device IRQ rather than
>> calling PCI bus IRQ handler function directly. In order to preserve the
>> existing behaviour update pci_qdev_realize() so that it automatically connects
>> the PCI device IRQ to the PCI bus IRQ handler.
>>
>> Finally add a "QEMU interface" description documenting the new PCI device IRQ
>> gpio next to the declaration of TYPE_PCI_DEVICE.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> hw/pci/pci.c | 12 ++++++++++--
>> 1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 9471f996a7..3da1481eb5 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -1680,8 +1680,7 @@ qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
>>
>> void pci_set_irq(PCIDevice *pci_dev, int level)
>> {
>> -    int intx = pci_intx(pci_dev);
>> -    pci_irq_handler(pci_dev, intx, level);
>> +    qemu_set_irq(pci_dev->irq, level);
>> }
>>
>> /* Special hooks used by device assignment */
>> @@ -2193,6 +2192,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
>>      pci_set_power(pci_dev, true);
>>
>>      pci_dev->msi_trigger = pci_msi_trigger;
>> +
>> +    /* Connect device IRQ to bus */
>> +    qdev_connect_gpio_out(DEVICE(pci_dev), 0,
>> +                          pci_get_bus(pci_dev)->irq_in[pci_dev->devfn]);
> 
> I think this is confusing a few things. In my understanding -- unlike ISA -- PCI considers interrupt lanes only for PCI slots but not for buses. So for example each PCI slot could have its own direct connections (up to four, intA..intD) to the interrupt controller. IOW interrupt lanes and PCI buses are unrelated, thus PCIBus shouldn't really have IRQs.

That's definitely true: the restriction here is caused by the fact that QEMU's PCI 
IRQ routing is already deeply integrated into the PCIBus object. This is visible by 
the fact that pci_bus_map_irqs() is used to set the IRQ swizzling for each PCIBus so 
I don't see there is a way to untangle without a massive redesign of the PCI buses in 
QEMU, which is certainly outside the scope of this series.

> Moreover, in case the interrupt lines are shared between multiple PCI slots, a usual pattern is to swizzle these lines such that the intAs from the slots don't all occupy just one IRQ line. That means that depending on the slot the device is plugged into a different lane is triggered. Above code, however, would always trigger the same line and wouldn't even allow for modeling the swizzeling.
> 
> Also, above code would cause out of bounds array accesses if a PCI device had more functions than there are on "the bus":
> For example, consider PIIX which has four PIRQs, so ARRAY_SIZE(irq_fn) == 4, right? devfn can be up to 8 according to the PCI spec which would cause an out if bounds array access above.

Another restriction on the current QEMU design of PCI devices is that there is an 
implicit assumption that there is only one IRQ i.e. it's the current INTX rather than 
representing the 4 separate PIRQ lines. Again this is something that people have 
expressed interest in resolving, but as soon as you get here you end up with the same 
problem above in that you need to revisit the PCI IRQ swizzling code above.

In particular there are some interesting use cases such as SPARC64 sabre whereby we 
use virtual interrupt numbers during IRQ swizzling because we lose the PCIDevice of 
the originating device as the IRQ propagates upwards through PCI bridges. So that 
would also need a redesign assuming we move towards a more physical PCI model.

For the moment the PCI input IRQs are stored within PCIBus to ensure the existing 
interrupt code works without having to touch any IRQ swizzling code, and so as the 
current design assumes a single interrupt for each PCIDevice we only need a single 
IRQ for each devfn. That's why there is no overflow of the array, and I can confirm 
the code passed both gitlab CI and a local --enable-sanitizers "make check" without 
introducing any additional failures.

> I think that this commit does actually re-define how PCI buses work in QEMU although the cover letter claims to save this for another day. We should probably not apply the series in its current form.

I hope the above explanation gives a bit more background as to why the series is 
structured in the way it is. In effect it makes no attempt to alter the existing 
PCIBus routing, but starts by considering that PCI devices have their own unique IRQ 
handling using pci_set_irq(). So let's take a baby step which is to convert PCI 
devices to use a standard qdev gpio instead of their own custom PCI IRQ handler, 
which then allows for the possibility of using the standard qdev APIs for PCI IRQ 
routing in future.


ATB,

Mark.

