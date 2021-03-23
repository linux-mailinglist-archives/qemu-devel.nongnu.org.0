Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84782345C70
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:07:46 +0100 (CET)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOesz-00082r-Ak
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOerY-0007Rf-CG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:06:17 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOerU-0002It-3g
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:06:16 -0400
Received: by mail-ej1-x635.google.com with SMTP id u5so26380587ejn.8
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OWB9A4SkWhtJFDlNnWCWguLmnF5sygzciQDTOHHipQA=;
 b=nP1JsCQECMicQ1kb2HcAgUr53LIDt+QBzaIeKZWZ29mm54f/RorowKeEfAD2WrkFoV
 Q34xOBt+hLY+C7aVQLAJ/eyUYuKpGXKn7gloL1c6RaTjamZK8pvJg0nxnPfFVVZmZnrZ
 bVCoinWVTCj9FnYTzmpBvntqwOgfnRtZV2iNMt+3t8v7qq9bBI518AJD8hRGzlQNJkez
 CuOlfZuZAEWBKwkWNilY9JHuLqtG0r12BT2NCdIeyuV6zO2entAnVIZkbhzyTVyV/DEK
 SzUynI6duUvHrshbkZI605dmwkwL6ecrZGIKxqD8G6NpHhmj1n2lbDe2BHl8Bpp4FZNJ
 z+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OWB9A4SkWhtJFDlNnWCWguLmnF5sygzciQDTOHHipQA=;
 b=glpVj5jqM/Pptpa1Qj1TD6b6/it8aZh9hcFt89Dn354ZW/pNp/fHutJTBRaYguLzmJ
 PTtQks36Fuhy7quYsrEjWBonmmETiNemdKsh6RXk8hqMUXpN7Dw0sg3FPEFYmDtZQ1FM
 do/YKeJs3TYehVyJmWnGLOA5hr2PMDwIvWjsPE9GdSLVAMqjfZ8VNxxziDDLJ+sefO4d
 RombsXEqbtjhmNxbfwrFv4fEGrv72Et4fVFQ0s+0CwwUW60BdzPAWV626ffLgLgIXXcC
 GPfnPEPuitxQTZDotLcju7qb3Ne0vp/cn6CNOkfb8REIPqpN1m1gSD1Cm5sUt8bYHrqA
 TuSQ==
X-Gm-Message-State: AOAM532Jc2BTs4RvF49QJip//RYeszxHD66cYfSzeOMXJfaNC1Vz5EXd
 XjkSrdzh1/8N+cLJ1UPhpGwmPZDcmaNVPO2v+OE=
X-Google-Smtp-Source: ABdhPJzBqhhfecDmlTpyjqm4rHDcPM1HzYVOLDJ7d6CXoX8K5uRy8r96PaCGuNRmN4fJP/YNJFYGRw2PytUjpYopEWU=
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr4355207eju.532.1616497569949; 
 Tue, 23 Mar 2021 04:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
In-Reply-To: <YFnCfhiaixbn7lMy@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 23 Mar 2021 15:05:57 +0400
Message-ID: <CAJ+F1CLbEx+n26ZfdAxaV_CrUVYV02W_eDzqm71u0_z1qjo6Sg@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006fed6005be322bcf"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006fed6005be322bcf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 23, 2021 at 2:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Mar 22, 2021 at 02:52:34PM +0400, marcandre.lureau@redhat.com
> wrote:
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
>
> s/simplify/simplifies the/
>
>
ok

>
> > Tweak a bit the custom theme to match qemu.org style, use the
> > QEMU logo, and favicon etc.
> >
> > Screenshot:
> >
> https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-document=
ation-QEMU-documentation.png
>
> I'd drop this from the commit message unless you're confident
> this link will remain alive indefinitely.
>

No, I'll drop it.


> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Tested-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> > v4:
> >  - resend (with Bin T-b, and with minor style fixes)
> >
> >  docs/_templates/editpage.html              |   5 -
> >  docs/conf.py                               |  50 ++++---
> >  docs/devel/_templates/editpage.html        |   5 -
> >  docs/interop/_templates/editpage.html      |   5 -
> >  docs/specs/_templates/editpage.html        |   5 -
> >  docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++
> >  docs/system/_templates/editpage.html       |   5 -
> >  docs/tools/_templates/editpage.html        |   5 -
> >  docs/user/_templates/editpage.html         |   5 -
> >  tests/docker/dockerfiles/debian10.docker   |   1 +
> >  tests/docker/dockerfiles/fedora.docker     |   1 +
> >  tests/docker/dockerfiles/ubuntu.docker     |   1 +
> >  tests/docker/dockerfiles/ubuntu1804.docker |   1 +
> >  tests/docker/dockerfiles/ubuntu2004.docker |   1 +
> >  14 files changed, 196 insertions(+), 55 deletions(-)
> >  delete mode 100644 docs/_templates/editpage.html
> >  delete mode 100644 docs/devel/_templates/editpage.html
> >  delete mode 100644 docs/interop/_templates/editpage.html
> >  delete mode 100644 docs/specs/_templates/editpage.html
> >  create mode 100644 docs/sphinx-static/theme_overrides.css
> >  delete mode 100644 docs/system/_templates/editpage.html
> >  delete mode 100644 docs/tools/_templates/editpage.html
> >  delete mode 100644 docs/user/_templates/editpage.html
> >
> > diff --git a/docs/_templates/editpage.html
> b/docs/_templates/editpage.html
> > deleted file mode 100644
> > index 4319b0f5ac..0000000000
> > --- a/docs/_templates/editpage.html
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -<div id=3D"editpage">
> > -  <ul>
> > -    <li><a href=3D"
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst"=
>Page
> source</a></li>
> > -  </ul>
> > -</div>
> > diff --git a/docs/conf.py b/docs/conf.py
> > index 2ee6111872..17e0319d69 100644
> > --- a/docs/conf.py
> > +++ b/docs/conf.py
> > @@ -151,37 +151,47 @@
> >  # a list of builtin themes.
> >  #
> >  html_theme =3D 'alabaster'
> > +try:
> > +    import sphinx_rtd_theme
> > +    html_theme =3D 'sphinx_rtd_theme'
> > +except ImportError:
> > +    sys.stderr.write(
> > +        'Warning: The Sphinx \'sphinx_rtd_theme\' HTML theme was not
> found. '
> > +        'Make sure you have the theme installed to produce pretty HTML=
 '
> > +        'output. Falling back to the default theme.\n')
> >
> >  # Theme options are theme-specific and customize the look and feel of =
a
> theme
> >  # further.  For a list of options available for each theme, see the
> >  # documentation.
> > -# We initialize this to empty here, so the per-manual conf.py can just
> > -# add individual key/value entries.
> > -html_theme_options =3D {
> > -}
> > +if html_theme =3D=3D 'sphinx_rtd_theme':
> > +    html_theme_options =3D {
> > +        "style_nav_header_background": "#802400",
> > +    }
> > +
> > +html_logo =3D os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png"=
)
> > +
> > +html_favicon =3D os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png=
")
> >
> >  # Add any paths that contain custom static files (such as style sheets=
)
> here,
> >  # relative to this directory. They are copied after the builtin static
> files,
> >  # so a file named "default.css" will overwrite the builtin
> "default.css".
> > -# QEMU doesn't yet have any static files, so comment this out so we
> don't
> > -# get a warning about a missing directory.
> > -# If we do ever add this then it would probably be better to call the
> > -# subdirectory sphinx_static, as the Linux kernel does.
> > -# html_static_path =3D ['_static']
> > +html_static_path =3D [os.path.join(qemu_docdir, "sphinx-static")]
> > +
> > +html_css_files =3D [
> > +    'theme_overrides.css',
> > +]
>
> Does this still have a good result in the case where we fall back
> to alabaster theme ?
>

