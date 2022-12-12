Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D2649F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:59:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iOB-00089a-AP; Mon, 12 Dec 2022 07:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4iO9-00089H-KS
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:58:33 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4iO7-0000LA-A5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:58:33 -0500
Received: by mail-lj1-x233.google.com with SMTP id s10so12423575ljg.1
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPFp8P36B5bKzCzUhh2QSwoQ7jaUlnotjUAxLhdMWN4=;
 b=iM8Ye2FinQkkEC30pr1M/JiyR5eAkY2wasTI6YzF8MHlSz6CFFNHEo5TJu8mLe+hxQ
 j8DHwmSxbztnYZxnTuvm9DM96uAY21GSJ/tK27ZL9sAr9BhNhjoGzVuUFfVdXjYXpckX
 qegzbqAWoF3zTMQ+RGO+34WozR8Q2G/CzM+yfyMb7qzpvOelvr6QckZk096OX58bC36h
 yxkMhHgT2+atpdhcR3/k20wq73S+7rMigi+O8MM8PxzrZtsfPdIenw9y1zISoMXfPGKi
 ptxYaWzIks0byTzcb9XzqJWNLmKE/ApX/0siuCZ2mXB5XivsbNMBPDEo+FwYD8Yu1Qrj
 RkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPFp8P36B5bKzCzUhh2QSwoQ7jaUlnotjUAxLhdMWN4=;
 b=hhxsGQV5bTAqomY+TkReOYzEfDtVbWwHt6hmjcSihfaEAmGJx9fEx0fuVPakborN9m
 F07ovK5/Pm9uzRnSe7yHWBotZ1tdvlgt8+VTaP+vA/xPsmiw/Wl46Texwvfg2JWjBnCg
 1bxaDCJjBzL4CaPXdV3AyKbEkl01tGIhJZeJoCRr4Yv6/ZMsmqXZNY9XN7balpGcsqvo
 QDTtOFPW5nEs0BJenzExggcq9PfGeNoHvH6Do1LQxbdsv44FdSL+h3FcBAeWTyun1oga
 eUmpz0Z5g0/zw6Qe46eqrJuR70EoNYpXaKTZmyPxFrgobSYKzoFRg6PoL3dT3MYGoLEq
 Fbhw==
X-Gm-Message-State: ANoB5pnggkef/HB3zbuNd8va+M8kuWXEFgj2ehtVTY5SnUk1cEuHPK9A
 7yqfrssBcQjJ5vR5YhR/ZQCXADWv8dDOlKyXyWA=
X-Google-Smtp-Source: AA0mqf4ubl6Z1c+FZx7JZ6BJez1XQqLayD9nZqsWEgB+SkjsJlVV1gD2xRJ2U07ZprwVcjtVczOHDEhSJidfSQ8pvqw=
X-Received: by 2002:a2e:6a06:0:b0:27b:574a:2d08 with SMTP id
 f6-20020a2e6a06000000b0027b574a2d08mr29789ljc.449.1670849909146; Mon, 12 Dec
 2022 04:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-26-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-26-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 16:58:16 +0400
Message-ID: <CAJ+F1CKrOUOcSzZj2kLUdrvzrQMhynRg8GrkUs+GHckvdKKEXA@mail.gmail.com>
Subject: Re: [PATCH 25/30] build: move warning flag selection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x233.google.com
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

