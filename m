Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752A45A0435
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 00:40:44 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQz3D-0004rC-Ih
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 18:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQyl4-0003sP-1e; Wed, 24 Aug 2022 18:21:58 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:38758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQyl1-0007OR-H5; Wed, 24 Aug 2022 18:21:57 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id u6so9402836qvp.5;
 Wed, 24 Aug 2022 15:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=wd9jYTp6CmkqMUm8P/q2C0f5abRziZFo8VhZ/53rFAw=;
 b=meoUqBhjiv0wlY88HhMf4qMRjOIasidaind3qOqUmaROev9IwTGTvSBUzm7gEw4xKt
 l3f/vW0vtU3NP7NLWLSKgFDoR0tYivkSPmhghmaN5aVpoCBCRBbzst48dJUH4e4+2+7a
 aWLhZ7ttxi0blOAxbRsbwrVPzOUU7Hfmucrof2bid4BYsgag0RB8IA7zCw+fLb4eQsJq
 Kyx7FQYnouoe5jJdotjvao4qAQwoFEiJ+svtjSFkJyEUYmKNUYtlqzbLYYxAiUn0g6je
 fQ/zm1GPvOjEkD5yNWhm7Fkps1ZyWWpbMdRsdn/RIQK7RFIT18X7Uh3hudRJv46aNVC8
 V68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wd9jYTp6CmkqMUm8P/q2C0f5abRziZFo8VhZ/53rFAw=;
 b=SIB0zwQKXF64evyaFkUetImaHbq1xlRHixxFodfKz8P9qGFybWWD0qIIzIomYmGeSb
 dagOzqnDcrz890fG1PVQu5e7EjI9PjyroCSxMXrbXxasGM8uC47xaX+TG8G7/eAC3n/u
 OWpcb9AZ8coyu0InhO/KQ7WNrR9p24qgASwYXYgJnknjagT8BYYL64ReZe4c/jqiF1uS
 BYBInhzxuIu8vYU2Jaqwv+NEzdHhRX0P5rK1uzdYQts74JIpwNiJJ6YLWob8zzcfMy0t
 xIS4PT8cSqUu2qveapyZey2dkzjIehVR7H9H4xVt4EsnkAeaTYTGc1FadBBYCqcn/V01
 P2vQ==
X-Gm-Message-State: ACgBeo0u5ba42cX9ktXaj0Ex49dwqhnWAGZBjtI59dy4n5FGNzJmbr1q
 7+LEDciUM7uMxUU8hBhhKJGg2dEFksy/CYlQiwY=
X-Google-Smtp-Source: AA6agR5M9EZt9GAoWqd7+d1t6BmLpD6mOMO1l8m5GUL68dSGVbIEVh8mOhqKRRz/OAzB+ReMSA06PXUUZCDb5jUK/wY=
X-Received: by 2002:a05:6214:d66:b0:496:d9c0:3134 with SMTP id
 6-20020a0562140d6600b00496d9c03134mr1177117qvs.109.1661379713878; Wed, 24 Aug
 2022 15:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-2-shentey@gmail.com>
 <13a01ca9-ee32-2784-227c-2f6331e224dd@eik.bme.hu>
 <CAG4p6K5j9K_R-+uenAht1ebxVL0-rHwAZ=sRqqui=8QFSbo94g@mail.gmail.com>
 <ca7c4772-e0da-d792-293e-aaaa4480195b@eik.bme.hu>
In-Reply-To: <ca7c4772-e0da-d792-293e-aaaa4480195b@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 25 Aug 2022 00:21:38 +0200
Message-ID: <CAG4p6K6pwAovZSwSjr6dWPEZbmdQG2RBwRi2mhZd3jO2S_WTnQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/isa/vt82c686: QOM'ify Super I/O creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000aece2505e7041bb3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf2d.google.com
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

