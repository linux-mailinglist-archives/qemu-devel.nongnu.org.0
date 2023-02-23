Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBB26A0A5A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:19:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBUI-0006qT-Pt; Thu, 23 Feb 2023 08:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVBU9-0006pm-Lu; Thu, 23 Feb 2023 08:18:09 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVBU4-00070c-Qb; Thu, 23 Feb 2023 08:18:09 -0500
Received: by mail-vs1-xe36.google.com with SMTP id a3so2248440vsi.0;
 Thu, 23 Feb 2023 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677158283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hrn0jeXAAZFeSg4p+1p+z7VcWSDE94Hxcnxt93+5keo=;
 b=UTrwz9Hpr289wHC874gKnyh59ztPkiG9IoI96oSPUni1GkdMiJG5C/RE12fYWrK8uH
 qoDaQFBYKvht23lEw1lMV1NMtbcZiuJeXRdpRwiSyacx2Rc62AKW8rmmc0K1oxKeAXtQ
 YWJBb09Rp2V3KGuvYHQx95YgmVeBFfC48nDtAIM7FdGuTCqAnhYvF5Z0lYY3EfcdnNaf
 PL/w2B2+m0+yZTgs66XsUPmogeOlmhn59lPuISi/ozvdCfSFLfk3vZWKrw4IbASdn3Hj
 bRhRVdXbzdZkNe7DVF+bikhh20qzAmCNHQxAiI8GdimV6R4V5bBN2suUYnRyMtoWaSIG
 8XXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677158283;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hrn0jeXAAZFeSg4p+1p+z7VcWSDE94Hxcnxt93+5keo=;
 b=3iZptV2BXCDCt/wCASRzpXfos5EzjffAOYPCQJBtZnquWNuvi10hEJytrZYlUL1QFn
 4JAN4qg7h1k9tI+7BSxffqoceIXvEqeg4gMUdA0VnsIY6RH+UHAqxwAd0/VZL39cmWXP
 ZEH4VSuNkoYAmWddGyfHJnzcXBoFed7OfeYFU/AaP6SF8c0Zju8x349jDeYHf2z+/95b
 OgQ+2BZptAdQ5a/AuAgAbd1pnFUOAuw9hdkFy6cuorHclCM/aD7yr5/J0yciKRNfnTN8
 qhcUfx5dhCYvZWKwHl7v5Uv7AGIyNk1rS8Ky9xohLW6IAyGsHmiiMfpQNUfTashAwAjc
 WjAQ==
X-Gm-Message-State: AO0yUKW7uIuR8E0Adz+9taNE7mZwWIC2BrVWxTG9CEaCZCveyODGxysQ
 Hps0Bwbed1ogtignYwNpg9Bo5YGrnd2CPhG274E=
X-Google-Smtp-Source: AK7set+AaSYBcO64FLpg+cQqsryZrewj3pRNfC/FPp+cbMzKu443kWUPRxpPbo/vcUmg9XsXxd9H9mJl6gOmAOBV0xs=
X-Received: by 2002:a67:df83:0:b0:41e:97c7:c262 with SMTP id
 x3-20020a67df83000000b0041e97c7c262mr1860826vsk.7.1677158282535; Thu, 23 Feb
 2023 05:18:02 -0800 (PST)
