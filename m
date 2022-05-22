Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3353020A
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 11:16:57 +0200 (CEST)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nshho-0003hy-6h
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 05:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshb4-0001Gp-9q; Sun, 22 May 2022 05:09:59 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshb2-0007gM-0D; Sun, 22 May 2022 05:09:57 -0400
Received: by mail-qt1-x82a.google.com with SMTP id g3so10778017qtb.7;
 Sun, 22 May 2022 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OC3OcWYlWLim1wtksJxZjMtt4CvKvPzG/iLlj4zrGe0=;
 b=j38InLQVzPP/75crdWPeagEKxlSXqdUcax3dXM/fhtFgRNSk2MwaKQxVOQNjI3VTS8
 1msoHHPdpGUmmeu2F41nQTyyFrUdnUqItZTd2Wupw2C+DttRczYOL/45P/DkmfQCLux9
 FjiOdxc7zo92+bL8I9+vjeumqvRvVv6cVcYDJ37ycuUKWqEbRo0ZTnfHBagzqMX/IiQV
 6bzlk6KNABfE5q2s44P6DhiqS1fqRc5BicEgRwJa1yzh46hycC8KARbg1cSUafZ/c4Fu
 ZGC4tQBd2KKqCpZpGidTu0eQ73rFy9m5AbBWp736EJE93SbczZZtRpe31C6Q2aAXss75
 TjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OC3OcWYlWLim1wtksJxZjMtt4CvKvPzG/iLlj4zrGe0=;
 b=CJh6CmwmWvqGb8efdQx96+ogLQ2Gc5thswDYStPpvQTnp9gD0oZPqAO+H2egkmIjsA
 YwVEgbvvlQLLxPrXI29/V3hFPtDjrY7CdCo7mzLA0pl6xM8ZOp+Pl5o8Lak39Lf13Ull
 NIo7adcUOHlWgFN1itZG+ctViQDSJ1fbbuKMG33aqyDXXcWQg0SWdsXyDNMQR5fEDrJs
 jLjnOQNK6VkhqhtScNmTBw65QMpbZwb8Kfpx7Z6I+wOmArZSkzTL9jLXxaMMedqUVE+W
 oR7kPIfp2OojL8I6PaaZ7lWbne/BAfuaRH9gG38W/xeKQysEe0aPylk6OZuGq7OaqnJy
 T8qA==
X-Gm-Message-State: AOAM530dyLFqIsInigjy5Xq2Y4GsPADYgu4b82HYrrvlYHhxz0iCemHf
 5WKv6euqv4NxNN6k7SjUIYBpvVRYMStBWIYGmHc=
X-Google-Smtp-Source: ABdhPJxgxHHl1xXDPwetNDWsUmzQI8A1+5+XjuOobh+TB5WAauoGMNO1Jdc6rKgXzbNOEKw1vhwBaYfBvNmz6oMqH28=
X-Received: by 2002:a05:622a:387:b0:2f3:d59f:c12c with SMTP id
 j7-20020a05622a038700b002f3d59fc12cmr13221261qtx.482.1653210594742; Sun, 22
 May 2022 02:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-7-shentey@gmail.com>
 <aa93e92d-464b-366c-8724-7933db06f50c@ilande.co.uk>
In-Reply-To: <aa93e92d-464b-366c-8724-7933db06f50c@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 22 May 2022 11:09:37 +0200
Message-ID: <CAG4p6K67H+-P9+J4JmdSJKmUGxfbbZCsE2NFrHDdpPHShpjVSw@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/isa/piix{3,
 4}: Inline and remove create() functions
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: multipart/alternative; boundary="0000000000003d144e05df96167c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x82a.google.com
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

