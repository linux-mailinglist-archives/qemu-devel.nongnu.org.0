Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E164A2A2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jHi-0007Kg-8k; Mon, 12 Dec 2022 08:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jHD-00076J-DM
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:55:37 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4jGw-000556-Rc
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:55:25 -0500
Received: by mail-lf1-x132.google.com with SMTP id b13so18714723lfo.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FolUV9C7CBLfg7WWYsjjXvVeknRdST5FEdMeP8d15VA=;
 b=flISWcz5FJBosOUPEj0hCujnHac4Lr5D5hz8SELbSdSdhuULUqca0e2ufWq1W9mmaN
 tSMjof244P2NImHdVm6OokY5TB5LV+CVHXSDtxUvVkzRKkzG57jbItIZC5HKDVNrpoiP
 MU2ruCSqkd1aoJUc/UVPnBVmuuh18SnnY1ixfwYPblGqix/wMdSDPXILHFAJeyjHC1AF
 OPCs26yJtT92LQbQEKC6UZ6evdg0lt27/vEbD8g5V/OujzNkMXASHtlyPZ/tZL7bQWR7
 V6Ra3Oc2IvEayx6sKmkICf2bBnA7WbrVSDZwrGeBP2MTFWXTPLfeNKetpudtcVUvMYDN
 ljnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FolUV9C7CBLfg7WWYsjjXvVeknRdST5FEdMeP8d15VA=;
 b=RgVl5nHdpN5OboKMx4B2xvrOznocjlTVpXj58iMqf/nPUAxhrfag+1GyyHydoZ8SK0
 +4DkvZxJ/40zgaVYDJWn45knHhd/Ax+vCKgMLip91WQiN0Egpl1g73zyfVgJQKaOSBK5
 0ZXgAHDV0EYvxCyt/XrCLultQodoHCTg7T9u2dGxawP2NAx4C8jVmz0TcP/cq94O35BP
 DflKtABsOjldbc87nRpq1X5QOoPXRVhDLeOXyNZN75YY+nExIOEzc8pACb0hfEi1fky5
 2r3+L49M3RxFMQ+PwwI2+aWwyiY3mfCe0mI9g2wNb2NlPCwLGj2AK4ZcuGhd/HeattRk
 Spow==
X-Gm-Message-State: ANoB5pnqnkpLNy+jcTg9HwM/ZjVLJocFxSM5SNWwGsWTgoODIcepkwqu
 me8SrIvuUDWNI7g6HCFDWEBfA6WirqQ3oC6LLk4=
X-Google-Smtp-Source: AA0mqf5eTlSLIk2wA2SwvKlptBbMLNuYfT/D9bOGzEaQq6iU5s/vHMMU4CkbyymHsopAO5uGSwcoq9R9nAgym+ipog0=
X-Received: by 2002:ac2:5324:0:b0:4b5:6d83:1a87 with SMTP id
 f4-20020ac25324000000b004b56d831a87mr8406607lfh.375.1670853308704; Mon, 12
 Dec 2022 05:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-27-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-27-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 17:54:56 +0400
Message-ID: <CAJ+F1C+cBnBVT=E=AApMvmbeURYbHtABhLiVFdRjwja=7bROHg@mail.gmail.com>
Subject: Re: [PATCH 26/30] build: move remaining compiler flag tests to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

Hi

