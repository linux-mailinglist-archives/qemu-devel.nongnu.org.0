Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413B6A048E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 10:13:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV7fA-0002nj-I1; Thu, 23 Feb 2023 04:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pV7f9-0002nY-5U; Thu, 23 Feb 2023 04:13:15 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pV7f6-0004RU-OF; Thu, 23 Feb 2023 04:13:14 -0500
Received: by mail-ed1-x52f.google.com with SMTP id s26so39679271edw.11;
 Thu, 23 Feb 2023 01:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNeDMYq58bqUithg3Zbl4EWHDPhlFdvmwWnAVcjoVYU=;
 b=YjVu8iuealPs92xxPgKEj/s8Br3hxO2WLCDq7zmIj+UnOkdems7/obbV0APwGHMgok
 Mef1qUTAgDpDsnzrGho9dTg1rpJOmh5uUTI5YhHaKBb2rBv8CM10AXoaLwaY51xpvN3O
 LRBPfN74nHmc28fVhzhWdfQ6BVBbgKLmx8Hp7+4pP+u6bj2HRD+jBL7A9eTN9SqmsKUI
 bmOZlH08CZ/KYdbN1MRUoRw4YFc++H9UgSGQza9zGUJ2iaRWZEkpsdoS9GZE3Crfq9Do
 Kh5OYBFO8kNwbNclZcSYgQrD2tRZwZUpY/IRJ3ujFwKyFFJ8dx7eKoCvrnEMF+pRgv9i
 p3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNeDMYq58bqUithg3Zbl4EWHDPhlFdvmwWnAVcjoVYU=;
 b=RQNSqccYXGlOGS3EN/wZ3LzRL05Zm9c2nqO5tHYOPF7QyPjI+LgGTejbjzI2Ni7ec+
 NHAZD75LrRFIX8c5Rnx/BdxzPQq4DAYgsY6ZdRNKJ7xbxaKVJtlr9XMDuiCyATrw06MI
 M5h8IeMauk+8jTAsfW1TVVZBbwvi0Cny6E3V0LlDOsLt5Ucday/EMx9tT854ODdgsMX6
 Fijcpx53Sfmovd4PI2ifk2P7xA29YWnoDKt57+KaNgGCgbUiKfYZpPcdbjCprEEwg+V1
 eUX4xsW2cJ3nEbiX1KzdGbvCiLWN9AZehBFNtXzrwzyaWCb/faEStLYNxMM+YHDdWn07
 evPw==
X-Gm-Message-State: AO0yUKWI69hhdd/SSLspQukQAdRH4twEEY/P9V0CHw495cjmRcvmxn6F
 /R/kvsswPlhNmT6YKEbT9Jk=
X-Google-Smtp-Source: AK7set+pnAw22g+DNLmweG45gd0GT2qk/F7lgPJeZ2cCkp4bkcacROboq+9S1/hP2B143KLfU+dY5g==
X-Received: by 2002:a17:907:1686:b0:8af:2f5e:93e3 with SMTP id
 hc6-20020a170907168600b008af2f5e93e3mr18218575ejc.29.1677143590037; 
 Thu, 23 Feb 2023 01:13:10 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee0069bc6d590f31a9b0.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:69bc:6d59:f31:a9b0])
 by smtp.gmail.com with ESMTPSA id
 um8-20020a170907cb0800b008cca31606a8sm5563272ejc.51.2023.02.23.01.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:13:09 -0800 (PST)
Date: Thu, 23 Feb 2023 09:13:05 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
In-Reply-To: <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
 <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
 <67daf5dd-de6a-2d55-c830-8650efc59ee0@eik.bme.hu>
 <8AA6E5E4-6E9F-427D-9F65-D79D4FEEC1A0@gmail.com>
 <7df4771f-e6ab-af3d-3e82-98cb1c4dfce0@eik.bme.hu>
Message-ID: <14710BE7-AD6F-452E-A3F5-3E9B08F95FD3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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



Am 22=2E Februar 2023 23:00:02 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>> Am 22=2E Februar 2023 21:12:01 UTC schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>> Am 22=2E Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@ei=
k=2Ebme=2Ehu>:
>>>>> On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>>>>>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail=2Ec=
om> wrote:
>>>>>>> I've had a closer look at your series and I think it can be simpli=
fied:
>>>>>>> Patch 2 can be implemented quite straight-forward like I proposed =
in a
>>>>>>> private mail: https://github=2Ecom/shentok/qemu/commit/via-priq-ro=
uting=2E
>>>>>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt=
 routing"
>>>>>>> working, one can expose the PCI interrupts with a single line like=
 you do
