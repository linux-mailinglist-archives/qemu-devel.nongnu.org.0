Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B9509CE7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:56:24 +0200 (CEST)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTXz-0008FR-Kc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTUX-0005pZ-Hr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:52:51 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:41779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhTUU-0004lt-VJ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:52:49 -0400
Received: by mail-qk1-x731.google.com with SMTP id s70so3156749qke.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 02:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4uIFYZcQ79stN08Z6tmbkVsQbbRDJO/10Q27fwcfNc=;
 b=jBtu+M3sSDhQx7fh/Iw4KQkk3wOwj/6VzczqEkhd+SvJI+TW87fj6puPomG6a3D822
 hJWKLjJO6h4dlP/VSIJ9+Vk2wD4J7vH1dqGlf8TQEkNiwztczGV8/ZbbY5aJ34He/4CO
 JGgHa/i4yZO7OKwLEsmBRo/lP79hiiSwurrHadawHyF024HLcOKyUjb75Mu3vEMcN2Fl
 25DzjrSxGgxhx31imp7qDFp0LvduqjmVfHYQDsEPry6NdX23eIoeJ0LHrI4G75PCeGva
 F87NMm08ETlC9rNx2qCxWaOCJFVc1fvPzgH+c0VoCS7bgQuw3FnAT3jcurPT5E6O7uf2
 qpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4uIFYZcQ79stN08Z6tmbkVsQbbRDJO/10Q27fwcfNc=;
 b=dMaNoUgdjesVpqoRkysz9WSqzqE7iUViylfpdN8XIZPQEHefFMA6QzbBWXy4S88BZ3
 P5dyvQLrSVaIAsObLJ2bhtSjCqdHIKXuBpdPJTlEf2+3is60rIQpKdKrkVYKNJW1ccD6
 P4UZLqA4oA9NW/5Jd2WU9ccnPFFlhjwWgwldPTbsMzQ3gXcWZtU5P3ZRe54uhaWWwBao
 +RUwM4n14yoEhY9v8TUQ6NNzsiTfw6V+BdK8wMRNiQtYihBdpIWTFNHpHCWWK6pxllbj
 L4Nv/Ru0vJXhxczubcGYoSy46hD5PHzK6Eui2D0zNi7ldnJ3q+wzAOIwO33KY2U3CPhP
 hzSw==
X-Gm-Message-State: AOAM531FN56ZqzGf1/+z1Xw5cpnsQLAW7L9NymF1axEYvd4WTPvU9Br9
 JQtqSn4HYIdGGhoOxhg2xWw3JwO9uyzfhXjE0bw=
X-Google-Smtp-Source: ABdhPJyMB3shr1lk6QrjB6AY1V9segp/2oTWiqWyqCWjoDr65unKXYGWMLHskCB8sWOTL05HPOYk7yf6ZYXbW6d6qMI=
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr14933553qko.245.1650534765800; Thu, 21
 Apr 2022 02:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-26-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-26-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 13:52:33 +0400
Message-ID: <CAJ+F1CKESXEOCqwVGu5N0UXvML2O-GzO71HPSCVxW0VU3PivLw@mail.gmail.com>
Subject: Re: [PATCH 25/34] meson: pass more options directly as -D
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000067b2ad05dd27123e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x731.google.com
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

--00000000000067b2ad05dd27123e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:00 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> If an option is not used anywhere by the configure script, it can be just
> added to $meson_options even if it is not parsed by the automatically
> generated bits in scripts/meson-buildoptions.sh.
>
> The only slightly tricky case is $debug, where the
>
>   if test "$fortify_source" =3D "yes" ; then
>     QEMU_CFLAGS=3D"-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $QEMU_CFLAGS"
>     debug=3Dno
>   fi
>
> assignment is dead; configure sets fortify_source=3Dno whenever debug=3Dy=
es.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>




