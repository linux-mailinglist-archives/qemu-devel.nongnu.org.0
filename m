Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEE509F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:14:37 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVhk-0002Qk-Id
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVVh-0002RJ-Tm
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:02:09 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVVf-0002NV-Ez
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:02:09 -0400
Received: by mail-qt1-x82c.google.com with SMTP id d9so3023471qty.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKQb67JzZgAAgfx/CRy6odmwCvP4Rxon7Fv6H7ISUmM=;
 b=pXi9z1dGJBaLNQqK4YxnLzdfJgI/oKgWv40Xnyb595cRYq6pUGDUfWAFHePme5x4+m
 V2AmWHoKT3iY5FDWdu5MoYaDiJ3iMEXPsfwjF5vUMZpeFGNpj1j7bKJFv6lXqrXw+7dZ
 a33xqze0t4+FvIELHjlxq8ILX6lsPbZrR+dbkAN7by9lNxVDXMocDCRo9o6im/S1XlW+
 eMmxTpwA6n98xHAscINN5/9Y1VXNlkjKQqla68PVDLlwRjDspd0KCxRla9akBnrdFt5o
 +/rcd63nK9Hg/MqFdoMWjZiUw5aV7U7FsHSIGaAxidjyI6n7mA3fbgMvPwDv/bxSdEYw
 Q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKQb67JzZgAAgfx/CRy6odmwCvP4Rxon7Fv6H7ISUmM=;
 b=MWvwAMpI8pmzV25yE11/shWpL5OdlDsikHfiwLniWAp1RjBqyy9kFaw/EZdnMQ4GNl
 vU+Gp7CvVVgbFt80ImRM5SXp5IiJ4Y9o2n70pYxNi0eW28d/2y53mXnM72CheZgHTrWi
 KhDmWmSNJ1lvRLD8yN9BWzgINZnjTcxyS1S9yH9sfIUYR8FxjG2kHIt6+RCqLqOgXHRW
 58BLbZwLF3aWKOLfMdfC7nBTiZvK4wVBMvEdaSJPtut0ioWG0FFcrieMUuep0QEX83Lk
 zT9LkuBzSCwfSG8w3f6Mc3kuWevH9CvxXLKR3CTPZSvlgPksyvYkvx2BMF8SeZND9ClI
 HaFg==
X-Gm-Message-State: AOAM533Nc/Z/YcJlXU9CyimEYxASc+LucDosAoaUrMCJrmDquWJD1Zn3
 PuYJ0hIlkB8QnOcVWCDZVEz7AjkWZt5umnDGOG4=
X-Google-Smtp-Source: ABdhPJyjlZ2NjKnka7WS3fm41/9sJp68kJGYQwDtyPpn+DIdhKEs6sZR00O7v0CbsQanizTZrLiJjkOgazQdeCkf23A=
X-Received: by 2002:a05:622a:cc:b0:2f1:fc74:c7a6 with SMTP id
 p12-20020a05622a00cc00b002f1fc74c7a6mr13287261qtw.387.1650542526400; Thu, 21
 Apr 2022 05:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-33-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-33-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 16:01:54 +0400
Message-ID: <CAJ+F1CJOtb+6dZ1iP=8c34uOLMKRsKfg1UY8guwHxu_kApxgMg@mail.gmail.com>
Subject: Re: [PATCH 32/34] meson: create have_vhost_* variables
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f90cba05dd28e0d3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82c.google.com
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

