Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9D34E326
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 10:31:10 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR9mG-00086P-Sf
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 04:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lR9ks-0007Zo-GM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:29:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lR9kq-0007oU-LS
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:29:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u9so23514790ejj.7
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9bjgJFQp+0JbReZDrYXxTe5sNxKojInYHTlNKZLO1zg=;
 b=YJbXvuu2l/M3eAhcZkk4w/U2mve2eSCI6rgyvvPwaf/VRwtzpAaaaI5kyjwFb2VW9q
 fbcp+9mQiWuMSyPOZd0XguoX7ppDNu4K/8BNCgNrOavX7UxcQdlghYlL9Rspmlszvgim
 8owcu8h/AoQU6Zfn6yuU54tQmEGzqveBXZqxrZDtdf66svT7r8DMiKF47DPFVNaHffAr
 1CLCbwVOW1atTX/SapDHT8zrbJ1qOKdSD1Lp1SzvGuwpoB04yBt5nw/y2nvOlmBv7Ecm
 WybrHmDZCpzLwpzOBfy5PftDg8SQ3Mz7oaPWCn/BZ5/FlboaO0uxC8q/B6OUWyJgspoi
 7pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9bjgJFQp+0JbReZDrYXxTe5sNxKojInYHTlNKZLO1zg=;
 b=Zw57QA2k17lGo/UiP3Z6AvsIkiPlnui7C9tbAHb6oRR2N+unDYKu0k5rg7pTZ80Nr3
 de3j0xt8ayg5IGqykgj9y80TQnZprtQWmenZDxwXda2U3YN5BV1Ft/B66qi6BuA7PSEI
 e2fYLFsSfOlpNQbBei+XNXQO6EXdAmeEFrutrltHFWP/DE/wft3qKsj0VUyRfm6Kj+f2
 wLF2Ihjo6/A6Z0pYlgf+GQXVgSh0QL0Hg3G9RjGwUwVoVflyUnLC6N9pJ+3HU1YFb1En
 1Dtrtup70RAV0ABagkUnWLUcZfT6GfNe9TxxVFcKgVZ9NtkW/DjF5GY4yIAyqcVf7KvR
 wxcw==
X-Gm-Message-State: AOAM530o7rRGArSjfUnqdrjfe2UYGWGWjudm7BhO+gTsWFEJC327u0db
 bfTRusT1So68Z3fMkNwuKGnSTrV+8nCxROMEkTY=
X-Google-Smtp-Source: ABdhPJwILX9u0Z9UVL2czuLKC1XS0b9zhIPhv3U0nI2p4MU33yK2rQbNOs+LaduIU1MJ1NgqD4/JEgTEeAwOStyvLcw=
X-Received: by 2002:a17:906:a3d1:: with SMTP id
 ca17mr32446508ejb.92.1617092978904; 
 Tue, 30 Mar 2021 01:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
 <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
 <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
 <CAFEAcA_=GCA8FgLfBxiLvjUaOkV0TATUsuO7an2phFxmJkMxtg@mail.gmail.com>
In-Reply-To: <CAFEAcA_=GCA8FgLfBxiLvjUaOkV0TATUsuO7an2phFxmJkMxtg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Mar 2021 12:29:27 +0400
Message-ID: <CAJ+F1CK2jf5O226zLqpKt_=9mSE4t979huMZ0s9FGZ4TATKguA@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000093919e05bebccc43"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093919e05bebccc43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 29, 2021 at 9:54 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 29 Mar 2021 at 17:30, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Mon, Mar 29, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >>
> >> On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau
> >> <marcandre.lureau@gmail.com> wrote:
> >> > ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
> >> > Configuration error:
> >> > The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
> >> >
> >> > ../docs/meson.build:32:6: ERROR: Problem encountered: Install a
> Python 3 version of python-sphinx and the readthedoc theme
> >>
> >>
> >> So why do you get that message, and I see the above? Older
> >> sphinx-build ?
> >
> >
> >
> > It's strange, it's like ModuleNotFoundError was not catched by the
> "except ImportError".
> >
> > What's the version of python?
>
> It's whatever's in the BSD VMs. I also saw the same error on the
>

