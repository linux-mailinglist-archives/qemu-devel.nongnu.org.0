Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79549ED73
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:35:10 +0100 (CET)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCQ9-00047S-Ug
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:35:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDCOC-0003SW-Kt
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:33:08 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=45004
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDCO8-0002PA-Ds
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:33:05 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id b77so2674823vka.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HFH5M2m9A2q6rcfIPGThsq/wvoCfYISRXeX64YN1/kk=;
 b=lN/JgQnItc0dx1eliWFNuO8pmt99lFNCpuVlwiMfIwscfVJhWR+nH93uuBuqX09KZk
 yJIKLGgHD30hHqyaaUlLZKVCo8sR244YxZQxz+hYnt4SZOOkQLYH92sp/Arja3rzmYoX
 ym1MjMJlwz1iRwb5iEE6FOK3GmLFO1f8sOi58cI8spqaEt3QC4fdu0bi/sm9Ozgow0qF
 gm6iYIWH8B2hejriJxb5RIQ+j2T/ct498bwarMGKN5GaVsZ1fQMRp4uPeRqDw5/GzM//
 JBZ2c3Uqz5OmgoDppxy6BsWVfCFiJAOCVW4PxZlaBvTefpeZkxwGaSF/coRzSz5J3vnq
 IYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HFH5M2m9A2q6rcfIPGThsq/wvoCfYISRXeX64YN1/kk=;
 b=N9YL0prTduggR6wvrpn79BH2fq6wv+eu5s8sLNreK/nO7S/J6oDBex9+BmrEwywZB7
 2y/LLBn2CtbLE29lXHlMLYZe2GIoF5ohFak+wYf7q0bIsKNQY9c4LfbkTeVktxAovkwc
 QFt7CB5cp8v4fBgel52wrWCVKlARyBl4TUOT3mZWG3WHk+wgv8ULfxnJzhGb8wn3q0Re
 ZdLBVx4zBC+W5y2+imv076yIjPGfv6+HEMwhDwx6oRwduLe7qdZ+Odrso8uTCkwAshpX
 gJn13VFWaZsQvneXmjLrsXzOMSJM+6Nc4ZcIg1IOAqiR1Naw6sqaxRIOOFbx0z4NhcQv
 LIEQ==
X-Gm-Message-State: AOAM530vYc9yI61CUjL9PWXntI/6N98PHvzUeTNN3SQNmDz+sm9JeCX9
 VGK1vjOafuWb9zmAO99absfS3w96rqElvq1S/JpkePfST3c=
X-Google-Smtp-Source: ABdhPJzbRcF18mNBFrCvuw/QcK9NiaGmmU/3vmP19YaTTjNhjTsuTvIp8rPtUYzsWGpimvUQ31ptJOjncrH5G+PB1HE=
X-Received: by 2002:a67:e0c2:: with SMTP id m2mr2705839vsl.49.1643318870262;
 Thu, 27 Jan 2022 13:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-2-venture@google.com>
 <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
In-Reply-To: <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Jan 2022 13:27:39 -0800
Message-ID: <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="00000000000084589305d696fd3e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=venture@google.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--00000000000084589305d696fd3e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 10:37 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
> >
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > The PCI Mailbox Module is a high-bandwidth communcation module
> > between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> > accessible by the BMC and core CPU. and supports interrupt for
> > both sides.
> >
> > This patch implements the BMC side of the PCI mailbox module.
> > Communication with the core CPU is emulated via a chardev and
> > will be in a follow-up patch.
> >
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Joe Komlodi <komlodi@google.com>
>
> Hi; this mostly looks good, but I have a question about s->content.
>
> > +static void npcm7xx_pci_mbox_init(Object *obj)
> > +{
> > +    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > +
> > +    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
> > +                                      NPCM7XX_PCI_MBOX_RAM_SIZE,
> s->content);
>
> What's s->content for? Nothing in the rest of the device emulation
> touches it, which seems odd.
>

Hao informed me that we can drop the content bit here, since it's not used
until a later patch that we'll be sending up with a bit more detail when we
get a chance. I sent this series up to land some of the groundwork.

I can send out a v2 with that bit removed.


>
> memory_region_init_ram_device_ptr() is intended primarily
> for "create a MemoryRegion corresponding to something like
> a bit of a host device (eg a host PCI MMIO BAR). That doesn't
> seem like what you're doing here. In particular, using it
> means that you take on responsibility for ensuring that the
> underlying memory gets migrated, which you're not doing.
>
> If you just want a MemoryRegion that's backed by a bit of
> host memory, use memory_region_init_ram().
>

I think this is what we use it for in the future patches, when we add it
back, it'll come with the context.


>
> > +#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
> > +#define NPCM7XX_PCI_MBOX(obj) \
> > +    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
>
> We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
> hand-defining a cast macro these days.
>

Ack.


>
> thanks
> -- PMM
>

Thanks!

--00000000000084589305d696fd3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:37 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, 10 Jan 2022 at 17:56, Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt;<br>
&gt; The PCI Mailbox Module is a high-bandwidth communcation module<br>
&gt; between a Nuvoton BMC and CPU. It features 16KB RAM that are both<br>
&gt; accessible by the BMC and core CPU. and supports interrupt for<br>
&gt; both sides.<br>
&gt;<br>
&gt; This patch implements the BMC side of the PCI mailbox module.<br>
&gt; Communication with the core CPU is emulated via a chardev and<br>
&gt; will be in a follow-up patch.<br>
&gt;<br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Reviewed-by: Joe Komlodi &lt;<a href=3D"mailto:komlodi@google.com" tar=
get=3D"_blank">komlodi@google.com</a>&gt;<br>
<br>
Hi; this mostly looks good, but I have a question about s-&gt;content.<br>
<br>
&gt; +static void npcm7xx_pci_mbox_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxPCIMBoxState *s =3D NPCM7XX_PCI_MBOX(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_ram_device_ptr(&amp;s-&gt;ram, obj, =
&quot;pci-mbox-ram&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PCI=
_MBOX_RAM_SIZE, s-&gt;content);<br>
<br>
What&#39;s s-&gt;content for? Nothing in the rest of the device emulation<b=
r>
touches it, which seems odd.<br></blockquote><div><br></div><div>Hao inform=
ed me that we can drop the content bit=C2=A0here, since it&#39;s not used u=
ntil a later patch that we&#39;ll be sending up with a bit more detail when=
 we get a chance. I sent this series up to land some of the groundwork.</di=
v><div><br></div><div>I can send out a v2 with that bit removed.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
memory_region_init_ram_device_ptr() is intended primarily<br>
for &quot;create a MemoryRegion corresponding to something like<br>
a bit of a host device (eg a host PCI MMIO BAR). That doesn&#39;t<br>
seem like what you&#39;re doing here. In particular, using it<br>
means that you take on responsibility for ensuring that the<br>
underlying memory gets migrated, which you&#39;re not doing.<br>
<br>
If you just want a MemoryRegion that&#39;s backed by a bit of<br>
host memory, use memory_region_init_ram().<br></blockquote><div><br></div><=
div>I think this is what we use it for in the future patches, when we add i=
t back, it&#39;ll come with the context.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; +#define TYPE_NPCM7XX_PCI_MBOX &quot;npcm7xx-pci-mbox&quot;<br>
&gt; +#define NPCM7XX_PCI_MBOX(obj) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_P=
CI_MBOX)<br>
<br>
We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than<br>
hand-defining a cast macro these days.<br></blockquote><div><br></div><div>=
Ack.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>Thanks!=C2=A0</div></div></div>

--00000000000084589305d696fd3e--

