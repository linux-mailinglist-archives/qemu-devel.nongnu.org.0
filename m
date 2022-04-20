Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09679508DD8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:58:00 +0200 (CEST)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDeR-0004it-4E
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDNS-0001Ka-SB
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:40:27 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDNP-00031E-DF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:40:26 -0400
Received: by mail-qt1-x82e.google.com with SMTP id x24so1361603qtq.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpmP+aXwx/rdrPNMQ10LvLcNRS6vDA4EdnfhPEouiXw=;
 b=pbRyg4XWeJsn0uHaUaZKtT0qKBj2MnxjjcdwuLRNQ3tahhXwMMwREWgKGaIEbNO0gN
 vfkzonYHyQGbfyI302IBIxfP5mJf1gMNkLlZ0qFhtaM6xCLo6PjXbdb8QjWqHNU6gLeh
 t33hVnW/Ih+PhZfSDNZHpbUTJ/07VPeo4a67XlTDduiGntIjz2sLOqibrsvCn4lZ8J4A
 Gvb5xOfA5ctF3bygzI5quS7jrH9noTKTA9UKU7dw8HfQLnRPLfuwAmfTwMvWkDGH3R2D
 5eU4eyNuAMDPou5hHeFxtSjj2CmAyvJ47IQIPsmDTOaEgufi4bv3cQMeejDm7w6GUG8t
 fdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpmP+aXwx/rdrPNMQ10LvLcNRS6vDA4EdnfhPEouiXw=;
 b=ngA5z5mB0prByEvOl1E3vYhSGDWGrnrrj/1OEK+sX/X3mDwx2nd5s7bL3oL+QcTggp
 GVFSHJCZO9cb/RV+J5pDmRBS4w8vZOI2z6zwfdEA2mvluYYZpage6eJkC0vuvYe3GK1m
 QdN5MoDOs8ys7Mp5NKhPTyNbNJUN3SKvASUw0XJ1a170fDQG8S2yrW6jIspvVoGBv3ZZ
 ZEZGjzqD3OqA2igUSFSKAQqFnjGuC+C9OrOIOuYb7iT+aC4QehfqnZcXnnuOaoSJAIB+
 VedRBFfEvGqFpEJ9Cbz2L71MDq0IlglG9pp75pI2LVXNrmrXZOWpqEeopdHo2jxhUoEA
 R2zA==
X-Gm-Message-State: AOAM532BtaU2ybp3XPGl2d3gX8DqgBGVlIUQ2DuWPoXd2Fk+OSLcM7XD
 NasCeXWOz5QxMF2BUkVrVPHsfY62IJZmfrQefKb7jT2mY/6Wng==
X-Google-Smtp-Source: ABdhPJye9HpnHaUVzC5MdZAyXXWmCZuaEmss2WSlU1FBK/x/U2roxfswlQShrEl+L80sX+R50fWTy1V80fv+P1MWBKk=
X-Received: by 2002:a05:622a:1443:b0:2eb:b4b7:c3b with SMTP id
 v3-20020a05622a144300b002ebb4b70c3bmr14247516qtx.574.1650472821895; Wed, 20
 Apr 2022 09:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-12-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-12-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:40:10 +0400
Message-ID: <CAJ+F1CLbjXt6goVQ8oSxdwq7nf-vny5cnasiQZf-8mHaAuW49g@mail.gmail.com>
Subject: Re: [PATCH 11/34] meson, configure: move libgio test to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000042b59005dd18a6ac"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x82e.google.com
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

