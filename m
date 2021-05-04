Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E693731E7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:26:36 +0200 (CEST)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2Ys-0001gD-JB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1le2Wk-0001AJ-Iq
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:24:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1le2Wg-00014G-KC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:24:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id h127so312680pfe.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 14:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8cnhQdxBTAFwLK4Wb0EmGn1Xmdt8NVoK+idW+J5vogw=;
 b=j5ZIPJfjqyFyQEPaWi8ZnYz7u2Q/ZaU+MGKA2eVdgDVl53tYYitguTqR2ObvMMDe2T
 hqMIchq/HBW37b2VDoYHfcB9JPlWYyeLVuEYXZGdQfzhSh0m7ldbWe6kl6eVLGAQY2LN
 g2TxW6Yfd2hUFEoSUj1cO9aoe2pAuroid1u7XSaj0QNfGl1tgydF7PMY0py3VpriuTnm
 9xRHre+evTAzK6vcaSl5Z39DG+2dLQXIWchPxt5osbSqKwMN0l6WBsPwGJlq0rC5Fw2Y
 RUOZScBLwOqA0SbPNyV545qxUtDbBpJG2gTh9abgWhsftbFc/ayCaI5bSaAsvgkAfUYl
 XV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8cnhQdxBTAFwLK4Wb0EmGn1Xmdt8NVoK+idW+J5vogw=;
 b=D+loGqhpigZ6StnafQ9oakatesHAMWdCoIzseaT51E+lGo3LMr1+9zn6H1BYQPHOl1
 wvyj4p/eGZFQSH3Wv0ST5DRkssmSp3AV/NQg4h9kSxXYuxeABWXp2AMOvgWmnZZ68dj9
 DUJn2JS5SVIP0psX+/oLpybil7XiWFwXoewg/qtM+CA/cNA0UkpCcCO6nXBC5VGHqZlK
 BMtweIw4ETpwYTSdb8ZopaMz/WtqauLLhsW3FTAux8erx0wR3jSyR3LCHMHAuLwih5ZT
 fXvGkW3RBlcei6dMedNb5de0oBBguQoBqvHps9qPINVakgPec53GjeE836j/ZqjlsDf4
 UCRw==
X-Gm-Message-State: AOAM533ESfBLhmo3QMuuCz1duyLyh9zS180yJR8dpdEeq4k3l74VvJCQ
 rvx7YW6t9kFRjwamoU17CEoI55EWuYuSHyus2E4=
X-Google-Smtp-Source: ABdhPJyeJl2FiXSYppryM4BwPgD/bWrsEVGZH26OezN6Nwemk/ZlNSI7AbGR+RvWly3vQxGsbZqis1IRhQxJidyn9+c=
X-Received: by 2002:a63:211c:: with SMTP id h28mr24743041pgh.278.1620163456929; 
 Tue, 04 May 2021 14:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20210429120445.694420-8-chouhan.shreyansh2702@gmail.com>
 <df6c1dc7-5d0f-f094-5d2f-2d8f9a909a1c@vivier.eu>
 <CAAQ-SiMje-qBYy8bwRKXmUEMSQk5UR=rPtTPUBGQ6Fqhs-i_eA@mail.gmail.com>
 <8ddeb9c6-4de0-e0b0-8d35-38f76e5bef4c@vivier.eu>
In-Reply-To: <8ddeb9c6-4de0-e0b0-8d35-38f76e5bef4c@vivier.eu>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Wed, 5 May 2021 02:54:06 +0530
Message-ID: <CAAQ-SiO5QEwVXW90u=ix2bz0fFMhMKJkiN5erZWNkvO5BPMJcA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/27] virtio-snd: Add properties for class init
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000054132605c187b3cf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000054132605c187b3cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 5 May 2021 at 02:00, Laurent Vivier <laurent@vivier.eu> wrote:

> Hi Shreyansh,
>
> First of all, thank you for your work, I was expecting a virtio sound
> device for some time...
>
> You're welcome :)

