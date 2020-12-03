Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C32CD373
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:29:49 +0100 (CET)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklrw-0003Bg-EA
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kklqt-0002cn-GD
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:28:43 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kklqr-00010l-By
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:28:43 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so2704174ejb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xi92osUfO1f7LuwwZHDkgFBkus4YPIgsX6vxbnxwxQ=;
 b=H1UXmtPo7A5HG347A9AGwTNWqwckY7BMKqdyJWoKBl7KTcx1G5CxdnuP8Obff7SU0S
 /Uaq3zee4bk1JX3cu+05YVD8mBmC2NGtDRSHps5iZPUFoCvIOlJtLJY8jqU5/HrdYUsQ
 0WpZq1iJWr0egtnAZg/cgbjnz1RnW+9kUFT0OJIs1U2WfxluKxOayBlYQxvfChRnv/se
 r4njno2uFzGCiKjoYZoPE7pJFinQUwspmkoYxzrF9t3u4u2n6bzcx38tvhV2M2FDaO01
 qT73EyYAgxyQAbZ8EKBvUMQ5B3N6qGGPUEguQq89dC1xRADmjgfvAJyD65tJNRXzV1Yu
 cB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xi92osUfO1f7LuwwZHDkgFBkus4YPIgsX6vxbnxwxQ=;
 b=nJ6Oxvlx5Jo3ORQVPDM7NQwaRWrUdRSiDJ7omeU0+skv1FTDgcvUpvuV+/w5eIlbNh
 gIlAWP2R9KDXMPI5rgbjMnHnxmqwXf2vyFVXWNJxv8FVoidchIOJoBLcmu2vrkjnZAvw
 4pU7S/vIVuBHpZFmQac3BKEDvyotEjmIe2oSDXB6j5SlxNh1omJN0VzlH32LJ+UCMuVh
 OI1zLHumQFtHW1JLomP6CAXOsj8VVeKdpfeyUwdOuTRBqbh5aPs0quRibALu2YiznjCT
 uMsVnpn94JD+7iWmMdfXQ0D5EQl8kWwYkoAUNVSf3ZatSm4qJfavQH8DvfjOcaKZl+rk
 O/6w==
X-Gm-Message-State: AOAM5332pRYW6yvO3qcRyChjMlqSZ40EG5W5HzhqWY5axlf/SexkA+jD
 JkwuHD52hwCadSe7YU2Hmmh/fFipIHowm4UA4q3pNox6Jp8=
X-Google-Smtp-Source: ABdhPJyBBfC+nvufagxMA3bwb6qWdCWaaFX1M7LqgOyzMzBscrQRGpULgGEEqu2dNtvTTy/1RCiMg3Jehn0dpUb2Kbk=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr1799950ejx.381.1606991319800; 
 Thu, 03 Dec 2020 02:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20201201183704.299697-1-marcandre.lureau@redhat.com>
 <cca70efa-d001-f4d5-f019-5ec55b7a4349@redhat.com>
 <20201202195508.GI3836@habkost.net>
In-Reply-To: <20201202195508.GI3836@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Dec 2020 14:28:27 +0400
Message-ID: <CAJ+F1CLr9Hv+w-uenYRVC_wm=uBf7_Jx5nY5gTjvWXo9O032QQ@mail.gmail.com>
Subject: Re: [PATCH] docs: set CONFDIR when running sphinx
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c6206a05b58cd29a"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c6206a05b58cd29a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 11:55 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> On Wed, Dec 02, 2020 at 10:05:50AM +0100, Paolo Bonzini wrote:
> > On 01/12/20 19:37, marcandre.lureau@redhat.com wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > The default configuration path /etc/qemu can be overriden with
> configure
> > > options, and the generated documentation used to reflect it.
> > >
> > > Fixes regression introduced in commit
> > > f8aa24ea9a82da38370470c6bc0eaa393999edfe ("meson: sphinx-build").
> > >
> > > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1902537
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >   docs/meson.build | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/docs/meson.build b/docs/meson.build
> > > index ebd85d59f9..bb8fe4c9e4 100644
> > > --- a/docs/meson.build
> > > +++ b/docs/meson.build
> > > @@ -9,7 +9,7 @@ endif
> > >   # Check if tools are available to build documentation.
> > >   build_docs =3D false
> > >   if sphinx_build.found()
> > > -  SPHINX_ARGS =3D [sphinx_build]
> > > +  SPHINX_ARGS =3D ['env', 'CONFDIR=3D' + qemu_confdir, sphinx_build]
> > >     # If we're making warnings fatal, apply this to Sphinx runs as we=
ll
> > >     if get_option('werror')
> > >       SPHINX_ARGS +=3D [ '-W' ]
> > >
> >
> > I can queue the patch, but I also wouldn't mind removing support for
> > /etc/qemu completely.  I'm not sure why one would use it.  Eduardo?
>
> I agree, and I had a series for this 3 years ago.
>
> I guess I need to my keep my word and finally submit v5 of the series:
>
> https://lore.kernel.org/qemu-devel/20171005123414.GE4015@localhost.locald=
omain/
>