> ---
>  configure                     | 39 ++++++++++-------------------------
>  meson.build                   |  2 +-
>  scripts/meson-buildoptions.py |  4 ++++
>  scripts/meson-buildoptions.sh |  6 ++++++
>  4 files changed, 22 insertions(+), 29 deletions(-)
>
> diff --git a/configure b/configure
> index b704453c68..4997983b5d 100755
> --- a/configure
> +++ b/configure
> @@ -235,7 +235,6 @@ static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
>  host_cc=3D"cc"
> -lto=3D"false"
>  stack_protector=3D""
>  safe_stack=3D""
>  use_containers=3D"yes"
> @@ -291,13 +290,10 @@ vhost_vsock=3D"$default_feature"
>  vhost_user=3D"no"
>  vhost_user_fs=3D"$default_feature"
>  vhost_vdpa=3D"$default_feature"
> -debug_info=3D"yes"
>  debug_tcg=3D"no"
> -debug=3D"no"
>  sanitizers=3D"no"
>  tsan=3D"no"
>  fortify_source=3D"$default_feature"
> -gcov=3D"no"
>  EXESUF=3D""
>  modules=3D"no"
>  prefix=3D"/usr/local"
> @@ -327,10 +323,7 @@ else
>  fi
>  fdt=3D"auto"
>
> -# 2. Support --with/--without option
> -default_devices=3D"true"
> -
> -# 3. Automatically enable/disable other options
> +# 2. Automatically enable/disable other options
>  tcg=3D"enabled"
>  cfi=3D"false"
>
> @@ -679,6 +672,9 @@ werror=3D""
>  . $source_path/scripts/meson-buildoptions.sh
>
>  meson_options=3D
> +meson_option_add() {
> +  meson_options=3D"$meson_options $(quote_sh "$1")"
> +}
>  meson_option_parse() {
>    meson_options=3D"$meson_options $(_meson_option_parse "$@")"
>    if test $? -eq 1; then
> @@ -731,9 +727,9 @@ for opt do
>    ;;
>    --cross-cc-*)
>    ;;
> -  --enable-debug-info) debug_info=3D"yes"
> +  --enable-debug-info) meson_option_add -Ddebug=3Dtrue
>    ;;
> -  --disable-debug-info) debug_info=3D"no"
> +  --disable-debug-info) meson_option_add -Ddebug=3Dfalse
>    ;;
>    --enable-modules)
>        modules=3D"yes"
> @@ -753,9 +749,9 @@ for opt do
>                         error_exit "Can't mix --target-list-exclude with
> --target-list"
>                     fi
>    ;;
> -  --with-default-devices) default_devices=3D"true"
> +  --with-default-devices) meson_option_add -Ddefault_devices=3Dtrue
>    ;;
> -  --without-default-devices) default_devices=3D"false"
> +  --without-default-devices) meson_option_add -Ddefault_devices=3Dfalse
>    ;;
>    --with-devices-*[!a-zA-Z0-9_-]*=3D*) error_exit "Passed bad
> --with-devices-FOO option"
>    ;;
> @@ -771,8 +767,6 @@ for opt do
>    ;;
>    --without-default-features) # processed above
>    ;;
> -  --enable-gcov) gcov=3D"yes"
> -  ;;
>    --static)
>      static=3D"yes"
>      QEMU_PKG_CONFIG_FLAGS=3D"--static $QEMU_PKG_CONFIG_FLAGS"
> @@ -799,7 +793,7 @@ for opt do
>        # Enable debugging options that aren't excessively noisy
>        debug_tcg=3D"yes"
>        meson_option_parse --enable-debug-mutex ""
> -      debug=3D"yes"
> +      meson_option_add -Doptimization=3D0
>        fortify_source=3D"no"
>    ;;
>    --enable-sanitizers) sanitizers=3D"yes"
> @@ -848,10 +842,6 @@ for opt do
>    ;;
>    --disable-werror) werror=3D"no"
>    ;;
> -  --enable-lto) lto=3D"true"
> -  ;;
> -  --disable-lto) lto=3D"false"
> -  ;;
>    --enable-stack-protector) stack_protector=3D"yes"
>    ;;
>    --disable-stack-protector) stack_protector=3D"no"
> @@ -862,7 +852,7 @@ for opt do
>    ;;
>    --enable-cfi)
>        cfi=3D"true";
> -      lto=3D"true";
> +      meson_option_add -Db_lto=3Dtrue
>    ;;
>    --disable-cfi) cfi=3D"false"
>    ;;
> @@ -1100,7 +1090,6 @@ Advanced options (experts only):
>    --cpu=3DCPU                Build for host CPU [$cpu]
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
>                             ucontext, sigaltstack, windows
> -  --enable-gcov            enable test coverage analysis with gcov
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> @@ -1116,7 +1105,6 @@ cat << EOF
>    modules         modules support (non-Windows)
>    debug-tcg       TCG debugging (default is disabled)
>    debug-info      debugging information
> -  lto             Enable Link-Time Optimization.
>    safe-stack      SafeStack Stack Smash Protection. Depends on
>                    clang/llvm >=3D 3.7 and requires coroutine backend
> ucontext.
>    vhost-net       vhost-net kernel acceleration support
> @@ -1937,7 +1925,6 @@ write_c_skeleton
>
>  if test "$fortify_source" =3D "yes" ; then
>    QEMU_CFLAGS=3D"-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $QEMU_CFLAGS"
> -  debug=3Dno
>  fi
>
>  case "$ARCH" in
> @@ -2366,15 +2353,11 @@ if test "$skip_meson" =3D no; then
>      NINJA=3D$ninja $meson setup \
>          --prefix "$prefix" \
>          --bindir "$bindir" \
> -        -Ddefault_devices=3D$default_devices \
>          -Dqemu_suffix=3D"$qemu_suffix" \
>          -Dsmbd=3D"$smbd" \
> -        -Doptimization=3D$(if test "$debug" =3D yes; then echo 0; else e=
cho
> 2; fi) \
> -        -Ddebug=3D$(if test "$debug_info" =3D yes; then echo true; else =
echo
> false; fi) \
>          -Dwerror=3D$(if test "$werror" =3D yes; then echo true; else ech=
o
> false; fi) \
>          -Db_pie=3D$(if test "$pie" =3D yes; then echo true; else echo fa=
lse;
> fi) \
> -        -Db_coverage=3D$(if test "$gcov" =3D yes; then echo true; else e=
cho
> false; fi) \
> -        -Db_lto=3D$lto -Dcfi=3D$cfi -Dtcg=3D$tcg \
> +        -Dcfi=3D$cfi -Dtcg=3D$tcg \
>          -Dcapstone=3D$capstone -Dfdt=3D$fdt -Dslirp=3D$slirp \
>          $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo
> "-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE") \
>          $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
> diff --git a/meson.build b/meson.build
> index 2545ac2848..60e8c302e6 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,6 +1,6 @@
>  project('qemu', ['c'], meson_version: '>=3D0.59.3',
>          default_options: ['warning_level=3D1', 'c_std=3Dgnu11',
> 'cpp_std=3Dgnu++11', 'b_colorout=3Dauto',
> -                          'b_staticpic=3Dfalse', 'stdsplit=3Dfalse'],
> +                          'b_staticpic=3Dfalse', 'stdsplit=3Dfalse',
> 'optimization=3D2'],
>          version: files('VERSION'))
>
>  add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default=
:
> true)
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 45cda8cd84..e624c16b01 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -33,6 +33,8 @@
>  }
>
>  OPTION_NAMES =3D {
> +    "b_coverage": "gcov",
> +    "b_lto": "lto",
>      "malloc": "enable-malloc",
>      "pkgversion": "with-pkgversion",
>      "qemu_firmwarepath": "firmwarepath",
> @@ -41,6 +43,8 @@
>  }
>
>  BUILTIN_OPTIONS =3D {
> +    "b_coverage",
> +    "b_lto",
>      "datadir",
>      "includedir",
>      "libdir",
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index a52cc14d13..274639777e 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -27,7 +27,9 @@ meson_options_help() {
>    printf "%s\n" '  --enable-fdt[=3DCHOICE]    Whether and how to find th=
e
> libfdt library'
>    printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
>    printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
> +  printf "%s\n" '  --enable-gcov            Enable coverage tracking.'
>    printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
> +  printf "%s\n" '  --enable-lto             Use link time optimization'
>    printf "%s\n" '  --enable-malloc=3DCHOICE   choose memory allocator to
> use [system] (choices:'
>    printf "%s\n" '                           jemalloc/system/tcmalloc)'
>    printf "%s\n" '  --enable-module-upgrades try to load modules from
> alternate paths for'
> @@ -182,6 +184,10 @@ _meson_option_parse() {
>      --disable-avx2) printf "%s" -Davx2=3Ddisabled ;;
>      --enable-avx512f) printf "%s" -Davx512f=3Denabled ;;
>      --disable-avx512f) printf "%s" -Davx512f=3Ddisabled ;;
> +    --enable-gcov) printf "%s" -Db_coverage=3Dtrue ;;
> +    --disable-gcov) printf "%s" -Db_coverage=3Dfalse ;;
> +    --enable-lto) printf "%s" -Db_lto=3Dtrue ;;
> +    --disable-lto) printf "%s" -Db_lto=3Dfalse ;;
>      --block-drv-ro-whitelist=3D*) quote_sh "-Dblock_drv_ro_whitelist=3D$=
2" ;;
>      --block-drv-rw-whitelist=3D*) quote_sh "-Dblock_drv_rw_whitelist=3D$=
2" ;;
>      --enable-block-drv-whitelist-in-tools) printf "%s"
> -Dblock_drv_whitelist_in_tools=3Dtrue ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000067b2ad05dd27123e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:00 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If a=
n option is not used anywhere by the configure script, it can be just<br>
added to $meson_options even if it is not parsed by the automatically<br>
generated bits in scripts/meson-buildoptions.sh.<br>
<br>
The only slightly tricky case is $debug, where the<br>
<br>
=C2=A0 if test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0 QEMU_CFLAGS=3D&quot;-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $=
QEMU_CFLAGS&quot;<br>
=C2=A0 =C2=A0 debug=3Dno<br>
=C2=A0 fi<br>
<br>
assignment is dead; configure sets fortify_source=3Dno whenever debug=3Dyes=
.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><b=
r><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 39 ++++++++++-------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0scripts/meson-buildoptions.py |=C2=A0 4 ++++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 6 ++++++<br>
=C2=A04 files changed, 22 insertions(+), 29 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index b704453c68..4997983b5d 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -235,7 +235,6 @@ static=3D&quot;no&quot;<br>
=C2=A0cross_compile=3D&quot;no&quot;<br>
=C2=A0cross_prefix=3D&quot;&quot;<br>
=C2=A0host_cc=3D&quot;cc&quot;<br>
-lto=3D&quot;false&quot;<br>
=C2=A0stack_protector=3D&quot;&quot;<br>
=C2=A0safe_stack=3D&quot;&quot;<br>
=C2=A0use_containers=3D&quot;yes&quot;<br>
@@ -291,13 +290,10 @@ vhost_vsock=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_user=3D&quot;no&quot;<br>
=C2=A0vhost_user_fs=3D&quot;$default_feature&quot;<br>
=C2=A0vhost_vdpa=3D&quot;$default_feature&quot;<br>
-debug_info=3D&quot;yes&quot;<br>
=C2=A0debug_tcg=3D&quot;no&quot;<br>
-debug=3D&quot;no&quot;<br>
=C2=A0sanitizers=3D&quot;no&quot;<br>
=C2=A0tsan=3D&quot;no&quot;<br>
=C2=A0fortify_source=3D&quot;$default_feature&quot;<br>
-gcov=3D&quot;no&quot;<br>
=C2=A0EXESUF=3D&quot;&quot;<br>
=C2=A0modules=3D&quot;no&quot;<br>
=C2=A0prefix=3D&quot;/usr/local&quot;<br>
@@ -327,10 +323,7 @@ else<br>
=C2=A0fi<br>
=C2=A0fdt=3D&quot;auto&quot;<br>
<br>
-# 2. Support --with/--without option<br>
-default_devices=3D&quot;true&quot;<br>
-<br>
-# 3. Automatically enable/disable other options<br>
+# 2. Automatically enable/disable other options<br>
=C2=A0tcg=3D&quot;enabled&quot;<br>
=C2=A0cfi=3D&quot;false&quot;<br>
<br>
@@ -679,6 +672,9 @@ werror=3D&quot;&quot;<br>
=C2=A0. $source_path/scripts/meson-buildoptions.sh<br>
<br>
=C2=A0meson_options=3D<br>
+meson_option_add() {<br>
+=C2=A0 meson_options=3D&quot;$meson_options $(quote_sh &quot;$1&quot;)&quo=
t;<br>
+}<br>
=C2=A0meson_option_parse() {<br>
=C2=A0 =C2=A0meson_options=3D&quot;$meson_options $(_meson_option_parse &qu=
ot;$@&quot;)&quot;<br>
=C2=A0 =C2=A0if test $? -eq 1; then<br>
@@ -731,9 +727,9 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--cross-cc-*)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-debug-info) debug_info=3D&quot;yes&quot;<br>
+=C2=A0 --enable-debug-info) meson_option_add -Ddebug=3Dtrue<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --disable-debug-info) debug_info=3D&quot;no&quot;<br>
+=C2=A0 --disable-debug-info) meson_option_add -Ddebug=3Dfalse<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-modules)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0modules=3D&quot;yes&quot;<br>
@@ -753,9 +749,9 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error_exit &quot;Can&#39;t mix --target-list-exclude with --targ=
et-list&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-default-devices) default_devices=3D&quot;true&quot;<br>
+=C2=A0 --with-default-devices) meson_option_add -Ddefault_devices=3Dtrue<b=
r>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --without-default-devices) default_devices=3D&quot;false&quot;<br>
+=C2=A0 --without-default-devices) meson_option_add -Ddefault_devices=3Dfal=
se<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--with-devices-*[!a-zA-Z0-9_-]*=3D*) error_exit &quot;Passed b=
ad --with-devices-FOO option&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -771,8 +767,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--without-default-features) # processed above<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-gcov) gcov=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--static)<br>
=C2=A0 =C2=A0 =C2=A0static=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0QEMU_PKG_CONFIG_FLAGS=3D&quot;--static $QEMU_PKG_CONFIG=
_FLAGS&quot;<br>
@@ -799,7 +793,7 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0# Enable debugging options that aren&#39;t exces=
sively noisy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0debug_tcg=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0meson_option_parse --enable-debug-mutex &quot;&q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 debug=3D&quot;yes&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 meson_option_add -Doptimization=3D0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fortify_source=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-sanitizers) sanitizers=3D&quot;yes&quot;<br>
@@ -848,10 +842,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-werror) werror=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-lto) lto=3D&quot;true&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-lto) lto=3D&quot;false&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-stack-protector) stack_protector=3D&quot;yes&quot;<br=
>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-stack-protector) stack_protector=3D&quot;no&quot;<br=
>
@@ -862,7 +852,7 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-cfi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cfi=3D&quot;true&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 lto=3D&quot;true&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 meson_option_add -Db_lto=3Dtrue<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-cfi) cfi=3D&quot;false&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -1100,7 +1090,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--cpu=3DCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Build for host CPU [$cpu]<br>
=C2=A0 =C2=A0--with-coroutine=3DBACKEND coroutine backend. Supported option=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ucontext, sigaltstack, windows<br>
-=C2=A0 --enable-gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable test =
coverage analysis with gcov<br>
=C2=A0 =C2=A0--enable-plugins<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 enable plugins via shared library loading<br>
=C2=A0 =C2=A0--disable-containers=C2=A0 =C2=A0 =C2=A0don&#39;t use containe=
rs for cross-building<br>
@@ -1116,7 +1105,6 @@ cat &lt;&lt; EOF<br>
=C2=A0 =C2=A0modules=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules support (non-=
Windows)<br>
=C2=A0 =C2=A0debug-tcg=C2=A0 =C2=A0 =C2=A0 =C2=A0TCG debugging (default is =
disabled)<br>
=C2=A0 =C2=A0debug-info=C2=A0 =C2=A0 =C2=A0 debugging information<br>
-=C2=A0 lto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable Link-Time=
 Optimization.<br>
