Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C42FCCED
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 09:47:02 +0100 (CET)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l298n-0007aW-NZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 03:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l297I-00072d-Lt
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:45:28 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:32855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l297G-00067W-1D
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 03:45:28 -0500
Received: by mail-ed1-x536.google.com with SMTP id c6so17649600ede.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5aEx6WCv+1U1+P4yNyMQu6Q83ddQrxC/rwAa9Q4k4MA=;
 b=Dq64LmNjlEYSyRRm/VyoSUBrA88InkHMrMxXq94DbGVbjYMLOCRV11KuhIURKBWuYg
 tjcbnDKmX1+CPNtVvaOMHhCBvgDm8pka50/lsEtSIAOSHgL2NCxcWws+8mz847iHQkRE
 vjSBwVE3w8Y4iOdB+ktZvI4ldOhunakLzxWAmdFEgfvTcWlM7Sypw16NlDW5OXeORehc
 qGB46qLj8zwDTwEKwI8iFl5PyIciSeBCEg/ZQZl6LmebSlmZIocxqQ5iDRp/0BQg39XZ
 RBroUPoTh4L4q/7UdHjy6Ohi4FH9j7mExpEPYiOhhUH3Z4SlNrAQ0PDdewNrRmf0bBVb
 SMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5aEx6WCv+1U1+P4yNyMQu6Q83ddQrxC/rwAa9Q4k4MA=;
 b=UtNFb9rcDUGebLLKK8ZagYSPrxOt+hjxpsrJ8C5Mj5CmEj10efnJb9nkX1cRBBnS1f
 c6dx8n2+RTY4MTLS6TTaNvkqLZbI58Y7kFi2nM2Kp3DdavQxDV80Cpc33wCf+6nVN/v0
 RUMPA/Eg2C5WPoIhPKe7jEh2jenMUXBjJrYC7Ca3Q/bZSHp7QM6dOugTqaywULhdBOs0
 SE9Zj1+FgSInX2IMvHTN2jJt+HmSpftYCcvlRJZ+mSmIRzqecBvoEcRUnFF1Rno4Kc64
 JGYaSOfTVD4WT4yXT3eXQktyaHOAsdQikZHDv5fPgz2Ca7ek2yetsOzVWf8XDJDXcOH5
 7Mxg==
X-Gm-Message-State: AOAM532Tb8UUeQQoGCDyYvZ8p+g//YCi1+jNbHZ1h6lCtAd5yz2kp5M+
 fkGJ13++GwUzGD1bpgC4nVXtF+mqguiYI+0DgDs=
X-Google-Smtp-Source: ABdhPJxAcvYxGkFWMUnA1CYkGSNY0jsc+wp9+tUHVZ+ypx0gIUD3uWYqfTNndQG60EbvYntajEQVE2vT9zt8BxzsPgU=
X-Received: by 2002:a05:6402:78f:: with SMTP id
 d15mr6363212edy.362.1611132324038; 
 Wed, 20 Jan 2021 00:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20210120074102.51534-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210120074102.51534-1-marcandre.lureau@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Jan 2021 16:45:12 +0800
