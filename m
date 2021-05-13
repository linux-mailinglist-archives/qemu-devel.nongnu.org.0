Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC437FB48
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:11:55 +0200 (CEST)
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhDwI-0008Oj-7k
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lhDoW-0005Hk-86
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:03:52 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lhDoT-0004vL-3c
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:03:51 -0400
Received: by mail-ed1-x529.google.com with SMTP id b17so31574819ede.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FCDP/9fMzsLtEt72BPVshkol/9VVywfV+9rh5TvK3mc=;
 b=RWgKAInyfipmyykjgtsO9QhCmhdIE72Xg7v2tqCls13iYRJt0o83ezNTDRNIZjhnKV
 FTnUuu/A/P0HshK+MMmeHnRP7w2S4ChfOIkZXsDddg36ORTyShyIsoXNRxwkPXx1wbuP
 c4FAJ/uRxvgupT9e+8gKqX3M+j2P8ANVQvAwZoFanZli+HpyyNDnqjJMd7+BVF9bq1ys
 cQraTDvY6et3TwBeap+uOU2TLMSm9C8voulPcGQDgWN35HU5eUG6wsV+4nX1BEMMe6E9
 lkxSm7XsrUe7yKfPDgbzpX/vPhUWWbGk2aTnWfuBokdfBLvdmAhzLWkThxRQN3zymutG
 WVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FCDP/9fMzsLtEt72BPVshkol/9VVywfV+9rh5TvK3mc=;
 b=g+j0svbvP47opQeYGvzzCGqZHvcr81ZUJtUqx+SVxpM3e7YJc66gLsbkKYjfTmyXMI
 rMY1I2OoPsfwbQAH/F2OcLK/DzTKDYFfj1WyRqzw7I0ZZALme6nGOqs5dztTJPFZHPXj
 zUeABJh8mvKAWY1U4Jdlbi/7tWQIRGqK6OvdTrINRbzThm2V71Ju2L7JLE8DXEWJK6Jh
 q8pCGjWf3PicSu1DASB+n3v7iGAKT7gb0JLJk9gqUFArkBMaMKKPalwIcnDqUj4O2jM8
 oeGCLlqHsFe+cTVt2l/gmzL3iwx/E4pz8zYJoRw4gavh0xj2ME3tWi0v6SioJrDKqIq2
 4DEg==
X-Gm-Message-State: AOAM531r7mq6XdZ20iMZ0+l06pQogJ4SWzgPojmMT+quUkNpmdnWRdSA
 gSvbibrqzUjpZmoojtlcYDxQ2UuXw9737cEzSgw=
X-Google-Smtp-Source: ABdhPJwEtq0wwmU+GP5DclwOBr8BMboCz4phXZY2hmQ77Kl5LRIkiaWVrh99gxiCgvoDNUhJmaNipwFm+5oc9UCvb5o=
X-Received: by 2002:a05:6402:378:: with SMTP id
 s24mr16439668edw.164.1620921823715; 
 Thu, 13 May 2021 09:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
 <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
 <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
In-Reply-To: <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 13 May 2021 20:03:31 +0400
Message-ID: <CAJ+F1C+V=x8=tcm0WhtFxS5P_4WjLNVXOVKEnvgWpmFDwom6-Q@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000082e39705c2384509"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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

--00000000000082e39705c2384509
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 13, 2021 at 5:45 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 12 May 2021 at 20:31, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > I should be able to deal with this by installing the rtd theme on
> > the host. I'll retry merging the pullreq.
>
> On try 2 I find that some of my machines warn:
>
> Program qemu-keymap found: NO
> Program sphinx-build found: YES
> ../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:
> Theme error:
> unsupported theme option 'style_nav_header_background' given
>
> Program python3 found: YES (/usr/bin/python3)
> Program diff found: YES
>
> It looks like this is because it's trying to use an option
> that's only present in newer versions of the theme. (Ubuntu
> bionic has version 0.2.4 of the rtd theme.)
>
> Is it possible to either avoid or conditionalize the use of
> this config setting?
>
>
This should work, can you check?:

diff --git a/docs/conf.py b/docs/conf.py
index 3802b70d62..9e3d7cee0e 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -29,6 +29,7 @@
 import os
 import sys
 import sphinx
+from packaging.version import parse as parse_version
 from sphinx.errors import ConfigError

 # Make Sphinx fail cleanly if using an old Python, rather than obscurely
@@ -162,7 +163,7 @@
 # Theme options are theme-specific and customize the look and feel of a
theme
 # further.  For a list of options available for each theme, see the
 # documentation.
-if html_theme =3D=3D 'sphinx_rtd_theme':
+if parse_version(sphinx_rtd_theme.__version__) >=3D parse_version('0.4.3')=
:
     html_theme_options =3D {
         "style_nav_header_background": "#802400",
     }

However, we agreed before to not have support fallbacks for missing deps.
Perhaps we should require rtd >=3D 0.4.3 instead?

thanks again!

--=20
Marc-Andr=C3=A9 Lureau

--00000000000082e39705c2384509
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 5:45 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 12 May 2021 at 20:31, Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
 wrote:<br>
&gt; I should be able to deal with this by installing the rtd theme on<br>
&gt; the host. I&#39;ll retry merging the pullreq.<br>
<br>
On try 2 I find that some of my machines warn:<br>
<br>
Program qemu-keymap found: NO<br>
Program sphinx-build found: YES<br>
../../docs/meson.build:30: WARNING: /usr/bin/sphinx-build:<br>
Theme error:<br>
unsupported theme option &#39;style_nav_header_background&#39; given<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Program python3 found: YES (/usr/bin/python3)<br>
Program diff found: YES<br>
<br>
It looks like this is because it&#39;s trying to use an option<br>
that&#39;s only present in newer versions of the theme. (Ubuntu<br>
bionic has version 0.2.4 of the rtd theme.)<br>
<br>
Is it possible to either avoid or conditionalize the use of<br>
this config setting?<br>
<br></blockquote><div><br></div><div>This should work, can you check?:<br><=
/div><div><br></div>diff --git a/docs/conf.py b/docs/conf.py<br>index 3802b=
70d62..9e3d7cee0e 100644<br>--- a/docs/conf.py<br>+++ b/docs/conf.py<br>@@ =
-29,6 +29,7 @@<br>=C2=A0import os<br>=C2=A0import sys<br>=C2=A0import sphin=
x<br>+from packaging.version import parse as parse_version<br>=C2=A0from sp=
hinx.errors import ConfigError<br>=C2=A0<br>=C2=A0# Make Sphinx fail cleanl=
y if using an old Python, rather than obscurely<br>@@ -162,7 +163,7 @@<br>=
=C2=A0# Theme options are theme-specific and customize the look and feel of=
 a theme<br>=C2=A0# further.=C2=A0 For a list of options available for each=
 theme, see the<br>=C2=A0# documentation.<br>-if html_theme =3D=3D &#39;sph=
inx_rtd_theme&#39;:<br>+if parse_version(sphinx_rtd_theme.__version__) &gt;=
=3D parse_version(&#39;0.4.3&#39;):<br>=C2=A0 =C2=A0 =C2=A0html_theme_optio=
ns =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;style_nav_header_backgr=
ound&quot;: &quot;#802400&quot;,<br>=C2=A0 =C2=A0 =C2=A0}<br></div><div><br=
></div><div>However, we agreed before to not have support fallbacks for mis=
sing deps. Perhaps we should require rtd &gt;=3D 0.4.3 instead?</div><div><=
br></div><div>thanks again!<br></div><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000082e39705c2384509--

