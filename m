Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9C301E18
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 19:21:45 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3k1A-0000qR-Ig
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 13:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l3jzJ-0000Jx-6P
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:19:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l3jzE-00068I-A7
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 13:19:48 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b21so12566244edy.6
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UTPI0rjpasZTBTvn8SOvm/YQHPW6FRwu/xA6pGRgBIU=;
 b=V4Cx8Ug8LGAikCXFSRbDLS+a4Fyptjvo5wxL6Qxm8ZH+Ezhntf/rQ4z8mS9SPauAsY
 7gzxIOzF9svwo1LD0RyvXMJ9rAAslwHhhGXd7lvD+B7Qptez/LM/GQVYc400+JP3+5Zi
 ZM2DI3HJTjhQxLSRBeM5dRv6kjx52zvdT74vUXeHs4liNs2YBNvTGuK577z/dnjKnwhi
 skmseJn0WY88S+lfBFtsgW0xwLUjlyaHdnxpkqkQ1OtTTSF11BqHP90ojobuLtrHzbvk
 BANC5aZNCNG4x6+M49yQwG1w8iVYur/ghNqul+2jY0nIQ8CKeKilUoHCzlDKk/hQzk1r
 slVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UTPI0rjpasZTBTvn8SOvm/YQHPW6FRwu/xA6pGRgBIU=;
 b=q6nPIskkE9t/cXNoQkL71Qka3kPnaMvsKGqNcitN2hutTic8vGQtaWQ6OPxeMzfjZN
 fCTADrw5du5tuOO5kPwZonXsYDju8E6/YwM+VSd0awFlafTtLbDuQZuRYX7EIf5KRYQy
 NAB+j2aEWcTAoUyCxKzwYQplqjBJPWU71NmstWTkQme2Q3jla1D1g4dEgiScOlxXTvav
 Q379nVXcz8hJhReDIILDXmvN6N17DZTltmiHLMYn+5T6bvuyCRddq1Sz7JM37iX9g+t+
 jCAJW59oHW53MZrphds6nWbubPMNED8TrJ60AfnxguAqs56xCXdM3D4tKqY6fmVdB57u
 Ws3w==
X-Gm-Message-State: AOAM530UUOH/IQPIbLWL1rRaNfLSP5mAxqyN0SD0wmnmc6RKItN2iY/i
 P7OpsLnVQsZnitHn3XGvLb2mxIMef67U5rWkiEg=
X-Google-Smtp-Source: ABdhPJwNiL2eeGFnA53e9tXP9vbxSUCUvei9ygTpShMnMtYJprv59bezRopJnim8x1PWEe/VTtYuLmxYD1K19oB0FFo=
X-Received: by 2002:a05:6402:18f:: with SMTP id
 r15mr1941013edv.53.1611512381674; 
 Sun, 24 Jan 2021 10:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20210120102556.125012-1-marcandre.lureau@redhat.com>
 <26032f17-cfbc-1e86-1ca1-10661d4f5cbb@redhat.com>
