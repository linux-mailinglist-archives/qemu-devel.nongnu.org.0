Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E44508D98
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:45:34 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDSP-0000Rk-65
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCop-0000FB-Tz
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:04:41 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhCoo-0005Zk-5i
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:04:39 -0400
Received: by mail-qk1-x736.google.com with SMTP id a186so1531181qkc.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUxG8B9RhWs3Y28juOINVKEw6G//xi2FGPJSJsss618=;
 b=HdXkxLmCrhwW66be+bQEkjv/4QM7PA5xBdS3m6VyahUFIQ8A0bHbaMbp5gIcC2ePzl
 Aoqsk1MALK/u/8jEZ5JULn1614U8qtozyAkVTSJidq974DJqQpQuCLBG6I3VLKBt22Yv
 RasSk1KOLjxquz1vSxQrL9aaqCXe6lV0E9RSNU/U7okOePPhtuEdmeCa+3Tii2VwuZAC
 UQUz9tMVjocvWtVNFE/lMtCqqSb5pf6XJvEBwmGFinQ2oC7CsBApWsPdf5WZ+LG3MTAF
 cW0QNP5FdA+2eznnqRNF19jclbUji20bIHemcpnxJaYaFDZ0xiBIeBTo+HJ9v+dqEMTP
 SG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUxG8B9RhWs3Y28juOINVKEw6G//xi2FGPJSJsss618=;
 b=Y/0f4HFvqHfbkVv5z1V2HVbBHA92sS05pywcDIfBF3IthM/brTk00O9i1BNA1PbB7V
 km/2jnUM/H7uYFTlrQrvikuXXo14xNdk+mL7gI+mVM8BfHhG38GNVmmPPosQ3Sghvq4g
 yCzaYGZkAnxfADwDJCXYRKt/ziNomDBQkxUhNfEH9ev0VSb+6p7+KeCb5VDSfHgAAKj1
 fOx5Go+yUIwl9t0IXYrdMSh+xgpxGdRmhPvte/xVdIwfw9szyuE81yc7YQpGpAoFam+C
 /v2jx6LOkFMJjszjSHqDDyLo9JzL0W3PAm+/gp9+lPZ3vmkz64sZP5h++BBSKPfiqaZd
 TcOA==
X-Gm-Message-State: AOAM533lI8zCkByP3rMiM2s1m/O+8JqiHeucBlHVnOScgU0LhNvmV5oJ
 9pj06JJ6qxSrJ1fuzaD8AM9njlHByVZFHJJ1dUw=
X-Google-Smtp-Source: ABdhPJyR2ec9vQROwBKYPoZed540YpbbcwbbgAZ6IRb7wesWPCQAR4A7juusSvVhSWLRi3ZmHnI7WVYPykLsmgoQEwo=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr12658616qkg.397.1650470676472; Wed, 20
 Apr 2022 09:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-3-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:04:25 +0400
Message-ID: <CAJ+F1C+=r4=D+TfBya5i3LmD35bwQsXhQyxn8ato7u4Xdrpatw@mail.gmail.com>
Subject: Re: [PATCH 02/34] configure: remove dead code
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006225cc05dd18265e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x736.google.com
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

--0000000000006225cc05dd18265e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> tcg_interpreter is never written, it is purely a meson option;
> trace_backends is never read.
>
> And SeaBIOS is only build from the source tree with roms/Makefile,
> so the config.mak file is unused.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>


