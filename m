Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5092509090
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:39:15 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGAU-0000El-Ne
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFAL-0006sk-HV
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:35:03 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFAI-0005L9-Rb
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:35:01 -0400
Received: by mail-qv1-xf31.google.com with SMTP id c1so1987320qvl.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvl/kYVzkgNHawZQZm3yQRO7ImAg7D/fdRvnL84ef4A=;
 b=pdPcvEEB88+fNF3paE0pavaKIkFUgtji8AGyAHkD1WhMF4skNIIx4EgTw72negczE4
 S1okpxT5aFLDOocrUO/ZAgJ5MULcIaG6MilhJkS++sFieS/+jTGnnGWPidsP21AZV9Ic
 efl1TNFAaqx1ypR+OVBoivwRlg/1JjwYfS2o1yFsFl5FhGgWUmGynNxgnHwnNwS/Ibq1
 OKckomOxJd4aofnFFY8/D06SbqJf2VNKGV1peiCvFFMs4TfeMvcWo4iFwZ55CV9/oCNc
 na6GlQP2LNjiBVfAObSjh9x1x7oHng8Of4BmK0HErOaNxuAB2cRYgGMyEx90NE7+pMRF
 RBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvl/kYVzkgNHawZQZm3yQRO7ImAg7D/fdRvnL84ef4A=;
 b=56/tvQNY31ce94yhdDmkWrCNbAoWbRkQPiFC9R/ZRXfh54c+zmuEbzX37oMge8m+iW
 gRalXNIz/AFdg8SkhTacfSUJIZ1vhwhUIvor5DST9wNCUeP2YMf1b5a9CRuuvu+EkbJS
 TPDc3at0rHiw4yvW2NDiJzfrLKxe6+CHzfgXuaZQckChYIJNnZJTaO1OUX97XVl/h6mr
 o9lNsAEYlF45j0+E4pnjHA409XezscokVmp3ueBhVb/nUryuNu70wLiOpuWKcrq4yrDl
 etGj/ujlsRHJUxyyBOkQh0jJPLZxVCgtmmo5sUJWEey5E3y7yPDpu6WTFuoexOkFQguz
 Byug==
X-Gm-Message-State: AOAM533AvVSqwv3jqrrHYgnlE6303j/wIvZMkEusmKuNn/Bi08mdippi
 nAGi4JoTUu+2J9gER8mxPyWut41BwEre8ys8EnU=
X-Google-Smtp-Source: ABdhPJyznFf6Or0huyvFL9E6zN2W2/C1VTKy8IhGJZGca5Oc1ZWlQ7plXTvqgyQ01hadNJxSem/ktY8AIilgVDgmld8=
X-Received: by 2002:ad4:5642:0:b0:444:47e1:b244 with SMTP id
 bl2-20020ad45642000000b0044447e1b244mr16526464qvb.4.1650479697711; Wed, 20
 Apr 2022 11:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-22-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-22-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:34:45 +0400
Message-ID: <CAJ+F1CJa+jLKQqh40+O4wHwERbxCt4_b3crC+rJufaRbBAHfpA@mail.gmail.com>
Subject: Re: [PATCH 21/34] meson, configure: move --with-pkgversion,
 CONFIG_STAMP to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000175b6c05dd1a402b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000175b6c05dd1a402b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:07 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The hash is now generated with a Python script.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

