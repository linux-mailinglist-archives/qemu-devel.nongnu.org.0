Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A13BADE3
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:59:19 +0200 (CEST)
Received: from localhost ([::1]:36100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05Sg-0007wE-CA
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05Rw-0007E4-ER
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:58:32 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m05Ru-0001EY-Pj
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:58:32 -0400
Received: by mail-ua1-x92b.google.com with SMTP id v22so190977uaj.13
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KTAvXBOQj9+yBJCyqjnLWiKcfwNDQw8EZG5kAOWkRA=;
 b=nhItK84PSqeG6HFvud1Lp5wL8pcPBeLupZpxHTEBIud4DqH+F4vsQ1xXEXi3anZAOT
 Tcd4IG1ZuSQbzh4fY3D5qGsJfilLKJKaU9eamkskQejqwQZ0ziT18vRUsT/DoeAm32kq
 3xZ48sPkEyPcFNm3/ti2GZzZFCVvSzWt7pw5Kwa4eu/znDmzTL8xzcy2fa2BhyrMAdc+
 mw5dkZQpejLJzDCHJvWzen15xyDBTZhBWU2/rlYSKf5f3U66Q1wU7HZJ8wyi1HiV+8oM
 4HygMUmOTbLe/g3jcW5sVX4grPrIn8CGcbnXhtmGtJBQ5M8Xv4Nbnvw5Uc29if6cGXKp
 5nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KTAvXBOQj9+yBJCyqjnLWiKcfwNDQw8EZG5kAOWkRA=;
 b=oVvCWS1fNhQmqwE7kMEpT9gcDIud/9JU5dTF5/+qmQy+JeOFE2LEj88rTEeE0eTXGg
 F0IHvERSF6wqRHdALVEYFXibfAB83P5r/IqnJ/Lq1M+ckmRIp+ZMqNEaqTbFObUyl297
 b0O+ALr4HvSWYoNzKCIh5GzeYaDPC16912X/kh0KcDs0WB9AoX9WZOSemCHMCqbby18o
 85SVRhsbdQsT5SLE4Q10JeIUt2lYSkldsWaGKNtfInIxC6LkG3gim+dq5kZTtHha8dsu
 hWExvEel6O/FCEsGiP8YHJaN9bi04tA/iCB4CaZrcrr0f8Se9PlQtGpA5/UfJAsvsgkM
 IGUA==
X-Gm-Message-State: AOAM533WB71jmQjDkaJ/PVpxumrgqWOda/vQgB1Oc74cwFTaPbXderyX
 vwDpn5YAN50AHvVYGvHBRPuhPG7ioGGDdvZv9oo=
X-Google-Smtp-Source: ABdhPJwrjyMebYg+dStVf1Go/70va/MPP63jYv1sWPKn2YTglO3/Yrs4Fa85q4IOd3yd/I+pm3uBv4Zy5EVe6pVZF9M=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr7649166uan.5.1625417909733;
 Sun, 04 Jul 2021 09:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
 <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
 <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
 <0a17d006-b1ef-ab1e-8616-50e29681f998@redhat.com>
 <CAOakUfNZ5K-tVNQZZZWQ2U7-fbw_4TnFSfKXXV2nRpTGVC-LLA@mail.gmail.com>
 <ec113b7f-781d-43f1-ace3-78ae6c114207@redhat.com>
In-Reply-To: <ec113b7f-781d-43f1-ace3-78ae6c114207@redhat.com>
From: Richard Zak <richard.j.zak@gmail.com>
Date: Sun, 4 Jul 2021 12:58:18 -0400
Message-ID: <CAOakUfPchj=rAbtnh+ZUj0CERwgFLKKtzB5ozu4j-b0U6y9V=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001f0d4705c64f1997"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=richard.j.zak@gmail.com; helo=mail-ua1-x92b.google.com
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001f0d4705c64f1997
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=8En dum., 4 iul. 2021 la 12:51, Thomas Huth <thuth@redhat.com> a scris:

> On 04/07/2021 18.39, Richard Zak wrote:
> > Regarding upside down text, where did that occur? I certainly didn't do
> that
> > intentionally. Maybe an encoding error somewhere?
>
> That was meant as a humorous way to say that you should avoid top posting=
,
> but apparently it was just confusing instead. Sorry for that. Anyway, we
> use
> interleaved posting on qemu-devel. See e.g.:
>
> https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
>
>   Thomas
>

Ahh got it. I hadn't done that since Gmail wants to hide the test I'm
responding to. I'm assuming that revisions to a patch should still be a new
post, not in a reply?

--=20
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000001f0d4705c64f1997
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">=C3=8En dum., 4 iul. 2021 la 12:51, Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; a s=
cris:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 04/07/2=
021 18.39, Richard Zak wrote:<br>
&gt; Regarding upside down text, where did that occur? I certainly didn&#39=
;t do that <br>
&gt; intentionally. Maybe an encoding error somewhere?<br>
<br>
That was meant as a humorous way to say that you should avoid top posting, =
<br>
but apparently it was just confusing instead. Sorry for that. Anyway, we us=
e <br>
interleaved posting on qemu-devel. See e.g.:<br>
<br>
<a href=3D"https://en.wikipedia.org/wiki/Posting_style#Interleaved_style" r=
el=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/Posting_s=
tyle#Interleaved_style</a><br>
<br>
=C2=A0 Thomas<br></blockquote><div>=C2=A0</div></div>Ahh got it. I hadn&#39=
;t done that since Gmail wants to hide the test I&#39;m responding to. I&#3=
9;m assuming that revisions to a patch should still be a new post, not in a=
 reply?<br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regar=
ds,<br><br>Richard J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a=
 href=3D"https://keybase.io/rjzak/key.asc" target=3D"_blank">https://keybas=
e.io/rjzak/key.asc</a></div></div></div></div></div></div></div></div>

--0000000000001f0d4705c64f1997--

