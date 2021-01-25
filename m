Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B5302BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:33:11 +0100 (CET)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47bq-0001VY-EL
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l47ac-0000ri-2B
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:31:54 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l47aZ-0002uw-KR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:31:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s11so16922799edd.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=igGPYyTKGI0d1IcMZbbDd+5WkSHWgDiTUHLbfOKIMYU=;
 b=oorJwYZHZO/7rqs5jxgb4uOOb6AQlnYs4sUXTPoQi+NEQjzmC6smj5RXuEu+qOaYMw
 sst/wI05sMNbz+9CdjG7CFY7U4HFGhnLxkpfBCY8QboBGGoAHM+zDjNoiv7N8lt+1r09
 eJLNv1qQDluIGFRPuGhMbcJDLBuLatp/Wopo+F7riSg7GI5Vi+wTKJo4b6KR/zONbnMY
 eoczWf2c7IMWQT2iA7DdhBJ7VvoThuvZ1BTBtwTQ1rrVf1LE+49smvz8lSUG4ZpohyLZ
 g5zU4jn3gEiv9dWPv2Q4GtHGPejsmeWDeH7781g8KJFq/+Bssfp1TBvcxAh446tkqq2i
 VdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=igGPYyTKGI0d1IcMZbbDd+5WkSHWgDiTUHLbfOKIMYU=;
 b=uUReUxLHXnBIJh+X4O7/vRxY/8/qxc5KXMkQkuIqWGaKkY1GFSS7WQwW1Zw3c267zu
 KjtxoDDhuEkeNWsILOPe6Hw1mIwgzJhXS1AY2gFceMUhFb7wQuNN1k3yKGNuJa6UsYFM
 H6x748zHlussEZWAVZWm4TQIB+EkA+fDS8q69k+g8ujQkkOIKJ+7lqjMX+mQF66fAITi
 DkFH+qra8akbTQVXYy+9yoxUCLpVMI69brCH1nqwAXFbCspWtQ+gPBr+bMO05zvT/JgR
 cVLbL0AqvsXtJVc6byJTVWRQgS5S9Ri9uRoJGzK9WypdxXv0wynf/6vlHFCUGUIK6iPg
 Nruw==
X-Gm-Message-State: AOAM531hfD2ZxFtDGJOwCtmzSza/goouILI6qizJ3FgObJPtq5rHKAhb
 4onIWC2vjhK9yAeO3jv3ehSOUyA+YzWDZIo/4eg=
X-Google-Smtp-Source: ABdhPJwLWY2RJqQUa+B5T40FPoFrzvYUWXAam6YImncpkPG/dcFM0nNlRPJVIdfVnri1n27FdTMM1UKQJ5dsJBxzJJA=
X-Received: by 2002:a05:6402:1682:: with SMTP id
 a2mr1865490edv.30.1611603109256; 
 Mon, 25 Jan 2021 11:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20210120102556.125012-1-marcandre.lureau@redhat.com>
 <26032f17-cfbc-1e86-1ca1-10661d4f5cbb@redhat.com>
 <CAJ+F1CKKh7Ap-4TE+Wtc584HEEOKaGFva5SYa9B-bBPUFwqfPg@mail.gmail.com>
 <7ffcb025-56ca-377d-d08b-d06b900c2fee@redhat.com>
