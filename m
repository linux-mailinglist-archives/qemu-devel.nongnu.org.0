Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E7407D5D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:47:35 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOtS-00052y-Od
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOp7-0002f3-DB
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:43:06 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPOp2-0004QX-R2
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:43:03 -0400
Received: by mail-il1-x135.google.com with SMTP id v16so2364247ilg.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgfF2R2nxcEZ9qiZD3NE5EnKkKTI5m74b88nFb1EnOo=;
 b=GfCVWrki3C5ijhKEYKRziMBMHKjEEUGCC5fdAwhfjEhrgxsLTmKIifAPWBH9rsziZF
 NKaVmUkns4X50m7Duwfc8Fu+aX5fAZ32Y2u7mun+Bv0XHv+sQkvMUboeSOtYmKiYzwz6
 nsaoQODrZEGKV7Jc5DzEu1tXKQQK4wCwlsSYIEkJSxLMq8bAFhFA28uYbPipca16xgpi
 ZlaZVjVa9z+9vhWYHfDhnD+iqaZsydyO/ghfBWODFcvWTfXa5RetIrIYfWp6A96n0zWP
 kgfp1o7pgeJhYyaG3+RCvqDa+bGWORWhhosWjYFyWmml6QqBvaioO7Jjc7l/KApVWAdr
 RVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgfF2R2nxcEZ9qiZD3NE5EnKkKTI5m74b88nFb1EnOo=;
 b=y+VQJuGoxit1I67kEHnLxqhYxLksjk/zWPJksSoOISktNsTv6UxbSfVgs/eZIsQgzy
 4Bpx4wG1YJo+HyAa8sKjDTf3AWOfAX/ZCOMECb1XpO9H7bk8H2q5PQIqF36pOyXJfm0+
 erWU9JibURVKhUY8zW2dM1mMh0AAGatnbBgp7We+HeAGb8MzKuNHDrUyeMeI2rSNxS/9
 xnM8XaS11uGBtcKY5kO3G04P9R79mcKeX6PcQjbaWBFx7CMzAJ4llNny17MJnGk1s9WU
 7NkwEIvf6Ie2b190FKYQDw+nyfJJt2K6eKX6OipmYMUtVJXOhulcVZBsoB+BWAxDAUw/
 N4Bw==
X-Gm-Message-State: AOAM5328XiTNdS0UqQfhYy6DD2hyaao8sumqlGCwj7Zx6+LjOmIbsOGx
 bFfhqgoQtvakH9y53QcDdmoupt7d+wqZhtrkTGq49g==
X-Google-Smtp-Source: ABdhPJylEus5/fpmLorDK9lTNK3Hdokha06nESCxSy5SerL18Z88fDPOILTEECm1ZJfJQ+TXV6bstJ85vTvu/UzIr3Q=
X-Received: by 2002:a92:c7d4:: with SMTP id g20mr4541028ilk.244.1631450577895; 
 Sun, 12 Sep 2021 05:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-2-frank.chang@sifive.com>
 <CAEUhbmUgceFXLF21L1U+bo0Rz-5Cwiig=Bmh0feo0ZVwXExeQg@mail.gmail.com>
 <CAEUhbmWzYnhM5Mc__SfmaNeimKuts93Mmq6481K3h-5jUsBLzA@mail.gmail.com>
In-Reply-To: <CAEUhbmWzYnhM5Mc__SfmaNeimKuts93Mmq6481K3h-5jUsBLzA@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 12 Sep 2021 20:42:46 +0800
Message-ID: <CAE_xrPj3x9m83gfDba1m05s_XVzJ7WNe7enwAG7rhN-w82pODg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002a2a0605cbcbb018"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=frank.chang@sifive.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Hsu <max.hsu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a2a0605cbcbb018
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 11, 2021 at 9:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Sat, Sep 11, 2021 at 8:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Sep 10, 2021 at 1:56 PM <frank.chang@sifive.com> wrote:
> > >
> > > From: Frank Chang <frank.chang@sifive.com>
> > >
> > > Setting Control.claim clears all of the chanel's Next registers.
> > > This is effective only when Control.claim is set from 0 to 1.
> > >
> > > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > > Tested-by: Max Hsu <max.hsu@sifive.com>
> > > ---
> > >  hw/dma/sifive_pdma.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> > > index 9b2ac2017d9..e723db9d700 100644
> > > --- a/hw/dma/sifive_pdma.c
> > > +++ b/hw/dma/sifive_pdma.c
> > > @@ -54,6 +54,9 @@
> > >  #define DMA_EXEC_DST        0x110
> > >  #define DMA_EXEC_SRC        0x118
> > >
> > > +#define CONFIG_WRSZ_DEFAULT 6
> > > +#define CONFIG_RDSZ_DEFAULT 6
> >
> > The FU540 manual says the next config reset value is 0, not 6.
> >
>
> From patch#2 's log on Unmatched, I see where the number 6 is coming.
> I also validated on Unleashed and observed the same. So there is a
> documentation error.
>
> Please add a comment to explain that.
>

Thanks for the review.
Will update it.

Regards,
Frank Chang


>
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>

--0000000000002a2a0605cbcbb018
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Sep 11, 2021 at 9:12 PM Bin Meng =
&lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Sat, Sep 11, 2021 at 8:37 PM Bin Meng &lt;<a href=3D"mailto:=
bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, Sep 10, 2021 at 1:56 PM &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" t=
arget=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Setting Control.claim clears all of the chanel&#39;s Next registe=
rs.<br>
&gt; &gt; This is effective only when Control.claim is set from 0 to 1.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifi=
ve.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; &gt; Tested-by: Max Hsu &lt;<a href=3D"mailto:max.hsu@sifive.com" targ=
et=3D"_blank">max.hsu@sifive.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/dma/sifive_pdma.c | 15 +++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 15 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c<br>
&gt; &gt; index 9b2ac2017d9..e723db9d700 100644<br>
&gt; &gt; --- a/hw/dma/sifive_pdma.c<br>
&gt; &gt; +++ b/hw/dma/sifive_pdma.c<br>
&gt; &gt; @@ -54,6 +54,9 @@<br>
&gt; &gt;=C2=A0 #define DMA_EXEC_DST=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x110<br>
&gt; &gt;=C2=A0 #define DMA_EXEC_SRC=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x118<br>
&gt; &gt;<br>
&gt; &gt; +#define CONFIG_WRSZ_DEFAULT 6<br>
&gt; &gt; +#define CONFIG_RDSZ_DEFAULT 6<br>
&gt;<br>
&gt; The FU540 manual says the next config reset value is 0, not 6.<br>
&gt;<br>
<br>
From patch#2 &#39;s log on Unmatched, I see where the number 6 is coming.<b=
r>
I also validated on Unleashed and observed the same. So there is a<br>
documentation error.<br>
<br>
Please add a comment to explain that.<br></blockquote><div><br></div><div>T=
hanks for the review.</div><div>Will update it.</div><div><br></div><div>Re=
gards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Otherwise,<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
</blockquote></div></div>

--0000000000002a2a0605cbcbb018--

