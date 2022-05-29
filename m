Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10AE53721A
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:12:37 +0200 (CEST)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNP3-0003Be-46
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNMP-0001gz-3K; Sun, 29 May 2022 14:09:53 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNMN-0005w5-As; Sun, 29 May 2022 14:09:52 -0400
Received: by mail-qt1-x835.google.com with SMTP id hh4so9471629qtb.10;
 Sun, 29 May 2022 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IRR1JbMyDl8R84rWxwQuVX96kYWgd6MLWYKPBsG3oEQ=;
 b=HIzBliuP1lxi5vKlHY3QBr0o2CeqD6LtBw/tksAS0UycGcOQfAudoDpB9LRMpJ+k6o
 bQ7oFVwrEq+d3Cow6hzq7iWLJc3M5pkrhPcWJesAXonETCybNFJgUTxgYfHcqJ7l+cs2
 UKqtRC/4kPW/VB84qAJ6OCFr5v1Od1+3yOzFivI7BWsgvesr0Lo2n0nHAhNbEnTfPnuz
 g1ix6kEQI9kS5SYOEETns53p/hAt+89VjEhlE+Jkr7GPAkSvOvxlNVkWVwUqXdjcaC/r
 37M7eiPc7mKK73ZopqruNplzit8BKSx7bhcWBR3hwlePgNn2LIfQFBA9wqHhIlPE8V/o
 MtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRR1JbMyDl8R84rWxwQuVX96kYWgd6MLWYKPBsG3oEQ=;
 b=AyagAP8//nb7xnEattSJ1x7GVSrIFgq8pHM+UrTOHO8UmTWrYvF76d0Cp8kAorfG3U
 IY/1sfsukAIV4fJvWATnoeBTm2AaUhsgNj1YQk/4mtgKxv5/G1SnmNkcNsLBaPPlGiUr
 Uv30PRBJleCYjUwhFrDJfBNV9/arNziEwgzrgNA0d1WhtzQNE2vD1Q9I9x77gU8GCMcC
 vmptCLjqwv0TFfAZSx2pye1RDDMZWtNYNj2tQvUnvKdOHi/NOwz1uIAZWFmAmmbof2U2
 z1LEieHuV1o4tLEukMgipyZu6vyYTSzdnTbq2MNkWf4CZFLKTIDuFDXtGT6glWhpR52p
 befQ==
X-Gm-Message-State: AOAM53317/15Gwy29dLG7T7pAQeesj8kgKIPC6cNXFyM/r3WvljvHvhr
 ZkSkrgMj5fZaDrEwcSyxC8o3hqMS3bR4ffCjvGzxLKaybCXRsA==
X-Google-Smtp-Source: ABdhPJx1vExbalRG03TaJMSLOK9iC92NLXImofHo51+MTYTyqVLnZNHJF6IVKq8uPZdJiOUzp6rJ+LdOfz2/8wu+W24=
X-Received: by 2002:a05:622a:1386:b0:2f3:d73d:f5c4 with SMTP id
 o6-20020a05622a138600b002f3d73df5c4mr41198489qtk.658.1653847789814; Sun, 29
 May 2022 11:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-2-shentey@gmail.com>
 <c62dad6a-9bd9-a2ef-ab24-c65912baa8bd@ilande.co.uk>
In-Reply-To: <c62dad6a-9bd9-a2ef-ab24-c65912baa8bd@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 29 May 2022 20:09:27 +0200
Message-ID: <CAG4p6K4v8qEUpZKqJ4R6aXXoKWSoBUORySsjt_eJFPzggsZVvg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: multipart/alternative; boundary="0000000000000646f705e02a724f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=shentey@gmail.com; helo=mail-qt1-x835.google.com
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

