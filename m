Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC6D50905A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:24:22 +0200 (CEST)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFw4-0003Xm-TF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFGI-0000es-EG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:41:11 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhFGG-0006Qt-92
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:41:10 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id e17so1975230qvj.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cO2Za/MM5n0ueFkrYUtt2k/WoXnC1s6BsbQEHO6k0Eo=;
 b=hazMS161kCBqqTio2BHwdVRQVQa8I+t56QdOIklYzdoYVFehJquyxQIEgmiyvsFfss
 CEMCmUCkp475kI8gOSHWvnGz3LlV9OzzzmhhBZSoqP/jSspm8gVjdiRpVOgK7FnfnWsd
 S9m6UVOoHzJOY/xyUnKHrSXDNkMipVuwUz2ULLBpswGJNZqMEQYOqnJuUbYYrjDgGSXI
 CiRgPOi/bHS+lIlFm9VP4IB5gBJ+FV0hPYobuamL3flIHdeBh0a7bmztWUXgUq3rGNbU
 m6t/rKubA510sA6ppS8e/dIBG7yl/OHIEkL5gLNK6ktUNP88XIsyO7RqfQ6qcLwzuRbf
 +71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cO2Za/MM5n0ueFkrYUtt2k/WoXnC1s6BsbQEHO6k0Eo=;
 b=rEdfQi4UiNRXfrIA7at5eEd7DYqeSaq1kvsXoEIaBvMamwm5KrNihrha8rhCbU0Gwq
 MLDP6cA+AVZbIt2/bcHpZn7uKVxJZNSMke5Qe0PB7PRlmD4Fef2ucAkB3RI1KCFpSZlD
 9ITyZLUBg7s+nWZ1WCb4YdS+VPdNSSiC0m60Ym0oAZ8ARsxuRtTGVwNqBPOtFg7j91aR
 2r7wgqeN2Uqor0zZKu4jTQQQSKsTmm26Fyz9Zw/s2WEtD3/4uJ4XLvXYOzcS2R6/kHxi
 9GGUKHX5A1d5tfRdD16qEwYKGBRGLyCHNPdFFMi84x1wOvF3KmR6IsAGpDCAZo3nB4Qh
 p1ww==
X-Gm-Message-State: AOAM531qV+pFqdMvFlh2orFlNgM64tAoMa2OOJFYsYajedKdmOMREUlM
 CLOZk2W9/nPPIZPdaFDrbkLzjmoX1KSOFt9iJiVjP7WXezO77Q==
X-Google-Smtp-Source: ABdhPJwKg2agxUGhEI1RDItgW5zJ+EIWtLlzJi1vuyvh1cWIA/wAiolM6YepIvYUYINH+ZP6ma8igbJyJgFoR6vLVUI=
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id
 gv12-20020a056214262c00b00446346457cdmr16570496qvb.89.1650480067223; Wed, 20
 Apr 2022 11:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-23-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-23-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:40:55 +0400
Message-ID: <CAJ+F1CKPRK72semDSMaL=KNJ+ZvdFhLD6EfzoG4LkGu=UAV=hQ@mail.gmail.com>
Subject: Re: [PATCH 22/34] meson, configure: move --interp-prefix to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001da41005dd1a5618"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2f.google.com
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

--0000000000001da41005dd1a5618
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 7:48 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This is the last CONFIG_* entry in config-host.mak that had to be
> special cased.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