--000000000000f90cba05dd28e0d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> When using Meson options rather than config-host.h, the "when" clauses
> have to be changed to if statements (which is not necessarily great,
> though at least it highlights which parts of the build are per-target
> and which are not).
>
> Do that before moving vhost logic to meson.build, though for now
> the variables are just based on config-host.mak data.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  meson.build       | 31 ++++++++++++++++++++-----------
>  tests/meson.build |  2 +-
>  tools/meson.build |  2 +-
>  3 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 870dd8dee0..5b5eb442c4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -312,6 +312,15 @@ have_tpm =3D get_option('tpm') \
>    .require(targetos !=3D 'windows', error_message: 'TPM emulation only
> available on POSIX systems') \
>    .allowed()
>
> +# vhost
> +have_vhost_user =3D 'CONFIG_VHOST_USER' in config_host
> +have_vhost_vdpa =3D 'CONFIG_VHOST_VDPA' in config_host
> +have_vhost_kernel =3D 'CONFIG_VHOST_KERNEL' in config_host
> +have_vhost_net_user =3D 'CONFIG_VHOST_NET_USER' in config_host
> +have_vhost_net_vdpa =3D 'CONFIG_VHOST_NET_VDPA' in config_host
> +have_vhost_net =3D 'CONFIG_VHOST_NET' in config_host
> +have_vhost_user_crypto =3D 'CONFIG_VHOST_CRYPTO' in config_host
> +
>  # Target-specific libraries and flags
>  libm =3D cc.find_library('m', required: false)
>  threads =3D dependency('threads')
> @@ -1440,7 +1449,7 @@ has_statx_mnt_id =3D cc.links(statx_mnt_id_test)
>  have_vhost_user_blk_server =3D get_option('vhost_user_blk_server') \
>    .require(targetos =3D=3D 'linux',
>             error_message: 'vhost_user_blk_server requires linux') \
> -  .require('CONFIG_VHOST_USER' in config_host,
> +  .require(have_vhost_user,
>             error_message: 'vhost_user_blk_server requires vhost-user
> support') \
>    .disable_auto_if(not have_system) \
>    .allowed()
> @@ -2283,9 +2292,9 @@ host_kconfig =3D \
>    (have_ivshmem ? ['CONFIG_IVSHMEM=3Dy'] : []) + \
>    (opengl.found() ? ['CONFIG_OPENGL=3Dy'] : []) + \
>    (x11.found() ? ['CONFIG_X11=3Dy'] : []) + \
> -  ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=3Dy'] : []) =
+ \
> -  ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=3Dy'] : []) =
+ \
> -  ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=3Dy'] : =
[])
> + \
> +  (have_vhost_user ? ['CONFIG_VHOST_USER=3Dy'] : []) + \
> +  (have_vhost_vdpa ? ['CONFIG_VHOST_VDPA=3Dy'] : []) + \
> +  (have_vhost_kernel ? ['CONFIG_VHOST_KERNEL=3Dy'] : []) + \
>    (have_virtfs ? ['CONFIG_VIRTFS=3Dy'] : []) + \
>    ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) + \
>    (have_pvrdma ? ['CONFIG_PVRDMA=3Dy'] : []) + \
> @@ -2967,7 +2976,7 @@ if have_system or have_user
>  endif
>
>  vhost_user =3D not_found
> -if targetos =3D=3D 'linux' and 'CONFIG_VHOST_USER' in config_host
> +if targetos =3D=3D 'linux' and have_vhost_user
>    libvhost_user =3D subproject('libvhost-user')
>    vhost_user =3D libvhost_user.get_variable('vhost_user_dep')
>  endif
> @@ -3548,7 +3557,7 @@ if have_tools
>               dependencies: qemuutil,
>               install: true)
>
> -  if 'CONFIG_VHOST_USER' in config_host
> +  if have_vhost_user
>      subdir('contrib/vhost-user-blk')
>      subdir('contrib/vhost-user-gpu')
>      subdir('contrib/vhost-user-input')
> @@ -3674,12 +3683,12 @@ if 'simple' in get_option('trace_backends')
>  endif
>  summary_info +=3D {'D-Bus display':     dbus_display}
>  summary_info +=3D {'QOM debugging':     get_option('qom_cast_debug')}
> -summary_info +=3D {'vhost-kernel support':
> config_host.has_key('CONFIG_VHOST_KERNEL')}
> -summary_info +=3D {'vhost-net support':
> config_host.has_key('CONFIG_VHOST_NET')}
> -summary_info +=3D {'vhost-crypto support':
> config_host.has_key('CONFIG_VHOST_CRYPTO')}
> -summary_info +=3D {'vhost-user support':
> config_host.has_key('CONFIG_VHOST_USER')}
> +summary_info +=3D {'vhost-kernel support': have_vhost_kernel}
> +summary_info +=3D {'vhost-net support': have_vhost_net}
> +summary_info +=3D {'vhost-user support': have_vhost_user}
> +summary_info +=3D {'vhost-user-crypto support': have_vhost_user_crypto}
>  summary_info +=3D {'vhost-user-blk server support':
> have_vhost_user_blk_server}
> -summary_info +=3D {'vhost-vdpa support':
> config_host.has_key('CONFIG_VHOST_VDPA')}
> +summary_info +=3D {'vhost-vdpa support': have_vhost_vdpa}
>  summary_info +=3D {'build guest agent': have_ga}
>  summary(summary_info, bool_yn: true, section: 'Configurable features')
>
> diff --git a/tests/meson.build b/tests/meson.build
> index 4f691e8465..8e318ec513 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -68,7 +68,7 @@ test_deps =3D {
>    'test-qht-par': qht_bench,
>  }
>
> -if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX'
> in config_host
> +if have_tools and have_vhost_user and 'CONFIG_LINUX' in config_host
>    executable('vhost-user-bridge',
>               sources: files('vhost-user-bridge.c'),
>               dependencies: [qemuutil, vhost_user])
> diff --git a/tools/meson.build b/tools/meson.build
> index 46977af84f..10eb3a043f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -3,7 +3,7 @@ have_virtiofsd =3D get_option('virtiofsd') \
>               error_message: 'virtiofsd requires Linux') \
>      .require(seccomp.found() and libcap_ng.found(),
>               error_message: 'virtiofsd requires libcap-ng-devel and
> seccomp-devel') \
> -    .require('CONFIG_VHOST_USER' in config_host,
> +    .require(have_vhost_user,
>               error_message: 'virtiofsd needs vhost-user-support') \
>      .disable_auto_if(not have_tools and not have_system) \
>      .allowed()
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f90cba05dd28e0d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:16 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When=
 using Meson options rather than config-host.h, the &quot;when&quot; clause=
s<br>
have to be changed to if statements (which is not necessarily great,<br>
though at least it highlights which parts of the build are per-target<br>
and which are not).<br>
<br>
Do that before moving vhost logic to meson.build, though for now<br>
the variables are just based on config-host.mak data.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 ++++++++++++++++++++------=
-----<br>
=C2=A0tests/meson.build |=C2=A0 2 +-<br>
=C2=A0tools/meson.build |=C2=A0 2 +-<br>
=C2=A03 files changed, 22 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 870dd8dee0..5b5eb442c4 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -312,6 +312,15 @@ have_tpm =3D get_option(&#39;tpm&#39;) \<br>
=C2=A0 =C2=A0.require(targetos !=3D &#39;windows&#39;, error_message: &#39;=
TPM emulation only available on POSIX systems&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
<br>
+# vhost<br>
+have_vhost_user =3D &#39;CONFIG_VHOST_USER&#39; in config_host<br>
+have_vhost_vdpa =3D &#39;CONFIG_VHOST_VDPA&#39; in config_host<br>
+have_vhost_kernel =3D &#39;CONFIG_VHOST_KERNEL&#39; in config_host<br>
+have_vhost_net_user =3D &#39;CONFIG_VHOST_NET_USER&#39; in config_host<br>
+have_vhost_net_vdpa =3D &#39;CONFIG_VHOST_NET_VDPA&#39; in config_host<br>
+have_vhost_net =3D &#39;CONFIG_VHOST_NET&#39; in config_host<br>
+have_vhost_user_crypto =3D &#39;CONFIG_VHOST_CRYPTO&#39; in config_host<br=
>
+<br>
=C2=A0# Target-specific libraries and flags<br>
=C2=A0libm =3D cc.find_library(&#39;m&#39;, required: false)<br>
=C2=A0threads =3D dependency(&#39;threads&#39;)<br>
@@ -1440,7 +1449,7 @@ has_statx_mnt_id =3D cc.links(statx_mnt_id_test)<br>
=C2=A0have_vhost_user_blk_server =3D get_option(&#39;vhost_user_blk_server&=
#39;) \<br>
=C2=A0 =C2=A0.require(targetos =3D=3D &#39;linux&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;vhost_user_bl=
k_server requires linux&#39;) \<br>
-=C2=A0 .require(&#39;CONFIG_VHOST_USER&#39; in config_host,<br>
+=C2=A0 .require(have_vhost_user,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;vhost_user_bl=
k_server requires vhost-user support&#39;) \<br>
=C2=A0 =C2=A0.disable_auto_if(not have_system) \<br>
=C2=A0 =C2=A0.allowed()<br>
@@ -2283,9 +2292,9 @@ host_kconfig =3D \<br>
=C2=A0 =C2=A0(have_ivshmem ? [&#39;CONFIG_IVSHMEM=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(opengl.found() ? [&#39;CONFIG_OPENGL=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(x11.found() ? [&#39;CONFIG_X11=3Dy&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_VHOST_USER&#39; in config_host ? [&#39;CONFIG_VHOST_US=
ER=3Dy&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_VHOST_VDPA&#39; in config_host ? [&#39;CONFIG_VHOST_VD=
PA=3Dy&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_VHOST_KERNEL&#39; in config_host ? [&#39;CONFIG_VHOST_=
KERNEL=3Dy&#39;] : []) + \<br>
+=C2=A0 (have_vhost_user ? [&#39;CONFIG_VHOST_USER=3Dy&#39;] : []) + \<br>
+=C2=A0 (have_vhost_vdpa ? [&#39;CONFIG_VHOST_VDPA=3Dy&#39;] : []) + \<br>
+=C2=A0 (have_vhost_kernel ? [&#39;CONFIG_VHOST_KERNEL=3Dy&#39;] : []) + \<=
br>
=C2=A0 =C2=A0(have_virtfs ? [&#39;CONFIG_VIRTFS=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_LINUX&#39; in config_host ? [&#39;CONFIG_LINUX=3D=
y&#39;] : []) + \<br>
=C2=A0 =C2=A0(have_pvrdma ? [&#39;CONFIG_PVRDMA=3Dy&#39;] : []) + \<br>
@@ -2967,7 +2976,7 @@ if have_system or have_user<br>
=C2=A0endif<br>
<br>
=C2=A0vhost_user =3D not_found<br>
-if targetos =3D=3D &#39;linux&#39; and &#39;CONFIG_VHOST_USER&#39; in conf=
ig_host<br>
+if targetos =3D=3D &#39;linux&#39; and have_vhost_user<br>
=C2=A0 =C2=A0libvhost_user =3D subproject(&#39;libvhost-user&#39;)<br>
=C2=A0 =C2=A0vhost_user =3D libvhost_user.get_variable(&#39;vhost_user_dep&=
#39;)<br>
=C2=A0endif<br>
@@ -3548,7 +3557,7 @@ if have_tools<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: qemuutil,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install: true)<br>
<br>
-=C2=A0 if &#39;CONFIG_VHOST_USER&#39; in config_host<br>
+=C2=A0 if have_vhost_user<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;contrib/vhost-user-blk&#39;)<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;contrib/vhost-user-gpu&#39;)<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;contrib/vhost-user-input&#39;)<br>
@@ -3674,12 +3683,12 @@ if &#39;simple&#39; in get_option(&#39;trace_backen=
ds&#39;)<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;D-Bus display&#39;:=C2=A0 =C2=A0 =C2=A0dbus_d=
isplay}<br>
=C2=A0summary_info +=3D {&#39;QOM debugging&#39;:=C2=A0 =C2=A0 =C2=A0get_op=
tion(&#39;qom_cast_debug&#39;)}<br>
-summary_info +=3D {&#39;vhost-kernel support&#39;: config_host.has_key(&#3=
9;CONFIG_VHOST_KERNEL&#39;)}<br>
-summary_info +=3D {&#39;vhost-net support&#39;: config_host.has_key(&#39;C=
ONFIG_VHOST_NET&#39;)}<br>
-summary_info +=3D {&#39;vhost-crypto support&#39;: config_host.has_key(&#3=
9;CONFIG_VHOST_CRYPTO&#39;)}<br>
-summary_info +=3D {&#39;vhost-user support&#39;: config_host.has_key(&#39;=
CONFIG_VHOST_USER&#39;)}<br>
+summary_info +=3D {&#39;vhost-kernel support&#39;: have_vhost_kernel}<br>
+summary_info +=3D {&#39;vhost-net support&#39;: have_vhost_net}<br>
+summary_info +=3D {&#39;vhost-user support&#39;: have_vhost_user}<br>
+summary_info +=3D {&#39;vhost-user-crypto support&#39;: have_vhost_user_cr=
ypto}<br>
=C2=A0summary_info +=3D {&#39;vhost-user-blk server support&#39;: have_vhos=
t_user_blk_server}<br>
-summary_info +=3D {&#39;vhost-vdpa support&#39;: config_host.has_key(&#39;=
CONFIG_VHOST_VDPA&#39;)}<br>
+summary_info +=3D {&#39;vhost-vdpa support&#39;: have_vhost_vdpa}<br>
=C2=A0summary_info +=3D {&#39;build guest agent&#39;: have_ga}<br>
=C2=A0summary(summary_info, bool_yn: true, section: &#39;Configurable featu=
res&#39;)<br>
<br>
diff --git a/tests/meson.build b/tests/meson.build<br>
index 4f691e8465..8e318ec513 100644<br>
--- a/tests/meson.build<br>
+++ b/tests/meson.build<br>
@@ -68,7 +68,7 @@ test_deps =3D {<br>
=C2=A0 =C2=A0&#39;test-qht-par&#39;: qht_bench,<br>
=C2=A0}<br>
<br>
-if have_tools and &#39;CONFIG_VHOST_USER&#39; in config_host and &#39;CONF=
IG_LINUX&#39; in config_host<br>
+if have_tools and have_vhost_user and &#39;CONFIG_LINUX&#39; in config_hos=
t<br>
=C2=A0 =C2=A0executable(&#39;vhost-user-bridge&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources: files(&#39;vhost-=
user-bridge.c&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies: [qemuutil, v=
host_user])<br>
diff --git a/tools/meson.build b/tools/meson.build<br>
index 46977af84f..10eb3a043f 100644<br>
--- a/tools/meson.build<br>
+++ b/tools/meson.build<br>
@@ -3,7 +3,7 @@ have_virtiofsd =3D get_option(&#39;virtiofsd&#39;) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;virtio=
fsd requires Linux&#39;) \<br>
=C2=A0 =C2=A0 =C2=A0.require(seccomp.found() and libcap_ng.found(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;virtio=
fsd requires libcap-ng-devel and seccomp-devel&#39;) \<br>
-=C2=A0 =C2=A0 .require(&#39;CONFIG_VHOST_USER&#39; in config_host,<br>
+=C2=A0 =C2=A0 .require(have_vhost_user,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;virtio=
fsd needs vhost-user-support&#39;) \<br>
=C2=A0 =C2=A0 =C2=A0.disable_auto_if(not have_tools and not have_system) \<=
br>
=C2=A0 =C2=A0 =C2=A0.allowed()<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f90cba05dd28e0d3--

