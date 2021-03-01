Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605C327DF4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:13:13 +0100 (CET)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhQG-0005IJ-BI
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:13:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lGhOI-0004LD-Dc
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:11:10 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lGhOG-0000gd-Cv
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 07:11:10 -0500
Received: by mail-ed1-x535.google.com with SMTP id g3so20319930edb.11
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MHRas0I3QL21rvfPJOff0mYc0CJxZjtgvU8c+12o+Q=;
 b=dSwkLERPMOVyWMV6rHfowKbBmTBIwzj+ivqbzwzO8sOZB/47V10FIgPqtv7shQPyZa
 h6gwmvFHMXN4njKm+GssUlqVRNrX+l513F/p9DVUnh00Inl5kDw98moD6ZpxKKwNYJ3/
 YM517Dbta7bo9QGMUYuXYSb/vcFfr8BiY96SFqsphAPxI63ILwN/b42RaJB+KV9OQSGn
 PNdkMzfmfjq1XNcJGxOF4Pb0Iiv6lWnyYUWV4Nf/yGSLhT6Pt8KYX+VJ/VK8QsPG2PmF
 WZCc2o5e8/7jzW7nFawgpkaEtHbOngIo5G4OuNXeQ9fe6yuF1rfXKHXSt6ITVNEEsiHq
 fslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MHRas0I3QL21rvfPJOff0mYc0CJxZjtgvU8c+12o+Q=;
 b=Eb+rOmSaTilM5lf6YJs6tyGSk+xQAyJGAekcTeJpJQcvVtEGbDSbgnEG0OiD/vjXab
 nJwfYMEpcGqA+h8V3ddPjXNDBQMR1nzNhHvuQkquqUXI0FuDDqyd5/TPUiD9CU29pbFq
 3su1k5lPUn2LMRf6FBScqsIA3nKtDzkmigexPd+2mbkqxRtwQLHluVOxJnWfPMH967cq
 VBwElfdaqitFUjFgTwf1x9XPyA1z6gNalglYeti6UU0sCy2+QR9hYYoFX6VsHQjvLGCA
 TCWUuGpHu0HOSM8ntHjuTjsS7U5MZSI0enBHt0EilSnvLYhZIAZwHyg0fZqxBV5MCN6E
 7yqA==
X-Gm-Message-State: AOAM530Jq6Yql/stQ0uvMUE9bAegV8hRBmBJASeddAlhVyQsiPIKrLkC
 KF/M3gyEgaoZmmUY+5W9HCA8hybmoqvQD71gnO8=
X-Google-Smtp-Source: ABdhPJzlpX1BwzcOIbCtd6rd3rU3nuS9A6gdJkBMkaj0sFeDogKyVHTTvC8Th6OojGRQ/hPJ4bz62+pVk1cBsP+He0g=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr1234609edy.30.1614600663619; 
 Mon, 01 Mar 2021 04:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20210209145423.178611-1-konstantin@daynix.com>
 <4ecbde1e-fd10-28a5-10b7-33dda8c7f9a1@redhat.com>
In-Reply-To: <4ecbde1e-fd10-28a5-10b7-33dda8c7f9a1@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Mar 2021 16:10:51 +0400
Message-ID: <CAJ+F1CKciDps3CtVFfuwHPrq0PhA7oEHZoSySM7AauG_zFboWA@mail.gmail.com>
Subject: Re: [PATCH 1/1] qga-vss: Use dynamic linking for GLib
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000025c5305bc788315"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Kostiantyn Kostiuk <konstantin@daynix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000025c5305bc788315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 1, 2021 at 3:46 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Cc'ing Paolo/Marc-Andr=C3=A9/Daniel
>
> On 2/9/21 3:54 PM, Kostiantyn Kostiuk wrote:
> > The current GLib version implements the DllMain function. DllMain is al=
so
> > present in the provider.cpp code. So in the case of static linking, the
> > DllMain redefinition error occurs. For now, just switch to dynamic
> linking
> > and revert this patch when the issue will be solved.
> >
> > See Glib issue for more details
> https://gitlab.gnome.org/GNOME/glib/-/issues/692



It looks like this was fixed recently, but there are a lot of related
discussions:
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1316

