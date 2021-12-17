Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F2478CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:56:53 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDjA-0002Ai-TG
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1myDUA-0007dN-BL
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:41:26 -0500
Received: from [2a00:1450:4864:20::32d] (port=43808
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1myDTq-0000FU-NJ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:41:04 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so1585750wmc.2
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/rRocUMdZ9vNJzxn3TB8FsuKU6F2km7wXC7UAKFpuY=;
 b=kH9+vg6fWwXt7/5JTZJYkGGAzKy4UWgLtNRm36eD5q9D3fvPwr3w++KdGveK7krSBd
 trru/aprG/siwYzysofNPxjQUhzFpRY1X6wI2R4hFeirEpgpXQrwnW8jd4lpNGPFRz2X
 KEOmmo1Plx5nEOPDnr4JTrP8KPK+NL43rJdgLWRuJeTgRXpH991TYM6NfOtEkpHWFhEf
 RY2ufs4xzx8EJnw6s9cyQhTqmOqfblKQCZ6laPV+WDRWt9kaizl+609XGYA4Mz57llZ1
 vXcPK99dUQP9RnBwszmF9vFotOBUT2EJTDbs8F3AFsoCVeQpxdVkdFgAc3D9ZPS9xEm5
 wFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/rRocUMdZ9vNJzxn3TB8FsuKU6F2km7wXC7UAKFpuY=;
 b=JY7VbaRStlgLFVsrhCWAapu7Vl6Z8WC92mZ2e8dLiiHGaNJdVL5owaKrcfpU4b7bor
 g9qmlFG2WA6C4ybKZzN9TTt3GnZgYa+0fQib5oV0mUTMrZy0BPh+5H2nQazKuF/KFsvU
 vBkKexmv08PZea6J4bBsD8eNj5HEtV8oR2dx1NFd+3O/dKJTbG5v5F18F2XWmLBqCast
 lnMp0qSon3VTrDnmomPzVX0/HsjF+Zfy0+Bb4bRkRkhJpmR7us8l8BVNrlSRKoZqGVcn
 Qcsc5q41WmwyRkVpdoaIsGOC+b+DS/x9tK7XUm2CIPoTfl2trqD6ajjtEYL3szL2iBDJ
 JREg==
X-Gm-Message-State: AOAM531l/5e4G5M1362V3EGraRHbx+A3S7FubzeL+XaaFVlkLQGFeIAQ
 e5m51JLj3hkqLZ2R+Vo0KXSIO02Rfa9Aam2oYlg=
X-Google-Smtp-Source: ABdhPJz1SQ0HkfcI37qifBEFuERURXScR1KWLxHA59SCwfetIruwMbwz0bdqJaFhJ6gPcsdZxesVNw0B2dB9IVXFHfQ=
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr2893655wms.96.1639748460527; 
 Fri, 17 Dec 2021 05:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-26-marcandre.lureau@redhat.com>
 <9efb2356-6865-2126-727e-429d867e90b0@redhat.com>
In-Reply-To: <9efb2356-6865-2126-727e-429d867e90b0@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 17 Dec 2021 17:40:48 +0400
Message-ID: <CAJ+F1C+TAW8Z_UMfN=s2LS2jL0pNamMTRt8ZYwg9DWri_C7=Bg@mail.gmail.com>
Subject: Re: [PATCH v2 25/37] build-sys: set glib dependency version
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000082c3d405d357b027"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082c3d405d357b027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 17, 2021 at 5:31 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Further meson configuration tests are to be added based on the glib
> > version. Also correct the version reporting in the config log.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  configure   | 1 +
> >  meson.build | 6 ++++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 375cde2b44..57e363fd73 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4889,6 +4889,7 @@ echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host=
_mak
> >  echo "QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS" >> $config_host_mak
> >  echo "GLIB_CFLAGS=3D$glib_cflags" >> $config_host_mak
> >  echo "GLIB_LIBS=3D$glib_libs" >> $config_host_mak
> > +echo "GLIB_VERSION=3D$(pkg-config --modversion glib-2.0)" >>
> $config_host_mak
> >  echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host_mak
> >  echo "LD_I386_EMULATION=3D$ld_i386_emulation" >> $config_host_mak
> >  echo "EXESUF=3D$EXESUF" >> $config_host_mak
> > diff --git a/meson.build b/meson.build
> > index e1cddf5139..9494590aa2 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -311,14 +311,16 @@ endif
> >  add_project_arguments(config_host['GLIB_CFLAGS'].split(),
> >                        native: false, language: ['c', 'cpp', 'objc'])
> >  glib =3D declare_dependency(compile_args:
> config_host['GLIB_CFLAGS'].split(),
> > -                          link_args: config_host['GLIB_LIBS'].split())
> > +                          link_args: config_host['GLIB_LIBS'].split(),
> > +                          version: config_host['GLIB_VERSION'])
> >  # override glib dep with the configure results (for subprojects)
> >  meson.override_dependency('glib-2.0', glib)
> >
> >  gio =3D not_found
> >  if 'CONFIG_GIO' in config_host
> >    gio =3D declare_dependency(compile_args:
> config_host['GIO_CFLAGS'].split(),
> > -                           link_args: config_host['GIO_LIBS'].split())
> > +                           link_args: config_host['GIO_LIBS'].split(),
> > +                           version: config_host['GLIB_VERSION'])
> >  endif
> >  lttng =3D not_found
> >  if 'CONFIG_TRACE_UST' in config_host
> >
>
> Can you display it in summary_info too?
>