--0000000000000646f705e02a724f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 11:05 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 28/05/2022 20:20, Bernhard Beschow wrote:
>
> > TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
> > ones, too.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   hw/isa/piix3.c                | 3 ---
> >   include/hw/isa/isa.h          | 2 --
> >   include/hw/southbridge/piix.h | 4 ++++
> >   3 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> > index dab901c9ad..d96ce2b788 100644
> > --- a/hw/isa/piix3.c
> > +++ b/hw/isa/piix3.c
> > @@ -35,9 +35,6 @@
> >
> >   #define XEN_PIIX_NUM_PIRQS      128ULL
> >
> > -#define TYPE_PIIX3_DEVICE "PIIX3"
> > -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> > -
> >   static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
> >   {
> >       qemu_set_irq(piix3->pic[pic_irq],
> > diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> > index 034d706ba1..e9fa2f5cea 100644
> > --- a/include/hw/isa/isa.h
> > +++ b/include/hw/isa/isa.h
> > @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice
> *d)
> >       return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
> >   }
> >
> > -#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> > -
> >   #endif
> > diff --git a/include/hw/southbridge/piix.h
> b/include/hw/southbridge/piix.h
> > index 976b4da582..3b97186f75 100644
> > --- a/include/hw/southbridge/piix.h
> > +++ b/include/hw/southbridge/piix.h
> > @@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;
> >   DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
> >                            TYPE_PIIX3_PCI_DEVICE)
> >
> > +#define TYPE_PIIX3_DEVICE "PIIX3"
> > +#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> > +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> > +
> >   PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
> >
> >   DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus
> **smbus);
>
> One tiny nit here: there's a typo in the subject line which I missed when
> reviewing v2.
>
> s/soughbridge/southbridge/
>

Ack. Will fix in v3.

Best regards,
Bernhard

>
>
> ATB,
>
> Mark.
>

--0000000000000646f705e02a724f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, May 29, 2022 at 11:05 AM Mark Cav=
e-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave-ayl=
and@ilande.co.uk</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 28/05/2022 20:20, Bernhard Be=
schow wrote:<br>
<br>
&gt; TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining<b=
r>
&gt; ones, too.<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@i=
lande.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@a=
msat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 3 ---<br>
&gt;=C2=A0 =C2=A0include/hw/isa/isa.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
 --<br>
&gt;=C2=A0 =C2=A0include/hw/southbridge/piix.h | 4 ++++<br>
&gt;=C2=A0 =C2=A03 files changed, 4 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c<br>
&gt; index dab901c9ad..d96ce2b788 100644<br>
&gt; --- a/hw/isa/piix3.c<br>
&gt; +++ b/hw/isa/piix3.c<br>
&gt; @@ -35,9 +35,6 @@<br>
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
&gt; diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h<br>
&gt; index 034d706ba1..e9fa2f5cea 100644<br>
&gt; --- a/include/hw/isa/isa.h<br>
&gt; +++ b/include/hw/isa/isa.h<br>
&gt; @@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevic=
e *d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ISA_BUS(qdev_get_parent_bus(DEVICE(d)=
));<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#define TYPE_PIIX4_PCI_DEVICE &quot;piix4-isa&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/pi=
ix.h<br>
&gt; index 976b4da582..3b97186f75 100644<br>
&gt; --- a/include/hw/southbridge/piix.h<br>
&gt; +++ b/include/hw/southbridge/piix.h<br>
&gt; @@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;<br>
&gt;=C2=A0 =C2=A0DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_PIIX3_PCI_DEVICE)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#define TYPE_PIIX3_DEVICE &quot;PIIX3&quot;<br>
&gt; +#define TYPE_PIIX3_XEN_DEVICE &quot;PIIX3-xen&quot;<br>
&gt; +#define TYPE_PIIX4_PCI_DEVICE &quot;piix4-isa&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus=
);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bu=
s, I2CBus **smbus);<br>
<br>
One tiny nit here: there&#39;s a typo in the subject line which I missed wh=
en reviewing v2.<br>
<br>
s/soughbridge/southbridge/<br></blockquote><div><br></div><div>Ack. Will fi=
x in v3.</div><div><br></div><div>Best regards,</div><div>Bernhard <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000000646f705e02a724f--

