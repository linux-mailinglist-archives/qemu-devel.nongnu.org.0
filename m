Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38816649E89
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hje-0002HI-HQ; Mon, 12 Dec 2022 07:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hjc-0002GI-Em
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:16:40 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hjZ-0004LY-Jz
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:16:40 -0500
Received: by mail-lf1-x12a.google.com with SMTP id p36so18195558lfa.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWrk6FZFWwJlprK17gC8joK6PLjDswjiJeXTKHKz2vo=;
 b=ZpAnVlCtRnFnODI9tJp/siqd5hxIcl7AMCUA9CVzitgdlHGhilPOll+EDuIkobqEex
 xA2cQ6661gQGK1BR42GDncYBxRQ9E1GQ+zk52PwvtqPyot9M+ARU9t949BiNoqLB2/HS
 X5R3+q0rmD3ke7RrNYwcGu55QiRYqRTJ4wMwQ5g7XthSQPlIDUzU/+nZqOAy4ZRJ6lC9
 lxqhXUhUsZvTqLO7T44C4cvPQKal0tuLqLN18dgDfU7YqEaT/9XR5eYLPO1p9jLDxW1G
 N72aKXTSx7TJYFIG44z0xGb1tRGwomS3l+t0kQc6S8ytaT/6jw1sPkKyDCrTJxcfXBxA
 0ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWrk6FZFWwJlprK17gC8joK6PLjDswjiJeXTKHKz2vo=;
 b=nF/vDYPf5NZqPfkvAeSMOVW3FzFYno304vBRpCg66nSeSNPQrhAq2p+aE7WZQU8c3q
 VtiSpOAX4z+UqMRt5ULRhJ2IfvUHSQDfbX3R5wfaKTuohkvKHZV3dBneCmEY+iCyjkyA
 IIRFgd6vawEWHR3IZd0W60Ry8uxAwcRzAcDTl7W3g5iNoX3UjrDgEU/RS2WWevDwO4rd
 qEMyCqUP7XeV3g+MqQjLiackclU0PhCdIZKjhG8yg9XWxu/i8jJhTmlvhGplnzrphwlV
 hH/OfP6lla3AzTArexbQeus2r1T5nkSR/CLIiRqbXVGdQKEADSQmTMP0V89CyL9U3E5C
 tR/Q==
X-Gm-Message-State: ANoB5pl0SE6k2y0NEOZ999iIiuRliYg4qkqf4P7IgPQ7pKZSehxyuQLm
 opotXTjGfrxjtJLy8L8+5VzVp7B9E6wgl9nPe+U=
X-Google-Smtp-Source: AA0mqf6oN30wByF2KbSyeVr2smTZs1Z8Gb4ZC4wgyfxFWVHIu4Q0E9hVKS9fRSkToQUXiXw6lbclbiIOPxd5pAhf5Ag=
X-Received: by 2002:ac2:5324:0:b0:4b5:6d83:1a87 with SMTP id
 f4-20020ac25324000000b004b56d831a87mr8372174lfh.375.1670847395330; Mon, 12
 Dec 2022 04:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-22-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-22-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 16:16:23 +0400
