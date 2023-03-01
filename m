Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C906A760C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTon-0000f6-FH; Wed, 01 Mar 2023 16:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXTol-0000ea-4d; Wed, 01 Mar 2023 16:16:55 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXToi-00030E-Jv; Wed, 01 Mar 2023 16:16:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AF5B57457E7;
 Wed,  1 Mar 2023 22:16:47 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 524F8745720; Wed,  1 Mar 2023 22:16:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4FA6E745706;
 Wed,  1 Mar 2023 22:16:47 +0100 (CET)
Date: Wed, 1 Mar 2023 22:16:47 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <ae970003-6bcf-1e6b-77b0-4c1080d33161@ilande.co.uk>
Message-ID: <fcddc48f-403f-b514-9bd9-50f156096da1@eik.bme.hu>
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
 <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
 <877517F9-2205-413F-A408-72D36B5142EB@gmail.com>
 <bc066c26-e801-12a0-624e-16ce9c21e00c@eik.bme.hu>
 <7368aeee-4d33-6c90-4068-1ba9c2b2c57b@eik.bme.hu>
 <c0b5ad2e-1b69-a570-b3ca-1f31339f1c8f@eik.bme.hu>
 <CAG4p6K7K7SE38EUnQ9Z3pU4bt2-Asd2AOoeivp3F6B-+RujF8A@mail.gmail.com>
 <ae970003-6bcf-1e6b-77b0-4c1080d33161@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-603137836-1677705407=:23145"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-603137836-1677705407=:23145
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Mark Cave-Ayland wrote:
> On 27/02/2023 16:52, Bernhard Beschow wrote:
>> On Mon, Feb 27, 2023 at 1:57 PM BALATON Zoltan <balaton@eik.bme.hu 
>> <mailto:balaton@eik.bme.hu>> wrote:
>>
>>     On Mon, 27 Feb 2023, BALATON Zoltan wrote:
>>      > On Mon, 27 Feb 2023, BALATON Zoltan wrote:
>>      >> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>      >>> Am 26. Februar 2023 23:33:20 UTC schrieb BALATON Zoltan
>>      >>> <balaton@eik.bme.hu <mailto:balaton@eik.bme.hu>>:
>>      >>>> On Sun, 26 Feb 2023, Bernhard Beschow wrote:
>>      >>>>> Am 25. Februar 2023 18:11:49 UTC schrieb BALATON Zoltan
>>      >>>>> <balaton@eik.bme.hu <mailto:balaton@eik.bme.hu>>:
>>      >>>>>> From: Bernhard Beschow <shentey@gmail.com 
>> <mailto:shentey@gmail.com>>
>>      >>>>>>
>>      >>>>>> The real VIA south bridges implement a PCI IRQ router which is
>>      >>>>>> configured
>>      >>>>>> by the BIOS or the OS. In order to respect these 
>> configurations, QEMU
>>      >>>>>> needs to implement it as well.
>>      >>>>>>
>>      >>>>>> Note: The implementation was taken from piix4_set_irq() in
>>      >>>>>> hw/isa/piix4.
>>      >>>>>>
>>      >>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com
>>     <mailto:shentey@gmail.com>>
>>      >>>>>> [balaton: declare gpio inputs instead of changing pci bus irqs 
>> so it
>>      >>>>>> can
>>      >>>>>> be connected in board code; remove some empty lines]
>>      >>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu
>>     <mailto:balaton@eik.bme.hu>>
>>      >>>>>> Tested-by: Rene Engel <ReneEngel80@emailn.de 
>> <mailto:ReneEngel80@emailn.de>>
>>      >>>>>> ---
>>      >>>>>> hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
>>      >>>>>> 1 file changed, 39 insertions(+)
>>      >>>>>>
>>      >>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>      >>>>>> index 3f9bd0c04d..4025f9bcdc 100644
>>      >>>>>> --- a/hw/isa/vt82c686.c
>>      >>>>>> +++ b/hw/isa/vt82c686.c
>>      >>>>>> @@ -604,6 +604,44 @@ static void via_isa_request_i8259_irq(void
>>      >>>>>> *opaque, int irq, int level)
>>      >>>>>>     qemu_set_irq(s->cpu_intr, level);
>>      >>>>>> }
>>      >>>>>>
>>      >>>>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int 
>> irq_num)
>>      >>>>>> +{
>>      >>>>>> +    switch (irq_num) {
>>      >>>>>> +    case 0:
>>      >>>>>> +        return s->dev.config[0x55] >> 4;
>>      >>>>>> +    case 1:
>>      >>>>>> +        return s->dev.config[0x56] & 0xf;
>>      >>>>>> +    case 2:
>>      >>>>>> +        return s->dev.config[0x56] >> 4;
>>      >>>>>> +    case 3:
>>      >>>>>> +        return s->dev.config[0x57] >> 4;
>>      >>>>>> +    }
>>      >>>>>> +    return 0;
>>      >>>>>> +}
>>      >>>>>> +
>>      >>>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int 
>> level)
>>      >>>>>> +{
>>      >>>>>> +    ViaISAState *s = opaque;
>>      >>>>>> +    PCIBus *bus = pci_get_bus(&s->dev);
>>      >>>>>> +    int pic_irq;
>>      >>>>>> +
>>      >>>>>> +    /* now we change the pic irq level according to the via 
>> irq
>>      >>>>>> mappings */
>>      >>>>>> +    /* XXX: optimize */
>>      >>>>>> +    pic_irq = via_isa_get_pci_irq(s, irq_num);
>>      >>>>>> +    if (pic_irq < ISA_NUM_IRQS) {
>>      >>>>>> +        int i, pic_level;
>>      >>>>>> +
>>      >>>>>> +        /* The pic level is the logical OR of all the PCI irqs 
>> mapped
>>      >>>>>> to it. */
>>      >>>>>> +        pic_level = 0;
>>      >>>>>> +        for (i = 0; i < PCI_NUM_PINS; i++) {
>>      >>>>>> +            if (pic_irq == via_isa_get_pci_irq(s, i)) {
>>      >>>>>> +                pic_level |= pci_bus_get_irq_level(bus, i);
>>      >>>>>> +            }
>>      >>>>>> +        }
>>      >>>>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
>>      >>>>>> +    }
>>      >>>>>> +}
>>      >>>>>> +
>>      >>>>>> static void via_isa_realize(PCIDevice *d, Error **errp)
>>      >>>>>> {
>>      >>>>>>     ViaISAState *s = VIA_ISA(d);
>>      >>>>>> @@ -614,6 +652,7 @@ static void via_isa_realize(PCIDevice *d, 
>> Error
>>      >>>>>> **errp)
>>      >>>>>>     int i;
>>      >>>>>>
>>      >>>>>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>>      >>>>>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq",
>>      >>>>>> PCI_NUM_PINS);
>>      >>>>>
>>      >>>>> This line is a Pegasos2 specific addition for fixing its IRQ 
>> handling.
>>      >>>>> Since this code must also work with the Fuloong2e board we 
>> should aim
>>      >>>>> for a minimal changeset here which renders this line out of 
>> scope.
>>      >>>>>
>>      >>>>> Let's keep the two series separate since now I need to watch two 
>> series
>>      >>>>> for comments. Please use Based-on: tag next time instead.
>>      >>>>
>>      >>>> Well, it's not. It's part of the QDev model for VT8231 that 
>> allows it to
>>      >>>> be connected by boards so I think this belongs here otherwise 
>> this won't
>>      >>>> even compile because the function you've added would be unused 
>> and bail
>>      >>>> on -Werror. Let's not make this more difficult than it is. I'm OK 
>> with
>>      >>>> reasonable changes but what's your goal now? You can't get rid of 
>> this
>>      >>>> line as it's how QDev can model it. Either I have to call into 
>> this model
>>      >>>> or have to export these pins as gpios.
>>      >>>
>>      >>> Exporting the pins is a separate aspect on top of implementing PCI 
>> IRQ
>>      >>> routing. To make this clear and obvious this should be a dedicated 
>> patch.
>>      >>> In case either patch has an issue this would also ease and 
>> therefore
>>      >>> acellerate discussions.
>>      >>
>>      >> How would you do that? Introduce via_isa_set_pci_irq() as unused in 
>> this
>>      >> patch then have a one line patch to add connecting it to gpio pins? 
>> That
>>      >> just makes no sense. This is not modeling the chip with QDev and 
>> then the
>>      >> boatd
>>      >
>>      > This is now modeling...
>>      >
>>      >> can connect it as appropriate modeling the board that the chip is 
>> in. So if
>>      >> fuloon2e needs to do that then it should. I'll check that as I was 
>> focusing
>>      >
>>      > fuloong2e
>>
>>     I've checked fuloong2e and it still works as before. PCI bus is handled 
>> by
>>     bonito on that board so your patch would actually break it. The VIA 
>> chip
>>     is a PCIDevice. You're not supposed to replace the interrupts of the 
>> bus
>>     it's connected to from this model as that should be done by the 
>> pci-host
>>     or the board. Therefore modeling the chip's PIRQ/PINT pins as gpios 
>> which
>>     is the QDev concept for that is right and your usage of pci_set_irq 
>> here
>>     is wrong.
>> 
>> 
>> Works for me:
>> (08/84) 
>> tests/avocado/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e: 
>> PASS(2.77 s)
>
> The bonito code is interesting in that the IRQ is swizzled in 
> pci_bonito_map_irq() to the internal IRQ, and then pci_bonito_set_irq() sets 
> the output (CPU?) IRQ accordingly. This means that the routing is currently 
> fixed based upon the slot number, rather than using the VIA PCI IRQ routing. 
> This bit will need some thought as to how this interacts with pci_bus_irqs() 
> in your proposed patch, feel free to suggest a suitable approach.