In-Reply-To: <26032f17-cfbc-1e86-1ca1-10661d4f5cbb@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 24 Jan 2021 22:19:30 +0400
Message-ID: <CAJ+F1CKKh7Ap-4TE+Wtc584HEEOKaGFva5SYa9B-bBPUFwqfPg@mail.gmail.com>
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Daniel P. Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jan 22, 2021 at 12:59 AM John Snow <jsnow@redhat.com> wrote:
>
> On 1/20/21 5:25 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The default "alabaster" sphinx theme has a couple shortcomings:
> > - the navbar moves along the page
> > - the search bar is not always at the same place
> > - it lacks some contrast and colours
> >
> > The "rtd" theme from readthedocs.org is a popular third party theme use=
d
> > notably by the kernel, with a custom style sheet. I like it better,
> > perhaps others do too. It also simplify "Edit on Gitlab" links.
> >
> > Tweak a bit the custom theme to match qemu.org style, use the
> > QEMU logo, and favicon etc.
> >
> > Screenshot:
> > https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-docume=
ntation-QEMU-documentation.png
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   docs/_templates/editpage.html              |   5 -
> >   docs/conf.py                               |  47 +++---
> >   docs/devel/_templates/editpage.html        |   5 -
> >   docs/interop/_templates/editpage.html      |   5 -
> >   docs/specs/_templates/editpage.html        |   5 -
> >   docs/sphinx-static/theme_overrides.css     | 161 ++++++++++++++++++++=
+
> >   docs/system/_templates/editpage.html       |   5 -
> >   docs/tools/_templates/editpage.html        |   5 -
> >   docs/user/_templates/editpage.html         |   5 -
> >   tests/docker/dockerfiles/debian10.docker   |   1 +
> >   tests/docker/dockerfiles/fedora.docker     |   1 +
> >   tests/docker/dockerfiles/ubuntu.docker     |   1 +
> >   tests/docker/dockerfiles/ubuntu1804.docker |   1 +
> >   tests/docker/dockerfiles/ubuntu2004.docker |   1 +
> >   14 files changed, 193 insertions(+), 55 deletions(-)
> >   delete mode 100644 docs/_templates/editpage.html
> >   delete mode 100644 docs/devel/_templates/editpage.html
> >   delete mode 100644 docs/interop/_templates/editpage.html
> >   delete mode 100644 docs/specs/_templates/editpage.html
> >   create mode 100644 docs/sphinx-static/theme_overrides.css
> >   delete mode 100644 docs/system/_templates/editpage.html
> >   delete mode 100644 docs/tools/_templates/editpage.html
> >   delete mode 100644 docs/user/_templates/editpage.html
> >
> > diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.h=
tml
> > deleted file mode 100644
> > index 4319b0f5ac..0000000000
> > --- a/docs/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/conf.py b/docs/conf.py
> > index 2ee6111872..5ee577750b 100644
> > --- a/docs/conf.py
> > +++ b/docs/conf.py
> > @@ -151,37 +151,44 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc=
')) as f:
> >   # a list of builtin themes.
> >   #
> >   html_theme =3D 'alabaster'
> > +try:
> > +    import sphinx_rtd_theme
> > +    html_theme =3D 'sphinx_rtd_theme'
> > +except ImportError:
> > +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML th=
eme was not found. Make sure you have the theme installed to produce pretty=
 HTML output. Falling back to the default theme.\n')
> >
> >   # Theme options are theme-specific and customize the look and feel of=
 a theme
> >   # further.  For a list of options available for each theme, see the
> >   # documentation.
> > -# We initialize this to empty here, so the per-manual conf.py can just
> > -# add individual key/value entries.
> > -html_theme_options =3D {
> > -}
> > +if html_theme =3D=3D 'sphinx_rtd_theme':
> > +    html_theme_options =3D {
> > +        "style_nav_header_background": "#802400",
> > +    }
> > +
>
> This needs a default for html_theme_options so that if sphinx_rtd_theme
> isn't present, the build doesn't break when using the fallback to
> alabaster; I'm seeing:
>
> Traceback (most recent call last):
>    File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361,
> in eval_config_file
>      execfile_(filename, namespace)
>    File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", line
> 81, in execfile_
>      exec(code, _globals)
>    File "/home/jsnow/src/qemu/docs/user/conf.py", line 15, in <module>
>      html_theme_options['description'] =3D u'User Mode Emulation User''s
> Guide'
> NameError: name 'html_theme_options' is not defined
>

Ok, I don't get that error with sphinx 3.2.1 on fc33...

