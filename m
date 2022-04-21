Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B3509FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:36:30 +0200 (CEST)
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhW2v-0001pA-DX
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVgc-0002jA-41
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:13:27 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:36502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhVgZ-0004MA-8p
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 08:13:25 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id c1so3514699qvl.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/CaSTaSIC+ZBFNlRUHgMFUozhbYGLGdhKdS6vKIoYI=;
 b=MVEH7QIQKMn8VUEMxBP6p1cR6MWz548gf40jhp/mmJPteiFSJ7FTC2LWE8zpicsObC
 kULEqB3zQyRPccKikHtsSmJDt5x3uvrRpm9kuhUZi/KaVNtIZRf9LMKN5sYjR7KAyinP
 n0+TqpSZPuwjhnFDo666HH6+3bNKHFYSbceLXsSuKrPqdCl/nKhLMGOsaUwsd8kpwEVM
 uq7eFbdhuq9V1AZGZfTLO7eLkSy/F2bnc6czaVwbxQ1cdti08UhU0iiJtf0bXzli/PLE
 XRcKtf5fLpO+6qJ3STOyL+uNEIeh7la8I4dTaTUGyIM9EG3WDsyXkURIKUFolY8chMvQ
 5Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/CaSTaSIC+ZBFNlRUHgMFUozhbYGLGdhKdS6vKIoYI=;
 b=t/YIrwLmBPQHOnzB/b9wr1lGzL5I7ON9pxJ+4meQtdqSvlZDxR8dyqn0sqFjxcqtwD
 TJv61n3YNo/Rtk7ltTYASche6HyLpyvs9to3ra+HGA8RlWIZzYfW9UWfP6HGUunNPoWD
 MTtPWboMhAkLuPaLD0qLi+pebhT9cK2F8z7o/U2zAkYCjz122U+cSTzBowfLCFtml2Zk
 /8tIgd4f6L/KjMatg7PsOiYh3xHEhy8w87uB5TdbDZ09rxVK+Hda0MgEltpEQZjjgOCF
 IuvxxUVOUozqX/agc/WKLkmkyp/HarCo6i/NlQgKLlcXb2P+kHYaiPtF1Hxfg4AIAjA0
 T7sA==
X-Gm-Message-State: AOAM533/jjrqV5iOZrTMDQ7ONNyDU6EcHFhgXESf4zwb51K6Dh64NEZM
 BE7RDjf68L3QG3vBLENa4nSMAFeFps3GxRxG1Gs=
X-Google-Smtp-Source: ABdhPJyVc9gDOdD7gNbE0Ei8spKYmP9nImI+vXcqpFk0g6f7UGaLnf/affoN3aqqgzsHYALIgrxYjqTtn6SL3iAiA5U=
X-Received: by 2002:a05:6214:1c8f:b0:443:8505:14b3 with SMTP id
 ib15-20020a0562141c8f00b00443850514b3mr19394029qvb.7.1650543201326; Thu, 21
 Apr 2022 05:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-35-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-35-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 16:13:09 +0400
Message-ID: <CAJ+F1CLgQngTeE4sfUdto2Z50yD7nix3889seCGELwO3cyVSOg@mail.gmail.com>
Subject: Re: [PATCH 34/34] configure, meson: move vhost options to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000339a5005dd290968"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2f.google.com
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

