Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AC69FD81
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:08:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwLI-0006Xb-8B; Wed, 22 Feb 2023 16:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUwLG-0006WX-Pu; Wed, 22 Feb 2023 16:07:58 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUwLE-0002Fp-RI; Wed, 22 Feb 2023 16:07:58 -0500
Received: by mail-vs1-xe34.google.com with SMTP id m10so9505245vso.4;
 Wed, 22 Feb 2023 13:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677100075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bR4VgcuF/vazupQa0gUx6kPZpW95FwKI39kg5359Uk=;
 b=MXwuJ4+laLyZTNCuXWiNRWkhPZA771meVimgK9F1RGigUW3ZmCqILtxipZkVf9aKiN
 IZbJCqYBAvrhj2ulEv8Z37nPkmuQMCdAmhm2ZNFVvYlfAgDpo93fqDkS0rBvGRR2ndRQ
 d3s3qUDngaXmOqgRbPz1CPQY31yLkWsDtUP31wlYNb0+AR8GLj4T0/yxL083FRcl61mx
 wHxzcj2ZXF3ToYd15CzPsIk2vFscVsEIT3e+sWktMY5DeWBvUBQKjchbPPzyqeW0O5Wr
 JohqcRepGttpxKeQLKZ4FH2TEPmnuXHi/w6DW5gBr6XbxD1sAOub2Bz6m0GhgfvL4KLu
 oPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677100075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bR4VgcuF/vazupQa0gUx6kPZpW95FwKI39kg5359Uk=;
 b=yKd4Dvw9rbCi7PE7dok9Z4TehLebISeDp4Axb9UxlwgQu0tr0Ej9go7JJb1RqycDsT
 dO38TOrCbSgGN6toqRJvTUZVZAqs3Qh0L3X+5pAFbzv7GpPniAwVDDUzn5EUqhs7cCW5
 IsrR2EYNcv5LKBpnD8aBRrITSnNTRy3YBiwi3m2xl+c5VsnihM/wZ5WjOm0yskVRPoq5
 u2CPTCzXdIsSGQrVZkwi/jDmQAORdsmsTiLPrMTQ+AiITec4V45ihxj7uNuKIgsRkI70
 NcfrwbIdYCm/dGLtPTF1+QA1U62dYTJx6+9doDlN7A5dEdL7t6xMXsVv9n+QWbbHa+gz
 m5iQ==
X-Gm-Message-State: AO0yUKW6X+JAVc3JsWYzyu7BAkf39OkJxsAKKFkDHd439YjS6QhTj9xn
 De4IIiBRa+OdDS5rxd4xS+p4bdWMo7K4AAjOzdC8z9oHtXQRKA==
X-Google-Smtp-Source: AK7set/jMLdYndl6ZzCJ6oFNn5m9sVwBxipGp/hGheR5KZWE+j0U5r+xPQsxXzzOvx09HjZtFtmu7QEEIRfM1bYk5UM=
X-Received: by 2002:a67:df83:0:b0:41e:97c7:c262 with SMTP id
 x3-20020a67df83000000b0041e97c7c262mr1489266vsk.7.1677099575158; Wed, 22 Feb
 2023 12:59:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <CAG4p6K5n5uVD1UPx97jbBDx-k78KweNDTz=J1HoKpzkvau511Q@mail.gmail.com>
 <CAG4p6K50kgCTNrnAstM3vAY8tNkhBkFphWPKxhp=o99MeVpqDw@mail.gmail.com>
 <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
In-Reply-To: <adb1fe51-a17e-53c2-4dd1-0c4270a928aa@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 22 Feb 2023 21:59:21 +0100
Message-ID: <CAG4p6K7b=-jCODvX0VYG3PFeYds2vgO6CmTWu+0aeT9P5Ppubw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Pegasos2 fixes and audio output support
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe34.google.com
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

