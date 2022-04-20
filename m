Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A6508D7E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:37:54 +0200 (CEST)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDKz-0002Ef-ED
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCxe-0004st-Lz
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:13:46 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCxc-00074M-1l
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:13:46 -0400
Received: by mail-qt1-x836.google.com with SMTP id d14so1313089qtw.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbTcCuDiR6dbXFNuSWQQWplxPNp22RV8JDS9nP8Z5Hc=;
 b=VmWN4lkM/Ff2XuEWI+9999RtKcgLiuoFgrU7XBhXi/R3L7T9SboBb4caBdfLeaeWrO
 pIGMpM3GyghyhxJSDI8cmWbqh6/Lj9qrKdrj1BmmV7Qb0BiFafacT+IGoBLEJDmMJzvP
 kL5cu7n+J+q2iaa5iwo1YZchxTk5hCeARcKPbcjccgAqCUkKvXH4jaXpA07+xhxpV2Dn
 WyxbtC8eBxp3EEa+Dmterwpmqsa5iM9sQsNIZR31sVmXbsHhvHM80dLb2enJ8hYd39/N
 QPTISrHWHBJ+ZUlPuF0/UpjADPQQIfXmsj66wT6NfUj7kDczIZfK6rCCgz43MkFT9k13
 GFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbTcCuDiR6dbXFNuSWQQWplxPNp22RV8JDS9nP8Z5Hc=;
 b=UdKP1YT75KV28+JGUqFbxnwvTxiNS8oa1AH4v1mWfwpMBeSMm0xV332S0WB8HNknEF
 9b28Lt9rYhMNkesDvh2Qi6d4rCa10unhJZ1G741l7WmK69liupXhFgMzsg5UEjmiRVbC
 DJEiJN5UyKKXr+c2seKg0xfpudeE5JLMYx9kXVhVnOaYOG35xszwc6H+zIgDgBHpKiGf
 LhGyeRwBKNm4BPMq8PLNLrcVkWceTOQBBj5uP8sGBa1XeY4xNCVvfIyweO7u38hkJcc+
 AgXmmdiC02nDnCKPIrXf/G3uccXFIqEwWlOplvZyzbmZry9wL0VlOlN0AgpKea5Qjlu3
 MqRA==
X-Gm-Message-State: AOAM531EjxiC910+2lN4kk1q6TQ86ldRA2ZMWAmtiG2qxhSjOxspqhfr
 JmsaIe5w9t4Cgp+XQjhcOGaiDAbQ8UwlE1f7AtU=
X-Google-Smtp-Source: ABdhPJw3D4+3okRG+0dTcuf0IQXiXIv0fm3ym5HAAVJBxrktzwmPeSAeug147upcxg3OrEOLIO2Dt8wrg9xIamtN62Y=
X-Received: by 2002:a05:622a:1443:b0:2eb:b4b7:c3b with SMTP id
 v3-20020a05622a144300b002ebb4b70c3bmr14161127qtx.574.1650471221938; Wed, 20
 Apr 2022 09:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-8-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-8-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:13:30 +0400
Message-ID: <CAJ+F1CK6464s=L2A23=WTp+qZ9+E_F_KKn_eWMbZOu-=dKO=dQ@mail.gmail.com>
Subject: Re: [PATCH 07/34] configure, meson: move OpenGL check to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e54d1b05dd1846fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x836.google.com
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

