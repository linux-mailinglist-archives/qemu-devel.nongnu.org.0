Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521015A043D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 00:46:18 +0200 (CEST)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQz8a-0000Ij-TJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 18:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQz68-00076b-VN; Wed, 24 Aug 2022 18:43:45 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQz66-0001wn-0M; Wed, 24 Aug 2022 18:43:44 -0400
Received: by mail-qt1-x82a.google.com with SMTP id r6so4879783qtx.6;
 Wed, 24 Aug 2022 15:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=n+QOQgx48rVJQUI5vVtQL5FrHycNOF4NWHZPb9GoOrA=;
 b=I848nkluxi5OxBsxyK9+qscJgy4kNkO6HorgeyWzyLSs1/4/Bw8Baqqlkqg2Ak7GNJ
 9tCjXpm3GG0+4yHBslcCCOClJmB0CsvMKiFypZJz3X4fX69MnHopilmGegHX7o/awxjk
 2bUA8BiAZav7aGdprvUportcjbolX2t2HbmIZvKDMkfEIUsrbuUZSz0YWwI1vQfkhUEw
 64KXkqRcAN36uRyoHX1pubjxoxq0x5LzqddVn4aRHE5DFP08HkTUBCHNZXkIFsTvMYRJ
 dh7IwRJfNWSQAPAFmhOrTpUAAT56f/r/4z0jsMKuQlf0Xnw0LPD7x+AkeXE7ocRvl0LD
 690g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=n+QOQgx48rVJQUI5vVtQL5FrHycNOF4NWHZPb9GoOrA=;
 b=bm9a9pOq8niN8kk2drBwh9fJKxra532xkI1T4gELAZvbl3Et1MfdS2d1SK4CkAY0pD
 m8k5SxQ+vEVBj1kBS0j6pyzmXsLoNce29plpng0evy7W47eo/E8Syun7OYRENx72UEUI
 ncVX1vITTQVYiiklDYD/hCj3/1pueahK4De3HQmGyK2rVNbB/LVBuFUoMt4FuHyda+5C
 +SpWd9dCjVjSlHNdFaxNvIq1E93zY9+1NEowSmJKq5DP0kBrAF9HWwyJykk+8cIQ+ZHI
 5ix3BHBIgxlnOP3sJXq/uar5tWG7tD5C20QzfxHBQI7ppgbk3vqM/3IP7lBWaz3bGFf0
 CiUQ==
X-Gm-Message-State: ACgBeo02A5r5EiLsEWOjJ+H4wWQxBoyULaxygwIELfADDOdjZrJ1t4h4
 3l40qfA1TMfvZYIT+Pa7Z2yAzrnH2ugMfzpkIWQ=
X-Google-Smtp-Source: AA6agR7VYmSkwNoKYNhVvVnZztd1UADWaJwuKSl0w+seTLSqupzJHN0cKEAoMOPGS3i3ndNsfCD5DZqTtwL3CG34JKw=
X-Received: by 2002:ac8:5ad4:0:b0:344:5e40:7824 with SMTP id
 d20-20020ac85ad4000000b003445e407824mr1374644qtd.482.1661381020669; Wed, 24
 Aug 2022 15:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-8-shentey@gmail.com>
 <21341fc1-51c8-af83-f034-a66c6399d45@eik.bme.hu>
 <CAG4p6K5PsqCoRMHmzw41ENCxfuW14+bvvwugPicvycao+WHPQA@mail.gmail.com>
 <9ef1e76d-91d1-aa6c-e0bb-f0d34618769c@eik.bme.hu>
In-Reply-To: <9ef1e76d-91d1-aa6c-e0bb-f0d34618769c@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 25 Aug 2022 00:43:25 +0200
Message-ID: <CAG4p6K6g+6Js-78RgUyLpovfZZ0S0wQ7fMXOt9OZX=hPMMhZLQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] hw/isa/vt82c686: QOM'ify ac97 and mc97 creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000092dbf105e70469da"
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

