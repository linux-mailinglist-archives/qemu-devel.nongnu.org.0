Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B76509081
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:32:19 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhG3m-0007nQ-LY
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhF1C-0006J8-Oo
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:25:34 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhF19-00047e-RD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:25:34 -0400
Received: by mail-qv1-xf31.google.com with SMTP id n11so1993862qvl.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=blflpx/NE1j96JOvEuNzcgf4XLLCntjR6YGGIQxRs6E=;
 b=Ut1cgl7Vm1LeZvH5HwY9oI22EXTezFFYvpZpn4IsxNVvMKeLpLl7umXY2XUNVpXVTw
 DLuKR/69CpvrgxJ1d2KaUiXiHG/KFj0xjgXRlkUzAmGkiSEQX6sA3L2AuZU4d9YC4t1f
 cqc83kbHgOm/HADlUjoWkjNYcC3aHcyjCQ5mENQqY4aCNtbQG4N/aJWWk8wGzPx4Qihc
 GYWSo+u0If+Kmt2kSBcbsgEdwfdch67XIr+uGI14D4K+gd+PspatXZQNzlDjyuNHS5zW
 BuMsFh56ezz9FIWaJmI8ZUlLRC5RoY0QlxIefxKk9cyseP94RmKaU5sj9XxYoMiTjuNB
 qvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=blflpx/NE1j96JOvEuNzcgf4XLLCntjR6YGGIQxRs6E=;
 b=XR6ogLTzqRksvaKLqJtXsd8zEalMzfeVboBzB/5hWKsh4keilsUPGaI8QftsNW1+ra
 q4Vbjq9x6XtrDXmRNRizhc01W4tsonl9vRNS2xzeGO7at3T+eWZPMmBVWhLpxTCsG0ON
 RzD7+7bLQF0j1dAmUmxO+CgMf3csNkW0vnzRiS32MUhXhc+kNMJU8hyWNdr5F1tofsUK
 ViTlfTusWH9jTi0vfJFb1F0NTyaweKVEnUXK8aUxxhnpn5NSmz4J6mCQcKsUnhkS5Ocl
 6pFMFVIrDjhkfsrT1xKP/Z5fI/ThZMKoUmePGnlzF/SV29ZSfbZqItbGwTowgHMPIWng
 cIJQ==
X-Gm-Message-State: AOAM531p1L6gPUFuFo5AjLfRhAUe0wARK8dDmiyaYUU1jU00quRiGtix
 L0/IsvZVzEBooYqPGa3gRj9HMrCXROh0jaD237N++J+zqK6ldg==
X-Google-Smtp-Source: ABdhPJzhx4uT4dFXfBjzde7LdKQKwJXHORRxpeOVimQN2XEsT565sSd6bCKC6yTGpsxBeoQBzVeo7kk11aBjYDig02w=
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id
 gv12-20020a056214262c00b00446346457cdmr16524619qvb.89.1650479130896; Wed, 20
 Apr 2022 11:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-20-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-20-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:25:19 +0400
Message-ID: <CAJ+F1CLVj=thr1P3QSE2KpwN2=7UvtdeFz10P+iEVu-0u3faDg@mail.gmail.com>
Subject: Re: [PATCH 19/34] meson, configure: move --tls-priority to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004e6be305dd1a1e2d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf31.google.com
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

