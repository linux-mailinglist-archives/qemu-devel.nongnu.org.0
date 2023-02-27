Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415066A474C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:53:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgju-00030r-7L; Mon, 27 Feb 2023 11:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWgjr-0002xW-JP; Mon, 27 Feb 2023 11:52:35 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWgjp-00014A-E9; Mon, 27 Feb 2023 11:52:35 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id m10so12130147vso.4;
 Mon, 27 Feb 2023 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uYq7gR3ofsMYSMS/cAcIqe4dtK8giNBJSQgMDt6CN68=;
 b=lcqNIjDjNW4g573tjvJo7jBzXXeZKy+dNULgYbfum4sWyM5WTOf8JUYc2U58Q1wZXj
 QH2Rb5R05RZ4l9J4zD26LMwLbFQySn0w8P/3NpOjM4w8oDR8kVa0gKDBI02sXISOtY+f
 I1QuIAVItYc/1BEm+OOTXTMOk+Fj9J5wbxFSCgOkn6LsPhYw+tCGTF2igJ9twED7k1EB
 8/9QuOGbrlmbD/7Obq1svuQfx1+DKKL0Trs//0GneOPU6XQAU9pwAPYlo3nv2TeSD3Yt
 pn0chNFV134hP2uOARpao+PZZ4d54e17UWV4/M7Sqd+4aZMunp/oD+kpiEwu2AbYkjWN
 vgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uYq7gR3ofsMYSMS/cAcIqe4dtK8giNBJSQgMDt6CN68=;
 b=4rnFN/SPt8BtlyWNvXxrl8gjmNRCKFwoBtQT1j2WcZ24/TVatQFnJEDBewSma5272z
 x7UoG8g2B5b9P/d79Qc81QN5q3dnPQWX/WGHqlfkY9dwmOpcALNIX/nVuZ8sUuSfCqis
 fFYrKomNvxn/xK6b2BhV/A7rUbaNE7q7o3TQFlAVqxJvGVDsBAx2a1lAaR8x5CZo3oPm
 teTrSkRxrOOxqbCsuSXaRNhlZvzMdYNRqNqa4XDlkpIDi8PcCPXbkHGK+GHTc7tD2fX+
 842Ov6d5mV9ovjiPfT5+vJHgnTUBl1/K7I8Vldnj2TV+EY993TCzD5HhUB5oCh5Z7gQk
 Q5RA==
X-Gm-Message-State: AO0yUKWId3DsEQEhk8puz4lfyX++adr7IEJKCPahoqGNbNbRPXbXBdlw
 QxCCDFeUSWiWDC3kuyDonhGjvMiAPFqbWkD2cYg=
X-Google-Smtp-Source: AK7set+WaE6DqCmzS+MGa+4T8iuY7BKXipuJzG6qjzvKkqf+4PvAZflewsEZ8pg/iTUsDMpP5N0kkPu0bKfumBw71Xc=
X-Received: by 2002:a67:ab42:0:b0:414:34d3:89a with SMTP id
 k2-20020a67ab42000000b0041434d3089amr83121vsh.6.1677516751589; Mon, 27 Feb
 2023 08:52:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677445307.git.balaton@eik.bme.hu>
 <0fd9eac9174a840054c511fbc015048929c7bc40.1677445307.git.balaton@eik.bme.hu>
 <F86A8AF3-8D69-497A-ADD1-688D2B4FED03@gmail.com>
 <04111f8e-e24d-2a61-d359-f20f8cd4634e@eik.bme.hu>
 <877517F9-2205-413F-A408-72D36B5142EB@gmail.com>
 <bc066c26-e801-12a0-624e-16ce9c21e00c@eik.bme.hu>
 <7368aeee-4d33-6c90-4068-1ba9c2b2c57b@eik.bme.hu>
 <c0b5ad2e-1b69-a570-b3ca-1f31339f1c8f@eik.bme.hu>
In-Reply-To: <c0b5ad2e-1b69-a570-b3ca-1f31339f1c8f@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Mon, 27 Feb 2023 17:52:20 +0100
Message-ID: <CAG4p6K7K7SE38EUnQ9Z3pU4bt2-Asd2AOoeivp3F6B-+RujF8A@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] hw/isa/vt82c686: Implement PCI IRQ routing
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, ReneEngel80@emailn.de
Content-Type: multipart/alternative; boundary="00000000000015554e05f5b14eec"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2f.google.com
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