>>>>>>> in patch 2=2E With this, patch 1 "hw/isa/vt82c686: Implement inter=
rupt
>>>>>>> routing in via_isa_set_irq" isn't needed any longer and can be omi=
tted=2E
>>>>>>>=20
>>>>>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() ca=
n be
>>>>>>> used instead=2E pci_set_irq() internally takes care of all the ISA=
 interrupt
>>>>>>> level tracking patch 1 attempted to address=2E
>>>>>>>=20
>>>>>>=20
>>>>>> Here is a proof of concept branch to demonstrate that the simplific=
ation
>>>>>> actually works: https://github=2Ecom/shentok/qemu/commits/pegasos2 =
(Tested
>>>>>> with MorphOS with and without pegasos2=2Erom)=2E
>>>>>=20
>>>>> Does this only work because both the via-ac97 and the PCI interrupts=
 are mapped to the same ISA IRQ and you've only tested sound? The guest cou=
ld configure each device to use a different IRQ, also mapping them so they =
share one ISA interrupt=2E What happens if multiple devices are mapped to I=
RQ 9 (which is the case on pegasos2 where PCI cards, ac97 and USB all share=
 this IRQ) and more than one such device wants to raise an interrupt at the=
 same time? If you ack the ac97 interrupt but a PCI network card or the USB=
 part still wants to get the CPUs attention the ISA IRQ should remain raise=
d until all devices are serviced=2E
>>>>=20
>>>> pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
>>>> exactly that case very well=2E
>>>>=20
>>>>> I don't see a way to track the status of all devices in a single qem=
u_irq which can only be up or down so we need something to store the state =
of each source=2E
>>>>=20
>>>> pci_set_irq() causes pci_bus_change_irq_level() to be called=2E
>>>> pci_bus_change_irq_level() tracks the sum of all irq levels of all
>>>> devices attached to a particular pin in irq_count=2E Have a look at
>>>> pci_bus_change_irq_level() and you will understand better=2E
>>>=20
>>> I'm aware of that, we're using that in sam460ex which connects all PCI=
 interrupt lines to a single IRQ and Peter explored and explained it in a c=
omment there when that was discovered=2E First we had a patch with or-irq b=
ut due to this behaviot that's not needed for PCI interrupts=2E But the VT8=
132 could change what ISA IRQ you route the sub functions to=2E
>>=20
>> That depends on the sub function if you can do that=2E And if so, then =
it depends on whether the function is still in PCI mode (see below)=2E
>>=20
>>> It happens that on pegasos2 by default all of those are routed to IRQ9=
 except IDE
>>=20
>> All *PCI* interrupts are routed to IRQ9 while IDE legacy interrupts are=
 routed to the compatible ISA IRQs=2E Note that the IDE function must only =
trigger the ISA IRQs if it is in legacy mode while it must only trigger the=
 PCI IRQ in non-legacy mode=2E See https://www=2Ebswd=2Ecom/pciide=2Epdf fo=
r more details on this particular topic=2E
>
>The docs say so but based on what guests that work on real hardware do it=
 does not work that way=2E Look up previous discussion on this on the list =