--00000000000092dbf105e70469da
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 12:54 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > On Tue, Aug 23, 2022 at 2:44 AM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >
> >> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> >>> Resolves duplicate code in the boards.
> >>>
> >>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>> ---
> >>> hw/isa/vt82c686.c   | 16 ++++++++++++++++
> >>> hw/mips/fuloong2e.c |  4 ----
> >>> hw/ppc/pegasos2.c   |  4 ----
> >>> 3 files changed, 16 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>> index b964d1a760..47f2fd2669 100644
> >>> --- a/hw/isa/vt82c686.c
> >>> +++ b/hw/isa/vt82c686.c
> >>> @@ -549,6 +549,8 @@ struct ViaISAState {
> >>>     PCIIDEState ide;
> >>>     UHCIState uhci[2];
> >>>     ViaPMState pm;
> >>> +    PCIDevice ac97;
> >>> +    PCIDevice mc97;
> >>> };
> >>>
> >>> static const VMStateDescription vmstate_via = {
> >>> @@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)
> >>>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
> >>>     object_initialize_child(obj, "uhci1", &s->uhci[0],
> >> "vt82c686b-usb-uhci");
> >>>     object_initialize_child(obj, "uhci2", &s->uhci[1],
> >> "vt82c686b-usb-uhci");
> >>> +    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
> >>> +    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> >>> }
> >>>
> >>> static const TypeInfo via_isa_info = {
> >>> @@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d, Error
> >> **errp)
> >>>     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
> >>>         return;
> >>>     }
> >>> +
> >>> +    /* Function 5: AC97 Audio */
> >>> +    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
> >>> +    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    /* Function 6: AC97 Modem */
> >>> +    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
> >>> +    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
> >>> +        return;
> >>> +    }
> >>> }
> >>>
> >>> /* TYPE_VT82C686B_ISA */
> >>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> >>> index f05474348f..ea1aef3049 100644
> >>> --- a/hw/mips/fuloong2e.c
> >>> +++ b/hw/mips/fuloong2e.c
> >>> @@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PCIBus
> >> *pci_bus, int slot, qemu_irq intc,
> >>>
> >>>     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
> >>>     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
> >>> -
> >>> -    /* Audio support */
> >>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
> >>> -    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
> >>> }
> >>>
> >>> /* Network support */
> >>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> >>> index 4e29e42fba..89ef4aed8b 100644
> >>> --- a/hw/ppc/pegasos2.c
> >>> +++ b/hw/ppc/pegasos2.c
> >>> @@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *machine)
> >>>     spd_data = spd_data_generate(DDR, machine->ram_size);
> >>>     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
> >>>
> >>> -    /* VT8231 function 5-6: AC97 Audio & Modem */
> >>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
> >>> -    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
> >>> -
> >>
> >> This removes the last function created here so the comment above saying:
> >> /* VT8231 function 0: PCI-to-ISA Bridge */
> >> is now stale and may be removed as well.
> >>
> >
> > Sure, I'll remove it in v2. What about the comment saying:
> > /* VT8231 function 4: Power Management Controller */
> > ?
>
> I thought that was removed by patch 6 but indeed it wasn't. I think that's
> now also stale and can be dropped (or replapced by something saying SPD
> EEPROM but the remaining code is fairly clear without a comment so jist
> removing it is fine).
>

I'll omit it then.

Thanks,
Bernhard

>
> Regards,
> BALATON Zoltan
>

