Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87D1926EE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 12:14:50 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH3zm-000068-1q
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 07:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jH3yb-00082f-UO
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 07:13:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jH3ya-0000m5-Nr
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 07:13:37 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36793)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jH3ya-0000lL-HD
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 07:13:36 -0400
Received: by mail-wr1-x444.google.com with SMTP id 31so2507093wrs.3
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 04:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dxO9XnT9EwVVhWISYTKeamsjCZuSReIpl2TJqE80EPs=;
 b=aPGeBj/Eg7O0zLb7ummDxaq9E2KJfkDgmRQHJ8pncIbJ6p9HKWRgR5ryAauV6FhbKu
 WOB7XAP0EoXcOrNqcl4jy7EV++TdestVmJEn8fGRoK3tpjLDIyvjCMZervfeSwjvlV3S
 bMkFmQmwHo11+FDIcf93f8mc60LOZuKlheYVT7CIZFdvSNiO3lTkigwldxxnwWvYBDze
 Qp3oOSmMgjoFyhsrRxBerEIlKo4lT5b2mPKILQsXKMMZe09jfMrL+tDKtKql2b9oxOeu
 vbsPA3sVJeZMWywvBtgTJ/yEf0MlZMzFs8D45PSYmJ+FVDvWFiYME8lxO8lainXnD11J
 Jtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dxO9XnT9EwVVhWISYTKeamsjCZuSReIpl2TJqE80EPs=;
 b=CBID3LnarPyocQ1c89sa3CDO22CH38/dr+LP0clrtQtG6rEHTTP/UWFFzI2WGet7Cn
 DOnCwpgX6znO2KKo8Y3z1hLOFtM1chUdjzXpG0ZtiDz1NISIIiKp8x9Kat682UbD/+e1
 leo6PM+332IxjrVZ+RL+5vH6qMT9/EaBGwBimfupkhdU58sTZeXahE2pJ3MsZlQDd8mN
 8HbsTig2m6KK6xTdocwqOYRzZXaiBcBWRfLsTE/Jj6cKjCvtpTJrjB4ehdqu5D4HzMrA
 SaUi+xasZlg4egkiMBSOHLYAoVykFUNc9quLX5eg8bOJyGZ6CNw9CtQI6/97Kk8cJrw5
 8FRQ==
X-Gm-Message-State: ANhLgQ3PwZp1C8omiH4p2iTiyvxWmUXrqQSHSeJs0BmVixGB4bA9cBFW
 LPGmV61pkAOUmp//E7AFQitTAmN8JvW0eYdhn40=
X-Google-Smtp-Source: ADFU+vtaCYvfVfFY05muVWvzaeKgcnAUv92v43EgzbOkXRNriNeolvX+IZMmPv9fnIQN6t2jikAfgeX2Zu5aIZa7gvo=
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2804121wrp.402.1585134815156; 
 Wed, 25 Mar 2020 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200324122212.11156-1-jiaxun.yang@flygoat.com>
 <aa622b1d-e28a-c3f1-d18a-73e8a67c8ccf@linaro.org>
 <CAHiYmc7R_Y7s5DaVHf=0rkxf7N2qTSLXdTdL_vy6mH+hVdwLqA@mail.gmail.com>
 <CAHiYmc5nzmk0EiN6U8Wd3h3xBwim1frEXk=27tngfagHwTvYQw@mail.gmail.com>
In-Reply-To: <CAHiYmc5nzmk0EiN6U8Wd3h3xBwim1frEXk=27tngfagHwTvYQw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 25 Mar 2020 13:13:19 +0200
Message-ID: <CAHiYmc6vG+Pe1xxp8edgqOLL7n2je5n6Qye-rT7BP3oA=aaQ=Q@mail.gmail.com>
Subject: Re: [PATCH for-5.0,
 v1] target/mips: Fix loongson multimedia condition instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000941b3105a1abf58b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: aurelien@aurel32.net, aleksandar.rikalo@rt-rk.com,
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000941b3105a1abf58b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

