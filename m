Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E2509079
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:29:09 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhG0i-0001X1-1h
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEzF-0002PZ-Tg
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:23:37 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEzD-0003ik-Ap
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:23:33 -0400
Received: by mail-qk1-x72b.google.com with SMTP id j9so1880035qkg.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NRq6tLIGZEWHSWCQpobRWL3oSxjNP0dRarHUhr4jdNM=;
 b=WL2B3zVF7fIYAV4l9N4E+CmyqoAw2SuCV74HguMuHiYqYyjXe0LsD1KN7rnb8s8EVy
 JuMMqa3LQxBxe9qrIEqD6bYnZsFbCMnoVTh8orqMUshxXG4Bf5WrNsadc+My2QIiKVyE
 a4U7YNGN3VuSc1DhXtDdTuhWu6Cpk+4V1qW7IX1hvNK3Z+yXEPWPCAI5B2I6h3OJR2ej
 ZiHVobmVbnPiewPXmefST8TNh/sOkbyYJRmR4TksZ9cSzLWYgdwYZ0iR23izxcu5pb02
 AZdF+6hRhKQQ1K1qnOM9pkdwPnh+vYxf4xi/JbP83IAIGs5cKx0fTAyrLU8r+AF4GSQw
 m7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NRq6tLIGZEWHSWCQpobRWL3oSxjNP0dRarHUhr4jdNM=;
 b=Qt5efTYdAifvX0DdZDK69WAPVXiQ6dI2S5bdU1Bces8wBOSoaM1y8yemxWCh4WyTW8
 DC6mtkspX79zkVkuZnT468HyazIz/HJBMLT3mORsQLlaoMQpJ7RG17Hm6cOqSouBJpPw
 DN+bu1Ju6IszJTzq8w/gfXF5awNX9fUohbl+8tibjgy0gjNStEB0ESlRFUaIxsVYQ/eI
 DOK7/nS8/FTTJCvfZ916uh3JDheTA+8/PTQUbPUQWmIw19TqjuK1Pz2G8w92yCvI3R+X
 0La1B8DwnihD4Gzmuh759p261dY88pPJCyjaM77GBzrmihJWxU7onc/cuKBFdiK8WO5T
 CACA==
X-Gm-Message-State: AOAM5317Scy2pY24FimFUeXM+coipRtjkkiWTTqN2LLNvRDTxYSbcwtR
 dDblAHM8UyukGu6rtk5OLrhyav/VEao7FNiOA7nB25/zzht1YA==
X-Google-Smtp-Source: ABdhPJx5fx8LmJvWDjjunRgakbPmTjX783tnceI6TFeMfFin3ALxrVg8s0tEWP2oIQk6eQaSUNAy4X7r8feiRsSRT7U=
X-Received: by 2002:a05:620a:2415:b0:69e:784d:3a4c with SMTP id
 d21-20020a05620a241500b0069e784d3a4cmr12579073qkn.14.1650479010248; Wed, 20
 Apr 2022 11:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-19-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-19-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:23:17 +0400
Message-ID: <CAJ+F1CL1HrNEXx32yqxVsLrVhz+CEJv-VqsQ=6wWvE7-uFrzVQ@mail.gmail.com>
Subject: Re: [PATCH 18/34] configure: switch string options to automatic
 parsing
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001d7b3005dd1a1726"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x72b.google.com
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

