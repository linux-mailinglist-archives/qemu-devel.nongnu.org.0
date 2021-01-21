Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C132FF69D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 22:00:22 +0100 (CET)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2h41-00043u-Sq
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 16:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2h20-0003U2-Lg
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l2h1x-0004Kc-Tk
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611262693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1zU7ZgDA8NIw1cH8jwyZlgm1XwHN0JXQbcnhaIcxcs=;
 b=UgnNpaY8+wJDqQrA4HbvI0bpA4PKDwEaSfaduh1T64a+3C78Ic6Tyx7rQtdLSNXckn0VxM
 MUl9VQUZr+OW0KlC4GPzE13G9SxH83vamI4pbySI+jsB9kh+7NqSwga6W7ZdFMORydmUi5
 Dfs2bF8gbgMWSQPPxLHTtEBjlB25D8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-zF8y-C0FMG-LGKr6XU7c5w-1; Thu, 21 Jan 2021 15:58:09 -0500
X-MC-Unique: zF8y-C0FMG-LGKr6XU7c5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1796D10054FF;
 Thu, 21 Jan 2021 20:58:08 +0000 (UTC)
Received: from [10.10.113.41] (ovpn-113-41.rdu2.redhat.com [10.10.113.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B13AE39A63;
 Thu, 21 Jan 2021 20:58:01 +0000 (UTC)
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210120102556.125012-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <26032f17-cfbc-1e86-1ca1-10661d4f5cbb@redhat.com>
Date: Thu, 21 Jan 2021 15:58:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120102556.125012-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, berrange@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 5:25 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
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
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-documentation-QEMU-documentation.png
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/_templates/editpage.html              |   5 -
>   docs/conf.py                               |  47 +++---
>   docs/devel/_templates/editpage.html        |   5 -
>   docs/interop/_templates/editpage.html      |   5 -
>   docs/specs/_templates/editpage.html        |   5 -
>   docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
>   docs/system/_templates/editpage.html       |   5 -
>   docs/tools/_templates/editpage.html        |   5 -
>   docs/user/_templates/editpage.html         |   5 -
>   tests/docker/dockerfiles/debian10.docker   |   1 +
>   tests/docker/dockerfiles/fedora.docker     |   1 +
>   tests/docker/dockerfiles/ubuntu.docker     |   1 +
>   tests/docker/dockerfiles/ubuntu1804.docker |   1 +
>   tests/docker/dockerfiles/ubuntu2004.docker |   1 +
>   14 files changed, 193 insertions(+), 55 deletions(-)
>   delete mode 100644 docs/_templates/editpage.html
>   delete mode 100644 docs/devel/_templates/editpage.html
>   delete mode 100644 docs/interop/_templates/editpage.html
>   delete mode 100644 docs/specs/_templates/editpage.html
>   create mode 100644 docs/sphinx-static/theme_overrides.css
>   delete mode 100644 docs/system/_templates/editpage.html
>   delete mode 100644 docs/tools/_templates/editpage.html
>   delete mode 100644 docs/user/_templates/editpage.html
> 
> diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html
> deleted file mode 100644
> index 4319b0f5ac..0000000000
> --- a/docs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/conf.py b/docs/conf.py
> index 2ee6111872..5ee577750b 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -151,37 +151,44 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc')) as f:
>   # a list of builtin themes.
>   #
>   html_theme = 'alabaster'
> +try:
> +    import sphinx_rtd_theme
> +    html_theme = 'sphinx_rtd_theme'
> +except ImportError:
> +    sys.stderr.write('Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.\n')
>   
>   # Theme options are theme-specific and customize the look and feel of a theme
>   # further.  For a list of options available for each theme, see the
>   # documentation.
> -# We initialize this to empty here, so the per-manual conf.py can just
> -# add individual key/value entries.
> -html_theme_options = {
> -}
> +if html_theme == 'sphinx_rtd_theme':
> +    html_theme_options = {
> +        "style_nav_header_background": "#802400",
> +    }
> +

This needs a default for html_theme_options so that if sphinx_rtd_theme 
isn't present, the build doesn't break when using the fallback to 
alabaster; I'm seeing:

Traceback (most recent call last):
   File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361, 
in eval_config_file
     execfile_(filename, namespace)
   File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", line 
81, in execfile_
     exec(code, _globals)
   File "/home/jsnow/src/qemu/docs/user/conf.py", line 15, in <module>
     html_theme_options['description'] = u'User Mode Emulation User''s 
Guide'
NameError: name 'html_theme_options' is not defined

etc.

> +html_logo = os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
> +
> +html_favicon = os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png")
>   
>   # Add any paths that contain custom static files (such as style sheets) here,
>   # relative to this directory. They are copied after the builtin static files,
>   # so a file named "default.css" will overwrite the builtin "default.css".
> -# QEMU doesn't yet have any static files, so comment this out so we don't
> -# get a warning about a missing directory.
> -# If we do ever add this then it would probably be better to call the
> -# subdirectory sphinx_static, as the Linux kernel does.
> -# html_static_path = ['_static']
> +html_static_path = [os.path.join(qemu_docdir, "sphinx-static")]
> +
> +html_css_files = [
> +    'theme_overrides.css',
> +]
> +

We probably don't want this to apply to the alabaster fallback, do we?

(OTOH: It is a fallback, so maybe who cares? Maybe it's not worth the 
complexity to try and support both themes.)

> +html_context = {
> +    "display_gitlab": True,
> +    "gitlab_user": "qemu-project",
> +    "gitlab_repo": "qemu",
> +    "gitlab_version": "master",
> +    "conf_py_path": "/docs/", # Path in the checkout to the docs root
> +}
>   

Could be a separate patch, MAYBE, explaining that this is to enable the 
"Edit on gitlab!" links, which I do think are very cool and useful.

>   # Custom sidebar templates, must be a dictionary that maps document names
>   # to template names.
> -#
> -# This is required for the alabaster theme
> -# refs: http://alabaster.readthedocs.io/en/latest/installation.html#sidebars
> -html_sidebars = {
> -    '**': [
> -        'about.html',
> -        'editpage.html',
> -        'navigation.html',
> -        'searchbox.html',
> -    ]
> -}
> +#html_sidebars = {}
>   

More stuff that damages the alabaster fallback. Putting it back, 
however, causes another problem:

>   # Don't copy the rST source files to the HTML output directory,
>   # and don't put links to the sources into the output HTML.
> diff --git a/docs/devel/_templates/editpage.html b/docs/devel/_templates/editpage.html
> deleted file mode 100644

If you keep html_sidebars, this fails to build because it's gone now. If 
enough distros have the right theme package, I'm leaning towards just 
chopping out the fallback entirely instead of bothering with the messy 
pain of doing both.

--js

> index a86d22bca8..0000000000
> --- a/docs/devel/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/interop/_templates/editpage.html b/docs/interop/_templates/editpage.html
> deleted file mode 100644
> index 215e562681..0000000000
> --- a/docs/interop/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/specs/_templates/editpage.html b/docs/specs/_templates/editpage.html
> deleted file mode 100644
> index aaa468aa98..0000000000
> --- a/docs/specs/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/specs/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/sphinx-static/theme_overrides.css b/docs/sphinx-static/theme_overrides.css
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
> +h1, h2, .rst-content .toctree-wrapper p.caption, h3, h4, h5, h6, legend {
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
> +.wy-side-nav-search input[type="text"] {
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
> +      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 3px 10px 0 rgba(0,0,0,0.19);
> +      border-radius: 5px;
> +}
> +
> +div[class^="highlight"] pre {
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
> +/* Interim: Code-blocks with line nos - lines and line numbers don't line up.
> + * see: https://github.com/rtfd/sphinx_rtd_theme/issues/419
> + */
> +
> +div[class^="highlight"] pre {
> +    line-height: normal;
> +}
> +.rst-content .highlight > pre {
> +    line-height: normal;
> +}
> +
> +/* Keep fields from being strangely far apart due to inheirited table CSS. */
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
> +     * RTD theme's default is 800px as max width for the content, but we have
> +     * tables with tons of columns, which need the full width of the view-port.
> +     */
> +
> +    .wy-nav-content{max-width: none; }
> +
> +    /* table:
> +     *
> +     *   - Sequences of whitespace should collapse into a single whitespace.
> +     *   - make the overflow auto (scrollbar if needed)
> +     *   - align caption "left" ("center" is unsuitable on vast tables)
> +     */
> +
> +    .wy-table-responsive table td { white-space: normal; }
> +    .wy-table-responsive { overflow: auto; }
> +    .rst-content table.docutils caption { text-align: left; font-size: 100%; }
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
> +    .rst-content .section ul li:last-child, .rst-content .section ul li p:last-child {
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
> +    .rst-content tt.literal,.rst-content tt.literal,.rst-content code.literal {
> +        color: inherit;
> +    }
> +}
> diff --git a/docs/system/_templates/editpage.html b/docs/system/_templates/editpage.html
> deleted file mode 100644
> index 6586b2e257..0000000000
> --- a/docs/system/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/tools/_templates/editpage.html b/docs/tools/_templates/editpage.html
> deleted file mode 100644
> index 2a9c8fc92b..0000000000
> --- a/docs/tools/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/tools/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/docs/user/_templates/editpage.html b/docs/user/_templates/editpage.html
> deleted file mode 100644
> index 1f5ee01e60..0000000000
> --- a/docs/user/_templates/editpage.html
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -<div id="editpage">
> -  <ul>
> -    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/user/{{pagename}}.rst">Page source</a></li>
> -  </ul>
> -</div>
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
> index 9d42b5a4b8..957ecdcd50 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -32,6 +32,7 @@ RUN apt update && \
>           psmisc \
>           python3 \
>           python3-sphinx \
> +        python3-sphinx-rtd-theme \
>           $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
>   
>   ENV FEATURES docs
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 0b5053f2d0..db249d1506 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -89,6 +89,7 @@ ENV PACKAGES \
>       python3-pillow \
>       python3-pip \
>       python3-sphinx \
> +    python3-sphinx_rtd_theme \
>       python3-virtualenv \
>       rdma-core-devel \
>       SDL2-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
> index b5ef7a8198..98a527361c 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -63,6 +63,7 @@ ENV PACKAGES \
>       ninja-build \
>       python3-yaml \
>       python3-sphinx \
> +    python3-sphinx-rtd-theme \
>       sparse \
>       xfslibs-dev
>   RUN apt-get update && \
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 9b0a19ba5e..c0d3642507 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -48,6 +48,7 @@ ENV PACKAGES \
>       make \
>       python3-yaml \
>       python3-sphinx \
> +    python3-sphinx-rtd-theme \
>       ninja-build \
>       sparse \
>       xfslibs-dev
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index ae889d8482..33c19e1762 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -55,6 +55,7 @@ ENV PACKAGES flex bison \
>       python3-pil \
>       python3-pip \
>       python3-sphinx \
> +    python3-sphinx-rtd-theme \
>       python3-venv \
>       python3-yaml \
>       rpm2cpio \
> 