--000000000000aece2505e7041bb3
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 1:36 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > On Tue, Aug 23, 2022 at 2:35 AM BALATON Zoltan <balaton@eik.bme.hu>
> wrote:
> >
> >> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> >>> The object creation now happens in chip-specific init methods which
> >>> allows the realize methods to be consolidated into one method. Shifting
> >>> the logic into the init methods has the addidional advantage that the
> >>> parent object's init methods are called implicitly.
> >>
> >> This and later patches titled "QOM'ify" don't do what I understand on
> >> QOMifying which is turining an old device model into a QOM object. These
> >> devices are already QOMified, what's really done here is that they are
> >> moved to the ViaISAState or embedded into it and created as part of the
> >> south bridge rather then individually by the boards. Either my
> >> understanding of what QOMify means is wrong or these patches are
> misnamed.
> >>
> >
> > I think your understanding is correct. Peter refers to it as the
> > embed-the-device-struct style [1] which I can take as inspiration for
> > renaming my patches in v2.
> >
> > Technically via_isa_realize() is the realize method of the abstract
> >> TYPE_VIA_ISA class which were overriden by the subclasses but since QOM
> >> does not call overridden methods implicitly this had to be explicitly
> >> called in the overriding realize methods of the subclasses. Now that we
> >> don't have to ovverride the method maybe it could be set once on the
> >> VIA_ISA class then it may work that way but as it's done here is also OK
> >> maybe as a reminder that this super class method should be called by any
> >> overriding method if one's added in the future for some reason.
> >>
> >
> > Right. This would involve moving some code around and creating a class
> > struct. Do you think it's worth it?
>
> You mean a class_init func to assign realize as the class struct
> via_isa_info already exists.


Ah yes, of course.


> But yes this would need to be moved after
> via_isa_realize then. As I wrote above I don't think this is worth it,
> especially becuase if in the future a realize method was re-added to the
> subclasses then it's easy to forget to revert this and call the superclass
> method so assigning via_isa_realize to the subclass as done here is OK and
> I can think of it as a reminder to call this method when overriding it.
> Also with the added class_init func it's shorter this way even if slightly
> mixing different objects. So in the end I'm OK with this as it is.
>

Okay, I'll keep it as it is.

Thanks,
Bernhard

