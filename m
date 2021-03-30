Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08934EAAD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:42:00 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFZ9-0006ZY-3R
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lRFUB-0001BS-A4
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:36:51 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lRFTv-000458-WE
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:36:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id a7so25189650ejs.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qf4o++mMWyAIU6l+WLFuZObrua0LcgflHxzx+b0xbGA=;
 b=G25mSax+xRhIYhZDazQiTZkaQ0E71RclCsrj7YgB4m8Lu2QEJQk78FTQxIZyq6SUNb
 Dc99iiWaDDkSH4IaFirr6KiMLG8+xMRfvs3Ot96bPoFSdK35PHI8yausHe72QqH/WZER
 le0xB+4tigXtjeJONsCR6YTleqxNC098wXwAPq7JVVCJsDHv+ofHz7ecdBaghCorDoAj
 LbfADpjWpmj6k5SGZmHyqihuUjqffOvmYXBb4cjRP4ipDqcKz+EQGTOMUv/i3Cl6UPpO
 5xVYN4dfiFgzzDGXtdt2FnVwPqgd4kBFwVXnzlTuT8Kb2ggZel4Yf2m5XokYmgIB0G12
 bwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qf4o++mMWyAIU6l+WLFuZObrua0LcgflHxzx+b0xbGA=;
 b=tiPxo76q9Bmonu9b107IUtF3og1AK6BlOzPyM5OFOMz/11+/clwmaRWTz3NBmlu+50
 RKZfz7N4KDjAOiOZ3gBIUcV610jrnm1kJPxT21f1Xe9uBfF4c42cgF54o5tKuGlzjtSE
 PPATqrbNff0VObY9Tl4XF1NQC4hN6EmTZz+EsAs9Q+h/QePO9LBO11v3bZqQEtYDXckG
 JY+Vz/01x1JM1te4y+Q/RuoZjiNTY5JE0kRBns/FywjQb6yGsmSFuLWXuCOHqAk13Orv
 /hP9S5k9w1VPfvNNmeGV2BjoZyRs9/PWIod7LgbRF5Fww+VHi/6yMAdb8xY3wXXjLVRa
 WM8Q==
X-Gm-Message-State: AOAM530nG7hyEUHDcCo2q4IImzgqSJRwka3UEhOBY8KgyCaDFdBI8K6Z
 dKvc3SJhytYdoTdVNRehuME0EZMPLPvfGBW3qbc=
X-Google-Smtp-Source: ABdhPJwJGbx0/MIlmxKCd0Z4xuSUK+0g50hzCk4iktjn5eKdQxs2E8mKvJ1T4Y1PlPqSABdRZjmOE+WJCjZjVi6qajk=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr33909771ejc.105.1617114988954; 
 Tue, 30 Mar 2021 07:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
 <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
 <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
 <CAFEAcA_=GCA8FgLfBxiLvjUaOkV0TATUsuO7an2phFxmJkMxtg@mail.gmail.com>
 <CAJ+F1CK2jf5O226zLqpKt_=9mSE4t979huMZ0s9FGZ4TATKguA@mail.gmail.com>
 <CAFEAcA8dnsC30ZQVXOCLWdwb50nQFcWQjRZB_m5S6Mpv3WC2Ug@mail.gmail.com>
In-Reply-To: <CAFEAcA8dnsC30ZQVXOCLWdwb50nQFcWQjRZB_m5S6Mpv3WC2Ug@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Mar 2021 18:36:17 +0400
Message-ID: <CAJ+F1CJCRzBa29qpAgYswiJSZ-ouxQAZvfLaHwZo_xhHaJjJ1Q@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007a484805bec1ecd4"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000007a484805bec1ecd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 30, 2021 at 4:12 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 30 Mar 2021 at 09:29, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Mon, Mar 29, 2021 at 9:54 PM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >> aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.
> >> My guess is that it might be the sphinx-build version here. I vaguely
> >> recall that Sphinx is kind of picky about exceptions within the conf
> >> file but that there was a change in what it allowed at some point.
> >> It's possible we just can't do much with the old versions.
> >
> >
> > How do you run the build? Running make from an existing configured or
> build state? If so, I have seen sphinx errors that don't stop the build
> (and actually building the docs without sphinx-rtd). I don't know why thi=
s
> happens, "regenerate"/reconfigure errors should stop the build.
>
> On that machine, yes, it's an incremental build.
>
>
Could you check if --enable-docs was enabled? It turns out I wasn't always
checking things properly, and it works as expected for me. Without the rtd
theme installed and:

- Without --enable-docs,

./docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
The Sphinx 'sphinx_rtd_theme' HTML theme was not found.

On incremental build, extra warnings and the build continues, disabling
docs as necessary.

- With --enable-docs,

../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3
version of python-sphinx and the readthedoc theme

A full log can be found at
/home/elmarco/src/qemu/build/meson-logs/meson-log.txt

ERROR: meson setup failed



On incremental build, it correctly stops:

../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3
version of python-sphinx and the readthedoc theme
A full log can be found at
/home/elmarco/src/qemu/build/meson-logs/meson-log.txt
ninja: error: FAILED: build.ninja
/usr/bin/meson --internal regenerate /home/elmarco/src/qemu
/home/elmarco/src/qemu/build --backend ninja
rebuilding 'build.ninja': subcommand failed
make: *** [Makefile:152: run-ninja] Error 1


--=20
Marc-Andr=C3=A9 Lureau

--0000000000007a484805bec1ecd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 30, 2021 at 4:12 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Tue, 30 Mar 2021 at 09:29, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Mar 29, 2021 at 9:54 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt; aarch64 CI machine, which has python 3.8.5 and sphinx-build 1.8.5.=
<br>
&gt;&gt; My guess is that it might be the sphinx-build version here. I vagu=
ely<br>
&gt;&gt; recall that Sphinx is kind of picky about exceptions within the co=
nf<br>
&gt;&gt; file but that there was a change in what it allowed at some point.=
<br>
&gt;&gt; It&#39;s possible we just can&#39;t do much with the old versions.=
<br>
&gt;<br>
&gt;<br>
&gt; How do you run the build? Running make from an existing configured or =
build state? If so, I have seen sphinx errors that don&#39;t stop the build=
 (and actually building the docs without sphinx-rtd). I don&#39;t know why =
this happens, &quot;regenerate&quot;/reconfigure errors should stop the bui=
ld.<br>
<br>
On that machine, yes, it&#39;s an incremental build.<br clear=3D"all"><br><=
/blockquote><div><br></div><div>Could you check if --enable-docs was enable=
d? It turns out I wasn&#39;t always checking things properly, and it works =
as expected for me. Without the rtd theme installed and:<br></div><div><br>=
</div><div>- Without --enable-docs,<br></div><div><br></div><div>./docs/mes=
on.build:30: WARNING: /usr/bin/sphinx-build-3: <br>Configuration error:<br>=
The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme was not found.<br></div><d=
iv><br></div><div>On incremental build, extra warnings and the build contin=
ues, disabling docs as necessary.</div><div><br></div><div>- With --enable-=
docs, <br></div><div><br></div><div>../docs/meson.build:30: WARNING: /usr/b=
in/sphinx-build-3: <br>Configuration error:<br>The Sphinx &#39;sphinx_rtd_t=
heme&#39; HTML theme was not found.<br>../docs/meson.build:32:6: ERROR: Pro=
blem encountered: Install a Python 3 version of python-sphinx and the readt=
hedoc theme<br><br>A full log can be found at /home/elmarco/src/qemu/build/=
meson-logs/meson-log.txt<br><br>ERROR: meson setup failed<br><br><br></div>=
<div><br></div><div>On incremental build, it correctly stops:</div><div><br=
></div><div>../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3: <br>C=
onfiguration error:<br>The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme was=
 not found.<br></div><div>../docs/meson.build:32:6: ERROR: Problem encounte=
red: Install a Python 3 version of python-sphinx and the readthedoc theme<b=
r>A full log can be found at /home/elmarco/src/qemu/build/meson-logs/meson-=
log.txt<br>ninja: error: FAILED: build.ninja <br>/usr/bin/meson --internal =
regenerate /home/elmarco/src/qemu /home/elmarco/src/qemu/build --backend ni=
nja<br>rebuilding &#39;build.ninja&#39;: subcommand failed<br>make: *** [Ma=
kefile:152: run-ninja] Error 1</div><div><br></div></div><br>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007a484805bec1ecd4--

