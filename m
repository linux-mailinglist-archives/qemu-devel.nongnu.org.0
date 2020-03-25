Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F419262E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 11:50:33 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH3cF-0005W6-OL
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 06:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jH3Wb-0006vT-00
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jH3WZ-00047j-R2
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:44:40 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34195)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jH3WZ-000463-K1
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:44:39 -0400
Received: by mail-wr1-x442.google.com with SMTP id 65so2387487wrl.1
 for <qemu-devel@nongnu.org>; Wed, 25 Mar 2020 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5tudx4i8QBXAELJ6WYCq4bhA/K+X97tGUXk24U1ORk=;
 b=N2YM+h1Xu7wSkdHNymigCBlXMF9ES4fk7bTmHYA4PIrccLYBd5LHdHuBYWuz90ZvqM
 NerkJNnYq3c6ZNjiYeYYuqPYK11UyOb0be9R/UXulEUZV6KEMyJILMxtzGcOY6ArYcrC
 goz3hY18sU6VD3bVm9Y+Gurt1clE7lAXAnlfktUKxVBtUtRYK16cO8KF6F61LSv8lM9K
 1k1Eq9WXhEuB3Z8kee2eyIRoGdHb2C+v/sKfHkp2GJ208AvHqerYXILhVyIlf8YqdqEr
 Vl+alA9FnehBFp+OzN4I1PIZ0JYoWsUI+vZ2e48a/x9EQV5O9HfbysIjaNIay/nYQTIO
 +OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5tudx4i8QBXAELJ6WYCq4bhA/K+X97tGUXk24U1ORk=;
 b=tqgIncyWTbBNfp6wUAT/p5I0rHEEGG4zGhlRZ30I7fVZw2Gl94a/nrJB+i66OKbt1f
 i0c6MBDCdMdZS2qCu2FH7Sx6JB6reGByCD13V1ySob7FufAq4+lRaPqSkPorwjnnyId9
 s5vBAwGAP8w9VYzN3f5Iu6H8QIW1KlyRO4xZaQlG427B1y55fv3VxRYshkmMvzuLsXc7
 l7K75K+S1hg8xwRxw781piFo+ZWJyJaVKolxI2rhQJATRoRvt+GuKF7qZSus7Rh08B3D
 yR9FGOQ53igi9dWJWVnzGkKKUqXRNOrqmbcx69Y9DNqObG/DlXCeTuKT1tHn8OjVtFWC
 JBuA==
X-Gm-Message-State: ANhLgQ0Ab00u7IwGXlKPdm6Rzqtq5n9j2uNJTAtf1JAFv0tST0GjX3GQ
 8huxfW7mZJWXr+6Ym4GZ14Yjoo9RQz2dZT78fkE=
X-Google-Smtp-Source: ADFU+vu8+JENtzGIyWC+WQy3rqxolPiz0zG9Cz0cWOgsJI5PoX8d9yKJka5AKssY+UbfMGekLSeW6CTSlbSQPYm6hj4=
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2669756wrp.402.1585133076421; 
 Wed, 25 Mar 2020 03:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200324122212.11156-1-jiaxun.yang@flygoat.com>
 <aa622b1d-e28a-c3f1-d18a-73e8a67c8ccf@linaro.org>
In-Reply-To: <aa622b1d-e28a-c3f1-d18a-73e8a67c8ccf@linaro.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 25 Mar 2020 12:44:16 +0200
Message-ID: <CAHiYmc7R_Y7s5DaVHf=0rkxf7N2qTSLXdTdL_vy6mH+hVdwLqA@mail.gmail.com>
Subject: Re: [PATCH for-5.0,
 v1] target/mips: Fix loongson multimedia condition instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f11f6005a1ab8d64"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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

--000000000000f11f6005a1ab8d64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

16:59 Uto, 24.03.2020. Richard Henderson <richard.henderson@linaro.org> =D1=
=98=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On 3/24/20 5:22 AM, Jiaxun Yang wrote:
> > Loongson multimedia condition instructions were previously implemented
as
> > write 0 to rd due to lack of documentation. So I just confirmed with
Loongson
> > about their encoding and implemented them correctly.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > Acked-by: Huacai Chen <chenhc@lemote.com>
> > ---
> > v1: Use deposit opreations according to Richard's suggestion.
> > ---
> >  target/mips/translate.c | 35 +++++++++++++++++++++++++++++++----
> >  1 file changed, 31 insertions(+), 4 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

I just have a couple of mon-essential suggestions wrt coding style, but
since all that is really of very insignificant nauture, I wouldn't even
mention them.

Reviewed-by: Aleksandar Markovic <aleksandar.qemi.devel@gmail.com>

May I ask you, Richard, to select this patch for your next TCG-for-5.0
queue, so that I don't go through a MIPS queue process for just a single
patch?

Thanks to all involved people!

Aleksandar

>
> r~

--000000000000f11f6005a1ab8d64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">16:59 Uto, 24.03.2020. Richard Henderson &lt;<a href=3D"mail=
to:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; =D1=
=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; On 3/24/20 5:22 AM, Jiaxun Yang wrote:<br>
&gt; &gt; Loongson multimedia condition instructions were previously implem=
ented as<br>
&gt; &gt; write 0 to rd due to lack of documentation. So I just confirmed w=
ith Loongson<br>
&gt; &gt; about their encoding and implemented them correctly.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Jiaxun Yang &lt;<a href=3D"mailto:jiaxun.yang@flyg=
oat.com">jiaxun.yang@flygoat.com</a>&gt;<br>
&gt; &gt; Acked-by: Huacai Chen &lt;<a href=3D"mailto:chenhc@lemote.com">ch=
enhc@lemote.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v1: Use deposit opreations according to Richard&#39;s suggestion.=
<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 target/mips/translate.c | 35 ++++++++++++++++++++++++++++++=
+----<br>
&gt; &gt;=C2=A0 1 file changed, 31 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org">richard.henderson@linaro.org</a>&gt;<br>
&gt;</p>
<p dir=3D"ltr">I just have a couple of mon-essential suggestions wrt coding=
 style, but since all that is really of very insignificant nauture, I would=
n&#39;t even mention them.</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleks=
andar.qemi.devel@gmail.com">aleksandar.qemi.devel@gmail.com</a>&gt;</p>
<p dir=3D"ltr">May I ask you, Richard, to select this patch for your next T=
CG-for-5.0 queue, so that I don&#39;t go through a MIPS queue process for j=
ust a single patch?</p>
<p dir=3D"ltr">Thanks to all involved people!</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt;<br>
&gt; r~<br>
</p>

--000000000000f11f6005a1ab8d64--

