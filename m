Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48980649AD1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:13:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4enH-0001Pc-6y; Mon, 12 Dec 2022 04:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4en2-0001Ma-EY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:08:04 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4emy-0008NU-2O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:08:00 -0500
Received: by mail-lj1-x230.google.com with SMTP id b9so11810740ljr.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MOJEqmx/l/AUcJDzXmZ1SM5RxRCxP9ANXaMq3frhM2I=;
 b=fJIXF7SImgM4AW5ef5qlY5CWiBxV/3321BVuoAgUMz+sPoRJM6Hf6bqDVCvdbDcYtf
 kydJHIeZHKPzcPuokn5W/BGTZTZUD1s3AQGwFPw7jkSn4rB3dNKH3R3lM7n2y/6A0o/+
 hvnqTv/UJ+oMaaYXr2YgF+wuPTjYRa9o0uOf6tHQ8ZgnKlwNzsdmI2nyn3/yk7WNdPlq
 uZdVFpLndUk0Hp8Sd4rWszm76abJBYBRfj633vIwQt0bZy70Xz95SBOs2lGl+XDCOSU/
 vxG7BTx9ohux5RCITrMsLOLrfEegCOOFEp0PVQJ6UU6leqsPY85nA2CauzEgCISxZZa3
 0T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MOJEqmx/l/AUcJDzXmZ1SM5RxRCxP9ANXaMq3frhM2I=;
 b=Hwq741RTcjRpFWkne+K/jjgFzSW+BjeuUKPtMtIQTbsvgK1BxxHDjOccVDfCEIzkO+
 R2QRUuAWsIOP9CCqCB9CikxOMfriUy2xwE+996VBsT7zqu1uX5O7XrHYlJknt0tPDKQ5
 6kozwpY6CP1s/nOoXjO07uWQNN0+hmFJ1fhg/rlXPG67CA8Kp/eR7NIYXmF+WHUrKfj3
 qxrIczORjRGISyY3S6U36O2hJ7y1qzgCeB+1Vge1Jy418AyltTyiklXKBuoH+X7LreFi
 Rj+OnXkubB1cEBQ6U03d0rzPaczPp14HS/JWMDkoN1gzdCnHenDu8CMaGMqel3O4La2G
 ZbFg==
X-Gm-Message-State: ANoB5plkQDPUr9jOdZ3ELgrCKbPljN9HRPyIzZ7HAALB6NsBFrnnlTMU
 ++mF0PJe0nSUkBw9JCW7e4b9opW0sLyOjiTCIFPxj1tmy+w=
X-Google-Smtp-Source: AA0mqf7OCnHoKEY6sPn62e4UC3OXBAY5T+MEXBKMVPOfkeDH5k8nmXBpvNQLhaH3qZZ3JNTC4L6Qxz/uZsYmMXDn0xU=
X-Received: by 2002:a05:651c:1256:b0:279:e860:fe55 with SMTP id
 h22-20020a05651c125600b00279e860fe55mr6929158ljh.267.1670836074123; Mon, 12
 Dec 2022 01:07:54 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-19-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-19-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 13:07:41 +0400
Message-ID: <CAJ+F1CLuVNhy6iYkwPfu-tnTqKzo=UymrjGpqQ4Gp9LV-ga6kw@mail.gmail.com>
Subject: Re: [PATCH 18/30] configure, meson: move --enable-modules to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 9, 2022 at 3:44 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