I don't know if you've checked what that test does but it seems it tries 
to boot an old debian kernel from 
linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb
which even on master does not boot, it ends in:
[    0.256000] PCI: Enabling device 0000:00:06.0 (0000 -> 0003)
[    0.256000] Data bus error, epc == ffffffff8045aed8, ra == ffffffff8045aeb8
[    0.256000] Oops[#1]:

so this test likely won't notice if you break PCI interrupts replacing the 
bonito irq handler from VT82C686B and either this board does not seem to 
be working anyway or that kernel may not be the right one to boot (the 
board firmware does produxe picture and a boot console but maybe that's 
not using interrupts). I did not reply to this before because it's quite 
irrelevant to the series we were discussing so it would just be a 
distraction.

>>     Please stop breaking my series. I had a working and tested series 
>> (still
>>     have that on my pegasos2 branch in case we end up chosing that) which 
>> was
>>     changed but you to something that is now conceptually wrong but still
>>     works because of guests don't change firmware defaults to share PCI
>>     interrupts with internal functions just to fulfill your assumption that
>>     internal functions are PCI devices (which now I have proof that they 
>> don't
>>     conform to that PCI standard doc, look at the comment in the last patch
>>     about PCI Command register in via-ac97 and compare that with the chip
>>     datasheet) but OK if this allows simlpler code in QEMU and still works 
>> I
>>     can accept that but don't push ideas that are wrong.
>
> I don't think this is fair on Bernhard since his patches are coming from the 
> place of improving the VIA ISA bridge implementation so that it can be used 
> as an alternative to PIIX. From my perspective the work on PIIX and VIA has 
> been well thought out, with a good understanding of the relevant 
> specifications: the intention has always been to improve the existing code 
> based upon a working implementation, and not to deliberately cause more work.

I fully support that and tried to help with review or info that could help 
but this particular change and the way it was forced on me did cause me to 
do more work. Anyway I hope we could come to a conclusion now so don't 
start again.

Regards,
BALATON Zoltan
--3866299591-603137836-1677705407=:23145--

