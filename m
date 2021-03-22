Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD383343ED2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:05:52 +0100 (CET)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOINb-0004it-Rp
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOIHj-0000F9-Gk
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lOIHe-0007T2-I1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ISGXTUea0+j8A7+kcMw6Wxg4DUsMX0+y5YDZ8DW2I7U=;
 b=BkZeOxoXQG5dJBRrS0RrDUXIFo73Q3fA75zGfGRq0xYCeq3komPC0zZSFURH8wz4K6B+ab
 i9V9njYhDYelkRJRFOb/Swknz8OC7OGPjOc5Xk/NcVyMvX6lqnxMjUYpFgkEu0k8U34MvT
 AKCEWuzzwt/vxJqTe0VfO1MqmT+GUy8=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-xBbYLLC5PuSekKDA8fdaRA-1; Mon, 22 Mar 2021 06:59:37 -0400
X-MC-Unique: xBbYLLC5PuSekKDA8fdaRA-1
Received: by mail-io1-f69.google.com with SMTP id d4so33574814ioc.16
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISGXTUea0+j8A7+kcMw6Wxg4DUsMX0+y5YDZ8DW2I7U=;
 b=OaZPGO+Fg1j9u/ZibNsjokcvdi44nTNXrL4Bn01l9CkQtzmz2rV+UDn9QnQnvHVzhI
 BKafU5UAn2W1GPyDL6h5xsHzyjdYDSvVLlOXB3b4c9RJnheCLa8wgJbfS79ETEDOUTkc
 hcB115yqg+q7T3xcYbNrZuJhKFmVe82IqGfinkjWrXhZrO8MdAow4iPKBDJkWB8r+BYM
 52Zw+P6zxXORGNSKp8988eR4oXUMgblk36e6SVuxrfIKPdXV/DjIvax4jLilY2zFS4RL
 TnMFOHd56QoqDz2HH0+EW67naOhxVApqJnSiS2hjTZDCQ0YarlXoNro3mj8cy1zS/48o
 L4Rg==
X-Gm-Message-State: AOAM530fyXZpModjgx+MM91n2WDGoMyU4nFB4iZzF8Ivma6eloIP5Kp3
 8vPH43qNPr8KpcdxJRoLGkmq2kZkVbDpu8EEIdPbwOVoKD4ZJvSKPeES9VB7zuuzjdbxu6QXi+A
 u6iXBSkPZaGSV7IjisEwq5ki75ZdAC/8=
X-Received: by 2002:a05:6602:2e82:: with SMTP id
 m2mr10120668iow.70.1616410776611; 
 Mon, 22 Mar 2021 03:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxreMO1mtPH1bf4A6sDZ5mpFeqhR/r3zkOg7TOYNktDj925rwQ0mVMJTymGfYnql1SmzxO7T9ssvyPIoXpzO+0=
X-Received: by 2002:a05:6602:2e82:: with SMTP id
 m2mr10120657iow.70.1616410776372; 
 Mon, 22 Mar 2021 03:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 22 Mar 2021 14:59:25 +0400
Message-ID: <CAMxuvaxZfpSS-5+_hbUjQ78u253FkEi+BiZAVn=YOV7RugzB0w@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000023193005be1df630"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 bmeng.cn@gmail.com, "P. Berrange, Daniel" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000023193005be1df630
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 22, 2021 at 2:52 PM <marcandre.lureau@redhat.com> wrote:

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
>
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-document=
ation-QEMU-documentation.png


Sorry, this link is outdated now. Here is a more stable one:
https://elmarco.fedorapeople.org/Screenshot_2021-03-22%20Welcome%20to%20QEM=
U%e2%80%99s%20documentation%20%e2%80%94%20QEMU%20documentation.png


>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> v4:
>  - resend (with Bin T-b, and with minor style fixes)
>
>  docs/_templates/editpage.html              |   5 -
>  docs/conf.py                               |  50 ++++---
>  docs/devel/_templates/editpage.html        |   5 -
>  docs/interop/_templates/editpage.html      |   5 -
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
>  14 files changed, 196 insertions(+), 55 deletions(-)
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
> -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst"=
>Page
> source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/conf.py b/docs/conf.py
> index 2ee6111872..17e0319d69 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -151,37 +151,47 @@
>  # a list of builtin themes.
>  #
>  html_theme =3D 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +    html_theme =3D 'sphinx_rtd_theme'
> +except ImportError:
> +    sys.stderr.write(
> +        'Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not
> found. '
> +        'Make sure you have the theme installed to produce pretty HTML '
> +        'output. Falling back to the default theme.\n')
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

--00000000000023193005be1df630
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 2:52 PM &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
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
perhaps others do too. It also simplify &quot;Edit on Gitlab&quot; links.<b=
r>
<br>
Tweak a bit the custom theme to match <a href=3D"http://qemu.org" rel=3D"no=
referrer" target=3D"_blank">qemu.org</a> style, use the<br>
QEMU logo, and favicon etc.<br>
<br>
Screenshot:<br>
<a href=3D"https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s=
-documentation-QEMU-documentation.png" rel=3D"noreferrer" target=3D"_blank"=
>https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documenta=
tion-QEMU-documentation.png</a></blockquote><div><br></div><div>Sorry, this=
 link is outdated now. Here is a more stable one:<br></div><div><a href=3D"=
https://elmarco.fedorapeople.org/Screenshot_2021-03-22%20Welcome%20to%20QEM=
U%e2%80%99s%20documentation%20%e2%80%94%20QEMU%20documentation.png">https:/=
/elmarco.fedorapeople.org/Screenshot_2021-03-22%20Welcome%20to%20QEMU%e2%80=
%99s%20documentation%20%e2%80%94%20QEMU%20documentation.png</a></div><div><=
br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Tested-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_bl=
ank">bmeng.cn@gmail.com</a>&gt;<br>
---<br>
v4:<br>
=C2=A0- resend (with Bin T-b, and with minor style fixes)<br>
<br>
=C2=A0docs/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 -<br>
=C2=A0docs/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 50 ++++---<b=
r>
=C2=A0docs/devel/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 -<br>
=C2=A0docs/interop/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 -<br>
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
=C2=A014 files changed, 196 insertions(+), 55 deletions(-)<br>
=C2=A0delete mode 100644 docs/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/devel/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/interop/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/specs/_templates/editpage.html<br>
=C2=A0create mode 100644 docs/sphinx-static/theme_overrides.css<br>
=C2=A0delete mode 100644 docs/system/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/tools/_templates/editpage.html<br>
=C2=A0delete mode 100644 docs/user/_templates/editpage.html<br>
<br>
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
index 2ee6111872..17e0319d69 100644<br>
--- a/docs/conf.py<br>
+++ b/docs/conf.py<br>
@@ -151,37 +151,47 @@<br>
=C2=A0# a list of builtin themes.<br>
=C2=A0#<br>
=C2=A0html_theme =3D &#39;alabaster&#39;<br>
+try:<br>
+=C2=A0 =C2=A0 import sphinx_rtd_theme<br>
+=C2=A0 =C2=A0 html_theme =3D &#39;sphinx_rtd_theme&#39;<br>
+except ImportError:<br>
+=C2=A0 =C2=A0 sys.stderr.write(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Warning: The Sphinx \&#39;sphinx_rtd_them=
e\&#39; HTML theme was not found. &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Make sure you have the theme installed to=
 produce pretty HTML &#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;output. Falling back to the default theme=
.\n&#39;)<br>
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
</blockquote></div></div>

--00000000000023193005be1df630--


