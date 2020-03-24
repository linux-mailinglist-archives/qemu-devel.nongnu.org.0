Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD6191797
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:28:37 +0100 (CET)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGnLw-0006bA-48
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jGnKJ-0005GM-Vx
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:26:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jGnKI-0001SE-NE
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:26:55 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35595)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jGnKI-0001Rm-GF
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:26:54 -0400
Received: by mail-wm1-x343.google.com with SMTP id m3so4478618wmi.0
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 10:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wgku7mgkwd4sWjtrh+2QA8zgsUalxMb0JO3B4/P//Dg=;
 b=aj23k3oqlxGW/sF2C605/Rt4n6/jzqSu9HFuWFS90qa9tViPZUbKmebkMC4sOX4roB
 Zc66AAmnuWGS3bxdd/cncGQKJGNIJuoF9ic4l61raBeZTQtUUM1bluWSb/s2WG8Ocpg6
 dRuCRnibg8JbbSTU2msx6E443SLzM9u4ehzl1CLI6q3/34zShD0FACn6Zlr/6n+7+TVs
 zjcowssQ90LaYKbtZPsrp+tMDDRNuduWIT6uu+R3+3e4bSzsjbc2cplVDWjX8zKA7j7Q
 naEvz6VYpXvmyvSluPdfBEaxCAivUioC7QZcu+D9STRkXtOiO6Xn9jGA18YJVxD6kmEd
 fNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wgku7mgkwd4sWjtrh+2QA8zgsUalxMb0JO3B4/P//Dg=;
 b=iziqL7OpAsJHECkMButZAmLb0lUisaGy2t563DZ4aeuxLDHvdJYzsHPXkrRmlAYHsK
 7ajkAa7QXgayGt+veXkA+qgQ4dscph0r9/9XpqQ69PoAOm783LrZd1B1JUJ8rCDjjfkV
 wYcAwYe8tu8JhRciQAnKuFl7YTQ6b2KJShmjJ1b+nRYg+zrGQUHeANbwdz6RgE5A7Xe4
 ozydprJduDLvBEhv8AMj1q79j8ypKhx8lzploTBu83YItA2Z9WrrOUVT6YEW0bjzJziH
 EQKvuDYBn6KFYp4gF62q3ZApJ4vC6bcO09Y6kcsewEYwqqRrdKt6psUGx5Qj+LVGBq+X
 aKxQ==
X-Gm-Message-State: ANhLgQ1YO3bL2WmbNz4Wed7eCACeFMdjFLW8Dinjt8rNXftnQerpnoxt
 tQn72sohZ3nb/v0ftcTjBF+toqzum2RQWopo8eo=
X-Google-Smtp-Source: ADFU+vvGxNP4I73USrXhGXSAcHGxMJnDmUHwMrJ7cPNPwTYT7kggI1uNaqaO6pHz8IorAEz/vhDx5ejsOG/7e0evmTs=
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr6585945wmh.159.1585070813237; 
 Tue, 24 Mar 2020 10:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200324122212.11156-1-jiaxun.yang@flygoat.com>
 <CAHiYmc7MN8pUg7FJ=wcn1h0pr2A05nv4SQaOZmL47NCnNzUJRA@mail.gmail.com>
 <623EF6C4-18D0-4A9C-B758-A3BE0B0AAF25@flygoat.com>
In-Reply-To: <623EF6C4-18D0-4A9C-B758-A3BE0B0AAF25@flygoat.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Tue, 24 Mar 2020 19:26:38 +0200
Message-ID: <CAHiYmc64tjG7cpB0HF=dAAPXOovtR9CnoLLO2-pF8fBa2R_T=w@mail.gmail.com>
Subject: Re: [PATCH for-5.0,
 v1] target/mips: Fix loongson multimedia condition instructions
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: multipart/alternative; boundary="000000000000c4578b05a19d0ec0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Huacai Chen <chenhc@lemote.com>, aleksandar.rikalo@rt-rk.com,
 richard.henderson@linaro.org, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c4578b05a19d0ec0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

