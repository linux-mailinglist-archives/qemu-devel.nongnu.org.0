Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2095D5A042F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 00:39:57 +0200 (CEST)
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQz2S-0004G5-6u
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 18:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQyjK-0001kh-1E; Wed, 24 Aug 2022 18:20:10 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQyjH-00072R-LE; Wed, 24 Aug 2022 18:20:09 -0400
Received: by mail-qk1-x731.google.com with SMTP id b9so13847510qka.2;
 Wed, 24 Aug 2022 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lchFUwnb5e1Lozy8Q5Ajl9vyt/qdsFA8lN8BAIk2Pi4=;
 b=cjRMi/mIAvWO6Y3ssCeTtXVVghJmxaQDEW5NZ/MNfHNC/Y2QR+RY1tr9afnbzlNIF8
 3dITO5KgAYqo09V3Gh6VzD9X/7XXI8GsFfN/zxQs1ctrPzuxsG6SVp1Yi1QWAGTWto4v
 T3/UcINvDUuLjBXFMbWQnXGuRg4YK3T1GnVkP1djGtmWaxr5SvSzhS6XP74XawjWJ6eV
 6Pos3pViFZ1vqGJLgulWCBtbxWZ8uePcvlY/C4JnqhfhUs2yyAa4a9zbArVr8b4kd4Mf
 EGtFii5lDLh7oK4nBcpXdDNSCfktoBhQy6eDiF3ZgIJZyqIEi/F5PsdFF87ouV3vE2CA
 1deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lchFUwnb5e1Lozy8Q5Ajl9vyt/qdsFA8lN8BAIk2Pi4=;
 b=iUVzC6VEHsYv79jjF3ubgl2c19cLbU/jXcRrsMUE5PMteRFJ8GP2KZFJ8wy9loUQ1L
 xld4MFHBt/ObdnuUpnLMqFUrEML2GdVA+mRybbKmN7/erLbfWc1Fa4FFQpx/NknDHdoZ
 KsJgqEFt/nsvL15PQ7o9AxT5T8gvP5yZstbmr22qLHXydfEeDJ0JrkrXgiZUBb6oOngD
 qRS2Utum3QSBo9PImMbgynQXzrSkHZ+GX+mRg4osT9QnVus1rSCNiYzg69WvoHT7PuaM
 dMIJJDEJeCgHrdXAB8iYT24ZbXU6LKST2Y7jrrWloZbuniE1+QpY0CmAN1C6Q09LmjIu
 o5Gg==
X-Gm-Message-State: ACgBeo3ISJQsdWvzUdBTyEJfILC2NAeVNDJgwt/ziikfl15mYN3m3q3k
 JPOmPjQ2A5Ec22SBDqGS+pRn3X40D5lue8KtrVI=
X-Google-Smtp-Source: AA6agR6Zg+Bmxuypb2kATeYd0OwdZPLrMZEkgN8DLCHI4aZWcZxXmmUH0cxH0EJ8jhgNAcW2nEoJe5XiMrntLso3aEc=
X-Received: by 2002:ae9:e606:0:b0:6bb:d0e0:3a21 with SMTP id
 z6-20020ae9e606000000b006bbd0e03a21mr1061570qkf.457.1661379605789; Wed, 24
 Aug 2022 15:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-5-shentey@gmail.com>
 <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
In-Reply-To: <14e283f-7bbd-dd70-5458-af897cd7ff4a@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 25 Aug 2022 00:19:50 +0200
Message-ID: <CAG4p6K51DvVFndv+ZuokigksdqjaegkRRnt1ZaOOQqJxp9xGEw@mail.gmail.com>
Subject: Re: [PATCH 4/9] hw/isa/vt82c686: QOM'ify via-ide creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003d7ffa05e704152a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x731.google.com
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

