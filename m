Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD250D1BB
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 14:36:53 +0200 (CEST)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nibTw-00005Y-Ec
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 08:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nibQd-000633-As
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:33:27 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nibQb-0004o2-K0
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 08:33:26 -0400
Received: by mail-qk1-x730.google.com with SMTP id q75so9032015qke.6
 for <qemu-devel@nongnu.org>; Sun, 24 Apr 2022 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zoqJaUDqg21u9mkHIsaY8jO+fWERp2zgAxGKnuZd0A=;
 b=XIo2l+iR2l0H1bKXPP6fvezOOXNiN+3p3aHFFUjJpcmk8cXkxASKLPOLe641WlkVvw
 juaAN3s7vqfqT+57K9UFCemLDHkQkpNXmug9zuC1UH/WKyPGd8cne950SeGdDQddDKgP
 7GE/me8n3gx+EIp+FbEE5hX+9QQvNEuRW0c5WPeCI3p9YOkM0gYJmfia0JrxzJ6ckzhG
 3mPW/V2FK1oINwU+XwfBuL+nrDDpExA2RcJT9DYmQhjJcQTGX8tqGtNeCt36r/iL/nRO
 ZUGk3gp1NRitxoJrHoqEYyuM0E0VKicU6aA6E+riatiQCCn5UUytGx/mmkn/fPPxMVv9
 JIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zoqJaUDqg21u9mkHIsaY8jO+fWERp2zgAxGKnuZd0A=;
 b=aZAEoSO8IuKuH7ihzzJTFa+po5H7hKbck2VhE5H0PcXcnImph21Nm/9f5y4koN6h4B
 86hNuTtFNxaNg6zmfDpgCCD6cWR5ujlua+yPCuTQIWXUumolJYR/uEQcpWL4oCFe7UfL
 nlWttenfkhUAiMaw0hwwQvQu5Gz8KW/Mxl4NMbtwAV5EN4TAPiU1jWfnOrBQthTRZ6S0
 ZLg5XZ7k3ZGjdzYSsQnr2yH0Cza66UcqhZc4X6WoyvgWuD8GSOI+eMBtBKjFKO10daiz
 8O8ma3s8y+dAwJtLfm+DZ8zotsQrab2pUDBmZm0+CcTxxbeCOJuoP37jx6NfraS2TcgT
 dIcQ==
X-Gm-Message-State: AOAM530b4ZR/nHMVgjIMKkTm8hRD8hF2k0iQVqUz3YSu86EGpvH2PJ2p
 YPbV+L4lAdhbWtMxJCUk4z4KISMIch0oL0kIiWtcrzG8zck=
X-Google-Smtp-Source: ABdhPJwZmQXsD/ZXcIyInIc3TbvOtbAzV4c7xyl4fQyu5V6GrQfFmGUCGarnmPZt/hHj4P4Ew+QT3jT/5hgXmbeB6xA=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr7247533qkg.397.1650803604418; Sun, 24
 Apr 2022 05:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220423125151.27821-1-pbonzini@redhat.com>
 <20220423125151.27821-18-pbonzini@redhat.com>
In-Reply-To: <20220423125151.27821-18-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 24 Apr 2022 16:33:12 +0400
Message-ID: <CAJ+F1CJxLOoa+i_0ngeo+P-X1wwzA+jCr7JwCB5cCD28xjF+SQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/34] configure: move Windows flags detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006f767305dd65aaef"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x730.google.com
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

--0000000000006f767305dd65aaef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 23, 2022 at 5:09 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> v1->v2: fix get_option('optimization') comparison to use a string
>
>  configure   | 20 --------------------
>  meson.build |  8 ++++++++
>  2 files changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/configure b/configure
> index 0b236fda59..a6ba59cf6f 100755
> --- a/configure
> +++ b/configure
> @@ -224,10 +224,6 @@ glob() {
>      eval test -z '"${1#'"$2"'}"'
>  }
>
> -ld_has() {
> -    $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
> -}
> -
>  if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
>  then
>    error_exit "main directory cannot contain spaces nor colons"
> @@ -2088,22 +2084,6 @@ if test "$solaris" =3D "no" && test "$tsan" =3D "n=
o";
> then
>      fi
>  fi
>
> -# Use ASLR, no-SEH and DEP if available
> -if test "$mingw32" =3D "yes" ; then
> -    flags=3D"--no-seh --nxcompat"
> -
> -    # Disable ASLR for debug builds to allow debugging with gdb
> -    if test "$debug" =3D "no" ; then
> -        flags=3D"--dynamicbase $flags"
> -    fi
> -
> -    for flag in $flags; do
> -        if ld_has $flag ; then
> -            QEMU_LDFLAGS=3D"-Wl,$flag $QEMU_LDFLAGS"
> -        fi
> -    done
> -fi
> -
>  # Guest agent Windows MSI package
>
>  if test "$QEMU_GA_MANUFACTURER" =3D ""; then
> diff --git a/meson.build b/meson.build
> index 1a9549d90c..d569c6e944 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -182,6 +182,14 @@ qemu_cxxflags =3D config_host['QEMU_CXXFLAGS'].split=
()
>  qemu_objcflags =3D config_host['QEMU_OBJCFLAGS'].split()
>  qemu_ldflags =3D config_host['QEMU_LDFLAGS'].split()
>
> +if targetos =3D=3D 'windows'
> +  qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--no-seh',
> '-Wl,--nxcompat')
> +  # Disable ASLR for debug builds to allow debugging with gdb
> +  if get_option('optimization') =3D=3D '0'
> +    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--dynamicbase=
')
> +  endif
> +endif
> +
>  if get_option('gprof')
>    qemu_cflags +=3D ['-p']
>    qemu_cxxflags +=3D ['-p']
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006f767305dd65aaef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 23, 2022=
 at 5:09 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><di=