Am 22. Februar 2023 19:25:16 UTC schrieb BALATON Zoltan <balaton@eik.bme.hu=
>:
>On Wed, 22 Feb 2023, Bernhard Beschow wrote:
>> On Wed, Feb 22, 2023 at 4:38 PM Bernhard Beschow <shentey@gmail.com> wro=
te:
>>> On Tue, Feb 21, 2023 at 7:44 PM BALATON Zoltan <balaton@eik.bme.hu> wro=
te:
>>>> This series fixes PCI interrupts on the ppc/pegasos2 machine and adds
>>>> partial implementation of the via-ac97 sound part enough to get audio
>>>> output. I'd like this to be merged for QEMU 8.0.
>>>>
>>>> Regards,
>>>> BALATON Zoltan
>>>>
>>>> BALATON Zoltan (5):
>>>>   hw/isa/vt82c686: Implement interrupt routing in via_isa_set_irq
>>>>   hw/isa/vt82c686: Implement PIRQ pins
>>>>   hw/ppc/pegasos2: Fix PCI interrupt routing
>>>>   hw/audio/ac97: Split off some definitions to a header
>>>>   hw/audio/via-ac97: Basic implementation of audio playback
>>>>
>>>>  hw/audio/ac97.c            |  43 +---
>>>>  hw/audio/ac97.h            |  65 ++++++
>>>>  hw/audio/trace-events      |   6 +
>>>>  hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++=
-
>>>>  hw/ide/via.c               |   2 +-
>>>>  hw/isa/vt82c686.c          |  61 +++++-
>>>>  hw/pci-host/mv64361.c      |   4 -
>>>>  hw/ppc/pegasos2.c          |  26 ++-
>>>>  hw/usb/vt82c686-uhci-pci.c |   5 +-
>>>>  include/hw/isa/vt82c686.h  |  39 +++-
>>>>  10 files changed, 626 insertions(+), 61 deletions(-)
>>>>  create mode 100644 hw/audio/ac97.h
>>>>
>>>> --
>>>> 2.30.7
>>>>
>>>>
>>> Wow, the MorphOS people paid attention to sound design. Thanks for
>>> presenting it to us, Zoltan!
>>>
>>> I've had a closer look at your series and I think it can be simplified:
>>> Patch 2 can be implemented quite straight-forward like I proposed in a
>>> private mail: https://github.com/shentok/qemu/commit/via-priq-routing.
>>> Then, in order to make patch 3 "hw/ppc/pegasos2: Fix PCI interrupt rout=
ing"
>>> working, one can expose the PCI interrupts with a single line like you =
do
>>> in patch 2. With this, patch 1 "hw/isa/vt82c686: Implement interrupt
>>> routing in via_isa_set_irq" isn't needed any longer and can be omitted.
>>>
>>> In via-ac97, rather than using via_isa_set_irq(), pci_set_irq() can be
>>> used instead. pci_set_irq() internally takes care of all the ISA interr=
upt
>>> level tracking patch 1 attempted to address.
>>>
>>
>> Here is a proof of concept branch to demonstrate that the simplification
>> actually works: https://github.com/shentok/qemu/commits/pegasos2 (Tested
>> with MorphOS with and without pegasos2.rom).
>
>Does this only work because both the via-ac97 and the PCI interrupts are m=
apped to the same ISA IRQ and you've only tested sound? The guest could con=
figure each device to use a different IRQ, also mapping them so they share =
one ISA interrupt. What happens if multiple devices are mapped to IRQ 9 (wh=
ich is the case on pegasos2 where PCI cards, ac97 and USB all share this IR=
Q) and more than one such device wants to raise an interrupt at the same ti=
me? If you ack the ac97 interrupt but a PCI network card or the USB part st=
ill wants to get the CPUs attention the ISA IRQ should remain raised until =
all devices are serviced.

pci_bus_get_irq_level(), used in via_isa_set_pci_irq(), should handle
exactly that case very well.

>I don't see a way to track the status of all devices in a single qemu_irq =
which can only be up or down so we need something to store the state of eac=
h source.

pci_set_irq() causes pci_bus_change_irq_level() to be called.
pci_bus_change_irq_level() tracks the sum of all irq levels of all
devices attached to a particular pin in irq_count. Have a look at
pci_bus_change_irq_level() and you will understand better.

>My patch adds a state register to each ISA IRQ line for all possible sourc=
es which could probably be stored once but then for each change of ISA IRQ =
status all the mapped devices should be checked and combined so it's easier=
 to store them for each IRQ. Does your approach still work if you play soun=
d, and copy something from network to a USB device at the same time? (I'm n=
ot sure mine does not have remaining bugs but I don't think this can be sim=
plified that way but if you can prove it would work I don't mind taking an =
alternative version but I'm not convinced yet.)

Well, I can't prove that my approach works but unfortunately I can
prove that both our approaches cause a freeze :/ Try:
1. Start `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc
base=3Dlocaltime -device ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom
morphos-3.17.iso -device usb-mouse -device usb-kbd`
2. Move the mouse while sound is playing
-> Observe the VM to freeze

So there must be an issue somewhere else...

Best regards,
Bernhard
>
>Regards,
>BALATON Zoltan
>
>>> I might have further comments but I think it's enough for now.
>>>
>>> Thanks again for making via-ac97 work!
>>>
>>> Best regards,
>>> Bernhard
>>>
>>