12:47 Sre, 25.03.2020. Aleksandar Markovic <aleksandar.qemu.devel@gmail.com=
>
=D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> 12:44 Sre, 25.03.2020. Aleksandar Markovic <
aleksandar.qemu.devel@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> >
> > 16:59 Uto, 24.03.2020. Richard Henderson <richard.henderson@linaro.org>
=D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
> > >
> > > On 3/24/20 5:22 AM, Jiaxun Yang wrote:
> > > > Loongson multimedia condition instructions were previously
implemented as
> > > > write 0 to rd due to lack of documentation. So I just confirmed
with Loongson
> > > > about their encoding and implemented them correctly.
> > > >
> > > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > > Acked-by: Huacai Chen <chenhc@lemote.com>
> > > > ---
> > > > v1: Use deposit opreations according to Richard's suggestion.
> > > > ---
> > > >  target/mips/translate.c | 35 +++++++++++++++++++++++++++++++----
> > > >  1 file changed, 31 insertions(+), 4 deletions(-)
> > >
> > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > >
> >
> > I just have a couple of mon-essential suggestions wrt coding style, but
since all that is really of very insignificant nauture, I wouldn't even
mention them.
> >
> > Reviewed-by: Aleksandar Markovic <aleksandar.qemi.devel@gmail.com>
> >
>
> Sorry, there was a typo. It should be:
>
> Reviewed-by: Aleksandar Markovic <aleksandar.qem u.devel@gmail.com>
>
> ("u" instead of "i" in "qemi")
>

Another problem with text formatting on mobile phones, this line should be:

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

Hope this all right now.

Sorry about that.

> > May I ask you, Richard, to select this patch for your next TCG-for-5.0
queue, so that I don't go through a MIPS queue process for just a single
patch?
> >
> > Thanks to all involved people!
> >
> > Aleksandar
> >
> > >
> > > r~

--000000000000941b3105a1abf58b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">12:47 Sre, 25.03.2020. Aleksandar Markovic &lt;<a href=3D"ma=
ilto:aleksandar.qemu.devel@gmail.com">aleksandar.qemu.devel@gmail.com</a>&g=
t; =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br=
>
&gt;<br>
&gt; 12:44 Sre, 25.03.2020. Aleksandar Markovic &lt;<a href=3D"mailto:aleks=
andar.qemu.devel@gmail.com">aleksandar.qemu.devel@gmail.com</a>&gt; =D1=98=
=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt; &gt;<br>
&gt; &gt; 16:59 Uto, 24.03.2020. Richard Henderson &lt;<a href=3D"mailto:ri=
chard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; =D1=98=D0=
=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 3/24/20 5:22 AM, Jiaxun Yang wrote:<br>
&gt; &gt; &gt; &gt; Loongson multimedia condition instructions were previou=
sly implemented as<br>
&gt; &gt; &gt; &gt; write 0 to rd due to lack of documentation. So I just c=
onfirmed with Loongson<br>
&gt; &gt; &gt; &gt; about their encoding and implemented them correctly.<br=
>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Jiaxun Yang &lt;<a href=3D"mailto:jiaxun=
.yang@flygoat.com">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Acked-by: Huacai Chen &lt;<a href=3D"mailto:chenhc@lemo=
te.com">chenhc@lemote.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; v1: Use deposit opreations according to Richard&#39;s s=
uggestion.<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 target/mips/translate.c | 35 ++++++++++++++++++++=
+++++++++++----<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 31 insertions(+), 4 deletions(-)<=
br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard=
.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I just have a couple of mon-essential suggestions wrt coding styl=
e, but since all that is really of very insignificant nauture, I wouldn&#39=
;t even mention them.<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleksandar=
.qemi.devel@gmail.com">aleksandar.qemi.devel@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Sorry, there was a typo. It should be:<br>
&gt;<br>
&gt; Reviewed-by: Aleksandar Markovic &lt;aleksandar.qem <a href=3D"mailto:=
u.devel@gmail.com">u.devel@gmail.com</a>&gt;<br>
&gt;<br>
&gt; (&quot;u&quot; instead of &quot;i&quot; in &quot;qemi&quot;)<br>
&gt;</p>
<p dir=3D"ltr">Another problem with text formatting on mobile phones, this =
line should be:</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleks=
andar.qemu.devel@gmail.com">aleksandar.qemu.devel@gmail.com</a>&gt;</p>
<p dir=3D"ltr">Hope this all right now.</p>
<p dir=3D"ltr">Sorry about that.<br></p>
<p dir=3D"ltr">&gt; &gt; May I ask you, Richard, to select this patch for y=
our next TCG-for-5.0 queue, so that I don&#39;t go through a MIPS queue pro=
cess for just a single patch?<br>
&gt; &gt;<br>
&gt; &gt; Thanks to all involved people!<br>
&gt; &gt;<br>
&gt; &gt; Aleksandar<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; r~<br>
</p>

--000000000000941b3105a1abf58b--

