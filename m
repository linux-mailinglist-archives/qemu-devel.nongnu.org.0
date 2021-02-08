Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB033140EE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:51:36 +0100 (CET)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DVP-00016r-M8
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l97cd-0003RM-Pg; Mon, 08 Feb 2021 09:34:46 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l97cV-0002VH-2U; Mon, 08 Feb 2021 09:34:39 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t5so18295366eds.12;
 Mon, 08 Feb 2021 06:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ml0YDQs56tKj5scJg+obSM9rxRigcfMgWYL0EMd/6L8=;
 b=s71P9FvWdXO6bwowgAbJCg7+OOycmxOL6n5cdZT51yJ9b4qZaeLN9jp1e4/GOa83Vn
 LkRHwRIzc+NuRLvyGmBcY3/atFUdNAdo/45KUi8CoE2//ia1a7AbFeRnUAwA3v+OaGyG
 LnI2cbFxteehoNp+foVjg4PgFM2jLGk024usVSBSHcgBUT0f9k/OhRK5fKT22xyXfbdj
 XaxJbPBF1Fqn80dUjgeUE8c8+zEzRYyA/0GSrj1FGIIKn3df8S96V67ypEl0GjxB2zdm
 sv30RPav9LkR9jUdaZgESYq6eHX3Udj+olqGjo7pE/kRH4BvkxlP/HsgCZXbTeWWEhj9
 g/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ml0YDQs56tKj5scJg+obSM9rxRigcfMgWYL0EMd/6L8=;
 b=mv6yqpmdNrmLgxu93C2xT5dpPxPIQBP7axOfkCWziP3mxJkHHAR1SziEwkwJ34yQGZ
 DHfKg/0PH4qgP5+IgZdW3cKJQkqRThIpLPjU3FFawwK8gxbjtXejjQeQN0fxJVBR9LPD
 tuW/d6Rtnc6OemgmAeqzf1/jLSTgf2pRZ+cPnp5oWvNudZGUAYQmoPB4A2bXuDVpELBF
 IP/S0VOU825+vD5Aywqk3eLs8LXmm03oRY8o+iSz4eSlfl/6oVqgERKGH//ANlZOZQU9
 lpN9iumutnVwsRlHHG787dDKwV9jjHUmuIFEUzxJOlwth9dUYOGt1mFNYvTUvThP6pmN
 6weA==
X-Gm-Message-State: AOAM5331OYFYS0OS6tHvZIoiJx4cNuQwohoYVS3AsGdrRSJSFfpjo/mK
 zWDlZUvEIwuAhfeefP0LuUyEqkgLWQKiOmSxNO8=
X-Google-Smtp-Source: ABdhPJyz4j5ePOKbcNSQhrDPmrgsxo95wmd/cJeJaPGQzn6FMctJjHKr3NaCFSoly55ZrzIYR5y7jy2zwPvcXFQ6aYU=
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr17349328edk.377.1612794864223; 
 Mon, 08 Feb 2021 06:34:24 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
In-Reply-To: <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 8 Feb 2021 15:34:13 +0100
Message-ID: <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fa48b605bad41087"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52c.google.com
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
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fa48b605bad41087
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:

> Hi Edgar,
>
> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >
> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > > crash. This is observed when testing VxWorks 7.
> > >
> > > Add a basic implementation of QSPI DMA functionality.
> > >
> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > + Francisco
> >
> > Hi,
> >
> > Like Peter commented on the previous version, the DMA unit is actully
> separate.
>
> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
> different like a DMA engine in a ethernet controller.
>

Yes, it's a separate module.


> > This module is better modelled by pushing data through the Stream
> framework
> > into the DMA. The DMA model is not upstream but can be found here:
> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> >
>
> What's the benefit of modeling it using the stream framework?
>


Because it matches real hw and this particular dma exists in various
instances, not only in qspi. We don't want duplicate implementations of the
same dma.

Cheers,
Edgar


