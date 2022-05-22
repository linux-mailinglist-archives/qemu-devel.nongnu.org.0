Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4067530216
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 11:37:17 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsi1U-00085K-RU
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshrN-0006Yq-PO; Sun, 22 May 2022 05:26:57 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:34806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshrL-0001ut-5p; Sun, 22 May 2022 05:26:49 -0400
Received: by mail-qk1-x729.google.com with SMTP id v11so10998531qkf.1;
 Sun, 22 May 2022 02:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lLjv8MpvuRE2+DoBvu2pjMdhFjM3ITMx3t93voDZMF0=;
 b=DPwXEKlYEMcog0eYuIOkGOY08Ay4Z/+rUdnCJQgbKlT+gzOSJd527XhFFbPv8cHpnw
 Hj7TYKPnyS3f2EoWuZ+UvZk15FOdbwyhZJNsOsqw/rNTy7s6MfE0a+ZIVD1lsQYmtIxz
 fzT8PNCOUrmcLj/EiPDf5l69VA2HDWjSeyyZa8dWJfvMZCaYKLNPWiW1Mo5TWbpaftbr
 GWKgZRsUkpH1bT+1GBboM5I8Qd0zadyZlg6aK3cojC2MOAwTxDGv+3sZw8dfeV1B00Zi
 WmU+HC2ub30KUPlX3pKI6crFGZJkh/UQJci12bv2bm5SGvXFGtIzH1B7zUVXrljWCl4G
 ipWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lLjv8MpvuRE2+DoBvu2pjMdhFjM3ITMx3t93voDZMF0=;
 b=FEXq/pbo7cPW14JfR0bVEQjwKfTsQyV4aYZvhmElQzpLPbT+bFaGWxQfFQ02bmiP/F
 ix7oyuFI9fdkOYCLAZ0mqzhQJzZd/v9m6fp8aMXWVhMro7XW3r7BOqdMKqJFXu7jaslM
 PA1CGciJIgho5dCTk3D1oui/6ilHcBCHtLR15kQb+8Xc0+CXSTjt9Yj6nJQFWdSA/stX
 sZZz5dIY8c9ew4s0Btg/Af4+2bccga74Hceq2ariG5f3XoTkqA1OxN/0qfo+ahZBASmh
 fCcJpJAmCJg7HrwC9yM3Qj0jVoLuxdKR5I4Xv2mO59qEjJaI3laUxQKKoaf+oT/fDS1I
 j7uQ==
X-Gm-Message-State: AOAM532y5ebu1Dh/aE97jxiOzeUKRpNHFi2CF1VJij3wQf9Viw7UoJP2
 2t+DnqmGI34KzFUMf+RuPyXWDQNxt7inuyL0KpA=
X-Google-Smtp-Source: ABdhPJwfxS/lwgZGmp0HBX1fxAA7by+YZNxeDDwXUPOyV/x+TXILm1BMjNAq+avhxU3PaWMnIRoSz6iyO43SCsHx91A=
X-Received: by 2002:a05:620a:e88:b0:69f:9e4a:9e74 with SMTP id
 w8-20020a05620a0e8800b0069f9e4a9e74mr10767643qkm.341.1653211605078; Sun, 22
 May 2022 02:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-4-shentey@gmail.com>
 <d4fecb8f-f764-f6ab-1a0b-851d4b15e0a4@ilande.co.uk>