v><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:=
marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v1-&gt;v2: fix get_option(&#39;optimization&#39;) comparison to use a strin=
g<br>
<br>
=C2=A0configure=C2=A0 =C2=A0| 20 --------------------<br>
=C2=A0meson.build |=C2=A0 8 ++++++++<br>
=C2=A02 files changed, 8 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 0b236fda59..a6ba59cf6f 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -224,10 +224,6 @@ glob() {<br>
=C2=A0 =C2=A0 =C2=A0eval test -z &#39;&quot;${1#&#39;&quot;$2&quot;&#39;}&q=
uot;&#39;<br>
=C2=A0}<br>
<br>
-ld_has() {<br>
-=C2=A0 =C2=A0 $ld --help 2&gt;/dev/null | grep &quot;.$1&quot; &gt;/dev/nu=
ll 2&gt;&amp;1<br>
-}<br>
-<br>
=C2=A0if printf %s\\n &quot;$source_path&quot; &quot;$PWD&quot; | grep -q &=
quot;[[:space:]:]&quot;;<br>
=C2=A0then<br>
=C2=A0 =C2=A0error_exit &quot;main directory cannot contain spaces nor colo=
ns&quot;<br>
@@ -2088,22 +2084,6 @@ if test &quot;$solaris&quot; =3D &quot;no&quot; &amp=
;&amp; test &quot;$tsan&quot; =3D &quot;no&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-# Use ASLR, no-SEH and DEP if available<br>
-if test &quot;$mingw32&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 flags=3D&quot;--no-seh --nxcompat&quot;<br>
-<br>
-=C2=A0 =C2=A0 # Disable ASLR for debug builds to allow debugging with gdb<=
br>
-=C2=A0 =C2=A0 if test &quot;$debug&quot; =3D &quot;no&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags=3D&quot;--dynamicbase $flags&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-<br>
-=C2=A0 =C2=A0 for flag in $flags; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ld_has $flag ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_LDFLAGS=3D&quot;-Wl,$flag $=
QEMU_LDFLAGS&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 done<br>
-fi<br>
-<br>
=C2=A0# Guest agent Windows MSI package<br>
<br>
=C2=A0if test &quot;$QEMU_GA_MANUFACTURER&quot; =3D &quot;&quot;; then<br>
diff --git a/meson.build b/meson.build<br>
index 1a9549d90c..d569c6e944 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -182,6 +182,14 @@ qemu_cxxflags =3D config_host[&#39;QEMU_CXXFLAGS&#39;]=
.split()<br>
=C2=A0qemu_objcflags =3D config_host[&#39;QEMU_OBJCFLAGS&#39;].split()<br>
=C2=A0qemu_ldflags =3D config_host[&#39;QEMU_LDFLAGS&#39;].split()<br>
<br>
+if targetos =3D=3D &#39;windows&#39;<br>
+=C2=A0 qemu_ldflags +=3D cc.get_supported_link_arguments(&#39;-Wl,--no-seh=
&#39;, &#39;-Wl,--nxcompat&#39;)<br>
+=C2=A0 # Disable ASLR for debug builds to allow debugging with gdb<br>
+=C2=A0 if get_option(&#39;optimization&#39;) =3D=3D &#39;0&#39;<br>
+=C2=A0 =C2=A0 qemu_ldflags +=3D cc.get_supported_link_arguments(&#39;-Wl,-=
-dynamicbase&#39;)<br>
+=C2=A0 endif<br>
+endif<br>
+<br>
=C2=A0if get_option(&#39;gprof&#39;)<br>
=C2=A0 =C2=A0qemu_cflags +=3D [&#39;-p&#39;]<br>
=C2=A0 =C2=A0qemu_cxxflags +=3D [&#39;-p&#39;]<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--0000000000006f767305dd65aaef--