Yes (I can't see much difference)


> > +
> > +html_context =3D {
> > +    "display_gitlab": True,
> > +    "gitlab_user": "qemu-project",
> > +    "gitlab_repo": "qemu",
> > +    "gitlab_version": "master",
> > +    "conf_py_path": "/docs/", # Path in the checkout to the docs root
> > +}
> >
> >  # Custom sidebar templates, must be a dictionary that maps document
> names
> >  # to template names.
> > -#
> > -# This is required for the alabaster theme
> > -# refs:
> http://alabaster.readthedocs.io/en/latest/installation.html#sidebars
> > -html_sidebars =3D {
> > -    '**': [
> > -        'about.html',
> > -        'editpage.html',
> > -        'navigation.html',
> > -        'searchbox.html',
> > -    ]
> > -}
>
> Aren't these still needed when we fall back to the alabaster theme ?
>

No difference with the default for me.


> Well the editpage.html can be dropped without real harm, but the
> navigation.html looks pretty important to me.
>
> > +#html_sidebars =3D {}
> >
> >  # Don't copy the rST source files to the HTML output directory,
> >  # and don't put links to the sources into the output HTML.
>
>
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006fed6005be322bcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 2:28 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Mar 22, 2021 at 02:52:34PM +0400, <a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The default &quot;alabaster&quot; sphinx theme has a couple shortcomin=
gs:<br>
&gt; - the navbar moves along the page<br>
&gt; - the search bar is not always at the same place<br>
&gt; - it lacks some contrast and colours<br>
&gt; <br>
&gt; The &quot;rtd&quot; theme from <a href=3D"http://readthedocs.org" rel=
=3D"noreferrer" target=3D"_blank">readthedocs.org</a> is a popular third pa=
rty theme used<br>
&gt; notably by the kernel, with a custom style sheet. I like it better,<br=
>
&gt; perhaps others do too. It also simplify &quot;Edit on Gitlab&quot; lin=
ks.<br>
<br>
s/simplify/simplifies the/<br>
<br></blockquote><div><br></div><div>ok</div><div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Tweak a bit the custom theme to match <a href=3D"http://qemu.org" rel=
=3D"noreferrer" target=3D"_blank">qemu.org</a> style, use the<br>
&gt; QEMU logo, and favicon etc.<br>
&gt; <br>
&gt; Screenshot:<br>
&gt; <a href=3D"https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-Q=
EMU-s-documentation-QEMU-documentation.png" rel=3D"noreferrer" target=3D"_b=
lank">https://i.ibb.co/XWwG1bZ/Screenshot-2021-01-20-Welcome-to-QEMU-s-docu=
mentation-QEMU-documentation.png</a><br>
<br>
I&#39;d drop this from the commit message unless you&#39;re confident<br>
this link will remain alive indefinitely.<br></blockquote><div><br></div><d=
iv>No, I&#39;ll drop it.</div><div> <br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Tested-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=
=3D"_blank">bmeng.cn@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v4:<br>
&gt;=C2=A0 - resend (with Bin T-b, and with minor style fixes)<br>
&gt; <br>
&gt;=C2=A0 docs/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 50 ++++-=
--<br>
&gt;=C2=A0 docs/devel/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/interop/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/specs/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/sphinx-static/theme_overrides.css=C2=A0 =C2=A0 =C2=A0| 161 =
+++++++++++++++++++++<br>
&gt;=C2=A0 docs/system/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/tools/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 docs/user/_templates/editpage.html=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A05 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian10.docker=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/docker/dockerfiles/ubuntu.docker=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/docker/dockerfiles/ubuntu1804.docker |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/docker/dockerfiles/ubuntu2004.docker |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 14 files changed, 196 insertions(+), 55 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 docs/_templates/editpage.html<br>
&gt;=C2=A0 delete mode 100644 docs/devel/_templates/editpage.html<br>
&gt;=C2=A0 delete mode 100644 docs/interop/_templates/editpage.html<br>
&gt;=C2=A0 delete mode 100644 docs/specs/_templates/editpage.html<br>
&gt;=C2=A0 create mode 100644 docs/sphinx-static/theme_overrides.css<br>
&gt;=C2=A0 delete mode 100644 docs/system/_templates/editpage.html<br>
&gt;=C2=A0 delete mode 100644 docs/tools/_templates/editpage.html<br>
&gt;=C2=A0 delete mode 100644 docs/user/_templates/editpage.html<br>
&gt; <br>
&gt; diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.=
html<br>
&gt; deleted file mode 100644<br>
&gt; index 4319b0f5ac..0000000000<br>
&gt; --- a/docs/_templates/editpage.html<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,5 +0,0 @@<br>
&gt; -&lt;div id=3D&quot;editpage&quot;&gt;<br>
&gt; -=C2=A0 &lt;ul&gt;<br>
&gt; -=C2=A0 =C2=A0 &lt;li&gt;&lt;a href=3D&quot;<a href=3D"https://gitlab.=
com/qemu-project/qemu/-/blob/master/docs/%7B%7Bpagename%7D%7D.rst" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/ma=
ster/docs/{{pagename}}.rst</a>&quot;&gt;Page source&lt;/a&gt;&lt;/li&gt;<br=
>
&gt; -=C2=A0 &lt;/ul&gt;<br>
&gt; -&lt;/div&gt;<br>
&gt; diff --git a/docs/conf.py b/docs/conf.py<br>
&gt; index 2ee6111872..17e0319d69 100644<br>
&gt; --- a/docs/conf.py<br>
&gt; +++ b/docs/conf.py<br>
&gt; @@ -151,37 +151,47 @@<br>
&gt;=C2=A0 # a list of builtin themes.<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 html_theme =3D &#39;alabaster&#39;<br>
&gt; +try:<br>
&gt; +=C2=A0 =C2=A0 import sphinx_rtd_theme<br>
&gt; +=C2=A0 =C2=A0 html_theme =3D &#39;sphinx_rtd_theme&#39;<br>
&gt; +except ImportError:<br>
&gt; +=C2=A0 =C2=A0 sys.stderr.write(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Warning: The Sphinx \&#39;sphinx_rtd=
_theme\&#39; HTML theme was not found. &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Make sure you have the theme install=
ed to produce pretty HTML &#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;output. Falling back to the default =
theme.\n&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Theme options are theme-specific and customize the look and fe=
el of a theme<br>
&gt;=C2=A0 # further.=C2=A0 For a list of options available for each theme,=
 see the<br>
&gt;=C2=A0 # documentation.<br>
&gt; -# We initialize this to empty here, so the per-manual conf.py can jus=
t<br>
&gt; -# add individual key/value entries.<br>
&gt; -html_theme_options =3D {<br>
&gt; -}<br>
&gt; +if html_theme =3D=3D &#39;sphinx_rtd_theme&#39;:<br>
&gt; +=C2=A0 =C2=A0 html_theme_options =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;style_nav_header_background&quot;: =
&quot;#802400&quot;,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +html_logo =3D os.path.join(qemu_docdir, &quot;../ui/icons/qemu_128x12=
8.png&quot;)<br>
&gt; +<br>
&gt; +html_favicon =3D os.path.join(qemu_docdir, &quot;../ui/icons/qemu_32x=
32.png&quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add any paths that contain custom static files (such as style =
sheets) here,<br>
&gt;=C2=A0 # relative to this directory. They are copied after the builtin =
static files,<br>
&gt;=C2=A0 # so a file named &quot;default.css&quot; will overwrite the bui=
ltin &quot;default.css&quot;.<br>
&gt; -# QEMU doesn&#39;t yet have any static files, so comment this out so =
we don&#39;t<br>
&gt; -# get a warning about a missing directory.<br>
&gt; -# If we do ever add this then it would probably be better to call the=
<br>
&gt; -# subdirectory sphinx_static, as the Linux kernel does.<br>
&gt; -# html_static_path =3D [&#39;_static&#39;]<br>
&gt; +html_static_path =3D [os.path.join(qemu_docdir, &quot;sphinx-static&q=
uot;)]<br>
&gt; +<br>
&gt; +html_css_files =3D [<br>
&gt; +=C2=A0 =C2=A0 &#39;theme_overrides.css&#39;,<br>
&gt; +]<br>
<br>
Does this still have a good result in the case where we fall back<br>
to alabaster theme ?<br></blockquote><div><br></div><div>Yes (I can&#39;t s=
ee much difference)<br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt; +<br>
&gt; +html_context =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;display_gitlab&quot;: True,<br>
&gt; +=C2=A0 =C2=A0 &quot;gitlab_user&quot;: &quot;qemu-project&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;gitlab_repo&quot;: &quot;qemu&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;gitlab_version&quot;: &quot;master&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;conf_py_path&quot;: &quot;/docs/&quot;, # Path in=
 the checkout to the docs root<br>
&gt; +}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Custom sidebar templates, must be a dictionary that maps docum=
ent names<br>
&gt;=C2=A0 # to template names.<br>
&gt; -#<br>
&gt; -# This is required for the alabaster theme<br>
&gt; -# refs: <a href=3D"http://alabaster.readthedocs.io/en/latest/installa=
tion.html#sidebars" rel=3D"noreferrer" target=3D"_blank">http://alabaster.r=
eadthedocs.io/en/latest/installation.html#sidebars</a><br>
&gt; -html_sidebars =3D {<br>
&gt; -=C2=A0 =C2=A0 &#39;**&#39;: [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;about.html&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;editpage.html&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;navigation.html&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;searchbox.html&#39;,<br>
&gt; -=C2=A0 =C2=A0 ]<br>
&gt; -}<br>
<br>
Aren&#39;t these still needed when we fall back to the alabaster theme ?<br=
></blockquote><div><br></div><div>No difference with the default for me.<br=
></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Well the editpage.html can be dropped without real harm, but the<br>
navigation.html looks pretty important to me.<br>
<br>
&gt; +#html_sidebars =3D {}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Don&#39;t copy the rST source files to the HTML output directo=
ry,<br>
&gt;=C2=A0 # and don&#39;t put links to the sources into the output HTML.<b=
r>
<br>
<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006fed6005be322bcf--

