Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E781C59EBAD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:59:45 +0200 (CEST)
Received: from localhost ([::1]:48624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZ7o-0007lc-Rx
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYz5-0002FN-12; Tue, 23 Aug 2022 14:50:43 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:39829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYz3-0007SL-5X; Tue, 23 Aug 2022 14:50:42 -0400
Received: by mail-qv1-xf31.google.com with SMTP id p5so9687543qvz.6;
 Tue, 23 Aug 2022 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fQmRCVtVGn5rLbBUMiUbzPlpfC7VUbcy16JDnP7l8gw=;
 b=ERLKf2PBgOoXBZxli9F2YUuaL1tZ7c4LbE0Vs5hlEiy0nmVzWVyRCmCD4oq0kmAgo9
 crA1zIDLEvLm6LPG2+tG3A4OgeUS83yLT7Ch7EJRKdsvNKrctdZgiLXSHmGyRw8gzNBx
 +iLuRgrmvEYy7JpIhAAZM2epPDLfuMBAKvVVqyx18VabDKunNfk986bL05apVcPyFdaS
 Tiq8Ny0R269a1r3OccdGozT6cqxOpFv7Yml0D4zvyKdeQDJMgeILAlWksZQM4ktcvqRp
 fPBnonOdXXMRsBtVOjv1SdOEeI5XBJiX6QFoatbPQ9GWFKdG8WRiZ2xqcbJbClrtPm1W
 Wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fQmRCVtVGn5rLbBUMiUbzPlpfC7VUbcy16JDnP7l8gw=;
 b=JZ8fHtuA1FVHuj341FfIJavnTaZhMOVijDXeWmHafnQZ10/Ot4Yss28h7KdyzN8YWW
 Q4jhhptQ4CwThhryDmFQh8MiXGRGqCO3sHkKYff+6rMm8MMn2jqlyaYWyGSPjRHVm031
 4PlBbXnyTxjTj5pxu4DsQmDxgIJofV4AQoq+qFmqgmhp1Qq+OxHDJjv20C2guohyFn1O
 iatbk6+l5ujc2qojkrAF/DRtYkNt+mEik6ZaAgnOCv4Fu8atoa0nQs5Lpbu5OK+VIqKg
 CtURoCK6KZt4qx3OkLUV9I6KsjwafQSItSJ5Ozz53UCoL2iWv1d1s+sdqgWTa0IAq38C
 zODw==
X-Gm-Message-State: ACgBeo0gh7rA9AsXf8i9Nq0kC8ahYi1o/NqFR7E6ZCQXLX7meHd5CE9x
 Be0nBi6BZiZ9ZC5UrszP7jpO9ewUyjtsMTTd7JQ=
X-Google-Smtp-Source: AA6agR5UBll1utmt+xMVNlK4Sr7db6Mg8I/9NZCQTnjxhHmnardpB+1ElfNzuxe11brcbaD1JKNvtmJIpOHrUQD4gvI=
X-Received: by 2002:a05:6214:da3:b0:496:d154:b172 with SMTP id
 h3-20020a0562140da300b00496d154b172mr13289907qvh.6.1661280639910; Tue, 23 Aug
 2022 11:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-8-shentey@gmail.com>
 <21341fc1-51c8-af83-f034-a66c6399d45@eik.bme.hu>
In-Reply-To: <21341fc1-51c8-af83-f034-a66c6399d45@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 23 Aug 2022 20:50:25 +0200
Message-ID: <CAG4p6K5PsqCoRMHmzw41ENCxfuW14+bvvwugPicvycao+WHPQA@mail.gmail.com>
Subject: Re: [PATCH 7/9] hw/isa/vt82c686: QOM'ify ac97 and mc97 creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006a06c605e6ed0afb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf31.google.com
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

--0000000000006a06c605e6ed0afb
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 2:44 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > Resolves duplicate code in the boards.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> > hw/isa/vt82c686.c   | 16 ++++++++++++++++
> > hw/mips/fuloong2e.c |  4 ----
> > hw/ppc/pegasos2.c   |  4 ----
> > 3 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > index b964d1a760..47f2fd2669 100644
> > --- a/hw/isa/vt82c686.c
> > +++ b/hw/isa/vt82c686.c
> > @@ -549,6 +549,8 @@ struct ViaISAState {
> >     PCIIDEState ide;
> >     UHCIState uhci[2];
> >     ViaPMState pm;
> > +    PCIDevice ac97;
> > +    PCIDevice mc97;
> > };
> >
> > static const VMStateDescription vmstate_via = {
> > @@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)
> >     object_initialize_child(obj, "ide", &s->ide, "via-ide");
> >     object_initialize_child(obj, "uhci1", &s->uhci[0],
> "vt82c686b-usb-uhci");
> >     object_initialize_child(obj, "uhci2", &s->uhci[1],
> "vt82c686b-usb-uhci");
> > +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
> > +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> > }
> >
> > static const TypeInfo via_isa_info = {
> > @@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d, Error
> **errp)
> >     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> >         return;
> >     }
> > +
> > +    /* Function 5: AC97 Audio */
> > +    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
> > +    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
> > +        return;
> > +    }
> > +
> > +    /* Function 6: AC97 Modem */
> > +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
> > +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
> > +        return;
> > +    }
> > }
> >
> > /* TYPE_VT82C686B_ISA */
> > diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> > index f05474348f..ea1aef3049 100644
> > --- a/hw/mips/fuloong2e.c
> > +++ b/hw/mips/fuloong2e.c
> > @@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PCIBus
> *pci_bus, int slot, qemu_irq intc,
> >
> >     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
> >     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> > -
> > -    /* Audio support */
> > -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
> > -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
> > }
> >
> > /* Network support */
> > diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> > index 4e29e42fba..89ef4aed8b 100644
> > --- a/hw/ppc/pegasos2.c
> > +++ b/hw/ppc/pegasos2.c
> > @@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *machine)
> >     spd_data = spd_data_generate(DDR, machine->ram_size);
> >     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
> >
> > -    /* VT8231 function 5-6: AC97 Audio & Modem */
> > -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> > -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> > -
>
> This removes the last function created here so the comment above saying:
> /* VT8231 function 0: PCI-to-ISA Bridge */
> is now stale and may be removed as well.
>