In-Reply-To: <7ffcb025-56ca-377d-d08b-d06b900c2fee@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 25 Jan 2021 23:31:37 +0400
Message-ID: <CAJ+F1CK+5QOuUc_0R-7Cqf86K5i5t-Q9kS5ROBkQJZeODc3bLQ@mail.gmail.com>
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, bmeng.cn@gmail.com,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Jan 25, 2021 at 8:47 PM John Snow <jsnow@redhat.com> wrote:
>
> On 1/24/21 1:19 PM, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Jan 22, 2021 at 12:59 AM John Snow <jsnow@redhat.com> wrote:
> >>
> >> On 1/20/21 5:25 AM, marcandre.lureau@redhat.com wrote:
> >>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>
> >>> The default "alabaster" sphinx theme has a couple shortcomings:
> >>> - the navbar moves along the page
> >>> - the search bar is not always at the same place
> >>> - it lacks some contrast and colours
> >>>
> >>> The "rtd" theme from readthedocs.org is a popular third party theme u=
sed
> >>> notably by the kernel, with a custom style sheet. I like it better,
> >>> perhaps others do too. It also simplify "Edit on Gitlab" links.
> >>>
> >>> Tweak a bit the custom theme to match qemu.org style, use the
> >>> QEMU logo, and favicon etc.
> >>>
> >>> Screenshot:
> >>> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-docu=
mentation-QEMU-documentation.png
> >>>
> >>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>> ---
> >>>    docs/_templates/editpage.html              |   5 -
> >>>    docs/conf.py                               |  47 +++---
> >>>    docs/devel/_templates/editpage.html        |   5 -
> >>>    docs/interop/_templates/editpage.html      |   5 -
> >>>    docs/specs/_templates/editpage.html        |   5 -
> >>>    docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++=
++++
> >>>    docs/system/_templates/editpage.html       |   5 -
> >>>    docs/tools/_templates/editpage.html        |   5 -
> >>>    docs/user/_templates/editpage.html         |   5 -
> >>>    tests/docker/dockerfiles/debian10.docker   |   1 +
> >>>    tests/docker/dockerfiles/fedora.docker     |   1 +
> >>>    tests/docker/dockerfiles/ubuntu.docker     |   1 +
> >>>    tests/docker/dockerfiles/ubuntu1804.docker |   1 +
> >>>    tests/docker/dockerfiles/ubuntu2004.docker |   1 +
> >>>    14 files changed, 193 insertions(+), 55 deletions(-)
> >>>    delete mode 100644 docs/_templates/editpage.html
> >>>    delete mode 100644 docs/devel/_templates/editpage.html
> >>>    delete mode 100644 docs/interop/_templates/editpage.html
> >>>    delete mode 100644 docs/specs/_templates/editpage.html
> >>>    create mode 100644 docs/sphinx-static/theme_overrides.css
> >>>    delete mode 100644 docs/system/_templates/editpage.html
> >>>    delete mode 100644 docs/tools/_templates/editpage.html
> >>>    delete mode 100644 docs/user/_templates/editpage.html
> >>>
> >>> diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage=
.html
> >>> deleted file mode 100644
> >>> index 4319b0f5ac..0000000000
> >>> --- a/docs/_templates/editpage.html
> >>> +++ /dev/null
> >>> @@ -1,5 +0,0 @@
> >>> -<div id=3D"editpage">
> >>> -  <ul>
> >>> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/maste=
r/docs/{{pagename}}.rst">Page source</a></li>
> >>> -  </ul>
> >>> -</div>
> >>> diff --git a/docs/conf.py b/docs/conf.py
> >>> index 2ee6111872..5ee577750b 100644
> >>> --- a/docs/conf.py
> >>> +++ b/docs/conf.py
> >>> @@ -151,37 +151,44 @@ with open(os.path.join(qemu_docdir, 'defs.rst.i=
nc')) as f:
> >>>    # a list of builtin themes.
> >>>    #
> >>>    html_theme =3D 'alabaster'
> >>> +try:
> >>> +    import sphinx_rtd_theme
> >>> +    html_theme =3D 'sphinx_rtd_theme'
> >>> +except ImportError:
> >>> +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML =
theme was not found. Make sure you have the theme installed to produce pret=
ty HTML output. Falling back to the default theme.\n')
> >>>
> >>>    # Theme options are theme-specific and customize the look and feel=
 of a theme
> >>>    # further.  For a list of options available for each theme, see th=
e
> >>>    # documentation.
> >>> -# We initialize this to empty here, so the per-manual conf.py can ju=
st
> >>> -# add individual key/value entries.
> >>> -html_theme_options =3D {
> >>> -}
> >>> +if html_theme =3D=3D 'sphinx_rtd_theme':
> >>> +    html_theme_options =3D {
> >>> +        "style_nav_header_background": "#802400",
> >>> +    }
> >>> +
> >>
> >> This needs a default for html_theme_options so that if sphinx_rtd_them=
e
> >> isn't present, the build doesn't break when using the fallback to
> >> alabaster; I'm seeing:
> >>
> >> Traceback (most recent call last):
> >>     File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361=
,
> >> in eval_config_file
> >>       execfile_(filename, namespace)
> >>     File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", l=
ine
> >> 81, in execfile_
> >>       exec(code, _globals)
> >>     File "/home/jsnow/src/qemu/docs/user/conf.py", line 15, in <module=
>
> >>       html_theme_options['description'] =3D u'User Mode Emulation User=
''s
> >> Guide'
> >> NameError: name 'html_theme_options' is not defined
> >>
> >
> > Ok, I don't get that error with sphinx 3.2.1 on fc33...
> >
>
> Just in case it helps you:
>
> - FC33
> - Sphinx 3.4.3
> - alabaster 0.7.12
> - Python 3.9.1 (3.9.1-1.fc33)
>
> Hopefully we can just switch over to RTD theme and ignore the fallback,
> but you'll probably need to come up with a test matrix for sphinx
> versions and RTD theme versions and ensure that it works on our
> supported distro list.
>
> Variables:
> - Python versions (3.6 through 3.9)
> - Sphinx versions (?? through 3.4.3)
> - sphinx-rtd-theme vesrions (?? through 0.5.1)

Well it depends if we consider the sphinx documentation as a
first-class product that must build on all the systems we support.
When sphinx dependency was added, I don't think we did a thorough
check on where it was available and ensuring it builds properly on all
those systems. It's a bit unfair to ask that now just for the
rtd-theme.

That patch already checks debian/fedora/ubuntu (all the dockerfiles
where python-sphinx was installed already)

(quoting myself from earlier)
Peter (and others), do you have an opinion about whether we should
support the fallback/default theme?

Given that RTD is the kernel theme, it seems widely available:
https://repology.org/project/python:sphinx-rtd-theme/versions.

I can update the patch to check if the sphinx_rtd_theme module is
present, and error during configure time.

thanks