--0000000000001d7b3005dd1a1726
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 8:03 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure                     | 24 +-----------------------
>  scripts/meson-buildoptions.py |  5 +----
>  scripts/meson-buildoptions.sh |  9 +++++++++
>  3 files changed, 11 insertions(+), 27 deletions(-)
>
> diff --git a/configure b/configure
> index 87ceb33917..8f34f2a061 100755
> --- a/configure
> +++ b/configure
> @@ -231,12 +231,10 @@ fi
>
>  # default parameters
>  cpu=3D""
> -iasl=3D"iasl"
>  interp_prefix=3D"/usr/gnemul/qemu-%M"
>  static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
> -audio_drv_list=3D"default"
>  block_drv_rw_whitelist=3D""
>  block_drv_ro_whitelist=3D""
>  host_cc=3D"cc"
> @@ -312,7 +310,6 @@ linux_user=3D""
>  bsd_user=3D""
>  pkgversion=3D""
>  pie=3D""
> -trace_file=3D"trace"
>  coroutine=3D""
>  tls_priority=3D"NORMAL"
>  plugins=3D"$default_feature"
> @@ -713,8 +710,6 @@ for opt do
>    ;;
>    --cxx=3D*)
>    ;;
> -  --iasl=3D*) iasl=3D"$optarg"
> -  ;;
>    --objcc=3D*) objcc=3D"$optarg"
>    ;;
>    --make=3D*) make=3D"$optarg"
> @@ -723,8 +718,6 @@ for opt do
>    ;;
>    --python=3D*) python=3D"$optarg" ; explicit_python=3Dyes
>    ;;
> -  --sphinx-build=3D*) sphinx_build=3D"$optarg"
> -  ;;
>    --skip-meson) skip_meson=3Dyes
>    ;;
>    --meson=3D*) meson=3D"$optarg"
> @@ -765,8 +758,6 @@ for opt do
>                         error_exit "Can't mix --target-list-exclude with
> --target-list"
>                     fi
>    ;;
> -  --with-trace-file=3D*) trace_file=3D"$optarg"
> -  ;;
>    --with-default-devices) default_devices=3D"true"
>    ;;
>    --without-default-devices) default_devices=3D"false"
> @@ -825,8 +816,6 @@ for opt do
>      # configure to be used by RPM and similar macros that set
>      # lots of directory switches by default.
>    ;;
> -  --audio-drv-list=3D*) audio_drv_list=3D"$optarg"
> -  ;;
>    --block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*)
> block_drv_rw_whitelist=3D$(echo "$optarg" | sed -e 's/,/ /g')
>    ;;
>    --block-drv-ro-whitelist=3D*) block_drv_ro_whitelist=3D$(echo "$optarg=
" |
> sed -e 's/,/ /g')
> @@ -1000,12 +989,7 @@ for opt do
>    --enable-jemalloc) meson_option_parse --enable-malloc=3Djemalloc jemal=
loc
>    ;;
>    # everything else has the same name in configure and meson
> -  --enable-* | --disable-*) meson_option_parse "$opt" "$optarg"
> -  ;;
> -  *)
> -      echo "ERROR: unknown option $opt"
> -      echo "Try '$0 --help' for more information"
> -      exit 1
> +  --*) meson_option_parse "$opt" "$optarg"
>    ;;
>    esac
>  done
> @@ -1128,7 +1112,6 @@ $(echo Available targets: $default_target_list | \
>  Advanced options (experts only):
>    --cross-prefix=3DPREFIX    use PREFIX for compile tools, PREFIX can be
> blank [$cross_prefix]
>    --cc=3DCC                  use C compiler CC [$cc]
> -  --iasl=3DIASL              use ACPI compiler IASL [$iasl]
>    --host-cc=3DCC             use C compiler CC [$host_cc] for code run a=
t
>                             build time
>    --cxx=3DCXX                use C++ compiler CXX [$cxx]
> @@ -1141,7 +1124,6 @@ Advanced options (experts only):
>    --cross-cc-cflags-ARCH=3D  use compiler flags when building ARCH guest
> tests
>    --make=3DMAKE              use specified make [$make]
>    --python=3DPYTHON          use specified python [$python]
> -  --sphinx-build=3DSPHINX    use specified sphinx-build [$sphinx_build]
>    --meson=3DMESON            use specified meson [$meson]
>    --ninja=3DNINJA            use specified ninja [$ninja]
>    --smbd=3DSMBD              use specified smbd [$smbd]
> @@ -2484,15 +2466,11 @@ if test "$skip_meson" =3D no; then
>          --sysconfdir "$sysconfdir" \
>          --localedir "$localedir" \
>          --localstatedir "$local_statedir" \
> -        -Daudio_drv_list=3D$audio_drv_list \
>          -Ddefault_devices=3D$default_devices \
>          -Ddocdir=3D"$docdir" \
> -        -Diasl=3D"$iasl" \
>          -Dqemu_firmwarepath=3D"$firmwarepath" \
>          -Dqemu_suffix=3D"$qemu_suffix" \
>          -Dsmbd=3D"$smbd" \
> -        -Dsphinx_build=3D"$sphinx_build" \
> -        -Dtrace_file=3D"$trace_file" \
>          -Doptimization=3D$(if test "$debug" =3D yes; then echo 0; else e=
cho
> 2; fi) \
>          -Ddebug=3D$(if test "$debug_info" =3D yes; then echo true; else =
echo
> false; fi) \
>          -Dwerror=3D$(if test "$werror" =3D yes; then echo true; else ech=
o
> false; fi) \
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 4af8d6e732..3e540e8bb3 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -26,21 +26,18 @@
>  import sys
>
>  SKIP_OPTIONS =3D {
> -    "audio_drv_list",
>      "default_devices",
>      "docdir",
>      "fuzzing_engine",
> -    "iasl",
>      "qemu_firmwarepath",
>      "qemu_suffix",
>      "smbd",
> -    "sphinx_build",
> -    "trace_file",
>  }
>
>  OPTION_NAMES =3D {
>      "malloc": "enable-malloc",
>      "trace_backends": "enable-trace-backends",
> +    "trace_file": "with-trace-file",
>  }
>
>  BUILTIN_OPTIONS =3D {
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 5a06b7915c..63f2f1abcf 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,5 +1,7 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> +  printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices:'
> +  printf "%s\n" '
>  alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
>    printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better
> performance)'
>    printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
> @@ -32,6 +34,9 @@ meson_options_help() {
>    printf "%s\n" '  --enable-trace-backends=3DCHOICES'
>    printf "%s\n" '                           Set available tracing
> backends [log] (choices:'
>    printf "%s\n" '
>  dtrace/ftrace/log/nop/simple/syslog/ust)'
> +  printf "%s\n" '  --iasl=3DVALUE             Path to ACPI disassembler'
> +  printf "%s\n" '  --sphinx-build=3DVALUE     Use specified sphinx-build
> for building document'
> +  printf "%s\n" '  --with-trace-file=3DVALUE  Trace file prefix for simp=
le
> backend [trace]'
>    printf "%s\n" ''
>    printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
>    printf "%s\n" 'disabled with --disable-FEATURE, default is enabled if
> available'
> @@ -147,6 +152,7 @@ _meson_option_parse() {
>      --disable-alsa) printf "%s" -Dalsa=3Ddisabled ;;
>      --enable-attr) printf "%s" -Dattr=3Denabled ;;
>      --disable-attr) printf "%s" -Dattr=3Ddisabled ;;
> +    --audio-drv-list=3D*) quote_sh "-Daudio_drv_list=3D$2" ;;
>      --enable-auth-pam) printf "%s" -Dauth_pam=3Denabled ;;
>      --disable-auth-pam) printf "%s" -Dauth_pam=3Ddisabled ;;
>      --enable-avx2) printf "%s" -Davx2=3Denabled ;;
> @@ -229,6 +235,7 @@ _meson_option_parse() {
>      --disable-hax) printf "%s" -Dhax=3Ddisabled ;;
>      --enable-hvf) printf "%s" -Dhvf=3Denabled ;;
>      --disable-hvf) printf "%s" -Dhvf=3Ddisabled ;;
> +    --iasl=3D*) quote_sh "-Diasl=3D$2" ;;
>      --enable-iconv) printf "%s" -Diconv=3Denabled ;;
>      --disable-iconv) printf "%s" -Diconv=3Ddisabled ;;
>      --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
> @@ -331,6 +338,7 @@ _meson_option_parse() {
>      --disable-snappy) printf "%s" -Dsnappy=3Ddisabled ;;
>      --enable-sparse) printf "%s" -Dsparse=3Denabled ;;
>      --disable-sparse) printf "%s" -Dsparse=3Ddisabled ;;
> +    --sphinx-build=3D*) quote_sh "-Dsphinx_build=3D$2" ;;
>      --enable-spice) printf "%s" -Dspice=3Denabled ;;
>      --disable-spice) printf "%s" -Dspice=3Ddisabled ;;
>      --enable-spice-protocol) printf "%s" -Dspice_protocol=3Denabled ;;
> @@ -346,6 +354,7 @@ _meson_option_parse() {
>      --enable-tpm) printf "%s" -Dtpm=3Denabled ;;
>      --disable-tpm) printf "%s" -Dtpm=3Ddisabled ;;
>      --enable-trace-backends=3D*) quote_sh "-Dtrace_backends=3D$2" ;;
> +    --with-trace-file=3D*) quote_sh "-Dtrace_file=3D$2" ;;
>      --enable-u2f) printf "%s" -Du2f=3Denabled ;;
>      --disable-u2f) printf "%s" -Du2f=3Ddisabled ;;
>      --enable-usb-redir) printf "%s" -Dusb_redir=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001d7b3005dd1a1726
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:03 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 24 +-----------------------<br>
=C2=A0scripts/meson-buildoptions.py |=C2=A0 5 +----<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 9 +++++++++<br>
=C2=A03 files changed, 11 insertions(+), 27 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 87ceb33917..8f34f2a061 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -231,12 +231,10 @@ fi<br>
<br>
=C2=A0# default parameters<br>
=C2=A0cpu=3D&quot;&quot;<br>
-iasl=3D&quot;iasl&quot;<br>
=C2=A0interp_prefix=3D&quot;/usr/gnemul/qemu-%M&quot;<br>
=C2=A0static=3D&quot;no&quot;<br>
=C2=A0cross_compile=3D&quot;no&quot;<br>
=C2=A0cross_prefix=3D&quot;&quot;<br>
-audio_drv_list=3D&quot;default&quot;<br>
=C2=A0block_drv_rw_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_ro_whitelist=3D&quot;&quot;<br>
=C2=A0host_cc=3D&quot;cc&quot;<br>
@@ -312,7 +310,6 @@ linux_user=3D&quot;&quot;<br>
=C2=A0bsd_user=3D&quot;&quot;<br>
=C2=A0pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
-trace_file=3D&quot;trace&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
@@ -713,8 +710,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--cxx=3D*)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --iasl=3D*) iasl=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--objcc=3D*) objcc=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--make=3D*) make=3D&quot;$optarg&quot;<br>
@@ -723,8 +718,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--python=3D*) python=3D&quot;$optarg&quot; ; explicit_python=
=3Dyes<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --sphinx-build=3D*) sphinx_build=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--skip-meson) skip_meson=3Dyes<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--meson=3D*) meson=3D&quot;$optarg&quot;<br>
@@ -765,8 +758,6 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 error_exit &quot;Can&#39;t mix --target-list-exclude with --targ=
et-list&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br=
>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-trace-file=3D*) trace_file=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--with-default-devices) default_devices=3D&quot;true&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--without-default-devices) default_devices=3D&quot;false&quot;=
<br>
@@ -825,8 +816,6 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0# configure to be used by RPM and similar macros that s=
et<br>
=C2=A0 =C2=A0 =C2=A0# lots of directory switches by default.<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --audio-drv-list=3D*) audio_drv_list=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*) block_=
drv_rw_whitelist=3D$(echo &quot;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<b=
r>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--block-drv-ro-whitelist=3D*) block_drv_ro_whitelist=3D$(echo =
&quot;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<br>
@@ -1000,12 +989,7 @@ for opt do<br>
=C2=A0 =C2=A0--enable-jemalloc) meson_option_parse --enable-malloc=3Djemall=
oc jemalloc<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0# everything else has the same name in configure and meson<br>
-=C2=A0 --enable-* | --disable-*) meson_option_parse &quot;$opt&quot; &quot=
;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: unknown option $opt&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;Try &#39;$0 --help&#39; for more informati=
on&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+=C2=A0 --*) meson_option_parse &quot;$opt&quot; &quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0esac<br>
=C2=A0done<br>
@@ -1128,7 +1112,6 @@ $(echo Available targets: $default_target_list | \<br=
>
=C2=A0Advanced options (experts only):<br>
=C2=A0 =C2=A0--cross-prefix=3DPREFIX=C2=A0 =C2=A0 use PREFIX for compile to=
ols, PREFIX can be blank [$cross_prefix]<br>
=C2=A0 =C2=A0--cc=3DCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 use C compiler CC [$cc]<br>
-=C2=A0 --iasl=3DIASL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use A=
CPI compiler IASL [$iasl]<br>
=C2=A0 =C2=A0--host-cc=3DCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
use C compiler CC [$host_cc] for code run at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 build time<br>
=C2=A0 =C2=A0--cxx=3DCXX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 use C++ compiler CXX [$cxx]<br>
@@ -1141,7 +1124,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--cross-cc-cflags-ARCH=3D=C2=A0 use compiler flags when buildi=
ng ARCH guest tests<br>
=C2=A0 =C2=A0--make=3DMAKE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
use specified make [$make]<br>
=C2=A0 =C2=A0--python=3DPYTHON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use specif=
ied python [$python]<br>
-=C2=A0 --sphinx-build=3DSPHINX=C2=A0 =C2=A0 use specified sphinx-build [$s=
phinx_build]<br>
=C2=A0 =C2=A0--meson=3DMESON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use s=
pecified meson [$meson]<br>
=C2=A0 =C2=A0--ninja=3DNINJA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use s=
pecified ninja [$ninja]<br>
=C2=A0 =C2=A0--smbd=3DSMBD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
use specified smbd [$smbd]<br>
@@ -2484,15 +2466,11 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--sysconfdir &quot;$sysconfdir&quot; \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--localedir &quot;$localedir&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--localstatedir &quot;$local_statedir&quo=
t; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Daudio_drv_list=3D$audio_drv_list \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddefault_devices=3D$default_devices \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddocdir=3D&quot;$docdir&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Diasl=3D&quot;$iasl&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_firmwarepath=3D&quot;$firmwarepath=
&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dqemu_suffix=3D&quot;$qemu_suffix&quot; =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsmbd=3D&quot;$smbd&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dsphinx_build=3D&quot;$sphinx_build&quot; \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dtrace_file=3D&quot;$trace_file&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Doptimization=3D$(if test &quot;$debug&q=
uot; =3D yes; then echo 0; else echo 2; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Ddebug=3D$(if test &quot;$debug_info&quo=
t; =3D yes; then echo true; else echo false; fi) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dwerror=3D$(if test &quot;$werror&quot; =
=3D yes; then echo true; else echo false; fi) \<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 4af8d6e732..3e540e8bb3 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -26,21 +26,18 @@<br>
=C2=A0import sys<br>
<br>
=C2=A0SKIP_OPTIONS =3D {<br>
-=C2=A0 =C2=A0 &quot;audio_drv_list&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;default_devices&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;docdir&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;fuzzing_engine&quot;,<br>
-=C2=A0 =C2=A0 &quot;iasl&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;qemu_firmwarepath&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;qemu_suffix&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;smbd&quot;,<br>
-=C2=A0 =C2=A0 &quot;sphinx_build&quot;,<br>
-=C2=A0 =C2=A0 &quot;trace_file&quot;,<br>
=C2=A0}<br>
<br>
=C2=A0OPTION_NAMES =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;malloc&quot;: &quot;enable-malloc&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_backends&quot;: &quot;enable-trace-backends=
&quot;,<br>
+=C2=A0 =C2=A0 &quot;trace_file&quot;: &quot;with-trace-file&quot;,<br>
=C2=A0}<br>
<br>
=C2=A0BUILTIN_OPTIONS =3D {<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 5a06b7915c..63f2f1abcf 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -1,5 +1,7 @@<br>
=C2=A0# This file is generated by meson-buildoptions.py, do not edit!<br>
=C2=A0meson_options_help() {<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES Set =
audio driver list [default] (choices:&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alsa/coreaudio/d=
efault/dsound/jack/oss/pa/sdl)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-coroutine-pool c=
oroutine freelist (better performance)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=
=A0 install provided firmware blobs&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-block-drv-whiteli=
st-in-tools&#39;<br>
@@ -32,6 +34,9 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-trace-backends=3D=
CHOICES&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set avail=
able tracing backends [log] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtrace/ft=
race/log/nop/simple/syslog/ust)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --iasl=3DVALUE=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Path to ACPI disassembler&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --sphinx-build=3DVALUE=C2=A0 =
=C2=A0 =C2=A0Use specified sphinx-build for building document&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --with-trace-file=3DVALUE=C2=A0=
 Trace file prefix for simple backend [trace]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;Optional features, enabled with -=
-enable-FEATURE and&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;disabled with --disable-FEATURE, =
default is enabled if available&#39;<br>
@@ -147,6 +152,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-alsa) printf &quot;%s&quot; -Dalsa=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-attr) printf &quot;%s&quot; -Dattr=3Denabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--disable-attr) printf &quot;%s&quot; -Dattr=3Ddisabled=
 ;;<br>
