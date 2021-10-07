Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234E425E37
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:54:56 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaPn-0002Sz-0t
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDV-0005lB-Gc
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDT-000696-H1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so22835162wrc.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWbf5/CeHS38WbVtnZkAOoVnv30w7wullDQHtZHSYbk=;
 b=iu327MYR17UbBs+Eicg/MVq2p3/vduDE3DDiO/F6rLU4qCyBC6LUaQkQDc+a5/yFzC
 l+Z7OT69KrEQwO3L2C+GV/xvP0nC3VJISwveLklnTe5FrtuDHtsDZuEy5awTr0L04Dwx
 gULg2BbbRzTywhhUxaJh4nyq7a0Ct0QBm67BTvMQLkwWfHgOZbyqcq9eLn3WJwGHclxE
 dthUPnQwF0ZAj/GvckaK86vhkc85IAmJfcfxKEBAg+i8Zl1X28zV+ypb9XnB9bTnDXUK
 SBcV97fgQj17gqGw0YA/7GNPLMdp5IcIyaIAqgAdsy+8JdHNpbyA0VNVRv+9C0B0mOgb
 z9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWbf5/CeHS38WbVtnZkAOoVnv30w7wullDQHtZHSYbk=;
 b=rQr0JmFP3LcmHPih6I29vqCa1RSUQ1VznPOc9KB+79WswEMhS+bqjqM9KHHJefUmMP
 QZCp60dob8hcos/xt4WfBl/g8y/Uph4ND66g7rlAQ00ttf6VGmXuHnFlisE7mXKI6ZOO
 IJLyOSzvrLqnc4yML0UJ/MCBfzsrw5amocQnSYXqBtVt0K/F9C3oetoXDinOpmEQAEzy
 phzmSDKQ7luZ1e1KhL4IQIbJtDPGFujGbp8EFjqaydxfAJWvdu1Ea29QaQ4adWcaofWl
 ZV6E1Z/aU4Jnh8ZRyMXpO+P559LuHIW9t911y2R7igW9q2dHKyiSpsxerWizpxTvkH/F
 mdvg==
X-Gm-Message-State: AOAM533xLk/SPh06YlBmwMPdDSrulczjR+A+eFDJM4KxtDds6cX/yrqM
 qv57IllO1z/4Q4DUOLb0P6BdkOf7YumbJCgqYZnshVSY
X-Google-Smtp-Source: ABdhPJyOm9q2gQu1D9CRSp0ZM3F3uZEl4jfmaeJfmZV1sj1iM6+mSDZfWcNaI8zFQK2D9R+arZN9SeNv0gpgZko7Rkw=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr5949992wru.239.1633639330225; 
 Thu, 07 Oct 2021 13:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-5-pbonzini@redhat.com>
In-Reply-To: <20211007130829.632254-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:41:55 +0400
Message-ID: <CAJ+F1C+739S9=qAT9FYD6oGYw229E0oFT2Mn_xzog767YLkfww@mail.gmail.com>
Subject: Re: [PATCH 10/24] configure, meson: move CONFIG_HOST_DSOSUF to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f820e705cdc94bac"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f820e705cdc94bac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:14 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This is just a constant string, there is no need to pass it in
> config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