I built successfully with  vm-build-openbsd, vm-build-freebsd, and
vm-build-netbsd. None have sphinx installed, thus simply print:
Program sphinx-build-3 sphinx-build found: NO

Am I missing something?

aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.
> My guess is that it might be the sphinx-build version here. I vaguely
> recall that Sphinx is kind of picky about exceptions within the conf
> file but that there was a change in what it allowed at some point.
> It's possible we just can't do much with the old versions.
>

How do you run the build? Running make from an existing configured or build
state? If so, I have seen sphinx errors that don't stop the build (and
actually building the docs without sphinx-rtd). I don't know why this
happens, "regenerate"/reconfigure errors should stop the build.

It seems like a minor issue to me. A clean build will error correctly.


> I'm inclined to suggest we should postpone switching to the rtd theme
> until after the 6.0 release -- there isn't a strong need to get it
> in this release, is there ?
>
>
There is no hurry, but let's try to make some progress. If it's ready, I'll
let you decide if this is acceptable during freeze period or not.

Now I am not sure what should be fixed... I will try to find the cause of
the non-fatal error on incremental build.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000093919e05bebccc43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 9:54 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 29 Mar 2021 at 17:30, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Mar 29, 2021 at 7:56 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau<br>
&gt;&gt; &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank=
">marcandre.lureau@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:<br>
&gt;&gt; &gt; Configuration error:<br>
&gt;&gt; &gt; The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme was not foun=
d.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ../docs/meson.build:32:6: ERROR: Problem encountered: Install=
 a Python 3 version of python-sphinx and the readthedoc theme<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So why do you get that message, and I see the above? Older<br>
&gt;&gt; sphinx-build ?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s strange, it&#39;s like ModuleNotFoundError was not catched by=
 the &quot;except ImportError&quot;.<br>
&gt;<br>
&gt; What&#39;s the version of python?<br>
<br>
It&#39;s whatever&#39;s in the BSD VMs. I also saw the same error on the<br=
></blockquote><div><br></div><div>I built successfully with=C2=A0 vm-build-=
openbsd, vm-build-freebsd, and vm-build-netbsd. None have sphinx installed,=
 thus simply print:</div><div>Program sphinx-build-3 sphinx-build found: NO=
</div><div><br></div><div>Am I missing something?<br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.<br>
My guess is that it might be the sphinx-build version here. I vaguely<br>
recall that Sphinx is kind of picky about exceptions within the conf<br>
file but that there was a change in what it allowed at some point.<br>
It&#39;s possible we just can&#39;t do much with the old versions.<br></blo=
ckquote><div><br></div><div>How do you run the build? Running make from an =
existing configured or build state? If so, I have seen sphinx errors that d=
on&#39;t stop the build (and actually building the docs without sphinx-rtd)=
. I don&#39;t know why this happens, &quot;regenerate&quot;/reconfigure err=
ors should stop the build.<br></div><div><br></div><div>It seems like a min=
or issue to me. A clean build will error correctly.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m inclined to suggest we should postpone switching to the rtd theme<b=
r>
until after the 6.0 release -- there isn&#39;t a strong need to get it<br>
in this release, is there ?<br clear=3D"all"><br></blockquote><div><br></di=
v><div>There is no hurry, but let&#39;s try to make some progress. If it&#3=
9;s ready, I&#39;ll let you decide if this is acceptable during freeze peri=
od or not.<br></div><div><br></div><div>Now I am not sure what should be fi=
xed... I will try to find the cause of the non-fatal error on incremental b=
uild.<br></div><div><br></div><div>thanks<br></div></div><br>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000093919e05bebccc43--

