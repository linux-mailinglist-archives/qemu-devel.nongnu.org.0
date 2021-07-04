Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27E3BAD61
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:27:14 +0200 (CEST)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m035V-00022u-NA
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m034f-0001Do-26
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:26:21 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:45694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m034a-0004F2-IS
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:26:19 -0400
Received: by mail-ua1-x935.google.com with SMTP id c20so5926884uar.12
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wL/9FPfd/JiZETKGByF6gYg5Xcv/UimC6prFuCOVGr8=;
 b=QADOqQEeFttLMnCGDIftkWUGnnStNQoqK2ZVUI69dQb9B8siM3CR9ZDD/PVjdLQ96s
 rrsEiYpXhW0h1uA+4x/S5AxRNMgX+CUPokcTYMA6Nj+19XPej63iZ6jKzu44UY2/u65L
 M1jgLQBuGaVGtyQR0sJk9D/7mXOay37FW+Kkzx8FGLJs8gd/Bz9+2qlszRMIGr7QGbIV
 w3Fs5oMk+bTTOc+87nRa5vcnlbxTN29x1MVcyB/Yv20uUnf/9sFu/kILiP4t8ucJ0/As
 JlVBrKKtY1pCkrgnjTll8g8xofkrn7d6PsU7qNPVgvdnVbk0tY18PkekAnFARTvb7LPI
 ROFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wL/9FPfd/JiZETKGByF6gYg5Xcv/UimC6prFuCOVGr8=;
 b=MwXCvFTBuaMx8OLfTa7SK2x5jZKWyCJm1zD+X7QKQKUpxsrEW3TjmLoki0QGcNyYJ4
 z9VqlNXpUpLOELjGzbTSNHmAS5Pzvqm1WPkQuMkJ7LAWZ1j/FKMQGAyAc0a/ajvx7N+d
 9T3VNrjajxJRUQ02aSjb4eCi/33kdmms62n/cTRC2+DK3G3YEkeCD+l/bZgZ4U4DX9E6
 cqUnwkTeY8nGkI/ElXRy+JeCXT735npK89n7xQ7qY3Rn+bxsQR2xcv6U+QV3zDQ2g6N0
 LEDSNH+T+okIALap3nRxXeS5JFOpic7uic2GYPX647V4+GFHpQzTeqwaNOt7jPXXm2i5
 8fNw==
X-Gm-Message-State: AOAM533iAAjmELESBwVx96R1hgHf4MJ96MPbwLAgVTI+lGsT3fgkv6a4
 eOa65VRctGvvf6RP0MxHLEIw5jZDEuv8BGUYdms=
X-Google-Smtp-Source: ABdhPJwg5S2qRGOGY4e4+3Vb4kEXV/0E6p6mp7EDJjCtGGHbfiwjzbEvtCGLfbXWdqIJldtrOeWkSVPdxID4RzbvAmI=
X-Received: by 2002:ab0:2a42:: with SMTP id p2mr7431088uar.39.1625408775478;
 Sun, 04 Jul 2021 07:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOz=89WuCyAQhrebNj_K_3_2ZYAJ_=aRR2bAuKT5=9uow@mail.gmail.com>
 <5d7c7f63-381a-836e-be8f-68e3fb938d4b@amsat.org>
 <4567246f-062b-9d6e-38b6-33dc0ab0099e@amsat.org>
In-Reply-To: <4567246f-062b-9d6e-38b6-33dc0ab0099e@amsat.org>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 10:26:04 -0400
Message-ID: <CAOakUfPL0D+BC8DTmLSkPMC+okRaAasH1vC5dSbvSjEUEAZuNQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Fix for Haiku
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000ad60ef05c64cf8fe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=richard.j.zak@gmail.com; helo=mail-ua1-x935.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad60ef05c64cf8fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll re-submit with better comments, and this variable is defined on Haiku,
presumably for support for old Be OS applications, to indicate the
architecture of the CPU. On my 64-bit system, it's value is "x86_64",
32-bit it's "x86".

=C3=8En dum., 4 iul. 2021 la 09:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> a
scris:

> On 7/4/21 12:00 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/3/21 11:12 PM, Richard Zak wrote:
> >> Fix for path to env
> >>
> >> Signed-off-by: Richard Zak <richard.j.zak@gmail.com
> >> <mailto:richard.j.zak@gmail.com>>
> >> ---
> >>  Makefile | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 30f19d33bb..ced9b97372 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -14,7 +14,11 @@ SRC_PATH=3D.
> >>  # we have explicit rules for everything
> >>  MAKEFLAGS +=3D -rR
> >>
> >> +ifneq ($(BE_HOST_CPU),)
> >
> > Where is this variable defined and what is it for?
>
> IIUC it is defined by BeOS, and Haiku is based on it,
> so also defines it. Is that correct?
>


--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--000000000000ad60ef05c64cf8fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll re-submit with better comments, and this variable=
 is defined on Haiku, presumably for support for old Be OS applications, to=
 indicate the architecture of the CPU. On my 64-bit system, it&#39;s value =
is &quot;x86_64&quot;, 32-bit it&#39;s &quot;x86&quot;.<br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4 =
iul. 2021 la 09:51, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org">f4bug@amsat.org</a>&gt; a scris:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 7/4/21 12:00 PM, Philippe Mathieu-Daud=C3=
=A9 wrote:<br>
&gt; On 7/3/21 11:12 PM, Richard Zak wrote:<br>
&gt;&gt; Fix for path to env<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Richard Zak &lt;<a href=3D"mailto:richard.j.zak@gma=
il.com" target=3D"_blank">richard.j.zak@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:richard.j.zak@gmail.com" target=3D"_b=
lank">richard.j.zak@gmail.com</a>&gt;&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0Makefile | 4 ++++<br>
&gt;&gt; =C2=A01 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/Makefile b/Makefile<br>
&gt;&gt; index 30f19d33bb..ced9b97372 100644<br>
&gt;&gt; --- a/Makefile<br>
&gt;&gt; +++ b/Makefile<br>
&gt;&gt; @@ -14,7 +14,11 @@ SRC_PATH=3D.<br>
&gt;&gt; =C2=A0# we have explicit rules for everything<br>
&gt;&gt; =C2=A0MAKEFLAGS +=3D -rR<br>
&gt;&gt; =C2=A0<br>
&gt;&gt; +ifneq ($(BE_HOST_CPU),)<br>
&gt; <br>
&gt; Where is this variable defined and what is it for?<br>
<br>
IIUC it is defined by BeOS, and Haiku is based on it,<br>
so also defines it. Is that correct?<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div>Regards,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP =
Key:=C2=A0<a href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">ht=
tps://keybase.io/rjzak/key.asc</a></div></div></div></div></div></div></div=
>

--000000000000ad60ef05c64cf8fe--