Note that the original bug that prompted this fix is about qemu-ga
configuration though.

Paolo, please queue the patch. thanks!

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c6206a05b58cd29a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 11:55 PM Edu=
ardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Dec 02, 2020 at 10:05:50AM +0100, Paolo Bonzini wrote:<br>
&gt; On 01/12/20 19:37, <a href=3D"mailto:marcandre.lureau@redhat.com" targ=
et=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; The default configuration path /etc/qemu can be overriden with co=
nfigure<br>
&gt; &gt; options, and the generated documentation used to reflect it.<br>
&gt; &gt; <br>
&gt; &gt; Fixes regression introduced in commit<br>
&gt; &gt; f8aa24ea9a82da38370470c6bc0eaa393999edfe (&quot;meson: sphinx-bui=
ld&quot;).<br>
&gt; &gt; <br>
&gt; &gt; Fixes: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1=
902537" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/sh=
ow_bug.cgi?id=3D1902537</a><br>
&gt; &gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marca=
ndre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&g=
t;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0docs/meson.build | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/docs/meson.build b/docs/meson.build<br>
&gt; &gt; index ebd85d59f9..bb8fe4c9e4 100644<br>
&gt; &gt; --- a/docs/meson.build<br>
&gt; &gt; +++ b/docs/meson.build<br>
&gt; &gt; @@ -9,7 +9,7 @@ endif<br>
&gt; &gt;=C2=A0 =C2=A0# Check if tools are available to build documentation=
.<br>
&gt; &gt;=C2=A0 =C2=A0build_docs =3D false<br>
&gt; &gt;=C2=A0 =C2=A0if sphinx_build.found()<br>
&gt; &gt; -=C2=A0 SPHINX_ARGS =3D [sphinx_build]<br>
&gt; &gt; +=C2=A0 SPHINX_ARGS =3D [&#39;env&#39;, &#39;CONFDIR=3D&#39; + qe=
mu_confdir, sphinx_build]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0# If we&#39;re making warnings fatal, apply th=
is to Sphinx runs as well<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if get_option(&#39;werror&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SPHINX_ARGS +=3D [ &#39;-W&#39; ]<br>
&gt; &gt; <br>
&gt; <br>
&gt; I can queue the patch, but I also wouldn&#39;t mind removing support f=
or<br>
&gt; /etc/qemu completely.=C2=A0 I&#39;m not sure why one would use it.=C2=
=A0 Eduardo?<br>
<br>
I agree, and I had a series for this 3 years ago.<br>
<br>
I guess I need to my keep my word and finally submit v5 of the series:<br>
<a href=3D"https://lore.kernel.org/qemu-devel/20171005123414.GE4015@localho=
st.localdomain/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.o=
rg/qemu-devel/20171005123414.GE4015@localhost.localdomain/</a><br clear=3D"=
all"></blockquote><div><br></div><div>Note that the original bug that promp=
ted this fix is about qemu-ga configuration though.</div><div><br></div><di=
v>Paolo, please queue the patch. thanks!<br></div></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c6206a05b58cd29a--

