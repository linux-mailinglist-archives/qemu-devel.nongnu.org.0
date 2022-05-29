Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF3537217
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:07:23 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNJy-00088N-Dv
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNIc-0006lp-5B; Sun, 29 May 2022 14:05:58 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNIa-0005e2-7K; Sun, 29 May 2022 14:05:57 -0400
Received: by mail-qt1-x82d.google.com with SMTP id s31so9559222qtc.3;
 Sun, 29 May 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VY4xNo05neEdn6ydNCkbSaT1BR46GtoapM+9KEaUSZk=;
 b=GiGqALMsYedXHOcAIrvwcw26ASP3AcG+JhoZUyhnRCPOjl0/gy3uYzjXjsveobPtng
 mnFmTZthLWBCm3zZ+PT3aUi8xpOQt6/oM6F1/JOd0X3G2XDK+zb9xTU37msslZMMago1
 1vM5ygpnqwtPLEWgUMQl8fgtYZOBuUVyDLbI8O5tXC5KznT2nhvfLiDAFscrhn4I1/Pn
 TCp9GhnsJvf7nd/UWpAYiftGuiJ1gcQR5kcliJ2bQ422dW3VRz7mLaVTknQCjY0NpjAk
 zGvRj7/yOKLhSBpG8ZE/1v7iJXhTJfYJQtBgX0diLE6Oz54RTKtjgqurWylVGwC+9c7R
 /9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VY4xNo05neEdn6ydNCkbSaT1BR46GtoapM+9KEaUSZk=;
 b=0b7IQEMaywnYKblG2xXsCUJt3thZhi4fSpUBs603YziiIaRJjUOFO4MZ2sLqterPE4
 vjI/709W7xyJ3LqIQPw9FkAlW0WZXxD589G2ForEkAKNLm24XpRsapdy18wBy7fjgpDR
 KMsib5+zn9I+KtNOXgIFyHGcoQkmYWMsttoa86Ws5YheitqJf8mr5pNziZd3271jQAar
 oms023L/KXMhOC5wDiSwPI18D/fXt2vYPQwAq532+NjHXletoXC0YvDx6NHJEo6WXEOD
 +yPsMdhleD+UeHGePQx1eIVBj/XggmHeDA5pnM5VtRBeXZAjh23Tl6oAZhvHMLl3Q/8k
 DgqQ==
X-Gm-Message-State: AOAM532XLCUE7uiFTtj9QAZjR3baLHbPJvvwNU+WrprHW0xFperYB2Zv
 ZgfGY21niNr/ykT6l/R4rSyNm42lu1u1sImar3k=
X-Google-Smtp-Source: ABdhPJxKM6RCWfM/iBCYq/0k7R6UCtZ/xjxnwropaKH+zWlmfEpjulvJZwYHYm4l5Tf2/t8MzfG4Sc5oNyNCPjHy2gI=
X-Received: by 2002:a05:622a:1386:b0:2f3:d73d:f5c4 with SMTP id
 o6-20020a05622a138600b002f3d73df5c4mr41186884qtk.658.1653847554846; Sun, 29
 May 2022 11:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-7-shentey@gmail.com>
 <f3428e7e-f3f5-b933-a279-7da6e056dd5e@ilande.co.uk>
