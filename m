Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CC69FE60
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:21:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxTf-0001vB-R9; Wed, 22 Feb 2023 17:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUxTa-0001u8-Q4; Wed, 22 Feb 2023 17:20:39 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUxTY-0004Vq-I0; Wed, 22 Feb 2023 17:20:38 -0500
Received: by mail-ed1-x529.google.com with SMTP id cy6so30942912edb.5;
 Wed, 22 Feb 2023 14:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWl4GgMkdVjWPjQL+78n2wEOpTRIIp/yGhexlS6jD2o=;
 b=D8kaZ5D4IgDCkkfb7izmQ7ljncL27rg0XJE4Tg+ZfGz/MViG7v6sLkM2eO5rxnbGHG
 YHK8ETi9+KpoDT9P6LrbRG579gwQdEjzrMNP51r+yiJ43+bYEvwa6znVFNpoEzXFVtwr
 ESIgs1hN7udM5NUS1P1hhPByc9lSc6kIfHiQs5hPk76YnUxAAJ46sGaEfw5GgZCQpX/3
 fyo6YyQ9JBG51geFtsiRy1T0UBqycKjp/I2r9zGgomYRUiMD2wpGTPrJAKZIPXemssu0
 zZAlnMx1sYhzXw1nZUkhH6NueCOeEoVzYfg1wvq3X+Nikis/g+sLCfQ5TFLWKMMVt3/R
 uLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWl4GgMkdVjWPjQL+78n2wEOpTRIIp/yGhexlS6jD2o=;
 b=00Amh96rpwX0z4tIq0g3xyozIZf8bn/RWwejmZmgKZjs6rKh5/mEc2pth0SbEqdmpC
 BQr0Zg7VqFFlsqmy0bCQ4MWBkoGfJi15liSouB0HxVv/GaBqYqU4mNqTmi4qWD/dJPmR
 fpalzXxhfNmjiO+cx+Di4bffoWjyZFkWdZ3rJv7Nlxbt2yl178UzueON0+iDZbOxdm5M
 xwV7VR65oZPMU/WE5/JmuU3G6OkPMEfdsZt/8gQ+L6VsmfPTybVF4ajCJI0coNEw5c9l
 IPKf6UCxV4b5R2oLNz72LalIWvD79koq3QD9Cr5D614d0eJvHz5A3kd8kaQmL6FSfd8g
 GBBg==
X-Gm-Message-State: AO0yUKUkpIF1rAtQOeXd9qcYCXn9f1qo0Ql49KEViBjRA1p3nFVcl/jn
 u627lJVv6Oid1FOedM7Bjxo=
X-Google-Smtp-Source: AK7set8eplAxP4KTtDmQezNVZQYXZVEWXCGms5phFJskkQQBeazLENGS1iZiDW4GScsyYYS/1L3Xxw==
X-Received: by 2002:a17:907:7ea9:b0:8e4:dc2b:4550 with SMTP id
 qb41-20020a1709077ea900b008e4dc2b4550mr6171365ejc.64.1677104432643; 
 Wed, 22 Feb 2023 14:20:32 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00dc7226af23ff2fba.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:dc72:26af:23ff:2fba])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a1709060acb00b008ba9e67ea4asm6575416ejf.133.2023.02.22.14.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:20:32 -0800 (PST)
Date: Wed, 22 Feb 2023 22:20:21 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
Message-ID: <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 22=2E Februar 2023 21:12:01 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>> Am 22=2E Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail=2Ecom=
> wrote:
>>>>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik=2Ebme=2E=
hu> wrote:
>>>>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and ad=
ds
>>>>>> partial implementation of the via-ac97 sound part enough to get aud=
io
>>>>>> output=2E I'd like this to be merged for QEMU 8=2E0=2E
>>>>>>=20
>>>>>> Regards,
>>>>>> BALATON Zoltan
>>>>>>=20
>>>>>> BALATON Zoltan (5):
>>>>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>>>>   hw/audio/ac97: Split off some definitions to a header
>>>>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>>>>=20
>>>>>>  hw/audio/ac97=2Ec            |  43 +---
>>>>>>  hw/audio/ac97=2Eh            |  65 ++++++
>>>>>>  hw/audio/trace-events      |   6 +
>>>>>>  hw/audio/via-ac97=2Ec        | 436 +++++++++++++++++++++++++++++++=
+++++-
>>>>>>  hw/ide/via=2Ec               |   2 +-
>>>>>>  hw/isa/vt82c686=2Ec          |  61 +++++-
>>>>>>  hw/pci-host/mv64361=2Ec      |   4 -
>>>>>>  hw/ppc/pegasos2=2Ec          |  26 ++-
>>>>>>  hw/usb/vt82c686-uhci-pci=2Ec |   5 +-
>>>>>>  include/hw/isa/vt82c686=2Eh  |  39 +++-
>>>>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>>>>  create mode 100644 hw/audio/ac97=2Eh
>>>>>>=20
>>>>>> --
>>>>>> 2=2E30=2E7
>>>>>>=20
>>>>>>=20
>>>>> Wow, the MorphOS people paid attention to sound design=2E Thanks for
>>>>> presenting it to us, Zoltan!
>>>>>=20
>>>>> I've had a closer look at your series and I think it can be simplifi=
ed:
>>>>> Patch 2 can be implemented quite straight-forward like I proposed in=
 a
