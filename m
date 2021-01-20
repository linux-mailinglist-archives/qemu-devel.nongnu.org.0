Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9172FD00E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 13:31:24 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Cdv-0004Ye-6R
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 07:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2Cc3-00046a-LN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:29:27 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2Cc1-0000VB-DX
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:29:27 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id e67so10710766ybc.12
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 04:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JlT9fEH1Zbp387Z4wAi4/exmTy9w6SaGqnKT346wAvY=;
 b=AoWylNtyqcuLLjtzczt80oBI0aS956MNPclnmBwazFaYMCyN4v9Ouy64Ng2HFuSy9F
 SnK5BI/+HkDHD2ayPtx+gXScZ0Uyik5agTG7/iztooYosNNTsJd0fIYvNMdeacAJvzkB
 5/0moWlK2F7B19BT0j2PbuFP0srDdxlY4YnZyUdFBoKNpovlOKnsC9mQ2Z7XSni4pY6y
 AI+fAyn83hVtd1PtyJkbOnfonjlfVAUPA0/1TAbh5c5BArlxXlUSENyVmpxRrEVfnaqn
 FyhrmywWo0orwc8629s2Zqn6Lrj7R42Guti9fMGh2XXMgSENiNoaUP9oPG2LjbVLZJMO
 OVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JlT9fEH1Zbp387Z4wAi4/exmTy9w6SaGqnKT346wAvY=;
 b=BlrS14MVC3lHVEeY50Y/DteXEMTAS9V1wQwqAuOOeuRBE8wKA532SlsFfvyvimhgov
 8VIdWIopDPq7TW/J0hmho52mcL2NItLtJIPayPF0nUJD3lrVlxbjV/PQtjeSBWyh5wXF
 CKwlKPXpYrECLAS5ciBDQBCHzIFuA3r1jJxNoZ/yobateMISRLVeE8Qj6xRnEVkIgQdB
 CZ3D437Mu/SYVo4RFE7Shm6KSU2N6kp4KESu+JxHX3BtuTt0a1NSMaXrWvJeCNvOK76s
 ht5OMAh9Gkt6pCMOum7UA66O+W439HkxvBNKkm99qXGwMKHOB4yE2l6+/nLAHbpp163I
 jmoA==
X-Gm-Message-State: AOAM531neDn1w6Az68awvCYDzTGIoNCSy6ILd2fhGDPjjbJTNOsFEpdU
 K0dbG964snyl77QoceiFI74oZ/1KXfsyVOhTOGg=
X-Google-Smtp-Source: ABdhPJyLG4rl56rahPf0IjMMAjxhv0kYpr1yt7Rav5dBqIpyvtEmkqHqSgP21EvxmdcQ2TKky6bI7f8f4kSUSpBnsuo=
X-Received: by 2002:a25:3bc5:: with SMTP id
 i188mr12750474yba.332.1611145764360; 
 Wed, 20 Jan 2021 04:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20210120102556.125012-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210120102556.125012-1-marcandre.lureau@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Jan 2021 20:29:13 +0800
Message-ID: <CAEUhbmXjO434ik9RWLhxsdkXLYJv2h_f3miFYUA3jGfZ1fcaow@mail.gmail.com>
Subject: Re: [PATCH v3] sphinx: adopt kernel readthedoc theme
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Wed, Jan 20, 2021 at 6:26 PM <marcandre.lureau@redhat.com> wrote:
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
>  docs/_templates/editpage.html              |   5 -
>  docs/conf.py                               |  47 +++---
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
>  14 files changed, 193 insertions(+), 55 deletions(-)
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
> index 2ee6111872..5ee577750b 100644
> --- a/docs/conf.py
> +++ b/docs/conf.py
> @@ -151,37 +151,44 @@ with open(os.path.join(qemu_docdir, 'defs.rst.inc')=
) as f:
>  # a list of builtin themes.
>  #
>  html_theme =3D 'alabaster'
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

Still, there is a trailing space here

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

Tested-by: Bin Meng <bmeng.cn@gmail.com>

