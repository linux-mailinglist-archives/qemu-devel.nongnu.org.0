Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28277649E8D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hlw-0003ki-SB; Mon, 12 Dec 2022 07:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hlo-0003jA-AY
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:18:57 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hld-0006cB-SF
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:18:49 -0500
Received: by mail-lf1-x12d.google.com with SMTP id q6so8156738lfm.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoINO2admwNQDDsHO1OBCsLlbnJhhXYVP89XEdE6/Bg=;
 b=G/N2kDXNHY1Uosr5RPyL14gDAT8Ss2j/PRXEiHrr9Qryp94ah3kUgx8mWMHaorEhgk
 CLFEvlcH0miIhXJtc/up5P1UAv7CVomU9LI7XknXOeQMf+BO7g23m0ltKJ9iM+wpc9MH
 c7mdXXvSHKXEFKUkAgo13lw368Wu7LGW51WhywgICjpfffQBy6jeZTB6tQ/mx7xWwkaT
 iAFU+NsNPNNtABQJGf5oslCqTBX0Qv1V1oZuWcjrEOEzi+7BmNIKHGMn2fqS6hc10x9i
 has/wa5EryBtxolbffGiv3PZsMZUApBPWw1GC06Gt9JiC2hisRnV85o09U3HuVM+KFyC
 8MiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aoINO2admwNQDDsHO1OBCsLlbnJhhXYVP89XEdE6/Bg=;
 b=HnE/LwvdHiKJuR73yQjdAIonvtlFjP5WppuXpJQ7oyIik4/8Bir2rWkM7pcf8d5uF1
 j/RC7kEz7fP5BeQucSyUo8fQmcPQ7y+y3CudXcAB4AnU9Qxp8rnjo5QC17XEXH7Gixvg
 VhXTffmZRJYeJHe7MhGEmNsy+YYCUuR6v+A47790YawNlZRtdNSLqqeRkGXxJS/wP0XN
 0A/h/tajaQl33BKwUMjqA9y5o0tuey4PUWzVpTAhtpxj2hjQ2hk7A4oLCFeKTZSivVnT
 lS3Cs612xWfS060VP0okxMUJjdZa7e3LKMn3g1a9DMwQMQZibTXae0srsqtPu2L/aaK0
 dI+w==
X-Gm-Message-State: ANoB5pml5YMjmNM1NLtRE6Q/ZsA0w4NPO3hGPdncbx6lIOwa47qpS+oH
 ee9E4sxLeBdQsfMN4FfRJo3qQxXF4oRfbSaf6f4slyCMfzE=
X-Google-Smtp-Source: AA0mqf71jtMSGC++zP3mAdooaZRmdUBH3eGQLg/2A8T23Ig0sCefxgUezGV2H/UX3MeX9rbyYj+SEwJKRg/cgIjaRfM=
X-Received: by 2002:a19:f016:0:b0:4b5:886b:d4af with SMTP id
 p22-20020a19f016000000b004b5886bd4afmr5078997lfc.276.1670847522552; Mon, 12
 Dec 2022 04:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-24-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-24-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 16:18:30 +0400
Message-ID: <CAJ+F1CK=kSUdf0mdek+Pm7GD5N0H_Rdf3yK8fMjnR2HTcCwxyQ@mail.gmail.com>
Subject: Re: [PATCH 23/30] build: move coroutine backend selection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12d.google.com
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

