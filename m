Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C429943D961
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:36:03 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvGs-0007V1-Sv
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvEF-0005X4-T7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:33:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mfvEE-0001R9-8K
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:33:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id r12so18553795edt.6
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O6EgeptOK9blD1kC9NmMO5NTpfc3PRvJejqgBU3+uII=;
 b=h8m3aQkhBlQNqfdRFZ3v8K0x+surPB9eCj1xt2ARna+lzajOoqM/sgbQWfGxCQcYhA
 9kMDyDXBb+wkcsO+t+Z4eQmP4n7snGSy1uGsZ66kFCgRvtjL/j0YgyxOW5+BJEquCfeE
 SXnFLWzu2mxebgT7zJGGgkc30ckz9G1QfjIFDTWjdrbecRGXSuHbObKBcAI+xNLApF2K
 hqPm4mUFEk2khWKbanddlEtS5lqKAbxawXL5Y2nEJPG5Zl3qGw9dzYyMzMNPcI2/6vQJ
 m2R55Dr8M9H5RiAUJbOl06ZigDva9esoCpKuoM7ehLbBG0lSaDWF4GyKveBeg8LH3A4G
 BmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O6EgeptOK9blD1kC9NmMO5NTpfc3PRvJejqgBU3+uII=;
 b=4mtQNQR42z4AL/xSNvU9JbaZVqK2cY8+YyfvtcYcysJl/aeGQzl3yP4aEt5eHvErMr
 b5ZYy4vkUx8ng/hTIg1e3UOTtCSKUEs44fqQMZyPaS7ACGiq3OZLLPebrRgNDCNemGzZ
 tOW4meFGTkmn3i+xUDQoKx5jIuFXvuSUlpacNiHeHxuWA0fPTmXtC2Nu19ygy1LH+tCA
 IJAr3uySchXMvdjewjEmGAlb00tsn4+O4lgUC6Xd8EzWQxFiBNj3ppxrS7tMH8Lq6WA5
 Lk0hHXvzWMtaA4HBLUqs3zKPxQoZFNXf+O308J2MoC7BM03ykZU/SK7JbrMyfT7cdhxb
 bM5w==
X-Gm-Message-State: AOAM532XKTpO6hZ8pnsilCEINx99/enTP84EErsmG4rtEytLeaWv4iu1
 0macNsWjiBOe+B1kQeU3eVcTngTRcUdn4CuxzZDbGA==
X-Google-Smtp-Source: ABdhPJz2pM14flh5HUMd5GvtNRUhb7lbJ7e7n0QnRoZ5tJNSmo/SfEv6QOloOTxFWjHyz/hLwQBp2wR+vFDcCYRmE6Y=
X-Received: by 2002:a05:6402:278a:: with SMTP id
 b10mr2277818ede.134.1635388396943; 
 Wed, 27 Oct 2021 19:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <20211025124319.195290-2-rpathak@ventanamicro.com>
 <CAKmqyKORccGLiwCtFu=-M88bDXbKJiYPFh38tccB5=hBDdrCPg@mail.gmail.com>
In-Reply-To: <CAKmqyKORccGLiwCtFu=-M88bDXbKJiYPFh38tccB5=hBDdrCPg@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 28 Oct 2021 08:02:41 +0530
Message-ID: <CA+Oz1=Ywe6itetu+4CRiyTQtd4y4VxHH2X-sZNBGHfU9gX8ErA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv: Add priv spec 1.12.0 version check
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000078524905cf608825"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ed1-x535.google.com
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078524905cf608825
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 8:08 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak <rpathak@ventanamicro.com>
> wrote:
> >
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 4 +++-
> >  target/riscv/cpu.h | 1 +
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 788fa0b11c..83c3814a5a 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -405,7 +405,9 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >      }
> >
> >      if (cpu->cfg.priv_spec) {
> > -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> > +        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> > +            priv_version = PRIV_VERSION_1_12_0;
> > +        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
>
> This change, actually allowing the user to enable the spec, should be
> in a separate patch at the end of the series.
>
> The idea is to add the feature, then expose it.
>

Sure, will change in the next version

>
> Alistair
>
>
> >              priv_version = PRIV_VERSION_1_11_0;
> >          } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> >              priv_version = PRIV_VERSION_1_10_0;
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index a33dc30be8..67c52e6f9e 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -79,6 +79,7 @@ enum {
> >
> >  #define PRIV_VERSION_1_10_0 0x00011000
> >  #define PRIV_VERSION_1_11_0 0x00011100
> > +#define PRIV_VERSION_1_12_0 0x00011200
> >
> >  #define VEXT_VERSION_0_07_1 0x00000701
> >
> > --
> > 2.25.1
> >
> >
>

--00000000000078524905cf608825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021 at 8:08 AM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak &lt;<a href=3D"mailto:rpath=
ak@ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Signed-off-by: Rahul Pathak &lt;<a href=3D"mailto:rpathak@ventanamicro=
.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 4 +++-<br>
&gt;=C2=A0 target/riscv/cpu.h | 1 +<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 788fa0b11c..83c3814a5a 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -405,7 +405,9 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.priv_spec) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_strcmp0(cpu-&gt;cfg.priv_spec, &qu=
ot;v1.11.0&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!g_strcmp0(cpu-&gt;cfg.priv_spec, &qu=
ot;v1.12.0&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_VERSI=
ON_1_12_0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!g_strcmp0(cpu-&gt;cfg.priv_sp=
ec, &quot;v1.11.0&quot;)) {<br>
<br>
This change, actually allowing the user to enable the spec, should be<br>
in a separate patch at the end of the series.<br>
<br>
The idea is to add the feature, then expose it.<br></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif">S=
ure, will change in the next version</div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif"></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Alistair<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_=
VERSION_1_11_0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (!g_strcmp0(cpu-&gt;cfg.pr=
iv_spec, &quot;v1.10.0&quot;)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 priv_version =3D PRIV_=
VERSION_1_10_0;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index a33dc30be8..67c52e6f9e 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -79,6 +79,7 @@ enum {<br>
&gt;<br>
&gt;=C2=A0 #define PRIV_VERSION_1_10_0 0x00011000<br>
&gt;=C2=A0 #define PRIV_VERSION_1_11_0 0x00011100<br>
&gt; +#define PRIV_VERSION_1_12_0 0x00011200<br>
&gt;<br>
&gt;=C2=A0 #define VEXT_VERSION_0_07_1 0x00000701<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000078524905cf608825--

