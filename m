Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3904A8B64
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:18:13 +0100 (CET)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFggN-00069Z-L7
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nFgWk-0004Nr-LK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:08:15 -0500
Received: from [2a00:1450:4864:20::436] (port=45932
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nFgWi-0000l8-5E
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:08:14 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so6563509wrg.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W68T+eR7q61nzTV8bs3N5VjtSBjIvwGDac6osKtmdcs=;
 b=CGHLheS1Iou0U6T5ukZ5ezx52XvKesP7yqr7cCdPrWeWQcYKgX3tRACaaEiYcZqHlV
 ML334F5eZxcCXeH3aeEQl65CMVNBhZf9bc4uBggD6b5mau93AGI3bXyj6Exmmd7vhHBF
 TK94rubd4rFppeQcUxIIfzCOZ8JIc+dABgJM1rT+g0jldQwJCCzFSt0FWEAdLBFHbPbY
 pD+Afi2VrFD4Nyaf1rV1kNdL2yffT25IGjYnM4ahKh/Y7qXpOn4fTsrnI0Cc6OfcXb8X
 Bj5anqw6VJ0O1wII/v4E40xkJ8bB/oHFvkUYdXSnlyWeHRBWU9rj0OmgTOfoiP33z7iw
 1iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W68T+eR7q61nzTV8bs3N5VjtSBjIvwGDac6osKtmdcs=;
 b=E0oyTuFH+1Ijf86OOurslgCPjisXwFOktiCUlKLNmJjI5+cAZr36PpOvUJZxMZn79U
 ogluPXy1MsZupAJJ0viMdWF2MFBFDJrM2caO+vbdnvh0VLIC83kTtrEk5+wD+q3NUgKB
 2N7U2hMY8ZfFFAukmFhUcgkbwZmRYT6NKW5Tu4r7lx8d6QEzCgQI2fx+u2gE8H8crqoO
 fOFKQjiKjKCwyk7tX2xivnzWlhAKWWv33S31EGnuVt/9TfJAe8lk7eTbQGhQxhBlz6h7
 UGusfVjTxRPim7UI1w0DKF1GR+Hd3WWvkGdgBHrhD2UBltFEEfRhF9sDJIzUZx3I+WLI
 3VSQ==
X-Gm-Message-State: AOAM532wuYco5/Q3j2hKo53DhPdeQ0cBJoH9ZdxgMotvL+XCtspAY7Hk
 H/BJ7oXL0HQp/RvXxItdK5kl8SpFvD+9hbOxRQE=
X-Google-Smtp-Source: ABdhPJyuYrI3qt73dhSWa2mSCZnYZFKw9oJwNYN6oJEuqtdzPgn+KKyx2NugKJx93rGrsRnHuugohWQlYE84m9rGlto=
X-Received: by 2002:a5d:5552:: with SMTP id g18mr31125901wrw.343.1643911690630; 
 Thu, 03 Feb 2022 10:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-23-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-23-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 3 Feb 2022 22:07:58 +0400
Message-ID: <CAJ+F1CKM9UJwdp=0RsthoK2SuMEjR9=9ye5omxDAOWHLZR6b0A@mail.gmail.com>
Subject: Re: [PATCH 22/27] configure, meson: replace VSS SDK checks and
 options with --enable-vss-sdk
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005cbd5d05d72104d4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cbd5d05d72104d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 3, 2022 at 10:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The VSS headers are part of standard MS VS SDK, at least since version
> 15, and probably before that.
>
> They are also included with MinGW, although currently broken.
>
> Let's streamline a bit the options, by not making it so special, and
> instead rely on proper system headers configuration or user
> --extra-cxxflags. This still requires some extra step to cross-build
> with MinGW as described in the meson.build file now.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> [Use a "feature"-type option. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                     | 47 -----------------------------------
>  meson.build                   | 10 +++++++-
>  meson_options.txt             |  2 ++
>  qga/meson.build               | 21 ++++++++++++++--
>  scripts/meson-buildoptions.sh |  3 +++
>  5 files changed, 33 insertions(+), 50 deletions(-)
>
> diff --git a/configure b/configure
> index 3fb28891d3..f67088044f 100755
> --- a/configure
> +++ b/configure
> @@ -316,7 +316,6 @@ pkgversion=3D""
>  pie=3D""
>  trace_backends=3D"log"
>  trace_file=3D"trace"
> -vss_win32_sdk=3D"$default_feature"
>  coroutine=3D""
>  tls_priority=3D"NORMAL"
>  plugins=3D"$default_feature"
> @@ -952,12 +951,6 @@ for opt do
>    ;;
>    --disable-zlib-test)
>    ;;
> -  --with-vss-sdk) vss_win32_sdk=3D""
> -  ;;
> -  --with-vss-sdk=3D*) vss_win32_sdk=3D"$optarg"
> -  ;;
> -  --without-vss-sdk) vss_win32_sdk=3D"no"
> -  ;;
>    --disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane)
>        echo "$0: $opt is obsolete, virtio-blk data-plane is always on" >&=
2
>    ;;
> @@ -1234,8 +1227,6 @@ Advanced options (experts only):
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
>                             ucontext, sigaltstack, windows
>    --enable-gcov            enable test coverage analysis with gcov
> -  --with-vss-sdk=3DSDK-path  enable Windows VSS support in QEMU Guest Ag=
ent
> -  --with-win-sdk=3DSDK-path  path to Windows Platform SDK (to build VSS
> .tlb)
>    --tls-priority           default TLS protocol/cipher priority string
>    --enable-plugins
>                             enable plugins via shared library loading
> @@ -2298,41 +2289,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# check if we have VSS SDK headers for win
> -
> -guest_agent_with_vss=3D"no"
> -if test "$mingw32" =3D "yes" && \
> -        test "$vss_win32_sdk" !=3D "no" ; then
> -  case "$vss_win32_sdk" in
> -    "")   vss_win32_include=3D"-isystem $source_path" ;;
> -    *\ *) # The SDK is installed in "Program Files" by default, but we
> cannot
> -          # handle path with spaces. So we symlink the headers into
> ".sdk/vss".
> -          vss_win32_include=3D"-isystem $source_path/.sdk/vss"
> -         symlink "$vss_win32_sdk/inc" "$source_path/.sdk/vss/inc"
> -         ;;
> -    *)    vss_win32_include=3D"-isystem $vss_win32_sdk"
> -  esac
> -  cat > $TMPC << EOF
> -#define __MIDL_user_allocate_free_DEFINED__
> -#include <inc/win2003/vss.h>
> -int main(void) { return VSS_CTX_BACKUP; }
> -EOF
> -  if compile_prog "$vss_win32_include" "" ; then
> -    guest_agent_with_vss=3D"yes"
> -    QEMU_CFLAGS=3D"$QEMU_CFLAGS $vss_win32_include"
> -  else
> -    if test "$vss_win32_sdk" !=3D "" ; then
> -      echo "ERROR: Please download and install Microsoft VSS SDK:"
> -      echo "ERROR:
> http://www.microsoft.com/en-us/download/details.aspx?id=3D23490"
> -      echo "ERROR: On POSIX-systems, you can extract the SDK headers by:=
"
> -      echo "ERROR:   scripts/extract-vsssdk-headers setup.exe"
> -      echo "ERROR: The headers are extracted in the directory \`inc'."
> -      feature_not_found "VSS support"
> -    fi
> -  fi
> -fi
> -
>  ##########################################
>  # check if mingw environment provides a recent ntddscsi.h
>  guest_agent_ntddscsi=3D"no"
> @@ -2862,9 +2818,6 @@ if test "$debug_tcg" =3D "yes" ; then
>  fi
>  if test "$mingw32" =3D "yes" ; then
>    echo "CONFIG_WIN32=3Dy" >> $config_host_mak
> -  if test "$guest_agent_with_vss" =3D "yes" ; then
> -    echo "CONFIG_QGA_VSS=3Dy" >> $config_host_mak
> -  fi
>    if test "$guest_agent_ntddscsi" =3D "yes" ; then
>      echo "CONFIG_QGA_NTDDSCSI=3Dy" >> $config_host_mak
>    fi
> diff --git a/meson.build b/meson.build
> index e1667954b9..e3499a7e9a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1932,6 +1932,14 @@ config_host_data.set('CONFIG_AF_VSOCK',
> cc.compiles(gnu_source_prefix + '''
>      return -1;
>    }'''))
>
> +have_vss =3D false
> +if targetos =3D=3D 'windows' and link_language =3D=3D 'cpp'
> +  have_vss =3D cxx.compiles('''
> +    #define __MIDL_user_allocate_free_DEFINED__
> +    #include <inc/win2003/vss.h>
>

Please check <vss.h> instead, this is the standard header location.


> +    int main(void) { return VSS_CTX_BACKUP; }''')
> +endif
> +
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>      'HAVE_GDB_BIN']
>  arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
> @@ -3602,7 +3610,7 @@ summary_info +=3D {'libiscsi support':  libiscsi}
>  summary_info +=3D {'libnfs support':    libnfs}
>  if targetos =3D=3D 'windows'
>    if have_ga
> -    summary_info +=3D {'QGA VSS support':
>  config_host.has_key('CONFIG_QGA_VSS')}
> +    summary_info +=3D {'QGA VSS support':   have_qga_vss}
>      summary_info +=3D {'QGA w32 disk info':
> config_host.has_key('CONFIG_QGA_NTDDSCSI')}
>    endif
>  endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 417b543314..aad337592d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -42,6 +42,8 @@ option('guest_agent_msi', type : 'feature', value :
> 'auto',
>         description: 'Build MSI package for the QEMU Guest Agent')
>  option('tools', type : 'feature', value : 'auto',
>         description: 'build support utilities that come with QEMU')
> +option('qga_vss', type : 'feature', value: 'auto',
> +       description: 'build QGA VSS support (broken with MinGW)')
>
>  option('malloc_trim', type : 'feature', value : 'auto',
>         description: 'enable libc malloc_trim() for memory optimization')
> diff --git a/qga/meson.build b/qga/meson.build
> index 97cc391fe1..ca795f44fb 100644
> --- a/qga/meson.build
> +++ b/qga/meson.build
> @@ -2,9 +2,26 @@ if not have_ga
>    if get_option('guest_agent_msi').enabled()
>      error('Guest agent MSI requested, but the guest agent is not being
> built')
>    endif
> +  have_qga_vss =3D false
>    subdir_done()
>  endif
>
> +have_qga_vss =3D get_option('qga_vss') \
> +  .require(targetos =3D=3D 'windows',
> +           error_message: 'VSS support requires Windows') \
> +  .require(link_language =3D=3D 'cpp',
> +           error_message: 'VSS support requires a C++ compiler') \
> +  .require(have_vss, error_message: '''VSS support requires VSS headers.
> +    If your Visual Studio installation doesn't have the VSS headers,
> +    Please download and install Microsoft VSS SDK:
> +    http://www.microsoft.com/en-us/download/details.aspx?id=3D23490
> +    On POSIX-systems, MinGW doesn't yet provide working headers.
> +    you can extract the SDK headers by:
> +    $ scripts/extract-vsssdk-headers setup.exe
> +    The headers are extracted in the directory \`inc'.
>

inc/2003


> +    Then run configure with: --extra-cxxflags=3D"-isystem
> /path/to/vss/inc"''') \
>

 inc/2003

thanks

+  .allowed()
> +
>  all_qga =3D []
>
>  qga_qapi_outputs =3D [
> @@ -63,7 +80,7 @@ gen_tlb =3D []
>  qga_libs =3D []
>  if targetos =3D=3D 'windows'
>    qga_libs +=3D ['-lws2_32', '-lwinmm', '-lpowrprof', '-lwtsapi32',
> '-lwininet', '-liphlpapi', '-lnetapi32']
> -  if 'CONFIG_QGA_VSS' in config_host
> +  if have_qga_vss
>      qga_libs +=3D ['-lole32', '-loleaut32', '-lshlwapi', '-lstdc++',
> '-Wl,--enable-stdcall-fixup']
>      subdir('vss-win32')
>    endif
> @@ -93,7 +110,7 @@ if targetos =3D=3D 'windows'
>    if wixl.found()
>      deps =3D [gen_tlb, qga]
>      qemu_ga_msi_vss =3D []
> -    if 'CONFIG_QGA_VSS' in config_host
> +    if have_qga_vss
>        qemu_ga_msi_vss =3D ['-D', 'InstallVss']
>        deps +=3D qga_vss
>      endif
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 895d8310b4..23de2a6c62 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -20,6 +20,7 @@ meson_options_help() {
>    printf "%s\n" '  --enable-malloc=3DCHOICE   choose memory allocator to
> use [system] (choices:'
>    printf "%s\n" '                           jemalloc/system/tcmalloc)'
>    printf "%s\n" '  --enable-profiler        profiler support'
> +  printf "%s\n" '  --enable-qga-vss         build QGA VSS support'
>    printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
>    printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using
> /dev/(u)random and'
>    printf "%s\n" '                           getrandom()'
> @@ -288,6 +289,8 @@ _meson_option_parse() {
>      --disable-qcow1) printf "%s" -Dqcow1=3Ddisabled ;;
>      --enable-qed) printf "%s" -Dqed=3Denabled ;;
>      --disable-qed) printf "%s" -Dqed=3Ddisabled ;;
> +    --enable-qga-vss) printf "%s" -Dqga_vss=3Denabled ;;
> +    --disable-qga-vss) printf "%s" -Dqga_vss=3Ddisabled ;;
>      --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=3Dtrue ;;
>      --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=3Dfalse ;;
>      --enable-rbd) printf "%s" -Drbd=3Denabled ;;
> --
> 2.34.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005cbd5d05d72104d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 3, 2022 at 10:02 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The VSS headers are part of standard MS VS SDK, at least since version<br>
15, and probably before that.<br>
<br>
They are also included with MinGW, although currently broken.<br>
<br>
Let&#39;s streamline a bit the options, by not making it so special, and<br=
>
instead rely on proper system headers configuration or user<br>
--extra-cxxflags. This still requires some extra step to cross-build<br>
with MinGW as described in the meson.build file now.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
[Use a &quot;feature&quot;-type option. - Paolo]<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 47 -----------------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 +++++++-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 21 ++++++++++++++--<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
=C2=A05 files changed, 33 insertions(+), 50 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 3fb28891d3..f67088044f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -316,7 +316,6 @@ pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
=C2=A0trace_backends=3D&quot;log&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
-vss_win32_sdk=3D&quot;$default_feature&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
@@ -952,12 +951,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-zlib-test)<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --with-vss-sdk) vss_win32_sdk=3D&quot;&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --with-vss-sdk=3D*) vss_win32_sdk=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --without-vss-sdk) vss_win32_sdk=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-virtio-blk-data-plane|--enable-virtio-blk-data-plane=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, virtio-blk data=
-plane is always on&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0;;<br>
@@ -1234,8 +1227,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--with-coroutine=3DBACKEND coroutine backend. Supported option=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ucontext, sigaltstack, windows<br>
=C2=A0 =C2=A0--enable-gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable =
test coverage analysis with gcov<br>
-=C2=A0 --with-vss-sdk=3DSDK-path=C2=A0 enable Windows VSS support in QEMU =
Guest Agent<br>
-=C2=A0 --with-win-sdk=3DSDK-path=C2=A0 path to Windows Platform SDK (to bu=
ild VSS .tlb)<br>
=C2=A0 =C2=A0--tls-priority=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default=
 TLS protocol/cipher priority string<br>
