Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10E59EB66
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:50:39 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYz0-0001vr-DJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYno-00067T-DO; Tue, 23 Aug 2022 14:39:04 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:34563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQYnX-0005RY-Mt; Tue, 23 Aug 2022 14:39:03 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id b2so11206612qvp.1;
 Tue, 23 Aug 2022 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vUJWJ/hLCrTEt7enMi75WEZS47MktynCJ6zWxhLCtDE=;
 b=Bt5H2fbnU/yqSaPTkinClOTD/q+ZiW4skqAAmfc6DvKxNvAibLVj2j1RMCI/F6kmCO
 JOqNAE0a6lCAlitT7FvU8B4wPxCGer5kqAM2pMlYLIn2jJktCP7NVwTshDtO+uQVXcxo
 Pbo1K4h1gzxui1VewKf5ywj0d2dYl/NR2WC2EDBrSorkGpEEJTOTCEJz2Pl7WCV/rdax
 GbDr6N38wEfMHnWcu6jI6zhGHOuMdH4sYHSZoylBNP7yQ7Y00oPzyZx0G+31+mXXVVh6
 jsh5zSyN+etPLUiaCpB1/Oj+CjFiITPNZMwbpSM2neAqxKh5FYHvQZ9gvp/yFCGwpS02
 TGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vUJWJ/hLCrTEt7enMi75WEZS47MktynCJ6zWxhLCtDE=;
 b=63uck9pRaioDUNwe9OhSOKNAohqIYKSIUrq0mtnheiVnVNLrx7M/g28sNXuMgBzcdN
 EHJVqwU75hnERplni5eue55j3c+l7cm5pFvEQ4iitrXZbMVD9VJslrxdWNflzD2I7V/2
 i32MPby295eB/zcJyyyyL6k7Q6TBPJvl8t/WufkPwSLX+PakGe9H9zluU+sbWw+wZNyr
 9q9HZHYCLdqzPbPLenxLuCBGOM38ZiS3fHPEJ86KBptUGX7zyLikzrS9UeVfvBZ0vFlc
 ncGIbXD1QmK56rCviUO6WBYeIzC1Z9v64QtAt9oecGbe7n8pTv8oh7rQ0X0/aKaSnWBH
 f5LA==
X-Gm-Message-State: ACgBeo095g27S4AkaewIRH8HdhOH4xLmK75cEaJeSXpzX4aPK6Zf4y+3
 S0wWgCY7ruWeM90IaUj13Gv2O/jymAR+P4LOMLY=
X-Google-Smtp-Source: AA6agR6almiAJ062Zc8hQFQLDPD+w/8i9OA6JwYiPG7840IIu1tTRcUugGdIls8WkhcKU7cnfZrZLvdQo3FzrA0Jj3Q=
X-Received: by 2002:a0c:a907:0:b0:496:cf4f:2426 with SMTP id
 y7-20020a0ca907000000b00496cf4f2426mr13509987qva.119.1661279920784; Tue, 23
 Aug 2022 11:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-9-shentey@gmail.com>
 <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
In-Reply-To: <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 23 Aug 2022 20:38:25 +0200
Message-ID: <CAG4p6K4BhgTAXAApG4CyRH3bCgMF97wBV5Vm0caBc-krOgEX_Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, "open list:sam460ex" <qemu-ppc@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008d096405e6ecdf19"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

--0000000000008d096405e6ecdf19
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 2:20 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> > hw/isa/vt82c686.c | 12 +++++++++++-
> > 1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > index 47f2fd2669..ee745d5d49 100644
> > --- a/hw/isa/vt82c686.c
> > +++ b/hw/isa/vt82c686.c
> > @@ -546,6 +546,7 @@ struct ViaISAState {
> >     qemu_irq cpu_intr;
> >     qemu_irq *isa_irqs;
> >     ViaSuperIOState via_sio;
> > +    RTCState rtc;
> >     PCIIDEState ide;
> >     UHCIState uhci[2];
> >     ViaPMState pm;
> > @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
> > {
> >     ViaISAState *s = VIA_ISA(obj);
> >
> > +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
> >     object_initialize_child(obj, "ide", &s->ide, "via-ide");
> >     object_initialize_child(obj, "uhci1", &s->uhci[0],
> "vt82c686b-usb-uhci");
> >     object_initialize_child(obj, "uhci2", &s->uhci[1],
> "vt82c686b-usb-uhci");
> > @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error
> **errp)
> >     isa_bus_irqs(isa_bus, s->isa_irqs);
> >     i8254_pit_init(isa_bus, 0x40, 0, NULL);
> >     i8257_dma_init(isa_bus, 0);
> > -    mc146818_rtc_init(isa_bus, 2000, NULL);
> > +
> > +    /* RTC */
> > +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
> > +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
> > +        return;
> > +    }
> > +    object_property_add_alias(qdev_get_machine(), "rtc-time",
> OBJECT(&s->rtc),
> > +                              "date");
> > +    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
> >
> >     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> >         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
> >
>
> This actually introduces code duplication as all other places except piix4
> seem to still use the init function (probably to ensure that the rtc-rime
> alias on the machine is properly set) so I'd keep this the same as
> everything else and drop this patch until this init function is removed
> from all other places as well.
>

Hi Zoltan,

Thanks for the fast reply! Regarding code homogeneity and duplication I've
made a similar argument for mc146818_rtc_init() in the past [1] and I've
learnt that my patch went backwards. Incidentally, Peter mentioned vt686c
as a candidate for the embed-the-device-struct style which - again
incidentally - I've now done.