In-Reply-To: <f3428e7e-f3f5-b933-a279-7da6e056dd5e@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 29 May 2022 20:05:32 +0200
Message-ID: <CAG4p6K6uWyTeWBnkTb0XciyD7Xa2nF7XXLo5pP+JLC4QontHHQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] hw/isa/piix4: QOM'ify PIIX4 PM creation
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sun, May 29, 2022 at 11:25 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 28/05/2022 20:20, Bernhard Beschow wrote:
>
> > Just like the real hardware, create the PIIX4 ACPI controller as part of
> > the PIIX4 southbridge. This also mirrors how the IDE and USB functions
> > are already created.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/isa/piix4.c                | 25 ++++++++++++++-----------
> >   hw/mips/malta.c               |  3 ++-
> >   include/hw/southbridge/piix.h |  2 +-
> >   3 files changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> > index 96df21a610..217989227d 100644
> > --- a/hw/isa/piix4.c
> > +++ b/hw/isa/piix4.c
> > @@ -49,6 +49,7 @@ struct PIIX4State {
> >       RTCState rtc;
> >       PCIIDEState ide;
> >       UHCIState uhci;
> > +    PIIX4PMState pm;
> >       /* Reset Control Register */
> >       MemoryRegion rcr_mem;
> >       uint8_t rcr;
> > @@ -261,6 +262,14 @@ static void piix4_realize(PCIDevice *dev, Error
> **errp)
> >           return;
> >       }
> >
> > +    /* ACPI controller */
> > +    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
> > +    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> > +        return;
> > +    }
> > +    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
> > +    object_property_add_alias(OBJECT(s), "smbus", OBJECT(&s->pm),
> "i2c");
>
> Now that the PM device is QOMified you don't actually need this alias
> anymore (see
> below). In general aliasing parts of contained devices onto the container
> isn't
> recommended, since it starts to blur the line between individual devices
> and then you
> find some wiring gets done to the container, some directly to the
> contained device
> and then it starts to get confusing quite quickly.
>
> >       pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s,
> PIIX_NUM_PIRQS);
> >   }
> >
> > @@ -271,6 +280,10 @@ static void piix4_init(Object *obj)
> >       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
> >       object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
> >       object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
> > +
> > +    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
> > +    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
> > +    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
> >   }
> >
> >   static void piix4_class_init(ObjectClass *klass, void *data)
> > @@ -312,7 +325,7 @@ static void piix4_register_types(void)
> >
> >   type_init(piix4_register_types)
> >
> > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
> > +DeviceState *piix4_create(PCIBus *pci_bus)
> >   {
> >       PCIDevice *pci;
> >       DeviceState *dev;
> > @@ -322,15 +335,5 @@ DeviceState *piix4_create(PCIBus *pci_bus, I2CBus
> **smbus)
> >                                             TYPE_PIIX4_PCI_DEVICE);
> >       dev = DEVICE(pci);
> >
> > -    if (smbus) {
> > -        pci = pci_new(devfn + 3, TYPE_PIIX4_PM);
> > -        qdev_prop_set_uint32(DEVICE(pci), "smb_io_base", 0x1100);
> > -        qdev_prop_set_bit(DEVICE(pci), "smm-enabled", 0);
> > -        pci_realize_and_unref(pci, pci_bus, &error_fatal);
> > -        qdev_connect_gpio_out(DEVICE(pci), 0,
> > -                              qdev_get_gpio_in_named(dev, "isa", 9));
> > -        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pci), "i2c"));
> > -    }
> > -
> >       return dev;
> >   }
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index e446b25ad0..b0fc84ccbb 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1399,8 +1399,9 @@ void mips_malta_init(MachineState *machine)
> >       empty_slot_init("GT64120", 0, 0x20000000);
> >
> >       /* Southbridge */
> > -    dev = piix4_create(pci_bus, &smbus);
> > +    dev = piix4_create(pci_bus);
> >       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> > +    smbus = I2C_BUS(qdev_get_child_bus(dev, "smbus"));
>
> It should now be possible to do something like this:
>
>      pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
>      smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
>
> whereby we grab the reference to the PIIX4_PM device by resolving the "pm"
> child
> object and then use that to obtain the reference to smbus.
>

Imagining the container device to be an abstraction layer for the
contained functionality I actually prefer the alias. Having it one
doesn't need to know that there is an internal device named "pm" and
one doesn't need to care about how many levels deep it is buried
inside the implementation. This allows for further refactoring the
PIIX4 without breaking its contract to its users.

Also, this reflects how the real hardware works: The Malta board can
wire up the PIIX4 southbridge without worrying about its inner
details. One can look into the datasheets, see the exposed interfaces
and pins, and connect them. By QOM'ifying PIIX4 we now have the
opportunity to mirror the real hardware by exposing it to the Malta
board as a black box which exposes dedicated pins and buses.

Looking further into the QEMU code, there is even the following
comment in sabrelite.c:
        /*
         * TODO: Ideally we would expose the chip select and spi bus on the
         * SoC object using alias properties; then we would not need to
         * directly access the underlying spi device object.
         */
To me this comment seems that the authors think in a similar way.

What do you think?

Best regards,
Bernhard





> >       /* Interrupt controller */
> >       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> > diff --git a/include/hw/southbridge/piix.h
> b/include/hw/southbridge/piix.h
> > index 0a2ef0c7b6..e1f5d6d5c8 100644
> > --- a/include/hw/southbridge/piix.h
> > +++ b/include/hw/southbridge/piix.h
> > @@ -70,6 +70,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
> >
> >   PIIX3State *piix3_create(PCIBus *pci_bus);
> >
> > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
> > +DeviceState *piix4_create(PCIBus *pci_bus);
> >
> >   #endif
>
>
> ATB,
>
> Mark.
>

