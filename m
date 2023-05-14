Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CD701D79
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 14:45:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyB5G-0006cS-E5; Sun, 14 May 2023 08:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyB5D-0006a5-LU; Sun, 14 May 2023 08:44:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyB5B-00079z-I5; Sun, 14 May 2023 08:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IFbSke77XRQjuLubbGRNafUSc/FztmEpwhpdzskxLxM=; b=K/hgeKcuXm2B9m1KiboZ4EVp9q
 9yzHNKM3UwtuKBSoR//SGQD3KlwQFE9TK6riscyVNOUzCNwyeNJ97mQ3CR4erM85idifHZbOXKE/z
 F+tHMik3sBZHIOz1sYRlaENh3TcNJLvsbwGOZWwyGGB85vM+2JMSMYCp1sDrh2Q94JC6uFYl4CF63
 X3+DrbsQlrIZM4ULANlu2tZHMyrtvN+OXYGx8DxF0g3tH+2zTyRDeLptEqcA5wS8zOCV24JaNmFoN
 ywxmxRlqhO+3ROz/Mq6d1sjmB4bsiovsGg6visFPJYq9i+6cL5NKWDsxskRueQoT3L9CyZQ0NZgh3
 qRW0l38klDGpWrI8binpSiWztHUNMfwITRgaww+QT83ZWvrSzITZY2sPa8tWcL3ThU7Oxwc5hheR5
 bCKW0khHIzBkmP/ZsJMy+8We9ZWSzHQBYnTmYzKblPD00aTNTodLZtElUQ5zDt7y3O0e+fSMw2g9W
 aUJ88OSFvGlvKSsIj9tV7qOBo26gTHep92GDCq8ZzYAZaKQAkw3gHKxIK5/vhlAmSdj6AgMudEgS5
 2j7BvQwR9JbyHfnpGGuTxfY+g9Q2mJxGdh3b3buyVPNKtx4NtuPojbrqtFNXax2sU67KrUw59EdBJ
 4yVHxi66tvtNUHa6iglGXwiFBnuRfUTLcuZKa87kY=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyB40-0003JU-Ks; Sun, 14 May 2023 13:43:04 +0100
Message-ID: <90754081-36e3-e03f-5293-7c2f94a2054d@ilande.co.uk>
Date: Sun, 14 May 2023 13:43:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-10-shentey@gmail.com>
 <32b3425c-737f-4889-9c87-67cd852032f6@ilande.co.uk>
 <8C48868C-4791-4B96-9C56-D4B4A63492F2@gmail.com>
 <e19d0811-2eac-aad5-2c91-de72d8bae7d6@ilande.co.uk>
 <AC81E372-BC1C-44CC-950A-B4EA8803EDB7@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <AC81E372-BC1C-44CC-950A-B4EA8803EDB7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 09/13] hw/ide/piix: Disuse isa_get_irq()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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

On 13/05/2023 12:53, Bernhard Beschow wrote:

> Am 27. April 2023 12:31:10 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>> On 26/04/2023 19:25, Bernhard Beschow wrote:
>>
>>> Am 26. April 2023 11:33:40 UTC schrieb Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>:
>>>> On 22/04/2023 16:07, Bernhard Beschow wrote:
>>>>
>>>>> isa_get_irq() asks for an ISADevice which piix-ide doesn't provide.
>>>>> Passing a NULL pointer works but causes the isabus global to be used
>>>>> then. By fishing out TYPE_ISA_BUS from the QOM tree it is possible to
>>>>> achieve the same as using isa_get_irq().
>>>>>
>>>>> This is an alternative solution to commit 9405d87be25d 'hw/ide: Fix
>>>>> crash when plugging a piix3-ide device into the x-remote machine' which
>>>>> allows for cleaning up the ISA API while keeping PIIX IDE functions
>>>>> user-createable.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>>     hw/ide/piix.c | 23 ++++++++++++++++++++---
>>>>>     1 file changed, 20 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>>>> index 6942b484f9..a3a15dc7db 100644
>>>>> --- a/hw/ide/piix.c
>>>>> +++ b/hw/ide/piix.c
>>>>> @@ -104,7 +104,8 @@ static void piix_ide_reset(DeviceState *dev)
>>>>>         pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
>>>>>     }
>>>>>     -static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>>>>> +static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, ISABus *isa_bus,
>>>>> +                              Error **errp)
>>>>>     {
>>>>>         static const struct {
>>>>>             int iobase;
>>>>> @@ -124,7 +125,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
>>>>>                              object_get_typename(OBJECT(d)), i);
>>>>>             return false;
>>>>>         }
>>>>> -    ide_bus_init_output_irq(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
>>>>> +    ide_bus_init_output_irq(&d->bus[i],
>>>>> +                            isa_bus_get_irq(isa_bus, port_info[i].isairq));
>>>>
>>>> I don't think is the right solution here, since ultimately we want to move the IRQ routing out of the device itself and into the PCI-ISA bridge. I'd go for the same solution as you've done for VIA IDE in patch 2, i.e. update the PIIX interrupt handler to set the legacy_irqs in PCIIDEState, and then wire them up to the ISA IRQs 14 and 15 similar to as Phil as done in his patches:
>>>
>>> The problem is user-creatable PIIX-IDE. IMO we should stick to our deprecation process before going this step because this will break it.
>>
>> Thomas posted some links from previous discussions where it seems that this hack is still in use:
>>
>> https://lists.nongnu.org/archive/html/qemu-block/2019-07/msg00780.html
>> https://lists.gnu.org/archive/html/qemu-block/2021-04/msg00746.html
>>
>> So it seems we can't even deprecate this, as it's working around missing functionality in q35 :(
>>
>> Certainly it seems that we should add a check that will fail the machine if there is more than one -device piix3-ide on the command line, since I can't see that could ever work properly.
>>
>> I'm leaning towards adding a device property that must be set to enabled in order for PIIX IDE realize() to succeed, leave it disabled by default and only enable it for the q35 machine. Does that seem like a reasonable solution?
> 
> I'd rather declare this to be out of scope of this series. First, this series contains a lot of material already. Second, this patch attempts to preserve current behavior.
> 
> This patch is actually a preparation for the next one. In the next patch the (non-obvious) check for presence of the ISABus get removed so we need this patch to preserve behavior. Otherwise machines without an ISA bus will crash if piix3-ide gets user-created. One machine that would crash is the "remote" machine IIRC.

Hmmm. At the moment we seem to have a circular dependency around all the various IDE 
tidy-up series around :/  If we decide that this series should go first then I prefer 
this solution to Phil's proposal which breaks the contract that 
qdev_connect_gpio_out() should always occur after realize.

Phil, how are things looking for your time re: these IDE changes - are you able to 
spend time looking at them?

Alternatively if you are happy for me to pick up the IDE stuff, pull everything 
together into a series proposal, and then submit the final PR then I'm happy to do 
that too.

> Best regards,
> Bernhard
> 
>>
>>>> https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-4-philmd@linaro.org/
>>>>
>>>> https://patchew.org/QEMU/20230302224058.43315-1-philmd@linaro.org/20230302224058.43315-5-philmd@linaro.org/
>>>>
>>>> This also reminds me, given that the first patch above is doing wiring in pc_init1() then we are still missing part of your tidy-up series :/
>>>>
>>>>>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>>>         ide_bus_register_restart_cb(&d->bus[i]);
>>>>> @@ -136,14 +138,29 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>>>>     {
>>>>>         PCIIDEState *d = PCI_IDE(dev);
>>>>>         uint8_t *pci_conf = dev->config;
>>>>> +    ISABus *isa_bus;
>>>>> +    bool ambiguous;
>>>>>           pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>>>>>           bmdma_init_ops(d, &piix_bmdma_ops);
>>>>>         pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_ops);
>>>>>     +    isa_bus = ISA_BUS(object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous));
>>>>> +    if (ambiguous) {
>>>>> +        error_setg(errp,
>>>>> +                   "More than one ISA bus found while %s supports only one",
>>>>> +                   object_get_typename(OBJECT(d)));
>>>>> +        return;
>>>>> +    }
>>>>> +    if (!isa_bus) {
>>>>> +        error_setg(errp, "No ISA bus found while %s requires one",
>>>>> +                   object_get_typename(OBJECT(d)));
>>>>> +        return;
>>>>> +    }
>>>>
>>>> Again I think this should go away with using PCIIDEState's legacy_irqs, since you simply let the board wire them up to the ISABus (or not) as required.
>>>
>>> Same here: This breaks user-creatable PIIX-IDE.
>>>
>>>>
>>>>>         for (unsigned i = 0; i < 2; i++) {
>>>>> -        if (!pci_piix_init_bus(d, i, errp)) {
>>>>> +        if (!pci_piix_init_bus(d, i, isa_bus, errp)) {
>>>>>                 return;
>>>>>             }
>>>>>         }


ATB,

Mark.


