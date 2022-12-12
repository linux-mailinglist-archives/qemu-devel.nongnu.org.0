Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84864649AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:07:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ekL-00083F-Re; Mon, 12 Dec 2022 04:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4ekD-00081X-4d
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:05:06 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4ekB-0003bQ-0T
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:05:04 -0500
Received: by mail-lf1-x129.google.com with SMTP id s8so17442866lfc.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1670J5ValjmZbflAVtWvQVmpmtcajij6dNTjFKJBpA=;
 b=UU4n0kjGQOeAcYcgP+UHyaLO3wvPS8NI4Wb5qgOf3g2KUqT2MBoluL4RzVhLLo98CI
 SJLkd5uov1VG9CqlTCEeb7SYWnn+Q2A2WK5Tu6youR7jahtr494GcPivsV4rhsZeACNW
 0xv4XHTljOb4puj8PnrdHbbVqk3x47CVpFNijrSPhOhMsVAuU0lTFunEaDutKbql6iKE
 EKpHfZiS5bdwA4ej2zgsNCW6OpditvUcB8Y222stWRhGRH3V5JtutUPuih09ISKTKFEl
 pyr81oHSd9pOFy4QfLtDAIB+ijxDpyHF4U6/0pH77jPGv3pRKK4WUN7AGvCCpxk/ll7K
 A/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W1670J5ValjmZbflAVtWvQVmpmtcajij6dNTjFKJBpA=;
 b=KkE2OUZON4guO1BXmf2Qf5uklBRKysp/F4N2SwNEyZsYE4xQp6ZzJHX9EZNJA6mwGo
 AmQSKWJ+lmVaC13SVKeVPBhTjesxyDi6vpiSTm+rq+R64vB9xXqLCMH7aVSxUL1Iz4A9
 c4B0NO42JTG6QKoIndv2lSrblgCWZqpXfH51jgAgMDYXC9a0PVNdbxjIyVlda5zmvQTz
 tVOJSOqF6RLFbGc1CCkSIH4GNU7LGLPQ98HUfk/O+LE1uG8EMx2QqQ6H4isCz+4Hvyf5
 y3FR0qaG5ZdyIqXwEBEw26Q1NaJ7JULDOyQtRqi74dM0cZQNtrEKuZRgb4q3g424cW1N
 YUfg==
X-Gm-Message-State: ANoB5pnuercdt+OBYvgqj/JBsI4yY01jo9u4gC2g8SUUBvDScMaaY+Lv
 EspjiJiVKJ2P5Ql5BKPuVXmtNVxc98G6atS0LM8=
X-Google-Smtp-Source: AA0mqf6KdUH7ceZ3ObywE3zxmHpebQLi5POoJJcGDJtRqwWWxZ11EsDpiXimRUP/mDs6o1D8zlMg7pStxobMGJT8C74=
X-Received: by 2002:a19:f016:0:b0:4b5:886b:d4af with SMTP id
 p22-20020a19f016000000b004b5886bd4afmr5016018lfc.276.1670835900630; Mon, 12
 Dec 2022 01:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-16-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-16-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 13:04:48 +0400
Message-ID: <CAJ+F1CLofgNKL606x2PDHtvbbMjzpoD6icE7SoNc=GuWDBt3Lg@mail.gmail.com>
Subject: Re: [PATCH 15/30] meson: cleanup compiler detection
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

