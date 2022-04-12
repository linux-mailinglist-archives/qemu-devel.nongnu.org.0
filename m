Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593754FCC94
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 04:42:51 +0200 (CEST)
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne6UU-0006Ez-26
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 22:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ne6Sw-0005J7-2h
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:41:14 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ne6Su-0006fc-7n
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:41:13 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id l21so11755498vsm.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 19:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIRYptotj3nx2AnubwZpICkUj77vXyFNpJT8FKuht9o=;
 b=HGihH3x8jiCb54k8HV927eh3633EW/uHhTn2g96gjR9ul/Y8xFQNeo+HIY9O9JITr6
 UA+LGGCC4X1qfS3ZMvEeMavYmaMc6o9iMcLYVMM8UNt5xPB4Sq5oD/7/UF3ywwAMS+C+
 bbk7RUq9bPvTNyEFNYoKchycApihKL6HEzGjQE4MSaQjQDM/VVVtljrtTspn+5tc49pn
 uIjoX/5Xk+Az/nfBMNRbujQ5c4N5LiklRa+Z62agCuQQztMyHU1MacGLJLVXB/CAY11f
 IWqWy7dXkSWUB6ziqVJ9UxJhoBh2Zm+gXaQUyZ44fcxlQUMV1Wv6hFpZpkgOHA9/7aQ7
 cd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIRYptotj3nx2AnubwZpICkUj77vXyFNpJT8FKuht9o=;
 b=DO6VRPlnjSdThfZdOtK0Z7vpgIWUwMfOKHB4sulcCN7CozrQr22gr0J7K8PbQd09O+
 yfaAT9kcDaULRhfJyV+8/1dfds5Ee7KrCvAHuIs/UWTZc1oJKwoGg/mi6NhCPtkx99fY
 wcvuWgKacd0w3llsIbwNdW873dJ5GDHRzxhkmtgFSooabMEl8cDcK6vAyppiNEtMWg4P
 0u2doUeudHmyckQbaOidF2Hi3pk3uKZrGMSGK1chxQes/tbgcVCVEChPuo/Nz+al4fcP
 EJiBKMuMpq54EryCYK9QW+/cUxqzdxUo9VzKwWNNw8GHTLyrxVfwlsh5LyerICt6pEF7
 CabA==
X-Gm-Message-State: AOAM532hYbpR2o6krsGoZErMDUTxWYOlc336XEXnbdB7D3wrP3CHuo35
 Xu0bP8Hje6AJei3IISFWFdzgwZyEq0qLVkRNkR/bNQ==
X-Google-Smtp-Source: ABdhPJzUraqDeoeq750LgvBxFEEfvyX16KCkQ+/MN0icp/kTiM5DNjlgg1vctn+HAgWkaGxm8bng1VrTVsvD5Zzy+lg=
X-Received: by 2002:a67:f7d0:0:b0:328:2c41:683d with SMTP id
 a16-20020a67f7d0000000b003282c41683dmr4869103vsp.46.1649731269585; Mon, 11
 Apr 2022 19:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-2-venture@google.com>
 <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
 <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
In-Reply-To: <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Apr 2022 19:40:58 -0700
Message-ID: <CAO=noty4xUoARinJ83UFaJ99i77kau7C5oH4aA5WPVUxfYXidQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="0000000000004d67d905dc6bfe5c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=venture@google.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000004d67d905dc6bfe5c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 1:27 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Thu, Jan 27, 2022 at 10:37 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
>> >
>> > From: Hao Wu <wuhaotsh@google.com>
>> >
>> > The PCI Mailbox Module is a high-bandwidth communcation module
>> > between a Nuvoton BMC and CPU. It features 16KB RAM that are both
>> > accessible by the BMC and core CPU. and supports interrupt for
>> > both sides.
>> >
>> > This patch implements the BMC side of the PCI mailbox module.
>> > Communication with the core CPU is emulated via a chardev and
>> > will be in a follow-up patch.
>> >
>> > Reviewed-by: Patrick Venture <venture@google.com>
>> > Reviewed-by: Joe Komlodi <komlodi@google.com>
>>
>> Hi; this mostly looks good, but I have a question about s->content.
>>
>> > +static void npcm7xx_pci_mbox_init(Object *obj)
>> > +{
>> > +    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
>> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> > +
>> > +    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
>> > +                                      NPCM7XX_PCI_MBOX_RAM_SIZE,
>> s->content);
>>
>> What's s->content for? Nothing in the rest of the device emulation
>> touches it, which seems odd.
>>
>
> Hao informed me that we can drop the content bit here, since it's not used
> until a later patch that we'll be sending up with a bit more detail when we
> get a chance. I sent this series up to land some of the groundwork.
>
> I can send out a v2 with that bit removed.
>
>
>>
>> memory_region_init_ram_device_ptr() is intended primarily
>> for "create a MemoryRegion corresponding to something like
>> a bit of a host device (eg a host PCI MMIO BAR). That doesn't
>> seem like what you're doing here. In particular, using it
>> means that you take on responsibility for ensuring that the
>> underlying memory gets migrated, which you're not doing.
>>
>> If you just want a MemoryRegion that's backed by a bit of
>> host memory, use memory_region_init_ram().
>>
>
> I think this is what we use it for in the future patches, when we add it
> back, it'll come with the context.
>
>
>>
>> > +#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
>> > +#define NPCM7XX_PCI_MBOX(obj) \
>> > +    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
>>
>> We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
>> hand-defining a cast macro these days.
>>
>
> Ack.
>
>
>>
>> thanks
>> -- PMM
>>
>
Peter, just an FYI, this fell off my radar, but I will be circling back
this week to revisit any patches I've sent that are in limbo or waiting on
me, etc.  Thanks for your patience.


>
> Thanks!
>

--0000000000004d67d905dc6bfe5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 1:27 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:37 AM Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">pet=
er.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, 10 Jan 2022 at 17:56, Patrick Venture &lt;<a h=
ref=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&=
gt; wrote:<br>
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
-- PMM<br></blockquote></div></div></blockquote><div><br></div><div>Peter, =
just an FYI, this fell off my radar, but I will be circling back this week =
to revisit any patches I&#39;ve sent that are in limbo or waiting on me, et=
c.=C2=A0 Thanks for your patience.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote><div><br><=
/div><div>Thanks!=C2=A0</div></div></div>
</blockquote></div></div>

--0000000000004d67d905dc6bfe5c--