--0000000000003d7ffa05e704152a
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 3:54 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > The IDE function is closely tied to the ISA function (e.g. the IDE
> > interrupt routing happens there), so it makes sense that the IDE
> > function is instantiated within the southbridge itself. As a side effect,
> > duplicated code in the boards is resolved.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> > configs/devices/mips64el-softmmu/default.mak |  1 -
> > hw/isa/Kconfig                               |  1 +
> > hw/isa/vt82c686.c                            | 18 ++++++++++++++++++
> > hw/mips/fuloong2e.c                          |  3 ---
> > hw/ppc/Kconfig                               |  1 -
> > hw/ppc/pegasos2.c                            |  4 ----
> > 6 files changed, 19 insertions(+), 9 deletions(-)
> >
> > diff --git a/configs/devices/mips64el-softmmu/default.mak
> b/configs/devices/mips64el-softmmu/default.mak
> > index c610749ac1..d5188f7ea5 100644
> > --- a/configs/devices/mips64el-softmmu/default.mak
> > +++ b/configs/devices/mips64el-softmmu/default.mak
> > @@ -1,7 +1,6 @@
> > # Default configuration for mips64el-softmmu
> >
> > include ../mips-softmmu/common.mak
> > -CONFIG_IDE_VIA=y
> > CONFIG_FULOONG=y
> > CONFIG_LOONGSON3V=y
> > CONFIG_ATI_VGA=y
> > diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> > index d42143a991..20de7e9294 100644
> > --- a/hw/isa/Kconfig
> > +++ b/hw/isa/Kconfig
> > @@ -53,6 +53,7 @@ config VT82C686
> >     select I8254
> >     select I8257
> >     select I8259
> > +    select IDE_VIA
> >     select MC146818RTC
> >     select PARALLEL
> >
> > diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > index 5582c0b179..37d9ed635d 100644
> > --- a/hw/isa/vt82c686.c
> > +++ b/hw/isa/vt82c686.c
> > @@ -17,6 +17,7 @@
> > #include "hw/isa/vt82c686.h"
> > #include "hw/pci/pci.h"
> > #include "hw/qdev-properties.h"
> > +#include "hw/ide/pci.h"
> > #include "hw/isa/isa.h"
> > #include "hw/isa/superio.h"
> > #include "hw/intc/i8259.h"
> > @@ -544,6 +545,7 @@ struct ViaISAState {
> >     qemu_irq cpu_intr;
> >     qemu_irq *isa_irqs;
> >     ViaSuperIOState via_sio;
> > +    PCIIDEState ide;
> > };
> >
> > static const VMStateDescription vmstate_via = {
> > @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via = {
> >     }
> > };
> >
> > +static void via_isa_init(Object *obj)
> > +{
> > +    ViaISAState *s = VIA_ISA(obj);
> > +
> > +    object_initialize_child(obj, "ide", &s->ide, "via-ide");
> > +}
> > +
> > static const TypeInfo via_isa_info = {
> >     .name          = TYPE_VIA_ISA,
> >     .parent        = TYPE_PCI_DEVICE,
> >     .instance_size = sizeof(ViaISAState),
> > +    .instance_init = via_isa_init,
> >     .abstract      = true,
> >     .interfaces    = (InterfaceInfo[]) {
> >         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error
> **errp)
> > {
> >     ViaISAState *s = VIA_ISA(d);
> >     DeviceState *dev = DEVICE(d);
> > +    PCIBus *pci_bus = pci_get_bus(d);
> >     qemu_irq *isa_irq;
> >     ISABus *isa_bus;
> >     int i;
> > @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Error
> **errp)
> >     if (!qdev_realize(DEVICE(&s->via_sio), BUS(isa_bus), errp)) {
> >         return;
> >     }
> > +
> > +    /* Function 1: IDE */
> > +    qdev_prop_set_int32(DEVICE(&s->ide), "addr", d->devfn + 1);
> > +    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
> > +        return;
> > +    }
> > +    pci_ide_create_devs(PCI_DEVICE(&s->ide));
>
> I'm not sure about moving pci_ide_create_devs() here. This is usally
> called from board code and only piix4 seems to do this. Maybe that's wrong
> because if all IDE devices did this then one machine could not have more
> than one different ide devices (like having an on-board ide and adding a
> pci ide controoler with -device) so this probably belongs to the board
> code to add devices to its default ide controller only as this is machine
> specific. Unless I'm wrong in which case somebody will correct me.
>

Grepping the code it can be seen that it's always called right after
creating the IDE controllers. The only notable exception is the "sii3112"
device in the sam460ex board which is not emulated yet. Since the IDE
controllers are often created in board code this means
pci_ide_create_devs() is called there as well.

Grouping these calls together does make sense since it keeps the logic
together. Otherwise it could happen all too easily that code becomes
inconsistent such that pci_ide_create_devs() could be called without an IDE
controller actually being available. Right?

Best regards,
Bernhard

