Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461486A0BD7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCWT-00046C-9I; Thu, 23 Feb 2023 09:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVCWI-00043J-Lf; Thu, 23 Feb 2023 09:24:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVCWF-0004GQ-Fv; Thu, 23 Feb 2023 09:24:25 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A9A9746324;
 Thu, 23 Feb 2023 15:23:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 98FE2745720; Thu, 23 Feb 2023 15:23:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9691F7456E3;
 Thu, 23 Feb 2023 15:23:56 +0100 (CET)
Date: Thu, 23 Feb 2023 15:23:56 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <CAG4p6K5ux4c_nORQX3dUFKbq_woRVwrC7Fmp+=kft+Bs9tALrQ@mail.gmail.com>
Message-ID: <d9f8ede9-8a36-75bd-5e4e-60c665fee354@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
 <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
 <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
 <fa7ddd4c-aed0-5fd4-e67c-b5e7e9116c43@eik.bme.hu>
 <CAG4p6K5ux4c_nORQX3dUFKbq_woRVwrC7Fmp+=kft+Bs9tALrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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

On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> On Thu, Feb 23, 2023 at 1:34 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>>>> I don't get your approach.
>>>>>
>>>>> I hope that I could help you get a better understanding. The linked
>>>>> .pdf is good and comprehensive reading material.
>>>>
>>>> I'm not sure the via-ide confirms to that doc but it's also not any
>>>> more a problem with via-ide now. That was discussed to death back then
>>>> and "fixed" to work for the cases we want it to work with. We probably
>>>> never agreed on how this really works but at least what we ended up
>>>> with works with guests that run on real hardware. I'm OK with also
>>>> making these cases work that we want now such as network and sound card
>>>> under AmigaOS and sound under MorphOS (as long as you don't use USB) on
>>>> pegasos2. This series does that so unless it breaks something that
>>>> worked before I condider this moving forward and we can always improve
>>>> adn fix it later. I'm not saying I'm not interested in your
>>>> improvements just that let's that not hold this back now as we can fix
>>>> and improve it later but otherwise users will have to wait until
>>>> September to be able to use it. I know a few who want this and getting
>>>> this out as it is would allow more people to test it and report
>>>> problems so unless there are clearly wrong parts I'm OK with less than
>>>> perfect but working solution as long as it's not too messy.
>>>
>>> Patch 1 really seems like duplicating PCI code that already exists in
>>> QEMU. This is not needed and we should avoid that.
>>>
>>> Moreover, usage of the IRQ line register (0x3c) for interrupt routing
>>> should be switched to using the 0x55-0x57 regs to be PCI compliant.
>>
>> That would not work because then guests were not able to separately
>> configure IRQs for PCI interrupt lines and internal functions which is
>> what the datasheet says should be possible. The internal functions' IRQs
>> are not affeceted by 0x55-0x57 but routed by different registers.
>
> How do you know?

The datasheet says so. It says that 0x55-0x57 are controlling what ISA 
interrupts the PIRQA-D pins should raise while internal functions are 
documented to have 0x3c register to select what ISA IRQ they use. It's not 
said internal functions would use PCI interrupts that are separate and 
connected to the PIRQ pins.

> I think
>> your series only work because pegasos2 firmware progeams everything to
>> IRQ9 but if a guest decided to change that and route e.g. USB somewhere
>> else then it would break. My series models that a bit better but may still
>> break if a guest routes a function to an IRQ also controlled by some ISA
>> device (like serial or ps2 keyboard) which are currently done within
>> QEMU's ISA model so I can't easily channel those IRQs through the
>> via-isa.for proper routing but it's unliikely guests would want to do that
>> so in practice my series should work. We may duplicate PCI IRQ routing
>> here but this chip does that and more so we need to implement it as it
>> handles more than the 4 PCI interrupts so that implementation is not
>> enough to handle all sources this chip has. This isn't a complex piece of
>> code though so having a similar implementation is not a problem IMO.
>>
>>> Thanks to your great work to make via-ac97 work we can confirm that both
>>> IRQ routing implementations basically work for now. Let's work out a
>>> solution that relies on existing code, sticks to the standard and
>>> hopefully works for i386 and MIPS, too.
>>
>> I'm still not convinced your implementation is correct
>
>
> It seems that Mark (cc'd), I, the commenter in
> https://community.osr.com/discussion/30399/read-only-pci-interrupt-line-register
> and the PCI specification agree that the 0x3c regs aren't supposed to be
> interpreted by hardware.

You could still all be wrong if the PCI spec does not apply to the 
internal functions of the VIA chip which is just an assumption you made 
but the docs and experience never proved that so I don't believe that's a 
valid assumption. According to the datasheet internal functions' 
interrupts are routed independently from PCI interrupts which is what I've 
tried to model.

> I've provided a working example with no functional
> downsides to the 0x3c approach. I've provided the PCI-IDE reading material
> that Mark suggested for reading in
> https://lore.kernel.org/qemu-devel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/
> . I'm running out of ideas now on how to proceed.

Please submit an alternative series that we can test and if it works with 
the guests that I want to run like mine we can take that instead even if I 
believe your way is wrong. I don't care about who's right as long as it 
works. But make sure it gets in for 8.0 as I do care that it should work 
in the next release.

Regards,
BALATON Zoltan