I am surprised not to find a way for meson to return it, but I am not sure
where it would fit either. compiler.get_{lib,exe}_suffix()? Or maybe a fake
build/lib target and check the path()..

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure   |  6 ------
>  meson.build | 10 +++++-----
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/configure b/configure
> index 4bfc5e350d..f91b8e1f0d 100755
> --- a/configure
> +++ b/configure
> @@ -351,7 +351,6 @@ bigendian=3D"no"
>  mingw32=3D"no"
>  gcov=3D"no"
>  EXESUF=3D""
> -HOST_DSOSUF=3D".so"
>  modules=3D"no"
>  module_upgrades=3D"no"
>  prefix=3D"/usr/local"
> @@ -594,9 +593,6 @@ fi
>  # cross-compiling to one of these OSes then you'll need to specify
>  # the correct CPU with the --cpu option.
>  case $targetos in
> -Darwin)
> -  HOST_DSOSUF=3D".dylib"
> -  ;;
>  SunOS)
>    # $(uname -m) returns i86pc even on an x86_64 box, so default based on
> isainfo
>    if test -z "$cpu" && test "$(isainfo -k)" =3D "amd64"; then
> @@ -785,7 +781,6 @@ fi
>
>  if test "$mingw32" =3D "yes" ; then
>    EXESUF=3D".exe"
> -  HOST_DSOSUF=3D".dll"
>    # MinGW needs -mthreads for TLS and macro _MT.
>    CONFIGURE_CFLAGS=3D"-mthreads $CONFIGURE_CFLAGS"
>    write_c_skeleton;
> @@ -4636,7 +4631,6 @@ echo "GLIB_LIBS=3D$glib_libs" >> $config_host_mak
>  echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host_mak
>  echo "LD_I386_EMULATION=3D$ld_i386_emulation" >> $config_host_mak
>  echo "EXESUF=3D$EXESUF" >> $config_host_mak
> -echo "HOST_DSOSUF=3D$HOST_DSOSUF" >> $config_host_mak
>  echo "LIBS_QGA=3D$libs_qga" >> $config_host_mak
>  if test "$gcov" =3D "yes" ; then
>    echo "CONFIG_GCOV=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 98fa4b68d9..6842402a60 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -250,6 +250,7 @@ iokit =3D []
>  emulator_link_args =3D []
>  nvmm =3Dnot_found
>  hvf =3D not_found
> +host_dsosuf =3D '.so'
>  if targetos =3D=3D 'windows'
>    socket =3D cc.find_library('ws2_32')
>    winmm =3D cc.find_library('winmm')
> @@ -258,9 +259,11 @@ if targetos =3D=3D 'windows'
>    version_res =3D win.compile_resources('version.rc',
>                                        depend_files:
> files('pc-bios/qemu-nsis.ico'),
>                                        include_directories:
> include_directories('.'))
> +  host_dsosuf =3D '.dll'
>  elif targetos =3D=3D 'darwin'
>    coref =3D dependency('appleframeworks', modules: 'CoreFoundation')
>    iokit =3D dependency('appleframeworks', modules: 'IOKit', required: fa=
lse)
> +  host_dsosuf =3D '.dylib'
>  elif targetos =3D=3D 'sunos'
>    socket =3D [cc.find_library('socket'),
>              cc.find_library('nsl'),
> @@ -1460,6 +1463,7 @@ config_host_data.set('QEMU_VERSION_MAJOR',
> meson.project_version().split('.')[0]
>  config_host_data.set('QEMU_VERSION_MINOR',
> meson.project_version().split('.')[1])
>  config_host_data.set('QEMU_VERSION_MICRO',
> meson.project_version().split('.')[2])
>
> +config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
>  config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>
>  # has_header
> @@ -1606,10 +1610,9 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>          return printf("%zu", SIZE_MAX);
>      }''', args: ['-Werror']))
>
> -
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> -strings =3D ['HOST_DSOSUF', 'CONFIG_IASL']
> +strings =3D ['CONFIG_IASL']
>  foreach k, v: config_host
>    if ignored.contains(k)
>      # do nothing
> @@ -1621,9 +1624,6 @@ foreach k, v: config_host
>    elif k =3D=3D 'ARCH'
>      config_host_data.set('HOST_' + v.to_upper(), 1)
>    elif strings.contains(k)
> -    if not k.startswith('CONFIG_')
> -      k =3D 'CONFIG_' + k.to_upper()
> -    endif
>      config_host_data.set_quoted(k, v)
>    elif k.startswith('CONFIG_') or k.startswith('HAVE_') or
> k.startswith('HOST_')
>      config_host_data.set(k, v =3D=3D 'y' ? 1 : v)
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f820e705cdc94bac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:14 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This is just a constant string, there is no need to pass it in=
 config-host.mak.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>I am surprised not to find a way for meson to return it, but I am not s=
ure where it would fit either. compiler.get_{lib,exe}_suffix()? Or maybe a =
fake build/lib target and check the path()..<br></div><div><br></div><div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0|=C2=A0 6 ------<br>
=C2=A0meson.build | 10 +++++-----<br>
=C2=A02 files changed, 5 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 4bfc5e350d..f91b8e1f0d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -351,7 +351,6 @@ bigendian=3D&quot;no&quot;<br>
=C2=A0mingw32=3D&quot;no&quot;<br>
=C2=A0gcov=3D&quot;no&quot;<br>
=C2=A0EXESUF=3D&quot;&quot;<br>
-HOST_DSOSUF=3D&quot;.so&quot;<br>
=C2=A0modules=3D&quot;no&quot;<br>
=C2=A0module_upgrades=3D&quot;no&quot;<br>
=C2=A0prefix=3D&quot;/usr/local&quot;<br>
@@ -594,9 +593,6 @@ fi<br>
=C2=A0# cross-compiling to one of these OSes then you&#39;ll need to specif=
y<br>
=C2=A0# the correct CPU with the --cpu option.<br>
=C2=A0case $targetos in<br>
-Darwin)<br>
-=C2=A0 HOST_DSOSUF=3D&quot;.dylib&quot;<br>
-=C2=A0 ;;<br>
=C2=A0SunOS)<br>
=C2=A0 =C2=A0# $(uname -m) returns i86pc even on an x86_64 box, so default =
based on isainfo<br>
=C2=A0 =C2=A0if test -z &quot;$cpu&quot; &amp;&amp; test &quot;$(isainfo -k=
)&quot; =3D &quot;amd64&quot;; then<br>
@@ -785,7 +781,6 @@ fi<br>
<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0EXESUF=3D&quot;.exe&quot;<br>
-=C2=A0 HOST_DSOSUF=3D&quot;.dll&quot;<br>
=C2=A0 =C2=A0# MinGW needs -mthreads for TLS and macro _MT.<br>
=C2=A0 =C2=A0CONFIGURE_CFLAGS=3D&quot;-mthreads $CONFIGURE_CFLAGS&quot;<br>
=C2=A0 =C2=A0write_c_skeleton;<br>
@@ -4636,7 +4631,6 @@ echo &quot;GLIB_LIBS=3D$glib_libs&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0echo &quot;QEMU_LDFLAGS=3D$QEMU_LDFLAGS&quot; &gt;&gt; $config_host_m=
ak<br>
=C2=A0echo &quot;LD_I386_EMULATION=3D$ld_i386_emulation&quot; &gt;&gt; $con=
fig_host_mak<br>
=C2=A0echo &quot;EXESUF=3D$EXESUF&quot; &gt;&gt; $config_host_mak<br>
-echo &quot;HOST_DSOSUF=3D$HOST_DSOSUF&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;LIBS_QGA=3D$libs_qga&quot; &gt;&gt; $config_host_mak<br>
=C2=A0if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GCOV=3Dy&quot; &gt;&gt; $config_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index 98fa4b68d9..6842402a60 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -250,6 +250,7 @@ iokit =3D []<br>
=C2=A0emulator_link_args =3D []<br>
=C2=A0nvmm =3Dnot_found<br>
=C2=A0hvf =3D not_found<br>
+host_dsosuf =3D &#39;.so&#39;<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0socket =3D cc.find_library(&#39;ws2_32&#39;)<br>
=C2=A0 =C2=A0winmm =3D cc.find_library(&#39;winmm&#39;)<br>
@@ -258,9 +259,11 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0version_res =3D win.compile_resources(&#39;version.rc&#39;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depend_fi=
les: files(&#39;pc-bios/qemu-nsis.ico&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_d=
irectories: include_directories(&#39;.&#39;))<br>
+=C2=A0 host_dsosuf =3D &#39;.dll&#39;<br>
=C2=A0elif targetos =3D=3D &#39;darwin&#39;<br>
=C2=A0 =C2=A0coref =3D dependency(&#39;appleframeworks&#39;, modules: &#39;=
CoreFoundation&#39;)<br>
=C2=A0 =C2=A0iokit =3D dependency(&#39;appleframeworks&#39;, modules: &#39;=
IOKit&#39;, required: false)<br>
+=C2=A0 host_dsosuf =3D &#39;.dylib&#39;<br>
=C2=A0elif targetos =3D=3D &#39;sunos&#39;<br>
=C2=A0 =C2=A0socket =3D [cc.find_library(&#39;socket&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.find_library(&#39;nsl&#3=
9;),<br>
@@ -1460,6 +1463,7 @@ config_host_data.set(&#39;QEMU_VERSION_MAJOR&#39;, me=
son.project_version().split(&#39;.&#39;)[0]<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION_MINOR&#39;, meson.project_vers=
ion().split(&#39;.&#39;)[1])<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION_MICRO&#39;, meson.project_vers=
ion().split(&#39;.&#39;)[2])<br>
<br>
+config_host_data.set_quoted(&#39;CONFIG_HOST_DSOSUF&#39;, host_dsosuf)<br>
=C2=A0config_host_data.set(&#39;HAVE_HOST_BLOCK_DEVICE&#39;, have_host_bloc=
k_device)<br>
<br>
=C2=A0# has_header<br>
@@ -1606,10 +1610,9 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;,=
 not cc.compiles(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return printf(&quot;%zu&quot;, SIZE_MAX);=
<br>
=C2=A0 =C2=A0 =C2=A0}&#39;&#39;&#39;, args: [&#39;-Werror&#39;]))<br>
<br>
-<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-targ=
et<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
-strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;]<br>
+strings =3D [&#39;CONFIG_IASL&#39;]<br>
=C2=A0foreach k, v: config_host<br>
=C2=A0 =C2=A0if ignored.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0# do nothing<br>
@@ -1621,9 +1624,6 @@ foreach k, v: config_host<br>
=C2=A0 =C2=A0elif k =3D=3D &#39;ARCH&#39;<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(&#39;HOST_&#39; + v.to_upper(), 1)=
<br>
=C2=A0 =C2=A0elif strings.contains(k)<br>
-=C2=A0 =C2=A0 if not k.startswith(&#39;CONFIG_&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 k =3D &#39;CONFIG_&#39; + k.to_upper()<br>
-=C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set_quoted(k, v)<br>
=C2=A0 =C2=A0elif k.startswith(&#39;CONFIG_&#39;) or k.startswith(&#39;HAVE=
_&#39;) or k.startswith(&#39;HOST_&#39;)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(k, v =3D=3D &#39;y&#39; ? 1 : v)<b=
r>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000f820e705cdc94bac--