=C2=A0 =C2=A0safe-stack=C2=A0 =C2=A0 =C2=A0 SafeStack Stack Smash Protectio=
n. Depends on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang/=
llvm &gt;=3D 3.7 and requires coroutine backend ucontext.<br>
=C2=A0 =C2=A0vhost-net=C2=A0 =C2=A0 =C2=A0 =C2=A0vhost-net kernel accelerat=
ion support<br>
@@ -1937,7 +1925,6 @@ write_c_skeleton<br>
<br>
=C2=A0if test &quot;$fortify_source&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $Q=
EMU_CFLAGS&quot;<br>
-=C2=A0 debug=3Dno<br>
=C2=A0fi<br>
<br>
=C2=A0case &quot;$ARCH&quot; in<br>
@@ -2366,15 +2353,11 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0NINJA=3D$ninja $meson setup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--prefix &quot;$prefix&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--bindir &quot;$bindir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddefault_devices=3D$default_devices \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_suffix=3D&quot;$qemu_suffix&quot; =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsmbd=3D&quot;$smbd&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Doptimization=3D$(if test &quot;$debug&quot; =
=3D yes; then echo 0; else echo 2; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Ddebug=3D$(if test &quot;$debug_info&quot; =
=3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwerror=3D$(if test &quot;$werror&quot; =
=3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Db_pie=3D$(if test &quot;$pie&quot; =3D =
yes; then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Db_coverage=3D$(if test &quot;$gcov&quot; =3D=
 yes; then echo true; else echo false; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Db_lto=3D$lto -Dcfi=3D$cfi -Dtcg=3D$tcg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dcfi=3D$cfi -Dtcg=3D$tcg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dcapstone=3D$capstone -Dfdt=3D$fdt -Dsli=
rp=3D$slirp \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(test -n &quot;${LIB_FUZZING_ENGINE+xxx}=
&quot; &amp;&amp; echo &quot;-Dfuzzing_engine=3D$LIB_FUZZING_ENGINE&quot;) =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if test &quot;$default_feature&quot; =
=3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
diff --git a/meson.build b/meson.build<br>
index 2545ac2848..60e8c302e6 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1,6 +1,6 @@<br>
=C2=A0project(&#39;qemu&#39;, [&#39;c&#39;], meson_version: &#39;&gt;=3D0.5=
9.3&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default_options: [&#39;warning_level=3D1&=
#39;, &#39;c_std=3Dgnu11&#39;, &#39;cpp_std=3Dgnu++11&#39;, &#39;b_colorout=
=3Dauto&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b_staticpic=3Dfalse&#39;, &#39;stdsplit=3Dfalse&#39;=
],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;b_staticpic=3Dfalse&#39;, &#39;stdsplit=3Dfalse&#39;=
, &#39;optimization=3D2&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version: files(&#39;VERSION&#39;))<br>
<br>
=C2=A0add_test_setup(&#39;quick&#39;, exclude_suites: [&#39;slow&#39;, &#39=
;thorough&#39;], is_default: true)<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 45cda8cd84..e624c16b01 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -33,6 +33,8 @@<br>
=C2=A0}<br>
<br>
=C2=A0OPTION_NAMES =3D {<br>
+=C2=A0 =C2=A0 &quot;b_coverage&quot;: &quot;gcov&quot;,<br>
+=C2=A0 =C2=A0 &quot;b_lto&quot;: &quot;lto&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;malloc&quot;: &quot;enable-malloc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;pkgversion&quot;: &quot;with-pkgversion&quot;,<br=
>
=C2=A0 =C2=A0 =C2=A0&quot;qemu_firmwarepath&quot;: &quot;firmwarepath&quot;=
,<br>
@@ -41,6 +43,8 @@<br>
=C2=A0}<br>
<br>
=C2=A0BUILTIN_OPTIONS =3D {<br>
+=C2=A0 =C2=A0 &quot;b_coverage&quot;,<br>
+=C2=A0 =C2=A0 &quot;b_lto&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;datadir&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;includedir&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;libdir&quot;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index a52cc14d13..274639777e 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -27,7 +27,9 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-fdt[=3DCHOICE]=C2=
=A0 =C2=A0 Whether and how to find the libfdt library&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices:=
 auto/disabled/enabled/internal/system)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-fuzzing=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0build fuzzing targets&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-gcov=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Enable coverage tracking.&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-gprof=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU profiling with gprof&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-lto=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Use link time optimization&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-malloc=3DCHOICE=
=C2=A0 =C2=A0choose memory allocator to use [system] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc/=
system/tcmalloc)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-module-upgrades t=
ry to load modules from alternate paths for&#39;<br>
@@ -182,6 +184,10 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-avx2) printf &quot;%s&quot; -Davx2=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-avx512f) printf &quot;%s&quot; -Davx512f=3Dena=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-avx512f) printf &quot;%s&quot; -Davx512f=3Ddi=
sabled ;;<br>
+=C2=A0 =C2=A0 --enable-gcov) printf &quot;%s&quot; -Db_coverage=3Dtrue ;;<=
br>
+=C2=A0 =C2=A0 --disable-gcov) printf &quot;%s&quot; -Db_coverage=3Dfalse ;=
;<br>
+=C2=A0 =C2=A0 --enable-lto) printf &quot;%s&quot; -Db_lto=3Dtrue ;;<br>
+=C2=A0 =C2=A0 --disable-lto) printf &quot;%s&quot; -Db_lto=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--block-drv-ro-whitelist=3D*) quote_sh &quot;-Dblock_dr=
v_ro_whitelist=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--block-drv-rw-whitelist=3D*) quote_sh &quot;-Dblock_dr=
v_rw_whitelist=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-block-drv-whitelist-in-tools) printf &quot;%s&=
quot; -Dblock_drv_whitelist_in_tools=3Dtrue ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000067b2ad05dd27123e--