=C2=A0 =C2=A0--enable-plugins<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 enable plugins via shared library loading<br>
@@ -2298,41 +2289,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# check if we have VSS SDK headers for win<br>
-<br>
-guest_agent_with_vss=3D&quot;no&quot;<br>
-if test &quot;$mingw32&quot; =3D &quot;yes&quot; &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 test &quot;$vss_win32_sdk&quot; !=3D &quot;no&=
quot; ; then<br>
-=C2=A0 case &quot;$vss_win32_sdk&quot; in<br>
-=C2=A0 =C2=A0 &quot;&quot;)=C2=A0 =C2=A0vss_win32_include=3D&quot;-isystem=
 $source_path&quot; ;;<br>
-=C2=A0 =C2=A0 *\ *) # The SDK is installed in &quot;Program Files&quot; by=
 default, but we cannot<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # handle path with spaces. So we symlin=
k the headers into &quot;.sdk/vss&quot;.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vss_win32_include=3D&quot;-isystem $sou=
rce_path/.sdk/vss&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symlink &quot;$vss_win32_sdk/inc&quot; &=
quot;$source_path/.sdk/vss/inc&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 *)=C2=A0 =C2=A0 vss_win32_include=3D&quot;-isystem $vss_win3=
2_sdk&quot;<br>
-=C2=A0 esac<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#define __MIDL_user_allocate_free_DEFINED__<br>
-#include &lt;inc/win2003/vss.h&gt;<br>
-int main(void) { return VSS_CTX_BACKUP; }<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;$vss_win32_include&quot; &quot;&quot; ; then<=
br>
-=C2=A0 =C2=A0 guest_agent_with_vss=3D&quot;yes&quot;<br>
-=C2=A0 =C2=A0 QEMU_CFLAGS=3D&quot;$QEMU_CFLAGS $vss_win32_include&quot;<br=
>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 if test &quot;$vss_win32_sdk&quot; !=3D &quot;&quot; ; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: Please download and install Microso=
ft VSS SDK:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR:=C2=A0 =C2=A0<a href=3D"http://www.m=
icrosoft.com/en-us/download/details.aspx?id=3D23490" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.microsoft.com/en-us/download/details.aspx?id=3D23=
490</a>&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: On POSIX-systems, you can extract t=
he SDK headers by:&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR:=C2=A0 =C2=A0scripts/extract-vsssdk-=
headers setup.exe&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: The headers are extracted in the di=
rectory \`inc&#39;.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 feature_not_found &quot;VSS support&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# check if mingw environment provides a recent ntddscsi.h<br>
=C2=A0guest_agent_ntddscsi=3D&quot;no&quot;<br>
@@ -2862,9 +2818,6 @@ if test &quot;$debug_tcg&quot; =3D &quot;yes&quot; ; =
then<br>
=C2=A0fi<br>
=C2=A0if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_WIN32=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
-=C2=A0 if test &quot;$guest_agent_with_vss&quot; =3D &quot;yes&quot; ; the=
n<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_QGA_VSS=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
-=C2=A0 fi<br>
=C2=A0 =C2=A0if test &quot;$guest_agent_ntddscsi&quot; =3D &quot;yes&quot; =
; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;CONFIG_QGA_NTDDSCSI=3Dy&quot; &gt;&gt; $conf=
ig_host_mak<br>
=C2=A0 =C2=A0fi<br>
diff --git a/meson.build b/meson.build<br>
index e1667954b9..e3499a7e9a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1932,6 +1932,14 @@ config_host_data.set(&#39;CONFIG_AF_VSOCK&#39;, cc.c=
ompiles(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0}&#39;&#39;&#39;))<br>
<br>
+have_vss =3D false<br>
+if targetos =3D=3D &#39;windows&#39; and link_language =3D=3D &#39;cpp&#39=
;<br>
+=C2=A0 have_vss =3D cxx.compiles(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #define __MIDL_user_allocate_free_DEFINED__<br>
+=C2=A0 =C2=A0 #include &lt;inc/win2003/vss.h&gt;<br></blockquote><div><br>=
</div><div>Please check &lt;vss.h&gt; instead, this is the standard header =
location.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 int main(void) { return VSS_CTX_BACKUP; }&#39;&#39;&#39;)<br=
>
+endif<br>
+<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-targ=
et<br>
=C2=A0 =C2=A0 =C2=A0&#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_W=
HITELIST&#39;]<br>
@@ -3602,7 +3610,7 @@ summary_info +=3D {&#39;libiscsi support&#39;:=C2=A0 =
libiscsi}<br>
=C2=A0summary_info +=3D {&#39;libnfs support&#39;:=C2=A0 =C2=A0 libnfs}<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0if have_ga<br>
-=C2=A0 =C2=A0 summary_info +=3D {&#39;QGA VSS support&#39;:=C2=A0 =C2=A0co=
nfig_host.has_key(&#39;CONFIG_QGA_VSS&#39;)}<br>
+=C2=A0 =C2=A0 summary_info +=3D {&#39;QGA VSS support&#39;:=C2=A0 =C2=A0ha=
ve_qga_vss}<br>
=C2=A0 =C2=A0 =C2=A0summary_info +=3D {&#39;QGA w32 disk info&#39;: config_=
host.has_key(&#39;CONFIG_QGA_NTDDSCSI&#39;)}<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 417b543314..aad337592d 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -42,6 +42,8 @@ option(&#39;guest_agent_msi&#39;, type : &#39;feature&#39=
;, value : &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Build MSI package for the QEM=
U Guest Agent&#39;)<br>
=C2=A0option(&#39;tools&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build support utilities that =
come with QEMU&#39;)<br>
+option(&#39;qga_vss&#39;, type : &#39;feature&#39;, value: &#39;auto&#39;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;build QGA VSS support (broken=
 with MinGW)&#39;)<br>
<br>
=C2=A0option(&#39;malloc_trim&#39;, type : &#39;feature&#39;, value : &#39;=
auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;enable libc malloc_trim() for=
 memory optimization&#39;)<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 97cc391fe1..ca795f44fb 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -2,9 +2,26 @@ if not have_ga<br>
=C2=A0 =C2=A0if get_option(&#39;guest_agent_msi&#39;).enabled()<br>
=C2=A0 =C2=A0 =C2=A0error(&#39;Guest agent MSI requested, but the guest age=
nt is not being built&#39;)<br>
=C2=A0 =C2=A0endif<br>
+=C2=A0 have_qga_vss =3D false<br>
=C2=A0 =C2=A0subdir_done()<br>
=C2=A0endif<br>
<br>
+have_qga_vss =3D get_option(&#39;qga_vss&#39;) \<br>
+=C2=A0 .require(targetos =3D=3D &#39;windows&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;VSS support r=
equires Windows&#39;) \<br>
+=C2=A0 .require(link_language =3D=3D &#39;cpp&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;VSS support r=
equires a C++ compiler&#39;) \<br>
+=C2=A0 .require(have_vss, error_message: &#39;&#39;&#39;VSS support requir=
es VSS headers.<br>
+=C2=A0 =C2=A0 If your Visual Studio installation doesn&#39;t have the VSS =
headers,<br>
+=C2=A0 =C2=A0 Please download and install Microsoft VSS SDK:<br>
+=C2=A0 =C2=A0 <a href=3D"http://www.microsoft.com/en-us/download/details.a=
spx?id=3D23490" rel=3D"noreferrer" target=3D"_blank">http://www.microsoft.c=
om/en-us/download/details.aspx?id=3D23490</a><br>
+=C2=A0 =C2=A0 On POSIX-systems, MinGW doesn&#39;t yet provide working head=
ers.<br>
+=C2=A0 =C2=A0 you can extract the SDK headers by:<br>
+=C2=A0 =C2=A0 $ scripts/extract-vsssdk-headers setup.exe<br>
+=C2=A0 =C2=A0 The headers are extracted in the directory \`inc&#39;.<br></=
blockquote><div><br></div><div>inc/2003<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 Then run configure with: --extra-cxxflags=3D&quot;-isystem /=
path/to/vss/inc&quot;&#39;&#39;&#39;) \<br></blockquote><div><br></div><div=
>=C2=A0inc/2003</div><div><br></div><div>thanks</div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 .allowed()<br>
+<br>
=C2=A0all_qga =3D []<br>
<br>
=C2=A0qga_qapi_outputs =3D [<br>
@@ -63,7 +80,7 @@ gen_tlb =3D []<br>
=C2=A0qga_libs =3D []<br>
=C2=A0if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0qga_libs +=3D [&#39;-lws2_32&#39;, &#39;-lwinmm&#39;, &#39;-lp=
owrprof&#39;, &#39;-lwtsapi32&#39;, &#39;-lwininet&#39;, &#39;-liphlpapi&#3=
9;, &#39;-lnetapi32&#39;]<br>
-=C2=A0 if &#39;CONFIG_QGA_VSS&#39; in config_host<br>
+=C2=A0 if have_qga_vss<br>
=C2=A0 =C2=A0 =C2=A0qga_libs +=3D [&#39;-lole32&#39;, &#39;-loleaut32&#39;,=
 &#39;-lshlwapi&#39;, &#39;-lstdc++&#39;, &#39;-Wl,--enable-stdcall-fixup&#=
39;]<br>
=C2=A0 =C2=A0 =C2=A0subdir(&#39;vss-win32&#39;)<br>
=C2=A0 =C2=A0endif<br>
@@ -93,7 +110,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0if wixl.found()<br>
=C2=A0 =C2=A0 =C2=A0deps =3D [gen_tlb, qga]<br>
=C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss =3D []<br>
-=C2=A0 =C2=A0 if &#39;CONFIG_QGA_VSS&#39; in config_host<br>
+=C2=A0 =C2=A0 if have_qga_vss<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss =3D [&#39;-D&#39;, &#39;InstallV=
ss&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D qga_vss<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 895d8310b4..23de2a6c62 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -20,6 +20,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-malloc=3DCHOICE=
=C2=A0 =C2=A0choose memory allocator to use [system] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc/=
system/tcmalloc)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-profiler=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 profiler support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-qga-vss=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0build QGA VSS support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-qom-cast-debug=C2=
=A0 cast debugging support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-rng-none=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 dummy RNG, avoid using /dev/(u)random and&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getrandom=
()&#39;<br>
@@ -288,6 +289,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-qcow1) printf &quot;%s&quot; -Dqcow1=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qed) printf &quot;%s&quot; -Dqed=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-qed) printf &quot;%s&quot; -Dqed=3Ddisabled ;=
;<br>
+=C2=A0 =C2=A0 --enable-qga-vss) printf &quot;%s&quot; -Dqga_vss=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-qga-vss) printf &quot;%s&quot; -Dqga_vss=3Ddisable=
d ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-qom-cast-debug) printf &quot;%s&quot; -Dqom_ca=
st_debug=3Dtrue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-qom-cast-debug) printf &quot;%s&quot; -Dqom_c=
ast_debug=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-rbd) printf &quot;%s&quot; -Drbd=3Denabled ;;<=
br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005cbd5d05d72104d4--