--000000000000e54d1b05dd1846fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 7:52 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                     | 40 -----------------------------------
>  meson.build                   | 16 +++++++++-----
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  ui/meson.build                | 17 ++++++++-------
>  5 files changed, 25 insertions(+), 53 deletions(-)
>
> diff --git a/configure b/configure
> index 07053e7b27..c9be6eb04d 100755
> --- a/configure
> +++ b/configure
> @@ -321,7 +321,6 @@ bsd_user=3D""
>  pkgversion=3D""
>  pie=3D""
>  trace_file=3D"trace"
> -opengl=3D"$default_feature"
>  coroutine=3D""
>  tls_priority=3D"NORMAL"
>  plugins=3D"$default_feature"
> @@ -960,10 +959,6 @@ for opt do
>    ;;
>    --enable-vhost-user-fs) vhost_user_fs=3D"yes"
>    ;;
> -  --disable-opengl) opengl=3D"no"
> -  ;;
> -  --enable-opengl) opengl=3D"yes"
> -  ;;
>    --disable-zlib-test)
>    ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
> @@ -1258,7 +1253,6 @@ cat << EOF
>    vhost-kernel    vhost kernel backend support
>    vhost-user      vhost-user backend support
>    vhost-vdpa      vhost-vdpa kernel backend support
> -  opengl          opengl support
>    gio             libgio support
>
>  NOTE: The object files are built at the place where configure is launche=
d
> @@ -2278,34 +2272,6 @@ case "$fdt" in
>  esac
>
>  ##########################################
> -# opengl probe (for sdl2, gtk)
> -
> -if test "$opengl" !=3D "no" ; then
> -  epoxy=3Dno
> -  if $pkg_config epoxy; then
> -    cat > $TMPC << EOF
> -#include <epoxy/egl.h>
> -int main(void) { return 0; }
> -EOF
> -    if compile_prog "" "" ; then
> -      epoxy=3Dyes
> -    fi
> -  fi
> -
> -  if test "$epoxy" =3D "yes" ; then
> -    opengl_cflags=3D"$($pkg_config --cflags epoxy)"
> -    opengl_libs=3D"$($pkg_config --libs epoxy)"
> -    opengl=3Dyes
> -  else
> -    if test "$opengl" =3D "yes" ; then
> -      feature_not_found "opengl" "Please install epoxy with EGL"
> -    fi
> -    opengl_cflags=3D""
> -    opengl_libs=3D""
> -    opengl=3Dno
> -  fi
> -fi
> -
>  # check for usbfs
>  have_usbfs=3Dno
>  if test "$linux_user" =3D "yes"; then
> @@ -2874,12 +2840,6 @@ if test "$vhost_user_fs" =3D "yes" ; then
>    echo "CONFIG_VHOST_USER_FS=3Dy" >> $config_host_mak
>  fi
>
> -if test "$opengl" =3D "yes" ; then
> -  echo "CONFIG_OPENGL=3Dy" >> $config_host_mak
> -  echo "OPENGL_CFLAGS=3D$opengl_cflags" >> $config_host_mak
> -  echo "OPENGL_LIBS=3D$opengl_libs" >> $config_host_mak
> -fi
> -
>  # XXX: suppress that
>  if [ "$bsd" =3D "yes" ] ; then
>    echo "CONFIG_BSD=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index cf3b1b39cf..f53fd66716 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1000,9 +1000,14 @@ if not get_option('coreaudio').auto() or (targetos
> =3D=3D 'darwin' and have_system)
>  endif
>
>  opengl =3D not_found
> -if 'CONFIG_OPENGL' in config_host
> -  opengl =3D declare_dependency(compile_args:
> config_host['OPENGL_CFLAGS'].split(),
> -                              link_args:
> config_host['OPENGL_LIBS'].split())
> +if not get_option('opengl').auto() or have_system or have_vhost_user_gpu
> +  epoxy =3D dependency('epoxy', method: 'pkg-config',
> +                      required: get_option('opengl'), kwargs:
> static_kwargs)
> +  if cc.has_header('epoxy/egl.h', dependencies: epoxy)
> +    opengl =3D epoxy
> +  elif get_option('opengl').enabled()
> +    error('epoxy/egl.h not found')
> +  endif
>  endif
>  gbm =3D not_found
>  if (have_system or have_tools) and (virgl.found() or opengl.found())
> @@ -1544,6 +1549,7 @@ config_host_data.set('CONFIG_LINUX_AIO',
> libaio.found())
>  config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>  config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
>  config_host_data.set('CONFIG_NUMA', numa.found())
> +config_host_data.set('CONFIG_OPENGL', opengl.found())
>  config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
>  config_host_data.set('CONFIG_RBD', rbd.found())
>  config_host_data.set('CONFIG_SDL', sdl.found())
> @@ -2079,7 +2085,7 @@ host_kconfig =3D \
>    (have_tpm ? ['CONFIG_TPM=3Dy'] : []) + \
>    (spice.found() ? ['CONFIG_SPICE=3Dy'] : []) + \
>    (have_ivshmem ? ['CONFIG_IVSHMEM=3Dy'] : []) + \
> -  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=3Dy'] : []) + \
> +  (opengl.found() ? ['CONFIG_OPENGL=3Dy'] : []) + \
>    (x11.found() ? ['CONFIG_X11=3Dy'] : []) + \
>    ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=3Dy'] : []) =
+ \
>    ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=3Dy'] : []) =
+ \
> @@ -3694,7 +3700,7 @@ summary_info +=3D {'smartcard support': cacard}
>  summary_info +=3D {'U2F support':       u2f}
>  summary_info +=3D {'libusb':            libusb}
>  summary_info +=3D {'usb net redir':     usbredir}
> -summary_info +=3D {'OpenGL support':
> config_host.has_key('CONFIG_OPENGL')}
> +summary_info +=3D {'OpenGL support (epoxy)': opengl}
>  summary_info +=3D {'GBM':               gbm}
>  summary_info +=3D {'libiscsi support':  libiscsi}
>  summary_info +=3D {'libnfs support':    libnfs}
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..bd8efe4fbf 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -149,6 +149,8 @@ option('lzo', type : 'feature', value : 'auto',
>         description: 'lzo compression support')
>  option('rbd', type : 'feature', value : 'auto',
>         description: 'Ceph block device driver')
> +option('opengl', type : 'feature', value : 'auto',
> +       description: 'OpenGL support')
>  option('gtk', type : 'feature', value : 'auto',
>         description: 'GTK+ user interface')
>  option('sdl', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 1e26f4571e..f91bd9231b 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -91,6 +91,7 @@ meson_options_help() {
>    printf "%s\n" '  nettle          nettle cryptography support'
>    printf "%s\n" '  numa            libnuma support'
>    printf "%s\n" '  nvmm            NVMM acceleration support'
> +  printf "%s\n" '  opengl          OpenGL support'
>    printf "%s\n" '  oss             OSS sound support'
>    printf "%s\n" '  pa              PulseAudio sound support'
>    printf "%s\n" '  parallels       parallels image format support'
> @@ -271,6 +272,8 @@ _meson_option_parse() {
>      --disable-numa) printf "%s" -Dnuma=3Ddisabled ;;
>      --enable-nvmm) printf "%s" -Dnvmm=3Denabled ;;
>      --disable-nvmm) printf "%s" -Dnvmm=3Ddisabled ;;
> +    --enable-opengl) printf "%s" -Dopengl=3Denabled ;;
> +    --disable-opengl) printf "%s" -Dopengl=3Ddisabled ;;
>      --enable-oss) printf "%s" -Doss=3Denabled ;;
>      --disable-oss) printf "%s" -Doss=3Ddisabled ;;
>      --enable-pa) printf "%s" -Dpa=3Denabled ;;
> diff --git a/ui/meson.build b/ui/meson.build
> index 64286ba150..b21d3d1534 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add(pixman)
>  specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the
> include path
> +specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)   # for the
> include path
>
>  softmmu_ss.add(files(
>    'clipboard.c',
> @@ -43,7 +44,6 @@ vnc_ss.add(zlib, png, jpeg, gnutls)
>  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
>  softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
>  softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
> -specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)
>
>  ui_modules =3D {}
>
> @@ -53,17 +53,18 @@ if curses.found()
>    ui_modules +=3D {'curses' : curses_ss}
>  endif
>
> -if config_host.has_key('CONFIG_OPENGL')
> +softmmu_ss.add(opengl)
>

I guess this line is superfluous


> +if opengl.found()
>    opengl_ss =3D ss.source_set()
>    opengl_ss.add(gbm)
> -  opengl_ss.add(when: [opengl, pixman, 'CONFIG_OPENGL'],
> +  opengl_ss.add(when: [opengl, pixman],
>                 if_true: files('shader.c', 'console-gl.c',
> 'egl-helpers.c', 'egl-context.c'))
>    ui_modules +=3D {'opengl' : opengl_ss}
>  endif
>
> -if config_host.has_key('CONFIG_OPENGL') and gbm.found()
> +if opengl.found() and gbm.found()
>    egl_headless_ss =3D ss.source_set()
> -  egl_headless_ss.add(when: [opengl, gbm, pixman, 'CONFIG_OPENGL'],
> +  egl_headless_ss.add(when: [opengl, gbm, pixman],
>                        if_true: files('egl-headless.c'))
>    ui_modules +=3D {'egl-headless' : egl_headless_ss}
>  endif
> @@ -98,8 +99,8 @@ if gtk.found()
>    gtk_ss =3D ss.source_set()
>    gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
>    gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
> -  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true:
> files('gtk-gl-area.c'))
> -  gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true:
> files('gtk-egl.c'))
> +  gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
> +  gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))
>    ui_modules +=3D {'gtk' : gtk_ss}
>  endif
>
> @@ -112,7 +113,7 @@ if sdl.found()
>      'sdl2-input.c',
>      'sdl2.c',
>    ))
> -  sdl_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-gl.c'=
))
> +  sdl_ss.add(when: opengl, if_true: files('sdl2-gl.c'))
>    sdl_ss.add(when: x11, if_true: files('x_keymap.c'))
>    ui_modules +=3D {'sdl' : sdl_ss}
>  endif
> --
> 2.35.1
>
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e54d1b05dd1846fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:52 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 40 -----------------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 16 +++++++++-----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 17 ++++++++-------<br>
=C2=A05 files changed, 25 insertions(+), 53 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 07053e7b27..c9be6eb04d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -321,7 +321,6 @@ bsd_user=3D&quot;&quot;<br>
=C2=A0pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
-opengl=3D&quot;$default_feature&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
@@ -960,10 +959,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user-fs) vhost_user_fs=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-opengl) opengl=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-opengl) opengl=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
@@ -1258,7 +1253,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
=C2=A0 =C2=A0vhost-user=C2=A0 =C2=A0 =C2=A0 vhost-user backend support<br>
=C2=A0 =C2=A0vhost-vdpa=C2=A0 =C2=A0 =C2=A0 vhost-vdpa kernel backend suppo=
rt<br>
-=C2=A0 opengl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opengl support<br>
=C2=A0 =C2=A0gio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgio supp=
ort<br>
<br>
=C2=A0NOTE: The object files are built at the place where configure is laun=
ched<br>
@@ -2278,34 +2272,6 @@ case &quot;$fdt&quot; in<br>
=C2=A0esac<br>
<br>
=C2=A0##########################################<br>
-# opengl probe (for sdl2, gtk)<br>
-<br>
-if test &quot;$opengl&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 epoxy=3Dno<br>
-=C2=A0 if $pkg_config epoxy; then<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;epoxy/egl.h&gt;<br>
-int main(void) { return 0; }<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 epoxy=3Dyes<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 fi<br>
-<br>
-=C2=A0 if test &quot;$epoxy&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 opengl_cflags=3D&quot;$($pkg_config --cflags epoxy)&quot;<br=
>
-=C2=A0 =C2=A0 opengl_libs=3D&quot;$($pkg_config --libs epoxy)&quot;<br>
-=C2=A0 =C2=A0 opengl=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$opengl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;opengl&quot; &quot;Please ins=
tall epoxy with EGL&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 opengl_cflags=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 opengl_libs=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 opengl=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0# check for usbfs<br>
=C2=A0have_usbfs=3Dno<br>
=C2=A0if test &quot;$linux_user&quot; =3D &quot;yes&quot;; then<br>
@@ -2874,12 +2840,6 @@ if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quo=
t; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_USER_FS=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
=C2=A0fi<br>
<br>
-if test &quot;$opengl&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_OPENGL=3Dy&quot; &gt;&gt; $config_host_mak<br>
-=C2=A0 echo &quot;OPENGL_CFLAGS=3D$opengl_cflags&quot; &gt;&gt; $config_ho=
st_mak<br>
-=C2=A0 echo &quot;OPENGL_LIBS=3D$opengl_libs&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
-<br>
=C2=A0# XXX: suppress that<br>
=C2=A0if [ &quot;$bsd&quot; =3D &quot;yes&quot; ] ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_BSD=3Dy&quot; &gt;&gt; $config_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index cf3b1b39cf..f53fd66716 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1000,9 +1000,14 @@ if not get_option(&#39;coreaudio&#39;).auto() or (ta=
rgetos =3D=3D &#39;darwin&#39; and have_system)<br>
=C2=A0endif<br>
<br>
=C2=A0opengl =3D not_found<br>
-if &#39;CONFIG_OPENGL&#39; in config_host<br>
-=C2=A0 opengl =3D declare_dependency(compile_args: config_host[&#39;OPENGL=
_CFLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;OPENGL_LIBS&#39=
;].split())<br>
+if not get_option(&#39;opengl&#39;).auto() or have_system or have_vhost_us=
er_gpu<br>
+=C2=A0 epoxy =3D dependency(&#39;epoxy&#39;, method: &#39;pkg-config&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;opengl&#39;), kwargs: static_kwargs)<br>
+=C2=A0 if cc.has_header(&#39;epoxy/egl.h&#39;, dependencies: epoxy)<br>
+=C2=A0 =C2=A0 opengl =3D epoxy<br>
+=C2=A0 elif get_option(&#39;opengl&#39;).enabled()<br>
+=C2=A0 =C2=A0 error(&#39;epoxy/egl.h not found&#39;)<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
=C2=A0gbm =3D not_found<br>
=C2=A0if (have_system or have_tools) and (virgl.found() or opengl.found())<=
br>
@@ -1544,6 +1549,7 @@ config_host_data.set(&#39;CONFIG_LINUX_AIO&#39;, liba=
io.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LINUX_IO_URING&#39;, linux_io_uring.=
found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_LIBPMEM&#39;, libpmem.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_NUMA&#39;, numa.found())<br>
+config_host_data.set(&#39;CONFIG_OPENGL&#39;, opengl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_PROFILER&#39;, get_option(&#39;profi=
ler&#39;))<br>
=C2=A0config_host_data.set(&#39;CONFIG_RBD&#39;, rbd.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_SDL&#39;, sdl.found())<br>
@@ -2079,7 +2085,7 @@ host_kconfig =3D \<br>
=C2=A0 =C2=A0(have_tpm ? [&#39;CONFIG_TPM=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(spice.found() ? [&#39;CONFIG_SPICE=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(have_ivshmem ? [&#39;CONFIG_IVSHMEM=3Dy&#39;] : []) + \<br>
-=C2=A0 (&#39;CONFIG_OPENGL&#39; in config_host ? [&#39;CONFIG_OPENGL=3Dy&#=
39;] : []) + \<br>
+=C2=A0 (opengl.found() ? [&#39;CONFIG_OPENGL=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(x11.found() ? [&#39;CONFIG_X11=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_USER&#39; in config_host ? [&#39;CONFIG_VHO=
ST_USER=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0(&#39;CONFIG_VHOST_VDPA&#39; in config_host ? [&#39;CONFIG_VHO=
ST_VDPA=3Dy&#39;] : []) + \<br>
@@ -3694,7 +3700,7 @@ summary_info +=3D {&#39;smartcard support&#39;: cacar=
d}<br>
=C2=A0summary_info +=3D {&#39;U2F support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0u=
2f}<br>
=C2=A0summary_info +=3D {&#39;libusb&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 libusb}<br>
=C2=A0summary_info +=3D {&#39;usb net redir&#39;:=C2=A0 =C2=A0 =C2=A0usbred=
ir}<br>
-summary_info +=3D {&#39;OpenGL support&#39;:=C2=A0 =C2=A0 config_host.has_=
key(&#39;CONFIG_OPENGL&#39;)}<br>
+summary_info +=3D {&#39;OpenGL support (epoxy)&#39;: opengl}<br>
=C2=A0summary_info +=3D {&#39;GBM&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0gbm}<br>
=C2=A0summary_info +=3D {&#39;libiscsi support&#39;:=C2=A0 libiscsi}<br>
=C2=A0summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =C2=A0 libnfs}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 52b11cead4..bd8efe4fbf 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -149,6 +149,8 @@ option(&#39;lzo&#39;, type : &#39;feature&#39;, value :=
 &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;lzo compression support&#39;)=
<br>
=C2=A0option(&#39;rbd&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Ceph block device driver&#39;=
)<br>
+option(&#39;opengl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;OpenGL support&#39;)<br>
=C2=A0option(&#39;gtk&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;GTK+ user interface&#39;)<br>
=C2=A0option(&#39;sdl&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 1e26f4571e..f91bd9231b 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -91,6 +91,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 nettle=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 nettle cryptography support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 numa=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 libnuma support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 nvmm=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NVMM acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 opengl=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 OpenGL support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 oss=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0OSS sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 pa=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 PulseAudio sound support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 parallels=C2=A0 =C2=A0 =C2=
=A0 =C2=A0parallels image format support&#39;<br>
@@ -271,6 +272,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-numa) printf &quot;%s&quot; -Dnuma=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-nvmm) printf &quot;%s&quot; -Dnvmm=3Denabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--disable-nvmm) printf &quot;%s&quot; -Dnvmm=3Ddisabled=
 ;;<br>
+=C2=A0 =C2=A0 --enable-opengl) printf &quot;%s&quot; -Dopengl=3Denabled ;;=
<br>
+=C2=A0 =C2=A0 --disable-opengl) printf &quot;%s&quot; -Dopengl=3Ddisabled =
;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-oss) printf &quot;%s&quot; -Doss=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-oss) printf &quot;%s&quot; -Doss=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-pa) printf &quot;%s&quot; -Dpa=3Denabled ;;<br=
>
diff --git a/ui/meson.build b/ui/meson.build<br>
index 64286ba150..b21d3d1534 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -1,5 +1,6 @@<br>
=C2=A0softmmu_ss.add(pixman)<br>
=C2=A0specific_ss.add(when: [&#39;CONFIG_SOFTMMU&#39;], if_true: pixman)=C2=
=A0 =C2=A0# for the include path<br>
+specific_ss.add(when: [&#39;CONFIG_SOFTMMU&#39;], if_true: opengl)=C2=A0 =
=C2=A0# for the include path<br>
<br>
=C2=A0softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;clipboard.c&#39;,<br>
@@ -43,7 +44,6 @@ vnc_ss.add(zlib, png, jpeg, gnutls)<br>
=C2=A0vnc_ss.add(when: sasl, if_true: files(&#39;vnc-auth-sasl.c&#39;))<br>
=C2=A0softmmu_ss.add_all(when: vnc, if_true: vnc_ss)<br>
=C2=A0softmmu_ss.add(when: vnc, if_false: files(&#39;vnc-stubs.c&#39;))<br>
-specific_ss.add(when: [&#39;CONFIG_SOFTMMU&#39;], if_true: opengl)<br>
<br>
=C2=A0ui_modules =3D {}<br>
<br>
@@ -53,17 +53,18 @@ if curses.found()<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;curses&#39; : curses_ss}<br>
=C2=A0endif<br>
<br>
-if config_host.has_key(&#39;CONFIG_OPENGL&#39;)<br>
+softmmu_ss.add(opengl)<br></blockquote><div><br></div><div>I guess this li=
ne is superfluous</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+if opengl.found()<br>
=C2=A0 =C2=A0opengl_ss =3D ss.source_set()<br>
=C2=A0 =C2=A0opengl_ss.add(gbm)<br>
-=C2=A0 opengl_ss.add(when: [opengl, pixman, &#39;CONFIG_OPENGL&#39;],<br>
+=C2=A0 opengl_ss.add(when: [opengl, pixman],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if_true: files(&#39=
;shader.c&#39;, &#39;console-gl.c&#39;, &#39;egl-helpers.c&#39;, &#39;egl-c=
ontext.c&#39;))<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;opengl&#39; : opengl_ss}<br>
=C2=A0endif<br>
<br>
-if config_host.has_key(&#39;CONFIG_OPENGL&#39;) and gbm.found()<br>
+if opengl.found() and gbm.found()<br>
=C2=A0 =C2=A0egl_headless_ss =3D ss.source_set()<br>
-=C2=A0 egl_headless_ss.add(when: [opengl, gbm, pixman, &#39;CONFIG_OPENGL&=
#39;],<br>
+=C2=A0 egl_headless_ss.add(when: [opengl, gbm, pixman],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if_true: files(&#39;egl-headless.c&#39;))<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;egl-headless&#39; : egl_headless_ss}<br>
=C2=A0endif<br>
@@ -98,8 +99,8 @@ if gtk.found()<br>
=C2=A0 =C2=A0gtk_ss =3D ss.source_set()<br>
=C2=A0 =C2=A0gtk_ss.add(gtk, vte, pixman, files(&#39;gtk.c&#39;, &#39;gtk-c=
lipboard.c&#39;))<br>
=C2=A0 =C2=A0gtk_ss.add(when: x11, if_true: files(&#39;x_keymap.c&#39;))<br=
>
-=C2=A0 gtk_ss.add(when: [opengl, &#39;CONFIG_OPENGL&#39;], if_true: files(=
&#39;gtk-gl-area.c&#39;))<br>
-=C2=A0 gtk_ss.add(when: [x11, opengl, &#39;CONFIG_OPENGL&#39;], if_true: f=
iles(&#39;gtk-egl.c&#39;))<br>
+=C2=A0 gtk_ss.add(when: opengl, if_true: files(&#39;gtk-gl-area.c&#39;))<b=
r>
+=C2=A0 gtk_ss.add(when: [x11, opengl], if_true: files(&#39;gtk-egl.c&#39;)=
)<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;gtk&#39; : gtk_ss}<br>
=C2=A0endif<br>
<br>
@@ -112,7 +113,7 @@ if sdl.found()<br>
=C2=A0 =C2=A0 =C2=A0&#39;sdl2-input.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;sdl2.c&#39;,<br>
=C2=A0 =C2=A0))<br>
-=C2=A0 sdl_ss.add(when: [opengl, &#39;CONFIG_OPENGL&#39;], if_true: files(=
&#39;sdl2-gl.c&#39;))<br>
+=C2=A0 sdl_ss.add(when: opengl, if_true: files(&#39;sdl2-gl.c&#39;))<br>
=C2=A0 =C2=A0sdl_ss.add(when: x11, if_true: files(&#39;x_keymap.c&#39;))<br=
>
=C2=A0 =C2=A0ui_modules +=3D {&#39;sdl&#39; : sdl_ss}<br>
=C2=A0endif<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>Reviewed-by: Marc-Andr=C3=A9 Lure=
au &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a>&gt;</div><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e54d1b05dd1846fb--