MIME-Version: 1.0
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
In-Reply-To: <fa7ddd4c-aed0-5fd4-e67c-b5e7e9116c43@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 23 Feb 2023 14:17:47 +0100
Message-ID: <CAG4p6K5ux4c_nORQX3dUFKbq_woRVwrC7Fmp+=kft+Bs9tALrQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000a9a81405f55dd75f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000a9a81405f55dd75f
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023 at 1:34 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Thu, 23 Feb 2023, Bernhard Beschow wrote:
> > Am 22. Februar 2023 23:00:02 UTC schrieb BALATON Zoltan <
> balaton@eik.bme.hu>:
> >> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
> >>> Am 22. Februar 2023 21:12:01 UTC schrieb BALATON Zoltan <
> balaton@eik.bme.hu>:
> >>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
> >>>>> Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <
> balaton@eik.bme.hu>:
> >>>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
> >>>>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <
> shentey@gmail.com> wrote:
> >>>>>>>> I've had a closer look at your series and I think it can be
> simplified:
> >>>>>>>> Patch 2 can be implemented quite straight-forward like I proposed
> in a
> >>>>>>>> private mail:
> https://github.com/shentok/qemu/commit/via-priq-routing.
> >>>>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI
> interrupt routing"
> >>>>>>>> working, one can expose the PCI interrupts with a single line
> like you do
> >>>>>>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement
> interrupt
> >>>>>>>> routing in via_isa_set_irq" isn't needed any longer and can be
> omitted.
> >>>>>>>>
> >>>>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq()
> can be
> >>>>>>>> used instead. pci_set_irq() internally takes care of all the ISA
> interrupt
> >>>>>>>> level tracking patch 1 attempted to address.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Here is a proof of concept branch to demonstrate that the
> simplification
> >>>>>>> actually works: https://github.com/shentok/qemu/commits/pegasos2
> (Tested
> >>>>>>> with MorphOS with and without pegasos2.rom).
> >>>>>>
> >>>>>> Does this only work because both the via-ac97 and the PCI
> interrupts are mapped to the same ISA IRQ and you've only tested sound? The
> guest could configure each device to use a different IRQ, also mapping them
> so they share one ISA interrupt. What happens if multiple devices are
> mapped to IRQ 9 (which is the case on pegasos2 where PCI cards, ac97 and
> USB all share this IRQ) and more than one such device wants to raise an
> interrupt at the same time? If you ack the ac97 interrupt but a PCI network
> card or the USB part still wants to get the CPUs attention the ISA IRQ
> should remain raised until all devices are serviced.
> >>>>>
> >>>>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
> >>>>> exactly that case very well.
> >>>>>
> >>>>>> I don't see a way to track the status of all devices in a single
> qemu_irq which can only be up or down so we need something to store the
> state of each source.
> >>>>>
> >>>>> pci_set_irq() causes pci_bus_change_irq_level() to be called.
> >>>>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
> >>>>> devices attached to a particular pin in irq_count. Have a look at
> >>>>> pci_bus_change_irq_level() and you will understand better.
> >>>>
> >>>> I'm aware of that, we're using that in sam460ex which connects all
> PCI interrupt lines to a single IRQ and Peter explored and explained it in
> a comment there when that was discovered. First we had a patch with or-irq
> but due to this behaviot that's not needed for PCI interrupts. But the
> VT8132 could change what ISA IRQ you route the sub functions to.
> >>>
> >>> That depends on the sub function if you can do that. And if so, then
> it depends on whether the function is still in PCI mode (see below).
> >>>
> >>>> It happens that on pegasos2 by default all of those are routed to
> IRQ9 except IDE
> >>>
> >>> All *PCI* interrupts are routed to IRQ9 while IDE legacy interrupts
> are routed to the compatible ISA IRQs. Note that the IDE function must only
> trigger the ISA IRQs if it is in legacy mode while it must only trigger the
> PCI IRQ in non-legacy mode. See https://www.bswd.com/pciide.pdf for more
> details on this particular topic.
> >>
> >> The docs say so but based on what guests that work on real hardware do
> it does not work that way. Look up previous discussion on this on the list
> from around the time Mark changed via-ide about 4-5 years ago. That series
> was a result of his review of my proposed changes and gave resuled in an
> alternative appdroach. On pegasos2 (and probably also on fuloong2e based on
> same later findings, see patches to that, I can try to find these later if
> you can't find them) via-ide *always* uses IRQ 14/15 and the native mode
> only switches register addresses from legacy io ports to PCI io space so
> you can set it in with BAR regs but the IRQs don't change despite what the
> docs say. There are some hacks in Linux kernel and other guests to account
> for this but the comments for the reason are wrong in Linux, they say IDE
> is always in legacy mode but in fact if has a half-native mode which is
> what I called it where io addresses are set with BARs but IRQs are still
> the legacy ISA ones. You can find s
>  ome references in previous discussion. Probably searching for via-ide
> half-native mode might find it.
> >>
> >>>> but what if a guest changes ac97 to use a different interrupt? Then
> it's not a PCI interrupt any more so you can't use pci_set_irq in via=ac97.
> >>>
> >>> How would it do that? AFAICS there is no dedicated register to
> configure which IRQ to use. This means that it can only trigger an
> interrupt via its PCI intx pin which is subject to the PCI -> ISA IRQ
> router.
> >>
> >> The VIA functions can use their PCI_INTERRUPT_LINE (0x3c) registers to
> set their ISA IRQ according to the docs (and unlike IDE in other functions
> like USB and sound this probably also works) and the PIRQA-D pins can be
> mapped to ISA IRQs by the 0x55-0x57 config registers of the isa bridge
> (function0). This is what I implemented in via_isa_set_irq() in this series.
> >>
> >>>> There are only 4 PCI INT lines but the VIA components can be routed
> to 13 or 14 ISA IRQs.
> >>>
> >>> Pure PCI components are only able to trigger one of the four PCI intx
> pins they are *hardwired* to.
> >>
> >> This is true for PCI cards which can only use the 4 pins the slot they
> are in is wired to. These come in through the PIRQA-D pins and they are
> routed with the funstion 0 0x55-0x57 config registers. But I'm not sure
> about the internal functions.
> >>
> >>> Each component has only one pin. Which ISA IRQ gets triggered through
> that pin can be selected from 13 or 14 ISA IRQs as you say by means of the
> three configuration registers of the PCI -> ISA IRQ router.
> >>
> >> So you say that internal functions are also wired to the same 4 lines
> like normal PCI cards?
> >
> > Yes.
> >
> >> Then how can you route them to different interrupts setting their
> config reg 0x3c independent of function0 0x55-0x57 regs?
> >
> > 0x3c isn't supposed to be interpretet by hardware, and in general
> > hardware can't: 0x3c is standardized for every PCI function which
> > includes standalone PCI devices in particular. Standalone PCI devices
> > don't have access to an IRQ router. So if they don't, how could they
> > possibly configure the IRQ they are triggering?
> >
> > 0x3c is only information to the OS (populated by the BIOS). It merily
> > indicates that the PCI device needs attention when the IRQ configured in
> > 0x3c is raised. See comment 4 in
> >
> https://community.osr.com/discussion/30399/read-only-pci-interrupt-line-register
> > for another explanation.
>
> But we're not talking about notmal PCI devices attached to a PCI slot here
> but internal functions of the VIA southbridges which are internally
> connected in some way inside the chip. You (and also Mark before, check
> the previous discussion on via-ide half-native mode) seem to want to
> assume these functions are normal PCI devices and force them in that model
> but that does not match with what the VIA datasheet says and what guests
> running on these behave so I don't think we want to (or can) assume these
> internal functions are normal PCI devices.
>
> > Even though the south bridge contains an interrupt router doesn't mean
> > that its PCI functions can configure their IRQ through their 0x3c
> > registers. That would change the semantics of standardized PCI registers
> > which is surely not permitted by the standard. Instead, the PCI IRQs are
> > configured through the device-specific 0x55-0x57 regs.
>
> But the datasheets (both 686B and 8231) say so and guests do expect IRQ 9
> when the config reg of the AC97 and USB functions are set to that by the
> firmware. The 0x55-0x57 regs on function0 only configures the routing of
> the PIRQA-D pins which are external inputs to the chip while internal
> functions are routed by their 0x3c reg. At least that's how I understand
> the docs and how all the guests I've looked at seem to work. So I think
> this VIA device does not fully confirm to PCI standard with respect to its
> internal functions that are instead kind of mixed ISA/PCI things, probably
> for compatibility with contemporary OS drivers or trying to fit former ISA
> hardware to the then new PCI bus. These chips are from the 90's when these
> were new and maybe not that standardised or not everybody did everything
> in a standard way.
>
> > I see that 0x3c is also used for the USB functions. They used to trigger
> > the raw ISA IRQs before your series which seems wrong. I think 0x3c
> > usage needs to be cleaned up in the VIA model. Otherwise this will
> > likely cause problems elsewhere.
>
> Again, don't look at papers that this VIA chip might not follow. If
> anything, look at its datasheet and guests running on it for reference.
> The guests expect ISA IRQs as set in 0x3c of internal functions so these
> functions are not regular PCI devices. They are part of the chip and
> behave how the chip docs say which may not be fully match a normal PCI
> card. I think your proposed clesn up to make these functions PCI devices
> would break it becuase then you can't properly route IRQs the way the
> datasheet says. That's why I think this series is needed.
>
> >>>> How do you keep track of that with only the PCI bus interrupts?
> >>>
> >>> Devices that operate in ISA mode such as the IDE function shall have
> >>> their own, dedicated ISA IRQs assigned by the guest. Otherwise this
> >>> causes a classic interrupt conflict, just like in the olden ISA days.
> >>> If the function operates in PCI mode, it must not trigger the ISA
> >>> IRQs, regardless of whether they are assigned or not.
> >>
> >> This does not match with guests which clearly expect to get ISA IRQ9
> >> for PCI cards and USB and sound which is where these are routed within
> >> the VIA bridge as the firmware programs it.
> >
> > What I meant was that a component able to operate in native/legacy/mixed
> > mode such as IDE must not use both PCI and legacy ISA interrupts at the
> > same time. Multiple PCI functions may of course share interrupts.
>
> The IDE part is even more complicated than other functions because of its
> "half-native" mode which is not quite what the datasheet suggests yet
> still both pegasos2 and fuloong2e guests seem to assume it works that way
> and we model it so now. So I think our model is correct we just doesn't
> model the startup state in legacy mode which is then immediately switched
> to native mode by the firmware anyway so we only model that, but a quirk
> in real hardware seems to be that contrary to the docs the IRQs are still
> tied to the legasy 14/15 even when in native mode and the full native mode
> IRQ routing via 0x3c is not implemented. The pegasos2 firmware sets the
> ide function to native mode and sets 0x3c to 9 but then guests still
> expect to get IRQs via 14/15. This is what the Linux kernel fixes up in
> the device tree for it's drivers to work, MorphOS just knows and does not
> care about the 0x3c setting yet it excpects to be able to set io addresses
> with BARs so it assumes native mode with legacy IRQs. This was what we
> were discussing long ago and now looks like we're back to that again just
> with you instead of Mark.
>
> >>> There is also the power management function whose ACPI interrupt (SCI)
> >>> can be routed by means of a dedicated register. Again, a guest must
> >>> make sure here to not configure interrupt conflicts.
> >>>
> >>>> I don't get your approach.
> >>>
> >>> I hope that I could help you get a better understanding. The linked
> >>> .pdf is good and comprehensive reading material.
> >>
> >> I'm not sure the via-ide confirms to that doc but it's also not any
> >> more a problem with via-ide now. That was discussed to death back then
> >> and "fixed" to work for the cases we want it to work with. We probably
> >> never agreed on how this really works but at least what we ended up
> >> with works with guests that run on real hardware. I'm OK with also
> >> making these cases work that we want now such as network and sound card
> >> under AmigaOS and sound under MorphOS (as long as you don't use USB) on
> >> pegasos2. This series does that so unless it breaks something that
> >> worked before I condider this moving forward and we can always improve
> >> adn fix it later. I'm not saying I'm not interested in your
> >> improvements just that let's that not hold this back now as we can fix
> >> and improve it later but otherwise users will have to wait until
> >> September to be able to use it. I know a few who want this and getting
> >> this out as it is would allow more people to test it and report
> >> problems so unless there are clearly wrong parts I'm OK with less than
> >> perfect but working solution as long as it's not too messy.
> >
> > Patch 1 really seems like duplicating PCI code that already exists in
> > QEMU. This is not needed and we should avoid that.
> >
> > Moreover, usage of the IRQ line register (0x3c) for interrupt routing
> > should be switched to using the 0x55-0x57 regs to be PCI compliant.
>
> That would not work because then guests were not able to separately
> configure IRQs for PCI interrupt lines and internal functions which is
> what the datasheet says should be possible. The internal functions' IRQs
> are not affeceted by 0x55-0x57 but routed by different registers.


How do you know?

I think
> your series only work because pegasos2 firmware progeams everything to
> IRQ9 but if a guest decided to change that and route e.g. USB somewhere
> else then it would break. My series models that a bit better but may still
> break if a guest routes a function to an IRQ also controlled by some ISA
> device (like serial or ps2 keyboard) which are currently done within
> QEMU's ISA model so I can't easily channel those IRQs through the
> via-isa.for proper routing but it's unliikely guests would want to do that
> so in practice my series should work. We may duplicate PCI IRQ routing
> here but this chip does that and more so we need to implement it as it
> handles more than the 4 PCI interrupts so that implementation is not
> enough to handle all sources this chip has. This isn't a complex piece of
> code though so having a similar implementation is not a problem IMO.
>
> > Thanks to your great work to make via-ac97 work we can confirm that both
> > IRQ routing implementations basically work for now. Let's work out a
> > solution that relies on existing code, sticks to the standard and
> > hopefully works for i386 and MIPS, too.
>
> I'm still not convinced your implementation is correct


It seems that Mark (cc'd), I, the commenter in
https://community.osr.com/discussion/30399/read-only-pci-interrupt-line-register
and the PCI specification agree that the 0x3c regs aren't supposed to be
interpreted by hardware. I've provided a working example with no functional
downsides to the 0x3c approach. I've provided the PCI-IDE reading material
that Mark suggested for reading in
https://lore.kernel.org/qemu-devel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/
. I'm running out of ideas now on how to proceed.

Best regards,
Bernhard


> so I would atick to
> my series with that, that this could be improved and changed in the future
> in follow up series but I don't want that to hold this back now. So unless
> there's a good reason against taking this series now (like it breaking
> something) I'd like this to be merged for 8.0. I could go with your
> version which might work too as long as guests share IRQ of internal
> functions with PCI interrupts but I don't think that's correct and I think
> my series better models the actual hardware and more clearly separates
> components. whereas your proposal reuses code from PCI that's not quite
> adequate for the job it's supposed to do. So I think in this case that
> should not be reused here. The VIA chip is more complex than a simple PCI
> IRQ router, that's just a part of its IRQ routing. It handles more sources
> than just the 4 PCI interrupt lines.
>
> Regards,
> BALATON Zoltan

--000000000000a9a81405f55dd75f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23, 2023 at 1:34 PM BALAT=
ON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 23 Feb 2023, Bernhard Beschow wrote:<br>
&gt; Am 22. Februar 2023 23:00:02 UTC schrieb BALATON Zoltan &lt;<a href=3D=
"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;:<b=
r>
&gt;&gt; On Wed, 22 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt; Am 22. Februar 2023 21:12:01 UTC schrieb BALATON Zoltan &lt;<a=
 href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a=
>&gt;:<br>
&gt;&gt;&gt;&gt; On Wed, 22 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt;&gt;&gt; Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zolta=
n &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.b=
me.hu</a>&gt;:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Wed, 22 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Wed, Feb 22, 2023 at 4:38 PM Bernhard Besch=
ow &lt;<a href=3D"mailto:shentey@gmail.com" target=3D"_blank">shentey@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;ve had a closer look at your series =
and I think it can be simplified:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Patch 2 can be implemented quite straight-=
forward like I proposed in a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; private mail: <a href=3D"https://github.co=
m/shentok/qemu/commit/via-priq-routing" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/shentok/qemu/commit/via-priq-routing</a>.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Then, in order to make patch 3 &quot;hw/pp=
c/pegasos2: Fix PCI interrupt routing&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; working, one can expose the PCI interrupts=
 with a single line like you do<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; in patch 2. With this, patch 1 &quot;hw/is=
a/vt82c686: Implement interrupt<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; routing in via_isa_set_irq&quot; isn&#39;t=
 needed any longer and can be omitted.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; In via-ac97, rather than using via_isa_set=
_irq(), pci_set_irq() can be<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; used instead. pci_set_irq() internally tak=
es care of all the ISA interrupt<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; level tracking patch 1 attempted to addres=
s.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Here is a proof of concept branch to demonstra=
te that the simplification<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; actually works: <a href=3D"https://github.com/=
shentok/qemu/commits/pegasos2" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/shentok/qemu/commits/pegasos2</a> (Tested<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; with MorphOS with and without pegasos2.rom).<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Does this only work because both the via-ac97 and =
the PCI interrupts are mapped to the same ISA IRQ and you&#39;ve only teste=
d sound? The guest could configure each device to use a different IRQ, also=
 mapping them so they share one ISA interrupt. What happens if multiple dev=
ices are mapped to IRQ 9 (which is the case on pegasos2 where PCI cards, ac=
97 and USB all share this IRQ) and more than one such device wants to raise=
 an interrupt at the same time? If you ack the ac97 interrupt but a PCI net=
work card or the USB part still wants to get the CPUs attention the ISA IRQ=
 should remain raised until all devices are serviced.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; pci_bus_get_irq_level(), used in via_isa_set_pci_irq()=
, should handle<br>
&gt;&gt;&gt;&gt;&gt; exactly that case very well.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I don&#39;t see a way to track the status of all d=
evices in a single qemu_irq which can only be up or down so we need somethi=
ng to store the state of each source.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; pci_set_irq() causes pci_bus_change_irq_level() to be =
called.<br>
&gt;&gt;&gt;&gt;&gt; pci_bus_change_irq_level() tracks the sum of all irq l=
evels of all<br>
&gt;&gt;&gt;&gt;&gt; devices attached to a particular pin in irq_count. Hav=
e a look at<br>
&gt;&gt;&gt;&gt;&gt; pci_bus_change_irq_level() and you will understand bet=
ter.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m aware of that, we&#39;re using that in sam460ex wh=
ich connects all PCI interrupt lines to a single IRQ and Peter explored and=
 explained it in a comment there when that was discovered. First we had a p=
atch with or-irq but due to this behaviot that&#39;s not needed for PCI int=
errupts. But the VT8132 could change what ISA IRQ you route the sub functio=
ns to.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; That depends on the sub function if you can do that. And if so=
, then it depends on whether the function is still in PCI mode (see below).=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It happens that on pegasos2 by default all of those are ro=
uted to IRQ9 except IDE<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; All *PCI* interrupts are routed to IRQ9 while IDE legacy inter=
rupts are routed to the compatible ISA IRQs. Note that the IDE function mus=
t only trigger the ISA IRQs if it is in legacy mode while it must only trig=
ger the PCI IRQ in non-legacy mode. See <a href=3D"https://www.bswd.com/pci=
ide.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.bswd.com/pciide.p=
df</a> for more details on this particular topic.<br>
&gt;&gt;<br>
&gt;&gt; The docs say so but based on what guests that work on real hardwar=
e do it does not work that way. Look up previous discussion on this on the =
list from around the time Mark changed via-ide about 4-5 years ago. That se=
ries was a result of his review of my proposed changes and gave resuled in =
an alternative appdroach. On pegasos2 (and probably also on fuloong2e based=
 on same later findings, see patches to that, I can try to find these later=
 if you can&#39;t find them) via-ide *always* uses IRQ 14/15 and the native=
 mode only switches register addresses from legacy io ports to PCI io space=
 so you can set it in with BAR regs but the IRQs don&#39;t change despite w=
hat the docs say. There are some hacks in Linux kernel and other guests to =
account for this but the comments for the reason are wrong in Linux, they s=
ay IDE is always in legacy mode but in fact if has a half-native mode which=
 is what I called it where io addresses are set with BARs but IRQs are stil=
l the legacy ISA ones. You can find s<br>
=C2=A0ome references in previous discussion. Probably searching for via-ide=
 half-native mode might find it.<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; but what if a guest changes ac97 to use a different interr=
upt? Then it&#39;s not a PCI interrupt any more so you can&#39;t use pci_se=
t_irq in via=3Dac97.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; How would it do that? AFAICS there is no dedicated register to=
 configure which IRQ to use. This means that it can only trigger an interru=
pt via its PCI intx pin which is subject to the PCI -&gt; ISA IRQ router.<b=
r>
&gt;&gt;<br>
&gt;&gt; The VIA functions can use their PCI_INTERRUPT_LINE (0x3c) register=
s to set their ISA IRQ according to the docs (and unlike IDE in other funct=
ions like USB and sound this probably also works) and the PIRQA-D pins can =
be mapped to ISA IRQs by the 0x55-0x57 config registers of the isa bridge (=
function0). This is what I implemented in via_isa_set_irq() in this series.=
<br>
&gt;&gt;<br>
&gt;&gt;&gt;&gt; There are only 4 PCI INT lines but the VIA components can =
be routed to 13 or 14 ISA IRQs.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Pure PCI components are only able to trigger one of the four P=
CI intx pins they are *hardwired* to.<br>
&gt;&gt;<br>
&gt;&gt; This is true for PCI cards which can only use the 4 pins the slot =
they are in is wired to. These come in through the PIRQA-D pins and they ar=
e routed with the funstion 0 0x55-0x57 config registers. But I&#39;m not su=
re about the internal functions.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Each component has only one pin. Which ISA IRQ gets triggered =
through that pin can be selected from 13 or 14 ISA IRQs as you say by means=
 of the three configuration registers of the PCI -&gt; ISA IRQ router.<br>
&gt;&gt;<br>
&gt;&gt; So you say that internal functions are also wired to the same 4 li=
nes like normal PCI cards?<br>
&gt;<br>
&gt; Yes.<br>
&gt;<br>
&gt;&gt; Then how can you route them to different interrupts setting their =
config reg 0x3c independent of function0 0x55-0x57 regs?<br>
&gt;<br>
&gt; 0x3c isn&#39;t supposed to be interpretet by hardware, and in general =
<br>
&gt; hardware can&#39;t: 0x3c is standardized for every PCI function which =
<br>
&gt; includes standalone PCI devices in particular. Standalone PCI devices =
<br>
&gt; don&#39;t have access to an IRQ router. So if they don&#39;t, how coul=
d they <br>
&gt; possibly configure the IRQ they are triggering?<br>
&gt;<br>
&gt; 0x3c is only information to the OS (populated by the BIOS). It merily =
<br>
&gt; indicates that the PCI device needs attention when the IRQ configured =
in <br>
&gt; 0x3c is raised. See comment 4 in <br>
&gt; <a href=3D"https://community.osr.com/discussion/30399/read-only-pci-in=
terrupt-line-register" rel=3D"noreferrer" target=3D"_blank">https://communi=
ty.osr.com/discussion/30399/read-only-pci-interrupt-line-register</a> <br>
&gt; for another explanation.<br>
<br>
But we&#39;re not talking about notmal PCI devices attached to a PCI slot h=
ere <br>
but internal functions of the VIA southbridges which are internally <br>
connected in some way inside the chip. You (and also Mark before, check <br=
>
the previous discussion on via-ide half-native mode) seem to want to <br>
assume these functions are normal PCI devices and force them in that model =
<br>
but that does not match with what the VIA datasheet says and what guests <b=
r>
running on these behave so I don&#39;t think we want to (or can) assume the=
se <br>
internal functions are normal PCI devices.<br>
<br>
&gt; Even though the south bridge contains an interrupt router doesn&#39;t =
mean <br>
&gt; that its PCI functions can configure their IRQ through their 0x3c <br>
&gt; registers. That would change the semantics of standardized PCI registe=
rs <br>
&gt; which is surely not permitted by the standard. Instead, the PCI IRQs a=
re <br>
&gt; configured through the device-specific 0x55-0x57 regs.<br>
<br>
But the datasheets (both 686B and 8231) say so and guests do expect IRQ 9 <=
br>
when the config reg of the AC97 and USB functions are set to that by the <b=
r>
firmware. The 0x55-0x57 regs on function0 only configures the routing of <b=
r>
the PIRQA-D pins which are external inputs to the chip while internal <br>
functions are routed by their 0x3c reg. At least that&#39;s how I understan=
d <br>
the docs and how all the guests I&#39;ve looked at seem to work. So I think=
 <br>
this VIA device does not fully confirm to PCI standard with respect to its =
<br>
internal functions that are instead kind of mixed ISA/PCI things, probably =
<br>
for compatibility with contemporary OS drivers or trying to fit former ISA =
<br>
hardware to the then new PCI bus. These chips are from the 90&#39;s when th=
ese <br>
were new and maybe not that standardised or not everybody did everything <b=
r>
in a standard way.<br>
<br>
&gt; I see that 0x3c is also used for the USB functions. They used to trigg=
er <br>
&gt; the raw ISA IRQs before your series which seems wrong. I think 0x3c <b=
r>
&gt; usage needs to be cleaned up in the VIA model. Otherwise this will <br=
>
&gt; likely cause problems elsewhere.<br>
<br>
Again, don&#39;t look at papers that this VIA chip might not follow. If <br=
>
anything, look at its datasheet and guests running on it for reference. <br=
>
The guests expect ISA IRQs as set in 0x3c of internal functions so these <b=
r>
functions are not regular PCI devices. They are part of the chip and <br>
behave how the chip docs say which may not be fully match a normal PCI <br>
card. I think your proposed clesn up to make these functions PCI devices <b=
r>
would break it becuase then you can&#39;t properly route IRQs the way the <=
br>
datasheet says. That&#39;s why I think this series is needed.<br>
<br>
&gt;&gt;&gt;&gt; How do you keep track of that with only the PCI bus interr=
upts?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Devices that operate in ISA mode such as the IDE function shal=
l have <br>
&gt;&gt;&gt; their own, dedicated ISA IRQs assigned by the guest. Otherwise=
 this <br>
&gt;&gt;&gt; causes a classic interrupt conflict, just like in the olden IS=
A days. <br>
&gt;&gt;&gt; If the function operates in PCI mode, it must not trigger the =
ISA <br>
&gt;&gt;&gt; IRQs, regardless of whether they are assigned or not.<br>
&gt;&gt;<br>
&gt;&gt; This does not match with guests which clearly expect to get ISA IR=
Q9 <br>
&gt;&gt; for PCI cards and USB and sound which is where these are routed wi=
thin <br>
&gt;&gt; the VIA bridge as the firmware programs it.<br>
&gt;<br>
&gt; What I meant was that a component able to operate in native/legacy/mix=
ed <br>
&gt; mode such as IDE must not use both PCI and legacy ISA interrupts at th=
e <br>
&gt; same time. Multiple PCI functions may of course share interrupts.<br>
<br>
The IDE part is even more complicated than other functions because of its <=
br>
&quot;half-native&quot; mode which is not quite what the datasheet suggests=
 yet <br>
still both pegasos2 and fuloong2e guests seem to assume it works that way <=
br>
and we model it so now. So I think our model is correct we just doesn&#39;t=
 <br>
model the startup state in legacy mode which is then immediately switched <=
br>
to native mode by the firmware anyway so we only model that, but a quirk <b=
r>
in real hardware seems to be that contrary to the docs the IRQs are still <=
br>
tied to the legasy 14/15 even when in native mode and the full native mode =
<br>
IRQ routing via 0x3c is not implemented. The pegasos2 firmware sets the <br=
>
ide function to native mode and sets 0x3c to 9 but then guests still <br>
expect to get IRQs via 14/15. This is what the Linux kernel fixes up in <br=
>
the device tree for it&#39;s drivers to work, MorphOS just knows and does n=
ot <br>
care about the 0x3c setting yet it excpects to be able to set io addresses =
<br>
with BARs so it assumes native mode with legacy IRQs. This was what we <br>
were discussing long ago and now looks like we&#39;re back to that again ju=
st <br>
with you instead of Mark.<br>
<br>
&gt;&gt;&gt; There is also the power management function whose ACPI interru=
pt (SCI) <br>
&gt;&gt;&gt; can be routed by means of a dedicated register. Again, a guest=
 must <br>
&gt;&gt;&gt; make sure here to not configure interrupt conflicts.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I don&#39;t get your approach.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I hope that I could help you get a better understanding. The l=
inked <br>
&gt;&gt;&gt; .pdf is good and comprehensive reading material.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not sure the via-ide confirms to that doc but it&#39;s als=
o not any <br>
&gt;&gt; more a problem with via-ide now. That was discussed to death back =
then <br>
&gt;&gt; and &quot;fixed&quot; to work for the cases we want it to work wit=
h. We probably <br>
&gt;&gt; never agreed on how this really works but at least what we ended u=
p <br>
&gt;&gt; with works with guests that run on real hardware. I&#39;m OK with =
also <br>
&gt;&gt; making these cases work that we want now such as network and sound=
 card <br>
&gt;&gt; under AmigaOS and sound under MorphOS (as long as you don&#39;t us=
e USB) on <br>
&gt;&gt; pegasos2. This series does that so unless it breaks something that=
 <br>
&gt;&gt; worked before I condider this moving forward and we can always imp=
rove <br>
&gt;&gt; adn fix it later. I&#39;m not saying I&#39;m not interested in you=
r <br>
&gt;&gt; improvements just that let&#39;s that not hold this back now as we=
 can fix <br>
&gt;&gt; and improve it later but otherwise users will have to wait until <=
br>
&gt;&gt; September to be able to use it. I know a few who want this and get=
ting <br>
&gt;&gt; this out as it is would allow more people to test it and report <b=
r>
&gt;&gt; problems so unless there are clearly wrong parts I&#39;m OK with l=
ess than <br>
&gt;&gt; perfect but working solution as long as it&#39;s not too messy.<br=
>
&gt;<br>
&gt; Patch 1 really seems like duplicating PCI code that already exists in =
<br>
&gt; QEMU. This is not needed and we should avoid that.<br>
&gt;<br>
&gt; Moreover, usage of the IRQ line register (0x3c) for interrupt routing =
<br>
&gt; should be switched to using the 0x55-0x57 regs to be PCI compliant.<br=
>
<br>
That would not work because then guests were not able to separately <br>
configure IRQs for PCI interrupt lines and internal functions which is <br>
what the datasheet says should be possible. The internal functions&#39; IRQ=
s <br>
are not affeceted by 0x55-0x57 but routed by different registers.</blockquo=
te><div><br></div><div>How do you know?</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">I think <br>
your series only work because pegasos2 firmware progeams everything to <br>
IRQ9 but if a guest decided to change that and route e.g. USB somewhere <br=
>
else then it would break. My series models that a bit better but may still =
<br>
break if a guest routes a function to an IRQ also controlled by some ISA <b=
r>
device (like serial or ps2 keyboard) which are currently done within <br>
QEMU&#39;s ISA model so I can&#39;t easily channel those IRQs through the <=
br>
via-isa.for proper routing but it&#39;s unliikely guests would want to do t=
hat <br>
so in practice my series should work. We may duplicate PCI IRQ routing <br>
here but this chip does that and more so we need to implement it as it <br>
handles more than the 4 PCI interrupts so that implementation is not <br>
enough to handle all sources this chip has. This isn&#39;t a complex piece =
of <br>
code though so having a similar implementation is not a problem IMO.<br>
<br>
&gt; Thanks to your great work to make via-ac97 work we can confirm that bo=
th <br>
&gt; IRQ routing implementations basically work for now. Let&#39;s work out=
 a <br>
&gt; solution that relies on existing code, sticks to the standard and <br>
&gt; hopefully works for i386 and MIPS, too.<br>
<br>
I&#39;m still not convinced your implementation is correct</blockquote><div=
><br></div><div><div>It seems that Mark (cc&#39;d), I, the commenter in <a =
href=3D"https://community.osr.com/discussion/30399/read-only-pci-interrupt-=
line-register" rel=3D"noreferrer" target=3D"_blank">https://community.osr.c=
om/discussion/30399/read-only-pci-interrupt-line-register</a> and the PCI s=
pecification agree that the 0x3c regs aren&#39;t supposed to be interpreted=
 by hardware. I&#39;ve provided a working example with no functional downsi=
des to the 0x3c approach. I&#39;ve provided the PCI-IDE reading material th=
at Mark suggested for reading in <a href=3D"https://lore.kernel.org/qemu-de=
vel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/">https://lore.kernel=
.org/qemu-devel/b38987d5-5530-ecd9-2fd2-3a57e1a611dd@ilande.co.uk/</a> . I&=
#39;m  running out of ideas now on how to proceed.</div><div><br></div><div=
>Best regards,</div><div>Bernhard<br></div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">so I would atick to <br>
my series with that, that this could be improved and changed in the future =
<br>
in follow up series but I don&#39;t want that to hold this back now. So unl=
ess <br>
there&#39;s a good reason against taking this series now (like it breaking =
<br>
something) I&#39;d like this to be merged for 8.0. I could go with your <br=
>
version which might work too as long as guests share IRQ of internal <br>
functions with PCI interrupts but I don&#39;t think that&#39;s correct and =
I think <br>
my series better models the actual hardware and more clearly separates <br>
components. whereas your proposal reuses code from PCI that&#39;s not quite=
 <br>
adequate for the job it&#39;s supposed to do. So I think in this case that =
<br>
should not be reused here. The VIA chip is more complex than a simple PCI <=
br>
IRQ router, that&#39;s just a part of its IRQ routing. It handles more sour=
ces <br>
than just the 4 PCI interrupt lines.<br>
<br>
Regards,<br>
BALATON Zoltan</blockquote></div></div>

--000000000000a9a81405f55dd75f--