--000000000000339a5005dd290968
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Finish the conversion by moving all the definitions and the constraint
> checks to meson_options.txt and meson.build respectively.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure                     | 82 -----------------------------------
>  meson.build                   | 33 +++++++++++---
>  meson_options.txt             | 10 +++++
>  scripts/meson-buildoptions.sh | 15 +++++++
>  4 files changed, 51 insertions(+), 89 deletions(-)
>
> diff --git a/configure b/configure
> index 3b38ff3c63..0cedfcf5a9 100755
> --- a/configure
> +++ b/configure
> @@ -282,11 +282,6 @@ EXTRA_CXXFLAGS=3D""
>  EXTRA_OBJCFLAGS=3D""
>  EXTRA_LDFLAGS=3D""
>
> -vhost_kernel=3D"$default_feature"
> -vhost_net=3D"$default_feature"
> -vhost_crypto=3D"$default_feature"
> -vhost_user=3D"no"
> -vhost_vdpa=3D"$default_feature"
>  debug_tcg=3D"no"
>  sanitizers=3D"no"
>  tsan=3D"no"
> @@ -526,7 +521,6 @@ haiku)
>  ;;
>  linux)
>    linux=3D"yes"
> -  vhost_user=3D${default_feature:-yes}
>  ;;
>  esac
>
> @@ -863,14 +857,6 @@ for opt do
>    ;;
>    --with-coroutine=3D*) coroutine=3D"$optarg"
>    ;;
> -  --disable-vhost-net) vhost_net=3D"no"
> -  ;;
> -  --enable-vhost-net) vhost_net=3D"yes"
> -  ;;
> -  --disable-vhost-crypto) vhost_crypto=3D"no"
> -  ;;
> -  --enable-vhost-crypto) vhost_crypto=3D"yes"
> -  ;;
>    --disable-zlib-test)
>    ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
> @@ -882,18 +868,6 @@ for opt do
>    --enable-uuid|--disable-uuid)
>        echo "$0: $opt is obsolete, UUID support is always built" >&2
>    ;;
> -  --disable-vhost-user) vhost_user=3D"no"
> -  ;;
> -  --enable-vhost-user) vhost_user=3D"yes"
> -  ;;
> -  --disable-vhost-vdpa) vhost_vdpa=3D"no"
> -  ;;
> -  --enable-vhost-vdpa) vhost_vdpa=3D"yes"
> -  ;;
> -  --disable-vhost-kernel) vhost_kernel=3D"no"
> -  ;;
> -  --enable-vhost-kernel) vhost_kernel=3D"yes"
> -  ;;
>    --disable-capstone) capstone=3D"disabled"
>    ;;
>    --enable-capstone) capstone=3D"enabled"
> @@ -1092,11 +1066,6 @@ cat << EOF
>    debug-info      debugging information
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
> -  vhost-net       vhost-net kernel acceleration support
> -  vhost-crypto    vhost-user-crypto backend support
> -  vhost-kernel    vhost kernel backend support
> -  vhost-user      vhost-user backend support
> -  vhost-vdpa      vhost-vdpa kernel backend support
>
>  NOTE: The object files are built at the place where configure is launche=
d
>  EOF
> @@ -1510,35 +1479,6 @@ else
>      exit 1
>  fi
>
> -#########################################
> -# vhost interdependencies and host support
> -
> -# vhost backends
> -if test "$vhost_user" =3D "yes" && test "$mingw32" =3D "yes"; then
> -  error_exit "vhost-user is not available on Windows"
> -fi
> -test "$vhost_vdpa" =3D "" && vhost_vdpa=3D$linux
> -if test "$vhost_vdpa" =3D "yes" && test "$linux" !=3D "yes"; then
> -  error_exit "vhost-vdpa is only available on Linux"
> -fi
> -test "$vhost_kernel" =3D "" && vhost_kernel=3D$linux
> -if test "$vhost_kernel" =3D "yes" && test "$linux" !=3D "yes"; then
> -  error_exit "vhost-kernel is only available on Linux"
> -fi
> -
> -# vhost-user backends
> -test "$vhost_crypto" =3D "" && vhost_crypto=3D$vhost_user
> -if test "$vhost_crypto" =3D "yes" && test "$vhost_user" =3D "no"; then
> -  error_exit "--enable-vhost-crypto requires --enable-vhost-user"
> -fi
> -
> -# OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity
> -if test "$vhost_net" =3D ""; then
> -  test "$vhost_user" =3D "yes" && vhost_net=3Dyes
> -  test "$vhost_vdpa" =3D "yes" && vhost_net=3Dyes
> -  test "$vhost_kernel" =3D "yes" && vhost_net=3Dyes
> -fi
> -
>  ##########################################
>  # pkg-config probe
>
> @@ -2058,28 +1998,6 @@ if test "$modules" =3D "yes"; then
>    echo "CONFIG_MODULES=3Dy" >> $config_host_mak
>  fi
>
> -if test "$vhost_net" =3D "yes" ; then
> -  echo "CONFIG_VHOST_NET=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_user" =3D "yes" ; then
> -  echo "CONFIG_VHOST_NET_USER=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_vdpa" =3D "yes" ; then
> -  echo "CONFIG_VHOST_NET_VDPA=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_crypto" =3D "yes" ; then
> -  echo "CONFIG_VHOST_CRYPTO=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_kernel" =3D "yes" ; then
> -  echo "CONFIG_VHOST_KERNEL=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_user" =3D "yes" ; then
> -  echo "CONFIG_VHOST_USER=3Dy" >> $config_host_mak
> -fi
> -if test "$vhost_vdpa" =3D "yes" ; then
> -  echo "CONFIG_VHOST_VDPA=3Dy" >> $config_host_mak
> -fi
> -
>  # XXX: suppress that
>  if [ "$bsd" =3D "yes" ] ; then
>    echo "CONFIG_BSD=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index e8446cf148..499082bf55 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -313,14 +313,26 @@ have_tpm =3D get_option('tpm') \
>    .allowed()
>
>  # vhost
> -have_vhost_user =3D 'CONFIG_VHOST_USER' in config_host
> -have_vhost_vdpa =3D 'CONFIG_VHOST_VDPA' in config_host
> -have_vhost_kernel =3D 'CONFIG_VHOST_KERNEL' in config_host
> -have_vhost_net_user =3D 'CONFIG_VHOST_NET_USER' in config_host
> -have_vhost_net_vdpa =3D 'CONFIG_VHOST_NET_VDPA' in config_host
> -have_vhost_net =3D 'CONFIG_VHOST_NET' in config_host
> +have_vhost_user =3D get_option('vhost_user') \
> +  .disable_auto_if(targetos !=3D 'linux') \
> +  .require(targetos !=3D 'windows',
> +           error_message: 'vhost-user is not available on
> Windows').allowed()
> +have_vhost_vdpa =3D get_option('vhost_vdpa') \
> +  .require(targetos =3D=3D 'linux',
> +           error_message: 'vhost-vdpa is only available on
> Linux').allowed()
> +have_vhost_kernel =3D get_option('vhost_kernel') \
> +  .require(targetos =3D=3D 'linux',
> +           error_message: 'vhost-kernel is only available on
> Linux').allowed()
> +have_vhost_user_crypto =3D get_option('vhost_crypto') \
> +  .require(have_vhost_user,
> +           error_message: 'vhost-crypto requires vhost-user to be
> enabled').allowed()
> +
>  have_vhost =3D have_vhost_user or have_vhost_vdpa or have_vhost_kernel
> -have_vhost_user_crypto =3D 'CONFIG_VHOST_CRYPTO' in config_host
> +
> +have_vhost_net_user =3D have_vhost_user and
> get_option('vhost_net').allowed()
> +have_vhost_net_vdpa =3D have_vhost_vdpa and
> get_option('vhost_net').allowed()
> +have_vhost_net_kernel =3D have_vhost_kernel and
> get_option('vhost_net').allowed()
> +have_vhost_net =3D have_vhost_net_kernel or have_vhost_net_user or
> have_vhost_net_vdpa
>
>  # Target-specific libraries and flags
>  libm =3D cc.find_library('m', required: false)
> @@ -1709,6 +1721,13 @@ config_host_data.set('CONFIG_SNAPPY',
> snappy.found())
>  config_host_data.set('CONFIG_TPM', have_tpm)
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
> +config_host_data.set('CONFIG_VHOST_NET', have_vhost_net)
> +config_host_data.set('CONFIG_VHOST_NET_USER', have_vhost_net_user)
> +config_host_data.set('CONFIG_VHOST_NET_VDPA', have_vhost_net_vdpa)
> +config_host_data.set('CONFIG_VHOST_KERNEL', have_vhost_kernel)
> +config_host_data.set('CONFIG_VHOST_USER', have_vhost_user)
> +config_host_data.set('CONFIG_VHOST_CRYPTO', have_vhost_user_crypto)
> +config_host_data.set('CONFIG_VHOST_VDPA', have_vhost_vdpa)
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER',
> have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> diff --git a/meson_options.txt b/meson_options.txt
> index 8efd5f520c..24a2a593f0 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -235,6 +235,16 @@ option('oss', type: 'feature', value: 'auto',
>  option('pa', type: 'feature', value: 'auto',
>         description: 'PulseAudio sound support')
>
> +option('vhost_kernel', type: 'feature', value: 'auto',
> +       description: 'vhost kernel backend support')
> +option('vhost_net', type: 'feature', value: 'auto',
> +       description: 'vhost-net kernel acceleration support')
> +option('vhost_user', type: 'feature', value: 'auto',
> +       description: 'vhost-user backend support')
> +option('vhost_crypto', type: 'feature', value: 'auto',
> +       description: 'vhost-user crypto backend support')
> +option('vhost_vdpa', type: 'feature', value: 'auto',
> +       description: 'vhost-vdpa kernel backend support')
>  option('vhost_user_blk_server', type: 'feature', value: 'auto',
>         description: 'build vhost-user-blk server')
>  option('virtfs', type: 'feature', value: 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 274639777e..28258e1478 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -153,8 +153,13 @@ meson_options_help() {
>    printf "%s\n" '  usb-redir       libusbredir support'
>    printf "%s\n" '  vde             vde network backend support'
>    printf "%s\n" '  vdi             vdi image format support'
> +  printf "%s\n" '  vhost-crypto    vhost-user crypto backend support'
> +  printf "%s\n" '  vhost-kernel    vhost kernel backend support'
> +  printf "%s\n" '  vhost-net       vhost-net kernel acceleration support=
'
> +  printf "%s\n" '  vhost-user      vhost-user backend support'
>    printf "%s\n" '  vhost-user-blk-server'
>    printf "%s\n" '                  build vhost-user-blk server'
> +  printf "%s\n" '  vhost-vdpa      vhost-vdpa kernel backend support'
>    printf "%s\n" '  virglrenderer   virgl rendering support'
>    printf "%s\n" '  virtfs          virtio-9p support'
>    printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
> @@ -407,8 +412,18 @@ _meson_option_parse() {
>      --disable-vde) printf "%s" -Dvde=3Ddisabled ;;
>      --enable-vdi) printf "%s" -Dvdi=3Denabled ;;
>      --disable-vdi) printf "%s" -Dvdi=3Ddisabled ;;
> +    --enable-vhost-crypto) printf "%s" -Dvhost_crypto=3Denabled ;;
> +    --disable-vhost-crypto) printf "%s" -Dvhost_crypto=3Ddisabled ;;
> +    --enable-vhost-kernel) printf "%s" -Dvhost_kernel=3Denabled ;;
> +    --disable-vhost-kernel) printf "%s" -Dvhost_kernel=3Ddisabled ;;
> +    --enable-vhost-net) printf "%s" -Dvhost_net=3Denabled ;;
> +    --disable-vhost-net) printf "%s" -Dvhost_net=3Ddisabled ;;
> +    --enable-vhost-user) printf "%s" -Dvhost_user=3Denabled ;;
> +    --disable-vhost-user) printf "%s" -Dvhost_user=3Ddisabled ;;
>      --enable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Denabled ;;
>      --disable-vhost-user-blk-server) printf "%s"
> -Dvhost_user_blk_server=3Ddisabled ;;
> +    --enable-vhost-vdpa) printf "%s" -Dvhost_vdpa=3Denabled ;;
> +    --disable-vhost-vdpa) printf "%s" -Dvhost_vdpa=3Ddisabled ;;
>      --enable-virglrenderer) printf "%s" -Dvirglrenderer=3Denabled ;;
>      --disable-virglrenderer) printf "%s" -Dvirglrenderer=3Ddisabled ;;
>      --enable-virtfs) printf "%s" -Dvirtfs=3Denabled ;;
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000339a5005dd290968
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:05 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fini=
sh the conversion by moving all the definitions and the constraint<br>
checks to meson_options.txt and meson.build respectively.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>lgtm<br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@=
redhat.com</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 82 -----------------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 33 +++++++++++---<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10=
 +++++<br>