In-Reply-To: <d4fecb8f-f764-f6ab-1a0b-851d4b15e0a4@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 22 May 2022 11:26:27 +0200
Message-ID: <CAG4p6K5xyCjnUH-MWo4rfQVnRcfM=MfkXLNDf7HOnX1h8UOfeg@mail.gmail.com>
Subject: Re: [PATCH 3/6] hw/isa/piix{3,
 4}: QOM'ify PCI device creation and wiring
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: multipart/alternative; boundary="00000000000075957405df965254"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000075957405df965254
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 10:27 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 13/05/2022 18:54, Bernhard Beschow wrote:
>
> > PCI interrupt wiring and device creation (piix4 only) were performed
> > in create() functions which are obsolete. Move these tasks into QOM
> > functions to modernize the code.
> >
> > In order to avoid duplicate checking for xen_enabled() the piix3 realize
> > methods are now split.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
> >   hw/isa/piix4.c | 20 +++++++++------
> >   2 files changed, 57 insertions(+), 30 deletions(-)
> >
> > diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> > index 7d69420967..d15117a7c7 100644
> > --- a/hw/isa/piix3.c
> > +++ b/hw/isa/piix3.c
> > @@ -24,6 +24,7 @@
> >
> >   #include "qemu/osdep.h"
> >   #include "qemu/range.h"
> > +#include "qapi/error.h"
> >   #include "hw/southbridge/piix.h"
> >   #include "hw/irq.h"
> >   #include "hw/isa/isa.h"
> > @@ -280,7 +281,7 @@ static const MemoryRegionOps rcr_ops = {
> >       .endianness = DEVICE_LITTLE_ENDIAN
> >   };
> >
> > -static void piix3_realize(PCIDevice *dev, Error **errp)
> > +static void pci_piix3_realize(PCIDevice *dev, Error **errp)
> >   {
> >       PIIX3State *d = PIIX3_PCI_DEVICE(dev);
> >
> > @@ -305,7 +306,6 @@ static void pci_piix3_class_init(ObjectClass *klass,
> void *data)
> >       dc->desc        = "ISA bridge";
> >       dc->vmsd        = &vmstate_piix3;
> >       dc->hotpluggable   = false;
> > -    k->realize      = piix3_realize;
> >       k->vendor_id    = PCI_VENDOR_ID_INTEL;
> >       /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> >       k->device_id    = PCI_DEVICE_ID_INTEL_82371SB_0;
> > @@ -329,11 +329,28 @@ static const TypeInfo piix3_pci_type_info = {
> >       },
> >   };
> >
> > +static void piix3_realize(PCIDevice *dev, Error **errp)
> > +{
> > +    ERRP_GUARD();
> > +    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> > +    PCIBus *pci_bus = pci_get_bus(dev);
> > +
> > +    pci_piix3_realize(dev, errp);
> > +    if (*errp) {
> > +        return;
> > +    }
> > +
> > +    pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> > +                 piix3, PIIX_NUM_PIRQS);
> > +    pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> > +};
> > +
>
> Oooof. So the reason this looks a bit odd is because we don't have an
> equivalent of
> device_class_set_parent_realize() for PCIDevice realize(). Having had a
> look in pci.c
> this looks like a similar approach for handling errors, execpt that here
> errp is
> accessed directly.
>

Yes, I was surprised by this as well. So I took inspiration from
sdhci_common_realize().

>
> I think this is probably the best we can do for now though. Have you tried
> forcing
> pci_piix3_realize() to throw an error during testing to make sure this
> works as expected?
>

I'll post the results in the cover letter of v2.