>>>>> private mail: https://github=2Ecom/shentok/qemu/commit/via-priq-rout=
ing=2E
>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt r=
outing"
>>>>> working, one can expose the PCI interrupts with a single line like y=
ou do
>>>>> in patch 2=2E With this, patch 1 "hw/isa/vt82c686: Implement interru=
pt
>>>>> routing in via_isa_set_irq" isn't needed any longer and can be omitt=
ed=2E
>>>>>=20
>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can =
be
>>>>> used instead=2E pci_set_irq() internally takes care of all the ISA i=
nterrupt
>>>>> level tracking patch 1 attempted to address=2E
>>>>>=20
>>>>=20
>>>> Here is a proof of concept branch to demonstrate that the simplificat=
ion
>>>> actually works: https://github=2Ecom/shentok/qemu/commits/pegasos2 (T=
ested
>>>> with MorphOS with and without pegasos2=2Erom)=2E
>>>=20
>>> Does this only work because both the via-ac97 and the PCI interrupts a=
re mapped to the same ISA IRQ and you've only tested sound? The guest could=
 configure each device to use a different IRQ, also mapping them so they sh=
are one ISA interrupt=2E What happens if multiple devices are mapped to IRQ=
 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all share t=
his IRQ) and more than one such device wants to raise an interrupt at the s=
ame time? If you ack the ac97 interrupt but a PCI network card or the USB p=
art still wants to get the CPUs attention the ISA IRQ should remain raised =
until all devices are serviced=2E
>>=20
>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
>> exactly that case very well=2E
>>=20
>>> I don't see a way to track the status of all devices in a single qemu_=
irq which can only be up or down so we need something to store the state of=
 each source=2E
>>=20
>> pci_set_irq() causes pci_bus_change_irq_level() to be called=2E
>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>> devices attached to a particular pin in irq_count=2E Have a look at
>> pci_bus_change_irq_level() and you will understand better=2E
>
>I'm aware of that, we're using that in sam460ex which connects all PCI in=
terrupt lines to a single IRQ and Peter explored and explained it in a comm=
ent there when that was discovered=2E First we had a patch with or-irq but =
due to this behaviot that's not needed for PCI interrupts=2E But the VT8132=
 could change what ISA IRQ you route the sub functions to=2E

That depends on the sub function if you can do that=2E And if so, then it =
depends on whether the function is still in PCI mode (see below)=2E

>It happens that on pegasos2 by default all of those are routed to IRQ9 ex=
cept IDE

All *PCI* interrupts are routed to IRQ9 while IDE legacy interrupts are ro=
uted to the compatible ISA IRQs=2E Note that the IDE function must only tri=
gger the ISA IRQs if it is in legacy mode while it must only trigger the PC=
I IRQ in non-legacy mode=2E See https://www=2Ebswd=2Ecom/pciide=2Epdf for m=
ore details on this particular topic=2E

>but what if a guest changes ac97 to use a different interrupt? Then it's =
not a PCI interrupt any more so you can't use pci_set_irq in via=3Dac97=2E

How would it do that? AFAICS there is no dedicated register to configure w=
hich IRQ to use=2E This means that it can only trigger an interrupt via its=
 PCI intx pin which is subject to the PCI -> ISA IRQ router=2E

> There are only 4 PCI INT lines but the VIA components can be routed to 1=
3 or 14 ISA IRQs=2E

Pure PCI components are only able to trigger one of the four PCI intx pins=
 they are *hardwired* to=2E Each component has only one pin=2E Which ISA IR=
Q gets triggered through that pin can be selected from 13 or 14 ISA IRQs as=
 you say by means of the three configuration registers of the PCI -> ISA IR=
Q router=2E

>How do you keep track of that with only the PCI bus interrupts?

Devices that operate in ISA mode such as the IDE function shall have their=
 own, dedicated ISA IRQs assigned by the guest=2E Otherwise this causes a c=
lassic interrupt conflict, just like in the olden ISA days=2E If the functi=
on operates in PCI mode, it must not trigger the ISA IRQs, regardless of wh=
ether they are assigned or not=2E

There is also the power management function whose ACPI interrupt (SCI) can=
 be routed by means of a dedicated register=2E Again, a guest must make sur=
e here to not configure interrupt conflicts=2E

>I don't get your approach=2E

I hope that I could help you get a better understanding=2E The linked =2Ep=
df is good and comprehensive reading material=2E

Best regards,
Bernhard

>
>>> My patch adds a state register to each ISA IRQ line for all possible s=
ources which could probably be stored once but then for each change of ISA =
IRQ status all the mapped devices should be checked and combined so it's ea=
sier to store them for each IRQ=2E Does your approach still work if you pla=
y sound, and copy something from network to a USB device at the same time? =
(I'm not sure mine does not have remaining bugs but I don't think this can =
be simplified that way but if you can prove it would work I don't mind taki=
ng an alternative version but I'm not convinced yet=2E)
>>=20
>> Well, I can't prove that my approach works but unfortunately I can
>> prove that both our approaches cause a freeze :/ Try:
>> 1=2E Start `qemu-system-ppc -M pegasos2 -bios pegasos2=2Erom -rtc
>> base=3Dlocaltime -device ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cd=
rom
>> morphos-3=2E17=2Eiso -device usb-mouse -device usb-kbd`
>> 2=2E Move the mouse while sound is playing
>> -> Observe the VM to freeze
>>=20
>> So there must be an issue somewhere else=2E=2E=2E
>
>I'll have a look later but my patch attempts to handle the USB controller=
 interrupts=2E There may be another bug somewhere in USB emulation though, =
we have similar problem with mac99 with older MacOS guests=2E Considering t=
hat USB devices probably did not work at all before this patch it's at leas=
t still an imptovement=2E :-)
>
>Regards,
>BALATON Zoltan