On Fri, Dec 9, 2022 at 3:29 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Detect all compilers at the beginning of meson.build, and store
> the available languages in an array.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  meson.build | 62 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 35 insertions(+), 27 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 8a9ed5628317..c4fa82ae8ba4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -15,9 +15,21 @@ ss =3D import('sourceset')
>  fs =3D import('fs')
>
>  sh =3D find_program('sh')
> -cc =3D meson.get_compiler('c')
>  config_host =3D keyval.load(meson.current_build_dir() / 'config-host.mak=
')
>  enable_modules =3D 'CONFIG_MODULES' in config_host
> +targetos =3D host_machine.system()
> +
> +cc =3D meson.get_compiler('c')
> +all_languages =3D ['c']
> +if add_languages('cpp', required: false, native: false)
> +  all_languages +=3D ['cpp']
> +  cxx =3D meson.get_compiler('cpp')
> +endif
> +if targetos =3D=3D 'darwin' and \
> +   add_languages('objc', required: get_option('cocoa'), native: false)
> +  all_languages +=3D ['objc']
> +  objc =3D meson.get_compiler('objc')
> +endif
>
>  # Temporary directory used for files created while
>  # configure runs. Since it is in the build directory
> @@ -54,8 +66,6 @@ if cpu in ['riscv32', 'riscv64']
>    cpu =3D 'riscv'
>  endif
>
> -targetos =3D host_machine.system()
> -
>  target_dirs =3D config_host['TARGET_DIRS'].split()
>  have_linux_user =3D false
>  have_bsd_user =3D false
> @@ -161,7 +171,7 @@ if 'dtrace' in get_option('trace_backends')
>      # semaphores are linked into the main binary and not the module's sh=
ared
>      # object.
>      add_global_arguments('-DSTAP_SDT_V2',
> -                         native: false, language: ['c', 'cpp', 'objc'])
> +                         native: false, language: all_languages)
>    endif
>  endif
>
> @@ -203,7 +213,7 @@ endif
>  if get_option('fuzzing')
>    add_project_link_arguments(['-Wl,-T,',
>                                (meson.current_source_dir() / 'tests/qtest=
/fuzz/fork_fuzz.ld')],
> -                             native: false, language: ['c', 'cpp', 'objc=
'])
> +                             native: false, language: all_languages)
>
>    # Specify a filter to only instrument code that is directly related to
>    # virtual-devices.
> @@ -216,7 +226,7 @@ if get_option('fuzzing')
>                   args: ['-fsanitize-coverage-allowlist=3D/dev/null',
>                          '-fsanitize-coverage=3Dtrace-pc'] )
>      add_global_arguments('-fsanitize-coverage-allowlist=3Dinstrumentatio=
n-filter',
> -                         native: false, language: ['c', 'cpp', 'objc'])
> +                         native: false, language: all_languages)
>    endif
>
>    if get_option('fuzzing_engine') =3D=3D ''
> @@ -225,9 +235,9 @@ if get_option('fuzzing')
>      # everything with fsanitize=3Dfuzzer-no-link. Otherwise, the linker =
will be
>      # unable to bind the fuzzer-related callbacks added by instrumentati=
on.
>      add_global_arguments('-fsanitize=3Dfuzzer-no-link',
> -                         native: false, language: ['c', 'cpp', 'objc'])
> +                         native: false, language: all_languages)
>      add_global_link_arguments('-fsanitize=3Dfuzzer-no-link',
> -                              native: false, language: ['c', 'cpp', 'obj=
c'])
> +                              native: false, language: all_languages)
>      # For the actual fuzzer binaries, we need to link against the libfuz=
zer
>      # library. They need to be configurable, to support OSS-Fuzz
>      fuzz_exe_ldflags =3D ['-fsanitize=3Dfuzzer']
> @@ -238,15 +248,11 @@ if get_option('fuzzing')
>    endif
>  endif
>
> -add_global_arguments(qemu_cflags, native: false, language: ['c'])
> -add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
> -
>  # Check that the C++ compiler exists and works with the C compiler.
>  link_language =3D 'c'
>  linker =3D cc
>  qemu_cxxflags =3D []
> -if add_languages('cpp', required: false, native: false)
> -  cxx =3D meson.get_compiler('cpp')
> +if 'cpp' in all_languages
>    add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACR=
OS', '-D__STDC_FORMAT_MACROS'],
>                         native: false, language: 'cpp')
>    foreach k: qemu_cflags
> @@ -255,7 +261,6 @@ if add_languages('cpp', required: false, native: fals=
e)
>        qemu_cxxflags +=3D [k]
>      endif
>    endforeach
> -  add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
>
>    if cxx.links(files('scripts/main.c'), args: qemu_cflags)
>      link_language =3D 'cpp'
> @@ -271,22 +276,21 @@ if targetos !=3D 'sunos' and not config_host.has_ke=
y('CONFIG_TSAN')
>    qemu_ldflags +=3D linker.get_supported_link_arguments('-Wl,--warn-comm=
on')
>  endif
>
> -add_global_link_arguments(qemu_ldflags, native: false, language: ['c', '=
cpp', 'objc'])
> +add_global_link_arguments(qemu_ldflags, native: false, language: all_lan=
guages)
>
> +add_global_arguments(qemu_cflags, native: false, language: 'c')
> +add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
> +add_global_arguments(qemu_objcflags, native: false, language: 'objc')
>  if targetos =3D=3D 'linux'
>    add_project_arguments('-isystem', meson.current_source_dir() / 'linux-=
headers',
>                          '-isystem', 'linux-headers',
> -                        language: ['c', 'cpp'])
> +                        language: all_languages)
>  endif
>
>  add_project_arguments('-iquote', '.',
>                        '-iquote', meson.current_source_dir(),
>                        '-iquote', meson.current_source_dir() / 'include',
> -                      language: ['c', 'cpp', 'objc'])
> -
> -if host_machine.system() =3D=3D 'darwin'
> -  add_languages('objc', required: false, native: false)
> -endif
> +                      language: all_languages)
>
>  sparse =3D find_program('cgcc', required: get_option('sparse'))
>  if sparse.found()
> @@ -468,7 +472,7 @@ if get_option('tcg').allowed()
>      tcg_arch =3D 'ppc'
>    endif
>    add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / =
tcg_arch,
> -                        language: ['c', 'cpp', 'objc'])
> +                        language: all_languages)
>
>    accelerators +=3D 'CONFIG_TCG'
>    config_host +=3D { 'CONFIG_TCG': 'y' }
> @@ -494,7 +498,7 @@ endif
>  # The path to glib.h is added to all compilation commands.  This was
>  # grandfathered in from the QEMU Makefiles.
>  add_project_arguments(config_host['GLIB_CFLAGS'].split(),
> -                      native: false, language: ['c', 'cpp', 'objc'])
> +                      native: false, language: all_languages)
>  glib =3D declare_dependency(compile_args: config_host['GLIB_CFLAGS'].spl=
it(),
>                            link_args: config_host['GLIB_LIBS'].split(),
>                            version: config_host['GLIB_VERSION'],
> @@ -1674,8 +1678,8 @@ if get_option('cfi')
>        error('-fno-sanitize-trap=3Dcfi-icall is not supported by the comp=
iler')
>      endif
>    endif
> -  add_global_arguments(cfi_flags, native: false, language: ['c', 'cpp', =
'objc'])
> -  add_global_link_arguments(cfi_flags, native: false, language: ['c', 'c=
pp', 'objc'])
> +  add_global_arguments(cfi_flags, native: false, language: all_languages=
)
> +  add_global_link_arguments(cfi_flags, native: false, language: all_lang=
uages)
>  endif
>
>  have_host_block_device =3D (targetos !=3D 'darwin' or
> @@ -3713,8 +3717,12 @@ if link_args.length() > 0
>    summary_info +=3D {'LDFLAGS':         ' '.join(link_args)}
>  endif
>  summary_info +=3D {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
> -summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
> -summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
> +if 'cpp' in all_languages
> +  summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
> +endif
> +if 'objc' in all_languages
> +  summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
> +endif
>  summary_info +=3D {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
>  summary_info +=3D {'profiler':          get_option('profiler')}
>  summary_info +=3D {'link-time optimization (LTO)': get_option('b_lto')}
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