=C2=A0scripts/meson-buildoptions.sh | 15 +++++++<br>
=C2=A04 files changed, 51 insertions(+), 89 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 3b38ff3c63..0cedfcf5a9 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -282,11 +282,6 @@ EXTRA_CXXFLAGS=3D&quot;&quot;<br>
=C2=A0EXTRA_OBJCFLAGS=3D&quot;&quot;<br>
=C2=A0EXTRA_LDFLAGS=3D&quot;&quot;<br>
<br>
-vhost_kernel=3D&quot;$default_feature&quot;<br>
-vhost_net=3D&quot;$default_feature&quot;<br>
-vhost_crypto=3D&quot;$default_feature&quot;<br>
-vhost_user=3D&quot;no&quot;<br>
-vhost_vdpa=3D&quot;$default_feature&quot;<br>
=C2=A0debug_tcg=3D&quot;no&quot;<br>
=C2=A0sanitizers=3D&quot;no&quot;<br>
=C2=A0tsan=3D&quot;no&quot;<br>
@@ -526,7 +521,6 @@ haiku)<br>
=C2=A0;;<br>
=C2=A0linux)<br>
=C2=A0 =C2=A0linux=3D&quot;yes&quot;<br>
-=C2=A0 vhost_user=3D${default_feature:-yes}<br>
=C2=A0;;<br>
=C2=A0esac<br>
<br>
@@ -863,14 +857,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-coroutine=3D*) coroutine=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-net) vhost_net=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-net) vhost_net=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vhost-crypto) vhost_crypto=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-crypto) vhost_crypto=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
@@ -882,18 +868,6 @@ for opt do<br>
=C2=A0 =C2=A0--enable-uuid|--disable-uuid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, UUID support is=
 always built&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-vhost-user) vhost_user=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-user) vhost_user=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vhost-vdpa) vhost_vdpa=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-vdpa) vhost_vdpa=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-vhost-kernel) vhost_kernel=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --enable-vhost-kernel) vhost_kernel=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-capstone) capstone=3D&quot;disabled&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-capstone) capstone=3D&quot;enabled&quot;<br>
