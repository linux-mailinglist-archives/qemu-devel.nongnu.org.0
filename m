Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C659EB9B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:57:07 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZ5G-0003ye-UC
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYwP-0000Kd-3I; Tue, 23 Aug 2022 14:47:57 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:37822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYwL-0006ss-U7; Tue, 23 Aug 2022 14:47:56 -0400
Received: by mail-qv1-xf34.google.com with SMTP id m5so8386369qvo.4;
 Tue, 23 Aug 2022 11:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/Lkm59F+14sXo3j47oY0nQpUHmen9fAgKkNHo4Ajn9Q=;
 b=RcJ/ViF61HB3Qyf+5OWWNO+EOqjNJdFuMsK5tY7CyxjQrWAhDS/wRaIY3Fgt1c4NDH
 o/951uWMVTJs4aVsVcAvf6SLrYtbXfbhlGzLKwm/j058XSSnrz7CeWDGbmWglPtgfHBw
 YrPz5P+VgM3q1FGzD7GoL+wKwo1sE/GaxsXQxVrTUFOVemOauxyK7zJus3eywHVzNAv6
 gk4lBK79ew1W3TFuzHxxKGHiAK+x0DeCC55HsfcNcr3SLgusoWgK6Tk5j4Ota9BxJLve
 Q3nt2lDa/fx1AovaUd5/9Pa8VnVv48WbrmFXxUlJOURO9GcgYQEs7V5K40Xc+MMsnlSi
 pdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/Lkm59F+14sXo3j47oY0nQpUHmen9fAgKkNHo4Ajn9Q=;
 b=1ivQ6jbDbBVqNsTvMNVmXas0d7HBbtXEuWcRY5YrSi733E3Mslr7LqybAFelt96+mM
 K6qmQMkI4cYEAhnpXY/0/tF0dqnnPGi4KWVQ+wik+HL611i/9TN6PuBvnBknGe0w0SOj
 xSoW07rPeZpH+OisDA9QyijFwMvS3lbs4pFbuABFpgRscZWKukMPGp7cvLCqTazRCrxw
 62okv5qh7kZQAe4q3Mwh7WjoEWKfsYK6HPBRvKQ2UmxmwtHB4aeWh8YzjTrbhQ0Mw6r5
 hH5Idpq6NIg4KATtI8z1D0F44hCW6scg7OpgATOS/65bmaYcpNyuIDuOR48tNwL9011d
 gurQ==
X-Gm-Message-State: ACgBeo0QY4SSICWV13F7d0/7Op72Pw6PQx+44OfYPV85bs+c0z723nar
 4mNy3YR5X7h4NOIGo3WnCVheBKSmxNRKINhd1kM=
X-Google-Smtp-Source: AA6agR7i39qT4RG8m2WXOc+YeK8xBm1/g0KAYVqJ0Bq45Nu0e9jEZ8OqFElO6bXvR9Y+Qfw1iTmdCpNDgUomEmjr48s=
X-Received: by 2002:a0c:a907:0:b0:496:cf4f:2426 with SMTP id
 y7-20020a0ca907000000b00496cf4f2426mr13539336qva.119.1661280472655; Tue, 23
 Aug 2022 11:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-2-shentey@gmail.com>
 <13a01ca9-ee32-2784-227c-2f6331e224dd@eik.bme.hu>
In-Reply-To: <13a01ca9-ee32-2784-227c-2f6331e224dd@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 23 Aug 2022 20:47:37 +0200
Message-ID: <CAG4p6K5j9K_R-+uenAht1ebxVL0-rHwAZ=sRqqui=8QFSbo94g@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/isa/vt82c686: QOM'ify Super I/O creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000071eccb05e6ed006d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf34.google.com
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

