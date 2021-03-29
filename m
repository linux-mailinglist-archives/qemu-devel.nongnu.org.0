Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A568534D52E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:33:25 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQupQ-0006ed-FH
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQuma-0005H5-2w
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:30:29 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lQumT-000467-OE
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:30:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z1so14922784edb.8
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6DDePH8GNSXZJyWtB92ehNzCh60HyFoOXyUe/mlN56E=;
 b=T6U1o8vRw7vTsphixZlg2Ofe1ncRBtW85EY065ekDUprwPZOFC1dRqca9wUXSvaISQ
 xmjO6csF93lOM1zDMZt0xb6j7PU0Dh65FCOvOJ3wXaFvGQ8/7VgCWtZ5ZvA3fccezs2b
 djdsT+h7N2xG9SJgIz2+FltC2TVEnEfNFyX5CR35hYDANDJqxwAvfHYcjeEiq7eaVDCu
 BZ8Bmcp619erp6uZf+dAEsHAyO9chfven6Hp/ALn+190m+cJwBk7afwfBBfzxW8l2J7z
 rozPC5yL16gKJmFfK2NCZFPa18Hlk/gspo82Forxj5Ql7fMZIh6vfWr6reKHw8QuI1pJ
 x61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6DDePH8GNSXZJyWtB92ehNzCh60HyFoOXyUe/mlN56E=;
 b=GyV76PwYVn9axUL1frW7YkdErrmGic+DthbteeEqIF65RMuzX4wbYupfe5A6O2Y2VR
 Ed97+AXzUuN47c/eQ1+vJ7JJGytf94fNHjxCbA9K4nF+94krD13RBsS4UBfACazesnU7
 upKBqhRk5PgmzyUIbqOgsC7y1EgadGj0f/HjEq8+mv+pgsDagxFNOCVNZ2svS6wST32d
 Iiz52/TfX/3+8tjYShxSoi+l3CzA8Z74jyMBVYn06DieojGziUXc6IDyCBwCy5qfgW6x
 bIyz8TMOnSTbjDdb7O84QPaEdoJfKDgKfhCBbzKZB5dB3tCXVdAvngRm3yACBx+vbaFy
 5fPQ==
X-Gm-Message-State: AOAM5336co+W+zgN2V39GuQvoZvJ7nmqilhuKlqfAKdzRP3JwzXLyh8r
 kGGAsAO4omELFZqvCefWdLstMzph/ZpSpxaqZFE=
X-Google-Smtp-Source: ABdhPJyfZlAnpyruXJjmz/lEP6zwcHwuYCMLahfFdlUa/m1NzjxB8MweF3FCuMgvZfEqp3axkyJOaKiowOx4LQX0Juo=
X-Received: by 2002:aa7:d642:: with SMTP id v2mr29757369edr.257.1617035420014; 
 Mon, 29 Mar 2021 09:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
 <CAFEAcA9FiNLr=CsxRLpUbMgROMBmO-8WoPtEkfL4b4+ZHrAhdA@mail.gmail.com>
 <CAJ+F1CJK450rAMA7VU2b7VFL0FK6f3mkR=kwPB+d5M4DozRHFg@mail.gmail.com>
 <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
In-Reply-To: <CAFEAcA_i-jx4PvDSqcZ12TWtJMzRoEBGO3tUbUJqU1voecksaw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 29 Mar 2021 20:30:08 +0400
Message-ID: <CAJ+F1C+uax+uUhR_dARx4kLAmc4-OgEMCh795+iW4yjm-1RPvw@mail.gmail.com>
Subject: Re: [PULL 00/10] For 6.0 patches
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cc9c8a05beaf65d7"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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

--000000000000cc9c8a05beaf65d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 29, 2021 at 7:56 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Mon, Mar 29, 2021 at 5:54 PM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >>
> >> This produces a backtrace from sphinx-build which nonetheless doesn't
> >> cause a build failure:
> >>
> >>
> >> Program sphinx-build found: YES
> >> ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> >> Configuration error:
> >> There is a programable error in your configuration file:
> >>
> >> Traceback (most recent call last):
> >>   File "conf.py", line 154, in <module>
> >>     import sphinx_rtd_theme
> >> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
> >>
> >> During handling of the above exception, another exception occurred:
> >>
> >> Traceback (most recent call last):
> >>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in
> __init__
> >>     execfile_(filename, config)
> >>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
> >> 150, in execfile_
> >>     exec_(code, _globals)
> >>   File "conf.py", line 157, in <module>
> >>     'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
> >> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme
> >> was not found.
> >>
> >
> >
> > ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
> > Configuration error:
> > The Sphinx 'sphinx_rtd_theme' HTML theme was not found.
> >
> > ../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python =
3
> version of python-sphinx and the readthedoc theme
>
>
> So why do you get that message, and I see the above? Older
> sphinx-build ?
>


It's strange, it's like ModuleNotFoundError was not catched by the "except
ImportError".

What's the version of python?


> Also, if this isn't fatal (the build does continue), meson
> shouldn't print ERROR here, ideally.
>

Something is again unexpected here.

If you have the meson error, it should stop the build there with an error.
And the error is only raised when docs is enabled.

For me it doesn't continue:
$ make
...
../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3
version of python-sphinx and the readthedoc theme