@@ -1092,11 +1066,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0debug-info=C2=A0 =C2=A0 =C2=A0 debugging information<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
-=C2=A0 vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel acceleration s=
upport<br>
-=C2=A0 vhost-crypto=C2=A0 =C2=A0 vhost-user-crypto backend support<br>
-=C2=A0 vhost-kernel=C2=A0 =C2=A0 vhost kernel backend support<br>
-=C2=A0 vhost-user=C2=A0 =C2=A0 =C2=A0 vhost-user backend support<br>
-=C2=A0 vhost-vdpa=C2=A0 =C2=A0 =C2=A0 vhost-vdpa kernel backend support<br=
>
<br>
=C2=A0NOTE: The object files are built at the place where configure is laun=
ched<br>
=C2=A0EOF<br>
@@ -1510,35 +1479,6 @@ else<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0fi<br>
<br>
-#########################################<br>
-# vhost interdependencies and host support<br>
-<br>
-# vhost backends<br>
-if test &quot;$vhost_user&quot; =3D &quot;yes&quot; &amp;&amp; test &quot;=
$mingw32&quot; =3D &quot;yes&quot;; then<br>
-=C2=A0 error_exit &quot;vhost-user is not available on Windows&quot;<br>
-fi<br>
-test &quot;$vhost_vdpa&quot; =3D &quot;&quot; &amp;&amp; vhost_vdpa=3D$lin=
ux<br>
-if test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; &amp;&amp; test &quot;=
$linux&quot; !=3D &quot;yes&quot;; then<br>
-=C2=A0 error_exit &quot;vhost-vdpa is only available on Linux&quot;<br>
-fi<br>
-test &quot;$vhost_kernel&quot; =3D &quot;&quot; &amp;&amp; vhost_kernel=3D=
$linux<br>
-if test &quot;$vhost_kernel&quot; =3D &quot;yes&quot; &amp;&amp; test &quo=
t;$linux&quot; !=3D &quot;yes&quot;; then<br>
-=C2=A0 error_exit &quot;vhost-kernel is only available on Linux&quot;<br>
-fi<br>
-<br>
-# vhost-user backends<br>
-test &quot;$vhost_crypto&quot; =3D &quot;&quot; &amp;&amp; vhost_crypto=3D=
$vhost_user<br>
-if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; &amp;&amp; test &quo=
t;$vhost_user&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 error_exit &quot;--enable-vhost-crypto requires --enable-vhost-user=
&quot;<br>
-fi<br>
-<br>
-# OR the vhost-kernel, vhost-vdpa and vhost-user values for simplicity<br>
-if test &quot;$vhost_net&quot; =3D &quot;&quot;; then<br>
-=C2=A0 test &quot;$vhost_user&quot; =3D &quot;yes&quot; &amp;&amp; vhost_n=
et=3Dyes<br>
-=C2=A0 test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; &amp;&amp; vhost_n=
et=3Dyes<br>
-=C2=A0 test &quot;$vhost_kernel&quot; =3D &quot;yes&quot; &amp;&amp; vhost=
_net=3Dyes<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# pkg-config probe<br>
<br>
@@ -2058,28 +1998,6 @@ if test &quot;$modules&quot; =3D &quot;yes&quot;; th=
en<br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULES=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
<br>
-if test &quot;$vhost_net&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_NET=3Dy&quot; &gt;&gt; $config_host_mak<br>
-fi<br>
-if test &quot;$vhost_user&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_NET_USER=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
-fi<br>
-if test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_NET_VDPA=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
-fi<br>
-if test &quot;$vhost_crypto&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_CRYPTO=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
-fi<br>
-if test &quot;$vhost_kernel&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_KERNEL=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
-fi<br>
-if test &quot;$vhost_user&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_USER=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-fi<br>
-if test &quot;$vhost_vdpa&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_VHOST_VDPA=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-fi<br>
-<br>
=C2=A0# XXX: suppress that<br>
=C2=A0if [ &quot;$bsd&quot; =3D &quot;yes&quot; ] ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_BSD=3Dy&quot; &gt;&gt; $config_host_mak<br>
diff --git a/meson.build b/meson.build<br>
index e8446cf148..499082bf55 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -313,14 +313,26 @@ have_tpm =3D get_option(&#39;tpm&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
<br>
=C2=A0# vhost<br>
-have_vhost_user =3D &#39;CONFIG_VHOST_USER&#39; in config_host<br>
-have_vhost_vdpa =3D &#39;CONFIG_VHOST_VDPA&#39; in config_host<br>
-have_vhost_kernel =3D &#39;CONFIG_VHOST_KERNEL&#39; in config_host<br>
-have_vhost_net_user =3D &#39;CONFIG_VHOST_NET_USER&#39; in config_host<br>
-have_vhost_net_vdpa =3D &#39;CONFIG_VHOST_NET_VDPA&#39; in config_host<br>
-have_vhost_net =3D &#39;CONFIG_VHOST_NET&#39; in config_host<br>
+have_vhost_user =3D get_option(&#39;vhost_user&#39;) \<br>
+=C2=A0 .disable_auto_if(targetos !=3D &#39;linux&#39;) \<br>
+=C2=A0 .require(targetos !=3D &#39;windows&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;vhost-user is=
 not available on Windows&#39;).allowed()<br>
+have_vhost_vdpa =3D get_option(&#39;vhost_vdpa&#39;) \<br>
+=C2=A0 .require(targetos =3D=3D &#39;linux&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;vhost-vdpa is=
 only available on Linux&#39;).allowed()<br>
+have_vhost_kernel =3D get_option(&#39;vhost_kernel&#39;) \<br>
+=C2=A0 .require(targetos =3D=3D &#39;linux&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;vhost-kernel =
is only available on Linux&#39;).allowed()<br>
+have_vhost_user_crypto =3D get_option(&#39;vhost_crypto&#39;) \<br>
+=C2=A0 .require(have_vhost_user,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;vhost-crypto =
requires vhost-user to be enabled&#39;).allowed()<br>
+<br>
=C2=A0have_vhost =3D have_vhost_user or have_vhost_vdpa or have_vhost_kerne=
l<br>
-have_vhost_user_crypto =3D &#39;CONFIG_VHOST_CRYPTO&#39; in config_host<br=
>
+<br>
+have_vhost_net_user =3D have_vhost_user and get_option(&#39;vhost_net&#39;=
).allowed()<br>
+have_vhost_net_vdpa =3D have_vhost_vdpa and get_option(&#39;vhost_net&#39;=
).allowed()<br>
+have_vhost_net_kernel =3D have_vhost_kernel and get_option(&#39;vhost_net&=
#39;).allowed()<br>
+have_vhost_net =3D have_vhost_net_kernel or have_vhost_net_user or have_vh=
ost_net_vdpa<br>
<br>
=C2=A0# Target-specific libraries and flags<br>
=C2=A0libm =3D cc.find_library(&#39;m&#39;, required: false)<br>
@@ -1709,6 +1721,13 @@ config_host_data.set(&#39;CONFIG_SNAPPY&#39;, snappy=
.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_TPM&#39;, have_tpm)<br>
=C2=A0config_host_data.set(&#39;CONFIG_USB_LIBUSB&#39;, libusb.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VDE&#39;, vde.found())<br>
+config_host_data.set(&#39;CONFIG_VHOST_NET&#39;, have_vhost_net)<br>
+config_host_data.set(&#39;CONFIG_VHOST_NET_USER&#39;, have_vhost_net_user)=
<br>
+config_host_data.set(&#39;CONFIG_VHOST_NET_VDPA&#39;, have_vhost_net_vdpa)=
<br>
+config_host_data.set(&#39;CONFIG_VHOST_KERNEL&#39;, have_vhost_kernel)<br>
+config_host_data.set(&#39;CONFIG_VHOST_USER&#39;, have_vhost_user)<br>
+config_host_data.set(&#39;CONFIG_VHOST_CRYPTO&#39;, have_vhost_user_crypto=
)<br>
+config_host_data.set(&#39;CONFIG_VHOST_VDPA&#39;, have_vhost_vdpa)<br>
=C2=A0config_host_data.set(&#39;CONFIG_VHOST_USER_BLK_SERVER&#39;, have_vho=
st_user_blk_server)<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC&#39;, vnc.found())<br>
=C2=A0config_host_data.set(&#39;CONFIG_VNC_JPEG&#39;, jpeg.found())<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 8efd5f520c..24a2a593f0 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -235,6 +235,16 @@ option(&#39;oss&#39;, type: &#39;feature&#39;, value: =
&#39;auto&#39;,<br>
=C2=A0option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;PulseAudio sound support&#39;=
)<br>
<br>
+option(&#39;vhost_kernel&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vhost kernel backend support&=
#39;)<br>
+option(&#39;vhost_net&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vhost-net kernel acceleration=
 support&#39;)<br>
+option(&#39;vhost_user&#39;, type: &#39;feature&#39;, value: &#39;auto&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vhost-user backend support&#3=
9;)<br>
+option(&#39;vhost_crypto&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vhost-user crypto backend sup=
port&#39;)<br>
+option(&#39;vhost_vdpa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;vhost-vdpa kernel backend sup=
port&#39;)<br>
=C2=A0option(&#39;vhost_user_blk_server&#39;, type: &#39;feature&#39;, valu=
e: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build vhost-user-blk server&#=
39;)<br>
=C2=A0option(&#39;virtfs&#39;, type: &#39;feature&#39;, value: &#39;auto&#3=
9;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 274639777e..28258e1478 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -153,8 +153,13 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 usb-redir=C2=A0 =C2=A0 =C2=
=A0 =C2=A0libusbredir support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 vde=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vde network backend support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 vdi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vdi image format support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-crypto=C2=A0 =C2=A0 vhost=
-user crypto backend support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-kernel=C2=A0 =C2=A0 vhost=
 kernel backend support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-net=C2=A0 =C2=A0 =C2=A0 =
=C2=A0vhost-net kernel acceleration support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-user=C2=A0 =C2=A0 =C2=A0 =
vhost-user backend support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 vhost-user-blk-server&#39;=
<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build vhost-user-blk server&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 vhost-vdpa=C2=A0 =C2=A0 =C2=A0 =
vhost-vdpa kernel backend support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 virglrenderer=C2=A0 =C2=A0=
virgl rendering support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 virtfs=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 virtio-9p support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 virtiofsd=C2=A0 =C2=A0 =C2=
=A0 =C2=A0build virtiofs daemon (virtiofsd)&#39;<br>
@@ -407,8 +412,18 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-vde) printf &quot;%s&quot; -Dvde=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-vdi) printf &quot;%s&quot; -Dvdi=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-vdi) printf &quot;%s&quot; -Dvdi=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --enable-vhost-crypto) printf &quot;%s&quot; -Dvhost_crypto=
=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-crypto) printf &quot;%s&quot; -Dvhost_crypto=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-vhost-kernel) printf &quot;%s&quot; -Dvhost_kernel=
=3Denabled ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-kernel) printf &quot;%s&quot; -Dvhost_kernel=
=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-vhost-net) printf &quot;%s&quot; -Dvhost_net=3Denab=
led ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-net) printf &quot;%s&quot; -Dvhost_net=3Ddis=
abled ;;<br>
+=C2=A0 =C2=A0 --enable-vhost-user) printf &quot;%s&quot; -Dvhost_user=3Den=
abled ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-user) printf &quot;%s&quot; -Dvhost_user=3Dd=
isabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-vhost-user-blk-server) printf &quot;%s&quot; -=
Dvhost_user_blk_server=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-vhost-user-blk-server) printf &quot;%s&quot; =
-Dvhost_user_blk_server=3Ddisabled ;;<br>
+=C2=A0 =C2=A0 --enable-vhost-vdpa) printf &quot;%s&quot; -Dvhost_vdpa=3Den=
abled ;;<br>
+=C2=A0 =C2=A0 --disable-vhost-vdpa) printf &quot;%s&quot; -Dvhost_vdpa=3Dd=
isabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-virglrenderer) printf &quot;%s&quot; -Dvirglre=
nderer=3Denabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-virglrenderer) printf &quot;%s&quot; -Dvirglr=
enderer=3Ddisabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-virtfs) printf &quot;%s&quot; -Dvirtfs=3Denabl=
ed ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000339a5005dd290968--