> > Feel free to send a patch to upstream with that model (perhaps changing
> > the filename to something more suitable, e.g xlnx-csu-stream-dma.c).
> > You can use --author="Edgar E. Iglesias <edgar.iglesias@xilinx.com>".
> >
>
> Please, upstream all work Xilinx has done on QEMU. If you think the
> DMA support should really be using the Xilinx one, please do the
> upstream work as we are not familiar with that implementation.
>
> Currently we are having a hard time testing the upstream QEMU Xilinx
> QSPI model with either U-Boot or Linux. We cannot boot anything with
> upstream QEMU with the Xilinx ZynqMP model with the limited
> information from the internet. Instructions are needed. I also
> suggested to Francisco in another thread that the QEMU target guide
> for ZynqMP should be added to provide such information.
>
> > The DMA should be mapped to 0xFF0F0800 and IRQ 15.
> >
> > CC:d Francisco, he's going to publish some smoke-tests for this.
> >
>
> Regards,
> Bin
>

--000000000000fa48b605bad41087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 8 Feb 2021, 15:10 Bin Meng, &lt;<a href=3D"mai=
lto:bmeng.cn@gmail.com" target=3D"_blank" rel=3D"noreferrer">bmeng.cn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Edgar,<br>
<br>
On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" rel=3D"noreferrer noreferre=
r" target=3D"_blank">edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:<br>
&gt; &gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.c=
om" rel=3D"noreferrer noreferrer" target=3D"_blank">xuzhou.cheng@windriver.=
com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ZynqMP QSPI supports SPI transfer using DMA mode, but currently t=
his<br>
&gt; &gt; is unimplemented. When QSPI is programmed to use DMA mode, QEMU w=
ill<br>
&gt; &gt; crash. This is observed when testing VxWorks 7.<br>
&gt; &gt;<br>
&gt; &gt; Add a basic implementation of QSPI DMA functionality.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@wi=
ndriver.com" rel=3D"noreferrer noreferrer" target=3D"_blank">xuzhou.cheng@w=
indriver.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.=
com" rel=3D"noreferrer noreferrer" target=3D"_blank">bin.meng@windriver.com=
</a>&gt;<br>
&gt;<br>
&gt; + Francisco<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Like Peter commented on the previous version, the DMA unit is actully =
separate.<br>
<br>
Is it really separate? In the Xilinx ZynqMP datasheet, it&#39;s an<br>
integrated DMA unit dedicated for QSPI usage. IIUC, other modules on<br>
the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no<br>
different like a DMA engine in a ethernet controller.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, it&#39;s a separa=
te module.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; This module is better modelled by pushing data through the Stream fram=
ework<br>
&gt; into the DMA. The DMA model is not upstream but can be found here:<br>
&gt; <a href=3D"https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_strea=
m_dma.c" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:/=
/github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c</a><br>
&gt;<br>
<br>
What&#39;s the benefit of modeling it using the stream framework?<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Because it matches real hw and this particular dma exists=
 in various instances, not only in qspi. We don&#39;t want duplicate implem=
entations of the same dma.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,=C2=A0</div><div dir=3D"auto">Edgar</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
&gt; Feel free to send a patch to upstream with that model (perhaps changin=
g<br>
&gt; the filename to something more suitable, e.g xlnx-csu-stream-dma.c).<b=
r>
&gt; You can use --author=3D&quot;Edgar E. Iglesias &lt;<a href=3D"mailto:e=
dgar.iglesias@xilinx.com" rel=3D"noreferrer noreferrer" target=3D"_blank">e=
dgar.iglesias@xilinx.com</a>&gt;&quot;.<br>
&gt;<br>
<br>
Please, upstream all work Xilinx has done on QEMU. If you think the<br>
DMA support should really be using the Xilinx one, please do the<br>
upstream work as we are not familiar with that implementation.<br>
<br>
Currently we are having a hard time testing the upstream QEMU Xilinx<br>
QSPI model with either U-Boot or Linux. We cannot boot anything with<br>
upstream QEMU with the Xilinx ZynqMP model with the limited<br>
information from the internet. Instructions are needed. I also<br>
suggested to Francisco in another thread that the QEMU target guide<br>
for ZynqMP should be added to provide such information.<br>
<br>
&gt; The DMA should be mapped to 0xFF0F0800 and IRQ 15.<br>
&gt;<br>
&gt; CC:d Francisco, he&#39;s going to publish some smoke-tests for this.<b=
r>
&gt;<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div></div>

--000000000000fa48b605bad41087--

