Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3B26CF41
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 01:11:38 +0200 (CEST)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIgaP-0001lZ-Iq
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 19:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kIgZX-00010a-Fb; Wed, 16 Sep 2020 19:10:43 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kIgZV-0004eV-Jo; Wed, 16 Sep 2020 19:10:43 -0400
Received: by mail-ej1-x643.google.com with SMTP id u21so295558eja.2;
 Wed, 16 Sep 2020 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/5UsAxmnUVzHtcRiKgjko8kzeK/JClDw+iiIgx2Wt4=;
 b=TijStcC4qTgcCiKSfqYclsF3ShCwkaO011hiDb+F8ga8jaZPalNV6ork+vKaU7b879
 KntwheqJF5Ibo5aSChkzI5XGSONP9chJZ/khcPhqc1+VgrZqaIydKyB8x8YmRLpHzG9l
 VCQlRIluZ2qwQIVByStM5GHMAWJjeCgq85ItA18VlOnrmkUF5WgqkqSTjAO53plUYx6x
 B6xM8rKaIiNw2SE7uAHTGLKxJAMqSDra2OmW/MNbbLJk0KP8xD+hbgF/mdowqCBI7t3Y
 cKku+z7T400ZcMyJzvUbbrgTi08w75DGLiJayvzn3GUp8EW0aYZUjSSP3mcoO3tPebPU
 aStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/5UsAxmnUVzHtcRiKgjko8kzeK/JClDw+iiIgx2Wt4=;
 b=ZYROy+dvMUMwl9QE2L4LLQUXPC3JspNq1zGZCMTkgaFODF1ys1g/q3C0NrCZycT4CE
 vIg87LAmG4DUFqdP9TFNmiyOtIAY19bWS3zoykOsVtk/zp2KgAa3QrKgUzxgC8lD3nnV
 jS6EjPj/L9qZPIZz5cRuqtJqkEQNbi/1BG2X/yugzJFV2pNAiYcCzBIj19SPao6ws8u7
 2clat2UPJ8v3fSRtyre+WDGTF0V0eALW3MJTGlN5qHHZj82tAmKhgiqvp8NBXprobCD1
 ctR2aorS01NYwLh5j8uKHPIwjZNEjFyyob9Q8kBhh7kBJYDslsKALhVRs/f6yGMwXJXO
 K2KQ==
X-Gm-Message-State: AOAM5302nC93KBoufvua7nzcP4zEzWFtnfh5QApQ4bp/U3uj3Mi0LrWd
 RwbakxdsCbfTEmatQEOD/GLQHTwdTlPTbnAeJTE=
X-Google-Smtp-Source: ABdhPJzc7BlSAPfzS21Ik1TTeZBU6LobHGxgZYARHjBENQ7qG2hCbTR5eN/yY24vmL8gFtunnjxHbhkch+F63rBcMFY=
X-Received: by 2002:a17:906:7856:: with SMTP id
 p22mr27216395ejm.262.1600297838469; 
 Wed, 16 Sep 2020 16:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154439.643272-1-philmd@redhat.com>
 <69f3f4d6-de7d-9535-03b3-a57ca8f041d6@redhat.com>
In-Reply-To: <69f3f4d6-de7d-9535-03b3-a57ca8f041d6@redhat.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 17 Sep 2020 01:10:28 +0200
Message-ID: <CAJy5ezqT2vuhFG6n4cAHsB4NwDjC8EdbC=A3aJ94hu+u831vYQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] dma: Let the DMA API take MemTxAttrs argument and
 propagate MemTxResult
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000032673d05af76601a"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032673d05af76601a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Sep 2020, 15:48 Philippe Mathieu-Daud=C3=A9, <philmd@redhat.com>
wrote:

> On 9/4/20 5:44 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Salvaging cleanups patches from the RFC series "Forbid DMA write
> > accesses to MMIO regions" [*], propagating MemTxResult and
> > adding documentation.
> >
> > Philippe Mathieu-Daud=C3=A9 (12):
> >   dma: Let dma_memory_valid() take MemTxAttrs argument
> >   dma: Let dma_memory_set() take MemTxAttrs argument
> >   dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
> >   dma: Let dma_memory_rw() take MemTxAttrs argument
> >   dma: Let dma_memory_read/write() take MemTxAttrs argument
> >   dma: Let dma_memory_map() take MemTxAttrs argument
>
> Talking with Laszlo, he wonders if we shouldn't enforce setting
> MemTxAttrs attrs.secure =3D 0 in these calls.
>
> Is there a concept of "secure DMA controller" in QEMU?
>
> Thanks,
>
> Phil.
>

Hi,

Yes, we have models of secure DMA devices out of tree. Actually, on the
ZynqMP and Versal SoCs, there are secure registers that can configure any
DMA device to issue secure or non-secure transactions at runtime. We just
haven't modelled all of the control regs that allow that in upstream QEMU.

Cheers,
Edgar

--00000000000032673d05af76601a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 16 Sep 2020, 15:48 Philippe Mathieu-Daud=C3=A9=
, &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On 9/4/20 5:44 PM, Philippe Mathie=
u-Daud=C3=A9 wrote:<br>
&gt; Salvaging cleanups patches from the RFC series &quot;Forbid DMA write<=
br>
&gt; accesses to MMIO regions&quot; [*], propagating MemTxResult and<br>
&gt; adding documentation.<br>
&gt; <br>
&gt; Philippe Mathieu-Daud=C3=A9 (12):<br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_valid() take MemTxAttrs argument<br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_set() take MemTxAttrs argument<br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument<=
br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_rw() take MemTxAttrs argument<br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_read/write() take MemTxAttrs argument<=
br>
&gt;=C2=A0 =C2=A0dma: Let dma_memory_map() take MemTxAttrs argument<br>
<br>
Talking with Laszlo, he wonders if we shouldn&#39;t enforce setting<br>
MemTxAttrs attrs.secure =3D 0 in these calls.<br>
<br>
Is there a concept of &quot;secure DMA controller&quot; in QEMU?<br>
<br>
Thanks,<br>
<br>
Phil.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Hi,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, we h=
ave models of secure DMA devices out of tree. Actually, on the ZynqMP and V=
ersal SoCs, there are secure registers that can configure any DMA device to=
 issue secure or non-secure transactions at runtime. We just haven&#39;t mo=
delled all of the control regs that allow that in upstream QEMU.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto">Edg=
ar=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></bl=
ockquote></div></div></div>

--00000000000032673d05af76601a--