> etc.
>
> > +html_logo =3D os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png"=
)
> > +
> > +html_favicon =3D os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png=
")
> >
> >   # Add any paths that contain custom static files (such as style sheet=
s) here,
> >   # relative to this directory. They are copied after the builtin stati=
c files,
> >   # so a file named "default.css" will overwrite the builtin "default.c=
ss".
> > -# QEMU doesn't yet have any static files, so comment this out so we do=
n't
> > -# get a warning about a missing directory.
> > -# If we do ever add this then it would probably be better to call the
> > -# subdirectory sphinx_static, as the Linux kernel does.
> > -# html_static_path =3D ['_static']
> > +html_static_path =3D [os.path.join(qemu_docdir, "sphinx-static")]
> > +
> > +html_css_files =3D [
> > +    'theme_overrides.css',
> > +]
> > +
>
> We probably don't want this to apply to the alabaster fallback, do we?
>
> (OTOH: It is a fallback, so maybe who cares? Maybe it's not worth the
> complexity to try and support both themes.)

I agree, they seem significantly different to handle, not sure it's
worth the trouble.

>
> > +html_context =3D {
> > +    "display_gitlab": True,
> > +    "gitlab_user": "qemu-project",
> > +    "gitlab_repo": "qemu",
> > +    "gitlab_version": "master",
> > +    "conf_py_path": "/docs/", # Path in the checkout to the docs root
> > +}
> >
>
> Could be a separate patch, MAYBE, explaining that this is to enable the
> "Edit on gitlab!" links, which I do think are very cool and useful.

I am not sure it's worth a different patch, because it is simple
enough and replaces the pre-existing "Page source" link.

>
> >   # Custom sidebar templates, must be a dictionary that maps document n=
ames
> >   # to template names.
> > -#
> > -# This is required for the alabaster theme
> > -# refs: http://alabaster.readthedocs.io/en/latest/installation.html#si=
debars
> > -html_sidebars =3D {
> > -    '**': [
> > -        'about.html',
> > -        'editpage.html',
> > -        'navigation.html',
> > -        'searchbox.html',
> > -    ]
> > -}
> > +#html_sidebars =3D {}
> >
>
> More stuff that damages the alabaster fallback. Putting it back,
> however, causes another problem

arg

>
> >   # Don't copy the rST source files to the HTML output directory,
> >   # and don't put links to the sources into the output HTML.
> > diff --git a/docs/devel/_templates/editpage.html b/docs/devel/_template=
s/editpage.html
> > deleted file mode 100644
>
> If you keep html_sidebars, this fails to build because it's gone now. If
> enough distros have the right theme package, I'm leaning towards just
> chopping out the fallback entirely instead of bothering with the messy
> pain of doing both.

Peter, do you have an opinion about whether we should support a
fallback/default theme?

Given that RTD is the kernel theme, it seems widely available:
https://repology.org/project/python:sphinx-rtd-theme/versions.

I can update the patch to check if the sphinx_rtd_theme module is
present, and error during configure time.

Thanks