On Fri, Dec 9, 2022 at 3:37 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> To simplify the code, rename coroutine-win32.c to match the option
> passed to configure.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure                                     | 62 -------------------
>  meson.build                                   | 32 +++++++++-
>  meson_options.txt                             |  3 +
>  scripts/meson-buildoptions.py                 |  1 +
>  scripts/meson-buildoptions.sh                 |  3 +
>  ...{coroutine-win32.c =3D> coroutine-windows.c} |  0
>  util/meson.build                              |  2 +-
>  7 files changed, 38 insertions(+), 65 deletions(-)
>  rename util/{coroutine-win32.c =3D> coroutine-windows.c} (100%)
>
> diff --git a/configure b/configure
> index fea9cbf3abd0..1f7c5bbba4b9 100755
> --- a/configure
> +++ b/configure
> @@ -275,7 +275,6 @@ softmmu=3D"yes"
>  linux_user=3D""
>  bsd_user=3D""
>  pie=3D""
> -coroutine=3D""
>  plugins=3D"$default_feature"
>  meson=3D""
>  ninja=3D""
> @@ -792,8 +791,6 @@ for opt do
>    ;;
>    --enable-fdt=3D*) fdt=3D"$optarg"
>    ;;
> -  --with-coroutine=3D*) coroutine=3D"$optarg"
> -  ;;
>    --with-git=3D*) git=3D"$optarg"
>    ;;
>    --with-git-submodules=3D*)
> @@ -949,8 +946,6 @@ Advanced options (experts only):
>    --disable-werror         disable compilation abort on warning
>    --disable-stack-protector disable compiler-provided stack protection
>    --cpu=3DCPU                Build for host CPU [$cpu]
> -  --with-coroutine=3DBACKEND coroutine backend. Supported options:
> -                           ucontext, sigaltstack, windows
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> @@ -1373,61 +1368,6 @@ case "$fdt" in
>      ;;
>  esac
>
> -##########################################
> -# check and set a backend for coroutine
> -
> -# We prefer ucontext, but it's not always possible. The fallback
> -# is sigcontext. On Windows the only valid backend is the Windows
> -# specific one.
> -
> -ucontext_works=3Dno
> -if test "$darwin" !=3D "yes"; then
> -  cat > $TMPC << EOF
> -#include <ucontext.h>
> -#ifdef __stub_makecontext
> -#error Ignoring glibc stub makecontext which will always fail
> -#endif
> -int main(void) { makecontext(0, 0, 0); return 0; }
> -EOF
> -  if compile_prog "" "" ; then
> -    ucontext_works=3Dyes
> -  fi
> -fi
> -
> -if test "$coroutine" =3D ""; then
> -  if test "$mingw32" =3D "yes"; then
> -    coroutine=3Dwin32
> -  elif test "$ucontext_works" =3D "yes"; then
> -    coroutine=3Ducontext
> -  else
> -    coroutine=3Dsigaltstack
> -  fi
> -else
> -  case $coroutine in
> -  windows)
> -    if test "$mingw32" !=3D "yes"; then
> -      error_exit "'windows' coroutine backend only valid for Windows"
> -    fi
> -    # Unfortunately the user visible backend name doesn't match the
> -    # coroutine-*.c filename for this case, so we have to adjust it here=
.
> -    coroutine=3Dwin32
> -    ;;
> -  ucontext)
> -    if test "$ucontext_works" !=3D "yes"; then
> -      error_exit "'ucontext' backend requested but makecontext not avail=
able"
> -    fi
> -    ;;
> -  sigaltstack)
> -    if test "$mingw32" =3D "yes"; then
> -      error_exit "only the 'windows' coroutine backend is valid for Wind=
ows"
> -    fi
> -    ;;
> -  *)
> -    error_exit "unknown coroutine backend $coroutine"
> -    ;;
> -  esac
> -fi
> -
>  ########################################
>  # check if ccache is interfering with
>  # semantic analysis of macros
> @@ -2002,8 +1942,6 @@ if [ "$bsd" =3D "yes" ] ; then
>    echo "CONFIG_BSD=3Dy" >> $config_host_mak
>  fi
>
> -echo "CONFIG_COROUTINE_BACKEND=3D$coroutine" >> $config_host_mak
> -
>  if test "$plugins" =3D "yes" ; then
>      echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 7ee9f081d0a1..b9df49667a19 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -211,6 +211,34 @@ if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
>
> +coroutine_backend =3D get_option('coroutine_backend')
> +ucontext_probe =3D '''
> +  #include <ucontext.h>
> +  #ifdef __stub_makecontext
> +  #error Ignoring glibc stub makecontext which will always fail
> +  #endif
> +  int main(void) { makecontext(0, 0, 0); return 0; }'''
> +
> +# On Windows the only valid backend is the Windows specific one.
> +# For POSIX prefer ucontext, but it's not always possible. The fallback
> +# is sigcontext.
> +supported_backends =3D []
> +if targetos =3D=3D 'windows'
> +  supported_backends +=3D ['windows']
> +else
> +  if targetos !=3D 'darwin' and cc.links(ucontext_probe)
> +    supported_backends +=3D ['ucontext']
> +  endif
> +  supported_backends +=3D ['sigaltstack']
> +endif
> +
> +if coroutine_backend =3D=3D 'auto'
> +  coroutine_backend =3D supported_backends[0]
> +elif coroutine_backend not in supported_backends
> +  error('"@0@" backend requested but not available.  Available backends:=
 @1@' \
> +        .format(coroutine_backend, ', '.join(supported_backends)))
> +endif
> +
>  # Compiles if SafeStack *not* enabled
>  safe_stack_probe =3D '''
>    int main(void)
> @@ -232,7 +260,7 @@ if get_option('safe_stack') !=3D not cc.compiles(safe=
_stack_probe)
>    qemu_cflags +=3D safe_stack_arg
>    qemu_ldflags +=3D safe_stack_arg
>  endif
> -if get_option('safe_stack') and config_host['CONFIG_COROUTINE_BACKEND'] =
!=3D 'ucontext'
> +if get_option('safe_stack') and coroutine_backend !=3D 'ucontext'
>    error('SafeStack is only supported with the ucontext coroutine backend=
')
>  endif
>
> @@ -3949,7 +3977,7 @@ summary(summary_info, bool_yn: true, section: 'Targ=
ets and accelerators')
>
>  # Block layer
>  summary_info =3D {}
> -summary_info +=3D {'coroutine backend': config_host['CONFIG_COROUTINE_BA=
CKEND']}
> +summary_info +=3D {'coroutine backend': coroutine_backend}
>  summary_info +=3D {'coroutine pool':    have_coroutine_pool}
>  if have_block
>    summary_info +=3D {'Block whitelist (rw)': get_option('block_drv_rw_wh=
itelist')}
> diff --git a/meson_options.txt b/meson_options.txt
> index d39d2a060ae7..126f89517e9a 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -33,6 +33,9 @@ option('fuzzing_engine', type : 'string', value : '',
>         description: 'fuzzing engine library for OSS-Fuzz')
>  option('trace_file', type: 'string', value: 'trace',
>         description: 'Trace file prefix for simple backend')
> +option('coroutine_backend', type: 'combo',
> +       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
> +       value: 'auto', description: 'coroutine backend to use')
>
>  # Everything else can be set via --enable/--disable-* option
>  # on the configure script command line.  After adding an option
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 8e4e5c4e8bd6..66a79cf37ea8 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -35,6 +35,7 @@
>  OPTION_NAMES =3D {
>      "b_coverage": "gcov",
>      "b_lto": "lto",
> +    "coroutine_backend": "with-coroutine",
>      "debug": "debug-info",
>      "malloc": "enable-malloc",
>      "pkgversion": "with-pkgversion",
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 237220d9b308..29695ac88eea 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -59,6 +59,8 @@ meson_options_help() {
>    printf "%s\n" '  --sysconfdir=3DVALUE       Sysconf data directory [et=
c]'
>    printf "%s\n" '  --tls-priority=3DVALUE     Default TLS protocol/ciphe=
r priority string'
>    printf "%s\n" '                           [NORMAL]'
> +  printf "%s\n" '  --with-coroutine=3DCHOICE  coroutine backend to use (=
choices:'
> +  printf "%s\n" '                           auto/sigaltstack/ucontext/wi=
ndows)'
>    printf "%s\n" '  --with-pkgversion=3DVALUE  use specified string as su=
b-version of the'
>    printf "%s\n" '                           package'
>    printf "%s\n" '  --with-trace-file=3DVALUE  Trace file prefix for simp=
le backend [trace]'
> @@ -236,6 +238,7 @@ _meson_option_parse() {
>      --disable-cocoa) printf "%s" -Dcocoa=3Ddisabled ;;
>      --enable-coreaudio) printf "%s" -Dcoreaudio=3Denabled ;;
>      --disable-coreaudio) printf "%s" -Dcoreaudio=3Ddisabled ;;
> +    --with-coroutine=3D*) quote_sh "-Dcoroutine_backend=3D$2" ;;
>      --enable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dtrue ;;
>      --disable-coroutine-pool) printf "%s" -Dcoroutine_pool=3Dfalse ;;
>      --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=3Denabled ;;
> diff --git a/util/coroutine-win32.c b/util/coroutine-windows.c
> similarity index 100%
> rename from util/coroutine-win32.c
> rename to util/coroutine-windows.c
> diff --git a/util/meson.build b/util/meson.build
> index 25b9b61f9817..b2a0aea21beb 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -74,7 +74,7 @@ if have_block or have_ga
>    util_ss.add(files('lockcnt.c'))
>    util_ss.add(files('main-loop.c'))
>    util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-c=
oroutine-io.c'))
> -  util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTI=
NE_BACKEND'])))
> +  util_ss.add(files(f'coroutine-@coroutine_backend@.c'))
>    util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
>    util_ss.add(files('qemu-sockets.c'))
>  endif
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