A strange option, I wonder if it is really useful... anyway, for the move:

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure                     | 6 ------
>  meson.build                   | 6 ++----
>  meson_options.txt             | 2 ++
>  scripts/meson-buildoptions.sh | 3 +++
>  4 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/configure b/configure
> index 5bf0a7d69b..200ef3be23 100755
> --- a/configure
> +++ b/configure
> @@ -231,7 +231,6 @@ fi
>
>  # default parameters
>  cpu=3D""
> -interp_prefix=3D"/usr/gnemul/qemu-%M"
>  static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
> @@ -696,8 +695,6 @@ for opt do
>    ;;
>    --prefix=3D*) prefix=3D"$optarg"
>    ;;
> -  --interp-prefix=3D*) interp_prefix=3D"$optarg"
> -  ;;
>    --cross-prefix=3D*)
>    ;;
>    --cc=3D*)
> @@ -1090,8 +1087,6 @@ Options: [defaults in brackets after descriptions]
>  Standard options:
>    --help                   print this message
>    --prefix=3DPREFIX          install in PREFIX [$prefix]
> -  --interp-prefix=3DPREFIX   where to find shared libraries, etc.
> -                           use %M for cpu name [$interp_prefix]
>    --target-list=3DLIST       set target list (default: build all)
>  $(echo Available targets: $default_target_list | \
>    fold -s -w 53 | sed -e 's/^/                           /')
> @@ -2289,7 +2284,6 @@ for target in $target_list; do
>      esac
>  done
>
> -echo "CONFIG_QEMU_INTERP_PREFIX=3D$interp_prefix" | sed 's/%M/@0@/' >>
> $config_host_mak
>  if test "$default_targets" =3D "yes"; then
>    echo "CONFIG_DEFAULT_TARGETS=3Dy" >> $config_host_mak
>  fi
> diff --git a/meson.build b/meson.build
> index 424ff454d2..869cc10128 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2226,10 +2226,8 @@ if targetos =3D=3D 'windows' and link_language =3D=
=3D 'cpp'
>  endif
>  config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
>
> -ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
> -    'HAVE_GDB_BIN']
>  foreach k, v: config_host
> -  if k.startswith('CONFIG_') and not ignored.contains(k)
> +  if k.startswith('CONFIG_')
>      config_host_data.set(k, v =3D=3D 'y' ? 1 : v)
>    endif
>  endforeach
> @@ -2323,7 +2321,7 @@ foreach target : target_dirs
>      config_target +=3D {
>        'CONFIG_USER_ONLY': 'y',
>        'CONFIG_QEMU_INTERP_PREFIX':
> -
> config_host['CONFIG_QEMU_INTERP_PREFIX'].format(config_target['TARGET_NAM=
E'])
> +        get_option('interp_prefix').replace('%M',
> config_target['TARGET_NAME'])
>      }
>    endif
>
> diff --git a/meson_options.txt b/meson_options.txt
> index dc6fb796c6..848426460c 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -27,6 +27,8 @@ option('block_drv_rw_whitelist', type : 'string', value
> : '',
>         description: 'set block driver read-write whitelist (by default
> affects only QEMU, not tools like qemu-img)')
>  option('block_drv_ro_whitelist', type : 'string', value : '',
>         description: 'set block driver read-only whitelist (by default
> affects only QEMU, not tools like qemu-img)')
> +option('interp_prefix', type : 'string', value : '/usr/gnemul/qemu-%M',
> +       description: 'where to find shared libraries etc., use %M for cpu
> name')
>  option('fuzzing_engine', type : 'string', value : '',
>         description: 'fuzzing engine library for OSS-Fuzz')
>  option('trace_file', type: 'string', value: 'trace',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index bf9878e24f..a0c86db116 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -41,6 +41,8 @@ meson_options_help() {
>    printf "%s\n" '                           Set available tracing
> backends [log] (choices:'
>    printf "%s\n" '
>  dtrace/ftrace/log/nop/simple/syslog/ust)'
>    printf "%s\n" '  --iasl=3DVALUE             Path to ACPI disassembler'
> +  printf "%s\n" '  --interp-prefix=3DVALUE    where to find shared
> libraries etc., use %M for'
> +  printf "%s\n" '                           cpu name
> [/usr/gnemul/qemu-%M]'
>    printf "%s\n" '  --sphinx-build=3DVALUE     Use specified sphinx-build
> for building document'
>    printf "%s\n" '  --tls-priority=3DVALUE     Default TLS protocol/ciphe=
r
> priority string'
>    printf "%s\n" '                           [NORMAL]'
> @@ -252,6 +254,7 @@ _meson_option_parse() {
>      --disable-iconv) printf "%s" -Diconv=3Ddisabled ;;
>      --enable-install-blobs) printf "%s" -Dinstall_blobs=3Dtrue ;;
>      --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
> +    --interp-prefix=3D*) quote_sh "-Dinterp_prefix=3D$2" ;;
>      --enable-jack) printf "%s" -Djack=3Denabled ;;
>      --disable-jack) printf "%s" -Djack=3Ddisabled ;;
>      --enable-keyring) printf "%s" -Dkeyring=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001da41005dd1a5618
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:48 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
is is the last CONFIG_* entry in config-host.mak that had to be<br>
special cased.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>A strange option, I wonder if it is really useful... anyway, for the mo=
ve:<br></div><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &=
lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.c=
om</a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 6 ------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 6 ++----<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
++<br>
=C2=A0scripts/meson-buildoptions.sh | 3 +++<br>
=C2=A04 files changed, 7 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 5bf0a7d69b..200ef3be23 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -231,7 +231,6 @@ fi<br>
<br>
=C2=A0# default parameters<br>
=C2=A0cpu=3D&quot;&quot;<br>
-interp_prefix=3D&quot;/usr/gnemul/qemu-%M&quot;<br>
=C2=A0static=3D&quot;no&quot;<br>
=C2=A0cross_compile=3D&quot;no&quot;<br>
=C2=A0cross_prefix=3D&quot;&quot;<br>
@@ -696,8 +695,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--prefix=3D*) prefix=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --interp-prefix=3D*) interp_prefix=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--cross-prefix=3D*)<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--cc=3D*)<br>
@@ -1090,8 +1087,6 @@ Options: [defaults in brackets after descriptions]<br=
>
=C2=A0Standard options:<br>
=C2=A0 =C2=A0--help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0print this message<br>
=C2=A0 =C2=A0--prefix=3DPREFIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install in=
 PREFIX [$prefix]<br>
