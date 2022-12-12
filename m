Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55773649E99
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hpT-0006LO-TB; Mon, 12 Dec 2022 07:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hp6-00068l-9Z
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:22:29 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hp2-0007yn-8R
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:22:19 -0500
Received: by mail-lf1-x12a.google.com with SMTP id x28so18236125lfn.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GC4BcWek+RzV+0m03d8K/6mQ13znqZZvV7iq8AffMNg=;
 b=dzyz5upivGku8vOSDv8Ug9pFJZReIzp9szOBdeRI0oohKoeUe3iJSDd1nb2Gpna92Z
 jfBBvrqRpqQC9DF4A3J0C5whja3ZMyc3Eg9CVWlu8wYvUr8mKthTsornPMnMrNEPSerc
 avd29P1/3/DWzVZ3kqAz/TbZOiSBqSDz9qQNCrndHWI52egwZAQghe6+9RidPQ8whQni
 yEFfzVKDlsS2yRR+3KiQj57pMbluBf8GUpZaNv5zlZsYb0DGjoq9bRcowxYGQEIqw8B8
 yz1CxHTpeXgmGHAzK+yZKqVjCenR/aWvekpk+fLmLm9wSHuVhYpwYOD4LfCvbBJxVzW/
 srBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GC4BcWek+RzV+0m03d8K/6mQ13znqZZvV7iq8AffMNg=;
 b=KdtOM65DRzbS02NFfMHC2nOojChx2XNBIIDSCFkuS2qDVYCgIxhAaSCnDjH+u5Dc9D
 SKGVBxP80c+/SoaSM6iCPgy3u0WNoljZGFvx4lX6OGcj0xv9/1r6H84hHyqsg4F0He0t
 O/WU+3e+IgBsl1DqUkudy5x9ksuSEIHNsvMXvFdu5vmu+UE0H/sr5LHhgZH2ly07MLER
 q+f78QahE01S5hrAew2MAeSgK22BkMEgbzmQ/Kq6bmmfZNFlWzhw4ezwm0KFm/16B4ls
 jlrkGV5UYRgVJh2X0cGH+yn4s6XQigT1d2Ml3KnwvKa8+GEHlC9YvZ1fNdu4HaoLp5RH
 P09w==
X-Gm-Message-State: ANoB5pmV37EpYpc4sZ2Fiw1pkez6Vh9Mu78Mi5/ZJtMb56EeIT665Snu
 Y+vkVxAoGKiRmZyvvKbamLBmhwDNxMRfky6VR2k=
X-Google-Smtp-Source: AA0mqf4VRFkyeaTrtpAbL6kB3v4D9RzuQchYGsx4h4kOt18nmXFQUTMTlL5d2G/evv1dPf77XKND8mEJCwcmSVjxEeo=
X-Received: by 2002:ac2:41c6:0:b0:4b0:4b08:6873 with SMTP id
 d6-20020ac241c6000000b004b04b086873mr35229109lfi.329.1670847733399; Mon, 12
 Dec 2022 04:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-25-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-25-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 16:22:01 +0400
Message-ID: <CAJ+F1CL9cOnou91xuphgkVbRyAA3QE8oA36u1JOHdQo5qwZjQA@mail.gmail.com>
Subject: Re: [PATCH 24/30] build: move stack protector flag selection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