--00000000000092dbf105e70469da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 24, 2022 at 12:54 AM BALATON =
Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt; On Tue, Aug 23, 2022 at 2:44 AM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt;&gt;&gt; Resolves duplicate code in the boards.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@=
gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; hw/isa/vt82c686.c=C2=A0 =C2=A0| 16 ++++++++++++++++<br>
&gt;&gt;&gt; hw/mips/fuloong2e.c |=C2=A0 4 ----<br>
&gt;&gt;&gt; hw/ppc/pegasos2.c=C2=A0 =C2=A0|=C2=A0 4 ----<br>
&gt;&gt;&gt; 3 files changed, 16 insertions(+), 8 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; index b964d1a760..47f2fd2669 100644<br>
&gt;&gt;&gt; --- a/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; +++ b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; @@ -549,6 +549,8 @@ struct ViaISAState {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0PCIIDEState ide;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0UHCIState uhci[2];<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ViaPMState pm;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 PCIDevice ac97;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 PCIDevice mc97;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt;&gt;&gt; @@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;ide&quot=
;, &amp;s-&gt;ide, &quot;via-ide&quot;);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci1&qu=
ot;, &amp;s-&gt;uhci[0],<br>
&gt;&gt; &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci2&qu=
ot;, &amp;s-&gt;uhci[1],<br>
&gt;&gt; &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;ac97&quot;, =
&amp;s-&gt;ac97, TYPE_VIA_AC97);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;mc97&quot;, =
&amp;s-&gt;mc97, TYPE_VIA_MC97);<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static const TypeInfo via_isa_info =3D {<br>
&gt;&gt;&gt; @@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d,=
 Error<br>
&gt;&gt; **errp)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(&amp;s-&gt;pm), BU=
S(pci_bus), errp)) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Function 5: AC97 Audio */<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;ac97), &q=
uot;addr&quot;, d-&gt;devfn + 5);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;ac97), BUS(=
pci_bus), errp)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Function 6: AC97 Modem */<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;mc97), &q=
uot;addr&quot;, d-&gt;devfn + 6);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;mc97), BUS(=
pci_bus), errp)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /* TYPE_VT82C686B_ISA */<br>
&gt;&gt;&gt; diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c<br>
&gt;&gt;&gt; index f05474348f..ea1aef3049 100644<br>
&gt;&gt;&gt; --- a/hw/mips/fuloong2e.c<br>
&gt;&gt;&gt; +++ b/hw/mips/fuloong2e.c<br>
&gt;&gt;&gt; @@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PC=
IBus<br>
&gt;&gt; *pci_bus, int slot, qemu_irq intc,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0dev =3D PCI_DEVICE(object_resolve_path_comp=
onent(OBJECT(dev), &quot;pm&quot;));<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0*i2c_bus =3D I2C_BUS(qdev_get_child_bus(DEV=
ICE(dev), &quot;i2c&quot;));<br>
&gt;&gt;&gt; -<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 /* Audio support */<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), =
TYPE_VIA_AC97);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), =
TYPE_VIA_MC97);<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /* Network support */<br>
&gt;&gt;&gt; diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c<br>
&gt;&gt;&gt; index 4e29e42fba..89ef4aed8b 100644<br>
&gt;&gt;&gt; --- a/hw/ppc/pegasos2.c<br>
&gt;&gt;&gt; +++ b/hw/ppc/pegasos2.c<br>
&gt;&gt;&gt; @@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *m=
achine)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0spd_data =3D spd_data_generate(DDR, machine=
-&gt;ram_size);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0smbus_eeprom_init_one(i2c_bus, 0x57, spd_da=
ta);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 /* VT8231 function 5-6: AC97 Audio &amp; Modem =
*/<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TY=
PE_VIA_AC97);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TY=
PE_VIA_MC97);<br>
&gt;&gt;&gt; -<br>
&gt;&gt;<br>
&gt;&gt; This removes the last function created here so the comment above s=
aying:<br>
&gt;&gt; /* VT8231 function 0: PCI-to-ISA Bridge */<br>
&gt;&gt; is now stale and may be removed as well.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sure, I&#39;ll remove it in v2. What about the comment saying:<br>
&gt; /* VT8231 function 4: Power Management Controller */<br>
&gt; ?<br>
<br>
I thought that was removed by patch 6 but indeed it wasn&#39;t. I think tha=
t&#39;s <br>
now also stale and can be dropped (or replapced by something saying SPD <br=
>
EEPROM but the remaining code is fairly clear without a comment so jist <br=
>
removing it is fine).<br></blockquote><div><br></div><div>I&#39;ll omit it =
then.</div><div><br></div><div>Thanks,</div><div>Bernhard <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--00000000000092dbf105e70469da--