It's kind of strange that it takes "configure" as an input for the stamp
computation, but that's the way it works apparently

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure                     | 23 -----------------------
>  docs/meson.build              |  2 +-
>  meson.build                   | 10 +++++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.py |  1 +
>  scripts/meson-buildoptions.sh |  3 +++
>  scripts/qemu-stamp.py         | 24 ++++++++++++++++++++++++
>  7 files changed, 40 insertions(+), 25 deletions(-)
>  create mode 100644 scripts/qemu-stamp.py
>
> diff --git a/configure b/configure
> index bc15854578..5bf0a7d69b 100755
> --- a/configure
> +++ b/configure
> @@ -306,7 +306,6 @@ qemu_suffix=3D"qemu"
>  softmmu=3D"yes"
>  linux_user=3D""
>  bsd_user=3D""
> -pkgversion=3D""
>  pie=3D""
>  coroutine=3D""
>  plugins=3D"$default_feature"
> @@ -896,8 +895,6 @@ for opt do
>    ;;
>    --enable-fdt=3D*) fdt=3D"$optarg"
>    ;;
> -  --with-pkgversion=3D*) pkgversion=3D"$optarg"
> -  ;;
>    --with-coroutine=3D*) coroutine=3D"$optarg"
>    ;;
>    --disable-vhost-net) vhost_net=3D"no"
> @@ -1135,7 +1132,6 @@ Advanced options (experts only):
>    --firmwarepath=3DPATH      search PATH for firmware files
>    --efi-aarch64=3DPATH       PATH of efi file to use for aarch64 VMs.
>    --with-suffix=3DSUFFIX     suffix for QEMU data inside
> datadir/libdir/sysconfdir/docdir [$qemu_suffix]
> -  --with-pkgversion=3DVERS   use specified string as sub-version of the
> package
>    --without-default-features default all --enable-* options to "disabled=
"
>    --without-default-devices  do not include any device that is not neede=
d
> to
>                             start the emulator (only use if you are
> including
> @@ -1722,21 +1718,6 @@ if ! compile_prog "$glib_cflags -Werror"
> "$glib_libs" ; then
>      fi
>  fi
>
> -##########################################
> -# SHA command probe for modules
> -if test "$modules" =3D yes; then
> -    shacmd_probe=3D"sha1sum sha1 shasum"
> -    for c in $shacmd_probe; do
> -        if has $c; then
> -            shacmd=3D"$c"
> -            break
> -        fi
> -    done
> -    if test "$shacmd" =3D ""; then
> -        error_exit "one of the checksum commands is required to enable
> modules: $shacmd_probe"
> -    fi
> -fi
> -
>  ##########################################
>  # fdt probe
>
> @@ -2173,13 +2154,9 @@ if test "$static" =3D "yes" ; then
>    echo "CONFIG_STATIC=3Dy" >> $config_host_mak
>  fi
>  qemu_version=3D$(head $source_path/VERSION)
> -echo "PKGVERSION=3D$pkgversion" >>$config_host_mak
>  echo "SRC_PATH=3D$source_path" >> $config_host_mak
>  echo "TARGET_DIRS=3D$target_list" >> $config_host_mak
>  if test "$modules" =3D "yes"; then
> -  # $shacmd can generate a hash started with digit, which the compiler
> doesn't
> -  # like as an symbol. So prefix it with an underscore
> -  echo "CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgversion; cat $0=
) |
> $shacmd - | cut -f1 -d\ )" >> $config_host_mak
>    echo "CONFIG_MODULES=3Dy" >> $config_host_mak
>  fi
>
> diff --git a/docs/meson.build b/docs/meson.build
> index 831d4aea2b..9136fed3b7 100644
> --- a/docs/meson.build
> +++ b/docs/meson.build
> @@ -35,7 +35,7 @@ if sphinx_build.found()
>  endif
>
>  if build_docs
> -  SPHINX_ARGS +=3D ['-Dversion=3D' + meson.project_version(), '-Drelease=
=3D' +
> config_host['PKGVERSION']]
> +  SPHINX_ARGS +=3D ['-Dversion=3D' + meson.project_version(), '-Drelease=
=3D' +
> get_option('pkgversion')]
>
>    man_pages =3D {
>          'qemu-ga.8': (have_ga ? 'man8' : ''),
> diff --git a/meson.build b/meson.build
> index ee96cbc64e..424ff454d2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1626,6 +1626,14 @@
> config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR',
> get_option('prefix') /
>  config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') /
> qemu_moddir)
>  config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') /
> get_option('sysconfdir'))
>
> +if config_host.has_key('CONFIG_MODULES')
> +  config_host_data.set('CONFIG_STAMP', run_command(
> +      meson.current_source_dir() / 'scripts/qemu-stamp.py',
> +      meson.project_version(), get_option('pkgversion'), '--',
> +      meson.current_source_dir() / 'configure',
> +      capture: true, check: true).stdout().strip())
> +endif
> +
>  have_slirp_smbd =3D get_option('slirp_smbd') \
>    .require(targetos !=3D 'windows', error_message: 'Host smbd not suppor=
ted
> on this platform.') \
>    .allowed()
> @@ -2785,7 +2793,7 @@ tracetool_depends =3D files(
>
>  qemu_version_cmd =3D [find_program('scripts/qemu-version.sh'),
>                      meson.current_source_dir(),
> -                    config_host['PKGVERSION'], meson.project_version()]
> +                    get_option('pkgversion'), meson.project_version()]
>  qemu_version =3D custom_target('qemu-version.h',
>                               output: 'qemu-version.h',
>                               command: qemu_version_cmd,
> diff --git a/meson_options.txt b/meson_options.txt
> index ec974003b3..dc6fb796c6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -8,6 +8,8 @@ option('docdir', type : 'string', value : 'doc',
>         description: 'Base directory for documentation installation (can
> be empty)')
>  option('qemu_firmwarepath', type : 'string', value : '',
>         description: 'search PATH for firmware files')
> +option('pkgversion', type : 'string', value : '',
> +       description: 'use specified string as sub-version of the package'=
)
>  option('smbd', type : 'string', value : '',
>         description: 'Path to smbd for slirp networking')
>  option('sphinx_build', type : 'string', value : '',
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 3e540e8bb3..0f9603a7f6 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -36,6 +36,7 @@
>
>  OPTION_NAMES =3D {
>      "malloc": "enable-malloc",
> +    "pkgversion": "with-pkgversion",
>      "trace_backends": "enable-trace-backends",
>      "trace_file": "with-trace-file",
>  }
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 4c49d4af08..bf9878e24f 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -44,6 +44,8 @@ meson_options_help() {
>    printf "%s\n" '  --sphinx-build=3DVALUE     Use specified sphinx-build
> for building document'
>    printf "%s\n" '  --tls-priority=3DVALUE     Default TLS protocol/ciphe=
r
> priority string'
>    printf "%s\n" '                           [NORMAL]'
> +  printf "%s\n" '  --with-pkgversion=3DVALUE  use specified string as
> sub-version of the'
> +  printf "%s\n" '                           package'
>    printf "%s\n" '  --with-trace-file=3DVALUE  Trace file prefix for simp=
le
> backend [trace]'
>    printf "%s\n" ''
>    printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
> @@ -309,6 +311,7 @@ _meson_option_parse() {
>      --disable-pa) printf "%s" -Dpa=3Ddisabled ;;
>      --enable-parallels) printf "%s" -Dparallels=3Denabled ;;
>      --disable-parallels) printf "%s" -Dparallels=3Ddisabled ;;
> +    --with-pkgversion=3D*) quote_sh "-Dpkgversion=3D$2" ;;
>      --enable-profiler) printf "%s" -Dprofiler=3Dtrue ;;
>      --disable-profiler) printf "%s" -Dprofiler=3Dfalse ;;
>      --enable-pvrdma) printf "%s" -Dpvrdma=3Denabled ;;
> diff --git a/scripts/qemu-stamp.py b/scripts/qemu-stamp.py
> new file mode 100644
> index 0000000000..7beeeb07ed
> --- /dev/null
> +++ b/scripts/qemu-stamp.py
> @@ -0,0 +1,24 @@
> +#! /usr/bin/env python3
> +
> +# Usage: scripts/qemu-stamp.py STRING1 STRING2... -- FILE1 FILE2...
> +import hashlib
> +import os
> +import sys
> +
> +sha =3D hashlib.sha1()
> +is_file =3D False
> +for arg in sys.argv[1:]:
> +    if arg =3D=3D '--':
> +        is_file =3D True
> +        continue
> +    if is_file:
> +        with open(arg, 'rb') as f:
> +            for chunk in iter(lambda: f.read(65536), b''):
> +                sha.update(chunk)
> +    else:
> +        sha.update(os.fsencode(arg))
> +        sha.update(b'\n')
> +
> +# The hash can start with a digit, which the compiler doesn't
> +# like as an symbol. So prefix it with an underscore
> +print("_" + sha.hexdigest())
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000175b6c05dd1a402b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:07 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
hash is now generated with a Python script.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>It&#39;s kind of strange that it takes &quot;configure&quot; as an inpu=
t for the stamp computation, but that&#39;s the way it works apparently<br>=
</div><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a h=
ref=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&=
gt;</div></div><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 23 -----------------------<br>
=C2=A0docs/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 +++++++++-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0scripts/meson-buildoptions.py |=C2=A0 1 +<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
=C2=A0scripts/qemu-stamp.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 +++++++++=
+++++++++++++++<br>
=C2=A07 files changed, 40 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 scripts/qemu-stamp.py<br>
<br>
diff --git a/configure b/configure<br>
index bc15854578..5bf0a7d69b 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -306,7 +306,6 @@ qemu_suffix=3D&quot;qemu&quot;<br>
=C2=A0softmmu=3D&quot;yes&quot;<br>
=C2=A0linux_user=3D&quot;&quot;<br>
=C2=A0bsd_user=3D&quot;&quot;<br>
-pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
@@ -896,8 +895,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-fdt=3D*) fdt=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-pkgversion=3D*) pkgversion=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-coroutine=3D*) coroutine=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-vhost-net) vhost_net=3D&quot;no&quot;<br>
@@ -1135,7 +1132,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--firmwarepath=3DPATH=C2=A0 =C2=A0 =C2=A0 search PATH for firm=
ware files<br>
=C2=A0 =C2=A0--efi-aarch64=3DPATH=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH of efi fil=
e to use for aarch64 VMs.<br>
=C2=A0 =C2=A0--with-suffix=3DSUFFIX=C2=A0 =C2=A0 =C2=A0suffix for QEMU data=
 inside datadir/libdir/sysconfdir/docdir [$qemu_suffix]<br>
