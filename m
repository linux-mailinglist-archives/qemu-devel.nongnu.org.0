Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106156A6D4F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMjK-00007O-QJ; Wed, 01 Mar 2023 08:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXMjG-00006J-VW; Wed, 01 Mar 2023 08:42:48 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXMjA-0008On-A1; Wed, 01 Mar 2023 08:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hIImmn8Ka3uQs9vZULXw5DrnLXY6Jjxn5bP9DFMFD0=; b=q3SczT7/whoRYXG41M6AXzSyF4
 QWcKrvHcAWtymbZ7co6U3Kx7ihBQTKr+PDD8erHWohljL3jOoe6UIi17IHgwFdIDEzFkzpiNHdIbX
 mCRCWMzFVv3WGFLE53wnVNZ8DQGD2UmILU+kKLdFXBki1ru1+fiZGes/nJsd+QpSdrLia3DxjHWgI
 vqaJbNgwaYcZhlbnfh4R0ESEOak9cBCOKrlFYozF2oLE9iwUGkh5+5BQXreNyaPisKoISZucyZdwp
 YW3RfndNJcArg9OJJnwDc0qrqOy7fcniLfZZtp1jT62xFWNVICvuyjn1H6px+hayFUBQRrR7xxrAp
 FOUrBf0IHKH0ey4X68BKYI0Y2bTe2sOupERfEyORaO/kWOtfTahKXcFXR8amlvNQt/Po1zVG0YSVu
 YgM+aIQhS7cvez6yNQMgpIi8d5AIQKxw7fdpAhO7BGDwAxbUtLjBNoNjaoqsROy3xY/QIHHQp3mtc
 JERxR6Px2QAp4QQL5KfopdUuruz73d9cJfptZWRl5D8gBze+g75ZAGEHd5+EGHkrdopxYZnZO5SDn
 RURz846mGugV+Pta5hB3aGu3InC8Sii7h7iOD/czMx9WvB0twsPXmaBrzo6svJ48DpFXqvvaouBC/
 zm4PqxUdovv3ueyH0cEZh+hBCom4oOlipd0FbEky8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXMiT-00019a-F3; Wed, 01 Mar 2023 13:42:01 +0000
Message-ID: <c83e0d1f-afbd-04b0-e593-41098c6684c5@ilande.co.uk>
Date: Wed, 1 Mar 2023 13:42:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 22/02/2023 21:12, BALATON Zoltan wrote:

> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>> Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wrote:
>>>>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>>>>>> partial implementation of the via-ac97 sound part enough to get audio
>>>>>> output. I'd like this to be merged for QEMU 8.0.
>>>>>>
>>>>>> Regards,
>>>>>> BALATON Zoltan
>>>>>>
>>>>>> BALATON Zoltan (5):
>>>>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>>>>   hw/audio/ac97: Split off some definitions to a header
>>>>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>>>>
>>>>>>  hw/audio/ac97.c            |  43 +---
>>>>>>  hw/audio/ac97.h            |  65 ++++++
>>>>>>  hw/audio/trace-events      |   6 +
>>>>>>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-
>>>>>>  hw/ide/via.c               |   2 +-
>>>>>>  hw/isa/vt82c686.c          |  61 +++++-
>>>>>>  hw/pci-host/mv64361.c      |   4 -
>>>>>>  hw/ppc/pegasos2.c          |  26 ++-
>>>>>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>>>>>  include/hw/isa/vt82c686.h  |  39 +++-
>>>>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>>>>  create mode 100644 hw/audio/ac97.h
>>>>>>
>>>>>> -- 
>>>>>> 2.30.7
>>>>>>
>>>>>>
>>>>> Wow, the MorphOS people paid attention to sound design. Thanks for
>>>>> presenting it to us, Zoltan!
>>>>>
>>>>> I've had a closer look at your series and I think it can be simplified:
>>>>> Patch 2 can be implemented quite straight-forward like I proposed in a
>>>>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
>>>>> working, one can expose the PCI interrupts with a single line like you do
>>>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>>>>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>>>>
>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>>>>> used instead. pci_set_irq() internally takes care of all the ISA interrupt
>>>>> level tracking patch 1 attempted to address.
>>>>>
>>>>
>>>> Here is a proof of concept branch to demonstrate that the simplification
>>>> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
>>>> with MorphOS with and without pegasos2.rom).
>>>
>>> Does this only work because both the via-ac97 and the PCI interrupts are mapped to 
>>> the same ISA IRQ and you've only tested sound? The guest could configure each 
>>> device to use a different IRQ, also mapping them so they share one ISA interrupt. 
>>> What happens if multiple devices are mapped to IRQ 9 (which is the case on 
>>> pegasos2 where PCI cards, ac97 and USB all share this IRQ) and more than one such 
>>> device wants to raise an interrupt at the same time? If you ack the ac97 interrupt 
>>> but a PCI network card or the USB part still wants to get the CPUs attention the 
>>> ISA IRQ should remain raised until all devices are serviced.
>>
>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
>> exactly that case very well.
>>
>>> I don't see a way to track the status of all devices in a single qemu_irq which 
>>> can only be up or down so we need something to store the state of each source.
>>
>> pci_set_irq() causes pci_bus_change_irq_level() to be called.
>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>> devices attached to a particular pin in irq_count. Have a look at
>> pci_bus_change_irq_level() and you will understand better.
> 
> I'm aware of that, we're using that in sam460ex which connects all PCI interrupt 
> lines to a single IRQ and Peter explored and explained it in a comment there when 
> that was discovered. First we had a patch with or-irq but due to this behaviot that's 
> not needed for PCI interrupts. But the VT8132 could change what ISA IRQ you route the 
> sub functions to. It happens that on pegasos2 by default all of those are routed to 
> IRQ9 except IDE but what if a guest changes ac97 to use a different interrupt? Then 
> it's not a PCI interrupt any more so you can't use pci_set_irq in via=ac97. There are 
> only 4 PCI INT lines but the VIA components can be routed to 13 or 14 ISA IRQs. How 
> do you keep track of that with only the PCI bus interrupts? I don't get your approach.

It's up to the OS to setup the IRQ routing as required, so if the guest wants to 
route via an ISA IRQ then there should be a register to control this, much in the 
same way that legacy mode can be enabled for some PCI IDE controllers.

>>> My patch adds a state register to each ISA IRQ line for all possible sources which 
>>> could probably be stored once but then for each change of ISA IRQ status all the 
>>> mapped devices should be checked and combined so it's easier to store them for 
>>> each IRQ. Does your approach still work if you play sound, and copy something from 
>>> network to a USB device at the same time? (I'm not sure mine does not have 
>>> remaining bugs but I don't think this can be simplified that way but if you can 
>>> prove it would work I don't mind taking an alternative version but I'm not 
>>> convinced yet.)

This doesn't sound right at all: at least on old PCs an ISA card was wired to one or 
more IRQ lines, and it wasn't possible to share them. If you find you're sharing the 
same ISQ IRQ then it's likely something is wrong with the IRQ routing.

>> Well, I can't prove that my approach works but unfortunately I can
>> prove that both our approaches cause a freeze :/ Try:
>> 1. Start `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc
>> base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom
>> morphos-3.17.iso -device usb-mouse -device usb-kbd`
>> 2. Move the mouse while sound is playing
>> -> Observe the VM to freeze
>>
>> So there must be an issue somewhere else...
> 
> I'll have a look later but my patch attempts to handle the USB controller interrupts. 
> There may be another bug somewhere in USB emulation though, we have similar problem 
> with mac99 with older MacOS guests. Considering that USB devices probably did not 
> work at all before this patch it's at least still an imptovement. :-)
> 
> Regards,
> BALATON Zoltan


ATB,

Mark.