>
> >   static void piix3_class_init(ObjectClass *klass, void *data)
> >   {
> >       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >
> >       k->config_write = piix3_write_config;
> > +    k->realize = piix3_realize;
> >   }
> >
> >   static const TypeInfo piix3_info = {
> > @@ -342,11 +359,33 @@ static const TypeInfo piix3_info = {
> >       .class_init    = piix3_class_init,
> >   };
> >
> > +static void piix3_xen_realize(PCIDevice *dev, Error **errp)
> > +{
> > +    ERRP_GUARD();
> > +    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
> > +    PCIBus *pci_bus = pci_get_bus(dev);
> > +
> > +    pci_piix3_realize(dev, errp);
> > +    if (*errp) {
> > +        return;
> > +    }
> > +
> > +    /*
> > +     * Xen supports additional interrupt routes from the PCI devices to
> > +     * the IOAPIC: the four pins of each PCI device on the bus are also
> > +     * connected to the IOAPIC directly.
> > +     * These additional routes can be discovered through ACPI.
> > +     */
> > +    pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> > +                 piix3, XEN_PIIX_NUM_PIRQS);
> > +};
> > +
> >   static void piix3_xen_class_init(ObjectClass *klass, void *data)
> >   {
> >       PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >
> >       k->config_write = piix3_write_config_xen;
> > +    k->realize = piix3_xen_realize;
> >   };
> >
> >   static const TypeInfo piix3_xen_info = {
> > @@ -368,27 +407,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus
> **isa_bus)
> >   {
> >       PIIX3State *piix3;
> >       PCIDevice *pci_dev;
> > +    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> > +                                     : TYPE_PIIX3_DEVICE;
> >
> > -    /*
> > -     * Xen supports additional interrupt routes from the PCI devices to
> > -     * the IOAPIC: the four pins of each PCI device on the bus are also
> > -     * connected to the IOAPIC directly.
> > -     * These additional routes can be discovered through ACPI.
> > -     */
> > -    if (xen_enabled()) {
> > -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
> > -
> TYPE_PIIX3_XEN_DEVICE);
> > -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> > -        pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_get_pirq,
> > -                     piix3, XEN_PIIX_NUM_PIRQS);
> > -    } else {
> > -        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
> > -                                                  TYPE_PIIX3_DEVICE);
> > -        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> > -        pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,
> > -                     piix3, PIIX_NUM_PIRQS);
> > -        pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
> > -    }
> > +    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> > +    piix3 = PIIX3_PCI_DEVICE(pci_dev);
> >       *isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> >
> >       return piix3;
> > diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> > index a223b69e24..134d23aea7 100644
> > --- a/hw/isa/piix4.c
> > +++ b/hw/isa/piix4.c
> > @@ -204,6 +204,8 @@ static const MemoryRegionOps piix4_rcr_ops = {
> >   static void piix4_realize(PCIDevice *dev, Error **errp)
> >   {
> >       PIIX4State *s = PIIX4_PCI_DEVICE(dev);
> > +    PCIDevice *pci;
> > +    PCIBus *pci_bus = pci_get_bus(dev);
> >       ISABus *isa_bus;
> >       qemu_irq *i8259_out_irq;
> >
> > @@ -242,6 +244,15 @@ static void piix4_realize(PCIDevice *dev, Error
> **errp)
> >           return;
> >       }
> >       s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
> > +
> > +    /* IDE */
> > +    pci = pci_create_simple(pci_bus, dev->devfn + 1, "piix4-ide");
> > +    pci_ide_create_devs(pci);
> > +
> > +    /* USB */
> > +    pci_create_simple(pci_bus, dev->devfn + 2, "piix4-usb-uhci");
> > +
> > +    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s,
> PIIX_NUM_PIRQS);
> >   }
> >
> >   static void piix4_init(Object *obj)
> > @@ -292,7 +303,6 @@ type_init(piix4_register_types)
> >
> >   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus
> **smbus)
> >   {
> > -    PIIX4State *s;
> >       PCIDevice *pci;
> >       DeviceState *dev;
> >       int devfn = PCI_DEVFN(10, 0);
> > @@ -300,22 +310,16 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus
> **isa_bus, I2CBus **smbus)
> >       pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
> >                                             TYPE_PIIX4_PCI_DEVICE);
> >       dev = DEVICE(pci);
> > -    s = PIIX4_PCI_DEVICE(pci);
> > +
> >       if (isa_bus) {
> >           *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> >       }
> >
> > -    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
> > -    pci_ide_create_devs(pci);
> > -
> > -    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
> >       if (smbus) {
> >           *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
> >                                  qdev_get_gpio_in_named(dev, "isa", 9),
> >                                  NULL, 0, NULL);
> >       }
> >
> > -    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s,
> PIIX_NUM_PIRQS);
> > -
> >       return dev;
> >   }
>
> As long as the error handling works as required:
>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> ATB,
>
> Mark.
>