>
> Regards,
> BALATON Zoltan
>
> > }
> >
> > /* TYPE_VT82C686B_ISA */
> > diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> > index 5ee546f5f6..dae263c1e3 100644
> > --- a/hw/mips/fuloong2e.c
> > +++ b/hw/mips/fuloong2e.c
> > @@ -205,9 +205,6 @@ static void vt82c686b_southbridge_init(PCIBus
> *pci_bus, int slot, qemu_irq intc,
> >                                           TYPE_VT82C686B_ISA);
> >     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
> >
> > -    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
> > -    pci_ide_create_devs(dev);
> > -
> >     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
> >     pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
> >
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index 400511c6b7..18565e966b 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -74,7 +74,6 @@ config PEGASOS2
> >     bool
> >     select MV64361
> >     select VT82C686
> > -    select IDE_VIA
> >     select SMBUS_EEPROM
> >     select VOF
> > # This should come with VT82C686
> > diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> > index 61f4263953..2f59d08ad1 100644
> > --- a/hw/ppc/pegasos2.c
> > +++ b/hw/ppc/pegasos2.c
> > @@ -165,10 +165,6 @@ static void pegasos2_init(MachineState *machine)
> >     qdev_connect_gpio_out(DEVICE(dev), 0,
> >                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
> >
> > -    /* VT8231 function 1: IDE Controller */
> > -    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
> > -    pci_ide_create_devs(dev);
> > -
> >     /* VT8231 function 2-3: USB Ports */
> >     pci_create_simple(pci_bus, PCI_DEVFN(12, 2), "vt82c686b-usb-uhci");
> >     pci_create_simple(pci_bus, PCI_DEVFN(12, 3), "vt82c686b-usb-uhci");
> >
>

--0000000000003d7ffa05e704152a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 24, 2022 at 3:54 PM BALATON Z=
oltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt; The IDE function is closely tied to the ISA function (e.g. the IDE<br>
&gt; interrupt routing happens there), so it makes sense that the IDE<br>
&gt; function is instantiated within the southbridge itself. As a side effe=
ct,<br>
&gt; duplicated code in the boards is resolved.<br>
&gt;<br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; configs/devices/mips64el-softmmu/default.mak |=C2=A0 1 -<br>
&gt; hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; hw/isa/vt82c686.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
&gt; hw/mips/fuloong2e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ---<br>
&gt; hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
&gt; 6 files changed, 19 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/configs/devices/mips64el-softmmu/default.mak b/configs/de=
vices/mips64el-softmmu/default.mak<br>
&gt; index c610749ac1..d5188f7ea5 100644<br>
&gt; --- a/configs/devices/mips64el-softmmu/default.mak<br>
&gt; +++ b/configs/devices/mips64el-softmmu/default.mak<br>
&gt; @@ -1,7 +1,6 @@<br>
&gt; # Default configuration for mips64el-softmmu<br>
&gt;<br>
&gt; include ../mips-softmmu/common.mak<br>
&gt; -CONFIG_IDE_VIA=3Dy<br>
&gt; CONFIG_FULOONG=3Dy<br>
&gt; CONFIG_LOONGSON3V=3Dy<br>
&gt; CONFIG_ATI_VGA=3Dy<br>
&gt; diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig<br>
&gt; index d42143a991..20de7e9294 100644<br>
&gt; --- a/hw/isa/Kconfig<br>
&gt; +++ b/hw/isa/Kconfig<br>
&gt; @@ -53,6 +53,7 @@ config VT82C686<br>
&gt;=C2=A0 =C2=A0 =C2=A0select I8254<br>
&gt;=C2=A0 =C2=A0 =C2=A0select I8257<br>
&gt;=C2=A0 =C2=A0 =C2=A0select I8259<br>
&gt; +=C2=A0 =C2=A0 select IDE_VIA<br>
&gt;=C2=A0 =C2=A0 =C2=A0select MC146818RTC<br>
&gt;=C2=A0 =C2=A0 =C2=A0select PARALLEL<br>
&gt;<br>
&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt; index 5582c0b179..37d9ed635d 100644<br>
&gt; --- a/hw/isa/vt82c686.c<br>
&gt; +++ b/hw/isa/vt82c686.c<br>
&gt; @@ -17,6 +17,7 @@<br>
&gt; #include &quot;hw/isa/vt82c686.h&quot;<br>
&gt; #include &quot;hw/pci/pci.h&quot;<br>
&gt; #include &quot;hw/qdev-properties.h&quot;<br>
&gt; +#include &quot;hw/ide/pci.h&quot;<br>
&gt; #include &quot;hw/isa/isa.h&quot;<br>
&gt; #include &quot;hw/isa/superio.h&quot;<br>
&gt; #include &quot;hw/intc/i8259.h&quot;<br>
&gt; @@ -544,6 +545,7 @@ struct ViaISAState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq cpu_intr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irqs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaSuperIOState via_sio;<br>
&gt; +=C2=A0 =C2=A0 PCIIDEState ide;<br>
&gt; };<br>
&gt;<br>
&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt; @@ -556,10 +558,18 @@ static const VMStateDescription vmstate_via =3D =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; };<br>
&gt;<br>
&gt; +static void via_isa_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ide&quot;, &amp;s-&g=
t;ide, &quot;via-ide&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; static const TypeInfo via_isa_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VI=
A_ISA,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_PCI_DEV=
ICE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(ViaISAState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D via_isa_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.abstract=C2=A0 =C2=A0 =C2=A0 =3D true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.interfaces=C2=A0 =C2=A0 =3D (InterfaceInfo[]) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ INTERFACE_CONVENTIONAL_PCI_DEVICE }=
,<br>
&gt; @@ -583,6 +593,7 @@ static void via_isa_realize(PCIDevice *d, Error **=
errp)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaISAState *s =3D VIA_ISA(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0DeviceState *dev =3D DEVICE(d);<br>
&gt; +=C2=A0 =C2=A0 PCIBus *pci_bus =3D pci_get_bus(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; @@ -607,6 +618,13 @@ static void via_isa_realize(PCIDevice *d, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(&amp;s-&gt;via_sio), BUS(i=
sa_bus), errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Function 1: IDE */<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;ide), &quot;addr&=
quot;, d-&gt;devfn + 1);<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;ide), BUS(pci_bus),=
 errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 pci_ide_create_devs(PCI_DEVICE(&amp;s-&gt;ide));<br>