19:09 Uto, 24.03.2020. Jiaxun Yang <jiaxun.yang@flygoat.com> =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
>
>
> =E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
12:56:41, Aleksandar Markovic <
aleksandar.qemu.devel@gmail.com> =E5=86=99=E5=88=B0:
> >14:23 Uto, 24.03.2020. Jiaxun Yang <jiaxun.yang@flygoat.com> =D1=98=D0=
=B5
> >=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >>
> >> Loongson multimedia condition instructions were previously
> >implemented as
> >> write 0 to rd due to lack of documentation. So I just confirmed with
> >Loongson
> >> about their encoding and implemented them correctly.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> Acked-by: Huacai Chen <chenhc@lemote.com>
> >> ---
> >> v1: Use deposit opreations according to Richard's suggestion.
> >> ---
> >
> >Thanks, Jiaxun!
> >
> >But, your numeration of patches is wrong. The first version of the
> >patch
> >should be sent with prefix [PATCH]
> >and the second (this) version of the patch with prefix [PATCH v2]. This
> >is
> >the second time you make the same mistake. Please make sure that you
> >have
> >the correct numeration in future. But, anyhow, thanks for this version.
>
> Sorry for that.
> I'm doing like this for years.
> I promise it won't happen in future.
>

Cool, thanks again!

> Thanks.
>
> >
> >Yours,
> >Aleksandar
> >
> --
> Jiaxun Yang

--000000000000c4578b05a19d0ec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">19:09 Uto, 24.03.2020. Jiaxun Yang &lt;<a href=3D"mailto:jia=
xun.yang@flygoat.com">jiaxun.yang@flygoat.com</a>&gt; =D1=98=D0=B5 =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8812:56:41, Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar.qemu.deve=
l@gmail.com">aleksandar.qemu.devel@gmail.com</a>&gt; =E5=86=99=E5=88=B0:<br=
>
&gt; &gt;14:23 Uto, 24.03.2020. Jiaxun Yang &lt;<a href=3D"mailto:jiaxun.ya=
ng@flygoat.com">jiaxun.yang@flygoat.com</a>&gt; =D1=98=D0=B5<br>
&gt; &gt;=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Loongson multimedia condition instructions were previously<br=
>
&gt; &gt;implemented as<br>
&gt; &gt;&gt; write 0 to rd due to lack of documentation. So I just confirm=
ed with<br>
&gt; &gt;Loongson<br>
&gt; &gt;&gt; about their encoding and implemented them correctly.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Jiaxun Yang &lt;<a href=3D"mailto:jiaxun.yang@=
flygoat.com">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt;&gt; Acked-by: Huacai Chen &lt;<a href=3D"mailto:chenhc@lemote.com=
">chenhc@lemote.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; v1: Use deposit opreations according to Richard&#39;s suggest=
ion.<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;<br>
&gt; &gt;Thanks, Jiaxun!<br>
&gt; &gt;<br>
&gt; &gt;But, your numeration of patches is wrong. The first version of the=
<br>
&gt; &gt;patch<br>
&gt; &gt;should be sent with prefix [PATCH]<br>
&gt; &gt;and the second (this) version of the patch with prefix [PATCH v2].=
 This<br>
&gt; &gt;is<br>
&gt; &gt;the second time you make the same mistake. Please make sure that y=
ou<br>
&gt; &gt;have<br>
&gt; &gt;the correct numeration in future. But, anyhow, thanks for this ver=
sion.<br>
&gt;<br>
&gt; Sorry for that.<br>
&gt; I&#39;m doing like this for years.<br>
&gt; I promise it won&#39;t happen in future.<br>
&gt;</p>
<p dir=3D"ltr">Cool, thanks again!</p>
<p dir=3D"ltr">&gt; Thanks.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;Yours,<br>
&gt; &gt;Aleksandar<br>
&gt; &gt;<br>
&gt; -- <br>
&gt; Jiaxun Yang<br>
</p>

--000000000000c4578b05a19d0ec0--

