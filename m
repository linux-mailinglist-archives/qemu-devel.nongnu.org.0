Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6936A742D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXS1K-0000mW-21; Wed, 01 Mar 2023 14:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXS1H-0000lk-5A; Wed, 01 Mar 2023 14:21:43 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXS1E-000051-E9; Wed, 01 Mar 2023 14:21:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B0089746324;
 Wed,  1 Mar 2023 20:21:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 543EC7462DB; Wed,  1 Mar 2023 20:21:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 520877457E7;
 Wed,  1 Mar 2023 20:21:36 +0100 (CET)
Date: Wed, 1 Mar 2023 20:21:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <c83e0d1f-afbd-04b0-e593-41098c6684c5@ilande.co.uk>
Message-ID: <19344c29-2206-c492-e978-5bbe0e388119@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <c83e0d1f-afbd-04b0-e593-41098c6684c5@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1266593276-1677698496=:79433"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1266593276-1677698496=:79433
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 1 Mar 2023, Mark Cave-Ayland wrote:
> On 22/02/2023 21:12, BALATON Zoltan wrote:
>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>> Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan 
>>> <balaton@eik.bme.hu>:
>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> 
>>>>> wrote:
>>>>>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> 
>>>>>> wrote:
>>>>>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>>>>>>> partial implementation of the via-ac97 sound part enough to get audio
>>>>>>> output. I'd like this to be merged for QEMU 8.0.
>>>>>>> 
>>>>>>> Regards,
>>>>>>> BALATON Zoltan
>>>>>>> 
>>>>>>> BALATON Zoltan (5):
>>>>>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>>>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>>>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>>>>>   hw/audio/ac97: Split off some definitions to a header
>>>>>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>>>>> 
>>>>>>>  hw/audio/ac97.c            |  43 +---
>>>>>>>  hw/audio/ac97.h            |  65 ++++++
>>>>>>>  hw/audio/trace-events      |   6 +
>>>>>>>  hw/audio/via-ac97.c        | 436 
>>>>>>> ++++++++++++++++++++++++++++++++++++-
>>>>>>>  hw/ide/via.c               |   2 +-
>>>>>>>  hw/isa/vt82c686.c          |  61 +++++-
>>>>>>>  hw/pci-host/mv64361.c      |   4 -
>>>>>>>  hw/ppc/pegasos2.c          |  26 ++-
>>>>>>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>>>>>>  include/hw/isa/vt82c686.h  |  39 +++-
>>>>>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>>>>>  create mode 100644 hw/audio/ac97.h
>>>>>>> 
>>>>>>> -- 
>>>>>>> 2.30.7
>>>>>>> 
>>>>>>> 
>>>>>> Wow, the MorphOS people paid attention to sound design. Thanks for
>>>>>> presenting it to us, Zoltan!
>>>>>> 
>>>>>> I've had a closer look at your series and I think it can be simplified:
>>>>>> Patch 2 can be implemented quite straight-forward like I proposed in a
>>>>>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt 
>>>>>> routing"
>>>>>> working, one can expose the PCI interrupts with a single line like you 
>>>>>> do
>>>>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>>>>>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>>>>> 
>>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>>>>>> used instead. pci_set_irq() internally takes care of all the ISA 
>>>>>> interrupt
>>>>>> level tracking patch 1 attempted to address.
>>>>>> 
>>>>> 
>>>>> Here is a proof of concept branch to demonstrate that the simplification
>>>>> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
>>>>> with MorphOS with and without pegasos2.rom).
>>>> 
>>>> Does this only work because both the via-ac97 and the PCI interrupts are 
>>>> mapped to the same ISA IRQ and you've only tested sound? The guest could 
>>>> configure each device to use a different IRQ, also mapping them so they 
>>>> share one ISA interrupt. What happens if multiple devices are mapped to 
>>>> IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all 
>>>> share this IRQ) and more than one such device wants to raise an interrupt 
>>>> at the same time? If you ack the ac97 interrupt but a PCI network card or 
>>>> the USB part still wants to get the CPUs attention the ISA IRQ should 
>>>> remain raised until all devices are serviced.
>>> 
>>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
>>> exactly that case very well.
>>> 
>>>> I don't see a way to track the status of all devices in a single qemu_irq 
>>>> which can only be up or down so we need something to store the state of 
>>>> each source.
>>> 
>>> pci_set_irq() causes pci_bus_change_irq_level() to be called.
>>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>>> devices attached to a particular pin in irq_count. Have a look at
>>> pci_bus_change_irq_level() and you will understand better.
>> 
>> I'm aware of that, we're using that in sam460ex which connects all PCI 
>> interrupt lines to a single IRQ and Peter explored and explained it in a 
>> comment there when that was discovered. First we had a patch with or-irq 
>> but due to this behaviot that's not needed for PCI interrupts. But the 
>> VT8132 could change what ISA IRQ you route the sub functions to. It happens 
>> that on pegasos2 by default all of those are routed to IRQ9 except IDE but 
>> what if a guest changes ac97 to use a different interrupt? Then it's not a 
>> PCI interrupt any more so you can't use pci_set_irq in via=ac97. There are 
>> only 4 PCI INT lines but the VIA components can be routed to 13 or 14 ISA 
>> IRQs. How do you keep track of that with only the PCI bus interrupts? I 
>> don't get your approach.
>
> It's up to the OS to setup the IRQ routing as required, so if the guest wants 
> to route via an ISA IRQ then there should be a register to control this, much 
> in the same way that legacy mode can be enabled for some PCI IDE controllers.

