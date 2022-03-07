Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21584CF098
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:17:47 +0100 (CET)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4oc-00073s-Pd
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4mq-0005He-38; Sun, 06 Mar 2022 23:15:56 -0500
Received: from [2607:f8b0:4864:20::c2f] (port=46859
 helo=mail-oo1-xc2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4ml-00084A-4G; Sun, 06 Mar 2022 23:15:54 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso16255289oop.13; 
 Sun, 06 Mar 2022 20:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fZduwXnxuJ/vSjfMJzHGlc4JezeKXyTHf095cmJFp3c=;
 b=Munbd07gbQ4vugFaK5PvY1spkiHxo3+Ovt6zICkfY24VuJ2l9UtZlwiajyJc2gwFFb
 SeNq6IVOaQjLUZrlnKMhMhqJaWc6uiTRgJbg9OFjD1H50cRyfKb4QNS3mTpvs49thB7V
 9CXVNvDFGWip8nqDCVSlrxI2gdCRIcKIs/BtROgXh5n0RUGakM6w7DzemBezWDWfIswf
 BMPOCK1jFQfl/e7VGxqWnngg/9M0Do+7FP4AgGpwYAjAyoFsvyUAlPWBu4tepbapS7TJ
 wfmq+pizAYCQf8DaFc6k5XrbuEjhkzPI5HhfER4jwKtU8Sp7/2IqsgOpRTK4q0s/FUrB
 emzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fZduwXnxuJ/vSjfMJzHGlc4JezeKXyTHf095cmJFp3c=;
 b=Bonhn0h/E40OQmjuJyOLdt0y/J/hE4JJL9Nrc5o5j+zVjvgw0iTGMYAS9MgouTwHqh
 2nHDRLQ6RF2jfF7P35l1HpvWaC1peQ9omGR3VCNxOxm2GqzmvgsDrELCluYriSgma5g5
 c6JN52U81jVJJHLPldC6lPkMqWCqcf7doqDmwpxo+2edep2xz3x9ahuX1I+mSZNMDDu6
 VydBL5lwc/zp6byUn3pyH5dvwVW9VL5hYsXObsVJzklrd/FsX3YWn1Lh0o8ifCDyktf8
 7KlzGPdxICVimEjmySEHUJbhn8Z/MHIVPiIf910V9zNwMlZJuYVouKKGbo+BFBXp3+IR
 G2cA==
X-Gm-Message-State: AOAM532bhG3d7jzPzGk8e43FgxFueMkaWDGwNm/8RoarwHIaNyurijju
 4wVxHx0UnV0L3bNRx0tbnXaIPpfVhrkj5lD7vF8=
X-Google-Smtp-Source: ABdhPJyzYkdTlIh8pBZsj16ggEuHuojUY+YVG+829mV3VYMYDa3JmwG6AZZ4LWqlJF/HmbMUnKC3vF6rXnsMFZ2jsCM=
X-Received: by 2002:a05:6870:4410:b0:da:38cc:e845 with SMTP id
 u16-20020a056870441000b000da38cce845mr2841776oah.88.1646626537026; Sun, 06
 Mar 2022 20:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-17-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-17-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 13:15:26 +0900
Message-ID: <CAMVc7JUGrh+AdX9D6Ui5WsSYujhVvw+Hig3davO6ya+R61LJ_Q@mail.gmail.com>
Subject: Re: [PATCH v7 16/22] configure: Pass filtered QEMU_OBJCFLAGS to meson
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Mon, Mar 7, 2022 at 8:19 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Filter unsupported Objective-C options, to avoid
> 'unknown-warning-option' warnings when using Clang:
>
>   [34/373] Compiling Objective-C object libcommon.fa.p/audio_coreaudio.m.=
o
>   warning: unknown warning option '-Wold-style-declaration'; did you mean=
 '-Wout-of-line-declaration'? [-Wunknown-warning-option]
>   warning: unknown warning option '-Wimplicit-fallthrough=3D2'; did you m=
ean '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>   2 warnings generated.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  configure   | 23 +++++++++++++++++++++++
>  meson.build |  6 +++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index e60156f90f..7d1f35603b 100755
> --- a/configure
> +++ b/configure
> @@ -77,6 +77,7 @@ TMPB=3D"qemu-conf"
>  TMPC=3D"${TMPDIR1}/${TMPB}.c"
>  TMPO=3D"${TMPDIR1}/${TMPB}.o"
>  TMPCXX=3D"${TMPDIR1}/${TMPB}.cxx"
> +TMPM=3D"${TMPDIR1}/${TMPB}.m"
>  TMPE=3D"${TMPDIR1}/${TMPB}.exe"
>
>  rm -f config.log
> @@ -148,6 +149,10 @@ do_cxx() {
>      do_compiler "$cxx" $CPU_CFLAGS "$@"
>  }
>
> +do_objc() {
> +    do_compiler "$objcc" $CPU_CFLAGS "$@"
> +}
> +
>  # Append $2 to the variable named $1, with space separation
>  add_to() {
>      eval $1=3D\${$1:+\"\$$1 \"}\$2
> @@ -1445,10 +1450,27 @@ cc_has_warning_flag() {
>      compile_prog "-Werror $optflag" ""
>  }
>
> +objcc_has_warning_flag() {
> +    cat > $TMPM <<EOF
> +int main(void) { return 0; }
> +EOF
> +
> +    # Use the positive sense of the flag when testing for -Wno-wombat
> +    # support (gcc will happily accept the -Wno- form of unknown
> +    # warning options).
> +    optflag=3D"$(echo $1 | sed -e 's/^-Wno-/-W/')"
> +    do_objc -Werror $optflag \
> +      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
> +      -o $TMPE $TMPM $QEMU_LDFLAGS
> +}
> +
>  for flag in $gcc_flags; do
>      if cc_has_warning_flag $flag ; then
>          QEMU_CFLAGS=3D"$QEMU_CFLAGS $flag"
>      fi
> +    if objcc_has_warning_flag $flag ; then
> +        QEMU_OBJCFLAGS=3D"$QEMU_OBJCFLAGS $flag"
> +    fi
>  done
>
>  if test "$stack_protector" !=3D "no"; then
> @@ -2990,6 +3012,7 @@ echo "LD=3D$ld" >> $config_host_mak
>  echo "CFLAGS_NOPIE=3D$CFLAGS_NOPIE" >> $config_host_mak
>  echo "QEMU_CFLAGS=3D$QEMU_CFLAGS" >> $config_host_mak
>  echo "QEMU_CXXFLAGS=3D$QEMU_CXXFLAGS" >> $config_host_mak
> +echo "QEMU_OBJCFLAGS=3D$QEMU_OBJCFLAGS" >> $config_host_mak
>  echo "GLIB_CFLAGS=3D$glib_cflags" >> $config_host_mak
>  echo "GLIB_LIBS=3D$glib_libs" >> $config_host_mak
>  echo "GLIB_VERSION=3D$(pkg-config --modversion glib-2.0)" >> $config_hos=
t_mak
> diff --git a/meson.build b/meson.build
> index 0d38b2e72a..a770e80a32 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -173,11 +173,13 @@ endif
>
>  qemu_cflags =3D config_host['QEMU_CFLAGS'].split()
>  qemu_cxxflags =3D config_host['QEMU_CXXFLAGS'].split()
> +qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
>  if get_option('gprof')
>    qemu_cflags +=3D ['-p']
>    qemu_cxxflags +=3D ['-p']
> +  qemu_objcflags +=3D ['-p']
>    qemu_ldflags +=3D ['-p']
>  endif
>
> @@ -216,8 +218,9 @@ if get_option('fuzzing')
>    endif
>  endif
>
> -add_global_arguments(qemu_cflags, native: false, language: ['c', 'objc']=
)
> +add_global_arguments(qemu_cflags, native: false, language: ['c'])
>  add_global_arguments(qemu_cxxflags, native: false, language: ['cpp'])
> +add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
>  add_global_link_arguments(qemu_ldflags, native: false, language: ['c', '=
cpp', 'objc'])
>
>  if targetos =3D=3D 'linux'
> @@ -3471,6 +3474,7 @@ if link_args.length() > 0
>  endif
>  summary_info +=3D {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
>  summary_info +=3D {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
> +summary_info +=3D {'QEMU_OBJCFLAGS':    config_host['QEMU_OBJCFLAGS']}
>  summary_info +=3D {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
>  summary_info +=3D {'profiler':          get_option('profiler')}
>  summary_info +=3D {'link-time optimization (LTO)': get_option('b_lto')}
> --
> 2.34.1
>