Message-ID: <CAJ+F1CLgpt_mcGn59jcCt+Sn-xs4rHJ30USUJyLPCkjrsZk9dA@mail.gmail.com>
Subject: Re: [PATCH 21/30] build: move sanitizer tests to meson
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
> ---
>  configure                      | 151 ---------------------------------
>  docs/devel/build-system.rst    |   4 -
>  meson.build                    |  63 +++++++++++++-
>  meson_options.txt              |   4 +
>  scripts/meson-buildoptions.sh  |   6 ++
>  tests/qemu-iotests/meson.build |   2 +-
>  tests/unit/meson.build         |   2 +-
>  7 files changed, 73 insertions(+), 159 deletions(-)
>
> diff --git a/configure b/configure
> index b0df6c3cf754..babcf5d28a85 100755
> --- a/configure
> +++ b/configure
> @@ -269,9 +269,6 @@ EXTRA_OBJCFLAGS=3D""
>  EXTRA_LDFLAGS=3D""
>
>  debug_tcg=3D"no"
> -sanitizers=3D"no"
> -tsan=3D"no"
> -fortify_source=3D"yes"
>  EXESUF=3D""
>  prefix=3D"/usr/local"
>  qemu_suffix=3D"qemu"
> @@ -392,14 +389,6 @@ EOF
>    compile_object
>  }
>
> -check_include() {
> -cat > $TMPC <<EOF
> -#include <$1>
> -int main(void) { return 0; }
> -EOF
> -  compile_object
> -}
> -
>  write_c_skeleton() {
>      cat > $TMPC <<EOF
>  int main(void) { return 0; }
> @@ -755,15 +744,6 @@ for opt do
>        debug_tcg=3D"yes"
>        meson_option_parse --enable-debug-mutex ""
>        meson_option_add -Doptimization=3D0
> -      fortify_source=3D"no"
> -  ;;
> -  --enable-sanitizers) sanitizers=3D"yes"
> -  ;;
> -  --disable-sanitizers) sanitizers=3D"no"
> -  ;;
> -  --enable-tsan) tsan=3D"yes"
> -  ;;
> -  --disable-tsan) tsan=3D"no"
>    ;;
>    --disable-tcg) tcg=3D"disabled"
>                   plugins=3D"no"
> @@ -971,8 +951,6 @@ Advanced options (experts only):
>                             desired devices in configs/devices/)
>    --with-devices-ARCH=3DNAME override default configs/devices
>    --enable-debug           enable common debug build options
> -  --enable-sanitizers      enable default sanitizers
> -  --enable-tsan            enable thread sanitizer
>    --disable-werror         disable compilation abort on warning
>    --disable-stack-protector disable compiler-provided stack protection
>    --cpu=3DCPU                Build for host CPU [$cpu]
> @@ -1547,91 +1525,6 @@ if ! compile_object "-Werror"; then
>      ccache_cpp2=3Dyes
>  fi
>
> -#################################################
> -# clang does not support glibc + FORTIFY_SOURCE.
> -
> -if test "$fortify_source" !=3D "no"; then
> -  if echo | $cc -dM -E - | grep __clang__ > /dev/null 2>&1 ; then
> -    fortify_source=3D"no";
> -  elif test -n "$cxx" && has $cxx &&
> -       echo | $cxx -dM -E - | grep __clang__ >/dev/null 2>&1 ; then
> -    fortify_source=3D"no";
> -  else
> -    fortify_source=3D"yes"
> -  fi
> -fi
> -
> -##########################################
> -# checks for sanitizers
> -
> -have_asan=3Dno
> -have_ubsan=3Dno
> -have_asan_iface_h=3Dno
> -have_asan_iface_fiber=3Dno
> -
> -if test "$sanitizers" =3D "yes" ; then
> -  write_c_skeleton
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=3Daddress" ""; then
> -      have_asan=3Dyes
> -  fi
> -
> -  # we could use a simple skeleton for flags checks, but this also
> -  # detect the static linking issue of ubsan, see also:
> -  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D84285
> -  cat > $TMPC << EOF
> -#include <stdlib.h>
> -int main(void) {
> -    void *tmp =3D malloc(10);
> -    if (tmp !=3D NULL) {
> -        return *(int *)(tmp + 2);
> -    }
> -    return 1;
> -}
> -EOF
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=3Dundefined" ""; then
> -      have_ubsan=3Dyes
> -  fi
> -
> -  if check_include "sanitizer/asan_interface.h" ; then
> -      have_asan_iface_h=3Dyes
> -  fi
> -
> -  cat > $TMPC << EOF
> -#include <sanitizer/asan_interface.h>
> -int main(void) {
> -  __sanitizer_start_switch_fiber(0, 0, 0);
> -  return 0;
> -}
> -EOF
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=3Daddress" "" ; then
> -      have_asan_iface_fiber=3Dyes
> -  fi
> -fi
> -
> -# Thread sanitizer is, for now, much noisier than the other sanitizers;
> -# keep it separate until that is not the case.
> -if test "$tsan" =3D "yes" && test "$sanitizers" =3D "yes"; then
> -  error_exit "TSAN is not supported with other sanitiziers."
> -fi
> -have_tsan=3Dno
> -have_tsan_iface_fiber=3Dno
> -if test "$tsan" =3D "yes" ; then
> -  write_c_skeleton
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=3Dthread" "" ; then
> -      have_tsan=3Dyes
> -  fi
> -  cat > $TMPC << EOF
> -#include <sanitizer/tsan_interface.h>
> -int main(void) {
> -  __tsan_create_fiber(0);
> -  return 0;
> -}
> -EOF
> -  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=3Dthread" "" ; then
> -      have_tsan_iface_fiber=3Dyes
> -  fi
> -fi
> -
>  ##########################################
>  # functions to probe cross compilers
>
> @@ -2057,42 +1950,6 @@ case "$vfio_user_server" in
>      ;;
>  esac
>
> -##########################################
> -# End of CC checks
> -# After here, no more $cc or $ld runs
> -
> -write_c_skeleton
> -
> -if test "$fortify_source" =3D "yes" ; then
> -  QEMU_CFLAGS=3D"-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 $QEMU_CFLAGS"
> -fi
> -
> -if test "$have_asan" =3D "yes"; then
> -  QEMU_CFLAGS=3D"-fsanitize=3Daddress $QEMU_CFLAGS"
> -  QEMU_LDFLAGS=3D"-fsanitize=3Daddress $QEMU_LDFLAGS"
> -  if test "$have_asan_iface_h" =3D "no" ; then
> -      echo "ASAN build enabled, but ASAN header missing." \
> -           "Without code annotation, the report may be inferior."
> -  elif test "$have_asan_iface_fiber" =3D "no" ; then
> -      echo "ASAN build enabled, but ASAN header is too old." \
> -           "Without code annotation, the report may be inferior."
> -  fi
> -fi
> -if test "$have_tsan" =3D "yes" ; then
> -  if test "$have_tsan_iface_fiber" =3D "yes" ; then
> -    QEMU_CFLAGS=3D"-fsanitize=3Dthread $QEMU_CFLAGS"
> -    QEMU_LDFLAGS=3D"-fsanitize=3Dthread $QEMU_LDFLAGS"
> -  else
> -    error_exit "Cannot enable TSAN due to missing fiber annotation inter=
face."
> -  fi
> -elif test "$tsan" =3D "yes" ; then
> -  error_exit "Cannot enable TSAN due to missing sanitize thread interfac=
e."
> -fi
> -if test "$have_ubsan" =3D "yes"; then
> -  QEMU_CFLAGS=3D"-fsanitize=3Dundefined $QEMU_CFLAGS"
> -  QEMU_LDFLAGS=3D"-fsanitize=3Dundefined $QEMU_LDFLAGS"
> -fi
> -
>  #######################################
>  # cross-compiled firmware targets
>
> @@ -2216,14 +2073,6 @@ fi
>
>  echo "CONFIG_COROUTINE_BACKEND=3D$coroutine" >> $config_host_mak
>
> -if test "$have_asan_iface_fiber" =3D "yes" ; then
> -    echo "CONFIG_ASAN_IFACE_FIBER=3Dy" >> $config_host_mak
> -fi
> -
> -if test "$have_tsan" =3D "yes" && test "$have_tsan_iface_fiber" =3D "yes=
" ; then
> -    echo "CONFIG_TSAN=3Dy" >> $config_host_mak
> -fi
> -
>  if test "$plugins" =3D "yes" ; then
>      echo "CONFIG_PLUGIN=3Dy" >> $config_host_mak
>  fi
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 66cfe7b8bdc8..4a733fc0a747 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -91,10 +91,6 @@ developers in checking for system features:
>  ``check_define $NAME``
>     Determine if the macro $NAME is defined by the system C compiler
>
> -``check_include $NAME``
> -   Determine if the include $NAME file is available to the system C
> -   compiler.  The replacement in Meson is ``cc.has_header()``.
> -
>  ``write_c_skeleton``
>     Write a minimal C program main() function to the temporary file
>     indicated by $TMPC
> diff --git a/meson.build b/meson.build
> index dac343d14797..41a45fa495b2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -211,6 +211,42 @@ if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
>
> +if get_option('sanitizers')
> +  if cc.has_argument('-fsanitize=3Daddress')
> +    qemu_cflags =3D ['-fsanitize=3Daddress'] + qemu_cflags
> +    qemu_ldflags =3D ['-fsanitize=3Daddress'] + qemu_ldflags