>
> Regards,
> BALATON Zoltan
>
> > Best regards,
> > Bernhard
> >
> > [1]
> >
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/
> >
> > Regards,
> >> BALATON Zoltan
> >>
> >>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >>> ---
> >>> hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------
> >>> 1 file changed, 18 insertions(+), 15 deletions(-)
> >>>
> >>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> >>> index 8f656251b8..0217c98fe4 100644
> >>> --- a/hw/isa/vt82c686.c
> >>> +++ b/hw/isa/vt82c686.c
> >>> @@ -544,7 +544,7 @@ struct ViaISAState {
> >>>     qemu_irq cpu_intr;
> >>>     qemu_irq *isa_irqs;
> >>>     ISABus *isa_bus;
> >>> -    ViaSuperIOState *via_sio;
> >>> +    ViaSuperIOState via_sio;
> >>> };
> >>>
> >>> static const VMStateDescription vmstate_via = {
> >>> @@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d, Error
> >> **errp)
> >>>             d->wmask[i] = 0;
> >>>         }
> >>>     }
> >>> +
> >>> +    /* Super I/O */
> >>> +    if (!qdev_realize(DEVICE(&s->via_sio), BUS(s->isa_bus), errp)) {
> >>> +        return;
> >>> +    }
> >>> }
> >>>
> >>> /* TYPE_VT82C686B_ISA */
> >>> @@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevice *d,
> >> uint32_t addr,
> >>>     pci_default_write_config(d, addr, val, len);
> >>>     if (addr == 0x85) {
> >>>         /* BIT(1): enable or disable superio config io ports */
> >>> -        via_superio_io_enable(s->via_sio, val & BIT(1));
> >>> +        via_superio_io_enable(&s->via_sio, val & BIT(1));
> >>>     }
> >>> }
> >>>
> >>> @@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceState *dev)
> >>>     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
> >>> }
> >>>
> >>> -static void vt82c686b_realize(PCIDevice *d, Error **errp)
> >>> +static void vt82c686b_init(Object *obj)
> >>> {
> >>> -    ViaISAState *s = VIA_ISA(d);
> >>> +    ViaISAState *s = VIA_ISA(obj);
> >>>
> >>> -    via_isa_realize(d, errp);
> >>> -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
> >>> -
>  TYPE_VT82C686B_SUPERIO));
> >>> +    object_initialize_child(obj, "sio", &s->via_sio,
> >> TYPE_VT82C686B_SUPERIO);
> >>> }
> >>>
> >>> static void vt82c686b_class_init(ObjectClass *klass, void *data)
> >>> @@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectClass
> *klass,
> >> void *data)
> >>>     DeviceClass *dc = DEVICE_CLASS(klass);
> >>>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >>>
> >>> -    k->realize = vt82c686b_realize;
> >>> +    k->realize = via_isa_realize;
> >>>     k->config_write = vt82c686b_write_config;
> >>>     k->vendor_id = PCI_VENDOR_ID_VIA;
> >>>     k->device_id = PCI_DEVICE_ID_VIA_82C686B_ISA;
> >>> @@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info = {
> >>>     .name          = TYPE_VT82C686B_ISA,
> >>>     .parent        = TYPE_VIA_ISA,
> >>>     .instance_size = sizeof(ViaISAState),
> >>> +    .instance_init = vt82c686b_init,
> >>>     .class_init    = vt82c686b_class_init,
> >>> };
> >>>
> >>> @@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice *d,
> >> uint32_t addr,
> >>>     pci_default_write_config(d, addr, val, len);
> >>>     if (addr == 0x50) {
> >>>         /* BIT(2): enable or disable superio config io ports */
> >>> -        via_superio_io_enable(s->via_sio, val & BIT(2));
> >>> +        via_superio_io_enable(&s->via_sio, val & BIT(2));
> >>>     }
> >>> }
> >>>
> >>> @@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState *dev)
> >>>     pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
> >>> }
> >>>
> >>> -static void vt8231_realize(PCIDevice *d, Error **errp)
> >>> +static void vt8231_init(Object *obj)
> >>> {
> >>> -    ViaISAState *s = VIA_ISA(d);
> >>> +    ViaISAState *s = VIA_ISA(obj);
> >>>
> >>> -    via_isa_realize(d, errp);
> >>> -    s->via_sio = VIA_SUPERIO(isa_create_simple(s->isa_bus,
> >>> -                                               TYPE_VT8231_SUPERIO));
> >>> +    object_initialize_child(obj, "sio", &s->via_sio,
> >> TYPE_VT8231_SUPERIO);
> >>> }
> >>>
> >>> static void vt8231_class_init(ObjectClass *klass, void *data)
> >>> @@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass *klass,
> >> void *data)
> >>>     DeviceClass *dc = DEVICE_CLASS(klass);
> >>>     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >>>
> >>> -    k->realize = vt8231_realize;
> >>> +    k->realize = via_isa_realize;
> >>>     k->config_write = vt8231_write_config;
> >>>     k->vendor_id = PCI_VENDOR_ID_VIA;
> >>>     k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
> >>> @@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info = {
> >>>     .name          = TYPE_VT8231_ISA,
> >>>     .parent        = TYPE_VIA_ISA,
> >>>     .instance_size = sizeof(ViaISAState),
> >>> +    .instance_init = vt8231_init,
> >>>     .class_init    = vt8231_class_init,
> >>> };
> >>>
> >>>
> >>
> >
>

--000000000000aece2505e7041bb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 24, 2022 at 1:36 AM BALATON Z=
oltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt; On Tue, Aug 23, 2022 at 2:35 AM BALATON Zoltan &lt;<a href=3D"mailto:b=
alaton@eik.bme.hu" target=3D"_blank">balaton@eik.bme.hu</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Tue, 23 Aug 2022, Bernhard Beschow wrote:<br>
&gt;&gt;&gt; The object creation now happens in chip-specific init methods =
which<br>
&gt;&gt;&gt; allows the realize methods to be consolidated into one method.=
 Shifting<br>
&gt;&gt;&gt; the logic into the init methods has the addidional advantage t=
hat the<br>
&gt;&gt;&gt; parent object&#39;s init methods are called implicitly.<br>
&gt;&gt;<br>
&gt;&gt; This and later patches titled &quot;QOM&#39;ify&quot; don&#39;t do=
 what I understand on<br>
