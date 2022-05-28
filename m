Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D4A536C31
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:58:53 +0200 (CEST)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nutDg-0005tt-00
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusyY-0000qp-V2; Sat, 28 May 2022 05:43:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusyW-0006ra-TZ; Sat, 28 May 2022 05:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+SNs0J7EW/hoGDF73K/3k6PNyuddyBwP0w0KZ3E1iAk=; b=MAFbztAyYeQersY3Aq9+3TXVGR
 +sul0R4JsOy1gnkef+SuNSd7CtPaJjzR/SBKk8jxHtTLMwFjLzJCHV8b20EUvptAVhhYJE3s4lgbs
 mAvOk/8Ednvg6gWTKpICn80HeUDExDVAN3x55LUtqVGKEC9LxvDZT/ogXhzsD682uuQPF8LIVIpZM
 ZkFLQYtOx3rMrO05eZn0rF1Sx3X7f8udLdgX8sumr1/+xlYzbPS3sSBYR6PPWoQktOKoUxq1bL1Sc
 JA/AZ0P8tVCVxiNR+js/X0C97x1HbLWmB32B7QhSOsYxpTOckG/ZrA43fpJSxxi0r8jj4Ai50EDmN
 P0UiL3ZLlrZmhL64eRKg35qlLS7xK+wJgOsOyH/jeIL6zDdG92xycMzNglx9H0EZJCv+aZ4+Cl6F4
 fAmvvzZEfCf0CcB/2luiC0Yl0N3Qd+XkvGDm/nBHG8fTDRur2deVG2LKFpxedIwsg5VDhwdfUmMEE
 HvMhBTudogxkIx9CciyvwNfZywO/SzPeOpg3ZVW+VRYfwt3Ex5m9WnwpTwvo6GuwoIirUIwa7z7Gs
 hsQdV3Q2YLQqZdHQwTtRbsxhPwtu55i1UnwIhY697idPnczg8918JTNe9oZtQURSjD6Tuf0KMxQ/B
 8CVp5/yYqX6FY4F/yzyEd186t+oKgjLNbBQ3REhNg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusxU-0003Vh-Fm; Sat, 28 May 2022 10:42:08 +0100
Message-ID: <bdcb5d35-6e4a-a6b9-6faf-c8bc9f6c3260@ilande.co.uk>
Date: Sat, 28 May 2022 10:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220522212431.14598-1-shentey@gmail.com>
 <20220522212431.14598-6-shentey@gmail.com>
 <a1f2e759-0e2c-df44-4a1b-eb2c6429298a@ilande.co.uk>
In-Reply-To: <a1f2e759-0e2c-df44-4a1b-eb2c6429298a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 5/6] hw/isa/piix4: QOM'ify PIIX4 PM creation
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

On 25/05/2022 19:09, Mark Cave-Ayland wrote:

> On 22/05/2022 22:24, Bernhard Beschow wrote:
> 
>> Just like the real hardware, create the PIIX4 ACPI controller as part of
>> the PIIX4 southbridge. This also mirrors how the IDE and USB functions
>> are already created.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/isa/piix4.c                | 14 +++++++-------
>>   hw/mips/malta.c               |  3 ++-
>>   include/hw/southbridge/piix.h |  2 +-
>>   3 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index 4968c69da9..1645f63450 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -206,6 +206,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>>       PIIX4State *s = PIIX4_PCI_DEVICE(dev);
>>       PCIDevice *pci;
>>       PCIBus *pci_bus = pci_get_bus(dev);
>> +    I2CBus *smbus;
>>       ISABus *isa_bus;
>>       qemu_irq *i8259_out_irq;
>> @@ -252,6 +253,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>>       /* USB */
>>       pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
>> +    /* ACPI controller */
>> +    smbus = piix4_pm_init(pci_bus, pci->devfn + 3, 0x1100, s->isa[9],
>> +                          NULL, 0, NULL);
>> +    object_property_add_const_link(OBJECT(s), "smbus", OBJECT(smbus));
>> +
> 
> Interesting hack here to expose the smbus so it is available to qdev_get_child_bus(), 
> but really this is still really working around the fact that piix4_pm_init() itself 
> should be removed first. Once that is done, you can then use a standard QOM pattern 
> to initialise the "internal" PCI devices via object_initialize_child() and realize 
> them in piix4_realize() instead of using pci_create_simple().
> 
> Is that something you could take a look at? If not, I may be able to put something 
> together towards the end of the week. Other than that I think the rest of the series 
> looks good.

Hi Bernhard,

I've just sent through the series for eliminating the piix4_pm_init() which should 
allow you to improve the QOMifcation done as part of this series.

A bit of background as to why this is necessary: when building a container device 
such as the PIIX southbridge, there should still be 2 distinct init and realize 
phases. In effect this needs to be done depth-first so when you init the PIIX4 
southbridge, the instance init function should also init the contained PCI devices 
such as IDE and USB. Similarly when the PIIX4 device is realized, its realize 
function should then realize the contained PCI devices using qdev_realize().

This is one of the main reasons why legacy global device init functions aren't 
recommended, since they both init *and* realize the device before returning it which 
immediately breaks this contract.

The normal way to initialise a contained device is to use object_initialize_child() 
in the container's instance init function and to store the the child device instance 
within the container. But what this also means is that you shouldn't use any _new() 
functions like pci_new() or pci_create_simple() to instantiated contained devices in 
a container realize function either. So the next question: how is this done?

Fortunately there is an existing example of this: take a look at how this is 
currently done in hw/pci-host/q35.c's q35_host_initfn() and q35_host_realize() for 
the MCH_PCI_DEVICE device.

I hope this gives you all the information you need to produce a v3 of the series: if 
you have any further questions, do let me know and I will do my best to answer them.

>>       pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
>>   }
>> @@ -301,7 +307,7 @@ static void piix4_register_types(void)
>>   type_init(piix4_register_types)
>> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>> +DeviceState *piix4_create(PCIBus *pci_bus)
>>   {
>>       PCIDevice *pci;
>>       DeviceState *dev;
>> @@ -311,11 +317,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>>                                             TYPE_PIIX4_PCI_DEVICE);
>>       dev = DEVICE(pci);
>> -    if (smbus) {
>> -        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>> -                               qdev_get_gpio_in_named(dev, "isa", 9),
>> -                               NULL, 0, NULL);
>> -    }
>> -
>>       return dev;
>>   }
>> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>> index e446b25ad0..b0fc84ccbb 100644
>> --- a/hw/mips/malta.c
>> +++ b/hw/mips/malta.c
>> @@ -1399,8 +1399,9 @@ void mips_malta_init(MachineState *machine)
>>       empty_slot_init("GT64120", 0, 0x20000000);
>>       /* Southbridge */
>> -    dev = piix4_create(pci_bus, &smbus);
>> +    dev = piix4_create(pci_bus);
>>       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>> +    smbus = I2C_BUS(qdev_get_child_bus(dev, "smbus"));
>>       /* Interrupt controller */
>>       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>> index 0bec7f8ca3..2c21359efa 100644
>> --- a/include/hw/southbridge/piix.h
>> +++ b/include/hw/southbridge/piix.h
>> @@ -76,6 +76,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>>   PIIX3State *piix3_create(PCIBus *pci_bus);
>> -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
>> +DeviceState *piix4_create(PCIBus *pci_bus);
>>   #endif


ATB,

Mark.