<br>
I&#39;m not sure about moving pci_ide_create_devs() here. This is usally <b=
r>
called from board code and only piix4 seems to do this. Maybe that&#39;s wr=
ong <br>
because if all IDE devices did this then one machine could not have more <b=
r>
than one different ide devices (like having an on-board ide and adding a <b=
r>
pci ide controoler with -device) so this probably belongs to the board <br>
code to add devices to its default ide controller only as this is machine <=
br>
specific. Unless I&#39;m wrong in which case somebody will correct me.<br><=
/blockquote><div><br></div><div>Grepping the code it can be seen that it&#3=
9;s always called right after creating the IDE controllers. The only notabl=
e exception is the &quot;sii3112&quot; device in the sam460ex board which i=
s not emulated yet. Since the IDE controllers are often created in board co=
de this means pci_ide_create_devs() is called there as well.</div><div><br>=
</div><div>Grouping these calls together does make sense since it keeps the=
 logic together. Otherwise it could happen all too easily that code becomes=
 inconsistent such that pci_ide_create_devs() could be called without an ID=
E controller  actually being available. Right?</div><div><br></div><div>Bes=
t regards,</div><div>Bernhard<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; }<br>
&gt;<br>
&gt; /* TYPE_VT82C686B_ISA */<br>
&gt; diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c<br>
&gt; index 5ee546f5f6..dae263c1e3 100644<br>
&gt; --- a/hw/mips/fuloong2e.c<br>
&gt; +++ b/hw/mips/fuloong2e.c<br>
&gt; @@ -205,9 +205,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci=
_bus, int slot, qemu_irq intc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_VT82C686B_ISA);<br>
&gt;=C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(DEVICE(dev), 0, intc);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 dev =3D pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), =
&quot;via-ide&quot;);<br>
&gt; -=C2=A0 =C2=A0 pci_ide_create_devs(dev);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), &quo=
t;vt82c686b-usb-uhci&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), &quo=
t;vt82c686b-usb-uhci&quot;);<br>
&gt;<br>
&gt; diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig<br>
&gt; index 400511c6b7..18565e966b 100644<br>
&gt; --- a/hw/ppc/Kconfig<br>
&gt; +++ b/hw/ppc/Kconfig<br>
&gt; @@ -74,7 +74,6 @@ config PEGASOS2<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0select MV64361<br>
&gt;=C2=A0 =C2=A0 =C2=A0select VT82C686<br>
&gt; -=C2=A0 =C2=A0 select IDE_VIA<br>
&gt;=C2=A0 =C2=A0 =C2=A0select SMBUS_EEPROM<br>
&gt;=C2=A0 =C2=A0 =C2=A0select VOF<br>
&gt; # This should come with VT82C686<br>
&gt; diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c<br>
&gt; index 61f4263953..2f59d08ad1 100644<br>
&gt; --- a/hw/ppc/pegasos2.c<br>
&gt; +++ b/hw/ppc/pegasos2.c<br>
&gt; @@ -165,10 +165,6 @@ static void pegasos2_init(MachineState *machine)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out(DEVICE(dev), 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in_named(pm-&gt;mv, &quot;gpp&quot=
;, 31));<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* VT8231 function 1: IDE Controller */<br>
&gt; -=C2=A0 =C2=A0 dev =3D pci_create_simple(pci_bus, PCI_DEVFN(12, 1), &q=
uot;via-ide&quot;);<br>
&gt; -=C2=A0 =C2=A0 pci_ide_create_devs(dev);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* VT8231 function 2-3: USB Ports */<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, PCI_DEVFN(12, 2), &quot;=
vt82c686b-usb-uhci&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_create_simple(pci_bus, PCI_DEVFN(12, 3), &quot;=
vt82c686b-usb-uhci&quot;);<br>
&gt;<br>
</blockquote></div></div>

--0000000000003d7ffa05e704152a--