&gt;&gt; QOMifying which is turining an old device model into a QOM object.=
 These<br>
&gt;&gt; devices are already QOMified, what&#39;s really done here is that =
they are<br>
&gt;&gt; moved to the ViaISAState or embedded into it and created as part o=
f the<br>
&gt;&gt; south bridge rather then individually by the boards. Either my<br>
&gt;&gt; understanding of what QOMify means is wrong or these patches are m=
isnamed.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think your understanding is correct. Peter refers to it as the<br>
&gt; embed-the-device-struct style [1] which I can take as inspiration for<=
br>
&gt; renaming my patches in v2.<br>
&gt;<br>
&gt; Technically via_isa_realize() is the realize method of the abstract<br=
>
&gt;&gt; TYPE_VIA_ISA class which were overriden by the subclasses but sinc=
e QOM<br>
&gt;&gt; does not call overridden methods implicitly this had to be explici=
tly<br>
&gt;&gt; called in the overriding realize methods of the subclasses. Now th=
at we<br>
&gt;&gt; don&#39;t have to ovverride the method maybe it could be set once =
on the<br>
&gt;&gt; VIA_ISA class then it may work that way but as it&#39;s done here =
is also OK<br>
&gt;&gt; maybe as a reminder that this super class method should be called =
by any<br>
&gt;&gt; overriding method if one&#39;s added in the future for some reason=
.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Right. This would involve moving some code around and creating a class=
<br>
&gt; struct. Do you think it&#39;s worth it?<br>
<br>
You mean a class_init func to assign realize as the class struct <br>
via_isa_info already exists.</blockquote><div><br></div><div>Ah yes, of cou=
rse.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">But yes this would need to be moved after <br>
via_isa_realize then. As I wrote above I don&#39;t think this is worth it, =
<br>
especially becuase if in the future a realize method was re-added to the <b=
r>
subclasses then it&#39;s easy to forget to revert this and call the supercl=
ass <br>
method so assigning via_isa_realize to the subclass as done here is OK and =
<br>
I can think of it as a reminder to call this method when overriding it. <br=
>
Also with the added class_init func it&#39;s shorter this way even if sligh=
tly <br>
mixing different objects. So in the end I&#39;m OK with this as it is.<br><=
/blockquote><div><br></div><div>Okay, I&#39;ll keep it as it is.</div><div>=
<br></div><div>Thanks,</div><div>Bernhard <br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; Best regards,<br>
&gt; Bernhard<br>
&gt;<br>
&gt; [1]<br>
&gt; <a href=3D"http://patchwork.ozlabs.org/project/qemu-devel/patch/202202=
05175913.31738-2-shentey@gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-=
shentey@gmail.com/</a><br>
&gt;<br>
&gt; Regards,<br>
&gt;&gt; BALATON Zoltan<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@=
gmail.com" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; hw/isa/vt82c686.c | 33 ++++++++++++++++++---------------<br>
&gt;&gt;&gt; 1 file changed, 18 insertions(+), 15 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; index 8f656251b8..0217c98fe4 100644<br>
&gt;&gt;&gt; --- a/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; +++ b/hw/isa/vt82c686.c<br>
&gt;&gt;&gt; @@ -544,7 +544,7 @@ struct ViaISAState {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq cpu_intr;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irqs;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0ISABus *isa_bus;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 ViaSuperIOState *via_sio;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ViaSuperIOState via_sio;<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static const VMStateDescription vmstate_via =3D {<br>
&gt;&gt;&gt; @@ -602,6 +602,11 @@ static void via_isa_realize(PCIDevice *d,=
 Error<br>
&gt;&gt; **errp)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d-&gt;wmask[i] =
=3D 0;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 /* Super I/O */<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;via_sio), B=
US(s-&gt;isa_bus), errp)) {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /* TYPE_VT82C686B_ISA */<br>
&gt;&gt;&gt; @@ -615,7 +620,7 @@ static void vt82c686b_write_config(PCIDevi=
ce *d,<br>
&gt;&gt; uint32_t addr,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0pci_default_write_config(d, addr, val, len)=
;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0if (addr =3D=3D 0x85) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BIT(1): enable or disable =
superio config io ports */<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(s-&gt;via_s=
io, val &amp; BIT(1));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(&amp;s-&gt;=
via_sio, val &amp; BIT(1));<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -639,13 +644,11 @@ static void vt82c686b_isa_reset(DeviceSt=
ate *dev)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0pci_conf[0x77] =3D 0x10; /* GPIO Control 1/=
2/3/4 */<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -static void vt82c686b_realize(PCIDevice *d, Error **errp)<br>
&gt;&gt;&gt; +static void vt82c686b_init(Object *obj)<br>
&gt;&gt;&gt; {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(d);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(obj);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 via_isa_realize(d, errp);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 s-&gt;via_sio =3D VIA_SUPERIO(isa_create_simple=
(s-&gt;isa_bus,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_VT82C686B_SUPERIO));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;sio&quot;, &=
amp;s-&gt;via_sio,<br>
&gt;&gt; TYPE_VT82C686B_SUPERIO);<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static void vt82c686b_class_init(ObjectClass *klass, void *dat=
a)<br>
&gt;&gt;&gt; @@ -653,7 +656,7 @@ static void vt82c686b_class_init(ObjectCla=
ss *klass,<br>
&gt;&gt; void *data)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klas=
s);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 k-&gt;realize =3D vt82c686b_realize;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D via_isa_realize;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D vt82c686b_write_conf=
ig;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_VIA;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_VIA_82C68=
6B_ISA;<br>
&gt;&gt;&gt; @@ -670,6 +673,7 @@ static const TypeInfo vt82c686b_isa_info =
=3D {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 TYPE_VT82C686B_ISA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE=
_VIA_ISA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(ViaISAState),<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 .instance_init =3D vt82c686b_init,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D vt82c686b_clas=
s_init,<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -684,7 +688,7 @@ static void vt8231_write_config(PCIDevice =
*d,<br>
&gt;&gt; uint32_t addr,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0pci_default_write_config(d, addr, val, len)=
;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0if (addr =3D=3D 0x50) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BIT(2): enable or disable =
superio config io ports */<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(s-&gt;via_s=
io, val &amp; BIT(2));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 via_superio_io_enable(&amp;s-&gt;=
via_sio, val &amp; BIT(2));<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -703,13 +707,11 @@ static void vt8231_isa_reset(DeviceState=
 *dev)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0pci_conf[0x6b] =3D 0x01; /* Fast IR I/O Bas=
e */<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -static void vt8231_realize(PCIDevice *d, Error **errp)<br>
&gt;&gt;&gt; +static void vt8231_init(Object *obj)<br>
&gt;&gt;&gt; {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(d);<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ViaISAState *s =3D VIA_ISA(obj);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 via_isa_realize(d, errp);<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 s-&gt;via_sio =3D VIA_SUPERIO(isa_create_simple=
(s-&gt;isa_bus,<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_VT8231_SUPERIO));<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;sio&quot;, &=
amp;s-&gt;via_sio,<br>
&gt;&gt; TYPE_VT8231_SUPERIO);<br>
&gt;&gt;&gt; }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; static void vt8231_class_init(ObjectClass *klass, void *data)<=
br>
&gt;&gt;&gt; @@ -717,7 +719,7 @@ static void vt8231_class_init(ObjectClass =
*klass,<br>
&gt;&gt; void *data)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br=
>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klas=
s);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 k-&gt;realize =3D vt8231_realize;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 k-&gt;realize =3D via_isa_realize;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;config_write =3D vt8231_write_config;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;vendor_id =3D PCI_VENDOR_ID_VIA;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0k-&gt;device_id =3D PCI_DEVICE_ID_VIA_8231_=
ISA;<br>
&gt;&gt;&gt; @@ -734,6 +736,7 @@ static const TypeInfo vt8231_isa_info =3D =
{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 TYPE_VT8231_ISA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE=
_VIA_ISA,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.instance_size =3D sizeof(ViaISAState),<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 .instance_init =3D vt8231_init,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0.class_init=C2=A0 =C2=A0 =3D vt8231_class_i=
nit,<br>
&gt;&gt;&gt; };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000aece2505e7041bb3--