--00000000000042b59005dd18a6ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:49 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  backends/meson.build          |  2 +-
>  configure                     | 58 -----------------------------------
>  meson.build                   | 32 ++++++++++++++++---
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 ++
>  tests/qtest/meson.build       |  5 ++-
>  ui/meson.build                |  7 ++---
>  util/meson.build              |  2 +-
>  8 files changed, 39 insertions(+), 72 deletions(-)
>
> diff --git a/backends/meson.build b/backends/meson.build
> index 6e68945528..535c3ca7dd 100644
> --- a/backends/meson.build
> +++ b/backends/meson.build
> @@ -15,7 +15,7 @@ softmmu_ss.add(when: 'CONFIG_LINUX', if_true:
> files('hostmem-memfd.c'))
>  softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true:
> files('vhost-user.c'))
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true:
> files('cryptodev-vhost.c'))
>  softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'],
> if_true: files('cryptodev-vhost-user.c'))
> -softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'),
> gio])
> +softmmu_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
>  softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
>
>  subdir('tpm')
> diff --git a/configure b/configure
> index d4d7c001f6..75e8b1e7aa 100755
> --- a/configure
> +++ b/configure
> @@ -325,7 +325,6 @@ plugins=3D"$default_feature"
>  meson=3D""
>  meson_args=3D""
>  ninja=3D""
> -gio=3D"$default_feature"
>  skip_meson=3Dno
>
>  # The following Meson options are handled manually (still they
> @@ -1008,10 +1007,6 @@ for opt do
>    ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
> -  --enable-gio) gio=3Dyes
> -  ;;
> -  --disable-gio) gio=3Dno
> -  ;;
>    # backwards compatibility options
>    --enable-trace-backend=3D*) meson_option_parse
> "--enable-trace-backends=3D$optarg" "$optarg"
>    ;;
> @@ -1236,7 +1231,6 @@ cat << EOF
>    vhost-kernel    vhost kernel backend support
>    vhost-user      vhost-user backend support
>    vhost-vdpa      vhost-vdpa kernel backend support
> -  gio             libgio support
>
>  NOTE: The object files are built at the place where configure is launche=
d
>  EOF
> @@ -2047,50 +2041,6 @@ if test "$static" =3D yes && test "$mingw32" =3D y=
es;
> then
>      glib_cflags=3D"-DGLIB_STATIC_COMPILATION $glib_cflags"
>  fi
>
> -if ! test "$gio" =3D "no"; then
> -    pass=3Dno
> -    if $pkg_config --atleast-version=3D$glib_req_ver gio-2.0; then
> -        gio_cflags=3D$($pkg_config --cflags gio-2.0)
> -        gio_libs=3D$($pkg_config --libs gio-2.0)
> -        gdbus_codegen=3D$($pkg_config --variable=3Dgdbus_codegen gio-2.0=
)
> -        if ! has "$gdbus_codegen"; then
> -            gdbus_codegen=3D
> -        fi
> -        # Check that the libraries actually work -- Ubuntu 18.04 ships
> -        # with pkg-config --static --libs data for gio-2.0 that is missi=
ng
> -        # -lblkid and will give a link error.
> -        cat > $TMPC <<EOF
> -#include <gio/gio.h>
> -int main(void)
> -{
> -    g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
> -    return 0;
> -}
> -EOF
> -        if compile_prog "$gio_cflags" "$gio_libs" ; then
> -            pass=3Dyes
> -        else
> -            pass=3Dno
> -        fi
> -
> -        if test "$pass" =3D "yes" &&
> -            $pkg_config --atleast-version=3D$glib_req_ver gio-unix-2.0; =
then
> -            gio_cflags=3D"$gio_cflags $($pkg_config --cflags gio-unix-2.=
0)"
> -            gio_libs=3D"$gio_libs $($pkg_config --libs gio-unix-2.0)"
> -        fi
> -    fi
> -
> -    if test "$pass" =3D "no"; then
> -        if test "$gio" =3D "yes"; then
> -            feature_not_found "gio" "Install libgio >=3D 2.0"
> -        else
> -            gio=3Dno
> -        fi
> -    else
> -        gio=3Dyes
> -    fi
> -fi
> -
>  # Sanity check that the current size_t matches the
>  # size that glib thinks it should be. This catches
>  # problems on multi-arch where people try to build
> @@ -2616,14 +2566,6 @@ fi
>  if test "$module_upgrades" =3D "yes"; then
>    echo "CONFIG_MODULE_UPGRADES=3Dy" >> $config_host_mak
>  fi
> -if test "$gio" =3D "yes" ; then
> -    echo "CONFIG_GIO=3Dy" >> $config_host_mak
> -    echo "GIO_CFLAGS=3D$gio_cflags" >> $config_host_mak
> -    echo "GIO_LIBS=3D$gio_libs" >> $config_host_mak
> -fi
> -if test "$gdbus_codegen" !=3D "" ; then
> -    echo "GDBUS_CODEGEN=3D$gdbus_codegen" >> $config_host_mak
> -fi
>  echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
>
>  if test "$xen" =3D "enabled" ; then
> diff --git a/meson.build b/meson.build
> index c0b2838d2e..b8046efcf1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -448,11 +448,32 @@ glib =3D declare_dependency(compile_args:
> config_host['GLIB_CFLAGS'].split(),
>  meson.override_dependency('glib-2.0', glib)
>
>  gio =3D not_found
> -if 'CONFIG_GIO' in config_host
> -  gio =3D declare_dependency(compile_args:
> config_host['GIO_CFLAGS'].split(),
> -                           link_args: config_host['GIO_LIBS'].split(),
> -                           version: config_host['GLIB_VERSION'])
> +gdbus_codegen =3D not_found
> +if not get_option('gio').auto() or have_system
> +  gio =3D dependency('gio-2.0', required: get_option('gio'),
> +                   method: 'pkg-config', kwargs: static_kwargs)
> +  if gio.found() and not cc.links('''
> +    #include <gio/gio.h>
> +    int main(void)
> +    {
> +      g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);
> +      return 0;
> +    }''', dependencies: [glib, gio])
> +    if get_option('gio').enabled()
> +      error('The installed libgio is broken for static linking')
> +    endif
> +    gio =3D not_found
> +  endif
> +  if gio.found()
> +    gdbus_codegen =3D find_program(gio.get_variable('gdbus_codegen'),
> +                                 required: get_option('gio'))
> +    gio_unix =3D dependency('gio-unix-2.0', required: get_option('gio'),
> +                          method: 'pkg-config', kwargs: static_kwargs)
> +    gio =3D declare_dependency(dependencies: [gio, gio_unix],
> +                             version: gio.version())
> +  endif
>  endif
> +
>  lttng =3D not_found
>  if 'ust' in get_option('trace_backends')
>    lttng =3D dependency('lttng-ust', required: true, version: '>=3D 2.1',
> @@ -1478,7 +1499,7 @@ dbus_display =3D get_option('dbus_display') \
>             error_message: '-display dbus requires glib>=3D2.64') \
>    .require(enable_modules,
>             error_message: '-display dbus requires --enable-modules') \
> -  .require(config_host.has_key('GDBUS_CODEGEN'),
> +  .require(gdbus_codegen.found(),
>             error_message: '-display dbus requires gdbus-codegen') \
>    .allowed()
>
> @@ -1540,6 +1561,7 @@ config_host_data.set('CONFIG_MPATH_NEW_API',
> mpathpersist_new_api)
>  config_host_data.set('CONFIG_CURL', curl.found())
>  config_host_data.set('CONFIG_CURSES', curses.found())
>  config_host_data.set('CONFIG_GBM', gbm.found())
> +config_host_data.set('CONFIG_GIO', gio.found())
>  config_host_data.set('CONFIG_GLUSTERFS', glusterfs.found())
>  if glusterfs.found()
>    config_host_data.set('CONFIG_GLUSTERFS_XLATOR_OPT',
> glusterfs.version().version_compare('>=3D4'))
> diff --git a/meson_options.txt b/meson_options.txt
> index d58c69315c..d140c0ef89 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -109,6 +109,8 @@ option('cocoa', type : 'feature', value : 'auto',
>         description: 'Cocoa user interface (macOS only)')
>  option('curl', type : 'feature', value : 'auto',
>         description: 'CURL block device driver')
> +option('gio', type : 'feature', value : 'auto',
> +       description: 'use libgio for D-Bus support')
>  option('glusterfs', type : 'feature', value : 'auto',
>         description: 'Glusterfs block device driver')
>  option('libiscsi', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 0daeb11fd3..92be3e6187 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -59,6 +59,7 @@ meson_options_help() {
>    printf "%s\n" '  fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE
> exports'
>    printf "%s\n" '  gcrypt          libgcrypt cryptography support'
>    printf "%s\n" '  gettext         Localization of the GTK+ user
> interface'
> +  printf "%s\n" '  gio             use libgio for D-Bus support'
>    printf "%s\n" '  glusterfs       Glusterfs block device driver'
>    printf "%s\n" '  gnutls          GNUTLS cryptography support'
>    printf "%s\n" '  gtk             GTK+ user interface'
> @@ -208,6 +209,8 @@ _meson_option_parse() {
>      --disable-gcrypt) printf "%s" -Dgcrypt=3Ddisabled ;;
>      --enable-gettext) printf "%s" -Dgettext=3Denabled ;;
>      --disable-gettext) printf "%s" -Dgettext=3Ddisabled ;;
> +    --enable-gio) printf "%s" -Dgio=3Denabled ;;
> +    --disable-gio) printf "%s" -Dgio=3Ddisabled ;;
>      --enable-glusterfs) printf "%s" -Dglusterfs=3Denabled ;;
>      --disable-glusterfs) printf "%s" -Dglusterfs=3Ddisabled ;;
>      --enable-gnutls) printf "%s" -Dgnutls=3Denabled ;;
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index d25f82bb5a..69f97b8992 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -99,14 +99,13 @@ if dbus_display
>  endif
>
>  dbus_daemon =3D find_program('dbus-daemon', required: false)
> -if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
> +if dbus_daemon.found() and gdbus_codegen.found()
>    # Temporarily disabled due to Patchew failures:
>    #qtests_i386 +=3D ['dbus-vmstate-test']
>    dbus_vmstate1 =3D custom_target('dbus-vmstate description',
>                                  output: ['dbus-vmstate1.h',
> 'dbus-vmstate1.c'],
>                                  input: meson.project_source_root() /
> 'backends/dbus-vmstate1.xml',
> -                                command: [config_host['GDBUS_CODEGEN'],
> -                                          '@INPUT@',
> +                                command: [gdbus_codegen, '@INPUT@',
>                                            '--interface-prefix',
> 'org.qemu',
>                                            '--generate-c-code', '@BASENAM=
E@
> ']).to_list()
>  else
> diff --git a/ui/meson.build b/ui/meson.build
> index b21d3d1534..eba93b41e3 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -74,14 +74,13 @@ if dbus_display
>    dbus_display1 =3D custom_target('dbus-display gdbus-codegen',
>                                  output: ['dbus-display1.h',
> 'dbus-display1.c'],
>                                  input: files('dbus-display1.xml'),
> -                                command: [config_host['GDBUS_CODEGEN'],
> -                                          '@INPUT@',
> +                                command: [gdbus_codegen, '@INPUT@',
>                                            '--glib-min-required', '2.64',
>                                            '--output-directory',
> meson.current_build_dir(),
>                                            '--interface-prefix',
> 'org.qemu.',
>                                            '--c-namespace', 'QemuDBus',
>                                            '--generate-c-code', '@BASENAM=
E@
> '])
> -  dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
> +  dbus_ss.add(when: [gio, pixman, opengl],
>                if_true: [files(
>                  'dbus-chardev.c',
>                  'dbus-clipboard.c',
> @@ -128,7 +127,7 @@ if spice.found()
>    ui_modules +=3D {'spice-core' : spice_core_ss}
>  endif
>
> -if spice.found() and config_host.has_key('CONFIG_GIO')
> +if spice.found() and gio.found()
>    spice_ss =3D ss.source_set()
>    spice_ss.add(spice, gio, pixman, files('spice-app.c'))
>    ui_modules +=3D {'spice-app': spice_ss}
> diff --git a/util/meson.build b/util/meson.build
> index 82eec004e2..8f16018cd4 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -61,7 +61,7 @@ endif
>
>  if have_system
>    util_ss.add(files('crc-ccitt.c'))
> -  util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> +  util_ss.add(when: gio, if_true: files('dbus.c'))
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
>
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000042b59005dd18a6ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:49 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0backends/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 58 -----------------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 32 ++++++++++++++++---<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 3 ++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++-<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 7 ++---<br>
=C2=A0util/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A08 files changed, 39 insertions(+), 72 deletions(-)<br>
<br>
diff --git a/backends/meson.build b/backends/meson.build<br>
index 6e68945528..535c3ca7dd 100644<br>
--- a/backends/meson.build<br>
+++ b/backends/meson.build<br>
@@ -15,7 +15,7 @@ softmmu_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: fil=
es(&#39;hostmem-memfd.c&#39;))<br>
=C2=A0softmmu_ss.add(when: [&#39;CONFIG_VHOST_USER&#39;, &#39;CONFIG_VIRTIO=
&#39;], if_true: files(&#39;vhost-user.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_VIRTIO_CRYPTO&#39;, if_true: files(&=
#39;cryptodev-vhost.c&#39;))<br>
=C2=A0softmmu_ss.add(when: [&#39;CONFIG_VIRTIO_CRYPTO&#39;, &#39;CONFIG_VHO=
ST_CRYPTO&#39;], if_true: files(&#39;cryptodev-vhost-user.c&#39;))<br>
-softmmu_ss.add(when: &#39;CONFIG_GIO&#39;, if_true: [files(&#39;dbus-vmsta=
te.c&#39;), gio])<br>
+softmmu_ss.add(when: gio, if_true: files(&#39;dbus-vmstate.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SGX&#39;, if_true: files(&#39;hostme=
m-epc.c&#39;))<br>
<br>
=C2=A0subdir(&#39;tpm&#39;)<br>
diff --git a/configure b/configure<br>
index d4d7c001f6..75e8b1e7aa 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -325,7 +325,6 @@ plugins=3D&quot;$default_feature&quot;<br>
=C2=A0meson=3D&quot;&quot;<br>
=C2=A0meson_args=3D&quot;&quot;<br>
=C2=A0ninja=3D&quot;&quot;<br>
-gio=3D&quot;$default_feature&quot;<br>
=C2=A0skip_meson=3Dno<br>
<br>
=C2=A0# The following Meson options are handled manually (still they<br>
@@ -1008,10 +1007,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--gdb=3D*) gdb_bin=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-gio) gio=3Dyes<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-gio) gio=3Dno<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0# backwards compatibility options<br>
=C2=A0 =C2=A0--enable-trace-backend=3D*) meson_option_parse &quot;--enable-=
trace-backends=3D$optarg&quot; &quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1236,7 +1231,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
=C2=A0 =C2=A0vhost-user=C2=A0 =C2=A0 =C2=A0 vhost-user backend support<br>
=C2=A0 =C2=A0vhost-vdpa=C2=A0 =C2=A0 =C2=A0 vhost-vdpa kernel backend suppo=
rt<br>
-=C2=A0 gio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libgio support<b=
r>
<br>
=C2=A0NOTE: The object files are built at the place where configure is laun=
ched<br>
=C2=A0EOF<br>
@@ -2047,50 +2041,6 @@ if test &quot;$static&quot; =3D yes &amp;&amp; test =
&quot;$mingw32&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0glib_cflags=3D&quot;-DGLIB_STATIC_COMPILATION $glib_cfl=
ags&quot;<br>
=C2=A0fi<br>
<br>
-if ! test &quot;$gio&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 pass=3Dno<br>
-=C2=A0 =C2=A0 if $pkg_config --atleast-version=3D$glib_req_ver gio-2.0; th=
en<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gio_cflags=3D$($pkg_config --cflags gio-2.0)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gio_libs=3D$($pkg_config --libs gio-2.0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdbus_codegen=3D$($pkg_config --variable=3Dgdb=
us_codegen gio-2.0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! has &quot;$gdbus_codegen&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdbus_codegen=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the libraries actually work -- Ub=
untu 18.04 ships<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # with pkg-config --static --libs data for gio=
-2.0 that is missing<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # -lblkid and will give a link error.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt;EOF<br>
-#include &lt;gio/gio.h&gt;<br>
-int main(void)<br>
-{<br>
-=C2=A0 =C2=A0 g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);<br>
-=C2=A0 =C2=A0 return 0;<br>
-}<br>
-EOF<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if compile_prog &quot;$gio_cflags&quot; &quot;=
$gio_libs&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass=3Dno<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$pass&quot; =3D &quot;yes&quot; =
&amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $pkg_config --atleast-version=3D=
$glib_req_ver gio-unix-2.0; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gio_cflags=3D&quot;$gio_cflags $=
($pkg_config --cflags gio-unix-2.0)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gio_libs=3D&quot;$gio_libs $($pk=
g_config --libs gio-unix-2.0)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 if test &quot;$pass&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$gio&quot; =3D &quot;yes&quot;; =
then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;gio&quot=
; &quot;Install libgio &gt;=3D 2.0&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gio=3Dno<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gio=3Dyes<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0# Sanity check that the current size_t matches the<br>
=C2=A0# size that glib thinks it should be. This catches<br>
=C2=A0# problems on multi-arch where people try to build<br>
@@ -2616,14 +2566,6 @@ fi<br>
=C2=A0if test &quot;$module_upgrades&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULE_UPGRADES=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
-if test &quot;$gio&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_GIO=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 =C2=A0 echo &quot;GIO_CFLAGS=3D$gio_cflags&quot; &gt;&gt; $config_h=
ost_mak<br>
-=C2=A0 =C2=A0 echo &quot;GIO_LIBS=3D$gio_libs&quot; &gt;&gt; $config_host_=
mak<br>
-fi<br>
-if test &quot;$gdbus_codegen&quot; !=3D &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;GDBUS_CODEGEN=3D$gdbus_codegen&quot; &gt;&gt; $co=
nfig_host_mak<br>
-fi<br>
=C2=A0echo &quot;CONFIG_TLS_PRIORITY=3D\&quot;$tls_priority\&quot;&quot; &g=
t;&gt; $config_host_mak<br>
<br>
=C2=A0if test &quot;$xen&quot; =3D &quot;enabled&quot; ; then<br>
diff --git a/meson.build b/meson.build<br>
index c0b2838d2e..b8046efcf1 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -448,11 +448,32 @@ glib =3D declare_dependency(compile_args: config_host=
[&#39;GLIB_CFLAGS&#39;].split(),<br>
=C2=A0meson.override_dependency(&#39;glib-2.0&#39;, glib)<br>
<br>
=C2=A0gio =3D not_found<br>
-if &#39;CONFIG_GIO&#39; in config_host<br>
-=C2=A0 gio =3D declare_dependency(compile_args: config_host[&#39;GIO_CFLAG=
S&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;GIO_LIBS&#39;].split(),=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0version: config_host[&#39;GLIB_VERSION&#39;])<br>
+gdbus_codegen =3D not_found<br>
+if not get_option(&#39;gio&#39;).auto() or have_system<br>
+=C2=A0 gio =3D dependency(&#39;gio-2.0&#39;, required: get_option(&#39;gio=
&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metho=
d: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
+=C2=A0 if gio.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;gio/gio.h&gt;<br>
+=C2=A0 =C2=A0 int main(void)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 g_dbus_proxy_new_sync(0, 0, 0, 0, 0, 0, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;, dependencies: [glib, gio])<br>
+=C2=A0 =C2=A0 if get_option(&#39;gio&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;The installed libgio is broken for static =
linking&#39;)<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 =C2=A0 gio =3D not_found<br>
+=C2=A0 endif<br>
+=C2=A0 if gio.found()<br>
+=C2=A0 =C2=A0 gdbus_codegen =3D find_program(gio.get_variable(&#39;gdbus_c=
odegen&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0required: get_option(&#39;gio&=
#39;))<br>
+=C2=A0 =C2=A0 gio_unix =3D dependency(&#39;gio-unix-2.0&#39;, required: ge=
t_option(&#39;gio&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
+=C2=A0 =C2=A0 gio =3D declare_dependency(dependencies: [gio, gio_unix],<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: gio.version())<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0lttng =3D not_found<br>
=C2=A0if &#39;ust&#39; in get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0lttng =3D dependency(&#39;lttng-ust&#39;, required: true, vers=
ion: &#39;&gt;=3D 2.1&#39;,<br>
@@ -1478,7 +1499,7 @@ dbus_display =3D get_option(&#39;dbus_display&#39;) \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 requires glib&gt;=3D2.64&#39;) \<br>
=C2=A0 =C2=A0.require(enable_modules,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 requires --enable-modules&#39;) \<br>
-=C2=A0 .require(config_host.has_key(&#39;GDBUS_CODEGEN&#39;),<br>
+=C2=A0 .require(gdbus_codegen.found(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 requires gdbus-codegen&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
<br>
@@ -1540,6 +1561,7 @@ config_host_data.set(&#39;CONFIG_MPATH_NEW_API&#39;, =
mpathpersist_new_api)<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURL&#39;, curl.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_CURSES&#39;, curses.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_GBM&#39;, gbm.found())<br>
+config_host_data.set(&#39;CONFIG_GIO&#39;, gio.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS&#39;, glusterfs.found())<b=
r>
=C2=A0if glusterfs.found()<br>
=C2=A0 =C2=A0config_host_data.set(&#39;CONFIG_GLUSTERFS_XLATOR_OPT&#39;, gl=
usterfs.version().version_compare(&#39;&gt;=3D4&#39;))<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index d58c69315c..d140c0ef89 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -109,6 +109,8 @@ option(&#39;cocoa&#39;, type : &#39;feature&#39;, value=
 : &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Cocoa user interface (macOS o=
nly)&#39;)<br>
=C2=A0option(&#39;curl&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;CURL block device driver&#39;=
)<br>
+option(&#39;gio&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;use libgio for D-Bus support&=
#39;)<br>
=C2=A0option(&#39;glusterfs&#39;, type : &#39;feature&#39;, value : &#39;au=
to&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Glusterfs block device driver=
&#39;)<br>
=C2=A0option(&#39;libiscsi&#39;, type : &#39;feature&#39;, value : &#39;aut=
o&#39;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 0daeb11fd3..92be3e6187 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -59,6 +59,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 fuse-lseek=C2=A0 =C2=A0 =
=C2=A0 SEEK_HOLE/SEEK_DATA support for FUSE exports&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 gcrypt=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 libgcrypt cryptography support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 gettext=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Localization of the GTK+ user interface&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 gio=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0use libgio for D-Bus support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 glusterfs=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Glusterfs block device driver&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 gnutls=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 GNUTLS cryptography support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 gtk=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GTK+ user interface&#39;<br>
@@ -208,6 +209,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-gcrypt) printf &quot;%s&quot; -Dgcrypt=3Ddisa=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-gettext) printf &quot;%s&quot; -Dgettext=3Dena=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-gettext) printf &quot;%s&quot; -Dgettext=3Ddi=
sabled ;;<br>
+=C2=A0 =C2=A0 --enable-gio) printf &quot;%s&quot; -Dgio=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-gio) printf &quot;%s&quot; -Dgio=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-glusterfs) printf &quot;%s&quot; -Dglusterfs=
=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-glusterfs) printf &quot;%s&quot; -Dglusterfs=
=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-gnutls) printf &quot;%s&quot; -Dgnutls=3Denabl=
ed ;;<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index d25f82bb5a..69f97b8992 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -99,14 +99,13 @@ if dbus_display<br>
=C2=A0endif<br>
<br>
=C2=A0dbus_daemon =3D find_program(&#39;dbus-daemon&#39;, required: false)<=
br>
-if dbus_daemon.found() and config_host.has_key(&#39;GDBUS_CODEGEN&#39;)<br=
>
+if dbus_daemon.found() and gdbus_codegen.found()<br>
=C2=A0 =C2=A0# Temporarily disabled due to Patchew failures:<br>
=C2=A0 =C2=A0#qtests_i386 +=3D [&#39;dbus-vmstate-test&#39;]<br>
=C2=A0 =C2=A0dbus_vmstate1 =3D custom_target(&#39;dbus-vmstate description&=
#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: [&#39;dbus-vmstate1.h&=
#39;, &#39;dbus-vmstate1.c&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: meson.project_source_ro=
ot() / &#39;backends/dbus-vmstate1.xml&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [config_host[&#39;GDBUS_COD=
EGEN&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;@INPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [gdbus_codegen, &#39;@INPUT=
@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--interface-prefix&#39;, &#39;org.qemu&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--generate-c-code&#39;, &#39;@BASENAME@&#39;]).to_list()<br>
=C2=A0else<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index b21d3d1534..eba93b41e3 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -74,14 +74,13 @@ if dbus_display<br>
=C2=A0 =C2=A0dbus_display1 =3D custom_target(&#39;dbus-display gdbus-codege=
n&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: [&#39;dbus-display1.h&=
#39;, &#39;dbus-display1.c&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: files(&#39;dbus-display=
1.xml&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [config_host[&#39;GDBUS_COD=
EGEN&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;@INPUT@&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command: [gdbus_codegen, &#39;@INPUT=
@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--glib-min-required&#39;, &#39;2.64&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--output-directory&#39;, meson.current_build_dir(),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--interface-prefix&#39;, &#39;org.qemu.&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--c-namespace&#39;, &#39;QemuDBus&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--generate-c-code&#39;, &#39;@BASENAME@&#39;])<br>
-=C2=A0 dbus_ss.add(when: [gio, pixman, opengl, &#39;CONFIG_GIO&#39;],<br>
+=C2=A0 dbus_ss.add(when: [gio, pixman, opengl],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: [files(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dbus-cha=
rdev.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dbus-cli=
pboard.c&#39;,<br>
@@ -128,7 +127,7 @@ if spice.found()<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;spice-core&#39; : spice_core_ss}<br>
=C2=A0endif<br>
<br>
-if spice.found() and config_host.has_key(&#39;CONFIG_GIO&#39;)<br>
+if spice.found() and gio.found()<br>
=C2=A0 =C2=A0spice_ss =3D ss.source_set()<br>
=C2=A0 =C2=A0spice_ss.add(spice, gio, pixman, files(&#39;spice-app.c&#39;))=
<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;spice-app&#39;: spice_ss}<br>
diff --git a/util/meson.build b/util/meson.build<br>
index 82eec004e2..8f16018cd4 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -61,7 +61,7 @@ endif<br>
<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;crc-ccitt.c&#39;))<br>
-=C2=A0 util_ss.add(when: &#39;CONFIG_GIO&#39;, if_true: [files(&#39;dbus.c=
&#39;), gio])<br>
+=C2=A0 util_ss.add(when: gio, if_true: files(&#39;dbus.c&#39;))<br>
=C2=A0 =C2=A0util_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;=
userfaultfd.c&#39;))<br>
=C2=A0endif<br>
<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000042b59005dd18a6ac--

