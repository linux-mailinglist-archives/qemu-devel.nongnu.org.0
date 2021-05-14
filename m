Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C43804CE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 10:02:55 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhSmc-0001OF-7k
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 04:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lhSkv-0000fI-72
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:01:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lhSkr-0001Sd-Od
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:01:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l7so33789259edb.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 01:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UZ5x102c0IdzTXLgkzsuoLq5tqIbYaKS+Of8gNc0XTg=;
 b=Ug0kWhLL+foonQ9bP4ZtB1IG50SKfCzN8UJc24doB37WKp/8wDf8Yeni7lKKPMWF9K
 GOGk7786wNJUD6d17fl1FEKaU4GuURch7ysXCrPevb4jRiVbQBABsRdo6HCu+nLCVmpE
 ArGTP0q/aO95GwyHJfKtMPo7/kAh0VCuLfBBQEQu16U7bc3qIAopqewXF7f9fqgYFWUp
 pT3FgdXHeVmfBr13J49KGJWx8pFsG+TlPdmURzQxQnkEDciS5MnvCi5VPN9LTuyz2E3e
 HpjnzqxzGQsS1zLWHklIEbV7yq04whk4cQhFIg+El+c2cofVCLhkk8pddayODksmsBtP
 mogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UZ5x102c0IdzTXLgkzsuoLq5tqIbYaKS+Of8gNc0XTg=;
 b=eYqaj3JZsMWKgMz7Fl9EndwioD/F2rSc9XDJubcLu/EHhPvbHlt8kiCC/04I2gAsps
 vwcrDq9cs22ZlPZMVI7+eQ9OlT9GAmKbzManggE/1K3KBMfcQfKnp5LxMevrHDLAloqf
 U1MQxb0h/z6niciDkRMZCzdVGdCPxtekSGQ1tg3a4eL8OJ6VXDDoD9+Me7EHCRCHjBtF
 rMiA00BoxFZiuRP3kaOBFwzvxccjnO8Q4e40ytmOOVHmK4U553P7nl/d0uyEaiy/Yzt2
 9mE6tL6FhWl6hSHn38u6LKeTaHm6Ysy4GTW917ha9ICZDMce6SJukAYN1aP4KgfHv6vy
 mZBw==
X-Gm-Message-State: AOAM533/bFkLZljdAcHsGTweXfWlPYxhvMjP0WoLNzaJxw8j7T93nnY0
 yGxePfzd1gSRQg4+ASNIpO63L9ghQi7dCpa8cFk=
X-Google-Smtp-Source: ABdhPJzUnBPmYM0qzBtdPgoSGNOwL1EGuC2tLT0zumjk/YwIEgH8JTthXtD93DL3PURj7Q3OdOL02cG6Y95MV2DWCeM=
X-Received: by 2002:a50:eb89:: with SMTP id y9mr2670345edr.257.1620979263967; 
 Fri, 14 May 2021 01:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
 <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
 <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
 <CAJ+F1C+V=x8=tcm0WhtFxS5P_4WjLNVXOVKEnvgWpmFDwom6-Q@mail.gmail.com>
 <CAFEAcA_BTwg2KyyfsG8Q2_FFzKuYN+5J0X85OBpN-x=-5PFANw@mail.gmail.com>
In-Reply-To: <CAFEAcA_BTwg2KyyfsG8Q2_FFzKuYN+5J0X85OBpN-x=-5PFANw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 14 May 2021 12:00:52 +0400
Message-ID: <CAJ+F1CLeNCe_Z3kFJo8j-OU14RnDQesiqF_3mCuYCd1Xtn7Tdw@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000037945105c245a5e8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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

--00000000000037945105c245a5e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 9:17 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 13 May 2021 at 17:03, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > This should work, can you check?:
> >
> > diff --git a/docs/conf.py b/docs/conf.py
> > index 3802b70d62..9e3d7cee0e 100644
> > --- a/docs/conf.py
> > +++ b/docs/conf.py
> > @@ -29,6 +29,7 @@
> >  import os
> >  import sys
> >  import sphinx
> > +from packaging.version import parse as parse_version
> >  from sphinx.errors import ConfigError
> >
> >  # Make Sphinx fail cleanly if using an old Python, rather than obscure=
ly
> > @@ -162,7 +163,7 @@
> >  # Theme options are theme-specific and customize the look and feel of =
a
> theme
> >  # further.  For a list of options available for each theme, see the
> >  # documentation.
> > -if html_theme =3D=3D 'sphinx_rtd_theme':
> > +if parse_version(sphinx_rtd_theme.__version__) >=3D
> parse_version('0.4.3'):
> >      html_theme_options =3D {
> >          "style_nav_header_background": "#802400",
> >      }
>
> This fails:
>
> ../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> Configuration error:
> There is a programable error in your configuration file:
>
> Traceback (most recent call last):
>   File "/usr/lib/python3/dist-packages/sphinx/config.py", line 157, in
> __init__
>     execfile_(filename, config)
>   File "/usr/lib/python3/dist-packages/sphinx/util/pycompat.py", line
> 150, in execfile_
>     exec_(code, _globals)
>   File "conf.py", line 32, in <module>
>     from packaging.version import parse as parse_version
> ModuleNotFoundError: No module named 'packaging'
>
>
>
According to SO (
https://stackoverflow.com/questions/11887762/how-do-i-compare-version-numbe=
rs-in-python)
there is a second built-in option to compare versions.