from around the time Mark changed via-ide about 4-5 years ago=2E That serie=
s was a result of his review of my proposed changes and gave resuled in an =
alternative appdroach=2E On pegasos2 (and probably also on fuloong2e based =
on same later findings, see patches to that, I can try to find these later =
if you can't find them) via-ide *always* uses IRQ 14/15 and the native mode=
 only switches register addresses from legacy io ports to PCI io space so y=
ou can set it in with BAR regs but the IRQs don't change despite what the d=
ocs say=2E There are some hacks in Linux kernel and other guests to account=
 for this but the comments for the reason are wrong in Linux, they say IDE =
is always in legacy mode but in fact if has a half-native mode which is wha=
t I called it where io addresses are set with BARs but IRQs are still the l=
egacy ISA ones=2E You can find some references in previous discussion=2E Pr=
obably searching for via-ide half-native mode might find it=2E
>
>>> but what if a guest changes ac97 to use a different interrupt? Then it=
's not a PCI interrupt any more so you can't use pci_set_irq in via=3Dac97=
=2E
>>=20
>> How would it do that? AFAICS there is no dedicated register to configur=
e which IRQ to use=2E This means that it can only trigger an interrupt via =
its PCI intx pin which is subject to the PCI -> ISA IRQ router=2E
>
>The VIA functions can use their PCI_INTERRUPT_LINE (0x3c) registers to se=
t their ISA IRQ according to the docs (and unlike IDE in other functions li=
ke USB and sound this probably also works) and the PIRQA-D pins can be mapp=
ed to ISA IRQs by the 0x55-0x57 config registers of the isa bridge (functio=
n0)=2E This is what I implemented in via_isa_set_irq() in this series=2E
>
>>> There are only 4 PCI INT lines but the VIA components can be routed to=
 13 or 14 ISA IRQs=2E
>>=20
>> Pure PCI components are only able to trigger one of the four PCI intx p=
ins they are *hardwired* to=2E
>
>This is true for PCI cards which can only use the 4 pins the slot they ar=
e in is wired to=2E These come in through the PIRQA-D pins and they are rou=
ted with the funstion 0 0x55-0x57 config registers=2E But I'm not sure abou=
t the internal functions=2E
>
>> Each component has only one pin=2E Which ISA IRQ gets triggered through=
 that pin can be selected from 13 or 14 ISA IRQs as you say by means of the=
 three configuration registers of the PCI -> ISA IRQ router=2E
>
>So you say that internal functions are also wired to the same 4 lines lik=
e normal PCI cards?

Yes=2E

> Then how can you route them to different interrupts setting their config=
 reg 0x3c independent of function0 0x55-0x57 regs?

0x3c isn't supposed to be interpretet by hardware, and in general hardware=
 can't: 0x3c is standardized for every PCI function which includes standalo=
ne PCI devices in particular=2E Standalone PCI devices don't have access to=
 an IRQ router=2E So if they don't, how could they possibly configure the I=
RQ they are triggering?

0x3c is only information to the OS (populated by the BIOS)=2E It merily in=
dicates that the PCI device needs attention when the IRQ configured in 0x3c=
 is raised=2E See comment 4 in https://community=2Eosr=2Ecom/discussion/303=
99/read-only-pci-interrupt-line-register for another explanation=2E

Even though the south bridge contains an interrupt router doesn't mean tha=
t its PCI functions can configure their IRQ through their 0x3c registers=2E=
 That would change the semantics of standardized PCI registers which is sur=
ely not permitted by the standard=2E Instead, the PCI IRQs are configured t=
hrough the device-specific 0x55-0x57 regs=2E

I see that 0x3c is also used for the USB functions=2E They used to trigger=
 the raw ISA IRQs before your series which seems wrong=2E I think 0x3c usag=
e needs to be cleaned up in the VIA model=2E Otherwise this will likely cau=
se problems elsewhere=2E

>
>>> How do you keep track of that with only the PCI bus interrupts?
>>=20
>> Devices that operate in ISA mode such as the IDE function shall have th=
eir own, dedicated ISA IRQs assigned by the guest=2E Otherwise this causes =
a classic interrupt conflict, just like in the olden ISA days=2E If the fun=
ction operates in PCI mode, it must not trigger the ISA IRQs, regardless of=
 whether they are assigned or not=2E
>
>This does not match with guests which clearly expect to get ISA IRQ9 for =
PCI cards and USB and sound which is where these are routed within the VIA =
bridge as the firmware programs it=2E

What I meant was that a component able to operate in native/legacy/mixed m=
ode such as IDE must not use both PCI and legacy ISA interrupts at the same=
 time=2E Multiple PCI functions may of course share interrupts=2E

>
>> There is also the power management function whose ACPI interrupt (SCI) =
can be routed by means of a dedicated register=2E Again, a guest must make =
sure here to not configure interrupt conflicts=2E
>>=20
>>> I don't get your approach=2E
>>=20
>> I hope that I could help you get a better understanding=2E The linked =
=2Epdf is good and comprehensive reading material=2E
>
>I'm not sure the via-ide confirms to that doc but it's also not any more =
a problem with via-ide now=2E That was discussed to death back then and "fi=
xed" to work for the cases we want it to work with=2E We probably never agr=
eed on how this really works but at least what we ended up with works with =
guests that run on real hardware=2E I'm OK with also making these cases wor=
k that we want now such as network and sound card under AmigaOS and sound u=
nder MorphOS (as long as you don't use USB) on pegasos2=2E This series does=
 that so unless it breaks something that worked before I condider this movi=
ng forward and we can always improve adn fix it later=2E I'm not saying I'm=
 not interested in your improvements just that let's that not hold this bac=
k now as we can fix and improve it later but otherwise users will have to w=
ait until September to be able to use it=2E I know a few who want this and =
getting this out as it is would allow more people to test it and report pro=
blems so unless there are clearly wrong parts I'm OK with less than perfect=
 but working solution as long as it's not too messy=2E

Patch 1 really seems like duplicating PCI code that already exists in QEMU=
=2E This is not needed and we should avoid that=2E

Moreover, usage of the IRQ line register (0x3c) for interrupt routing shou=
ld be switched to using the 0x55-0x57 regs to be PCI compliant=2E

Thanks to your great work to make via-ac97 work we can confirm that both I=
RQ routing implementations basically work for now=2E Let's work out a solut=
ion that relies on existing code, sticks to the standard and hopefully work=
s for i386 and MIPS, too=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan

