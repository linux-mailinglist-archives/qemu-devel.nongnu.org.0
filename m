Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F05345C8B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 12:14:36 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOezb-0003Bs-5a
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 07:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOey1-0002QQ-0m
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:12:57 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOexz-0006Op-26
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 07:12:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r12so26411079ejr.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SSQPFuTRxrB8Z8QH0tb1ZeY+uvhnYnMkkcVCAurS1VU=;
 b=mJiLoQLiRrtfQjIgTqAsCPcW9uhPiCTPc8mLYpeaTEO6H5ysLvD4DSF8gt3h+Oqirr
 HUD0WobVcOUvv0vriY2DDYJNkLWKcAz5iABsnB3gv3ylwPctS8OdKfnZR1fVMy85akCj
 gvYekrUmTMf1Rwaw/rLyFb2JQ1vGapDbvInGmYko5vhJUsnxBpvMCFSMAtor6m8NJ/d2
 MbPEzgQ3Jp6LTnTlPNYSfBvEXJRUWTfuoGrcoM4cIl/HiuBNX3KSYle5pMvNv9BZK4ai
 aC1JLb7i2GD29VKZ+BK0YBKb9+4tEoCoA/l528QevyOCCIN12bbHWD4D0hLsxLJRU3F/
 rWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SSQPFuTRxrB8Z8QH0tb1ZeY+uvhnYnMkkcVCAurS1VU=;
 b=EdORHmpukOgFeIn/yt7C3xjlaZN9VyPPQykP/F3cPWvT/1PzJW5aIbrWFwZsscltXz
 +z2hJJv4E3xdPzHD54Zo9asFhDZUHBhtdbNDxbUSPK2804nEcvNwSPrg+96n/mkM0PDU
 MYj1zQNZuQy7zedjZ3ErU/41QewecDNWJw3qNPvThA3NS+VfIgVnSmu8qpH32doWoQPb
 E9InqhB+wDDFM5nCfYILhuuB/eFTU5cZpVTPRs+lQD3wn0m5cZDc/WKOD/dguUPpEGvW
 aT1VkHW3YbKtUEakFXepotBrPIDrgRJ7ENdnG1I/HsZrQlpkrZ27mufLbGhbRrCk3taV
 tKtg==
X-Gm-Message-State: AOAM532VOEOL1x3qJYAObAEr1iLeCRXU9rhMWIPBOaxRTDbPA90Sy+Ed
 0sGIpGwnIV3VaAbmmu2cGjJlsyzO877BvkpG7Ds=
X-Google-Smtp-Source: ABdhPJzKvyj7eFfQf8Jey9xv5lOlmpeNwdgKj05CTiya2vezexchdhDw1yr5upWDxgeK9mOZhP3bVLdWT+Y9MCh61I4=
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr4377140ejc.105.1616497973624; 
 Tue, 23 Mar 2021 04:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210322105234.3932691-1-marcandre.lureau@redhat.com>
 <YFnCfhiaixbn7lMy@redhat.com>
 <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
In-Reply-To: <CAFEAcA_f2fMmVS=Pt6Zd7Si5L2YfRMH+dJZ_pZd=E-neKpxUOg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 23 Mar 2021 15:12:41 +0400
Message-ID: <CAJ+F1C+K5q+86Sfq8wQBf5syNeWsF4MNBSsKQRv35izo7uxCGA@mail.gmail.com>
Subject: Re: [PATCH v4] sphinx: adopt kernel readthedoc theme
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007f842405be3243be"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: John Snow <jsnow@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f842405be3243be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 23, 2021 at 3:01 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 23 Mar 2021 at 10:27, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> >
> > On Mon, Mar 22, 2021 at 02:52:34PM +0400, marcandre.lureau@redhat.com
> wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > The default "alabaster" sphinx theme has a couple shortcomings:
> > > - the navbar moves along the page
> > > - the search bar is not always at the same place
> > > - it lacks some contrast and colours
> > >
> > > The "rtd" theme from readthedocs.org is a popular third party theme
> used
> > > notably by the kernel, with a custom style sheet. I like it better,
> > > perhaps others do too. It also simplify "Edit on Gitlab" links.
>
> > >  # Add any paths that contain custom static files (such as style
> sheets) here,
> > >  # relative to this directory. They are copied after the builtin
> static files,
> > >  # so a file named "default.css" will overwrite the builtin
> "default.css".
> > > -# QEMU doesn't yet have any static files, so comment this out so we
> don't
> > > -# get a warning about a missing directory.
> > > -# If we do ever add this then it would probably be better to call th=
e
> > > -# subdirectory sphinx_static, as the Linux kernel does.
> > > -# html_static_path =3D ['_static']
> > > +html_static_path =3D [os.path.join(qemu_docdir, "sphinx-static")]
> > > +
> > > +html_css_files =3D [
> > > +    'theme_overrides.css',
> > > +]
> >
> > Does this still have a good result in the case where we fall back
> > to alabaster theme ?
>
> How much do we want to retain support for multiple themes? When
> I was first putting in the Sphinx documentation I found that some
> things were kind of theme-specific, in that tweaking things to look
> and read sensibly in one theme made them look a bit weird in another.
> If we said "we support only the rtd theme and mandate it" would that
> cause much pain for downstreams and end-users ?
>

I don't expect it to be a problem: with this patch, we have the same
requirement as the kernel: rtd is the default supported theme, alabaster is
a fallback (with the minor styles hiccups/incompatibilities it may have)


--=20
Marc-Andr=C3=A9 Lureau

--0000000000007f842405be3243be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 3:01 PM Peter Maydell=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Tue, 23 Mar 2021 at 10:27, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:b=
errange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Mon, Mar 22, 2021 at 02:52:34PM +0400, <a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:=
<br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The default &quot;alabaster&quot; sphinx theme has a couple short=
comings:<br>
&gt; &gt; - the navbar moves along the page<br>
&gt; &gt; - the search bar is not always at the same place<br>
&gt; &gt; - it lacks some contrast and colours<br>
&gt; &gt;<br>
&gt; &gt; The &quot;rtd&quot; theme from <a href=3D"http://readthedocs.org"=
 rel=3D"noreferrer" target=3D"_blank">readthedocs.org</a> is a popular thir=
d party theme used<br>
&gt; &gt; notably by the kernel, with a custom style sheet. I like it bette=
r,<br>
&gt; &gt; perhaps others do too. It also simplify &quot;Edit on Gitlab&quot=
; links.<br>
<br>
&gt; &gt;=C2=A0 # Add any paths that contain custom static files (such as s=
tyle sheets) here,<br>
&gt; &gt;=C2=A0 # relative to this directory. They are copied after the bui=
ltin static files,<br>
&gt; &gt;=C2=A0 # so a file named &quot;default.css&quot; will overwrite th=
e builtin &quot;default.css&quot;.<br>
&gt; &gt; -# QEMU doesn&#39;t yet have any static files, so comment this ou=
t so we don&#39;t<br>
&gt; &gt; -# get a warning about a missing directory.<br>
&gt; &gt; -# If we do ever add this then it would probably be better to cal=
l the<br>
&gt; &gt; -# subdirectory sphinx_static, as the Linux kernel does.<br>
&gt; &gt; -# html_static_path =3D [&#39;_static&#39;]<br>
&gt; &gt; +html_static_path =3D [os.path.join(qemu_docdir, &quot;sphinx-sta=
tic&quot;)]<br>
&gt; &gt; +<br>
&gt; &gt; +html_css_files =3D [<br>
&gt; &gt; +=C2=A0 =C2=A0 &#39;theme_overrides.css&#39;,<br>
&gt; &gt; +]<br>
&gt;<br>
&gt; Does this still have a good result in the case where we fall back<br>
&gt; to alabaster theme ?<br>
<br>
How much do we want to retain support for multiple themes? When<br>
I was first putting in the Sphinx documentation I found that some<br>
things were kind of theme-specific, in that tweaking things to look<br>
and read sensibly in one theme made them look a bit weird in another.<br>
If we said &quot;we support only the rtd theme and mandate it&quot; would t=
hat<br>
cause much pain for downstreams and end-users ?<br></blockquote><div><br></=
div><div>I don&#39;t expect it to be a problem: with this patch, we have th=
e same requirement as the kernel: rtd is the default supported theme, alaba=
ster is a fallback (with the minor styles hiccups/incompatibilities it may =
have)<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007f842405be3243be--

