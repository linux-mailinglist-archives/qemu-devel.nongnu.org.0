Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE06AD8DB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 09:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSP7-0003Ql-OA; Tue, 07 Mar 2023 03:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSP5-0003PN-Dt; Tue, 07 Mar 2023 03:10:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSP3-00072W-4B; Tue, 07 Mar 2023 03:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u/rH1kjuoInaWrwjDvGyeZGeeieL7P6bfA8bjkOoHlw=; b=bfOv0JRcSvxdTkhVUiaUn08DeR
 KDxjTx8Dx4qrsR4R6Fx6v2xSPsSzT1+4xy1pFSXOaug6dZbpTlWMTqaMa2Nvzz87c7GnU+ljUgaJZ
 Is9xxHpYuG1YsDbzQZLTl9Hi9IWrT6NEjTVNFBOMocy62hlwefUmHw7pMvkJgfzZw+q2WlcIjQsvl
 XsjQnCU3lbn0ueg6NckcnPI4sfrobsH1mgp4JV1+uoQgNePkOzfzGmQOs9q+5HitWcjKGDECb2cqT
 DivzIvS6hpzhl0v7ymuLLmLvgOHefsmqg3nmeeJE8m4UKS6cNaq7vn4QhpE7QzN/IkPQEOfA3dKAb
 RWS0NwpamS+ST+McSIMEzGZcXvGqrLUMtFx9k0lb3OUKyGWUDejrWyBlnzfLYLhOqQvcgL+4msyTq
 iDbPwdvEknXpoOXWhEXT2is8arDeRbeXHOjNeLSRS/c8CkEmAdn15NbWOzKdHjMEbPoSbrBG0vCIt
 +XOoVpjV36c92aP/XtbUEOHFBAy3YLLXdQ3htDn3KycPzLya47Vi22sPclxcJS9A8yQbQoUQFotPO
 hC98MPThcXhsg+RlvKmMbvqvQpxDhpxlryOisFzG9ipIXH5Ob4jn2xBa6H1YEJxYfiv4xfq274xg7
 foIn5q4oscQLfHDrwILyTSrocNCuSvKADAOfb+m24=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSOJ-0004KA-R1; Tue, 07 Mar 2023 08:09:51 +0000
Message-ID: <64b06dd7-4dbe-5f5b-3808-34acbf64b354@ilande.co.uk>
Date: Tue, 7 Mar 2023 08:10:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
 <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
 <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/03/2023 00:20, BALATON Zoltan wrote:

