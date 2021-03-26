Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9EB34B104
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:03:17 +0100 (CET)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPtbv-00058G-OB
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPtZZ-0003rf-U9
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:00:50 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPtZX-0007qp-Ur
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:00:49 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r12so10384330ejr.5
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVQQgI5Gek6ZxZ2zMZHOAhTsuoOslWZe1hlZA6tq70Q=;
 b=UT+nODTxoZXOyv7UhxELWKAtBtRPhIgd2iFiFVGHUwT4MJLRRigtVeCgXkcAjxLRfz
 Wrg4Qr/LnrX4x81rYnU7LCC8uINXvVElbudzfBExSAHijRhYHnFPEzTCDg5GNiXsOBGw
 O2GjQCdeqWgs5wqcDyGbhTZ09k6tmDvA5emqFJXTusQiqOVVtaMwTi0wYOFpa291aX8W
 KFcCcfiq46brzlt15UtWfTqtHsx8TRQrgizrpOB4jx7bsZ9RIz+JskBTAtGgeFI6Y6J1
 lhOrgvZ0V+Gj4sC0p8wwXqcpbNOal44Yf5Wv3UrnjNDcKzOUZ5FDlu7b1zcS8j/+INTm
 VXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVQQgI5Gek6ZxZ2zMZHOAhTsuoOslWZe1hlZA6tq70Q=;
 b=r5XCfsx6WcLb3s8TbUrt0MmqBRE7wdOKkJkscHuiuTKGj+AxvtLH99saKPzEHAC4m3
 e1V/xOGW7ko+zov5kXUj+BmFL7PHjduChS3O21YOdEcrpUj3tKBc+Zu+VIbD0FapgvQi
 0tB8VKbXA8YO4J7oSXH5999YLLpBhC/R4/AxxSKn3NWz1uv268NtDi8tpvfkD2b2LAuQ
 6Dw4yDfmlnHOY0gaePNPpSDNLEEbd8DeGd6l4d6guIXrlm3XKYu0beNLUGfoiOiwBvCl
 rBa6BoAe6vBI1MxHONKBzD3zTAGLZIJZLOBNxASSuazu24YEkiouqtvD3adKJRCruLmz
 tpzA==
X-Gm-Message-State: AOAM533sWyJeRTjZISICbBvhhBv7zbO7rpLVRgs/ZIwXIrRFRax2Bg74
 klwEzXIYIBxlWpKkj6TetfW7TYQloH7QE/MqS8Q=
X-Google-Smtp-Source: ABdhPJwoXIrDHLlL5rvtYyx6Syhd2Ng2FOtbMpekyvQxL8zHKp9DLy5M8VWESRxdqBQ01kIMF/huykhXLXNiXtsCk1k=
X-Received: by 2002:a17:906:3643:: with SMTP id
 r3mr16911275ejb.527.1616792445468; 
 Fri, 26 Mar 2021 14:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616779714.git.lukasstraub2@web.de>
 <CAFEAcA_xF18iG3da8EfTSE7oLQrP056+RjdNrNGpk3F+Qj7NYg@mail.gmail.com>
 <20210326191855.0c1dfd99@gecko.fritz.box> <87o8f5r5vd.fsf@dusky.pond.sub.org>
In-Reply-To: <87o8f5r5vd.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 27 Mar 2021 01:00:32 +0400
Message-ID: <CAJ+F1CJbG7QzizyKtih6Fg1TUTcXP7kvxv+piJc=X3SGn6jydg@mail.gmail.com>
Subject: Re: [PULL for 6.0 0/6] Yank fixes
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000063426005be76d312"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62c.google.com
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
 Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000063426005be76d312
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Mar 27, 2021 at 12:56 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Lukas Straub <lukasstraub2@web.de> writes:
>
> > On Fri, 26 Mar 2021 17:52:40 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> >> On Fri, 26 Mar 2021 at 17:34, Lukas Straub <lukasstraub2@web.de> wrote=
:
> >> >
> >> > The following changes since commit
> 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:
> >> >
> >> >   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322'
> into staging (2021-03-22 18:50:25 +0000)
> >> >
> >> > are available in the Git repository at:
> >> >
> >> >   https://github.com/Lukey3332/qemu.git tags/pull-26-03-2021
> >> >
> >> > for you to fetch changes up to
> 7c2f1ddcaa1c97462cb0b834d5aa7368283aa67d:
> >> >
> >> >   tests: Add tests for yank with the chardev-change case (2021-03-26
> 17:12:18 +0000)
> >> >
> >> > ----------------------------------------------------------------
> >> > Yank fixes for 6.0:
> >> >  -Remove qiochannel dependency from the yank core code
> >> >  -Always link in the yank code to increase test coverage
> >> >  -Fix yank with chardev-change
> >> >  -Add tests for yank with chardev-change
> >>
> >> Can we get these through some established submaintainer tree, please?
> >>
> >> thanks
> >> -- PMM
> >
> > I guess Marc-Andr=C3=A9 Lureau or Markus Armbruster can take it trough =
their
> tree.
>
> My Easter break starts basically now.  Marc-Andr=C3=A9, could you take ca=
re
> of it?  Alternatively, perhaps Eric?
>
>
Yes, I will send a PR

Enjoy!

--=20
Marc-Andr=C3=A9 Lureau

--00000000000063426005be76d312
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 27, 2021 at 12:56 AM Ma=
rkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">L=
ukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" target=3D"_blank">lu=
kasstraub2@web.de</a>&gt; writes:<br>
<br>
&gt; On Fri, 26 Mar 2021 17:52:40 +0000<br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On Fri, 26 Mar 2021 at 17:34, Lukas Straub &lt;<a href=3D"mailto:l=
ukasstraub2@web.de" target=3D"_blank">lukasstraub2@web.de</a>&gt; wrote:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The following changes since commit 5ca634afcf83215a9a54ca6e66=
032325b5ffb5f6:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/philmd/=
tags/sdmmc-20210322&#39; into staging (2021-03-22 18:50:25 +0000)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/Lukey3332/qemu.git"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/Lukey3332/qemu.git=
</a> tags/pull-26-03-2021<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; for you to fetch changes up to 7c2f1ddcaa1c97462cb0b834d5aa73=
68283aa67d:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0tests: Add tests for yank with the chardev-change=
 case (2021-03-26 17:12:18 +0000)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -------------------------------------------------------------=
---<br>
&gt;&gt; &gt; Yank fixes for 6.0:<br>
&gt;&gt; &gt;=C2=A0 -Remove qiochannel dependency from the yank core code<b=
r>
&gt;&gt; &gt;=C2=A0 -Always link in the yank code to increase test coverage=
<br>
&gt;&gt; &gt;=C2=A0 -Fix yank with chardev-change<br>
&gt;&gt; &gt;=C2=A0 -Add tests for yank with chardev-change=C2=A0 <br>
&gt;&gt; <br>
&gt;&gt; Can we get these through some established submaintainer tree, plea=
se?<br>
&gt;&gt; <br>
&gt;&gt; thanks<br>
&gt;&gt; -- PMM<br>
&gt;<br>
&gt; I guess Marc-Andr=C3=A9 Lureau or Markus Armbruster can take it trough=
 their tree.<br>
<br>
My Easter break starts basically now.=C2=A0 Marc-Andr=C3=A9, could you take=
 care<br>
of it?=C2=A0 Alternatively, perhaps Eric?<br>
<br>
</blockquote></div><div><br></div><div>Yes, I will send a PR</div><div><br>=
</div><div>Enjoy!<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000063426005be76d312--