why not the +=3D syntax? same below

> +  endif
> +
> +  # Detect static linking issue with ubsan - https://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D84285
> +  if cc.links('''
> +    #include <stdlib.h>
> +    int main(void) {
> +      void *tmp =3D malloc(10);
> +      if (tmp !=3D NULL) {
> +        return *(int *)(tmp + 2);
> +      }
> +      return 1;
> +  }''', args: [qemu_ldflags, '-fsanitize=3Dundefined'])
> +    qemu_cflags =3D ['-fsanitize=3Dundefined'] + qemu_cflags
> +    qemu_ldflags =3D ['-fsanitize=3Dundefined'] + qemu_ldflags
> +  endif
> +endif
> +
> +# Thread sanitizer is, for now, much noisier than the other sanitizers;
> +# keep it separate until that is not the case.
> +if get_option('tsan')
> +  if get_option('sanitizers')
> +    error('TSAN is not supported with other sanitizers')
> +  endif
> +  if not cc.has_function('__tsan_create_fiber',
> +                         args: '-fsanitize=3Dthread',
> +                         prefix: '#include <sanitizer/tsan_interface.h>'=
)
> +    error('Cannot enable TSAN due to missing fiber annotation interface'=
)
> +  endif
> +  qemu_cflags =3D ['-fsanitize=3Dthread'] + qemu_cflags
> +  qemu_ldflags =3D ['-fsanitize=3Dthread'] + qemu_ldflags
> +endif
> +
>  # Detect support for PT_GNU_RELRO + DT_BIND_NOW.
>  # The combination is known as "full relro", because .got.plt is read-onl=
y too.
>  qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-=
z,now')
> @@ -221,7 +257,7 @@ if targetos =3D=3D 'windows'
>  endif
>
>  # Exclude --warn-common with TSan to suppress warnings from the TSan lib=
raries.
> -if targetos !=3D 'sunos' and not config_host.has_key('CONFIG_TSAN')
> +if targetos !=3D 'sunos' and not get_option('tsan')
>    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--warn-common')
>  endif
>
> @@ -288,6 +324,16 @@ if 'cpp' in all_languages
>    endif
>  endif
>
> +# clang does not support glibc + FORTIFY_SOURCE (is it still true?)

