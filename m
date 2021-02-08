Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E74313FAC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:57:11 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cek-00020v-TJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98Ie-0006Ks-TY; Mon, 08 Feb 2021 10:18:06 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98IZ-00009h-59; Mon, 08 Feb 2021 10:18:04 -0500
Received: by mail-ed1-x52e.google.com with SMTP id t5so18519839eds.12;
 Mon, 08 Feb 2021 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7voTdSrdIvUZbkDbt8ve6u7eVgmZyr3khG4QbJpEGo=;
 b=b0Iooh595bziyS8Ro2/egRtiB2gudwhJlpS2xDv6w6w3R9pzuPUVZmLRTUaGk40tn5
 fLQye+AaemQ5vKTgQg39etzvrq703HD06XeebtyMXhstqdp8NpdvhNifwkPpnyFchLUl
 Asbp+6yl9Me9YZyRjulDEcKU9ZuVh2ycv4AJh4PtQNgwyFxBByUCOJh2bMu9qk9fcFuh
 F93qoGufljkqEtV4ZO3feEqNIOHAAeUZs8scrfp+dV7pSsgTDNEogKCCV8DgCdbZL9pN
 xGsTwo3IewlYtXvgteCN84PgajjV1IQcKZuSXqbrL/UxdUJ0Apljc+98j52CUIH0Tki1
 0Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7voTdSrdIvUZbkDbt8ve6u7eVgmZyr3khG4QbJpEGo=;
 b=IaQLXwef8lvNAoDYRvVN0xI9UZO8tjDnfZnEdJTzgS0LrfigDruvitKFZLv+v+SeY6
 HB4cUM316sN6MWVVzfJzY1v4OUY0kDJJdg4dsZKbwO3y6TezEHoD1YAf5N/PaEx2XcYa
 YXHhf/fqIv00d05p+G4QJ4BN59NWkHEbxdW85Sx+V9oh8V2c/YsRTrITJBsxXgfV8GXT
 lPvG8GcSYDjMtP56CSRIlV+HgGLh2MM/XlTzH6t354x9FJYchbLVO8kKblEaFiuVlS0G
 BKUZNQCC5/GFnMPedn70U6MLnk2oLrNC8vk+VkDIJUf1tONDiDu5aArR4QyVa9IFWmFk
 Ou4g==
X-Gm-Message-State: AOAM533u2nUvwmWG2KXmXKuCpAj27Ub7vnJpRNRrdy+ESiPTtkFqaOc/
 6jKuWLOCTjBf/lMlWRWXrHJSyjQekwJbDA+c8Kk=
X-Google-Smtp-Source: ABdhPJyolJvMbDpW+HRkuiDlMCINh6c0QxqUbJ86aJn9gxU+dJE8maADfTCPdW5MWwQwPBnZn9WTtz0hXaNs4eQqq8E=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr17787819edt.130.1612797477438; 
 Mon, 08 Feb 2021 07:17:57 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
 <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
In-Reply-To: <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 8 Feb 2021 16:17:46 +0100
Message-ID: <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bcca0c05bad4ac01"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52e.google.com
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
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bcca0c05bad4ac01
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 3:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Edgar,
>
> On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> >
> >
> > On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
> >>
> >> Hi Edgar,
> >>
> >> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
> >> <edgar.iglesias@gmail.com> wrote:
> >> >
> >> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > >
> >> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> >> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> >> > > crash. This is observed when testing VxWorks 7.
> >> > >
> >> > > Add a basic implementation of QSPI DMA functionality.
> >> > >
> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> >
> >> > + Francisco
> >> >
> >> > Hi,
> >> >
> >> > Like Peter commented on the previous version, the DMA unit is actully
> separate.
> >>
> >> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
> >> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
> >> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
> >> different like a DMA engine in a ethernet controller.
> >
> >
> > Yes, it's a separate module.
> >
> >>
> >> > This module is better modelled by pushing data through the Stream
> framework
> >> > into the DMA. The DMA model is not upstream but can be found here:
> >> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> >> >
> >>
> >> What's the benefit of modeling it using the stream framework?
> >
> >
> >
> > Because it matches real hw and this particular dma exists in various
> instances, not only in qspi. We don't want duplicate implementations of the
> same dma.
> >
>
> Would you please share more details, like what other peripherals are
> using this same DMA model?
>
>
It's used by the Crypto blocks (SHA, AES) and by the bitstream programming
blocks on the ZynqMP.
In Versal there's the same plus some additional uses of this DMA...

Best regards,
Edgar

--000000000000bcca0c05bad4ac01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 3:45 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Edgar,<br=
>
<br>
On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.igl=
esias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 8 Feb 2021, 15:10 Bin Meng, &lt;<a href=3D"mailto:bmeng.cn@gma=
il.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Edgar,<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias<br>
&gt;&gt; &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">=
edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:<br>
&gt;&gt; &gt; &gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@wi=
ndriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; ZynqMP QSPI supports SPI transfer using DMA mode, but cu=
rrently this<br>
&gt;&gt; &gt; &gt; is unimplemented. When QSPI is programmed to use DMA mod=
e, QEMU will<br>
&gt;&gt; &gt; &gt; crash. This is observed when testing VxWorks 7.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Add a basic implementation of QSPI DMA functionality.<br=
>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou=
.cheng@windriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<=
br>
&gt;&gt; &gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@w=
indriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; + Francisco<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Like Peter commented on the previous version, the DMA unit is=
 actully separate.<br>
&gt;&gt;<br>
&gt;&gt; Is it really separate? In the Xilinx ZynqMP datasheet, it&#39;s an=
<br>
&gt;&gt; integrated DMA unit dedicated for QSPI usage. IIUC, other modules =
on<br>
&gt;&gt; the ZynqMP SoC cannot use it to do any DMA transfer. To me this is=
 no<br>
&gt;&gt; different like a DMA engine in a ethernet controller.<br>
&gt;<br>
&gt;<br>
&gt; Yes, it&#39;s a separate module.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; This module is better modelled by pushing data through the St=
ream framework<br>
&gt;&gt; &gt; into the DMA. The DMA model is not upstream but can be found =
here:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/Xilinx/qemu/blob/master/hw/dma/=
csu_stream_dma.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/X=
ilinx/qemu/blob/master/hw/dma/csu_stream_dma.c</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; What&#39;s the benefit of modeling it using the stream framework?<=
br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Because it matches real hw and this particular dma exists in various i=
nstances, not only in qspi. We don&#39;t want duplicate implementations of =
the same dma.<br>
&gt;<br>
<br>
Would you please share more details, like what other peripherals are<br>
using this same DMA model?<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">It&#39;s used by the Crypto blocks (SHA, AES) and by the bitstr=
eam programming blocks on the ZynqMP.</div><div class=3D"gmail_quote">In Ve=
rsal there&#39;s the same plus some additional uses of this DMA...</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Best regards,<=
/div><div class=3D"gmail_quote">Edgar<br></div><div class=3D"gmail_quote"><=
br></div></div>

--000000000000bcca0c05bad4ac01--