Yeah, although it would need a special treatment.

Since GLib is a mandatory dependency, I am not sure we want to show
    GLib                         : YES

And because it's not a pkg-config dep, it doesn't show the version (could
probably be fixed in meson).

If you don't mind,  I leave that for another day :)




> Otherwise:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>
>
thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000082c3d405d357b027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Dec 17, 2021 at 5:31 PM Philippe Math=
ieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 10/9/21 23:08, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Further meson configuration tests are to be added based on the glib<br=
>
&gt; version. Also correct the version reporting in the config log.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 meson.build | 6 ++++--<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/configure b/configure<br>
&gt; index 375cde2b44..57e363fd73 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -4889,6 +4889,7 @@ echo &quot;QEMU_CFLAGS=3D$QEMU_CFLAGS&quot; &gt;=
&gt; $config_host_mak<br>
&gt;=C2=A0 echo &quot;QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS&quot; &gt;&gt; $config=
_host_mak<br>
&gt;=C2=A0 echo &quot;GLIB_CFLAGS=3D$glib_cflags&quot; &gt;&gt; $config_hos=
t_mak<br>
&gt;=C2=A0 echo &quot;GLIB_LIBS=3D$glib_libs&quot; &gt;&gt; $config_host_ma=
k<br>
&gt; +echo &quot;GLIB_VERSION=3D$(pkg-config --modversion glib-2.0)&quot; &=
gt;&gt; $config_host_mak<br>
&gt;=C2=A0 echo &quot;QEMU_LDFLAGS=3D$QEMU_LDFLAGS&quot; &gt;&gt; $config_h=
ost_mak<br>
&gt;=C2=A0 echo &quot;LD_I386_EMULATION=3D$ld_i386_emulation&quot; &gt;&gt;=
 $config_host_mak<br>
&gt;=C2=A0 echo &quot;EXESUF=3D$EXESUF&quot; &gt;&gt; $config_host_mak<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index e1cddf5139..9494590aa2 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -311,14 +311,16 @@ endif<br>
&gt;=C2=A0 add_project_arguments(config_host[&#39;GLIB_CFLAGS&#39;].split()=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 native: false, language: [&#39;c&#39;, &#39;cpp&#39;, &#39;ob=
jc&#39;])<br>
&gt;=C2=A0 glib =3D declare_dependency(compile_args: config_host[&#39;GLIB_=
CFLAGS&#39;].split(),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;GLIB_LIBS&#39;].split())<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;GLIB_LIBS&#39;].split(),<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 version: config_host[&#39;GLIB_VERSION&#39;])<br>
&gt;=C2=A0 # override glib dep with the configure results (for subprojects)=
<br>
&gt;=C2=A0 meson.override_dependency(&#39;glib-2.0&#39;, glib)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 gio =3D not_found<br>
&gt;=C2=A0 if &#39;CONFIG_GIO&#39; in config_host<br>
&gt;=C2=A0 =C2=A0 gio =3D declare_dependency(compile_args: config_host[&#39=
;GIO_CFLAGS&#39;].split(),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;GIO_LIBS&#39;].spli=
t())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;GIO_LIBS&#39;].spli=
t(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: config_host[&#39;GLIB_VERSION&#39;])<b=
r>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 lttng =3D not_found<br>
&gt;=C2=A0 if &#39;CONFIG_TRACE_UST&#39; in config_host<br>
&gt; <br>
<br>
Can you display it in summary_info too?<br></blockquote><div><br></div>Yeah=
, although it would need a special treatment.</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">Since GLib is a mandatory dependenc=
y, I am not sure we want to show<br></div><div class=3D"gmail_quote">=C2=A0=
 =C2=A0 GLib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 : YES</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">And because it&#39;s not a pkg-config dep, it doesn&#=
39;t show the version (could probably be fixed in meson).</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">If you don&#39;t mind=
,=C2=A0 I leave that for another day :)<br></div><br><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br>
<br>
</blockquote></div><div><br></div><div>thanks<br></div><br>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000082c3d405d357b027--

