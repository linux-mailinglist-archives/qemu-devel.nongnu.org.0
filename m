Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15C9508FD0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:52:20 +0200 (CEST)
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFR5-0006Ui-TJ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEwM-0004dw-C2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:20:34 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEwK-0003PA-Ee
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:20:34 -0400
Received: by mail-qt1-x831.google.com with SMTP id x12so1581663qtp.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pA9jXBeZ0fO7H4etbDzejYOaZDrfaGhBG2MhKIhG/8k=;
 b=ASmbMtQaSk4Nija7FzkfFw0LiZCEx/3g+lFoJjw8kPLEowJXwqr+DJtkjnfaHj/SHN
 1IM8oRE+qaTITNxHq4JUWMF3rqzRFVbP2Oxrh2lpNDd+IrTk86/ALADd/CJxlKRCsw6O
 HGkucFlM6lZbypF12pMfz+aNdfB1JY2NoKA3HJLKg2L6F+CfBo90lGODV9KYwvNMTZ1n
 OSU6GCiIHFhAiGnwgInx/yqBIzcaGu62AIkptDW7xW9p3r/YTNOJ6Hn/tIgQO1d42PAO
 4xBsB2kTe7dYuLnwZ2jbj9SWXep9kxjKP+nFWdSejUYT+2lDk8xyt4bbAOcVLY82L4eE
 WvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pA9jXBeZ0fO7H4etbDzejYOaZDrfaGhBG2MhKIhG/8k=;
 b=DgX5k3+Ca3e62Fs0AsaEYu2UCGEVUbPkyzhKK8ozAiqvpFZRb7Of0RKcnaVn1AIqj7
 9Z/WFdfDHkcYuSRN0sxNr0QMCKmSKhDHuTA79+90LnFYZUn9BR1xGibp7iWhiU2e3Khc
 62F+m+yRAwxjZ07euxBzrCjw/AFfsTjHrRKbnRdOsSroKiBamw4fmxXdZfEkbb9+LLmb
 3kaF/JBRclkYHL6j7iFaKhnxsut4GOiNIq9pEVKobrI2pEZkz+R3kw/6pj2HHrLZ57B4
 t8aqYSG8vIwXVDOijUwxQD/yiVRoH2NF1rcVHVWtBE4J746/cljJhT5LzKa4zcE3re2i
 IRPw==
X-Gm-Message-State: AOAM530JRY+udX0zaKPDWxWZJwboYm/exHe0miveDlHKiRldBedmggwK
 iUMBMS0cTsN/LY2GEulrQ+9A2ZfZBBt0OTHZsoVU/5EhODj/2A==
X-Google-Smtp-Source: ABdhPJwPwXa+wFMMbJzrWarPEIYkwCDd4bSmuD9DXXFfzRgYrJ4NWZe9FATsUdYdmDryoTbyqHUHs3y4iVUMWHoP+TU=
X-Received: by 2002:ac8:4e46:0:b0:2e1:b933:ec06 with SMTP id
 e6-20020ac84e46000000b002e1b933ec06mr14877930qtw.684.1650478831454; Wed, 20
 Apr 2022 11:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-18-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-18-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:20:20 +0400
Message-ID: <CAJ+F1CLxh15FLwVdD_86euFL1mmYU=821reVPthgcBFAwZ-yvQ@mail.gmail.com>
Subject: Re: [PATCH 17/34] configure: move Windows flags detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000754e2605dd1a0ce9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x831.google.com
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

--000000000000754e2605dd1a0ce9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 7:59 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 20 --------------------
>  meson.build |  8 ++++++++
>  2 files changed, 8 insertions(+), 20 deletions(-)
>
> diff --git a/configure b/configure
> index 772714d386..87ceb33917 100755
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
> index d255facbfd..ffca473fbc 100644
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
> +  if get_option('optimization') =3D=3D 0


../meson.build:188:5: ERROR: The `=3D=3D` operator of str does not accept
objects of type int (0)

Why not check 'debug' ?


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

--000000000000754e2605dd1a0ce9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:59 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Si=
gned-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0configure=C2=A0 =C2=A0| 20 --------------------<br>
=C2=A0meson.build |=C2=A0 8 ++++++++<br>
=C2=A02 files changed, 8 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 772714d386..87ceb33917 100755<br>
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
index d255facbfd..ffca473fbc 100644<br>
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
+=C2=A0 if get_option(&#39;optimization&#39;) =3D=3D 0</blockquote><div><br=
></div><div>../meson.build:188:5: ERROR: The `=3D=3D` operator of str does =
not accept objects of type int (0)</div><div><br></div><div>Why not check &=
#39;debug&#39; ?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
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
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000754e2605dd1a0ce9--