If I read the old Makefile right, it's a bug we introduced by commit
7272fc7 (meson: convert vss-win32), since glib was in the -shared list.

So it's legitimate to revert it to me:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> >
> > Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> > ---
> >  qga/vss-win32/meson.build | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
> > index 780c461432..90825edef3 100644
> > --- a/qga/vss-win32/meson.build
> > +++ b/qga/vss-win32/meson.build
> > @@ -1,5 +1,5 @@
> >  if add_languages('cpp', required: false)
> > -  glib_static =3D dependency('glib-2.0', static: true)
> > +  glib_dynamic =3D dependency('glib-2.0', static: false)
> >    link_args =3D cc.get_supported_link_arguments(['-fstack-protector-al=
l',
> '-fstack-protector-strong',
> >
>  '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
> >
> > @@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
> >                  cpp_args: ['-Wno-unknown-pragmas',
> '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
> >                  link_args: link_args,
> >                  vs_module_defs: 'qga-vss.def',
> > -                dependencies: [glib_static, socket,
> > +                dependencies: [glib_dynamic, socket,
> >                                 cc.find_library('ole32'),
> >                                 cc.find_library('oleaut32'),
> >                                 cc.find_library('shlwapi'),
> >
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000025c5305bc788315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 1, 2021 at 3:46 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Cc&#39;ing Paolo/Marc-Andr=C3=A9/Daniel<br>
<br>
On 2/9/21 3:54 PM, Kostiantyn Kostiuk wrote:<br>
&gt; The current GLib version implements the DllMain function. DllMain is a=
lso<br>
&gt; present in the provider.cpp code. So in the case of static linking, th=
e<br>
&gt; DllMain redefinition error occurs. For now, just switch to dynamic lin=
king<br>
&gt; and revert this patch when the issue will be solved.<br>
&gt; <br>
&gt; See Glib issue for more details <a href=3D"https://gitlab.gnome.org/GN=
OME/glib/-/issues/692" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
gnome.org/GNOME/glib/-/issues/692</a></blockquote><div><br></div><div><br><=
/div><div>It looks like this was fixed recently, but there are a lot of rel=
ated discussions:<br></div><div><a href=3D"https://gitlab.gnome.org/GNOME/g=
lib/-/merge_requests/1316">https://gitlab.gnome.org/GNOME/glib/-/merge_requ=
ests/1316</a></div><div><br> </div><div>If I read the old Makefile right, i=
t&#39;s a bug we introduced by commit 7272fc7 (meson: convert vss-win32), s=
ince glib was in the -shared list.</div><div><br></div><div>So it&#39;s leg=
itimate to revert it to me:</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &=
lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.c=
om</a>&gt; </div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
&gt; <br>
&gt; Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@day=
nix.com" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qga/vss-win32/meson.build | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build<br>
&gt; index 780c461432..90825edef3 100644<br>
&gt; --- a/qga/vss-win32/meson.build<br>
&gt; +++ b/qga/vss-win32/meson.build<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 if add_languages(&#39;cpp&#39;, required: false)<br>
&gt; -=C2=A0 glib_static =3D dependency(&#39;glib-2.0&#39;, static: true)<b=
r>
&gt; +=C2=A0 glib_dynamic =3D dependency(&#39;glib-2.0&#39;, static: false)=
<br>
&gt;=C2=A0 =C2=A0 link_args =3D cc.get_supported_link_arguments([&#39;-fsta=
ck-protector-all&#39;, &#39;-fstack-protector-strong&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,--add-stdcall-alias&#39;, &#39;-Wl,=
--enable-stdcall-fixup&#39;])<br>
&gt;=C2=A0 <br>
&gt; @@ -8,7 +8,7 @@ if add_languages(&#39;cpp&#39;, required: false)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpp_args=
: [&#39;-Wno-unknown-pragmas&#39;, &#39;-Wno-delete-non-virtual-dtor&#39;, =
&#39;-Wno-non-virtual-dtor&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_arg=
s: link_args,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs_modul=
e_defs: &#39;qga-vss.def&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies:=
 [glib_static, socket,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies:=
 [glib_dynamic, socket,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;ole32&=
#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;oleaut=
32&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;shlwap=
i&#39;),<br>
&gt; <br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000025c5305bc788315--