-=C2=A0 --interp-prefix=3DPREFIX=C2=A0 =C2=A0where to find shared libraries=
, etc.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0use %M for cpu name [$interp_prefix]<br>
=C2=A0 =C2=A0--target-list=3DLIST=C2=A0 =C2=A0 =C2=A0 =C2=A0set target list=
 (default: build all)<br>
=C2=A0$(echo Available targets: $default_target_list | \<br>
=C2=A0 =C2=A0fold -s -w 53 | sed -e &#39;s/^/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/&#39;=
)<br>
@@ -2289,7 +2284,6 @@ for target in $target_list; do<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0done<br>
<br>
-echo &quot;CONFIG_QEMU_INTERP_PREFIX=3D$interp_prefix&quot; | sed &#39;s/%=
M/@0@/&#39; &gt;&gt; $config_host_mak<br>
=C2=A0if test &quot;$default_targets&quot; =3D &quot;yes&quot;; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_DEFAULT_TARGETS=3Dy&quot; &gt;&gt; $config_h=
ost_mak<br>
=C2=A0fi<br>
diff --git a/meson.build b/meson.build<br>
index 424ff454d2..869cc10128 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2226,10 +2226,8 @@ if targetos =3D=3D &#39;windows&#39; and link_langua=
ge =3D=3D &#39;cpp&#39;<br>
=C2=A0endif<br>
=C2=A0config_host_data.set(&#39;HAVE_VSS_SDK&#39;, have_vss_sdk)<br>
<br>
-ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-target<br=
>
-=C2=A0 =C2=A0 &#39;HAVE_GDB_BIN&#39;]<br>
=C2=A0foreach k, v: config_host<br>
-=C2=A0 if k.startswith(&#39;CONFIG_&#39;) and not ignored.contains(k)<br>
+=C2=A0 if k.startswith(&#39;CONFIG_&#39;)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(k, v =3D=3D &#39;y&#39; ? 1 : v)<b=
r>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
@@ -2323,7 +2321,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0config_target +=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;CONFIG_USER_ONLY&#39;: &#39;y&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;CONFIG_QEMU_INTERP_PREFIX&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 config_host[&#39;CONFIG_QEMU_INTERP_PREFIX&#39=
;].format(config_target[&#39;TARGET_NAME&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_option(&#39;interp_prefix&#39;).replace(&#=
39;%M&#39;, config_target[&#39;TARGET_NAME&#39;])<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0endif<br>
<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index dc6fb796c6..848426460c 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -27,6 +27,8 @@ option(&#39;block_drv_rw_whitelist&#39;, type : &#39;stri=
ng&#39;, value : &#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;set block driver read-write w=
hitelist (by default affects only QEMU, not tools like qemu-img)&#39;)<br>
=C2=A0option(&#39;block_drv_ro_whitelist&#39;, type : &#39;string&#39;, val=
ue : &#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;set block driver read-only wh=
itelist (by default affects only QEMU, not tools like qemu-img)&#39;)<br>
+option(&#39;interp_prefix&#39;, type : &#39;string&#39;, value : &#39;/usr=
/gnemul/qemu-%M&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;where to find shared librarie=
s etc., use %M for cpu name&#39;)<br>
=C2=A0option(&#39;fuzzing_engine&#39;, type : &#39;string&#39;, value : &#3=
9;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;fuzzing engine library for OS=
S-Fuzz&#39;)<br>
=C2=A0option(&#39;trace_file&#39;, type: &#39;string&#39;, value: &#39;trac=
e&#39;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index bf9878e24f..a0c86db116 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -41,6 +41,8 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set avail=
able tracing backends [log] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtrace/ft=
race/log/nop/simple/syslog/ust)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --iasl=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Path to ACPI disassembler&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --interp-prefix=3DVALUE=C2=A0 =
=C2=A0 where to find shared libraries etc., use %M for&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu name [/usr/g=
nemul/qemu-%M]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --sphinx-build=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Use specified sphinx-build for building document&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --tls-priority=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Default TLS protocol/cipher priority string&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NORMAL]&=
#39;<br>
@@ -252,6 +254,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-iconv) printf &quot;%s&quot; -Diconv=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-install-blobs) printf &quot;%s&quot; -Dinstall=
_blobs=3Dtrue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-install-blobs) printf &quot;%s&quot; -Dinstal=
l_blobs=3Dfalse ;;<br>
+=C2=A0 =C2=A0 --interp-prefix=3D*) quote_sh &quot;-Dinterp_prefix=3D$2&quo=
t; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-jack) printf &quot;%s&quot; -Djack=3Denabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--disable-jack) printf &quot;%s&quot; -Djack=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-keyring) printf &quot;%s&quot; -Dkeyring=3Dena=
bled ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001da41005dd1a5618--

