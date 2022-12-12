Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7F649E60
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:03:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hWA-0000d2-Og; Mon, 12 Dec 2022 07:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hVw-0000aY-VE
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:02:32 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4hVr-0007zC-SI
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:02:31 -0500
Received: by mail-lj1-x236.google.com with SMTP id l8so12231198ljh.13
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMSzEUElMx6ZIkrBJiNo4X/z9im0Qcwapl1RGX9DUKw=;
 b=JHSppdWDSSNep+gLrLWBgqPL7AaOs56OgoigBKLjEpK7cwVCX4wDZoifuGLPRFkIMr
 ev482m62oi/EzxegvVZ+N317XAtFMid9F53HqaFqQ6vEgHE2+CW66kBPiCutvyrjrTfc
 PjjmUBV/zMHp8TkUFY7Y4TbnPjpsRYvXKdamFlSroTm2Uzdy71aWlYFo3eO+xn6l4tPq
 IWXtoWJ4jjeLHiEzkD3ArhUZowtMw3rePMJL5CGm7KmdP+ZJLuxq7XO+4/sLYScx8jQw
 h2EuXBwqzcFCHMRDp07JZomFyMkkgqtOgpaUXRJF9kx5//0t1cTu82rzagTZUCaPcXIn
 c/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMSzEUElMx6ZIkrBJiNo4X/z9im0Qcwapl1RGX9DUKw=;
 b=bC/HYSiBaCG9ismAVfSONRt1RdC2FC+UrvEU+XtYmUyJXWnQqh8bL/gi/A9X/ciaa/
 cuUSAkGHVthJ4T4ytyM3WUm1qFefqoPs58FmMBWRSKCp17BSkLwFxrHB6SvkCl3L17pW
 7ejZ8XGZ8v1nQggtiHBfmToxGtnEbdk4PIb4+FvM790rrjfKsUedCcv8W6jtpcUgHlUf
 WMCLvoveR0B3s3FqnervyRJeT9h359IyMiAN8odBfw6gXl8QMwN5lKTl9RATxhTfH/Ol
 dqAYng06MOgSjNGTkTt0yGYqyNVZ7HHu29rk3Rs15eQinYkVn9wfk1yELambsG98nmc4
 z4ag==
X-Gm-Message-State: ANoB5pnMSsFM+lghxuI7PE2mnfNnftMEya4ptfua3wwOKV2d6W8uFZUa
 TiFv/vJbgcrwPzqa4aaqpPEyqwtnOxPEBikz17w=
X-Google-Smtp-Source: AA0mqf6I/zi3aHM3q6Qbq2dSt60V3h/UV/r7P9TX0abpXoQWW+Q7AxU18/b/g31U4a2IFbelNMa6bEvw/ppOqRgObr0=
X-Received: by 2002:a05:651c:200c:b0:279:3d7a:c240 with SMTP id
 s12-20020a05651c200c00b002793d7ac240mr26398765ljo.289.1670846545254; Mon, 12
 Dec 2022 04:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-21-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-21-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 16:02:13 +0400
Message-ID: <CAJ+F1CLRpekpsg7aBW5A81VG0s_CfCX8pB8kjxpz=WY1UXxy1A@mail.gmail.com>
Subject: Re: [PATCH 20/30] meson: prepare move of QEMU_CFLAGS to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

On Fri, Dec 9, 2022 at 3:34 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Clean up the handling of compiler flags in meson.build, splitting
> the general flags that should be included in subprojects as well,
> from warning flags that only apply to QEMU itself.  The two were
> mixed in both configure tests and meson tests.
>
> This split makes it easier to move the compiler tests piecewise
> from configure to Meson.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  meson.build | 53 +++++++++++++++++++++++++++++------------------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 99c1bde4d154..dac343d14797 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -190,10 +190,23 @@ endif
>  # Compiler flags #
>  ##################
>
> -qemu_cflags =3D config_host['QEMU_CFLAGS'].split()
> +qemu_common_flags =3D []
> +qemu_cflags =3D []
> +foreach arg : config_host['QEMU_CFLAGS'].split()
> +  if arg.startswith('-W')
> +    qemu_cflags +=3D arg
> +  else
> +    qemu_common_flags +=3D arg
> +  endif
> +endforeach
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
> +if get_option('gprof')
> +  qemu_common_flags +=3D ['-p']
> +  qemu_ldflags +=3D ['-p']
> +endif
> +
>  if get_option('prefer_static')
>    qemu_ldflags +=3D get_option('b_pie') ? '-static-pie' : '-static'
>  endif
> @@ -207,10 +220,9 @@ if targetos =3D=3D 'windows'
>    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--dynamicbase',=
 '-Wl,--high-entropy-va')