+=C2=A0 =C2=A0 --audio-drv-list=3D*) quote_sh &quot;-Daudio_drv_list=3D$2&q=
uot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-auth-pam) printf &quot;%s&quot; -Dauth_pam=3De=
nabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-auth-pam) printf &quot;%s&quot; -Dauth_pam=3D=
disabled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-avx2) printf &quot;%s&quot; -Davx2=3Denabled ;=
;<br>
@@ -229,6 +235,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-hax) printf &quot;%s&quot; -Dhax=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-hvf) printf &quot;%s&quot; -Dhvf=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-hvf) printf &quot;%s&quot; -Dhvf=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --iasl=3D*) quote_sh &quot;-Diasl=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-iconv) printf &quot;%s&quot; -Diconv=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-iconv) printf &quot;%s&quot; -Diconv=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-install-blobs) printf &quot;%s&quot; -Dinstall=
_blobs=3Dtrue ;;<br>
@@ -331,6 +338,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-snappy) printf &quot;%s&quot; -Dsnappy=3Ddisa=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-sparse) printf &quot;%s&quot; -Dsparse=3Denabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-sparse) printf &quot;%s&quot; -Dsparse=3Ddisa=
bled ;;<br>
+=C2=A0 =C2=A0 --sphinx-build=3D*) quote_sh &quot;-Dsphinx_build=3D$2&quot;=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-spice) printf &quot;%s&quot; -Dspice=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-spice) printf &quot;%s&quot; -Dspice=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-spice-protocol) printf &quot;%s&quot; -Dspice_=
protocol=3Denabled ;;<br>
@@ -346,6 +354,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--enable-tpm) printf &quot;%s&quot; -Dtpm=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-tpm) printf &quot;%s&quot; -Dtpm=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-trace-backends=3D*) quote_sh &quot;-Dtrace_bac=
kends=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --with-trace-file=3D*) quote_sh &quot;-Dtrace_file=3D$2&quot=
; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-u2f) printf &quot;%s&quot; -Du2f=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-u2f) printf &quot;%s&quot; -Du2f=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-usb-redir) printf &quot;%s&quot; -Dusb_redir=
=3Denabled ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001d7b3005dd1a1726--