A full log can be found at
/home/elmarco/src/qemu/build/meson-logs/meson-log.txt
ninja: error: rebuilding 'build.ninja': subcommand failed
FAILED: build.ninja
/usr/bin/meson --internal regenerate /home/elmarco/src/qemu
/home/elmarco/src/qemu/build --backend ninja
make: *** [Makefile:152: run-ninja] Error 1



> >> Program python3 found: YES (/usr/bin/python3)
> >>
> >>
> >> In particular I see that on all the BSD VMs. If we're going to
> >> require rtd that means we need to ensure it's present on all
> >> the VM configs, docker configs, everything the CI uses, etc.
> >> You should also flag up new build-deps in the pullreq cover
> >> letter.
> >
> >
> > I updated all docker configs. We don't have sphinx in the BSD VMs
> apparently, am I wrong?
>
> We must do, because trying to build this merge in the VMs produces
> errors from sphinx-build...
>
>
I am trying to reproduce.. I tried with  vm-build-openbsd, but it reaches
console read timeout error... Now trying with freebsd (looking for a mirror
for iso, because 40kb/s atm for me)

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cc9c8a05beaf65d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 7:56 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, 29 Mar 2021 at 15:17, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Mon, Mar 29, 2021 at 5:54 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; This produces a backtrace from sphinx-build which nonetheless does=
n&#39;t<br>
&gt;&gt; cause a build failure:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Program sphinx-build found: YES<br>
&gt;&gt; ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:<br>
&gt;&gt; Configuration error:<br>
&gt;&gt; There is a programable error in your configuration file:<br>
&gt;&gt;<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;conf.py&quot;, line 154, in &lt;module&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0import sphinx_rtd_theme<br>
&gt;&gt; ModuleNotFoundError: No module named &#39;sphinx_rtd_theme&#39;<br=
>
&gt;&gt;<br>
&gt;&gt; During handling of the above exception, another exception occurred=
:<br>
&gt;&gt;<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3/dist-packages/sphinx/confi=
g.py&quot;, line 157, in __init__<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0execfile_(filename, config)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python3/dist-packages/sphinx/util/=
pycompat.py&quot;, line<br>
&gt;&gt; 150, in execfile_<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0exec_(code, _globals)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;conf.py&quot;, line 157, in &lt;module&gt;<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;The Sphinx \&#39;sphinx_rtd_theme\&#39; HT=
ML theme was not found.\n&#39;<br>
&gt;&gt; sphinx.errors.ConfigError: The Sphinx &#39;sphinx_rtd_theme&#39; H=
TML theme<br>
&gt;&gt; was not found.<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; ../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:<br>
&gt; Configuration error:<br>
&gt; The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme was not found.<br>
&gt;<br>
&gt; ../docs/meson.build:32:6: ERROR: Problem encountered: Install a Python=
 3 version of python-sphinx and the readthedoc theme<br>
<br>
<br>
So why do you get that message, and I see the above? Older<br>
sphinx-build ?<br></blockquote><div><br></div><div><br></div><div>It&#39;s =
strange, it&#39;s like ModuleNotFoundError was not catched by the &quot;exc=
ept ImportError&quot;.</div><div><br></div><div>What&#39;s the version of p=
ython?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Also, if this isn&#39;t fatal (the build does continue), meson<br>
shouldn&#39;t print ERROR here, ideally.<br></blockquote><div><br></div><di=
v>Something is again unexpected here.</div><div><br></div><div>If you have =
the meson error, it should stop the build there with an error. And the erro=
r is only raised when docs is enabled.</div><div><br></div><div>For me it d=
oesn&#39;t continue:</div><div>$ make <br></div><div>...<br></div><div>../d=
ocs/meson.build:32:6: ERROR: Problem encountered: Install a Python 3 versio=
n of python-sphinx and the readthedoc theme<br><br>A full log can be found =
at /home/elmarco/src/qemu/build/meson-logs/meson-log.txt<br>ninja: error: r=
ebuilding &#39;build.ninja&#39;: subcommand failed<br>FAILED: build.ninja <=
br>/usr/bin/meson --internal regenerate /home/elmarco/src/qemu /home/elmarc=
o/src/qemu/build --backend ninja<br>make: *** [Makefile:152: run-ninja] Err=
or 1</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt;&gt; Program python3 found: YES (/usr/bin/python3)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; In particular I see that on all the BSD VMs. If we&#39;re going to=
<br>
&gt;&gt; require rtd that means we need to ensure it&#39;s present on all<b=
r>
&gt;&gt; the VM configs, docker configs, everything the CI uses, etc.<br>
&gt;&gt; You should also flag up new build-deps in the pullreq cover<br>
&gt;&gt; letter.<br>
&gt;<br>
&gt;<br>
&gt; I updated all docker configs. We don&#39;t have sphinx in the BSD VMs =
apparently, am I wrong?<br>
<br>
We must do, because trying to build this merge in the VMs produces<br>
errors from sphinx-build...<br clear=3D"all"><br></blockquote><div><br></di=
v><div>I am trying to reproduce.. I tried with=C2=A0 vm-build-openbsd, but =
it reaches console read timeout error... Now trying with freebsd (looking f=
or a mirror for iso, because 40kb/s atm for me)<br></div></div><br>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div><=
/div>

--000000000000cc9c8a05beaf65d7--