Sure, I'll remove it in v2. What about the comment saying:
/* VT8231 function 4: Power Management Controller */
?

Thanks,
Bernhard

>
> Regards,
> BALATON Zoltan
>
> >     /* other PC hardware */
> >     pci_vga_init(pci_bus);
> >
> >
>

--0000000000006a06c605e6ed0afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Aug 23, 2022 at 2:44 AM BALATON Z=
oltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt; Resolves duplicate code in the boards.<br>
&gt;<br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; hw/isa/vt82c686.c=C2=A0 =C2=A0| 16 ++++++++++++++++<br>
&gt; hw/mips/fuloong2e.c |=C2=A0 4 ----<br>
&gt; hw/ppc/pegasos2.c=C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt; 3 files changed, 16 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt; index b964d1a760..47f2fd2669 100644<br>
&gt; --- a/hw/isa/vt82c686.c<br>
&gt; +++ b/hw/isa/vt82c686.c<br>
&gt; @@ -549,6 +549,8 @@ struct ViaISAState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0PCIIDEState ide;<br>
&gt;=C2=A0 =C2=A0 =C2=A0UHCIState uhci[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaPMState pm;<br>
&gt; +=C2=A0 =C2=A0 PCIDevice ac97;<br>
&gt; +=C2=A0 =C2=A0 PCIDevice mc97;<br>
&gt; };<br>
&gt;<br>
&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt; @@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;ide&quot;, &amp;=
s-&gt;ide, &quot;via-ide&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci1&quot;, &am=
p;s-&gt;uhci[0], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci2&quot;, &am=
p;s-&gt;uhci[1], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ac97&quot;, &amp;s-&=
gt;ac97, TYPE_VIA_AC97);<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;mc97&quot;, &amp;s-&=
gt;mc97, TYPE_VIA_MC97);<br>
&gt; }<br>
&gt;<br>
&gt; static const TypeInfo via_isa_info =3D {<br>
&gt; @@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(&amp;s-&gt;pm), BUS(pci_bu=
s), errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Function 5: AC97 Audio */<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;ac97), &quot;addr=
&quot;, d-&gt;devfn + 5);<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;ac97), BUS(pci_bus)=
, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Function 6: AC97 Modem */<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;mc97), &quot;addr=
&quot;, d-&gt;devfn + 6);<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;mc97), BUS(pci_bus)=
, errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; }<br>
&gt;<br>
&gt; /* TYPE_VT82C686B_ISA */<br>
&gt; diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c<br>
&gt; index f05474348f..ea1aef3049 100644<br>
&gt; --- a/hw/mips/fuloong2e.c<br>
&gt; +++ b/hw/mips/fuloong2e.c<br>
&gt; @@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PCIBus *pc=
i_bus, int slot, qemu_irq intc,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0dev =3D PCI_DEVICE(object_resolve_path_component(OB=
JECT(dev), &quot;pm&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0*i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEVICE(dev)=
, &quot;i2c&quot;));<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /* Audio support */<br>
&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA=
_AC97);<br>
&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA=
_MC97);<br>
&gt; }<br>
&gt;<br>
&gt; /* Network support */<br>
&gt; diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c<br>
&gt; index 4e29e42fba..89ef4aed8b 100644<br>
&gt; --- a/hw/ppc/pegasos2.c<br>
&gt; +++ b/hw/ppc/pegasos2.c<br>
&gt; @@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *machine)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0spd_data =3D spd_data_generate(DDR, machine-&gt;ram=
_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 /* VT8231 function 5-6: AC97 Audio &amp; Modem */<br>
&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_A=
C97);<br>
&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_M=
C97);<br>
&gt; -<br>
<br>
This removes the last function created here so the comment above saying:<br=
>
/* VT8231 function 0: PCI-to-ISA Bridge */<br>
is now stale and may be removed as well.<br></blockquote><div><br></div>Sur=
e, I&#39;ll remove it in v2. What about the comment saying:<br>/* VT8231 fu=
nction 4: Power Management Controller */<br>?</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Thanks,</div><div class=3D"gmail_qu=
ote">Bernhard<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* other PC hardware */<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_vga_init(pci_bus);<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000006a06c605e6ed0afb--