--00000000000075957405df965254
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 21, 2022 at 10:27 AM Mark Cav=
e-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave-ayl=
and@ilande.co.uk</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 13/05/2022 18:54, Bernhard Be=
schow wrote:<br>
<br>
&gt; PCI interrupt wiring and device creation (piix4 only) were performed<b=
r>
&gt; in create() functions which are obsolete. Move these tasks into QOM<br=
>
&gt; functions to modernize the code.<br>
&gt; <br>
&gt; In order to avoid duplicate checking for xen_enabled() the piix3 reali=
ze<br>
&gt; methods are now split.<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----=
------------<br>
&gt;=C2=A0 =C2=A0hw/isa/piix4.c | 20 +++++++++------<br>
&gt;=C2=A0 =C2=A02 files changed, 57 insertions(+), 30 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c<br>
&gt; index 7d69420967..d15117a7c7 100644<br>
&gt; --- a/hw/isa/piix3.c<br>
&gt; +++ b/hw/isa/piix3.c<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/range.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/southbridge/piix.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/irq.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/isa/isa.h&quot;<br>
&gt; @@ -280,7 +281,7 @@ static const MemoryRegionOps rcr_ops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static void piix3_realize(PCIDevice *dev, Error **errp)<br>
&gt; +static void pci_piix3_realize(PCIDevice *dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PIIX3State *d =3D PIIX3_PCI_DEVICE(dev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -305,7 +306,6 @@ static void pci_piix3_class_init(ObjectClass *klas=
s, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;desc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;ISA bridge&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;vmsd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
amp;vmstate_piix3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;hotpluggable=C2=A0 =C2=A0=3D false;<b=
r>
&gt; -=C2=A0 =C2=A0 k-&gt;realize=C2=A0 =C2=A0 =C2=A0 =3D piix3_realize;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id=C2=A0 =C2=A0 =3D PCI_VENDOR_=
ID_INTEL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 82371SB PIIX3 PCI-to-ISA bridge (Step A1)=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;device_id=C2=A0 =C2=A0 =3D PCI_DEVICE_=
ID_INTEL_82371SB_0;<br>
&gt; @@ -329,11 +329,28 @@ static const TypeInfo piix3_pci_type_info =3D {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void piix3_realize(PCIDevice *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt; +=C2=A0 =C2=A0 PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 PCIBus *pci_bus =3D pci_get_bus(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci_piix3_realize(dev, errp);<br>
&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix3_set_irq, pci_slot_get_pirq,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piix3, =
PIIX_NUM_PIRQS);<br>
&gt; +=C2=A0 =C2=A0 pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_=
to_irq);<br>
&gt; +};<br>
&gt; +<br>
<br>
Oooof. So the reason this looks a bit odd is because we don&#39;t have an e=
quivalent of <br>
device_class_set_parent_realize() for PCIDevice realize(). Having had a loo=
k in pci.c <br>
this looks like a similar approach for handling errors, execpt that here er=
rp is <br>
accessed directly.<br></blockquote><div><br></div><div>Yes, I was surprised=
 by this as well. So I took inspiration from sdhci_common_realize().<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think this is probably the best we can do for now though. Have you tried =
forcing <br>
pci_piix3_realize() to throw an error during testing to make sure this work=
s as expected?<br></blockquote><div><br></div><div>I&#39;ll post the result=
s in the cover letter of v2. <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt;=C2=A0 =C2=A0static void piix3_class_init(ObjectClass *klass, void *dat=
a)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass=
);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D piix3_write_config;<b=
r>
&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D piix3_realize;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const TypeInfo piix3_info =3D {<br>
&gt; @@ -342,11 +359,33 @@ static const TypeInfo piix3_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D piix3_class_ini=
t,<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void piix3_xen_realize(PCIDevice *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt; +=C2=A0 =C2=A0 PIIX3State *piix3 =3D PIIX3_PCI_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 PCIBus *pci_bus =3D pci_get_bus(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci_piix3_realize(dev, errp);<br>
&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Xen supports additional interrupt routes from t=
he PCI devices to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* the IOAPIC: the four pins of each PCI device on=
 the bus are also<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* connected to the IOAPIC directly.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* These additional routes can be discovered throu=
gh ACPI.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 pci_bus_irqs(pci_bus, xen_piix3_set_irq, xen_pci_slot_g=
et_pirq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piix3, =
XEN_PIIX_NUM_PIRQS);<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void piix3_xen_class_init(ObjectClass *klass, void =
*data)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass=
);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D piix3_write_config_xe=
n;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D piix3_xen_realize;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static const TypeInfo piix3_xen_info =3D {<br>
&gt; @@ -368,27 +407,11 @@ PIIX3State *piix3_create(PCIBus *pci_bus, ISABus=
 **isa_bus)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PIIX3State *piix3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDevice *pci_dev;<br>
&gt; +=C2=A0 =C2=A0 const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEV=
ICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: TYPE_PIIX3=
_DEVICE;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Xen supports additional interrupt routes from t=
he PCI devices to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* the IOAPIC: the four pins of each PCI device on=
 the bus are also<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* connected to the IOAPIC directly.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* These additional routes can be discovered throu=
gh ACPI.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 if (xen_enabled()) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_multifuncti=
on(pci_bus, -1, true,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_XEN_DEVICE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, xen_piix3_set_irq, =
xen_pci_slot_get_pirq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0piix3, XEN_PIIX_NUM_PIRQS);<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_multifuncti=
on(pci_bus, -1, true,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_DEVICE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix3_set_irq, pci_=
slot_get_pirq,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0piix3, PIIX_NUM_PIRQS);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_bus_set_route_irq_fn(pci_bus, piix3_r=
oute_intx_pin_to_irq);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 pci_dev =3D pci_create_simple_multifunction(pci_bus, -1=
, true, type);<br>
&gt; +=C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*isa_bus =3D ISA_BUS(qdev_get_child_bus(DEVI=
CE(piix3), &quot;isa.0&quot;));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return piix3;<br>
&gt; diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
&gt; index a223b69e24..134d23aea7 100644<br>
&gt; --- a/hw/isa/piix4.c<br>
&gt; +++ b/hw/isa/piix4.c<br>
&gt; @@ -204,6 +204,8 @@ static const MemoryRegionOps piix4_rcr_ops =3D {<b=
r>
&gt;=C2=A0 =C2=A0static void piix4_realize(PCIDevice *dev, Error **errp)<br=
>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PIIX4State *s =3D PIIX4_PCI_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 PCIDevice *pci;<br>
&gt; +=C2=A0 =C2=A0 PCIBus *pci_bus =3D pci_get_bus(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq *i8259_out_irq;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -242,6 +244,15 @@ static void piix4_realize(PCIDevice *dev, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;rtc.irq =3D isa_get_irq(ISA_DEVICE(&am=
p;s-&gt;rtc), s-&gt;rtc.isairq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* IDE */<br>
&gt; +=C2=A0 =C2=A0 pci =3D pci_create_simple(pci_bus, dev-&gt;devfn + 1, &=
quot;piix4-ide&quot;);<br>
&gt; +=C2=A0 =C2=A0 pci_ide_create_devs(pci);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* USB */<br>
&gt; +=C2=A0 =C2=A0 pci_create_simple(pci_bus, dev-&gt;devfn + 2, &quot;pii=
x4-usb-uhci&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq,=
 s, PIIX_NUM_PIRQS);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void piix4_init(Object *obj)<br>
&gt; @@ -292,7 +303,6 @@ type_init(piix4_register_types)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bu=
s, I2CBus **smbus)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 PIIX4State *s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDevice *pci;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceState *dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int devfn =3D PCI_DEVFN(10, 0);<br>
&gt; @@ -300,22 +310,16 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABu=
s **isa_bus, I2CBus **smbus)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pci =3D pci_create_simple_multifunction(pci_=
bus, devfn,=C2=A0 true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0TYPE_PIIX4_PCI_DEVICE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D DEVICE(pci);<br>
&gt; -=C2=A0 =C2=A0 s =3D PIIX4_PCI_DEVICE(pci);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (isa_bus) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*isa_bus =3D ISA_BUS(qdev_get_=
child_bus(dev, &quot;isa.0&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 pci =3D pci_create_simple(pci_bus, devfn + 1, &quot;pii=
x4-ide&quot;);<br>
&gt; -=C2=A0 =C2=A0 pci_ide_create_devs(pci);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, devfn + 2, &quot;piix4-usb-u=
hci&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (smbus) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*smbus =3D piix4_pm_init(pci_b=
us, devfn + 3, 0x1100,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in_named(dev=
, &quot;isa&quot;, 9),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq,=
 s, PIIX_NUM_PIRQS);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dev;<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
As long as the error handling works as required:<br>
<br>
Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande=
.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--00000000000075957405df965254--