No, it compiles successfully with clang (Fedora 15.0.4-1.fc37) and
glibc-2.36-8.fc37.x86_64 at least.

I guess we need someone to check on macos with glibc 2.35
(https://formulae.brew.sh/formula/glibc#default)

> +if get_option('optimization') !=3D '0' and targetos =3D=3D 'linux'
> +  if cc.get_id() =3D=3D 'gcc'
> +    qemu_cflags +=3D ['-U_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=3D2']
> +  endif
> +  if 'cpp' in all_languages and cxx.get_id() =3D=3D 'gcc'
> +    qemu_cxxflags +=3D ['-U_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=3D2']
> +  endif
> +endif
> +
>  add_project_arguments(qemu_cflags, native: false, language: 'c')
>  add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
>  add_project_arguments(qemu_objcflags, native: false, language: 'objc')
> @@ -1890,6 +1936,7 @@ if seccomp.found()
>  endif
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_TPM', have_tpm)
> +config_host_data.set('CONFIG_TSAN', get_option('tsan'))
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
>  config_host_data.set('CONFIG_VHOST_NET', have_vhost_net)
> @@ -2018,6 +2065,18 @@ if rdma.found()
>                                         prefix: '#include <infiniband/ver=
bs.h>'))
>  endif
>
> +have_asan_fiber =3D false
> +if get_option('sanitizers') and \
> +   not cc.has_function('__sanitizer_start_switch_fiber',
> +                         args: '-fsanitize=3Daddress',
> +                         prefix: '#include <sanitizer/asan_interface.h>'=
)
> +  warning('Missing ASAN due to missing fiber annotation interface')
> +  warning('Without code annotation, the report may be inferior.')
> +else
> +  have_asan_fiber =3D true
> +endif
> +config_host_data.set('CONFIG_ASAN_IFACE_FIBER', have_asan_fiber)
> +
>  # has_header_symbol
>  config_host_data.set('CONFIG_BYTESWAP_H',
>                       cc.has_header_symbol('byteswap.h', 'bswap_32'))
> @@ -3804,7 +3863,7 @@ summary_info +=3D {'avx2 optimization': config_host=
_data.get('CONFIG_AVX2_OPT')}
>  summary_info +=3D {'avx512f optimization': config_host_data.get('CONFIG_=
AVX512F_OPT')}
>  summary_info +=3D {'gprof enabled':     get_option('gprof')}
>  summary_info +=3D {'gcov':              get_option('b_coverage')}
> -summary_info +=3D {'thread sanitizer':  config_host.has_key('CONFIG_TSAN=
')}
> +summary_info +=3D {'thread sanitizer':  get_option('tsan')}
>  summary_info +=3D {'CFI support':       get_option('cfi')}
>  if get_option('cfi')
>    summary_info +=3D {'CFI debug support': get_option('cfi_debug')}
> diff --git a/meson_options.txt b/meson_options.txt
> index e492aaa73fbc..feeefa2ccbc1 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -84,6 +84,10 @@ option('tcg', type: 'feature', value: 'enabled',
>         description: 'TCG support')
>  option('tcg_interpreter', type: 'boolean', value: false,
>         description: 'TCG with bytecode interpreter (slow)')
> +option('sanitizers', type: 'boolean', value: false,
> +       description: 'enable default sanitizers')
> +option('tsan', type: 'boolean', value: false,
> +       description: 'enable thread sanitizer')
>  option('cfi', type: 'boolean', value: false,
>         description: 'Control-Flow Integrity (CFI)')
>  option('cfi_debug', type: 'boolean', value: false,
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index cb277347bb18..bafc40ddfbf4 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -36,11 +36,13 @@ meson_options_help() {
>    printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
>    printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/=
(u)random and'
>    printf "%s\n" '                           getrandom()'
> +  printf "%s\n" '  --enable-sanitizers      enable default sanitizers'
>    printf "%s\n" '  --enable-strip           Strip targets on install'
>    printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interprete=
r (slow)'
>    printf "%s\n" '  --enable-trace-backends=3DCHOICES'
>    printf "%s\n" '                           Set available tracing backen=
ds [log] (choices:'
>    printf "%s\n" '                           dtrace/ftrace/log/nop/simple=
/syslog/ust)'
> +  printf "%s\n" '  --enable-tsan            enable thread sanitizer'
>    printf "%s\n" '  --firmwarepath=3DVALUES    search PATH for firmware f=
iles [share/qemu-firmware]'
>    printf "%s\n" '  --iasl=3DVALUE             Path to ACPI disassembler'
>    printf "%s\n" '  --includedir=3DVALUE       Header file directory [inc=
lude]'
> @@ -388,6 +390,8 @@ _meson_option_parse() {
>      --disable-replication) printf "%s" -Dreplication=3Ddisabled ;;
>      --enable-rng-none) printf "%s" -Drng_none=3Dtrue ;;
>      --disable-rng-none) printf "%s" -Drng_none=3Dfalse ;;
> +    --enable-sanitizers) printf "%s" -Dsanitizers=3Dtrue ;;
> +    --disable-sanitizers) printf "%s" -Dsanitizers=3Dfalse ;;
>      --enable-sdl) printf "%s" -Dsdl=3Denabled ;;
>      --disable-sdl) printf "%s" -Dsdl=3Ddisabled ;;
>      --enable-sdl-image) printf "%s" -Dsdl_image=3Denabled ;;
> @@ -427,6 +431,8 @@ _meson_option_parse() {
>      --disable-tpm) printf "%s" -Dtpm=3Ddisabled ;;
>      --enable-trace-backends=3D*) quote_sh "-Dtrace_backends=3D$2" ;;
>      --with-trace-file=3D*) quote_sh "-Dtrace_file=3D$2" ;;
> +    --enable-tsan) printf "%s" -Dtsan=3Dtrue ;;
> +    --disable-tsan) printf "%s" -Dtsan=3Dfalse ;;
>      --enable-u2f) printf "%s" -Du2f=3Denabled ;;
>      --disable-u2f) printf "%s" -Du2f=3Ddisabled ;;
>      --enable-usb-redir) printf "%s" -Dusb_redir=3Denabled ;;
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.bu=
ild
> index 323a4acb6a3f..583468c5b9b3 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -2,7 +2,7 @@ if not have_tools or targetos =3D=3D 'windows' or get_opt=
ion('gprof')
>    subdir_done()
>  endif
>
> -foreach cflag: config_host['QEMU_CFLAGS'].split()
> +foreach cflag: qemu_ldflags
>    if cflag.startswith('-fsanitize') and \
>       not cflag.contains('safe-stack') and not cflag.contains('cfi-icall'=
)
>      message('Sanitizers are enabled =3D=3D> Disabled the qemu-iotests.')
> diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> index b497a4137830..46d88b49cbcf 100644
> --- a/tests/unit/meson.build
> +++ b/tests/unit/meson.build
> @@ -143,7 +143,7 @@ if have_system
>    # Some tests: test-char, test-qdev-global-props, and test-qga,
>    # are not runnable under TSan due to a known issue.
>    # https://github.com/google/sanitizers/issues/1116
> -  if 'CONFIG_TSAN' not in config_host
> +  if not get_option('tsan')
>      if 'CONFIG_POSIX' in config_host
>          tests +=3D {
>            'test-char': ['socket-helpers.c', qom, io, chardev]
> --
> 2.38.1
>
>

otherwise, lgtm

--=20
Marc-Andr=C3=A9 Lureau

