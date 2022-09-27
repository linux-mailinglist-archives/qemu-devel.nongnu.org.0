Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14A5EC0A9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:11:33 +0200 (CEST)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8Uu-0006XY-Qf
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8KW-0006EB-Ms
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1od8KU-0003XN-De
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664276445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3euqD2Z/KMUsCANNIZxj1pSQAOOkfHJ/FpYnWbwi74=;
 b=g8WaogfeqGeTkRE+LGGXJKwXOiBQqCrTWuYRL9NrxMca/gncZBrFG/q/Ttu8RSAuUyim1H
 JnA4kalZMlrtjsT3cHjvl1eZP3Bi3aB4BmoskZW2hihE6tVoASpo188/NyB7JUBnkJ8nEp
 fc1xqJ8E9GHuYCQpp9ItoPAsJic20Zw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-WA1RpfZCNBaXlHmpvF_WQg-1; Tue, 27 Sep 2022 07:00:44 -0400
X-MC-Unique: WA1RpfZCNBaXlHmpvF_WQg-1
Received: by mail-oo1-f69.google.com with SMTP id
 i25-20020a4a6f59000000b004758bda2303so3952479oof.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O3euqD2Z/KMUsCANNIZxj1pSQAOOkfHJ/FpYnWbwi74=;
 b=0f0sSqoIywFl4fpFdOi6L+CUvwnPlxPZj9+lqqiHh2efeYN878+CeEhGbpcRCpMcNP
 QZLlR1qkDNqIglvnLGEFr5djRk5oVQELRW8flQ5ryXj3azkh8dWg4zXkUL88sJSRjy5y
 3JFzd9LlEonY7NJANoMr836RBQhsaq9btZIk0u8QjqpMCQucX0lhlvZF35vWhHGTRbsE
 T5kLhskcEB061Cmok8xYzKM+P383BLa3u6U7cEYfvKdiROmqWPnWyislFfTAhSibmVnk
 N6M2QTDtPoqirMCqLy2CAfWO+ruZnAiftjkdutSq5QWj0VZMymPrFkF2DrNQlRnL7cXI
 t9Og==
X-Gm-Message-State: ACrzQf0mW2bY2poZXDkpWYQGbxGaJ3XvKux43+UobD+/XVePBWMXjvpG
 SrNQu26kUN1wW14NNdFnUKdjqvUTCK2yt/+gb9OJEwzJ0W13ysaQx6LC5/sLqSKd4gqD5Pkn3RF
 ByPpLd9dIUcA4RQ1gSmK8TMA/Txqc87s=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1500038oib.205.1664276442308; 
 Tue, 27 Sep 2022 04:00:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VixlCZtOzICYg9zd0NU+VNsq/bVl0VPxkjehxjs7/mAUWBrKTEsBScvCvi6MYMcpKSoxlUljvlLp6VTgyRo4=
X-Received: by 2002:a05:6808:21a3:b0:350:cca1:9f40 with SMTP id
 be35-20020a05680821a300b00350cca19f40mr1500029oib.205.1664276442010; Tue, 27
 Sep 2022 04:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-5-pbonzini@redhat.com>
In-Reply-To: <20220927095921.261760-5-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Sep 2022 15:00:30 +0400
Message-ID: <CAMxuvaxZAtuY5Kw+CAaCTLh3qbwC7xvxzP_abrJYXjMHyiBnPw@mail.gmail.com>
Subject: Re: [PATCH 4/5] configure,
 meson: move C++ compiler detection to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 1:59 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The test is slightly weaker than before, because it does not