On Fri, Dec 9, 2022 at 3:48 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Meson already knows to test with the positive form of the flag, which
> simplifies the test.  Warnings are now tested explicitly for the C++
> compiler, instead of hardcoding those that are only available for
> the C language.
>
> At this point all compiler flags in QEMU_CFLAGS are global and only
> depend on the OS.  No feature tests are performed in configure.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                | 94 ----------------------------------------
>  contrib/plugins/Makefile |  3 +-
>  meson.build              | 72 ++++++++++++++++++++----------
>  3 files changed, 51 insertions(+), 118 deletions(-)
>
> diff --git a/configure b/configure
> index 5d31294f316f..6df61f4337e4 100755
> --- a/configure
> +++ b/configure
> @@ -75,7 +75,6 @@ fi
>  TMPB=3D"qemu-conf"
>  TMPC=3D"${TMPDIR1}/${TMPB}.c"
>  TMPO=3D"${TMPDIR1}/${TMPB}.o"
> -TMPM=3D"${TMPDIR1}/${TMPB}.m"
>  TMPE=3D"${TMPDIR1}/${TMPB}.exe"
>
>  rm -f config.log
> @@ -157,15 +156,6 @@ do_cc() {
>      do_compiler_werror "$cc" $CPU_CFLAGS "$@"
>  }
>
> -do_objc() {
> -    do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
> -}
> -
> -# Append $2 to the variable named $1, with space separation
> -add_to() {
> -    eval $1=3D\${$1:+\"\$$1 \"}\$2
> -}
> -
>  compile_object() {
>    local_cflags=3D"$1"
>    do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cfla=
gs -c -o $TMPO $TMPC
> @@ -1091,89 +1081,6 @@ if ! compile_prog "" "" ; then
>      error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang=
 v10.0)"
>  fi
>
> -# Accumulate -Wfoo and -Wno-bar separately.
> -# We will list all of the enable flags first, and the disable flags seco=
nd.
> -# Note that we do not add -Werror, because that would enable it for all
> -# configure tests. If a configure test failed due to -Werror this would
> -# just silently disable some features, so it's too error prone.
> -
> -warn_flags=3D
> -add_to warn_flags -Wundef
> -add_to warn_flags -Wwrite-strings
> -add_to warn_flags -Wmissing-prototypes
> -add_to warn_flags -Wstrict-prototypes
> -add_to warn_flags -Wredundant-decls
> -add_to warn_flags -Wold-style-declaration
> -add_to warn_flags -Wold-style-definition
> -add_to warn_flags -Wtype-limits
> -add_to warn_flags -Wformat-security
> -add_to warn_flags -Wformat-y2k
> -add_to warn_flags -Winit-self
> -add_to warn_flags -Wignored-qualifiers
> -add_to warn_flags -Wempty-body
> -add_to warn_flags -Wnested-externs
> -add_to warn_flags -Wendif-labels
> -add_to warn_flags -Wexpansion-to-defined
> -add_to warn_flags -Wimplicit-fallthrough=3D2
> -
> -nowarn_flags=3D
> -add_to nowarn_flags -Wno-initializer-overrides
> -add_to nowarn_flags -Wno-missing-include-dirs
> -add_to nowarn_flags -Wno-shift-negative-value
> -add_to nowarn_flags -Wno-string-plus-int
> -add_to nowarn_flags -Wno-typedef-redefinition
> -add_to nowarn_flags -Wno-tautological-type-limit-compare
> -add_to nowarn_flags -Wno-psabi
> -add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
> -
> -gcc_flags=3D"$warn_flags $nowarn_flags"
> -
> -cc_has_warning_flag() {
> -    write_c_skeleton;
> -
> -    # Use the positive sense of the flag when testing for -Wno-wombat
> -    # support (gcc will happily accept the -Wno- form of unknown
> -    # warning options).
> -    optflag=3D"$(echo $1 | sed -e 's/^-Wno-/-W/')"
> -    compile_prog "-Werror $optflag" ""
> -}
> -
> -objcc_has_warning_flag() {
> -    cat > $TMPM <<EOF
> -int main(void) { return 0; }
> -EOF
> -
> -    # Use the positive sense of the flag when testing for -Wno-wombat
> -    # support (gcc will happily accept the -Wno- form of unknown
> -    # warning options).
> -    optflag=3D"$(echo $1 | sed -e 's/^-Wno-/-W/')"
> -    do_objc -Werror $optflag \
> -      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
> -      -o $TMPE $TMPM
> -}
> -
> -for flag in $gcc_flags; do
> -    if cc_has_warning_flag $flag ; then
> -        QEMU_CFLAGS=3D"$QEMU_CFLAGS $flag"
> -    fi
> -    if objcc_has_warning_flag $flag ; then
> -        QEMU_OBJCFLAGS=3D"$QEMU_OBJCFLAGS $flag"
> -    fi
> -done
> -
> -# Disable -Wmissing-braces on older compilers that warn even for
> -# the "universal" C zero initializer {0}.
> -cat > $TMPC << EOF
> -struct {
> -  int a[2];
> -} x =3D {0};
> -EOF
> -if compile_object "-Werror" "" ; then
> -  :
> -else
> -  QEMU_CFLAGS=3D"$QEMU_CFLAGS -Wno-missing-braces"
> -fi
> -
>  # Resolve default for --enable-plugins
>  if test "$static" =3D "yes" ; then
>    if test "$plugins" =3D "yes"; then
> @@ -1928,7 +1835,6 @@ echo "NINJA=3D$ninja" >> $config_host_mak
>  echo "PKG_CONFIG=3D${pkg_config_exe}" >> $config_host_mak
>  echo "CC=3D$cc" >> $config_host_mak
>  echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host_mak
> -echo "QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS" >> $config_host_mak
>  echo "EXESUF=3D$EXESUF" >> $config_host_mak
>
>  # use included Linux headers
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index 8a316cd76f2f..b2b9db9f51af 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -27,8 +27,7 @@ SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>  # The main QEMU uses Glib extensively so it's perfectly fine to use it
>  # in plugins (which many example do).
>  CFLAGS :=3D $(shell $(PKG_CONFIG) --cflags glib-2.0)
> -CFLAGS +=3D -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
> -CFLAGS +=3D $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
> +CFLAGS +=3D -fPIC -Wall
>  CFLAGS +=3D $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
>  CFLAGS +=3D -I$(SRC_PATH)/include/qemu
>
> diff --git a/meson.build b/meson.build
> index c5a8dce9e1d6..4ec8104b73a3 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -190,16 +190,8 @@ endif
>  # Compiler flags #
>  ##################
>
> -qemu_common_flags =3D []
> +qemu_common_flags =3D config_host['QEMU_CFLAGS'].split()
>  qemu_cflags =3D []
> -foreach arg : config_host['QEMU_CFLAGS'].split()
> -  if arg.startswith('-W')
> -    qemu_cflags +=3D arg
> -  else
> -    qemu_common_flags +=3D arg
> -  endif
> -endforeach
> -qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D []
>
>  if get_option('gprof')
> @@ -380,20 +372,49 @@ endif
>  add_global_arguments(qemu_common_flags, native: false, language: all_lan=
guages)
>  add_global_link_arguments(qemu_ldflags, native: false, language: all_lan=
guages)
>
> +# Collect warnings that we want to enable
> +
> +warn_flags =3D [
> +  '-Wundef',
> +  '-Wwrite-strings',
> +  '-Wmissing-prototypes',
> +  '-Wstrict-prototypes',
> +  '-Wredundant-decls',
> +  '-Wold-style-declaration',
> +  '-Wold-style-definition',
> +  '-Wtype-limits',
> +  '-Wformat-security',
> +  '-Wformat-y2k',
> +  '-Winit-self',
> +  '-Wignored-qualifiers',
> +  '-Wempty-body',
> +  '-Wnested-externs',
> +  '-Wendif-labels',
> +  '-Wexpansion-to-defined',
> +  '-Wimplicit-fallthrough=3D2',
> +  '-Wno-initializer-overrides',
> +  '-Wno-missing-include-dirs',
> +  '-Wno-shift-negative-value',
> +  '-Wno-string-plus-int',
> +  '-Wno-typedef-redefinition',
> +  '-Wno-tautological-type-limit-compare',
> +  '-Wno-psabi',
> +  '-Wno-gnu-variable-sized-type-not-at-end',
> +]
> +
> +if not cc.compiles('''
> +  struct {
> +    int a[2];
> +  } x =3D {0};''', args: ['-Werror'])
> +  warn_flags +=3D ['-Wno-missing-braces']
> +endif
> +
>  # Check that the C++ compiler exists and works with the C compiler.
>  link_language =3D 'c'
>  linker =3D cc
>  qemu_cxxflags =3D []
>  if 'cpp' in all_languages
> -  add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACR=
OS', '-D__STDC_FORMAT_MACROS'],
> -                       native: false, language: 'cpp')
> -  foreach k: qemu_cflags
> -    if k not in ['-Wstrict-prototypes', '-Wmissing-prototypes', '-Wneste=
d-externs',
> -                 '-Wold-style-declaration', '-Wold-style-definition', '-=
Wredundant-decls']
> -      qemu_cxxflags +=3D [k]
> -    endif
> -  endforeach
> -
> +  qemu_cxxflags =3D ['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS'=
, '-D__STDC_FORMAT_MACROS'] + qemu_cflags
>    if cxx.links(files('scripts/main.c'), args: qemu_cflags)
>      link_language =3D 'cpp'
>      linker =3D cxx
> @@ -413,9 +434,16 @@ if get_option('optimization') !=3D '0' and targetos =
=3D=3D 'linux'
>    endif
>  endif
>
> -add_project_arguments(qemu_cflags, native: false, language: 'c')
> -add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
> -add_project_arguments(qemu_objcflags, native: false, language: 'objc')
> +add_project_arguments(qemu_cflags, native: false, language: 'objc')
> +add_project_arguments(cc.get_supported_arguments(warn_flags), native: fa=
lse, language: 'c')
> +if 'cpp' in all_languages
> +  add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
> +  add_project_arguments(cxx.get_supported_arguments(warn_flags), native:=
 false, language: 'cpp')
> +endif
> +if 'objc' in all_languages
> +  # Note sanitizer flags are not applied to Objective-C sources!
> +  add_project_arguments(objc.get_supported_arguments(warn_flags), native=
: false, language: 'objc')
> +endif
>  if targetos =3D=3D 'linux'
>    add_project_arguments('-isystem', meson.current_source_dir() / 'linux-=
headers',
>                          '-isystem', 'linux-headers',
> @@ -3927,7 +3955,7 @@ if 'cpp' in all_languages
>    summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_common_flags + q=
emu_cxxflags)}
>  endif
>  if 'objc' in all_languages
> -  summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags + q=
emu_objcflags)}
> +  summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags)}
>  endif
>  summary_info +=3D {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
>  summary_info +=3D {'profiler':          get_option('profiler')}
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