> Le 04/05/2021 =C3=A0 21:35, Shreyansh Chouhan a =C3=A9crit :
> > On Tue, 4 May 2021 at 19:02, Laurent Vivier <laurent@vivier.eu <mailto:
> laurent@vivier.eu>> wrote:
> >
> >     There is nothing specific to PCI in that code, why do you prevent
> the use of virtio-snd as a MMIO
> >     device?
> >
> > I am sorry I do not understand your question completely. If by
> preventing the use of virtio-snd, you
> > mean
> > why did I add the PCI dependencies to the Kconfig file, then I think I
> must have been a bit confused
> > while writing it. VIRTIO_PCI already includes those dependencies, I wil=
l
> change the dependency to
> > VIRTIO. (Which is what it is for other virtio devices too.)
> >
> > However if you mean why did I not add an MMIO binding for this device,
> then there is no
> > specific reason. I simply followed what QEMU had been doing for the
> other virtio devices.
> > Will there be any advantages to implementing the device as a MMIO
> device?
>
> No, the question was only about the dependencies, generally a a virtio
> device is binded to a virtio
> bus, and virtio PCI is a PCI card providing a virtio bus with the virtio
> device attached to it.
>
> For instance, for virtio-net-pci:
>
> HOST
>
>   -> PCI Host controller
>
>     -> PCI virtio net device (TYPE_VIRTIO_NET_PCI)
>
>       -> virtio Bus (TYPE_VIRTIO_BUS)
>
>         -> virtio net device (TYPE_VIRTIO_NET)
>
> TYPE_VIRTIO_NET_PCI is created by hw/virtio/virtio-net-pci.c and
> TYPE_VIRTIO_NET by hw/net/vrtio-net.c:
>
> hw/virtio/meson.build:
>
> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_NET', if_true:
> files('virtio-net-pci.c'))
> virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>
> hw/net/meson.build
> specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c')=
)
>
> hw/net/Kconfig:
>
> config VIRTIO_NET
>     bool
>     default y
>     depends on VIRTIO
>
> So:
>
> the virtio-net device is built when VIRTIO_NET is set,
> the virtio-net-pci device is build when VIRTIO_NET and VIRTIO_PCI are set=
.
>
> So what I expect for virtio-snd:
>
> hw/virtio/meson.build:
>
> virtio_pci_ss.add(when: 'CONFIG_VIRTIO_SND', if_true:
> files('virtio-snd-pci.c'))
>
> hw/audio/meson.build:
>
> softmmu_ss.add(when: 'CONFIG_VIRTIO_SND', if_true: files('virtio-snd.c'))
>
> hw/audio/Kconfig
>
> config VIRTIO_SND
>     bool
>     default y
>     depends on VIRTIO
>
> With that kind of config, a machine without PCI bus will be able to creat=
e
> a virtio bus to add your
> virtio device (like s390x with virtio-ccw of any other MMIO machine like
> the virt machines).
>
> Thanks a lot for the detailed explanation. It clarifies everything
regarding the separate
pci and device source files and how they are built, which was confusing me
a little bit.
I will fix the meson.build and Kconfig files in the upcoming versions of
these patches.

In short: update your hw/audio/config, and all will be fine.


>
Thanks,
> Laurent
>
--
Thanks
Shreyansh

--00000000000054132605c187b3cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 5 May 2021 at 02:00, Laurent Vivi=
er &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Shreyansh,<br>
<br>
First of all, thank you for your work, I was expecting a virtio sound devic=
e for some time...<br>
<br></blockquote><div>You&#39;re welcome :)=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
Le 04/05/2021 =C3=A0 21:35, Shreyansh Chouhan a =C3=A9crit=C2=A0:<br>
&gt; On Tue, 4 May 2021 at 19:02, Laurent Vivier &lt;<a href=3D"mailto:laur=
ent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a> &lt;mailto:<a href=
=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a>&gt;&g=
t; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0There is nothing specific to PCI in that code, why =
do you prevent the use of virtio-snd as a MMIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0device?<br>
&gt; <br>
&gt; I am sorry I do not understand your question completely. If by prevent=
ing the use of virtio-snd, you<br>
&gt; mean<br>
&gt; why did I add the PCI dependencies to the Kconfig file, then I think I=
 must have been a bit confused<br>
