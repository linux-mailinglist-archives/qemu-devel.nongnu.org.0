Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E83C85E6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:16:49 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fgu-00063Q-LJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1m3faq-0003xG-St
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:10:35 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1m3fan-0007Fv-Em
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:10:32 -0400
Received: by mail-io1-xd30.google.com with SMTP id z11so2290075iow.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tn+tD8MabUZu/dqKrPF3tR4Lh5o8PjL4ZFu3x4Dva5U=;
 b=mZ00ax/AkCXP0Mdq4nB/x2QFmrKwqQ7Yvx/k/gAWj8NnzkwNFkRGLVyAEHAQxdNuWf
 CunJC02EBU6GF0qzP7Ga9JiC8qYWh5trpv8Yv1qdpcUwue+2KAGuCrq+wop5Al/xxGfg
 L1espi8QVkgoB9udyrK5A4F3kKC9qkLkHHBKZKxcaTm/KfJdhxPtM/vs2CfTqdZ5z6mT
 81xj1X2ncOQtpG+2oc/3OSJHYyl+LQ4M0C5g6FaCjlLN4c7GPj4V6AQr3Cs452sHGIgw
 Pw9AKE4Vb6eSTfRbSeq08Ss/PZ4PZ9bro1XC4+5JC9FzV9nL6DoPyjRiyw7i2LxIora7
 hwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tn+tD8MabUZu/dqKrPF3tR4Lh5o8PjL4ZFu3x4Dva5U=;
 b=e1TpY+wfOeZN1z1/Nq09W4HxZNb6ZtYkxbmOqqK25gpiKhApYT9NawOQMhh3IHmReX
 FM+Bo/E9jVytyaqEHdZIkLCTEP7zIrJLjwiMOUtSh1/E1sgiEgdX4HZRAafsmrk/ZlKa
 rfHVHEipchyenpq9kwtd5zpm1vTUYVsSzbD7WS/z0lvaW4NFngfwMKtg6Fyj89SO4P84
 n20meQ00QTilMwntDtVbipwQT6mH5dWR206uj79zGuNU3XSfZtEKXZoeGVW1GvKz8xoi
 WPLSSX9XihGvExhR5hKlomcKV289v4FI9bVbHvlfIQB+QSOmNbAr70o6aIL5Su0w/T5N
 4KhQ==
X-Gm-Message-State: AOAM533/1DjH9zp6nguyfp3TRvOAuT6BS1dxoEhNjEG8qQTUtb2vDtLO
 jEbFRkdh5IMuFOJ1o5wWuQ1EJHW3Oe1lWvv7N1I=
X-Google-Smtp-Source: ABdhPJw0ZP6tVnkSY4usp69ST1eruiViNrhwVcz4Fw8lY521lL5jd0WbwznliA1dqkesk3VlVbyjQTttGu17lfQz5gc=
X-Received: by 2002:a02:93a3:: with SMTP id z32mr9164760jah.33.1626271823359; 
 Wed, 14 Jul 2021 07:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714100628.10460-1-alex.bennee@linaro.org>
 <CAMVc7JWdA56X4ggKhZ7AdM0i5+0Xp4pbdvynswgJv+-anhDk5Q@mail.gmail.com>
In-Reply-To: <CAMVc7JWdA56X4ggKhZ7AdM0i5+0Xp4pbdvynswgJv+-anhDk5Q@mail.gmail.com>
From: Chetan <chetan4windows@gmail.com>
Date: Wed, 14 Jul 2021 19:40:11 +0530
Message-ID: <CAPPKfOF6bssuvTM_nKDjx5sXt2_Q4uEUfhGjz2=eBG748j4QQg@mail.gmail.com>
Subject: Re: [PATCH v1 21/21] contrib/gitdm: add more individual contributor
 entries.
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000056f31a05c715eaf4"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=chetan4windows@gmail.com; helo=mail-io1-xd30.google.com
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
Cc: Li Qiang <liq3ea@163.com>, Li Qiang <liq3ea@gmail.com>,
 qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000056f31a05c715eaf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm also an individual contributor. <chetan4windows@gmail.com>

Regards,
cp