On Fri, Dec 9, 2022 at 3:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> All uses of pkg-config have been moved to Meson.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                     | 21 +--------------------
>  meson.build                   |  7 ++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  4 files changed, 12 insertions(+), 21 deletions(-)
>
> diff --git a/configure b/configure
> index 9c336203d8d9..26d10aeffd82 100755
> --- a/configure
> +++ b/configure
> @@ -273,7 +273,6 @@ sanitizers=3D"no"
>  tsan=3D"no"
>  fortify_source=3D"yes"
>  EXESUF=3D""
> -modules=3D"no"
>  prefix=3D"/usr/local"
>  qemu_suffix=3D"qemu"
>  softmmu=3D"yes"
> @@ -705,12 +704,6 @@ for opt do
>    ;;
>    --disable-debug-info) meson_option_add -Ddebug=3Dfalse
>    ;;
> -  --enable-modules)
> -      modules=3D"yes"
> -  ;;
> -  --disable-modules)
> -      modules=3D"no"
> -  ;;
>    --cpu=3D*)
>    ;;
>    --target-list=3D*) target_list=3D"$optarg"
> @@ -1001,7 +994,6 @@ cat << EOF
>    linux-user      all linux usermode emulation targets
>    bsd-user        all BSD usermode emulation targets
>    pie             Position Independent Executables
> -  modules         modules support (non-Windows)
>    debug-tcg       TCG debugging (default is disabled)
>    debug-info      debugging information
>    safe-stack      SafeStack Stack Smash Protection. Depends on
> @@ -1260,16 +1252,8 @@ else
>    QEMU_CFLAGS=3D"$QEMU_CFLAGS -Wno-missing-braces"
>  fi
>
> -# Our module code doesn't support Windows
> -if test "$modules" =3D "yes" && test "$mingw32" =3D "yes" ; then
> -  error_exit "Modules are not available for Windows"
> -fi
> -
> -# Static linking is not possible with plugins, modules or PIE
> +# Resolve default for --enable-plugins
>  if test "$static" =3D "yes" ; then
> -  if test "$modules" =3D "yes" ; then
> -    error_exit "static and modules are mutually incompatible"
> -  fi
>    if test "$plugins" =3D "yes"; then
>      error_exit "static and plugins are mutually incompatible"
>    else
> @@ -2229,9 +2213,6 @@ if test "$solaris" =3D "yes" ; then
>  fi
>  echo "SRC_PATH=3D$source_path" >> $config_host_mak
>  echo "TARGET_DIRS=3D$target_list" >> $config_host_mak
> -if test "$modules" =3D "yes"; then
> -  echo "CONFIG_MODULES=3Dy" >> $config_host_mak
> -fi
>
>  # XXX: suppress that
>  if [ "$bsd" =3D "yes" ] ; then
> diff --git a/meson.build b/meson.build
> index f63ab7f83bed..99c1bde4d154 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -16,7 +16,6 @@ fs =3D import('fs')
>
>  sh =3D find_program('sh')
>  config_host =3D keyval.load(meson.current_build_dir() / 'config-host.mak=
')
> -enable_modules =3D 'CONFIG_MODULES' in config_host
>  targetos =3D host_machine.system()
>
>  cc =3D meson.get_compiler('c')
> @@ -84,6 +83,12 @@ have_ga =3D get_option('guest_agent') \
>    .require(targetos in ['sunos', 'linux', 'windows', 'freebsd'],
>             error_message: 'unsupported OS for QEMU guest agent') \
>    .allowed()
> +enable_modules =3D get_option('modules') \
> +  .require(targetos !=3D 'windows',
> +           error_message: 'Modules are not available for Windows') \
> +  .require(not get_option('prefer_static'),
> +           error_message: 'Modules are incompatible with static linking'=
) \
> +  .allowed()
>  have_block =3D have_system or have_tools
>
>  python =3D import('python').find_installation()
> diff --git a/meson_options.txt b/meson_options.txt
> index 4b749ca54900..e492aaa73fbc 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -44,6 +44,8 @@ option('fuzzing', type : 'boolean', value: false,
>         description: 'build fuzzing targets')
>  option('gettext', type : 'feature', value : 'auto',
>         description: 'Localization of the GTK+ user interface')
> +option('modules', type : 'feature', value : 'disabled',
> +       description: 'modules support (non Windows)')
>  option('module_upgrades', type : 'boolean', value : false,
>         description: 'try to load modules from alternate paths for upgrad=
es')
>  option('install_blobs', type : 'boolean', value : true,
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index aa6e30ea911e..f91797741eef 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -119,6 +119,7 @@ meson_options_help() {
>    printf "%s\n" '  lzo             lzo compression support'
>    printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory =
optimization'
>    printf "%s\n" '  membarrier      membarrier system call (for Linux 4.1=
4+ or Windows'
> +  printf "%s\n" '  modules         modules support (non Windows)'
>    printf "%s\n" '  mpath           Multipath persistent reservation pass=
through'
>    printf "%s\n" '  multiprocess    Out of process device emulation suppo=
rt'
>    printf "%s\n" '  netmap          netmap network backend support'
> @@ -338,6 +339,8 @@ _meson_option_parse() {
>      --disable-membarrier) printf "%s" -Dmembarrier=3Ddisabled ;;
>      --enable-module-upgrades) printf "%s" -Dmodule_upgrades=3Dtrue ;;
>      --disable-module-upgrades) printf "%s" -Dmodule_upgrades=3Dfalse ;;
> +    --enable-modules) printf "%s" -Dmodules=3Denabled ;;
> +    --disable-modules) printf "%s" -Dmodules=3Ddisabled ;;
>      --enable-mpath) printf "%s" -Dmpath=3Denabled ;;
>      --disable-mpath) printf "%s" -Dmpath=3Ddisabled ;;
>      --enable-multiprocess) printf "%s" -Dmultiprocess=3Denabled ;;
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