> call an extern "C" function from a C source file.  However,
> in practice what we seek to detect is ABI compatibility of the
> various sanitizer flags, and for that it is enough to compile
> anything with CC and link it with CXX.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure      | 57 --------------------------------------------------
>  meson.build    | 37 ++++++++++++++++++++++----------
>  scripts/main.c |  1 +
>  3 files changed, 27 insertions(+), 68 deletions(-)
>  create mode 100644 scripts/main.c
>
> diff --git a/configure b/configure
> index 680d96d09f..0a6f57c371 100755
> --- a/configure
> +++ b/configure
> @@ -75,7 +75,6 @@ fi
>  TMPB=3D"qemu-conf"
>  TMPC=3D"${TMPDIR1}/${TMPB}.c"
>  TMPO=3D"${TMPDIR1}/${TMPB}.o"
> -TMPCXX=3D"${TMPDIR1}/${TMPB}.cxx"
>  TMPM=3D"${TMPDIR1}/${TMPB}.m"
>  TMPE=3D"${TMPDIR1}/${TMPB}.exe"
>
> @@ -158,10 +157,6 @@ do_cc() {
>      do_compiler_werror "$cc" $CPU_CFLAGS "$@"
>  }
>
> -do_cxx() {
> -    do_compiler_werror "$cxx" $CPU_CFLAGS "$@"
> -}
> -
>  do_objc() {
>      do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
>  }
> @@ -171,24 +166,6 @@ add_to() {
>      eval $1=3D\${$1:+\"\$$1 \"}\$2
>  }
>
> -update_cxxflags() {
> -    # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
> -    # options which some versions of GCC's C++ compiler complain about
> -    # because they only make sense for C programs.
> -    QEMU_CXXFLAGS=3D"-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__=
STDC_FORMAT_MACROS"
> -    CONFIGURE_CXXFLAGS=3D$(echo "$CONFIGURE_CFLAGS" | sed s/-std=3Dgnu11=
/-std=3Dgnu++11/)
> -    for arg in $QEMU_CFLAGS; do
> -        case $arg in
> -            -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
> -            -Wold-style-declaration|-Wold-style-definition|-Wredundant-d=
ecls)
> -                ;;
> -            *)
> -                QEMU_CXXFLAGS=3D${QEMU_CXXFLAGS:+$QEMU_CXXFLAGS }$arg
> -                ;;
> -        esac
> -    done
> -}
> -
>  compile_object() {
>    local_cflags=3D"$1"
>    do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cfla=
gs -c -o $TMPO $TMPC
> @@ -2371,38 +2348,6 @@ fi
>  #######################################
>  # generate config-host.mak
>
> -# Check that the C++ compiler exists and works with the C compiler.
> -# All the QEMU_CXXFLAGS are based on QEMU_CFLAGS. Keep this at the end t=
o don't miss any other that could be added.
> -if has $cxx; then
> -    cat > $TMPC <<EOF
> -int c_function(void);
> -int main(void) { return c_function(); }
> -EOF
> -
> -    compile_object
> -
> -    cat > $TMPCXX <<EOF
> -extern "C" {
> -   int c_function(void);
> -}
> -int c_function(void) { return 42; }
> -EOF
> -
> -    update_cxxflags
> -
> -    if do_cxx $CXXFLAGS $EXTRA_CXXFLAGS $CONFIGURE_CXXFLAGS $QEMU_CXXFLA=
GS -o $TMPE $TMPCXX $TMPO $QEMU_LDFLAGS; then
> -        # C++ compiler $cxx works ok with C compiler $cc
> -        :
> -    else
> -        echo "C++ compiler $cxx does not work with C compiler $cc"
> -        echo "Disabling C++ specific optional code"
> -        cxx=3D
> -    fi
> -else
> -    echo "No C++ compiler available; disabling C++ specific optional cod=
e"
> -    cxx=3D
> -fi
> -
>  if ! (GIT=3D"$git" "$source_path/scripts/git-submodule.sh" "$git_submodu=
les_action" "$git_submodules"); then
>      exit 1
>  fi
> @@ -2486,7 +2431,6 @@ echo "MESON=3D$meson" >> $config_host_mak
>  echo "NINJA=3D$ninja" >> $config_host_mak
>  echo "CC=3D$cc" >> $config_host_mak
>  echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host_mak
> -echo "QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS" >> $config_host_mak
>  echo "QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS" >> $config_host_mak
>  echo "GLIB_CFLAGS=3D$glib_cflags" >> $config_host_mak
>  echo "GLIB_LIBS=3D$glib_libs" >> $config_host_mak
> @@ -2608,7 +2552,6 @@ if test "$skip_meson" =3D no; then
>        echo "${a}-softmmu =3D '$c'" >> $cross
>    done
>
> -  test -z "$cxx" && echo "link_language =3D 'c'" >> $cross
>    echo "[built-in options]" >> $cross
>    echo "c_args =3D [$(meson_quote $CFLAGS $EXTRA_CFLAGS)]" >> $cross
>    echo "cpp_args =3D [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cro=
ss
> diff --git a/meson.build b/meson.build
> index e1700d1d55..f57a60ac4c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -180,7 +180,6 @@ endif
>  ##################
>
>  qemu_cflags =3D config_host['QEMU_CFLAGS'].split()
> -qemu_cxxflags =3D config_host['QEMU_CXXFLAGS'].split()
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
> @@ -194,7 +193,6 @@ endif
>
>  if get_option('gprof')
>    qemu_cflags +=3D ['-p']
> -  qemu_cxxflags +=3D ['-p']
>    qemu_objcflags +=3D ['-p']
>    qemu_ldflags +=3D ['-p']
>  endif
> @@ -240,8 +238,33 @@ if get_option('fuzzing')
>  endif
>
>  add_global_arguments(qemu_cflags, native: false, language: ['c'])
> -add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
>  add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
> +
> +# Check that the C++ compiler exists and works with the C compiler.
> +link_language =3D 'c'
> +linker =3D cc
> +qemu_cxxflags =3D []
> +if add_languages('cpp', required: false, native: false)
> +  cxx =3D meson.get_compiler('cpp')
> +  add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACR=
OS', '-D__STDC_FORMAT_MACROS'],
> +                       native: false, language: 'cpp')
> +  foreach k: qemu_cflags
> +    if k not in ['-Wstrict-prototypes', '-Wmissing-prototypes', '-Wneste=
d-externs',
> +                 '-Wold-style-declaration', '-Wold-style-definition', '-=
Wredundant-decls']
> +      qemu_cxxflags +=3D [k]
> +    endif
> +  endforeach
> +  add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
> +
> +  if cxx.links(files('scripts/main.c'), args: qemu_cflags)
> +    link_language =3D 'cpp'
> +    linker =3D cxx
> +  else
> +    message('C++ compiler does not work with C compiler')
> +    message('Disabling C++-specific optional code')
> +  endif
> +endif
> +
>  add_global_link_arguments(qemu_ldflags, native: false, language: ['c', '=
cpp', 'objc'])
>
>  if targetos =3D=3D 'linux'
> @@ -255,14 +278,6 @@ add_project_arguments('-iquote', '.',
>                        '-iquote', meson.current_source_dir() / 'include',
>                        language: ['c', 'cpp', 'objc'])
>
> -link_language =3D meson.get_external_property('link_language', 'cpp')
> -if link_language =3D=3D 'cpp'
> -  add_languages('cpp', required: true, native: false)
> -  cxx =3D meson.get_compiler('cpp')
> -  linker =3D cxx
> -else
> -  linker =3D cc
> -endif
>  if host_machine.system() =3D=3D 'darwin'
>    add_languages('objc', required: false, native: false)
>  endif
> diff --git a/scripts/main.c b/scripts/main.c
> new file mode 100644
> index 0000000000..b552c8e4ed
> --- /dev/null
> +++ b/scripts/main.c
> @@ -0,0 +1 @@
> +int main(void) {}
> --
> 2.37.3
>