&gt; while writing it. VIRTIO_PCI already includes those dependencies, I wi=
ll change the dependency to<br>
&gt; VIRTIO. (Which is what it is for other virtio devices too.)<br>
&gt; <br>
&gt; However if you mean why did I not add an MMIO binding for this device,=
 then there is no<br>
&gt; specific reason. I simply followed what QEMU had been doing for the ot=
her virtio devices.<br>
&gt; Will there be any advantages to implementing the device as a MMIO devi=
ce? <br>
<br>
No, the question was only about the dependencies, generally a a virtio devi=
ce is binded to a virtio<br>
bus, and virtio PCI is a PCI card providing a virtio bus with the virtio de=
vice attached to it.<br>
<br>
For instance, for virtio-net-pci:<br>
<br>
HOST<br>
<br>
=C2=A0 -&gt; PCI Host controller<br>
<br>
=C2=A0 =C2=A0 -&gt; PCI virtio net device (TYPE_VIRTIO_NET_PCI)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 -&gt; virtio Bus (TYPE_VIRTIO_BUS)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; virtio net device (TYPE_VIRTIO_NET)<br>
<br>
TYPE_VIRTIO_NET_PCI is created by hw/virtio/virtio-net-pci.c and TYPE_VIRTI=
O_NET by hw/net/vrtio-net.c:<br>
<br>
hw/virtio/meson.build:<br>
<br>
virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#39;vi=
rtio-net-pci.c&#39;))<br>
virtio_ss.add_all(when: &#39;CONFIG_VIRTIO_PCI&#39;, if_true: virtio_pci_ss=
)<br>
<br>
hw/net/meson.build<br>
specific_ss.add(when: &#39;CONFIG_VIRTIO_NET&#39;, if_true: files(&#39;virt=
io-net.c&#39;))<br>
<br>
hw/net/Kconfig:<br>
<br>
config VIRTIO_NET<br>
=C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 depends on VIRTIO<br>
<br>
So:<br>
<br>
the virtio-net device is built when VIRTIO_NET is set,<br>
the virtio-net-pci device is build when VIRTIO_NET and VIRTIO_PCI are set.<=
br>
<br>
So what I expect for virtio-snd:<br>
<br>
hw/virtio/meson.build:<br>
<br>
virtio_pci_ss.add(when: &#39;CONFIG_VIRTIO_SND&#39;, if_true: files(&#39;vi=
rtio-snd-pci.c&#39;))<br>
<br>
hw/audio/meson.build:<br>
<br>
softmmu_ss.add(when: &#39;CONFIG_VIRTIO_SND&#39;, if_true: files(&#39;virti=
o-snd.c&#39;))<br>
<br>
hw/audio/Kconfig<br>
<br>
config VIRTIO_SND<br>
=C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 depends on VIRTIO<br>
<br>
With that kind of config, a machine without PCI bus will be able to create =
a virtio bus to add your<br>
virtio device (like s390x with virtio-ccw of any other MMIO machine like th=
e virt machines).<br>
<br></blockquote><div>Thanks a lot for the detailed explanation. It clarifi=
es everything regarding the separate</div><div>pci and device source files =
and how they are built, which was confusing me a little bit.=C2=A0</div><di=
v>I will fix the meson.build and Kconfig files in the upcoming versions of =
these patches.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
In short: update your hw/audio/config, and all will be fine.</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br></blockquote><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Laurent<br></blockquote><div>--</div><div>Thanks</div><div>Shreyansh=C2=A0<=
/div></div></div>

--00000000000054132605c187b3cf--

