Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09062349ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:12:38 +0100 (CET)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWLM-0003c5-RR
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWJw-00036n-Q4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:11:08 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWJs-0000Sk-Kv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:11:08 -0400
Received: by mail-ej1-x636.google.com with SMTP id u21so4928626ejo.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 13:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzajW0gX46Guv6GybndumhGA2RnnN4SQN4mewked6F4=;
 b=APcnBn0pZK03c6BqkrbERelCLczB96j0rwLb7gc+f1dk//TV79YNvwyJYVtmxgeWg2
 Vw3guAsgyoyLinPwHMX8bj4nVDRNoyM5MbdYLHZQVk72HtJofz9Fl/JUGkIcw9vKGqfJ
 yRCRZJEVr36EtPpgeUz/7C7lOGiH/x2VVI4knjAmWUy5/JIAg/eiGAP+ZELSieFWqIJN
 ZYJ7VKk8h0VwFQPmj1STmuh4RavCL+V+0pfWv5gzUFIhDTqfjUjCK20jlEpbUSzgjIj5
 eWipWmGqQqB5eIeU5+YuzWpMmlswqukow9mwgrjtLQNh6t8BiFgjgnimz1SYr6cUbzk6
 5NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzajW0gX46Guv6GybndumhGA2RnnN4SQN4mewked6F4=;
 b=fLrwaefIaywQ5CkhyBbpzzepnZOlxhPdKQ4LUIFJLmGI2TZ7PsGQZVNOSb21q6PQtj
 1JYGEmZjZRUJzwjRwWA7heOx1xeHKHtHJBZagNMVmjiRy9p7ZR7KofVP8Lq9rrsKEvSV
 rC4SYvZEgKsjt3fu1SIN28B2QFGSfv7rVr+5GA2TUjtlakK5LyIT+BOBN6v9tvrO4mrH
 HPH9uSg1Oe4je0OEKt24qI9Zh0/2anIniSyF70C45m3B59wQJuLFZhmUZrMtMsichXQV
 AmbW8Svp0olqcMBRHSKastYlJbLGH+NP3ALaIe6+IxZLrC2/1XHqW98ZXn8/U3YJOmQa
 3wxQ==
X-Gm-Message-State: AOAM533Ml9I3pb/a7Eiw20sXio19H2BJjwvkENSs4ZFc1ezRABg5xL6d
 r+UYzlPKT9zkZ4fb0QTJ4zpTD6b8zUoBzrgLkjrQcoPrLJQ=
X-Google-Smtp-Source: ABdhPJy0dugpxIBtvE5jEbsEEi9gckzPmf21xfp89swthQ1P4ZkFb7CzQil3Bi6uY79FpvOtKye0OFYF7aU9Ckyr8BM=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr11245555ejb.381.1616703061018; 
 Thu, 25 Mar 2021 13:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210323115328.4146052-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Mar 2021 00:10:49 +0400
Message-ID: <CAJ+F1CKN3zD=gXPMCN_z78NnFWJyEZ3bvAJ3YMamzY8y4ps08Q@mail.gmail.com>
Subject: Re: [PATCH v5] sphinx: adopt kernel readthedoc theme
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a8ce7005be6203c1"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8ce7005be6203c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 3:54 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The default "alabaster" sphinx theme has a couple shortcomings:
> - the navbar moves along the page
> - the search bar is not always at the same place
> - it lacks some contrast and colours
>
> The "rtd" theme from readthedocs.org is a popular third party theme used
> notably by the kernel, with a custom style sheet. I like it better,
> perhaps others do too. It also simplifies the "Edit on Gitlab" links.
>
> Tweak a bit the custom theme to match qemu.org style, use the
> QEMU logo, and favicon etc.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> v5:
>  - raise an error if rtd theme is missing (also at configure time)
>  - commit message tweaks
>
>  docs/_templates/editpage.html              |   5 -
>  docs/conf.py                               |  51 ++++---
>  docs/devel/_templates/editpage.html        |   5 -
>  docs/interop/_templates/editpage.html      |   5 -
>  docs/meson.build                           |   5 +-
>  docs/specs/_templates/editpage.html        |   5 -
>  docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
>  docs/system/_templates/editpage.html       |   5 -
>  docs/tools/_templates/editpage.html        |   5 -
>  docs/user/_templates/editpage.html         |   5 -
>  tests/docker/dockerfiles/debian10.docker   |   1 +
>  tests/docker/dockerfiles/fedora.docker     |   1 +
>  tests/docker/dockerfiles/ubuntu.docker     |   1 +
>  tests/docker/dockerfiles/ubuntu1804.docker |   1 +
>  tests/docker/dockerfiles/ubuntu2004.docker |   1 +
>  15 files changed, 198 insertions(+), 59 deletions(-)
>  delete mode 100644 docs/_templates/editpage.html
>  delete mode 100644 docs/devel/_templates/editpage.html
>  delete mode 100644 docs/interop/_templates/editpage.html
>  delete mode 100644 docs/specs/_templates/editpage.html
>  create mode 100644 docs/sphinx-static/theme_overrides.css
>  delete mode 100644 docs/system/_templates/editpage.html
>  delete mode 100644 docs/tools/_templates/editpage.html
>  delete mode 100644 docs/user/_templates/editpage.html
>
>
Ah I already sent that newer version, anybody to review/ack?

diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html
> deleted file mode 100644
> index 4319b0f5ac..0000000000
> --- a/docs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst"=
>Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/conf.py b/docs/conf.py
> index 2ee6111872..3802b70d62 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -150,38 +150,47 @@
>  # The theme to use for HTML and HTML Help pages.  See the documentation
> for
>  # a list of builtin themes.
>  #
> -html_theme =3D 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +except ImportError:
> +    raise ConfigError(
> +        'The Sphinx \'sphinx_rtd_theme\' HTML theme was not found.\n'
> +    )
> +
> +html_theme =3D 'sphinx_rtd_theme'
>
>  # Theme options are theme-specific and customize the look and feel of a
> theme
>  # further.  For a list of options available for each theme, see the
>  # documentation.
> -# We initialize this to empty here, so the per-manual conf.py can just
> -# add individual key/value entries.
> -html_theme_options =3D {
> -}
> +if html_theme =3D=3D 'sphinx_rtd_theme':
> +    html_theme_options =3D {
> +        "style_nav_header_background": "#802400",
> +    }
> +
> +html_logo =3D os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
> +
> +html_favicon =3D os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png")
>
>  # Add any paths that contain custom static files (such as style sheets)
> here,
>  # relative to this directory. They are copied after the builtin static
> files,
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
> -# refs:
> http://alabaster.readthedocs.io/en/latest/installation.html#sidebars
> -html_sidebars
> <http://alabaster.readthedocs.io/en/latest/installation.html#sidebars-htm=
l_sidebars>
> =3D {
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
> diff --git a/docs/devel/_templates/editpage.html
> b/docs/devel/_templates/editpage.html
> deleted file mode 100644
> index a86d22bca8..0000000000
> --- a/docs/devel/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/{{pagename}=
}.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/interop/_templates/editpage.html
> b/docs/interop/_templates/editpage.html
> deleted file mode 100644
> index 215e562681..0000000000
> --- a/docs/interop/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/{{pagenam=
e}}.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/meson.build b/docs/meson.build
> index f84306ba7e..855e3916e9 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -27,10 +27,9 @@ if sphinx_build.found()
>    build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)
>
>    if not build_docs
> -    warning('@0@ is either too old or uses too old a Python version'
> -            .format(sphinx_build.full_path()))
> +    warning('@0@: @1@'.format(sphinx_build.full_path(),
> sphinx_build_test_out.stderr()))
>      if get_option('docs').enabled()
> -      error('Install a Python 3 version of python-sphinx')
> +      error('Install a Python 3 version of python-sphinx and the
> readthedoc theme')
>      endif
>    endif
>  endif
> diff --git a/docs/specs/_templates/editpage.html
> b/docs/specs/_templates/editpage.html
> deleted file mode 100644
> index aaa468aa98..0000000000
> --- a/docs/specs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/specs/{{pagename}=
}.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/sphinx-static/theme_overrides.css
> b/docs/sphinx-static/theme_overrides.css
> new file mode 100644
> index 0000000000..c70ef95128
> --- /dev/null
> +++ b/docs/sphinx-static/theme_overrides.css
> @@ -0,0 +1,161 @@
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
> +.wy-nav-top {
> +    background: #802400;
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
> +      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0
> rgba(0,0,0,0.19);
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
e
> up.
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
> +/* Keep fields from being strangely far apart due to inheirited table
> CSS. */
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
> +     * RTD theme's default is 800px as max width for the content, but we
> have
> +     * tables with tons of columns, which need the full width of the
> view-port.
> +     */
> +
> +    .wy-nav-content{max-width: none; }
> +
> +    /* table:
> +     *
> +     *   - Sequences of whitespace should collapse into a single
> whitespace.
> +     *   - make the overflow auto (scrollbar if needed)
> +     *   - align caption "left" ("center" is unsuitable on vast tables)
> +     */
> +
> +    .wy-table-responsive table td { white-space: normal; }
> +    .wy-table-responsive { overflow: auto; }
> +    .rst-content table.docutils caption { text-align: left; font-size:
> 100%; }
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
> +    .rst-content .section ul li:last-child, .rst-content .section ul li
> p:last-child {
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
> +    .rst-content tt.literal,.rst-content tt.literal,.rst-content
> code.literal {
> +        color: inherit;
> +    }
> +}
> diff --git a/docs/system/_templates/editpage.html
> b/docs/system/_templates/editpage.html
> deleted file mode 100644
> index 6586b2e257..0000000000
> --- a/docs/system/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/{{pagename=
}}.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/tools/_templates/editpage.html
> b/docs/tools/_templates/editpage.html
> deleted file mode 100644
> index 2a9c8fc92b..0000000000
> --- a/docs/tools/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/tools/{{pagename}=
}.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/user/_templates/editpage.html
> b/docs/user/_templates/editpage.html
> deleted file mode 100644
> index 1f5ee01e60..0000000000
> --- a/docs/user/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id=3D"editpage">
> -  <ul>
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/user/{{pagename}}=
.rst">Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/tests/docker/dockerfiles/debian10.docker
> b/tests/docker/dockerfiles/debian10.docker
> index d034acbd25..63cf835ec5 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -32,6 +32,7 @@ RUN apt update && \
>          psmisc \
>          python3 \
>          python3-sphinx \
> +        python3-sphinx-rtd-theme \
>          $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep
> '[all]' | cut -d\  -f2)
>
>  ENV FEATURES docs
> diff --git a/tests/docker/dockerfiles/fedora.docker
> b/tests/docker/dockerfiles/fedora.docker
> index 915fdc1845..d8fa16372d 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -92,6 +92,7 @@ ENV PACKAGES \
>      python3-pillow \
>      python3-pip \
>      python3-sphinx \
> +    python3-sphinx_rtd_theme \
>      python3-virtualenv \
>      rdma-core-devel \
>      SDL2-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu.docker
> b/tests/docker/dockerfiles/ubuntu.docker
> index b5ef7a8198..98a527361c 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -63,6 +63,7 @@ ENV PACKAGES \
>      ninja-build \
>      python3-yaml \
>      python3-sphinx \
> +    python3-sphinx-rtd-theme \
>      sparse \
>      xfslibs-dev
>  RUN apt-get update && \
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker
> b/tests/docker/dockerfiles/ubuntu1804.docker
> index 9b0a19ba5e..c0d3642507 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -48,6 +48,7 @@ ENV PACKAGES \
>      make \
>      python3-yaml \
>      python3-sphinx \
> +    python3-sphinx-rtd-theme \
>      ninja-build \
>      sparse \
>      xfslibs-dev
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker
> b/tests/docker/dockerfiles/ubuntu2004.docker
> index 9750016e51..f1e0ebad49 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -58,6 +58,7 @@ ENV PACKAGES flex bison \
>      python3-pil \
>      python3-pip \
>      python3-sphinx \
> +    python3-sphinx-rtd-theme \
>      python3-venv \
>      python3-yaml \
>      rpm2cpio \
> --
> 2.29.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a8ce7005be6203c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 3:54 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The default &quot;alabaster&quot; sphinx theme has a couple shortcomings:<b=
r>
- the navbar moves along the page<br>
- the search bar is not always at the same place<br>
- it lacks some contrast and colours<br>
<br>
The &quot;rtd&quot; theme from <a href=3D"http://readthedocs.org" rel=3D"no=
referrer" target=3D"_blank">readthedocs.org</a> is a popular third party th=
eme used<br>
notably by the kernel, with a custom style sheet. I like it better,<br>
perhaps others do too. It also simplifies the &quot;Edit on Gitlab&quot; li=
nks.<br>
<br>
Tweak a bit the custom theme to match <a href=3D"http://qemu.org" rel=3D"no=
referrer" target=3D"_blank">qemu.org</a> style, use the<br>
QEMU logo, and favicon etc.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Tested-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_bl=
ank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
v5:<br>
=C2=A0- raise an error if rtd theme is missing (also at configure time)<br>
=C2=A0- commit message tweaks<br>
<br>
=C2=A0docs/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 -<br>
=C2=A0docs/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 51 ++++---<b=
r>
=C2=A0docs/devel/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 -<br>
=C2=A0docs/interop/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 -<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0docs/specs/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 -<br>
=C2=A0docs/sphinx-static/theme_overrides.css=C2=A0 =C2=A0 =C2=A0| 161 +++++=
++++++++++++++++<br>
=C2=A0docs/system/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 -<br>
=C2=A0docs/tools/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 -<br>
=C2=A0docs/user/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 -<br>
=C2=A0tests/docker/dockerfiles/debian10.docker=C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
=C2=A0tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0tests/docker/dockerfiles/ubuntu.docker=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0tests/docker/dockerfiles/ubuntu1804.docker |=C2=A0 =C2=A01 +<br>
=C2=A0tests/docker/dockerfiles/ubuntu2004.docker |=C2=A0 =C2=A01 +<br>
=C2=A015 files changed, 198 insertions(+), 59 deletions(-)<br>
=C2=A0delete mode 100644 docs/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/devel/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/interop/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/specs/_templates/editpage.html<br>
=C2=A0create mode 100644 docs/sphinx-static/theme_overrides.css<br>
=C2=A0delete mode 100644 docs/system/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/tools/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/user/_templates/editpage.html<br>
<br></blockquote><div><br></div><div>Ah I already sent that newer version, =
anybody to review/ack?</div><div> <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html<=
br>
deleted file mode 100644<br>
index 4319b0f5ac..0000000000<br>
--- a/docs/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/%7B%7Bpagename%7D%7D.rst" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/master/=
docs/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/conf.py b/docs/conf.py<br>
index 2ee6111872..3802b70d62 100644<br>
--- a/docs/conf.py<br>
+++ b/docs/conf.py<br>
@@ -150,38 +150,47 @@<br>
=C2=A0# The theme to use for HTML and HTML Help pages.=C2=A0 See the docume=
ntation for<br>
=C2=A0# a list of builtin themes.<br>
=C2=A0#<br>
-html_theme =3D &#39;alabaster&#39;<br>
+try:<br>
+=C2=A0 =C2=A0 import sphinx_rtd_theme<br>
+except ImportError:<br>
+=C2=A0 =C2=A0 raise ConfigError(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;The Sphinx \&#39;sphinx_rtd_theme\&#39; H=
TML theme was not found.\n&#39;<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+html_theme =3D &#39;sphinx_rtd_theme&#39;<br>
<br>
=C2=A0# Theme options are theme-specific and customize the look and feel of=
 a theme<br>
=C2=A0# further.=C2=A0 For a list of options available for each theme, see =
the<br>
=C2=A0# documentation.<br>
-# We initialize this to empty here, so the per-manual conf.py can just<br>
-# add individual key/value entries.<br>
-html_theme_options =3D {<br>
-}<br>
+if html_theme =3D=3D &#39;sphinx_rtd_theme&#39;:<br>
+=C2=A0 =C2=A0 html_theme_options =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;style_nav_header_background&quot;: &quot=
;#802400&quot;,<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+html_logo =3D os.path.join(qemu_docdir, &quot;../ui/icons/qemu_128x128.png=
&quot;)<br>
+<br>
+html_favicon =3D os.path.join(qemu_docdir, &quot;../ui/icons/qemu_32x32.pn=
g&quot;)<br>
<br>
=C2=A0# Add any paths that contain custom static files (such as style sheet=
s) here,<br>
=C2=A0# relative to this directory. They are copied after the builtin stati=
c files,<br>
=C2=A0# so a file named &quot;default.css&quot; will overwrite the builtin =
&quot;default.css&quot;.<br>
-# QEMU doesn&#39;t yet have any static files, so comment this out so we do=
n&#39;t<br>
-# get a warning about a missing directory.<br>
-# If we do ever add this then it would probably be better to call the<br>
-# subdirectory sphinx_static, as the Linux kernel does.<br>
-# html_static_path =3D [&#39;_static&#39;]<br>
+html_static_path =3D [os.path.join(qemu_docdir, &quot;sphinx-static&quot;)=
]<br>
+<br>
+html_css_files =3D [<br>
+=C2=A0 =C2=A0 &#39;theme_overrides.css&#39;,<br>
+]<br>
+<br>
+html_context =3D {<br>
+=C2=A0 =C2=A0 &quot;display_gitlab&quot;: True,<br>
+=C2=A0 =C2=A0 &quot;gitlab_user&quot;: &quot;qemu-project&quot;,<br>
+=C2=A0 =C2=A0 &quot;gitlab_repo&quot;: &quot;qemu&quot;,<br>
+=C2=A0 =C2=A0 &quot;gitlab_version&quot;: &quot;master&quot;,<br>
+=C2=A0 =C2=A0 &quot;conf_py_path&quot;: &quot;/docs/&quot;, # Path in the =
checkout to the docs root<br>
+}<br>
<br>
=C2=A0# Custom sidebar templates, must be a dictionary that maps document n=
ames<br>
=C2=A0# to template names.<br>
-#<br>
-# This is required for the alabaster theme<br>
-# refs: <a href=3D"http://alabaster.readthedocs.io/en/latest/installation.=
html#sidebars-html_sidebars" rel=3D"noreferrer" target=3D"_blank">http://al=
abaster.readthedocs.io/en/latest/installation.html#sidebars<br>
-html_sidebars</a> =3D {<br>
-=C2=A0 =C2=A0 &#39;**&#39;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;about.html&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;editpage.html&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;navigation.html&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;searchbox.html&#39;,<br>
-=C2=A0 =C2=A0 ]<br>
-}<br>
+#html_sidebars =3D {}<br>
<br>
=C2=A0# Don&#39;t copy the rST source files to the HTML output directory,<b=
r>
=C2=A0# and don&#39;t put links to the sources into the output HTML.<br>
diff --git a/docs/devel/_templates/editpage.html b/docs/devel/_templates/ed=
itpage.html<br>
deleted file mode 100644<br>
index a86d22bca8..0000000000<br>
--- a/docs/devel/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/devel/%7B%7Bpagename%7D%7D.rst" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/m=
aster/docs/devel/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li=
&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/interop/_templates/editpage.html b/docs/interop/_template=
s/editpage.html<br>
deleted file mode 100644<br>
index 215e562681..0000000000<br>
--- a/docs/interop/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/interop/%7B%7Bpagename%7D%7D.rst" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/bl=
ob/master/docs/interop/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&=
lt;/li&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index f84306ba7e..855e3916e9 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -27,10 +27,9 @@ if sphinx_build.found()<br>
=C2=A0 =C2=A0build_docs =3D (sphinx_build_test_out.returncode() =3D=3D 0)<b=
r>
<br>
=C2=A0 =C2=A0if not build_docs<br>
-=C2=A0 =C2=A0 warning(&#39;@0@ is either too old or uses too old a Python =
version&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .format(sphinx_build.full_path()=
))<br>
+=C2=A0 =C2=A0 warning(&#39;@0@: @1@&#39;.format(sphinx_build.full_path(), =
sphinx_build_test_out.stderr()))<br>
=C2=A0 =C2=A0 =C2=A0if get_option(&#39;docs&#39;).enabled()<br>
-=C2=A0 =C2=A0 =C2=A0 error(&#39;Install a Python 3 version of python-sphin=
x&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;Install a Python 3 version of python-sphin=
x and the readthedoc theme&#39;)<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
diff --git a/docs/specs/_templates/editpage.html b/docs/specs/_templates/ed=
itpage.html<br>
deleted file mode 100644<br>
index aaa468aa98..0000000000<br>
--- a/docs/specs/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/specs/%7B%7Bpagename%7D%7D.rst" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/m=
aster/docs/specs/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li=
&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/sphinx-static/theme_overrides.css b/docs/sphinx-static/th=
eme_overrides.css<br>
new file mode 100644<br>
index 0000000000..c70ef95128<br>
--- /dev/null<br>
+++ b/docs/sphinx-static/theme_overrides.css<br>
@@ -0,0 +1,161 @@<br>
+/* -*- coding: utf-8; mode: css -*-<br>
+ *<br>
+ * Sphinx HTML theme customization: read the doc<br>
+ * Based on Linux Documentation/sphinx-static/theme_overrides.css<br>
+ */<br>
+<br>
+/* Improve contrast and increase size for easier reading. */<br>
+<br>
+body {<br>
+=C2=A0 =C2=A0 font-family: serif;<br>
+=C2=A0 =C2=A0 color: black;<br>
+=C2=A0 =C2=A0 font-size: 100%;<br>
+}<br>
+<br>
+h1, h2, .rst-content .toctree-wrapper p.caption, h3, h4, h5, h6, legend {<=
br>
+=C2=A0 =C2=A0 font-family: sans-serif;<br>
+}<br>
+<br>
+.rst-content dl:not(.docutils) dt {<br>
+=C2=A0 =C2=A0 border-top: none;<br>
+=C2=A0 =C2=A0 border-left: solid 3px #ccc;<br>
+=C2=A0 =C2=A0 background-color: #f0f0f0;<br>
+=C2=A0 =C2=A0 color: black;<br>
+}<br>
+<br>
+.wy-nav-top {<br>
+=C2=A0 =C2=A0 background: #802400;<br>
+}<br>
+<br>
+.wy-side-nav-search input[type=3D&quot;text&quot;] {<br>
+=C2=A0 =C2=A0 border-color: #f60;<br>
+}<br>
+<br>
+.wy-menu-vertical p.caption {<br>
+=C2=A0 =C2=A0 color: white;<br>
+}<br>
+<br>
+.wy-menu-vertical li.current a {<br>
+=C2=A0 =C2=A0 color: #505050;<br>
+}<br>
+<br>
+.wy-menu-vertical li.on a, .wy-menu-vertical li.current &gt; a {<br>
+=C2=A0 =C2=A0 color: #303030;<br>
+}<br>
+<br>
+.fa-gitlab {<br>
+=C2=A0 =C2=A0 =C2=A0 box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0=
 rgba(0,0,0,0.19);<br>
+=C2=A0 =C2=A0 =C2=A0 border-radius: 5px;<br>
+}<br>
+<br>
+div[class^=3D&quot;highlight&quot;] pre {<br>
+=C2=A0 =C2=A0 font-family: monospace;<br>
+=C2=A0 =C2=A0 color: black;<br>
+=C2=A0 =C2=A0 font-size: 100%;<br>
+}<br>
+<br>
+.wy-menu-vertical {<br>
+=C2=A0 =C2=A0 font-family: sans-serif;<br>
+}<br>
+<br>
+.c {<br>
+=C2=A0 =C2=A0 font-style: normal;<br>
+}<br>
+<br>
+p {<br>
+=C2=A0 =C2=A0 font-size: 100%;<br>
+}<br>
+<br>
+/* Interim: Code-blocks with line nos - lines and line numbers don&#39;t l=
ine up.<br>
+ * see: <a href=3D"https://github.com/rtfd/sphinx_rtd_theme/issues/419" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/rtfd/sphinx_rtd_theme=
/issues/419</a><br>
+ */<br>
+<br>
+div[class^=3D&quot;highlight&quot;] pre {<br>
+=C2=A0 =C2=A0 line-height: normal;<br>
+}<br>
+.rst-content .highlight &gt; pre {<br>
+=C2=A0 =C2=A0 line-height: normal;<br>
+}<br>
+<br>
+/* Keep fields from being strangely far apart due to inheirited table CSS.=
 */<br>
+.rst-content table.field-list th.field-name {<br>
+=C2=A0 =C2=A0 padding-top: 1px;<br>
+=C2=A0 =C2=A0 padding-bottom: 1px;<br>
+}<br>
+.rst-content table.field-list td.field-body {<br>
+=C2=A0 =C2=A0 padding-top: 1px;<br>
+=C2=A0 =C2=A0 padding-bottom: 1px;<br>
+}<br>
+<br>
+@media screen {<br>
+<br>
+=C2=A0 =C2=A0 /* content column<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* RTD theme&#39;s default is 800px as max width for th=
e content, but we have<br>
+=C2=A0 =C2=A0 =C2=A0* tables with tons of columns, which need the full wid=
th of the view-port.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+=C2=A0 =C2=A0 .wy-nav-content{max-width: none; }<br>
+<br>
+=C2=A0 =C2=A0 /* table:<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0- Sequences of whitespace should collaps=
e into a single whitespace.<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0- make the overflow auto (scrollbar if n=
eeded)<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0- align caption &quot;left&quot; (&quot;=
center&quot; is unsuitable on vast tables)<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+=C2=A0 =C2=A0 .wy-table-responsive table td { white-space: normal; }<br>
+=C2=A0 =C2=A0 .wy-table-responsive { overflow: auto; }<br>
+=C2=A0 =C2=A0 .rst-content table.docutils caption { text-align: left; font=
-size: 100%; }<br>
+<br>
+=C2=A0 =C2=A0 /* captions:<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0- captions should have 100% (not 85%) fo=
nt size<br>
+=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0- hide the permalink symbol as long as l=
ink is not hovered<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+<br>
+=C2=A0 =C2=A0 .toc-title {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-size: 150%;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-weight: bold;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 caption, .wy-table caption, .rst-content table.field-list ca=
ption {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-size: 100%;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 caption a.headerlink { opacity: 0; }<br>
+=C2=A0 =C2=A0 caption a.headerlink:hover { opacity: 1; }<br>
+<br>
+=C2=A0 =C2=A0 /* Menu selection and keystrokes */<br>
+<br>
+=C2=A0 =C2=A0 span.menuselection {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 color: blue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-family: &quot;Courier New&quot;, Courier,=
 monospace<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 code.kbd, code.kbd span {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 color: white;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 background-color: darkblue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-weight: bold;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-family: &quot;Courier New&quot;, Courier,=
 monospace<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* fix bottom margin of lists items */<br>
+<br>
+=C2=A0 =C2=A0 .rst-content .section ul li:last-child, .rst-content .sectio=
n ul li p:last-child {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 margin-bottom: 12px;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* inline literal: drop the borderbox, padding and red color=
 */<br>
+<br>
+=C2=A0 =C2=A0 code, .rst-content tt, .rst-content code {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 color: inherit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 border: none;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 padding: unset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 background: inherit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 font-size: 85%;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 .rst-content tt.literal,.rst-content tt.literal,.rst-content=
 code.literal {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 color: inherit;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
diff --git a/docs/system/_templates/editpage.html b/docs/system/_templates/=
editpage.html<br>
deleted file mode 100644<br>
index 6586b2e257..0000000000<br>
--- a/docs/system/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/system/%7B%7Bpagename%7D%7D.rst" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/=
master/docs/system/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/=
li&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/tools/_templates/editpage.html b/docs/tools/_templates/ed=
itpage.html<br>
deleted file mode 100644<br>
index 2a9c8fc92b..0000000000<br>
--- a/docs/tools/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/tools/%7B%7Bpagename%7D%7D.rst" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/m=
aster/docs/tools/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li=
&gt;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/docs/user/_templates/editpage.html b/docs/user/_templates/edit=
page.html<br>
deleted file mode 100644<br>
index 1f5ee01e60..0000000000<br>
--- a/docs/user/_templates/editpage.html<br>
+++ /dev/null<br>
@@ -1,5 +0,0 @@<br>
-&lt;div id=3D&quot;editpage&quot;&gt;<br>
-=C2=A0 &lt;ul&gt;<br>
-=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.com/q=
emu-project/qemu/-/blob/master/docs/user/%7B%7Bpagename%7D%7D.rst" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/ma=
ster/docs/user/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li&g=
t;<br>
-=C2=A0 &lt;/ul&gt;<br>
-&lt;/div&gt;<br>
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/docker=
files/debian10.docker<br>
index d034acbd25..63cf835ec5 100644<br>
--- a/tests/docker/dockerfiles/debian10.docker<br>
+++ b/tests/docker/dockerfiles/debian10.docker<br>
@@ -32,6 +32,7 @@ RUN apt update &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psmisc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3-sphinx \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-sphinx-rtd-theme \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(apt-get -s build-dep --arch-only qemu |=
 egrep ^Inst | fgrep &#39;[all]&#39; | cut -d\=C2=A0 -f2)<br>
<br>
=C2=A0ENV FEATURES docs<br>
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfi=
les/fedora.docker<br>
index 915fdc1845..d8fa16372d 100644<br>
--- a/tests/docker/dockerfiles/fedora.docker<br>
+++ b/tests/docker/dockerfiles/fedora.docker<br>
@@ -92,6 +92,7 @@ ENV PACKAGES \<br>
=C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
=C2=A0 =C2=A0 =C2=A0python3-pip \<br>
=C2=A0 =C2=A0 =C2=A0python3-sphinx \<br>
+=C2=A0 =C2=A0 python3-sphinx_rtd_theme \<br>
=C2=A0 =C2=A0 =C2=A0python3-virtualenv \<br>
=C2=A0 =C2=A0 =C2=A0rdma-core-devel \<br>
=C2=A0 =C2=A0 =C2=A0SDL2-devel \<br>
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfi=
les/ubuntu.docker<br>
index b5ef7a8198..98a527361c 100644<br>
--- a/tests/docker/dockerfiles/ubuntu.docker<br>
+++ b/tests/docker/dockerfiles/ubuntu.docker<br>
@@ -63,6 +63,7 @@ ENV PACKAGES \<br>
=C2=A0 =C2=A0 =C2=A0ninja-build \<br>
=C2=A0 =C2=A0 =C2=A0python3-yaml \<br>
=C2=A0 =C2=A0 =C2=A0python3-sphinx \<br>
+=C2=A0 =C2=A0 python3-sphinx-rtd-theme \<br>
=C2=A0 =C2=A0 =C2=A0sparse \<br>
=C2=A0 =C2=A0 =C2=A0xfslibs-dev<br>
=C2=A0RUN apt-get update &amp;&amp; \<br>
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dock=
erfiles/ubuntu1804.docker<br>
index 9b0a19ba5e..c0d3642507 100644<br>
--- a/tests/docker/dockerfiles/ubuntu1804.docker<br>
+++ b/tests/docker/dockerfiles/ubuntu1804.docker<br>
@@ -48,6 +48,7 @@ ENV PACKAGES \<br>
=C2=A0 =C2=A0 =C2=A0make \<br>
=C2=A0 =C2=A0 =C2=A0python3-yaml \<br>
=C2=A0 =C2=A0 =C2=A0python3-sphinx \<br>
+=C2=A0 =C2=A0 python3-sphinx-rtd-theme \<br>
=C2=A0 =C2=A0 =C2=A0ninja-build \<br>
=C2=A0 =C2=A0 =C2=A0sparse \<br>
=C2=A0 =C2=A0 =C2=A0xfslibs-dev<br>
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dock=
erfiles/ubuntu2004.docker<br>
index 9750016e51..f1e0ebad49 100644<br>
--- a/tests/docker/dockerfiles/ubuntu2004.docker<br>
+++ b/tests/docker/dockerfiles/ubuntu2004.docker<br>
@@ -58,6 +58,7 @@ ENV PACKAGES flex bison \<br>
=C2=A0 =C2=A0 =C2=A0python3-pil \<br>
=C2=A0 =C2=A0 =C2=A0python3-pip \<br>
=C2=A0 =C2=A0 =C2=A0python3-sphinx \<br>
+=C2=A0 =C2=A0 python3-sphinx-rtd-theme \<br>
=C2=A0 =C2=A0 =C2=A0python3-venv \<br>
=C2=A0 =C2=A0 =C2=A0python3-yaml \<br>
=C2=A0 =C2=A0 =C2=A0rpm2cpio \<br>
-- <br>
2.29.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a8ce7005be6203c1--