On Wed, Jul 14, 2021 at 5:05 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> I am Akihiko Odaki <akihiko.odaki@gmail.com> and an individual developer.
>
> Regards,
> Akihiko Odaki
>
> On Wed, Jul 14, 2021 at 7:06 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> > Again this is guess work based on public websites.
> >
> >  - Chetan lists himself as a freelancer on twitter.
> >  - Akihiko lists themselves as an individual developer on GitHub
> >  - Jiaxun's website looks like a personal one
> >
> > [AJB: Won't merge without confirmation from appropriate people.]
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
> > Cc: Li Qiang <liq3ea@gmail.com>
> > Cc: Li Qiang <liq3ea@163.com>
> > Cc: Chetan Pant <chetan4windows@gmail.com>
> > Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
> > Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  contrib/gitdm/group-map-individuals | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/contrib/gitdm/group-map-individuals
> b/contrib/gitdm/group-map-individuals
> > index 36bbb77c39..853fb98bc3 100644
> > --- a/contrib/gitdm/group-map-individuals
> > +++ b/contrib/gitdm/group-map-individuals
> > @@ -29,3 +29,9 @@ mrolnik@gmail.com
> >  huth@tuxfamily.org
> >  jhogan@kernel.org
> >  atar4qemu@gmail.com
> > +dirty.ice.hu@gmail.com
> > +liq3ea@163.com
> > +liq3ea@gmail.com
> > +chetan4windows@gmail.com
> > +akihiko.odaki@gmail.com
> > +jiaxun.yang@flygoat.com
> > --
> > 2.20.1
> >
>

--00000000000056f31a05c715eaf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I&#39;m also an indiv=
idual contributor.=20
&lt;<a href=3D"mailto:chetan4windows@gmail.com" target=3D"_blank">chetan4wi=
ndows@gmail.com</a>&gt;</div><div><br></div><div>Regards,</div><div>cp<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Jul 14, 2021 at 5:05 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com">akihiko.odaki@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">I am Akihiko Odaki &lt;<a hre=
f=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.=
com</a>&gt; and an individual developer.<br>
<br>
Regards,<br>
Akihiko Odaki<br>
<br>
On Wed, Jul 14, 2021 at 7:06 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex=
.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Again this is guess work based on public websites.<br>
&gt;<br>
&gt;=C2=A0 - Chetan lists himself as a freelancer on twitter.<br>
&gt;=C2=A0 - Akihiko lists themselves as an individual developer on GitHub<=
br>
&gt;=C2=A0 - Jiaxun&#39;s website looks like a personal one<br>
&gt;<br>
&gt; [AJB: Won&#39;t merge without confirmation from appropriate people.]<b=
r>
&gt;<br>
&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@lina=
ro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; Cc: &quot;K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n&quot; &lt;<a href=3D"mail=
to:dirty.ice.hu@gmail.com" target=3D"_blank">dirty.ice.hu@gmail.com</a>&gt;=
<br>
&gt; Cc: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=3D"_blank"=
>liq3ea@gmail.com</a>&gt;<br>
&gt; Cc: Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=3D"_blank">l=
iq3ea@163.com</a>&gt;<br>
&gt; Cc: Chetan Pant &lt;<a href=3D"mailto:chetan4windows@gmail.com" target=
=3D"_blank">chetan4windows@gmail.com</a>&gt;<br>
&gt; Cc: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targe=
t=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
&gt; Cc: Jiaxun Yang &lt;<a href=3D"mailto:jiaxun.yang@flygoat.com" target=
=3D"_blank">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 contrib/gitdm/group-map-individuals | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group=
-map-individuals<br>
&gt; index 36bbb77c39..853fb98bc3 100644<br>
&gt; --- a/contrib/gitdm/group-map-individuals<br>
&gt; +++ b/contrib/gitdm/group-map-individuals<br>
&gt; @@ -29,3 +29,9 @@ <a href=3D"mailto:mrolnik@gmail.com" target=3D"_blan=
k">mrolnik@gmail.com</a><br>
&gt;=C2=A0 <a href=3D"mailto:huth@tuxfamily.org" target=3D"_blank">huth@tux=
family.org</a><br>
&gt;=C2=A0 <a href=3D"mailto:jhogan@kernel.org" target=3D"_blank">jhogan@ke=
rnel.org</a><br>
&gt;=C2=A0 <a href=3D"mailto:atar4qemu@gmail.com" target=3D"_blank">atar4qe=
mu@gmail.com</a><br>
&gt; +<a href=3D"mailto:dirty.ice.hu@gmail.com" target=3D"_blank">dirty.ice=
.hu@gmail.com</a><br>
&gt; +<a href=3D"mailto:liq3ea@163.com" target=3D"_blank">liq3ea@163.com</a=
><br>
&gt; +<a href=3D"mailto:liq3ea@gmail.com" target=3D"_blank">liq3ea@gmail.co=
m</a><br>
&gt; +<a href=3D"mailto:chetan4windows@gmail.com" target=3D"_blank">chetan4=
windows@gmail.com</a><br>
&gt; +<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.=
odaki@gmail.com</a><br>
&gt; +<a href=3D"mailto:jiaxun.yang@flygoat.com" target=3D"_blank">jiaxun.y=
ang@flygoat.com</a><br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
</blockquote></div>

--00000000000056f31a05c715eaf4--

