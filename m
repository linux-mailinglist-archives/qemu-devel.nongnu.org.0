Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28266A08AC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:35:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAnZ-0002rq-9L; Thu, 23 Feb 2023 07:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVAnW-0002rc-Bd; Thu, 23 Feb 2023 07:34:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVAnT-0007RF-40; Thu, 23 Feb 2023 07:34:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8CD8A74635C;
 Thu, 23 Feb 2023 13:33:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 31384746346; Thu, 23 Feb 2023 13:33:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2D79C746324;
 Thu, 23 Feb 2023 13:33:59 +0100 (CET)
Date: Thu, 23 Feb 2023 13:33:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
Message-ID: <fa7ddd4c-aed0-5fd4-e67c-b5e7e9116c43@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
 <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
 <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1484066983-1677155639=:48707"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

--3866299591-1484066983-1677155639=:48707
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> Am 22. Februar 2023 23:00:02 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>> Am 22. Februar 2023 21:12:01 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>> Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wrote:
>>>>>>>> I've had a closer look at your series and I think it can be simplified:
>>>>>>>> Patch 2 can be implemented quite straight-forward like I proposed in a
>>>>>>>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>>>>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt routing"
>>>>>>>> working, one can expose the PCI interrupts with a single line like you do
>>>>>>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>>>>>>>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>>>>>>>
>>>>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>>>>>>>> used instead. pci_set_irq() internally takes care of all the ISA interrupt
>>>>>>>> level tracking patch 1 attempted to address.
>>>>>>>>
>>>>>>>
>>>>>>> Here is a proof of concept branch to demonstrate that the simplification
>>>>>>> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
>>>>>>> with MorphOS with and without pegasos2.rom).
>>>>>>
>>>>>> Does this only work because both the via-ac97 and the PCI interrupts are mapped to the same ISA IRQ and you've only tested sound? The guest could configure each device to use a different IRQ, also mapping them so they share one ISA interrupt. What happens if multiple devices are mapped to IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all share this IRQ) and more than one such device wants to raise an interrupt at the same time? If you ack the ac97 interrupt but a PCI network card or the USB part still wants to get the CPUs attention the ISA IRQ should remain raised until all devices are serviced.
>>>>>
>>>>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
>>>>> exactly that case very well.
>>>>>
>>>>>> I don't see a way to track the status of all devices in a single qemu_irq which can only be up or down so we need something to store the state of each source.
>>>>>
>>>>> pci_set_irq() causes pci_bus_change_irq_level() to be called.
>>>>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>>>>> devices attached to a particular pin in irq_count. Have a look at
>>>>> pci_bus_change_irq_level() and you will understand better.
>>>>
>>>> I'm aware of that, we're using that in sam460ex which connects all PCI interrupt lines to a single IRQ and Peter explored and explained it in a comment there when that was discovered. First we had a patch with or-irq but due to this behaviot that's not needed for PCI interrupts. But the VT8132 could change what ISA IRQ you route the sub functions to.
>>>
>>> That depends on the sub function if you can do that. And if so, then it depends on whether the function is still in PCI mode (see below).
>>>
>>>> It happens that on pegasos2 by default all of those are routed to IRQ9 except IDE
>>>
>>> All *PCI* interrupts are routed to IRQ9 while IDE legacy interrupts are routed to the compatible ISA IRQs. Note that the IDE function must only trigger the ISA IRQs if it is in legacy mode while it must only trigger the PCI IRQ in non-legacy mode. See https://www.bswd.com/pciide.pdf for more details on this particular topic.
>>
>> The docs say so but based on what guests that work on real hardware do it does not work that way. Look up previous discussion on this on the list from around the time Mark changed via-ide about 4-5 years ago. That series was a result of his review of my proposed changes and gave resuled in an alternative appdroach. On pegasos2 (and probably also on fuloong2e based on same later findings, see patches to that, I can try to find these later if you can't find them) via-ide *always* uses IRQ 14/15 and the native mode only switches register addresses from legacy io ports to PCI io space so you can set it in with BAR regs but the IRQs don't change despite what the docs say. There are some hacks in Linux kernel and other guests to account for this but the comments for the reason are wrong in Linux, they say IDE is always in legacy mode but in fact if has a half-native mode which is what I called it where io addresses are set with BARs but IRQs are still the legacy ISA ones. You can find s
 ome references in previous discussion. Probably searching for via-ide half-native mode might find it.
>>
>>>> but what if a guest changes ac97 to use a different interrupt? Then it's not a PCI interrupt any more so you can't use pci_set_irq in via=ac97.
>>>
>>> How would it do that? AFAICS there is no dedicated register to configure which IRQ to use. This means that it can only trigger an interrupt via its PCI intx pin which is subject to the PCI -> ISA IRQ router.
>>
>> The VIA functions can use their PCI_INTERRUPT_LINE (0x3c) registers to set their ISA IRQ according to the docs (and unlike IDE in other functions like USB and sound this probably also works) and the PIRQA-D pins can be mapped to ISA IRQs by the 0x55-0x57 config registers of the isa bridge (function0). This is what I implemented in via_isa_set_irq() in this series.
>>
>>>> There are only 4 PCI INT lines but the VIA components can be routed to 13 or 14 ISA IRQs.
>>>
>>> Pure PCI components are only able to trigger one of the four PCI intx pins they are *hardwired* to.
>>
>> This is true for PCI cards which can only use the 4 pins the slot they are in is wired to. These come in through the PIRQA-D pins and they are routed with the funstion 0 0x55-0x57 config registers. But I'm not sure about the internal functions.
>>
>>> Each component has only one pin. Which ISA IRQ gets triggered through that pin can be selected from 13 or 14 ISA IRQs as you say by means of the three configuration registers of the PCI -> ISA IRQ router.
>>
>> So you say that internal functions are also wired to the same 4 lines like normal PCI cards?
>
> Yes.
>
>> Then how can you route them to different interrupts setting their config reg 0x3c independent of function0 0x55-0x57 regs?
>
> 0x3c isn't supposed to be interpretet by hardware, and in general 
> hardware can't: 0x3c is standardized for every PCI function which 
> includes standalone PCI devices in particular. Standalone PCI devices 
> don't have access to an IRQ router. So if they don't, how could they 
> possibly configure the IRQ they are triggering?
>
> 0x3c is only information to the OS (populated by the BIOS). It merily 
> indicates that the PCI device needs attention when the IRQ configured in 
> 0x3c is raised. See comment 4 in 
> https://community.osr.com/discussion/30399/read-only-pci-interrupt-line-register 
> for another explanation.

But we're not talking about notmal PCI devices attached to a PCI slot here 
but internal functions of the VIA southbridges which are internally 
connected in some way inside the chip. You (and also Mark before, check 
the previous discussion on via-ide half-native mode) seem to want to 
assume these functions are normal PCI devices and force them in that model 
but that does not match with what the VIA datasheet says and what guests 
running on these behave so I don't think we want to (or can) assume these 
internal functions are normal PCI devices.

> Even though the south bridge contains an interrupt router doesn't mean 
> that its PCI functions can configure their IRQ through their 0x3c 
> registers. That would change the semantics of standardized PCI registers 
> which is surely not permitted by the standard. Instead, the PCI IRQs are 
> configured through the device-specific 0x55-0x57 regs.

But the datasheets (both 686B and 8231) say so and guests do expect IRQ 9 
when the config reg of the AC97 and USB functions are set to that by the 
firmware. The 0x55-0x57 regs on function0 only configures the routing of 
the PIRQA-D pins which are external inputs to the chip while internal 
functions are routed by their 0x3c reg. At least that's how I understand 
the docs and how all the guests I've looked at seem to work. So I think 
this VIA device does not fully confirm to PCI standard with respect to its 
internal functions that are instead kind of mixed ISA/PCI things, probably 
for compatibility with contemporary OS drivers or trying to fit former ISA 
hardware to the then new PCI bus. These chips are from the 90's when these 
were new and maybe not that standardised or not everybody did everything 
in a standard way.

> I see that 0x3c is also used for the USB functions. They used to trigger 
> the raw ISA IRQs before your series which seems wrong. I think 0x3c 
> usage needs to be cleaned up in the VIA model. Otherwise this will 
> likely cause problems elsewhere.

Again, don't look at papers that this VIA chip might not follow. If 
anything, look at its datasheet and guests running on it for reference. 
The guests expect ISA IRQs as set in 0x3c of internal functions so these 
functions are not regular PCI devices. They are part of the chip and 
behave how the chip docs say which may not be fully match a normal PCI 
card. I think your proposed clesn up to make these functions PCI devices 
would break it becuase then you can't properly route IRQs the way the 
datasheet says. That's why I think this series is needed.

>>>> How do you keep track of that with only the PCI bus interrupts?
>>>
>>> Devices that operate in ISA mode such as the IDE function shall have 
>>> their own, dedicated ISA IRQs assigned by the guest. Otherwise this 
>>> causes a classic interrupt conflict, just like in the olden ISA days. 
>>> If the function operates in PCI mode, it must not trigger the ISA 
>>> IRQs, regardless of whether they are assigned or not.
>>
>> This does not match with guests which clearly expect to get ISA IRQ9 
>> for PCI cards and USB and sound which is where these are routed within 
>> the VIA bridge as the firmware programs it.
>
> What I meant was that a component able to operate in native/legacy/mixed 
> mode such as IDE must not use both PCI and legacy ISA interrupts at the 
> same time. Multiple PCI functions may of course share interrupts.

The IDE part is even more complicated than other functions because of its 
"half-native" mode which is not quite what the datasheet suggests yet 
still both pegasos2 and fuloong2e guests seem to assume it works that way 
and we model it so now. So I think our model is correct we just doesn't 
model the startup state in legacy mode which is then immediately switched 
to native mode by the firmware anyway so we only model that, but a quirk 
in real hardware seems to be that contrary to the docs the IRQs are still 
tied to the legasy 14/15 even when in native mode and the full native mode 
IRQ routing via 0x3c is not implemented. The pegasos2 firmware sets the 
ide function to native mode and sets 0x3c to 9 but then guests still 
expect to get IRQs via 14/15. This is what the Linux kernel fixes up in 
the device tree for it's drivers to work, MorphOS just knows and does not 
care about the 0x3c setting yet it excpects to be able to set io addresses 
with BARs so it assumes native mode with legacy IRQs. This was what we 
were discussing long ago and now looks like we're back to that again just 
with you instead of Mark.

>>> There is also the power management function whose ACPI interrupt (SCI) 
>>> can be routed by means of a dedicated register. Again, a guest must 
>>> make sure here to not configure interrupt conflicts.
>>>
>>>> I don't get your approach.
>>>
>>> I hope that I could help you get a better understanding. The linked 
>>> .pdf is good and comprehensive reading material.
>>
>> I'm not sure the via-ide confirms to that doc but it's also not any 
>> more a problem with via-ide now. That was discussed to death back then 
>> and "fixed" to work for the cases we want it to work with. We probably 
>> never agreed on how this really works but at least what we ended up 
>> with works with guests that run on real hardware. I'm OK with also 
>> making these cases work that we want now such as network and sound card 
>> under AmigaOS and sound under MorphOS (as long as you don't use USB) on 
>> pegasos2. This series does that so unless it breaks something that 
>> worked before I condider this moving forward and we can always improve 
>> adn fix it later. I'm not saying I'm not interested in your 
>> improvements just that let's that not hold this back now as we can fix 
>> and improve it later but otherwise users will have to wait until 
>> September to be able to use it. I know a few who want this and getting 
>> this out as it is would allow more people to test it and report 
>> problems so unless there are clearly wrong parts I'm OK with less than 
>> perfect but working solution as long as it's not too messy.
>
> Patch 1 really seems like duplicating PCI code that already exists in 
> QEMU. This is not needed and we should avoid that.
>
> Moreover, usage of the IRQ line register (0x3c) for interrupt routing 
> should be switched to using the 0x55-0x57 regs to be PCI compliant.

That would not work because then guests were not able to separately 
configure IRQs for PCI interrupt lines and internal functions which is 
what the datasheet says should be possible. The internal functions' IRQs 
are not affeceted by 0x55-0x57 but routed by different registers. I think 
your series only work because pegasos2 firmware progeams everything to 
IRQ9 but if a guest decided to change that and route e.g. USB somewhere 
else then it would break. My series models that a bit better but may still 
break if a guest routes a function to an IRQ also controlled by some ISA 
device (like serial or ps2 keyboard) which are currently done within 
QEMU's ISA model so I can't easily channel those IRQs through the 
via-isa.for proper routing but it's unliikely guests would want to do that 
so in practice my series should work. We may duplicate PCI IRQ routing 
here but this chip does that and more so we need to implement it as it 
handles more than the 4 PCI interrupts so that implementation is not 
enough to handle all sources this chip has. This isn't a complex piece of 
code though so having a similar implementation is not a problem IMO.

> Thanks to your great work to make via-ac97 work we can confirm that both 
> IRQ routing implementations basically work for now. Let's work out a 
> solution that relies on existing code, sticks to the standard and 
> hopefully works for i386 and MIPS, too.

I'm still not convinced your implementation is correct so I would atick to 
my series with that, that this could be improved and changed in the future 
in follow up series but I don't want that to hold this back now. So unless 
there's a good reason against taking this series now (like it breaking 
something) I'd like this to be merged for 8.0. I could go with your 
version which might work too as long as guests share IRQ of internal 
functions with PCI interrupts but I don't think that's correct and I think 
my series better models the actual hardware and more clearly separates 
components. whereas your proposal reuses code from PCI that's not quite 
adequate for the job it's supposed to do. So I think in this case that 
should not be reused here. The VIA chip is more complex than a simple PCI 
IRQ router, that's just a part of its IRQ routing. It handles more sources 
than just the 4 PCI interrupt lines.

Regards,
BALATON Zoltan
--3866299591-1484066983-1677155639=:48707--