--00000000000071eccb05e6ed006d
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 2:35 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > The object creation now happens in chip-specific init methods which
> > allows the realize methods to be consolidated into one method. Shifting
> > the logic into the init methods has the addidional advantage that the
> > parent object's init methods are called implicitly.
>
> This and later patches titled "QOM'ify" don't do what I understand on
> QOMifying which is turining an old device model into a QOM object. These
> devices are already QOMified, what's really done here is that they are
> moved to the ViaISAState or embedded into it and created as part of the
> south bridge rather then individually by the boards. Either my
> understanding of what QOMify means is wrong or these patches are misnamed.
>

I think your understanding is correct. Peter refers to it as the
embed-the-device-struct style [1] which I can take as inspiration for
renaming my patches in v2.

Technically via_isa_realize() is the realize method of the abstract
> TYPE_VIA_ISA class which were overriden by the subclasses but since QOM
> does not call overridden methods implicitly this had to be explicitly
> called in the overriding realize methods of the subclasses. Now that we
> don't have to ovverride the method maybe it could be set once on the
> VIA_ISA class then it may work that way but as it's done here is also OK
> maybe as a reminder that this super class method should be called by any
> overriding method if one's added in the future for some reason.
>

Right. This would involve moving some code around and creating a class
struct. Do you think it's worth it?

Best regards,
Bernhard

[1]
http://patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/

Regards,
> BALATON Zoltan
>
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> > hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------
> > 1 file changed, 18 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > index 8f656251b8..0217c98fe4 100644
> > --- a/hw/isa/vt82c686.c
> > +++ b/hw/isa/vt82c686.c
> > @@ -544,7 +544,7 @@ struct ViaISAState {
> >     qemu_irq cpu_intr;
> >     qemu_irq *isa_irqs;
> >     ISABus *isa_bus;
> > -    ViaSuperIOState *via_sio;
> > +    ViaSuperIOState via_sio;
> > };
> >
> > static const VMStateDescription vmstate_via = {
> > @@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error
> **errp)
> >             d->wmask[i] = 0;
> >         }
> >     }
> > +
> > +    /* Super I/O */
> > +    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
> > +        return;
> > +    }
> > }
> >
> > /* TYPE_VT82C686B_ISA */
> > @@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d,
> uint32_t addr,
> >     pci_default_write_config(d, addr, val, len);
> >     if (addr == 0x85) {
> >         /* BIT(1): enable or disable superio config io ports */
> > -        via_superio_io_enable(s->via_sio, val & BIT(1));
> > +        via_superio_io_enable(&s->via_sio, val & BIT(1));
> >     }
> > }
> >
> > @@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev)
> >     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
> > }
> >
> > -static void vt82c686b_realize(PCIDevice *d, Error **errp)
> > +static void vt82c686b_init(Object *obj)
> > {
> > -    ViaISAState *s = VIA_ISA(d);
> > +    ViaISAState *s = VIA_ISA(obj);
> >
> > -    via_isa_realize(d, errp);
> > -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
> > -                                               TYPE_VT82C686B_SUPERIO));
> > +    object_initialize_child(obj, "sio", &s->via_sio,
> TYPE_VT82C686B_SUPERIO);
> > }
> >
> > static void vt82c686b_class_init(ObjectClass *klass, void *data)
> > @@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass *klass,
> void *data)
> >     DeviceClass *dc = DEVICE_CLASS(klass);
> >     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >
> > -    k->realize = vt82c686b_realize;
> > +    k->realize = via_isa_realize;
> >     k->config_write = vt82c686b_write_config;
> >     k->vendor_id = PCI_VENDOR_ID_VIA;
> >     k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
> > @@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info = {
> >     .name          = TYPE_VT82C686B_ISA,
> >     .parent        = TYPE_VIA_ISA,
> >     .instance_size = sizeof(ViaISAState),
> > +    .instance_init = vt82c686b_init,
> >     .class_init    = vt82c686b_class_init,
> > };
> >
> > @@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d,
> uint32_t addr,
> >     pci_default_write_config(d, addr, val, len);
> >     if (addr == 0x50) {
> >         /* BIT(2): enable or disable superio config io ports */
> > -        via_superio_io_enable(s->via_sio, val & BIT(2));
> > +        via_superio_io_enable(&s->via_sio, val & BIT(2));
> >     }
> > }
> >
> > @@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)
> >     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
> > }
> >
> > -static void vt8231_realize(PCIDevice *d, Error **errp)
> > +static void vt8231_init(Object *obj)
> > {
> > -    ViaISAState *s = VIA_ISA(d);
> > +    ViaISAState *s = VIA_ISA(obj);
> >
> > -    via_isa_realize(d, errp);
> > -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
> > -                                               TYPE_VT8231_SUPERIO));
> > +    object_initialize_child(obj, "sio", &s->via_sio,
> TYPE_VT8231_SUPERIO);
> > }
> >
> > static void vt8231_class_init(ObjectClass *klass, void *data)
> > @@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass,
> void *data)
> >     DeviceClass *dc = DEVICE_CLASS(klass);
> >     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >
> > -    k->realize = vt8231_realize;
> > +    k->realize = via_isa_realize;
> >     k->config_write = vt8231_write_config;
> >     k->vendor_id = PCI_VENDOR_ID_VIA;
> >     k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
> > @@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info = {
> >     .name          = TYPE_VT8231_ISA,
> >     .parent        = TYPE_VIA_ISA,
> >     .instance_size = sizeof(ViaISAState),
> > +    .instance_init = vt8231_init,
> >     .class_init    = vt8231_class_init,
> > };
> >
> >
>