On Fri, Dec 9, 2022 at 3:38 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Remove the only remaining uses of QEMU_CFLAGS.  Now that no
> feature tests are done in configure, it is possible to remove
> CONFIGURE_CFLAGS and CONFIGURE_LDFLAGS as well.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure   | 79 ++++++++---------------------------------------------
>  meson.build | 49 ++++++++++++++++++++++++++++++++-
>  2 files changed, 59 insertions(+), 69 deletions(-)
>
> diff --git a/configure b/configure
> index 6df61f4337e4..d5491fc3b986 100755
> --- a/configure
> +++ b/configure
> @@ -158,14 +158,14 @@ do_cc() {
>
>  compile_object() {
>    local_cflags=3D"$1"
> -  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cfla=
gs -c -o $TMPO $TMPC
> +  do_cc $CFLAGS $EXTRA_CFLAGS $local_cflags -c -o $TMPO $TMPC
>  }
>
>  compile_prog() {
>    local_cflags=3D"$1"
>    local_ldflags=3D"$2"
> -  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cfla=
gs -o $TMPE $TMPC \
> -      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $local_ldflags
> +  do_cc $CFLAGS $EXTRA_CFLAGS $local_cflags -o $TMPE $TMPC \
> +      $LDFLAGS $EXTRA_LDFLAGS $local_ldflags
>  }
>
>  # symbolically link $1 to $2.  Portable version of "ln -sf".
> @@ -351,19 +351,6 @@ windres=3D"${WINDRES-${cross_prefix}windres}"
>  pkg_config=3D"${PKG_CONFIG-${cross_prefix}pkg-config}"
>  sdl2_config=3D"${SDL2_CONFIG-${cross_prefix}sdl2-config}"
>
> -# default flags for all hosts
> -# We use -fwrapv to tell the compiler that we require a C dialect where
> -# left shift of signed integers is well defined and has the expected
> -# 2s-complement style results. (Both clang and gcc agree that it
> -# provides these semantics.)
> -QEMU_CFLAGS=3D"-fno-strict-aliasing -fno-common -fwrapv"
> -QEMU_CFLAGS=3D"-D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E $QEMU_CFLAGS"
> -
> -# Flags that are needed during configure but later taken care of by Meso=
n
> -CONFIGURE_CFLAGS=3D"-std=3Dgnu11 -Wall"
> -CONFIGURE_LDFLAGS=3D
> -
> -
>  check_define() {
>  cat > $TMPC <<EOF
>  #if !defined($1)
> @@ -442,21 +429,13 @@ openbsd)
>  darwin)
>    bsd=3D"yes"
>    darwin=3D"yes"
> -  # Disable attempts to use ObjectiveC features in os/object.h since the=
y
> -  # won't work when we're compiling with gcc as a C compiler.
> -  QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
>  ;;
>  sunos)
>    solaris=3D"yes"
>    make=3D"${MAKE-gmake}"
> -# needed for CMSG_ macros in sys/socket.h
> -  QEMU_CFLAGS=3D"-D_XOPEN_SOURCE=3D600 $QEMU_CFLAGS"
> -# needed for TIOCWIN* defines in termios.h
> -  QEMU_CFLAGS=3D"-D__EXTENSIONS__ $QEMU_CFLAGS"
>  ;;
>  haiku)
>    pie=3D"no"
> -  QEMU_CFLAGS=3D"-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU=
_CFLAGS"
>  ;;
>  linux)
>    linux=3D"yes"
> @@ -589,8 +568,6 @@ fi
>
>  if test "$mingw32" =3D "yes" ; then
>    EXESUF=3D".exe"
> -  # MinGW needs -mthreads for TLS and macro _MT.
> -  CONFIGURE_CFLAGS=3D"-mthreads $CONFIGURE_CFLAGS"
>    prefix=3D"/qemu"
>    bindir=3D""
>    qemu_suffix=3D""
> @@ -1102,59 +1079,26 @@ static THREAD int tls_var;
>  int main(void) { return tls_var; }
>  EOF
>
> -# Meson currently only handles pie as a boolean for now so if we have
> -# explicitly disabled PIE we need to extend our cflags because it wont.
>  if test "$static" =3D "yes"; then
>    if test "$pie" !=3D "no" && compile_prog "-Werror -fPIE -DPIE" "-stati=
c-pie"; then
> -    CONFIGURE_CFLAGS=3D"-fPIE -DPIE $CONFIGURE_CFLAGS"
>      pie=3D"yes"
>    elif test "$pie" =3D "yes"; then
>      error_exit "-static-pie not available due to missing toolchain suppo=
rt"
>    else
>      pie=3D"no"
> -    QEMU_CFLAGS=3D"-fno-pie -no-pie $QEMU_CFLAGS"
>    fi
> -elif test "$pie" =3D "no"; then
> -  if compile_prog "-Werror -fno-pie" "-no-pie"; then
> -    CONFIGURE_CFLAGS=3D"-fno-pie $CONFIGURE_CFLAGS"
> -    CONFIGURE_LDFLAGS=3D"-no-pie $CONFIGURE_LDFLAGS"
> -    QEMU_CFLAGS=3D"-fno-pie -no-pie $QEMU_CFLAGS"
> +elif test "$pie" !=3D "no"; then
> +  if compile_prog "-Werror -fPIE -DPIE" "-pie"; then
> +    pie=3D"yes"
> +  elif test "$pie" =3D "yes"; then
> +    error_exit "PIE not available due to missing toolchain support"
> +  else
> +    echo "Disabling PIE due to missing toolchain support"
> +    pie=3D"no"
>    fi
> -elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
> -  CONFIGURE_CFLAGS=3D"-fPIE -DPIE $CONFIGURE_CFLAGS"
> -  CONFIGURE_LDFLAGS=3D"-pie $CONFIGURE_LDFLAGS"
> -  pie=3D"yes"
> -elif test "$pie" =3D "yes"; then
> -  error_exit "PIE not available due to missing toolchain support"
> -else
> -  echo "Disabling PIE due to missing toolchain support"
> -  pie=3D"no"
>  fi
>
>  ##########################################
> -# __sync_fetch_and_and requires at least -march=3Di486. Many toolchains
> -# use i686 as default anyway, but for those that don't, an explicit
> -# specification is necessary
> -
> -if test "$cpu" =3D "i386"; then
> -  cat > $TMPC << EOF
> -static int sfaa(int *ptr)
> -{
> -  return __sync_fetch_and_and(ptr, 0);
> -}
> -
> -int main(void)
> -{
> -  int val =3D 42;
> -  val =3D __sync_val_compare_and_swap(&val, 0, 1);
> -  sfaa(&val);
> -  return val;
> -}
> -EOF
> -  if ! compile_prog "" "" ; then
> -    QEMU_CFLAGS=3D"-march=3Di486 $QEMU_CFLAGS"
> -  fi
> -fi
>
>  if test -z "${target_list+xxx}" ; then
>      default_targets=3Dyes
> @@ -1834,7 +1778,6 @@ echo "MESON=3D$meson" >> $config_host_mak
>  echo "NINJA=3D$ninja" >> $config_host_mak
>  echo "PKG_CONFIG=3D${pkg_config_exe}" >> $config_host_mak
>  echo "CC=3D$cc" >> $config_host_mak
> -echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host_mak
>  echo "EXESUF=3D$EXESUF" >> $config_host_mak
>
>  # use included Linux headers
> diff --git a/meson.build b/meson.build
> index 4ec8104b73a3..01c6ac0045bc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -190,10 +190,50 @@ endif
>  # Compiler flags #
>  ##################
>
> -qemu_common_flags =3D config_host['QEMU_CFLAGS'].split()
> +# default flags for all hosts
> +# We use -fwrapv to tell the compiler that we require a C dialect where
> +# left shift of signed integers is well defined and has the expected
> +# 2s-complement style results. (Both clang and gcc agree that it
> +# provides these semantics.)
> +
> +qemu_common_flags =3D [
> +  '-D_GNU_SOURCE', '-D_FILE_OFFSET_BITS=3D64', '-D_LARGEFILE_SOURCE',
> +  '-fno-strict-aliasing', '-fno-common', '-fwrapv' ]
>  qemu_cflags =3D []
>  qemu_ldflags =3D []
>
> +if targetos =3D=3D 'darwin'
> +  # Disable attempts to use ObjectiveC features in os/object.h since the=
y
> +  # won't work when we're compiling with gcc as a C compiler.
> +  qemu_common_flags +=3D '-DOS_OBJECT_USE_OBJC=3D0'
> +elif targetos =3D=3D 'solaris'
> +  # needed for CMSG_ macros in sys/socket.h
> +  qemu_common_flags +=3D '-D_XOPEN_SOURCE=3D600'
> +  # needed for TIOCWIN* defines in termios.h
> +  qemu_common_flags +=3D '-D__EXTENSIONS__'
> +elif targetos =3D=3D 'haiku'
> +  qemu_common_flags +=3D ['-DB_USE_POSITIVE_POSIX_ERRORS', '-D_BSD_SOURC=
E', '-fPIC']
> +endif
> +
> +# __sync_fetch_and_and requires at least -march=3Di486. Many toolchains
> +# use i686 as default anyway, but for those that don't, an explicit
> +# specification is necessary
> +if host_arch =3D=3D 'i386' and not cc.links('''
> +  static int sfaa(int *ptr)
> +  {
> +    return __sync_fetch_and_and(ptr, 0);
> +  }
> +
> +  int main(void)
> +  {
> +    int val =3D 42;
> +    val =3D __sync_val_compare_and_swap(&val, 0, 1);
> +    sfaa(&val);
> +    return val;
> +  }''')
> +  qemu_common_flags =3D ['-march=3Di486'] + qemu_common_flags
> +endif
> +
>  if get_option('gprof')
>    qemu_common_flags +=3D ['-p']
>    qemu_ldflags +=3D ['-p']
> @@ -203,6 +243,13 @@ if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
>
> +# Meson currently only handles pie as a boolean for now, so if the user
> +# has explicitly disabled PIE we need to extend our cflags.
> +if not get_option('b_pie')
> +  qemu_cflags +=3D cc.get_supported_arguments('-fno-pie')
> +  qemu_ldflags +=3D cc.get_supported_link_arguments('-no-pie')
> +endif
> +
>  if not get_option('stack_protector').disabled()
>    stack_protector_probe =3D '''
>      int main(int argc, char *argv[])
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