Message-ID: <CAEUhbmWkOhzmA-1JNWsXaJgvne0y-2BjOPEsK8dQkc5Qx9FAHA@mail.gmail.com>
Subject: Re: [PATCH v2] RFC: sphinx: adopt kernel readthedoc theme
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 3:41 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page
> - the search bar is not always at the same place
> - it lacks some contrast and colours
>
> The "rtd" theme from readthedocs.org is a popular third party theme used
> notably by the kernel, with a custom style sheet. I like it better,
> perhaps others do too. It also simplify "Edit on Gitlab" links.
>
> Tweak a bit the custom theme to match qemu.org style, use the
> QEMU logo, and favicon etc.
>
> Screenshot:
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-document=
ation-QEMU-documentation.png
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/_templates/editpage.html          |   5 -
>  docs/conf.py                           |  43 ++++---
>  docs/devel/_templates/editpage.html    |   5 -
>  docs/interop/_templates/editpage.html  |   5 -
>  docs/specs/_templates/editpage.html    |   5 -
>  docs/sphinx-static/theme_overrides.css | 157 +++++++++++++++++++++++++
>  docs/system/_templates/editpage.html   |   5 -
>  docs/tools/_templates/editpage.html    |   5 -
>  docs/user/_templates/editpage.html     |   5 -
>  9 files changed, 181 insertions(+), 54 deletions(-)
>  delete mode 100644 docs/_templates/editpage.html
>  delete mode 100644 docs/devel/_templates/editpage.html
>  delete mode 100644 docs/interop/_templates/editpage.html
>  delete mode 100644 docs/specs/_templates/editpage.html
>  create mode 100644 docs/sphinx-static/theme_overrides.css
>  delete mode 100644 docs/system/_templates/editpage.html
>  delete mode 100644 docs/tools/_templates/editpage.html
>  delete mode 100644 docs/user/_templates/editpage.html
>
> diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.htm=
l
> deleted file mode 100644
> index 4319b0f5ac..0000000000
> --- a/docs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/conf.py b/docs/conf.py
> index 2ee6111872..2d9e8148a9 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -150,38 +150,43 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc')=
) as f:
>  # The theme to use for HTML and HTML Help pages.  See the documentation =
for
>  # a list of builtin themes.
>  #
> -html_theme =3D 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +    html_theme =3D 'sphinx_rtd_theme'
> +except ImportError:
> +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML them=
e was not found. Make sure you have the theme installed to produce pretty H=
TML output. Falling back to the default theme.\n')
>
>  # Theme options are theme-specific and customize the look and feel of a =
theme
>  # further.  For a list of options available for each theme, see the
>  # documentation.
> -# We initialize this to empty here, so the per-manual conf.py can just
> -# add individual key/value entries.
>  html_theme_options =3D {
> +    "style_nav_header_background": "#802400",
>  }
>
> +html_logo =3D os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
> +
> +html_favicon =3D os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png")
> +
>  # Add any paths that contain custom static files (such as style sheets) =
here,
>  # relative to this directory. They are copied after the builtin static f=
iles,
>  # so a file named "default.css" will overwrite the builtin "default.css"=
.
> -# QEMU doesn't yet have any static files, so comment this out so we don'=
t
> -# get a warning about a missing directory.
> -# If we do ever add this then it would probably be better to call the
> -# subdirectory sphinx_static, as the Linux kernel does.
> -# html_static_path =3D ['_static']
> +html_static_path =3D [os.path.join(qemu_docdir, "sphinx-static")]
> +
> +html_css_files =3D [
> +    'theme_overrides.css',
> +]
> +
> +html_context =3D {
> +    "display_gitlab": True,
> +    "gitlab_user": "qemu-project",

nits: there is a trailing space here

> +    "gitlab_repo": "qemu",
> +    "gitlab_version": "master",
> +    "conf_py_path": "/docs/", # Path in the checkout to the docs root
> +}
>
>  # Custom sidebar templates, must be a dictionary that maps document name=
s
>  # to template names.
> -#
> -# This is required for the alabaster theme
> -# refs: http://alabaster.readthedocs.io/en/latest/installation.html#side=
bars
> -html_sidebars =3D {
> -    '**': [
> -        'about.html',
> -        'editpage.html',
> -        'navigation.html',
> -        'searchbox.html',
> -    ]
> -}
> +#html_sidebars =3D {}
>
>  # Don't copy the rST source files to the HTML output directory,
>  # and don't put links to the sources into the output HTML.
> diff --git a/docs/devel/_templates/editpage.html b/docs/devel/_templates/=
editpage.html
> deleted file mode 100644
> index a86d22bca8..0000000000
> --- a/docs/devel/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/devel/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/interop/_templates/editpage.html b/docs/interop/_templa=
tes/editpage.html
> deleted file mode 100644
> index 215e562681..0000000000
> --- a/docs/interop/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/interop/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/specs/_templates/editpage.html b/docs/specs/_templates/=
editpage.html
> deleted file mode 100644
> index aaa468aa98..0000000000
> --- a/docs/specs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/specs/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/sphinx-static/theme_overrides.css b/docs/sphinx-static/=
theme_overrides.css
> new file mode 100644
> index 0000000000..6bacf9141e
> --- /dev/null
> +++ b/docs/sphinx-static/theme_overrides.css
> @@ -0,0 +1,157 @@
> +/* -*- coding: utf-8; mode: css -*-
> + *
> + * Sphinx HTML theme customization: read the doc
> + * Based on Linux Documentation/sphinx-static/theme_overrides.css
> + */
> +
> +/* Improve contrast and increase size for easier reading. */
> +
> +body {
> +    font-family: serif;
> +    color: black;
> +    font-size: 100%;
> +}
> +
> +h1, h2, .rst-content .toctree-wrapper p.caption, h3, h4, h5, h6, legend =
{
> +    font-family: sans-serif;
> +}
> +
> +.rst-content dl:not(.docutils) dt {
> +    border-top: none;
> +    border-left: solid 3px #ccc;
> +    background-color: #f0f0f0;
> +    color: black;
> +}
> +
> +.wy-side-nav-search input[type=3D"text"] {
> +    border-color: #f60;
> +}
> +
> +.wy-menu-vertical p.caption {
> +    color: white;
> +}
> +
> +.wy-menu-vertical li.current a {
> +    color: #505050;
> +}
> +
> +.wy-menu-vertical li.on a, .wy-menu-vertical li.current > a {
> +    color: #303030;
> +}
> +
> +.fa-gitlab {
> +      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0=
.19);
> +      border-radius: 5px;
> +}
> +
> +div[class^=3D"highlight"] pre {
> +    font-family: monospace;
> +    color: black;
> +    font-size: 100%;
> +}
> +
> +.wy-menu-vertical {
> +    font-family: sans-serif;
> +}
> +
> +.c {
> +    font-style: normal;
> +}
> +
> +p {
> +    font-size: 100%;
> +}
> +
> +/* Interim: Code-blocks with line nos - lines and line numbers don't lin=
e up.
> + * see: https://github.com/rtfd/sphinx_rtd_theme/issues/419
> + */
> +
> +div[class^=3D"highlight"] pre {
> +    line-height: normal;
> +}
> +.rst-content .highlight > pre {
> +    line-height: normal;
> +}
> +
> +/* Keep fields from being strangely far apart due to inheirited table CS=
S. */
> +.rst-content table.field-list th.field-name {
> +    padding-top: 1px;
> +    padding-bottom: 1px;
> +}
> +.rst-content table.field-list td.field-body {
> +    padding-top: 1px;
> +    padding-bottom: 1px;
> +}
> +
> +@media screen {
> +
> +    /* content column
> +     *
> +     * RTD theme's default is 800px as max width for the content, but we=
 have
> +     * tables with tons of columns, which need the full width of the vie=
w-port.
> +     */
> +
> +    .wy-nav-content{max-width: none; }
> +
> +    /* table:
> +     *
> +     *   - Sequences of whitespace should collapse into a single whitesp=
ace.
> +     *   - make the overflow auto (scrollbar if needed)
> +     *   - align caption "left" ("center" is unsuitable on vast tables)
> +     */
> +
> +    .wy-table-responsive table td { white-space: normal; }
> +    .wy-table-responsive { overflow: auto; }
> +    .rst-content table.docutils caption { text-align: left; font-size: 1=
00%; }
> +
> +    /* captions:
> +     *
> +     *   - captions should have 100% (not 85%) font size
> +     *   - hide the permalink symbol as long as link is not hovered
> +     */
> +
> +    .toc-title {
> +        font-size: 150%;
> +        font-weight: bold;
> +    }
> +
> +    caption, .wy-table caption, .rst-content table.field-list caption {
> +        font-size: 100%;
> +    }
> +    caption a.headerlink { opacity: 0; }
> +    caption a.headerlink:hover { opacity: 1; }
> +
> +    /* Menu selection and keystrokes */
> +
> +    span.menuselection {
> +        color: blue;
> +        font-family: "Courier New", Courier, monospace
> +    }
> +
> +    code.kbd, code.kbd span {
> +        color: white;
> +        background-color: darkblue;
> +        font-weight: bold;
> +        font-family: "Courier New", Courier, monospace
> +    }
> +
> +    /* fix bottom margin of lists items */
> +
> +    .rst-content .section ul li:last-child, .rst-content .section ul li =
p:last-child {
> +          margin-bottom: 12px;
> +    }
> +
> +    /* inline literal: drop the borderbox, padding and red color */
> +
> +    code, .rst-content tt, .rst-content code {
> +        color: inherit;
> +        border: none;
> +        padding: unset;
> +        background: inherit;
> +        font-size: 85%;
> +    }
> +
> +    .rst-content tt.literal,.rst-content tt.literal,.rst-content code.li=
teral {
> +        color: inherit;
> +    }
> +}
> diff --git a/docs/system/_templates/editpage.html b/docs/system/_template=
s/editpage.html
> deleted file mode 100644
> index 6586b2e257..0000000000
> --- a/docs/system/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/system/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/tools/_templates/editpage.html b/docs/tools/_templates/=
editpage.html
> deleted file mode 100644
> index 2a9c8fc92b..0000000000
> --- a/docs/tools/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/tools/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/user/_templates/editpage.html b/docs/user/_templates/ed=
itpage.html
> deleted file mode 100644
> index 1f5ee01e60..0000000000
> --- a/docs/user/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/do=
cs/user/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> --

When sphinx_rtd_theme is not installed, with this patch no html doc is
generated at all. After installing sphinx_rtd_theme html doc can be
generated again.
Please take a look.

Regards,
Bin