--0000000000004e6be305dd1a1e2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Use the new support for string option parsing.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure                     | 5 -----
>  meson.build                   | 3 ++-
>  meson_options.txt             | 2 ++
>  scripts/meson-buildoptions.sh | 3 +++
>  4 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/configure b/configure
> index 8f34f2a061..3327a4887a 100755
> --- a/configure
> +++ b/configure
> @@ -311,7 +311,6 @@ bsd_user=3D""
>  pkgversion=3D""
>  pie=3D""
>  coroutine=3D""
> -tls_priority=3D"NORMAL"
>  plugins=3D"$default_feature"
>  meson=3D""
>  meson_args=3D""
> @@ -938,8 +937,6 @@ for opt do
>    --enable-uuid|--disable-uuid)
>        echo "$0: $opt is obsolete, UUID support is always built" >&2
>    ;;
> -  --tls-priority=3D*) tls_priority=3D"$optarg"
> -  ;;
>    --disable-vhost-user) vhost_user=3D"no"
>    ;;
>    --enable-vhost-user) vhost_user=3D"yes"
> @@ -1169,7 +1166,6 @@ Advanced options (experts only):
>    --with-coroutine=3DBACKEND coroutine backend. Supported options:
>                             ucontext, sigaltstack, windows
>    --enable-gcov            enable test coverage analysis with gcov
> -  --tls-priority           default TLS protocol/cipher priority string
>    --enable-plugins
>                             enable plugins via shared library loading
>    --disable-containers     don't use containers for cross-building
> @@ -2200,7 +2196,6 @@ if test "$modules" =3D "yes"; then
>    echo "CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgversion; cat $0=
) |
> $shacmd - | cut -f1 -d\ )" >> $config_host_mak
>    echo "CONFIG_MODULES=3Dy" >> $config_host_mak
>  fi
> -echo "CONFIG_TLS_PRIORITY=3D\"$tls_priority\"" >> $config_host_mak
>
>  if test "$vhost_scsi" =3D "yes" ; then
>    echo "CONFIG_VHOST_SCSI=3Dy" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index ffca473fbc..8a7e4ab5c7 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1596,6 +1596,7 @@ foreach k : get_option('trace_backends')
>    config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
>  endforeach
>  config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'=
))
> +config_host_data.set_quoted('CONFIG_TLS_PRIORITY',
> get_option('tls_priority'))
>  if iasl.found()
>    config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
>  endif
> @@ -3806,7 +3807,7 @@ summary(summary_info, bool_yn: true, section: 'Bloc=
k
> layer support')
>
>  # Crypto
>  summary_info =3D {}
> -summary_info +=3D {'TLS priority':      config_host['CONFIG_TLS_PRIORITY=
']}
> +summary_info +=3D {'TLS priority':      get_option('tls_priority')}
>  summary_info +=3D {'GNUTLS support':    gnutls}
>  if gnutls.found()
>    summary_info +=3D {'  GNUTLS crypto':   gnutls_crypto.found()}
> diff --git a/meson_options.txt b/meson_options.txt
> index 415fcc448e..891c0ec130 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -14,6 +14,8 @@ option('sphinx_build', type : 'string', value : '',
>         description: 'Use specified sphinx-build for building document')
>  option('iasl', type : 'string', value : '',
>         description: 'Path to ACPI disassembler')
> +option('tls_priority', type : 'string', value : 'NORMAL',
> +       description: 'Default TLS protocol/cipher priority string')
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators=
')
>  option('audio_drv_list', type: 'array', value: ['default'],
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 63f2f1abcf..0e0548aa87 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -36,6 +36,8 @@ meson_options_help() {
>    printf "%s\n" '
>  dtrace/ftrace/log/nop/simple/syslog/ust)'
>    printf "%s\n" '  --iasl=3DVALUE             Path to ACPI disassembler'
>    printf "%s\n" '  --sphinx-build=3DVALUE     Use specified sphinx-build
> for building document'
> +  printf "%s\n" '  --tls-priority=3DVALUE     Default TLS protocol/ciphe=
r
> priority string'
> +  printf "%s\n" '                           [NORMAL]'
>    printf "%s\n" '  --with-trace-file=3DVALUE  Trace file prefix for simp=
le
> backend [trace]'
>    printf "%s\n" ''
>    printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
> @@ -349,6 +351,7 @@ _meson_option_parse() {
>      --disable-tcg) printf "%s" -Dtcg=3Ddisabled ;;
>      --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dtrue ;;
>      --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=3Dfalse ;;
> +    --tls-priority=3D*) quote_sh "-Dtls_priority=3D$2" ;;
>      --enable-tools) printf "%s" -Dtools=3Denabled ;;
>      --disable-tools) printf "%s" -Dtools=3Ddisabled ;;
>      --enable-tpm) printf "%s" -Dtpm=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004e6be305dd1a1e2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:45 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use =
the new support for string option parsing.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandr=
e.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 5 -----<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 3 ++-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
++<br>
=C2=A0scripts/meson-buildoptions.sh | 3 +++<br>
=C2=A04 files changed, 7 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 8f34f2a061..3327a4887a 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -311,7 +311,6 @@ bsd_user=3D&quot;&quot;<br>
=C2=A0pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
-tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
=C2=A0meson=3D&quot;&quot;<br>
=C2=A0meson_args=3D&quot;&quot;<br>
@@ -938,8 +937,6 @@ for opt do<br>
=C2=A0 =C2=A0--enable-uuid|--disable-uuid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$0: $opt is obsolete, UUID support is=
 always built&quot; &gt;&amp;2<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --tls-priority=3D*) tls_priority=3D&quot;$optarg&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--disable-vhost-user) vhost_user=3D&quot;no&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--enable-vhost-user) vhost_user=3D&quot;yes&quot;<br>