--00000000000015554e05f5b14eec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 1:57=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:

> On Mon, 27 Feb 2023, BALATON Zoltan wrote:
> > On Mon, 27 Feb 2023, BALATON Zoltan wrote:
> >> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> >>> Am 26. Februar 2023 23:33:20 UTC schrieb BALATON Zoltan
> >>> <balaton@eik.bme.hu>:
> >>>> On Sun, 26 Feb 2023, Bernhard Beschow wrote:
> >>>>> Am 25. Februar 2023 18:11:49 UTC schrieb BALATON Zoltan
> >>>>> <balaton@eik.bme.hu>:
> >>>>>> From: Bernhard Beschow <shentey@gmail.com>
> >>>>>>
> >>>>>> The real VIA south bridges implement a PCI IRQ router which is
> >>>>>> configured
> >>>>>> by the BIOS or the OS. In order to respect these configurations,
> QEMU
> >>>>>> needs to implement it as well.
> >>>>>>
> >>>>>> Note: The implementation was taken from piix4_set_irq() in
> >>>>>> hw/isa/piix4.
> >>>>>>
> >>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>>>>> [balaton: declare gpio inputs instead of changing pci bus irqs so
> it
> >>>>>> can
> >>>>>> be connected in board code; remove some empty lines]
> >>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>>>>> Tested-by: Rene Engel <ReneEngel80@emailn.de>
> >>>>>> ---
> >>>>>> hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++++++++++++++
> >>>>>> 1 file changed, 39 insertions(+)
> >>>>>>
> >>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>>>>> index 3f9bd0c04d..4025f9bcdc 100644
> >>>>>> --- a/hw/isa/vt82c686.c
> >>>>>> +++ b/hw/isa/vt82c686.c
> >>>>>> @@ -604,6 +604,44 @@ static void via_isa_request_i8259_irq(void
> >>>>>> *opaque, int irq, int level)
> >>>>>>     qemu_set_irq(s->cpu_intr, level);
> >>>>>> }
> >>>>>>
> >>>>>> +static int via_isa_get_pci_irq(const ViaISAState *s, int irq_num)
> >>>>>> +{
> >>>>>> +    switch (irq_num) {
> >>>>>> +    case 0:
> >>>>>> +        return s->dev.config[0x55] >> 4;
> >>>>>> +    case 1:
> >>>>>> +        return s->dev.config[0x56] & 0xf;
> >>>>>> +    case 2:
> >>>>>> +        return s->dev.config[0x56] >> 4;
> >>>>>> +    case 3:
> >>>>>> +        return s->dev.config[0x57] >> 4;
> >>>>>> +    }
> >>>>>> +    return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void via_isa_set_pci_irq(void *opaque, int irq_num, int
> level)
> >>>>>> +{
> >>>>>> +    ViaISAState *s =3D opaque;
> >>>>>> +    PCIBus *bus =3D pci_get_bus(&s->dev);
> >>>>>> +    int pic_irq;
> >>>>>> +
> >>>>>> +    /* now we change the pic irq level according to the via irq
> >>>>>> mappings */
> >>>>>> +    /* XXX: optimize */
> >>>>>> +    pic_irq =3D via_isa_get_pci_irq(s, irq_num);
> >>>>>> +    if (pic_irq < ISA_NUM_IRQS) {
> >>>>>> +        int i, pic_level;
> >>>>>> +
> >>>>>> +        /* The pic level is the logical OR of all the PCI irqs
> mapped
> >>>>>> to it. */
> >>>>>> +        pic_level =3D 0;
> >>>>>> +        for (i =3D 0; i < PCI_NUM_PINS; i++) {
> >>>>>> +            if (pic_irq =3D=3D via_isa_get_pci_irq(s, i)) {
> >>>>>> +                pic_level |=3D pci_bus_get_irq_level(bus, i);
> >>>>>> +            }
> >>>>>> +        }
> >>>>>> +        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
> >>>>>> +    }
> >>>>>> +}
> >>>>>> +
> >>>>>> static void via_isa_realize(PCIDevice *d, Error **errp)
> >>>>>> {
> >>>>>>     ViaISAState *s =3D VIA_ISA(d);
> >>>>>> @@ -614,6 +652,7 @@ static void via_isa_realize(PCIDevice *d, Erro=
r
> >>>>>> **errp)
> >>>>>>     int i;
> >>>>>>
> >>>>>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> >>>>>> +    qdev_init_gpio_in_named(dev, via_isa_set_pci_irq, "pirq",
> >>>>>> PCI_NUM_PINS);
> >>>>>
> >>>>> This line is a Pegasos2 specific addition for fixing its IRQ
> handling.
> >>>>> Since this code must also work with the Fuloong2e board we should
> aim
> >>>>> for a minimal changeset here which renders this line out of scope.
> >>>>>
> >>>>> Let's keep the two series separate since now I need to watch two
> series
> >>>>> for comments. Please use Based-on: tag next time instead.
> >>>>
> >>>> Well, it's not. It's part of the QDev model for VT8231 that allows i=
t
> to
> >>>> be connected by boards so I think this belongs here otherwise this
> won't
> >>>> even compile because the function you've added would be unused and
> bail
> >>>> on -Werror. Let's not make this more difficult than it is. I'm OK
> with
> >>>> reasonable changes but what's your goal now? You can't get rid of
> this
> >>>> line as it's how QDev can model it. Either I have to call into this
> model
> >>>> or have to export these pins as gpios.
> >>>
> >>> Exporting the pins is a separate aspect on top of implementing PCI IR=
Q
> >>> routing. To make this clear and obvious this should be a dedicated
> patch.
> >>> In case either patch has an issue this would also ease and therefore
> >>> acellerate discussions.
> >>
> >> How would you do that? Introduce via_isa_set_pci_irq() as unused in
> this
> >> patch then have a one line patch to add connecting it to gpio pins?
> That
> >> just makes no sense. This is not modeling the chip with QDev and then
> the
> >> boatd
> >
> > This is now modeling...
> >
> >> can connect it as appropriate modeling the board that the chip is in.
> So if
> >> fuloon2e needs to do that then it should. I'll check that as I was
> focusing
> >
> > fuloong2e
>
> I've checked fuloong2e and it still works as before. PCI bus is handled b=
y
> bonito on that board so your patch would actually break it. The VIA chip
> is a PCIDevice. You're not supposed to replace the interrupts of the bus
> it's connected to from this model as that should be done by the pci-host
> or the board. Therefore modeling the chip's PIRQ/PINT pins as gpios which
> is the QDev concept for that is right and your usage of pci_set_irq here
> is wrong.
>

Works for me:
(08/84)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2=
e:
PASS (2.77 s)


>
> Please stop breaking my series. I had a working and tested series (still
> have that on my pegasos2 branch in case we end up chosing that) which was
> changed but you to something that is now conceptually wrong but still
> works because of guests don't change firmware defaults to share PCI
> interrupts with internal functions just to fulfill your assumption that
> internal functions are PCI devices (which now I have proof that they don'=
t
> conform to that PCI standard doc, look at the comment in the last patch
> about PCI Command register in via-ac97 and compare that with the chip
> datasheet) but OK if this allows simlpler code in QEMU and still works I
> can accept that but don't push ideas that are wrong.
>
> Regards,
> BALATON Zoltan
>

--00000000000015554e05f5b14eec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 27, 2023 at 1:57=E2=80=AF=
PM BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme=
.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, 27 Feb 2023, BALATON Zoltan wrote:<br>
&gt; On Mon, 27 Feb 2023, BALATON Zoltan wrote:<br>
&gt;&gt; On Mon, 27 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt; Am 26. Februar 2023 23:33:20 UTC schrieb BALATON Zoltan <br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_blank">ba=
laton@eik.bme.hu</a>&gt;:<br>
&gt;&gt;&gt;&gt; On Sun, 26 Feb 2023, Bernhard Beschow wrote:<br>
&gt;&gt;&gt;&gt;&gt; Am 25. Februar 2023 18:11:49 UTC schrieb BALATON Zolta=
n <br>
&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:balaton@eik.bme.hu" target=3D"_b=
lank">balaton@eik.bme.hu</a>&gt;:<br>
&gt;&gt;&gt;&gt;&gt;&gt; From: Bernhard Beschow &lt;<a href=3D"mailto:shent=
ey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; The real VIA south bridges implement a PCI IRQ rou=
ter which is <br>
&gt;&gt;&gt;&gt;&gt;&gt; configured<br>
&gt;&gt;&gt;&gt;&gt;&gt; by the BIOS or the OS. In order to respect these c=
onfigurations, QEMU<br>
&gt;&gt;&gt;&gt;&gt;&gt; needs to implement it as well.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; Note: The implementation was taken from piix4_set_=
irq() in <br>
&gt;&gt;&gt;&gt;&gt;&gt; hw/isa/piix4.<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mai=
lto:shentey@gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; [balaton: declare gpio inputs instead of changing =
pci bus irqs so it <br>
&gt;&gt;&gt;&gt;&gt;&gt; can<br>
&gt;&gt;&gt;&gt;&gt;&gt; be connected in board code; remove some empty line=
s]<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: BALATON Zoltan &lt;<a href=3D"mailt=
o:balaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Tested-by: Rene Engel &lt;<a href=3D"mailto:ReneEn=
gel80@emailn.de" target=3D"_blank">ReneEngel80@emailn.de</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt; hw/isa/vt82c686.c | 39 +++++++++++++++++++++++++++=
++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt; 1 file changed, 39 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c=
<br>
&gt;&gt;&gt;&gt;&gt;&gt; index 3f9bd0c04d..4025f9bcdc 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; --- a/hw/isa/vt82c686.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; +++ b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt;&gt;&gt;&gt; @@ -604,6 +604,44 @@ static void via_isa_request_i=
8259_irq(void <br>
&gt;&gt;&gt;&gt;&gt;&gt; *opaque, int irq, int level)<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;cpu_intr, le=
vel);<br>
&gt;&gt;&gt;&gt;&gt;&gt; }<br>
&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt;&gt; +static int via_isa_get_pci_irq(const ViaISAState =
*s, int irq_num)<br>
&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 switch (irq_num) {<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 case 0:<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;dev.conf=
ig[0x55] &gt;&gt; 4;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 case 1:<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;dev.conf=
ig[0x56] &amp; 0xf;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 case 2:<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;dev.conf=
ig[0x56] &gt;&gt; 4;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 case 3:<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;dev.conf=
ig[0x57] &gt;&gt; 4;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; +static void via_isa_set_pci_irq(void *opaque, int=
 irq_num, int level)<br>
&gt;&gt;&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D opaque;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 PCIBus *bus =3D pci_get_bus(&amp;s-=
&gt;dev);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 int pic_irq;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* now we change the pic irq level =
according to the via irq <br>
&gt;&gt;&gt;&gt;&gt;&gt; mappings */<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* XXX: optimize */<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 pic_irq =3D via_isa_get_pci_irq(s, =
irq_num);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if (pic_irq &lt; ISA_NUM_IRQS) {<br=
>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, pic_level;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The pic level is t=
he logical OR of all the PCI irqs mapped <br>
&gt;&gt;&gt;&gt;&gt;&gt; to it. */<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pic_level =3D 0;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; =
PCI_NUM_PINS; i++) {<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pic=
_irq =3D=3D via_isa_get_pci_irq(s, i)) {<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pic_level |=3D pci_bus_get_irq_level(bus, i);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;is=
a_irqs[pic_irq], pic_level);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt; static void via_isa_realize(PCIDevice *d, Error **=
errp)<br>
&gt;&gt;&gt;&gt;&gt;&gt; {<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ViaISAState *s =3D VIA_ISA(d);<=
br>
&gt;&gt;&gt;&gt;&gt;&gt; @@ -614,6 +652,7 @@ static void via_isa_realize(PC=
IDevice *d, Error <br>
&gt;&gt;&gt;&gt;&gt;&gt; **errp)<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qdev_init_gpio_out(dev, &amp;s-=
&gt;cpu_intr, 1);<br>
&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 qdev_init_gpio_in_named(dev, via_is=
a_set_pci_irq, &quot;pirq&quot;, <br>
&gt;&gt;&gt;&gt;&gt;&gt; PCI_NUM_PINS);<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; This line is a Pegasos2 specific addition for fixing i=
ts IRQ handling. <br>
&gt;&gt;&gt;&gt;&gt; Since this code must also work with the Fuloong2e boar=
d we should aim <br>
&gt;&gt;&gt;&gt;&gt; for a minimal changeset here which renders this line o=
ut of scope.<br>
&gt;&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt;&gt; Let&#39;s keep the two series separate since now I nee=
d to watch two series <br>
&gt;&gt;&gt;&gt;&gt; for comments. Please use Based-on: tag next time inste=
ad.<br>
&gt;&gt;&gt;&gt; <br>
&gt;&gt;&gt;&gt; Well, it&#39;s not. It&#39;s part of the QDev model for VT=
8231 that allows it to <br>
&gt;&gt;&gt;&gt; be connected by boards so I think this belongs here otherw=
ise this won&#39;t <br>
&gt;&gt;&gt;&gt; even compile because the function you&#39;ve added would b=
e unused and bail <br>
&gt;&gt;&gt;&gt; on -Werror. Let&#39;s not make this more difficult than it=
 is. I&#39;m OK with <br>
&gt;&gt;&gt;&gt; reasonable changes but what&#39;s your goal now? You can&#=
39;t get rid of this <br>
&gt;&gt;&gt;&gt; line as it&#39;s how QDev can model it. Either I have to c=
all into this model <br>
&gt;&gt;&gt;&gt; or have to export these pins as gpios.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Exporting the pins is a separate aspect on top of implementing=
 PCI IRQ <br>
&gt;&gt;&gt; routing. To make this clear and obvious this should be a dedic=
ated patch. <br>
&gt;&gt;&gt; In case either patch has an issue this would also ease and the=
refore <br>
&gt;&gt;&gt; acellerate discussions.<br>
&gt;&gt; <br>
&gt;&gt; How would you do that? Introduce via_isa_set_pci_irq() as unused i=
n this <br>
&gt;&gt; patch then have a one line patch to add connecting it to gpio pins=
? That <br>
&gt;&gt; just makes no sense. This is not modeling the chip with QDev and t=
hen the <br>
&gt;&gt; boatd<br>
&gt;<br>
&gt; This is now modeling...<br>
&gt;<br>
&gt;&gt; can connect it as appropriate modeling the board that the chip is =
in. So if <br>
&gt;&gt; fuloon2e needs to do that then it should. I&#39;ll check that as I=
 was focusing<br>
&gt;<br>
&gt; fuloong2e<br>
<br>
I&#39;ve checked fuloong2e and it still works as before. PCI bus is handled=
 by <br>
bonito on that board so your patch would actually break it. The VIA chip <b=
r>
is a PCIDevice. You&#39;re not supposed to replace the interrupts of the bu=
s <br>
it&#39;s connected to from this model as that should be done by the pci-hos=
t <br>
or the board. Therefore modeling the chip&#39;s PIRQ/PINT pins as gpios whi=
ch <br>
is the QDev concept for that is right and your usage of pci_set_irq here <b=
r>
is wrong.<br></blockquote><div><br></div><div>Works for me:</div><div><span=
 style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background=
-color:rgb(255,255,255)"> (08/84) tests/avocado/boot_linux_console.py:BootL=
inuxConsole.test_mips64el_fuloong2e: </span><span style=3D"color:rgb(84,255=
,84);background-color:rgb(255,255,255)">PASS</span><span style=3D"color:rgb=
(0,0,0);background-color:rgb(255,255,255)"> (2.77 s)</span><br>=C2=A0 </spa=
n><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Please stop breaking my series. I had a working and tested series (still <b=
r>
have that on my pegasos2 branch in case we end up chosing that) which was <=
br>
changed but you to something that is now conceptually wrong but still <br>
works because of guests don&#39;t change firmware defaults to share PCI <br=
>
interrupts with internal functions just to fulfill your assumption that <br=
>
internal functions are PCI devices (which now I have proof that they don&#3=
9;t <br>
conform to that PCI standard doc, look at the comment in the last patch <br=
>
about PCI Command register in via-ac97 and compare that with the chip <br>
datasheet) but OK if this allows simlpler code in QEMU and still works I <b=
r>
can accept that but don&#39;t push ideas that are wrong.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--00000000000015554e05f5b14eec--

