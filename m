Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5434D242
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:18:30 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQsiq-0008LE-S7
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQshf-0007sJ-2o
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:17:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQshd-00009V-1i
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:17:14 -0400
Received: by mail-ed1-x52a.google.com with SMTP id w18so14501381edc.0
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=khBfSoiP07rxsriYEWbezpvjGpbJCcBSnxoytsf5Ysw=;
 b=TVlgw58kkYXL6l/qpcU6YfvZOczDOkzIWLDHo3eRvva60nDw8gydp1Q5jhE2ZC0zlJ
 PxIlPdP6fCEenpdSRCzIIDUKnt52jnvIlW7NfFavqpW6Wus5Z0oNRnOfgcKDu86bzJ0I
 6jVSzsV9bB1d0kWIYY/U6zYRgSkmvS/+/BV3QvwO7XVMKAIjs8wUoZx3gkYpWpqWb2QT
 hk/XCQjNZxcUNTo0Gk6NqZkMGzqA6ChisS9nVZcXRjTmuR18vdbQ6fKfgYLyrtdzaGRf
 gqoSybrX0fKebtFMeogsIlFQqZq8yJtsHZW6muZIEnW8a4mgDXK202okz2K229/+kGwz
 FRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=khBfSoiP07rxsriYEWbezpvjGpbJCcBSnxoytsf5Ysw=;
 b=jDdST+QfMbQLKtS2lMCCcwkhcNUDV2xXHQZRBqHvFmdHrXkCDPtbLVeUKSG2hz97+O
 jerhk8k5OAMhvTqIIMPylGYfbaTWBWUMAooHJVbelMGZPvHbTpRgnuQbf0A9MAoggWic
 MjfVEKmPmDAoVmv8g1WIruihCvzunjkr+5k0NjKB3o0V5J0adjgUu8qJpo2Op+152FKg
 TSvgkFn0/bG6JWDxFSMRtBaV5Sznn9wNodHJL0hddQgyA366TBiTXdAXjGhq1iSfIQ/S
 lfP2RzHSe3Ds54cS4F1iyAPbhE6McFI3rgFa2BpxHfrRz1HfL9om8tJbgmkdzirErX5e
 40qQ==
X-Gm-Message-State: AOAM5333zJgewUIuM9JjCDxM2V2F68/j5xCi9eglA9mFLbu9nhIpAn/a
 eYoS+5SV7IEJ9g2TS2SkWlqUZGzp9W6UDrCAKRw=
X-Google-Smtp-Source: ABdhPJwWIUZykewWBJlhpdiYbdlEhmybKvemUuNXVnKy+YmZjdC1FT6k7jt0O3GXcSKHvfB+gv63xRKNdamQuvDW0r8=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr29541318edy.30.1617027430780; 
 Mon, 29 Mar 2021 07:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
In-Reply-To: <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 29 Mar 2021 18:16:59 +0400
Message-ID: <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000009a906c05bead896a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

--0000000000009a906c05bead896a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 29, 2021 at 5:54 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 28 Mar 2021 at 19:45, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following changes since commit
> 7b9a3c9f94bcac23c534bc9f42a9e914b433b299:
> >
> >   Merge remote-tracking branch
> 'remotes/kraxel/tags/fixes-20210326-pull-request' into staging (2021-03-2=
6
> 12:58:58 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull-request
> >
> > for you to fetch changes up to f57d44b452e11d8b7c9743476c30a8d0f80926de=
:
> >
> >   tests: Add tests for yank with the chardev-change case (2021-03-27
> 13:57:40 +0400)
> >
> > ----------------------------------------------------------------
> > For 6.0 misc patches under my radar.
> >
> > Peter, let me know if you would rather split that PR.
> >
> > ----------------------------------------------------------------
>
> This produces a backtrace from sphinx-build which nonetheless doesn't
> cause a build failure:
>
>
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

../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
The Sphinx 'sphinx_rtd_theme' HTML theme was not found.

../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3
version of python-sphinx and the readthedoc theme

It's only fatal if you explicitely enabled docs. Otherwise, it just prints
a warning and disable it (just like sphinx 3.6 version requirement).


>
>
> Program python3 found: YES (/usr/bin/python3)
>
>
> In particular I see that on all the BSD VMs. If we're going to
> require rtd that means we need to ensure it's present on all
> the VM configs, docker configs, everything the CI uses, etc.
> You should also flag up new build-deps in the pullreq cover
> letter.
>

I updated all docker configs. We don't have sphinx in the BSD VMs
apparently, am I wrong?


> I dunno if we can get the error message neater (I know sphinx-build,
> especially older versions, is a bit unhelpful about what it lets us
> report.)
>
> The test-yank stuff also failed on OSX:
>
> Unexpected error in inet_connect_addr() at ../../util/qemu-sockets.c:380:
> Failed to connect to '127.0.0.1:63820': Operation timed out
> ERROR test-yank - too few tests run (expected 6, got 1)
>
>
Lukas, can you have a look too?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009a906c05bead896a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 5:54 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Sun, 28 Mar 2021 at 19:45, &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The following changes since commit 7b9a3c9f94bcac23c534bc9f42a9e914b43=
3b299:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/kraxel/tags/fixe=
s-20210326-pull-request&#39; into staging (2021-03-26 12:58:58 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull=
-request<br>
&gt;<br>
&gt; for you to fetch changes up to f57d44b452e11d8b7c9743476c30a8d0f80926d=
e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0tests: Add tests for yank with the chardev-change case (20=
21-03-27 13:57:40 +0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; For 6.0 misc patches under my radar.<br>
&gt;<br>
&gt; Peter, let me know if you would rather split that PR.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
This produces a backtrace from sphinx-build which nonetheless doesn&#39;t<b=
r>
cause a build failure:<br>
<br>
<br>
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
<br></blockquote><div><br></div><div><br></div><div>../docs/meson.build:30:=
 WARNING: /usr/bin/sphinx-build-3: <br>Configuration error:<br>The Sphinx &=
#39;sphinx_rtd_theme&#39; HTML theme was not found.<br><br>../docs/meson.bu=
ild:32:6: ERROR: Problem encountered: Install a Python 3 version of python-=
sphinx and the readthedoc theme<br></div><div><br></div><div>It&#39;s only =
fatal if you explicitely enabled docs. Otherwise, it just prints a warning =
and disable it (just like sphinx 3.6 version requirement).<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Program python3 found: YES (/usr/bin/python3)<br>
<br>
<br>
In particular I see that on all the BSD VMs. If we&#39;re going to<br>
require rtd that means we need to ensure it&#39;s present on all<br>
the VM configs, docker configs, everything the CI uses, etc.<br>
You should also flag up new build-deps in the pullreq cover<br>
letter.<br></blockquote><div><br></div><div>I updated all docker configs. W=
e don&#39;t have sphinx in the BSD VMs apparently, am I wrong?<br></div><di=
v> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I dunno if we can get the error message neater (I know sphinx-build,<br>
especially older versions, is a bit unhelpful about what it lets us<br>
report.)<br>
<br>
The test-yank stuff also failed on OSX:<br>
<br>
Unexpected error in inet_connect_addr() at ../../util/qemu-sockets.c:380:<b=
r>
Failed to connect to &#39;<a href=3D"http://127.0.0.1:63820" rel=3D"norefer=
rer" target=3D"_blank">127.0.0.1:63820</a>&#39;: Operation timed out<br>
ERROR test-yank - too few tests run (expected 6, got 1)<br><br></blockquote=
><div><br></div><div>Lukas, can you have a look too?</div><div><br> </div><=
div>thanks</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009a906c05bead896a--