--00000000000071eccb05e6ed006d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Aug 23, 2022 at 2:35 AM BALATON Z=
oltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt; The object creation now happens in chip-specific init methods which<br=
>
&gt; allows the realize methods to be consolidated into one method. Shiftin=
g<br>
&gt; the logic into the init methods has the addidional advantage that the<=
br>
&gt; parent object&#39;s init methods are called implicitly.<br>
<br>
This and later patches titled &quot;QOM&#39;ify&quot; don&#39;t do what I u=
nderstand on <br>
QOMifying which is turining an old device model into a QOM object. These <b=
r>
devices are already QOMified, what&#39;s really done here is that they are =
<br>
moved to the ViaISAState or embedded into it and created as part of the <br=
>
south bridge rather then individually by the boards. Either my <br>
understanding of what QOMify means is wrong or these patches are misnamed.<=
br></blockquote><div><br></div><div>I think your understanding is correct. =
Peter refers to it as the embed-the-device-struct style [1] which I can tak=
e as inspiration for renaming my patches in v2.</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Technically via_isa_realize() is the realize method of the abstract <br>
TYPE_VIA_ISA class which were overriden by the subclasses but since QOM <br=
>
does not call overridden methods implicitly this had to be explicitly <br>
called in the overriding realize methods of the subclasses. Now that we <br=
>
don&#39;t have to ovverride the method maybe it could be set once on the <b=
r>
VIA_ISA class then it may work that way but as it&#39;s done here is also O=
K <br>
maybe as a reminder that this super class method should be called by any <b=
r>
overriding method if one&#39;s added in the future for some reason.<br></bl=
ockquote><div><br></div><div>Right. This would involve moving some code aro=
und and creating a class struct. Do you think it&#39;s worth it?</div><div>=
<br></div><div>Best regards,</div><div>Bernhard<br></div><div><br></div><di=
v>[1]=C2=A0 <a href=3D"http://patchwork.ozlabs.org/project/qemu-devel/patch=
/20220205175913.31738-2-shentey@gmail.com/">http://patchwork.ozlabs.org/pro=
ject/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/</a></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------<br>
&gt; 1 file changed, 18 insertions(+), 15 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt; index 8f656251b8..0217c98fe4 100644<br>
&gt; --- a/hw/isa/vt82c686.c<br>
&gt; +++ b/hw/isa/vt82c686.c<br>
&gt; @@ -544,7 +544,7 @@ struct ViaISAState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq cpu_intr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irqs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
&gt; -=C2=A0 =C2=A0 ViaSuperIOState *via_sio;<br>
&gt; +=C2=A0 =C2=A0 ViaSuperIOState via_sio;<br>
&gt; };<br>
&gt;<br>
&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt; @@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;wmask[i] =3D 0;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Super I/O */<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;via_sio), BUS(s-&gt=
;isa_bus), errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; }<br>
&gt;<br>
&gt; /* TYPE_VT82C686B_ISA */<br>
&gt; @@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d, u=
int32_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_default_write_config(d, addr, val, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (addr =3D=3D 0x85) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BIT(1): enable or disable superio =
config io ports */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(s-&gt;via_sio, val =
&amp; BIT(1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(&amp;s-&gt;via_sio,=
 val &amp; BIT(1));<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt;<br>
&gt; @@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_conf[0x77] =3D 0x10; /* GPIO Control 1/2/3/4 */=
<br>
&gt; }<br>
&gt;<br>
&gt; -static void vt82c686b_realize(PCIDevice *d, Error **errp)<br>
&gt; +static void vt82c686b_init(Object *obj)<br>
&gt; {<br>
&gt; -=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(d);<br>
&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(obj);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 via_isa_realize(d, errp);<br>
&gt; -=C2=A0 =C2=A0 s-&gt;via_sio =3D VIA_SUPERIO(isa_create_simple(s-&gt;i=
sa_bus,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_VT82C686B_SUPERIO));<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;sio&quot;, &amp;s-&g=
t;via_sio, TYPE_VT82C686B_SUPERIO);<br>
&gt; }<br>
&gt;<br>
&gt; static void vt82c686b_class_init(ObjectClass *klass, void *data)<br>
&gt; @@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass *klas=
s, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 k-&gt;realize =3D vt82c686b_realize;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D via_isa_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D vt82c686b_write_config;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_VIA;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_VIA_82C686B_ISA;<=
br>
&gt; @@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VT=
82C686B_ISA,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIA_ISA=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(ViaISAState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D vt82c686b_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D vt82c686b_class_init,<=
br>
&gt; };<br>
&gt;<br>
&gt; @@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d, uint=
32_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0pci_default_write_config(d, addr, val, len);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (addr =3D=3D 0x50) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BIT(2): enable or disable superio =
config io ports */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(s-&gt;via_sio, val =
&amp; BIT(2));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(&amp;s-&gt;via_sio,=
 val &amp; BIT(2));<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt;<br>
&gt; @@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0pci_conf[0x6b] =3D 0x01; /* Fast IR I/O Base */<br>
&gt; }<br>
&gt;<br>
&gt; -static void vt8231_realize(PCIDevice *d, Error **errp)<br>
&gt; +static void vt8231_init(Object *obj)<br>
&gt; {<br>
&gt; -=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(d);<br>
&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(obj);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 via_isa_realize(d, errp);<br>
&gt; -=C2=A0 =C2=A0 s-&gt;via_sio =3D VIA_SUPERIO(isa_create_simple(s-&gt;i=
sa_bus,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0TYPE_VT8231_SUPERIO));<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;sio&quot;, &amp;s-&g=
t;via_sio, TYPE_VT8231_SUPERIO);<br>
&gt; }<br>
&gt;<br>
&gt; static void vt8231_class_init(ObjectClass *klass, void *data)<br>
&gt; @@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass, =
void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 k-&gt;realize =3D vt8231_realize;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D via_isa_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D vt8231_write_config;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_VIA;<br>
&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_VIA_8231_ISA;<br>
&gt; @@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VT=
8231_ISA,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_VIA_ISA=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(ViaISAState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D vt8231_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D vt8231_class_init,<br>
&gt; };<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000071eccb05e6ed006d--