oh, that could easily be splitted, but looks good to me:

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  configure | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/configure b/configure
> index 7c08c18358..2fc860ed9a 100755
> --- a/configure
> +++ b/configure
> @@ -320,7 +320,6 @@ linux_user=3D""
>  bsd_user=3D""
>  pkgversion=3D""
>  pie=3D""
> -trace_backends=3D"log"
>  trace_file=3D"trace"
>  opengl=3D"$default_feature"
>  coroutine=3D""
> @@ -391,7 +390,6 @@ for opt do
>                        cross_cc_vars=3D"$cross_cc_vars
> cross_cc_cflags_${cc_arch}"
>    ;;
>    --cross-cc-*) cc_arch=3D${opt#--cross-cc-}; cc_arch=3D${cc_arch%%=3D*}
> -                cc_archs=3D"$cc_archs $cc_arch"
>                  eval "cross_cc_${cc_arch}=3D\$optarg"
>                  cross_cc_vars=3D"$cross_cc_vars cross_cc_${cc_arch}"
>    ;;
> @@ -2881,9 +2879,6 @@ fi
>  if test "$vhost_user_fs" =3D "yes" ; then
>    echo "CONFIG_VHOST_USER_FS=3Dy" >> $config_host_mak
>  fi
> -if test "$tcg" =3D "enabled" -a "$tcg_interpreter" =3D "true" ; then
> -  echo "CONFIG_TCG_INTERPRETER=3Dy" >> $config_host_mak
> -fi
>
>  if test "$opengl" =3D "yes" ; then
>    echo "CONFIG_OPENGL=3Dy" >> $config_host_mak
> @@ -3025,7 +3020,6 @@ LINKS=3D"Makefile"
>  LINKS=3D"$LINKS tests/tcg/Makefile.target"
>  LINKS=3D"$LINKS pc-bios/optionrom/Makefile"
>  LINKS=3D"$LINKS pc-bios/s390-ccw/Makefile"
> -LINKS=3D"$LINKS roms/seabios/Makefile"
>  LINKS=3D"$LINKS pc-bios/qemu-icon.bmp"
>  LINKS=3D"$LINKS .gdbinit scripts" # scripts needed by relative path in
> .gdbinit
>  LINKS=3D"$LINKS tests/avocado tests/data"
> @@ -3060,24 +3054,6 @@ done
>  export target_list source_path use_containers cpu
>  $source_path/tests/tcg/configure.sh)
>
> -# temporary config to build submodules
> -if test -f $source_path/roms/seabios/Makefile; then
> -  for rom in seabios; do
> -    config_mak=3Droms/$rom/config.mak
> -    echo "# Automatically generated by configure - do not modify" >
> $config_mak
> -    echo "SRC_PATH=3D$source_path/roms/$rom" >> $config_mak
> -    echo "AS=3D$as" >> $config_mak
> -    echo "CCAS=3D$ccas" >> $config_mak
> -    echo "CC=3D$cc" >> $config_mak
> -    echo "BCC=3Dbcc" >> $config_mak
> -    echo "CPP=3D$cpp" >> $config_mak
> -    echo "OBJCOPY=3Dobjcopy" >> $config_mak
> -    echo "IASL=3D$iasl" >> $config_mak
> -    echo "LD=3D$ld" >> $config_mak
> -    echo "RANLIB=3D$ranlib" >> $config_mak
> -  done
> -fi
> -
>  config_mak=3Dpc-bios/optionrom/config.mak
>  echo "# Automatically generated by configure - do not modify" >
> $config_mak
>  echo "TOPSRC_DIR=3D$source_path" >> $config_mak
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006225cc05dd18265e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:45 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">tcg_=
interpreter is never written, it is purely a meson option;<br>
trace_backends is never read.<br>
<br>
And SeaBIOS is only build from the source tree with roms/Makefile,<br>
so the config.mak file is unused.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><br></div><div>oh, that could easily be splitted, but looks good to me:=
<br></div><div><br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;=
<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com<=
/a>&gt;</div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
---<br>
=C2=A0configure | 24 ------------------------<br>
=C2=A01 file changed, 24 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 7c08c18358..2fc860ed9a 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -320,7 +320,6 @@ linux_user=3D&quot;&quot;<br>
=C2=A0bsd_user=3D&quot;&quot;<br>
=C2=A0pkgversion=3D&quot;&quot;<br>
=C2=A0pie=3D&quot;&quot;<br>
-trace_backends=3D&quot;log&quot;<br>
=C2=A0trace_file=3D&quot;trace&quot;<br>
=C2=A0opengl=3D&quot;$default_feature&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
@@ -391,7 +390,6 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cross_cc_vars=3D&quot;$cross_cc_vars cross_cc_cflags_${cc_arch}&q=
uot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--cross-cc-*) cc_arch=3D${opt#--cross-cc-}; cc_arch=3D${cc_arc=
h%%=3D*}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc_archs=3D&quot;$=
cc_archs $cc_arch&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;cr=
oss_cc_${cc_arch}=3D\$optarg&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cross_cc_vars=
=3D&quot;$cross_cc_vars cross_cc_${cc_arch}&quot;<br>
=C2=A0 =C2=A0;;<br>
@@ -2881,9 +2879,6 @@ fi<br>
=C2=A0if test &quot;$vhost_user_fs&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_VHOST_USER_FS=3Dy&quot; &gt;&gt; $config_hos=
t_mak<br>
=C2=A0fi<br>
-if test &quot;$tcg&quot; =3D &quot;enabled&quot; -a &quot;$tcg_interpreter=
&quot; =3D &quot;true&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_TCG_INTERPRETER=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
<br>
=C2=A0if test &quot;$opengl&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_OPENGL=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
@@ -3025,7 +3020,6 @@ LINKS=3D&quot;Makefile&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS tests/tcg/Makefile.target&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS pc-bios/optionrom/Makefile&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS pc-bios/s390-ccw/Makefile&quot;<br>
-LINKS=3D&quot;$LINKS roms/seabios/Makefile&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS pc-bios/qemu-icon.bmp&quot;<br>
=C2=A0LINKS=3D&quot;$LINKS .gdbinit scripts&quot; # scripts needed by relat=
ive path in .gdbinit<br>
=C2=A0LINKS=3D&quot;$LINKS tests/avocado tests/data&quot;<br>
@@ -3060,24 +3054,6 @@ done<br>
=C2=A0export target_list source_path use_containers cpu<br>
=C2=A0$source_path/tests/tcg/configure.sh)<br>
<br>
-# temporary config to build submodules<br>
-if test -f $source_path/roms/seabios/Makefile; then<br>
-=C2=A0 for rom in seabios; do<br>
-=C2=A0 =C2=A0 config_mak=3Droms/$rom/config.mak<br>
-=C2=A0 =C2=A0 echo &quot;# Automatically generated by configure - do not m=
odify&quot; &gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;SRC_PATH=3D$source_path/roms/$rom&quot; &gt;&gt; =
$config_mak<br>
-=C2=A0 =C2=A0 echo &quot;AS=3D$as&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;CCAS=3D$ccas&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;CC=3D$cc&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;BCC=3Dbcc&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;CPP=3D$cpp&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;OBJCOPY=3Dobjcopy&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;IASL=3D$iasl&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;LD=3D$ld&quot; &gt;&gt; $config_mak<br>
-=C2=A0 =C2=A0 echo &quot;RANLIB=3D$ranlib&quot; &gt;&gt; $config_mak<br>
-=C2=A0 done<br>
-fi<br>
-<br>
=C2=A0config_mak=3Dpc-bios/optionrom/config.mak<br>
=C2=A0echo &quot;# Automatically generated by configure - do not modify&quo=
t; &gt; $config_mak<br>
=C2=A0echo &quot;TOPSRC_DIR=3D$source_path&quot; &gt;&gt; $config_mak<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006225cc05dd18265e--