On Fri, Dec 9, 2022 at 3:42 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                     | 44 ++---------------------------------
>  meson.build                   | 28 +++++++++++++++++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  4 files changed, 34 insertions(+), 43 deletions(-)
>
> diff --git a/configure b/configure
> index 1f7c5bbba4b9..5d31294f316f 100755
> --- a/configure
> +++ b/configure
> @@ -175,7 +175,7 @@ compile_prog() {
>    local_cflags=3D"$1"
>    local_ldflags=3D"$2"
>    do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cfla=
gs -o $TMPE $TMPC \
> -      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ld=
flags
> +      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $local_ldflags
>  }
>
>  # symbolically link $1 to $2.  Portable version of "ln -sf".
> @@ -221,7 +221,6 @@ static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
>  host_cc=3D"cc"
> -stack_protector=3D""
>  use_containers=3D"yes"
>  gdb_bin=3D$(command -v "gdb-multiarch" || command -v "gdb")
>
> @@ -370,8 +369,6 @@ sdl2_config=3D"${SDL2_CONFIG-${cross_prefix}sdl2-conf=
ig}"
>  QEMU_CFLAGS=3D"-fno-strict-aliasing -fno-common -fwrapv"
>  QEMU_CFLAGS=3D"-D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E $QEMU_CFLAGS"
>
> -QEMU_LDFLAGS=3D
> -
>  # Flags that are needed during configure but later taken care of by Meso=
n
>  CONFIGURE_CFLAGS=3D"-std=3Dgnu11 -Wall"
>  CONFIGURE_LDFLAGS=3D
> @@ -773,10 +770,6 @@ for opt do
>    ;;
>    --disable-werror) werror=3D"no"
>    ;;
> -  --enable-stack-protector) stack_protector=3D"yes"
> -  ;;
> -  --disable-stack-protector) stack_protector=3D"no"
> -  ;;
>    --enable-cfi)
>        cfi=3D"true";
>        meson_option_add -Db_lto=3Dtrue
> @@ -944,7 +937,6 @@ Advanced options (experts only):
>    --with-devices-ARCH=3DNAME override default configs/devices
>    --enable-debug           enable common debug build options
>    --disable-werror         disable compilation abort on warning
> -  --disable-stack-protector disable compiler-provided stack protection
>    --cpu=3DCPU                Build for host CPU [$cpu]
>    --enable-plugins
>                             enable plugins via shared library loading
> @@ -1157,7 +1149,7 @@ EOF
>      optflag=3D"$(echo $1 | sed -e 's/^-Wno-/-W/')"
>      do_objc -Werror $optflag \
>        $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
> -      -o $TMPE $TMPM $QEMU_LDFLAGS
> +      -o $TMPE $TMPM
>  }
>
>  for flag in $gcc_flags; do
> @@ -1169,37 +1161,6 @@ for flag in $gcc_flags; do
>      fi
>  done
>
> -if test "$stack_protector" !=3D "no"; then
> -  cat > $TMPC << EOF
> -int main(int argc, char *argv[])
> -{
> -    char arr[64], *p =3D arr, *c =3D argv[argc - 1];
> -    while (*c) {
> -        *p++ =3D *c++;
> -    }
> -    return 0;
> -}
> -EOF
> -  gcc_flags=3D"-fstack-protector-strong -fstack-protector-all"
> -  sp_on=3D0
> -  for flag in $gcc_flags; do
> -    # We need to check both a compile and a link, since some compiler
> -    # setups fail only on a .c->.o compile and some only at link time
> -    if compile_object "-Werror $flag" &&
> -       compile_prog "-Werror $flag" ""; then
> -      QEMU_CFLAGS=3D"$QEMU_CFLAGS $flag"
> -      QEMU_LDFLAGS=3D"$QEMU_LDFLAGS $flag"
> -      sp_on=3D1
> -      break
> -    fi
> -  done
> -  if test "$stack_protector" =3D yes; then
> -    if test $sp_on =3D 0; then
> -      error_exit "Stack protector not supported"
> -    fi
> -  fi
> -fi
> -
>  # Disable -Wmissing-braces on older compilers that warn even for
>  # the "universal" C zero initializer {0}.
>  cat > $TMPC << EOF
> @@ -1968,7 +1929,6 @@ echo "PKG_CONFIG=3D${pkg_config_exe}" >> $config_ho=
st_mak
>  echo "CC=3D$cc" >> $config_host_mak
>  echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host_mak
>  echo "QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS" >> $config_host_mak
> -echo "QEMU_LDFLAGS=3D$QEMU_LDFLAGS" >> $config_host_mak
>  echo "EXESUF=3D$EXESUF" >> $config_host_mak
>
>  # use included Linux headers
> diff --git a/meson.build b/meson.build
> index b9df49667a19..c5a8dce9e1d6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -200,7 +200,7 @@ foreach arg : config_host['QEMU_CFLAGS'].split()
>    endif
>  endforeach
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
> -qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
> +qemu_ldflags =3D []
>
>  if get_option('gprof')
>    qemu_common_flags +=3D ['-p']
> @@ -211,6 +211,32 @@ if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
>
> +if not get_option('stack_protector').disabled()
> +  stack_protector_probe =3D '''
> +    int main(int argc, char *argv[])
> +    {
> +      char arr[64], *p =3D arr, *c =3D argv[argc - 1];
> +      while (*c) {
> +          *p++ =3D *c++;
> +      }
> +      return 0;
> +    }'''
> +  have_stack_protector =3D false
> +  foreach arg : ['-fstack-protector-strong', '-fstack-protector-all']
> +    # We need to check both a compile and a link, since some compiler
> +    # setups fail only on a .c->.o compile and some only at link time
> +    if cc.compiles(stack_protector_probe, args: ['-Werror', arg]) and \
> +       cc.links(stack_protector_probe, args: ['-Werror', arg])
> +      have_stack_protector =3D true
> +      qemu_cflags +=3D arg
> +      qemu_ldflags +=3D arg
> +      break
> +    endif
> +  endforeach
> +  get_option('stack_protector') \
> +    .require(have_stack_protector, error_message: 'Stack protector not s=
upported')
> +endif
> +
>  coroutine_backend =3D get_option('coroutine_backend')
>  ucontext_probe =3D '''
>    #include <ucontext.h>
> diff --git a/meson_options.txt b/meson_options.txt
> index 126f89517e9a..98456b7cf2ea 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -93,6 +93,8 @@ option('sanitizers', type: 'boolean', value: false,
>         description: 'enable default sanitizers')
>  option('tsan', type: 'boolean', value: false,
>         description: 'enable thread sanitizer')
> +option('stack_protector', type: 'feature', value: 'auto',
> +       description: 'compiler-provided stack protection')
>  option('cfi', type: 'boolean', value: false,
>         description: 'Control-Flow Integrity (CFI)')
>  option('cfi_debug', type: 'boolean', value: false,
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 29695ac88eea..a87b3702e955 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -157,6 +157,7 @@ meson_options_help() {
>    printf "%s\n" '  sparse          sparse checker'
>    printf "%s\n" '  spice           Spice server support'
>    printf "%s\n" '  spice-protocol  Spice protocol support'
> +  printf "%s\n" '  stack-protector compiler-provided stack protection'
>    printf "%s\n" '  tcg             TCG support'
>    printf "%s\n" '  tools           build support utilities that come wit=
h QEMU'
>    printf "%s\n" '  tpm             TPM support'
> @@ -424,6 +425,8 @@ _meson_option_parse() {
>      --disable-spice) printf "%s" -Dspice=3Ddisabled ;;
>      --enable-spice-protocol) printf "%s" -Dspice_protocol=3Denabled ;;
>      --disable-spice-protocol) printf "%s" -Dspice_protocol=3Ddisabled ;;
> +    --enable-stack-protector) printf "%s" -Dstack_protector=3Denabled ;;
> +    --disable-stack-protector) printf "%s" -Dstack_protector=3Ddisabled =
;;
>      --enable-strip) printf "%s" -Dstrip=3Dtrue ;;
>      --disable-strip) printf "%s" -Dstrip=3Dfalse ;;
>      --sysconfdir=3D*) quote_sh "-Dsysconfdir=3D$2" ;;
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