-=C2=A0 --with-pkgversion=3DVERS=C2=A0 =C2=A0use specified string as sub-ve=
rsion of the package<br>
=C2=A0 =C2=A0--without-default-features default all --enable-* options to &=
quot;disabled&quot;<br>
=C2=A0 =C2=A0--without-default-devices=C2=A0 do not include any device that=
 is not needed to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 start the emulator (only use if you are including<=
br>
@@ -1722,21 +1718,6 @@ if ! compile_prog &quot;$glib_cflags -Werror&quot; &=
quot;$glib_libs&quot; ; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# SHA command probe for modules<br>
-if test &quot;$modules&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 shacmd_probe=3D&quot;sha1sum sha1 shasum&quot;<br>
-=C2=A0 =C2=A0 for c in $shacmd_probe; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if has $c; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shacmd=3D&quot;$c&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 if test &quot;$shacmd&quot; =3D &quot;&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;one of the checksum commands =
is required to enable modules: $shacmd_probe&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# fdt probe<br>
<br>
@@ -2173,13 +2154,9 @@ if test &quot;$static&quot; =3D &quot;yes&quot; ; th=
en<br>
=C2=A0 =C2=A0echo &quot;CONFIG_STATIC=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0fi<br>
=C2=A0qemu_version=3D$(head $source_path/VERSION)<br>
-echo &quot;PKGVERSION=3D$pkgversion&quot; &gt;&gt;$config_host_mak<br>
=C2=A0echo &quot;SRC_PATH=3D$source_path&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0echo &quot;TARGET_DIRS=3D$target_list&quot; &gt;&gt; $config_host_mak=
<br>
=C2=A0if test &quot;$modules&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 # $shacmd can generate a hash started with digit, which the compile=
r doesn&#39;t<br>
-=C2=A0 # like as an symbol. So prefix it with an underscore<br>
-=C2=A0 echo &quot;CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgversion=
; cat $0) | $shacmd - | cut -f1 -d\ )&quot; &gt;&gt; $config_host_mak<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULES=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
<br>
diff --git a/docs/meson.build b/docs/meson.build<br>
index 831d4aea2b..9136fed3b7 100644<br>
--- a/docs/meson.build<br>
+++ b/docs/meson.build<br>
@@ -35,7 +35,7 @@ if sphinx_build.found()<br>
=C2=A0endif<br>
<br>
=C2=A0if build_docs<br>
-=C2=A0 SPHINX_ARGS +=3D [&#39;-Dversion=3D&#39; + meson.project_version(),=
 &#39;-Drelease=3D&#39; + config_host[&#39;PKGVERSION&#39;]]<br>
+=C2=A0 SPHINX_ARGS +=3D [&#39;-Dversion=3D&#39; + meson.project_version(),=
 &#39;-Drelease=3D&#39; + get_option(&#39;pkgversion&#39;)]<br>
<br>
=C2=A0 =C2=A0man_pages =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;qemu-ga.8&#39;: (have_ga ? &#39;man8=
&#39; : &#39;&#39;),<br>
diff --git a/meson.build b/meson.build<br>
index ee96cbc64e..424ff454d2 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1626,6 +1626,14 @@ config_host_data.set_quoted(&#39;CONFIG_QEMU_LOCALST=
ATEDIR&#39;, get_option(&#39;prefix&#39;) /<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_QEMU_MODDIR&#39;, get_option(=
&#39;prefix&#39;) / qemu_moddir)<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_SYSCONFDIR&#39;, get_option(&=
#39;prefix&#39;) / get_option(&#39;sysconfdir&#39;))<br>
<br>
+if config_host.has_key(&#39;CONFIG_MODULES&#39;)<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_STAMP&#39;, run_command(<br>
+=C2=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;scripts/qemu-stamp.=
py&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 meson.project_version(), get_option(&#39;pkgversion&#=
39;), &#39;--&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 meson.current_source_dir() / &#39;configure&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 capture: true, check: true).stdout().strip())<br>
+endif<br>
+<br>
=C2=A0have_slirp_smbd =3D get_option(&#39;slirp_smbd&#39;) \<br>
=C2=A0 =C2=A0.require(targetos !=3D &#39;windows&#39;, error_message: &#39;=
Host smbd not supported on this platform.&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
@@ -2785,7 +2793,7 @@ tracetool_depends =3D files(<br>
<br>
=C2=A0qemu_version_cmd =3D [find_program(&#39;scripts/qemu-version.sh&#39;)=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf=
ig_host[&#39;PKGVERSION&#39;], meson.project_version()]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_=
option(&#39;pkgversion&#39;), meson.project_version()]<br>
=C2=A0qemu_version =3D custom_target(&#39;qemu-version.h&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output: &#39;qemu-version.h&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: qemu_version_cmd,<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index ec974003b3..dc6fb796c6 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -8,6 +8,8 @@ option(&#39;docdir&#39;, type : &#39;string&#39;, value : &=
#39;doc&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Base directory for documentat=
ion installation (can be empty)&#39;)<br>
=C2=A0option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39;, value : =
&#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;search PATH for firmware file=
s&#39;)<br>
+option(&#39;pkgversion&#39;, type : &#39;string&#39;, value : &#39;&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;use specified string as sub-v=
ersion of the package&#39;)<br>
=C2=A0option(&#39;smbd&#39;, type : &#39;string&#39;, value : &#39;&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Path to smbd for slirp networ=
king&#39;)<br>
=C2=A0option(&#39;sphinx_build&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 3e540e8bb3..0f9603a7f6 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -36,6 +36,7 @@<br>
<br>
=C2=A0OPTION_NAMES =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;malloc&quot;: &quot;enable-malloc&quot;,<br>
+=C2=A0 =C2=A0 &quot;pkgversion&quot;: &quot;with-pkgversion&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_backends&quot;: &quot;enable-trace-backends=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_file&quot;: &quot;with-trace-file&quot;,<br=
>
=C2=A0}<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 4c49d4af08..bf9878e24f 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -44,6 +44,8 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --sphinx-build=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Use specified sphinx-build for building document&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --tls-priority=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Default TLS protocol/cipher priority string&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NORMAL]&=
#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --with-pkgversion=3DVALUE=C2=A0=
 use specified string as sub-version of the&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --with-trace-file=3DVALUE=
=C2=A0 Trace file prefix for simple backend [trace]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;Optional features, enabled with -=
-enable-FEATURE and&#39;<br>
@@ -309,6 +311,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-pa) printf &quot;%s&quot; -Dpa=3Ddisabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--enable-parallels) printf &quot;%s&quot; -Dparallels=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-parallels) printf &quot;%s&quot; -Dparallels=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --with-pkgversion=3D*) quote_sh &quot;-Dpkgversion=3D$2&quot=
; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-profiler) printf &quot;%s&quot; -Dprofiler=3Dt=
rue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-profiler) printf &quot;%s&quot; -Dprofiler=3D=
false ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-pvrdma) printf &quot;%s&quot; -Dpvrdma=3Denabl=
ed ;;<br>
diff --git a/scripts/qemu-stamp.py b/scripts/qemu-stamp.py<br>
new file mode 100644<br>
index 0000000000..7beeeb07ed<br>
--- /dev/null<br>
+++ b/scripts/qemu-stamp.py<br>
@@ -0,0 +1,24 @@<br>
+#! /usr/bin/env python3<br>
+<br>
+# Usage: scripts/qemu-stamp.py STRING1 STRING2... -- FILE1 FILE2...<br>
+import hashlib<br>
+import os<br>
+import sys<br>
+<br>
+sha =3D hashlib.sha1()<br>
+is_file =3D False<br>
+for arg in sys.argv[1:]:<br>
+=C2=A0 =C2=A0 if arg =3D=3D &#39;--&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_file =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 if is_file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(arg, &#39;rb&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for chunk in iter(lambda: f.read=
(65536), b&#39;&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sha.update(chunk)<=
br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha.update(os.fsencode(arg))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha.update(b&#39;\n&#39;)<br>
+<br>
+# The hash can start with a digit, which the compiler doesn&#39;t<br>
+# like as an symbol. So prefix it with an underscore<br>
+print(&quot;_&quot; + sha.hexdigest())<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000175b6c05dd1a402b--