>
> --js
>
> > index a86d22bca8..0000000000
> > --- a/docs/devel/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/devel/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/interop/_templates/editpage.html b/docs/interop/_temp=
lates/editpage.html
> > deleted file mode 100644
> > index 215e562681..0000000000
> > --- a/docs/interop/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/interop/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/specs/_templates/editpage.html b/docs/specs/_template=
s/editpage.html
> > deleted file mode 100644
> > index aaa468aa98..0000000000
> > --- a/docs/specs/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/specs/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/sphinx-static/theme_overrides.css b/docs/sphinx-stati=
c/theme_overrides.css
> > new file mode 100644
> > index 0000000000..c70ef95128
> > --- /dev/null
> > +++ b/docs/sphinx-static/theme_overrides.css
> > @@ -0,0 +1,161 @@
> > +/* -*- coding: utf-8; mode: css -*-
> > + *
> > + * Sphinx HTML theme customization: read the doc
> > + * Based on Linux Documentation/sphinx-static/theme_overrides.css
> > + */
> > +
> > +/* Improve contrast and increase size for easier reading. */
> > +
> > +body {
> > +    font-family: serif;
> > +    color: black;
> > +    font-size: 100%;
> > +}
> > +
> > +h1, h2, .rst-content .toctree-wrapper p.caption, h3, h4, h5, h6, legen=
d {
> > +    font-family: sans-serif;
> > +}
> > +
> > +.rst-content dl:not(.docutils) dt {
> > +    border-top: none;
> > +    border-left: solid 3px #ccc;
> > +    background-color: #f0f0f0;
> > +    color: black;
> > +}
> > +
> > +.wy-nav-top {
> > +    background: #802400;
> > +}
> > +
> > +.wy-side-nav-search input[type=3D"text"] {
> > +    border-color: #f60;
> > +}
> > +
> > +.wy-menu-vertical p.caption {
> > +    color: white;
> > +}
> > +
> > +.wy-menu-vertical li.current a {
> > +    color: #505050;
> > +}
> > +
> > +.wy-menu-vertical li.on a, .wy-menu-vertical li.current > a {
> > +    color: #303030;
> > +}
> > +
> > +.fa-gitlab {
> > +      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0=
,0.19);
> > +      border-radius: 5px;
> > +}
> > +
> > +div[class^=3D"highlight"] pre {
> > +    font-family: monospace;
> > +    color: black;
> > +    font-size: 100%;
> > +}
> > +
> > +.wy-menu-vertical {
> > +    font-family: sans-serif;
> > +}
> > +
> > +.c {
> > +    font-style: normal;
> > +}
> > +
> > +p {
> > +    font-size: 100%;
> > +}
> > +
> > +/* Interim: Code-blocks with line nos - lines and line numbers don't l=
ine up.
> > + * see: https://github.com/rtfd/sphinx_rtd_theme/issues/419
> > + */
> > +
> > +div[class^=3D"highlight"] pre {
> > +    line-height: normal;
> > +}
> > +.rst-content .highlight > pre {
> > +    line-height: normal;
> > +}
> > +
> > +/* Keep fields from being strangely far apart due to inheirited table =
CSS. */
> > +.rst-content table.field-list th.field-name {
> > +    padding-top: 1px;
> > +    padding-bottom: 1px;
> > +}
> > +.rst-content table.field-list td.field-body {
> > +    padding-top: 1px;
> > +    padding-bottom: 1px;
> > +}
> > +
> > +@media screen {
> > +
> > +    /* content column
> > +     *
> > +     * RTD theme's default is 800px as max width for the content, but =
we have
> > +     * tables with tons of columns, which need the full width of the v=
iew-port.
> > +     */
> > +
> > +    .wy-nav-content{max-width: none; }
> > +
> > +    /* table:
> > +     *
> > +     *   - Sequences of whitespace should collapse into a single white=
space.
> > +     *   - make the overflow auto (scrollbar if needed)
> > +     *   - align caption "left" ("center" is unsuitable on vast tables=
)
> > +     */
> > +
> > +    .wy-table-responsive table td { white-space: normal; }
> > +    .wy-table-responsive { overflow: auto; }
> > +    .rst-content table.docutils caption { text-align: left; font-size:=
 100%; }
> > +
> > +    /* captions:
> > +     *
> > +     *   - captions should have 100% (not 85%) font size
> > +     *   - hide the permalink symbol as long as link is not hovered
> > +     */
> > +
> > +    .toc-title {
> > +        font-size: 150%;
> > +        font-weight: bold;
> > +    }
> > +
> > +    caption, .wy-table caption, .rst-content table.field-list caption =
{
> > +        font-size: 100%;
> > +    }
> > +    caption a.headerlink { opacity: 0; }
> > +    caption a.headerlink:hover { opacity: 1; }
> > +
> > +    /* Menu selection and keystrokes */
> > +
> > +    span.menuselection {
> > +        color: blue;
> > +        font-family: "Courier New", Courier, monospace
> > +    }
> > +
> > +    code.kbd, code.kbd span {
> > +        color: white;
> > +        background-color: darkblue;
> > +        font-weight: bold;
> > +        font-family: "Courier New", Courier, monospace
> > +    }
> > +
> > +    /* fix bottom margin of lists items */
> > +
> > +    .rst-content .section ul li:last-child, .rst-content .section ul l=
i p:last-child {
> > +          margin-bottom: 12px;
> > +    }
> > +
> > +    /* inline literal: drop the borderbox, padding and red color */
> > +
> > +    code, .rst-content tt, .rst-content code {
> > +        color: inherit;
> > +        border: none;
> > +        padding: unset;
> > +        background: inherit;
> > +        font-size: 85%;
> > +    }
> > +
> > +    .rst-content tt.literal,.rst-content tt.literal,.rst-content code.=
literal {
> > +        color: inherit;
> > +    }
> > +}
> > diff --git a/docs/system/_templates/editpage.html b/docs/system/_templa=
tes/editpage.html
> > deleted file mode 100644
> > index 6586b2e257..0000000000
> > --- a/docs/system/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/system/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/tools/_templates/editpage.html b/docs/tools/_template=
s/editpage.html
> > deleted file mode 100644
> > index 2a9c8fc92b..0000000000
> > --- a/docs/tools/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/tools/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/user/_templates/editpage.html b/docs/user/_templates/=
editpage.html
> > deleted file mode 100644
> > index 1f5ee01e60..0000000000
> > --- a/docs/user/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/user/{{pagename}}.rst">Page source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/do=
ckerfiles/debian10.docker
> > index 9d42b5a4b8..957ecdcd50 100644
> > --- a/tests/docker/dockerfiles/debian10.docker
> > +++ b/tests/docker/dockerfiles/debian10.docker
> > @@ -32,6 +32,7 @@ RUN apt update && \
> >           psmisc \
> >           python3 \
> >           python3-sphinx \
> > +        python3-sphinx-rtd-theme \
> >           $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | c=
ut -d\  -f2)
> >
> >   ENV FEATURES docs
> > diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dock=
erfiles/fedora.docker
> > index 0b5053f2d0..db249d1506 100644
> > --- a/tests/docker/dockerfiles/fedora.docker
> > +++ b/tests/docker/dockerfiles/fedora.docker
> > @@ -89,6 +89,7 @@ ENV PACKAGES \
> >       python3-pillow \
> >       python3-pip \
> >       python3-sphinx \
> > +    python3-sphinx_rtd_theme \
> >       python3-virtualenv \
> >       rdma-core-devel \
> >       SDL2-devel \
> > diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dock=
erfiles/ubuntu.docker
> > index b5ef7a8198..98a527361c 100644
> > --- a/tests/docker/dockerfiles/ubuntu.docker
> > +++ b/tests/docker/dockerfiles/ubuntu.docker
> > @@ -63,6 +63,7 @@ ENV PACKAGES \
> >       ninja-build \
> >       python3-yaml \
> >       python3-sphinx \
> > +    python3-sphinx-rtd-theme \
> >       sparse \
> >       xfslibs-dev
> >   RUN apt-get update && \
> > diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/=
dockerfiles/ubuntu1804.docker
> > index 9b0a19ba5e..c0d3642507 100644
> > --- a/tests/docker/dockerfiles/ubuntu1804.docker
> > +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> > @@ -48,6 +48,7 @@ ENV PACKAGES \
> >       make \
> >       python3-yaml \
> >       python3-sphinx \
> > +    python3-sphinx-rtd-theme \
> >       ninja-build \
> >       sparse \
> >       xfslibs-dev
> > diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/=
dockerfiles/ubuntu2004.docker
> > index ae889d8482..33c19e1762 100644
> > --- a/tests/docker/dockerfiles/ubuntu2004.docker
> > +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> > @@ -55,6 +55,7 @@ ENV PACKAGES flex bison \
> >       python3-pil \
> >       python3-pip \
> >       python3-sphinx \
> > +    python3-sphinx-rtd-theme \
> >       python3-venv \
> >       python3-yaml \
> >       rpm2cpio \
> >
>
>


--=20
Marc-Andr=C3=A9 Lureau