>  endif
>
> -if get_option('gprof')
> -  qemu_cflags +=3D ['-p']
> -  qemu_objcflags +=3D ['-p']
> -  qemu_ldflags +=3D ['-p']
> +# Exclude --warn-common with TSan to suppress warnings from the TSan lib=
raries.
> +if targetos !=3D 'sunos' and not config_host.has_key('CONFIG_TSAN')
> +  qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--warn-common')
>  endif
>
>  # Specify linker-script with add_project_link_arguments so that it is no=
t placed
> @@ -230,8 +242,7 @@ if get_option('fuzzing')
>                    name: '-fsanitize-coverage-allowlist=3D/dev/null',
>                   args: ['-fsanitize-coverage-allowlist=3D/dev/null',
>                          '-fsanitize-coverage=3Dtrace-pc'] )
> -    add_global_arguments('-fsanitize-coverage-allowlist=3Dinstrumentatio=
n-filter',
> -                         native: false, language: all_languages)
> +    qemu_common_flags +=3D ['-fsanitize-coverage-allowlist=3Dinstrumenta=
tion-filter']
>    endif
>
>    if get_option('fuzzing_engine') =3D=3D ''
> @@ -239,10 +250,8 @@ if get_option('fuzzing')
>      # compiled code.  To build non-fuzzer binaries with --enable-fuzzing=
, link
>      # everything with fsanitize=3Dfuzzer-no-link. Otherwise, the linker =
will be
>      # unable to bind the fuzzer-related callbacks added by instrumentati=
on.
> -    add_global_arguments('-fsanitize=3Dfuzzer-no-link',
> -                         native: false, language: all_languages)
> -    add_global_link_arguments('-fsanitize=3Dfuzzer-no-link',
> -                              native: false, language: all_languages)
> +    qemu_common_flags +=3D ['-fsanitize=3Dfuzzer-no-link']
> +    qemu_ldflags +=3D ['-fsanitize=3Dfuzzer-no-link']
>      # For the actual fuzzer binaries, we need to link against the libfuz=
zer
>      # library. They need to be configurable, to support OSS-Fuzz
>      fuzz_exe_ldflags =3D ['-fsanitize=3Dfuzzer']
> @@ -253,6 +262,9 @@ if get_option('fuzzing')
>    endif
>  endif
>
> +add_global_arguments(qemu_common_flags, native: false, language: all_lan=
guages)
> +add_global_link_arguments(qemu_ldflags, native: false, language: all_lan=
guages)
> +
>  # Check that the C++ compiler exists and works with the C compiler.
>  link_language =3D 'c'
>  linker =3D cc
> @@ -276,16 +288,9 @@ if 'cpp' in all_languages
>    endif
>  endif
>
> -# Exclude --warn-common with TSan to suppress warnings from the TSan lib=
raries.
> -if targetos !=3D 'sunos' and not config_host.has_key('CONFIG_TSAN')
> -  qemu_ldflags +=3D linker.get_supported_link_arguments('-Wl,--warn-comm=
on')
> -endif
> -
> -add_global_link_arguments(qemu_ldflags, native: false, language: all_lan=
guages)
> -
> -add_global_arguments(qemu_cflags, native: false, language: 'c')
> -add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
> -add_global_arguments(qemu_objcflags, native: false, language: 'objc')
> +add_project_arguments(qemu_cflags, native: false, language: 'c')
> +add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
> +add_project_arguments(qemu_objcflags, native: false, language: 'objc')
>  if targetos =3D=3D 'linux'
>    add_project_arguments('-isystem', meson.current_source_dir() / 'linux-=
headers',
>                          '-isystem', 'linux-headers',
> @@ -3778,12 +3783,12 @@ link_args =3D get_option(link_language + '_link_a=
rgs')
>  if link_args.length() > 0
>    summary_info +=3D {'LDFLAGS':         ' '.join(link_args)}
>  endif
> -summary_info +=3D {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
> +summary_info +=3D {'QEMU_CFLAGS':       ' '.join(qemu_common_flags + qem=
u_cflags)}
>  if 'cpp' in all_languages
> -  summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
> +  summary_info +=3D {'QEMU_CXXFLAGS':     ' '.join(qemu_common_flags + q=
emu_cxxflags)}
>  endif
>  if 'objc' in all_languages
> -  summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
> +  summary_info +=3D {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags + q=
emu_objcflags)}
>  endif
>  summary_info +=3D {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
>  summary_info +=3D {'profiler':          get_option('profiler')}
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