> On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
>> On 06/03/2023 12:33, BALATON Zoltan wrote:
>>> The real VIA south bridges implement a PCI IRQ router which is configured
>>> by the BIOS or the OS. In order to respect these configurations, QEMU
>>> needs to implement it as well. The real chip may allow routing IRQs from
>>> internal functions independently of PCI interrupts but since guests
>>> usually configute it to a single shared interrupt we don't model that
>>> here for simplicity.
>>>
>>> Note: The implementation was taken from piix4_set_irq() in hw/isa/piix4.
>>>
>>> Suggested-by: Bernhard Beschow <shentey@gmail.com>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
>>> ---
>>>   hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 42 insertions(+)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 8900d87f59..3383ab7e2d 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -600,6 +600,46 @@ void via_isa_set_irq(PCIDevice *d, int n, int level)
>>>       qemu_set_irq(s->isa_irqs_in[n], level);
>>>   }
>>>   +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
>>> +{
>>> +    switch (irq_num) {
>>> +    case 0:
>>> +        return s->dev.config[0x55] >> 4;
>>> +    case 1:
>>> +        return s->dev.config[0x56] & 0xf;
>>> +    case 2:
>>> +        return s->dev.config[0x56] >> 4;
>>> +    case 3:
>>> +        return s->dev.config[0x57] >> 4;
>>> +    }
>>> +    return 0;
>>> +}
>>> +
>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int level)
>>> +{
>>> +    ViaISAState *s = opaque;
>>> +    PCIBus *bus = pci_get_bus(&s->dev);
>>> +    int i, pic_level, pic_irq = via_isa_get_pci_irq(s, irq_num);
>>> +
>>> +    /* IRQ 0: disabled, IRQ 2,8,13: reserved */
>>> +    if (!pic_irq) {
>>> +        return;
>>> +    }
>>> +    if (unlikely(pic_irq == 2 || pic_irq == 8 || pic_irq == 13)) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid ISA IRQ routing");
>>> +    }
>>> +
>>> +    /* The pic level is the logical OR of all the PCI irqs mapped to it. */
>>> +    pic_level = 0;
>>> +    for (i = 0; i < PCI_NUM_PINS; i++) {
>>> +        if (pic_irq == via_isa_get_pci_irq(s, i)) {
>>> +            pic_level |= pci_bus_get_irq_level(bus, i);
>>> +        }
>>> +    }
>>> +    /* Now we change the pic irq level according to the via irq mappings. */
>>> +    qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
>>> +}
>>> +
>>>   static void via_isa_realize(PCIDevice *d, Error **errp)
>>>   {
>>>       ViaISAState *s = VIA_ISA(d);
>>> @@ -620,6 +660,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>>>       i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>>       i8257_dma_init(isa_bus, 0);
>>>   +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq", PCI_NUM_PINS);
>>> +
>>>       /* RTC */
>>>       qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
>>>       if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>>
>> Writing my previous response where I asked about the additional PCI interrupt 
>> connections to the MV64361, I realised that if you forget about the Northbridge 
>> component for a moment then things start to make a bit more sense.
>>
>> At the moment we have 3 different scenarios:
>>
>>   1) ISA IRQ -> 8259 for all ISA devices
>>
>>   2) ISA IRQ -> 8259 *OR*
>>      PCI IRQ -> PCI IRQ router -> 8259 for the PCI-IDE device
>>
>>   3) PCI IRQ -> PCI IRQ router -> 8259 for PCI devices
>>
>> When you look at it this way it is easy to see for case 3 that the PCI IRQ routing 
>> mechanism is handled by *_set_irq() and *_map_irq() callbacks. And so with that in 
>> mind, re-reading the VIA datasheet I came up with the following PoC for discussion: 
>> https://github.com/mcayland/qemu/commits/via-poc.
> 
> At first glance this is basically what I had in v1 of this series just using PCI 
> function numbers instead of an enum to find the IRQ source.

I can see the similarity however the difference here is that the PCI routing is done 
using the existing PCI routing functions in QEMU, rather than requiring an external 
function call specific to VIA devices.

>> It needs a bit of work, but at first glance it ticks all the boxes in that the PCI 
>> bus IRQs are all internal to the VIA southbridge (no global via_isa_set_irq() 
>> function and no overriding of PCI bus IRQs), there are separate legacy and PCI IRQs 
>> for the via-ide device, and the PCI IRQ routing bears at least a passing 
>> resemblance to the datasheet.
> 
> Given that we only have a few hours left until the freeze I hope you're not proposing 
> to drop this series and postpone all this to the next release, only that we do this 
> clean up in the next devel cycle. You were away when this series were on the list for 
> review so this is a bit late now for a big rewrite. (Especially that what you propose 
> is a variant of the original I've submitted that I had to change due to other review 
> comments.)
> 
> Since this version was tested and works please accept this for QEMU 8.0 now then we 
> can work out your idea in the next devel cycle but until then this version allows 
> people to run AmigaOS on pegasos2 with sound which is the goal I want to achieve for 
> QEMU 8.0 and does not introduce any change to via-ide which was good enough for the 
> last two years so it should be good enough for a few more months.

My understanding from the thread was that testing shows there are still hangs when 
using sound/USB/IDE simultaneously with this series, no? Or has that now been fixed?

I completely understand it can be frustrating not getting patches merged, but often 
as developers on less popular machines it can take a long time. My perspective here 
is that both you and Bernhard have out-of-tree patches for using the VIA 
southbridges, and during review Bernhard has raised legitimate review questions based 
upon his experience.

To me it makes sense to resolve these outstanding issues first to provide a solution 
that works for everyone, rather than pushing to merge a series that still has 
reliability issues and where there is lack of consensus between developers. The worst 
case scenario to me is that these patches get merged, people report that QEMU is 
unreliable for AmigaOS, and then we end up repeating this entire process yet again 
several months down the line when Bernhard submits his series for upstream.


ATB,

Mark.