diff --git a/docs/conf.py b/docs/conf.py
index 3802b70d62..00cf66ab54 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -29,6 +29,7 @@
 import os
 import sys
 import sphinx
+from distutils.version import LooseVersion
 from sphinx.errors import ConfigError

 # Make Sphinx fail cleanly if using an old Python, rather than obscurely
@@ -162,7 +163,7 @@
 # Theme options are theme-specific and customize the look and feel of a
theme
 # further.  For a list of options available for each theme, see the
 # documentation.
-if html_theme =3D=3D 'sphinx_rtd_theme':
+if LooseVersion(sphinx_rtd_theme.__version__) >=3D LooseVersion("0.4.3"):
     html_theme_options =3D {
         "style_nav_header_background": "#802400",
     }


Let me know if you want a new PR.


>
> > However, we agreed before to not have support fallbacks for missing
> deps. Perhaps we should require rtd >=3D 0.4.3 instead?
>
> That would prevent the docs from building on too many platforms,
> I think. 0.4.3 was only released upstream in Feb 2019.
>
>
Ok

--=20
Marc-Andr=C3=A9 Lureau

--00000000000037945105c245a5e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 9:17 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, 13 May 2021 at 17:03, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt; This should work, can you check?:<br>
&gt;<br>
&gt; diff --git a/docs/conf.py b/docs/conf.py<br>
&gt; index 3802b70d62..9e3d7cee0e 100644<br>
&gt; --- a/docs/conf.py<br>
&gt; +++ b/docs/conf.py<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import sys<br>
&gt;=C2=A0 import sphinx<br>
&gt; +from packaging.version import parse as parse_version<br>
&gt;=C2=A0 from sphinx.errors import ConfigError<br>
&gt;<br>
&gt;=C2=A0 # Make Sphinx fail cleanly if using an old Python, rather than o=
bscurely<br>
&gt; @@ -162,7 +163,7 @@<br>
&gt;=C2=A0 # Theme options are theme-specific and customize the look and fe=
el of a theme<br>
&gt;=C2=A0 # further.=C2=A0 For a list of options available for each theme,=
 see the<br>
&gt;=C2=A0 # documentation.<br>
&gt; -if html_theme =3D=3D &#39;sphinx_rtd_theme&#39;:<br>
&gt; +if parse_version(sphinx_rtd_theme.__version__) &gt;=3D parse_version(=
&#39;0.4.3&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 html_theme_options =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;style_nav_header_background&qu=
ot;: &quot;#802400&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This fails:<br>
<br>
../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:<br>
Configuration error:<br>
There is a programable error in your configuration file:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/lib/python3/dist-packages/sphinx/config.py&quot;, li=
ne 157, in __init__<br>
=C2=A0 =C2=A0 execfile_(filename, config)<br>
=C2=A0 File &quot;/usr/lib/python3/dist-packages/sphinx/util/pycompat.py&qu=
ot;, line<br>
150, in execfile_<br>
=C2=A0 =C2=A0 exec_(code, _globals)<br>
=C2=A0 File &quot;conf.py&quot;, line 32, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from packaging.version import parse as parse_version<br>
ModuleNotFoundError: No module named &#39;packaging&#39;<br>
<br>
<br></blockquote><div><br></div><div>According to SO (<a href=3D"https://st=
ackoverflow.com/questions/11887762/how-do-i-compare-version-numbers-in-pyth=
on">https://stackoverflow.com/questions/11887762/how-do-i-compare-version-n=
umbers-in-python</a>) there is a second built-in option to compare versions=
.</div><div><br></div><div>diff --git a/docs/conf.py b/docs/conf.py<br>inde=
x 3802b70d62..00cf66ab54 100644<br>--- a/docs/conf.py<br>+++ b/docs/conf.py=
<br>@@ -29,6 +29,7 @@<br>=C2=A0import os<br>=C2=A0import sys<br>=C2=A0impor=
t sphinx<br>+from distutils.version import LooseVersion<br>=C2=A0from sphin=
x.errors import ConfigError<br>=C2=A0<br>=C2=A0# Make Sphinx fail cleanly i=
f using an old Python, rather than obscurely<br>@@ -162,7 +163,7 @@<br>=C2=
=A0# Theme options are theme-specific and customize the look and feel of a =
theme<br>=C2=A0# further.=C2=A0 For a list of options available for each th=
eme, see the<br>=C2=A0# documentation.<br>-if html_theme =3D=3D &#39;sphinx=
_rtd_theme&#39;:<br>+if LooseVersion(sphinx_rtd_theme.__version__) &gt;=3D =
LooseVersion(&quot;0.4.3&quot;):<br>=C2=A0 =C2=A0 =C2=A0html_theme_options =
=3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;style_nav_header_backgroun=
d&quot;: &quot;#802400&quot;,<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0</div><div>=
<div><br></div><div>Let me know if you want a new PR.<br></div><div><br></d=
iv></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; However, we agreed before to not have support fallbacks for missing de=
ps. Perhaps we should require rtd &gt;=3D 0.4.3 instead?<br>
<br>
That would prevent the docs from building on too many platforms,<br>
I think. 0.4.3 was only released upstream in Feb 2019.<br clear=3D"all"><br=
></blockquote><div><br></div><div>Ok <br></div></div><br>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000037945105c245a5e8--

