Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E4237C344
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:19:37 +0200 (CEST)
Received: from localhost ([::1]:60344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqe8-0003jj-NS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgqc8-0002Jj-Rd
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:17:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgqc4-0008Rg-UJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:17:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id b25so35487537eju.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtejjM6ojXfhByMh1vhyHqc+iLFfyaBY9UbbIlmQ3qw=;
 b=FFdzKfF0sYst+7TltWFYR9curv/9wKe0rYjFxe17nF+bTLg6pLJgaCX3gGrxZGlcHf
 T9unQu2kptXHAxOgClR6VomfrCrPUEGYxAQ5uNDxoa6qOGBs/5zDLoA7xtnj4jyJD6XS
 abN7mcrt4u6WiaddEaASMpzvuhUcMhlYxu+Uy/OvVjYP1kOfTCSuHdiO3OyuoFwuU09N
 6S0nP+Ugq3gKYsT1+eTtAzMTA/jB9WIyLqMEsgEZMkUTy6zoRGyZownGtUqSOy/vRmIO
 F8nEZ33A5RyOQ5IWug/BkVXK0Ej8XvjTT6xiXSlJKp0YrDmSKgJ8Na8LXzhfbfxL8+zg
 wlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtejjM6ojXfhByMh1vhyHqc+iLFfyaBY9UbbIlmQ3qw=;
 b=l2r4teAi/Rtg7pol6FtfJ+rB7YtM8oTcSxWfW4eJRpjDb9eP97LeIhU3YVcY3tcctH
 +mQNqPmvr/u8YsAUGk0yonMrxVEq9LIfCxr274lPV8xq5EmmdLdb7mawr1/fbKHnmXW6
 +j3EeBFNJSldpzbo+SrB6sHT6RxdTcCdi+HEnzXZwhiiNops9+BRqu8g+Qt4sPpsje96
 938dN0Z1biBhfDH5sr1jA6sV8SJoM+EjJ+pvAojGocH3Csmb5rkGo07iaCgNy3Fk3e1d
 a2KZvrHJUXrvH7kCR++H5uzdNr2qL05zGl0t+evilb6Hw2iQt2ymi41zKXcLWoWA8GZ0
 /4Vg==
X-Gm-Message-State: AOAM532OBDxbMk+L6dQgDSRI+/eRmwblE1V38SxUjZg5ayEaIDaTcDpD
 O5GYGYNzlxl8tnnxljchjVmGoDQTAmO3evproKU=
X-Google-Smtp-Source: ABdhPJwpYE8VerJ6LY4jaCe9t1MK8Rrl1u5LvU/qK7d4IZHQYcbDj21UJAh76pDCVxDNcdcesn6kBN6NTooAl7hHPSE=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr38600968ejs.105.1620832647639; 
 Wed, 12 May 2021 08:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
In-Reply-To: <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 May 2021 19:17:15 +0400
Message-ID: <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000033f5cb05c2238229"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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

--00000000000033f5cb05c2238229
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 12, 2021 at 5:47 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 May 2021 at 14:06, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following changes since commit
> d90f154867ec0ec22fd719164b88716e8fd48672:
> >
> >   Merge remote-tracking branch
> 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05
> 20:29:14 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
> >
> > for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b18898257000=
:
> >
> >   sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09 +0400)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > ----------------------------------------------------------------
> >
> > Marc-Andr=C3=A9 Lureau (1):
> >   sphinx: adopt kernel readthedoc theme
>
> NetBSD now complains:
>
> Configuring 60-edk2-x86_64.json using configuration
> Program qemu-keymap found: NO
> Program sphinx-build found: YES
> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> Configuration error:
> There is a programable error in your configuration file:
>
> Traceback (most recent call last):
>   File "conf.py", line 154, in <module>
>     import sphinx_rtd_theme
> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in
> __init__
>     execfile_(filename, config)
>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
> 150, in execfile_
>     exec_(code, _globals)
>   File "conf.py", line 157, in <module>
>     'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
> was not found.
>
>
>
> Program python3 found: YES (/usr/bin/python3)
> Program diff found: YES
> Program dbus-daemon found: YES
>
>
> as does freebsd and openbsd. Can we get the theme added to the VM
> configs for those ?
>
>

What is used for the BSD configs? If it's tests/vm, I don't see readthedoc
being installed there, and vm-build-* should work (at least some work for
me, freebsd fails with ssh issue here)

--=20
Marc-Andr=C3=A9 Lureau

--00000000000033f5cb05c2238229
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 12, 2021 at 5:47 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank=
">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Mon, 10 May 2021 at 14:06, &lt;<a href=3D"mail=
to:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The following changes since commit d90f154867ec0ec22fd719164b88716e8fd=
48672:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/dg-gitlab/tags/p=
pc-for-6.1-20210504&#39; into staging (2021-05-05 20:29:14 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-req=
uest<br>
&gt;<br>
&gt; for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b1889825700=
0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09=
 +0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Pull request<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt;<br>
&gt; Marc-Andr=C3=A9 Lureau (1):<br>
&gt;=C2=A0 =C2=A0sphinx: adopt kernel readthedoc theme<br>
<br>
NetBSD now complains:<br>
<br>
Configuring 60-edk2-x86_64.json using configuration<br>
Program qemu-keymap found: NO<br>
Program sphinx-build found: YES<br>
../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:<br>
Configuration error:<br>
There is a programable error in your configuration file:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;conf.py&quot;, line 154, in &lt;module&gt;<br>
=C2=A0 =C2=A0 import sphinx_rtd_theme<br>
ModuleNotFoundError: No module named &#39;sphinx_rtd_theme&#39;<br>
<br>
During handling of the above exception, another exception occurred:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/lib/python3/dist-packages/sphinx/config.py&quot;, li=
ne 157, in __init__<br>
=C2=A0 =C2=A0 execfile_(filename, config)<br>
=C2=A0 File &quot;/usr/lib/python3/dist-packages/sphinx/util/pycompat.py&qu=
ot;, line<br>
150, in execfile_<br>
=C2=A0 =C2=A0 exec_(code, _globals)<br>
=C2=A0 File &quot;conf.py&quot;, line 157, in &lt;module&gt;<br>
=C2=A0 =C2=A0 &#39;The Sphinx \&#39;sphinx_rtd_theme\&#39; HTML theme was n=
ot found.\n&#39;<br>
sphinx.errors.ConfigError: The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme=
<br>
was not found.<br>
<br>
<br>
<br>
Program python3 found: YES (/usr/bin/python3)<br>
Program diff found: YES<br>
Program dbus-daemon found: YES<br>
<br>
<br>
as does freebsd and openbsd. Can we get the theme added to the VM<br>
configs for those ?<br><br></blockquote><div><br></div><div><br></div><div>=
What is used for the BSD configs? If it&#39;s tests/vm, I don&#39;t see rea=
dthedoc being installed there, and vm-build-* should work (at least some wo=
rk for me, freebsd fails with ssh issue here)<br></div><div> <br></div></di=
v>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000033f5cb05c2238229--