--0000000000003d144e05df96167c
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 10:43 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 13/05/2022 18:54, Bernhard Beschow wrote:
>
> > During the previous changesets the create() functions became trivial
> > wrappers around more generic functions. Modernize the code.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/i386/pc_piix.c             |  6 +++++-
> >   hw/isa/piix3.c                | 16 ----------------
> >   hw/isa/piix4.c                | 10 ----------
> >   hw/mips/malta.c               |  3 ++-
> >   include/hw/southbridge/piix.h |  6 ++----
> >   5 files changed, 9 insertions(+), 32 deletions(-)
> >
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 47932448fd..82c7941958 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -196,6 +196,9 @@ static void pc_init1(MachineState *machine,
> >
> >       if (pcmc->pci_enabled) {
> >           PIIX3State *piix3;
> > +        PCIDevice *pci_dev;
> > +        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> > +                                         : TYPE_PIIX3_DEVICE;
> >
> >           pci_bus = i440fx_init(host_type,
> >                                 pci_type,
> > @@ -206,7 +209,8 @@ static void pc_init1(MachineState *machine,
> >                                 pci_memory, ram_memory);
> >           pcms->bus = pci_bus;
> >
> > -        piix3 = piix3_create(pci_bus);
> > +        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
> type);
> > +        piix3 = PIIX3_PCI_DEVICE(pci_dev);
> >           piix3->pic = x86ms->gsi;
> >           piix3_devfn = piix3->dev.devfn;
> >           isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
> > diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> > index 6eacb22dd0..01c376b39a 100644
> > --- a/hw/isa/piix3.c
> > +++ b/hw/isa/piix3.c
> > @@ -36,9 +36,6 @@
> >
> >   #define XEN_PIIX_NUM_PIRQS      128ULL
> >
> > -#define TYPE_PIIX3_DEVICE "PIIX3"
> > -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> > -
> >   static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> >   {
> >       qemu_set_irq(piix3->pic[pic_irq],
> > @@ -402,16 +399,3 @@ static void piix3_register_types(void)
> >   }
> >
> >   type_init(piix3_register_types)
> > -
> > -PIIX3State *piix3_create(PCIBus *pci_bus)
> > -{
> > -    PIIX3State *piix3;
> > -    PCIDevice *pci_dev;
> > -    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> > -                                     : TYPE_PIIX3_DEVICE;
> > -
> > -    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
> > -    piix3 = PIIX3_PCI_DEVICE(pci_dev);
> > -
> > -    return piix3;
> > -}
> > diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> > index 852e5c4db1..a70063bc77 100644
> > --- a/hw/isa/piix4.c
> > +++ b/hw/isa/piix4.c
> > @@ -300,13 +300,3 @@ static void piix4_register_types(void)
> >   }
> >
> >   type_init(piix4_register_types)
> > -
> > -PCIDevice *piix4_create(PCIBus *pci_bus)
> > -{
> > -    PCIDevice *pci;
> > -
> > -    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> true,
> > -                                          TYPE_PIIX4_PCI_DEVICE);
> > -
> > -    return pci;
> > -}
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index d4bd3549d0..57b5eddc74 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1400,7 +1400,8 @@ void mips_malta_init(MachineState *machine)
> >       empty_slot_init("GT64120", 0, 0x20000000);
> >
> >       /* Southbridge */
> > -    piix4 = piix4_create(pci_bus);
> > +    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> true,
> > +                                            TYPE_PIIX4_PCI_DEVICE);
> >       dev = DEVICE(piix4);
> >       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> >       smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
> > diff --git a/include/hw/southbridge/piix.h
> b/include/hw/southbridge/piix.h
> > index bea3b44551..2d55dbdef7 100644
> > --- a/include/hw/southbridge/piix.h
> > +++ b/include/hw/southbridge/piix.h
> > @@ -70,10 +70,8 @@ typedef struct PIIXState PIIX3State;
> >   DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
> >                            TYPE_PIIX3_PCI_DEVICE)
> >
> > +#define TYPE_PIIX3_DEVICE "PIIX3"
> > +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> >   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>
> I think it would make sense for the movement of these types to be included
> in patch 1
> in a single place.
>

This makes sense indeed. I'll change it.

>
> > -PIIX3State *piix3_create(PCIBus *pci_bus);
> > -
> > -PCIDevice *piix4_create(PCIBus *pci_bus);
> > -
> >   #endif
>
> Otherwise:
>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> ATB,
>
> Mark.
>

--0000000000003d144e05df96167c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 21, 2022 at 10:43 AM Mark=
 Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave=
-ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 13/05/2022 18:54, Bernhard Beschow wrote:<br>
<br>
&gt; During the previous changesets the create() functions became trivial<b=
r>
&gt; wrappers around more generic functions. Modernize the code.<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 6 +++++-<br>
&gt;=C2=A0 =C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 16 ----------------<br>
&gt;=C2=A0 =C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 ----------<br>
&gt;=C2=A0 =C2=A0hw/mips/malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt;=C2=A0 =C2=A0include/hw/southbridge/piix.h |=C2=A0 6 ++----<br>
&gt;=C2=A0 =C2=A05 files changed, 9 insertions(+), 32 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
&gt; index 47932448fd..82c7941958 100644<br>
&gt; --- a/hw/i386/pc_piix.c<br>
&gt; +++ b/hw/i386/pc_piix.c<br>
&gt; @@ -196,6 +196,9 @@ static void pc_init1(MachineState *machine,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pcmc-&gt;pci_enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PIIX3State *piix3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIDevice *pci_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *type =3D xen_enabled() ? TYPE=
_PIIX3_XEN_DEVICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: TYPE_PIIX3_DEVICE;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus =3D i440fx_init(host_t=
ype,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_type,<br>
&gt; @@ -206,7 +209,8 @@ static void pc_init1(MachineState *machine,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_memory, ram_memory);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcms-&gt;bus =3D pci_bus;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D piix3_create(pci_bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_dev =3D pci_create_simple_multifuncti=
on(pci_bus, -1, true, type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piix3-&gt;pic =3D x86ms-&gt;gs=
i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piix3_devfn =3D piix3-&gt;dev.=
devfn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_c=
hild_bus(DEVICE(piix3), &quot;isa.0&quot;));<br>
&gt; diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c<br>
&gt; index 6eacb22dd0..01c376b39a 100644<br>
&gt; --- a/hw/isa/piix3.c<br>
&gt; +++ b/hw/isa/piix3.c<br>
&gt; @@ -36,9 +36,6 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define XEN_PIIX_NUM_PIRQS=C2=A0 =C2=A0 =C2=A0 128ULL<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define TYPE_PIIX3_DEVICE &quot;PIIX3&quot;<br>
&gt; -#define TYPE_PIIX3_XEN_DEVICE &quot;PIIX3-xen&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0static void piix3_set_irq_pic(PIIX3State *piix3, int pic_i=
rq)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_set_irq(piix3-&gt;pic[pic_irq],<br>
&gt; @@ -402,16 +399,3 @@ static void piix3_register_types(void)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0type_init(piix3_register_types)<br>
&gt; -<br>
&gt; -PIIX3State *piix3_create(PCIBus *pci_bus)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 PIIX3State *piix3;<br>
&gt; -=C2=A0 =C2=A0 PCIDevice *pci_dev;<br>
&gt; -=C2=A0 =C2=A0 const char *type =3D xen_enabled() ? TYPE_PIIX3_XEN_DEV=
ICE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: TYPE_PIIX3=
_DEVICE;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 pci_dev =3D pci_create_simple_multifunction(pci_bus, -1=
, true, type);<br>
&gt; -=C2=A0 =C2=A0 piix3 =3D PIIX3_PCI_DEVICE(pci_dev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return piix3;<br>
&gt; -}<br>
&gt; diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
&gt; index 852e5c4db1..a70063bc77 100644<br>
&gt; --- a/hw/isa/piix4.c<br>
&gt; +++ b/hw/isa/piix4.c<br>
&gt; @@ -300,13 +300,3 @@ static void piix4_register_types(void)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0type_init(piix4_register_types)<br>
&gt; -<br>
&gt; -PCIDevice *piix4_create(PCIBus *pci_bus)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 PCIDevice *pci;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 pci =3D pci_create_simple_multifunction(pci_bus, PCI_DE=
VFN(10, 0), true,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TYPE_PIIX4_PCI_DEVICE);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return pci;<br>
&gt; -}<br>
&gt; diff --git a/hw/mips/malta.c b/hw/mips/malta.c<br>
&gt; index d4bd3549d0..57b5eddc74 100644<br>
&gt; --- a/hw/mips/malta.c<br>
&gt; +++ b/hw/mips/malta.c<br>
&gt; @@ -1400,7 +1400,8 @@ void mips_malta_init(MachineState *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0empty_slot_init(&quot;GT64120&quot;, 0, 0x20=
000000);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
&gt; -=C2=A0 =C2=A0 piix4 =3D piix4_create(pci_bus);<br>
&gt; +=C2=A0 =C2=A0 piix4 =3D pci_create_simple_multifunction(pci_bus, PCI_=
DEVFN(10, 0), true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TYPE_PIIX4_PCI_DEVICE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D DEVICE(piix4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, =
&quot;isa.0&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0smbus =3D piix4_pm_init(pci_bus, piix4-&gt;d=
evfn + 3, 0x1100,<br>
&gt; diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/pi=
ix.h<br>
&gt; index bea3b44551..2d55dbdef7 100644<br>
&gt; --- a/include/hw/southbridge/piix.h<br>
&gt; +++ b/include/hw/southbridge/piix.h<br>
&gt; @@ -70,10 +70,8 @@ typedef struct PIIXState PIIX3State;<br>
&gt;=C2=A0 =C2=A0DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_PCI_DEVICE)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#define TYPE_PIIX3_DEVICE &quot;PIIX3&quot;<br>
&gt; +#define TYPE_PIIX3_XEN_DEVICE &quot;PIIX3-xen&quot;<br>
&gt;=C2=A0 =C2=A0#define TYPE_PIIX4_PCI_DEVICE &quot;piix4-isa&quot;<br>
<br>
I think it would make sense for the movement of these types to be included =
in patch 1 <br>
in a single place.<br></blockquote><div><br></div><div>This makes sense ind=
eed. I&#39;ll change it. <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; -PIIX3State *piix3_create(PCIBus *pci_bus);<br>
&gt; -<br>
&gt; -PCIDevice *piix4_create(PCIBus *pci_bus);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
Otherwise:<br>
<br>
Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande=
.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000003d144e05df96167c--