The rtc-time alias is actually only used by a couple of PPC machines where
Pegasos II is one of them. So the alias actually needs to be created only
for these machines, and identifying the cases where it has to be preserved
requires a lot of careful investigation. In the Pegasos II case this seems
especially complicated since one needs to look through several layers of
devices. During my work on the VT82xx south bridges I've gained some
knowledge such that I'd like to make this simplifying contribution.

Our discussion makes me realize that the creation of the alias could now
actually be moved to the Pegasos II board. This way, the Pegasos II board
would both create and consume that alias, which seems to remove quite some
cognitive load. Do you agree? Would moving the alias to the board work for
you?

Thanks,
Bernhard

[1]
http://patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/

>
> Regards,
> BALATON Zoltan
>

--0000000000008d096405e6ecdf19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 23, 2022 at 2:20 AM BALATON Zoltan &lt;<a href=3D"mailto=
:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, 23 Aug 2022, Bernhard Bescho=
w wrote:<br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; hw/isa/vt82c686.c | 12 +++++++++++-<br>
&gt; 1 file changed, 11 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c<br>
&gt; index 47f2fd2669..ee745d5d49 100644<br>
&gt; --- a/hw/isa/vt82c686.c<br>
&gt; +++ b/hw/isa/vt82c686.c<br>
&gt; @@ -546,6 +546,7 @@ struct ViaISAState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq cpu_intr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu_irq *isa_irqs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaSuperIOState via_sio;<br>
&gt; +=C2=A0 =C2=A0 RTCState rtc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0PCIIDEState ide;<br>
&gt;=C2=A0 =C2=A0 =C2=A0UHCIState uhci[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaPMState pm;<br>
&gt; @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0ViaISAState *s =3D VIA_ISA(obj);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;rtc&quot;, &amp;s-&g=
t;rtc, TYPE_MC146818_RTC);<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;ide&quot;, &amp;=
s-&gt;ide, &quot;via-ide&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci1&quot;, &am=
p;s-&gt;uhci[0], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;uhci2&quot;, &am=
p;s-&gt;uhci[1], &quot;vt82c686b-usb-uhci&quot;);<br>
&gt; @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error *=
*errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0isa_bus_irqs(isa_bus, s-&gt;isa_irqs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0i8254_pit_init(isa_bus, 0x40, 0, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0i8257_dma_init(isa_bus, 0);<br>
&gt; -=C2=A0 =C2=A0 mc146818_rtc_init(isa_bus, 2000, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* RTC */<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;rtc), &quot;base_=
year&quot;, 2000);<br>
&gt; +=C2=A0 =C2=A0 if (!qdev_realize(DEVICE(&amp;s-&gt;rtc), BUS(isa_bus),=
 errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 object_property_add_alias(qdev_get_machine(), &quot;rtc=
-time&quot;, OBJECT(&amp;s-&gt;rtc),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;date&quot;);<br>
&gt; +=C2=A0 =C2=A0 isa_connect_gpio_out(ISA_DEVICE(&amp;s-&gt;rtc), 0, s-&=
gt;rtc.isairq);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; PCI_CONFIG_HEADER_SIZE; i++) {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i &lt; PCI_COMMAND || i &gt;=3D P=
CI_REVISION_ID) {<br>
&gt;<br>
<br>
This actually introduces code duplication as all other places except piix4 =
<br>
seem to still use the init function (probably to ensure that the rtc-rime <=
br>
alias on the machine is properly set) so I&#39;d keep this the same as <br>
everything else and drop this patch until this init function is removed <br=
>
from all other places as well.<br></blockquote><div><br></div><div>Hi Zolta=
n,</div><div><br></div><div>Thanks for the fast reply! Regarding code homog=
eneity and duplication I&#39;ve made a similar argument for mc146818_rtc_in=
it() in the past [1] and I&#39;ve learnt that my patch went backwards. Inci=
dentally, Peter mentioned vt686c as a candidate for the embed-the-device-st=
ruct style which - again incidentally - I&#39;ve now done.</div><div><br></=
div><div>The rtc-time alias is actually only used by a couple of PPC machin=
es where Pegasos II is one of them. So the alias actually needs to be creat=
ed only for these machines, and identifying the cases where it has to be pr=
eserved requires a lot of careful investigation. In the Pegasos II case thi=
s seems especially complicated since one needs to look through several laye=
rs of devices. During my work on the VT82xx south bridges I&#39;ve gained s=
ome knowledge such that I&#39;d like to make this simplifying contribution.=
</div><div><br></div><div>Our discussion makes me realize that the creation=
 of the alias could now actually be moved to the Pegasos II board. This way=
, the Pegasos II board would both create and consume that alias, which seem=
s to remove quite some cognitive load. Do you agree? Would moving the alias=
 to the board work for you?</div><div><br></div><div>Thanks,</div><div>Bern=
hard<br></div><div><br></div><div>[1] <a href=3D"http://patchwork.ozlabs.or=
g/project/qemu-devel/patch/20220205175913.31738-2-shentey@gmail.com/">http:=
//patchwork.ozlabs.org/project/qemu-devel/patch/20220205175913.31738-2-shen=
tey@gmail.com/</a></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
BALATON Zoltan<br>
</blockquote></div></div>

--0000000000008d096405e6ecdf19--