@@ -1169,7 +1166,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--with-coroutine=3DBACKEND coroutine backend. Supported option=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ucontext, sigaltstack, windows<br>
=C2=A0 =C2=A0--enable-gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable =
test coverage analysis with gcov<br>
-=C2=A0 --tls-priority=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default TLS =
protocol/cipher priority string<br>
=C2=A0 =C2=A0--enable-plugins<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 enable plugins via shared library loading<br>
=C2=A0 =C2=A0--disable-containers=C2=A0 =C2=A0 =C2=A0don&#39;t use containe=
rs for cross-building<br>
@@ -2200,7 +2196,6 @@ if test &quot;$modules&quot; =3D &quot;yes&quot;; the=
n<br>
=C2=A0 =C2=A0echo &quot;CONFIG_STAMP=3D_$( (echo $qemu_version; echo $pkgve=
rsion; cat $0) | $shacmd - | cut -f1 -d\ )&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0 =C2=A0echo &quot;CONFIG_MODULES=3Dy&quot; &gt;&gt; $config_host_mak<=
br>
=C2=A0fi<br>
-echo &quot;CONFIG_TLS_PRIORITY=3D\&quot;$tls_priority\&quot;&quot; &gt;&gt=
; $config_host_mak<br>
<br>
=C2=A0if test &quot;$vhost_scsi&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_SCSI=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
diff --git a/meson.build b/meson.build<br>
index ffca473fbc..8a7e4ab5c7 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1596,6 +1596,7 @@ foreach k : get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0config_host_data.set(&#39;CONFIG_TRACE_&#39; + k.to_upper(), t=
rue)<br>
=C2=A0endforeach<br>
=C2=A0config_host_data.set_quoted(&#39;CONFIG_TRACE_FILE&#39;, get_option(&=
#39;trace_file&#39;))<br>
+config_host_data.set_quoted(&#39;CONFIG_TLS_PRIORITY&#39;, get_option(&#39=
;tls_priority&#39;))<br>
=C2=A0if iasl.found()<br>
=C2=A0 =C2=A0config_host_data.set_quoted(&#39;CONFIG_IASL&#39;, iasl.full_p=
ath())<br>
=C2=A0endif<br>
@@ -3806,7 +3807,7 @@ summary(summary_info, bool_yn: true, section: &#39;Bl=
ock layer support&#39;)<br>
<br>
=C2=A0# Crypto<br>
=C2=A0summary_info =3D {}<br>
-summary_info +=3D {&#39;TLS priority&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
[&#39;CONFIG_TLS_PRIORITY&#39;]}<br>
+summary_info +=3D {&#39;TLS priority&#39;:=C2=A0 =C2=A0 =C2=A0 get_option(=
&#39;tls_priority&#39;)}<br>
=C2=A0summary_info +=3D {&#39;GNUTLS support&#39;:=C2=A0 =C2=A0 gnutls}<br>
=C2=A0if gnutls.found()<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;=C2=A0 GNUTLS crypto&#39;:=C2=A0 =C2=
=A0gnutls_crypto.found()}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 415fcc448e..891c0ec130 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -14,6 +14,8 @@ option(&#39;sphinx_build&#39;, type : &#39;string&#39;, v=
alue : &#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use specified sphinx-build fo=
r building document&#39;)<br>
=C2=A0option(&#39;iasl&#39;, type : &#39;string&#39;, value : &#39;&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Path to ACPI disassembler&#39=
;)<br>
+option(&#39;tls_priority&#39;, type : &#39;string&#39;, value : &#39;NORMA=
L&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Default TLS protocol/cipher p=
riority string&#39;)<br>
=C2=A0option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : t=
rue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Include a default selection o=
f devices in emulators&#39;)<br>
=C2=A0option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [&#39;=
default&#39;],<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 63f2f1abcf..0e0548aa87 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -36,6 +36,8 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtrace/ft=
race/log/nop/simple/syslog/ust)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --iasl=3DVALUE=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Path to ACPI disassembler&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --sphinx-build=3DVALUE=C2=
=A0 =C2=A0 =C2=A0Use specified sphinx-build for building document&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --tls-priority=3DVALUE=C2=A0 =
=C2=A0 =C2=A0Default TLS protocol/cipher priority string&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NORMAL]&#39;<br=
>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --with-trace-file=3DVALUE=
=C2=A0 Trace file prefix for simple backend [trace]&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;Optional features, enabled with -=
-enable-FEATURE and&#39;<br>
@@ -349,6 +351,7 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-tcg) printf &quot;%s&quot; -Dtcg=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-tcg-interpreter) printf &quot;%s&quot; -Dtcg_i=
nterpreter=3Dtrue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-tcg-interpreter) printf &quot;%s&quot; -Dtcg_=
interpreter=3Dfalse ;;<br>
+=C2=A0 =C2=A0 --tls-priority=3D*) quote_sh &quot;-Dtls_priority=3D$2&quot;=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-tools) printf &quot;%s&quot; -Dtools=3Denabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-tools) printf &quot;%s&quot; -Dtools=3Ddisabl=
ed ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-tpm) printf &quot;%s&quot; -Dtpm=3Denabled ;;<=
br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004e6be305dd1a1e2d--