The VT82C686B and VT8231 datasheets document PCI config reg 0x3c to do 
that which is what I implemented in the first version but then Bernhard 
said this does not confirm to PCI standard spec so let's model these 
internal functions of the VIA chip as PCI devices and only map the PCI 
interrupts with the other registers called PnP IRQ routing in the ISA 
bridge function for mapping PIRQ/PINT pins. This IMO isn't correctly 
modeling the chip as documented in the datasheet but may still work as 
long as guests program everything to share IRQ 9 which is what the 
pegasos2 firmware does and guests seem to not change it but deal with it 
one way or another (MorphOS using level sensitive mode of the ISA PICs, 
Linux and AmigaOS without that). So we can get away with this and make our 
model simpler until we find a guest that actually need the more fine 
grained control the chip appears to have. So after some debate and testing 
it still works with the guests I cate about I went with this simpification 
in the latest version, noting the above in the commit message.

>>>> My patch adds a state register to each ISA IRQ line for all possible 
>>>> sources which could probably be stored once but then for each change of 
>>>> ISA IRQ status all the mapped devices should be checked and combined so 
>>>> it's easier to store them for each IRQ. Does your approach still work if 
>>>> you play sound, and copy something from network to a USB device at the 
>>>> same time? (I'm not sure mine does not have remaining bugs but I don't 
>>>> think this can be simplified that way but if you can prove it would work 
>>>> I don't mind taking an alternative version but I'm not convinced yet.)
>
> This doesn't sound right at all: at least on old PCs an ISA card was wired to 
> one or more IRQ lines, and it wasn't possible to share them. If you find 
> you're sharing the same ISQ IRQ then it's likely something is wrong with the 
> IRQ routing.

The fimrmware definitely writes 9 to 0x3c config regs of all internal 
devices (including IDE which despite of that still uses IRQ 14/15 as we 
have found before) and also writes 9 to 0x55-57 which map the PIRQ or PINT 
(these are called differently in 686B and VT8231) which are connected to 
PCI interrupts as seen on an obscure part of the schematics that I've 
missed first. You can see this with -trace enable="pci*" and guests work 
accordingly: logs from Linux and BSD on real hardware I've found on-line 
all list USB and other parts using IRQ 9 and also PCI cards started 
working after this series with AmigaOS which previously expecting 
interrupt 9 for these bit did not get it because of the missing 
connection to PINT pins.

I think your and Bernhard's assumption that internal functions of these 
VIA cups are PCI devices is wrong. There are multiple proofs for that:

- The datasheet documents regs to work differently than PCI spec
- The sound part ignores PCI bus master bit yet still can DMA (documented 
in datasheet and evidenced by AmigaOS driver which works on real hardware)
- The IDE part is still using ISA IRQs even in native mode (this one is 
also contrary to the datasheet not just the PCI spec but this was 
confirmed before and seems to also be the case on fuloong2e so probably 
true for all VIA chips)

So I think assuming these must work as normal PCI devices is clearly not 
what the datasheet says and likely not how real chip works so I'd rather 
believe the datasheet and what guests do than a PCI standard that may be 
later than this chip and nothing said the chip must confirm to it but you 
still want to assume that strongly.

Yet due to the way guests use it, sharing the same interrupt for all PCI 
lines and all internal functions we can still model it that way and thus 
make the model simpler (albeit conceptually wrong). I can accept if you 
want it to be simpler but I can't accept it's really how the chip works. 
But then this debate is theoretical, as long as guests work I'm OK with 
that so just took Bernhard's patches and I really hope now you won't come 
up with a 3rd way you think this should be done instead which would be 
really late now. This was tested first with my patches then with 
Bernhard's approach and now is being tested with the current state after 
rebase. We may have time for only one more iteration left but I really 
don't want to break it with extensive changes at this point. There's 
always an oportunity to improve things later so my main goal now is to let 
people be able to use these guests on pegasos2 as soon as possible. For 
AmigaOS pegasos2 would really help as it's a lot faster than sam460ex and 
may also allow KVM to work but for that this needs to get out then we can 
improve it in future versions.

Regards,
BALATON Zoltan

>>> Well, I can't prove that my approach works but unfortunately I can
>>> prove that both our approaches cause a freeze :/ Try:
>>> 1. Start `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc
>>> base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom
>>> morphos-3.17.iso -device usb-mouse -device usb-kbd`
>>> 2. Move the mouse while sound is playing
>>> -> Observe the VM to freeze
>>> 
>>> So there must be an issue somewhere else...
>> 
>> I'll have a look later but my patch attempts to handle the USB controller 
>> interrupts. There may be another bug somewhere in USB emulation though, we 
>> have similar problem with mac99 with older MacOS guests. Considering that 
>> USB devices probably did not work at all before this patch it's at least 
>> still an imptovement. :-)
>> 
>> Regards,
>> BALATON Zoltan
>
>
> ATB,
>
> Mark.
>
>
--3866299591-1266593276-1677698496=:79433--

